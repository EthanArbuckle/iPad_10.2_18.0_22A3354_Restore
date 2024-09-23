@implementation NFNdefMessage

- (NFNdefMessage)init
{
  NFNdefMessage *v2;
  NSMutableArray *v3;
  NSMutableArray *records;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NFNdefMessage;
  v2 = -[NFNdefMessage init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    records = v2->_records;
    v2->_records = v3;

  }
  return v2;
}

- (NFNdefMessage)initWithBytes:(const void *)a3 length:(unsigned int)a4
{
  uint64_t v4;
  NFNdefMessage *v6;
  NSMutableArray *v7;
  NSMutableArray *records;
  void *v9;
  objc_super v11;

  v4 = *(_QWORD *)&a4;
  v11.receiver = self;
  v11.super_class = (Class)NFNdefMessage;
  v6 = -[NFNdefMessage init](&v11, sel_init);
  if (v6)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    records = v6->_records;
    v6->_records = v7;

    +[NFNdefRecord recordsFromBytes:length:](NFNdefRecord, "recordsFromBytes:length:", a3, v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      -[NSMutableArray addObjectsFromArray:](v6->_records, "addObjectsFromArray:", v9);

  }
  return v6;
}

- (NFNdefMessage)initWithData:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = objc_retainAutorelease(a3);
  v5 = objc_msgSend(v4, "bytes");
  v6 = objc_msgSend(v4, "length");

  return -[NFNdefMessage initWithBytes:length:](self, "initWithBytes:length:", v5, v6);
}

- (NFNdefMessage)initWithNDEFMessage:(id)a3
{
  id v4;
  NFNdefMessage *v5;
  NSMutableArray *v6;
  NSMutableArray *records;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSMutableArray *v13;
  NFNdefRecord *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)NFNdefMessage;
  v5 = -[NFNdefMessage init](&v20, sel_init);
  if (v5)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    records = v5->_records;
    v5->_records = v6;

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(v4, "records", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          v13 = v5->_records;
          v14 = -[NFNdefRecord initWithNDEFRecord:]([NFNdefRecord alloc], "initWithNDEFRecord:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12));
          -[NSMutableArray addObject:](v13, "addObject:", v14);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      }
      while (v10);
    }

  }
  return v5;
}

- (NSArray)records
{
  return (NSArray *)self->_records;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v7.receiver = self;
  v7.super_class = (Class)NFNdefMessage;
  -[NFNdefMessage description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ { records %@ }"), v4, self->_records);

  return (NSString *)v5;
}

- (id)decode
{
  return (id)objc_msgSend(MEMORY[0x1E0DE78C8], "decodeFromNDEFMessage:", self);
}

- (id)asData
{
  return (id)objc_msgSend(MEMORY[0x1E0DE78C8], "dataFromNDEFMessage:", self);
}

- (void)addRecord:(id)a3
{
  -[NSMutableArray addObject:](self->_records, "addObject:", a3);
}

- (void)addRecordArray:(id)a3
{
  -[NSMutableArray addObjectsFromArray:](self->_records, "addObjectsFromArray:", a3);
}

- (NFNdefMessage)initWithCoder:(id)a3
{
  id v4;
  NFNdefMessage *v5;
  void *v6;
  uint64_t v7;
  NSMutableArray *records;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NFNdefMessage;
  v5 = -[NFNdefMessage init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0DE78C0], "coder:decodeArrayOfClass:forKey:", v4, objc_opt_class(), CFSTR("records"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v6);
    records = v5->_records;
    v5->_records = (NSMutableArray *)v7;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_records, CFSTR("records"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_records, 0);
}

@end

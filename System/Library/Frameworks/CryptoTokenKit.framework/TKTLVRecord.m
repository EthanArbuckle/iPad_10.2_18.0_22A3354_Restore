@implementation TKTLVRecord

+ (NSArray)sequenceOfRecordsFromData:(NSData *)data
{
  NSData *v4;
  void *v5;
  TKDataSource *v6;
  TKDataSource *i;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v4 = data;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TKDataSource initWithData:]([TKDataSource alloc], "initWithData:", v4);
  for (i = v6; ; v6 = i)
  {
    v8 = -[TKDataSource ptr](v6, "ptr");
    if ((const char *)v8 >= -[TKDataSource end](i, "end"))
    {
      v11 = v5;
      goto LABEL_7;
    }
    objc_msgSend(a1, "parseFromDataSource:", i);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!v9)
      break;
    v10 = (void *)v9;
    objc_msgSend(v5, "addObject:", v9);

  }
  v11 = 0;
LABEL_7:

  return (NSArray *)v11;
}

- (TKTLVRecord)initWithTag:(unint64_t)a3 value:(id)a4 data:(id)a5
{
  id v9;
  id v10;
  TKTLVRecord *v11;
  TKTLVRecord *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)TKTLVRecord;
  v11 = -[TKTLVRecord init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_tag = a3;
    objc_storeStrong((id *)&v11->_value, a4);
    objc_storeStrong((id *)&v12->_data, a5);
  }

  return v12;
}

+ (TKTLVRecord)recordFromData:(NSData *)data
{
  NSData *v4;
  TKDataSource *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  TKTLVRecord *v9;

  v4 = data;
  v5 = -[TKDataSource initWithData:]([TKDataSource alloc], "initWithData:", v4);

  objc_msgSend(a1, "parseFromDataSource:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[TKDataSource ptr](v5, "ptr");
  if ((const char *)v7 == -[TKDataSource end](v5, "end"))
    v8 = v6;
  else
    v8 = 0;
  v9 = v8;

  return v9;
}

- (NSData)value
{
  return self->_value;
}

- (TKTLVTag)tag
{
  return self->_tag;
}

- (NSData)data
{
  return self->_data;
}

+ (id)parseFromDataSource:(id)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("%s must not be called"), "+[TKTLVRecord parseFromDataSource:]");
  return 0;
}

- (id)description
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TKTLVRecord value](self, "value");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = objc_msgSend(v4, "bytes");

  -[TKTLVRecord value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    v8 = 0;
    do
    {
      objc_msgSend(v3, "appendFormat:", CFSTR("%02x"), *(unsigned __int8 *)(v5 + v8++));
      -[TKTLVRecord value](self, "value");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "length");

    }
    while (v8 < v10);
  }
  v11 = (void *)MEMORY[0x1E0CB3940];
  v15.receiver = self;
  v15.super_class = (Class)TKTLVRecord;
  -[TKTLVRecord description](&v15, sel_description);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@ 0x%llx=%@"), v12, -[TKTLVRecord tag](self, "tag"), v3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

@end

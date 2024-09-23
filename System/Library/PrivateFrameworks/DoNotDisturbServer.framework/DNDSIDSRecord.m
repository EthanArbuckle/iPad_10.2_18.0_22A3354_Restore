@implementation DNDSIDSRecord

- (DNDSIDSRecord)initWithMetadata:(id)a3
{
  return (DNDSIDSRecord *)-[DNDSIDSRecord _initWithMetadata:data:](self, "_initWithMetadata:data:", a3, 0);
}

- (id)_initWithMetadata:(id)a3 data:(id)a4
{
  id v6;
  id v7;
  DNDSIDSRecord *v8;
  uint64_t v9;
  NSMutableDictionary *data;
  uint64_t v11;
  DNDSIDSRecordMetadata *metadata;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DNDSIDSRecord;
  v8 = -[DNDSIDSRecord init](&v14, sel_init);
  if (v8)
  {
    if (v7)
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v7);
    else
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    data = v8->_data;
    v8->_data = (NSMutableDictionary *)v9;

    v11 = objc_msgSend(v6, "copy");
    metadata = v8->_metadata;
    v8->_metadata = (DNDSIDSRecordMetadata *)v11;

  }
  return v8;
}

- (DNDSIDSRecordID)recordID
{
  return -[DNDSIDSRecordMetadata recordID](self->_metadata, "recordID");
}

- (NSDate)lastModified
{
  return -[DNDSIDSRecordMetadata lastModified](self->_metadata, "lastModified");
}

- (BOOL)isDeleted
{
  return -[DNDSIDSRecordMetadata isDeleted](self->_metadata, "isDeleted");
}

- (DNDSIDSRecordMetadata)metadata
{
  return self->_metadata;
}

- (id)objectForKey:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_data, "objectForKeyedSubscript:", a3);
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_data, "setObject:forKeyedSubscript:", a3, a4);
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[DNDSIDSRecordMetadata hash](self->_metadata, "hash");
  return -[NSMutableDictionary hash](self->_data, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  DNDSIDSRecord *v4;
  DNDSIDSRecord *v5;
  DNDSIDSRecord *v6;
  DNDSIDSRecordMetadata *metadata;
  DNDSIDSRecordMetadata *v8;
  char v9;
  NSMutableDictionary *data;
  NSMutableDictionary *v11;

  v4 = (DNDSIDSRecord *)a3;
  v5 = v4;
  if (v4)
  {
    if (self == v4)
    {
      v9 = 1;
      goto LABEL_17;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      metadata = self->_metadata;
      v8 = v6->_metadata;
      if (metadata == v8)
        goto LABEL_8;
      v9 = 0;
      if (metadata && v8)
      {
        if (-[DNDSIDSRecordMetadata isEqual:](metadata, "isEqual:"))
        {
LABEL_8:
          data = self->_data;
          v11 = v6->_data;
          if (data == v11)
          {
            v9 = 1;
          }
          else
          {
            v9 = 0;
            if (data && v11)
              v9 = -[NSMutableDictionary isEqual:](data, "isEqual:");
          }
          goto LABEL_16;
        }
        v9 = 0;
      }
LABEL_16:

      goto LABEL_17;
    }
  }
  v9 = 0;
LABEL_17:

  return v9;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; metadata: %@; data: %@>"),
                       objc_opt_class(),
                       self,
                       self->_metadata,
                       self->_data);
}

+ (id)newWithDictionaryRepresentation:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "bs_safeDictionaryForKey:", CFSTR("metadata"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[DNDSIDSRecordMetadata newWithDictionaryRepresentation:context:](DNDSIDSRecordMetadata, "newWithDictionaryRepresentation:context:", v8, v6);

  objc_msgSend(v7, "bs_safeDictionaryForKey:", CFSTR("data"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithMetadata:data:", v9, v10);
  return v11;
}

- (id)dictionaryRepresentationWithContext:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("metadata");
  -[DNDSIDSRecordMetadata dictionaryRepresentationWithContext:](self->_metadata, "dictionaryRepresentationWithContext:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("data");
  v8[0] = v4;
  v8[1] = self->_data;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end

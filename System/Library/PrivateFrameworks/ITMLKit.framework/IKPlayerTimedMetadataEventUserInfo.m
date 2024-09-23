@implementation IKPlayerTimedMetadataEventUserInfo

- (IKPlayerTimedMetadataEventUserInfo)initWithKey:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  IKPlayerTimedMetadataEventUserInfo *v8;
  uint64_t v9;
  NSString *key;
  uint64_t v11;
  NSDictionary *value;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IKPlayerTimedMetadataEventUserInfo;
  v8 = -[IKPlayerTimedMetadataEventUserInfo init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    key = v8->_key;
    v8->_key = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    value = v8->_value;
    v8->_value = (NSDictionary *)v11;

  }
  return v8;
}

- (NSDictionary)properties
{
  void *v3;
  NSDictionary *value;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_key, CFSTR("key"));
  if (self->_value)
    value = self->_value;
  else
    value = (NSDictionary *)MEMORY[0x1E0C9AA70];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", value, CFSTR("metadata"));
  v5 = (void *)objc_msgSend(v3, "copy");

  return (NSDictionary *)v5;
}

- (NSString)key
{
  return self->_key;
}

- (NSDictionary)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end

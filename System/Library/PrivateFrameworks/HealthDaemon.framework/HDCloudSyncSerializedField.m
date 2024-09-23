@implementation HDCloudSyncSerializedField

+ (id)fieldForKey:(id)a3 classes:(id)a4 encrypted:(BOOL)a5
{
  id v7;
  id v8;
  HDCloudSyncSerializedField *v9;
  uint64_t v10;
  NSString *key;
  uint64_t v12;
  NSSet *classes;

  v7 = a4;
  v8 = a3;
  v9 = objc_alloc_init(HDCloudSyncSerializedField);
  v10 = objc_msgSend(v8, "copy");

  key = v9->_key;
  v9->_key = (NSString *)v10;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7);
  v12 = objc_claimAutoreleasedReturnValue();

  classes = v9->_classes;
  v9->_classes = (NSSet *)v12;

  v9->_encrypted = a5;
  return v9;
}

- (NSString)key
{
  return self->_key;
}

- (NSSet)classes
{
  return self->_classes;
}

- (BOOL)encrypted
{
  return self->_encrypted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classes, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end

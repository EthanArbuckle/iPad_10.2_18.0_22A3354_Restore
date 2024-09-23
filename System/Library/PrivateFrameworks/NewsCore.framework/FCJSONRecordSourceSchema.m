@implementation FCJSONRecordSourceSchema

- (NSString)recordIDPrefix
{
  return self->_recordIDPrefix;
}

- (NSArray)allKeys
{
  return self->_allKeys;
}

- (NSString)recordType
{
  return self->_recordType;
}

- (NSArray)localizableKeys
{
  return self->_localizableKeys;
}

- (NSArray)keys
{
  return self->_keys;
}

- (FCJSONRecordSourceSchema)initWithRecordType:(id)a3 recordIDPrefix:(id)a4 keys:(id)a5 localizableKeys:(id)a6
{
  return -[FCJSONRecordSourceSchema initWithRecordType:recordIDPrefix:keys:localizableKeys:alwaysLocalizedKeys:](self, "initWithRecordType:recordIDPrefix:keys:localizableKeys:alwaysLocalizedKeys:", a3, a4, a5, a6, MEMORY[0x1E0C9AA60]);
}

- (NSArray)alwaysLocalizedKeys
{
  return self->_alwaysLocalizedKeys;
}

- (FCJSONRecordSourceSchema)initWithRecordType:(id)a3 recordIDPrefix:(id)a4 keys:(id)a5 localizableKeys:(id)a6 alwaysLocalizedKeys:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  FCJSONRecordSourceSchema *v17;
  uint64_t v18;
  NSString *recordType;
  uint64_t v20;
  NSString *recordIDPrefix;
  uint64_t v22;
  NSArray *keys;
  uint64_t v24;
  NSArray *localizableKeys;
  uint64_t v26;
  NSArray *alwaysLocalizedKeys;
  void *v28;
  uint64_t v29;
  NSArray *allKeys;
  objc_super v32;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v32.receiver = self;
  v32.super_class = (Class)FCJSONRecordSourceSchema;
  v17 = -[FCJSONRecordSourceSchema init](&v32, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v12, "copy");
    recordType = v17->_recordType;
    v17->_recordType = (NSString *)v18;

    v20 = objc_msgSend(v13, "copy");
    recordIDPrefix = v17->_recordIDPrefix;
    v17->_recordIDPrefix = (NSString *)v20;

    v22 = objc_msgSend(v14, "copy");
    keys = v17->_keys;
    v17->_keys = (NSArray *)v22;

    v24 = objc_msgSend(v15, "copy");
    localizableKeys = v17->_localizableKeys;
    v17->_localizableKeys = (NSArray *)v24;

    v26 = objc_msgSend(v16, "copy");
    alwaysLocalizedKeys = v17->_alwaysLocalizedKeys;
    v17->_alwaysLocalizedKeys = (NSArray *)v26;

    objc_msgSend(v14, "arrayByAddingObjectsFromArray:", v15);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "arrayByAddingObjectsFromArray:", v16);
    v29 = objc_claimAutoreleasedReturnValue();
    allKeys = v17->_allKeys;
    v17->_allKeys = (NSArray *)v29;

  }
  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allKeys, 0);
  objc_storeStrong((id *)&self->_alwaysLocalizedKeys, 0);
  objc_storeStrong((id *)&self->_localizableKeys, 0);
  objc_storeStrong((id *)&self->_keys, 0);
  objc_storeStrong((id *)&self->_recordIDPrefix, 0);
  objc_storeStrong((id *)&self->_recordType, 0);
}

@end

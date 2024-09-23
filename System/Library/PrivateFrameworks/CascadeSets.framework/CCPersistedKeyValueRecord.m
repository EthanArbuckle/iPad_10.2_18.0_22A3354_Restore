@implementation CCPersistedKeyValueRecord

- (CCPersistedKeyValueRecord)init
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("init unsupported"), MEMORY[0x24BDBD1B8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

+ (id)recordFromDatabaseValueRow:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDatabaseValueRow:", v3);

  return v4;
}

+ (id)genSQLCreateStatements
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("CREATE TABLE IF NOT EXISTS \"%@\" (\"%@\" varchar PRIMARY KEY, \"%@\" varchar NULLABLE, \"%@\" integer NULLABLE, \"%@\" blob NULLABLE, CHECK ((CASE WHEN \"%@\" IS NULL THEN 0 ELSE 1 END + CASE WHEN \"%@\" IS NULL THEN 0 ELSE 1 END + CASE WHEN \"%@\" IS NULL THEN 0 ELSE 1 END) = 1));"),
    CFSTR("keyvalue"),
    CFSTR("key"),
    CFSTR("string_value"),
    CFSTR("integer_value"),
    CFSTR("data_value"),
    CFSTR("string_value"),
    CFSTR("integer_value"),
    CFSTR("data_value"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)tableName
{
  return CFSTR("keyvalue");
}

- (CCPersistedKeyValueRecord)initWithDatabaseValueRow:(id)a3
{
  id v4;
  CCPersistedKeyValueRecord *v5;
  uint64_t v6;
  NSString *key;
  uint64_t v8;
  NSString *stringValue;
  uint64_t v10;
  NSNumber *integerValue;
  uint64_t v12;
  NSData *dataValue;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CCPersistedKeyValueRecord;
  v5 = -[CCPersistedKeyValueRecord init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "stringValueAtColumnIndex:", 0);
    v6 = objc_claimAutoreleasedReturnValue();
    key = v5->_key;
    v5->_key = (NSString *)v6;

    objc_msgSend(v4, "stringValueAtColumnIndex:", 1);
    v8 = objc_claimAutoreleasedReturnValue();
    stringValue = v5->_stringValue;
    v5->_stringValue = (NSString *)v8;

    objc_msgSend(v4, "numberValueAtColumnIndex:", 2);
    v10 = objc_claimAutoreleasedReturnValue();
    integerValue = v5->_integerValue;
    v5->_integerValue = (NSNumber *)v10;

    objc_msgSend(v4, "dataValueAtColumnIndex:", 3);
    v12 = objc_claimAutoreleasedReturnValue();
    dataValue = v5->_dataValue;
    v5->_dataValue = (NSData *)v12;

  }
  return v5;
}

- (NSString)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CCPersistedKeyValueRecord;
  -[CCPersistedKeyValueRecord description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" key: %@, stringValue: %@ integerValue: %@ dataValue: %@"), self->_key, self->_stringValue, self->_integerValue, self->_dataValue);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (BOOL)isEqual:(id)a3
{
  CCPersistedKeyValueRecord *v4;
  CCPersistedKeyValueRecord *v5;
  BOOL v6;

  v4 = (CCPersistedKeyValueRecord *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CCPersistedKeyValueRecord isEqualToMetadataRecord:](self, "isEqualToMetadataRecord:", v5);

  return v6;
}

- (BOOL)isEqualToMetadataRecord:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  void *v7;
  NSString *key;
  NSString *v9;
  uint64_t v10;
  int v11;
  char v12;
  NSString *stringValue;
  NSString *v14;
  uint64_t v15;
  int v16;
  NSNumber *integerValue;
  NSNumber *v18;
  uint64_t v19;
  NSData *dataValue;
  NSData *v21;
  uint64_t v22;
  int v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;

  v6 = a3;
  v7 = v6;
  if (!v6)
  {
    v12 = 0;
    goto LABEL_43;
  }
  key = self->_key;
  v9 = key;
  if (!key)
  {
    objc_msgSend(v6, "key");
    v10 = objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      v34 = 0;
      v11 = 0;
      goto LABEL_10;
    }
    v34 = (void *)v10;
    v9 = self->_key;
  }
  objc_msgSend(v7, "key");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[NSString isEqual:](v9, "isEqual:", v3) & 1) == 0)
  {

    v12 = 0;
    goto LABEL_41;
  }
  v11 = 1;
LABEL_10:
  stringValue = self->_stringValue;
  v14 = stringValue;
  if (!stringValue)
  {
    objc_msgSend(v7, "stringValue");
    v15 = objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      v32 = 0;
      v16 = 0;
      goto LABEL_17;
    }
    v32 = (void *)v15;
    v14 = self->_stringValue;
  }
  objc_msgSend(v7, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[NSString isEqual:](v14, "isEqual:", v4) & 1) == 0)
  {

    v12 = 0;
    goto LABEL_38;
  }
  v16 = 1;
LABEL_17:
  integerValue = self->_integerValue;
  v18 = integerValue;
  if (!integerValue)
  {
    objc_msgSend(v7, "integerValue");
    v19 = objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
      v30 = 0;
      v31 = v11;
      v28 = 0;
LABEL_24:
      dataValue = self->_dataValue;
      v21 = dataValue;
      if (!dataValue)
      {
        objc_msgSend(v7, "dataValue");
        v22 = objc_claimAutoreleasedReturnValue();
        if (!v22)
        {
          v25 = 0;
          v12 = 1;
          goto LABEL_33;
        }
        v27 = (void *)v22;
        v21 = self->_dataValue;
      }
      v29 = v4;
      v23 = v16;
      objc_msgSend(v7, "dataValue");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[NSData isEqual:](v21, "isEqual:", v24);

      v16 = v23;
      if (dataValue)
      {
        if (!v30)
        {
          v11 = v31;
          v4 = v29;
          goto LABEL_35;
        }
        v11 = v31;
        v4 = v29;
        goto LABEL_34;
      }
      v4 = v29;
      v25 = v27;
LABEL_33:

      v11 = v31;
      if ((v30 & 1) == 0)
        goto LABEL_35;
      goto LABEL_34;
    }
    v28 = (void *)v19;
    v18 = self->_integerValue;
  }
  objc_msgSend(v7, "integerValue");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSNumber isEqual:](v18, "isEqual:"))
  {
    v30 = 1;
    v31 = v11;
    goto LABEL_24;
  }
  v12 = 0;
LABEL_34:

LABEL_35:
  if (integerValue)
  {
    if (!v16)
      goto LABEL_38;
    goto LABEL_37;
  }

  if ((v16 & 1) != 0)
LABEL_37:

LABEL_38:
  if (stringValue)
  {
    if (!v11)
      goto LABEL_41;
    goto LABEL_40;
  }

  if ((v11 & 1) != 0)
LABEL_40:

LABEL_41:
  if (!key)

LABEL_43:
  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;

  v3 = -[NSString hash](self->_key, "hash");
  v4 = -[NSString hash](self->_stringValue, "hash") ^ v3;
  v5 = -[NSNumber hash](self->_integerValue, "hash");
  return v4 ^ v5 ^ -[NSData hash](self->_dataValue, "hash");
}

- (NSString)key
{
  return self->_key;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (NSNumber)integerValue
{
  return self->_integerValue;
}

- (NSData)dataValue
{
  return self->_dataValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataValue, 0);
  objc_storeStrong((id *)&self->_integerValue, 0);
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end

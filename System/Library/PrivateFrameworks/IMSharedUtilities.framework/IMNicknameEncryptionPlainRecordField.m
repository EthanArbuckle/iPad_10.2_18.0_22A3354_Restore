@implementation IMNicknameEncryptionPlainRecordField

- (IMNicknameEncryptionPlainRecordField)initWithFieldName:(id)a3 plainData:(id)a4
{
  id v7;
  id v8;
  IMNicknameEncryptionPlainRecordField *v9;
  IMNicknameEncryptionPlainRecordField *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IMNicknameEncryptionPlainRecordField;
  v9 = -[IMNicknameEncryptionPlainRecordField init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_fieldName, a3);
    objc_storeStrong((id *)&v10->_plainData, a4);
  }

  return v10;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[IMNicknameEncryptionPlainRecordField fieldName](self, "fieldName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMNicknameEncryptionPlainRecordField plainData](self, "plainData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p recordKey: %@, plainData: %@>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)fieldName
{
  return self->_fieldName;
}

- (void)setFieldName:(id)a3
{
  objc_storeStrong((id *)&self->_fieldName, a3);
}

- (NSData)plainData
{
  return self->_plainData;
}

- (void)setPlainData:(id)a3
{
  objc_storeStrong((id *)&self->_plainData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plainData, 0);
  objc_storeStrong((id *)&self->_fieldName, 0);
}

@end

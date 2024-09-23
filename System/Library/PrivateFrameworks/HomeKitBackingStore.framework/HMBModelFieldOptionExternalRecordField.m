@implementation HMBModelFieldOptionExternalRecordField

- (HMBModelFieldOptionExternalRecordField)initWithExternalRecordField:(id)a3 encrypted:(BOOL)a4
{
  id v7;
  HMBModelFieldOptionExternalRecordField *v8;
  HMBModelFieldOptionExternalRecordField *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMBModelFieldOptionExternalRecordField;
  v8 = -[HMBModelFieldOptionExternalRecordField init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_fieldName, a3);
    v9->_encrypted = a4;
  }

  return v9;
}

- (void)applyTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[HMBModelFieldOptionExternalRecordField fieldName](self, "fieldName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExternalRecordField:", v4);

  objc_msgSend(v5, "setEncrypted:", -[HMBModelFieldOptionExternalRecordField encrypted](self, "encrypted"));
}

- (NSString)fieldName
{
  return self->_fieldName;
}

- (BOOL)encrypted
{
  return self->_encrypted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fieldName, 0);
}

@end

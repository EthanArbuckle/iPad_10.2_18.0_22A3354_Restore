@implementation HAP2EncodedAttributeDatabaseResponseCached

- (HAP2EncodedAttributeDatabaseResponseCached)initWithAttributeDatabase:(id)a3
{
  id v5;
  HAP2EncodedAttributeDatabaseResponseCached *v6;
  HAP2EncodedAttributeDatabaseResponseCached *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HAP2EncodedAttributeDatabaseResponseCached;
  v6 = -[HAP2EncodedAttributeDatabaseResponseCached init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_attributeDatabase, a3);

  return v7;
}

- (BOOL)isEncrypted
{
  return 1;
}

- (NSDictionary)attributeDatabase
{
  return self->_attributeDatabase;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributeDatabase, 0);
}

@end

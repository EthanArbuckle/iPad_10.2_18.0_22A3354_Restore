@implementation HAP2EncodedAttributeDatabaseResponseThread

- (HAP2EncodedAttributeDatabaseResponseThread)initWithBTLEResponse:(id)a3 attributeDatabase:(id)a4
{
  id v7;
  HAP2EncodedAttributeDatabaseResponseThread *v8;
  HAP2EncodedAttributeDatabaseResponseThread *v9;
  HAP2EncodedAttributeDatabaseResponseThread *v10;
  objc_super v12;

  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HAP2EncodedAttributeDatabaseResponseThread;
  v8 = -[HAP2EncodedResponseThread initWithBTLEResponse:](&v12, sel_initWithBTLEResponse_, a3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_attributeDatabase, a4);
    v10 = v9;
  }

  return v9;
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

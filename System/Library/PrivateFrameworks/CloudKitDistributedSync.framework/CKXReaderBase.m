@implementation CKXReaderBase

- (CKXReaderBase)initWithSchema:(id)a3
{
  id v5;
  CKXReaderBase *v6;
  CKXReaderBase *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKXReaderBase;
  v6 = -[CKXReaderBase init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_schema, a3);

  return v7;
}

- (CKXSchema)schema
{
  return self->_schema;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schema, 0);
}

@end

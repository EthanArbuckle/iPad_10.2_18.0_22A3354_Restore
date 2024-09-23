@implementation CCDatabaseValueRowEnumerator

- (CCDatabaseValueRowEnumerator)initWithEnumerationResult:(id)a3
{
  id v5;
  CCDatabaseValueRowEnumerator *v6;
  CCDatabaseValueRowEnumerator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CCDatabaseValueRowEnumerator;
  v6 = -[CCDatabaseValueRowEnumerator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_enumerationResult, a3);

  return v7;
}

- (id)next
{
  void *v2;
  CCDatabaseValueRow *v3;

  -[CCDatabaseEnumerationResult next](self->_enumerationResult, "next");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = -[CCDatabaseValueRow initWithDatabaseValueArray:]([CCDatabaseValueRow alloc], "initWithDatabaseValueArray:", v2);
  else
    v3 = 0;

  return v3;
}

- (id)peek
{
  void *v2;
  CCDatabaseValueRow *v3;

  -[CCDatabaseEnumerationResult peek](self->_enumerationResult, "peek");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = -[CCDatabaseValueRow initWithDatabaseValueArray:]([CCDatabaseValueRow alloc], "initWithDatabaseValueArray:", v2);
  else
    v3 = 0;

  return v3;
}

- (id)error
{
  return -[CCDatabaseEnumerationResult error](self->_enumerationResult, "error");
}

- (CCDatabaseEnumerationResult)enumerationResult
{
  return self->_enumerationResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enumerationResult, 0);
}

@end

@implementation FCContentUnarchiveResult

- (FCContentUnarchiveResult)initWithInterestToken:(id)a3 storageSize:(int64_t)a4
{
  id v7;
  FCContentUnarchiveResult *v8;
  FCContentUnarchiveResult *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FCContentUnarchiveResult;
  v8 = -[FCContentUnarchiveResult init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong(&v8->_interestToken, a3);
    v9->_storageSize = a4;
  }

  return v9;
}

- (id)interestToken
{
  return self->_interestToken;
}

- (int64_t)storageSize
{
  return self->_storageSize;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_interestToken, 0);
}

@end

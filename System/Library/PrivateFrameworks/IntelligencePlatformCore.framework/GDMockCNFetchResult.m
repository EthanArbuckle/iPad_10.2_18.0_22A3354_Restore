@implementation GDMockCNFetchResult

- (GDMockCNFetchResult)initWithValue:(id)a3 currentHistoryToken:(id)a4
{
  id v7;
  id v8;
  GDMockCNFetchResult *v9;
  GDMockCNFetchResult *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GDMockCNFetchResult;
  v9 = -[GDMockCNFetchResult init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_value, a3);
    objc_storeStrong((id *)&v10->_currentHistoryToken, a4);
  }

  return v10;
}

- (id)value
{
  return self->_value;
}

- (NSData)currentHistoryToken
{
  return self->_currentHistoryToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentHistoryToken, 0);
  objc_storeStrong(&self->_value, 0);
}

@end

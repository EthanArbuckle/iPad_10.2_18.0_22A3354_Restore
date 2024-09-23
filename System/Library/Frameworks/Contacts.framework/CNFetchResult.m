@implementation CNFetchResult

- (id)value
{
  return self->_value;
}

- (CNFetchResult)initWithValue:(id)a3 currentHistoryToken:(id)a4
{
  id v7;
  id v8;
  CNFetchResult *v9;
  CNFetchResult *v10;
  uint64_t v11;
  NSData *currentHistoryToken;
  CNFetchResult *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CNFetchResult;
  v9 = -[CNFetchResult init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_value, a3);
    v11 = objc_msgSend(v8, "copy");
    currentHistoryToken = v10->_currentHistoryToken;
    v10->_currentHistoryToken = (NSData *)v11;

    v13 = v10;
  }

  return v10;
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

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFetchResult value](self, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("value"), v4);

  -[CNFetchResult currentHistoryToken](self, "currentHistoryToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("currentHistoryToken"), v6);

  objc_msgSend(v3, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end

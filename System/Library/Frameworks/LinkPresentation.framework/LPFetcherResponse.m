@implementation LPFetcherResponse

- (LPFetcherResponse)initWithState:(int64_t)a3 fetcher:(id)a4
{
  id v6;
  LPFetcherResponse *v7;
  LPFetcherResponse *v8;
  uint64_t v9;
  id userData;
  LPFetcherResponse *v11;
  objc_super v13;

  v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)LPFetcherResponse;
  v7 = -[LPFetcherResponse init](&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_state = a3;
    objc_msgSend(v6, "userData");
    v9 = objc_claimAutoreleasedReturnValue();
    userData = v8->_userData;
    v8->_userData = (id)v9;

    v11 = v8;
  }

  return v8;
}

- (int64_t)state
{
  return self->_state;
}

- (id)userData
{
  return self->_userData;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_userData, 0);
}

@end

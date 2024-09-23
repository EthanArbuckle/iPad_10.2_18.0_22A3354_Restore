@implementation LPFetcherErrorResponse

- (LPFetcherErrorResponse)initWithError:(id)a3 fetcher:(id)a4
{
  id v7;
  LPFetcherErrorResponse *v8;
  LPFetcherErrorResponse *v9;
  LPFetcherErrorResponse *v10;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)LPFetcherErrorResponse;
  v8 = -[LPFetcherResponse initWithState:fetcher:](&v12, sel_initWithState_fetcher_, 1, a4);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_error, a3);
    v10 = v9;
  }

  return v9;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
}

@end

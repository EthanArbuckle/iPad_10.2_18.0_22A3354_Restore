@implementation LPFetcherJSONResponse

+ (BOOL)isValidMIMEType:(id)a3
{
  return +[LPMIMETypeRegistry isJSONType:](LPMIMETypeRegistry, "isJSONType:", a3);
}

+ (id)responseForFetcher:(id)a3 withData:(id)a4 MIMEType:(id)a5
{
  id v6;
  void *v7;
  id v8;
  LPFetcherErrorResponse *v9;
  LPFetcherErrorResponse *v10;
  id v12;

  v6 = a3;
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a4, 0, &v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v12;
  if (v8)
  {
    v9 = -[LPFetcherErrorResponse initWithError:fetcher:]([LPFetcherErrorResponse alloc], "initWithError:fetcher:", v8, v6);
  }
  else
  {
    if (!v7)
    {
      v10 = 0;
      goto LABEL_6;
    }
    v9 = -[LPFetcherJSONResponse initWithRootObject:fetcher:]([LPFetcherJSONResponse alloc], "initWithRootObject:fetcher:", v7, v6);
  }
  v10 = v9;
LABEL_6:

  return v10;
}

- (LPFetcherJSONResponse)initWithRootObject:(id)a3 fetcher:(id)a4
{
  id v7;
  LPFetcherJSONResponse *v8;
  LPFetcherJSONResponse *v9;
  LPFetcherJSONResponse *v10;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)LPFetcherJSONResponse;
  v8 = -[LPFetcherResponse initWithState:fetcher:](&v12, sel_initWithState_fetcher_, 2, a4);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong(&v8->_rootObject, a3);
    v10 = v9;
  }

  return v9;
}

- (id)rootObject
{
  return self->_rootObject;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_rootObject, 0);
}

@end

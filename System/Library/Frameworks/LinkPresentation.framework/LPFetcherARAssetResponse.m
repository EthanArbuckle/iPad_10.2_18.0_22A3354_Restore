@implementation LPFetcherARAssetResponse

+ (BOOL)isValidMIMEType:(id)a3
{
  return +[LPMIMETypeRegistry isARAssetType:](LPMIMETypeRegistry, "isARAssetType:", a3);
}

+ (id)arAssetPropertiesForFetcher:(id)a3
{
  return objc_alloc_init(LPARAssetProperties);
}

+ (id)responseForFetcher:(id)a3 withData:(id)a4 MIMEType:(id)a5
{
  id v8;
  id v9;
  id v10;
  LPARAsset *v11;
  void *v12;
  LPARAsset *v13;
  LPFetcherARAssetResponse *v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "length"))
  {
    v11 = [LPARAsset alloc];
    objc_msgSend(a1, "arAssetPropertiesForFetcher:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[LPARAsset initWithData:MIMEType:properties:](v11, "initWithData:MIMEType:properties:", v9, v10, v12);

    if (v13)
      v14 = -[LPFetcherARAssetResponse initWithARAsset:fetcher:]([LPFetcherARAssetResponse alloc], "initWithARAsset:fetcher:", v13, v8);
    else
      v14 = 0;

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (LPFetcherARAssetResponse)initWithARAsset:(id)a3 fetcher:(id)a4
{
  id v7;
  LPFetcherARAssetResponse *v8;
  LPFetcherARAssetResponse *v9;
  LPFetcherARAssetResponse *v10;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)LPFetcherARAssetResponse;
  v8 = -[LPFetcherResponse initWithState:fetcher:](&v12, sel_initWithState_fetcher_, 2, a4);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_arAsset, a3);
    v10 = v9;
  }

  return v9;
}

- (LPARAsset)arAsset
{
  return self->_arAsset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arAsset, 0);
}

@end

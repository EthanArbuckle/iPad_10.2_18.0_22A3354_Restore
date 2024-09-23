@implementation LPFetcherClipMetadataResponse

- (LPFetcherClipMetadataResponse)initWithClipMetadata:(id)a3 iconURL:(id)a4 fetcher:(id)a5
{
  id v9;
  id v10;
  LPFetcherClipMetadataResponse *v11;
  LPFetcherClipMetadataResponse *v12;
  LPFetcherClipMetadataResponse *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)LPFetcherClipMetadataResponse;
  v11 = -[LPFetcherResponse initWithState:fetcher:](&v15, sel_initWithState_fetcher_, 2, a5);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_metadata, a3);
    objc_storeStrong((id *)&v12->_iconURL, a4);
    v13 = v12;
  }

  return v12;
}

- (CPSClipMetadata)metadata
{
  return self->_metadata;
}

- (NSURL)iconURL
{
  return self->_iconURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconURL, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
}

@end

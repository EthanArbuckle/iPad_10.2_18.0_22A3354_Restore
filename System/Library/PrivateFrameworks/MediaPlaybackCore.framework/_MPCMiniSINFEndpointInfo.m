@implementation _MPCMiniSINFEndpointInfo

- (_MPCMiniSINFEndpointInfo)initWithEndpointURL:(id)a3 maximumBatchSize:(int64_t)a4 requestContext:(id)a5
{
  id v8;
  id v9;
  _MPCMiniSINFEndpointInfo *v10;
  uint64_t v11;
  NSURL *endpointURL;
  objc_super v14;

  v8 = a3;
  v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)_MPCMiniSINFEndpointInfo;
  v10 = -[_MPCMiniSINFEndpointInfo init](&v14, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    endpointURL = v10->_endpointURL;
    v10->_endpointURL = (NSURL *)v11;

    v10->_maximumBatchSize = a4;
    objc_storeStrong((id *)&v10->_requestContext, a5);
  }

  return v10;
}

- (NSURL)endpointURL
{
  return self->_endpointURL;
}

- (int64_t)maximumBatchSize
{
  return self->_maximumBatchSize;
}

- (ICStoreRequestContext)requestContext
{
  return self->_requestContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestContext, 0);
  objc_storeStrong((id *)&self->_endpointURL, 0);
}

@end

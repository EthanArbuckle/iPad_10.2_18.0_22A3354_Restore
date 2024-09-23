@implementation MPModelShimResponse

+ (id)builderProtocol
{
  return &unk_1EE371B00;
}

- (MPModelResponse)modelResponse
{
  return self->_modelResponse;
}

- (MPModelShimResponse)initWithRequest:(id)a3 middleware:(id)a4
{
  id v6;
  MPModelShimResponse *v7;
  void *v8;
  uint64_t v9;
  MPModelResponse *modelResponse;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MPModelShimResponse;
  v7 = -[MPResponse initWithRequest:middleware:](&v12, sel_initWithRequest_middleware_, a3, v6);
  if (v7)
  {
    objc_msgSend(v6, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "modelResponse");
    v9 = objc_claimAutoreleasedReturnValue();
    modelResponse = v7->_modelResponse;
    v7->_modelResponse = (MPModelResponse *)v9;

  }
  return v7;
}

- (void)setModelResponse:(id)a3
{
  objc_storeStrong((id *)&self->_modelResponse, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelResponse, 0);
}

@end

@implementation FBKBoxedRequest

- (FBKBoxedRequest)initWithRequest:(id)a3 successBlock:(id)a4 errorBlock:(id)a5
{
  id v9;
  id v10;
  id v11;
  FBKBoxedRequest *v12;
  FBKBoxedRequest *v13;
  void *v14;
  id successBlock;
  void *v16;
  id errorBlock;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)FBKBoxedRequest;
  v12 = -[FBKBoxedRequest init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_request, a3);
    v14 = _Block_copy(v10);
    successBlock = v13->_successBlock;
    v13->_successBlock = v14;

    v16 = _Block_copy(v11);
    errorBlock = v13->_errorBlock;
    v13->_errorBlock = v16;

  }
  return v13;
}

- (NSURLRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (id)successBlock
{
  return self->_successBlock;
}

- (void)setSuccessBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)errorBlock
{
  return self->_errorBlock;
}

- (void)setErrorBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_errorBlock, 0);
  objc_storeStrong(&self->_successBlock, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end

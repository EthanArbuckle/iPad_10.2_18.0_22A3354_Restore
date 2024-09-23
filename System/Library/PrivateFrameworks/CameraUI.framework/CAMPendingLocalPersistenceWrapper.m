@implementation CAMPendingLocalPersistenceWrapper

- (CAMPendingLocalPersistenceWrapper)initWithRequest:(id)a3 result:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  CAMPendingLocalPersistenceWrapper *v12;
  CAMPendingLocalPersistenceWrapper *v13;
  uint64_t v14;
  id completionHandler;
  CAMPendingLocalPersistenceWrapper *v16;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)CAMPendingLocalPersistenceWrapper;
  v12 = -[CAMPendingLocalPersistenceWrapper init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_request, a3);
    objc_storeStrong(&v13->_result, a4);
    v14 = objc_msgSend(v11, "copy");
    completionHandler = v13->_completionHandler;
    v13->_completionHandler = (id)v14;

    v16 = v13;
  }

  return v13;
}

- (CAMCaptureRequest)request
{
  return self->_request;
}

- (id)result
{
  return self->_result;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_result, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end

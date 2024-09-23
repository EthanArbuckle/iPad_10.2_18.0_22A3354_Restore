@implementation SORequestQueueItem

- (SORequestQueueItem)initWithService:(id)a3 requestParameters:(id)a4 completionBlock:(id)a5
{
  id v9;
  id v10;
  id v11;
  SORequestQueueItem *v12;
  SORequestQueueItem *v13;
  uint64_t v14;
  id completionBlock;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SORequestQueueItem;
  v12 = -[SORequestQueueItem init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_service, a3);
    objc_storeStrong((id *)&v13->_requestParameters, a4);
    v14 = MEMORY[0x212BAEC18](v11);
    completionBlock = v13->_completionBlock;
    v13->_completionBlock = (id)v14;

    v13->_isRunning = 0;
  }

  return v13;
}

- (NSString)description
{
  return (NSString *)-[SOAuthorizationRequestParameters description](self->_requestParameters, "description");
}

- (SOServiceProtocol)service
{
  return self->_service;
}

- (SOAuthorizationRequestParameters)requestParameters
{
  return self->_requestParameters;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (BOOL)isRunning
{
  return self->_isRunning;
}

- (void)setIsRunning:(BOOL)a3
{
  self->_isRunning = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_requestParameters, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

@end

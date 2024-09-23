@implementation LACUIScenePresentationRequest

- (LACUIScenePresentationRequest)initWithUserInterfaceRequest:(id)a3
{
  id v5;
  LACUIScenePresentationRequest *v6;
  LACUIScenePresentationRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LACUIScenePresentationRequest;
  v6 = -[LACUIScenePresentationRequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_userInterfaceRequest, a3);

  return v7;
}

- (LACUserInterfaceRequest)userInterfaceRequest
{
  return self->_userInterfaceRequest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInterfaceRequest, 0);
}

@end

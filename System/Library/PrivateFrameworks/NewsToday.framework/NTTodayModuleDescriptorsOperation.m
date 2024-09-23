@implementation NTTodayModuleDescriptorsOperation

- (void)setContentContext:(id)a3
{
  objc_storeStrong((id *)&self->_contentContext, a3);
}

- (id)descriptorsCompletion
{
  return self->_descriptorsCompletion;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_descriptorsCompletion, 0);
  objc_storeStrong((id *)&self->_privateDataStorage, 0);
  objc_storeStrong((id *)&self->_contentContext, 0);
  objc_storeStrong((id *)&self->_contentRequest, 0);
}

- (FCContentContext)contentContext
{
  return self->_contentContext;
}

- (NTTodayModuleDescriptorsOperation)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTTodayModuleDescriptorsOperation;
  return -[FCOperation init](&v3, sel_init);
}

- (NTTodayModuleContentRequest)contentRequest
{
  return self->_contentRequest;
}

- (void)setContentRequest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 376);
}

- (BOOL)requireRefreshedAppConfig
{
  return self->_requireRefreshedAppConfig;
}

- (void)setRequireRefreshedAppConfig:(BOOL)a3
{
  self->_requireRefreshedAppConfig = a3;
}

- (FCReadablePrivateDataStorage)privateDataStorage
{
  return self->_privateDataStorage;
}

- (void)setPrivateDataStorage:(id)a3
{
  objc_storeStrong((id *)&self->_privateDataStorage, a3);
}

- (void)setDescriptorsCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 400);
}

@end

@implementation AXSimpleRuntimeManager

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global);
  return (id)sharedManager_SharedManager;
}

void __39__AXSimpleRuntimeManager_sharedManager__block_invoke()
{
  AXSimpleRuntimeManager *v0;
  void *v1;

  v0 = objc_alloc_init(AXSimpleRuntimeManager);
  v1 = (void *)sharedManager_SharedManager;
  sharedManager_SharedManager = (uint64_t)v0;

}

- (void)start
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_1B54A6000, a2, OS_LOG_TYPE_ERROR, "Could not register system wide server: %ld", (uint8_t *)&v2, 0xCu);
}

- (BOOL)systemWideServer
{
  return self->_systemWideServer;
}

- (void)setSystemWideServer:(BOOL)a3
{
  self->_systemWideServer = a3;
}

- (BOOL)started
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (id)parameterizedAttributeCallback
{
  return self->_parameterizedAttributeCallback;
}

- (void)setParameterizedAttributeCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)attributeCallback
{
  return self->_attributeCallback;
}

- (void)setAttributeCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)setAttributeCallback
{
  return self->_setAttributeCallback;
}

- (void)setSetAttributeCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)performActionCallback
{
  return self->_performActionCallback;
}

- (void)setPerformActionCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)clientObserverCallback
{
  return self->_clientObserverCallback;
}

- (void)setClientObserverCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)hitTestCallback
{
  return self->_hitTestCallback;
}

- (void)setHitTestCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)applicationElementCallback
{
  return self->_applicationElementCallback;
}

- (void)setApplicationElementCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)outgoingValuePreprocessor
{
  return self->_outgoingValuePreprocessor;
}

- (void)setOutgoingValuePreprocessor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_outgoingValuePreprocessor, 0);
  objc_storeStrong(&self->_applicationElementCallback, 0);
  objc_storeStrong(&self->_hitTestCallback, 0);
  objc_storeStrong(&self->_clientObserverCallback, 0);
  objc_storeStrong(&self->_performActionCallback, 0);
  objc_storeStrong(&self->_setAttributeCallback, 0);
  objc_storeStrong(&self->_attributeCallback, 0);
  objc_storeStrong(&self->_parameterizedAttributeCallback, 0);
}

@end

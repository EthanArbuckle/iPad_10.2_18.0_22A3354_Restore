@implementation CCSControlCenterService

- (void)setVisibility:(BOOL)a3 forModuleWithIdentifier:(id)a4 completionHandler:(id)a5
{
  -[CCSRemoteServiceConnection setVisibility:forModuleWithIdentifier:completionHandler:](self->_connection, "setVisibility:forModuleWithIdentifier:completionHandler:", a3, a4, a5);
}

- (id)_init
{
  CCSControlCenterService *v2;
  CCSRemoteServiceConnection *v3;
  CCSRemoteServiceConnection *connection;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CCSControlCenterService;
  v2 = -[CCSControlCenterService init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(CCSRemoteServiceConnection);
    connection = v2->_connection;
    v2->_connection = v3;

  }
  return v2;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__CCSControlCenterService_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, block);
  return (id)sharedInstance_sharedInstance_0;
}

void __41__CCSControlCenterService_sharedInstance__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_init");
  v2 = (void *)sharedInstance_sharedInstance_0;
  sharedInstance_sharedInstance_0 = v1;

}

- (void)getEnabledStateOfModuleWithIdentifier:(id)a3 completionHandler:(id)a4
{
  -[CCSRemoteServiceConnection getEnabledStateOfModuleWithIdentifier:completionHandler:](self->_connection, "getEnabledStateOfModuleWithIdentifier:completionHandler:", a3, a4);
}

- (void)requestAvailableModuleIdentifiersWithCompletionHandler:(id)a3
{
  -[CCSRemoteServiceConnection requestAvailableModuleIdentifiersWithCompletionHandler:](self->_connection, "requestAvailableModuleIdentifiersWithCompletionHandler:", a3);
}

- (void)requestEnableModuleWithIdentifier:(id)a3 completionHandler:(id)a4
{
  -[CCSControlCenterService requestEnableModuleWithIdentifier:force:completionHandler:](self, "requestEnableModuleWithIdentifier:force:completionHandler:", a3, 0, a4);
}

- (void)requestEnableModuleWithIdentifier:(id)a3 force:(BOOL)a4 completionHandler:(id)a5
{
  -[CCSRemoteServiceConnection requestEnableModuleWithIdentifier:force:completionHandler:](self->_connection, "requestEnableModuleWithIdentifier:force:completionHandler:", a3, a4, a5);
}

- (void)requestDisableModuleWithIdentifier:(id)a3 completionHandler:(id)a4
{
  -[CCSRemoteServiceConnection requestDisableModuleWithIdentifier:completionHandler:](self->_connection, "requestDisableModuleWithIdentifier:completionHandler:", a3, a4);
}

- (void)presentModuleWithIdentifier:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  -[CCSRemoteServiceConnection presentModuleWithIdentifier:options:completionHandler:](self->_connection, "presentModuleWithIdentifier:options:completionHandler:", a3, a4, a5);
}

- (void)handleIconElementRequest:(id)a3 completionHandler:(id)a4
{
  -[CCSRemoteServiceConnection handleIconElementRequest:completionHandler:](self->_connection, "handleIconElementRequest:completionHandler:", a3, a4);
}

- (void)handleControlCenterOperationType:(int64_t)a3 completionHandler:(id)a4
{
  -[CCSRemoteServiceConnection handleControlCenterOperationType:completionHandler:](self->_connection, "handleControlCenterOperationType:completionHandler:", a3, a4);
}

- (void)requestIconElementState:(id)a3 completionHandler:(id)a4
{
  -[CCSRemoteServiceConnection requestIconElementState:completionHandler:](self->_connection, "requestIconElementState:completionHandler:", a3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end

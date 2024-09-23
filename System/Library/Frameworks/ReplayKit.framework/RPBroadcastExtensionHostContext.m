@implementation RPBroadcastExtensionHostContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254D88420);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_updateBroadcastHandlerListenerEndpoint_, 0, 1);

  return v2;
}

+ (id)_extensionAuxiliaryHostProtocol
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254D88398);
}

- (id)extensionObjectProxy
{
  void *v2;
  void *v3;

  -[RPBroadcastExtensionHostContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __55__RPBroadcastExtensionHostContext_extensionObjectProxy__block_invoke(uint64_t a1, void *a2)
{
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __63__RPBroadcastActivityExtensionHostContext_extensionObjectProxy__block_invoke_cold_1(a2);
}

- (void)completeSetupWithBroadcastURL:(id)a3
{
  RPBroadcastHostViewController **p_hostViewController;
  id v4;
  id WeakRetained;

  p_hostViewController = &self->_hostViewController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_hostViewController);
  objc_msgSend(WeakRetained, "completeSetupWithBroadcastURL:", v4);

}

- (void)updateBroadcastHandlerListenerEndpoint:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[RPBroadcastExtensionHostContext extensionObjectProxy](self, "extensionObjectProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateBroadcastHandlerListenerEndpoint:", v4);

}

- (RPBroadcastHostViewController)hostViewController
{
  return (RPBroadcastHostViewController *)objc_loadWeakRetained((id *)&self->_hostViewController);
}

- (void)setHostViewController:(id)a3
{
  objc_storeWeak((id *)&self->_hostViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_hostViewController);
}

@end

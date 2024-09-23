@implementation RPBroadcastActivityExtensionHostContext

- (void)extensionDidFinishWithLaunchURL:(id)a3 broadcastURL:(id)a4 extensionBundleID:(id)a5 cancelled:(BOOL)a6
{
  _BOOL8 v6;
  RPBroadcastActivityHostViewController **p_hostViewController;
  id v10;
  id v11;
  id v12;
  id WeakRetained;

  v6 = a6;
  p_hostViewController = &self->_hostViewController;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_hostViewController);
  objc_msgSend(WeakRetained, "extensionDidFinishWithLaunchURL:broadcastURL:extensionBundleID:cancelled:", v12, v11, v10, v6);

}

- (void)presentationInfoWithCompletion:(id)a3
{
  RPBroadcastActivityHostViewController **p_hostViewController;
  id v4;
  id WeakRetained;

  p_hostViewController = &self->_hostViewController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_hostViewController);
  objc_msgSend(WeakRetained, "presentationInfoWithCompletion:", v4);

}

+ (id)_extensionAuxiliaryVendorProtocol
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254D8D978);
}

+ (id)_extensionAuxiliaryHostProtocol
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254D79AE8);
}

- (id)extensionObjectProxy
{
  void *v2;
  void *v3;

  -[RPBroadcastActivityExtensionHostContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __63__RPBroadcastActivityExtensionHostContext_extensionObjectProxy__block_invoke(uint64_t a1, void *a2)
{
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __63__RPBroadcastActivityExtensionHostContext_extensionObjectProxy__block_invoke_cold_1(a2);
}

- (RPBroadcastActivityHostViewController)hostViewController
{
  return (RPBroadcastActivityHostViewController *)objc_loadWeakRetained((id *)&self->_hostViewController);
}

- (void)setHostViewController:(id)a3
{
  objc_storeWeak((id *)&self->_hostViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_hostViewController);
}

void __63__RPBroadcastActivityExtensionHostContext_extensionObjectProxy__block_invoke_cold_1(void *a1)
{
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 67109120;
  v1[1] = objc_msgSend(a1, "code");
  _os_log_error_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "error calling extension - %i", (uint8_t *)v1, 8u);
}

@end

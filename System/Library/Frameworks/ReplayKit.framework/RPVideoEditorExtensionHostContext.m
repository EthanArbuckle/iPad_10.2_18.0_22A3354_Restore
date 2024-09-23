@implementation RPVideoEditorExtensionHostContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254D8D9D8);
}

+ (id)_extensionAuxiliaryHostProtocol
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254D81CE8);
}

- (void)extensionDidFinishWithActivityTypes:(id)a3
{
  id v4;
  void *v5;
  uint8_t v6[16];

  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "RPVideoEditorExtensionHostContext:extensionsDidFinish", v6, 2u);
  }
  -[RPVideoEditorExtensionHostContext hostViewController](self, "hostViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extensionDidFinishWithActivityTypes:", v4);

}

- (id)extensionObjectProxy
{
  void *v2;
  void *v3;

  -[RPVideoEditorExtensionHostContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __57__RPVideoEditorExtensionHostContext_extensionObjectProxy__block_invoke(uint64_t a1, void *a2)
{
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __63__RPBroadcastActivityExtensionHostContext_extensionObjectProxy__block_invoke_cold_1(a2);
}

- (RPVideoEditorHostViewController)hostViewController
{
  return (RPVideoEditorHostViewController *)objc_loadWeakRetained((id *)&self->_hostViewController);
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

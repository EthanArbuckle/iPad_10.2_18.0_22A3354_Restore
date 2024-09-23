@implementation PUEditingExtensionHostContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_onceToken_1379 != -1)
    dispatch_once(&_extensionAuxiliaryVendorProtocol_onceToken_1379, &__block_literal_global_1380);
  return (id)_extensionAuxiliaryVendorProtocol___interface_1381;
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_onceToken_1375 != -1)
    dispatch_once(&_extensionAuxiliaryHostProtocol_onceToken_1375, &__block_literal_global_16_1376);
  return (id)_extensionAuxiliaryHostProtocol___interface_1377;
}

void __64__PUEditingExtensionHostContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549CE7B0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryHostProtocol___interface_1377;
  _extensionAuxiliaryHostProtocol___interface_1377 = v0;

}

void __66__PUEditingExtensionHostContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549CC938);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryVendorProtocol___interface_1381;
  _extensionAuxiliaryVendorProtocol___interface_1381 = v0;

}

- (void)commitContentEditingOutput:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  void (**v8)(id, id, id);

  v6 = a4;
  v7 = a3;
  -[PUEditingExtensionHostContext contentEditingOutputCommitHandler](self, "contentEditingOutputCommitHandler");
  v8 = (void (**)(id, id, id))objc_claimAutoreleasedReturnValue();
  v8[2](v8, v7, v6);

}

- (void)setHideNavigationController:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void (**v6)(id, _BOOL8);

  v3 = a3;
  -[PUEditingExtensionHostContext hideNavigationControllerHandler](self, "hideNavigationControllerHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PUEditingExtensionHostContext hideNavigationControllerHandler](self, "hideNavigationControllerHandler");
    v6 = (void (**)(id, _BOOL8))objc_claimAutoreleasedReturnValue();
    v6[2](v6, v3);

  }
}

- (id)contentEditingOutputCommitHandler
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setContentEditingOutputCommitHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (id)hideNavigationControllerHandler
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setHideNavigationControllerHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_hideNavigationControllerHandler, 0);
  objc_storeStrong(&self->_contentEditingOutputCommitHandler, 0);
}

@end

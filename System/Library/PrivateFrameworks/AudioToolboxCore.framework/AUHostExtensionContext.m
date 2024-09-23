@implementation AUHostExtensionContext

- (AUHostExtensionContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5
{
  id v8;
  id v9;
  id v10;
  AUHostExtensionContext *v11;
  uint64_t v12;
  AUHostDelegate *delegate;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AUHostExtensionContext;
  v11 = -[AUHostExtensionContext initWithInputItems:listenerEndpoint:contextUUID:](&v15, sel_initWithInputItems_listenerEndpoint_contextUUID_, v8, v9, v10);
  if (v11)
  {
    v12 = objc_opt_new();
    delegate = v11->_delegate;
    v11->_delegate = (AUHostDelegate *)v12;

  }
  return v11;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)AUHostExtensionContext;
  -[AUHostExtensionContext dealloc](&v2, sel_dealloc);
}

- (id)_derivedExtensionAuxiliaryHostProtocol
{
  void *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AUHostExtensionContext;
  -[AUHostExtensionContext _derivedExtensionAuxiliaryHostProtocol](&v4, sel__derivedExtensionAuxiliaryHostProtocol);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  SetAllowedClassesForAUAudioUnitHostXPCInterface(v2);
  return v2;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  AUHostDelegate *delegate;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    delegate = self->_delegate;
  else
    delegate = 0;
  return delegate;
}

- (BOOL)conformsToProtocol:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  v4 = objc_msgSend((id)objc_opt_class(), "conformsToProtocol:", v3);

  return v4;
}

- (NSExtension)extension
{
  return self->_extension;
}

- (void)setExtension:(id)a3
{
  objc_storeStrong((id *)&self->_extension, a3);
}

- (AUHostDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_extension, 0);
}

+ (id)_allowedItemPayloadClasses
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v6, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3, v6, v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (+[AUHostExtensionContext _extensionAuxiliaryHostProtocol]::once[0] != -1)
    dispatch_once(+[AUHostExtensionContext _extensionAuxiliaryHostProtocol]::once, &__block_literal_global_4453);
  return (id)+[AUHostExtensionContext _extensionAuxiliaryHostProtocol]::sHostProtocol;
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (+[AUHostExtensionContext _extensionAuxiliaryVendorProtocol]::once[0] != -1)
    dispatch_once(+[AUHostExtensionContext _extensionAuxiliaryVendorProtocol]::once, &__block_literal_global_149);
  return (id)+[AUHostExtensionContext _extensionAuxiliaryVendorProtocol]::sVendorProtocol;
}

+ (BOOL)conformsToProtocol:(id)a3
{
  return +[AUHostDelegate conformsToProtocol:](AUHostDelegate, "conformsToProtocol:", a3);
}

void __59__AUHostExtensionContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  id v0;

  CreateAUAudioUnitXPCInterface();
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&+[AUHostExtensionContext _extensionAuxiliaryVendorProtocol]::sVendorProtocol, v0);

}

void __57__AUHostExtensionContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  void *v0;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE16CDE0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&+[AUHostExtensionContext _extensionAuxiliaryHostProtocol]::sHostProtocol, v0);

  SetAllowedClassesForAUAudioUnitHostXPCInterface((void *)+[AUHostExtensionContext _extensionAuxiliaryHostProtocol]::sHostProtocol);
}

@end

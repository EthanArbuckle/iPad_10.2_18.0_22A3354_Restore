@implementation _INUIExtensionHostContext

+ (id)_extensionAuxiliaryHostProtocol
{
  return +[_INUIXPCInterfaceUtilities extensionContextHostingInterface](_INUIXPCInterfaceUtilities, "extensionContextHostingInterface");
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  return +[_INUIXPCInterfaceUtilities extensionContextVendingInterface](_INUIXPCInterfaceUtilities, "extensionContextVendingInterface");
}

+ (id)_allowedItemPayloadClasses
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, objc_opt_class(), 0);
}

- (void)setExtensionContextState:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[_INUIExtensionHostContext _errorHandlingExtensionContextProxy](self, "_errorHandlingExtensionContextProxy");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setExtensionContextState:completion:", v7, v6);

}

- (id)_errorHandlingExtensionContextProxy
{
  void *v2;
  void *v3;

  -[_INUIExtensionHostContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_344);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)requestHandlingOfIntent:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_INUIExtensionHostContext extensionHostContextDelegate](self, "extensionHostContextDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extensionHostContext:wantsToHandleIntent:", self, v4);

}

- (void)willBeginEditing
{
  id v3;

  -[_INUIExtensionHostContext extensionHostContextDelegate](self, "extensionHostContextDelegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "extensionHostContextWillBeginEditing:", self);

}

- (INUIExtensionHostContextDelegate)extensionHostContextDelegate
{
  return (INUIExtensionHostContextDelegate *)objc_loadWeakRetained((id *)&self->_extensionHostContextDelegate);
}

- (void)setExtensionHostContextDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_extensionHostContextDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_extensionHostContextDelegate);
}

@end

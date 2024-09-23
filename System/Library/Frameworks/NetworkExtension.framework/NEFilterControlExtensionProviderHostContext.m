@implementation NEFilterControlExtensionProviderHostContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_protocolInit_3581 != -1)
    dispatch_once(&_extensionAuxiliaryVendorProtocol_protocolInit_3581, &__block_literal_global_3582);
  return (id)_extensionAuxiliaryVendorProtocol_protocol_3583;
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_protocolInit_3577 != -1)
    dispatch_once(&_extensionAuxiliaryHostProtocol_protocolInit_3577, &__block_literal_global_68_3578);
  return (id)_extensionAuxiliaryHostProtocol_protocol_3579;
}

void __78__NEFilterControlExtensionProviderHostContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE41A330);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryHostProtocol_protocol_3579;
  _extensionAuxiliaryHostProtocol_protocol_3579 = v0;

}

void __80__NEFilterControlExtensionProviderHostContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE41A280);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryVendorProtocol_protocol_3583;
  _extensionAuxiliaryVendorProtocol_protocol_3583 = v0;

}

- (void)handleNewFlow:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[NEExtensionProviderHostContext vendorContext]((id *)&self->super.super.super.super.isa);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleNewFlow:completionHandler:", v7, v6);

}

- (void)handleReport:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NEExtensionProviderHostContext vendorContext]((id *)&self->super.super.super.super.isa);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleReport:", v4);

}

- (void)notifyRulesChanged
{
  id v2;

  -[NEExtensionProviderHostContext delegate]((id *)&self->super.super.super.super.isa);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notifyRulesChanged");

}

- (void)provideRemediationMap:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NEExtensionProviderHostContext delegate]((id *)&self->super.super.super.super.isa);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "provideRemediationMap:", v4);

}

- (void)provideURLAppendStringMap:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NEExtensionProviderHostContext delegate]((id *)&self->super.super.super.super.isa);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "provideURLAppendStringMap:", v4);

}

@end

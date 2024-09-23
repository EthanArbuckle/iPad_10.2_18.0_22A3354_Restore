@implementation NEFilterPacketExtensionProviderHostContext

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_protocolInit_21088 != -1)
    dispatch_once(&_extensionAuxiliaryHostProtocol_protocolInit_21088, &__block_literal_global_21089);
  return (id)_extensionAuxiliaryHostProtocol_protocol_21090;
}

void __77__NEFilterPacketExtensionProviderHostContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE426568);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryHostProtocol_protocol_21090;
  _extensionAuxiliaryHostProtocol_protocol_21090 = v0;

}

- (void)createPacketChannelWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NEExtensionProviderHostContext delegate]((id *)&self->super.super.super.super.isa);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "createPacketChannelForExtension:completionHandler:", self, v4);

}

@end

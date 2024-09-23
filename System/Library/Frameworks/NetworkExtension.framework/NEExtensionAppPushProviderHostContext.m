@implementation NEExtensionAppPushProviderHostContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_protocolInit_4418 != -1)
    dispatch_once(&_extensionAuxiliaryVendorProtocol_protocolInit_4418, &__block_literal_global_4419);
  return (id)_extensionAuxiliaryVendorProtocol_protocol_4420;
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_protocolInit_4415 != -1)
    dispatch_once(&_extensionAuxiliaryHostProtocol_protocolInit_4415, &__block_literal_global_71);
  return (id)_extensionAuxiliaryHostProtocol_protocol_4416;
}

void __72__NEExtensionAppPushProviderHostContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE41AC70);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryHostProtocol_protocol_4416;
  _extensionAuxiliaryHostProtocol_protocol_4416 = v0;

}

void __74__NEExtensionAppPushProviderHostContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE41AC10);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryVendorProtocol_protocol_4420;
  _extensionAuxiliaryVendorProtocol_protocol_4420 = v0;

}

- (int)requiredEntitlement
{
  return 32;
}

- (void)startConnectionWithProviderConfig:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[NEExtensionProviderHostContext vendorContext]((id *)&self->super.super.super.isa);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startConnectionWithProviderConfig:completionHandler:", v7, v6);

}

- (void)stopWithReason:(int)a3 completionHandler:(id)a4
{
  uint64_t v4;
  id v6;
  id v7;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  -[NEExtensionProviderHostContext vendorContext]((id *)&self->super.super.super.isa);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stopWithReason:completionHandler:", v4, v6);

}

- (void)setProviderConfiguration:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NEExtensionProviderHostContext vendorContext]((id *)&self->super.super.super.isa);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setProviderConfiguration:", v4);

}

- (void)sendOutgoingCallMessage:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[NEExtensionProviderHostContext vendorContext]((id *)&self->super.super.super.isa);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sendOutgoingCallMessage:completionHandler:", v7, v6);

}

- (void)sendTimerEvent
{
  id v2;

  -[NEExtensionProviderHostContext vendorContext]((id *)&self->super.super.super.isa);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendTimerEvent");

}

- (void)reportIncomingCall:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NEExtensionProviderHostContext delegate]((id *)&self->super.super.super.isa);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didReceiveIncomingCallWithUserInfo:", v4);

}

- (void)reportPushToTalkMessage:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NEExtensionProviderHostContext delegate]((id *)&self->super.super.super.isa);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didReceivePushToTalkMessageWithUserInfo:", v4);

}

@end

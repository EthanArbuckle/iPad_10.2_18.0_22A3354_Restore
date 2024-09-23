@implementation NSXPCInterface

void __89__NSXPCInterface_NSXPCInterface_AKRemoteViewServiceInterface__remoteViewServiceInterface__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE270B78);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)remoteViewServiceInterface_interface;
  remoteViewServiceInterface_interface = v0;

  v2 = (void *)remoteViewServiceInterface_interface;
  +[AKAuthorizationPresenterHostInterface XPCInterface](AKAuthorizationPresenterHostInterface, "XPCInterface");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v3, sel_presentAuthorizationWithContext_usingHost_completionHandler_, 1, 0);

  v4 = (void *)remoteViewServiceInterface_interface;
  +[AKPrivateEmailPresenterHostInterface XPCInterface](AKPrivateEmailPresenterHostInterface, "XPCInterface");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInterface:forSelector:argumentIndex:ofReply:", v5, sel_presentPrivateEmailWithContext_usingHost_completionHandler_, 1, 0);

}

uint64_t __89__NSXPCInterface_NSXPCInterface_AKRemoteViewSessionInterface__remoteViewSessionInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE270CF8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)remoteViewSessionInterface_interface;
  remoteViewSessionInterface_interface = v0;

  return objc_msgSend((id)remoteViewSessionInterface_interface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_activateWithCompletionHandler_, 0, 1);
}

@end

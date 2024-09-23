@implementation MXExtensionContext

void __54___MXExtensionContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EDFEE4B0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECE2DD00;
  qword_1ECE2DD00 = v0;

}

void __56___MXExtensionContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EDFFB688);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECE2DD10;
  qword_1ECE2DD10 = v0;

  v2 = (void *)qword_1ECE2DD10;
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE079BB8);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v3, sel_startSendingUpdatesForRequest_requestDispatcher_toObserver_, 2, 0);

}

@end

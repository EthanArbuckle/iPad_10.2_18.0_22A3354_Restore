@implementation SHShazamKitUIServiceInterface

void __SHShazamKitUIServiceInterface_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255016150);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)SHShazamKitUIServiceInterface_interface;
  SHShazamKitUIServiceInterface_interface = v0;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)SHShazamKitUIServiceInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_presentMediaItem_presentationSettings_completionHandler_, 1, 0);

}

@end

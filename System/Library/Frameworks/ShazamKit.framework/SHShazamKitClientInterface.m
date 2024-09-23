@implementation SHShazamKitClientInterface

void __SHShazamKitClientInterface_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25500D618);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)SHShazamKitClientInterface_interface;
  SHShazamKitClientInterface_interface = v0;

  v2 = (void *)MEMORY[0x24BDBCF20];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, objc_opt_class(), 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)SHShazamKitClientInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel__library_didChangeWithSnapshot_, 1, 0);
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25500CBA8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)SHShazamKitClientInterface_interface, "setInterface:forSelector:argumentIndex:ofReply:", v7, sel_matcher_didProduceResponse_, 0, 0);
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25500E508);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)SHShazamKitClientInterface_interface, "setInterface:forSelector:argumentIndex:ofReply:", v8, sel__libraryWillBeginSync_, 0, 0);
  objc_msgSend((id)SHShazamKitClientInterface_interface, "setInterface:forSelector:argumentIndex:ofReply:", v8, sel__library_didChangeWithSnapshot_, 0, 0);
  objc_msgSend((id)SHShazamKitClientInterface_interface, "setInterface:forSelector:argumentIndex:ofReply:", v8, sel__library_didProduceError_failedItemIdentifiers_, 0, 0);
  objc_msgSend((id)SHShazamKitClientInterface_interface, "setInterface:forSelector:argumentIndex:ofReply:", v8, sel__libraryDidCompleteSync_, 0, 0);

}

@end

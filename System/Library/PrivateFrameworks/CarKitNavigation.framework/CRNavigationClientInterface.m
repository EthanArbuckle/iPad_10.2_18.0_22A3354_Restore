@implementation CRNavigationClientInterface

void __CRNavigationClientInterface_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2568211E8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)CRNavigationClientInterface_interface;
  CRNavigationClientInterface_interface = v0;

  v2 = (void *)CRNavigationClientInterface_interface;
  v3 = (void *)MEMORY[0x24BDBCF20];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_didUpdateActiveComponents_, 0, 0);

}

@end

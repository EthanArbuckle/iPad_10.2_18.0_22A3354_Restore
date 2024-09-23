@implementation CRNavigationServiceInterface

void __CRNavigationServiceInterface_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2568210E8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)CRNavigationServiceInterface_interface;
  CRNavigationServiceInterface_interface = v0;

  v2 = (void *)CRNavigationServiceInterface_interface;
  v3 = (void *)MEMORY[0x24BDBCF20];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, v5, v6, v7, v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_sendInfo_toComponentUID_, 0, 0);

  v10 = (void *)CRNavigationServiceInterface_interface;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_sendInfo_toComponentUID_, 1, 0);

}

@end

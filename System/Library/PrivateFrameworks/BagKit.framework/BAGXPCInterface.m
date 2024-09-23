@implementation BAGXPCInterface

+ (id)interface
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254EFD178);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254EFB9C0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v3, sel_setupBagKitClient_withUUID_forOptions_, 0, 0);
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_setupBagKitClient_withUUID_forOptions_, 1, 0);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_setupBagKitClient_withUUID_forOptions_, 2, 0);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_cancelBagKitClientWithUUID_forOptions_, 0, 0);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_cancelBagKitClientWithUUID_forOptions_, 1, 0);

  v8 = (void *)MEMORY[0x24BDBCF20];
  v9 = objc_opt_class();
  objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_resourceUpdated_forOptions_withContext_, 0, 0);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_resourceUpdated_forOptions_withContext_, 1, 0);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_resourceUpdated_forOptions_withContext_, 2, 0);

  return v2;
}

@end

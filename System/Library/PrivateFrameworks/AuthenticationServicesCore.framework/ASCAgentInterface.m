@implementation ASCAgentInterface

+ (id)xpcInterface
{
  if (xpcInterface_onceToken != -1)
    dispatch_once(&xpcInterface_onceToken, &__block_literal_global_1);
  return (id)xpcInterface_interface;
}

void __33__ASCAgentInterface_xpcInterface__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254A40D58);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)xpcInterface_interface;
  xpcInterface_interface = v0;

  v2 = (void *)MEMORY[0x24BDBCF20];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)xpcInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_performAuthorizationRequestsForContext_withCompletionHandler_, 0, 1);
  v9 = (void *)xpcInterface_interface;
  v10 = (void *)MEMORY[0x24BDBCF20];
  v18[0] = objc_opt_class();
  v18[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_browserPasskeysForRelyingParty_completionHandler_, 0, 1);

  v13 = (void *)xpcInterface_interface;
  v14 = (void *)MEMORY[0x24BDBCF20];
  v17[0] = objc_opt_class();
  v17[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setWithArray:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setClasses:forSelector:argumentIndex:ofReply:", v16, sel_performSilentAuthorizationRequestsForContext_withCompletionHandler_, 0, 1);

}

@end

@implementation BLServiceInterface

+ (NSXPCInterface)mainInterface
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254B67330);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDBCF20];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_fetchDownloadListWithReply_, 0, 1);
  v6 = (void *)MEMORY[0x24BDBCF20];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_requestDownloadsWithRestoreContentRequestItems_reply_, 0, 0);
  v9 = (void *)MEMORY[0x24BDBCF20];
  v10 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_requestDownloadsWithRestoreContentRequestItems_reply_, 0, 1);
  v12 = (void *)MEMORY[0x24BDBCF20];
  v13 = objc_opt_class();
  objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_migrationInfosWithStoreIDs_withReply_, 0, 1);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_migrationInfosWithStates_withReply_, 0, 1);
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254B699D0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v15, sel_purchaseWithRequest_uiHostProxy_reply_, 1, 0);
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v15, sel_requestDownloadsWithManifestRequest_uiHostProxy_reply_, 1, 0);
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v15, sel_setAutomaticDownloadEnabled_uiHostProxy_reply_, 1, 0);

  return (NSXPCInterface *)v2;
}

+ (NSXPCInterface)progressInterface
{
  return (NSXPCInterface *)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254B67868);
}

@end

@implementation SHShazamKitServiceInterface

void __SHShazamKitServiceInterface_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255011A90);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)SHShazamKitServiceInterface_interface;
  SHShazamKitServiceInterface_interface = v0;

  v2 = (void *)MEMORY[0x24BDBCF20];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, objc_opt_class(), 0);
  v31 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)SHShazamKitServiceInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v31, sel_synchronizeSnapshot_startCondition_completionHandler_, 0, 0);
  v7 = (void *)MEMORY[0x24BDBCF20];
  v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)SHShazamKitServiceInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v30, sel__queryLibraryWithParameters_completionHandler_, 0, 1);
  v9 = (void *)MEMORY[0x24BDBCF20];
  v10 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)SHShazamKitServiceInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v29, sel__queryLibraryWithParameters_completionHandler_, 1, 1);
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)SHShazamKitServiceInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel__queryLibraryWithParameters_completionHandler_, 0, 0);
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25500CBA8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)SHShazamKitServiceInterface_interface, "setInterface:forSelector:argumentIndex:ofReply:", v12, sel_matcher_didProduceResponse_, 0, 0);
  v13 = (void *)SHShazamKitServiceInterface_interface;
  v14 = (void *)MEMORY[0x24BDBCF20];
  v15 = objc_opt_class();
  objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setClasses:forSelector:argumentIndex:ofReply:", v16, sel_mediaItemsForShazamIDs_completionHandler_, 0, 0);

  v17 = (void *)SHShazamKitServiceInterface_interface;
  v18 = (void *)MEMORY[0x24BDBCF20];
  v19 = objc_opt_class();
  objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setClasses:forSelector:argumentIndex:ofReply:", v20, sel_mediaItemsForShazamIDs_completionHandler_, 0, 1);

  v21 = (void *)SHShazamKitServiceInterface_interface;
  v22 = (void *)MEMORY[0x24BDBCF20];
  v23 = objc_opt_class();
  objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setClasses:forSelector:argumentIndex:ofReply:", v24, sel_hapticsForMediaItems_completionHandler_, 0, 0);

  v25 = (void *)SHShazamKitServiceInterface_interface;
  v26 = (void *)MEMORY[0x24BDBCF20];
  v27 = objc_opt_class();
  objc_msgSend(v26, "setWithObjects:", v27, objc_opt_class(), 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setClasses:forSelector:argumentIndex:ofReply:", v28, sel_hapticsForMediaItems_completionHandler_, 0, 1);

}

@end

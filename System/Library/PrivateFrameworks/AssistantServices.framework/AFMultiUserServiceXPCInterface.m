@implementation AFMultiUserServiceXPCInterface

void __AFMultiUserServiceXPCInterface_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE4321F8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)AFMultiUserServiceXPCInterface_interface;
  AFMultiUserServiceXPCInterface_interface = v0;

  v2 = (void *)AFMultiUserServiceXPCInterface_interface;
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_getMultiUserSettingsForSharedUserID_completion_, 0, 1);

  v6 = (void *)AFMultiUserServiceXPCInterface_interface;
  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_getMultiUserSettingsForRecognizedUserWithCompletion_, 0, 1);

  v10 = (void *)AFMultiUserServiceXPCInterface_interface;
  v11 = (void *)MEMORY[0x1E0C99E60];
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  objc_msgSend(v11, "setWithObjects:", v12, v13, objc_opt_class(), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_homeUserIdToNames_, 0, 1);

  v15 = (void *)AFMultiUserServiceXPCInterface_interface;
  v16 = (void *)MEMORY[0x1E0C99E60];
  v17 = objc_opt_class();
  objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_getSharedUserInfoForSharedUserID_completion_, 0, 1);

  v19 = (void *)AFMultiUserServiceXPCInterface_interface;
  v20 = (void *)MEMORY[0x1E0C99E60];
  v21 = objc_opt_class();
  objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setClasses:forSelector:argumentIndex:ofReply:", v22, sel_getSharedUserInfoForiCloudAltDSID_completion_, 0, 1);

}

@end

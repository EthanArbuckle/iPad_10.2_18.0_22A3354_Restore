@implementation KCSharingGroupManager(AuthenticationServicesExtras)

- (void)as_getKCSharingParticipantsForFamilyMembersWithCompletionHandler:()AuthenticationServicesExtras
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  NSObject *v16;
  id v17;

  v3 = a3;
  v4 = dispatch_group_create();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x24BE30A88]);
  dispatch_group_enter(v4);
  v7 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __120__KCSharingGroupManager_AuthenticationServicesExtras__as_getKCSharingParticipantsForFamilyMembersWithCompletionHandler___block_invoke;
  v15[3] = &unk_24C950190;
  v16 = v4;
  v8 = v5;
  v17 = v8;
  v9 = v4;
  objc_msgSend(v6, "startRequestWithCompletionHandler:", v15);
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __120__KCSharingGroupManager_AuthenticationServicesExtras__as_getKCSharingParticipantsForFamilyMembersWithCompletionHandler___block_invoke_17;
  v12[3] = &unk_24C9501B8;
  v13 = v8;
  v14 = v3;
  v10 = v8;
  v11 = v3;
  dispatch_group_notify(v9, MEMORY[0x24BDAC9B8], v12);

}

@end

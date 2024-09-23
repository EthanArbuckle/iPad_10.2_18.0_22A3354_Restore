@implementation CSCloudSharing

+ (void)sharingStatusForFileOrFolderURL:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  _TtC12CloudSharing15InitiateSharing *v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(_TtC12CloudSharing15InitiateSharing);
  -[InitiateSharing callForSharingStatus:reply:](v7, "callForSharingStatus:reply:", v6, v5);

}

+ (void)shareFileOrFolderURL:(id)a3 emailAddresses:(id)a4 phoneNumbers:(id)a5 accessType:(int64_t)a6 permissionType:(int64_t)a7 allowOthersToInvite:(BOOL)a8 completionHandler:(id)a9
{
  _BOOL8 v9;
  id v15;
  id v16;
  id v17;
  id v18;
  _TtC12CloudSharing15InitiateSharing *v19;

  v9 = a8;
  v15 = a9;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  v19 = objc_alloc_init(_TtC12CloudSharing15InitiateSharing);
  -[InitiateSharing callForFileSharing:emailAddresses:phoneNumbers:accessType:permissionType:allowOthersToInvite:reply:](v19, "callForFileSharing:emailAddresses:phoneNumbers:accessType:permissionType:allowOthersToInvite:reply:", v18, v17, v16, a6, a7, v9, v15);

}

+ (void)completeShare:(id)a3 containerSetupInfo:(id)a4 emailAddresses:(id)a5 phoneNumbers:(id)a6 accessType:(int64_t)a7 permissionType:(int64_t)a8 allowOthersToInvite:(BOOL)a9 completionHandler:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  _TtC12CloudSharing15InitiateSharing *v22;

  v16 = a10;
  v17 = a6;
  v18 = a5;
  v19 = a4;
  v20 = a3;
  v22 = objc_alloc_init(_TtC12CloudSharing15InitiateSharing);
  LOBYTE(v21) = a9;
  -[InitiateSharing callForCloudKitAddToShare:containerSetupInfo:emailAddresses:phoneNumbers:accessType:permissionType:allowOthersToInvite:reply:](v22, "callForCloudKitAddToShare:containerSetupInfo:emailAddresses:phoneNumbers:accessType:permissionType:allowOthersToInvite:reply:", v20, v19, v18, v17, a7, a8, v21, v16);

}

+ (void)shareOrUpdateShareURL:(id)a3 containerSetupInfo:(id)a4 emailAddresses:(id)a5 phoneNumbers:(id)a6 accessType:(int64_t)a7 permissionType:(int64_t)a8 allowOthersToInvite:(BOOL)a9 completionHandler:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  _TtC12CloudSharing15InitiateSharing *v22;

  v16 = a10;
  v17 = a6;
  v18 = a5;
  v19 = a4;
  v20 = a3;
  v22 = objc_alloc_init(_TtC12CloudSharing15InitiateSharing);
  LOBYTE(v21) = a9;
  -[InitiateSharing callForSharingURLAddToShare:containerSetupInfo:emailAddresses:phoneNumbers:accessType:permissionType:allowOthersToInvite:reply:](v22, "callForSharingURLAddToShare:containerSetupInfo:emailAddresses:phoneNumbers:accessType:permissionType:allowOthersToInvite:reply:", v20, v19, v18, v17, a7, a8, v21, v16);

}

+ (void)removeFromShareURL:(id)a3 containerSetupInfo:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  _TtC12CloudSharing15InitiateSharing *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(_TtC12CloudSharing15InitiateSharing);
  -[InitiateSharing callForSharingURLRemoveShare:containerSetupInfo:reply:](v10, "callForSharingURLRemoveShare:containerSetupInfo:reply:", v9, v8, v7);

}

+ (void)removeFromShare:(id)a3 containerSetupInfo:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  _TtC12CloudSharing15InitiateSharing *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(_TtC12CloudSharing15InitiateSharing);
  -[InitiateSharing callForRemoveShare:containerSetupInfo:reply:](v10, "callForRemoveShare:containerSetupInfo:reply:", v9, v8, v7);

}

+ (void)removeFromShareFileURL:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  _TtC12CloudSharing15InitiateSharing *v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(_TtC12CloudSharing15InitiateSharing);
  -[InitiateSharing callForFileURLRemoveShare:reply:](v7, "callForFileURLRemoveShare:reply:", v6, v5);

}

+ (void)messageContentForMail:(id)a3 share:(id)a4 fileURL:(id)a5 appName:(id)a6 appIconData:(id)a7 completionHandler:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _TtC12CloudSharing15InitiateSharing *v19;

  v13 = a8;
  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  v19 = objc_alloc_init(_TtC12CloudSharing15InitiateSharing);
  -[InitiateSharing callForMailContent:share:fileURL:appName:appIconData:reply:](v19, "callForMailContent:share:fileURL:appName:appIconData:reply:", v18, v17, v16, v15, v14, v13);

}

+ (void)ckMetadataFromShareURL:(id)a3 containerSetupInfo:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  _TtC12CloudSharing15InitiateSharing *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(_TtC12CloudSharing15InitiateSharing);
  -[InitiateSharing callForMetadataFromShareURL:containerSetupInfo:reply:](v10, "callForMetadataFromShareURL:containerSetupInfo:reply:", v9, v8, v7);

}

+ (void)updateShare:(id)a3 containerSetupInfo:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  _TtC12CloudSharing15InitiateSharing *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(_TtC12CloudSharing15InitiateSharing);
  -[InitiateSharing callForUpdateShare:containerSetupInfo:reply:](v10, "callForUpdateShare:containerSetupInfo:reply:", v9, v8, v7);

}

+ (void)sharingStatusForShare:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  _TtC12CloudSharing15InitiateSharing *v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(_TtC12CloudSharing15InitiateSharing);
  -[InitiateSharing callForCurrentUserSharingStatus:reply:](v7, "callForCurrentUserSharingStatus:reply:", v6, v5);

}

+ (void)addParticipantsToShare:(id)a3 containerSetupInfo:(id)a4 emailAddresses:(id)a5 phoneNumbers:(id)a6 completionHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _TtC12CloudSharing15InitiateSharing *v16;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = objc_alloc_init(_TtC12CloudSharing15InitiateSharing);
  -[InitiateSharing callForAddParticipantsToShare:containerSetupInfo:emailAddresses:phoneNumbers:reply:](v16, "callForAddParticipantsToShare:containerSetupInfo:emailAddresses:phoneNumbers:reply:", v15, v14, v13, v12, v11);

}

+ (void)addParticipantsToShareWithURLWrapper:(id)a3 share:(id)a4 emailAddresses:(id)a5 phoneNumbers:(id)a6 permissionType:(int64_t)a7 allowOthersToInvite:(BOOL)a8 completionHandler:(id)a9
{
  _BOOL8 v9;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _TtC12CloudSharing15InitiateSharing *v20;

  v9 = a8;
  v15 = a9;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  v20 = objc_alloc_init(_TtC12CloudSharing15InitiateSharing);
  -[InitiateSharing callForAddParticipantsToShareWithURLWrapper:share:emailAddresses:phoneNumbers:permissionType:allowOthersToInvite:reply:](v20, "callForAddParticipantsToShareWithURLWrapper:share:emailAddresses:phoneNumbers:permissionType:allowOthersToInvite:reply:", v19, v18, v17, v16, a7, v9, v15);

}

+ (void)addParticipantsToShare:(id)a3 containerSetupInfo:(id)a4 emailAddresses:(id)a5 phoneNumbers:(id)a6 permissionType:(int64_t)a7 allowOthersToInvite:(BOOL)a8 completionHandler:(id)a9
{
  _BOOL8 v9;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _TtC12CloudSharing15InitiateSharing *v20;

  v9 = a8;
  v15 = a9;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  v20 = objc_alloc_init(_TtC12CloudSharing15InitiateSharing);
  -[InitiateSharing callForAddParticipantsToShare:containerSetupInfo:emailAddresses:phoneNumbers:permissionType:allowOthersToInvite:reply:](v20, "callForAddParticipantsToShare:containerSetupInfo:emailAddresses:phoneNumbers:permissionType:allowOthersToInvite:reply:", v19, v18, v17, v16, a7, v9, v15);

}

+ (void)existingShareForFileOrFolderURL:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  _TtC12CloudSharing15InitiateSharing *v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(_TtC12CloudSharing15InitiateSharing);
  -[InitiateSharing callForExistingShareForFile:reply:](v7, "callForExistingShareForFile:reply:", v6, v5);

}

+ (void)userNameAndEmail:(id)a3 containerSetupInfo:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  _TtC12CloudSharing15InitiateSharing *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(_TtC12CloudSharing15InitiateSharing);
  -[InitiateSharing callForUserNameAndEmail:containerSetupInfo:reply:](v10, "callForUserNameAndEmail:containerSetupInfo:reply:", v9, v8, v7);

}

+ (void)shareFolderRemovingSubshares:(id)a3 emailAddresses:(id)a4 phoneNumbers:(id)a5 accessType:(int64_t)a6 permissionType:(int64_t)a7 allowOthersToInvite:(BOOL)a8 completionHandler:(id)a9
{
  _BOOL8 v9;
  id v15;
  id v16;
  id v17;
  id v18;
  _TtC12CloudSharing15InitiateSharing *v19;

  v9 = a8;
  v15 = a9;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  v19 = objc_alloc_init(_TtC12CloudSharing15InitiateSharing);
  -[InitiateSharing callForForciblyShareFolder:emailAddresses:phoneNumbers:accessType:permissionType:allowOthersToInvite:reply:](v19, "callForForciblyShareFolder:emailAddresses:phoneNumbers:accessType:permissionType:allowOthersToInvite:reply:", v18, v17, v16, a6, a7, v9, v15);

}

+ (void)shareFileOrFolderURL:(id)a3 emailAddresses:(id)a4 phoneNumbers:(id)a5 accessType:(int64_t)a6 permissionType:(int64_t)a7 allowOthersToInvite:(BOOL)a8 keepExistingParticipants:(BOOL)a9 completionHandler:(id)a10
{
  _BOOL8 v10;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v10 = a8;
  v17 = a10;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __156__CSCloudSharing_shareFileOrFolderURL_emailAddresses_phoneNumbers_accessType_permissionType_allowOthersToInvite_keepExistingParticipants_completionHandler___block_invoke;
  v19[3] = &unk_1E7676138;
  v20 = v17;
  v18 = v17;
  objc_msgSend(a1, "shareFileOrFolderURL:emailAddresses:phoneNumbers:accessType:permissionType:allowOthersToInvite:completionHandler:", a3, a4, a5, a6, a7, v10, v19);

}

uint64_t __156__CSCloudSharing_shareFileOrFolderURL_emailAddresses_phoneNumbers_accessType_permissionType_allowOthersToInvite_keepExistingParticipants_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)completeShare:(id)a3 containerSetupInfo:(id)a4 emailAddresses:(id)a5 phoneNumbers:(id)a6 accessType:(int64_t)a7 permissionType:(int64_t)a8 allowOthersToInvite:(BOOL)a9 keepExistingParticipants:(BOOL)a10 completionHandler:(id)a11
{
  id v18;
  id v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;

  v18 = a11;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __168__CSCloudSharing_completeShare_containerSetupInfo_emailAddresses_phoneNumbers_accessType_permissionType_allowOthersToInvite_keepExistingParticipants_completionHandler___block_invoke;
  v21[3] = &unk_1E7676138;
  v22 = v18;
  v19 = v18;
  LOBYTE(v20) = a9;
  objc_msgSend(a1, "completeShare:containerSetupInfo:emailAddresses:phoneNumbers:accessType:permissionType:allowOthersToInvite:completionHandler:", a3, a4, a5, a6, a7, a8, v20, v21);

}

uint64_t __168__CSCloudSharing_completeShare_containerSetupInfo_emailAddresses_phoneNumbers_accessType_permissionType_allowOthersToInvite_keepExistingParticipants_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)shareFileOrFolderShareURL:(id)a3 emailAddresses:(id)a4 phoneNumbers:(id)a5 accessType:(int64_t)a6 permissionType:(int64_t)a7 allowOthersToInvite:(BOOL)a8 keepExistingParticipants:(BOOL)a9 completionHandler:(id)a10
{
  void *v10;
  uint64_t v11;
  void (**v12)(id, _QWORD, id);
  id v13;

  v10 = (void *)MEMORY[0x1E0CB35C8];
  v11 = *MEMORY[0x1E0D10B70];
  v12 = (void (**)(id, _QWORD, id))a10;
  objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 9, 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v12[2](v12, 0, v13);

}

@end

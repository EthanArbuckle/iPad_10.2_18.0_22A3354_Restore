@implementation CKDSPIContainer

- (void)currentDeviceIDWithCompletionHandler:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  id v8;
  const char *v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  objc_msgSend_uncancellableOperationQueue(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1BE9C2C28;
  v10[3] = &unk_1E782EC68;
  v10[4] = self;
  v11 = v4;
  v8 = v4;
  objc_msgSend_addOperationWithBlock_(v7, v9, (uint64_t)v10);

}

- (void)frameworkCachesDirectoryWithCompletionHandler:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  id v8;
  const char *v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  objc_msgSend_uncancellableOperationQueue(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1BEA30190;
  v10[3] = &unk_1E782EC68;
  v10[4] = self;
  v11 = v4;
  v8 = v4;
  objc_msgSend_addOperationWithBlock_(v7, v9, (uint64_t)v10);

}

- (void)performFetchRecordVersionsOperation:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  CKDFetchRecordVersionsOperation *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  id v13;
  const char *v14;
  const char *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = [CKDFetchRecordVersionsOperation alloc];
  objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(&location, v12);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1BEA3033C;
  v16[3] = &unk_1E782FDC0;
  objc_copyWeak(&v18, &location);
  v13 = v6;
  v17 = v13;
  objc_msgSend_setRecordVersionFetchedBlock_(v12, v14, (uint64_t)v16);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v15, (uint64_t)v12, v7);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

- (void)performFetchArchivedRecordsOperation:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  CKDFetchArchivedRecordsOperation *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  uint64_t v13;
  id v14;
  const char *v15;
  id v16;
  const char *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = [CKDFetchArchivedRecordsOperation alloc];
  objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(&location, v12);
  v13 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = sub_1BEA307A0;
  v28[3] = &unk_1E782FA60;
  objc_copyWeak(&v30, &location);
  v14 = v6;
  v29 = v14;
  objc_msgSend_setRecordFetchedBlock_(v12, v15, (uint64_t)v28);
  v25[0] = v13;
  v25[1] = 3221225472;
  v25[2] = sub_1BEA3096C;
  v25[3] = &unk_1E782FDE8;
  v16 = v14;
  v26 = v16;
  objc_copyWeak(&v27, &location);
  objc_msgSend_setServerChangeTokenUpdatedBlock_(v12, v17, (uint64_t)v25);
  v20 = v13;
  v21 = 3221225472;
  v22 = sub_1BEA30B00;
  v23 = &unk_1E782EF38;
  objc_copyWeak(&v24, &location);
  objc_msgSend_setCompletionBlock_(v12, v18, (uint64_t)&v20);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v19, (uint64_t)v12, v7, v20, v21, v22, v23);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&v27);

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);

}

- (void)performArchiveRecordsOperation:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  CKDArchiveRecordsOperation *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  id v13;
  const char *v14;
  const char *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = [CKDArchiveRecordsOperation alloc];
  objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(&location, v12);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1BEA30C84;
  v16[3] = &unk_1E782FE10;
  v13 = v6;
  v17 = v13;
  objc_copyWeak(&v18, &location);
  objc_msgSend_setRecordArchivedBlock_(v12, v14, (uint64_t)v16);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v15, (uint64_t)v12, v7);
  objc_destroyWeak(&v18);

  objc_destroyWeak(&location);
}

- (void)performPublishAssetsOperation:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  CKDPublishAssetsOperation *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  id v13;
  const char *v14;
  const char *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = [CKDPublishAssetsOperation alloc];
  objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(&location, v12);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1BEA30F1C;
  v16[3] = &unk_1E782FE38;
  v13 = v6;
  v17 = v13;
  objc_copyWeak(&v18, &location);
  objc_msgSend_setAssetPublishedBlock_(v12, v14, (uint64_t)v16);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v15, (uint64_t)v12, v7);
  objc_destroyWeak(&v18);

  objc_destroyWeak(&location);
}

- (void)performRepairAssetsOperation:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  CKDRepairAssetsOperation *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  id v13;
  const char *v14;
  const char *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = [CKDRepairAssetsOperation alloc];
  objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(&location, v12);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1BEA311E4;
  v16[3] = &unk_1E782FE60;
  v13 = v6;
  v17 = v13;
  objc_copyWeak(&v18, &location);
  objc_msgSend_setAssetOrPackageRepairedBlock_(v12, v14, (uint64_t)v16);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v15, (uint64_t)v12, v7);
  objc_destroyWeak(&v18);

  objc_destroyWeak(&location);
}

- (void)performMarkAssetBrokenOperation:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  CKDMarkAssetBrokenOperation *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  id v13;
  const char *v14;
  const char *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = [CKDMarkAssetBrokenOperation alloc];
  objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(&location, v12);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1BEA31484;
  v16[3] = &unk_1E782FE10;
  v13 = v6;
  v17 = v13;
  objc_copyWeak(&v18, &location);
  objc_msgSend_setAssetOrPackageMarkedBrokenBlock_(v12, v14, (uint64_t)v16);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v15, (uint64_t)v12, v7);
  objc_destroyWeak(&v18);

  objc_destroyWeak(&location);
}

- (void)performModifyWebSharingOperation:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  CKDModifyWebSharingOperation *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  uint64_t v13;
  id v14;
  const char *v15;
  id v16;
  const char *v17;
  const char *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = [CKDModifyWebSharingOperation alloc];
  objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(&location, v12);
  v13 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = sub_1BEA3178C;
  v22[3] = &unk_1E782FE88;
  v14 = v6;
  v23 = v14;
  objc_copyWeak(&v24, &location);
  objc_msgSend_setRecordWebSharedBlock_(v12, v15, (uint64_t)v22);
  v19[0] = v13;
  v19[1] = 3221225472;
  v19[2] = sub_1BEA31918;
  v19[3] = &unk_1E782FE10;
  v16 = v14;
  v20 = v16;
  objc_copyWeak(&v21, &location);
  objc_msgSend_setRecordWebUnsharedBlock_(v12, v17, (uint64_t)v19);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v18, (uint64_t)v12, v7);
  objc_destroyWeak(&v21);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

}

- (void)getNewWebSharingIdentityWithCompletionHandler:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  id v8;
  const char *v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  objc_msgSend_uncancellableOperationQueue(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1BEA31B0C;
  v10[3] = &unk_1E782F4D0;
  v10[4] = self;
  v11 = v4;
  v8 = v4;
  objc_msgSend_addOperationWithBlock_(v7, v9, (uint64_t)v10);

}

- (void)getNewWebSharingIdentityDataWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1BEA31E60;
  v7[3] = &unk_1E782FEB0;
  v8 = v4;
  v5 = v4;
  objc_msgSend_getNewWebSharingIdentityWithCompletionHandler_(self, v6, (uint64_t)v7);

}

- (void)performSerializeRecordModificationsOperation:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  CKDSerializeRecordModificationsOperation *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, void *);
  void *v18;
  id v19;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = [CKDSerializeRecordModificationsOperation alloc];
  objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(&location, v12);
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = sub_1BEA32004;
  v18 = &unk_1E782FED8;
  objc_copyWeak(&v19, &location);
  objc_msgSend_setSerializeCompletionBlock_(v12, v13, (uint64_t)&v15);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v14, (uint64_t)v12, v7, v15, v16, v17, v18);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

- (void)performDeserializeRecordModificationsOperation:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  CKDDeserializeRecordModificationsOperation *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, void *, void *);
  void *v18;
  id v19;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = [CKDDeserializeRecordModificationsOperation alloc];
  objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(&location, v12);
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = sub_1BEA321A0;
  v18 = &unk_1E782FF00;
  objc_copyWeak(&v19, &location);
  objc_msgSend_setDeserializeCompletionBlock_(v12, v13, (uint64_t)&v15);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v14, (uint64_t)v12, v7, v15, v16, v17, v18);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

- (void)performModifyRecordAccessOperation:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  CKDModifyRecordAccessOperation *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  uint64_t v13;
  id v14;
  const char *v15;
  id v16;
  const char *v17;
  const char *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = [CKDModifyRecordAccessOperation alloc];
  objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(&location, v12);
  v13 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = sub_1BEA323D4;
  v22[3] = &unk_1E782FE88;
  v14 = v6;
  v23 = v14;
  objc_copyWeak(&v24, &location);
  objc_msgSend_setAccessWasGrantedBlock_(v12, v15, (uint64_t)v22);
  v19[0] = v13;
  v19[1] = 3221225472;
  v19[2] = sub_1BEA32560;
  v19[3] = &unk_1E782FE10;
  v16 = v14;
  v20 = v16;
  objc_copyWeak(&v21, &location);
  objc_msgSend_setAccessWasRevokedBlock_(v12, v17, (uint64_t)v19);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v18, (uint64_t)v12, v7);
  objc_destroyWeak(&v21);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

}

- (void)performCompleteParticipantVettingOperation:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  CKDCompleteParticipantVettingOperation *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  uint64_t v13;
  id v14;
  const char *v15;
  id v16;
  const char *v17;
  const char *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = [CKDCompleteParticipantVettingOperation alloc];
  objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(&location, v12);
  v13 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = sub_1BEA32868;
  v22[3] = &unk_1E782FF28;
  v14 = v6;
  v23 = v14;
  objc_copyWeak(&v24, &location);
  objc_msgSend_setVerifyProgressURLReconstructedBlock_(v12, v15, (uint64_t)v22);
  v19[0] = v13;
  v19[1] = 3221225472;
  v19[2] = sub_1BEA329A8;
  v19[3] = &unk_1E782FF50;
  v16 = v14;
  v20 = v16;
  objc_copyWeak(&v21, &location);
  objc_msgSend_setVerifyProgressShareMetadataFetchedBlock_(v12, v17, (uint64_t)v19);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v18, (uint64_t)v12, v7);
  objc_destroyWeak(&v21);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

}

- (void)performFetchShareParticipantKeyOperation:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  CKDFetchShareParticipantKeyOperation *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  id v13;
  const char *v14;
  const char *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = [CKDFetchShareParticipantKeyOperation alloc];
  objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(&location, v12);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1BEA32C24;
  v16[3] = &unk_1E782FF78;
  v13 = v6;
  v17 = v13;
  objc_copyWeak(&v18, &location);
  objc_msgSend_setShareParticipantKeyFetchedBlock_(v12, v14, (uint64_t)v16);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v15, (uint64_t)v12, v7);
  objc_destroyWeak(&v18);

  objc_destroyWeak(&location);
}

- (void)decryptPersonalInfoOnShare:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  const char *v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  objc_msgSend_uncancellableOperationQueue(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1BEA32E50;
  v14[3] = &unk_1E782FFC8;
  v15 = v6;
  v16 = v7;
  v14[4] = self;
  v11 = v6;
  v12 = v7;
  objc_msgSend_addOperationWithBlock_(v10, v13, (uint64_t)v14);

}

- (void)performInitiateParticipantVettingOperation:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  CKDInitiateParticipantVettingOperation *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  id v13;
  const char *v14;
  const char *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = [CKDInitiateParticipantVettingOperation alloc];
  objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(&location, v12);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1BEA33340;
  v16[3] = &unk_1E782FFF0;
  v13 = v6;
  v17 = v13;
  objc_copyWeak(&v18, &location);
  objc_msgSend_setParticipantVettingProgressBlock_(v12, v14, (uint64_t)v16);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v15, (uint64_t)v12, v7);
  objc_destroyWeak(&v18);

  objc_destroyWeak(&location);
}

- (void)performFetchUserQuotaOperation:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  CKDFetchUserQuotaOperation *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  _QWORD v14[4];
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = [CKDFetchUserQuotaOperation alloc];
  objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(&location, v12);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1BEA3359C;
  v14[3] = &unk_1E782EF38;
  objc_copyWeak(&v15, &location);
  objc_msgSend_performOperation_initialMessageReplyBlock_customCompletionBlock_(self, v13, (uint64_t)v12, v7, v14);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

- (void)performFetchMergeableDeltasOperation:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  CKDFetchMergeableDeltasOperation *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, void *, void *);
  void *v18;
  id v19;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = [CKDFetchMergeableDeltasOperation alloc];
  objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(&location, v12);
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = sub_1BEA33844;
  v18 = &unk_1E7830018;
  objc_copyWeak(&v19, &location);
  objc_msgSend_setDeltasFetchedBlock_(v12, v13, (uint64_t)&v15);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v14, (uint64_t)v12, v7, v15, v16, v17, v18);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

- (void)performFetchMergeableDeltaMetadataOperation:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  CKDFetchMergeableDeltaMetadataOperation *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, void *, void *);
  void *v18;
  id v19;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = [CKDFetchMergeableDeltaMetadataOperation alloc];
  objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(&location, v12);
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = sub_1BEA33AE0;
  v18 = &unk_1E7830018;
  objc_copyWeak(&v19, &location);
  objc_msgSend_setMetadataFetchedBlock_(v12, v13, (uint64_t)&v15);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v14, (uint64_t)v12, v7, v15, v16, v17, v18);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

- (void)performReplaceMergeableDeltasOperation:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  CKDReplaceMergeableDeltasOperation *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, void *);
  void *v18;
  id v19;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = [CKDReplaceMergeableDeltasOperation alloc];
  objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(&location, v12);
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = sub_1BEA33D7C;
  v18 = &unk_1E7830040;
  objc_copyWeak(&v19, &location);
  objc_msgSend_setPerReplacementCompletionBlock_(v12, v13, (uint64_t)&v15);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v14, (uint64_t)v12, v7, v15, v16, v17, v18);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

- (void)performUploadMergeableDeltasOperation:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  CKDUploadMergeableDeltasOperation *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  const char *v15;
  const char *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = [CKDUploadMergeableDeltasOperation alloc];
  objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(&location, v12);
  v13 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = sub_1BEA34060;
  v19[3] = &unk_1E7830068;
  objc_copyWeak(&v20, &location);
  objc_msgSend_setUploadDeltaCompletionBlock_(v12, v14, (uint64_t)v19);
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = sub_1BEA34214;
  v17[3] = &unk_1E7830040;
  objc_copyWeak(&v18, &location);
  objc_msgSend_setReplaceDeltasRequestCompletionBlock_(v12, v15, (uint64_t)v17);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v16, (uint64_t)v12, v7);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

- (void)performFetchWhitelistedBundleIDsOperation:(id)a3 withBlock:(id)a4
{
  MEMORY[0x1E0DE7D20](self, sel_performFetchRegisteredBundleIDsOperation_withBlock_, a3);
}

- (void)performFetchRegisteredBundleIDsOperation:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  CKDFetchRegisteredBundleIDsOperation *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  _QWORD v14[4];
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = [CKDFetchRegisteredBundleIDsOperation alloc];
  objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(&location, v12);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1BEA34494;
  v14[3] = &unk_1E782EF38;
  objc_copyWeak(&v15, &location);
  objc_msgSend_performOperation_initialMessageReplyBlock_customCompletionBlock_(self, v13, (uint64_t)v12, v7, v14);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

- (void)serverPreferredPushEnvironmentWithCompletionHandler:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  id v8;
  const char *v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  objc_msgSend_uncancellableOperationQueue(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1BEA346C0;
  v10[3] = &unk_1E782F4D0;
  v10[4] = self;
  v11 = v4;
  v8 = v4;
  objc_msgSend_addOperationWithBlock_(v7, v9, (uint64_t)v10);

}

- (void)serverEnvironmentWithCompletionHandler:(id)a3
{
  void *v4;
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  CKDOperationInfoHolderOperation *v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  id v16;

  v4 = (void *)MEMORY[0x1E0C94F80];
  v5 = a3;
  objc_msgSend_defaultConvenienceOperationConfiguration(v4, v6, v7);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_opt_new();
  objc_msgSend_setResolvedConfiguration_(v8, v9, (uint64_t)v16);
  v10 = [CKDOperationInfoHolderOperation alloc];
  objc_msgSend_containerForOperationInfo_(self, v11, (uint64_t)v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend_initWithOperationInfo_container_(v10, v13, (uint64_t)v8, v12);

  objc_msgSend_fetchServerEnvironmentForOperation_withCompletionHandler_(self, v15, (uint64_t)v14, v5);
}

- (void)globalPerUserBoundaryKeyWithCompletionHandler:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  id v8;
  const char *v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  objc_msgSend_uncancellableOperationQueue(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1BEA34B98;
  v10[3] = &unk_1E782F4D0;
  v10[4] = self;
  v11 = v4;
  v8 = v4;
  objc_msgSend_addOperationWithBlock_(v7, v9, (uint64_t)v10);

}

- (void)performAggregateZonePCSOperation:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  CKDAggregateZonePCSOperation *v8;
  const char *v9;
  void *v10;
  const char *v11;
  const char *v12;
  id v13;

  v6 = a4;
  v7 = a3;
  v8 = [CKDAggregateZonePCSOperation alloc];
  objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v7, v10);

  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v12, (uint64_t)v13, v6);
}

- (void)countAssetCacheItemsWithDatabaseScope:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  id v10;
  const char *v11;
  _QWORD v12[5];
  id v13;
  int64_t v14;

  v6 = a4;
  objc_msgSend_uncancellableOperationQueue(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1BEA351DC;
  v12[3] = &unk_1E7830108;
  v13 = v6;
  v14 = a3;
  v12[4] = self;
  v10 = v6;
  objc_msgSend_addOperationWithBlock_(v9, v11, (uint64_t)v12);

}

- (void)clearAssetCacheWithDatabaseScope:(int64_t)a3 completionHandler:(id)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  id v9;
  const char *v10;
  _QWORD v11[5];
  id v12;

  v5 = a4;
  objc_msgSend_uncancellableOperationQueue(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1BEA352BC;
  v11[3] = &unk_1E782F4D0;
  v11[4] = self;
  v12 = v5;
  v9 = v5;
  objc_msgSend_addOperationWithBlock_(v8, v10, (uint64_t)v11);

}

- (void)showAssetCacheWithDatabaseScope:(int64_t)a3
{
  void *v4;
  const char *v5;
  _QWORD v6[5];

  objc_msgSend_uncancellableOperationQueue(self, a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1BEA35368;
  v6[3] = &unk_1E782EA40;
  v6[4] = self;
  objc_msgSend_addOperationWithBlock_(v4, v5, (uint64_t)v6);

}

- (void)clearRecordCacheWithDatabaseScope:(int64_t)a3
{
  void *v5;
  const char *v6;
  _QWORD v7[6];

  objc_msgSend_uncancellableOperationQueue(self, a2, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1BEA353E8;
  v7[3] = &unk_1E7830130;
  v7[4] = self;
  v7[5] = a3;
  objc_msgSend_addOperationWithBlock_(v5, v6, (uint64_t)v7);

}

- (void)clearAuthTokensWithRecordID:(id)a3 databaseScope:(int64_t)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  id v10;
  const char *v11;
  _QWORD v12[4];
  id v13;
  CKDSPIContainer *v14;
  int64_t v15;

  v6 = a3;
  objc_msgSend_uncancellableOperationQueue(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1BEA355D8;
  v12[3] = &unk_1E7830158;
  v13 = v6;
  v14 = self;
  v15 = a4;
  v10 = v6;
  objc_msgSend_addOperationWithBlock_(v9, v11, (uint64_t)v12);

}

- (void)clearCachesWithOptions:(unint64_t)a3 databaseScope:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  id v12;
  const char *v13;
  _QWORD v14[5];
  id v15;
  unint64_t v16;
  int64_t v17;

  v8 = a5;
  objc_msgSend_uncancellableOperationQueue(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1BEA35778;
  v14[3] = &unk_1E7830180;
  v16 = a3;
  v17 = a4;
  v14[4] = self;
  v15 = v8;
  v12 = v8;
  objc_msgSend_addOperationWithBlock_(v11, v13, (uint64_t)v14);

}

- (void)clearCachesForRecordWithRecordID:(id)a3 databaseScope:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  const char *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  int64_t v19;

  v8 = a3;
  v9 = a5;
  objc_msgSend_uncancellableOperationQueue(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1BEA35BBC;
  v16[3] = &unk_1E78301A8;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v19 = a4;
  v13 = v9;
  v14 = v8;
  objc_msgSend_addOperationWithBlock_(v12, v15, (uint64_t)v16);

}

- (void)clearCachesForZoneWithZoneID:(id)a3 databaseScope:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  const char *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  int64_t v19;

  v8 = a3;
  v9 = a5;
  objc_msgSend_uncancellableOperationQueue(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1BEA35CEC;
  v16[3] = &unk_1E78301A8;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v19 = a4;
  v13 = v9;
  v14 = v8;
  objc_msgSend_addOperationWithBlock_(v12, v15, (uint64_t)v16);

}

- (void)fetchPCSFromCacheForZoneWithZoneID:(id)a3 databaseScope:(int64_t)a4 localCacheOnly:(BOOL)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  const char *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  int64_t v21;
  BOOL v22;

  v10 = a3;
  v11 = a6;
  objc_msgSend_uncancellableOperationQueue(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = sub_1BEA35E04;
  v18[3] = &unk_1E78301D0;
  v18[4] = self;
  v19 = v10;
  v22 = a5;
  v20 = v11;
  v21 = a4;
  v15 = v11;
  v16 = v10;
  objc_msgSend_addOperationWithBlock_(v14, v17, (uint64_t)v18);

}

- (void)fetchPCSFromCacheForShareWithRecordID:(id)a3 databaseScope:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  const char *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  int64_t v19;

  v8 = a3;
  v9 = a5;
  objc_msgSend_uncancellableOperationQueue(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1BEA35FA0;
  v16[3] = &unk_1E78301A8;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v19 = a4;
  v13 = v9;
  v14 = v8;
  objc_msgSend_addOperationWithBlock_(v12, v15, (uint64_t)v16);

}

- (void)fetchPCSFromCacheForRecordWithRecordID:(id)a3 databaseScope:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  const char *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  int64_t v19;

  v8 = a3;
  v9 = a5;
  objc_msgSend_uncancellableOperationQueue(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1BEA36138;
  v16[3] = &unk_1E78301A8;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v19 = a4;
  v13 = v9;
  v14 = v8;
  objc_msgSend_addOperationWithBlock_(v12, v15, (uint64_t)v16);

}

- (void)clearInvalidatedPCSCacheEntriesIfNeeded
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[5];
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v3 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v8 = v3;
    objc_msgSend_containerID(self, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v14 = v11;
    _os_log_debug_impl(&dword_1BE990000, v8, OS_LOG_TYPE_DEBUG, "Clearing the persisted PCS cache for container %@", buf, 0xCu);

  }
  objc_msgSend_uncancellableOperationQueue(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1BEA36350;
  v12[3] = &unk_1E782EA40;
  v12[4] = self;
  objc_msgSend_addOperationWithBlock_(v6, v7, (uint64_t)v12);

}

- (void)getOutstandingOperationCountWithCompletionHandler:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  id v8;
  const char *v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  objc_msgSend_uncancellableOperationQueue(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1BEA36454;
  v10[3] = &unk_1E782F4D0;
  v10[4] = self;
  v11 = v4;
  v8 = v4;
  objc_msgSend_addOperationWithBlock_(v7, v9, (uint64_t)v10);

}

- (void)dropDetachedContainersWithCompletionHandler:(id)a3
{
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  CKDSPIContainer *v29;
  void *v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  id v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  NSObject *v43;
  id v44;
  uint64_t v45;
  int isEqual;
  uint64_t v47;
  _QWORD block[4];
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v44 = a3;
  objc_msgSend_sharedDetachedContainers(CKDContainer, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allObjects(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v10 = v9;
  v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v50, v54, 16);
  if (v12)
  {
    v15 = v12;
    v16 = *(_QWORD *)v51;
    v45 = *(_QWORD *)v51;
    do
    {
      v17 = 0;
      v47 = v15;
      do
      {
        if (*(_QWORD *)v51 != v16)
          objc_enumerationMutation(v10);
        v18 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v17);
        objc_msgSend_appContainerTuple(v18, v13, v14);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_appContainerTuple(self, v20, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend_isEqual_(v19, v23, (uint64_t)v22) & 1) != 0)
        {
          objc_msgSend_entitlements(v18, v24, v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_entitlements(self, v27, v28);
          v29 = self;
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend_isEqual_(v26, v31, (uint64_t)v30))
          {
            objc_msgSend_options(v18, v32, v33);
            v34 = v10;
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_options(self, v36, v37);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            isEqual = objc_msgSend_isEqual_(v35, v39, (uint64_t)v38);

            v10 = v34;
            v16 = v45;

            self = v29;
            v15 = v47;
            if (!isEqual)
              goto LABEL_13;
            objc_msgSend_sharedDetachedContainers(CKDContainer, v13, v14);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_removeObject_(v19, v40, (uint64_t)v18);
          }
          else
          {

            v15 = v47;
          }
        }
        else
        {

        }
LABEL_13:
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v50, v54, 16);
    }
    while (v15);
  }

  if (v44)
  {
    objc_msgSend_cancellationQueue(self, v41, v42);
    v43 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1BEA369C4;
    block[3] = &unk_1E782EFD8;
    v49 = v44;
    dispatch_async(v43, block);

  }
}

- (void)resetAllApplicationPermissionsWithCompletionHandler:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const char *v9;
  CKDResetUserPrivacySettingsOperation *v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  id v15;
  const char *v16;
  const char *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id from;

  v4 = a3;
  objc_msgSend_defaultConvenienceOperationConfiguration(MEMORY[0x1E0C94F80], v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_opt_new();
  objc_msgSend_setResolvedConfiguration_(v8, v9, (uint64_t)v7);
  v10 = [CKDResetUserPrivacySettingsOperation alloc];
  objc_msgSend_containerForOperationInfo_(self, v11, (uint64_t)v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend_initWithOperationInfo_container_(v10, v13, (uint64_t)v8, v12);

  from = 0;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = sub_1BEA36B30;
  v18[3] = &unk_1E782EC40;
  objc_copyWeak(&v20, &from);
  v15 = v4;
  v19 = v15;
  objc_msgSend_setCompletionBlock_(v14, v16, (uint64_t)v18);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v17, (uint64_t)v14, 0);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&from);

}

- (void)statusGroupsForApplicationPermission:(unint64_t)a3 completionHandler:(id)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v10;
  CKDBatchFetchUserPrivacySettingsOperation *v11;
  const char *v12;
  void *v13;
  const char *v14;
  void *v15;
  id v16;
  const char *v17;
  const char *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id location;

  v5 = a4;
  objc_msgSend_defaultConvenienceOperationConfiguration(MEMORY[0x1E0C94F80], v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_opt_new();
  objc_msgSend_setResolvedConfiguration_(v9, v10, (uint64_t)v8);
  v11 = [CKDBatchFetchUserPrivacySettingsOperation alloc];
  objc_msgSend_containerForOperationInfo_(self, v12, (uint64_t)v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend_initWithOperationInfo_container_(v11, v14, (uint64_t)v9, v13);

  objc_initWeak(&location, v15);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = sub_1BEA36D64;
  v19[3] = &unk_1E782EC40;
  objc_copyWeak(&v21, &location);
  v16 = v5;
  v20 = v16;
  objc_msgSend_setCompletionBlock_(v15, v17, (uint64_t)v19);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v18, (uint64_t)v15, 0);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

- (void)clearContainerFromMetadataCache
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  id v11;

  objc_msgSend_deviceContext(self, a2, v2);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_metadataCache(v11, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerID(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeContainerID_(v6, v10, (uint64_t)v9);

}

- (void)clearPILSCacheForLookupInfos:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  id v12;

  v4 = a3;
  objc_msgSend_backgroundPublicIdentityLookupService(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeCacheForLookupInfos_(v7, v8, (uint64_t)v4);

  objc_msgSend_foregroundPublicIdentityLookupService(self, v9, v10);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeCacheForLookupInfos_(v12, v11, (uint64_t)v4);

}

- (void)representativeDataclassEnabledWithCompletionHandler:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  id v8;
  const char *v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  objc_msgSend_uncancellableOperationQueue(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1BEA36F90;
  v10[3] = &unk_1E782F4D0;
  v10[4] = self;
  v11 = v4;
  v8 = v4;
  objc_msgSend_addOperationWithBlock_(v7, v9, (uint64_t)v10);

}

- (void)getRecordPCSDiagnosticsForZonesWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  const char *v7;
  CKDFetchRecordPCSDiagnosticsOperation *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  id v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  id v21;
  id buf[2];

  v4 = a3;
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v5 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1BE990000, v5, OS_LOG_TYPE_INFO, "Getting Record PCS diagnostics for all zones", (uint8_t *)buf, 2u);
  }
  v6 = (void *)objc_opt_new();
  objc_msgSend_setDatabaseScope_(v6, v7, 2);
  v8 = [CKDFetchRecordPCSDiagnosticsOperation alloc];
  objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(buf, v12);
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = sub_1BEA37254;
  v19 = &unk_1E7830220;
  v13 = v4;
  v20 = v13;
  objc_copyWeak(&v21, buf);
  objc_msgSend_setCompletionBlock_(v12, v14, (uint64_t)&v16);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v15, (uint64_t)v12, 0, v16, v17, v18, v19);
  objc_destroyWeak(&v21);

  objc_destroyWeak(buf);
}

- (void)tossConfigWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  id v9;
  const char *v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[16];

  v4 = a3;
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v5 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE990000, v5, OS_LOG_TYPE_INFO, "Tossing client configuration", buf, 2u);
  }
  objc_msgSend_uncancellableOperationQueue(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1BEA373B4;
  v11[3] = &unk_1E782F4D0;
  v11[4] = self;
  v12 = v4;
  v9 = v4;
  objc_msgSend_addOperationWithBlock_(v8, v10, (uint64_t)v11);

}

- (void)lastKnownDeviceCountWithCompletionHandler:(id)a3
{
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  uint64_t KnownDeviceCount;
  void (**v11)(id, uint64_t);

  v11 = (void (**)(id, uint64_t))a3;
  objc_msgSend_accountOrNil(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6;
  if (v6)
    KnownDeviceCount = objc_msgSend_lastKnownDeviceCount(v6, v7, v8);
  else
    KnownDeviceCount = 0;
  v11[2](v11, KnownDeviceCount);

}

- (void)setFakeError:(id)a3 forNextRequestOfClassName:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  void *v29;
  id v30;
  void *v31;
  const char *v32;
  void *v33;
  const char *v34;
  id v35;

  v35 = a4;
  v8 = a5;
  v9 = a3;
  objc_msgSend_fakeErrorsByClassName(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v15 = (void *)objc_opt_new();
    objc_msgSend_setFakeErrorsByClassName_(self, v16, (uint64_t)v15);

  }
  objc_msgSend_fakeErrorsByClassName(self, v13, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v17, v18, (uint64_t)v35);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    v22 = (void *)objc_opt_new();
    objc_msgSend_fakeErrorsByClassName(self, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v25, v26, (uint64_t)v22, v35);

  }
  objc_msgSend_fakeErrorsByClassName(self, v20, v21);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v27, v28, (uint64_t)v35);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_alloc(MEMORY[0x1E0C951F8]);
  v31 = _Block_copy(v8);

  v33 = (void *)objc_msgSend_initWithObject1_object2_(v30, v32, (uint64_t)v9, v31);
  objc_msgSend_addObject_(v29, v34, (uint64_t)v33);

}

- (void)setFakeResponseOperationResult:(id)a3 forNextRequestOfClassName:(id)a4 forItemID:(id)a5 withLifetime:(int)a6 completionHandler:(id)a7
{
  uint64_t v8;
  id v13;
  id v14;
  const char *v15;
  uint64_t v16;
  id v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  void *v28;
  const char *v29;
  void *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  id v36;
  void *v37;
  const char *v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  void *v44;
  const char *v45;
  const char *v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  void *v52;
  const char *v53;
  id v54;

  v8 = *(_QWORD *)&a6;
  v54 = a3;
  v13 = a4;
  v14 = a5;
  v17 = a7;
  if ((int)v8 <= 0)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v15, v16);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v52, v53, (uint64_t)a2, self, CFSTR("CKDContainer.m"), 4498, CFSTR("Invalid fake response lifetime"));

  }
  objc_msgSend_fakeResponseOperationResultByClassNameByItemID(self, v15, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    v21 = (void *)objc_opt_new();
    objc_msgSend_setFakeResponseOperationResultByClassNameByItemID_(self, v22, (uint64_t)v21);

  }
  objc_msgSend_fakeResponseOperationLifetimeByClassName(self, v19, v20);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23)
  {
    v26 = (void *)objc_opt_new();
    objc_msgSend_setFakeResponseOperationLifetimeByClassName_(self, v27, (uint64_t)v26);

  }
  objc_msgSend_fakeResponseOperationResultByClassNameByItemID(self, v24, v25);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v28, v29, (uint64_t)v13);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v30)
  {
    v31 = (void *)objc_opt_new();
    objc_msgSend_fakeResponseOperationResultByClassNameByItemID(self, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v34, v35, (uint64_t)v31, v13);

  }
  v36 = objc_alloc(MEMORY[0x1E0C951F8]);
  v37 = _Block_copy(v17);
  v39 = (void *)objc_msgSend_initWithObject1_object2_(v36, v38, (uint64_t)v54, v37);
  objc_msgSend_fakeResponseOperationResultByClassNameByItemID(self, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v42, v43, (uint64_t)v13);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v44, v45, (uint64_t)v39, v14);

  objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v46, v8);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fakeResponseOperationLifetimeByClassName(self, v48, v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v50, v51, (uint64_t)v47, v13);

}

@end

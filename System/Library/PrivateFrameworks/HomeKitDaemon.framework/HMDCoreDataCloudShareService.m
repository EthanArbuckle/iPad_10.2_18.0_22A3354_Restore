@implementation HMDCoreDataCloudShareService

- (HMDCoreDataCloudShareService)initWithContainer:(id)a3 sharedStore:(id)a4 privateStore:(id)a5 moc:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HMDCoreDataCloudShareService *v15;
  HMDCoreDataCloudShareService *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HMDCoreDataCloudShareService;
  v15 = -[HMDCoreDataCloudShareService init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v15->_container, a3);
    objc_storeStrong((id *)&v16->_sharedStore, a4);
    objc_storeStrong((id *)&v16->_privateStore, a5);
    objc_storeStrong((id *)&v16->_managedObjectContext, a6);
  }

  return v16;
}

- (id)ckContainer
{
  os_unfair_lock_s *p_lock;
  CKContainer *ckContainer;
  id v5;
  void *v6;
  CKContainer *v7;
  CKContainer *v8;
  CKContainer *v9;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  ckContainer = self->_ckContainer;
  if (!ckContainer)
  {
    v5 = objc_alloc_init(MEMORY[0x24BDB9048]);
    objc_msgSend(v5, "setUseZoneWidePCS:", 1);
    objc_msgSend(MEMORY[0x24BDB9030], "containerIDForContainerIdentifier:", CFSTR("com.apple.homekit.config"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (CKContainer *)objc_msgSend(objc_alloc(MEMORY[0x24BDB9030]), "initWithContainerID:options:", v6, v5);
    v8 = self->_ckContainer;
    self->_ckContainer = v7;

    ckContainer = self->_ckContainer;
  }
  v9 = ckContainer;
  os_unfair_lock_unlock(p_lock);
  return v9;
}

- (id)grantAccessForUserWithAccountHandle:(id)a3 share:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDManagedObjectContext *managedObjectContext;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[5];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x24BE3F180];
  managedObjectContext = self->_managedObjectContext;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __74__HMDCoreDataCloudShareService_grantAccessForUserWithAccountHandle_share___block_invoke;
  v14[3] = &unk_24E796FD8;
  v14[4] = self;
  v15 = v6;
  v16 = v7;
  v10 = v7;
  v11 = v6;
  objc_msgSend(v8, "inContext:perform:", managedObjectContext, v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)revokeAccessForUserWithAccountHandle:(id)a3 share:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDManagedObjectContext *managedObjectContext;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[5];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x24BE3F180];
  managedObjectContext = self->_managedObjectContext;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __75__HMDCoreDataCloudShareService_revokeAccessForUserWithAccountHandle_share___block_invoke;
  v14[3] = &unk_24E796FD8;
  v14[4] = self;
  v15 = v6;
  v16 = v7;
  v10 = v7;
  v11 = v6;
  objc_msgSend(v8, "inContext:perform:", managedObjectContext, v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)auditUsersForRevokedAccessWithAccountHandles:(id)a3 share:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDManagedObjectContext *managedObjectContext;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[5];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x24BE3F180];
  managedObjectContext = self->_managedObjectContext;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __83__HMDCoreDataCloudShareService_auditUsersForRevokedAccessWithAccountHandles_share___block_invoke;
  v14[3] = &unk_24E796FD8;
  v14[4] = self;
  v15 = v6;
  v16 = v7;
  v10 = v7;
  v11 = v6;
  objc_msgSend(v8, "inContext:perform:", managedObjectContext, v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)_acceptShareInvitationsFromMetadata:(id)a3 intoPersistentStore:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDCoreDataCloudShareService *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v14;
    v26 = 2112;
    v27 = v8;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Accepting share invitations from metadata: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v11);
  objc_initWeak((id *)buf, v12);
  -[HMDCoreDataCloudShareService container](v12, "container");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __99__HMDCoreDataCloudShareService__acceptShareInvitationsFromMetadata_intoPersistentStore_completion___block_invoke;
  v19[3] = &unk_24E7752C0;
  objc_copyWeak(&v23, (id *)buf);
  v16 = v10;
  v22 = v16;
  v17 = v8;
  v20 = v17;
  v18 = v9;
  v21 = v18;
  objc_msgSend(v15, "acceptShareInvitationsFromMetadata:intoPersistentStore:completion:", v17, v18, v19);

  objc_destroyWeak(&v23);
  objc_destroyWeak((id *)buf);

}

- (id)acceptShareInvitationsFromMetadata:(id)a3 intoPersistentStore:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;
  id v16;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  objc_msgSend(MEMORY[0x24BE3F180], "futureWithPromise:", &v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __87__HMDCoreDataCloudShareService_acceptShareInvitationsFromMetadata_intoPersistentStore___block_invoke;
  v11[3] = &unk_24E79AD48;
  objc_copyWeak(&v14, &location);
  v12 = v16;
  v9 = v6;
  v13 = v9;
  -[HMDCoreDataCloudShareService _acceptShareInvitationsFromMetadata:intoPersistentStore:completion:](self, "_acceptShareInvitationsFromMetadata:intoPersistentStore:completion:", v9, v7, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v8;
}

- (id)_acceptShareInvitation:(id)a3
{
  void *v4;
  HMDManagedObjectContext *managedObjectContext;
  void *v6;
  void *v7;
  _QWORD v9[5];

  -[HMDCoreDataCloudShareService _fetchShareMetadataForInvitation:](self, "_fetchShareMetadataForInvitation:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  managedObjectContext = self->_managedObjectContext;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __55__HMDCoreDataCloudShareService__acceptShareInvitation___block_invoke;
  v9[3] = &unk_24E7752E8;
  v9[4] = self;
  objc_msgSend(v4, "inContext:then:", managedObjectContext, v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "then:", &__block_literal_global_30);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)acceptShareInvitation:(id)a3
{
  id v4;
  void *v5;
  HMDManagedObjectContext *managedObjectContext;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BE3F180];
  managedObjectContext = self->_managedObjectContext;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __54__HMDCoreDataCloudShareService_acceptShareInvitation___block_invoke;
  v10[3] = &unk_24E79B238;
  v10[4] = self;
  v11 = v4;
  v7 = v4;
  objc_msgSend(v5, "inContext:perform:", managedObjectContext, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_grantAccessForUserWithAccountHandle:(id)a3 share:(id)a4
{
  id v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void *v8;
  HMDCoreDataCloudShareService *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void *v20;
  _QWORD v22[5];
  id v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  _QWORD v25[5];
  id v26;
  _QWORD *v27;
  _QWORD v28[7];
  _QWORD v29[5];
  id v30;
  _BYTE *v31;
  _QWORD v32[5];
  id v33;
  _BYTE buf[24];
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (uint64_t (*)(uint64_t, uint64_t))a4;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v11;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 2112;
    v35 = v7;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Granting access for user with account handle %@ to share: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v35 = __Block_byref_object_copy__10204;
  v36 = __Block_byref_object_dispose__10205;
  v37 = 0;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__10204;
  v32[4] = __Block_byref_object_dispose__10205;
  v33 = 0;
  objc_msgSend(v7, "recordID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCoreDataCloudShareService fetchShareWithRecordID:](v9, "fetchShareWithRecordID:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x24BDAC760];
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __75__HMDCoreDataCloudShareService__grantAccessForUserWithAccountHandle_share___block_invoke;
  v29[3] = &unk_24E775330;
  v31 = buf;
  v29[4] = v9;
  v15 = v6;
  v30 = v15;
  objc_msgSend(v13, "then:", v29);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v14;
  v28[1] = 3221225472;
  v28[2] = __75__HMDCoreDataCloudShareService__grantAccessForUserWithAccountHandle_share___block_invoke_2;
  v28[3] = &unk_24E775380;
  v28[5] = v32;
  v28[6] = buf;
  v28[4] = v9;
  objc_msgSend(v16, "then:", v28);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v14;
  v25[1] = 3221225472;
  v25[2] = __75__HMDCoreDataCloudShareService__grantAccessForUserWithAccountHandle_share___block_invoke_2_34;
  v25[3] = &unk_24E775330;
  v27 = v32;
  v25[4] = v9;
  v26 = v15;
  v22[0] = v14;
  v22[1] = 3221225472;
  v22[2] = __75__HMDCoreDataCloudShareService__grantAccessForUserWithAccountHandle_share___block_invoke_36;
  v22[3] = &unk_24E796B70;
  v22[4] = v9;
  v18 = v26;
  v23 = v18;
  v19 = v7;
  v24 = v19;
  objc_msgSend(v17, "then:orRecover:", v25, v22);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(v32, 8);
  _Block_object_dispose(buf, 8);

  return v20;
}

- (id)_revokeAccessForUserWithAccountHandle:(id)a3 share:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, void *);
  void *v20;
  HMDCoreDataCloudShareService *v21;
  id v22;
  _QWORD *v23;
  _QWORD v24[5];
  id v25;
  _QWORD *v26;
  _QWORD v27[5];
  id v28;

  v6 = a3;
  v7 = a4;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__10204;
  v27[4] = __Block_byref_object_dispose__10205;
  v28 = 0;
  objc_msgSend(v7, "recordID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCoreDataCloudShareService fetchShareWithRecordID:](self, "fetchShareWithRecordID:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __76__HMDCoreDataCloudShareService__revokeAccessForUserWithAccountHandle_share___block_invoke;
  v24[3] = &unk_24E775330;
  v26 = v27;
  v24[4] = self;
  v11 = v6;
  v25 = v11;
  objc_msgSend(v9, "then:", v24);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v10;
  v18 = 3221225472;
  v19 = __76__HMDCoreDataCloudShareService__revokeAccessForUserWithAccountHandle_share___block_invoke_2;
  v20 = &unk_24E7753A8;
  v23 = v27;
  v21 = self;
  v13 = v7;
  v22 = v13;
  objc_msgSend(v12, "then:", &v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "then:", &__block_literal_global_39, v17, v18, v19, v20, v21);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(v27, 8);
  return v15;
}

- (id)_auditUsersForRevokedAccessWithAccountHandles:(id)a3 share:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  HMDCoreDataCloudShareService *v19;
  _QWORD *v20;
  _QWORD v21[5];
  id v22;
  _QWORD *v23;
  _QWORD v24[5];
  id v25;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x3032000000;
    v24[3] = __Block_byref_object_copy__10204;
    v24[4] = __Block_byref_object_dispose__10205;
    v25 = 0;
    objc_msgSend(v7, "recordID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCoreDataCloudShareService fetchShareWithRecordID:](self, "fetchShareWithRecordID:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x24BDAC760];
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __84__HMDCoreDataCloudShareService__auditUsersForRevokedAccessWithAccountHandles_share___block_invoke;
    v21[3] = &unk_24E775330;
    v23 = v24;
    v21[4] = self;
    v11 = v6;
    v22 = v11;
    objc_msgSend(v9, "then:", v21);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v10;
    v17[1] = 3221225472;
    v17[2] = __84__HMDCoreDataCloudShareService__auditUsersForRevokedAccessWithAccountHandles_share___block_invoke_2;
    v17[3] = &unk_24E775410;
    v19 = self;
    v20 = v24;
    v18 = v11;
    objc_msgSend(v12, "then:", v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(v24, 8);
  }
  else
  {
    v14 = (void *)MEMORY[0x24BE3F180];
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "futureWithError:", v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

- (id)_addParticipant:(id)a3 share:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDCoreDataCloudShareService *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v11;
    v16 = 2112;
    v17 = v6;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Adding participant %@ to share", (uint8_t *)&v14, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend(v7, "addParticipant:", v6);
  -[HMDCoreDataCloudShareService _pushUpdatedShare:](v9, "_pushUpdatedShare:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_removeParticipant:(id)a3 share:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDCoreDataCloudShareService *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  HMDCoreDataCloudShareService *v13;
  NSObject *v14;
  void *v15;
  HMDAssertionLogEvent *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  HMDCoreDataCloudShareService *v22;
  NSObject *v23;
  void *v24;
  HMDAssertionLogEvent *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  id v39;
  void *v40;
  HMDCoreDataCloudShareService *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  HMDCoreDataCloudShareService *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  HMDAssertionLogEvent *v50;
  void *v51;
  HMDAssertionLogEvent *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint8_t buf[4];
  void *v65;
  __int16 v66;
  uint64_t v67;
  __int16 v68;
  id v69;
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v65 = v11;
    v66 = 2112;
    v67 = (uint64_t)v6;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Removing participant %@ from share", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  if (objc_msgSend(v6, "role") == 1)
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = v9;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v65 = v15;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Cannot remove participant from share: Cannot remove the owner from a share", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
    v16 = -[HMDAssertionLogEvent initWithReason:]([HMDAssertionLogEvent alloc], "initWithReason:", CFSTR("Cannot remove participant from share: Cannot remove the owner from a share"));
    +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "submitLogEvent:", v16);

    v18 = (void *)MEMORY[0x24BE3F180];
    v19 = (void *)MEMORY[0x24BDD1540];
    v20 = CFSTR("Cannot remove the owner from a share");
LABEL_11:
    objc_msgSend(v19, "hmfErrorWithCode:reason:", 5, v20);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "futureWithError:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_12;
  }
  if (objc_msgSend(v6, "isCurrentUser"))
  {
    v21 = (void *)MEMORY[0x227676638]();
    v22 = v9;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v65 = v24;
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Cannot remove participant from share: Cannot remove the current user from the share", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v21);
    v25 = -[HMDAssertionLogEvent initWithReason:]([HMDAssertionLogEvent alloc], "initWithReason:", CFSTR("Cannot remove participant from share: Cannot remove the current user from the share"));
    +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "submitLogEvent:", v25);

    v18 = (void *)MEMORY[0x24BE3F180];
    v19 = (void *)MEMORY[0x24BDD1540];
    v20 = CFSTR("Cannot remove the current user from the share");
    goto LABEL_11;
  }
  objc_msgSend(v7, "currentUserParticipant");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v30, "role") == 1)
  {

  }
  else
  {
    objc_msgSend(v7, "currentUserParticipant");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "role");

    if (v32 != 2)
    {
      v44 = (void *)MEMORY[0x227676638]();
      v45 = v9;
      HMFGetOSLogHandle();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT))
      {
        HMFGetLogIdentifier();
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "currentUserParticipant");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = objc_msgSend(v48, "role");
        *(_DWORD *)buf = 138543618;
        v65 = v47;
        v66 = 2048;
        v67 = v49;
        _os_log_impl(&dword_2218F0000, v46, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Current user participant with non-owner role %ld cannot remove participants from a share", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v44);
      v50 = [HMDAssertionLogEvent alloc];
      objc_msgSend(v7, "currentUserParticipant");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = -[HMDAssertionLogEvent initWithReason:](v50, "initWithReason:", CFSTR("Current user participant with non-owner role %ld cannot remove participants from a share"), objc_msgSend(v51, "role"));

      +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "submitLogEvent:", v52);

      v54 = (void *)MEMORY[0x24BE3F180];
      v55 = (void *)MEMORY[0x24BDD1540];
      v56 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v7, "currentUserParticipant");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "stringWithFormat:", CFSTR("Current user participant with non-owner role %ld cannot remove participants from a share"), objc_msgSend(v57, "role"));
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "hmfErrorWithCode:reason:", 5, v58);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "futureWithError:", v59);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_12;
    }
  }
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  objc_msgSend(v7, "participants");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v61;
LABEL_18:
    v37 = 0;
    while (1)
    {
      if (*(_QWORD *)v61 != v36)
        objc_enumerationMutation(v33);
      v38 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v37);
      if ((objc_msgSend(v6, "isEqual:", v38) & 1) != 0)
        break;
      if (v35 == ++v37)
      {
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
        if (v35)
          goto LABEL_18;
        goto LABEL_24;
      }
    }
    v39 = v38;

    if (!v39)
      goto LABEL_27;
    objc_msgSend(v7, "removeParticipant:", v39);
    -[HMDCoreDataCloudShareService _pushUpdatedShare:](v9, "_pushUpdatedShare:", v7);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_24:

LABEL_27:
    v40 = (void *)MEMORY[0x227676638]();
    v41 = v9;
    HMFGetOSLogHandle();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v65 = v43;
      v66 = 2112;
      v67 = (uint64_t)v6;
      v68 = 2112;
      v69 = v7;
      _os_log_impl(&dword_2218F0000, v42, OS_LOG_TYPE_INFO, "%{public}@Didn't find requested participant %@ on share %@. Considering this success", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v40);
    objc_msgSend(MEMORY[0x24BE3F180], "futureWithValue:", v7);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_12:

  return v28;
}

- (id)_fetchParticipantsForAccountHandles:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  HMDCoreDataCloudShareService *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  HMDCoreDataCloudShareService *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  __int128 v29;
  void *v30;
  _QWORD v32[5];
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE buf[12];
  __int16 v40;
  void *v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
  v30 = v4;
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v36;
    *(_QWORD *)&v7 = 138543618;
    v29 = v7;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v36 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v11, "cloudKitLookupInfo", v29);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, v12);
        }
        else
        {
          if (objc_msgSend(v5, "count") == 1)
          {
            v26 = (void *)MEMORY[0x24BE3F180];
            objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 27);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "futureWithError:", v27);
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_20;
          }
          v13 = (void *)MEMORY[0x227676638]();
          v14 = self;
          HMFGetOSLogHandle();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v29;
            *(_QWORD *)&buf[4] = v16;
            v40 = 2112;
            v41 = v11;
            _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Skipping user with handle %@ due to missing cloudkit lookup info", buf, 0x16u);

            v4 = v30;
          }

          objc_autoreleasePoolPop(v13);
        }

      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
      if (v8)
        continue;
      break;
    }
  }

  if (objc_msgSend(v4, "count"))
  {
    v17 = (void *)MEMORY[0x227676638]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "allKeys");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v20;
      v40 = 2112;
      v41 = v21;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Fetching share participants using lookup infos: %@", buf, 0x16u);

      v4 = v30;
    }

    objc_autoreleasePoolPop(v17);
    *(_QWORD *)buf = 0;
    objc_msgSend(MEMORY[0x24BE3F180], "futureWithPromise:", buf);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCoreDataCloudShareService container](v18, "container");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allKeys");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCoreDataCloudShareService privateStore](v18, "privateStore");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __68__HMDCoreDataCloudShareService__fetchParticipantsForAccountHandles___block_invoke;
    v32[3] = &unk_24E7993D8;
    v32[4] = v18;
    v33 = v30;
    v34 = *(id *)buf;
    objc_msgSend(v23, "fetchParticipantsMatchingLookupInfos:intoPersistentStore:completion:", v24, v25, v32);

    v4 = v30;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE3F180], "futureWithValue:", MEMORY[0x24BDBD1B8]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_20:

  return v22;
}

- (id)_fetchParticipantForAccountHandle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  HMDCoreDataCloudShareService *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v14[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCoreDataCloudShareService _fetchParticipantsForAccountHandles:](self, "_fetchParticipantsForAccountHandles:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __66__HMDCoreDataCloudShareService__fetchParticipantForAccountHandle___block_invoke;
    v11[3] = &unk_24E797CF0;
    v12 = v5;
    v13 = self;
    objc_msgSend(v7, "then:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = (void *)MEMORY[0x24BE3F180];
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 27);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "futureWithError:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (void)_fetchShareWithRecordID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  HMDCoreDataCloudShareService *v16;
  NSObject *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(id *, void *, void *);
  void *v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id location;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  id v36;
  __int16 v37;
  void *v38;
  _QWORD v39[3];

  v39[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BDB9188]);
  objc_msgSend(v8, "setQualityOfService:", 17);
  v9 = objc_alloc(MEMORY[0x24BDB90E8]);
  v39[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v39, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithRecordIDs:", v10);

  objc_msgSend(v11, "setConfiguration:", v8);
  objc_initWeak(&location, self);
  v12 = MEMORY[0x24BDAC760];
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __67__HMDCoreDataCloudShareService__fetchShareWithRecordID_completion___block_invoke;
  v30[3] = &unk_24E775438;
  v22 = &v31;
  objc_copyWeak(&v31, &location);
  objc_msgSend(v11, "setPerRecordCompletionBlock:", v30);
  v23 = v12;
  v24 = 3221225472;
  v25 = __67__HMDCoreDataCloudShareService__fetchShareWithRecordID_completion___block_invoke_59;
  v26 = &unk_24E775460;
  objc_copyWeak(&v29, &location);
  v13 = v7;
  v28 = v13;
  v14 = v6;
  v27 = v14;
  v15 = (void *)MEMORY[0x227676638](objc_msgSend(v11, "setFetchRecordsCompletionBlock:", &v23));
  v16 = self;
  HMFGetOSLogHandle();
  v17 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "operationID", &v31, v23, v24, v25, v26);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v34 = v18;
    v35 = 2112;
    v36 = v14;
    v37 = 2112;
    v38 = v19;
    _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Fetching share with record ID: %@ (operationID: %@)", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v15);
  -[HMDCoreDataCloudShareService ckContainer](v16, "ckContainer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "privateCloudDatabase");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addOperation:", v11);

  objc_destroyWeak(&v29);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);

}

- (id)fetchShareWithRecordID:(id)a3
{
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;
  id v11;

  v4 = a3;
  v11 = 0;
  objc_msgSend(MEMORY[0x24BE3F180], "futureWithPromise:", &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __55__HMDCoreDataCloudShareService_fetchShareWithRecordID___block_invoke;
  v7[3] = &unk_24E775488;
  objc_copyWeak(&v9, &location);
  v8 = v11;
  -[HMDCoreDataCloudShareService _fetchShareWithRecordID:completion:](self, "_fetchShareWithRecordID:completion:", v4, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v5;
}

- (void)_pushUpdatedShare:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  HMDCoreDataCloudShareService *v16;
  NSObject *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(id *, void *, void *, void *);
  void *v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id location;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  id v36;
  __int16 v37;
  void *v38;
  _QWORD v39[3];

  v39[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BDB9188]);
  objc_msgSend(v8, "setQualityOfService:", 17);
  v9 = objc_alloc(MEMORY[0x24BDB9158]);
  v39[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v39, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithRecordsToSave:recordIDsToDelete:", v10, 0);

  objc_msgSend(v11, "setConfiguration:", v8);
  objc_initWeak(&location, self);
  v12 = MEMORY[0x24BDAC760];
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __61__HMDCoreDataCloudShareService__pushUpdatedShare_completion___block_invoke;
  v30[3] = &unk_24E7754B0;
  v22 = &v31;
  objc_copyWeak(&v31, &location);
  objc_msgSend(v11, "setPerRecordCompletionBlock:", v30);
  v23 = v12;
  v24 = 3221225472;
  v25 = __61__HMDCoreDataCloudShareService__pushUpdatedShare_completion___block_invoke_66;
  v26 = &unk_24E7754D8;
  objc_copyWeak(&v29, &location);
  v13 = v7;
  v28 = v13;
  v14 = v6;
  v27 = v14;
  v15 = (void *)MEMORY[0x227676638](objc_msgSend(v11, "setModifyRecordsCompletionBlock:", &v23));
  v16 = self;
  HMFGetOSLogHandle();
  v17 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "operationID", &v31, v23, v24, v25, v26);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v34 = v18;
    v35 = 2112;
    v36 = v14;
    v37 = 2112;
    v38 = v19;
    _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Pushing updated share %@ (operationID: %@)", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v15);
  -[HMDCoreDataCloudShareService ckContainer](v16, "ckContainer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "privateCloudDatabase");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addOperation:", v11);

  objc_destroyWeak(&v29);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);

}

- (id)_pushUpdatedShare:(id)a3
{
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;
  id v11;

  v4 = a3;
  v11 = 0;
  objc_msgSend(MEMORY[0x24BE3F180], "futureWithPromise:", &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __50__HMDCoreDataCloudShareService__pushUpdatedShare___block_invoke;
  v7[3] = &unk_24E775488;
  objc_copyWeak(&v9, &location);
  v8 = v11;
  -[HMDCoreDataCloudShareService _pushUpdatedShare:completion:](self, "_pushUpdatedShare:completion:", v4, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v5;
}

- (void)_fetchShareMetadataForInvitation:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  HMDCoreDataCloudShareService *v20;
  NSObject *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id location;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc(MEMORY[0x24BDB90F8]);
  objc_msgSend(v6, "content");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "content");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v8, "initWithShareURLs:invitationTokensByShareURL:", v10, v11);

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v14 = MEMORY[0x24BDAC760];
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __76__HMDCoreDataCloudShareService__fetchShareMetadataForInvitation_completion___block_invoke;
  v31[3] = &unk_24E775500;
  objc_copyWeak(&v33, &location);
  v15 = v13;
  v32 = v15;
  objc_msgSend(v12, "setPerShareMetadataBlock:", v31);
  v26[1] = 3221225472;
  v26[2] = __76__HMDCoreDataCloudShareService__fetchShareMetadataForInvitation_completion___block_invoke_71;
  v26[3] = &unk_24E796668;
  v26[0] = v14;
  objc_copyWeak(&v30, &location);
  v16 = v7;
  v29 = v16;
  v17 = v6;
  v27 = v17;
  v18 = v15;
  v28 = v18;
  v19 = (void *)MEMORY[0x227676638](objc_msgSend(v12, "setFetchShareMetadataCompletionBlock:", v26));
  v20 = self;
  HMFGetOSLogHandle();
  v21 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "url");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "operationID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v36 = v22;
    v37 = 2160;
    v38 = 1752392040;
    v39 = 2112;
    v40 = v23;
    v41 = 2112;
    v42 = v24;
    _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Fetching share metadata for invitation URL %{mask.hash}@ (operationID: %@)", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v19);
  -[HMDCoreDataCloudShareService ckContainer](v20, "ckContainer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addOperation:", v12);

  objc_destroyWeak(&v30);
  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);

}

- (id)_fetchShareMetadataForInvitation:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id location;
  id v13;

  v4 = a3;
  v13 = 0;
  objc_msgSend(MEMORY[0x24BE3F180], "futureWithPromise:", &v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __65__HMDCoreDataCloudShareService__fetchShareMetadataForInvitation___block_invoke;
  v8[3] = &unk_24E775528;
  objc_copyWeak(&v11, &location);
  v6 = v4;
  v9 = v6;
  v10 = v13;
  -[HMDCoreDataCloudShareService _fetchShareMetadataForInvitation:completion:](self, "_fetchShareMetadataForInvitation:completion:", v6, v8);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v5;
}

- (NSPersistentCloudKitContainer)container
{
  return (NSPersistentCloudKitContainer *)objc_getProperty(self, a2, 24, 1);
}

- (NSPersistentStore)sharedStore
{
  return (NSPersistentStore *)objc_getProperty(self, a2, 32, 1);
}

- (NSPersistentStore)privateStore
{
  return (NSPersistentStore *)objc_getProperty(self, a2, 40, 1);
}

- (HMDManagedObjectContext)managedObjectContext
{
  return (HMDManagedObjectContext *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
  objc_storeStrong((id *)&self->_privateStore, 0);
  objc_storeStrong((id *)&self->_sharedStore, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_ckContainer, 0);
}

void __65__HMDCoreDataCloudShareService__fetchShareMetadataForInvitation___block_invoke(id *a1, void *a2, void *a3)
{
  unint64_t v5;
  id v6;
  id WeakRetained;
  unint64_t v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v8 = (unint64_t)v6;
  v9 = (void *)v8;
  if (!(v5 | v8))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (v9)
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = WeakRetained;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[4], "url");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138544130;
      v16 = v13;
      v17 = 2160;
      v18 = 1752392040;
      v19 = 2112;
      v20 = v14;
      v21 = 2114;
      v22 = v9;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Fetching metadata for URL %{mask.hash}@ failed due to %{public}@", (uint8_t *)&v15, 0x2Au);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(a1[5], "rejectWithError:", v9);
  }
  else
  {
    objc_msgSend(a1[5], "fulfillWithValue:", v5);
  }

}

void __76__HMDCoreDataCloudShareService__fetchShareMetadataForInvitation_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v9)
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = WeakRetained;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138544130;
      v16 = v14;
      v17 = 2160;
      v18 = 1752392040;
      v19 = 2112;
      v20 = v7;
      v21 = 2114;
      v22 = v9;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Fetching metadata for URL %{mask.hash}@ failed due to %{public}@", (uint8_t *)&v15, 0x2Au);

    }
    objc_autoreleasePoolPop(v11);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);
  }

}

void __76__HMDCoreDataCloudShareService__fetchShareMetadataForInvitation_completion___block_invoke_71(id *a1, void *a2)
{
  id v3;
  id WeakRetained;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  double v12;
  dispatch_time_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD block[5];
  id v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  if (WeakRetained)
  {
    if (v3)
    {
      objc_msgSend(v3, "hmd_retryAfterCKError");
      v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x227676638]();
      v7 = WeakRetained;
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v5)
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1[4], "url");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544386;
          v27 = v10;
          v28 = 2160;
          v29 = 1752392040;
          v30 = 2112;
          v31 = v11;
          v32 = 2114;
          v33 = v5;
          v34 = 2112;
          v35 = v3;
          _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Retrying fetching share metadata for URL %{mask.hash}@ in %{public}@s due to error: %@", buf, 0x34u);

        }
        objc_autoreleasePoolPop(v6);
        objc_msgSend(v5, "doubleValue");
        v13 = dispatch_time(0, (uint64_t)(v12 * 1000000000.0));
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __76__HMDCoreDataCloudShareService__fetchShareMetadataForInvitation_completion___block_invoke_72;
        block[3] = &unk_24E79B440;
        block[4] = v7;
        v24 = a1[4];
        v25 = a1[6];
        dispatch_after(v13, MEMORY[0x24BDAC9B8], block);

        goto LABEL_19;
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[4], "url");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v27 = v20;
        v28 = 2160;
        v29 = 1752392040;
        v30 = 2112;
        v31 = v21;
        v32 = 2114;
        v33 = v3;
        _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch metadata for URL %{mask.hash}@ due to %{public}@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v6);
      v22 = _Block_copy(a1[6]);
      v19 = v22;
      if (v22)
        (*((void (**)(void *, _QWORD, id))v22 + 2))(v22, 0, v3);
    }
    else
    {
      v5 = (void (**)(_QWORD, _QWORD, _QWORD))_Block_copy(a1[6]);
      if (!v5)
      {
LABEL_19:

        goto LABEL_20;
      }
      objc_msgSend(a1[5], "firstObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, _QWORD))v5)[2](v5, v19, 0);
    }

    goto LABEL_19;
  }
  v14 = (void *)MEMORY[0x227676638]();
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v27 = v16;
    _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Lost self fetching share metadata", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v14);
  v17 = _Block_copy(a1[6]);
  v18 = v17;
  if (v17)
    (*((void (**)(void *, _QWORD, id))v17 + 2))(v17, 0, v3);

LABEL_20:
}

uint64_t __76__HMDCoreDataCloudShareService__fetchShareMetadataForInvitation_completion___block_invoke_72(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchShareMetadataForInvitation:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __50__HMDCoreDataCloudShareService__pushUpdatedShare___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v6)
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = WeakRetained;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v11;
      v16 = 2114;
      v17 = v6;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Fetching share failed with %{public}@", (uint8_t *)&v14, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(*(id *)(a1 + 32), "rejectWithError:", v6);
  }
  else
  {
    v12 = *(void **)(a1 + 32);
    if (v5)
    {
      objc_msgSend(v12, "fulfillWithValue:", v5);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "rejectWithError:", v13);

    }
  }

}

void __61__HMDCoreDataCloudShareService__pushUpdatedShare_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  const char *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint32_t v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = (void *)MEMORY[0x227676638]();
  v9 = WeakRetained;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v6)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543874;
      v18 = v12;
      v19 = 2112;
      v20 = v5;
      v21 = 2114;
      v22 = v6;
      v13 = "%{public}@Failed to push share %@: %{public}@";
      v14 = v11;
      v15 = OS_LOG_TYPE_ERROR;
      v16 = 32;
LABEL_6:
      _os_log_impl(&dword_2218F0000, v14, v15, v13, (uint8_t *)&v17, v16);

    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543618;
    v18 = v12;
    v19 = 2112;
    v20 = v5;
    v13 = "%{public}@Successfully pushed share: %@";
    v14 = v11;
    v15 = OS_LOG_TYPE_DEFAULT;
    v16 = 22;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v8);
}

void __61__HMDCoreDataCloudShareService__pushUpdatedShare_completion___block_invoke_66(id *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  double v21;
  dispatch_time_t v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  _QWORD block[5];
  id v46;
  id v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    if (v9)
    {
      v11 = (void *)MEMORY[0x227676638]();
      v12 = WeakRetained;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v49 = v14;
        v50 = 2114;
        v51 = v9;
        _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Push updated share operation failed: %{public}@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v11);
      objc_msgSend(v9, "hmd_retryAfterCKError");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v16 = (id)v15;
        v17 = (void *)MEMORY[0x227676638]();
        v18 = v12;
        HMFGetOSLogHandle();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v49 = v20;
          v50 = 2114;
          v51 = v16;
          _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Retrying pushing updated share in %{public}@s", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v17);
        objc_msgSend(v16, "doubleValue");
        v22 = dispatch_time(0, (uint64_t)(v21 * 1000000000.0));
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __61__HMDCoreDataCloudShareService__pushUpdatedShare_completion___block_invoke_67;
        block[3] = &unk_24E79B440;
        block[4] = v18;
        v46 = a1[4];
        v47 = a1[5];
        dispatch_after(v22, MEMORY[0x24BDAC9B8], block);

      }
      else
      {
        objc_msgSend(a1[4], "recordID");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "hmd_actualCKErrorFromCKErrorPartialFailure:", v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        v38 = (void *)MEMORY[0x227676638]();
        v39 = v12;
        HMFGetOSLogHandle();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v49 = v41;
          v50 = 2114;
          v51 = v37;
          _os_log_impl(&dword_2218F0000, v40, OS_LOG_TYPE_ERROR, "%{public}@Failing push updated share with %{public}@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v38);
        v42 = _Block_copy(a1[5]);
        v43 = v42;
        if (v42)
          (*((void (**)(void *, _QWORD, void *))v42 + 2))(v42, 0, v37);

        v16 = 0;
      }
    }
    else
    {
      objc_msgSend(v7, "firstObject");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v28 = v27;
      else
        v28 = 0;
      v16 = v28;

      if (!v16)
      {
        v29 = (void *)MEMORY[0x227676638]();
        v30 = WeakRetained;
        HMFGetOSLogHandle();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "firstObject");
          v44 = v29;
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v49 = v32;
          v50 = 2112;
          v51 = v33;
          _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_ERROR, "%{public}@Unexpected record received when pushing updated share: %@", buf, 0x16u);

          v29 = v44;
        }

        objc_autoreleasePoolPop(v29);
      }
      v34 = _Block_copy(a1[5]);
      v35 = v34;
      if (v34)
        (*((void (**)(void *, id, _QWORD))v34 + 2))(v34, v16, 0);

    }
  }
  else
  {
    v23 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v49 = v25;
      _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_ERROR, "%{public}@Lost self while pushing updated share", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v23);
    v26 = _Block_copy(a1[5]);
    v16 = v26;
    if (v26)
      (*((void (**)(void *, _QWORD, id))v26 + 2))(v26, 0, v9);
  }

}

uint64_t __61__HMDCoreDataCloudShareService__pushUpdatedShare_completion___block_invoke_67(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_pushUpdatedShare:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __55__HMDCoreDataCloudShareService_fetchShareWithRecordID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v6)
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = WeakRetained;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v11;
      v16 = 2114;
      v17 = v6;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Fetching share failed with %{public}@", (uint8_t *)&v14, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(*(id *)(a1 + 32), "rejectWithError:", v6);
  }
  else
  {
    v12 = *(void **)(a1 + 32);
    if (v5)
    {
      objc_msgSend(v12, "fulfillWithValue:", v5);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "rejectWithError:", v13);

    }
  }

}

void __67__HMDCoreDataCloudShareService__fetchShareWithRecordID_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  const char *v16;
  NSObject *v17;
  os_log_type_t v18;
  uint32_t v19;
  int v20;
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v11 = (void *)MEMORY[0x227676638]();
  v12 = WeakRetained;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v9)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543874;
      v21 = v15;
      v22 = 2112;
      v23 = v7;
      v24 = 2114;
      v25 = v9;
      v16 = "%{public}@Failed to fetch share %@: %{public}@";
      v17 = v14;
      v18 = OS_LOG_TYPE_ERROR;
      v19 = 32;
LABEL_6:
      _os_log_impl(&dword_2218F0000, v17, v18, v16, (uint8_t *)&v20, v19);

    }
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543618;
    v21 = v15;
    v22 = 2112;
    v23 = v7;
    v16 = "%{public}@Successfully fetched share: %@";
    v17 = v14;
    v18 = OS_LOG_TYPE_DEFAULT;
    v19 = 22;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v11);
}

void __67__HMDCoreDataCloudShareService__fetchShareWithRecordID_completion___block_invoke_59(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  double v18;
  dispatch_time_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD block[5];
  id v40;
  id v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    if (v6)
    {
      v8 = (void *)MEMORY[0x227676638]();
      v9 = WeakRetained;
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v43 = v11;
        v44 = 2114;
        v45 = v6;
        _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Fetch share operation failed: %{public}@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v8);
      objc_msgSend(v6, "hmd_retryAfterCKError");
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = (id)v12;
        v14 = (void *)MEMORY[0x227676638]();
        v15 = v9;
        HMFGetOSLogHandle();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v43 = v17;
          v44 = 2114;
          v45 = v13;
          v46 = 2112;
          v47 = v6;
          _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Retrying fetching share in %{public}@s due to error: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v14);
        objc_msgSend(v13, "doubleValue");
        v19 = dispatch_time(0, (uint64_t)(v18 * 1000000000.0));
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __67__HMDCoreDataCloudShareService__fetchShareWithRecordID_completion___block_invoke_60;
        block[3] = &unk_24E79B440;
        block[4] = v15;
        v40 = a1[4];
        v41 = a1[5];
        dispatch_after(v19, MEMORY[0x24BDAC9B8], block);

      }
      else
      {
        objc_msgSend(v6, "hmd_actualCKErrorFromCKErrorPartialFailure:", a1[4]);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = (void *)MEMORY[0x227676638]();
        v34 = v9;
        HMFGetOSLogHandle();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v43 = v36;
          v44 = 2114;
          v45 = v32;
          _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_ERROR, "%{public}@Failing fetch share failed with %{public}@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v33);
        v37 = _Block_copy(a1[5]);
        v38 = v37;
        if (v37)
          (*((void (**)(void *, _QWORD, void *))v37 + 2))(v37, 0, v32);

        v13 = 0;
      }
    }
    else
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", a1[4]);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v25 = v24;
      else
        v25 = 0;
      v13 = v25;

      if (!v13)
      {
        v26 = (void *)MEMORY[0x227676638]();
        v27 = WeakRetained;
        HMFGetOSLogHandle();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v43 = v29;
          v44 = 2112;
          v45 = v5;
          _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetched share: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v26);
      }
      v30 = _Block_copy(a1[5]);
      v31 = v30;
      if (v30)
        (*((void (**)(void *, id, _QWORD))v30 + 2))(v30, v13, 0);

    }
  }
  else
  {
    v20 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v43 = v22;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Lost self while fetching share", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v20);
    v23 = _Block_copy(a1[5]);
    v13 = v23;
    if (v23)
      (*((void (**)(void *, _QWORD, id))v23 + 2))(v23, 0, v6);
  }

}

uint64_t __67__HMDCoreDataCloudShareService__fetchShareWithRecordID_completion___block_invoke_60(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchShareWithRecordID:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __66__HMDCoreDataCloudShareService__fetchParticipantForAccountHandle___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  int v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v4;
    v6 = 1;
  }
  else
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 32);
      v16 = 138543618;
      v17 = v10;
      v18 = 2112;
      v19 = v11;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@No participant with handle %@", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = v12;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
      objc_claimAutoreleasedReturnValue();
    }

    v6 = 2;
  }

  return v6;
}

void __68__HMDCoreDataCloudShareService__fetchParticipantsForAccountHandles___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  id *v28;
  void *v29;
  id *v30;
  void *v31;
  id v32;
  NSObject *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  uint64_t v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t v46[128];
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = a1;
    v8 = (void *)MEMORY[0x227676638]();
    v9 = v7[4];
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7[5], "allKeys");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v48 = v11;
      v49 = 2112;
      v50 = v12;
      v51 = 2114;
      v52 = v6;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Fetching participant for %@ resulted in error %{public}@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(v7[6], "rejectWithError:", v6);
  }
  else if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
    v13 = objc_claimAutoreleasedReturnValue();
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v38 = v5;
    v14 = v5;
    v15 = (void *)v13;
    v16 = v14;
    v17 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v43;
      v39 = (void *)v13;
      v40 = *(_QWORD *)v43;
      v41 = v16;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v43 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
          objc_msgSend(v21, "userIdentity");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "lookupInfo");
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (v23)
          {
            objc_msgSend(a1[5], "objectForKeyedSubscript:", v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (v24)
            {
              objc_msgSend(v15, "setObject:forKeyedSubscript:", v21, v24);
            }
            else
            {
              v25 = (void *)MEMORY[0x227676638]();
              v26 = a1[4];
              HMFGetOSLogHandle();
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v28 = a1;
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v48 = v29;
                v49 = 2112;
                v50 = v21;
                _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_ERROR, "%{public}@Cannot find account handle for fetching participant %@", buf, 0x16u);

                a1 = v28;
                v15 = v39;
              }

              objc_autoreleasePoolPop(v25);
              v19 = v40;
              v16 = v41;
            }

          }
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
      }
      while (v18);
    }

    objc_msgSend(a1[6], "fulfillWithValue:", v15);
    v6 = 0;
    v5 = v38;
  }
  else
  {
    v30 = a1;
    v31 = (void *)MEMORY[0x227676638]();
    v32 = v30[4];
    HMFGetOSLogHandle();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30[5], "allKeys");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v48 = v34;
      v49 = 2112;
      v50 = v35;
      _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_ERROR, "%{public}@Did not fetch any participants using lookup infos %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v31);
    v36 = v30[6];
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "rejectWithError:", v37);

  }
}

uint64_t __84__HMDCoreDataCloudShareService__auditUsersForRevokedAccessWithAccountHandles_share___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  id v5;
  void *v6;
  uint64_t v8;

  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  objc_msgSend(*(id *)(a1 + 32), "_fetchParticipantsForAccountHandles:", *(_QWORD *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;

    return 3;
  }
  else
  {
    v8 = _HMFPreconditionFailure();
    return __84__HMDCoreDataCloudShareService__auditUsersForRevokedAccessWithAccountHandles_share___block_invoke_2(v8);
  }
}

uint64_t __84__HMDCoreDataCloudShareService__auditUsersForRevokedAccessWithAccountHandles_share___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  __int128 v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  uint64_t v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x24BDBCEB8];
  v5 = objc_msgSend(*(id *)(a1 + 32), "count");
  v6 = v4;
  v7 = v3;
  objc_msgSend(v6, "arrayWithCapacity:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend(v3, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
  if (v28)
  {
    v11 = *(_QWORD *)v30;
    *(_QWORD *)&v10 = 138543874;
    v25 = v10;
    v26 = v9;
    v27 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v30 != v11)
          objc_enumerationMutation(v9);
        v13 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKeyedSubscript:", v13, v25);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "participants");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "containsObject:", v14);

        if ((v16 & 1) == 0)
        {
          v17 = (void *)MEMORY[0x227676638]();
          v18 = *(id *)(a1 + 40);
          HMFGetOSLogHandle();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v20 = v8;
            v21 = v7;
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
            *(_DWORD *)buf = v25;
            v34 = v22;
            v35 = 2112;
            v36 = v14;
            v37 = 2112;
            v38 = v23;
            _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Participant %@ no longer found on share %@", buf, 0x20u);

            v7 = v21;
            v8 = v20;
            v9 = v26;
          }

          objc_autoreleasePoolPop(v17);
          objc_msgSend(v8, "addObject:", v13);
          v11 = v27;
        }

      }
      v28 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
    }
    while (v28);
  }

  return 1;
}

uint64_t __76__HMDCoreDataCloudShareService__revokeAccessForUserWithAccountHandle_share___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  id v5;
  void *v6;
  uint64_t v8;

  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  objc_msgSend(*(id *)(a1 + 32), "_fetchParticipantForAccountHandle:", *(_QWORD *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;

    return 3;
  }
  else
  {
    v8 = _HMFPreconditionFailure();
    return __76__HMDCoreDataCloudShareService__revokeAccessForUserWithAccountHandle_share___block_invoke_2(v8);
  }
}

uint64_t __76__HMDCoreDataCloudShareService__revokeAccessForUserWithAccountHandle_share___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "participants");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "_removeParticipant:share:", v3, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 40);
      v15 = 138543874;
      v16 = v10;
      v17 = 2112;
      v18 = v3;
      v19 = 2112;
      v20 = v11;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@No matching participant %@ found on share %@ to revoke", (uint8_t *)&v15, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(MEMORY[0x24BE3F180], "futureWithValue:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12 = v6;
  if (!v12)
    _HMFPreconditionFailure();
  v13 = v12;

  return 3;
}

uint64_t __76__HMDCoreDataCloudShareService__revokeAccessForUserWithAccountHandle_share___block_invoke_38()
{
  return 1;
}

uint64_t __75__HMDCoreDataCloudShareService__grantAccessForUserWithAccountHandle_share___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  id v5;
  void *v6;
  uint64_t v8;

  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  objc_msgSend(*(id *)(a1 + 32), "_fetchParticipantForAccountHandle:", *(_QWORD *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;

    return 3;
  }
  else
  {
    v8 = _HMFPreconditionFailure();
    return __75__HMDCoreDataCloudShareService__grantAccessForUserWithAccountHandle_share___block_invoke_2(v8);
  }
}

uint64_t __75__HMDCoreDataCloudShareService__grantAccessForUserWithAccountHandle_share___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "participants");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

  if (!v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "_addParticipant:share:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = v15;

      goto LABEL_8;
    }
LABEL_9:
    _HMFPreconditionFailure();
  }
  v7 = (void *)MEMORY[0x227676638]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    *(_DWORD *)buf = 138543618;
    v21 = v10;
    v22 = 2112;
    v23 = v11;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Removing and re-adding participant because fetched share already contains equivalent participant: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  objc_msgSend(*(id *)(a1 + 32), "_removeParticipant:share:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __75__HMDCoreDataCloudShareService__grantAccessForUserWithAccountHandle_share___block_invoke_32;
  v18[3] = &unk_24E775358;
  v19 = *(_OWORD *)(a1 + 32);
  objc_msgSend(v12, "then:", v18);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (!v13)
    goto LABEL_9;
  v14 = v13;

LABEL_8:
  return 3;
}

uint64_t __75__HMDCoreDataCloudShareService__grantAccessForUserWithAccountHandle_share___block_invoke_2_34(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  HMDCoreDataCloudShareInvitation *v24;
  id v25;
  void *v26;
  id v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  uint64_t v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend(v3, "participants", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v30;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v30 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        if (objc_msgSend(v9, "isEqual:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40)))
        {
          objc_msgSend(v9, "invitationToken");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          v18 = (void *)MEMORY[0x227676638]();
          v19 = *(id *)(a1 + 32);
          HMFGetOSLogHandle();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = v20;
          if (v17)
          {
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = *(_QWORD *)(a1 + 40);
              *(_DWORD *)buf = 138543618;
              v34 = v22;
              v35 = 2112;
              v36 = v23;
              _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Successfully added user with handle %@ to share", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v18);
            v24 = [HMDCoreDataCloudShareInvitation alloc];
            objc_msgSend(v3, "URL");
            v15 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "invitationToken");
            v25 = (id)objc_claimAutoreleasedReturnValue();
            -[HMDCoreDataCloudShareInvitation initWithURL:token:](v24, "initWithURL:token:", v15, v25);
            v16 = 1;
          }
          else
          {
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v34 = v26;
              _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Unexpected nil invitation token after adding user as new participant", buf, 0xCu);

            }
            objc_autoreleasePoolPop(v18);
            objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
            v27 = (id)objc_claimAutoreleasedReturnValue();
            if (v27)
            {
              v25 = v27;
              v16 = 2;
              v15 = v25;
            }
            else
            {
              objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
              objc_claimAutoreleasedReturnValue();
              v25 = 0;
              v15 = 0;
              v16 = 2;
            }
          }

          goto LABEL_24;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      if (v6)
        continue;
      break;
    }
  }

  v10 = (void *)MEMORY[0x227676638]();
  v11 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v34 = v13;
    _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Unexpected no matching participant after adding user as a new participant", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v10);
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = v14;
    v16 = 2;
    v4 = v15;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
    objc_claimAutoreleasedReturnValue();
    v15 = 0;
    v4 = 0;
    v16 = 2;
  }
LABEL_24:

  return v16;
}

uint64_t __75__HMDCoreDataCloudShareService__grantAccessForUserWithAccountHandle_share___block_invoke_36(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = objc_msgSend(v3, "hmd_isRecordConflictCKError");
  v5 = (void *)MEMORY[0x227676638]();
  v6 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v4)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "hmd_conciseCKError");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "shortDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v9;
      v21 = 2114;
      v22 = v11;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Failed to save share, need to resolve conflict, %{public}@", (uint8_t *)&v19, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(*(id *)(a1 + 32), "_grantAccessForUserWithAccountHandle:share:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (!v12)
      _HMFPreconditionFailure();
    v13 = v12;

    v14 = 3;
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v15;
      v21 = 2114;
      v22 = v3;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to add participant with %{public}@", (uint8_t *)&v19, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    v16 = v3;
    v13 = v16;
    if (v16)
    {
      v17 = v16;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
      objc_claimAutoreleasedReturnValue();
    }
    v14 = 2;
  }

  return v14;
}

uint64_t __75__HMDCoreDataCloudShareService__grantAccessForUserWithAccountHandle_share___block_invoke_32(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_addParticipant:share:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;

    return 3;
  }
  else
  {
    v7 = _HMFPreconditionFailure();
    return __54__HMDCoreDataCloudShareService_acceptShareInvitation___block_invoke(v7);
  }
}

uint64_t __54__HMDCoreDataCloudShareService_acceptShareInvitation___block_invoke(uint64_t a1)
{
  id v1;
  void *v2;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "_acceptShareInvitation:", *(_QWORD *)(a1 + 40));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    v2 = v1;

    return 3;
  }
  else
  {
    v4 = _HMFPreconditionFailure();
    return __55__HMDCoreDataCloudShareService__acceptShareInvitation___block_invoke(v4, v5);
  }
}

uint64_t __55__HMDCoreDataCloudShareService__acceptShareInvitation___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v10[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "sharedStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "acceptShareInvitationsFromMetadata:intoPersistentStore:", v5, v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (!v7)
    _HMFPreconditionFailure();
  v8 = v7;

  return 3;
}

uint64_t __55__HMDCoreDataCloudShareService__acceptShareInvitation___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;

  objc_msgSend(a2, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "share");
  objc_claimAutoreleasedReturnValue();

  return 1;
}

void __87__HMDCoreDataCloudShareService_acceptShareInvitationsFromMetadata_intoPersistentStore___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "rejectWithError:", v6);
  }
  else if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "fulfillWithValue:", v5);
  }
  else
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = WeakRetained;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 40);
      v15 = 138543618;
      v16 = v11;
      v17 = 2112;
      v18 = v12;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to accept share, no metadata returned for %@", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    v13 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "rejectWithError:", v14);

  }
}

void __99__HMDCoreDataCloudShareService__acceptShareInvitationsFromMetadata_intoPersistentStore_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  double v14;
  dispatch_time_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void (**v19)(void);
  void (**v20)(void);
  void (*v21)(void);
  void (**v22)(void);
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (!WeakRetained)
  {
    v16 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v31 = v18;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Lost self while accepting share invitations", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v16);
    v19 = (void (**)(void))_Block_copy(*(const void **)(a1 + 48));
    v20 = v19;
    if (!v19)
      goto LABEL_14;
    v21 = v19[2];
    goto LABEL_13;
  }
  if (!v6)
  {
    v22 = (void (**)(void))_Block_copy(*(const void **)(a1 + 48));
    v20 = v22;
    if (!v22)
    {
LABEL_14:

      goto LABEL_21;
    }
    v21 = v22[2];
LABEL_13:
    v21();
    goto LABEL_14;
  }
  objc_msgSend(v6, "hmd_retryAfterCKError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x227676638]();
  v10 = WeakRetained;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v31 = v13;
      v32 = 2112;
      v33 = v8;
      v34 = 2114;
      v35 = v6;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Retrying with %@, failed to accept share invitation due to %{public}@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(v8, "doubleValue");
    v15 = dispatch_time(0, (uint64_t)(v14 * 1000000000.0));
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __99__HMDCoreDataCloudShareService__acceptShareInvitationsFromMetadata_intoPersistentStore_completion___block_invoke_24;
    v26[3] = &unk_24E79B3F0;
    v26[4] = v10;
    v27 = *(id *)(a1 + 32);
    v28 = *(id *)(a1 + 40);
    v29 = *(id *)(a1 + 48);
    dispatch_after(v15, MEMORY[0x24BDAC9B8], v26);

  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v23;
      v32 = 2114;
      v33 = v6;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to accept share invitation due to %{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    v24 = _Block_copy(*(const void **)(a1 + 48));
    v25 = v24;
    if (v24)
      (*((void (**)(void *, _QWORD, id))v24 + 2))(v24, 0, v6);

  }
LABEL_21:

}

uint64_t __99__HMDCoreDataCloudShareService__acceptShareInvitationsFromMetadata_intoPersistentStore_completion___block_invoke_24(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_acceptShareInvitationsFromMetadata:intoPersistentStore:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __83__HMDCoreDataCloudShareService_auditUsersForRevokedAccessWithAccountHandles_share___block_invoke(uint64_t a1)
{
  id v1;
  void *v2;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "_auditUsersForRevokedAccessWithAccountHandles:share:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    v2 = v1;

    return 3;
  }
  else
  {
    v4 = _HMFPreconditionFailure();
    return __75__HMDCoreDataCloudShareService_revokeAccessForUserWithAccountHandle_share___block_invoke(v4);
  }
}

uint64_t __75__HMDCoreDataCloudShareService_revokeAccessForUserWithAccountHandle_share___block_invoke(uint64_t a1)
{
  id v1;
  void *v2;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "_revokeAccessForUserWithAccountHandle:share:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    v2 = v1;

    return 3;
  }
  else
  {
    v4 = _HMFPreconditionFailure();
    return __74__HMDCoreDataCloudShareService_grantAccessForUserWithAccountHandle_share___block_invoke(v4);
  }
}

uint64_t __74__HMDCoreDataCloudShareService_grantAccessForUserWithAccountHandle_share___block_invoke(uint64_t a1)
{
  id v1;
  void *v2;
  void *v4;
  SEL v5;

  objc_msgSend(*(id *)(a1 + 32), "_grantAccessForUserWithAccountHandle:share:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    v2 = v1;

    return 3;
  }
  else
  {
    v4 = (void *)_HMFPreconditionFailure();
    return (uint64_t)+[HMDCoreDataCloudShareService logCategory](v4, v5);
  }
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_10232 != -1)
    dispatch_once(&logCategory__hmf_once_t0_10232, &__block_literal_global_10233);
  return (id)logCategory__hmf_once_v1_10234;
}

void __43__HMDCoreDataCloudShareService_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_10234;
  logCategory__hmf_once_v1_10234 = v0;

}

@end

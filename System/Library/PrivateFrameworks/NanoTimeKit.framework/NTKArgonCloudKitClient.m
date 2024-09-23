@implementation NTKArgonCloudKitClient

- (void)fetchNewRecordsSinceChangeToken:(id)a3 forReason:(int64_t)a4 completion:(id)a5
{
  -[NTKArgonCloudKitClient _fetchNewRecordsSinceChangeToken:forReason:attemptNumber:completion:](self, "_fetchNewRecordsSinceChangeToken:forReason:attemptNumber:completion:", a3, a4, 0, a5);
}

- (void)_fetchNewRecordsSinceChangeToken:(id)a3 forReason:(int64_t)a4 attemptNumber:(unint64_t)a5 completion:(id)a6
{
  uint64_t (*v10)(uint64_t, uint64_t);
  id v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  uint64_t v41;
  id v42;
  void *v43;
  id v44;
  _QWORD v45[5];
  id v46;
  id v47;
  _BYTE *v48;
  _QWORD *v49;
  _QWORD v50[7];
  _QWORD v51[5];
  id v52;
  _QWORD v53[5];
  id v54;
  id v55;
  _QWORD aBlock[5];
  id v57;
  unint64_t v58;
  int64_t v59;
  _BYTE buf[24];
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  void *v64;
  id v65;
  _QWORD v66[4];

  v66[1] = *MEMORY[0x1E0C80C00];
  v10 = (uint64_t (*)(uint64_t, uint64_t))a3;
  v11 = a6;
  _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    NTKArgonStringForFetchReason(a4, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134349570;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v14;
    *(_WORD *)&buf[22] = 2114;
    v61 = v10;
    _os_log_impl(&dword_1B72A3000, v12, OS_LOG_TYPE_DEFAULT, "CloudKit Client %{public}p: Requesting new records for reason %{public}@ starting with change %{public}@.", buf, 0x20u);

  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __94__NTKArgonCloudKitClient__fetchNewRecordsSinceChangeToken_forReason_attemptNumber_completion___block_invoke;
  aBlock[3] = &unk_1E6BDA400;
  v58 = a5;
  v59 = a4;
  aBlock[4] = self;
  v44 = v11;
  v57 = v44;
  v15 = _Block_copy(aBlock);
  v16 = objc_alloc_init(MEMORY[0x1E0C94F88]);
  NTKArgonStringForFetchReason(a4, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setName:", v18);

  objc_msgSend(v16, "defaultConfiguration");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setPreferAnonymousRequests:", 1);

  -[NTKArgonCloudKitClient recordZoneID](self, "recordZoneID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v19) = v20 == 0;

  if ((_DWORD)v19)
  {
    _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[NTKArgonCloudKitClient _fetchNewRecordsSinceChangeToken:forReason:attemptNumber:completion:].cold.1(self, v24);

    -[NTKArgonCloudKitClient recordZoneError](self, "recordZoneError", v44);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, _QWORD, _QWORD, id))v15 + 2))(v15, 0, 0, v21);
  }
  else
  {
    v21 = objc_alloc_init(MEMORY[0x1E0C94DD8]);
    if (v10)
    {
      v55 = 0;
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v10, &v55, v44);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v55;
      if (v22)
      {
        objc_msgSend(v21, "setPreviousServerChangeToken:", v22);
      }
      else
      {
        _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          -[NTKArgonCloudKitClient _fetchNewRecordsSinceChangeToken:forReason:attemptNumber:completion:].cold.2((uint64_t)self, v25, v26, v27, v28, v29, v30, v31);

      }
    }
    v32 = objc_alloc(MEMORY[0x1E0C94DE8]);
    -[NTKArgonCloudKitClient recordZoneID](self, "recordZoneID");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v66[0] = v33;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKArgonCloudKitClient recordZoneID](self, "recordZoneID");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = v35;
    v65 = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v65, &v64, 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)objc_msgSend(v32, "initWithRecordZoneIDs:configurationsByRecordZoneID:", v34, v36);

    objc_msgSend(v37, "setGroup:", v16);
    objc_msgSend(v37, "configuration");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setPreferAnonymousRequests:", 1);

    v39 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = __94__NTKArgonCloudKitClient__fetchNewRecordsSinceChangeToken_forReason_attemptNumber_completion___block_invoke_34;
    v53[3] = &unk_1E6BDA428;
    v53[4] = self;
    v40 = v39;
    v54 = v40;
    objc_msgSend(v37, "setRecordChangedBlock:", v53);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v61 = __Block_byref_object_copy__54;
    v62 = __Block_byref_object_dispose__54;
    v63 = 0;
    v51[0] = 0;
    v51[1] = v51;
    v51[2] = 0x3032000000;
    v51[3] = __Block_byref_object_copy__54;
    v51[4] = __Block_byref_object_dispose__54;
    v52 = 0;
    v41 = MEMORY[0x1E0C809B0];
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __94__NTKArgonCloudKitClient__fetchNewRecordsSinceChangeToken_forReason_attemptNumber_completion___block_invoke_41;
    v50[3] = &unk_1E6BDA450;
    v50[4] = self;
    v50[5] = v51;
    v50[6] = buf;
    objc_msgSend(v37, "setRecordZoneFetchCompletionBlock:", v50);
    v45[0] = v41;
    v45[1] = 3221225472;
    v45[2] = __94__NTKArgonCloudKitClient__fetchNewRecordsSinceChangeToken_forReason_attemptNumber_completion___block_invoke_46;
    v45[3] = &unk_1E6BDA478;
    v48 = buf;
    v45[4] = self;
    v47 = v15;
    v42 = v40;
    v46 = v42;
    v49 = v51;
    objc_msgSend(v37, "setFetchRecordZoneChangesCompletionBlock:", v45);
    -[NTKArgonCloudKitClient database](self, "database");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addOperation:", v37);

    _Block_object_dispose(v51, 8);
    _Block_object_dispose(buf, 8);

  }
}

- (CKRecordZoneID)recordZoneID
{
  return self->_recordZoneID;
}

- (CKDatabase)database
{
  return self->_database;
}

uint64_t __94__NTKArgonCloudKitClient__fetchNewRecordsSinceChangeToken_forReason_attemptNumber_completion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

void __94__NTKArgonCloudKitClient__fetchNewRecordsSinceChangeToken_forReason_attemptNumber_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  dispatch_block_t v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(v9, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0C947D8]);

  if (v11)
  {
    objc_msgSend(v9, "userInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0C94940]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "allValues");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "code") == 21 && !*(_QWORD *)(a1 + 48))
    {
      objc_msgSend(*(id *)(a1 + 32), "_fetchNewRecordsSinceChangeToken:forReason:attemptNumber:completion:", 0, *(_QWORD *)(a1 + 56), 1, *(_QWORD *)(a1 + 40));

      goto LABEL_9;
    }

  }
  if (v9)
  {
    _NTKArgonCloudKitClientError(103, v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "internalQueue");
  v17 = objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __94__NTKArgonCloudKitClient__fetchNewRecordsSinceChangeToken_forReason_attemptNumber_completion___block_invoke_2;
  v19[3] = &unk_1E6BDA3D8;
  v23 = *(id *)(a1 + 40);
  v20 = v7;
  v21 = v8;
  v9 = v16;
  v22 = v9;
  v18 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v19);
  dispatch_async(v17, v18);

LABEL_9:
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

+ (id)sharedClientQueue
{
  if (sharedClientQueue_onceToken != -1)
    dispatch_once(&sharedClientQueue_onceToken, &__block_literal_global_164);
  return (id)sharedClientQueue_queue;
}

void __43__NTKArgonCloudKitClient_sharedClientQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.nanotimekit.facesupport.CloudKitClient.internalQueue", v2);
  v1 = (void *)sharedClientQueue_queue;
  sharedClientQueue_queue = (uint64_t)v0;

}

- (NTKArgonCloudKitClient)initWithCloudKitDatabase:(id)a3 zoneName:(id)a4
{
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NTKArgonCloudKitClient *v17;

  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = (void *)MEMORY[0x1E0CB3A28];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("ArgonCloudKitClient-%@"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0C99E98];
  NSTemporaryDirectory();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "fileURLWithPath:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "URLByAppendingPathComponent:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[NTKArgonCloudKitClient initWithCloudKitDatabase:temporaryStorageURL:zoneName:](self, "initWithCloudKitDatabase:temporaryStorageURL:zoneName:", v9, v16, v8);
  return v17;
}

- (NTKArgonCloudKitClient)initWithCloudKitDatabase:(id)a3 temporaryStorageURL:(id)a4 zoneName:(id)a5
{
  id v9;
  id v10;
  id v11;
  NTKArgonCloudKitClient *v12;
  NTKArgonCloudKitClient *v13;
  uint64_t v14;
  NSString *zoneName;
  uint64_t v16;
  NSURL *temporaryStorageURL;
  uint64_t v18;
  OS_dispatch_queue *internalQueue;
  uint64_t v20;
  CKRecordZoneID *recordZoneID;
  objc_super v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)NTKArgonCloudKitClient;
  v12 = -[NTKArgonCloudKitClient init](&v23, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_database, a3);
    v14 = objc_msgSend(v11, "copy");
    zoneName = v13->_zoneName;
    v13->_zoneName = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    temporaryStorageURL = v13->_temporaryStorageURL;
    v13->_temporaryStorageURL = (NSURL *)v16;

    +[NTKArgonCloudKitClient sharedClientQueue](NTKArgonCloudKitClient, "sharedClientQueue");
    v18 = objc_claimAutoreleasedReturnValue();
    internalQueue = v13->_internalQueue;
    v13->_internalQueue = (OS_dispatch_queue *)v18;

    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0C95098]), "initWithZoneName:ownerName:", v13->_zoneName, CFSTR("_defaultOwner"));
    recordZoneID = v13->_recordZoneID;
    v13->_recordZoneID = (CKRecordZoneID *)v20;

  }
  return v13;
}

- (NSString)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKArgonCloudKitClient zoneName](self, "zoneName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, zoneName=%@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (void)requestIdentifierTokenForCurrentUserWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  _QWORD aBlock[5];
  id v15;
  uint8_t buf[4];
  NTKArgonCloudKitClient *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349056;
    v17 = self;
    _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "CloudKit Client %{public}p: Fetching user identifier token.", buf, 0xCu);
  }

  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__NTKArgonCloudKitClient_requestIdentifierTokenForCurrentUserWithCompletion___block_invoke;
  aBlock[3] = &unk_1E6BDA348;
  aBlock[4] = self;
  v15 = v4;
  v7 = v4;
  v8 = _Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0C94E18], "fetchCurrentUserRecordOperation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPerRecordCompletionBlock:", &__block_literal_global_23_0);
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __77__NTKArgonCloudKitClient_requestIdentifierTokenForCurrentUserWithCompletion___block_invoke_4;
  v12[3] = &unk_1E6BDA3B0;
  v13 = v8;
  v10 = v8;
  objc_msgSend(v9, "setFetchRecordsCompletionBlock:", v12);
  -[NTKArgonCloudKitClient database](self, "database");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addOperation:", v9);

}

void __77__NTKArgonCloudKitClient_requestIdentifierTokenForCurrentUserWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  dispatch_block_t v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    _NTKArgonCloudKitClientError(100, v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v7;
  }
  objc_msgSend(*(id *)(a1 + 32), "internalQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__NTKArgonCloudKitClient_requestIdentifierTokenForCurrentUserWithCompletion___block_invoke_2;
  block[3] = &unk_1E6BD00D8;
  v9 = *(id *)(a1 + 40);
  v15 = v6;
  v16 = v9;
  v14 = v5;
  v10 = v6;
  v11 = v5;
  v12 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, block);
  dispatch_async(v8, v12);

}

uint64_t __77__NTKArgonCloudKitClient_requestIdentifierTokenForCurrentUserWithCompletion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __77__NTKArgonCloudKitClient_requestIdentifierTokenForCurrentUserWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  if (a2)
  {
    objc_msgSend(a2, "allKeys");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "recordName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

void __94__NTKArgonCloudKitClient__fetchNewRecordsSinceChangeToken_forReason_attemptNumber_completion___block_invoke_34(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  NTKArgonKeyDescriptor *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  NSObject *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "recordType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", NTKArgonCloudKitRecordTypeBundleDescriptor);

  if (v5)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("fileName"));
    v6 = objc_claimAutoreleasedReturnValue();
    _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v11 = 134349314;
      v12 = v8;
      v13 = 2114;
      v14 = v6;
      _os_log_impl(&dword_1B72A3000, v7, OS_LOG_TYPE_DEFAULT, "CloudKit Client %{public}p: Found bundle descriptor record for %{public}@.", (uint8_t *)&v11, 0x16u);
    }

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("key"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[NTKArgonKeyDescriptor initWithKey:fileName:]([NTKArgonKeyDescriptor alloc], "initWithKey:fileName:", v9, v6);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v10);

  }
  else
  {
    _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __94__NTKArgonCloudKitClient__fetchNewRecordsSinceChangeToken_forReason_attemptNumber_completion___block_invoke_34_cold_1();
  }

}

void __94__NTKArgonCloudKitClient__fetchNewRecordsSinceChangeToken_forReason_attemptNumber_completion___block_invoke_41(_QWORD *a1, uint64_t a2, void *a3, uint64_t a4, int a5, void *a6)
{
  id v9;
  id v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  id v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  const char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a6;
  _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = "YES";
    v13 = a1[4];
    if (!v9)
      v12 = "NO";
    *(_DWORD *)buf = 134349314;
    v30 = v13;
    v31 = 2080;
    v32 = v12;
    _os_log_impl(&dword_1B72A3000, v11, OS_LOG_TYPE_DEFAULT, "CloudKit Client %{public}p: Record zone changes query complete. Change token received: %s.", buf, 0x16u);
  }

  if (a5)
  {
    _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      __94__NTKArgonCloudKitClient__fetchNewRecordsSinceChangeToken_forReason_attemptNumber_completion___block_invoke_41_cold_2((uint64_t)a1, v14, v15, v16, v17, v18, v19, v20);

  }
  if (v10)
  {
    v21 = *(_QWORD *)(a1[6] + 8);
    v22 = v10;
    v23 = *(id *)(v21 + 40);
    *(_QWORD *)(v21 + 40) = v22;
  }
  else
  {
    if (!v9)
      goto LABEL_12;
    v28 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v9, 1, &v28);
    v24 = objc_claimAutoreleasedReturnValue();
    v23 = v28;
    v25 = *(_QWORD *)(a1[5] + 8);
    v26 = *(void **)(v25 + 40);
    *(_QWORD *)(v25 + 40) = v24;

    if (!*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40))
    {
      _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        __94__NTKArgonCloudKitClient__fetchNewRecordsSinceChangeToken_forReason_attemptNumber_completion___block_invoke_41_cold_1();

    }
  }

LABEL_12:
}

void __94__NTKArgonCloudKitClient__fetchNewRecordsSinceChangeToken_forReason_attemptNumber_completion___block_invoke_46(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void (*v7)(void);
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = v3;
LABEL_4:
    _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __94__NTKArgonCloudKitClient__fetchNewRecordsSinceChangeToken_forReason_attemptNumber_completion___block_invoke_46_cold_1();

    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    goto LABEL_7;
  }
  v5 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (v5)
    goto LABEL_4;
  _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = objc_msgSend(*(id *)(a1 + 40), "count");
    v12 = 134349312;
    v13 = v9;
    v14 = 2048;
    v15 = v10;
    _os_log_impl(&dword_1B72A3000, v8, OS_LOG_TYPE_DEFAULT, "CloudKit Client %{public}p: Final record zone changes callback fired. Found %ld keys. No error detected!", (uint8_t *)&v12, 0x16u);
  }

  v11 = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", *(_QWORD *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v7 = *(void (**)(void))(v11 + 16);
LABEL_7:
  v7();

}

- (void)_unpublishRecordsWithPartialQueryOperation:(id)a3 accumulatedRecords:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *, void *);
  void *v23;
  id v24;
  id v25;
  NTKArgonCloudKitClient *v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  objc_msgSend(v10, "group");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "zoneID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __99__NTKArgonCloudKitClient__unpublishRecordsWithPartialQueryOperation_accumulatedRecords_completion___block_invoke;
  v29[3] = &unk_1E6BDA4A0;
  v14 = v8;
  v30 = v14;
  objc_msgSend(v10, "setRecordFetchedBlock:", v29);
  v20 = v13;
  v21 = 3221225472;
  v22 = __99__NTKArgonCloudKitClient__unpublishRecordsWithPartialQueryOperation_accumulatedRecords_completion___block_invoke_2;
  v23 = &unk_1E6BDA518;
  v24 = v11;
  v25 = v12;
  v26 = self;
  v27 = v14;
  v28 = v9;
  v15 = v9;
  v16 = v14;
  v17 = v12;
  v18 = v11;
  objc_msgSend(v10, "setQueryCompletionBlock:", &v20);
  -[NTKArgonCloudKitClient database](self, "database", v20, v21, v22, v23);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addOperation:", v10);

}

uint64_t __99__NTKArgonCloudKitClient__unpublishRecordsWithPartialQueryOperation_accumulatedRecords_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __99__NTKArgonCloudKitClient__unpublishRecordsWithPartialQueryOperation_accumulatedRecords_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD v23[5];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95038]), "initWithCursor:", v5);
    objc_msgSend(v8, "setGroup:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v8, "setZoneID:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 48), "_unpublishRecordsWithPartialQueryOperation:accumulatedRecords:completion:", v8, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

  }
  else if (v6)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v10 = *(id *)(a1 + 56);
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v25 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "recordID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v15);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v12);
    }

    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94F10]), "initWithRecordsToSave:recordIDsToDelete:", 0, v9);
    objc_msgSend(v16, "setGroup:", *(_QWORD *)(a1 + 32));
    v17 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __99__NTKArgonCloudKitClient__unpublishRecordsWithPartialQueryOperation_accumulatedRecords_completion___block_invoke_3;
    v23[3] = &unk_1E6BDA4C8;
    v23[4] = *(_QWORD *)(a1 + 48);
    objc_msgSend(v16, "setPerRecordCompletionBlock:", v23);
    v20[0] = v17;
    v20[1] = 3221225472;
    v20[2] = __99__NTKArgonCloudKitClient__unpublishRecordsWithPartialQueryOperation_accumulatedRecords_completion___block_invoke_53;
    v20[3] = &unk_1E6BDA4F0;
    v21 = v9;
    v22 = *(id *)(a1 + 64);
    v18 = v9;
    objc_msgSend(v16, "setModifyRecordsCompletionBlock:", v20);
    objc_msgSend(*(id *)(a1 + 48), "database");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addOperation:", v16);

  }
}

void __99__NTKArgonCloudKitClient__unpublishRecordsWithPartialQueryOperation_accumulatedRecords_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = 134349570;
      v11 = v9;
      v12 = 2114;
      v13 = v5;
      v14 = 2114;
      v15 = v6;
      _os_log_error_impl(&dword_1B72A3000, v7, OS_LOG_TYPE_ERROR, "CloudKit Client %{public}p: Failed to unpublish record %{public}@: %{public}@.", (uint8_t *)&v10, 0x20u);
    }
  }
  else
  {
    if (!v5)
      goto LABEL_5;
    _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v10 = 134349314;
      v11 = v8;
      v12 = 2114;
      v13 = v5;
      _os_log_impl(&dword_1B72A3000, v7, OS_LOG_TYPE_DEFAULT, "CloudKit Client %{public}p: Unpublished record %{public}@.", (uint8_t *)&v10, 0x16u);
    }
  }

LABEL_5:
}

void __99__NTKArgonCloudKitClient__unpublishRecordsWithPartialQueryOperation_accumulatedRecords_completion___block_invoke_53(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (objc_msgSend(v9, "isEqualToArray:", *(_QWORD *)(a1 + 32)) && objc_msgSend(v9, "count"))
  {
    (*(void (**)(_QWORD, BOOL, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v6 == 0, v6);
  }
  else
  {
    v7 = *(_QWORD *)(a1 + 40);
    _NTKArgonCloudKitClientError(204, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v8);

  }
}

- (void)_unpublishRecordsOfType:(id)a3 matchingPredicate:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  objc_class *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;

  v8 = a3;
  v9 = a4;
  v10 = (objc_class *)MEMORY[0x1E0C94F88];
  v11 = a5;
  v12 = objc_alloc_init(v10);
  objc_msgSend(v12, "setName:", CFSTR("UserActionExplicit"));
  -[NTKArgonCloudKitClient recordZoneID](self, "recordZoneID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95010]), "initWithRecordType:predicate:", v8, v9);
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95038]), "initWithQuery:", v15);
    objc_msgSend(v16, "setGroup:", v12);
    -[NTKArgonCloudKitClient recordZoneID](self, "recordZoneID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setZoneID:", v17);

    -[NTKArgonCloudKitClient _unpublishRecordsWithPartialQueryOperation:accumulatedRecords:completion:](self, "_unpublishRecordsWithPartialQueryOperation:accumulatedRecords:completion:", v16, v14, v11);
  }
  else
  {
    _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[NTKArgonCloudKitClient _unpublishRecordsOfType:matchingPredicate:completion:].cold.1(self);

    (*((void (**)(id, uint64_t, _QWORD))v11 + 2))(v11, 1, 0);
  }

}

- (void)_publishRecord:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  _QWORD aBlock[5];
  id v25;
  id v26;
  id v27;
  _BYTE buf[22];
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[NTKArgonCloudKitClient zoneName](self, "zoneName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134349570;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v6;
    v29 = 2114;
    v30 = v9;
    _os_log_impl(&dword_1B72A3000, v8, OS_LOG_TYPE_DEFAULT, "CloudKit Client %{public}p: Publishing record %{public}@ in zone %{public}@.", buf, 0x20u);

  }
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__NTKArgonCloudKitClient__publishRecord_completion___block_invoke;
  aBlock[3] = &unk_1E6BDA568;
  aBlock[4] = self;
  v25 = v6;
  v26 = v7;
  v11 = v7;
  v12 = v6;
  v13 = _Block_copy(aBlock);
  v14 = objc_alloc_init(MEMORY[0x1E0C94F88]);
  objc_msgSend(v14, "setName:", CFSTR("UserActionExplicit"));
  v15 = objc_alloc(MEMORY[0x1E0C94F10]);
  v27 = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithRecordsToSave:recordIDsToDelete:", v16, 0);

  objc_msgSend(v17, "setGroup:", v14);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = 0;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "getUUIDBytes:", buf);

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", buf, 16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setClientChangeTokenData:", v19);

  v22[0] = v10;
  v22[1] = 3221225472;
  v22[2] = __52__NTKArgonCloudKitClient__publishRecord_completion___block_invoke_2;
  v22[3] = &unk_1E6BDA590;
  v23 = v13;
  v20 = v13;
  objc_msgSend(v17, "setModifyRecordsCompletionBlock:", v22);
  -[NTKArgonCloudKitClient database](self, "database");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addOperation:", v17);

}

void __52__NTKArgonCloudKitClient__publishRecord_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  id v13;
  dispatch_block_t v14;
  _QWORD block[4];
  id v16;
  id v17;
  char v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(void **)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v7, "zoneName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134349570;
      v20 = v7;
      v21 = 2114;
      v22 = v8;
      v23 = 2114;
      v24 = v9;
      _os_log_impl(&dword_1B72A3000, v6, OS_LOG_TYPE_DEFAULT, "CloudKit Client %{public}p: Published record %{public}@ in zone %{public}@.", buf, 0x20u);

    }
  }
  else
  {
    _NTKArgonCloudKitClientError(202, v5);
    v10 = objc_claimAutoreleasedReturnValue();

    _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __52__NTKArgonCloudKitClient__publishRecord_completion___block_invoke_cold_1();
    v5 = (id)v10;
  }

  objc_msgSend(*(id *)(a1 + 32), "internalQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__NTKArgonCloudKitClient__publishRecord_completion___block_invoke_59;
  block[3] = &unk_1E6BDA540;
  v12 = *(id *)(a1 + 48);
  v18 = a2;
  v16 = v5;
  v17 = v12;
  v13 = v5;
  v14 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, block);
  dispatch_async(v11, v14);

}

uint64_t __52__NTKArgonCloudKitClient__publishRecord_completion___block_invoke_59(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

uint64_t __52__NTKArgonCloudKitClient__publishRecord_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(_QWORD, BOOL, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a4 == 0, a4);
}

- (void)publishKeyDescriptor:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  void (**v12)(void *, _QWORD, void *);
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  _QWORD aBlock[5];
  id v23;
  id v24;
  uint8_t buf[4];
  NTKArgonCloudKitClient *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[NTKArgonCloudKitClient zoneName](self, "zoneName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134349570;
    v26 = self;
    v27 = 2114;
    v28 = v6;
    v29 = 2114;
    v30 = v9;
    _os_log_impl(&dword_1B72A3000, v8, OS_LOG_TYPE_DEFAULT, "CloudKit Client %{public}p: Publishing key descriptor %{public}@ in zone %{public}@.", buf, 0x20u);

  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__NTKArgonCloudKitClient_publishKeyDescriptor_completion___block_invoke;
  aBlock[3] = &unk_1E6BDA568;
  aBlock[4] = self;
  v10 = v6;
  v23 = v10;
  v11 = v7;
  v24 = v11;
  v12 = (void (**)(void *, _QWORD, void *))_Block_copy(aBlock);
  v13 = objc_alloc_init(MEMORY[0x1E0C94F88]);
  objc_msgSend(v13, "setName:", CFSTR("UserActionExplicit"));
  -[NTKArgonCloudKitClient recordZoneID](self, "recordZoneID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = objc_alloc(MEMORY[0x1E0C95048]);
    v16 = NTKArgonCloudKitRecordTypeBundleDescriptor;
    -[NTKArgonCloudKitClient recordZoneID](self, "recordZoneID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v15, "initWithRecordType:zoneID:", v16, v17);

    objc_msgSend(v10, "fileName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, CFSTR("fileName"));

    objc_msgSend(v10, "key");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v20, CFSTR("key"));

    -[NTKArgonCloudKitClient _publishRecord:completion:](self, "_publishRecord:completion:", v18, v12);
  }
  else
  {
    _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[NTKArgonCloudKitClient publishKeyDescriptor:completion:].cold.1(self, (uint64_t)v10, v21);

    -[NTKArgonCloudKitClient recordZoneError](self, "recordZoneError");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2](v12, 0, v18);
  }

}

void __58__NTKArgonCloudKitClient_publishKeyDescriptor_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  id v13;
  dispatch_block_t v14;
  _QWORD block[4];
  id v16;
  id v17;
  char v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(void **)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v7, "zoneName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134349570;
      v20 = v7;
      v21 = 2114;
      v22 = v8;
      v23 = 2114;
      v24 = v9;
      _os_log_impl(&dword_1B72A3000, v6, OS_LOG_TYPE_DEFAULT, "CloudKit Client %{public}p: Published key descriptor %{public}@ in zone %{public}@.", buf, 0x20u);

    }
  }
  else
  {
    _NTKArgonCloudKitClientError(202, v5);
    v10 = objc_claimAutoreleasedReturnValue();

    _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __58__NTKArgonCloudKitClient_publishKeyDescriptor_completion___block_invoke_cold_1();
    v5 = (id)v10;
  }

  objc_msgSend(*(id *)(a1 + 32), "internalQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__NTKArgonCloudKitClient_publishKeyDescriptor_completion___block_invoke_62;
  block[3] = &unk_1E6BDA540;
  v12 = *(id *)(a1 + 48);
  v18 = a2;
  v16 = v5;
  v17 = v12;
  v13 = v5;
  v14 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, block);
  dispatch_async(v11, v14);

}

uint64_t __58__NTKArgonCloudKitClient_publishKeyDescriptor_completion___block_invoke_62(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)unpublishKeyDescriptor:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD aBlock[5];
  id v19;
  id v20;
  uint8_t buf[4];
  NTKArgonCloudKitClient *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[NTKArgonCloudKitClient zoneName](self, "zoneName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134349570;
    v22 = self;
    v23 = 2114;
    v24 = v6;
    v25 = 2114;
    v26 = v9;
    _os_log_impl(&dword_1B72A3000, v8, OS_LOG_TYPE_DEFAULT, "CloudKit Client %{public}p: Unpublishing key descriptor %{public}@ in zone %{public}@.", buf, 0x20u);

  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__NTKArgonCloudKitClient_unpublishKeyDescriptor_completion___block_invoke;
  aBlock[3] = &unk_1E6BDA568;
  aBlock[4] = self;
  v19 = v6;
  v20 = v7;
  v10 = v7;
  v11 = v6;
  v12 = _Block_copy(aBlock);
  v13 = objc_alloc_init(MEMORY[0x1E0C94F88]);
  objc_msgSend(v13, "setName:", CFSTR("UserActionExplicit"));
  v14 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(v11, "key");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fileName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "predicateWithFormat:", CFSTR("%K = %@ AND %K = %@"), CFSTR("key"), v15, CFSTR("fileName"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[NTKArgonCloudKitClient _unpublishRecordsOfType:matchingPredicate:completion:](self, "_unpublishRecordsOfType:matchingPredicate:completion:", NTKArgonCloudKitRecordTypeBundleDescriptor, v17, v12);
}

void __60__NTKArgonCloudKitClient_unpublishKeyDescriptor_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  id v13;
  dispatch_block_t v14;
  _QWORD block[4];
  id v16;
  id v17;
  char v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(void **)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v7, "zoneName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134349570;
      v20 = v7;
      v21 = 2114;
      v22 = v8;
      v23 = 2114;
      v24 = v9;
      _os_log_impl(&dword_1B72A3000, v6, OS_LOG_TYPE_DEFAULT, "CloudKit Client %{public}p: Unpublished key descriptor %{public}@ in zone %{public}@.", buf, 0x20u);

    }
  }
  else
  {
    _NTKArgonCloudKitClientError(202, v5);
    v10 = objc_claimAutoreleasedReturnValue();

    _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __60__NTKArgonCloudKitClient_unpublishKeyDescriptor_completion___block_invoke_cold_1();
    v5 = (id)v10;
  }

  objc_msgSend(*(id *)(a1 + 32), "internalQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__NTKArgonCloudKitClient_unpublishKeyDescriptor_completion___block_invoke_64;
  block[3] = &unk_1E6BDA540;
  v12 = *(id *)(a1 + 48);
  v18 = a2;
  v16 = v5;
  v17 = v12;
  v13 = v5;
  v14 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, block);
  dispatch_async(v11, v14);

}

uint64_t __60__NTKArgonCloudKitClient_unpublishKeyDescriptor_completion___block_invoke_64(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (NSURL)temporaryStorageURL
{
  return self->_temporaryStorageURL;
}

- (NSString)zoneName
{
  return self->_zoneName;
}

- (void)setInternalQueue:(id)a3
{
  objc_storeStrong((id *)&self->_internalQueue, a3);
}

- (void)setRecordZoneID:(id)a3
{
  objc_storeStrong((id *)&self->_recordZoneID, a3);
}

- (NSError)recordZoneError
{
  return self->_recordZoneError;
}

- (void)setRecordZoneError:(id)a3
{
  objc_storeStrong((id *)&self->_recordZoneError, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordZoneError, 0);
  objc_storeStrong((id *)&self->_recordZoneID, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_zoneName, 0);
  objc_storeStrong((id *)&self->_temporaryStorageURL, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

- (void)_fetchNewRecordsSinceChangeToken:(void *)a1 forReason:(NSObject *)a2 attemptNumber:completion:.cold.1(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  void *v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "zoneName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "recordZoneError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 134349570;
  v10 = a1;
  OUTLINED_FUNCTION_10_1();
  v11 = v4;
  v12 = v6;
  v13 = v7;
  OUTLINED_FUNCTION_4_3(&dword_1B72A3000, a2, v8, "CloudKit Client %{public}p: Failed to find new records for zone %{public}@ because the record zone did not exist in the database: %{public}@.", (uint8_t *)&v9);

  OUTLINED_FUNCTION_9();
}

- (void)_fetchNewRecordsSinceChangeToken:(uint64_t)a3 forReason:(uint64_t)a4 attemptNumber:(uint64_t)a5 completion:(uint64_t)a6 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B72A3000, a2, a3, "CloudKit Client %{public}p: Failed to decode change token. Falling back to requesting all changes.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __94__NTKArgonCloudKitClient__fetchNewRecordsSinceChangeToken_forReason_attemptNumber_completion___block_invoke_34_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  OUTLINED_FUNCTION_11();
  v14 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(v2 + 32);
  objc_msgSend(v4, "recordType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 134349570;
  v10 = v3;
  OUTLINED_FUNCTION_10_1();
  v11 = v6;
  v12 = v7;
  v13 = v1;
  OUTLINED_FUNCTION_4_3(&dword_1B72A3000, v0, v8, "CloudKit Client %{public}p: Unknown record type %{public}@ for record %{public}@. Ignoring.", (uint8_t *)&v9);

  OUTLINED_FUNCTION_9();
}

void __94__NTKArgonCloudKitClient__fetchNewRecordsSinceChangeToken_forReason_attemptNumber_completion___block_invoke_41_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_0_0(&dword_1B72A3000, v0, v1, "CloudKit Client %{public}p: Failed to serialize server change token: %{public}@. Ignoring.");
  OUTLINED_FUNCTION_1();
}

void __94__NTKArgonCloudKitClient__fetchNewRecordsSinceChangeToken_forReason_attemptNumber_completion___block_invoke_41_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B72A3000, a2, a3, "CloudKit Client %{public}p: Fetch result indicates more records are coming, but we specified fetchAllChanges!", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __94__NTKArgonCloudKitClient__fetchNewRecordsSinceChangeToken_forReason_attemptNumber_completion___block_invoke_46_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_0_0(&dword_1B72A3000, v0, v1, "CloudKit Client %{public}p: Final record zone changes callback fired. Error occurred: %{public}@.");
  OUTLINED_FUNCTION_1();
}

- (void)_unpublishRecordsOfType:(void *)a1 matchingPredicate:completion:.cold.1(void *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  objc_msgSend(a1, "zoneName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "recordZoneError");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_1_7(&dword_1B72A3000, v4, v5, "CloudKit Client %{public}p: Record zone %{public}@ not found, so treating records matching %{public}@ as unpublished. Possible error: %{public}@.", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_2_7();
}

void __52__NTKArgonCloudKitClient__publishRecord_completion___block_invoke_cold_1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_11();
  objc_msgSend((id)OUTLINED_FUNCTION_7_2(v0), "zoneName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_12();
  OUTLINED_FUNCTION_1_7(&dword_1B72A3000, v2, v3, "CloudKit Client %{public}p: Failed to publish record descriptor %{public}@ in zone %{public}@: %{public}@.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_7();
}

- (void)publishKeyDescriptor:(NSObject *)a3 completion:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  void *v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "recordZoneError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 134349570;
  v11 = a1;
  OUTLINED_FUNCTION_10_1();
  v12 = a2;
  v13 = v7;
  v14 = v8;
  OUTLINED_FUNCTION_4_3(&dword_1B72A3000, a3, v9, "CloudKit Client %{public}p: Failed to publish key descriptor %{public}@ because the record zone did not exist in the database: %{public}@.", (uint8_t *)&v10);

  OUTLINED_FUNCTION_9();
}

void __58__NTKArgonCloudKitClient_publishKeyDescriptor_completion___block_invoke_cold_1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_11();
  objc_msgSend((id)OUTLINED_FUNCTION_7_2(v0), "zoneName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_12();
  OUTLINED_FUNCTION_1_7(&dword_1B72A3000, v2, v3, "CloudKit Client %{public}p: Failed to publish key descriptor %{public}@ in zone %{public}@: %{public}@.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_7();
}

void __60__NTKArgonCloudKitClient_unpublishKeyDescriptor_completion___block_invoke_cold_1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_11();
  objc_msgSend((id)OUTLINED_FUNCTION_7_2(v0), "zoneName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_12();
  OUTLINED_FUNCTION_1_7(&dword_1B72A3000, v2, v3, "CloudKit Client %{public}p: Failed to unpublish key descriptor %{public}@ in zone %{public}@: %{public}@.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_7();
}

@end

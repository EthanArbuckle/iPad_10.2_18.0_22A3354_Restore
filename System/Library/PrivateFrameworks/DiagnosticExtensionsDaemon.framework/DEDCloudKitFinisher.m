@implementation DEDCloudKitFinisher

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[DEDCloudKitFinisher state](self, "state"), CFSTR("state"));

}

- (DEDCloudKitFinisher)initWithCoder:(id)a3
{
  id v4;
  DEDCloudKitFinisher *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)DEDCloudKitFinisher;
  v5 = -[DEDCloudKitFinisher init](&v7, sel_init);
  if (v5)
    -[DEDCloudKitFinisher setState:](v5, "setState:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("state")));

  return v5;
}

- (DEDCloudKitFinisher)initWithConfiguration:(id)a3 session:(id)a4
{
  id v6;
  id v7;
  DEDCloudKitFinisher *v8;
  DEDCloudKitFinisher *v9;
  void *v10;
  os_log_t v11;
  id v12;
  id v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)DEDCloudKitFinisher;
  v8 = -[DEDCloudKitFinisher init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    -[DEDCloudKitFinisher setState:](v8, "setState:", 0);
    +[DEDConfiguration sharedInstance](DEDConfiguration, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = os_log_create((const char *)objc_msgSend(v10, "loggingSubsystem"), "ded-cloudkit-finisher");
    -[DEDCloudKitFinisher setLog:](v9, "setLog:", v11);

    -[DEDCloudKitFinisher setSession:](v9, "setSession:", v7);
    v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[DEDCloudKitFinisher setAttachments:](v9, "setAttachments:", v12);

    v13 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    -[DEDCloudKitFinisher setUploadedBytes:](v9, "setUploadedBytes:", v13);

    -[DEDCloudKitFinisher setSandboxEnvironment:](v9, "setSandboxEnvironment:", objc_msgSend(v6, "cloudkitUseDevelopmentEnvironment"));
  }

  return v9;
}

+ (id)archivedClasses
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
}

- (void)finishSession:(id)a3 withConfiguration:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  int v11;
  void *v12;
  void *v13;
  DEDCloudKitClient *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  char v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  DEDCompressionDebouncer *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  id v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  id obj;
  uint64_t v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _QWORD v79[6];
  uint8_t buf[4];
  void *v81;
  __int16 v82;
  uint64_t v83;
  _BYTE v84[128];
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[DEDCloudKitFinisher log](self, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "cloudkitContainer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v81 = v9;
    _os_log_impl(&dword_21469E000, v8, OS_LOG_TYPE_DEFAULT, "Starting CloudKit finishSession with container: %{public}@", buf, 0xCu);

  }
  -[DEDCloudKitFinisher log](self, "log");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_msgSend(v7, "allowsCellularUpload");
    *(_DWORD *)buf = 67240192;
    LODWORD(v81) = v11;
    _os_log_impl(&dword_21469E000, v10, OS_LOG_TYPE_DEFAULT, "allowsCellularUpload: %{public}d", buf, 8u);
  }

  -[DEDCloudKitFinisher setState:](self, "setState:", 1);
  objc_msgSend(v7, "cloudkitContainer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(MEMORY[0x24BE2F388], "sharedManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEDCloudKitFinisher setElsManager:](self, "setElsManager:", v13);

    -[DEDCloudKitFinisher setSession:](self, "setSession:", v6);
    -[DEDCloudKitFinisher setTotalUploadSize:](self, "setTotalUploadSize:", 0);
    -[DEDCloudKitFinisher setSuccessfulUploads:](self, "setSuccessfulUploads:", 0);
    -[DEDCloudKitFinisher setFailedUploads:](self, "setFailedUploads:", 0);
    v14 = -[DEDCloudKitClient initWithBugSession:configuration:]([DEDCloudKitClient alloc], "initWithBugSession:configuration:", v6, v7);
    -[DEDCloudKitFinisher setCloudKitClient:](self, "setCloudKitClient:", v14);

    objc_msgSend(v7, "cloudkitData");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("payload"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v64 = v16;
    objc_msgSend(v16, "dataUsingEncoding:", 4);
    v79[5] = 0;
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    -[DEDCloudKitFinisher setQueuePayload:](self, "setQueuePayload:", v17);

    if (v18)
    {
      -[DEDCloudKitFinisher log](self, "log");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[DEDCloudKitFinisher finishSession:withConfiguration:].cold.2();

    }
    v62 = v18;
    v66 = v6;
    objc_msgSend(v7, "cloudkitData");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("gigafilesToken"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEDCloudKitFinisher setTimberLorryUUID:](self, "setTimberLorryUUID:", v21);

    objc_msgSend(v7, "cloudkitData");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("enrollmentTicketNumber"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      objc_msgSend(v7, "cloudkitData");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("enrollmentTicketNumber"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[DEDCloudKitFinisher setTimberLorryUUID:](self, "setTimberLorryUUID:", v25);

    }
    v65 = v7;
    objc_msgSend(v7, "cloudkitData");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEDCloudKitFinisher createAttachmentGroupWithData:](self, "createAttachmentGroupWithData:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEDCloudKitFinisher setAttachmentGroupModel:](self, "setAttachmentGroupModel:", v27);

    v79[0] = MEMORY[0x24BDAC760];
    v79[1] = 3221225472;
    v79[2] = __55__DEDCloudKitFinisher_finishSession_withConfiguration___block_invoke;
    v79[3] = &unk_24D1E5440;
    v79[4] = self;
    v61 = (void *)MEMORY[0x2199D4184](v79);
    v60 = -[DEDCompressionDebouncer initWithTrigger:interval:]([DEDCompressionDebouncer alloc], "initWithTrigger:interval:", v61, 1.0);
    -[DEDCompressionDebouncer handler](v60, "handler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEDCloudKitFinisher getAttachmentURLsWithProgressHandler:](self, "getAttachmentURLsWithProgressHandler:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v77 = 0u;
    v78 = 0u;
    v75 = 0u;
    v76 = 0u;
    obj = v29;
    v68 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v85, 16);
    if (v68)
    {
      v67 = *(_QWORD *)v76;
      do
      {
        v30 = 0;
        do
        {
          if (*(_QWORD *)v76 != v67)
            objc_enumerationMutation(obj);
          v70 = v30;
          v31 = *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * v30);
          v71 = 0u;
          v72 = 0u;
          v73 = 0u;
          v74 = 0u;
          objc_msgSend(obj, "objectForKey:", v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v71, v84, 16);
          if (v33)
          {
            v34 = v33;
            v35 = *(_QWORD *)v72;
            do
            {
              for (i = 0; i != v34; ++i)
              {
                if (*(_QWORD *)v72 != v35)
                  objc_enumerationMutation(v32);
                v37 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
                -[DEDCloudKitFinisher log](self, "log");
                v38 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543618;
                  v81 = v37;
                  v82 = 2112;
                  v83 = v31;
                  _os_log_impl(&dword_21469E000, v38, OS_LOG_TYPE_DEFAULT, "Creating CKRecord for %{public}@ with queue destination %@", buf, 0x16u);
                }

                -[DEDCloudKitFinisher uploadedBytes](self, "uploadedBytes");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v39, "allKeys");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                v41 = objc_msgSend(v40, "containsObject:", v37);

                if ((v41 & 1) == 0)
                {
                  -[DEDCloudKitFinisher attachmentGroupModel](self, "attachmentGroupModel");
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  -[DEDCloudKitFinisher createAttachmentModelWithURL:andQueueItem:attachmentGroupModel:](self, "createAttachmentModelWithURL:andQueueItem:attachmentGroupModel:", v37, v31, v42);
                  v43 = (void *)objc_claimAutoreleasedReturnValue();

                  -[DEDCloudKitFinisher attachments](self, "attachments");
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v44, "addObject:", v43);

                  -[DEDCloudKitFinisher cloudKitClient](self, "cloudKitClient");
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v45, "addRawRecordToQueueFromModel:", v43);

                  objc_msgSend(v43, "fileSize");
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  -[DEDCloudKitFinisher setTotalUploadSize:](self, "setTotalUploadSize:", -[DEDCloudKitFinisher totalUploadSize](self, "totalUploadSize")+ objc_msgSend(v46, "unsignedLongLongValue"));

                  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  -[DEDCloudKitFinisher uploadedBytes](self, "uploadedBytes");
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v43, "url");
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v48, "setObject:forKeyedSubscript:", v47, v49);

                }
              }
              v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v71, v84, 16);
            }
            while (v34);
          }

          v30 = v70 + 1;
        }
        while (v70 + 1 != v68);
        v68 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v85, 16);
      }
      while (v68);
    }

    -[DEDCloudKitFinisher setState:](self, "setState:", 2);
    -[DEDCloudKitFinisher session](self, "session");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "uploadProgress:total:", 0, -[DEDCloudKitFinisher totalUploadSize](self, "totalUploadSize"));

    objc_msgSend(MEMORY[0x24BE2F380], "createLoggingEventWith:", *MEMORY[0x24BE2F368]);
    -[DEDCloudKitFinisher performCloudKitOperations](self, "performCloudKitOperations");

    v7 = v65;
    v6 = v66;
    v51 = v62;
  }
  else
  {
    -[DEDCloudKitFinisher log](self, "log");
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      -[DEDCloudKitFinisher finishSession:withConfiguration:].cold.1(v52, v53, v54, v55, v56, v57, v58, v59);

    objc_msgSend(MEMORY[0x24BE2F380], "createLoggingEventWith:", *MEMORY[0x24BE2F350]);
    -[DEDCloudKitFinisher session](self, "session");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "didFinishAllUploads");
  }

}

void __55__DEDCloudKitFinisher_finishSession_withConfiguration___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "session");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "compressionProgress:total:", a2, a3);

}

- (void)performCloudKitOperations
{
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;
  _QWORD v7[4];
  id v8;
  id location;

  objc_initWeak(&location, self);
  -[DEDCloudKitFinisher cloudKitClient](self, "cloudKitClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48__DEDCloudKitFinisher_performCloudKitOperations__block_invoke;
  v7[3] = &unk_24D1E5570;
  objc_copyWeak(&v8, &location);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __48__DEDCloudKitFinisher_performCloudKitOperations__block_invoke_2;
  v5[3] = &unk_24D1E5598;
  objc_copyWeak(&v6, &location);
  v5[4] = self;
  objc_msgSend(v3, "executeOperationsAtomicallyWithProgressHandler:completionHandler:finalHandler:", v7, v5, 0);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __48__DEDCloudKitFinisher_performCloudKitOperations__block_invoke(uint64_t a1, void *a2, double a3)
{
  id *v4;
  id v5;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "processAttachmentsWithRecord:withProgress:", v5, a3);

}

void __48__DEDCloudKitFinisher_performCloudKitOperations__block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (objc_msgSend(v6, "code") == 4 || objc_msgSend(v6, "code") == 3)
  {
    objc_msgSend(WeakRetained, "cloudKitClient");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "restoreQueue");

    objc_msgSend(WeakRetained, "scheduleOperationsOnAvailability");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "attachmentGroupModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "postProcessRecord:withError:attachmentGroup:", v10, v6, v9);

    objc_msgSend(WeakRetained, "unscheduleOperationsOnAvailability");
    objc_msgSend(WeakRetained, "setState:", 3);
  }

}

- (void)scheduleOperationsOnAvailability
{
  id v3;

  objc_msgSend(MEMORY[0x24BE04778], "sharedNetworkObserver");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:forHostname:", self, sel__reachabilityChanged_, CFSTR("apple.com"));

}

- (void)unscheduleOperationsOnAvailability
{
  id v3;

  objc_msgSend(MEMORY[0x24BE04778], "sharedNetworkObserver");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

}

- (void)_reachabilityChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  BOOL v11;
  id v12;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE046E0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  objc_msgSend(v4, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BE046E8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_retainAutorelease(v9);
  v10 = *(_DWORD *)objc_msgSend(v12, "bytes") & 0x40000;
  if (v7)
    v11 = v10 == 0;
  else
    v11 = 0;
  if (v11)
  {
    -[DEDCloudKitFinisher performCloudKitOperations](self, "performCloudKitOperations");
    -[DEDCloudKitFinisher unscheduleOperationsOnAvailability](self, "unscheduleOperationsOnAvailability");
  }

}

- (id)createAttachmentModelWithURL:(id)a3 andQueueItem:(id)a4 attachmentGroupModel:(id)a5
{
  id v7;
  id v8;
  id v9;
  DEDCloudKitAttachmentModel *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[DEDCloudKitAttachmentModel initWithURL:withQueueItem:parameters:]([DEDCloudKitAttachmentModel alloc], "initWithURL:withQueueItem:parameters:", v9, v8, 0);

  -[DEDCloudKitBaseModel addReferenceForModel:referenceKey:](v10, "addReferenceForModel:referenceKey:", v7, CFSTR("attachmentGroup"));
  return v10;
}

- (id)createAttachmentGroupStatusWithAttachmentGroupModel:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("processingState"));

  v6 = -[DEDCloudKitBaseModel initModelWithDictionary:]([DEDCloudKitAttachmentGroupStatusModel alloc], "initModelWithDictionary:", v4);
  objc_msgSend(v6, "addReferenceForModel:referenceKey:", v3, CFSTR("attachmentGroup"));

  return v6;
}

- (id)createAttachmentGroupWithData:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = -[DEDCloudKitBaseModel initModelWithDictionary:]([DEDCloudKitAttachmentGroupModel alloc], "initModelWithDictionary:", v4);

  -[DEDCloudKitFinisher cloudKitClient](self, "cloudKitClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addRawRecordToQueueFromModel:", v5);

  return v5;
}

- (void)createAttachmentGroupStatusForAttachmentGroup:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[5];

  -[DEDCloudKitFinisher createAttachmentGroupStatusWithAttachmentGroupModel:](self, "createAttachmentGroupStatusWithAttachmentGroupModel:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDCloudKitFinisher cloudKitClient](self, "cloudKitClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cloudKitModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[4] = self;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __69__DEDCloudKitFinisher_createAttachmentGroupStatusForAttachmentGroup___block_invoke;
  v8[3] = &unk_24D1E55C0;
  v8[4] = self;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __69__DEDCloudKitFinisher_createAttachmentGroupStatusForAttachmentGroup___block_invoke_2;
  v7[3] = &unk_24D1E4600;
  objc_msgSend(v5, "executeRecord:atomicallyWithProgressHandler:completionHandler:finalHandler:", v6, 0, v8, v7);

}

uint64_t __69__DEDCloudKitFinisher_createAttachmentGroupStatusForAttachmentGroup___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
    return objc_msgSend(*(id *)(result + 32), "logError:forRecord:", a4, a3);
  return result;
}

uint64_t __69__DEDCloudKitFinisher_createAttachmentGroupStatusForAttachmentGroup___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "localCleanup");
}

- (void)processAttachmentsWithRecord:(id)a3 withProgress:(double)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  NSObject *v29;
  int v30;
  unint64_t v31;
  unint64_t v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  _BYTE v39[14];
  __int16 v40;
  unint64_t v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("asset"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[DEDCloudKitFinisher log](self, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(double *)v39 = a4;
      _os_log_impl(&dword_21469E000, v8, OS_LOG_TYPE_DEFAULT, "CloudKit upload progress percentage: %f", buf, 0xCu);
    }

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("asset"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fileURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "attributesOfItemAtPath:error:", v12, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "fileSize");

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (double)v14 * a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEDCloudKitFinisher uploadedBytes](self, "uploadedBytes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fileURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v17);

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    -[DEDCloudKitFinisher attachments](self, "attachments", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v35;
      v22 = 0.0;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v35 != v21)
            objc_enumerationMutation(v18);
          v24 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          -[DEDCloudKitFinisher uploadedBytes](self, "uploadedBytes");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "url");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "objectForKeyedSubscript:", v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "doubleValue");
          v22 = v22 + v28;

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      }
      while (v20);
    }
    else
    {
      v22 = 0.0;
    }

    -[DEDCloudKitFinisher log](self, "log");
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v30 = (int)(v22 / (double)-[DEDCloudKitFinisher totalUploadSize](self, "totalUploadSize") * 100.0);
      v31 = (unint64_t)v22;
      v32 = -[DEDCloudKitFinisher totalUploadSize](self, "totalUploadSize");
      *(_DWORD *)buf = 67240704;
      *(_DWORD *)v39 = v30;
      *(_WORD *)&v39[4] = 2050;
      *(_QWORD *)&v39[6] = (unint64_t)v22;
      v40 = 2050;
      v41 = v32;
      _os_log_impl(&dword_21469E000, v29, OS_LOG_TYPE_DEFAULT, "CloudKit upload progress: %{public}d%% (%{public}llu / %{public}llu)", buf, 0x1Cu);
    }
    else
    {
      v31 = (unint64_t)v22;
    }

    -[DEDCloudKitFinisher session](self, "session");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "uploadProgress:total:", v31, -[DEDCloudKitFinisher totalUploadSize](self, "totalUploadSize"));

  }
}

- (void)postProcessRecord:(id)a3 withError:(id)a4 attachmentGroup:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  int v24;
  void *v25;
  uint64_t v26;
  int v27;
  int v28;
  void *v29;
  uint64_t v30;
  void *v31;
  char v32;
  NSObject *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  uint64_t v37;
  int v38;
  int v39;
  int v40;
  uint64_t v41;
  __int16 v42;
  _WORD v43[9];

  *(_QWORD *)&v43[5] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v9)
  {
    -[DEDCloudKitFinisher logError:forRecord:](self, "logError:forRecord:", v9, v8);
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("asset"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      -[DEDCloudKitFinisher setFailedUploads:](self, "setFailedUploads:", -[DEDCloudKitFinisher failedUploads](self, "failedUploads") + 1);
    objc_msgSend(v8, "recordType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "isEqualToString:", CFSTR("AttachmentGroup")) & 1) == 0)
    {

      goto LABEL_27;
    }
    -[DEDCloudKitFinisher cloudKitClient](self, "cloudKitClient");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "stillHaveOperationsInQueue");

    if ((v14 & 1) == 0)
    {
      -[DEDCloudKitFinisher log](self, "log");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v40) = 0;
        _os_log_impl(&dword_21469E000, v15, OS_LOG_TYPE_DEFAULT, "Failed to create AttachmentGroup record and iCloud is not retrying anymore", (uint8_t *)&v40, 2u);
      }

      -[DEDCloudKitFinisher elsManager](self, "elsManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "finishWithFailure");
LABEL_25:

      -[DEDCloudKitFinisher localCleanup](self, "localCleanup");
    }
  }
  else
  {
    -[DEDCloudKitFinisher log](self, "log");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "recordType");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "recordID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = 138412546;
      v41 = (uint64_t)v18;
      v42 = 2114;
      *(_QWORD *)v43 = v19;
      _os_log_impl(&dword_21469E000, v17, OS_LOG_TYPE_DEFAULT, "Saved %@ for ID: %{public}@", (uint8_t *)&v40, 0x16u);

    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("asset"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("asset"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[DEDCloudKitFinisher log](self, "log");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v21, "fileURL");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = 138412290;
        v41 = (uint64_t)v23;
        _os_log_impl(&dword_21469E000, v22, OS_LOG_TYPE_DEFAULT, "Uploaded File: %@ successfully", (uint8_t *)&v40, 0xCu);

      }
      -[DEDCloudKitFinisher setSuccessfulUploads:](self, "setSuccessfulUploads:", -[DEDCloudKitFinisher successfulUploads](self, "successfulUploads") + 1);

    }
    v24 = -[DEDCloudKitFinisher successfulUploads](self, "successfulUploads");
    -[DEDCloudKitFinisher attachments](self, "attachments");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "count");

    if (v26 == v24)
      -[DEDCloudKitFinisher createAttachmentGroupStatusForAttachmentGroup:](self, "createAttachmentGroupStatusForAttachmentGroup:", v10);
    v27 = -[DEDCloudKitFinisher successfulUploads](self, "successfulUploads");
    v28 = -[DEDCloudKitFinisher failedUploads](self, "failedUploads") + v27;
    -[DEDCloudKitFinisher attachments](self, "attachments");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "count");

    if (v30 == v28)
    {
      objc_msgSend(MEMORY[0x24BE2F380], "createLoggingEventWith:", *MEMORY[0x24BE2F358]);
      -[DEDCloudKitFinisher cloudKitClient](self, "cloudKitClient");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "stillHaveOperationsInQueue");

      if ((v32 & 1) == 0)
      {
        -[DEDCloudKitFinisher log](self, "log");
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v40) = 0;
          _os_log_impl(&dword_21469E000, v33, OS_LOG_TYPE_DEFAULT, "All Uploads Failed and iCloud is not retrying anymore", (uint8_t *)&v40, 2u);
        }

        -[DEDCloudKitFinisher elsManager](self, "elsManager");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "finishWithFailure");

      }
      -[DEDCloudKitFinisher log](self, "log");
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        -[DEDCloudKitFinisher attachments](self, "attachments");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v36, "count");
        v38 = -[DEDCloudKitFinisher successfulUploads](self, "successfulUploads");
        v39 = -[DEDCloudKitFinisher failedUploads](self, "failedUploads");
        v40 = 134218496;
        v41 = v37;
        v42 = 1024;
        *(_DWORD *)v43 = v38;
        v43[2] = 1024;
        *(_DWORD *)&v43[3] = v39;
        _os_log_impl(&dword_21469E000, v35, OS_LOG_TYPE_DEFAULT, "Total Uploads: %ld Successful: %d Failed: %d", (uint8_t *)&v40, 0x18u);

      }
      -[DEDCloudKitFinisher session](self, "session");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "uploadProgress:total:", 1, 1);
      goto LABEL_25;
    }
  }
LABEL_27:

}

- (void)logError:(id)a3 forRecord:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v7, "recordType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@,%@,%ld"), v9, v10, objc_msgSend(v6, "code"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE2F380], "createLoggingEventWith:postfix:", *MEMORY[0x24BE2F348], v11);
  -[DEDCloudKitFinisher log](self, "log");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    -[DEDCloudKitFinisher logError:forRecord:].cold.1(v7, (uint64_t)v6, v12);

}

- (id)getAttachmentURLs
{
  return -[DEDCloudKitFinisher getAttachmentURLsWithProgressHandler:](self, "getAttachmentURLsWithProgressHandler:", 0);
}

- (id)getAttachmentURLsWithProgressHandler:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  __CFString *v39;
  void *v40;
  DEDCloudKitFinisher *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  NSObject *v46;
  NSObject *v47;
  void *v48;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  id obj;
  void *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  id v60;
  _BYTE v61[128];
  uint64_t v62;
  uint8_t buf[4];
  void *v64;
  __int16 v65;
  uint64_t v66;
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  v53 = a3;
  -[DEDCloudKitFinisher session](self, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allExtensionIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[DEDCloudKitExtensionsUtil getCompletedExtensionFromAllExtensions:](DEDCloudKitExtensionsUtil, "getCompletedExtensionFromAllExtensions:", v5);
  v6 = objc_claimAutoreleasedReturnValue();

  -[DEDCloudKitFinisher log](self, "log");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[DEDCloudKitFinisher session](self, "session");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v64 = v9;
    v65 = 2112;
    v66 = v6;
    _os_log_impl(&dword_21469E000, v7, OS_LOG_TYPE_DEFAULT, "Getting DED session attachments on %@ for [%@]", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDCloudKitFinisher session](self, "session");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[DEDCloudKitExtensionsUtil getAllFilesInSessionDirectoryForSessionID:](DEDCloudKitExtensionsUtil, "getAllFilesInSessionDirectoryForSessionID:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13 && objc_msgSend(v13, "count"))
  {
    -[DEDCloudKitFinisher log](self, "log");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21469E000, v14, OS_LOG_TYPE_DEFAULT, "Adding ELS category files (files are uncompressed)...", buf, 2u);
    }

    v15 = (void *)objc_opt_new();
    -[DEDCloudKitFinisher session](self, "session");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "directoryForBugSessionIdentifier:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "URLByAppendingPathComponent:", CFSTR("els"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = 0;
    objc_msgSend(v20, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v19, 0, 0, &v60);
    v21 = v60;

    if (v21)
    {
      -[DEDCloudKitFinisher log](self, "log");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[DEDCloudKitFinisher getAttachmentURLsWithProgressHandler:].cold.1();

    }
    v23 = +[DEDCloudKitExtensionsUtil copyFiles:toDirectory:](DEDCloudKitExtensionsUtil, "copyFiles:toDirectory:", v13, v19);
    if (v23)
    {
      objc_msgSend(MEMORY[0x24BE2C978], "archiveDirectoryAt:deleteOriginal:progressHandler:", v19, 1, 0);
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = (void *)v24;
      if (v24)
      {
        v62 = v24;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v62, 1);
        v26 = v18;
        v27 = v13;
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setValue:forKey:", v28, CFSTR("els"));

        v13 = v27;
        v18 = v26;
      }

    }
  }
  v51 = v10;
  -[DEDCloudKitFinisher session](self, "session", v13);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = (void *)v6;
  +[DEDCloudKitExtensionsUtil getVerifiedExtensionDirectoriesFromCompletedExtensions:forSession:](DEDCloudKitExtensionsUtil, "getVerifiedExtensionDirectoriesFromCompletedExtensions:forSession:", v6, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  obj = v30;
  v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v57;
    do
    {
      for (i = 0; i != v32; ++i)
      {
        if (*(_QWORD *)v57 != v33)
          objc_enumerationMutation(obj);
        v35 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * i);
        -[DEDCloudKitFinisher queuePayload](self, "queuePayload");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[DEDCloudKitFinisher parsePayloadData:forIdentifier:](self, "parsePayloadData:forIdentifier:", v36, v35);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = (void *)objc_msgSend(v37, "mutableCopy");

        objc_msgSend(v38, "objectForKey:", CFSTR("packaging"));
        v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "objectForKey:", CFSTR("encryptor"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v39)
          v39 = CFSTR("flat-directories");
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
        v41 = self;
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setObject:forKey:", v39, CFSTR("package"));
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v40, "isEqualToString:", CFSTR("AppleEncryptedArchive")) ^ 1);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setObject:forKey:", v43, CFSTR("compression"));

        objc_msgSend(v55, "setValue:forKey:", v42, v35);
        self = v41;

      }
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
    }
    while (v32);
  }

  -[DEDCloudKitFinisher log](self, "log");
  v44 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21469E000, v44, OS_LOG_TYPE_DEFAULT, "Getting Attachment URLs", buf, 2u);
  }

  +[DEDCloudKitExtensionsUtil getOutputDirectories:withProcessingMap:progressHandler:](DEDCloudKitExtensionsUtil, "getOutputDirectories:withProcessingMap:progressHandler:", obj, v55, v53);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDCloudKitFinisher log](self, "log");
  v46 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21469E000, v46, OS_LOG_TYPE_DEFAULT, "Adding the DED file URLs", buf, 2u);
  }

  objc_msgSend(v51, "addEntriesFromDictionary:", v45);
  -[DEDCloudKitFinisher log](self, "log");
  v47 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v64 = v51;
    _os_log_impl(&dword_21469E000, v47, OS_LOG_TYPE_DEFAULT, "attachments = %{public}@", buf, 0xCu);
  }

  -[DEDCloudKitFinisher encryptLogsIfNecessary:](self, "encryptLogsIfNecessary:", v51);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  return v48;
}

- (void)localCleanup
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  objc_msgSend(MEMORY[0x24BE2F380], "createLoggingEventWith:", *MEMORY[0x24BE2F360]);
  -[DEDCloudKitFinisher log](self, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_21469E000, v3, OS_LOG_TYPE_DEFAULT, "All uploads are complete, cleaning up...", v7, 2u);
  }

  -[DEDCloudKitFinisher session](self, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didFinishAllUploads");

  -[DEDCloudKitFinisher attachments](self, "attachments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  -[DEDCloudKitFinisher uploadedBytes](self, "uploadedBytes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllObjects");

  -[DEDCloudKitFinisher setSuccessfulUploads:](self, "setSuccessfulUploads:", 0);
  -[DEDCloudKitFinisher setFailedUploads:](self, "setFailedUploads:", 0);
}

- (void)didStartCollectingDiagnosticExtensionWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BE2F390], "findEntryForDEDIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = (void *)MEMORY[0x24BE2F380];
    v8 = *MEMORY[0x24BE2F320];
    objc_msgSend(v5, "parameterName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "createLoggingEventWith:postfix:", v8, v9);

  }
  else
  {
    -[DEDCloudKitFinisher log](self, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = v4;
      _os_log_impl(&dword_21469E000, v10, OS_LOG_TYPE_DEFAULT, "Failed to find whitelist entry for: %@", (uint8_t *)&v11, 0xCu);
    }

  }
}

- (void)didCancelCollectionOnExtension:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BE2F390], "findEntryForDEDIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = (void *)MEMORY[0x24BE2F380];
    v8 = *MEMORY[0x24BE2F308];
    objc_msgSend(v5, "parameterName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "createLoggingEventWith:postfix:", v8, v9);

  }
  else
  {
    -[DEDCloudKitFinisher log](self, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = v4;
      _os_log_impl(&dword_21469E000, v10, OS_LOG_TYPE_DEFAULT, "Failed to find whitelist entry for: %@", (uint8_t *)&v11, 0xCu);
    }

  }
}

- (void)didCollectAttachmentGroup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x24BE2F390];
  objc_msgSend(v4, "extensionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "findEntryForDEDIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v4, "attachmentItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9)
    {
      v10 = (void *)MEMORY[0x24BE2F380];
      v11 = (uint64_t *)MEMORY[0x24BE2F310];
LABEL_4:
      v12 = *v11;
      objc_msgSend(v7, "parameterName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "createLoggingEventWith:postfix:", v12, v13);

      goto LABEL_9;
    }
    objc_msgSend(v4, "attachmentItems");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    if (!v15)
    {
      v10 = (void *)MEMORY[0x24BE2F380];
      v11 = (uint64_t *)MEMORY[0x24BE2F318];
      goto LABEL_4;
    }
  }
  -[DEDCloudKitFinisher log](self, "log");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "dedExtensionIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringValue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138412290;
    v20 = v18;
    _os_log_impl(&dword_21469E000, v16, OS_LOG_TYPE_DEFAULT, "Failed to find whitelist entry for: %@", (uint8_t *)&v19, 0xCu);

  }
LABEL_9:

}

- (void)didFinishAllCollections
{
  objc_msgSend(MEMORY[0x24BE2F380], "createLoggingEventWith:", *MEMORY[0x24BE2F300]);
}

- (id)encryptLogsIfNecessary:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v4 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__3;
  v12 = __Block_byref_object_dispose__3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __46__DEDCloudKitFinisher_encryptLogsIfNecessary___block_invoke;
  v7[3] = &unk_24D1E55E8;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v7);
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __46__DEDCloudKitFinisher_encryptLogsIfNecessary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  DEDExtensionIdentifier *v14;
  DEDExtensionIdentifier *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(a1 + 32), "encryptLogsForExtensionIdentifier:withAttachmentUrl:", v5, *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i), (_QWORD)v21);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          objc_msgSend(v7, "addObject:", v13);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }

  if (objc_msgSend(v5, "isEqualToString:", CFSTR("els")))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setValue:forKey:", v7, CFSTR("els"));
  }
  else
  {
    v14 = -[DEDExtensionIdentifier initWithString:]([DEDExtensionIdentifier alloc], "initWithString:", v5);
    v15 = v14;
    if (v14)
    {
      v16 = (void *)MEMORY[0x24BE2F390];
      -[DEDExtensionIdentifier extensionIdentifier](v14, "extensionIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "findEntryForBundleIdentifier:", v17);
      v18 = objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        v19 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
        -[NSObject parameterName](v18, "parameterName");
        v20 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setValue:forKey:", v7, v20);
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "log");
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
          __46__DEDCloudKitFinisher_encryptLogsIfNecessary___block_invoke_cold_2();
      }

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "log");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
        __46__DEDCloudKitFinisher_encryptLogsIfNecessary___block_invoke_cold_1();
    }

  }
}

- (id)extractExtensionIdentifierFromAttachmentUrl:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  DEDExtensionIdentifier *v6;
  void *v7;

  objc_msgSend(a3, "pathComponents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "removeLastObject");
  objc_msgSend(v4, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[DEDExtensionIdentifier initWithString:]([DEDExtensionIdentifier alloc], "initWithString:", v5);
  -[DEDExtensionIdentifier extensionIdentifier](v6, "extensionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)encryptLogsForExtensionIdentifier:(id)a3 withAttachmentUrl:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  _BOOL4 v20;
  NSObject *v21;
  int v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[DEDCloudKitFinisher queuePayload](self, "queuePayload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDCloudKitFinisher parsePayloadData:forIdentifier:](self, "parsePayloadData:forIdentifier:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  objc_msgSend(v10, "objectForKey:", CFSTR("encryption"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("encryptor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[DEDEncryptorFactory getEncryptorForExtensionIdentifier:](DEDEncryptorFactory, "getEncryptorForExtensionIdentifier:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[DEDCloudKitFinisher timberLorryUUID](self, "timberLorryUUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[DEDCloudKitFinisher timberLorryUUID](self, "timberLorryUUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKey:", v15, CFSTR("timberLorryUUID"));

    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[DEDCloudKitFinisher sandboxEnvironment](self, "sandboxEnvironment"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v16, CFSTR("cloudKitEnv"));

    objc_msgSend(v7, "URLByDeletingLastPathComponent");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "encryptLogsAtPath:outputDirectory:withMetadata:", v7, v17, v10);
    v18 = (id)objc_claimAutoreleasedReturnValue();

  }
  else if (v11)
  {
    -[DEDCloudKitFinisher log](self, "log");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = os_log_type_enabled(v19, OS_LOG_TYPE_FAULT);
    if (v12)
    {
      if (v20)
        -[DEDCloudKitFinisher encryptLogsForExtensionIdentifier:withAttachmentUrl:].cold.2();
    }
    else if (v20)
    {
      -[DEDCloudKitFinisher encryptLogsForExtensionIdentifier:withAttachmentUrl:].cold.1();
    }

    v18 = 0;
  }
  else
  {
    -[DEDCloudKitFinisher log](self, "log");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v23 = 138412290;
      v24 = v6;
      _os_log_impl(&dword_21469E000, v21, OS_LOG_TYPE_DEFAULT, "No encryption required on %@", (uint8_t *)&v23, 0xCu);
    }

    v18 = v7;
  }

  return v18;
}

- (id)parsePayloadData:(id)a3 forIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  DEDExtensionIdentifier *v9;
  DEDExtensionIdentifier *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;

  v6 = a4;
  objc_msgSend(a3, "objectForKey:", *MEMORY[0x24BE2F370]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("els")))
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = -[DEDExtensionIdentifier initWithString:]([DEDExtensionIdentifier alloc], "initWithString:", v6);
    v10 = v9;
    if (v9)
    {
      v11 = (void *)MEMORY[0x24BE2F390];
      -[DEDExtensionIdentifier extensionIdentifier](v9, "extensionIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "findEntryForBundleIdentifier:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "parameterName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v14);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[DEDCloudKitFinisher log](self, "log");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        -[DEDCloudKitFinisher parsePayloadData:forIdentifier:].cold.1();

      v8 = 0;
    }

  }
  return v8;
}

- (void)writeData:(id)a3 filename:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  -[DEDCloudKitFinisher session](self, "session");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "directoryForBugSessionIdentifier:createIfNeeded:", v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "URLByAppendingPathComponent:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE2F378], "sharedHelper");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "saveData:toFilePath:", v7, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[DEDCloudKitFinisher log](self, "log");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[DEDCloudKitFinisher writeData:filename:].cold.1(v15, v16, v17, v18, v19, v20, v21, v22);

  }
}

- (BOOL)isCompressing
{
  return -[DEDCloudKitFinisher state](self, "state") == 1;
}

- (BOOL)isUploading
{
  return -[DEDCloudKitFinisher state](self, "state") == 2;
}

- (id)additionalStateInfo
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  DEDCloudKitFinisher *v28;
  void *v29;
  uint64_t v30;
  id obj;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[2];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 0x24D1E3000uLL;
  +[DEDDeferredExtensionInfo allInfo](DEDDeferredExtensionInfo, "allInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  -[DEDCloudKitFinisher session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allExtensionIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v6;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v34;
    v28 = self;
    do
    {
      v10 = 0;
      v30 = v8;
      do
      {
        if (*(_QWORD *)v34 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v10);
        v12 = *(void **)(v3 + 2760);
        -[DEDCloudKitFinisher session](self, "session");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "activityStringForBugSessionIdentifier:dedIdentifier:", v14, v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "objectForKeyedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v16 && (objc_msgSend(v16, "isOverdue") & 1) == 0)
        {
          objc_msgSend(v17, "parameters");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v37[0] = v32;
          v18 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v17, "triggerDate");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "timeIntervalSinceNow");
          objc_msgSend(v18, "numberWithDouble:");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v37[1] = v20;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 2);
          v21 = v9;
          v22 = v3;
          v23 = v4;
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "stringValue");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "setObject:forKey:", v24, v25);

          v4 = v23;
          v3 = v22;
          v9 = v21;

          v8 = v30;
          self = v28;

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v8);
  }

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", v29, CFSTR("queued-extensions"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (DEDBugSession)session
{
  return (DEDBugSession *)objc_loadWeakRetained((id *)&self->_session);
}

- (void)setSession:(id)a3
{
  objc_storeWeak((id *)&self->_session, a3);
}

- (OS_os_log)log
{
  return (OS_os_log *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLog:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (unint64_t)totalUploadSize
{
  return self->_totalUploadSize;
}

- (void)setTotalUploadSize:(unint64_t)a3
{
  self->_totalUploadSize = a3;
}

- (int)successfulUploads
{
  return self->_successfulUploads;
}

- (void)setSuccessfulUploads:(int)a3
{
  self->_successfulUploads = a3;
}

- (int)failedUploads
{
  return self->_failedUploads;
}

- (void)setFailedUploads:(int)a3
{
  self->_failedUploads = a3;
}

- (DEDCloudKitAttachmentGroupModel)attachmentGroupModel
{
  return (DEDCloudKitAttachmentGroupModel *)objc_getProperty(self, a2, 56, 1);
}

- (void)setAttachmentGroupModel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSMutableArray)attachments
{
  return (NSMutableArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setAttachments:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSMutableDictionary)uploadedBytes
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setUploadedBytes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (DEDCloudKitClient)cloudKitClient
{
  return self->_cloudKitClient;
}

- (void)setCloudKitClient:(id)a3
{
  objc_storeStrong((id *)&self->_cloudKitClient, a3);
}

- (NSDictionary)queuePayload
{
  return self->_queuePayload;
}

- (void)setQueuePayload:(id)a3
{
  objc_storeStrong((id *)&self->_queuePayload, a3);
}

- (NSString)timberLorryUUID
{
  return self->_timberLorryUUID;
}

- (void)setTimberLorryUUID:(id)a3
{
  objc_storeStrong((id *)&self->_timberLorryUUID, a3);
}

- (BOOL)sandboxEnvironment
{
  return self->_sandboxEnvironment;
}

- (void)setSandboxEnvironment:(BOOL)a3
{
  self->_sandboxEnvironment = a3;
}

- (ELSManager)elsManager
{
  return self->_elsManager;
}

- (void)setElsManager:(id)a3
{
  objc_storeStrong((id *)&self->_elsManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elsManager, 0);
  objc_storeStrong((id *)&self->_timberLorryUUID, 0);
  objc_storeStrong((id *)&self->_queuePayload, 0);
  objc_storeStrong((id *)&self->_cloudKitClient, 0);
  objc_storeStrong((id *)&self->_uploadedBytes, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_attachmentGroupModel, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_destroyWeak((id *)&self->_session);
}

- (void)finishSession:(uint64_t)a3 withConfiguration:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21469E000, a1, a3, "No cloudkitContainer provided in bug session configuration, cleaning up...", a5, a6, a7, a8, 0);
}

- (void)finishSession:withConfiguration:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_21469E000, v0, v1, "Error parsing the Payload from CloudKit Data. Error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)logError:(NSObject *)a3 forRecord:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint8_t v6[12];
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "recordType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  v7 = 2114;
  v8 = a2;
  _os_log_error_impl(&dword_21469E000, a3, OS_LOG_TYPE_ERROR, "Error saving %@: %{public}@", v6, 0x16u);

}

- (void)getAttachmentURLsWithProgressHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_21469E000, v0, v1, "Error creating ELS Directory %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __46__DEDCloudKitFinisher_encryptLogsIfNecessary___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_21469E000, v0, v1, "Could not identify diagnostic extension with id %@. Skipping the following files: %@");
  OUTLINED_FUNCTION_1();
}

void __46__DEDCloudKitFinisher_encryptLogsIfNecessary___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_21469E000, v0, v1, "Could not find correlated queue item name for %@. Skipping the following files: %@");
  OUTLINED_FUNCTION_1();
}

- (void)encryptLogsForExtensionIdentifier:withAttachmentUrl:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_21469E000, v0, v1, "No encryptor specified for DE: %@ which requires encryption. Dropping file attachment", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)encryptLogsForExtensionIdentifier:withAttachmentUrl:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_21469E000, v0, v1, "Could not locate an encryptor for: %@ for the DE: %@. Dropping attachment");
  OUTLINED_FUNCTION_1();
}

- (void)parsePayloadData:forIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_21469E000, v0, v1, "Could not identify diagnostic extension with id %@. No paylaod returned", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)writeData:(uint64_t)a3 filename:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21469E000, a1, a3, "Unable to add Data to the bug session", a5, a6, a7, a8, 0);
}

@end

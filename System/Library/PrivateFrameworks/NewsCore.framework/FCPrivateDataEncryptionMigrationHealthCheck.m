@implementation FCPrivateDataEncryptionMigrationHealthCheck

- (FCPrivateDataEncryptionMigrationHealthCheck)init
{
  FCPrivateDataEncryptionMigrationHealthCheck *v2;
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  CKContainer *container;
  uint64_t v8;
  CKContainer *containerWithZoneWidePCS;
  void *v10;
  uint64_t v11;
  CKContainer *secureContainer;
  uint64_t v13;
  FCCKPrivateDatabaseSchema *schema;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)FCPrivateDataEncryptionMigrationHealthCheck;
  v2 = -[FCPrivateDataEncryptionMigrationHealthCheck init](&v16, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C94C50]);
    objc_msgSend(v3, "setUseZoneWidePCS:", 0);
    v4 = objc_alloc_init(MEMORY[0x1E0C94C50]);
    objc_msgSend(v4, "setUseZoneWidePCS:", 1);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94C40]), "initWithContainerIdentifier:environment:", CFSTR("com.apple.news.private"), 1);
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C94C28]), "initWithContainerID:options:", v5, v3);
    container = v2->_container;
    v2->_container = (CKContainer *)v6;

    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C94C28]), "initWithContainerID:options:", v5, v4);
    containerWithZoneWidePCS = v2->_containerWithZoneWidePCS;
    v2->_containerWithZoneWidePCS = (CKContainer *)v8;

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94C40]), "initWithContainerIdentifier:environment:", CFSTR("com.apple.news.private.secure"), 1);
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0C94C28]), "initWithContainerID:options:", v10, v4);
    secureContainer = v2->_secureContainer;
    v2->_secureContainer = (CKContainer *)v11;

    +[FCCKPrivateDatabase privateDatabaseSchema]();
    v13 = objc_claimAutoreleasedReturnValue();
    schema = v2->_schema;
    v2->_schema = (FCCKPrivateDatabaseSchema *)v13;

    v2->_toVersion = 1;
  }
  return v2;
}

+ (id)run
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "run");

  return 0;
}

- (void)run
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  FCCKPrivateDatabase *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id *v19;
  uint64_t *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[4];
  uint64_t *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  -[FCPrivateDataEncryptionMigrationHealthCheck _eraseAllPrivateData](self, "_eraseAllPrivateData");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCPrivateDataEncryptionMigrationHealthCheck _prepareHistoryAndReturnExpectations](self, "_prepareHistoryAndReturnExpectations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  -[FCPrivateDataEncryptionMigrationHealthCheck _prepareIssueHistoryAndReturnExpectations](self, "_prepareIssueHistoryAndReturnExpectations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v5);

  -[FCPrivateDataEncryptionMigrationHealthCheck _prepareReadingListAndReturnExpectations](self, "_prepareReadingListAndReturnExpectations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v6);

  -[FCPrivateDataEncryptionMigrationHealthCheck _prepareSubscriptionsAndReturnExpectations](self, "_prepareSubscriptionsAndReturnExpectations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v7);

  -[FCPrivateDataEncryptionMigrationHealthCheck _prepareSensitiveSubscriptionsAndReturnExpectations](self, "_prepareSensitiveSubscriptionsAndReturnExpectations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v8);

  -[FCPrivateDataEncryptionMigrationHealthCheck _prepareUserInfoAndReturnExpectations](self, "_prepareUserInfoAndReturnExpectations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v9);

  -[FCPrivateDataEncryptionMigrationHealthCheck _prepareTagSettingsAndReturnExpectations](self, "_prepareTagSettingsAndReturnExpectations");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v10);

  -[FCPrivateDataEncryptionMigrationHealthCheck _preparePersonalizationProfileAndReturnExpectations](self, "_preparePersonalizationProfileAndReturnExpectations");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v11);

  -[FCPrivateDataEncryptionMigrationHealthCheck _prepareReferenceToChannelMembershipsAndReturnExpectations](self, "_prepareReferenceToChannelMembershipsAndReturnExpectations");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v12);

  -[FCPrivateDataEncryptionMigrationHealthCheck _prepareSentinelsAndReturnExpectations](self, "_prepareSentinelsAndReturnExpectations");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v13);

  v14 = [FCCKPrivateDatabase alloc];
  -[FCPrivateDataEncryptionMigrationHealthCheck container](self, "container");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "containerIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCPrivateDataEncryptionMigrationHealthCheck secureContainer](self, "secureContainer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "containerIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[FCCKPrivateDatabase initWithContainerIdentifier:secureContainerIdentifier:productionEnvironment:encryptionDelegate:networkBehaviorMonitor:privateDataSyncingEnabled:](v14, v16, v18, 1, self, 0, 1);

  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __50__FCPrivateDataEncryptionMigrationHealthCheck_run__block_invoke;
  v30[3] = &unk_1E463BA48;
  v20 = v19;
  v31 = v20;
  FCWaitUntilBlockIsInvoked(v30);
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (!v20 || v20[5] <= 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("private database started up with encryption disabled"));
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v21 = v3;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v27;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v27 != v24)
          objc_enumerationMutation(v21);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v25++), "validate", (_QWORD)v26);
      }
      while (v23 != v25);
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    }
    while (v23);
  }

}

void __50__FCPrivateDataEncryptionMigrationHealthCheck_run__block_invoke(uint64_t a1, void *a2)
{
  -[FCCKPrivateDatabase t_performStartUpWithCompletion:](*(_QWORD *)(a1 + 32), a2);
}

- (void)_eraseAllPrivateData
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  _QWORD v30[4];
  id v31;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCPrivateDataEncryptionMigrationHealthCheck schema](self, "schema");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __67__FCPrivateDataEncryptionMigrationHealthCheck__eraseAllPrivateData__block_invoke;
  v30[3] = &unk_1E463BA70;
  v5 = v3;
  v31 = v5;
  -[FCCKPrivateDatabaseSchema enumerateZoneSchemasWithBlock:]((uint64_t)v4, v30);

  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__5;
  v28 = __Block_byref_object_dispose__5;
  v29 = 0;
  v6 = objc_alloc_init(MEMORY[0x1E0C94EF0]);
  -[FCPrivateDataEncryptionMigrationHealthCheck container](self, "container");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "privateCloudDatabase");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDatabase:", v8);

  objc_msgSend(v5, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRecordZoneIDsToDelete:", v9);

  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __67__FCPrivateDataEncryptionMigrationHealthCheck__eraseAllPrivateData__block_invoke_18;
  v23[3] = &unk_1E463BA98;
  v23[4] = &v24;
  objc_msgSend(v6, "setModifyRecordZonesCompletionBlock:", v23);
  objc_msgSend(v6, "start");
  objc_msgSend(v6, "waitUntilFinished");
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  v10 = (void *)v25[5];
  if (v10 && (objc_msgSend(v10, "fc_isCKUnknownItemError") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("error deleting private data: %@"), v25[5]);
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__5;
  v21 = __Block_byref_object_dispose__5;
  v22 = 0;
  v11 = objc_alloc_init(MEMORY[0x1E0C94EF0]);
  -[FCPrivateDataEncryptionMigrationHealthCheck secureContainer](self, "secureContainer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "privateCloudDatabase");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDatabase:", v13);

  objc_msgSend(v5, "allObjects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setRecordZoneIDsToDelete:", v14);

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __67__FCPrivateDataEncryptionMigrationHealthCheck__eraseAllPrivateData__block_invoke_2;
  v16[3] = &unk_1E463BA98;
  v16[4] = &v17;
  objc_msgSend(v11, "setModifyRecordZonesCompletionBlock:", v16);
  objc_msgSend(v11, "start");
  objc_msgSend(v11, "waitUntilFinished");
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  v15 = (void *)v18[5];
  if (v15 && (objc_msgSend(v15, "fc_isCKUnknownItemError") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("error deleting private data: %@"), v18[5]);

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v24, 8);

}

void __67__FCPrivateDataEncryptionMigrationHealthCheck__eraseAllPrivateData__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  if (a2)
    v3 = *(void **)(a2 + 24);
  else
    v3 = 0;
  v4 = v3;
  objc_msgSend(v2, "addObject:", v4);

}

void __67__FCPrivateDataEncryptionMigrationHealthCheck__eraseAllPrivateData__block_invoke_18(uint64_t a1, int a2, int a3, id obj)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
}

void __67__FCPrivateDataEncryptionMigrationHealthCheck__eraseAllPrivateData__block_invoke_2(uint64_t a1, int a2, int a3, id obj)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
}

- (id)_prepareHistoryAndReturnExpectations
{
  FCCKRecordZoneIDMapping *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  char v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  char v14;
  void *v15;
  void *v16;
  char v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  _QWORD v67[5];
  id v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  id v75;
  _QWORD v76[4];
  id v77;
  FCPrivateDataEncryptionMigrationHealthCheck *v78;
  uint64_t *v79;
  uint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  uint64_t (*v83)(uint64_t, uint64_t);
  void (*v84)(uint64_t);
  id v85;
  _QWORD v86[3];
  _QWORD v87[3];

  v87[1] = *MEMORY[0x1E0C80C00];
  -[FCPrivateDataEncryptionMigrationHealthCheck schema](self, "schema");
  v3 = (FCCKRecordZoneIDMapping *)objc_claimAutoreleasedReturnValue();
  -[FCCKPrivateDatabaseSchema mappingFromRecordType:inZoneName:toVersion:](v3, CFSTR("ReadingHistoryItem"), CFSTR("ReadingHistory"), -[FCPrivateDataEncryptionMigrationHealthCheck toVersion](self, "toVersion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  objc_msgSend(v4, "fromZoneSchema");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = *(void **)(v5 + 16);
  else
    v7 = 0;
  v8 = v7;
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("ReadingHistory"));

  if ((v9 & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("reading history zone schema has wrong zone name"));
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  objc_msgSend(v4, "fromRecordSchema");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = *(void **)(v10 + 16);
  else
    v12 = 0;
  v13 = v12;
  v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("ReadingHistoryItem"));

  if ((v14 & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("reading history record schema has wrong record type"));
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  objc_msgSend(v4, "toRecordSchema");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKRecordSchema allEncryptedFieldNames]((uint64_t)v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "containsObject:", CFSTR("articleID"));

  if ((v17 & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("reading history record should have encrypted articleID"));
  objc_msgSend(v4, "fromZoneSchema");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  if (v18)
    v20 = *(void **)(v18 + 24);
  else
    v20 = 0;
  v21 = v20;

  objc_msgSend(v4, "toZoneSchema");
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)v22;
  if (v22)
    v24 = *(void **)(v22 + 24);
  else
    v24 = 0;
  v66 = v24;

  v80 = 0;
  v81 = &v80;
  v82 = 0x3032000000;
  v83 = __Block_byref_object_copy__5;
  v84 = __Block_byref_object_dispose__5;
  v85 = 0;
  v76[0] = MEMORY[0x1E0C809B0];
  v76[1] = 3221225472;
  v76[2] = __83__FCPrivateDataEncryptionMigrationHealthCheck__prepareHistoryAndReturnExpectations__block_invoke;
  v76[3] = &unk_1E463BAE8;
  v25 = v21;
  v77 = v25;
  v78 = self;
  v79 = &v80;
  FCWaitUntilBlockIsInvoked(v76);
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (v81[5])
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("error saving history zone: %@"), v81[5]);
  FCRandomTagCloudKitID();
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  FCRandomArticleCloudKitID();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  FCHistoryItemIDFromArticleID((uint64_t)v26);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:zoneID:", v65, v25);
  v27 = objc_alloc(MEMORY[0x1E0C95048]);
  objc_msgSend(v4, "fromRecordSchema");
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = (void *)v28;
  if (v28)
    v30 = *(void **)(v28 + 16);
  else
    v30 = 0;
  v31 = v30;
  v32 = (void *)objc_msgSend(v27, "initWithRecordType:recordID:", v31, v64);

  objc_msgSend(v32, "setObject:forKeyedSubscript:", v26, CFSTR("articleID"));
  objc_msgSend(v32, "setObject:forKeyedSubscript:", v63, CFSTR("sourceChannelTagID"));
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "UUIDString");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setObject:forKeyedSubscript:", v34, CFSTR("deviceID"));

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setObject:forKeyedSubscript:", v35, CFSTR("lastVisited"));

  objc_msgSend(v32, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("articleRead"));
  objc_msgSend(v32, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("articleSeen"));
  objc_msgSend(v32, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("completedListening"));
  objc_msgSend(v32, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("completedReading"));
  objc_msgSend(v32, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("liked"));
  objc_msgSend(v32, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("disliked"));
  objc_msgSend(v32, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("offensive"));
  objc_msgSend(v32, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("articleConsumed"));
  objc_msgSend(v32, "setObject:forKeyedSubscript:", &unk_1E470A2B0, CFSTR("writerVersionHighWatermark"));
  objc_msgSend(v32, "setObject:forKeyedSubscript:", &unk_1E470A2B0, CFSTR("readerMinimumRequiredVersion"));
  objc_msgSend(v32, "setObject:forKeyedSubscript:", &unk_1E470A2C8, CFSTR("listenedCount"));
  objc_msgSend(v32, "setObject:forKeyedSubscript:", &unk_1E470D570, CFSTR("listeningProgress"));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setObject:forKeyedSubscript:", v36, CFSTR("listeningProgressLastSaved"));

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setObject:forKeyedSubscript:", v37, CFSTR("lastListened"));

  objc_msgSend(v32, "setObject:forKeyedSubscript:", &stru_1E464BC40, CFSTR("readingPosition"));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setObject:forKeyedSubscript:", v38, CFSTR("readingPositionLastSaved"));

  objc_msgSend(v32, "setObject:forKeyedSubscript:", &unk_1E470A2C8, CFSTR("readCount"));
  objc_msgSend(v32, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("removedFromAudio"));
  objc_msgSend(v32, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("pruningDisabled"));
  v70 = 0;
  v71 = &v70;
  v72 = 0x3032000000;
  v73 = __Block_byref_object_copy__5;
  v74 = __Block_byref_object_dispose__5;
  v75 = 0;
  v67[0] = MEMORY[0x1E0C809B0];
  v67[1] = 3221225472;
  v67[2] = __83__FCPrivateDataEncryptionMigrationHealthCheck__prepareHistoryAndReturnExpectations__block_invoke_40;
  v67[3] = &unk_1E463BAE8;
  v67[4] = self;
  v39 = v32;
  v68 = v39;
  v69 = &v70;
  FCWaitUntilBlockIsInvoked(v67);
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (v71[5])
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("error saving history record: %@"), v71[5]);
  v40 = (void *)objc_opt_new();
  -[FCPrivateDataEncryptionMigrationHealthCheck secureContainer](self, "secureContainer");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "privateCloudDatabase");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setDatabase:", v42);

  objc_msgSend(v40, "setZoneID:", v66);
  objc_msgSend(v40, "setShouldExist:", 1);
  v43 = (void *)objc_opt_new();
  -[FCPrivateDataEncryptionMigrationHealthCheck container](self, "container");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "privateCloudDatabase");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setDatabase:", v45);

  objc_msgSend(v43, "setZoneID:", v25);
  objc_msgSend(v43, "setShouldExist:", 0);
  v46 = (void *)objc_opt_new();
  objc_msgSend(v4, "toRecordSchema");
  v47 = objc_claimAutoreleasedReturnValue();
  v48 = (void *)v47;
  if (v47)
    v49 = *(void **)(v47 + 16);
  else
    v49 = 0;
  v50 = v49;
  objc_msgSend(v46, "setRecordType:", v50);

  objc_msgSend(v4, "toRecordSchema");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKRecordSchema allUnencryptedFieldNames]((uint64_t)v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setUnencryptedFields:", v52);

  objc_msgSend(v4, "toRecordSchema");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKRecordSchema allEncryptedFieldNames]((uint64_t)v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setEncryptedFields:", v54);

  objc_msgSend(v39, "valueStore");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "values");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setExpectedValues:", v56);

  v57 = (void *)objc_opt_new();
  -[FCPrivateDataEncryptionMigrationHealthCheck secureContainer](self, "secureContainer");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "privateCloudDatabase");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setDatabase:", v59);

  objc_msgSend(v57, "setZoneID:", v66);
  v87[0] = v46;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v87, 1);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setRecordTests:", v60);

  v86[0] = v40;
  v86[1] = v57;
  v86[2] = v43;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v86, 3);
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v70, 8);
  _Block_object_dispose(&v80, 8);

  return v61;
}

void __83__FCPrivateDataEncryptionMigrationHealthCheck__prepareHistoryAndReturnExpectations__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95088]), "initWithZoneID:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "container");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "privateCloudDatabase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __83__FCPrivateDataEncryptionMigrationHealthCheck__prepareHistoryAndReturnExpectations__block_invoke_2;
  v9[3] = &unk_1E463BAC0;
  v7 = *(_QWORD *)(a1 + 48);
  v10 = v3;
  v11 = v7;
  v8 = v3;
  objc_msgSend(v6, "saveRecordZone:completionHandler:", v4, v9);

}

void __83__FCPrivateDataEncryptionMigrationHealthCheck__prepareHistoryAndReturnExpectations__block_invoke_2(uint64_t a1, int a2, id obj)
{
  id v5;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
  v5 = obj;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __83__FCPrivateDataEncryptionMigrationHealthCheck__prepareHistoryAndReturnExpectations__block_invoke_40(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "container");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "privateCloudDatabase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __83__FCPrivateDataEncryptionMigrationHealthCheck__prepareHistoryAndReturnExpectations__block_invoke_2_41;
  v9[3] = &unk_1E463BB10;
  v7 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v10 = v3;
  v11 = v6;
  v8 = v3;
  objc_msgSend(v5, "saveRecord:completionHandler:", v7, v9);

}

void __83__FCPrivateDataEncryptionMigrationHealthCheck__prepareHistoryAndReturnExpectations__block_invoke_2_41(uint64_t a1, int a2, id obj)
{
  id v5;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
  v5 = obj;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (id)_prepareIssueHistoryAndReturnExpectations
{
  FCCKRecordZoneIDMapping *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  char v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  char v14;
  void *v15;
  void *v16;
  char v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  _QWORD v65[5];
  id v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t (*v71)(uint64_t, uint64_t);
  void (*v72)(uint64_t);
  id v73;
  _QWORD v74[4];
  id v75;
  FCPrivateDataEncryptionMigrationHealthCheck *v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  uint64_t (*v81)(uint64_t, uint64_t);
  void (*v82)(uint64_t);
  id v83;
  _QWORD v84[3];
  _QWORD v85[3];

  v85[1] = *MEMORY[0x1E0C80C00];
  -[FCPrivateDataEncryptionMigrationHealthCheck schema](self, "schema");
  v3 = (FCCKRecordZoneIDMapping *)objc_claimAutoreleasedReturnValue();
  -[FCCKPrivateDatabaseSchema mappingFromRecordType:inZoneName:toVersion:](v3, CFSTR("IssueReadingHistoryItem"), CFSTR("IssueReadingHistory"), -[FCPrivateDataEncryptionMigrationHealthCheck toVersion](self, "toVersion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  objc_msgSend(v4, "fromZoneSchema");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = *(void **)(v5 + 16);
  else
    v7 = 0;
  v8 = v7;
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("IssueReadingHistory"));

  if ((v9 & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("issue reading history zone schema has wrong zone name"));
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  objc_msgSend(v4, "fromRecordSchema");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = *(void **)(v10 + 16);
  else
    v12 = 0;
  v13 = v12;
  v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("IssueReadingHistoryItem"));

  if ((v14 & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("issue reading history record schema has wrong record type"));
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  objc_msgSend(v4, "toRecordSchema");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKRecordSchema allEncryptedFieldNames]((uint64_t)v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "containsObject:", CFSTR("issueID"));

  if ((v17 & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("issue reading history record should have encrypted issueID"));
  objc_msgSend(v4, "fromZoneSchema");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  if (v18)
    v20 = *(void **)(v18 + 24);
  else
    v20 = 0;
  v21 = v20;

  objc_msgSend(v4, "toZoneSchema");
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)v22;
  if (v22)
    v24 = *(void **)(v22 + 24);
  else
    v24 = 0;
  v64 = v24;

  v78 = 0;
  v79 = &v78;
  v80 = 0x3032000000;
  v81 = __Block_byref_object_copy__5;
  v82 = __Block_byref_object_dispose__5;
  v83 = 0;
  v25 = MEMORY[0x1E0C809B0];
  v74[0] = MEMORY[0x1E0C809B0];
  v74[1] = 3221225472;
  v74[2] = __88__FCPrivateDataEncryptionMigrationHealthCheck__prepareIssueHistoryAndReturnExpectations__block_invoke;
  v74[3] = &unk_1E463BAE8;
  v26 = v21;
  v75 = v26;
  v76 = self;
  v77 = &v78;
  FCWaitUntilBlockIsInvoked(v74);
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (v79[5])
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("error saving issue history zone: %@"), v79[5]);
  FCRandomIssueCloudKitID();
  v27 = objc_claimAutoreleasedReturnValue();
  FCIssueHistoryItemIDFromIssueID(v27);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = (void *)v27;
  v62 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:zoneID:", v63, v26);
  v28 = objc_alloc(MEMORY[0x1E0C95048]);
  objc_msgSend(v4, "fromRecordSchema");
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = (void *)v29;
  if (v29)
    v31 = *(void **)(v29 + 16);
  else
    v31 = 0;
  v32 = v31;
  v33 = (void *)objc_msgSend(v28, "initWithRecordType:recordID:", v32, v62);

  objc_msgSend(v33, "setObject:forKeyedSubscript:", v61, CFSTR("issueID"));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setObject:forKeyedSubscript:", v34, CFSTR("lastVisited"));

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setObject:forKeyedSubscript:", v35, CFSTR("lastBadged"));

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setObject:forKeyedSubscript:", v36, CFSTR("lastEngaged"));

  v68 = 0;
  v69 = &v68;
  v70 = 0x3032000000;
  v71 = __Block_byref_object_copy__5;
  v72 = __Block_byref_object_dispose__5;
  v73 = 0;
  v65[0] = v25;
  v65[1] = 3221225472;
  v65[2] = __88__FCPrivateDataEncryptionMigrationHealthCheck__prepareIssueHistoryAndReturnExpectations__block_invoke_3;
  v65[3] = &unk_1E463BAE8;
  v65[4] = self;
  v37 = v33;
  v66 = v37;
  v67 = &v68;
  FCWaitUntilBlockIsInvoked(v65);
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (v69[5])
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("error saving issue history record: %@"), v69[5]);
  v38 = (void *)objc_opt_new();
  -[FCPrivateDataEncryptionMigrationHealthCheck secureContainer](self, "secureContainer");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "privateCloudDatabase");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setDatabase:", v40);

  objc_msgSend(v38, "setZoneID:", v64);
  objc_msgSend(v38, "setShouldExist:", 1);
  v41 = (void *)objc_opt_new();
  -[FCPrivateDataEncryptionMigrationHealthCheck container](self, "container");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "privateCloudDatabase");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setDatabase:", v43);

  objc_msgSend(v41, "setZoneID:", v26);
  objc_msgSend(v41, "setShouldExist:", 0);
  v44 = (void *)objc_opt_new();
  objc_msgSend(v4, "toRecordSchema");
  v45 = objc_claimAutoreleasedReturnValue();
  v46 = (void *)v45;
  if (v45)
    v47 = *(void **)(v45 + 16);
  else
    v47 = 0;
  v48 = v47;
  objc_msgSend(v44, "setRecordType:", v48);

  objc_msgSend(v4, "toRecordSchema");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKRecordSchema allUnencryptedFieldNames]((uint64_t)v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setUnencryptedFields:", v50);

  objc_msgSend(v4, "toRecordSchema");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKRecordSchema allEncryptedFieldNames]((uint64_t)v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setEncryptedFields:", v52);

  objc_msgSend(v37, "valueStore");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "values");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setExpectedValues:", v54);

  v55 = (void *)objc_opt_new();
  -[FCPrivateDataEncryptionMigrationHealthCheck secureContainer](self, "secureContainer");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "privateCloudDatabase");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setDatabase:", v57);

  objc_msgSend(v55, "setZoneID:", v64);
  v85[0] = v44;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v85, 1);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setRecordTests:", v58);

  v84[0] = v38;
  v84[1] = v55;
  v84[2] = v41;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v84, 3);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v68, 8);
  _Block_object_dispose(&v78, 8);

  return v59;
}

void __88__FCPrivateDataEncryptionMigrationHealthCheck__prepareIssueHistoryAndReturnExpectations__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95088]), "initWithZoneID:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "container");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "privateCloudDatabase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __88__FCPrivateDataEncryptionMigrationHealthCheck__prepareIssueHistoryAndReturnExpectations__block_invoke_2;
  v9[3] = &unk_1E463BAC0;
  v7 = *(_QWORD *)(a1 + 48);
  v10 = v3;
  v11 = v7;
  v8 = v3;
  objc_msgSend(v6, "saveRecordZone:completionHandler:", v4, v9);

}

void __88__FCPrivateDataEncryptionMigrationHealthCheck__prepareIssueHistoryAndReturnExpectations__block_invoke_2(uint64_t a1, int a2, id obj)
{
  id v5;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
  v5 = obj;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __88__FCPrivateDataEncryptionMigrationHealthCheck__prepareIssueHistoryAndReturnExpectations__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "container");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "privateCloudDatabase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __88__FCPrivateDataEncryptionMigrationHealthCheck__prepareIssueHistoryAndReturnExpectations__block_invoke_4;
  v9[3] = &unk_1E463BB10;
  v7 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v10 = v3;
  v11 = v6;
  v8 = v3;
  objc_msgSend(v5, "saveRecord:completionHandler:", v7, v9);

}

void __88__FCPrivateDataEncryptionMigrationHealthCheck__prepareIssueHistoryAndReturnExpectations__block_invoke_4(uint64_t a1, int a2, id obj)
{
  id v5;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
  v5 = obj;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (id)_prepareReadingListAndReturnExpectations
{
  FCCKRecordZoneIDMapping *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  char v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  char v14;
  void *v15;
  void *v16;
  char v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  _QWORD v63[5];
  id v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t (*v69)(uint64_t, uint64_t);
  void (*v70)(uint64_t);
  id v71;
  _QWORD v72[4];
  id v73;
  FCPrivateDataEncryptionMigrationHealthCheck *v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t (*v79)(uint64_t, uint64_t);
  void (*v80)(uint64_t);
  id v81;
  _QWORD v82[3];
  _QWORD v83[3];

  v83[1] = *MEMORY[0x1E0C80C00];
  -[FCPrivateDataEncryptionMigrationHealthCheck schema](self, "schema");
  v3 = (FCCKRecordZoneIDMapping *)objc_claimAutoreleasedReturnValue();
  -[FCCKPrivateDatabaseSchema mappingFromRecordType:inZoneName:toVersion:](v3, CFSTR("ReadingListEntry"), CFSTR("ReadingList"), -[FCPrivateDataEncryptionMigrationHealthCheck toVersion](self, "toVersion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  objc_msgSend(v4, "fromZoneSchema");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = *(void **)(v5 + 16);
  else
    v7 = 0;
  v8 = v7;
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("ReadingList"));

  if ((v9 & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("reading list zone schema has wrong zone name"));
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  objc_msgSend(v4, "fromRecordSchema");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = *(void **)(v10 + 16);
  else
    v12 = 0;
  v13 = v12;
  v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("ReadingListEntry"));

  if ((v14 & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("reading list record schema has wrong record type"));
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  objc_msgSend(v4, "toRecordSchema");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKRecordSchema allEncryptedFieldNames]((uint64_t)v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "containsObject:", CFSTR("articleID"));

  if ((v17 & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("reading list record should have encrypted articleID"));
  objc_msgSend(v4, "fromZoneSchema");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  if (v18)
    v20 = *(void **)(v18 + 24);
  else
    v20 = 0;
  v21 = v20;

  objc_msgSend(v4, "toZoneSchema");
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)v22;
  if (v22)
    v24 = *(void **)(v22 + 24);
  else
    v24 = 0;
  v62 = v24;

  v76 = 0;
  v77 = &v76;
  v78 = 0x3032000000;
  v79 = __Block_byref_object_copy__5;
  v80 = __Block_byref_object_dispose__5;
  v81 = 0;
  v25 = MEMORY[0x1E0C809B0];
  v72[0] = MEMORY[0x1E0C809B0];
  v72[1] = 3221225472;
  v72[2] = __87__FCPrivateDataEncryptionMigrationHealthCheck__prepareReadingListAndReturnExpectations__block_invoke;
  v72[3] = &unk_1E463BAE8;
  v26 = v21;
  v73 = v26;
  v74 = self;
  v75 = &v76;
  FCWaitUntilBlockIsInvoked(v72);
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (v77[5])
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("error saving reading list zone: %@"), v77[5]);
  FCRandomArticleCloudKitID();
  v27 = objc_claimAutoreleasedReturnValue();
  FCReadingListEntryIDFromArticleID(v27);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = (void *)v27;
  v60 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:zoneID:", v61, v26);
  v28 = objc_alloc(MEMORY[0x1E0C95048]);
  objc_msgSend(v4, "fromRecordSchema");
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = (void *)v29;
  if (v29)
    v31 = *(void **)(v29 + 16);
  else
    v31 = 0;
  v32 = v31;
  v33 = (void *)objc_msgSend(v28, "initWithRecordType:recordID:", v32, v60);

  objc_msgSend(v33, "setObject:forKeyedSubscript:", v59, CFSTR("articleID"));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setObject:forKeyedSubscript:", v34, CFSTR("dateAdded"));

  objc_msgSend(v33, "setObject:forKeyedSubscript:", &unk_1E470A2E0, CFSTR("origin"));
  objc_msgSend(v33, "setObject:forKeyedSubscript:", &unk_1E470A2B0, CFSTR("writerVersionHighWatermark"));
  objc_msgSend(v33, "setObject:forKeyedSubscript:", &unk_1E470A2B0, CFSTR("readerMinimumRequiredVersion"));
  v66 = 0;
  v67 = &v66;
  v68 = 0x3032000000;
  v69 = __Block_byref_object_copy__5;
  v70 = __Block_byref_object_dispose__5;
  v71 = 0;
  v63[0] = v25;
  v63[1] = 3221225472;
  v63[2] = __87__FCPrivateDataEncryptionMigrationHealthCheck__prepareReadingListAndReturnExpectations__block_invoke_69;
  v63[3] = &unk_1E463BAE8;
  v63[4] = self;
  v35 = v33;
  v64 = v35;
  v65 = &v66;
  FCWaitUntilBlockIsInvoked(v63);
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (v67[5])
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("error saving reading list record: %@"), v67[5]);
  v36 = (void *)objc_opt_new();
  -[FCPrivateDataEncryptionMigrationHealthCheck secureContainer](self, "secureContainer");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "privateCloudDatabase");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setDatabase:", v38);

  objc_msgSend(v36, "setZoneID:", v62);
  objc_msgSend(v36, "setShouldExist:", 1);
  v39 = (void *)objc_opt_new();
  -[FCPrivateDataEncryptionMigrationHealthCheck container](self, "container");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "privateCloudDatabase");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setDatabase:", v41);

  objc_msgSend(v39, "setZoneID:", v26);
  objc_msgSend(v39, "setShouldExist:", 0);
  v42 = (void *)objc_opt_new();
  objc_msgSend(v4, "toRecordSchema");
  v43 = objc_claimAutoreleasedReturnValue();
  v44 = (void *)v43;
  if (v43)
    v45 = *(void **)(v43 + 16);
  else
    v45 = 0;
  v46 = v45;
  objc_msgSend(v42, "setRecordType:", v46);

  objc_msgSend(v4, "toRecordSchema");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKRecordSchema allUnencryptedFieldNames]((uint64_t)v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setUnencryptedFields:", v48);

  objc_msgSend(v4, "toRecordSchema");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKRecordSchema allEncryptedFieldNames]((uint64_t)v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setEncryptedFields:", v50);

  objc_msgSend(v35, "valueStore");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "values");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setExpectedValues:", v52);

  v53 = (void *)objc_opt_new();
  -[FCPrivateDataEncryptionMigrationHealthCheck secureContainer](self, "secureContainer");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "privateCloudDatabase");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setDatabase:", v55);

  objc_msgSend(v53, "setZoneID:", v62);
  v83[0] = v42;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v83, 1);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setRecordTests:", v56);

  v82[0] = v36;
  v82[1] = v53;
  v82[2] = v39;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v82, 3);
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v66, 8);
  _Block_object_dispose(&v76, 8);

  return v57;
}

void __87__FCPrivateDataEncryptionMigrationHealthCheck__prepareReadingListAndReturnExpectations__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95088]), "initWithZoneID:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "container");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "privateCloudDatabase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __87__FCPrivateDataEncryptionMigrationHealthCheck__prepareReadingListAndReturnExpectations__block_invoke_2;
  v9[3] = &unk_1E463BAC0;
  v7 = *(_QWORD *)(a1 + 48);
  v10 = v3;
  v11 = v7;
  v8 = v3;
  objc_msgSend(v6, "saveRecordZone:completionHandler:", v4, v9);

}

void __87__FCPrivateDataEncryptionMigrationHealthCheck__prepareReadingListAndReturnExpectations__block_invoke_2(uint64_t a1, int a2, id obj)
{
  id v5;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
  v5 = obj;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __87__FCPrivateDataEncryptionMigrationHealthCheck__prepareReadingListAndReturnExpectations__block_invoke_69(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "container");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "privateCloudDatabase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __87__FCPrivateDataEncryptionMigrationHealthCheck__prepareReadingListAndReturnExpectations__block_invoke_2_70;
  v9[3] = &unk_1E463BB10;
  v7 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v10 = v3;
  v11 = v6;
  v8 = v3;
  objc_msgSend(v5, "saveRecord:completionHandler:", v7, v9);

}

void __87__FCPrivateDataEncryptionMigrationHealthCheck__prepareReadingListAndReturnExpectations__block_invoke_2_70(uint64_t a1, int a2, id obj)
{
  id v5;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
  v5 = obj;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (id)_prepareSubscriptionsAndReturnExpectations
{
  FCCKRecordZoneIDMapping *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  char v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  char v14;
  void *v15;
  void *v16;
  char v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v58;
  void *v59;
  id v60;
  _QWORD v61[5];
  id v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t (*v67)(uint64_t, uint64_t);
  void (*v68)(uint64_t);
  id v69;
  _QWORD v70[4];
  id v71;
  FCPrivateDataEncryptionMigrationHealthCheck *v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t (*v77)(uint64_t, uint64_t);
  void (*v78)(uint64_t);
  id v79;
  _QWORD v80[3];
  _QWORD v81[3];

  v81[1] = *MEMORY[0x1E0C80C00];
  -[FCPrivateDataEncryptionMigrationHealthCheck schema](self, "schema");
  v3 = (FCCKRecordZoneIDMapping *)objc_claimAutoreleasedReturnValue();
  -[FCCKPrivateDatabaseSchema mappingFromRecordType:inZoneName:toVersion:](v3, CFSTR("Subscription"), CFSTR("Subscriptions"), -[FCPrivateDataEncryptionMigrationHealthCheck toVersion](self, "toVersion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  objc_msgSend(v4, "fromZoneSchema");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = *(void **)(v5 + 16);
  else
    v7 = 0;
  v8 = v7;
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("Subscriptions"));

  if ((v9 & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("subscriptions zone schema has wrong zone name"));
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  objc_msgSend(v4, "fromRecordSchema");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = *(void **)(v10 + 16);
  else
    v12 = 0;
  v13 = v12;
  v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("Subscription"));

  if ((v14 & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("subscriptions record schema has wrong record type"));
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  objc_msgSend(v4, "toRecordSchema");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKRecordSchema allEncryptedFieldNames]((uint64_t)v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "containsObject:", CFSTR("tagID"));

  if ((v17 & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("subscriptions record should have encrypted tagID"));
  objc_msgSend(v4, "fromZoneSchema");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  if (v18)
    v20 = *(void **)(v18 + 24);
  else
    v20 = 0;
  v21 = v20;

  objc_msgSend(v4, "toZoneSchema");
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)v22;
  if (v22)
    v24 = *(void **)(v22 + 24);
  else
    v24 = 0;
  v60 = v24;

  v74 = 0;
  v75 = &v74;
  v76 = 0x3032000000;
  v77 = __Block_byref_object_copy__5;
  v78 = __Block_byref_object_dispose__5;
  v79 = 0;
  v70[0] = MEMORY[0x1E0C809B0];
  v70[1] = 3221225472;
  v70[2] = __89__FCPrivateDataEncryptionMigrationHealthCheck__prepareSubscriptionsAndReturnExpectations__block_invoke;
  v70[3] = &unk_1E463BAE8;
  v25 = v21;
  v71 = v25;
  v72 = self;
  v73 = &v74;
  FCWaitUntilBlockIsInvoked(v70);
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (v75[5])
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("error saving subscriptions zone: %@"), v75[5]);
  FCRandomTagCloudKitID();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCSubscriptionList subscriptionIDForTagID:type:](FCSubscriptionList, "subscriptionIDForTagID:type:", v26, 0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:zoneID:", v59, v25);
  v27 = objc_alloc(MEMORY[0x1E0C95048]);
  objc_msgSend(v4, "fromRecordSchema");
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = (void *)v28;
  if (v28)
    v30 = *(void **)(v28 + 16);
  else
    v30 = 0;
  v31 = v30;
  v32 = (void *)objc_msgSend(v27, "initWithRecordType:recordID:", v31, v58);

  objc_msgSend(v32, "setObject:forKeyedSubscript:", CFSTR("tag"), CFSTR("subscriptionType"));
  objc_msgSend(v32, "setObject:forKeyedSubscript:", &unk_1E470A2F8, CFSTR("subscriptionOrder"));
  objc_msgSend(v32, "setObject:forKeyedSubscript:", &unk_1E470A310, CFSTR("subscriptionOrigin"));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setObject:forKeyedSubscript:", v33, CFSTR("dateAdded"));

  objc_msgSend(v32, "setObject:forKeyedSubscript:", v26, CFSTR("tagID"));
  objc_msgSend(v32, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("notificationsEnabled"));
  objc_msgSend(v32, "setObject:forKeyedSubscript:", &unk_1E470A2B0, CFSTR("writerVersionHighWatermark"));
  objc_msgSend(v32, "setObject:forKeyedSubscript:", &unk_1E470A2B0, CFSTR("readerMinimumRequiredVersion"));
  v64 = 0;
  v65 = &v64;
  v66 = 0x3032000000;
  v67 = __Block_byref_object_copy__5;
  v68 = __Block_byref_object_dispose__5;
  v69 = 0;
  v61[0] = MEMORY[0x1E0C809B0];
  v61[1] = 3221225472;
  v61[2] = __89__FCPrivateDataEncryptionMigrationHealthCheck__prepareSubscriptionsAndReturnExpectations__block_invoke_84;
  v61[3] = &unk_1E463BAE8;
  v61[4] = self;
  v34 = v32;
  v62 = v34;
  v63 = &v64;
  FCWaitUntilBlockIsInvoked(v61);
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (v65[5])
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("error saving subscription record: %@"), v65[5]);
  v35 = (void *)objc_opt_new();
  -[FCPrivateDataEncryptionMigrationHealthCheck container](self, "container");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "privateCloudDatabase");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setDatabase:", v37);

  objc_msgSend(v35, "setZoneID:", v60);
  objc_msgSend(v35, "setShouldExist:", 1);
  v38 = (void *)objc_opt_new();
  -[FCPrivateDataEncryptionMigrationHealthCheck container](self, "container");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "privateCloudDatabase");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setDatabase:", v40);

  objc_msgSend(v38, "setZoneID:", v25);
  objc_msgSend(v38, "setShouldExist:", 0);
  v41 = (void *)objc_opt_new();
  objc_msgSend(v4, "toRecordSchema");
  v42 = objc_claimAutoreleasedReturnValue();
  v43 = (void *)v42;
  if (v42)
    v44 = *(void **)(v42 + 16);
  else
    v44 = 0;
  v45 = v44;
  objc_msgSend(v41, "setRecordType:", v45);

  objc_msgSend(v4, "toRecordSchema");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKRecordSchema allUnencryptedFieldNames]((uint64_t)v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setUnencryptedFields:", v47);

  objc_msgSend(v4, "toRecordSchema");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKRecordSchema allEncryptedFieldNames]((uint64_t)v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setEncryptedFields:", v49);

  objc_msgSend(v34, "valueStore");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "values");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setExpectedValues:", v51);

  v52 = (void *)objc_opt_new();
  -[FCPrivateDataEncryptionMigrationHealthCheck containerWithZoneWidePCS](self, "containerWithZoneWidePCS");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "privateCloudDatabase");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setDatabase:", v54);

  objc_msgSend(v52, "setZoneID:", v60);
  v81[0] = v41;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v81, 1);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setRecordTests:", v55);

  v80[0] = v35;
  v80[1] = v52;
  v80[2] = v38;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v80, 3);
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v64, 8);
  _Block_object_dispose(&v74, 8);

  return v56;
}

void __89__FCPrivateDataEncryptionMigrationHealthCheck__prepareSubscriptionsAndReturnExpectations__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95088]), "initWithZoneID:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "container");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "privateCloudDatabase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __89__FCPrivateDataEncryptionMigrationHealthCheck__prepareSubscriptionsAndReturnExpectations__block_invoke_2;
  v9[3] = &unk_1E463BAC0;
  v7 = *(_QWORD *)(a1 + 48);
  v10 = v3;
  v11 = v7;
  v8 = v3;
  objc_msgSend(v6, "saveRecordZone:completionHandler:", v4, v9);

}

void __89__FCPrivateDataEncryptionMigrationHealthCheck__prepareSubscriptionsAndReturnExpectations__block_invoke_2(uint64_t a1, int a2, id obj)
{
  id v5;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
  v5 = obj;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __89__FCPrivateDataEncryptionMigrationHealthCheck__prepareSubscriptionsAndReturnExpectations__block_invoke_84(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "container");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "privateCloudDatabase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __89__FCPrivateDataEncryptionMigrationHealthCheck__prepareSubscriptionsAndReturnExpectations__block_invoke_2_85;
  v9[3] = &unk_1E463BB10;
  v7 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v10 = v3;
  v11 = v6;
  v8 = v3;
  objc_msgSend(v5, "saveRecord:completionHandler:", v7, v9);

}

void __89__FCPrivateDataEncryptionMigrationHealthCheck__prepareSubscriptionsAndReturnExpectations__block_invoke_2_85(uint64_t a1, int a2, id obj)
{
  id v5;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
  v5 = obj;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (id)_prepareSensitiveSubscriptionsAndReturnExpectations
{
  FCCKRecordZoneIDMapping *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  char v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  char v14;
  void *v15;
  void *v16;
  char v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v60;
  void *v61;
  id v62;
  _QWORD v63[5];
  id v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t (*v69)(uint64_t, uint64_t);
  void (*v70)(uint64_t);
  id v71;
  _QWORD v72[4];
  id v73;
  FCPrivateDataEncryptionMigrationHealthCheck *v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t (*v79)(uint64_t, uint64_t);
  void (*v80)(uint64_t);
  id v81;
  _QWORD v82[3];
  _QWORD v83[3];

  v83[1] = *MEMORY[0x1E0C80C00];
  -[FCPrivateDataEncryptionMigrationHealthCheck schema](self, "schema");
  v3 = (FCCKRecordZoneIDMapping *)objc_claimAutoreleasedReturnValue();
  -[FCCKPrivateDatabaseSchema mappingFromRecordType:inZoneName:toVersion:](v3, CFSTR("Subscription"), CFSTR("SensitiveSubscriptions"), -[FCPrivateDataEncryptionMigrationHealthCheck toVersion](self, "toVersion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  objc_msgSend(v4, "fromZoneSchema");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = *(void **)(v5 + 16);
  else
    v7 = 0;
  v8 = v7;
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("SensitiveSubscriptions"));

  if ((v9 & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("sensitive subscriptions zone schema has wrong zone name"));
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  objc_msgSend(v4, "fromRecordSchema");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = *(void **)(v10 + 16);
  else
    v12 = 0;
  v13 = v12;
  v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("Subscription"));

  if ((v14 & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("sensitive subscriptions record schema has wrong record type"));
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  objc_msgSend(v4, "toRecordSchema");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKRecordSchema allEncryptedFieldNames]((uint64_t)v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "containsObject:", CFSTR("tagID"));

  if ((v17 & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("sensitive subscriptions record should have encrypted tagID"));
  objc_msgSend(v4, "fromZoneSchema");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  if (v18)
    v20 = *(void **)(v18 + 24);
  else
    v20 = 0;
  v21 = v20;

  objc_msgSend(v4, "toZoneSchema");
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)v22;
  if (v22)
    v24 = *(void **)(v22 + 24);
  else
    v24 = 0;
  v62 = v24;

  v76 = 0;
  v77 = &v76;
  v78 = 0x3032000000;
  v79 = __Block_byref_object_copy__5;
  v80 = __Block_byref_object_dispose__5;
  v81 = 0;
  v72[0] = MEMORY[0x1E0C809B0];
  v72[1] = 3221225472;
  v72[2] = __98__FCPrivateDataEncryptionMigrationHealthCheck__prepareSensitiveSubscriptionsAndReturnExpectations__block_invoke;
  v72[3] = &unk_1E463BAE8;
  v25 = v21;
  v73 = v25;
  v74 = self;
  v75 = &v76;
  FCWaitUntilBlockIsInvoked(v72);
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (v77[5])
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("error saving subscriptions zone: %@"), v77[5]);
  FCRandomTagCloudKitID();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCSubscriptionList subscriptionIDForTagID:type:](FCSubscriptionList, "subscriptionIDForTagID:type:", v26, 0);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:zoneID:", v61, v25);
  v27 = objc_alloc(MEMORY[0x1E0C95048]);
  objc_msgSend(v4, "fromRecordSchema");
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = (void *)v28;
  if (v28)
    v30 = *(void **)(v28 + 16);
  else
    v30 = 0;
  v31 = v30;
  v32 = (void *)objc_msgSend(v27, "initWithRecordType:recordID:", v31, v60);

  objc_msgSend(v32, "setObject:forKeyedSubscript:", CFSTR("autoFavoriteTag"), CFSTR("subscriptionType"));
  objc_msgSend(v32, "setObject:forKeyedSubscript:", &unk_1E470A328, CFSTR("subscriptionOrigin"));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setObject:forKeyedSubscript:", v33, CFSTR("dateAdded"));

  objc_msgSend(v32, "setObject:forKeyedSubscript:", v26, CFSTR("tagID"));
  objc_msgSend(v32, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("notificationsEnabled"));
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "UUIDString");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setObject:forKeyedSubscript:", v35, CFSTR("groupID"));

  objc_msgSend(v32, "setObject:forKeyedSubscript:", &unk_1E470A2B0, CFSTR("writerVersionHighWatermark"));
  objc_msgSend(v32, "setObject:forKeyedSubscript:", &unk_1E470A2B0, CFSTR("readerMinimumRequiredVersion"));
  v66 = 0;
  v67 = &v66;
  v68 = 0x3032000000;
  v69 = __Block_byref_object_copy__5;
  v70 = __Block_byref_object_dispose__5;
  v71 = 0;
  v63[0] = MEMORY[0x1E0C809B0];
  v63[1] = 3221225472;
  v63[2] = __98__FCPrivateDataEncryptionMigrationHealthCheck__prepareSensitiveSubscriptionsAndReturnExpectations__block_invoke_95;
  v63[3] = &unk_1E463BAE8;
  v63[4] = self;
  v36 = v32;
  v64 = v36;
  v65 = &v66;
  FCWaitUntilBlockIsInvoked(v63);
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (v67[5])
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("error saving sensitive subscription record: %@"), v67[5]);
  v37 = (void *)objc_opt_new();
  -[FCPrivateDataEncryptionMigrationHealthCheck secureContainer](self, "secureContainer");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "privateCloudDatabase");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setDatabase:", v39);

  objc_msgSend(v37, "setZoneID:", v62);
  objc_msgSend(v37, "setShouldExist:", 1);
  v40 = (void *)objc_opt_new();
  -[FCPrivateDataEncryptionMigrationHealthCheck container](self, "container");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "privateCloudDatabase");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setDatabase:", v42);

  objc_msgSend(v40, "setZoneID:", v25);
  objc_msgSend(v40, "setShouldExist:", 0);
  v43 = (void *)objc_opt_new();
  objc_msgSend(v4, "toRecordSchema");
  v44 = objc_claimAutoreleasedReturnValue();
  v45 = (void *)v44;
  if (v44)
    v46 = *(void **)(v44 + 16);
  else
    v46 = 0;
  v47 = v46;
  objc_msgSend(v43, "setRecordType:", v47);

  objc_msgSend(v4, "toRecordSchema");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKRecordSchema allUnencryptedFieldNames]((uint64_t)v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setUnencryptedFields:", v49);

  objc_msgSend(v4, "toRecordSchema");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKRecordSchema allEncryptedFieldNames]((uint64_t)v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setEncryptedFields:", v51);

  objc_msgSend(v36, "valueStore");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "values");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setExpectedValues:", v53);

  v54 = (void *)objc_opt_new();
  -[FCPrivateDataEncryptionMigrationHealthCheck secureContainer](self, "secureContainer");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "privateCloudDatabase");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setDatabase:", v56);

  objc_msgSend(v54, "setZoneID:", v62);
  v83[0] = v43;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v83, 1);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setRecordTests:", v57);

  v82[0] = v37;
  v82[1] = v54;
  v82[2] = v40;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v82, 3);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v66, 8);
  _Block_object_dispose(&v76, 8);

  return v58;
}

void __98__FCPrivateDataEncryptionMigrationHealthCheck__prepareSensitiveSubscriptionsAndReturnExpectations__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95088]), "initWithZoneID:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "container");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "privateCloudDatabase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __98__FCPrivateDataEncryptionMigrationHealthCheck__prepareSensitiveSubscriptionsAndReturnExpectations__block_invoke_2;
  v9[3] = &unk_1E463BAC0;
  v7 = *(_QWORD *)(a1 + 48);
  v10 = v3;
  v11 = v7;
  v8 = v3;
  objc_msgSend(v6, "saveRecordZone:completionHandler:", v4, v9);

}

void __98__FCPrivateDataEncryptionMigrationHealthCheck__prepareSensitiveSubscriptionsAndReturnExpectations__block_invoke_2(uint64_t a1, int a2, id obj)
{
  id v5;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
  v5 = obj;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __98__FCPrivateDataEncryptionMigrationHealthCheck__prepareSensitiveSubscriptionsAndReturnExpectations__block_invoke_95(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "container");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "privateCloudDatabase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __98__FCPrivateDataEncryptionMigrationHealthCheck__prepareSensitiveSubscriptionsAndReturnExpectations__block_invoke_2_96;
  v9[3] = &unk_1E463BB10;
  v7 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v10 = v3;
  v11 = v6;
  v8 = v3;
  objc_msgSend(v5, "saveRecord:completionHandler:", v7, v9);

}

void __98__FCPrivateDataEncryptionMigrationHealthCheck__prepareSensitiveSubscriptionsAndReturnExpectations__block_invoke_2_96(uint64_t a1, int a2, id obj)
{
  id v5;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
  v5 = obj;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (id)_prepareUserInfoAndReturnExpectations
{
  FCCKRecordZoneIDMapping *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  char v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  char v14;
  void *v15;
  void *v16;
  char v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v61;
  void *v62;
  id v63;
  id v64;
  _QWORD v65[5];
  id v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t (*v71)(uint64_t, uint64_t);
  void (*v72)(uint64_t);
  id v73;
  _QWORD v74[4];
  id v75;
  FCPrivateDataEncryptionMigrationHealthCheck *v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  uint64_t (*v81)(uint64_t, uint64_t);
  void (*v82)(uint64_t);
  id v83;
  _QWORD v84[4];
  _QWORD v85[3];

  v85[1] = *MEMORY[0x1E0C80C00];
  -[FCPrivateDataEncryptionMigrationHealthCheck schema](self, "schema");
  v3 = (FCCKRecordZoneIDMapping *)objc_claimAutoreleasedReturnValue();
  -[FCCKPrivateDatabaseSchema mappingFromRecordType:inZoneName:toVersion:](v3, CFSTR("UserInfo"), CFSTR("UserInfo"), -[FCPrivateDataEncryptionMigrationHealthCheck toVersion](self, "toVersion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  objc_msgSend(v4, "fromZoneSchema");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = *(void **)(v5 + 16);
  else
    v7 = 0;
  v8 = v7;
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("UserInfo"));

  if ((v9 & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("user info zone schema has wrong zone name"));
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  objc_msgSend(v4, "fromRecordSchema");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = *(void **)(v10 + 16);
  else
    v12 = 0;
  v13 = v12;
  v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("UserInfo"));

  if ((v14 & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("user info record schema has wrong record type"));
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  objc_msgSend(v4, "toRecordSchema");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKRecordSchema allEncryptedFieldNames]((uint64_t)v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "containsObject:", CFSTR("feldsparID"));

  if ((v17 & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("user info record should have encrypted feldsparID"));
  objc_msgSend(v4, "fromZoneSchema");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  if (v18)
    v20 = *(void **)(v18 + 24);
  else
    v20 = 0;
  v21 = v20;

  objc_msgSend(v4, "toZoneSchema");
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)v22;
  if (v22)
    v24 = *(void **)(v22 + 24);
  else
    v24 = 0;
  v64 = v24;

  v78 = 0;
  v79 = &v78;
  v80 = 0x3032000000;
  v81 = __Block_byref_object_copy__5;
  v82 = __Block_byref_object_dispose__5;
  v83 = 0;
  v74[0] = MEMORY[0x1E0C809B0];
  v74[1] = 3221225472;
  v74[2] = __84__FCPrivateDataEncryptionMigrationHealthCheck__prepareUserInfoAndReturnExpectations__block_invoke;
  v74[3] = &unk_1E463BAE8;
  v63 = v21;
  v75 = v63;
  v76 = self;
  v77 = &v78;
  FCWaitUntilBlockIsInvoked(v74);
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (v79[5])
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("error saving user info zone: %@"), v79[5]);
  v62 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:zoneID:", CFSTR("user_info_static_record_name"), v63);
  v61 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:zoneID:", CFSTR("user_info_static_record_name_secure"), v64);
  v25 = objc_alloc(MEMORY[0x1E0C95048]);
  objc_msgSend(v4, "fromRecordSchema");
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = (void *)v26;
  if (v26)
    v28 = *(void **)(v26 + 16);
  else
    v28 = 0;
  v29 = v28;
  v30 = (void *)objc_msgSend(v25, "initWithRecordType:recordID:", v29, v62);

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "UUIDString");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setObject:forKeyedSubscript:", v32, CFSTR("feldsparID"));

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setObject:forKeyedSubscript:", v33, CFSTR("lastOpenedDate"));

  objc_msgSend(v30, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("topStoriesIntroduced"));
  objc_msgSend(v30, "setObject:forKeyedSubscript:", &unk_1E470A2B0, CFSTR("writerVersionHighWatermark"));
  objc_msgSend(v30, "setObject:forKeyedSubscript:", &unk_1E470A2B0, CFSTR("readerMinimumRequiredVersion"));
  v68 = 0;
  v69 = &v68;
  v70 = 0x3032000000;
  v71 = __Block_byref_object_copy__5;
  v72 = __Block_byref_object_dispose__5;
  v73 = 0;
  v65[0] = MEMORY[0x1E0C809B0];
  v65[1] = 3221225472;
  v65[2] = __84__FCPrivateDataEncryptionMigrationHealthCheck__prepareUserInfoAndReturnExpectations__block_invoke_3;
  v65[3] = &unk_1E463BAE8;
  v65[4] = self;
  v34 = v30;
  v66 = v34;
  v67 = &v68;
  FCWaitUntilBlockIsInvoked(v65);
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (v69[5])
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("error saving user info record: %@"), v69[5]);
  v35 = (void *)objc_opt_new();
  -[FCPrivateDataEncryptionMigrationHealthCheck secureContainer](self, "secureContainer");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "privateCloudDatabase");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setDatabase:", v37);

  objc_msgSend(v35, "setZoneID:", v64);
  objc_msgSend(v35, "setShouldExist:", 1);
  v38 = (void *)objc_opt_new();
  -[FCPrivateDataEncryptionMigrationHealthCheck container](self, "container");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "privateCloudDatabase");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setDatabase:", v40);

  objc_msgSend(v38, "setZoneID:", v63);
  objc_msgSend(v38, "setShouldExist:", 0);
  v41 = (void *)objc_opt_new();
  objc_msgSend(v4, "toRecordSchema");
  v42 = objc_claimAutoreleasedReturnValue();
  v43 = (void *)v42;
  if (v42)
    v44 = *(void **)(v42 + 16);
  else
    v44 = 0;
  v45 = v44;
  objc_msgSend(v41, "setRecordType:", v45);

  objc_msgSend(v4, "toRecordSchema");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKRecordSchema allUnencryptedFieldNames]((uint64_t)v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setUnencryptedFields:", v47);

  objc_msgSend(v4, "toRecordSchema");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKRecordSchema allEncryptedFieldNames]((uint64_t)v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setEncryptedFields:", v49);

  objc_msgSend(v34, "valueStore");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "values");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setExpectedValues:", v51);

  v52 = (void *)objc_opt_new();
  -[FCPrivateDataEncryptionMigrationHealthCheck secureContainer](self, "secureContainer");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "privateCloudDatabase");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setDatabase:", v54);

  objc_msgSend(v52, "setZoneID:", v64);
  v85[0] = v41;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v85, 1);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setRecordTests:", v55);

  v56 = (void *)objc_opt_new();
  -[FCPrivateDataEncryptionMigrationHealthCheck secureContainer](self, "secureContainer");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "privateCloudDatabase");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setDatabase:", v58);

  objc_msgSend(v56, "setRecordID:", v61);
  objc_msgSend(v56, "setShouldExist:", 1);
  v84[0] = v35;
  v84[1] = v52;
  v84[2] = v38;
  v84[3] = v56;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v84, 4);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v68, 8);
  _Block_object_dispose(&v78, 8);

  return v59;
}

void __84__FCPrivateDataEncryptionMigrationHealthCheck__prepareUserInfoAndReturnExpectations__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95088]), "initWithZoneID:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "container");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "privateCloudDatabase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __84__FCPrivateDataEncryptionMigrationHealthCheck__prepareUserInfoAndReturnExpectations__block_invoke_2;
  v9[3] = &unk_1E463BAC0;
  v7 = *(_QWORD *)(a1 + 48);
  v10 = v3;
  v11 = v7;
  v8 = v3;
  objc_msgSend(v6, "saveRecordZone:completionHandler:", v4, v9);

}

void __84__FCPrivateDataEncryptionMigrationHealthCheck__prepareUserInfoAndReturnExpectations__block_invoke_2(uint64_t a1, int a2, id obj)
{
  id v5;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
  v5 = obj;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __84__FCPrivateDataEncryptionMigrationHealthCheck__prepareUserInfoAndReturnExpectations__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "container");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "privateCloudDatabase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __84__FCPrivateDataEncryptionMigrationHealthCheck__prepareUserInfoAndReturnExpectations__block_invoke_4;
  v9[3] = &unk_1E463BB10;
  v7 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v10 = v3;
  v11 = v6;
  v8 = v3;
  objc_msgSend(v5, "saveRecord:completionHandler:", v7, v9);

}

void __84__FCPrivateDataEncryptionMigrationHealthCheck__prepareUserInfoAndReturnExpectations__block_invoke_4(uint64_t a1, int a2, id obj)
{
  id v5;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
  v5 = obj;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (id)_prepareTagSettingsAndReturnExpectations
{
  FCCKRecordZoneIDMapping *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  char v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  char v14;
  void *v15;
  void *v16;
  char v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  _QWORD v64[5];
  id v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t (*v70)(uint64_t, uint64_t);
  void (*v71)(uint64_t);
  id v72;
  _QWORD v73[4];
  id v74;
  FCPrivateDataEncryptionMigrationHealthCheck *v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t *v78;
  uint64_t v79;
  uint64_t (*v80)(uint64_t, uint64_t);
  void (*v81)(uint64_t);
  id v82;
  _QWORD v83[3];
  _QWORD v84[3];

  v84[1] = *MEMORY[0x1E0C80C00];
  -[FCPrivateDataEncryptionMigrationHealthCheck schema](self, "schema");
  v3 = (FCCKRecordZoneIDMapping *)objc_claimAutoreleasedReturnValue();
  -[FCCKPrivateDatabaseSchema mappingFromRecordType:inZoneName:toVersion:](v3, CFSTR("TagSettings"), CFSTR("UserInfo"), -[FCPrivateDataEncryptionMigrationHealthCheck toVersion](self, "toVersion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  objc_msgSend(v4, "fromZoneSchema");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = *(void **)(v5 + 16);
  else
    v7 = 0;
  v8 = v7;
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("UserInfo"));

  if ((v9 & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("tag settings zone schema has wrong zone name"));
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  objc_msgSend(v4, "fromRecordSchema");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = *(void **)(v10 + 16);
  else
    v12 = 0;
  v13 = v12;
  v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("TagSettings"));

  if ((v14 & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("tag settings record schema has wrong record type"));
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  objc_msgSend(v4, "toRecordSchema");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKRecordSchema allEncryptedFieldNames]((uint64_t)v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "containsObject:", CFSTR("tagID"));

  if ((v17 & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("tag settings record should have encrypted tagID"));
  objc_msgSend(v4, "fromZoneSchema");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  if (v18)
    v20 = *(void **)(v18 + 24);
  else
    v20 = 0;
  v21 = v20;

  objc_msgSend(v4, "toZoneSchema");
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)v22;
  if (v22)
    v24 = *(void **)(v22 + 24);
  else
    v24 = 0;
  v63 = v24;

  v77 = 0;
  v78 = &v77;
  v79 = 0x3032000000;
  v80 = __Block_byref_object_copy__5;
  v81 = __Block_byref_object_dispose__5;
  v82 = 0;
  v25 = MEMORY[0x1E0C809B0];
  v73[0] = MEMORY[0x1E0C809B0];
  v73[1] = 3221225472;
  v73[2] = __87__FCPrivateDataEncryptionMigrationHealthCheck__prepareTagSettingsAndReturnExpectations__block_invoke;
  v73[3] = &unk_1E463BAE8;
  v26 = v21;
  v74 = v26;
  v75 = self;
  v76 = &v77;
  FCWaitUntilBlockIsInvoked(v73);
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (v78[5])
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("error saving user info zone: %@"), v78[5]);
  FCRandomTagCloudKitID();
  v27 = objc_claimAutoreleasedReturnValue();
  FCTagSettingsEntryIDFromTagID(v27);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = (void *)v27;
  v61 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:zoneID:", v62, v26);
  v28 = objc_alloc(MEMORY[0x1E0C95048]);
  objc_msgSend(v4, "fromRecordSchema");
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = (void *)v29;
  if (v29)
    v31 = *(void **)(v29 + 16);
  else
    v31 = 0;
  v32 = v31;
  v33 = (void *)objc_msgSend(v28, "initWithRecordType:recordID:", v32, v61);

  objc_msgSend(v33, "setObject:forKeyedSubscript:", v60, CFSTR("tagID"));
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "UUIDString");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setObject:forKeyedSubscript:", v35, CFSTR("accessToken"));

  objc_msgSend(v33, "setObject:forKeyedSubscript:", &unk_1E470A340, CFSTR("fontMultiplier"));
  objc_msgSend(v33, "setObject:forKeyedSubscript:", &unk_1E470A2B0, CFSTR("writerVersionHighWatermark"));
  objc_msgSend(v33, "setObject:forKeyedSubscript:", &unk_1E470A2B0, CFSTR("readerMinimumRequiredVersion"));
  v67 = 0;
  v68 = &v67;
  v69 = 0x3032000000;
  v70 = __Block_byref_object_copy__5;
  v71 = __Block_byref_object_dispose__5;
  v72 = 0;
  v64[0] = v25;
  v64[1] = 3221225472;
  v64[2] = __87__FCPrivateDataEncryptionMigrationHealthCheck__prepareTagSettingsAndReturnExpectations__block_invoke_117;
  v64[3] = &unk_1E463BAE8;
  v64[4] = self;
  v36 = v33;
  v65 = v36;
  v66 = &v67;
  FCWaitUntilBlockIsInvoked(v64);
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (v68[5])
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("error saving tag settings record: %@"), v68[5]);
  v37 = (void *)objc_opt_new();
  -[FCPrivateDataEncryptionMigrationHealthCheck secureContainer](self, "secureContainer");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "privateCloudDatabase");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setDatabase:", v39);

  objc_msgSend(v37, "setZoneID:", v63);
  objc_msgSend(v37, "setShouldExist:", 1);
  v40 = (void *)objc_opt_new();
  -[FCPrivateDataEncryptionMigrationHealthCheck container](self, "container");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "privateCloudDatabase");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setDatabase:", v42);

  objc_msgSend(v40, "setZoneID:", v26);
  objc_msgSend(v40, "setShouldExist:", 0);
  v43 = (void *)objc_opt_new();
  objc_msgSend(v4, "toRecordSchema");
  v44 = objc_claimAutoreleasedReturnValue();
  v45 = (void *)v44;
  if (v44)
    v46 = *(void **)(v44 + 16);
  else
    v46 = 0;
  v47 = v46;
  objc_msgSend(v43, "setRecordType:", v47);

  objc_msgSend(v4, "toRecordSchema");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKRecordSchema allUnencryptedFieldNames]((uint64_t)v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setUnencryptedFields:", v49);

  objc_msgSend(v4, "toRecordSchema");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKRecordSchema allEncryptedFieldNames]((uint64_t)v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setEncryptedFields:", v51);

  objc_msgSend(v36, "valueStore");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "values");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setExpectedValues:", v53);

  v54 = (void *)objc_opt_new();
  -[FCPrivateDataEncryptionMigrationHealthCheck secureContainer](self, "secureContainer");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "privateCloudDatabase");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setDatabase:", v56);

  objc_msgSend(v54, "setZoneID:", v63);
  v84[0] = v43;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v84, 1);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setRecordTests:", v57);

  v83[0] = v37;
  v83[1] = v54;
  v83[2] = v40;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v83, 3);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v67, 8);
  _Block_object_dispose(&v77, 8);

  return v58;
}

void __87__FCPrivateDataEncryptionMigrationHealthCheck__prepareTagSettingsAndReturnExpectations__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95088]), "initWithZoneID:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "container");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "privateCloudDatabase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __87__FCPrivateDataEncryptionMigrationHealthCheck__prepareTagSettingsAndReturnExpectations__block_invoke_2;
  v9[3] = &unk_1E463BAC0;
  v7 = *(_QWORD *)(a1 + 48);
  v10 = v3;
  v11 = v7;
  v8 = v3;
  objc_msgSend(v6, "saveRecordZone:completionHandler:", v4, v9);

}

void __87__FCPrivateDataEncryptionMigrationHealthCheck__prepareTagSettingsAndReturnExpectations__block_invoke_2(uint64_t a1, int a2, id obj)
{
  id v5;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
  v5 = obj;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __87__FCPrivateDataEncryptionMigrationHealthCheck__prepareTagSettingsAndReturnExpectations__block_invoke_117(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "container");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "privateCloudDatabase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __87__FCPrivateDataEncryptionMigrationHealthCheck__prepareTagSettingsAndReturnExpectations__block_invoke_2_118;
  v9[3] = &unk_1E463BB10;
  v7 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v10 = v3;
  v11 = v6;
  v8 = v3;
  objc_msgSend(v5, "saveRecord:completionHandler:", v7, v9);

}

void __87__FCPrivateDataEncryptionMigrationHealthCheck__prepareTagSettingsAndReturnExpectations__block_invoke_2_118(uint64_t a1, int a2, id obj)
{
  id v5;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
  v5 = obj;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (id)_preparePersonalizationProfileAndReturnExpectations
{
  void *v3;
  void *v4;
  FCCKRecordZoneIDMapping *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  char v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  char v17;
  void *v18;
  void *v19;
  char v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v50;
  id v51;
  void *v52;
  _QWORD v53[5];
  id v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  _QWORD v62[6];

  v62[4] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:", CFSTR("SharedPersonalizationProfile"));
  -[FCPrivateDataEncryptionMigrationHealthCheck schema](self, "schema");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKPrivateDatabaseSchema mappingFromRecordID:toVersion:]((uint64_t)v4, v3, -[FCPrivateDataEncryptionMigrationHealthCheck toVersion](self, "toVersion"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCPrivateDataEncryptionMigrationHealthCheck schema](self, "schema");
  v5 = (FCCKRecordZoneIDMapping *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0C94A30];
  -[FCCKPrivateDatabaseSchema mappingFromRecordType:inZoneName:toVersion:](v5, CFSTR("PersonalizationProfile"), (void *)*MEMORY[0x1E0C94A30], -[FCPrivateDataEncryptionMigrationHealthCheck toVersion](self, "toVersion"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  objc_msgSend(v52, "fromZoneSchema");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = *(void **)(v8 + 16);
  else
    v10 = 0;
  v11 = v10;
  v12 = objc_msgSend(v11, "isEqualToString:", v6);

  if ((v12 & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("personalization zone schema has wrong zone name"));
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  objc_msgSend(v7, "fromRecordSchema");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
    v15 = *(void **)(v13 + 16);
  else
    v15 = 0;
  v16 = v15;
  v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("PersonalizationProfile"));

  if ((v17 & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("personalization record schema has wrong record type"));
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  objc_msgSend(v7, "toRecordSchema");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKRecordSchema allEncryptedFieldNames]((uint64_t)v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "containsObject:", CFSTR("data"));

  if ((v20 & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("personalization record should have encrypted data"));
  objc_msgSend(v7, "fromZoneSchema");
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)v21;
  if (v21)
    v23 = *(void **)(v21 + 24);
  else
    v23 = 0;
  v51 = v23;

  objc_msgSend(v7, "toZoneSchema");
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = (void *)v24;
  if (v24)
    v26 = *(void **)(v24 + 24);
  else
    v26 = 0;
  v50 = v26;

  v27 = objc_alloc(MEMORY[0x1E0C95048]);
  objc_msgSend(v7, "fromRecordSchema");
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = (void *)v28;
  if (v28)
    v30 = *(void **)(v28 + 16);
  else
    v30 = 0;
  v31 = v30;
  v32 = (void *)objc_msgSend(v27, "initWithRecordType:recordID:", v31, v3);

  objc_msgSend(MEMORY[0x1E0C99D50], "fc_randomDataWithLength:", 500000);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setObject:forKeyedSubscript:", v33, CFSTR("data"));

  objc_msgSend(v32, "setObject:forKeyedSubscript:", &unk_1E470A358, CFSTR("version"));
  objc_msgSend(v32, "setObject:forKeyedSubscript:", &unk_1E470A2B0, CFSTR("writerVersionHighWatermark"));
  objc_msgSend(v32, "setObject:forKeyedSubscript:", &unk_1E470A2B0, CFSTR("readerMinimumRequiredVersion"));
  v56 = 0;
  v57 = &v56;
  v58 = 0x3032000000;
  v59 = __Block_byref_object_copy__5;
  v60 = __Block_byref_object_dispose__5;
  v61 = 0;
  v53[0] = MEMORY[0x1E0C809B0];
  v53[1] = 3221225472;
  v53[2] = __98__FCPrivateDataEncryptionMigrationHealthCheck__preparePersonalizationProfileAndReturnExpectations__block_invoke;
  v53[3] = &unk_1E463BAE8;
  v53[4] = self;
  v34 = v32;
  v54 = v34;
  v55 = &v56;
  FCWaitUntilBlockIsInvoked(v53);
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (v57[5])
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("error saving personalization profile record: %@"), v57[5]);
  v35 = (void *)objc_opt_new();
  -[FCPrivateDataEncryptionMigrationHealthCheck secureContainer](self, "secureContainer");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "privateCloudDatabase");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setDatabase:", v37);

  objc_msgSend(v35, "setZoneID:", v51);
  objc_msgSend(v35, "setShouldExist:", 1);
  v38 = (void *)objc_opt_new();
  -[FCPrivateDataEncryptionMigrationHealthCheck secureContainer](self, "secureContainer");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "privateCloudDatabase");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setDatabase:", v40);

  objc_msgSend(v38, "setZoneID:", v50);
  objc_msgSend(v38, "setShouldExist:", 1);
  v41 = (void *)objc_opt_new();
  -[FCPrivateDataEncryptionMigrationHealthCheck secureContainer](self, "secureContainer");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "privateCloudDatabase");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setDatabase:", v43);

  objc_msgSend(v52, "toRecordID");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setRecordID:", v44);

  objc_msgSend(v41, "setShouldExist:", 1);
  v45 = (void *)objc_opt_new();
  -[FCPrivateDataEncryptionMigrationHealthCheck secureContainer](self, "secureContainer");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "privateCloudDatabase");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setDatabase:", v47);

  objc_msgSend(v45, "setRecordID:", v3);
  objc_msgSend(v45, "setShouldExist:", 0);
  v62[0] = v35;
  v62[1] = v38;
  v62[2] = v41;
  v62[3] = v45;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 4);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v56, 8);
  return v48;
}

void __98__FCPrivateDataEncryptionMigrationHealthCheck__preparePersonalizationProfileAndReturnExpectations__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "container");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "privateCloudDatabase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __98__FCPrivateDataEncryptionMigrationHealthCheck__preparePersonalizationProfileAndReturnExpectations__block_invoke_2;
  v9[3] = &unk_1E463BB10;
  v7 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v10 = v3;
  v11 = v6;
  v8 = v3;
  objc_msgSend(v5, "saveRecord:completionHandler:", v7, v9);

}

void __98__FCPrivateDataEncryptionMigrationHealthCheck__preparePersonalizationProfileAndReturnExpectations__block_invoke_2(uint64_t a1, int a2, id obj)
{
  id v5;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
  v5 = obj;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (id)_prepareReferenceToChannelMembershipsAndReturnExpectations
{
  FCCKRecordZoneIDMapping *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  char v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  char v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  char v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  char v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  _QWORD v75[5];
  id v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  uint64_t (*v81)(uint64_t, uint64_t);
  void (*v82)(uint64_t);
  id v83;
  _QWORD v84[4];
  id v85;
  FCPrivateDataEncryptionMigrationHealthCheck *v86;
  uint64_t *v87;
  uint64_t v88;
  uint64_t *v89;
  uint64_t v90;
  uint64_t (*v91)(uint64_t, uint64_t);
  void (*v92)(uint64_t);
  id v93;
  _QWORD v94[3];
  _QWORD v95[3];

  v95[1] = *MEMORY[0x1E0C80C00];
  -[FCPrivateDataEncryptionMigrationHealthCheck schema](self, "schema");
  v3 = (FCCKRecordZoneIDMapping *)objc_claimAutoreleasedReturnValue();
  -[FCCKPrivateDatabaseSchema mappingFromRecordType:inZoneName:toVersion:](v3, CFSTR("ReferenceToMembership"), CFSTR("ChannelMemberships"), -[FCPrivateDataEncryptionMigrationHealthCheck toVersion](self, "toVersion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  objc_msgSend(v4, "fromZoneSchema");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = *(void **)(v5 + 16);
  else
    v7 = 0;
  v8 = v7;
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("ChannelMemberships"));

  if ((v9 & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("reference-to-membership zone schema has wrong zone name"));
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  objc_msgSend(v4, "fromZoneSchema");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = *(void **)(v10 + 16);
  else
    v12 = 0;
  v13 = v12;
  objc_msgSend(v4, "toZoneSchema");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14)
    v16 = *(void **)(v14 + 16);
  else
    v16 = 0;
  v17 = v16;
  v18 = objc_msgSend(v13, "isEqualToString:", v17);

  if ((v18 & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("reference-to-membership zone name should be the same on client and server"));
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  objc_msgSend(v4, "fromRecordSchema");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  if (v19)
    v21 = *(void **)(v19 + 16);
  else
    v21 = 0;
  v22 = v21;
  v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("ReferenceToMembership"));

  if ((v23 & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("reference-to-membership record schema has wrong record type"));
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  objc_msgSend(v4, "fromRecordSchema");
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = (void *)v24;
  if (v24)
    v26 = *(void **)(v24 + 16);
  else
    v26 = 0;
  v27 = v26;
  objc_msgSend(v4, "toRecordSchema");
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = (void *)v28;
  if (v28)
    v30 = *(void **)(v28 + 16);
  else
    v30 = 0;
  v31 = v30;
  v32 = objc_msgSend(v27, "isEqualToString:", v31);

  if ((v32 & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("reference-to-membership record type should be the same on client and server"));
  objc_msgSend(v4, "fromZoneSchema");
  v33 = objc_claimAutoreleasedReturnValue();
  v34 = (void *)v33;
  if (v33)
    v35 = *(void **)(v33 + 24);
  else
    v35 = 0;
  v36 = v35;

  v88 = 0;
  v89 = &v88;
  v90 = 0x3032000000;
  v91 = __Block_byref_object_copy__5;
  v92 = __Block_byref_object_dispose__5;
  v93 = 0;
  v37 = MEMORY[0x1E0C809B0];
  v84[0] = MEMORY[0x1E0C809B0];
  v84[1] = 3221225472;
  v84[2] = __105__FCPrivateDataEncryptionMigrationHealthCheck__prepareReferenceToChannelMembershipsAndReturnExpectations__block_invoke;
  v84[3] = &unk_1E463BAE8;
  v38 = v36;
  v85 = v38;
  v86 = self;
  v87 = &v88;
  FCWaitUntilBlockIsInvoked(v84);
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (v89[5])
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("error saving reference-to-membership zone: %@"), v89[5]);
  v39 = objc_alloc(MEMORY[0x1E0C95070]);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "UUIDString");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)objc_msgSend(v39, "initWithRecordName:zoneID:", v41, v38);

  v43 = objc_alloc(MEMORY[0x1E0C95048]);
  objc_msgSend(v4, "fromRecordSchema");
  v44 = objc_claimAutoreleasedReturnValue();
  v45 = (void *)v44;
  if (v44)
    v46 = *(void **)(v44 + 16);
  else
    v46 = 0;
  v47 = v46;
  v48 = (void *)objc_msgSend(v43, "initWithRecordType:recordID:", v47, v42);

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "UUIDString");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setObject:forKeyedSubscript:", v50, CFSTR("membershipID"));

  v78 = 0;
  v79 = &v78;
  v80 = 0x3032000000;
  v81 = __Block_byref_object_copy__5;
  v82 = __Block_byref_object_dispose__5;
  v83 = 0;
  v75[0] = v37;
  v75[1] = 3221225472;
  v75[2] = __105__FCPrivateDataEncryptionMigrationHealthCheck__prepareReferenceToChannelMembershipsAndReturnExpectations__block_invoke_3;
  v75[3] = &unk_1E463BAE8;
  v75[4] = self;
  v51 = v48;
  v76 = v51;
  v77 = &v78;
  FCWaitUntilBlockIsInvoked(v75);
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (v79[5])
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("error saving reference-to-membership record: %@"), v79[5]);
  v52 = (void *)objc_opt_new();
  -[FCPrivateDataEncryptionMigrationHealthCheck secureContainer](self, "secureContainer");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "privateCloudDatabase");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setDatabase:", v54);

  objc_msgSend(v52, "setZoneID:", v38);
  objc_msgSend(v52, "setShouldExist:", 0);
  v55 = (void *)objc_opt_new();
  -[FCPrivateDataEncryptionMigrationHealthCheck container](self, "container");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "privateCloudDatabase");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setDatabase:", v57);

  objc_msgSend(v55, "setZoneID:", v38);
  objc_msgSend(v55, "setShouldExist:", 1);
  v58 = (void *)objc_opt_new();
  objc_msgSend(v4, "toRecordSchema");
  v59 = objc_claimAutoreleasedReturnValue();
  v60 = (void *)v59;
  if (v59)
    v61 = *(void **)(v59 + 16);
  else
    v61 = 0;
  v62 = v61;
  objc_msgSend(v58, "setRecordType:", v62);

  objc_msgSend(v4, "toRecordSchema");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKRecordSchema allUnencryptedFieldNames]((uint64_t)v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setUnencryptedFields:", v64);

  objc_msgSend(v4, "toRecordSchema");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKRecordSchema allEncryptedFieldNames]((uint64_t)v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setEncryptedFields:", v66);

  objc_msgSend(v51, "valueStore");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "values");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setExpectedValues:", v68);

  v69 = (void *)objc_opt_new();
  -[FCPrivateDataEncryptionMigrationHealthCheck container](self, "container");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "privateCloudDatabase");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "setDatabase:", v71);

  objc_msgSend(v69, "setZoneID:", v38);
  v95[0] = v58;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v95, 1);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "setRecordTests:", v72);

  v94[0] = v52;
  v94[1] = v55;
  v94[2] = v69;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v94, 3);
  v73 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v78, 8);
  _Block_object_dispose(&v88, 8);

  return v73;
}

void __105__FCPrivateDataEncryptionMigrationHealthCheck__prepareReferenceToChannelMembershipsAndReturnExpectations__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95088]), "initWithZoneID:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "container");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "privateCloudDatabase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __105__FCPrivateDataEncryptionMigrationHealthCheck__prepareReferenceToChannelMembershipsAndReturnExpectations__block_invoke_2;
  v9[3] = &unk_1E463BAC0;
  v7 = *(_QWORD *)(a1 + 48);
  v10 = v3;
  v11 = v7;
  v8 = v3;
  objc_msgSend(v6, "saveRecordZone:completionHandler:", v4, v9);

}

void __105__FCPrivateDataEncryptionMigrationHealthCheck__prepareReferenceToChannelMembershipsAndReturnExpectations__block_invoke_2(uint64_t a1, int a2, id obj)
{
  id v5;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
  v5 = obj;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __105__FCPrivateDataEncryptionMigrationHealthCheck__prepareReferenceToChannelMembershipsAndReturnExpectations__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "container");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "privateCloudDatabase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __105__FCPrivateDataEncryptionMigrationHealthCheck__prepareReferenceToChannelMembershipsAndReturnExpectations__block_invoke_4;
  v9[3] = &unk_1E463BB10;
  v7 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v10 = v3;
  v11 = v6;
  v8 = v3;
  objc_msgSend(v5, "saveRecord:completionHandler:", v7, v9);

}

void __105__FCPrivateDataEncryptionMigrationHealthCheck__prepareReferenceToChannelMembershipsAndReturnExpectations__block_invoke_4(uint64_t a1, int a2, id obj)
{
  id v5;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
  v5 = obj;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (id)_prepareSentinelsAndReturnExpectations
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v18[5];
  id v19;
  id v20;
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C95098]);
  v4 = (void *)objc_msgSend(v3, "initWithZoneName:ownerName:", *MEMORY[0x1E0C94A30], *MEMORY[0x1E0C94730]);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:zoneID:", CFSTR("static_sentinel"), v4);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:zoneID:", CFSTR("static_sentinel_secure"), v4);
  v7 = (void *)objc_opt_new();
  -[FCPrivateDataEncryptionMigrationHealthCheck container](self, "container");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "privateCloudDatabase");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDatabase:", v9);

  objc_msgSend(v7, "setRecordID:", v5);
  objc_msgSend(v7, "setShouldExist:", 1);
  v10 = (void *)objc_opt_new();
  -[FCPrivateDataEncryptionMigrationHealthCheck secureContainer](self, "secureContainer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "privateCloudDatabase");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDatabase:", v12);

  objc_msgSend(v10, "setRecordID:", v6);
  objc_msgSend(v10, "setShouldExist:", 1);
  v13 = (void *)objc_opt_new();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __85__FCPrivateDataEncryptionMigrationHealthCheck__prepareSentinelsAndReturnExpectations__block_invoke;
  v18[3] = &unk_1E463B228;
  v18[4] = self;
  v19 = v5;
  v20 = v6;
  v14 = v6;
  v15 = v5;
  objc_msgSend(v13, "setBlock:", v18);
  v21[0] = v7;
  v21[1] = v10;
  v21[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

void __85__FCPrivateDataEncryptionMigrationHealthCheck__prepareSentinelsAndReturnExpectations__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  uint64_t v23;
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  _QWORD v32[5];
  id v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;

  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__5;
  v39 = __Block_byref_object_dispose__5;
  v40 = 0;
  v2 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v32[2] = __85__FCPrivateDataEncryptionMigrationHealthCheck__prepareSentinelsAndReturnExpectations__block_invoke_2;
  v32[3] = &unk_1E463BAE8;
  v32[4] = v3;
  v33 = v4;
  v34 = &v35;
  FCWaitUntilBlockIsInvoked(v32);
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__5;
  v30 = __Block_byref_object_dispose__5;
  v31 = 0;
  v19 = v2;
  v20 = 3221225472;
  v21 = __85__FCPrivateDataEncryptionMigrationHealthCheck__prepareSentinelsAndReturnExpectations__block_invoke_4;
  v22 = &unk_1E463BAE8;
  v23 = *(_QWORD *)(a1 + 32);
  v24 = *(id *)(a1 + 48);
  v25 = &v26;
  FCWaitUntilBlockIsInvoked(&v19);
  objc_msgSend((id)v36[5], "encryptedValuesByKey", v19, v20, v21, v22, v23);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("encryptionKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (!objc_msgSend(v6, "length"))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("sentinel is missing encryption key"));
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  objc_msgSend((id)v36[5], "valuesByKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("version"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("sentinel is missing version"));
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  objc_msgSend((id)v36[5], "valuesByKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("migratedUnencryptedData"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqual:", MEMORY[0x1E0C9AAB0]);

  if ((v11 & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("sentinel is missing migration completion flag"));
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  objc_msgSend((id)v36[5], "valuesByKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("deletedUnencryptedData"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqual:", MEMORY[0x1E0C9AAB0]);

  if ((v14 & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("sentinel is missing deletion completion flag"));
  objc_msgSend((id)v27[5], "encryptedValuesByKey");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("encryptionKey"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (!objc_msgSend(v16, "length"))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("secure sentinel is missing encryption key"));
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  objc_msgSend((id)v27[5], "valuesByKey");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("version"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("secure sentinel is missing version"));
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (objc_msgSend(v6, "isEqualToData:", v16))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("regular sentinel and secure sentinel should have different encryption keys"));

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v35, 8);

}

void __85__FCPrivateDataEncryptionMigrationHealthCheck__prepareSentinelsAndReturnExpectations__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "container");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "privateCloudDatabase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __85__FCPrivateDataEncryptionMigrationHealthCheck__prepareSentinelsAndReturnExpectations__block_invoke_3;
  v9[3] = &unk_1E463BB10;
  v7 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v10 = v3;
  v11 = v6;
  v8 = v3;
  objc_msgSend(v5, "fetchRecordWithID:completionHandler:", v7, v9);

}

void __85__FCPrivateDataEncryptionMigrationHealthCheck__prepareSentinelsAndReturnExpectations__block_invoke_3(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __85__FCPrivateDataEncryptionMigrationHealthCheck__prepareSentinelsAndReturnExpectations__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "secureContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "privateCloudDatabase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __85__FCPrivateDataEncryptionMigrationHealthCheck__prepareSentinelsAndReturnExpectations__block_invoke_5;
  v9[3] = &unk_1E463BB10;
  v7 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v10 = v3;
  v11 = v6;
  v8 = v3;
  objc_msgSend(v5, "fetchRecordWithID:completionHandler:", v7, v9);

}

void __85__FCPrivateDataEncryptionMigrationHealthCheck__prepareSentinelsAndReturnExpectations__block_invoke_5(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)fetchDesiredVersionForDatabase:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __89__FCPrivateDataEncryptionMigrationHealthCheck_fetchDesiredVersionForDatabase_completion___block_invoke;
  v8[3] = &unk_1E463BB38;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[FCCKPrivateDatabase fetchSecureDatabaseSupportedWithCompletionHandler:]((uint64_t)a3, v8);

}

void __89__FCPrivateDataEncryptionMigrationHealthCheck_fetchDesiredVersionForDatabase_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  v5 = *(_QWORD *)(a1 + 40);
  if (a2)
    v6 = objc_msgSend(*(id *)(a1 + 32), "toVersion");
  else
    v6 = 0;
  (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, v6, v7);

}

- (void)fetchCleanupToVersionForDatabase:(id)a3 completion:(id)a4
{
  id v6;

  v6 = a4;
  (*((void (**)(id, int64_t, _QWORD))a4 + 2))(v6, -[FCPrivateDataEncryptionMigrationHealthCheck toVersion](self, "toVersion"), 0);

}

- (FCCKPrivateDatabaseSchema)schema
{
  return self->_schema;
}

- (void)setSchema:(id)a3
{
  objc_storeStrong((id *)&self->_schema, a3);
}

- (int64_t)toVersion
{
  return self->_toVersion;
}

- (void)setToVersion:(int64_t)a3
{
  self->_toVersion = a3;
}

- (CKContainer)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
  objc_storeStrong((id *)&self->_container, a3);
}

- (CKContainer)containerWithZoneWidePCS
{
  return self->_containerWithZoneWidePCS;
}

- (void)setContainerWithZoneWidePCS:(id)a3
{
  objc_storeStrong((id *)&self->_containerWithZoneWidePCS, a3);
}

- (CKContainer)secureContainer
{
  return self->_secureContainer;
}

- (void)setSecureContainer:(id)a3
{
  objc_storeStrong((id *)&self->_secureContainer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secureContainer, 0);
  objc_storeStrong((id *)&self->_containerWithZoneWidePCS, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_schema, 0);
}

@end

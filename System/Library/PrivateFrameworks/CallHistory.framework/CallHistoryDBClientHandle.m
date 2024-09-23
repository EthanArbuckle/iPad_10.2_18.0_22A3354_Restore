@implementation CallHistoryDBClientHandle

void __79__CallHistoryDBClientHandle_updateCallsWithPredicate_propertiesToUpdate_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id obj;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1B5E33064]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "updateManagedCallsWithPredicate:propertiesToUpdate:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    ct_green_tea_logger_create_static();
    getCTGreenTeaOsLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4 && os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v6 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138412290;
      v15 = v6;
      _os_log_impl(&dword_1B3FA4000, v5, OS_LOG_TYPE_INFO, "Modify: %@", buf, 0xCu);
    }

    v7 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    obj = *(id *)(v8 + 40);
    v9 = objc_msgSend(v7, "save:", &obj);
    objc_storeStrong((id *)(v8 + 40), obj);
    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 32), "convertToCHRecentCalls_sync:", v3);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

    }
  }

  objc_autoreleasePoolPop(v2);
}

void __92__CallHistoryDBClientHandle_fetchCallsWithPredicate_sortDescriptors_limit_offset_batchSize___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = (void *)MEMORY[0x1B5E33064]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "fetchManagedCallsWithPredicate:sortDescriptors:limit:offset:batchSize:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "convertToCHRecentCalls_sync:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
  objc_autoreleasePoolPop(v2);
}

- (id)convertToCHRecentCalls_sync:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "chRecentCall", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

uint64_t __73__CallHistoryDBClientHandle_fetchCallCountWithPredicate_sortDescriptors___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 24), "fetchManagedCallCountWithPredicate:sortDescriptors:", a1[5], a1[6]);
  *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = result;
  return result;
}

- (id)updateCallsWithPredicate:(id)a3 propertiesToUpdate:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[5];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v8 = a3;
  v9 = a4;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__2;
  v30 = __Block_byref_object_dispose__2;
  v31 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__2;
  v24 = __Block_byref_object_dispose__2;
  v25 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __79__CallHistoryDBClientHandle_updateCallsWithPredicate_propertiesToUpdate_error___block_invoke;
  v15[3] = &unk_1E6746E38;
  v15[4] = self;
  v10 = v8;
  v16 = v10;
  v11 = v9;
  v17 = v11;
  v18 = &v20;
  v19 = &v26;
  -[CHSynchronizedLoggable executeSync:](self, "executeSync:", v15);
  if (a5)
  {
    v12 = (void *)v21[5];
    if (v12)
      *a5 = objc_retainAutorelease(v12);
  }
  v13 = (id)v27[5];

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v13;
}

- (id)fetchCallsWithPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 offset:(unint64_t)a6 batchSize:(unint64_t)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v18[5];
  id v19;
  id v20;
  uint64_t *v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v12 = a3;
  v13 = a4;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__2;
  v29 = __Block_byref_object_dispose__2;
  v30 = 0;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __92__CallHistoryDBClientHandle_fetchCallsWithPredicate_sortDescriptors_limit_offset_batchSize___block_invoke;
  v18[3] = &unk_1E6746DC0;
  v18[4] = self;
  v14 = v12;
  v19 = v14;
  v15 = v13;
  v22 = a5;
  v23 = a6;
  v24 = a7;
  v20 = v15;
  v21 = &v25;
  -[CHSynchronizedLoggable executeSync:](self, "executeSync:", v18);
  v16 = (id)v26[5];

  _Block_object_dispose(&v25, 8);
  return v16;
}

- (unint64_t)fetchCallCountWithPredicate:(id)a3 sortDescriptors:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  unint64_t v10;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __73__CallHistoryDBClientHandle_fetchCallCountWithPredicate_sortDescriptors___block_invoke;
  v12[3] = &unk_1E6746D98;
  v15 = &v16;
  v12[4] = self;
  v8 = v6;
  v13 = v8;
  v9 = v7;
  v14 = v9;
  -[CHSynchronizedLoggable executeSync:](self, "executeSync:", v12);
  v10 = v17[3];

  _Block_object_dispose(&v16, 8);
  return v10;
}

void __34__CallHistoryDBClientHandle_init___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  id v8;

  if (*(_BYTE *)(a1 + 40))
    +[CallHistoryDBHandle createForClient](CallHistoryDBHandle, "createForClient");
  else
    +[CallHistoryDBHandle createForServer](CallHistoryDBHandle, "createForServer");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v2;

  v5 = *(_QWORD **)(a1 + 32);
  v6 = (void *)v5[3];
  objc_msgSend(v5, "queue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerForNotifications:", v7);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "callDBManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "createDataStore");

}

- (id)init:(BOOL)a3
{
  CallHistoryDBClientHandle *v4;
  CHNotifyObserver *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  CHNotifyObserver *callsDidChangeNotifyObserver;
  CallHistoryDBClientHandle *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  CallHistoryDBClientHandle *v17;
  BOOL v18;
  _QWORD v19[4];
  id v20;
  id location;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)CallHistoryDBClientHandle;
  v4 = -[CHSynchronizedLoggable initWithName:](&v22, sel_initWithName_, "ch.clientdbhandle");
  if (v4)
  {
    objc_initWeak(&location, v4);
    v5 = [CHNotifyObserver alloc];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.callhistory.notification.calls-changed");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CHSynchronizedLoggable queue](v4, "queue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __34__CallHistoryDBClientHandle_init___block_invoke;
    v19[3] = &unk_1E6746588;
    objc_copyWeak(&v20, &location);
    v9 = -[CHNotifyObserver initWithName:queue:callback:](v5, "initWithName:queue:callback:", v6, v7, v19);
    callsDidChangeNotifyObserver = v4->_callsDidChangeNotifyObserver;
    v4->_callsDidChangeNotifyObserver = (CHNotifyObserver *)v9;

    v13 = v8;
    v14 = 3221225472;
    v15 = __34__CallHistoryDBClientHandle_init___block_invoke_2;
    v16 = &unk_1E6746D48;
    v18 = a3;
    v11 = v4;
    v17 = v11;
    -[CHSynchronizedLoggable execute:](v11, "execute:", &v13);
    -[CallHistoryDBClientHandle registerForNotifications](v11, "registerForNotifications", v13, v14, v15, v16);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  return v4;
}

- (void)registerForNotifications
{
  void *v3;
  NSObject *v4;
  NSObject *observerCallTimersRef;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__CallHistoryDBClientHandle_registerForNotifications__block_invoke;
  v6[3] = &unk_1E6746D70;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", CFSTR("kCallHistoryTimersDistributedSaveNotification"), 0, 0, v6);
  v4 = objc_claimAutoreleasedReturnValue();
  observerCallTimersRef = self->_observerCallTimersRef;
  self->_observerCallTimersRef = v4;

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

+ (id)createForClient
{
  return -[CallHistoryDBClientHandle init:]([CallHistoryDBClientHandle alloc], "init:", 1);
}

- (void)parseCallStatus_sync:(unsigned int)a3 isAnswered:(BOOL *)a4 isOriginated:(BOOL *)a5
{
  BOOL v5;

  if (a4 && a5)
  {
    *a4 = 0;
    *a5 = 0;
    switch(a3)
    {
      case 1u:
LABEL_12:
        *a4 = 1;
        return;
      case 2u:
        a4 = a5;
        goto LABEL_12;
      case 4u:
        goto LABEL_12;
    }
    v5 = a3 != 8 && a3 == 16;
    a4 = a5;
    if (v5)
      goto LABEL_12;
  }
}

- (unsigned)getCallStatus_sync:(id)a3 isOriginated:(id)a4 isAnswered:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;

  if (!a3 || !a4 || !a5)
    return 0;
  v7 = a4;
  v8 = a3;
  v9 = objc_msgSend(a5, "BOOLValue");
  v10 = objc_msgSend(v7, "BOOLValue");

  objc_msgSend(v8, "doubleValue");
  v12 = v11;

  return +[CHManager CHCallStatusForCallWithDuration:isOriginated:isAnswered:](CHManager, "CHCallStatusForCallWithDuration:isOriginated:isAnswered:", v10, v9, v12);
}

- (void)setStoreObject_sync:(id)a3 withClientObject:(id)a4
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
  void *v18;
  void *v19;
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
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
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
  __int16 v45;

  v6 = a3;
  v7 = a4;
  v45 = 0;
  -[CallHistoryDBClientHandle parseCallStatus_sync:isAnswered:isOriginated:](self, "parseCallStatus_sync:isAnswered:isOriginated:", objc_msgSend(v7, "callStatus"), (char *)&v45 + 1, &v45);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", HIBYTE(v45));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAnswered:", v8);

  objc_msgSend(v7, "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDate:", v9);

  objc_msgSend(v7, "disconnectedCause");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDisconnected_cause:", v10);

  v11 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v7, "duration");
  objc_msgSend(v11, "numberWithDouble:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDuration:", v12);

  objc_msgSend(v7, "bytesOfDataUsed");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFace_time_data:", v13);

  objc_msgSend(v7, "filteredOutReason");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFiltered_out_reason:", v14);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v7, "handleType"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHandle_type:", v15);

  objc_msgSend(v7, "imageURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImageURL:", v16);

  objc_msgSend(v7, "isoCountryCode");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIso_country_code:", v17);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v7, "junkConfidence"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setJunkConfidence:", v18);

  objc_msgSend(v7, "junkIdentificationCategory");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setJunkIdentificationCategory:", v19);

  objc_msgSend(v7, "localParticipantUUID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLocalParticipantUUID:", v20);

  objc_msgSend(v7, "name");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setName:", v21);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", (__int16)objc_msgSend(v7, "callerIdAvailability"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNumber_availability:", v22);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v45);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setOriginated:", v23);

  objc_msgSend(v7, "outgoingLocalParticipantUUID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setOutgoingLocalParticipantUUID:", v24);

  objc_msgSend(v7, "participantGroupUUID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setParticipantGroupUUID:", v25);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v7, "read"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRead:", v26);

  objc_msgSend(v7, "serviceProvider");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setService_provider:", v27);

  objc_msgSend(v7, "uniqueId");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUnique_id:", v28);

  objc_msgSend(v7, "conversationID");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setConversationID:", v29);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v7, "verificationStatus"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setVerificationStatus:", v30);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v7, "autoAnsweredReason"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAutoAnsweredReason:", v31);

  objc_msgSend(v6, "setUsedEmergencyVideoStreaming:", objc_msgSend(v7, "usedEmergencyVideoStreaming"));
  objc_msgSend(v6, "setWasEmergencyCall:", objc_msgSend(v7, "wasEmergencyCall"));
  objc_msgSend(v7, "blockedByExtension");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBlockedByExtension:", v32);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v7, "callDirectoryIdentityType"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCallDirectoryIdentityType:", v33);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v7, "screenSharingType"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setScreenSharingType:", v34);

  objc_msgSend(v6, "managedObjectContext");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "remoteParticipantHandles");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36 && v35)
  {
    objc_msgSend(v7, "remoteParticipantHandles");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    +[CHManagedHandle managedHandlesForHandles:inManagedObjectContext:](CHManagedHandle, "managedHandlesForHandles:inManagedObjectContext:", v37, v35);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRemoteParticipantHandles:", v38);

  }
  objc_msgSend(v7, "emergencyMediaItems");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39 && v35)
  {
    objc_msgSend(v7, "emergencyMediaItems");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    +[EmergencyMediaItem managedEmergencyMediaItemsForEmergencyMediaItems:inManagedObjectContext:](EmergencyMediaItem, "managedEmergencyMediaItemsForEmergencyMediaItems:inManagedObjectContext:", v40, v35);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEmergencyMediaItems:", v41);

  }
  objc_msgSend(v7, "callerId");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAddress:", v42);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v7, "callCategory"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCall_category:", v43);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v7, "callType"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCalltype:", v44);

}

- (id)convertToCHRecentCalls_sync:(id)a3 limit:(unint64_t)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id obj;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v22 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a4);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  obj = v6;
  if (v7)
  {
    v8 = v7;
    v6 = 0;
    v9 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        v11 = v6;
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v13 = (void *)MEMORY[0x1B5E33064]();
        objc_msgSend(v12, "chRecentCall");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v11)
        {
          objc_msgSend(v11, "coalescedCallWithCall:usingStrategy:", v14, CFSTR("kCHCoalescingStrategyRecents"));
          v16 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v16 = v14;
        }
        v17 = v16;
        v18 = v16;
        if (!v16)
        {
          objc_msgSend(v22, "addObject:", v11);
          v18 = v15;
          if (a4)
          {
            v19 = objc_msgSend(v22, "count");
            v18 = v15;
            if (v19 == a4)
            {

              objc_autoreleasePoolPop(v13);
              v6 = obj;
              goto LABEL_17;
            }
          }
        }
        v6 = v18;

        objc_autoreleasePoolPop(v13);
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v8)
        continue;
      break;
    }

    if (v6)
    {
      objc_msgSend(v22, "addObject:", v6);
      goto LABEL_17;
    }
  }
  else
  {
LABEL_17:

  }
  return v22;
}

+ (id)createForServer
{
  return -[CallHistoryDBClientHandle init:]([CallHistoryDBClientHandle alloc], "init:", 0);
}

void __34__CallHistoryDBClientHandle_init___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "handleCallRecordSave_sync");
    WeakRetained = v2;
  }

}

void __53__CallHistoryDBClientHandle_registerForNotifications__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __53__CallHistoryDBClientHandle_registerForNotifications__block_invoke_2;
    v6[3] = &unk_1E6746520;
    v7 = WeakRetained;
    v8 = v3;
    objc_msgSend(v7, "execute:", v6);

  }
}

uint64_t __53__CallHistoryDBClientHandle_registerForNotifications__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleCallTimersSave_sync:", *(_QWORD *)(a1 + 40));
}

- (void)unRegisterForNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self->_observerCallTimersRef, CFSTR("kCallHistoryTimersDistributedSaveNotification"), 0);

}

- (int64_t)deleteCallsWithPredicate:(id)a3
{
  id v4;
  id v5;
  int64_t v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__CallHistoryDBClientHandle_deleteCallsWithPredicate___block_invoke;
  v8[3] = &unk_1E6746830;
  v10 = &v11;
  v8[4] = self;
  v5 = v4;
  v9 = v5;
  -[CHSynchronizedLoggable executeSync:](self, "executeSync:", v8);
  v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t __54__CallHistoryDBClientHandle_deleteCallsWithPredicate___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  NSObject *v3;
  uint64_t result;
  uint8_t v5[16];

  ct_green_tea_logger_create_static();
  getCTGreenTeaOsLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1B3FA4000, v3, OS_LOG_TYPE_INFO, "Delete", v5, 2u);
  }

  result = objc_msgSend(*(id *)(a1[4] + 24), "deleteManagedCallsWithPredicate:", a1[5]);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  return result;
}

- (id)fetchCallIdentifiersWithPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 offset:(unint64_t)a6 batchSize:(unint64_t)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v18[5];
  id v19;
  id v20;
  uint64_t *v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v12 = a3;
  v13 = a4;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__2;
  v29 = __Block_byref_object_dispose__2;
  v30 = 0;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __102__CallHistoryDBClientHandle_fetchCallIdentifiersWithPredicate_sortDescriptors_limit_offset_batchSize___block_invoke;
  v18[3] = &unk_1E6746DE8;
  v21 = &v25;
  v18[4] = self;
  v14 = v12;
  v19 = v14;
  v15 = v13;
  v20 = v15;
  v22 = a5;
  v23 = a6;
  v24 = a7;
  -[CHSynchronizedLoggable executeSync:](self, "executeSync:", v18);
  v16 = (id)v26[5];

  _Block_object_dispose(&v25, 8);
  return v16;
}

void __102__CallHistoryDBClientHandle_fetchCallIdentifiersWithPredicate_sortDescriptors_limit_offset_batchSize___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = (void *)MEMORY[0x1B5E33064]();
  objc_msgSend(*(id *)(a1[4] + 24), "fetchManagedCallIdentifiersWithPredicate:sortDescriptors:limit:offset:batchSize:", a1[5], a1[6], a1[8], a1[9], a1[10]);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[7] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_autoreleasePoolPop(v2);
}

- (unint64_t)fetchCoalescedCallCountWithPredicate:(id)a3 sortDescriptors:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  unint64_t v10;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __82__CallHistoryDBClientHandle_fetchCoalescedCallCountWithPredicate_sortDescriptors___block_invoke;
  v12[3] = &unk_1E6746E10;
  v12[4] = self;
  v8 = v6;
  v13 = v8;
  v9 = v7;
  v14 = v9;
  v15 = &v16;
  -[CHSynchronizedLoggable executeSync:](self, "executeSync:", v12);
  v10 = v17[3];

  _Block_object_dispose(&v16, 8);
  return v10;
}

void __82__CallHistoryDBClientHandle_fetchCoalescedCallCountWithPredicate_sortDescriptors___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1B5E33064]();
  objc_msgSend(*(id *)(a1[4] + 24), "fetchManagedCallsWithPredicate:sortDescriptors:limit:offset:batchSize:", a1[5], a1[6], 0, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v13 = v2;
    v6 = 0;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      v9 = v6;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v8), "chRecentCall");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "coalescedCallWithCall:usingStrategy:", v10, CFSTR("kCHCoalescingStrategyRecents"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (!v11)
        {
          ++*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24);
          v12 = v10;
        }
        v6 = v12;

        ++v8;
        v9 = v6;
      }
      while (v5 != v8);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);

    v2 = v13;
  }

  objc_autoreleasePoolPop(v2);
}

- (id)fetchCoalescedCallsWithPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 offset:(unint64_t)a6 batchSize:(unint64_t)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v18[5];
  id v19;
  id v20;
  uint64_t *v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v12 = a3;
  v13 = a4;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__2;
  v29 = __Block_byref_object_dispose__2;
  v30 = 0;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __101__CallHistoryDBClientHandle_fetchCoalescedCallsWithPredicate_sortDescriptors_limit_offset_batchSize___block_invoke;
  v18[3] = &unk_1E6746DC0;
  v18[4] = self;
  v14 = v12;
  v19 = v14;
  v15 = v13;
  v22 = a6;
  v23 = a7;
  v20 = v15;
  v21 = &v25;
  v24 = a5;
  -[CHSynchronizedLoggable executeSync:](self, "executeSync:", v18);
  v16 = (id)v26[5];

  _Block_object_dispose(&v25, 8);
  return v16;
}

void __101__CallHistoryDBClientHandle_fetchCoalescedCallsWithPredicate_sortDescriptors_limit_offset_batchSize___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = (void *)MEMORY[0x1B5E33064]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "fetchManagedCallsWithPredicate:sortDescriptors:limit:offset:batchSize:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "convertToCHRecentCalls_sync:limit:", v3, *(_QWORD *)(a1 + 80));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
  objc_autoreleasePoolPop(v2);
}

- (id)fetchAll
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __37__CallHistoryDBClientHandle_fetchAll__block_invoke;
  v3[3] = &unk_1E6746A10;
  v3[4] = self;
  -[CHSynchronizedLoggable executeSyncWithResult:](self, "executeSyncWithResult:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __37__CallHistoryDBClientHandle_fetchAll__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1B5E33064]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "fetchAll");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "convertToCHRecentCalls_sync:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v2);
  return v4;
}

- (id)fetchAllNoLimit
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__CallHistoryDBClientHandle_fetchAllNoLimit__block_invoke;
  v3[3] = &unk_1E6746A10;
  v3[4] = self;
  -[CHSynchronizedLoggable executeSyncWithResult:](self, "executeSyncWithResult:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __44__CallHistoryDBClientHandle_fetchAllNoLimit__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1B5E33064]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "fetchAllNoLimit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "convertToCHRecentCalls_sync:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v2);
  return v4;
}

- (id)fetchWithCallTypes:(unsigned int)a3
{
  _QWORD v4[5];
  unsigned int v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__CallHistoryDBClientHandle_fetchWithCallTypes___block_invoke;
  v4[3] = &unk_1E6746E60;
  v4[4] = self;
  v5 = a3;
  -[CHSynchronizedLoggable executeSyncWithResult:](self, "executeSyncWithResult:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __48__CallHistoryDBClientHandle_fetchWithCallTypes___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1B5E33064]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "fetchWithCallTypes:", *(unsigned int *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "convertToCHRecentCalls_sync:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v2);
  return v4;
}

- (id)fetchObjectsWithPredicate:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__CallHistoryDBClientHandle_fetchObjectsWithPredicate___block_invoke;
  v8[3] = &unk_1E6746E88;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  -[CHSynchronizedLoggable executeSyncWithResult:](self, "executeSyncWithResult:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __55__CallHistoryDBClientHandle_fetchObjectsWithPredicate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1B5E33064]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "fetchObjectsWithPredicate:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "logHandle");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 134217984;
    v10 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_1B3FA4000, v4, OS_LOG_TYPE_DEFAULT, "Fetching calls from DBStoreHandle. Got back %lu calls", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "convertToCHRecentCalls_sync:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "logHandle");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_msgSend(v5, "count");
    v9 = 134217984;
    v10 = v7;
    _os_log_impl(&dword_1B3FA4000, v6, OS_LOG_TYPE_DEFAULT, "Converting records into CHRecentCall objects. Returning %lu calls", (uint8_t *)&v9, 0xCu);
  }

  objc_autoreleasePoolPop(v2);
  return v5;
}

- (id)fetchAllObjectsWithUniqueId:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__CallHistoryDBClientHandle_fetchAllObjectsWithUniqueId___block_invoke;
  v8[3] = &unk_1E6746EB0;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  -[CHSynchronizedLoggable executeSyncWithResult:](self, "executeSyncWithResult:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __57__CallHistoryDBClientHandle_fetchAllObjectsWithUniqueId___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1B5E33064]();
  v3 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "fetchAllObjectsWithUniqueId:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "chRecentCall");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  objc_autoreleasePoolPop(v2);
  return v3;
}

- (id)fetchObjectWithUniqueId:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__CallHistoryDBClientHandle_fetchObjectWithUniqueId___block_invoke;
  v8[3] = &unk_1E6746ED8;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  -[CHSynchronizedLoggable executeSyncWithResult:](self, "executeSyncWithResult:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __53__CallHistoryDBClientHandle_fetchObjectWithUniqueId___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1B5E33064]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "fetchObjectWithUniqueId:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "chRecentCall");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v2);
  return v4;
}

- (id)fetchObjectsWithUniqueIds:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__CallHistoryDBClientHandle_fetchObjectsWithUniqueIds___block_invoke;
  v8[3] = &unk_1E6746E88;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  -[CHSynchronizedLoggable executeSyncWithResult:](self, "executeSyncWithResult:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __55__CallHistoryDBClientHandle_fetchObjectsWithUniqueIds___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1B5E33064]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "fetchObjectsWithUniqueIds:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "convertToCHRecentCalls_sync:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v2);
  return v4;
}

- (BOOL)deleteAll
{
  uint64_t v3;

  v3 = 0;
  return -[CallHistoryDBClientHandle deleteAll:](self, "deleteAll:", &v3);
}

- (BOOL)deleteAll:(id *)a3
{
  NSObject *v5;
  NSObject *v6;
  _QWORD v8[6];
  uint8_t buf[16];

  ct_green_tea_logger_create_static();
  getCTGreenTeaOsLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3FA4000, v6, OS_LOG_TYPE_INFO, "Delete", buf, 2u);
  }

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __39__CallHistoryDBClientHandle_deleteAll___block_invoke;
  v8[3] = &unk_1E6746F00;
  v8[4] = self;
  v8[5] = a3;
  return -[CHSynchronizedLoggable executeSyncWithBOOL:](self, "executeSyncWithBOOL:", v8);
}

uint64_t __39__CallHistoryDBClientHandle_deleteAll___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x1B5E33064]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "deleteAll");
  v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "save:", *(_QWORD *)(a1 + 40));
  objc_autoreleasePoolPop(v2);
  return v3;
}

- (BOOL)deleteObjectWithUniqueId:(id)a3
{
  return -[CallHistoryDBClientHandle deleteObjectWithUniqueId:error:](self, "deleteObjectWithUniqueId:error:", a3, 0);
}

- (BOOL)deleteObjectWithUniqueId:(id)a3 error:(id *)a4
{
  return -[CallHistoryDBClientHandle deleteObjectWithUniqueId:error:save:](self, "deleteObjectWithUniqueId:error:save:", a3, a4, 1);
}

- (BOOL)deleteObjectWithUniqueId:(id)a3 error:(id *)a4 save:(BOOL)a5
{
  id v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  BOOL v12;
  _QWORD v14[5];
  id v15;
  id *v16;
  BOOL v17;
  uint8_t buf[16];

  v8 = a3;
  ct_green_tea_logger_create_static();
  getCTGreenTeaOsLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9 && os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3FA4000, v10, OS_LOG_TYPE_INFO, "Delete", buf, 2u);
  }

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __65__CallHistoryDBClientHandle_deleteObjectWithUniqueId_error_save___block_invoke;
  v14[3] = &unk_1E6746F28;
  v14[4] = self;
  v15 = v8;
  v17 = a5;
  v16 = a4;
  v11 = v8;
  v12 = -[CHSynchronizedLoggable executeSyncWithBOOL:](self, "executeSyncWithBOOL:", v14);

  return v12;
}

uint64_t __65__CallHistoryDBClientHandle_deleteObjectWithUniqueId_error_save___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x1B5E33064]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "deleteObjectWithUniqueId:", *(_QWORD *)(a1 + 40));
  if (*(_BYTE *)(a1 + 56))
    v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "save:", *(_QWORD *)(a1 + 48));
  else
    v3 = 1;
  objc_autoreleasePoolPop(v2);
  return v3;
}

- (BOOL)deleteObjectsWithUniqueIds:(id)a3
{
  uint64_t v4;

  v4 = 0;
  return -[CallHistoryDBClientHandle deleteObjectsWithUniqueIds:error:](self, "deleteObjectsWithUniqueIds:error:", a3, &v4);
}

- (BOOL)deleteObjectsWithUniqueIds:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  BOOL v10;
  _QWORD v12[5];
  id v13;
  id *v14;
  uint8_t buf[16];

  v6 = a3;
  ct_green_tea_logger_create_static();
  getCTGreenTeaOsLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3FA4000, v8, OS_LOG_TYPE_INFO, "Delete", buf, 2u);
  }

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __62__CallHistoryDBClientHandle_deleteObjectsWithUniqueIds_error___block_invoke;
  v12[3] = &unk_1E6746F50;
  v12[4] = self;
  v13 = v6;
  v14 = a4;
  v9 = v6;
  v10 = -[CHSynchronizedLoggable executeSyncWithBOOL:](self, "executeSyncWithBOOL:", v12);

  return v10;
}

uint64_t __62__CallHistoryDBClientHandle_deleteObjectsWithUniqueIds_error___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x1B5E33064]();
  objc_msgSend(*(id *)(a1[4] + 24), "deleteObjectsWithUniqueIds:", a1[5]);
  v3 = objc_msgSend(*(id *)(a1[4] + 24), "save:", a1[6]);
  objc_autoreleasePoolPop(v2);
  return v3;
}

- (BOOL)createCallRecord:(id)a3
{
  return -[CallHistoryDBClientHandle createCallRecord:error:](self, "createCallRecord:error:", a3, 0);
}

- (BOOL)createCallRecord:(id)a3 error:(id *)a4
{
  return -[CallHistoryDBClientHandle createCallRecord:error:save:](self, "createCallRecord:error:save:", a3, a4, 1);
}

- (BOOL)createCallRecord:(id)a3 error:(id *)a4 save:(BOOL)a5
{
  id v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  BOOL v12;
  _QWORD v14[5];
  id v15;
  id *v16;
  BOOL v17;
  uint8_t buf[16];

  v8 = a3;
  ct_green_tea_logger_create_static();
  getCTGreenTeaOsLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9 && os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3FA4000, v10, OS_LOG_TYPE_INFO, "Insert", buf, 2u);
  }

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __57__CallHistoryDBClientHandle_createCallRecord_error_save___block_invoke;
  v14[3] = &unk_1E6746F28;
  v14[4] = self;
  v15 = v8;
  v17 = a5;
  v16 = a4;
  v11 = v8;
  v12 = -[CHSynchronizedLoggable executeSyncWithBOOL:](self, "executeSyncWithBOOL:", v14);

  return v12;
}

uint64_t __57__CallHistoryDBClientHandle_createCallRecord_error_save___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = (void *)MEMORY[0x1B5E33064]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "createCallRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setStoreObject_sync:withClientObject:", v3, *(_QWORD *)(a1 + 40));
  if (*(_BYTE *)(a1 + 56))
    v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "save:", *(_QWORD *)(a1 + 48));
  else
    v4 = 1;

  objc_autoreleasePoolPop(v2);
  return v4;
}

- (BOOL)createCallRecords:(id)a3
{
  return -[CallHistoryDBClientHandle createCallRecords:error:](self, "createCallRecords:error:", a3, 0);
}

- (BOOL)createCallRecords:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  BOOL v9;
  _QWORD v11[4];
  id v12;
  CallHistoryDBClientHandle *v13;
  id *v14;
  uint8_t buf[16];

  v6 = a3;
  ct_green_tea_logger_create_static();
  getCTGreenTeaOsLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3FA4000, v8, OS_LOG_TYPE_INFO, "Insert", buf, 2u);
  }

  if (objc_msgSend(v6, "count"))
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __53__CallHistoryDBClientHandle_createCallRecords_error___block_invoke;
    v11[3] = &unk_1E6746F50;
    v12 = v6;
    v13 = self;
    v14 = a4;
    v9 = -[CHSynchronizedLoggable executeSyncWithBOOL:](self, "executeSyncWithBOOL:", v11);

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

uint64_t __53__CallHistoryDBClientHandle_createCallRecords_error___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v6);
        v8 = (void *)MEMORY[0x1B5E33064](v3);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "createCallRecord", (_QWORD)v12);
        v9 = objc_claimAutoreleasedReturnValue();
        if (!v9)
        {
          objc_autoreleasePoolPop(v8);

          return 0;
        }
        v10 = (void *)v9;
        objc_msgSend(*(id *)(a1 + 40), "setStoreObject_sync:withClientObject:", v9, v7);

        objc_autoreleasePoolPop(v8);
        ++v6;
      }
      while (v4 != v6);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v4 = v3;
      if (v3)
        continue;
      break;
    }
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "save:", *(_QWORD *)(a1 + 48), (_QWORD)v12);
}

- (id)updateCallRecords:(id)a3
{
  return -[CallHistoryDBClientHandle updateCallRecords:error:](self, "updateCallRecords:error:", a3, 0);
}

- (id)updateCallRecords:(id)a3 error:(id *)a4
{
  return -[CallHistoryDBClientHandle updateCallRecords:error:save:](self, "updateCallRecords:error:save:", a3, a4, 1);
}

- (id)updateCallRecords:(id)a3 error:(id *)a4 save:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  _QWORD v12[5];
  id v13;
  id *v14;
  BOOL v15;

  v8 = a3;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __58__CallHistoryDBClientHandle_updateCallRecords_error_save___block_invoke;
  v12[3] = &unk_1E6746F78;
  v12[4] = self;
  v13 = v8;
  v14 = a4;
  v15 = a5;
  v9 = v8;
  -[CHSynchronizedLoggable executeSyncWithResult:](self, "executeSyncWithResult:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __58__CallHistoryDBClientHandle_updateCallRecords_error_save___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = (void *)MEMORY[0x1B5E33064]();
  objc_msgSend(*(id *)(a1 + 32), "updateCallRecords_sync:error:save:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v2);
  return v3;
}

- (id)updateAllCallRecords:(id)a3
{
  return -[CallHistoryDBClientHandle updateAllCallRecords:error:](self, "updateAllCallRecords:error:", a3, 0);
}

- (id)updateAllCallRecords:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;
  id *v12;

  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__CallHistoryDBClientHandle_updateAllCallRecords_error___block_invoke;
  v10[3] = &unk_1E6746808;
  v10[4] = self;
  v11 = v6;
  v12 = a4;
  v7 = v6;
  -[CHSynchronizedLoggable executeSyncWithResult:](self, "executeSyncWithResult:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __56__CallHistoryDBClientHandle_updateAllCallRecords_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = (void *)MEMORY[0x1B5E33064]();
  objc_msgSend(*(id *)(a1 + 32), "updateAllCallRecords_sync:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v2);
  return v3;
}

- (id)timerIncoming
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __42__CallHistoryDBClientHandle_timerIncoming__block_invoke;
  v3[3] = &unk_1E6746FA0;
  v3[4] = self;
  -[CHSynchronizedLoggable executeSyncWithResult:](self, "executeSyncWithResult:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __42__CallHistoryDBClientHandle_timerIncoming__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "timerIncoming");
}

- (id)timerOutgoing
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __42__CallHistoryDBClientHandle_timerOutgoing__block_invoke;
  v3[3] = &unk_1E6746FA0;
  v3[4] = self;
  -[CHSynchronizedLoggable executeSyncWithResult:](self, "executeSyncWithResult:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __42__CallHistoryDBClientHandle_timerOutgoing__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "timerOutgoing");
}

- (id)timerLastReset
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __43__CallHistoryDBClientHandle_timerLastReset__block_invoke;
  v3[3] = &unk_1E6746FA0;
  v3[4] = self;
  -[CHSynchronizedLoggable executeSyncWithResult:](self, "executeSyncWithResult:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __43__CallHistoryDBClientHandle_timerLastReset__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "timerLastReset");
}

- (id)timerLifetime
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __42__CallHistoryDBClientHandle_timerLifetime__block_invoke;
  v3[3] = &unk_1E6746FA0;
  v3[4] = self;
  -[CHSynchronizedLoggable executeSyncWithResult:](self, "executeSyncWithResult:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __42__CallHistoryDBClientHandle_timerLifetime__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "timerLifetime");
}

- (void)resetTimers
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __40__CallHistoryDBClientHandle_resetTimers__block_invoke;
  v2[3] = &unk_1E6746460;
  v2[4] = self;
  -[CHSynchronizedLoggable executeSync:](self, "executeSync:", v2);
}

uint64_t __40__CallHistoryDBClientHandle_resetTimers__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "resetTimers");
}

- (BOOL)resetAllTimers
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __43__CallHistoryDBClientHandle_resetAllTimers__block_invoke;
  v3[3] = &unk_1E6746998;
  v3[4] = self;
  return -[CHSynchronizedLoggable executeSyncWithBOOL:](self, "executeSyncWithBOOL:", v3);
}

uint64_t __43__CallHistoryDBClientHandle_resetAllTimers__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "resetAllTimers");
}

- (CallHistoryDBHandle)dbStoreHandle
{
  NSObject *v3;

  -[CHSynchronizedLoggable queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  return self->dbStoreHandle;
}

- (CallDBManager)manager
{
  CallHistoryDBClientHandle *v2;
  CallDBManager *manager;
  CallDBManager *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v2 = self;
  objc_sync_enter(v2);
  manager = v2->_manager;
  if (!manager)
  {
    v7 = 0;
    v8 = &v7;
    v9 = 0x3032000000;
    v10 = __Block_byref_object_copy__2;
    v11 = __Block_byref_object_dispose__2;
    v12 = 0;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __36__CallHistoryDBClientHandle_manager__block_invoke;
    v6[3] = &unk_1E67469C0;
    v6[4] = v2;
    v6[5] = &v7;
    -[CHSynchronizedLoggable executeSync:](v2, "executeSync:", v6);
    objc_storeStrong((id *)&v2->_manager, (id)v8[5]);
    _Block_object_dispose(&v7, 8);

    manager = v2->_manager;
  }
  v4 = manager;
  objc_sync_exit(v2);

  return v4;
}

void __36__CallHistoryDBClientHandle_manager__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "dbStoreHandle");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "callDBManager");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)handleCallRecordSave_sync
{
  -[CallHistoryDBHandle mergeCallRecordChangesFromRemoteAppSave](self->dbStoreHandle, "mergeCallRecordChangesFromRemoteAppSave");
}

- (void)handleCallTimersSave_sync:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  if (-[CallHistoryDBClientHandle willHandleNotification_sync:](self, "willHandleNotification_sync:", a3))
  {
    -[CallHistoryDBHandle mergeCallDBPropChangesFromRemoteAppSave](self->dbStoreHandle, "mergeCallDBPropChangesFromRemoteAppSave");
    -[CallHistoryDBHandle postTimersChangedNotification](self->dbStoreHandle, "postTimersChangedNotification");
    -[CHSynchronizedLoggable logHandle](self, "logHandle");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1B3FA4000, v4, OS_LOG_TYPE_DEFAULT, "Got timers save notification from other app", v5, 2u);
    }

  }
}

- (BOOL)willHandleNotification_sync:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a3, "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CallHistoryDBHandle objectId](CallHistoryDBHandle, "objectId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5 ^ 1;
}

- (id)updateCallRecords_sync:(id)a3 error:(id *)a4 save:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  id *v29;
  _BOOL4 v30;
  id v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t v41[128];
  uint8_t buf[4];
  id v43;
  _BYTE v44[128];
  uint64_t v45;

  v5 = a5;
  v45 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v32 = v8;
  objc_msgSend(v8, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v38 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(v9, "addObject:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
    }
    while (v12);
  }
  if (!objc_msgSend(v9, "count"))
  {
    -[CHSynchronizedLoggable logHandle](self, "logHandle");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B3FA4000, v16, OS_LOG_TYPE_DEFAULT, "No calls to update", buf, 2u);
    }
    goto LABEL_32;
  }
  -[CallHistoryDBHandle fetchObjectsWithUniqueIds:](self->dbStoreHandle, "fetchObjectsWithUniqueIds:", v9);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v15 || !-[NSObject count](v15, "count"))
  {
    -[CHSynchronizedLoggable logHandle](self, "logHandle");
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v43 = v9;
      _os_log_impl(&dword_1B3FA4000, v27, OS_LOG_TYPE_DEFAULT, "Objects with given uniqueIds: %{public}@ to update do not exist", buf, 0xCu);
    }

LABEL_32:
    v31 = 0;
    goto LABEL_33;
  }
  v29 = a4;
  v30 = v5;
  v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v16 = v16;
  v17 = -[NSObject countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (!v17)
    goto LABEL_24;
  v18 = v17;
  v19 = *(_QWORD *)v34;
  do
  {
    v20 = v16;
    for (j = 0; j != v18; ++j)
    {
      if (*(_QWORD *)v34 != v19)
        objc_enumerationMutation(v20);
      v22 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * j);
      objc_msgSend(v22, "unique_id");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "objectForKey:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
        if (!-[CallHistoryDBClientHandle updateCallRecord_sync:withChangeDict:](self, "updateCallRecord_sync:withChangeDict:", v22, v24))goto LABEL_22;
        objc_msgSend(v22, "chRecentCall");
        v25 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "addObject:", v25);
      }
      else
      {
        -[CHSynchronizedLoggable logHandle](self, "logHandle");
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v22, "unique_id");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v43 = v26;
          _os_log_impl(&dword_1B3FA4000, v25, OS_LOG_TYPE_DEFAULT, "Properties dict not found for call with uniqueId: %{public}@", buf, 0xCu);

        }
      }

LABEL_22:
    }
    v16 = v20;
    v18 = -[NSObject countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  }
  while (v18);
LABEL_24:

  if (objc_msgSend(v31, "count") && v30)
    -[CallHistoryDBHandle save:](self->dbStoreHandle, "save:", v29);
LABEL_33:

  return v31;
}

- (id)updateAllCallRecords_sync:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)objc_opt_new();
  -[CallHistoryDBHandle fetchAll](self->dbStoreHandle, "fetchAll");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (-[CallHistoryDBClientHandle updateCallRecord_sync:withChangeDict:](self, "updateCallRecord_sync:withChangeDict:", v13, v6))
        {
          objc_msgSend(v13, "chRecentCall");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v14);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v10);
  }
  if (objc_msgSend(v7, "count"))
  {
    -[CallHistoryDBHandle save:](self->dbStoreHandle, "save:", a4);
    ct_green_tea_logger_create_static();
    getCTGreenTeaOsLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15 && os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v6;
      _os_log_impl(&dword_1B3FA4000, v16, OS_LOG_TYPE_INFO, "Modify: %@", buf, 0xCu);
    }

  }
  return v7;
}

- (BOOL)updateCallRecord_sync:(id)a3 withChangeDict:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  char v12;
  char v13;
  void *v14;
  id v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  char v19;
  void *v20;
  id v21;
  unint64_t v22;
  unint64_t v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  int v28;
  int v29;
  void *v30;
  void *v31;
  int v32;
  int v33;
  void *v34;
  void *v35;
  id v36;
  unint64_t v37;
  unint64_t v38;
  void *v39;
  char v40;
  void *v41;
  id v42;
  unint64_t v43;
  unint64_t v44;
  void *v45;
  char v46;
  void *v47;
  CHEmergencyMediaItem *v48;
  __int16 v50;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "objectForKeyedSubscript:", kCallUpdatePropertyOutgoingLocalParticipantUUID);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v8;
    objc_msgSend(v6, "outgoingLocalParticipantUUID");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    v12 = (v9 | v10) == 0;
    if (v9)
      v12 = objc_msgSend((id)v10, "isEqual:", v9);
    v13 = v12 ^ 1;

    if ((v12 & 1) == 0)
      objc_msgSend(v6, "setOutgoingLocalParticipantUUID:", v9);

  }
  else
  {
    v13 = 0;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", kCallUpdatePropertyRead);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = v14;
    objc_msgSend(v6, "read");
    v16 = (unint64_t)(id)objc_claimAutoreleasedReturnValue();
    v17 = (unint64_t)v15;
    v18 = (void *)v17;
    if (v17 | v16)
    {
      if (v17)
      {
        v19 = objc_msgSend((id)v16, "isEqual:", v17);

        if ((v19 & 1) != 0)
          goto LABEL_15;
      }
      else
      {

      }
      objc_msgSend(v6, "setRead:", v18);
      v13 = 1;
    }
LABEL_15:

  }
  objc_msgSend(v7, "objectForKeyedSubscript:", kCallUpdatePropertyBytesUsed);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_24;
  v21 = v20;
  objc_msgSend(v6, "face_time_data");
  v22 = (unint64_t)(id)objc_claimAutoreleasedReturnValue();
  v23 = (unint64_t)v21;
  v24 = (void *)v23;
  if (v23 | v22)
  {
    if (v23)
    {
      v25 = objc_msgSend((id)v22, "isEqual:", v23);

      if ((v25 & 1) != 0)
        goto LABEL_23;
    }
    else
    {

    }
    objc_msgSend(v6, "setFace_time_data:", v24);
    v13 = 1;
  }
LABEL_23:

LABEL_24:
  objc_msgSend(v7, "objectForKeyedSubscript:", kCallUpdatePropertyCallStatus);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v50 = 0;
    -[CallHistoryDBClientHandle parseCallStatus_sync:isAnswered:isOriginated:](self, "parseCallStatus_sync:isAnswered:isOriginated:", objc_msgSend(v26, "integerValue"), (char *)&v50 + 1, &v50);
    objc_msgSend(v6, "answered");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "BOOLValue");
    v29 = HIBYTE(v50);

    if (v29 != v28)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", HIBYTE(v50));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setAnswered:", v30);

      v13 = 1;
    }
    objc_msgSend(v6, "originated");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "BOOLValue");
    v33 = v50;

    if (v33 != v32)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v50);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setOriginated:", v34);

      v13 = 1;
    }
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", kCallUpdatePropertyHasMessage);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v36 = v35;
    objc_msgSend(v6, "hasMessage");
    v37 = (unint64_t)(id)objc_claimAutoreleasedReturnValue();
    v38 = (unint64_t)v36;
    v39 = (void *)v38;
    if (v38 | v37)
    {
      if (v38)
      {
        v40 = objc_msgSend((id)v37, "isEqual:", v38);

        if ((v40 & 1) != 0)
          goto LABEL_36;
      }
      else
      {

      }
      objc_msgSend(v6, "setHasMessage:", v39);
      v13 = 1;
    }
LABEL_36:

  }
  objc_msgSend(v7, "objectForKeyedSubscript:", kCallUpdatePropertyAutoAnsweredReason);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_45;
  v42 = v41;
  objc_msgSend(v6, "autoAnsweredReason");
  v43 = (unint64_t)(id)objc_claimAutoreleasedReturnValue();
  v44 = (unint64_t)v42;
  v45 = (void *)v44;
  if (v44 | v43)
  {
    if (v44)
    {
      v46 = objc_msgSend((id)v43, "isEqual:", v44);

      if ((v46 & 1) != 0)
        goto LABEL_44;
    }
    else
    {

    }
    objc_msgSend(v6, "setAutoAnsweredReason:", v45);
    v13 = 1;
  }
LABEL_44:

LABEL_45:
  objc_msgSend(v7, "objectForKeyedSubscript:", kCallUpdatePropertyEmergencyMediaItem);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v48 = -[CHEmergencyMediaItem initWithDictionary:]([CHEmergencyMediaItem alloc], "initWithDictionary:", v47);
    if (v48)
      v13 = objc_msgSend(v6, "addEmergencyMediaItem:", v48);

  }
  return v13;
}

- (void)dealloc
{
  objc_super v3;

  -[CallHistoryDBClientHandle unRegisterForNotifications](self, "unRegisterForNotifications");
  v3.receiver = self;
  v3.super_class = (Class)CallHistoryDBClientHandle;
  -[CallHistoryDBClientHandle dealloc](&v3, sel_dealloc);
}

- (BOOL)saveDatabase:(id *)a3
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __42__CallHistoryDBClientHandle_saveDatabase___block_invoke;
  v4[3] = &unk_1E6746F00;
  v4[4] = self;
  v4[5] = a3;
  return -[CHSynchronizedLoggable executeSyncWithBOOL:](self, "executeSyncWithBOOL:", v4);
}

uint64_t __42__CallHistoryDBClientHandle_saveDatabase___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "save:", *(_QWORD *)(a1 + 40));
}

- (BOOL)moveCallRecordsFromDatabaseAtURL:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__CallHistoryDBClientHandle_moveCallRecordsFromDatabaseAtURL___block_invoke;
  v7[3] = &unk_1E6746FC8;
  v7[4] = self;
  v8 = v4;
  v5 = v4;
  LOBYTE(self) = -[CHSynchronizedLoggable executeSyncWithBOOL:](self, "executeSyncWithBOOL:", v7);

  return (char)self;
}

uint64_t __62__CallHistoryDBClientHandle_moveCallRecordsFromDatabaseAtURL___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "moveCallRecordsFromDatabaseAtURL:", *(_QWORD *)(a1 + 40));
}

- (NSObject)observerCallTimersRef
{
  return self->_observerCallTimersRef;
}

- (CHNotifyObserver)callsDidChangeNotifyObserver
{
  return self->_callsDidChangeNotifyObserver;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callsDidChangeNotifyObserver, 0);
  objc_storeStrong((id *)&self->_observerCallTimersRef, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->dbStoreHandle, 0);
}

@end

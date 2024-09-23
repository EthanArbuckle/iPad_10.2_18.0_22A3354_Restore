@implementation _CDCloudFamilyDataCollectionTask

- (_CDCloudFamilyDataCollectionTask)initWithActivity:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  _CDCloudFamilyDataCollectionTask *v20;
  void *v21;
  void *v22;
  void *v23;
  _CDCloudFamilyDataCollectionTask *v24;
  uint64_t v26;
  void *v27;
  void *v28;

  v4 = a3;
  NSTemporaryDirectory();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("CoreDuet/DataCollection/CloudFamily"));
  v6 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 1.0;
  if (!CRIsAppleInternal())
  {
    OSAGetDATaskingValue();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v9, "doubleValue");
        v8 = v10;
      }
    }

  }
  OSAGetDATaskingValue();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)v6;
  if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v26 = objc_msgSend(v11, "unsignedIntegerValue");
  else
    v26 = 12;
  OSAGetDATaskingValue();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v11;
  if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v13 = objc_msgSend(v12, "unsignedIntegerValue");
  else
    v13 = 30;
  +[_CDInteractionStore defaultDatabaseDirectory](_CDInteractionStore, "defaultDatabaseDirectory");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDInteractionStore storeWithDirectory:readOnly:](_CDInteractionStore, "storeWithDirectory:readOnly:", v14, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc_init(getCNContactStoreClass());
  v17 = objc_alloc(getHKMedicalIDStoreClass());
  v18 = objc_alloc_init(getHKHealthStoreClass());
  v19 = (void *)objc_msgSend(v17, "initWithHealthStore:", v18);
  v20 = self;
  v21 = v4;
  v22 = v4;
  v23 = v7;
  v24 = (_CDCloudFamilyDataCollectionTask *)-[_CDCloudFamilyDataCollectionTask initWithStorage:contactStore:medicalIDStore:activity:sessionPath:dataDirectory:collectionDate:samplingRate:maxBatches:daysPerBatch:]((id *)&v20->super.isa, v15, v16, v19, v22, CFSTR("/var/mobile/Library/CoreDuet/DataCollection/CloudFamily/session.archive"), v28, v7, v8, (void *)v26, (void *)v13);

  return v24;
}

- (id)initWithStorage:(void *)a3 contactStore:(void *)a4 medicalIDStore:(void *)a5 activity:(void *)a6 sessionPath:(void *)a7 dataDirectory:(void *)a8 collectionDate:(double)a9 samplingRate:(void *)a10 maxBatches:(void *)a11 daysPerBatch:
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  id v36;
  id v37;
  id v39;
  id v40;
  id v41;
  id v42;
  _QWORD v43[4];
  id v44;
  id location;
  objc_super v46;

  v20 = a2;
  v41 = a3;
  v40 = a4;
  v39 = a5;
  v21 = a6;
  v22 = a7;
  v23 = a8;
  if (a1)
  {
    v46.receiver = a1;
    v46.super_class = (Class)_CDCloudFamilyDataCollectionTask;
    a1 = (id *)objc_msgSendSuper2(&v46, sel_init);
    if (a1)
    {
      objc_initWeak(&location, a1);
      v24 = objc_alloc(MEMORY[0x1E0D815E8]);
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __167___CDCloudFamilyDataCollectionTask_initWithStorage_contactStore_medicalIDStore_activity_sessionPath_dataDirectory_collectionDate_samplingRate_maxBatches_daysPerBatch___block_invoke;
      v43[3] = &unk_1E26E58A8;
      objc_copyWeak(&v44, &location);
      v25 = objc_msgSend(v24, "initWithBlock:", v43);
      v26 = a1[16];
      a1[16] = (id)v25;

      objc_storeStrong(a1 + 7, a2);
      objc_storeStrong(a1 + 8, a3);
      objc_storeStrong(a1 + 9, a4);
      objc_storeStrong(a1 + 2, a5);
      v27 = objc_msgSend(v21, "copy");
      v28 = a1[5];
      a1[5] = (id)v27;

      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", a1[5], 0, 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (v29)
      {
        v42 = 0;
        objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v29, &v42);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v42;
        if (v31)
        {
          +[_CDLogging dataCollectionChannel](_CDLogging, "dataCollectionChannel");
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            -[_CDCloudFamilyDataCollectionTask initWithStorage:contactStore:medicalIDStore:activity:sessionPath:dataDirectory:collectionDate:samplingRate:maxBatches:daysPerBatch:].cold.1();

        }
      }
      else
      {
        v30 = 0;
      }
      objc_storeStrong(a1 + 11, v30);
      v33 = objc_msgSend(v22, "copy");
      v34 = a1[4];
      a1[4] = (id)v33;

      v35 = objc_msgSend(v23, "copy");
      v36 = a1[6];
      a1[6] = (id)v35;

      *((double *)a1 + 12) = a9;
      a1[13] = a10;
      a1[14] = a11;
      *((_BYTE *)a1 + 9) = 1;
      v37 = a1[3];
      a1[3] = &__block_literal_global_47;

      objc_destroyWeak(&v44);
      objc_destroyWeak(&location);
    }
  }

  return a1;
}

- (id)contactKeysToFetch
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[10];

  v12[9] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  getCNContactIdentifierKey();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v1;
  getCNContactBirthdayKey();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v2;
  getCNContactRelationsKey();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v3;
  getCNContactGivenNameKey();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v4;
  getCNContactMiddleNameKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[4] = v5;
  getCNContactFamilyNameKey();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[5] = v6;
  getCNContactNicknameKey();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[6] = v7;
  getCNContactPhoneNumbersKey();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[7] = v8;
  getCNContactEmailAddressesKey();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[8] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)contactRelationsUsingMe:(uint64_t)a1
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v30;
  uint64_t v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  _QWORD v43[9];

  v43[7] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v30 = v3;
  v31 = a1;
  if (a1)
  {
    v4 = v3;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    getCNLabelContactRelationManager();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v6;
    getCNLabelContactRelationAssistant();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v43[1] = v7;
    getCNLabelContactRelationColleague();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v43[2] = v8;
    getCNLabelContactRelationTeacher();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v43[3] = v9;
    getCNLabelContactRelationFriend();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v43[4] = v10;
    getCNLabelContactRelationMaleFriend();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v43[5] = v11;
    getCNLabelContactRelationFemaleFriend();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v43[6] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "contactRelations");
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v38 != v16)
            objc_enumerationMutation(obj);
          v18 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          objc_msgSend(v18, "label");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v13, "containsObject:", v19);

          if ((v20 & 1) == 0)
          {
            objc_msgSend(v18, "value");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "name");
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            -[_CDCloudFamilyDataCollectionTask queryContactsForGivenName:](v31, v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = 0u;
            v34 = 0u;
            v35 = 0u;
            v36 = 0u;
            v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
            if (v24)
            {
              v25 = v24;
              v26 = *(_QWORD *)v34;
              do
              {
                for (j = 0; j != v25; ++j)
                {
                  if (*(_QWORD *)v34 != v26)
                    objc_enumerationMutation(v23);
                  objc_msgSend(v5, "addObject:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * j));
                }
                v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
              }
              while (v25);
            }

          }
        }
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      }
      while (v15);
    }
    objc_msgSend(v5, "allObjects");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (id)avgOfAllCallsUsingManager:(uint64_t)a1
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t i;
  double v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(a2, "callsWithPredicate:limit:offset:batchSize:", 0, 0, 0, 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "count");
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v4 = v2;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
      v8 = 0.0;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "duration", (_QWORD)v13);
          v8 = v8 + v10;
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v6);
    }
    else
    {
      v8 = 0.0;
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8 / (double)v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (id)contactsEmergencyFamily
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  __int128 v33;
  void *v34;
  id obj;
  uint64_t v36;
  void *v37;
  id v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  id v45;
  _BYTE v46[128];
  _QWORD v47[9];

  v47[7] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  getCNLabelContactRelationManager();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = v2;
  getCNLabelContactRelationAssistant();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v47[1] = v3;
  getCNLabelContactRelationColleague();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v47[2] = v4;
  getCNLabelContactRelationTeacher();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v47[3] = v5;
  getCNLabelContactRelationFriend();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v47[4] = v6;
  getCNLabelContactRelationMaleFriend();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v47[5] = v7;
  getCNLabelContactRelationFemaleFriend();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v47[6] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 7);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  -[_CDCloudFamilyDataCollectionTask fetchEmergencyContacts](a1);
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
  if (v9)
  {
    v11 = v9;
    v36 = a1;
    v12 = 0;
    v13 = *(_QWORD *)v41;
    *(_QWORD *)&v10 = 138412290;
    v33 = v10;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v41 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        objc_msgSend(v15, "relationship", v33);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v37, "containsObject:", v16);

        if ((v17 & 1) == 0)
        {
          objc_msgSend(v15, "nameContactIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18)
          {
            v19 = *(id *)(v36 + 64);
            objc_msgSend(v15, "nameContactIdentifier");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[_CDCloudFamilyDataCollectionTask contactKeysToFetch](v36);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = v12;
            objc_msgSend(v19, "unifiedContactWithIdentifier:keysToFetch:error:", v20, v21, &v39);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = v39;

            +[_CDLogging dataCollectionChannel](_CDLogging, "dataCollectionChannel");
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v33;
              v45 = v23;
              _os_log_error_impl(&dword_18DDBE000, v24, OS_LOG_TYPE_ERROR, "Error querying contacts %@", buf, 0xCu);
            }

            if (v22)
              objc_msgSend(v34, "addObject:", v22);

          }
          else
          {
            v23 = v12;
          }
          objc_msgSend(v15, "phoneNumberContactIdentifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (v25)
          {
            v26 = *(id *)(v36 + 64);
            objc_msgSend(v15, "phoneNumberContactIdentifier");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            -[_CDCloudFamilyDataCollectionTask contactKeysToFetch](v36);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = v23;
            objc_msgSend(v26, "unifiedContactWithIdentifier:keysToFetch:error:", v27, v28, &v38);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = v38;

            +[_CDLogging dataCollectionChannel](_CDLogging, "dataCollectionChannel");
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v33;
              v45 = v12;
              _os_log_error_impl(&dword_18DDBE000, v30, OS_LOG_TYPE_ERROR, "Error querying contacts %@", buf, 0xCu);
            }

            if (v29)
              objc_msgSend(v34, "addObject:", v29);

          }
          else
          {
            v12 = v23;
          }
        }
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    }
    while (v11);
  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(v34, "allObjects");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

- (id)contactsEmergency
{
  dispatch_semaphore_t v2;
  dispatch_time_t v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  id v25;
  dispatch_semaphore_t dsema;
  id obj;
  void *v28;
  uint64_t v29;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[4];
  dispatch_semaphore_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint8_t buf[4];
  id v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v25 = *(id *)(a1 + 72);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__14;
  v43 = __Block_byref_object_dispose__14;
  v44 = 0;
  v2 = dispatch_semaphore_create(0);
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __53___CDCloudFamilyDataCollectionTask_contactsEmergency__block_invoke;
  v36[3] = &unk_1E26E59A8;
  v38 = &v39;
  dsema = v2;
  v37 = dsema;
  objc_msgSend(v25, "fetchMedicalIDEmergencyContactsWithCompletion:", v36);
  v3 = dispatch_time(0, 300000000000);
  if (dispatch_semaphore_wait(dsema, v3))
  {
    +[_CDLogging dataCollectionChannel](_CDLogging, "dataCollectionChannel");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      -[_CDCloudFamilyDataCollectionTask contactsEmergency].cold.1();

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = objc_claimAutoreleasedReturnValue();

    v28 = (void *)v5;
  }
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = (id)v40[5];
  v6 = 0;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v47, 16);
  if (v7)
  {
    v29 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v33 != v29)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v9, "nameContactIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          v11 = *(id *)(a1 + 64);
          objc_msgSend(v9, "nameContactIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[_CDCloudFamilyDataCollectionTask contactKeysToFetch](a1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = v6;
          objc_msgSend(v11, "unifiedContactWithIdentifier:keysToFetch:error:", v12, v13, &v31);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v31;

          +[_CDLogging dataCollectionChannel](_CDLogging, "dataCollectionChannel");
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v46 = v15;
            _os_log_error_impl(&dword_18DDBE000, v16, OS_LOG_TYPE_ERROR, "Error querying contacts %@", buf, 0xCu);
          }

          if (v14)
            objc_msgSend(v28, "addObject:", v14);

        }
        else
        {
          v15 = v6;
        }
        objc_msgSend(v9, "phoneNumberContactIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          v18 = *(id *)(a1 + 64);
          objc_msgSend(v9, "phoneNumberContactIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[_CDCloudFamilyDataCollectionTask contactKeysToFetch](a1);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = v15;
          objc_msgSend(v18, "unifiedContactWithIdentifier:keysToFetch:error:", v19, v20, &v30);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = v30;

          +[_CDLogging dataCollectionChannel](_CDLogging, "dataCollectionChannel");
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v46 = v6;
            _os_log_error_impl(&dword_18DDBE000, v22, OS_LOG_TYPE_ERROR, "Error querying contacts %@", buf, 0xCu);
          }

          if (v21)
            objc_msgSend(v28, "addObject:", v21);

        }
        else
        {
          v6 = v15;
        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v47, 16);
    }
    while (v7);
  }

  objc_msgSend(v28, "allObjects");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v39, 8);
  return v23;
}

- (id)contactsInContactStore
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__14;
  v15 = __Block_byref_object_dispose__14;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_alloc_init(getCNContactStoreClass());
  v3 = objc_alloc(getCNContactFetchRequestClass());
  -[_CDCloudFamilyDataCollectionTask contactKeysToFetch](a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithKeysToFetch:", v4);

  objc_msgSend(v5, "setContactBatchCount:", 25);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __58___CDCloudFamilyDataCollectionTask_contactsInContactStore__block_invoke;
  v10[3] = &unk_1E26E5918;
  v10[4] = &v11;
  objc_msgSend(v2, "enumerateContactsWithFetchRequest:error:usingBlock:", v5, 0, v10);
  +[_CDLogging dataCollectionChannel](_CDLogging, "dataCollectionChannel");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = objc_msgSend((id)v12[5], "count");
    *(_DWORD *)buf = 134217984;
    v18 = v7;
    _os_log_impl(&dword_18DDBE000, v6, OS_LOG_TYPE_INFO, "_PSFamilyRecommender: Fetched %tu contact ids from contact store", buf, 0xCu);
  }

  objc_msgSend((id)v12[5], "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v11, 8);
  return v8;
}

- (id)contactParentsUsingRegexNamesUsingContacts:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  uint64_t v20;
  void *v21;
  void *v23;
  id obj;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v23 = v3;
  if (!a1)
  {
    v21 = 0;
    goto LABEL_27;
  }
  v4 = v3;
  -[_CDCloudFamilyDataCollectionTask relationshipRegularExpressionForRelationship](a1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set", v23);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v4;
  v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (!v27)
    goto LABEL_26;
  v25 = *(_QWORD *)v36;
  do
  {
    v6 = 0;
    do
    {
      if (*(_QWORD *)v36 != v25)
        objc_enumerationMutation(obj);
      v28 = v6;
      v7 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v6);
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v8 = v26;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v32;
        v29 = v8;
        do
        {
          v12 = 0;
          v30 = v10;
          do
          {
            if (*(_QWORD *)v32 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v12);
            objc_msgSend(v7, "givenName");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (-[_CDCloudFamilyDataCollectionTask regexMatchForRegex:string:]((uint64_t)a1, v13, v14))
              goto LABEL_17;
            objc_msgSend(v7, "middleName");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (-[_CDCloudFamilyDataCollectionTask regexMatchForRegex:string:]((uint64_t)a1, v13, v15))
              goto LABEL_16;
            objc_msgSend(v7, "familyName");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (-[_CDCloudFamilyDataCollectionTask regexMatchForRegex:string:]((uint64_t)a1, v13, v16))
            {

              v10 = v30;
LABEL_16:

LABEL_17:
LABEL_18:
              objc_msgSend(v5, "addObject:", v7);
              goto LABEL_19;
            }
            objc_msgSend(v7, "nickname");
            v17 = v5;
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = -[_CDCloudFamilyDataCollectionTask regexMatchForRegex:string:]((uint64_t)a1, v13, v18);

            v5 = v17;
            v8 = v29;

            v10 = v30;
            if (v19)
              goto LABEL_18;
LABEL_19:
            ++v12;
          }
          while (v10 != v12);
          v20 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
          v10 = v20;
        }
        while (v20);
      }

      v6 = v28 + 1;
    }
    while (v28 + 1 != v27);
    v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  }
  while (v27);
LABEL_26:

  objc_msgSend(v5, "allObjects");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_27:
  return v21;
}

- (id)photosPeople
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  getPHFetchOptionsClass();
  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setPersonContext:", 1);
  v18 = v2;
  -[objc_class fetchPersonsWithOptions:](getPHPersonClass(), "fetchPersonsWithOptions:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v8);
        v10 = (void *)MEMORY[0x193FEE914]();
        v11 = *(id *)(a1 + 64);
        objc_msgSend(v9, "contactMatchingDictionary");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[_CDCloudFamilyDataCollectionTask contactKeysToFetch](a1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "contactWithMatchingDictionary:keysToFetch:", v12, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(v14, "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObject:", v16);

        }
        objc_autoreleasePoolPop(v10);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v6);
  }

  return v19;
}

- (id)contactIdsInFmfFollowingMyLocation
{
  void *v1;
  dispatch_semaphore_t v2;
  NSObject *v3;
  dispatch_time_t v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, void *);
  void *v13;
  NSObject *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  if (!a1)
    return 0;
  -[objc_class sharedInstance](getFMFSessionClass(), "sharedInstance");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__14;
  v20 = __Block_byref_object_dispose__14;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v2 = dispatch_semaphore_create(0);
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __70___CDCloudFamilyDataCollectionTask_contactIdsInFmfFollowingMyLocation__block_invoke;
  v13 = &unk_1E26E59D0;
  v15 = &v16;
  v3 = v2;
  v14 = v3;
  objc_msgSend(v1, "getHandlesFollowingMyLocation:", &v10);
  v4 = dispatch_time(0, 300000000000);
  if (dispatch_semaphore_wait(v3, v4))
  {
    +[_CDLogging dataCollectionChannel](_CDLogging, "dataCollectionChannel", v10, v11, v12, v13);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[_CDCloudFamilyDataCollectionTask contactIdsInFmfFollowingMyLocation].cold.1();

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v17[5];
    v17[5] = v6;

  }
  v8 = (void *)objc_msgSend((id)v17[5], "copy", v10, v11, v12, v13);

  _Block_object_dispose(&v16, 8);
  return v8;
}

- (id)contactIdsInFmfSharingLocationWithMe
{
  void *v1;
  dispatch_semaphore_t v2;
  NSObject *v3;
  dispatch_time_t v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, void *);
  void *v13;
  NSObject *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  if (!a1)
    return 0;
  -[objc_class sharedInstance](getFMFSessionClass(), "sharedInstance");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__14;
  v20 = __Block_byref_object_dispose__14;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v2 = dispatch_semaphore_create(0);
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __72___CDCloudFamilyDataCollectionTask_contactIdsInFmfSharingLocationWithMe__block_invoke;
  v13 = &unk_1E26E59D0;
  v15 = &v16;
  v3 = v2;
  v14 = v3;
  objc_msgSend(v1, "getHandlesSharingLocationsWithMe:", &v10);
  v4 = dispatch_time(0, 300000000000);
  if (dispatch_semaphore_wait(v3, v4))
  {
    +[_CDLogging dataCollectionChannel](_CDLogging, "dataCollectionChannel", v10, v11, v12, v13);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[_CDCloudFamilyDataCollectionTask contactIdsInFmfSharingLocationWithMe].cold.1();

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v17[5];
    v17[5] = v6;

  }
  v8 = (void *)objc_msgSend((id)v17[5], "copy", v10, v11, v12, v13);

  _Block_object_dispose(&v16, 8);
  return v8;
}

- (id)airDropPeople
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
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
  id v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[_CDCloudFamilyDataCollectionTask allAirDropInteractionsFromStore:fetchLimit:](a1, *(void **)(a1 + 56), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v2;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v26 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v7, "recipients", v23);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "firstObject");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "personId");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          v11 = *(id *)(a1 + 64);
          objc_msgSend(v7, "recipients");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "firstObject");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "personId");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[_CDCloudFamilyDataCollectionTask contactKeysToFetch](a1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "unifiedContactWithIdentifier:keysToFetch:error:", v14, v15, 0);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            v17 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v16, "identifier");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "objectForKeyedSubscript:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "numberWithInteger:", objc_msgSend(v19, "integerValue") + 1);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "identifier");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "setObject:forKeyedSubscript:", v20, v21);

          }
        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v4);
  }

  return v23;
}

- (id)airDropPeopleAtHome
{
  void *v1;
  dispatch_semaphore_t v2;
  NSObject *v3;
  dispatch_time_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  _BOOL4 v35;
  id v36;
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
  void *context;
  NSObject *v49;
  void *v50;
  id v51;
  id obj;
  void *v53;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _QWORD v67[4];
  NSObject *v68;
  uint64_t *v69;
  uint64_t *v70;
  uint64_t v71;
  _QWORD v72[4];
  id v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t (*v77)(uint64_t, uint64_t);
  void (*v78)(uint64_t);
  id v79;
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  context = (void *)MEMORY[0x193FEE914]();
  -[objc_class defaultManager](getRTRoutineManagerClass(), "defaultManager");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = 0;
  v75 = &v74;
  v76 = 0x3032000000;
  v77 = __Block_byref_object_copy__14;
  v78 = __Block_byref_object_dispose__14;
  v79 = 0;
  v71 = 0;
  v72[0] = &v71;
  v72[1] = 0x3032000000;
  v72[2] = __Block_byref_object_copy__14;
  v72[3] = __Block_byref_object_dispose__14;
  v73 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = dispatch_semaphore_create(0);
  v67[0] = MEMORY[0x1E0C809B0];
  v67[1] = 3221225472;
  v67[2] = __55___CDCloudFamilyDataCollectionTask_airDropPeopleAtHome__block_invoke;
  v67[3] = &unk_1E26E4510;
  v69 = &v74;
  v70 = &v71;
  v3 = v2;
  v68 = v3;
  objc_msgSend(v50, "fetchLocationsOfInterestOfType:withHandler:", 0, v67);
  v4 = dispatch_time(0, 300000000000);
  v49 = v3;
  if (dispatch_semaphore_wait(v3, v4))
  {
    +[_CDLogging dataCollectionChannel](_CDLogging, "dataCollectionChannel");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[_CDCloudFamilyDataCollectionTask airDropPeopleAtHome].cold.2();
LABEL_23:

    goto LABEL_24;
  }
  if (*(_QWORD *)(v72[0] + 40))
  {
    +[_CDLogging dataCollectionChannel](_CDLogging, "dataCollectionChannel");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[_CDCloudFamilyDataCollectionTask airDropPeopleAtHome].cold.1((uint64_t)v72, v5, v6, v7, v8, v9, v10, v11);
    goto LABEL_23;
  }
  if (v75[5])
  {
    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    v5 = (id)v75[5];
    v12 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v63, v82, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v64;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v64 != v13)
            objc_enumerationMutation(v5);
          v15 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
          v59 = 0u;
          v60 = 0u;
          v61 = 0u;
          v62 = 0u;
          objc_msgSend(v15, "visits");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v59, v81, 16);
          if (v17)
          {
            v18 = *(_QWORD *)v60;
            do
            {
              for (j = 0; j != v17; ++j)
              {
                if (*(_QWORD *)v60 != v18)
                  objc_enumerationMutation(v16);
                objc_msgSend(v1, "addObject:", *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * j));
              }
              v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v59, v81, 16);
            }
            while (v17);
          }

        }
        v12 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v63, v82, 16);
      }
      while (v12);
    }
    goto LABEL_23;
  }
LABEL_24:
  objc_msgSend(v1, "valueForKey:", CFSTR("entryDate"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v51 = (id)objc_claimAutoreleasedReturnValue();
  v20 = *(id *)(a1 + 56);
  -[_CDCloudFamilyDataCollectionTask allAirDropInteractionsFromStore:fetchLimit:](a1, v20, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  obj = v21;
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v80, 16);
  if (v22)
  {
    v23 = *(_QWORD *)v56;
    do
    {
      for (k = 0; k != v22; ++k)
      {
        if (*(_QWORD *)v56 != v23)
          objc_enumerationMutation(obj);
        v25 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * k);
        objc_msgSend(v25, "recipients");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "firstObject");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "personId");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28)
        {
          objc_msgSend(v25, "startDate");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = -[_CDCloudFamilyDataCollectionTask indexToInsertDate:array:](a1, v29, v53);

          if (v30)
          {
            objc_msgSend(v1, "objectAtIndexedSubscript:", v30 - 1);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "exitDate");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "startDate");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "timeIntervalSinceDate:", v33);
            v35 = v34 > 0.0;

            if (v35)
            {
              v36 = *(id *)(a1 + 64);
              objc_msgSend(v25, "recipients");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "firstObject");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "personId");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              -[_CDCloudFamilyDataCollectionTask contactKeysToFetch](a1);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "unifiedContactWithIdentifier:keysToFetch:error:", v39, v40, 0);
              v41 = (void *)objc_claimAutoreleasedReturnValue();

              if (v41)
              {
                v42 = (void *)MEMORY[0x1E0CB37E8];
                objc_msgSend(v41, "identifier");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v51, "objectForKeyedSubscript:", v43);
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v42, "numberWithInteger:", objc_msgSend(v44, "integerValue") + 1);
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v41, "identifier");
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v51, "setObject:forKeyedSubscript:", v45, v46);

              }
            }
          }
        }
      }
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v80, 16);
    }
    while (v22);
  }

  _Block_object_dispose(&v71, 8);
  _Block_object_dispose(&v74, 8);

  objc_autoreleasePoolPop(context);
  return v51;
}

- (id)contactsInHome
{
  void *v1;
  void *v2;

  if (a1)
  {
    +[_CDHomeManagerUtilities sharedInstance](_CDHomeManagerUtilities, "sharedInstance");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "contactsInHome");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (void)execute
{
  -[_CDCloudFamilyDataCollectionTask _execute](self);
  -[_CDCloudFamilyDataCollectionTask cleanup]((uint64_t)self);
}

- (void)_execute
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8(&dword_18DDBE000, v0, v1, "Selected for cloud family data collection", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)cleanup
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18DDBE000, v0, v1, "Error remove previous session file: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (id)labelMembers
{
  id v1;
  dispatch_semaphore_t v2;
  uint64_t v3;
  NSObject *v4;
  dispatch_time_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  dispatch_semaphore_t v9;
  dispatch_time_t v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, void *);
  void *v19;
  NSObject *v20;
  uint64_t *v21;
  _QWORD v22[4];
  NSObject *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  if (a1)
  {
    v1 = objc_alloc_init(getFAFetchFamilyCircleRequestClass());
    v25 = 0;
    v26 = &v25;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__14;
    v29 = __Block_byref_object_dispose__14;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v30 = (id)objc_claimAutoreleasedReturnValue();
    v2 = dispatch_semaphore_create(0);
    v3 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __48___CDCloudFamilyDataCollectionTask_labelMembers__block_invoke;
    v22[3] = &unk_1E26E5980;
    v24 = &v25;
    v4 = v2;
    v23 = v4;
    objc_msgSend(v1, "startRequestWithCompletionHandler:", v22);
    v5 = dispatch_time(0, 300000000000);
    if (dispatch_semaphore_wait(v4, v5))
    {
      +[_CDLogging dataCollectionChannel](_CDLogging, "dataCollectionChannel");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        -[_CDCloudFamilyDataCollectionTask labelMembers].cold.2();

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)v26[5];
      v26[5] = v7;

    }
    if (!objc_msgSend((id)v26[5], "count"))
    {
      objc_msgSend(v1, "setForceServerFetch:", 1);
      v9 = dispatch_semaphore_create(0);

      v16 = v3;
      v17 = 3221225472;
      v18 = __48___CDCloudFamilyDataCollectionTask_labelMembers__block_invoke_787;
      v19 = &unk_1E26E5980;
      v21 = &v25;
      v4 = v9;
      v20 = v4;
      objc_msgSend(v1, "startRequestWithCompletionHandler:", &v16);
      v10 = dispatch_time(0, 300000000000);
      if (dispatch_semaphore_wait(v4, v10))
      {
        +[_CDLogging dataCollectionChannel](_CDLogging, "dataCollectionChannel", v16, v17, v18, v19);
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
          -[_CDCloudFamilyDataCollectionTask labelMembers].cold.1();

        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = (void *)v26[5];
        v26[5] = v12;

      }
    }
    v14 = (void *)objc_msgSend((id)v26[5], "copy", v16, v17, v18, v19);

    _Block_object_dispose(&v25, 8);
  }
  else
  {
    v14 = 0;
  }
  return v14;
}

- (id)truncatedFileHandle
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v10;

  if (!a1)
    return 0;
  -[_CDCloudFamilyDataCollectionTask dataPath](a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByDeletingLastPathComponent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v3, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v2, 1, 0, &v10);
  v4 = v10;

  if (v4)
  {
    +[_CDLogging dataCollectionChannel](_CDLogging, "dataCollectionChannel");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[_CDCloudFamilyDataCollectionTask truncatedFileHandle].cold.1();

    v6 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "createFileAtPath:contents:attributes:", v1, v8, 0);

    objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForWritingAtPath:", v1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)allEmailAndPhoneNumberHandlesForContact:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(v3, "phoneNumbers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "valueForKey:", CFSTR("value"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    a1 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v12, "unformattedInternationalStringValue", (_QWORD)v18);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            objc_msgSend(v12, "unformattedInternationalStringValue");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1, "addObject:", v14);

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v9);
    }

    objc_msgSend(v4, "emailAddresses");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "valueForKey:", CFSTR("value"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "addObjectsFromArray:", v16);
  }

  return a1;
}

- (id)aggregateInteractionDataUsingStore:(void *)a3 contact:(void *)a4 callHistoryManager:(void *)a5 avgCallDur:
{
  objc_class *v9;
  id v10;
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
  double v29;
  double v30;
  void *v31;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  id v42;
  _QWORD v43[2];
  _QWORD v44[2];
  const __CFString *v45;
  _QWORD v46[3];

  v46[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v9 = (objc_class *)MEMORY[0x1E0C99E08];
    v40 = a5;
    v39 = a4;
    v42 = a3;
    v10 = a2;
    v35 = objc_alloc_init(v9);
    -[_CDCloudFamilyDataCollectionTask allEmailAndPhoneNumberHandlesForContact:](a1, v42);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0CB3880];
    v46[0] = CFSTR("com.apple.MobileSMS");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "predicateWithFormat:", CFSTR("bundleId IN %@"), v13);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x1E0CB3880];
    v45 = CFSTR("com.apple.UIKit.activity.Message");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "predicateWithFormat:", CFSTR("targetBundleId IN %@"), v15);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)MEMORY[0x1E0CB3528];
    v44[0] = v38;
    v44[1] = v37;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "orPredicateWithSubpredicates:", v17);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY recipients.identifier IN %@"), v11);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x1E0CB3528];
    v43[0] = v36;
    v43[1] = v34;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "andPredicateWithSubpredicates:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[_CDCloudFamilyDataCollectionTask fetchInteractionFeatureDictionaryWithPredicate:store:sortDescription:]((uint64_t)a1, v20, v10, v41);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v35;
    objc_msgSend(v35, "addEntriesFromDictionary:", v21);
    v23 = v11;
    v33 = v11;
    -[_CDCloudFamilyDataCollectionTask getThirdPartyPredicateForContact:handles:]((uint64_t)a1, v42, v11);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDCloudFamilyDataCollectionTask fetchInteractionFeatureDictionaryWithPredicate:store:sortDescription:]((uint64_t)a1, v24, v10, v41);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    -[_CDCloudFamilyDataCollectionTask thirdPartyMessageFeaturesFromFeatureDictionary:]((uint64_t)a1, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addEntriesFromDictionary:", v26);
    -[objc_class predicateForCallsWithAnyRemoteParticipantHandleNormalizedValues:](getCHRecentCallClass(), "predicateForCallsWithAnyRemoteParticipantHandleNormalizedValues:", v23);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "callsWithPredicate:limit:offset:batchSize:", v27, 0, 0, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v40, "doubleValue");
    v30 = v29;

    -[_CDCloudFamilyDataCollectionTask callFeaturesFromInteractions:avgCallLength:contact:]((uint64_t)a1, v28, v42, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v35, "addEntriesFromDictionary:", v31);
  }
  else
  {
    v22 = 0;
  }
  return v22;
}

- (id)contactFamilyRelationForContact:(void *)a3 contactRelations:(void *)a4 me:
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  const __CFString *v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  _BYTE v41[128];
  const __CFString *v42;
  void *v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v28 = v8;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v44, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v34;
      while (2)
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v34 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v14);
          objc_msgSend(v7, "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "identifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v16, "isEqualToString:", v17);

          if ((v18 & 1) != 0)
          {
            v42 = CFSTR("contactFamilyRelation");
            v43 = &unk_1E272ACF0;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
            a1 = (void *)objc_claimAutoreleasedReturnValue();
            v8 = v28;
            goto LABEL_21;
          }
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v44, 16);
        if (v12)
          continue;
        break;
      }
    }

    -[_CDCloudFamilyDataCollectionTask contactRelationsUsingMe:]((uint64_t)a1, v7);
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
    v8 = v28;
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v30;
      while (2)
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v30 != v21)
            objc_enumerationMutation(v10);
          v23 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v22);
          objc_msgSend(v9, "identifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "identifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v24, "isEqualToString:", v25);

          if ((v26 & 1) != 0)
          {
            v39 = CFSTR("contactFamilyRelation");
            v40 = &unk_1E272ACF0;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
            a1 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_21;
          }
          ++v22;
        }
        while (v20 != v22);
        v20 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
        if (v20)
          continue;
        break;
      }
    }

    v37 = CFSTR("contactFamilyRelation");
    v38 = &unk_1E272ACD8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_21:

  }
  return a1;
}

- (id)contactFamilyEmergencyForContact:(void *)a3 contactFamilyEmergency:
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  const __CFString *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (a1)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v20;
      while (2)
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v12);
          objc_msgSend(v5, "identifier", (_QWORD)v19);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v14, "isEqualToString:", v15);

          if ((v16 & 1) != 0)
          {
            v25 = CFSTR("contactEmergencyFamily");
            v26 = &unk_1E272ACF0;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_12;
          }
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v10)
          continue;
        break;
      }
    }

    v23 = CFSTR("contactEmergencyFamily");
    v24 = &unk_1E272ACD8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }
LABEL_12:

  return v17;
}

- (id)contactEmergencyForContact:(void *)a3 contactEmergency:
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  const __CFString *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (a1)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v20;
      while (2)
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v12);
          objc_msgSend(v5, "identifier", (_QWORD)v19);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v14, "isEqualToString:", v15);

          if ((v16 & 1) != 0)
          {
            v25 = CFSTR("contactEmergency");
            v26 = &unk_1E272ACF0;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_12;
          }
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v10)
          continue;
        break;
      }
    }

    v23 = CFSTR("contactEmergency");
    v24 = &unk_1E272ACD8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }
LABEL_12:

  return v17;
}

- (id)contactParentsForContact:(void *)a3 contactParents:
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  const __CFString *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (a1)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v20;
      while (2)
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v12);
          objc_msgSend(v5, "identifier", (_QWORD)v19);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v14, "isEqualToString:", v15);

          if ((v16 & 1) != 0)
          {
            v25 = CFSTR("contactParent");
            v26 = &unk_1E272ACF0;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_12;
          }
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v10)
          continue;
        break;
      }
    }

    v23 = CFSTR("contactParent");
    v24 = &unk_1E272ACD8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }
LABEL_12:

  return v17;
}

- (id)contactsInHomeForContact:(void *)a3 homeContacts:
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  const __CFString *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (a1)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v20;
      while (2)
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v12);
          objc_msgSend(v5, "identifier", (_QWORD)v19);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v14, "isEqualToString:", v15);

          if ((v16 & 1) != 0)
          {
            v25 = CFSTR("contactInHome");
            v26 = &unk_1E272ACF0;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_12;
          }
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v10)
          continue;
        break;
      }
    }

    v23 = CFSTR("contactInHome");
    v24 = &unk_1E272ACD8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }
LABEL_12:

  return v17;
}

- (id)contactFamilyNameForContact:(void *)a3 me:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void **v19;
  const __CFString **v20;
  void *v21;
  const __CFString *v23;
  void *v24;
  const __CFString *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!a1)
  {
    v21 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v6, "familyName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "familyName");
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
    goto LABEL_7;
  v10 = (void *)v9;
  objc_msgSend(v5, "familyName");
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11)
  {

    goto LABEL_7;
  }
  v12 = (void *)v11;
  objc_msgSend(v7, "familyName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "familyName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v8, "length");
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v13, "compare:options:range:locale:", v14, 129, 0, v15, v16);

  if (v17)
  {
LABEL_7:
    v23 = CFSTR("contactFamilyName");
    v24 = &unk_1E272ACD8;
    v18 = (void *)MEMORY[0x1E0C99D80];
    v19 = &v24;
    v20 = &v23;
    goto LABEL_8;
  }
  v25 = CFSTR("contactFamilyName");
  v26[0] = &unk_1E272ACF0;
  v18 = (void *)MEMORY[0x1E0C99D80];
  v19 = (void **)v26;
  v20 = &v25;
LABEL_8:
  objc_msgSend(v18, "dictionaryWithObjects:forKeys:count:", v19, v20, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v21;
}

- (BOOL)submitDataForCollection
{
  NSObject *v2;
  void *v3;
  void *v4;
  id v5;
  const char *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  _BOOL8 v12;
  int v14;
  void *v15;
  id v16;
  NSObject *v17;
  void (**v18)(_QWORD, _QWORD, _QWORD);
  id v19;
  stat v20;
  _BYTE v21[8192];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  +[_CDLogging dataCollectionChannel](_CDLogging, "dataCollectionChannel");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    -[_CDCloudFamilyDataCollectionTask submitDataForCollection].cold.3();

  -[_CDCloudFamilyDataCollectionTask dataPath](a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathExtension:", CFSTR("tar.gz"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_retainAutorelease(v3);
  v6 = (const char *)objc_msgSend(v5, "fileSystemRepresentation");
  objc_msgSend(v5, "lastPathComponent");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v7, "fileSystemRepresentation");

  v8 = objc_retainAutorelease(v4);
  objc_msgSend(v8, "fileSystemRepresentation");
  archive_write_new();
  if (!archive_write_add_filter_gzip()
    && !archive_write_set_format_pax_restricted()
    && !archive_write_open_filename())
  {
    memset(&v20, 0, sizeof(v20));
    stat(v6, &v20);
    archive_entry_new();
    archive_entry_set_size();
    archive_entry_set_filetype();
    archive_entry_set_perm();
    archive_entry_set_pathname();
    if (!archive_write_header())
    {
      v14 = open(v6, 0);
      while (read(v14, v21, 0x2000uLL))
        archive_write_data();
      close(v14);
      archive_entry_free();
      archive_write_close();
      archive_write_free();
      v19 = 0;
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v8, 8, &v19);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v19;
      v12 = v16 == 0;
      if (v16)
      {
        +[_CDLogging dataCollectionChannel](_CDLogging, "dataCollectionChannel");
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          -[_CDCloudFamilyDataCollectionTask submitDataForCollection].cold.1();
      }
      else
      {
        objc_msgSend(v8, "lastPathComponent");
        v17 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "submissionBlock");
        v18 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, NSObject *, void *))v18)[2](v18, v17, v15);

      }
      goto LABEL_12;
    }
    archive_entry_free();
  }
  v9 = archive_errno();
  v10 = archive_error_string();
  +[_CDLogging dataCollectionChannel](_CDLogging, "dataCollectionChannel");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    -[_CDCloudFamilyDataCollectionTask submitDataForCollection].cold.2(v9, v10, v11);

  archive_write_close();
  archive_write_free();
  v12 = 0;
LABEL_12:

  return v12;
}

- (id)dataPath
{
  id *v1;
  _QWORD *v2;
  void *v3;
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;
  id v8;
  _QWORD *v9;
  void *v10;
  void *v11;

  v1 = a1;
  if (a1)
  {
    if (a1[11])
    {
      v2 = a1[11];
      if (v2)
        v3 = (void *)v2[1];
      else
        v3 = 0;
      v4 = (void *)MEMORY[0x1E0CB37E8];
      v5 = a1[11];
      if (v5)
        v6 = v5[5];
      else
        v6 = 0;
      v7 = v5;
      v8 = v3;
      v9 = v2;
      objc_msgSend(v4, "numberWithUnsignedInteger:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringByAppendingFormat:", CFSTR(".%@.json"), v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v1[4], "stringByAppendingPathComponent:", v11);
      v1 = (id *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v1 = 0;
    }
  }
  return v1;
}

- (uint64_t)indexToInsertDate:(void *)a3 array:
{
  id v4;
  id v5;
  uint64_t v6;

  if (result)
  {
    v4 = a3;
    v5 = a2;
    v6 = objc_msgSend(v4, "indexOfObject:inSortedRange:options:usingComparator:", v5, 0, objc_msgSend(v4, "count"), 1024, &__block_literal_global_765);

    return v6;
  }
  return result;
}

- (id)allAirDropInteractionsFromStore:(uint64_t)a3 fetchLimit:
{
  void *v4;
  id v5;
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
  id v17;
  void *v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v4 = (void *)MEMORY[0x1E0CB3880];
  v5 = a2;
  objc_msgSend(v4, "predicateWithFormat:", CFSTR("(targetBundleId == %@)"), CFSTR("com.apple.UIKit.activity.AirDrop"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(mechanism == %@)"), &unk_1E272AD08);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3528];
  v19[0] = v7;
  v19[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "andPredicateWithSubpredicates:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v5, "queryInteractionsUsingPredicate:sortDescriptors:limit:error:", v10, v12, a3, &v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = v17;
  if (v14)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[_CDCloudFamilyDataCollectionTask allAirDropInteractionsFromStore:fetchLimit:].cold.1();
    v15 = 0;
  }
  else
  {
    v15 = v13;
  }

  return v15;
}

- (id)relationshipRegularExpressionForRelationship
{
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  id obj;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[_CDCloudFamilyDataCollectionTask personRelationshipVocabularyByLocaleDictionary](a1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "allValues");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v1;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v16)
  {
    v15 = *(_QWORD *)v25;
    do
    {
      v2 = 0;
      do
      {
        if (*(_QWORD *)v25 != v15)
          objc_enumerationMutation(obj);
        v17 = v2;
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v2), "allValues");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        if (v4)
        {
          v5 = v4;
          v6 = *(_QWORD *)v21;
          do
          {
            v7 = 0;
            do
            {
              if (*(_QWORD *)v21 != v6)
                objc_enumerationMutation(v3);
              v8 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v7), "componentsJoinedByString:", CFSTR("|"));
              v9 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "stringWithFormat:", CFSTR("^(%@)$"), v9);
              v10 = (void *)objc_claimAutoreleasedReturnValue();

              v19 = 0;
              objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", v10, 1, &v19);
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              if (v11)
                objc_msgSend(v18, "addObject:", v11);

              ++v7;
            }
            while (v5 != v7);
            v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          }
          while (v5);
        }

        v2 = v17 + 1;
      }
      while (v17 + 1 != v16);
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v16);
  }

  return v18;
}

- (id)personRelationshipVocabularyByLocaleDictionary
{
  _QWORD block[5];

  if (a1)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __82___CDCloudFamilyDataCollectionTask_personRelationshipVocabularyByLocaleDictionary__block_invoke;
    block[3] = &unk_1E26E2F20;
    block[4] = a1;
    if (personRelationshipVocabularyByLocaleDictionary_onceToken != -1)
      dispatch_once(&personRelationshipVocabularyByLocaleDictionary_onceToken, block);
    a1 = (id)personRelationshipVocabularyByLocaleDictionary_sPersonRelationshipVocabularyByLocaleDictionary;
  }
  return a1;
}

- (BOOL)regexMatchForRegex:(void *)a3 string:
{
  id v5;
  id v6;
  void *v7;
  _BOOL8 v8;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  v8 = 0;
  if (a1 && v6)
    v8 = objc_msgSend(v5, "numberOfMatchesInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length")) != 0;

  return v8;
}

- (id)queryContactsForGivenName:(uint64_t)a1
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  id v13;

  if (!a1)
    return 0;
  v4 = *(id *)(a1 + 64);
  v5 = a2;
  -[objc_class predicateForContactsMatchingName:](getCNContactClass(), "predicateForContactsMatchingName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[_CDCloudFamilyDataCollectionTask contactKeysToFetch](a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v4, "unifiedContactsMatchingPredicate:keysToFetch:error:", v6, v7, &v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v13;

  if (v9)
  {
    +[_CDLogging dataCollectionChannel](_CDLogging, "dataCollectionChannel");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[_CDCloudFamilyDataCollectionTask queryContactsForGivenName:].cold.1();

    v11 = (id)MEMORY[0x1E0C9AA60];
  }
  else
  {
    v11 = v8;
  }

  return v11;
}

- (id)fetchEmergencyContacts
{
  id v1;
  dispatch_semaphore_t v2;
  NSObject *v3;
  dispatch_time_t v4;
  NSObject *v5;
  id v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  NSObject *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  if (!a1)
    return 0;
  v1 = *(id *)(a1 + 72);
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__14;
  v18 = __Block_byref_object_dispose__14;
  v19 = 0;
  v2 = dispatch_semaphore_create(0);
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __58___CDCloudFamilyDataCollectionTask_fetchEmergencyContacts__block_invoke;
  v11 = &unk_1E26E59A8;
  v13 = &v14;
  v3 = v2;
  v12 = v3;
  objc_msgSend(v1, "fetchMedicalIDEmergencyContactsWithCompletion:", &v8);
  v4 = dispatch_time(0, 300000000000);
  if (dispatch_semaphore_wait(v3, v4))
  {
    +[_CDLogging dataCollectionChannel](_CDLogging, "dataCollectionChannel", v8, v9, v10, v11);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[_CDCloudFamilyDataCollectionTask contactsEmergency].cold.1();

  }
  v6 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v6;
}

- (id)callFeaturesFromInteractions:(void *)a3 avgCallLength:(double)a4 contact:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  unint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  double v60;
  double v61;
  double v62;
  void *v63;
  void *v64;
  void *v65;
  const __CFString *v66;
  unint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  double v73;
  double v74;
  double v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  double v82;
  double v83;
  double v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  double v91;
  double v92;
  double v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  double v100;
  double v101;
  double v102;
  void *v103;
  unint64_t v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  double v110;
  double v111;
  double v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  double v119;
  double v120;
  double v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  double v128;
  double v129;
  double v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  double v137;
  double v138;
  double v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  double v145;
  double v146;
  double v147;
  void *v148;
  unint64_t v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  double v155;
  double v156;
  double v157;
  void *v158;
  unint64_t v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  double v165;
  double v166;
  double v167;
  void *v168;
  unint64_t v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  double v175;
  double v176;
  double v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  double v183;
  double v184;
  double v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  double v191;
  double v192;
  double v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  double v199;
  double v200;
  double v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  double v206;
  double v207;
  void *v208;
  double v209;
  double v210;
  void *v211;
  double v212;
  double v213;
  void *v214;
  void *v215;
  const __CFString *v216;
  void *v217;
  void *v218;
  void *v219;
  uint64_t v220;
  void *v221;
  void *v222;
  void *v223;
  double v224;
  void *v225;
  void *v226;
  void *v227;
  double v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  void *v234;
  void *v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  void *v241;
  void *v242;
  void *v243;
  void *v244;
  void *v245;
  void *v246;
  void *v247;
  void *v248;
  void *v249;
  void *v250;
  void *v251;
  void *v252;
  void *v253;
  void *v254;
  void *v255;
  void *v256;
  void *v257;
  void *v258;
  void *v259;
  void *v260;
  void *v261;
  void *v262;
  void *v263;
  void *v264;
  void *v265;
  void *v266;
  void *v267;
  void *v268;
  void *v269;
  void *v270;
  void *v271;
  void *v272;
  void *v273;
  void *v274;
  void *v275;
  void *v276;
  void *v277;
  void *v278;
  void *v279;
  void *v280;
  void *v281;
  void *v282;
  void *v283;
  void *v284;
  void *v285;
  void *v286;
  void *v287;
  void *v288;
  double v289;
  void *v290;
  void *v291;
  void *v292;
  double v293;
  void *v294;
  void *v295;
  void *v296;
  double v297;
  void *v298;
  void *v299;
  void *v300;
  double v301;
  void *v302;
  void *v303;
  void *v304;
  double v305;
  void *v306;
  void *v307;
  void *v308;
  double v309;
  void *v310;
  void *v311;
  void *v312;
  double v313;
  void *v314;
  void *v315;
  void *v316;
  double v317;
  void *v318;
  void *v319;
  void *v320;
  double v321;
  void *v322;
  void *v323;
  void *v324;
  double v325;
  void *v326;
  void *v327;
  void *v328;
  double v329;
  void *v330;
  void *v331;
  void *v332;
  double v333;
  void *v334;
  void *v335;
  void *v336;
  double v337;
  void *v338;
  void *v339;
  void *v340;
  double v341;
  void *v342;
  void *v343;
  void *v344;
  double v345;
  void *v346;
  void *v347;
  void *v348;
  double v349;
  void *v350;
  void *v351;
  void *v352;
  void *v353;
  void *v354;
  void *v355;
  void *v356;
  void *v357;
  void *v358;
  void *v359;
  void *v360;
  void *v361;
  void *v362;
  void *v363;
  void *v364;
  void *v365;
  void *v366;
  void *v367;
  void *v368;
  void *v369;
  void *v370;
  void *v371;
  void *v372;
  void *v373;
  void *v374;
  void *v375;
  void *v376;
  void *v377;
  void *v378;
  void *v379;
  void *v380;
  void *v381;
  void *v382;
  void *v383;
  void *v384;
  void *v385;
  void *v386;
  void *v387;
  void *v388;
  void *v389;
  void *v390;
  void *v391;
  void *v392;
  void *v393;
  void *v394;
  void *v395;
  void *v396;
  void *v397;
  void *v398;
  id v399;
  void *v400;
  id v401;
  void *v403;
  void *v404;
  id v405;
  id v406;
  uint64_t v407;
  void *v408;
  id obj;
  uint64_t v410;
  id v411;
  void *v412;
  uint64_t v413;
  void *v414;
  void *v415;
  __int128 v416;
  __int128 v417;
  __int128 v418;
  __int128 v419;
  _BYTE v420[128];
  uint64_t v421;

  v421 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  if (a1)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v411 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(v411, "setDateFormat:", CFSTR("dd/MM/yyyy"));
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "birthday");
    v414 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v412 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12
      && (objc_msgSend(MEMORY[0x1E0C99D68], "date"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v10, "components:fromDate:toDate:options:", 16, v12, v13, 0),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v13,
          v14))
    {
      v408 = v14;
      v15 = objc_msgSend(v14, "day");
      v16 = 0x1E0CB3000uLL;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v17, CFSTR("callTotal"));

      v407 = v15;
      if (v15 && objc_msgSend(v7, "count"))
      {
        +[_CDContactFavoritesUtilities sharedInstance](_CDContactFavoritesUtilities, "sharedInstance");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v405 = v8;
        objc_msgSend(v18, "entriesForContact:", v8);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v403 = v19;
        if (objc_msgSend(v19, "count"))
          objc_msgSend(v9, "setObject:forKeyedSubscript:", &unk_1E272ACF0, CFSTR("contactFavorite"));
        v404 = v12;
        objc_msgSend(v9, "setObject:forKeyedSubscript:", &unk_1E272B3E0, CFSTR("callMaxDur"));
        v418 = 0u;
        v419 = 0u;
        v416 = 0u;
        v417 = 0u;
        v406 = v7;
        obj = v7;
        v413 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v416, v420, 16);
        if (v413)
        {
          v410 = *(_QWORD *)v417;
          v20 = a4 + a4;
          do
          {
            for (i = 0; i != v413; ++i)
            {
              if (*(_QWORD *)v417 != v410)
                objc_enumerationMutation(obj);
              v22 = *(void **)(*((_QWORD *)&v416 + 1) + 8 * i);
              v23 = *(void **)(v16 + 2024);
              objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callTotalDur"));
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "doubleValue");
              v26 = v25;
              objc_msgSend(v22, "duration");
              objc_msgSend(v23, "numberWithDouble:", v26 + v27);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "setObject:forKeyedSubscript:", v28, CFSTR("callTotalDur"));

              objc_msgSend(v22, "duration");
              v30 = v29;
              objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callMaxDur"));
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "doubleValue");
              v33 = v32;

              if (v30 > v33)
              {
                v34 = *(void **)(v16 + 2024);
                objc_msgSend(v22, "duration");
                objc_msgSend(v34, "numberWithDouble:");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v9, "setObject:forKeyedSubscript:", v35, CFSTR("callMaxDur"));

              }
              v36 = objc_msgSend(v22, "callStatus");
              if (v36 == getkCHCallStatusConnectedOutgoing())
              {
                v37 = *(void **)(v16 + 2024);
                objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callOutgoingRatio"));
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v37, "numberWithInteger:", objc_msgSend(v38, "integerValue") + 1);
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v9, "setObject:forKeyedSubscript:", v39, CFSTR("callOutgoingRatio"));

              }
              objc_msgSend(v22, "duration");
              v41 = v40;
              if (v40 >= v20)
              {
                v42 = *(void **)(v16 + 2024);
                objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callLongRatio"));
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v42, "numberWithInteger:", objc_msgSend(v43, "integerValue") + 1);
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v9, "setObject:forKeyedSubscript:", v44, CFSTR("callLongRatio"));

              }
              v45 = v16;
              objc_msgSend(v22, "date");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v411, "stringFromDate:", v46);
              v47 = objc_claimAutoreleasedReturnValue();

              v415 = (void *)v47;
              objc_msgSend(v412, "addObject:", v47);
              objc_msgSend(v22, "date");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              v49 = v10;
              objc_msgSend(v10, "components:fromDate:", 568, v48);
              v50 = (void *)objc_claimAutoreleasedReturnValue();

              v51 = objc_msgSend(v50, "weekday");
              v52 = objc_msgSend(v50, "hour");
              v53 = objc_msgSend(v50, "day");
              v54 = objc_msgSend(v50, "month");
              if (objc_msgSend(v414, "day") == v53 && objc_msgSend(v414, "month") == v54)
                objc_msgSend(v9, "setObject:forKeyedSubscript:", &unk_1E272ACF0, CFSTR("callBirthday"));
              if ((unint64_t)(v51 - 2) > 3)
              {
                v10 = v49;
                if (v51 == 7)
                {
                  v16 = v45;
                  if ((unint64_t)(v52 - 6) > 5)
                  {
                    if ((unint64_t)(v52 - 12) > 5)
                    {
                      v159 = v52 - 18;
                      v160 = *(void **)(v45 + 2024);
                      if (v159 > 5)
                      {
                        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callNightSat"));
                        v187 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v160, "numberWithInteger:", objc_msgSend(v187, "integerValue") + 1);
                        v188 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v9, "setObject:forKeyedSubscript:", v188, CFSTR("callNightSat"));

                        v189 = *(void **)(v45 + 2024);
                        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callDurNightSat"));
                        v190 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v190, "doubleValue");
                        v192 = v191;
                        objc_msgSend(v22, "duration");
                        objc_msgSend(v189, "numberWithDouble:", v192 + v193);
                        v194 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v9, "setObject:forKeyedSubscript:", v194, CFSTR("callDurNightSat"));

                        if (v41 < v20)
                          goto LABEL_70;
                        v64 = *(void **)(v45 + 2024);
                        v65 = v9;
                        v66 = CFSTR("callLongNightSat");
                      }
                      else
                      {
                        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callEveSat"));
                        v161 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v160, "numberWithInteger:", objc_msgSend(v161, "integerValue") + 1);
                        v162 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v9, "setObject:forKeyedSubscript:", v162, CFSTR("callEveSat"));

                        v163 = *(void **)(v45 + 2024);
                        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callDurEveSat"));
                        v164 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v164, "doubleValue");
                        v166 = v165;
                        objc_msgSend(v22, "duration");
                        objc_msgSend(v163, "numberWithDouble:", v166 + v167);
                        v168 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v9, "setObject:forKeyedSubscript:", v168, CFSTR("callDurEveSat"));

                        if (v41 < v20)
                          goto LABEL_70;
                        v64 = *(void **)(v45 + 2024);
                        v65 = v9;
                        v66 = CFSTR("callLongEveSat");
                      }
                    }
                    else
                    {
                      v123 = *(void **)(v45 + 2024);
                      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callNoonSat"));
                      v124 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v123, "numberWithInteger:", objc_msgSend(v124, "integerValue") + 1);
                      v125 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v9, "setObject:forKeyedSubscript:", v125, CFSTR("callNoonSat"));

                      v126 = *(void **)(v45 + 2024);
                      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callDurNoonSat"));
                      v127 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v127, "doubleValue");
                      v129 = v128;
                      objc_msgSend(v22, "duration");
                      objc_msgSend(v126, "numberWithDouble:", v129 + v130);
                      v131 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v9, "setObject:forKeyedSubscript:", v131, CFSTR("callDurNoonSat"));

                      if (v41 < v20)
                        goto LABEL_70;
                      v64 = *(void **)(v45 + 2024);
                      v65 = v9;
                      v66 = CFSTR("callLongNoonSat");
                    }
                  }
                  else
                  {
                    v86 = *(void **)(v45 + 2024);
                    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callMorningSat"));
                    v87 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v86, "numberWithInteger:", objc_msgSend(v87, "integerValue") + 1);
                    v88 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v9, "setObject:forKeyedSubscript:", v88, CFSTR("callMorningSat"));

                    v89 = *(void **)(v45 + 2024);
                    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callDurMorningSat"));
                    v90 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v90, "doubleValue");
                    v92 = v91;
                    objc_msgSend(v22, "duration");
                    objc_msgSend(v89, "numberWithDouble:", v92 + v93);
                    v94 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v9, "setObject:forKeyedSubscript:", v94, CFSTR("callDurMorningSat"));

                    if (v41 < v20)
                      goto LABEL_70;
                    v64 = *(void **)(v45 + 2024);
                    v65 = v9;
                    v66 = CFSTR("callLongMorningSat");
                  }
                }
                else
                {
                  v16 = v45;
                  v67 = v52 - 6;
                  if (v51 == 6)
                  {
                    if (v67 > 5)
                    {
                      if ((unint64_t)(v52 - 12) > 5)
                      {
                        v149 = v52 - 18;
                        v150 = *(void **)(v45 + 2024);
                        if (v149 > 5)
                        {
                          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callNightFri"));
                          v179 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v150, "numberWithInteger:", objc_msgSend(v179, "integerValue") + 1);
                          v180 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v9, "setObject:forKeyedSubscript:", v180, CFSTR("callNightFri"));

                          v181 = *(void **)(v45 + 2024);
                          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callDurNightFri"));
                          v182 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v182, "doubleValue");
                          v184 = v183;
                          objc_msgSend(v22, "duration");
                          objc_msgSend(v181, "numberWithDouble:", v184 + v185);
                          v186 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v9, "setObject:forKeyedSubscript:", v186, CFSTR("callDurNightFri"));

                          if (v41 < v20)
                            goto LABEL_70;
                          v64 = *(void **)(v45 + 2024);
                          v65 = v9;
                          v66 = CFSTR("callLongNightFri");
                        }
                        else
                        {
                          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callEveFri"));
                          v151 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v150, "numberWithInteger:", objc_msgSend(v151, "integerValue") + 1);
                          v152 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v9, "setObject:forKeyedSubscript:", v152, CFSTR("callEveFri"));

                          v153 = *(void **)(v45 + 2024);
                          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callDurEveFri"));
                          v154 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v154, "doubleValue");
                          v156 = v155;
                          objc_msgSend(v22, "duration");
                          objc_msgSend(v153, "numberWithDouble:", v156 + v157);
                          v158 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v9, "setObject:forKeyedSubscript:", v158, CFSTR("callDurEveFri"));

                          if (v41 < v20)
                            goto LABEL_70;
                          v64 = *(void **)(v45 + 2024);
                          v65 = v9;
                          v66 = CFSTR("callLongEveFri");
                        }
                      }
                      else
                      {
                        v114 = *(void **)(v45 + 2024);
                        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callNoonFri"));
                        v115 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v114, "numberWithInteger:", objc_msgSend(v115, "integerValue") + 1);
                        v116 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v9, "setObject:forKeyedSubscript:", v116, CFSTR("callNoonFri"));

                        v117 = *(void **)(v45 + 2024);
                        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callDurNoonFri"));
                        v118 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v118, "doubleValue");
                        v120 = v119;
                        objc_msgSend(v22, "duration");
                        objc_msgSend(v117, "numberWithDouble:", v120 + v121);
                        v122 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v9, "setObject:forKeyedSubscript:", v122, CFSTR("callDurNoonFri"));

                        if (v41 < v20)
                          goto LABEL_70;
                        v64 = *(void **)(v45 + 2024);
                        v65 = v9;
                        v66 = CFSTR("callLongNoonFri");
                      }
                    }
                    else
                    {
                      v68 = *(void **)(v45 + 2024);
                      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callMorningFri"));
                      v69 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v68, "numberWithInteger:", objc_msgSend(v69, "integerValue") + 1);
                      v70 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v9, "setObject:forKeyedSubscript:", v70, CFSTR("callMorningFri"));

                      v71 = *(void **)(v45 + 2024);
                      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callDurMorningFri"));
                      v72 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v72, "doubleValue");
                      v74 = v73;
                      objc_msgSend(v22, "duration");
                      objc_msgSend(v71, "numberWithDouble:", v74 + v75);
                      v76 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v9, "setObject:forKeyedSubscript:", v76, CFSTR("callDurMorningFri"));

                      if (v41 < v20)
                        goto LABEL_70;
                      v64 = *(void **)(v45 + 2024);
                      v65 = v9;
                      v66 = CFSTR("callLongMorningFri");
                    }
                  }
                  else if (v67 > 5)
                  {
                    if ((unint64_t)(v52 - 12) > 5)
                    {
                      v169 = v52 - 18;
                      v170 = *(void **)(v45 + 2024);
                      if (v169 > 5)
                      {
                        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callNightSun"));
                        v195 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v170, "numberWithInteger:", objc_msgSend(v195, "integerValue") + 1);
                        v196 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v9, "setObject:forKeyedSubscript:", v196, CFSTR("callNightSun"));

                        v197 = *(void **)(v45 + 2024);
                        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callDurNightSun"));
                        v198 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v198, "doubleValue");
                        v200 = v199;
                        objc_msgSend(v22, "duration");
                        objc_msgSend(v197, "numberWithDouble:", v200 + v201);
                        v202 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v9, "setObject:forKeyedSubscript:", v202, CFSTR("callDurNightSun"));

                        if (v41 < v20)
                          goto LABEL_70;
                        v64 = *(void **)(v45 + 2024);
                        v65 = v9;
                        v66 = CFSTR("callLongNightSun");
                      }
                      else
                      {
                        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callEveSun"));
                        v171 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v170, "numberWithInteger:", objc_msgSend(v171, "integerValue") + 1);
                        v172 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v9, "setObject:forKeyedSubscript:", v172, CFSTR("callEveSun"));

                        v173 = *(void **)(v45 + 2024);
                        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callDurEveSun"));
                        v174 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v174, "doubleValue");
                        v176 = v175;
                        objc_msgSend(v22, "duration");
                        objc_msgSend(v173, "numberWithDouble:", v176 + v177);
                        v178 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v9, "setObject:forKeyedSubscript:", v178, CFSTR("callDurEveSun"));

                        if (v41 < v20)
                          goto LABEL_70;
                        v64 = *(void **)(v45 + 2024);
                        v65 = v9;
                        v66 = CFSTR("callLongEveSun");
                      }
                    }
                    else
                    {
                      v132 = *(void **)(v45 + 2024);
                      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callNoonSun"));
                      v133 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v132, "numberWithInteger:", objc_msgSend(v133, "integerValue") + 1);
                      v134 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v9, "setObject:forKeyedSubscript:", v134, CFSTR("callNoonSun"));

                      v135 = *(void **)(v45 + 2024);
                      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callDurNoonSun"));
                      v136 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v136, "doubleValue");
                      v138 = v137;
                      objc_msgSend(v22, "duration");
                      objc_msgSend(v135, "numberWithDouble:", v138 + v139);
                      v140 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v9, "setObject:forKeyedSubscript:", v140, CFSTR("callDurNoonSun"));

                      if (v41 < v20)
                        goto LABEL_70;
                      v64 = *(void **)(v45 + 2024);
                      v65 = v9;
                      v66 = CFSTR("callLongNoonSun");
                    }
                  }
                  else
                  {
                    v95 = *(void **)(v45 + 2024);
                    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callMorningSun"));
                    v96 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v95, "numberWithInteger:", objc_msgSend(v96, "integerValue") + 1);
                    v97 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v9, "setObject:forKeyedSubscript:", v97, CFSTR("callMorningSun"));

                    v98 = *(void **)(v45 + 2024);
                    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callDurMorningSun"));
                    v99 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v99, "doubleValue");
                    v101 = v100;
                    objc_msgSend(v22, "duration");
                    objc_msgSend(v98, "numberWithDouble:", v101 + v102);
                    v103 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v9, "setObject:forKeyedSubscript:", v103, CFSTR("callDurMorningSun"));

                    if (v41 < v20)
                      goto LABEL_70;
                    v64 = *(void **)(v45 + 2024);
                    v65 = v9;
                    v66 = CFSTR("callLongMorningSun");
                  }
                }
              }
              else
              {
                v10 = v49;
                if ((unint64_t)(v52 - 6) > 5)
                {
                  v16 = v45;
                  if ((unint64_t)(v52 - 12) > 5)
                  {
                    v104 = v52 - 18;
                    v105 = *(void **)(v45 + 2024);
                    if (v104 > 5)
                    {
                      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callNightWeekday"));
                      v141 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v105, "numberWithInteger:", objc_msgSend(v141, "integerValue") + 1);
                      v142 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v9, "setObject:forKeyedSubscript:", v142, CFSTR("callNightWeekday"));

                      v143 = *(void **)(v45 + 2024);
                      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callDurNightWeekday"));
                      v144 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v144, "doubleValue");
                      v146 = v145;
                      objc_msgSend(v22, "duration");
                      objc_msgSend(v143, "numberWithDouble:", v146 + v147);
                      v148 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v9, "setObject:forKeyedSubscript:", v148, CFSTR("callDurNightWeekday"));

                      if (v41 < v20)
                        goto LABEL_70;
                      v64 = *(void **)(v45 + 2024);
                      v65 = v9;
                      v66 = CFSTR("callLongNightWeekday");
                    }
                    else
                    {
                      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callEveWeekday"));
                      v106 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v105, "numberWithInteger:", objc_msgSend(v106, "integerValue") + 1);
                      v107 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v9, "setObject:forKeyedSubscript:", v107, CFSTR("callEveWeekday"));

                      v108 = *(void **)(v45 + 2024);
                      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callDurEveWeekday"));
                      v109 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v109, "doubleValue");
                      v111 = v110;
                      objc_msgSend(v22, "duration");
                      objc_msgSend(v108, "numberWithDouble:", v111 + v112);
                      v113 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v9, "setObject:forKeyedSubscript:", v113, CFSTR("callDurEveWeekday"));

                      if (v41 < v20)
                        goto LABEL_70;
                      v64 = *(void **)(v45 + 2024);
                      v65 = v9;
                      v66 = CFSTR("callLongEveWeekday");
                    }
                  }
                  else
                  {
                    v77 = *(void **)(v45 + 2024);
                    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callNoonWeekday"));
                    v78 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v77, "numberWithInteger:", objc_msgSend(v78, "integerValue") + 1);
                    v79 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v9, "setObject:forKeyedSubscript:", v79, CFSTR("callNoonWeekday"));

                    v80 = *(void **)(v45 + 2024);
                    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callDurNoonWeekday"));
                    v81 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v81, "doubleValue");
                    v83 = v82;
                    objc_msgSend(v22, "duration");
                    objc_msgSend(v80, "numberWithDouble:", v83 + v84);
                    v85 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v9, "setObject:forKeyedSubscript:", v85, CFSTR("callDurNoonWeekday"));

                    if (v41 < v20)
                      goto LABEL_70;
                    v64 = *(void **)(v45 + 2024);
                    v65 = v9;
                    v66 = CFSTR("callLongNoonWeekday");
                  }
                }
                else
                {
                  v16 = v45;
                  v55 = *(void **)(v45 + 2024);
                  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callMorningWeekday"));
                  v56 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v55, "numberWithInteger:", objc_msgSend(v56, "integerValue") + 1);
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v9, "setObject:forKeyedSubscript:", v57, CFSTR("callMorningWeekday"));

                  v58 = *(void **)(v45 + 2024);
                  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callDurMorningWeekday"));
                  v59 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v59, "doubleValue");
                  v61 = v60;
                  objc_msgSend(v22, "duration");
                  objc_msgSend(v58, "numberWithDouble:", v61 + v62);
                  v63 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v9, "setObject:forKeyedSubscript:", v63, CFSTR("callDurMorningWeekday"));

                  if (v41 < v20)
                    goto LABEL_70;
                  v64 = *(void **)(v45 + 2024);
                  v65 = v9;
                  v66 = CFSTR("callLongMorningWeekday");
                }
              }
              objc_msgSend(v65, "objectForKeyedSubscript:", v66);
              v203 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v64, "numberWithInteger:", objc_msgSend(v203, "integerValue") + 1);
              v204 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "setObject:forKeyedSubscript:", v204, v66);

LABEL_70:
              objc_msgSend(v22, "date");
              v205 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v205, "timeIntervalSinceNow");
              v207 = v206;

              if (v207 >= -1209600.0)
              {
                v214 = *(void **)(v16 + 2024);
                v215 = v9;
                v216 = CFSTR("callTwoWeeks");
              }
              else
              {
                objc_msgSend(v22, "date");
                v208 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v208, "timeIntervalSinceNow");
                v210 = v209;

                if (v210 >= -3628800.0)
                {
                  v214 = *(void **)(v16 + 2024);
                  v215 = v9;
                  v216 = CFSTR("callSixWeeks");
                }
                else
                {
                  objc_msgSend(v22, "date");
                  v211 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v211, "timeIntervalSinceNow");
                  v213 = v212;

                  if (v213 < -7257600.0)
                    goto LABEL_77;
                  v214 = *(void **)(v16 + 2024);
                  v215 = v9;
                  v216 = CFSTR("callTwelveWeeks");
                }
              }
              objc_msgSend(v215, "objectForKeyedSubscript:", v216);
              v217 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v214, "numberWithInteger:", objc_msgSend(v217, "integerValue") + 1);
              v218 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "setObject:forKeyedSubscript:", v218, v216);

LABEL_77:
            }
            v413 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v416, v420, 16);
          }
          while (v413);
        }

        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callTotal"));
        v219 = (void *)objc_claimAutoreleasedReturnValue();
        v220 = objc_msgSend(v219, "integerValue");

        objc_msgSend(*(id *)(v16 + 2024), "numberWithDouble:", (double)(unint64_t)objc_msgSend(v412, "count") / (double)v407);
        v221 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v221, CFSTR("callDayRatio"));

        v222 = *(void **)(v16 + 2024);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callOutgoingRatio"));
        v223 = (void *)objc_claimAutoreleasedReturnValue();
        v224 = (double)v220;
        objc_msgSend(v222, "numberWithDouble:", (double)objc_msgSend(v223, "integerValue") / (double)v220);
        v225 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v225, CFSTR("callOutgoingRatio"));

        v226 = *(void **)(v16 + 2024);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callTotalDur"));
        v227 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v227, "doubleValue");
        objc_msgSend(v226, "numberWithLong:", 10 * ((uint64_t)llround(v228 / v224) / 10));
        v229 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v229, CFSTR("callAvgDur"));

        v230 = *(void **)(v16 + 2024);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callTwoWeeks"));
        v231 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v230, "numberWithDouble:", (double)objc_msgSend(v231, "integerValue") / v224);
        v232 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v232, CFSTR("callTwoWeeks"));

        v233 = *(void **)(v16 + 2024);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callSixWeeks"));
        v234 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v233, "numberWithDouble:", (double)objc_msgSend(v234, "integerValue") / v224);
        v235 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v235, CFSTR("callSixWeeks"));

        v236 = *(void **)(v16 + 2024);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callTwelveWeeks"));
        v237 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v236, "numberWithDouble:", (double)objc_msgSend(v237, "integerValue") / v224);
        v238 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v238, CFSTR("callTwelveWeeks"));

        v239 = *(void **)(v16 + 2024);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callMorningWeekday"));
        v240 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v239, "numberWithDouble:", (double)objc_msgSend(v240, "integerValue") / v224);
        v241 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v241, CFSTR("callMorningWeekday"));

        v242 = *(void **)(v16 + 2024);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callNoonWeekday"));
        v243 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v242, "numberWithDouble:", (double)objc_msgSend(v243, "integerValue") / v224);
        v244 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v244, CFSTR("callNoonWeekday"));

        v245 = *(void **)(v16 + 2024);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callEveWeekday"));
        v246 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v245, "numberWithDouble:", (double)objc_msgSend(v246, "integerValue") / v224);
        v247 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v247, CFSTR("callEveWeekday"));

        v248 = *(void **)(v16 + 2024);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callNightWeekday"));
        v249 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v248, "numberWithDouble:", (double)objc_msgSend(v249, "integerValue") / v224);
        v250 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v250, CFSTR("callNightWeekday"));

        v251 = *(void **)(v16 + 2024);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callMorningFri"));
        v252 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v251, "numberWithDouble:", (double)objc_msgSend(v252, "integerValue") / v224);
        v253 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v253, CFSTR("callMorningFri"));

        v254 = *(void **)(v16 + 2024);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callNoonFri"));
        v255 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v254, "numberWithDouble:", (double)objc_msgSend(v255, "integerValue") / v224);
        v256 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v256, CFSTR("callNoonFri"));

        v257 = *(void **)(v16 + 2024);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callEveFri"));
        v258 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v257, "numberWithDouble:", (double)objc_msgSend(v258, "integerValue") / v224);
        v259 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v259, CFSTR("callEveFri"));

        v260 = *(void **)(v16 + 2024);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callNightFri"));
        v261 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v260, "numberWithDouble:", (double)objc_msgSend(v261, "integerValue") / v224);
        v262 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v262, CFSTR("callNightFri"));

        v263 = *(void **)(v16 + 2024);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callMorningSat"));
        v264 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v263, "numberWithDouble:", (double)objc_msgSend(v264, "integerValue") / v224);
        v265 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v265, CFSTR("callMorningSat"));

        v266 = *(void **)(v16 + 2024);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callNoonSat"));
        v267 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v266, "numberWithDouble:", (double)objc_msgSend(v267, "integerValue") / v224);
        v268 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v268, CFSTR("callNoonSat"));

        v269 = *(void **)(v16 + 2024);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callEveSat"));
        v270 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v269, "numberWithDouble:", (double)objc_msgSend(v270, "integerValue") / v224);
        v271 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v271, CFSTR("callEveSat"));

        v272 = *(void **)(v16 + 2024);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callNightSat"));
        v273 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v272, "numberWithDouble:", (double)objc_msgSend(v273, "integerValue") / v224);
        v274 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v274, CFSTR("callNightSat"));

        v275 = *(void **)(v16 + 2024);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callMorningSun"));
        v276 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v275, "numberWithDouble:", (double)objc_msgSend(v276, "integerValue") / v224);
        v277 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v277, CFSTR("callMorningSun"));

        v278 = *(void **)(v16 + 2024);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callNoonSun"));
        v279 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v278, "numberWithDouble:", (double)objc_msgSend(v279, "integerValue") / v224);
        v280 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v280, CFSTR("callNoonSun"));

        v281 = *(void **)(v16 + 2024);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callEveSun"));
        v282 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v281, "numberWithDouble:", (double)objc_msgSend(v282, "integerValue") / v224);
        v283 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v283, CFSTR("callEveSun"));

        v284 = *(void **)(v16 + 2024);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callNightSun"));
        v285 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v284, "numberWithDouble:", (double)objc_msgSend(v285, "integerValue") / v224);
        v286 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v286, CFSTR("callNightSun"));

        v287 = *(void **)(v16 + 2024);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callDurMorningWeekday"));
        v288 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v288, "doubleValue");
        objc_msgSend(v287, "numberWithLong:", 10 * ((uint64_t)llround(v289 / v224) / 10));
        v290 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v290, CFSTR("callDurMorningWeekday"));

        v291 = *(void **)(v16 + 2024);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callDurNoonWeekday"));
        v292 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v292, "doubleValue");
        objc_msgSend(v291, "numberWithLong:", 10 * ((uint64_t)llround(v293 / v224) / 10));
        v294 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v294, CFSTR("callDurNoonWeekday"));

        v295 = *(void **)(v16 + 2024);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callDurEveWeekday"));
        v296 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v296, "doubleValue");
        objc_msgSend(v295, "numberWithLong:", 10 * ((uint64_t)llround(v297 / v224) / 10));
        v298 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v298, CFSTR("callDurEveWeekday"));

        v299 = *(void **)(v16 + 2024);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callDurNightWeekday"));
        v300 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v300, "doubleValue");
        objc_msgSend(v299, "numberWithLong:", llround(v301 / v224));
        v302 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v302, CFSTR("callDurNightWeekday"));

        v303 = *(void **)(v16 + 2024);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callDurMorningFri"));
        v304 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v304, "doubleValue");
        objc_msgSend(v303, "numberWithLong:", 10 * ((uint64_t)llround(v305 / v224) / 10));
        v306 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v306, CFSTR("callDurMorningFri"));

        v307 = *(void **)(v16 + 2024);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callDurNoonFri"));
        v308 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v308, "doubleValue");
        objc_msgSend(v307, "numberWithLong:", 10 * ((uint64_t)llround(v309 / v224) / 10));
        v310 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v310, CFSTR("callDurNoonFri"));

        v311 = *(void **)(v16 + 2024);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callDurEveFri"));
        v312 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v312, "doubleValue");
        objc_msgSend(v311, "numberWithLong:", 10 * ((uint64_t)llround(v313 / v224) / 10));
        v314 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v314, CFSTR("callDurEveFri"));

        v315 = *(void **)(v16 + 2024);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callDurNightFri"));
        v316 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v316, "doubleValue");
        objc_msgSend(v315, "numberWithLong:", 10 * ((uint64_t)llround(v317 / v224) / 10));
        v318 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v318, CFSTR("callDurNightFri"));

        v319 = *(void **)(v16 + 2024);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callDurMorningSat"));
        v320 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v320, "doubleValue");
        objc_msgSend(v319, "numberWithLong:", 10 * ((uint64_t)llround(v321 / v224) / 10));
        v322 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v322, CFSTR("callDurMorningSat"));

        v323 = *(void **)(v16 + 2024);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callDurNoonSat"));
        v324 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v324, "doubleValue");
        objc_msgSend(v323, "numberWithLong:", 10 * ((uint64_t)llround(v325 / v224) / 10));
        v326 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v326, CFSTR("callDurNoonSat"));

        v327 = *(void **)(v16 + 2024);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callDurEveSat"));
        v328 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v328, "doubleValue");
        objc_msgSend(v327, "numberWithLong:", 10 * ((uint64_t)llround(v329 / v224) / 10));
        v330 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v330, CFSTR("callDurEveSat"));

        v331 = *(void **)(v16 + 2024);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callDurNightSat"));
        v332 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v332, "doubleValue");
        objc_msgSend(v331, "numberWithLong:", 10 * ((uint64_t)llround(v333 / v224) / 10));
        v334 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v334, CFSTR("callDurNightSat"));

        v335 = *(void **)(v16 + 2024);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callDurMorningSun"));
        v336 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v336, "doubleValue");
        objc_msgSend(v335, "numberWithLong:", 10 * ((uint64_t)llround(v337 / v224) / 10));
        v338 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v338, CFSTR("callDurMorningSun"));

        v339 = *(void **)(v16 + 2024);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callDurNoonSun"));
        v340 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v340, "doubleValue");
        objc_msgSend(v339, "numberWithLong:", 10 * ((uint64_t)llround(v341 / v224) / 10));
        v342 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v342, CFSTR("callDurNoonSun"));

        v343 = *(void **)(v16 + 2024);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callDurEveSun"));
        v344 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v344, "doubleValue");
        objc_msgSend(v343, "numberWithLong:", 10 * ((uint64_t)llround(v345 / v224) / 10));
        v346 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v346, CFSTR("callDurEveSun"));

        v347 = *(void **)(v16 + 2024);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callDurNightSun"));
        v348 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v348, "doubleValue");
        objc_msgSend(v347, "numberWithLong:", 10 * ((uint64_t)llround(v349 / v224) / 10));
        v350 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v350, CFSTR("callDurNightSun"));

        v351 = *(void **)(v16 + 2024);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callLongMorningWeekday"));
        v352 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v351, "numberWithDouble:", (double)objc_msgSend(v352, "integerValue") / v224);
        v353 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v353, CFSTR("callLongMorningWeekday"));

        v354 = *(void **)(v16 + 2024);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callLongNoonWeekday"));
        v355 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v354, "numberWithDouble:", (double)objc_msgSend(v355, "integerValue") / v224);
        v356 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v356, CFSTR("callLongNoonWeekday"));

        v357 = *(void **)(v16 + 2024);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callLongEveWeekday"));
        v358 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v357, "numberWithDouble:", (double)objc_msgSend(v358, "integerValue") / v224);
        v359 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v359, CFSTR("callLongEveWeekday"));

        v360 = *(void **)(v16 + 2024);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callLongNightWeekday"));
        v361 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v360, "numberWithDouble:", (double)objc_msgSend(v361, "integerValue") / v224);
        v362 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v362, CFSTR("callLongNightWeekday"));

        v363 = *(void **)(v16 + 2024);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callLongMorningFri"));
        v364 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v363, "numberWithDouble:", (double)objc_msgSend(v364, "integerValue") / v224);
        v365 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v365, CFSTR("callLongMorningFri"));

        v366 = *(void **)(v16 + 2024);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callLongNoonFri"));
        v367 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v366, "numberWithDouble:", (double)objc_msgSend(v367, "integerValue") / v224);
        v368 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v368, CFSTR("callLongNoonFri"));

        v369 = *(void **)(v16 + 2024);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callLongEveFri"));
        v370 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v369, "numberWithDouble:", (double)objc_msgSend(v370, "integerValue") / v224);
        v371 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v371, CFSTR("callLongEveFri"));

        v372 = *(void **)(v16 + 2024);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callLongNightFri"));
        v373 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v372, "numberWithDouble:", (double)objc_msgSend(v373, "integerValue") / v224);
        v374 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v374, CFSTR("callLongNightFri"));

        v375 = *(void **)(v16 + 2024);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callLongMorningSat"));
        v376 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v375, "numberWithDouble:", (double)objc_msgSend(v376, "integerValue") / v224);
        v377 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v377, CFSTR("callLongMorningSat"));

        v378 = *(void **)(v16 + 2024);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callLongNoonSat"));
        v379 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v378, "numberWithDouble:", (double)objc_msgSend(v379, "integerValue") / v224);
        v380 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v380, CFSTR("callLongNoonSat"));

        v381 = *(void **)(v16 + 2024);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callLongEveSat"));
        v382 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v381, "numberWithDouble:", (double)objc_msgSend(v382, "integerValue") / v224);
        v383 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v383, CFSTR("callLongEveSat"));

        v384 = *(void **)(v16 + 2024);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callLongNightSat"));
        v385 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v384, "numberWithDouble:", (double)objc_msgSend(v385, "integerValue") / v224);
        v386 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v386, CFSTR("callLongNightSat"));

        v387 = *(void **)(v16 + 2024);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callLongMorningSun"));
        v388 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v387, "numberWithDouble:", (double)objc_msgSend(v388, "integerValue") / v224);
        v389 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v389, CFSTR("callLongMorningSun"));

        v390 = *(void **)(v16 + 2024);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callLongNoonSun"));
        v391 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v390, "numberWithDouble:", (double)objc_msgSend(v391, "integerValue") / v224);
        v392 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v392, CFSTR("callLongNoonSun"));

        v393 = *(void **)(v16 + 2024);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callLongEveSun"));
        v394 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v393, "numberWithDouble:", (double)objc_msgSend(v394, "integerValue") / v224);
        v395 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v395, CFSTR("callLongEveSun"));

        v396 = *(void **)(v16 + 2024);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("callLongNightSun"));
        v397 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v396, "numberWithDouble:", (double)objc_msgSend(v397, "integerValue") / v224);
        v398 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v398, CFSTR("callLongNightSun"));

        v399 = v9;
        v8 = v405;
        v7 = v406;
        v12 = v404;
      }
      else
      {
        v401 = v9;
      }

      v400 = v9;
    }
    else
    {
      v400 = (void *)MEMORY[0x1E0C9AA70];
    }

  }
  else
  {
    v400 = 0;
  }

  return v400;
}

- (void)messagesCumulativeFeaturesFromInteractionsBatch:(void *)a3 mutableMessagesDictionary:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  void *v39;
  const __CFString *v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  void *v45;
  double v46;
  double v47;
  void *v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  const __CFString *v56;
  void *v57;
  id v58;
  id obj;
  uint64_t v60;
  void *v61;
  id v62;
  void *v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!a1)
    goto LABEL_56;
  v62 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v62, "setDateFormat:", CFSTR("dd/MM/yyyy"));
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "count"))
    goto LABEL_55;
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("firstPartyMsgTotal"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v5, "count") + objc_msgSend(v8, "integerValue"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("firstPartyMsgTotal"));

  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  v58 = v5;
  obj = v5;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v68, 16);
  if (!v10)
    goto LABEL_54;
  v11 = v10;
  v60 = *(_QWORD *)v65;
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v65 != v60)
        objc_enumerationMutation(obj);
      v13 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
      if (objc_msgSend(v13, "direction", v58) == 1)
      {
        v14 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("firstPartyMsgOutgoingRatio"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "numberWithInteger:", objc_msgSend(v15, "integerValue") + 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v16, CFSTR("firstPartyMsgOutgoingRatio"));

      }
      objc_msgSend(v13, "startDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "stringFromDate:", v17);
      v18 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("daysSeen"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v19)
      {
        v20 = (void *)objc_opt_new();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v20, CFSTR("daysSeen"));

      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("fromDate"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v21
        || (objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("fromDate")),
            v22 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v13, "startDate"),
            v23 = (void *)objc_claimAutoreleasedReturnValue(),
            v24 = objc_msgSend(v22, "compare:", v23),
            v23,
            v22,
            v24 == 1))
      {
        objc_msgSend(v13, "startDate");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v25, CFSTR("fromDate"));

      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("daysSeen"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "addObject:", v18);

      objc_msgSend(v13, "startDate");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "components:fromDate:", 544, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      v29 = objc_msgSend(v28, "weekday");
      v30 = objc_msgSend(v28, "hour");
      v63 = (void *)v18;
      v31 = v30 - 6;
      if ((unint64_t)(v29 - 2) > 3)
      {
        if (v29 == 7)
        {
          if (v31 > 5)
          {
            if ((unint64_t)(v30 - 12) > 5)
            {
              v43 = v30 - 18;
              v38 = (void *)MEMORY[0x1E0CB37E8];
              v39 = v6;
              if (v43 > 5)
                v40 = CFSTR("firstPartyMsgNightSat");
              else
                v40 = CFSTR("firstPartyMsgEveSat");
            }
            else
            {
              v38 = (void *)MEMORY[0x1E0CB37E8];
              v39 = v6;
              v40 = CFSTR("firstPartyMsgNoonSat");
            }
          }
          else
          {
            v38 = (void *)MEMORY[0x1E0CB37E8];
            v39 = v6;
            v40 = CFSTR("firstPartyMsgMorningSat");
          }
        }
        else if (v29 == 6)
        {
          if (v31 > 5)
          {
            if ((unint64_t)(v30 - 12) > 5)
            {
              v42 = v30 - 18;
              v38 = (void *)MEMORY[0x1E0CB37E8];
              v39 = v6;
              if (v42 > 5)
                v40 = CFSTR("firstPartyMsgNightFri");
              else
                v40 = CFSTR("firstPartyMsgEveFri");
            }
            else
            {
              v38 = (void *)MEMORY[0x1E0CB37E8];
              v39 = v6;
              v40 = CFSTR("firstPartyMsgNoonFri");
            }
          }
          else
          {
            v38 = (void *)MEMORY[0x1E0CB37E8];
            v39 = v6;
            v40 = CFSTR("firstPartyMsgMorningFri");
          }
        }
        else if (v31 > 5)
        {
          if ((unint64_t)(v30 - 12) > 5)
          {
            v44 = v30 - 18;
            v38 = (void *)MEMORY[0x1E0CB37E8];
            v39 = v6;
            if (v44 > 5)
              v40 = CFSTR("firstPartyMsgNightSun");
            else
              v40 = CFSTR("firstPartyMsgEveSun");
          }
          else
          {
            v38 = (void *)MEMORY[0x1E0CB37E8];
            v39 = v6;
            v40 = CFSTR("firstPartyMsgNoonSun");
          }
        }
        else
        {
          v38 = (void *)MEMORY[0x1E0CB37E8];
          v39 = v6;
          v40 = CFSTR("firstPartyMsgMorningSun");
        }
      }
      else
      {
        if (v31 <= 5)
        {
          v32 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("firstPartyMsgMorningWeekday"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "numberWithInteger:", objc_msgSend(v33, "integerValue") + 1);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = v6;
          v36 = v34;
          v37 = CFSTR("firstPartyMsgMorningWeekday");
          goto LABEL_47;
        }
        if ((unint64_t)(v30 - 12) > 5)
        {
          v41 = v30 - 18;
          v38 = (void *)MEMORY[0x1E0CB37E8];
          v39 = v6;
          if (v41 > 5)
            v40 = CFSTR("firstPartyMsgNightWeekday");
          else
            v40 = CFSTR("firstPartyMsgEveWeekday");
        }
        else
        {
          v38 = (void *)MEMORY[0x1E0CB37E8];
          v39 = v6;
          v40 = CFSTR("firstPartyMsgNoonWeekday");
        }
      }
      objc_msgSend(v39, "objectForKeyedSubscript:", v40);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "numberWithInteger:", objc_msgSend(v33, "integerValue") + 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v6;
      v36 = v34;
      v37 = v40;
LABEL_47:
      objc_msgSend(v35, "setObject:forKeyedSubscript:", v36, v37);

      objc_msgSend(v13, "startDate");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "timeIntervalSinceNow");
      v47 = v46;

      if (v47 >= -1209600.0)
      {
        v57 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("firstPartyMsgTwoWeeks"));
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "numberWithInteger:", objc_msgSend(v52, "integerValue") + 1);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = v6;
        v55 = v53;
        v56 = CFSTR("firstPartyMsgTwoWeeks");
      }
      else
      {
        objc_msgSend(v13, "startDate");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "timeIntervalSinceNow");
        v50 = v49;

        if (v50 < -3628800.0)
          goto LABEL_52;
        v51 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("firstPartyMsgTwoWeeks"));
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "numberWithInteger:", objc_msgSend(v52, "integerValue") + 1);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = v6;
        v55 = v53;
        v56 = CFSTR("firstPartyMsgSixWeeks");
      }
      objc_msgSend(v54, "setObject:forKeyedSubscript:", v55, v56);

LABEL_52:
    }
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v68, 16);
  }
  while (v11);
LABEL_54:

  v5 = v58;
LABEL_55:

LABEL_56:
}

- (void)messagesFeaturesFromCumulativeDict:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  double v16;
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
  void *v45;
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
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (objc_msgSend(v3, "count"))
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstPartyMsgTotal"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "integerValue");

      if (v6)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("daysSeen"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fromDate"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "removeObjectForKey:", CFSTR("daysSeen"));
        objc_msgSend(v4, "removeObjectForKey:", CFSTR("fromDate"));
        if (v8)
        {
          objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "components:fromDate:toDate:options:", 16, v8, v10, 0);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
          {
            v12 = objc_msgSend(v11, "day");
            if (!v12)
            {

              goto LABEL_12;
            }
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)(unint64_t)objc_msgSend(v7, "count") / (double)v12);
            v13 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("firstPartyMsgDayRatio"));
          }
          else
          {
            objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E272B3F0, CFSTR("firstPartyMsgDayRatio"));
            +[_CDLogging dataCollectionChannel](_CDLogging, "dataCollectionChannel");
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
              -[_CDCloudFamilyDataCollectionTask messagesFeaturesFromCumulativeDict:].cold.1();
          }

        }
        v14 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstPartyMsgOutgoingRatio"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (double)v6;
        objc_msgSend(v14, "numberWithDouble:", (double)objc_msgSend(v15, "integerValue") / (double)v6);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, CFSTR("firstPartyMsgOutgoingRatio"));

        v18 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstPartyMsgTwoWeeks"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "numberWithDouble:", (double)objc_msgSend(v19, "integerValue") / v16);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v20, CFSTR("firstPartyMsgTwoWeeks"));

        v21 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstPartyMsgSixWeeks"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "numberWithDouble:", (double)objc_msgSend(v22, "integerValue") / v16);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v23, CFSTR("firstPartyMsgSixWeeks"));

        v24 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstPartyMsgMorningWeekday"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "numberWithDouble:", (double)objc_msgSend(v25, "integerValue") / v16);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v26, CFSTR("firstPartyMsgMorningWeekday"));

        v27 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstPartyMsgNoonWeekday"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "numberWithDouble:", (double)objc_msgSend(v28, "integerValue") / v16);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v29, CFSTR("firstPartyMsgNoonWeekday"));

        v30 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstPartyMsgEveWeekday"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "numberWithDouble:", (double)objc_msgSend(v31, "integerValue") / v16);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v32, CFSTR("firstPartyMsgEveWeekday"));

        v33 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstPartyMsgNightWeekday"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "numberWithDouble:", (double)objc_msgSend(v34, "integerValue") / v16);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v35, CFSTR("firstPartyMsgNightWeekday"));

        v36 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstPartyMsgMorningFri"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "numberWithDouble:", (double)objc_msgSend(v37, "integerValue") / v16);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v38, CFSTR("firstPartyMsgMorningFri"));

        v39 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstPartyMsgNoonFri"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "numberWithDouble:", (double)objc_msgSend(v40, "integerValue") / v16);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v41, CFSTR("firstPartyMsgNoonFri"));

        v42 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstPartyMsgEveFri"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "numberWithDouble:", (double)objc_msgSend(v43, "integerValue") / v16);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v44, CFSTR("firstPartyMsgEveFri"));

        v45 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstPartyMsgNightFri"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "numberWithDouble:", (double)objc_msgSend(v46, "integerValue") / v16);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v47, CFSTR("firstPartyMsgNightFri"));

        v48 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstPartyMsgMorningSat"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "numberWithDouble:", (double)objc_msgSend(v49, "integerValue") / v16);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v50, CFSTR("firstPartyMsgMorningSat"));

        v51 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstPartyMsgNoonSat"));
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "numberWithDouble:", (double)objc_msgSend(v52, "integerValue") / v16);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v53, CFSTR("firstPartyMsgNoonSat"));

        v54 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstPartyMsgEveSat"));
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "numberWithDouble:", (double)objc_msgSend(v55, "integerValue") / v16);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v56, CFSTR("firstPartyMsgEveSat"));

        v57 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstPartyMsgNightSat"));
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "numberWithDouble:", (double)objc_msgSend(v58, "integerValue") / v16);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v59, CFSTR("firstPartyMsgNightSat"));

        v60 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstPartyMsgMorningSun"));
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "numberWithDouble:", (double)objc_msgSend(v61, "integerValue") / v16);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v62, CFSTR("firstPartyMsgMorningSun"));

        v63 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstPartyMsgNoonSun"));
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "numberWithDouble:", (double)objc_msgSend(v64, "integerValue") / v16);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v65, CFSTR("firstPartyMsgNoonSun"));

        v66 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstPartyMsgEveSun"));
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "numberWithDouble:", (double)objc_msgSend(v67, "integerValue") / v16);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v68, CFSTR("firstPartyMsgEveSun"));

        v69 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstPartyMsgNightSun"));
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "numberWithDouble:", (double)objc_msgSend(v70, "integerValue") / v16);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v71, CFSTR("firstPartyMsgNightSun"));

LABEL_12:
      }
    }
  }

}

- (id)thirdPartyMessageFeaturesFromFeatureDictionary:(uint64_t)a1
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
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
  id v25;

  v3 = a2;
  if (a1)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (objc_msgSend(v3, "count"))
    {
      v5 = v3;
      if (objc_msgSend(v5, "count"))
      {
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("firstPartyMsgTotal"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("thirdPartyMsgTotal"));

        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("firstPartyMsgDayRatio"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("thirdPartyMsgDayRatio"));

        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("firstPartyMsgTwoWeeks"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("thirdPartyMsgTwoWeeks"));

        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("firstPartyMsgMorningWeekday"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("thirdPartyMsgMorningWeekday"));

        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("firstPartyMsgNoonWeekday"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("thirdPartyMsgNoonWeekday"));

        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("firstPartyMsgEveWeekday"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("thirdPartyMsgEveWeekday"));

        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("firstPartyMsgNightWeekday"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("thirdPartyMsgNightWeekday"));

        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("firstPartyMsgMorningFri"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("thirdPartyMsgMorningFri"));

        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("firstPartyMsgNoonFri"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("thirdPartyMsgNoonFri"));

        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("firstPartyMsgEveFri"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("thirdPartyMsgEveFri"));

        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("firstPartyMsgNightFri"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, CFSTR("thirdPartyMsgNightFri"));

        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("firstPartyMsgMorningSat"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, CFSTR("thirdPartyMsgMorningSat"));

        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("firstPartyMsgNoonSat"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, CFSTR("thirdPartyMsgNoonSat"));

        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("firstPartyMsgEveSat"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, CFSTR("thirdPartyMsgEveSat"));

        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("firstPartyMsgNightSat"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v20, CFSTR("thirdPartyMsgNightSat"));

        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("firstPartyMsgMorningSun"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v21, CFSTR("thirdPartyMsgMorningSun"));

        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("firstPartyMsgNoonSun"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v22, CFSTR("thirdPartyMsgNoonSun"));

        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("firstPartyMsgEveSun"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v23, CFSTR("thirdPartyMsgEveSun"));

        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("firstPartyMsgNightSun"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v24, CFSTR("thirdPartyMsgNightSun"));

        v25 = v4;
      }
      else
      {
        v25 = (id)MEMORY[0x1E0C9AA70];
      }

    }
    else
    {
      v25 = v4;
    }

  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (id)getThirdPartyPredicateForContact:(void *)a3 handles:
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
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
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id obj;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[3];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v39 = a2;
  v5 = a3;
  v38 = v5;
  if (a1)
  {
    v6 = v5;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("bundleId != %@"), CFSTR("com.apple.MobileSMS"));
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("direction IN %@"), &unk_1E272BDD0);
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("mechanism IN %@"), &unk_1E272BDE8);
    v10 = objc_claimAutoreleasedReturnValue();
    v36 = (void *)v8;
    objc_msgSend(v7, "addObject:", v8);
    v35 = (void *)v9;
    objc_msgSend(v7, "addObject:", v9);
    v37 = v7;
    v34 = (void *)v10;
    objc_msgSend(v7, "addObject:", v10);
    v11 = (void *)objc_opt_new();
    v12 = (void *)objc_opt_new();
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    obj = v6;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v42 != v15)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
          +[_CDContactResolver normalizedStringFromContactString:](_CDContactResolver, "normalizedStringFromContactString:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3500], "alphanumericCharacterSet");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "stringByAddingPercentEncodingWithAllowedCharacters:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("conversationIdentifier(%@)"), v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v21);

          objc_msgSend(v11, "addObject:", v18);
        }
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      }
      while (v14);
    }

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(ANY recipients.identifier IN %@)"), v11);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(derivedIntentIdentifier IN %@)"), v12);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)MEMORY[0x1E0CB3880];
    v25 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v39, "identifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setWithObject:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "predicateWithFormat:", CFSTR("(ANY recipients.personId IN %@)"), v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = (void *)MEMORY[0x1E0CB3528];
    v45[0] = v22;
    v45[1] = v23;
    v45[2] = v28;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 3);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "orPredicateWithSubpredicates:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addObject:", v31);

    objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v37);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v32 = 0;
  }

  return v32;
}

- (id)fetchInteractionFeatureDictionaryWithPredicate:(void *)a3 store:(void *)a4 sortDescription:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    v10 = (void *)objc_opt_new();
    v11 = 0;
    v12 = (void *)MEMORY[0x1E0C9AA60];
    do
    {
      v13 = v12;
      v14 = (void *)MEMORY[0x193FEE914]();
      v17[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "queryInteractionsUsingPredicate:sortDescriptors:limit:offset:error:", v7, v15, 128, v11, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      -[_CDCloudFamilyDataCollectionTask messagesCumulativeFeaturesFromInteractionsBatch:mutableMessagesDictionary:](a1, v12, v10);
      v11 += 128;
      objc_autoreleasePoolPop(v14);
    }
    while (objc_msgSend(v12, "count") == 128);
    -[_CDCloudFamilyDataCollectionTask messagesFeaturesFromCumulativeDict:](a1, v10);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (OS_xpc_object)activity
{
  return self->_activity;
}

- (id)submissionBlock
{
  return self->_submissionBlock;
}

- (void)setSubmissionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventDictState, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_videoBundleIDLookup, 0);
  objc_storeStrong((id *)&self->_medicalIDStore, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_interactionStore, 0);
  objc_storeStrong((id *)&self->_collectionDate, 0);
  objc_storeStrong((id *)&self->_sessionPath, 0);
  objc_storeStrong((id *)&self->_dataDirectory, 0);
  objc_storeStrong(&self->_submissionBlock, 0);
  objc_storeStrong((id *)&self->_activity, 0);
}

- (void)initWithStorage:contactStore:medicalIDStore:activity:sessionPath:dataDirectory:collectionDate:samplingRate:maxBatches:daysPerBatch:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18DDBE000, v0, v1, "Error unarchiving cloud family data collection session: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)contactsEmergency
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_7(&dword_18DDBE000, v0, v1, "Timeout when fetching emergency contacts", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)contactIdsInFmfFollowingMyLocation
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_7(&dword_18DDBE000, v0, v1, "Timeout when fetching FmfFollowingMyLocation", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)contactIdsInFmfSharingLocationWithMe
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_7(&dword_18DDBE000, v0, v1, "Timeout when fetching FmfSharingLocationWithMe", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)airDropPeopleAtHome
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_7(&dword_18DDBE000, v0, v1, "Timeout when fetching Routine homeVisits", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)labelMembers
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_7(&dword_18DDBE000, v0, v1, "Timeout waiting for family cache labels", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)truncatedFileHandle
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18DDBE000, v0, v1, "Error creating directory for data collection: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)submitDataForCollection
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8(&dword_18DDBE000, v0, v1, "Compressing airplay data collection json file", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)allAirDropInteractionsFromStore:fetchLimit:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18DDBE000, MEMORY[0x1E0C81028], v0, "Error querying interactions database: %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

- (void)queryContactsForGivenName:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18DDBE000, v0, v1, "Error querying contacts %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)messagesFeaturesFromCumulativeDict:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_18DDBE000, v0, v1, "Number of days was not valid, could not calculate ratio", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end

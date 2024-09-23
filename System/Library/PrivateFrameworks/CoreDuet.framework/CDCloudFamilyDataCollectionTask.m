@implementation CDCloudFamilyDataCollectionTask

id *__167___CDCloudFamilyDataCollectionTask_initWithStorage_contactStore_medicalIDStore_activity_sessionPath_dataDirectory_collectionDate_samplingRate_maxBatches_daysPerBatch___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_alloc_init(getCHManagerClass());
  if (WeakRetained)
    v3 = (void *)WeakRetained[8];
  else
    v3 = 0;
  v4 = v3;
  -[_CDCloudFamilyDataCollectionTask contactKeysToFetch]((uint64_t)WeakRetained);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_ios_meContactWithKeysToFetch:error:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[_CDCloudFamilyDataCollectionTask contactRelationsUsingMe:]((uint64_t)WeakRetained, v6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDCloudFamilyDataCollectionTask avgOfAllCallsUsingManager:]((uint64_t)WeakRetained, v2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDCloudFamilyDataCollectionTask contactsEmergencyFamily]((uint64_t)WeakRetained);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDCloudFamilyDataCollectionTask contactsEmergency]((uint64_t)WeakRetained);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDCloudFamilyDataCollectionTask contactsInContactStore]((uint64_t)WeakRetained);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDCloudFamilyDataCollectionTask contactParentsUsingRegexNamesUsingContacts:](WeakRetained, v8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[_CDCloudFamilyDataCollectionTask photosPeople]((uint64_t)WeakRetained);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDCloudFamilyDataCollectionTask contactIdsInFmfFollowingMyLocation]((uint64_t)WeakRetained);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDCloudFamilyDataCollectionTask contactIdsInFmfSharingLocationWithMe]((uint64_t)WeakRetained);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDCloudFamilyDataCollectionTask airDropPeople]((uint64_t)WeakRetained);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDCloudFamilyDataCollectionTask airDropPeopleAtHome]((uint64_t)WeakRetained);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDCloudFamilyDataCollectionTask contactsInHome]((uint64_t)WeakRetained);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v2;
  v12 = -[_CDEventDictsForContactsState initWithMngr:me:relationshipContacts:avgOfAllCalls:emergencyFamilyContacts:emergencyContacts:contactParents:photosContactIds:fmfContactsFollowingMyLocation:fmfContactsSharingLocationsWithMe:airDropDict:airDropDictAtHome:homeContacts:]((id *)[_CDEventDictsForContactsState alloc], v2, v6, v20, v18, v7, v21, v19, v16, v15, v14, v9, v10, v11);

  return v12;
}

void __167___CDCloudFamilyDataCollectionTask_initWithStorage_contactStore_medicalIDStore_activity_sessionPath_dataDirectory_collectionDate_samplingRate_maxBatches_daysPerBatch___block_invoke_737(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  void *v8;

  v4 = a3;
  v5 = a2;
  +[_CDLogging dataCollectionChannel](_CDLogging, "dataCollectionChannel");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __167___CDCloudFamilyDataCollectionTask_initWithStorage_contactStore_medicalIDStore_activity_sessionPath_dataDirectory_collectionDate_samplingRate_maxBatches_daysPerBatch___block_invoke_737_cold_1();

  v8 = v4;
  v7 = v4;
  OSAWriteLogForSubmission();

}

uint64_t __167___CDCloudFamilyDataCollectionTask_initWithStorage_contactStore_medicalIDStore_activity_sessionPath_dataDirectory_collectionDate_samplingRate_maxBatches_daysPerBatch___block_invoke_741(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "writeData:", *(_QWORD *)(a1 + 32));
}

uint64_t __58___CDCloudFamilyDataCollectionTask_contactsInContactStore__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", a2);
}

uint64_t __60___CDCloudFamilyDataCollectionTask_indexToInsertDate_array___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double v6;
  uint64_t v7;
  double v8;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "timeIntervalSinceDate:", v5);
  if (v6 >= 0.0)
  {
    objc_msgSend(v4, "timeIntervalSinceDate:", v5);
    v7 = v8 > 0.0;
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

void __48___CDCloudFamilyDataCollectionTask_labelMembers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
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
  uint64_t v29;
  uint64_t v30;
  id obj;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    +[_CDLogging dataCollectionChannel](_CDLogging, "dataCollectionChannel");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __48___CDCloudFamilyDataCollectionTask_labelMembers__block_invoke_cold_1();

  }
  v27 = v6;
  v28 = v5;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  objc_msgSend(v5, "members");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v39;
    v29 = *(_QWORD *)v39;
    do
    {
      v11 = 0;
      v30 = v9;
      do
      {
        if (*(_QWORD *)v39 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v11);
        objc_msgSend(v12, "dictionary");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("member-phone-numbers"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v33, "length") >= 2)
        {
          v32 = v13;
          objc_msgSend(v33, "componentsSeparatedByString:", CFSTR(", "));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = 0u;
          v35 = 0u;
          v36 = 0u;
          v37 = 0u;
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
          if (v15)
          {
            v16 = v15;
            v17 = *(_QWORD *)v35;
            do
            {
              for (i = 0; i != v16; ++i)
              {
                if (*(_QWORD *)v35 != v17)
                  objc_enumerationMutation(v14);
                v19 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
                +[_CDContactResolver normalizedStringFromContactString:](_CDContactResolver, "normalizedStringFromContactString:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i));
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "addObject:", v20);

              }
              v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
            }
            while (v16);
          }

          v10 = v29;
          v9 = v30;
          v13 = v32;
        }
        objc_msgSend(v12, "appleID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          v22 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
          objc_msgSend(v12, "appleID");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addObject:", v23);

        }
        objc_msgSend(v12, "inviteEmail");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
        {
          v25 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
          objc_msgSend(v12, "inviteEmail");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "addObject:", v26);

        }
        ++v11;
      }
      while (v11 != v9);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v9);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __48___CDCloudFamilyDataCollectionTask_labelMembers__block_invoke_787(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
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
  uint64_t v29;
  uint64_t v30;
  id obj;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    +[_CDLogging dataCollectionChannel](_CDLogging, "dataCollectionChannel");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __48___CDCloudFamilyDataCollectionTask_labelMembers__block_invoke_787_cold_1();

  }
  v27 = v6;
  v28 = v5;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  objc_msgSend(v5, "members");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v39;
    v29 = *(_QWORD *)v39;
    do
    {
      v11 = 0;
      v30 = v9;
      do
      {
        if (*(_QWORD *)v39 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v11);
        objc_msgSend(v12, "dictionary");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("member-phone-numbers"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v33, "length") >= 2)
        {
          v32 = v13;
          objc_msgSend(v33, "componentsSeparatedByString:", CFSTR(", "));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = 0u;
          v35 = 0u;
          v36 = 0u;
          v37 = 0u;
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
          if (v15)
          {
            v16 = v15;
            v17 = *(_QWORD *)v35;
            do
            {
              for (i = 0; i != v16; ++i)
              {
                if (*(_QWORD *)v35 != v17)
                  objc_enumerationMutation(v14);
                v19 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
                +[_CDContactResolver normalizedStringFromContactString:](_CDContactResolver, "normalizedStringFromContactString:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i));
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "addObject:", v20);

              }
              v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
            }
            while (v16);
          }

          v10 = v29;
          v9 = v30;
          v13 = v32;
        }
        objc_msgSend(v12, "appleID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          v22 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
          objc_msgSend(v12, "appleID");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addObject:", v23);

        }
        objc_msgSend(v12, "inviteEmail");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
        {
          v25 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
          objc_msgSend(v12, "inviteEmail");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "addObject:", v26);

        }
        ++v11;
      }
      while (v11 != v9);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v9);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __82___CDCloudFamilyDataCollectionTask_personRelationshipVocabularyByLocaleDictionary__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLForResource:withExtension:", CFSTR("vocab"), CFSTR("plist"));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:", v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)personRelationshipVocabularyByLocaleDictionary_sPersonRelationshipVocabularyByLocaleDictionary;
  personRelationshipVocabularyByLocaleDictionary_sPersonRelationshipVocabularyByLocaleDictionary = v1;

}

void __58___CDCloudFamilyDataCollectionTask_fetchEmergencyContacts__block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __53___CDCloudFamilyDataCollectionTask_contactsEmergency__block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __72___CDCloudFamilyDataCollectionTask_contactIdsInFmfSharingLocationWithMe__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v18 = a3;
  if (v18)
  {
    +[_CDLogging dataCollectionChannel](_CDLogging, "dataCollectionChannel", v18);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __72___CDCloudFamilyDataCollectionTask_contactIdsInFmfSharingLocationWithMe__block_invoke_cold_1();

  }
  else
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16, 0);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v22;
      do
      {
        v9 = v4;
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v22 != v8)
            objc_enumerationMutation(v9);
          v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v11, "identifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          +[_CDContactResolver resolveContactIfPossibleFromContactIdentifierString:](_CDContactResolver, "resolveContactIfPossibleFromContactIdentifierString:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            objc_msgSend(v11, "favoriteOrder");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (v14)
              v15 = &unk_1E272ACF0;
            else
              v15 = &unk_1E272ACD8;
            v16 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
            objc_msgSend(v13, "identifier");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v17);

          }
        }
        v4 = v9;
        v7 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v7);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __70___CDCloudFamilyDataCollectionTask_contactIdsInFmfFollowingMyLocation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v18 = a3;
  if (v18)
  {
    +[_CDLogging dataCollectionChannel](_CDLogging, "dataCollectionChannel", v18);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __72___CDCloudFamilyDataCollectionTask_contactIdsInFmfSharingLocationWithMe__block_invoke_cold_1();

  }
  else
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16, 0);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v22;
      do
      {
        v9 = v4;
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v22 != v8)
            objc_enumerationMutation(v9);
          v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v11, "identifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          +[_CDContactResolver resolveContactIfPossibleFromContactIdentifierString:](_CDContactResolver, "resolveContactIfPossibleFromContactIdentifierString:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            objc_msgSend(v11, "favoriteOrder");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (v14)
              v15 = &unk_1E272ACF0;
            else
              v15 = &unk_1E272ACD8;
            v16 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
            objc_msgSend(v13, "identifier");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v17);

          }
        }
        v4 = v9;
        v7 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v7);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __55___CDCloudFamilyDataCollectionTask_airDropPeopleAtHome__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __167___CDCloudFamilyDataCollectionTask_initWithStorage_contactStore_medicalIDStore_activity_sessionPath_dataDirectory_collectionDate_samplingRate_maxBatches_daysPerBatch___block_invoke_737_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8(&dword_18DDBE000, v0, v1, "Submitting compressed json to crash reporter", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __48___CDCloudFamilyDataCollectionTask_labelMembers__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18DDBE000, v0, v1, "FAFamilyMember request error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __48___CDCloudFamilyDataCollectionTask_labelMembers__block_invoke_787_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18DDBE000, v0, v1, "FAFamilyMember (force fetch server) request error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __72___CDCloudFamilyDataCollectionTask_contactIdsInFmfSharingLocationWithMe__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18DDBE000, v0, v1, "Error querying FMF %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end

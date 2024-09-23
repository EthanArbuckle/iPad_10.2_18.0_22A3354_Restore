@implementation CDInteractionStore

void __100___CDInteractionStore_queryInteractionsUsingPredicate_sortDescriptors_limit_offset_objectIDs_error___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  double v14;
  double v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  id v32;
  uint8_t v33[128];
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  double v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  void *v41;
  _QWORD v42[7];

  v42[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "begin");
  v2 = objc_alloc_init(MEMORY[0x1E0C97B48]);
  objc_msgSend(MEMORY[0x1E0C97B20], "entityForName:inManagedObjectContext:", CFSTR("Interactions"), *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEntity:", v3);

  objc_msgSend(v2, "setReturnsObjectsAsFaults:", 0);
  v42[0] = CFSTR("sender");
  v42[1] = CFSTR("recipients");
  v42[2] = CFSTR("keywords");
  v42[3] = CFSTR("attachments");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRelationshipKeyPathsForPrefetching:", v4);

  +[_CDInteractionStore predicateFilteringUsernameForPredicate:](_CDInteractionStore, "predicateFilteringUsernameForPredicate:", *(_QWORD *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v5);

  objc_msgSend(v2, "setFetchLimit:", *(_QWORD *)(a1 + 96));
  objc_msgSend(v2, "setFetchOffset:", *(_QWORD *)(a1 + 104));
  v6 = *(void **)(a1 + 56);
  if (v6 && objc_msgSend(v6, "count"))
    objc_msgSend(v2, "setSortDescriptors:", *(_QWORD *)(a1 + 56));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 40);
  v32 = 0;
  objc_msgSend(v8, "executeFetchRequest:error:", v2, &v32);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = v32;
  v11 = v32;
  if (v11)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), v10);

  +[_CDLogging instrumentationChannel](_CDLogging, "instrumentationChannel");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = objc_msgSend(v2, "fetchLimit");
    objc_msgSend(v7, "timeIntervalSinceNow");
    v15 = v14;
    v16 = objc_msgSend(v9, "count");
    objc_msgSend(v2, "predicate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218755;
    v35 = v13;
    v36 = 2048;
    v37 = -v15;
    v38 = 2048;
    v39 = v16;
    v40 = 2113;
    v41 = v17;
    _os_log_impl(&dword_18DDBE000, v12, OS_LOG_TYPE_INFO, "queryInteractionsUsingPredicate finished executeFetchRequest, fetchLimit %lu object(s), elapsed %f(sec), returned %lu object(s), Predicate: %{private}@", buf, 0x2Au);

  }
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v9 = v9;
    v19 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v29 != v20)
            objc_enumerationMutation(v9);
          v22 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(*(id *)(a1 + 64), "createInteractionFromRecord:", v22, (_QWORD)v28);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addObject:", v23);

          v24 = *(void **)(a1 + 72);
          objc_msgSend(v22, "objectID");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "addObject:", v25);

        }
        v19 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v19);
    }

    v26 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    v27 = *(void **)(v26 + 40);
    *(_QWORD *)(v26 + 40) = v18;

  }
}

void __70___CDInteractionStore_fetchOrCreateKeywordRecord_context_cache_error___block_invoke(uint64_t a1)
{
  void *v2;
  _BOOL4 v3;
  id v4;
  _BOOL4 v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  double v20;
  double v21;
  _BOOL4 v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  double v35;
  __int16 v36;
  _BOOL4 v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "begin");
  v2 = *(void **)(a1 + 40);
  v3 = v2 == 0;
  if (!v2)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C97B48]);
    objc_msgSend(MEMORY[0x1E0C97B20], "entityForName:inManagedObjectContext:", CFSTR("Keywords"), *(_QWORD *)(a1 + 56));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setEntity:", v11);

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("keyword == %@"), *(_QWORD *)(a1 + 48));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPredicate:", v12);

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(void **)(a1 + 56);
    v30 = 0;
    objc_msgSend(v13, "executeFetchRequest:error:", v4, &v30);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v30;
    objc_msgSend(v14, "lastObject");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v17 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v15;

    +[_CDLogging instrumentationChannel](_CDLogging, "instrumentationChannel");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = objc_msgSend(v4, "fetchLimit");
      objc_msgSend(v10, "timeIntervalSinceNow");
      v21 = v20;
      v22 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) != 0;
      objc_msgSend(v4, "predicate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218755;
      v33 = v19;
      v34 = 2048;
      v35 = -v21;
      v36 = 1024;
      v37 = v22;
      v38 = 2113;
      v39 = v23;
      _os_log_impl(&dword_18DDBE000, v18, OS_LOG_TYPE_INFO, "fetchOrCreateKeywordRecord finished executeFetchRequest, fetchLimit %lu object(s), elapsed %f(sec), returned %i object(s), Predicate: %{private}@", buf, 0x26u);

    }
    goto LABEL_7;
  }
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = v4 == 0;
  if (v4)
  {
    v6 = *(void **)(a1 + 56);
    v31 = 0;
    objc_msgSend(v6, "existingObjectWithID:error:", v4, &v31);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v31;
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v7;
LABEL_7:

    v5 = v3;
    goto LABEL_9;
  }
  v8 = 0;
LABEL_9:

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), v8);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
  {
    if (!v5)
      goto LABEL_16;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C97B20], "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("Keywords"), *(_QWORD *)(a1 + 56));
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v26 = *(void **)(v25 + 40);
    *(_QWORD *)(v25 + 40) = v24;

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "timeIntervalSinceReferenceDate");
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setCreationDate:");

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setKeyword:", *(_QWORD *)(a1 + 48));
  }
  if (*(_QWORD *)(a1 + 40))
  {
    v28 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
    if (v28)
    {
      objc_msgSend(v28, "objectID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v29, *(_QWORD *)(a1 + 48));

    }
  }
LABEL_16:

}

void __73___CDInteractionStore_fetchOrCreateAttachmentRecord_context_cache_error___block_invoke(uint64_t a1)
{
  void *v2;
  _BOOL4 v3;
  id v4;
  _BOOL4 v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
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
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  double v26;
  double v27;
  _BOOL4 v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
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
  id v45;
  id v46;
  uint8_t buf[4];
  uint64_t v48;
  __int16 v49;
  double v50;
  __int16 v51;
  _BOOL4 v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "begin");
  v2 = *(void **)(a1 + 40);
  v3 = v2 == 0;
  if (!v2)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C97B48]);
    objc_msgSend(MEMORY[0x1E0C97B20], "entityForName:inManagedObjectContext:", CFSTR("Attachment"), *(_QWORD *)(a1 + 56));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setEntity:", v11);

    v12 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(*(id *)(a1 + 48), "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "cloudIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "uti");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "personInPhoto");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "photoSceneDescriptor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "predicateWithFormat:", CFSTR("identifier == %@ AND cloudIdentifier == %@ AND uti == %@ AND personInPhoto == %@ AND photoSceneDescriptor == %@"), v13, v14, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPredicate:", v18);

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = *(void **)(a1 + 56);
    v45 = 0;
    objc_msgSend(v19, "executeFetchRequest:error:", v4, &v45);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v45;
    objc_msgSend(v20, "lastObject");
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v23 = *(void **)(v22 + 40);
    *(_QWORD *)(v22 + 40) = v21;

    +[_CDLogging instrumentationChannel](_CDLogging, "instrumentationChannel");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      v25 = objc_msgSend(v4, "fetchLimit");
      objc_msgSend(v10, "timeIntervalSinceNow");
      v27 = v26;
      v28 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) != 0;
      objc_msgSend(v4, "predicate");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218755;
      v48 = v25;
      v49 = 2048;
      v50 = -v27;
      v51 = 1024;
      v52 = v28;
      v53 = 2113;
      v54 = v29;
      _os_log_impl(&dword_18DDBE000, v24, OS_LOG_TYPE_INFO, "fetchOrCreateAttachmentRecord finished executeFetchRequest, fetchLimit %lu object(s), elapsed %f(sec), returned %i object(s), Predicate: %{private}@", buf, 0x26u);

    }
    goto LABEL_7;
  }
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = v4 == 0;
  if (v4)
  {
    v6 = *(void **)(a1 + 56);
    v46 = 0;
    objc_msgSend(v6, "existingObjectWithID:error:", v4, &v46);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v46;
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v7;
LABEL_7:

    v5 = v3;
    goto LABEL_9;
  }
  v8 = 0;
LABEL_9:

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), v8);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
  {
    if (!v5)
      goto LABEL_16;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C97B20], "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("Attachment"), *(_QWORD *)(a1 + 56));
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v32 = *(void **)(v31 + 40);
    *(_QWORD *)(v31 + 40) = v30;

    objc_msgSend(*(id *)(a1 + 48), "creationDate");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setCreationDate:", v33);

    objc_msgSend(*(id *)(a1 + 48), "identifier");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setIdentifier:", v34);

    objc_msgSend(*(id *)(a1 + 48), "photoLocalIdentifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setPhotoLocalIdentifier:", v35);

    objc_msgSend(*(id *)(a1 + 48), "cloudIdentifier");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setCloudIdentifier:", v36);

    objc_msgSend(*(id *)(a1 + 48), "size");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setSizeInBytes:", objc_msgSend(v37, "longLongValue"));

    objc_msgSend(*(id *)(a1 + 48), "uti");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setUti:", v38);

    objc_msgSend(*(id *)(a1 + 48), "contentText");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setContentText:", v39);

    objc_msgSend(*(id *)(a1 + 48), "contentURL");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setContentURL:", v40);

    objc_msgSend(*(id *)(a1 + 48), "personInPhoto");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setPersonInPhoto:", v41);

    objc_msgSend(*(id *)(a1 + 48), "photoSceneDescriptor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setPhotoSceneDescriptor:", v42);

  }
  if (*(_QWORD *)(a1 + 40))
  {
    v43 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
    if (v43)
    {
      objc_msgSend(v43, "objectID");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v44, *(_QWORD *)(a1 + 48));

    }
  }
LABEL_16:

}

void __70___CDInteractionStore_fetchOrCreateContactRecord_context_cache_error___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _BOOL4 v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
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
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  double v26;
  double v27;
  _BOOL4 v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
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
  void *v46;
  _BOOL4 v47;
  id v48;
  id v49;
  uint8_t buf[4];
  uint64_t v51;
  __int16 v52;
  double v53;
  __int16 v54;
  _BOOL4 v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "begin");
  v2 = *(void **)(a1 + 40);
  v47 = v2 == 0;
  if (!v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C97B48]);
    objc_msgSend(MEMORY[0x1E0C97B20], "entityForName:inManagedObjectContext:", CFSTR("Contacts"), *(_QWORD *)(a1 + 56));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setEntity:", v10);

    v11 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 48), "personIdType"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "personId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "displayName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "customIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 48), "displayType"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 48), "participantStatus"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "predicateWithFormat:", CFSTR("personIdType == %@ AND personId == %@ AND identifier == %@ AND displayName == %@ AND customIdentifier == %@ AND displayType == %@ AND participantStatus == %@"), v46, v12, v13, v14, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setPredicate:", v18);

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = *(void **)(a1 + 56);
    v48 = 0;
    objc_msgSend(v19, "executeFetchRequest:error:", v3, &v48);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v48;
    objc_msgSend(v20, "lastObject");
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v23 = *(void **)(v22 + 40);
    *(_QWORD *)(v22 + 40) = v21;

    +[_CDLogging instrumentationChannel](_CDLogging, "instrumentationChannel");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      v25 = objc_msgSend(v3, "fetchLimit");
      objc_msgSend(v9, "timeIntervalSinceNow");
      v27 = v26;
      v28 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) != 0;
      objc_msgSend(v3, "predicate");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218755;
      v51 = v25;
      v52 = 2048;
      v53 = -v27;
      v54 = 1024;
      v55 = v28;
      v56 = 2113;
      v57 = v29;
      _os_log_impl(&dword_18DDBE000, v24, OS_LOG_TYPE_INFO, "fetchOrCreateContactRecord finished executeFetchRequest, fetchLimit %lu object(s), elapsed %f(sec), returned %i object(s), Predicate: %{private}@", buf, 0x26u);

    }
    goto LABEL_7;
  }
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = v3 == 0;
  if (v3)
  {
    v5 = *(void **)(a1 + 56);
    v49 = 0;
    objc_msgSend(v5, "existingObjectWithID:error:", v3, &v49);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v49;
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v6;
LABEL_7:

    v4 = v47;
    goto LABEL_9;
  }
  v7 = 0;
LABEL_9:

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), v7);
  v30 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  if (v30)
  {
    buf[0] = 0;
    objc_msgSend(*(id *)(a1 + 64), "appendMissingInformationForRecord:fromContact:cacheUpdateRequired:", v30, *(_QWORD *)(a1 + 48), buf);
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v33 = *(void **)(v32 + 40);
    *(_QWORD *)(v32 + 40) = v31;

    if (buf[0])
      v4 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C97B20], "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("Contacts"), *(_QWORD *)(a1 + 56));
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v36 = *(void **)(v35 + 40);
    *(_QWORD *)(v35 + 40) = v34;

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "timeIntervalSinceReferenceDate");
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setCreationDate:");

    objc_msgSend(*(id *)(a1 + 48), "identifier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setIdentifier:", v38);

    objc_msgSend(*(id *)(a1 + 48), "customIdentifier");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setCustomIdentifier:", v39);

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setPersonIdType:", objc_msgSend(*(id *)(a1 + 48), "personIdType"));
    objc_msgSend(*(id *)(a1 + 48), "personId");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setPersonId:", v40);

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setType:", objc_msgSend(*(id *)(a1 + 48), "type"));
    objc_msgSend(*(id *)(a1 + 48), "displayName");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setDisplayName:", v41);

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setDisplayType:", objc_msgSend(*(id *)(a1 + 48), "displayType"));
    objc_msgSend(*(id *)(a1 + 48), "displayImageURL");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setDisplayImageURL:", v42);

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setParticipantStatus:", objc_msgSend(*(id *)(a1 + 48), "participantStatus"));
    v4 = 1;
  }
  v43 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "participantStatus");
  if (v43 != objc_msgSend(*(id *)(a1 + 48), "participantStatus"))
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setParticipantStatus:", objc_msgSend(*(id *)(a1 + 48), "participantStatus"));
  if (v4)
  {
    if (*(_QWORD *)(a1 + 40))
    {
      v44 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
      if (v44)
      {
        objc_msgSend(v44, "objectID");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v45, *(_QWORD *)(a1 + 48));

      }
    }
  }

}

void __70___CDInteractionStore_batchFetchExistingKeywordRecords_context_error___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  double v11;
  double v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  id v26;
  uint8_t v27[128];
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  double v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "begin");
  v2 = objc_alloc_init(MEMORY[0x1E0C97B48]);
  objc_msgSend(MEMORY[0x1E0C97B20], "entityForName:inManagedObjectContext:", CFSTR("Keywords"), *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEntity:", v3);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("keyword in %@"), *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v4);

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 40);
  v26 = 0;
  objc_msgSend(v6, "executeFetchRequest:error:", v2, &v26);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v26;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v8);
  +[_CDLogging instrumentationChannel](_CDLogging, "instrumentationChannel");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = objc_msgSend(v2, "fetchLimit");
    objc_msgSend(v5, "timeIntervalSinceNow");
    v12 = v11;
    v13 = objc_msgSend(v7, "count");
    objc_msgSend(v2, "predicate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218755;
    v29 = v10;
    v30 = 2048;
    v31 = -v12;
    v32 = 2048;
    v33 = v13;
    v34 = 2113;
    v35 = v14;
    _os_log_impl(&dword_18DDBE000, v9, OS_LOG_TYPE_INFO, "batchFetchExistingKeywordRecords finished executeFetchRequest, fetchLimit %lu object(s), elapsed %f(sec), returned %lu object(s), Predicate: %{private}@", buf, 0x2Au);

  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v15 = v7;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(v15);
        v19 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 56), "createKeywordFromRecord:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setObject:forKeyedSubscript:", v21, v20);

      }
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v16);
  }

}

void __73___CDInteractionStore_batchFetchExistingAttachmentRecords_context_error___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  double v11;
  double v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  id v27;
  uint8_t v28[128];
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  double v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "begin");
  v2 = objc_alloc_init(MEMORY[0x1E0C97B48]);
  objc_msgSend(MEMORY[0x1E0C97B20], "entityForName:inManagedObjectContext:", CFSTR("Attachment"), *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEntity:", v3);

  objc_msgSend(*(id *)(a1 + 48), "valueForKey:", CFSTR("identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("identifier in %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v5);

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 40);
  v27 = 0;
  objc_msgSend(v6, "executeFetchRequest:error:", v2, &v27);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v27;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v8);
  +[_CDLogging instrumentationChannel](_CDLogging, "instrumentationChannel");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = objc_msgSend(v2, "fetchLimit");
    objc_msgSend(v22, "timeIntervalSinceNow");
    v12 = v11;
    v13 = objc_msgSend(v7, "count");
    objc_msgSend(v2, "predicate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218755;
    v30 = v10;
    v31 = 2048;
    v32 = -v12;
    v33 = 2048;
    v34 = v13;
    v35 = 2113;
    v36 = v14;
    _os_log_impl(&dword_18DDBE000, v9, OS_LOG_TYPE_INFO, "batchFetchExistingAttachmentRecords finished executeFetchRequest, fetchLimit %lu object(s), elapsed %f(sec), returned %lu object(s), Predicate: %{private}@", buf, 0x2Au);

  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v15 = v7;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v24 != v17)
          objc_enumerationMutation(v15);
        v19 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 56), "createAttachmentFromRecord:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setObject:forKeyedSubscript:", v21, v20);

      }
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v16);
  }

}

void __70___CDInteractionStore_batchFetchExistingContactRecords_context_error___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  double v17;
  double v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t v40[128];
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  double v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  void *v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "begin");
  v2 = objc_alloc_init(MEMORY[0x1E0C97B48]);
  objc_msgSend(MEMORY[0x1E0C97B20], "entityForName:inManagedObjectContext:", CFSTR("Contacts"), *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEntity:", v3);

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v5 = *(id *)(a1 + 48);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v36, v49, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v37 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend(v9, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(v9, "identifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v11);

        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v36, v49, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("identifier in %@"), v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v12);

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *(void **)(a1 + 40);
  v35 = 0;
  objc_msgSend(v13, "executeFetchRequest:error:", v2, &v35);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v35;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v29);
  +[_CDLogging instrumentationChannel](_CDLogging, "instrumentationChannel");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = objc_msgSend(v2, "fetchLimit");
    objc_msgSend(v30, "timeIntervalSinceNow");
    v18 = v17;
    v19 = objc_msgSend(v14, "count");
    objc_msgSend(v2, "predicate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218755;
    v42 = v16;
    v43 = 2048;
    v44 = -v18;
    v45 = 2048;
    v46 = v19;
    v47 = 2113;
    v48 = v20;
    _os_log_impl(&dword_18DDBE000, v15, OS_LOG_TYPE_INFO, "batchFetchExistingContactRecords finished executeFetchRequest, fetchLimit %lu object(s), elapsed %f(sec), returned %lu object(s), Predicate: %{private}@", buf, 0x2Au);

  }
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v21 = v14;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
  if (v22)
  {
    v23 = *(_QWORD *)v32;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v32 != v23)
          objc_enumerationMutation(v21);
        v25 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * j);
        v26 = (void *)MEMORY[0x193FEE914]();
        objc_msgSend(*(id *)(a1 + 56), "getContactForRecord:", v25);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectID");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setObject:forKeyedSubscript:", v28, v27);

        objc_autoreleasePoolPop(v26);
      }
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
    }
    while (v22);
  }

}

void __77___CDInteractionStore_batchFetchExistingInteractionsWithUUIDs_context_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  double v9;
  double v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  id v31;
  uint8_t v32[128];
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  double v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "begin");
  v26 = objc_alloc_init(MEMORY[0x1E0C97B48]);
  objc_msgSend(MEMORY[0x1E0C97B20], "entityForName:inManagedObjectContext:", CFSTR("Interactions"), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setEntity:", v2);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("uuid in %@"), *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDInteractionStore predicateFilteringUsernameForPredicate:](_CDInteractionStore, "predicateFilteringUsernameForPredicate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setPredicate:", v4);

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 40);
  v31 = 0;
  objc_msgSend(v5, "executeFetchRequest:error:", v26, &v31);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v31;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v24);
  +[_CDLogging instrumentationChannel](_CDLogging, "instrumentationChannel");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = objc_msgSend(v26, "fetchLimit");
    objc_msgSend(v25, "timeIntervalSinceNow");
    v10 = v9;
    v11 = objc_msgSend(v6, "count");
    objc_msgSend(v26, "predicate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218755;
    v34 = v8;
    v35 = 2048;
    v36 = -v10;
    v37 = 2048;
    v38 = v11;
    v39 = 2113;
    v40 = v12;
    _os_log_impl(&dword_18DDBE000, v7, OS_LOG_TYPE_INFO, "batchFetchExistingInteractionsWithUUIDs finished executeFetchRequest, fetchLimit %lu object(s), elapsed %f(sec), returned %lu object(s), Predicate: %{private}@", buf, 0x2Au);

  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v13 = v6;
  v14 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  v15 = v13;
  if (!v14)
    goto LABEL_16;
  v16 = 0;
  v17 = *(_QWORD *)v28;
  do
  {
    for (i = 0; i != v14; ++i)
    {
      if (*(_QWORD *)v28 != v17)
        objc_enumerationMutation(v13);
      v19 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
      objc_msgSend(v19, "uuid");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        objc_msgSend(v19, "objectID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
        objc_msgSend(v19, "uuid");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setObject:forKeyedSubscript:", v21, v23);

      }
      else
      {
        v16 += objc_msgSend(v19, "isDeleted") ^ 1;
      }

    }
    v14 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  }
  while (v14);

  if (v16)
  {
    +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      __77___CDInteractionStore_batchFetchExistingInteractionsWithUUIDs_context_error___block_invoke_cold_1((_QWORD *)(a1 + 48), v16, v15);
LABEL_16:

  }
}

void __103___CDInteractionStore_createInteractionRecord_context_keywordCache_attachmentCache_contactCache_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  int8x16_t v42;
  int8x16_t v43;
  int8x16_t v44;
  uint64_t v45;
  uint64_t v46;
  id (*v47)(_QWORD *, uint64_t);
  void *v48;
  int8x16_t v49;
  id v50;
  uint64_t v51;
  _QWORD v52[4];
  int8x16_t v53;
  id v54;
  uint64_t v55;
  _QWORD v56[4];
  int8x16_t v57;
  id v58;
  id v59;
  uint64_t v60;
  id v61;

  objc_msgSend(MEMORY[0x1E0C97B20], "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("Interactions"), *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "setCreationDate:");

  objc_msgSend(*(id *)(a1 + 40), "fillWithoutRelationshipsInteractionRecord:fromInteraction:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), *(_QWORD *)(a1 + 48));
  v6 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "sender");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 56);
  v61 = 0;
  objc_msgSend(v6, "fetchOrCreateContactRecord:context:cache:error:", v7, v8, v9, &v61);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v61;
  v12 = v61;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "setSender:", v10);

  v13 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "sender");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "updateCachedStatsForContactRecord:isSender:withInteraction:", v14, 1, *(_QWORD *)(a1 + 48));

  if (v12)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), v11);
  v15 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
  v16 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_msgSend(*(id *)(a1 + 48), "recipients");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v56[0] = MEMORY[0x1E0C809B0];
  v56[1] = 3221225472;
  v56[2] = __103___CDInteractionStore_createInteractionRecord_context_keywordCache_attachmentCache_contactCache_error___block_invoke_2;
  v56[3] = &unk_1E26E4820;
  v42 = *(int8x16_t *)(a1 + 32);
  v19 = (id)v42.i64[0];
  v57 = vextq_s8(v42, v42, 8uLL);
  v58 = *(id *)(a1 + 56);
  v20 = *(id *)(a1 + 48);
  v21 = *(_QWORD *)(a1 + 88);
  v59 = v20;
  v60 = v21;
  objc_msgSend(v17, "_pas_mappedArrayWithTransform:", v56);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v16, "initWithArray:", v22);
  objc_msgSend(v15, "addRecipients:", v23);

  v24 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
  v25 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_msgSend(*(id *)(a1 + 48), "keywords");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = v18;
  v52[1] = 3221225472;
  v52[2] = __103___CDInteractionStore_createInteractionRecord_context_keywordCache_attachmentCache_contactCache_error___block_invoke_3;
  v52[3] = &unk_1E26E4848;
  v43 = *(int8x16_t *)(a1 + 32);
  v27 = (id)v43.i64[0];
  v53 = vextq_s8(v43, v43, 8uLL);
  v28 = *(id *)(a1 + 64);
  v29 = *(_QWORD *)(a1 + 88);
  v54 = v28;
  v55 = v29;
  objc_msgSend(v26, "_pas_mappedArrayWithTransform:", v52);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend(v25, "initWithArray:", v30);
  objc_msgSend(v24, "addKeywords:", v31);

  v32 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
  v33 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_msgSend(*(id *)(a1 + 48), "attachments");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v18;
  v46 = 3221225472;
  v47 = __103___CDInteractionStore_createInteractionRecord_context_keywordCache_attachmentCache_contactCache_error___block_invoke_4;
  v48 = &unk_1E26E4870;
  v44 = *(int8x16_t *)(a1 + 32);
  v35 = (id)v44.i64[0];
  v49 = vextq_s8(v44, v44, 8uLL);
  v36 = *(id *)(a1 + 72);
  v37 = *(_QWORD *)(a1 + 88);
  v50 = v36;
  v51 = v37;
  objc_msgSend(v34, "_pas_mappedArrayWithTransform:", &v45);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)objc_msgSend(v33, "initWithArray:", v38);
  objc_msgSend(v32, "addAttachments:", v39);

  objc_msgSend(*(id *)(a1 + 48), "nsUserName");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (v40)
    objc_msgSend(*(id *)(a1 + 48), "nsUserName");
  else
    NSUserName();
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "setNsUserName:", v41, *(_OWORD *)&v44, v45, v46, v47, v48, v49.i64[0]);

}

id __103___CDInteractionStore_createInteractionRecord_context_keywordCache_attachmentCache_contactCache_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  id v10;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v10 = 0;
  objc_msgSend(v3, "fetchOrCreateContactRecord:context:cache:error:", a2, v4, v5, &v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v10;
  v8 = v10;
  objc_msgSend(*(id *)(a1 + 32), "updateCachedStatsForContactRecord:isSender:withInteraction:", v6, 0, *(_QWORD *)(a1 + 56));
  if (v8)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v7);

  return v6;
}

id __103___CDInteractionStore_createInteractionRecord_context_keywordCache_attachmentCache_contactCache_error___block_invoke_3(_QWORD *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  id v10;

  v3 = (void *)a1[4];
  v4 = a1[5];
  v5 = a1[6];
  v10 = 0;
  objc_msgSend(v3, "fetchOrCreateKeywordRecord:context:cache:error:", a2, v4, v5, &v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v10;
  v8 = v10;
  if (v8)
    objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), v7);

  return v6;
}

id __103___CDInteractionStore_createInteractionRecord_context_keywordCache_attachmentCache_contactCache_error___block_invoke_4(_QWORD *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  id v10;

  v3 = (void *)a1[4];
  v4 = a1[5];
  v5 = a1[6];
  v10 = 0;
  objc_msgSend(v3, "fetchOrCreateAttachmentRecord:context:cache:error:", a2, v4, v5, &v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v10;
  v8 = v10;
  if (v8)
    objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), v7);

  return v6;
}

void __60___CDInteractionStore_recordInteractions_completionHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  id v7;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v7 = 0;
  v4 = objc_msgSend(v2, "recordInteractionsBatch:error:", v3, &v7);
  v5 = v7;
  v6 = a1[6];
  if (v6)
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, v4, v5);

}

void __53___CDInteractionStore_recordInteractionsBatch_error___block_invoke(id *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id *v12;
  id *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  id v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t k;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  double v55;
  double v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  NSObject *v65;
  void *v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  uint64_t m;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  double v78;
  double v79;
  NSObject *v81;
  id *v82;
  void *v83;
  id obj;
  uint64_t v85;
  uint64_t v86;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  _BYTE v108[128];
  _BYTE v109[128];
  _BYTE v110[128];
  uint8_t v111[128];
  uint8_t buf[4];
  void *v113;
  uint64_t v114;

  v114 = *MEMORY[0x1E0C80C00];
  v96 = 0u;
  v97 = 0u;
  v98 = 0u;
  v99 = 0u;
  v1 = a1[4];
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v96, v110, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v97;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v97 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * i);
        if (objc_msgSend(v6, "mechanism") == 13 && (objc_msgSend(v6, "forcePersistInteraction") & 1) == 0)
        {
          objc_msgSend(v6, "targetBundleId");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = (void *)MEMORY[0x1E0C99E60];
          +[_CDConstants shareSheetTargetBundleIdMessages]();
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setWithObjects:", v9, 0);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (v7 && objc_msgSend(v10, "containsObject:", v7))
          {
            objc_msgSend(a1[5], "removeObject:", v6);
            if (*((_QWORD *)a1[6] + 6)
              && ((_os_feature_enabled_impl() & 1) != 0 || _os_feature_enabled_impl()))
            {
              objc_msgSend(v6, "fetchAndAddShareSheetContentToInteractionWithKnowledgeStore:", *((_QWORD *)a1[6] + 6));
            }
            objc_msgSend(a1[6], "setPendingShareSheetInteraction:", v6);
            +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
            v11 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v113 = v7;
              _os_log_debug_impl(&dword_18DDBE000, v11, OS_LOG_TYPE_DEBUG, "Storing pending interaction for %@", buf, 0xCu);
            }

          }
        }
      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v96, v110, 16);
    }
    while (v3);
  }

  v12 = a1;
  v13 = a1 + 6;
  objc_msgSend(a1[6], "pendingShareSheetInteraction");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v82 = a1 + 6;
  if (!v14)
    goto LABEL_74;
  v94 = 0u;
  v95 = 0u;
  v92 = 0u;
  v93 = 0u;
  obj = (id)objc_msgSend(a1[5], "copy");
  v86 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v92, v109, 16);
  if (!v86)
    goto LABEL_73;
  v85 = *(_QWORD *)v93;
  while (2)
  {
    v15 = 0;
    do
    {
      if (*(_QWORD *)v93 != v85)
        objc_enumerationMutation(obj);
      v16 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * v15);
      objc_msgSend(*v13, "pendingShareSheetInteraction");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      v18 = v16;
      if (objc_msgSend(v18, "direction") != 1)
        goto LABEL_63;
      objc_msgSend(v17, "targetBundleId");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[_CDConstants shareSheetTargetBundleIdMessages]();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v19, "isEqualToString:", v20) & 1) != 0)
      {
        objc_msgSend(v18, "bundleId");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        +[_CDConstants mobileMessagesBundleId]();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v21, "isEqualToString:", v22);

        if (v23)
        {
          objc_msgSend(v17, "domainIdentifier");
          v24 = objc_claimAutoreleasedReturnValue();
          if (!v24)
            goto LABEL_63;
          v25 = (void *)v24;
          objc_msgSend(v18, "domainIdentifier");
          v26 = objc_claimAutoreleasedReturnValue();
          if (!v26)
            goto LABEL_62;
          v27 = (void *)v26;
          objc_msgSend(v17, "domainIdentifier");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "domainIdentifier");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v28, "isEqualToString:", v29);

          if ((v30 & 1) != 0)
            goto LABEL_70;
          goto LABEL_65;
        }
      }
      else
      {

      }
      objc_msgSend(v17, "targetBundleId");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      +[_CDConstants shareSheetTargetBundleIdMail]();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v25, "isEqualToString:", v31) & 1) == 0)
      {

LABEL_62:
LABEL_63:

LABEL_64:
        goto LABEL_65;
      }
      objc_msgSend(v18, "bundleId");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      +[_CDConstants mobileMailBundleId]();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v32, "isEqualToString:", v33);

      if (!v34)
        goto LABEL_63;
      v83 = v18;
      v35 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v104 = 0u;
      v105 = 0u;
      v106 = 0u;
      v107 = 0u;
      objc_msgSend(v17, "recipients");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v104, buf, 16);
      if (v37)
      {
        v38 = v37;
        v39 = *(_QWORD *)v105;
        do
        {
          for (j = 0; j != v38; ++j)
          {
            if (*(_QWORD *)v105 != v39)
              objc_enumerationMutation(v36);
            v41 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * j);
            if (objc_msgSend(v41, "type") == 2)
            {
              objc_msgSend(v41, "handle");
              v42 = (void *)objc_claimAutoreleasedReturnValue();

              if (v42)
              {
                objc_msgSend(v41, "handle");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "addObject:", v43);

              }
            }
          }
          v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v104, buf, 16);
        }
        while (v38);
      }

      v44 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v100 = 0u;
      v101 = 0u;
      v102 = 0u;
      v103 = 0u;
      objc_msgSend(v83, "recipients");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v100, v111, 16);
      if (v46)
      {
        v47 = v46;
        v48 = *(_QWORD *)v101;
        do
        {
          for (k = 0; k != v47; ++k)
          {
            if (*(_QWORD *)v101 != v48)
              objc_enumerationMutation(v45);
            v50 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * k);
            if (objc_msgSend(v50, "type") == 2)
            {
              objc_msgSend(v50, "handle");
              v51 = (void *)objc_claimAutoreleasedReturnValue();

              if (v51)
              {
                objc_msgSend(v50, "handle");
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v44, "addObject:", v52);

              }
            }
          }
          v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v100, v111, 16);
        }
        while (v47);
      }

      if (!objc_msgSend(v35, "isEqualToSet:", v44))
      {

        v13 = a1 + 6;
        goto LABEL_64;
      }
      objc_msgSend(v17, "startDate");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "startDate");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "timeIntervalSinceDate:", v54);
      v56 = v55;

      v18 = v83;
      if (v56 < 0.0)
        v56 = -v56;

      v13 = a1 + 6;
      if (v56 < 10.0)
      {
LABEL_70:
        objc_msgSend(v18, "setMechanism:", 13);
        objc_msgSend(*v13, "pendingShareSheetInteraction");
        v58 = v18;
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "bundleId");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "setBundleId:", v60);

        objc_msgSend(*v13, "pendingShareSheetInteraction");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "targetBundleId");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "setTargetBundleId:", v62);

        objc_msgSend(*v13, "pendingShareSheetInteraction");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "attachments");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "setAttachments:", v64);

        +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
        v65 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
          __53___CDInteractionStore_recordInteractionsBatch_error___block_invoke_cold_2(v58, v65);

        objc_msgSend(*v13, "setPendingShareSheetInteraction:", 0);
        goto LABEL_73;
      }
LABEL_65:
      ++v15;
    }
    while (v15 != v86);
    v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v92, v109, 16);
    v86 = v57;
    if (v57)
      continue;
    break;
  }
LABEL_73:

  v12 = a1;
LABEL_74:
  if (objc_msgSend(v12[5], "count"))
  {
    objc_msgSend(*v13, "pendingShareSheetInteraction");
    v66 = (void *)objc_claimAutoreleasedReturnValue();

    if (v66)
    {
      v90 = 0u;
      v91 = 0u;
      v88 = 0u;
      v89 = 0u;
      v67 = v12[5];
      v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v88, v108, 16);
      if (v68)
      {
        v69 = v68;
        v70 = 0;
        v71 = *(_QWORD *)v89;
        do
        {
          for (m = 0; m != v69; ++m)
          {
            if (*(_QWORD *)v89 != v71)
              objc_enumerationMutation(v67);
            objc_msgSend(*(id *)(*((_QWORD *)&v88 + 1) + 8 * m), "startDate");
            v73 = objc_claimAutoreleasedReturnValue();
            v74 = (void *)v73;
            if (v70)
            {
              objc_msgSend(v70, "laterDate:", v73);
              v75 = objc_claimAutoreleasedReturnValue();

              v70 = (void *)v75;
            }
            else
            {
              v70 = (void *)v73;
            }
          }
          v69 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v88, v108, 16);
        }
        while (v69);
      }
      else
      {
        v70 = 0;
      }

      objc_msgSend(*v82, "pendingShareSheetInteraction");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "startDate");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "timeIntervalSinceDate:", v77);
      v79 = v78;

      if (v79 < 0.0 || v79 > 60.0)
      {
        +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
        v81 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
          __53___CDInteractionStore_recordInteractionsBatch_error___block_invoke_cold_1(v82, v81);

        objc_msgSend(*v82, "setPendingShareSheetInteraction:", 0);
      }

    }
  }
}

uint64_t __53___CDInteractionStore_recordInteractionsBatch_error___block_invoke_173(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

void __53___CDInteractionStore_recordInteractionsBatch_error___block_invoke_198(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
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
  uint64_t v21;
  id v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  void *v40;
  id v41;
  uint64_t v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  _BOOL4 v47;
  void *v48;
  void *v49;
  _BOOL4 v50;
  void *v51;
  char v52;
  id v53;
  NSObject *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  _BOOL4 v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  id v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  void *v78;
  id obj;
  NSObject *v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  id v85;
  id v86;
  id v87;
  uint8_t v88;
  char v89[15];
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  id v94;
  id v95;
  id v96;
  id v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  uint8_t buf[4];
  void *v103;
  _BYTE v104[128];
  _BYTE v105[128];
  uint64_t v106;

  v106 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "begin");
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = 0u;
  v101 = 0u;
  v98 = 0u;
  v99 = 0u;
  v4 = *(id *)(a1 + 40);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v98, v105, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v99;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v99 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * i);
        v9 = (void *)MEMORY[0x193FEE914]();
        objc_msgSend(v8, "recipients");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(v8, "recipients");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v1, "addObjectsFromArray:", v11);

        }
        objc_msgSend(v8, "sender");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v8, "sender");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v1, "addObject:", v13);

        }
        objc_msgSend(v8, "keywords");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend(v8, "keywords");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v84, "addObjectsFromArray:", v15);

        }
        objc_msgSend(v8, "attachments");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          objc_msgSend(v8, "attachments");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "addObjectsFromArray:", v17);

        }
        objc_msgSend(v8, "uuid");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          objc_msgSend(v8, "uuid");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v19);

        }
        objc_autoreleasePoolPop(v9);
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v98, v105, 16);
    }
    while (v5);
  }

  v20 = *(void **)(a1 + 48);
  v21 = *(_QWORD *)(a1 + 56);
  v97 = 0;
  objc_msgSend(v20, "batchFetchExistingContactRecords:context:error:", v1, v21, &v97);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v97;
  if (v22)
  {
    v23 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v24 = v22;
    v25 = *(void **)(v23 + 40);
    *(_QWORD *)(v23 + 40) = v24;
    goto LABEL_69;
  }
  v26 = *(void **)(a1 + 48);
  v27 = *(_QWORD *)(a1 + 56);
  v96 = 0;
  objc_msgSend(v26, "batchFetchExistingKeywordRecords:context:error:", v84, v27, &v96);
  v76 = objc_claimAutoreleasedReturnValue();
  v28 = v96;
  if (v28)
  {
    v29 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v24 = v28;
    v30 = *(void **)(v29 + 40);
    *(_QWORD *)(v29 + 40) = v24;
    goto LABEL_68;
  }
  v31 = *(void **)(a1 + 48);
  v32 = *(_QWORD *)(a1 + 56);
  v95 = 0;
  objc_msgSend(v31, "batchFetchExistingAttachmentRecords:context:error:", v2, v32, &v95);
  v75 = objc_claimAutoreleasedReturnValue();
  v33 = v95;
  if (v33)
  {
    v34 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v24 = v33;
    v35 = *(void **)(v34 + 40);
    *(_QWORD *)(v34 + 40) = v24;
    goto LABEL_67;
  }
  v36 = *(void **)(a1 + 48);
  v37 = *(_QWORD *)(a1 + 56);
  v94 = 0;
  objc_msgSend(v36, "batchFetchExistingInteractionsWithUUIDs:context:error:", v3, v37, &v94);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v94;
  if (v38)
  {
    v39 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v24 = v38;
    v40 = *(void **)(v39 + 40);
    *(_QWORD *)(v39 + 40) = v24;
    goto LABEL_66;
  }
  v41 = *(id *)(a1 + 40);
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  obj = v41;
  v83 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v104, 16);
  if (!v83)
  {
    v81 = 0;
    v24 = 0;
    goto LABEL_61;
  }
  v24 = 0;
  v81 = 0;
  v82 = *(_QWORD *)v91;
  do
  {
    v42 = 0;
    do
    {
      if (*(_QWORD *)v91 != v82)
        objc_enumerationMutation(obj);
      v43 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * v42);
      v44 = (void *)MEMORY[0x193FEE914]();
      if (objc_msgSend(v43, "isValidInteraction"))
      {
        objc_msgSend(v43, "domainIdentifier");
        v45 = objc_claimAutoreleasedReturnValue();
        if (v45)
          goto LABEL_34;
        objc_msgSend(v43, "derivedIntentIdentifier");
        v45 = objc_claimAutoreleasedReturnValue();
        if (v45)
          goto LABEL_34;
        objc_msgSend(v43, "recipients");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = v66 == 0;

        if (v67)
        {
          +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
          {
            objc_msgSend(v43, "targetBundleId");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            v69 = v68;
            if (!v68)
            {
              objc_msgSend(v43, "bundleId");
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              v69 = v74;
            }
            *(_DWORD *)buf = 138412290;
            v103 = v69;
            _os_log_fault_impl(&dword_18DDBE000, v45, OS_LOG_TYPE_FAULT, "Interaction from %@ does not have recipients, domain or derived intent identifier set. Suggestions for this intent will be suppressed as no recipient, domain, or derived intent identifier exists", buf, 0xCu);
            if (!v68)

          }
LABEL_34:

        }
        objc_msgSend(v43, "uuid");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = v46 == 0;

        if (v47)
        {
          +[_CDLogging instrumentationChannel](_CDLogging, "instrumentationChannel");
          v54 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
            __53___CDInteractionStore_recordInteractionsBatch_error___block_invoke_198_cold_2(&v88, v89, v54);
        }
        else
        {
          objc_msgSend(v43, "uuid");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "objectForKeyedSubscript:", v48);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = v49 == 0;

          if (v50)
          {
            v55 = *(void **)(a1 + 48);
            v56 = *(_QWORD *)(a1 + 56);
            v87 = v24;
            objc_msgSend(v55, "createInteractionRecord:context:keywordCache:attachmentCache:contactCache:error:", v43, v56, v76, v75, v77, &v87);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            v58 = v87;
            v53 = v87;

            if (v53)
              objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v58);
          }
          else
          {
            objc_msgSend(v43, "updateDate");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = -[NSObject isEqualToDate:](v81, "isEqualToDate:", v51);

            if ((v52 & 1) != 0)
            {
              v53 = v24;
              goto LABEL_47;
            }
            v59 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
            objc_msgSend(v43, "uuid");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "addObject:", v60);

            v61 = *(void **)(a1 + 48);
            v62 = *(_QWORD *)(a1 + 56);
            v86 = v24;
            objc_msgSend(v61, "createInteractionRecord:context:keywordCache:attachmentCache:contactCache:error:", v43, v62, v76, v75, v77, &v86);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            v63 = v86;
            v53 = v86;

            if (v53)
              objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v63);
          }
          objc_msgSend(v57, "objectID");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "uuid");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "setObject:forKeyedSubscript:", v64, v65);

LABEL_47:
          objc_msgSend(v43, "updateDate");
          v54 = v81;
          v81 = objc_claimAutoreleasedReturnValue();
          v24 = v53;
        }

      }
      objc_autoreleasePoolPop(v44);
      ++v42;
    }
    while (v83 != v42);
    v70 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v104, 16);
    v83 = v70;
  }
  while (v70);
LABEL_61:

  v71 = (void *)MEMORY[0x193FEE914]();
  if (objc_msgSend(*(id *)(a1 + 56), "hasChanges"))
  {
    v72 = *(void **)(a1 + 56);
    v85 = v24;
    objc_msgSend(v72, "save:", &v85);
    v73 = v85;

    v24 = v73;
  }
  objc_msgSend(*(id *)(a1 + 56), "reset");
  if (v24)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v24);
  objc_autoreleasePoolPop(v71);

  v40 = obj;
LABEL_66:

  v35 = v78;
LABEL_67:

  v30 = (void *)v75;
LABEL_68:

  v25 = (void *)v76;
LABEL_69:

}

uint64_t __48___CDInteractionStore_predicateForInteractions___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uuid");
}

void __73___CDInteractionStore_countInteractionsUsingPredicate_completionHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v5 = 0;
  objc_msgSend(v2, "countInteractionsUsingPredicate:error:", v3, &v5);
  v4 = v5;
  (*(void (**)(void))(a1[6] + 16))();

}

void __69___CDInteractionStore_countContactsUsingPredicate_completionHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v5 = 0;
  objc_msgSend(v2, "countContactsUsingPredicate:error:", v3, &v5);
  v4 = v5;
  (*(void (**)(void))(a1[6] + 16))();

}

void __95___CDInteractionStore_queryInteractionsUsingPredicate_sortDescriptors_limit_completionHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = a1[6];
  v5 = a1[8];
  v8 = 0;
  objc_msgSend(v2, "queryInteractionsUsingPredicate:sortDescriptors:limit:error:", v3, v4, v5, &v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v8;
  (*(void (**)(void))(a1[7] + 16))();

}

void __79___CDInteractionStore_queryContactsUsingPredicate_sortDescriptors_limit_error___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  id v26;
  uint8_t v27[128];
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  double v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "begin");
  v2 = objc_alloc_init(MEMORY[0x1E0C97B48]);
  objc_msgSend(MEMORY[0x1E0C97B20], "entityForName:inManagedObjectContext:", CFSTR("Contacts"), *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEntity:", v3);

  if (*(_QWORD *)(a1 + 48))
    objc_msgSend(v2, "setPredicate:");
  if (*(_QWORD *)(a1 + 56))
    objc_msgSend(v2, "setSortDescriptors:");
  objc_msgSend(v2, "setFetchLimit:", *(_QWORD *)(a1 + 88));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 40);
  v26 = 0;
  objc_msgSend(v5, "executeFetchRequest:error:", v2, &v26);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = v26;
  v8 = v26;
  if (v8)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), v7);

  +[_CDLogging instrumentationChannel](_CDLogging, "instrumentationChannel");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = objc_msgSend(v2, "fetchLimit");
    objc_msgSend(v4, "timeIntervalSinceNow");
    v12 = v11;
    v13 = objc_msgSend(v6, "count");
    v14 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 134218755;
    v29 = v10;
    v30 = 2048;
    v31 = -v12;
    v32 = 2048;
    v33 = v13;
    v34 = 2113;
    v35 = v14;
    _os_log_impl(&dword_18DDBE000, v9, OS_LOG_TYPE_INFO, "queryContactsUsingPredicate finished executeFetchRequest, fetchLimit %lu object(s), elapsed %f(sec), returned %lu object(s), Predicate: %{private}@", buf, 0x2Au);
  }

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v6 = v6;
    v16 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v23;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v23 != v17)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(a1 + 64), "getContactForRecord:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v18), (_QWORD)v22);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v19);

          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v16);
    }

    v20 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v21 = *(void **)(v20 + 40);
    *(_QWORD *)(v20 + 40) = v15;

  }
}

void __91___CDInteractionStore_queryContactsUsingPredicate_sortDescriptors_limit_completionHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = a1[6];
  v5 = a1[8];
  v8 = 0;
  objc_msgSend(v2, "queryContactsUsingPredicate:sortDescriptors:limit:error:", v3, v4, v5, &v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v8;
  (*(void (**)(void))(a1[7] + 16))();

}

void __72___CDInteractionStore_queryContactInteractionsUsingPredicate_withLimit___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  double v8;
  double v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  id obj;
  uint64_t v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  id v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint8_t v54[128];
  uint8_t buf[4];
  uint64_t v56;
  __int16 v57;
  double v58;
  __int16 v59;
  uint64_t v60;
  __int16 v61;
  void *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "begin");
  v35 = objc_alloc_init(MEMORY[0x1E0C97B48]);
  objc_msgSend(MEMORY[0x1E0C97B20], "entityForName:inManagedObjectContext:", CFSTR("Contacts"), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setEntity:", v2);

  objc_msgSend(v35, "setPredicate:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v35, "setFetchLimit:", *(_QWORD *)(a1 + 72));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);
  v51 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v35, &v51);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v51;
  +[_CDLogging instrumentationChannel](_CDLogging, "instrumentationChannel");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = objc_msgSend(v35, "fetchLimit");
    objc_msgSend(v34, "timeIntervalSinceNow");
    v9 = v8;
    v10 = objc_msgSend(v4, "count");
    objc_msgSend(v35, "predicate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218755;
    v56 = v7;
    v57 = 2048;
    v58 = -v9;
    v59 = 2048;
    v60 = v10;
    v61 = 2113;
    v62 = v11;
    _os_log_impl(&dword_18DDBE000, v6, OS_LOG_TYPE_INFO, "queryContactInteractionsUsingPredicate finished executeFetchRequest, fetchLimit %lu object(s), elapsed %f(sec), returned %lu object(s), Predicate: %{private}@", buf, 0x2Au);

  }
  if (v5)
  {
    +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __72___CDInteractionStore_queryContactInteractionsUsingPredicate_withLimit___block_invoke_cold_1();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    obj = v4;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
    if (v13)
    {
      v37 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v48 != v37)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
          objc_msgSend(v15, "interactionRecipient");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "count");
          objc_msgSend(v15, "interactionSender");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "count");

          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v19 + v17);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = 0u;
          v46 = 0u;
          v43 = 0u;
          v44 = 0u;
          objc_msgSend(v15, "interactionRecipient");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
          if (v22)
          {
            v23 = *(_QWORD *)v44;
            do
            {
              for (j = 0; j != v22; ++j)
              {
                if (*(_QWORD *)v44 != v23)
                  objc_enumerationMutation(v21);
                objc_msgSend(*(id *)(a1 + 56), "createInteractionFromRecord:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * j));
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "addObject:", v25);

              }
              v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
            }
            while (v22);
          }

          v41 = 0u;
          v42 = 0u;
          v39 = 0u;
          v40 = 0u;
          objc_msgSend(v15, "interactionSender");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v39, v52, 16);
          if (v27)
          {
            v28 = *(_QWORD *)v40;
            do
            {
              for (k = 0; k != v27; ++k)
              {
                if (*(_QWORD *)v40 != v28)
                  objc_enumerationMutation(v26);
                objc_msgSend(*(id *)(a1 + 56), "createInteractionFromRecord:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * k));
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "addObject:", v30);

              }
              v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v39, v52, 16);
            }
            while (v27);
          }

          objc_msgSend(*(id *)(a1 + 56), "getContactForRecord:", v15);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "setObject:forKeyedSubscript:", v20, v31);

        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
      }
      while (v13);
    }

    v32 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v33 = *(void **)(v32 + 40);
    *(_QWORD *)(v32 + 40) = v38;

  }
}

void __76___CDInteractionStore_histogramContactInteractionsUsingPredicate_withLimit___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  double v8;
  double v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  id v33;
  uint8_t v34[128];
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  double v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "begin");
  v27 = objc_alloc_init(MEMORY[0x1E0C97B48]);
  objc_msgSend(MEMORY[0x1E0C97B20], "entityForName:inManagedObjectContext:", CFSTR("Contacts"), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setEntity:", v2);

  objc_msgSend(v27, "setPredicate:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v27, "setFetchLimit:", *(_QWORD *)(a1 + 72));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);
  v33 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v27, &v33);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v33;
  +[_CDLogging instrumentationChannel](_CDLogging, "instrumentationChannel");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = objc_msgSend(v27, "fetchLimit");
    objc_msgSend(v26, "timeIntervalSinceNow");
    v9 = v8;
    v10 = objc_msgSend(v4, "count");
    objc_msgSend(v27, "predicate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218755;
    v36 = v7;
    v37 = 2048;
    v38 = -v9;
    v39 = 2048;
    v40 = v10;
    v41 = 2113;
    v42 = v11;
    _os_log_impl(&dword_18DDBE000, v6, OS_LOG_TYPE_INFO, "histogramContactInteractionsUsingPredicate finished executeFetchRequest, fetchLimit %lu object(s), elapsed %f(sec), returned %lu object(s), Predicate: %{private}@", buf, 0x2Au);

  }
  if (v5)
  {
    +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __72___CDInteractionStore_queryContactInteractionsUsingPredicate_withLimit___block_invoke_cold_1();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    obj = v4;
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v30 != v17)
            objc_enumerationMutation(obj);
          v19 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          v20 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v19, "interactionRecipient");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "count");
          objc_msgSend(v19, "interactionSender");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "numberWithUnsignedInteger:", objc_msgSend(v23, "count") + v22);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(a1 + 56), "getContactForRecord:", v19);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setObject:forKeyedSubscript:", v24, v25);

        }
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v16);
    }

  }
}

void __44___CDInteractionStore_usersWithInteractions__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  double v10;
  double v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  id v26;
  uint8_t v27[128];
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  double v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "begin");
  v2 = objc_alloc_init(MEMORY[0x1E0C97B48]);
  objc_msgSend(MEMORY[0x1E0C97B20], "entityForName:inManagedObjectContext:", CFSTR("Interactions"), *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEntity:", v3);

  objc_msgSend(v2, "setPropertiesToFetch:", &unk_1E272BCF8);
  objc_msgSend(v2, "setReturnsDistinctResults:", 1);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 40);
  v26 = 0;
  objc_msgSend(v5, "executeFetchRequest:error:", v2, &v26);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v26;
  +[_CDLogging instrumentationChannel](_CDLogging, "instrumentationChannel");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = objc_msgSend(v2, "fetchLimit");
    objc_msgSend(v4, "timeIntervalSinceNow");
    v11 = v10;
    v12 = objc_msgSend(v6, "count");
    *(_DWORD *)buf = 134218496;
    v29 = v9;
    v30 = 2048;
    v31 = -v11;
    v32 = 2048;
    v33 = v12;
    _os_log_impl(&dword_18DDBE000, v8, OS_LOG_TYPE_INFO, "usersWithInteractions: finished executeFetchRequest, fetchLimit %lu object(s), elapsed %f(sec), returned %lu object(s)", buf, 0x20u);
  }

  if (v7)
  {
    +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __44___CDInteractionStore_usersWithInteractions__block_invoke_cold_1();

  }
  else
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v14 = v6;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v23 != v16)
            objc_enumerationMutation(v14);
          v18 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v18, "nsUserName", (_QWORD)v22);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
          {
            v20 = *(void **)(a1 + 48);
            objc_msgSend(v18, "nsUserName");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "addObject:", v21);

          }
        }
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v15);
    }

  }
}

void __52___CDInteractionStore_conversationsWithInteractions__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  double v11;
  double v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  id v25;
  uint8_t v26[128];
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  double v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "begin");
  v2 = objc_alloc_init(MEMORY[0x1E0C97B48]);
  objc_msgSend(MEMORY[0x1E0C97B20], "entityForName:inManagedObjectContext:", CFSTR("Interactions"), *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEntity:", v3);

  objc_autoreleasePoolPop((void *)MEMORY[0x193FEE914]());
  objc_msgSend(v2, "setPropertiesToFetch:", &unk_1E272BD10);
  objc_msgSend(v2, "setReturnsDistinctResults:", 1);
  +[_CDInteractionStore predicateFilteringUsernameForPredicate:](_CDInteractionStore, "predicateFilteringUsernameForPredicate:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v4);

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 40);
  v25 = 0;
  objc_msgSend(v6, "executeFetchRequest:error:", v2, &v25);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v25;
  +[_CDLogging instrumentationChannel](_CDLogging, "instrumentationChannel");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = objc_msgSend(v2, "fetchLimit");
    objc_msgSend(v5, "timeIntervalSinceNow");
    v12 = v11;
    v13 = objc_msgSend(v7, "count");
    *(_DWORD *)buf = 134218496;
    v28 = v10;
    v29 = 2048;
    v30 = -v12;
    v31 = 2048;
    v32 = v13;
    _os_log_impl(&dword_18DDBE000, v9, OS_LOG_TYPE_INFO, "conversationsWithInteractions: finished executeFetchRequest, fetchLimit %lu object(s), elapsed %f(sec), returned %lu object(s)", buf, 0x20u);
  }

  if (v8)
  {
    +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      __52___CDInteractionStore_conversationsWithInteractions__block_invoke_cold_1();

  }
  else
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v15 = v7;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v22 != v17)
            objc_enumerationMutation(v15);
          v19 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v19, "domainIdentifier", (_QWORD)v21);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v20)
          {
            objc_msgSend(v19, "derivedIntentIdentifier");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v20)
              continue;
          }
          objc_msgSend(*(id *)(a1 + 48), "addObject:", v20);

        }
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v16);
    }

  }
}

void __67___CDInteractionStore_kMostRecentConversationsWithLimit_predicate___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  double v14;
  double v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  id v29;
  uint8_t v30[128];
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  double v34;
  __int16 v35;
  uint64_t v36;
  _QWORD v37[4];

  v37[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "begin");
  v2 = objc_alloc_init(MEMORY[0x1E0C97B48]);
  objc_msgSend(MEMORY[0x1E0C97B20], "entityForName:inManagedObjectContext:", CFSTR("Interactions"), *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEntity:", v3);

  objc_autoreleasePoolPop((void *)MEMORY[0x193FEE914]());
  objc_msgSend(v2, "setPropertiesToFetch:", &unk_1E272BD28);
  objc_msgSend(v2, "setReturnsDistinctResults:", 1);
  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("startDate"), 0);
  v5 = (void *)MEMORY[0x193FEE914]();
  v24 = (void *)v4;
  v37[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v2, "setSortDescriptors:", v6);
  +[_CDInteractionStore predicateFilteringUsernameForPredicate:](_CDInteractionStore, "predicateFilteringUsernameForPredicate:", *(_QWORD *)(a1 + 48));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v7);

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(void **)(a1 + 40);
  v29 = 0;
  objc_msgSend(v9, "executeFetchRequest:error:", v2, &v29);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v29;
  +[_CDLogging instrumentationChannel](_CDLogging, "instrumentationChannel");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = objc_msgSend(v2, "fetchLimit");
    objc_msgSend(v8, "timeIntervalSinceNow");
    v15 = v14;
    v16 = objc_msgSend(v10, "count");
    *(_DWORD *)buf = 134218496;
    v32 = v13;
    v33 = 2048;
    v34 = -v15;
    v35 = 2048;
    v36 = v16;
    _os_log_impl(&dword_18DDBE000, v12, OS_LOG_TYPE_INFO, "kMostRecentConversationsWithLimit: finished executeFetchRequest, fetchLimit %lu object(s), elapsed %f(sec), returned %lu object(s)", buf, 0x20u);
  }

  if (v11)
  {
    +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      __52___CDInteractionStore_conversationsWithInteractions__block_invoke_cold_1();

  }
  else
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v18 = v10;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v26;
      while (2)
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v26 != v20)
            objc_enumerationMutation(v18);
          v22 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(v22, "domainIdentifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v23)
          {
            objc_msgSend(v22, "derivedIntentIdentifier");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v23)
              continue;
          }
          if ((unint64_t)objc_msgSend(*(id *)(a1 + 56), "count") >= *(_QWORD *)(a1 + 64))
          {

            goto LABEL_20;
          }
          objc_msgSend(*(id *)(a1 + 56), "addObject:", v23);

        }
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
        if (v19)
          continue;
        break;
      }
    }
LABEL_20:

  }
}

void __58___CDInteractionStore_getInteractionsStatisticsForConfig___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  NSObject *v14;
  uint64_t v15;
  double v16;
  double v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  unint64_t v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  double v26;
  double v27;
  NSObject *v28;
  uint64_t v29;
  double v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  _QWORD v51[4];
  id v52;
  NSObject *v53;
  id v54;
  _QWORD *v55;
  uint64_t *v56;
  unint64_t v57;
  _QWORD v58[3];
  int v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  _QWORD v65[7];
  _QWORD v66[7];
  uint8_t buf[4];
  uint64_t v68;
  __int16 v69;
  double v70;
  __int16 v71;
  uint64_t v72;
  __int16 v73;
  uint64_t v74;
  __int16 v75;
  uint64_t v76;
  void *v77;
  _QWORD v78[7];

  v78[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "begin");
  v2 = objc_alloc_init(MEMORY[0x1E0C97B48]);
  objc_msgSend(MEMORY[0x1E0C97B20], "entityForName:inManagedObjectContext:", CFSTR("Interactions"), *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEntity:", v3);

  objc_msgSend(v2, "setReturnsObjectsAsFaults:", 0);
  v78[0] = CFSTR("sender");
  v78[1] = CFSTR("recipients");
  v78[2] = CFSTR("keywords");
  v78[3] = CFSTR("attachments");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v78, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRelationshipKeyPathsForPrefetching:", v4);

  objc_msgSend(v2, "setFetchLimit:", objc_msgSend(*(id *)(a1 + 48), "fetchLimit"));
  objc_msgSend(v2, "setFetchBatchSize:", (int)objc_msgSend(*(id *)(a1 + 48), "fetchBatchSize"));
  v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("startDate"), 0);
  v5 = (void *)MEMORY[0x193FEE914]();
  v77 = v49;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v77, 1);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v2, "setSortDescriptors:", v48);
  objc_msgSend(*(id *)(a1 + 48), "predicate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDInteractionStore predicateFilteringUsernameForPredicate:](_CDInteractionStore, "predicateFilteringUsernameForPredicate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v7);

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 40);
  v64 = 0;
  objc_msgSend(v8, "executeFetchRequest:error:", v2, &v64);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v64;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSinceDate:", v50);
  v13 = v12;

  +[_CDLogging instrumentationChannel](_CDLogging, "instrumentationChannel");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = objc_msgSend(v2, "fetchLimit");
    objc_msgSend(v50, "timeIntervalSinceNow");
    v17 = v16;
    v18 = objc_msgSend(v9, "count");
    *(_DWORD *)buf = 134218496;
    v68 = v15;
    v69 = 2048;
    v70 = -v17;
    v71 = 2048;
    v72 = v18;
    _os_log_impl(&dword_18DDBE000, v14, OS_LOG_TYPE_DEFAULT, "getInteractionsStatisticsForConfig: finished executeFetchRequest, fetchLimit %tu object(s), elapsed %f(sec), found %tu object(s)", buf, 0x20u);
  }

  if (v10)
  {
    +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      __58___CDInteractionStore_getInteractionsStatisticsForConfig___block_invoke_cold_1();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = 0;
    v61 = &v60;
    v62 = 0x2020000000;
    v63 = 0;
    v58[0] = 0;
    v58[1] = v58;
    v58[2] = 0x2020000000;
    v59 = 0;
    v20 = objc_msgSend(v2, "fetchBatchSize");
    v21 = objc_msgSend(v2, "fetchBatchSize");
    objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:", "getInteractionsStatisticsForConfig processing");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v2, "fetchBatchSize");
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __58___CDInteractionStore_getInteractionsStatisticsForConfig___block_invoke_255;
    v51[3] = &unk_1E26E4A10;
    v55 = v58;
    v57 = (v20 + 999) / v21;
    v52 = *(id *)(a1 + 48);
    v24 = v22;
    v53 = v24;
    v54 = *(id *)(a1 + 56);
    v56 = &v60;
    objc_msgSend(v9, "_pas_enumerateChunksOfSize:usingBlock:", v23, v51);
    v44 = v24;
    dispatch_sync(v24, &__block_literal_global_258);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "timeIntervalSinceDate:", v47);
    v27 = v26;

    +[_CDLogging instrumentationChannel](_CDLogging, "instrumentationChannel");
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = objc_msgSend(v2, "fetchLimit");
      objc_msgSend(v50, "timeIntervalSinceNow");
      v31 = v30;
      v32 = objc_msgSend(v9, "count");
      v33 = v61[3];
      v34 = objc_msgSend(v9, "count");
      v35 = v34 - v61[3];
      *(_DWORD *)buf = 134219008;
      v68 = v29;
      v69 = 2048;
      v70 = -v31;
      v71 = 2048;
      v72 = v32;
      v73 = 2048;
      v74 = v33;
      v75 = 2048;
      v76 = v35;
      _os_log_impl(&dword_18DDBE000, v28, OS_LOG_TYPE_DEFAULT, "getInteractionsStatisticsForConfig: finished processing, fetchLimit %tu object(s), elapsed %f(sec), found %tu object(s), processed %tu object(s) (%tu were skipped due to timeout)", buf, 0x34u);
    }

    v65[0] = CFSTR("request.fetchLimit");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), objc_msgSend(v2, "fetchLimit"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v66[0] = v46;
    v65[1] = CFSTR("request.fetchBatchSize");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), objc_msgSend(v2, "fetchBatchSize"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v66[1] = v45;
    v65[2] = CFSTR("managedResult.count");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), objc_msgSend(v9, "count"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v66[2] = v36;
    v65[3] = CFSTR("processedCount");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), v61[3]);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v66[3] = v37;
    v65[4] = CFSTR("request.predicate");
    v38 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v2, "predicate");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "stringWithFormat:", CFSTR("%@"), v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v66[4] = v40;
    v65[5] = CFSTR("interactionStoreQueryTimeInMillis");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), (unint64_t)(v13 * 1000.0));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v66[5] = v41;
    v65[6] = CFSTR("featureComputationTimeInMillis");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), (unint64_t)(v27 * 1000.0));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v66[6] = v42;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v66, v65, 7);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 56), "setQueryStats:", v43);
    _Block_object_dispose(v58, 8);
    _Block_object_dispose(&v60, 8);

    v10 = 0;
  }

}

void __58___CDInteractionStore_getInteractionsStatisticsForConfig___block_invoke_255(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;

  v5 = a2;
  v6 = (id)objc_msgSend(v5, "firstObject");
  if (*(_QWORD *)(a1 + 72) <= (unint64_t)*(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24)
    && (v7 = *(void **)(a1 + 32),
        objc_msgSend(v5, "firstObject"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        LODWORD(v7) = objc_msgSend(v7, "shouldStopRecordProcessing:", v8),
        v8,
        (_DWORD)v7))
  {
    *a3 = 1;
  }
  else
  {
    dispatch_sync(*(dispatch_queue_t *)(a1 + 40), &__block_literal_global_256);
    v9 = *(NSObject **)(a1 + 40);
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __58___CDInteractionStore_getInteractionsStatisticsForConfig___block_invoke_3;
    v16 = &unk_1E26E3AC0;
    v10 = v5;
    v17 = v10;
    v18 = *(id *)(a1 + 32);
    v11 = *(id *)(a1 + 48);
    v12 = *(_QWORD *)(a1 + 56);
    v19 = v11;
    v20 = v12;
    dispatch_async(v9, &v13);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) += objc_msgSend(v10, "count", v13, v14, v15, v16);
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);

  }
}

void __58___CDInteractionStore_getInteractionsStatisticsForConfig___block_invoke_3(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v6);
        v8 = (void *)MEMORY[0x193FEE914](v3);
        objc_msgSend(*(id *)(a1 + 40), "computeStatsForInteractionRecord:inInteractionsStatistics:chunkIndex:", v7, *(_QWORD *)(a1 + 48), *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), (_QWORD)v9);
        objc_autoreleasePoolPop(v8);
        ++v6;
      }
      while (v4 != v6);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      v4 = v3;
    }
    while (v3);
  }

}

void __41___CDInteractionStore_queryVersionNumber__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;

  v2 = objc_alloc_init(MEMORY[0x1E0C97B48]);
  objc_msgSend(MEMORY[0x1E0C97B20], "entityForName:inManagedObjectContext:", CFSTR("Version"), *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEntity:", v3);

  objc_msgSend(v2, "setFetchLimit:", 1);
  v4 = *(void **)(a1 + 32);
  v10 = 0;
  objc_msgSend(v4, "executeFetchRequest:error:", v2, &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10;
  if (v6)
  {
    v7 = v6;
    +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __72___CDInteractionStore_queryContactInteractionsUsingPredicate_withLimit___block_invoke_cold_1();

  }
  else
  {
    if (v5 && objc_msgSend(v5, "count"))
    {
      objc_msgSend(v5, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v9, "number");

    }
    v7 = 0;
  }

}

void __43___CDInteractionStore_recordVersionNumber___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v2 = objc_alloc_init(MEMORY[0x1E0C97B48]);
  objc_msgSend(MEMORY[0x1E0C97B20], "entityForName:inManagedObjectContext:", CFSTR("Version"), *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEntity:", v3);

  objc_msgSend(v2, "setFetchLimit:", 1);
  v4 = *(void **)(a1 + 32);
  v9 = 0;
  objc_msgSend(v4, "executeFetchRequest:error:", v2, &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v9;
  if (v6 || !v5)
    goto LABEL_6;
  if (!objc_msgSend(v5, "count"))
  {
    v6 = 0;
LABEL_6:
    objc_msgSend(MEMORY[0x1E0C97B20], "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("Version"), *(_QWORD *)(a1 + 32));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  objc_msgSend(v5, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
LABEL_7:
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  objc_msgSend(v7, "setCreationDate:");

  objc_msgSend(v7, "setNumber:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v7, "setKey:", CFSTR("store_version"));
  objc_msgSend(*(id *)(a1 + 32), "save:", 0);

}

__CFString *__103___CDInteractionStore_deleteInteractionsMatchingPredicate_sortDescriptors_limit_debuggingReason_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  __CFString *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;

  v2 = a2;
  objc_msgSend(v2, "derivedIntentIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(v2, "domainIdentifier");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    v8 = CFSTR("(no supported identifier)");
    if (v6)
      v8 = (__CFString *)v6;
    v5 = v8;

  }
  return v5;
}

id __78___CDInteractionStore_deleteInteractionsWithBundleId_domainIdentifiers_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v10[0] = a2;
  v9[0] = CFSTR("domainIdentifier");
  v9[1] = CFSTR("domainIdentifierDot");
  v3 = a2;
  objc_msgSend(v3, "stringByAppendingString:", CFSTR("."));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  v9[2] = CFSTR("domainIdentifierSlash");
  objc_msgSend(v3, "stringByAppendingString:", CFSTR("/"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateWithSubstitutionVariables:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __115___CDInteractionStore_deleteInteractionsMatchingPredicate_sortDescriptors_limit_debuggingReason_completionHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = a1[6];
  v5 = a1[9];
  v6 = a1[7];
  v10 = 0;
  v7 = objc_msgSend(v2, "deleteInteractionsMatchingPredicate:sortDescriptors:limit:debuggingReason:error:", v3, v4, v5, v6, &v10);
  v8 = v10;
  v9 = a1[8];
  if (v9)
    (*(void (**)(uint64_t, uint64_t, id))(v9 + 16))(v9, v7, v8);

}

void __72___CDInteractionStore_deleteInteractionsWithBundleId_completionHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  id v7;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v7 = 0;
  v4 = objc_msgSend(v2, "deleteInteractionsWithBundleId:error:", v3, &v7);
  v5 = v7;
  v6 = a1[6];
  if (v6)
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, v4, v5);

}

void __80___CDInteractionStore_deleteInteractionsWithBundleId_account_completionHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = a1[6];
  v8 = 0;
  v5 = objc_msgSend(v2, "deleteInteractionsWithBundleId:account:error:", v3, v4, &v8);
  v6 = v8;
  v7 = a1[7];
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, v5, v6);

}

void __89___CDInteractionStore_deleteInteractionsWithBundleId_domainIdentifier_completionHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = a1[6];
  v8 = 0;
  v5 = objc_msgSend(v2, "deleteInteractionsWithBundleId:domainIdentifier:error:", v3, v4, &v8);
  v6 = v8;
  v7 = a1[7];
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, v5, v6);

}

void __90___CDInteractionStore_deleteInteractionsWithBundleId_domainIdentifiers_completionHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = a1[6];
  v8 = 0;
  v5 = objc_msgSend(v2, "deleteInteractionsWithBundleId:domainIdentifiers:error:", v3, v4, &v8);
  v6 = v8;
  v7 = a1[7];
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, v5, v6);

}

void __70___CDInteractionStore_fetchOrCreateKeywordRecord_context_cache_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_5(&dword_18DDBE000, v0, v1, "fetchOrCreateKeywordRecord: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __73___CDInteractionStore_fetchOrCreateAttachmentRecord_context_cache_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_5(&dword_18DDBE000, v0, v1, "fetchOrCreateAttachmentRecord caught %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __70___CDInteractionStore_fetchOrCreateContactRecord_context_cache_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_5(&dword_18DDBE000, v0, v1, "fetchOrCreateContactRecord Caught %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __70___CDInteractionStore_batchFetchExistingKeywordRecords_context_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_5(&dword_18DDBE000, v0, v1, "batchFetchExistingKeywords: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __73___CDInteractionStore_batchFetchExistingAttachmentRecords_context_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_5(&dword_18DDBE000, v0, v1, "batchFetchExistingAttachmentRecords: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __70___CDInteractionStore_batchFetchExistingContactRecords_context_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_5(&dword_18DDBE000, v0, v1, "batchFetchExistingContactRecords: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __77___CDInteractionStore_batchFetchExistingInteractionsWithUUIDs_context_error___block_invoke_cold_1(_QWORD *a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 134218242;
  *(_QWORD *)&v3[4] = a2;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = *a1;
  OUTLINED_FUNCTION_7_5(&dword_18DDBE000, a2, a3, "got %tu non-deleted record(s) with a nil UUID when querying for UUIDs %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_5();
}

void __77___CDInteractionStore_batchFetchExistingInteractionsWithUUIDs_context_error___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_5(&dword_18DDBE000, v0, v1, "batchFetchExistingInteractionsWithUUIDs: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __53___CDInteractionStore_recordInteractionsBatch_error___block_invoke_cold_1(id *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "pendingShareSheetInteraction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*a1, "pendingShareSheetInteraction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "targetBundleId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138412546;
  v10 = v5;
  v11 = 2112;
  v12 = v7;
  OUTLINED_FUNCTION_10(&dword_18DDBE000, a2, v8, "Pending sharesheet interaction from %@ to %@ dropped because no matching interaction was found", (uint8_t *)&v9);

}

void __53___CDInteractionStore_recordInteractionsBatch_error___block_invoke_cold_2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_18DDBE000, a2, v4, "Associating share information from pending share interaction to interaction with uuid %@", v5);

}

void __53___CDInteractionStore_recordInteractionsBatch_error___block_invoke_198_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_5(&dword_18DDBE000, v0, v1, "recordInteractionsBatch: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __53___CDInteractionStore_recordInteractionsBatch_error___block_invoke_198_cold_2(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_6_6(&dword_18DDBE000, a3, (uint64_t)a3, "Missing uuid in interaction - not storing", a1);
}

void __100___CDInteractionStore_queryInteractionsUsingPredicate_sortDescriptors_limit_offset_objectIDs_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_5(&dword_18DDBE000, v0, v1, "Caught Exception: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __72___CDInteractionStore_queryContactInteractionsUsingPredicate_withLimit___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18DDBE000, v0, v1, "Query error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __72___CDInteractionStore_queryContactInteractionsUsingPredicate_withLimit___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_5(&dword_18DDBE000, v0, v1, "queryContactInteractionsUsingPredicate: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __76___CDInteractionStore_histogramContactInteractionsUsingPredicate_withLimit___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_5(&dword_18DDBE000, v0, v1, "histogramContactInteractionsUsingPredicate: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __44___CDInteractionStore_usersWithInteractions__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18DDBE000, v0, v1, "usersWithInteractions: query error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __44___CDInteractionStore_usersWithInteractions__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_5(&dword_18DDBE000, v0, v1, "usersWithInteractions: query exception: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __52___CDInteractionStore_conversationsWithInteractions__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18DDBE000, v0, v1, "conversationsWithInteractions: query error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __52___CDInteractionStore_conversationsWithInteractions__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_5(&dword_18DDBE000, v0, v1, "conversationsWithInteractions: query exception: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __67___CDInteractionStore_kMostRecentConversationsWithLimit_predicate___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_5(&dword_18DDBE000, v0, v1, "kMostRecentConversationsWithLimit: query exception: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __58___CDInteractionStore_getInteractionsStatisticsForConfig___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18DDBE000, v0, v1, "getInteractionsStatisticsForConfig: query error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __58___CDInteractionStore_getInteractionsStatisticsForConfig___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_5(&dword_18DDBE000, v0, v1, "getInteractionsStatisticsForConfig: query exception: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __41___CDInteractionStore_queryVersionNumber__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_5(&dword_18DDBE000, v0, v1, "queryVersionNumber: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __43___CDInteractionStore_recordVersionNumber___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_5(&dword_18DDBE000, v0, v1, "recordVersionNumber: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end

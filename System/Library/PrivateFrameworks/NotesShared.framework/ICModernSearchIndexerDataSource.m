@implementation ICModernSearchIndexerDataSource

- (id)dataSourceIdentifier
{
  return CFSTR("Modern");
}

- (ICModernSearchIndexerDataSource)initWithPersistentContainer:(id)a3
{
  id v4;
  ICModernSearchIndexerDataSource *v5;
  ICModernSearchIndexerDataSource *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICModernSearchIndexerDataSource;
  v5 = -[ICBaseSearchIndexerDataSource init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_persistentContainer, v4);

  return v6;
}

- (unint64_t)indexingPriority
{
  return 2;
}

- (ICPersistentContainer)persistentContainer
{
  id WeakRetained;
  void *v3;
  id v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_persistentContainer);
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained;
  }
  else
  {
    +[ICNoteContext sharedContext](ICNoteContext, "sharedContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "persistentContainer");
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (ICPersistentContainer *)v4;
}

- (id)persistentStoreCoordinator
{
  void *v2;
  void *v3;

  -[ICModernSearchIndexerDataSource persistentContainer](self, "persistentContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "persistentStoreCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)newManagedObjectContext
{
  void *v2;
  void *v3;

  -[ICModernSearchIndexerDataSource persistentContainer](self, "persistentContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICNoteContext workerManagedObjectContextForContainer:](ICNoteContext, "workerManagedObjectContextForContainer:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)allIndexableObjectIDsInReversedReindexingOrderWithContext:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  _QWORD v15[5];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v4 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__10;
  v22 = __Block_byref_object_dispose__10;
  v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (ICVerboseSearchLogging())
  {
    v5 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[ICModernSearchIndexerDataSource allIndexableObjectIDsInReversedReindexingOrderWithContext:].cold.1((uint64_t)self, v5, v6, v7, v8, v9, v10, v11);

  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __93__ICModernSearchIndexerDataSource_allIndexableObjectIDsInReversedReindexingOrderWithContext___block_invoke;
  v15[3] = &unk_1E76C95A8;
  v15[4] = self;
  v12 = v4;
  v16 = v12;
  v17 = &v18;
  objc_msgSend(v12, "performBlockAndWait:", v15);
  v13 = (void *)objc_msgSend((id)v19[5], "copy");

  _Block_object_dispose(&v18, 8);
  return v13;
}

void __93__ICModernSearchIndexerDataSource_allIndexableObjectIDsInReversedReindexingOrderWithContext___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  if (ICVerboseSearchLogging())
  {
    v2 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      __93__ICModernSearchIndexerDataSource_allIndexableObjectIDsInReversedReindexingOrderWithContext___block_invoke_cold_7(a1, v2, v3, v4, v5, v6, v7, v8);

  }
  +[ICCloudSyncingObject predicateForVisibleObjects](ICAccount, "predicateForVisibleObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("name"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICAccount ic_objectIDsMatchingPredicate:sortDescriptors:context:](ICAccount, "ic_objectIDsMatchingPredicate:sortDescriptors:context:", v9, v11, *(_QWORD *)(a1 + 40));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (ICVerboseSearchLogging())
  {
    v13 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      __93__ICModernSearchIndexerDataSource_allIndexableObjectIDsInReversedReindexingOrderWithContext___block_invoke_cold_6();

  }
  +[ICFolder predicateForVisibleObjects](ICFolder, "predicateForVisibleObjects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("dateForLastTitleModification"), 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICFolder ic_objectIDsMatchingPredicate:sortDescriptors:context:](ICFolder, "ic_objectIDsMatchingPredicate:sortDescriptors:context:", v14, v16, *(_QWORD *)(a1 + 40));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (ICVerboseSearchLogging())
  {
    v18 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      __93__ICModernSearchIndexerDataSource_allIndexableObjectIDsInReversedReindexingOrderWithContext___block_invoke_cold_5();

  }
  +[ICCloudSyncingObject predicateForVisibleObjects](ICHashtag, "predicateForVisibleObjects");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICHashtag ic_objectIDsMatchingPredicate:sortDescriptors:context:](ICHashtag, "ic_objectIDsMatchingPredicate:sortDescriptors:context:", v19, v21, *(_QWORD *)(a1 + 40));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (ICVerboseSearchLogging())
  {
    v23 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      __93__ICModernSearchIndexerDataSource_allIndexableObjectIDsInReversedReindexingOrderWithContext___block_invoke_cold_4();

  }
  +[ICNote predicateForSearchableNotesInContext:](ICNote, "predicateForSearchableNotesInContext:", *(_QWORD *)(a1 + 40));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("modificationDate"), 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICNote ic_objectIDsMatchingPredicate:sortDescriptors:context:](ICNote, "ic_objectIDsMatchingPredicate:sortDescriptors:context:", v24, v26, *(_QWORD *)(a1 + 40));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (ICVerboseSearchLogging())
  {
    v28 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      __93__ICModernSearchIndexerDataSource_allIndexableObjectIDsInReversedReindexingOrderWithContext___block_invoke_cold_3();

  }
  +[ICAttachment predicateForSearchableAttachmentsInContext:](ICAttachment, "predicateForSearchableAttachmentsInContext:", *(_QWORD *)(a1 + 40));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("modificationDate"), 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v30;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICAttachment ic_objectIDsMatchingPredicate:sortDescriptors:context:](ICAttachment, "ic_objectIDsMatchingPredicate:sortDescriptors:context:", v29, v31, *(_QWORD *)(a1 + 40));
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (ICVerboseSearchLogging())
  {
    v33 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      __93__ICModernSearchIndexerDataSource_allIndexableObjectIDsInReversedReindexingOrderWithContext___block_invoke_cold_2();

  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "ic_addObjectsFromNonNilArray:", v32);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "ic_addObjectsFromNonNilArray:", v27);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "ic_addObjectsFromNonNilArray:", v22);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "ic_addObjectsFromNonNilArray:", v17);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "ic_addObjectsFromNonNilArray:", v12);
  if (ICVerboseSearchLogging())
  {
    v34 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      __93__ICModernSearchIndexerDataSource_allIndexableObjectIDsInReversedReindexingOrderWithContext___block_invoke_cold_1();

  }
}

- (void)contextWillSave:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  char v18;
  NSObject *v19;
  void *v20;
  ICModernSearchIndexerDataSource *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)ICModernSearchIndexerDataSource;
  -[ICBaseSearchIndexerDataSource contextWillSave:](&v26, sel_contextWillSave_, v4);
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "persistentStoreCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICModernSearchIndexerDataSource persistentStoreCoordinator](self, "persistentStoreCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if (v8)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(v5, "updatedObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v10)
    {
      v11 = v10;
      v21 = self;
      v12 = *(_QWORD *)v23;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v23 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v14, "changedValues");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("didChooseToMigrate"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (v16)
            {
              v17 = 0;
              goto LABEL_13;
            }
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        if (v11)
          continue;
        break;
      }
      v17 = 1;
LABEL_13:
      self = v21;
    }
    else
    {
      v17 = 1;
    }

    v18 = ICUseCoreDataCoreSpotlightIntegration();
    if ((v17 & 1) == 0 && (v18 & 1) == 0)
    {
      v19 = os_log_create("com.apple.notes", "SearchIndexer");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        -[ICModernSearchIndexerDataSource contextWillSave:].cold.1(v19);

      -[ICBaseSearchIndexerDataSource setNeedsReindexing:](self, "setNeedsReindexing:", 1);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "postNotificationName:object:", *MEMORY[0x1E0D64108], self);

    }
  }

}

- (id)searchableItemForSynapseContentItem:(id)a3 note:(id)a4 attachment:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if ((objc_msgSend(v8, "isDeletedOrInTrash") & 1) != 0 || !objc_msgSend(v8, "isSystemPaper"))
  {
    v16 = 0;
  }
  else
  {
    objc_msgSend(v9, "metadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v9, "metadata");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("is_synthetic_synapse_item"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "BOOLValue");

      if (v13)
      {
        v14 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v9, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringWithFormat:", CFSTR("sy_%@"), v15);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v10 = 0;
      }
    }
    v17 = (void *)MEMORY[0x1E0DB0740];
    objc_msgSend(v8, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "searchIndexingIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "searchDomainIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "searchableItemLinkingContentItem:toContainerIdentifier:uniqueIdentifier:relatedIdentifier:domainIdentifier:", v7, v18, v10, v19, v20);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v16;
}

- (id)searchableItemResultForObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ICModernSearchIndexerDataSource;
  -[ICBaseSearchIndexerDataSource searchableItemResultForObject:](&v15, sel_searchableItemResultForObject_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "searchableItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "managedObjectContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectWithID:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "lastOpenedDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "attributeSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setLastUsedDate:", v10);

  }
  -[ICModernSearchIndexerDataSource additionalItemsForObject:](self, "additionalItemsForObject:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc_init(MEMORY[0x1E0D64260]);
  objc_msgSend(v13, "setSearchableItem:", v6);
  objc_msgSend(v13, "setAdditionalSearchableItems:", v12);

  return v13;
}

- (BOOL)isPaperKitOrSynapseAttachment:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;
  void *v6;

  v3 = a3;
  objc_opt_class();
  ICDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (objc_msgSend(v4, "attachmentType") == 13)
    {
      v5 = 1;
    }
    else
    {
      objc_msgSend(v4, "synapseData");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v6 != 0;

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)synapseItemsForObject:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "managedObjectContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectWithID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "synapseData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = objc_alloc(MEMORY[0x1E0DB0700]);
      objc_msgSend(v6, "synapseData");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 0;
      v10 = (void *)objc_msgSend(v8, "initWithData:error:", v9, &v28);
      v11 = v28;

      if (v11)
      {
        v12 = os_log_create("com.apple.notes", "SearchIndexer");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          -[ICModernSearchIndexerDataSource synapseItemsForObject:].cold.1((uint64_t)v11, v12);

        v13 = 0;
      }
      else
      {
        v30[0] = v10;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    else if (objc_msgSend(v6, "attachmentType") == 8)
    {
      objc_msgSend(v6, "URL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        v15 = objc_alloc(MEMORY[0x1E0DB0700]);
        objc_msgSend(v6, "title");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = *MEMORY[0x1E0DB0768];
        objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Web"), CFSTR("Web"), 0, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "URL");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)objc_msgSend(v15, "initWithDisplayTitle:sourceIdentifier:sourceName:itemURL:identifier:", v16, v17, v18, v19, 0);

        objc_msgSend(v6, "metadata");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v21;
        if (!v21)
          v21 = (void *)MEMORY[0x1E0C9AA70];
        v23 = (void *)objc_msgSend(v21, "mutableCopy");

        objc_msgSend(v23, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("is_synthetic_synapse_item"));
        v24 = (void *)objc_msgSend(v23, "copy");
        objc_msgSend(v6, "setMetadata:", v24);

        v29 = v20;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v26 = (void *)MEMORY[0x1E0D641A0];
        objc_msgSend(v6, "ic_loggingIdentifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICModernSearchIndexerDataSource synapseItemsForObject:]", 1, 0, CFSTR("attachment %@ was of type ICAttachmentTypeWeb, but didn't have a URL or synapse data. Not providing any SYContentItems for this. "), v27);

        v13 = (void *)MEMORY[0x1E0C9AA60];
      }
    }
    else if (objc_msgSend(v6, "attachmentType") == 13)
    {
      +[ICPaperSynapseContentItemProvider contentItemsForAttachment:](ICPaperSynapseContentItemProvider, "contentItemsForAttachment:", v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)additionalUniqueIdentifiersToDeleteForObject:(id)a3
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[ICModernSearchIndexerDataSource synapseItemsForObject:](self, "synapseItemsForObject:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "itemIdentifier", (_QWORD)v14);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "UUIDString");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v11);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

    v12 = (void *)objc_msgSend(v4, "copy");
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)additionalItemsForObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  char v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ICModernSearchIndexerDataSource synapseItemsForObject:](self, "synapseItemsForObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "managedObjectContext");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v4;
      objc_msgSend(v4, "objectID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectWithID:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "note");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v50 = 0u;
      v51 = 0u;
      v52 = 0u;
      v53 = 0u;
      v40 = v5;
      v11 = v5;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v51;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v51 != v14)
              objc_enumerationMutation(v11);
            -[ICModernSearchIndexerDataSource searchableItemForSynapseContentItem:note:attachment:](self, "searchableItemForSynapseContentItem:note:attachment:", *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i), v9, v8, v40);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "ic_addNonNilObject:", v16);

          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
        }
        while (v13);
      }

      v17 = (void *)objc_msgSend(v10, "copy");
      goto LABEL_30;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    ICDynamicCast();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isHiddenFromIndexing") & 1) != 0)
    {
      v17 = 0;
LABEL_31:

      goto LABEL_32;
    }
    v40 = v5;
    v41 = v4;
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    objc_msgSend(v8, "inlineAttachments");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v47;
      v42 = (void *)*MEMORY[0x1E0CEC618];
      v43 = v18;
      v44 = *(_QWORD *)v47;
      v45 = v8;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v47 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * j);
          if (objc_msgSend(v23, "attachmentType", v40) == 3)
          {
            objc_msgSend(v23, "tokenContentIdentifier");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (v24)
            {
              v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithString:", v24);
              objc_msgSend(v25, "scheme");
              v26 = objc_claimAutoreleasedReturnValue();
              if (v26)
              {
                v27 = (void *)v26;
                objc_msgSend(v25, "scheme");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                v29 = ICIsNotesURLScheme(v28);

                v21 = v44;
                if ((v29 & 1) == 0)
                {
                  v30 = objc_alloc(MEMORY[0x1E0CA6B50]);
                  objc_msgSend(v42, "identifier");
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  v32 = (void *)objc_msgSend(v30, "initWithItemContentType:", v31);

                  objc_msgSend(v32, "setIc_dataSourceIdentifier:", CFSTR("Modern"));
                  objc_msgSend(v32, "setIc_searchResultType:", 2);
                  objc_msgSend(v45, "account");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v33, "identifier");
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v32, "setDomainIdentifier:", v34);

                  objc_msgSend(v32, "ic_setURLString:", v24);
                  v35 = objc_alloc_init(MEMORY[0x1E0CA6B48]);
                  objc_msgSend(v35, "setAttributeSet:", v32);
                  objc_msgSend(v23, "objectID");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v36, "URIRepresentation");
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v37, "absoluteString");
                  v38 = (void *)objc_claimAutoreleasedReturnValue();

                  v21 = v44;
                  objc_msgSend(v35, "setUniqueIdentifier:", v38);
                  objc_msgSend(v9, "addObject:", v35);

                  v18 = v43;
                }
              }

              v8 = v45;
            }

          }
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
      }
      while (v20);
    }

    v17 = (void *)objc_msgSend(v9, "copy");
LABEL_30:

    v5 = v40;
    v4 = v41;
    goto LABEL_31;
  }
  v17 = 0;
LABEL_32:

  return v17;
}

- (BOOL)isFolderWithServerShareChanged:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "changedValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "containsObject:", CFSTR("serverShareData"));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)addNotesFromSubtree:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v3 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__10;
  v17 = __Block_byref_object_dispose__10;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__ICModernSearchIndexerDataSource_addNotesFromSubtree___block_invoke;
  v9[3] = &unk_1E76C95A8;
  v5 = v3;
  v10 = v5;
  v6 = v4;
  v11 = v6;
  v12 = &v13;
  objc_msgSend(v6, "performBlockAndWait:", v9);
  v7 = (void *)objc_msgSend((id)v14[5], "copy");

  _Block_object_dispose(&v13, 8);
  return v7;
}

void __55__ICModernSearchIndexerDataSource_addNotesFromSubtree___block_invoke(_QWORD *a1)
{
  void *v2;
  __int128 v3;
  const __CFString *v4;
  unint64_t v5;
  _UNKNOWN **v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  const __CFString *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  __int128 v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  id v53;
  _BYTE v54[128];
  uint8_t v55[128];
  uint8_t buf[4];
  uint64_t v57;
  __int16 v58;
  id v59;
  _QWORD v60[5];

  v60[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", a1[4]);
  if (objc_msgSend(v2, "count"))
  {
    v4 = CFSTR("ICNote");
    v5 = 0x1E0C97000uLL;
    v6 = &off_1E76C5000;
    *(_QWORD *)&v3 = 138412546;
    v35 = v3;
    do
    {
      objc_msgSend(v2, "lastObject", v35);
      v7 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "removeLastObject");
      v8 = objc_msgSend(objc_alloc(*(Class *)(v5 + 2888)), "initWithEntityName:", v4);
      objc_msgSend(v6[424], "predicateForNotesInFolder:", v7);
      v9 = objc_claimAutoreleasedReturnValue();
      +[ICCloudSyncingObject predicateForVisibleObjects](ICCloudSyncingObject, "predicateForVisibleObjects");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0CB3528];
      v40 = (void *)v10;
      v41 = (void *)v9;
      v60[0] = v9;
      v60[1] = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v11;
      v14 = (void *)v8;
      objc_msgSend(v13, "andPredicateWithSubpredicates:", v12);
      v15 = objc_claimAutoreleasedReturnValue();

      v39 = (void *)v15;
      objc_msgSend(v14, "setPredicate:", v15);
      objc_msgSend(v14, "setResultType:", 1);
      v16 = (void *)a1[5];
      v53 = 0;
      objc_msgSend(v16, "executeFetchRequest:error:", v14, &v53);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v53;
      v38 = v17;
      if (v42)
      {
        v18 = os_log_create("com.apple.notes", "SearchIndexer");
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v35;
          v57 = v7;
          v58 = 2112;
          v59 = v42;
          _os_log_error_impl(&dword_1BD918000, v18, OS_LOG_TYPE_ERROR, "Error fetching notes of the folder %@. %@", buf, 0x16u);
        }
      }
      else
      {
        v51 = 0u;
        v52 = 0u;
        v49 = 0u;
        v50 = 0u;
        v18 = v17;
        v19 = -[NSObject countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
        if (v19)
        {
          v20 = v19;
          v36 = v14;
          v21 = v4;
          v22 = v7;
          v23 = *(_QWORD *)v50;
          do
          {
            for (i = 0; i != v20; ++i)
            {
              if (*(_QWORD *)v50 != v23)
                objc_enumerationMutation(v18);
              objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "addObject:", *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i));
            }
            v20 = -[NSObject countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
          }
          while (v20);
          v7 = v22;
          v4 = v21;
          v14 = v36;
        }
      }

      v25 = (void *)objc_msgSend(objc_alloc(*(Class *)(v5 + 2888)), "initWithEntityName:", CFSTR("ICFolder"));
      v43 = (void *)v7;
      objc_msgSend(v6[424], "predicateForFoldersInFolder:", v7);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setPredicate:", v26);
      v27 = (void *)a1[5];
      v48 = 0;
      objc_msgSend(v27, "executeFetchRequest:error:", v14, &v48);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v48;
      if (v29)
      {
        v30 = os_log_create("com.apple.notes", "SearchIndexer");
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v35;
          v57 = (uint64_t)v43;
          v58 = 2112;
          v59 = v29;
          _os_log_error_impl(&dword_1BD918000, v30, OS_LOG_TYPE_ERROR, "Error fetching folders of the folder %@. %@", buf, 0x16u);
        }
      }
      else
      {
        v37 = v14;
        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        v30 = v28;
        v31 = -[NSObject countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
        if (v31)
        {
          v32 = v31;
          v33 = *(_QWORD *)v45;
          do
          {
            for (j = 0; j != v32; ++j)
            {
              if (*(_QWORD *)v45 != v33)
                objc_enumerationMutation(v30);
              objc_msgSend(v2, "addObject:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * j));
            }
            v32 = -[NSObject countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
          }
          while (v32);
          v4 = CFSTR("ICNote");
        }
        v14 = v37;
      }

      v5 = 0x1E0C97000;
      v6 = &off_1E76C5000;
    }
    while (objc_msgSend(v2, "count"));
  }

}

- (void)setPersistentContainer:(id)a3
{
  objc_storeWeak((id *)&self->_persistentContainer, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_persistentContainer);
}

- (void)allIndexableObjectIDsInReversedReindexingOrderWithContext:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1BD918000, a2, a3, "allIndexableObjectIDsInReversedReindexingOrderWithContext: will performBlockAndWait for data source %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __93__ICModernSearchIndexerDataSource_allIndexableObjectIDsInReversedReindexingOrderWithContext___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_17();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)v0 + 8) + 40), "count");
  OUTLINED_FUNCTION_2_2(&dword_1BD918000, v1, v2, "allIndexableObjectIDsInReversedReindexingOrderWithContext: data source %@ retrieved %lu indexableObjectIDs: %@", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_7();
}

void __93__ICModernSearchIndexerDataSource_allIndexableObjectIDsInReversedReindexingOrderWithContext___block_invoke_cold_2()
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

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_3_6(v0, v1);
  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_2_2(&dword_1BD918000, v2, v3, "allIndexableObjectIDsInReversedReindexingOrderWithContext: data source %@ retrieved %lu attachment IDs: %@", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_7();
}

void __93__ICModernSearchIndexerDataSource_allIndexableObjectIDsInReversedReindexingOrderWithContext___block_invoke_cold_3()
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

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_3_6(v0, v1);
  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_2_2(&dword_1BD918000, v2, v3, "allIndexableObjectIDsInReversedReindexingOrderWithContext: data source %@ retrieved %lu note IDs: %@", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_7();
}

void __93__ICModernSearchIndexerDataSource_allIndexableObjectIDsInReversedReindexingOrderWithContext___block_invoke_cold_4()
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

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_3_6(v0, v1);
  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_2_2(&dword_1BD918000, v2, v3, "allIndexableObjectIDsInReversedReindexingOrderWithContext: data source %@ retrieved %lu tag IDs: %@", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_7();
}

void __93__ICModernSearchIndexerDataSource_allIndexableObjectIDsInReversedReindexingOrderWithContext___block_invoke_cold_5()
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

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_3_6(v0, v1);
  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_2_2(&dword_1BD918000, v2, v3, "allIndexableObjectIDsInReversedReindexingOrderWithContext: data source %@ retrieved %lu folder IDs: %@", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_7();
}

void __93__ICModernSearchIndexerDataSource_allIndexableObjectIDsInReversedReindexingOrderWithContext___block_invoke_cold_6()
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

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_3_6(v0, v1);
  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_2_2(&dword_1BD918000, v2, v3, "allIndexableObjectIDsInReversedReindexingOrderWithContext: data source %@ retrieved %lu account IDs: %@", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_7();
}

void __93__ICModernSearchIndexerDataSource_allIndexableObjectIDsInReversedReindexingOrderWithContext___block_invoke_cold_7(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1BD918000, a2, a3, "allIndexableObjectIDsInReversedReindexingOrderWithContext: will retrieve accountObjectIDs, folderObjectIDs, tagObjectIDs, noteObjectIDs, and attachmentObjectIDs for data source %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)contextWillSave:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1BD918000, log, OS_LOG_TYPE_DEBUG, "A modern account's migration state changed, so let's re-index everything.", v1, 2u);
}

- (void)synapseItemsForObject:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1BD918000, a2, OS_LOG_TYPE_ERROR, "Encountered error while trying to deserialize synapse content item: %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1_0();
}

@end

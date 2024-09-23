@implementation _DKContactsPrivacyMaintainer

- (_DKContactsPrivacyMaintainer)initWithKnowledgeStore:(id)a3 spotlightRecorder:(id)a4
{
  id v7;
  id v8;
  _DKContactsPrivacyMaintainer *v9;
  _DKContactsPrivacyMaintainer *v10;
  uint64_t v11;
  NSUserDefaults *userDefaults;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_DKContactsPrivacyMaintainer;
  v9 = -[_DKContactsPrivacyMaintainer init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_knowledgeStore, a3);
    objc_storeStrong((id *)&v10->_spotlightRecorder, a4);
    v10->_notifyToken = -1;
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v11 = objc_claimAutoreleasedReturnValue();
    userDefaults = v10->_userDefaults;
    v10->_userDefaults = (NSUserDefaults *)v11;

  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[_DKContactsPrivacyMaintainer _unregisterContactDeletionNotifications](self, "_unregisterContactDeletionNotifications");
  v3.receiver = self;
  v3.super_class = (Class)_DKContactsPrivacyMaintainer;
  -[_DKContactsPrivacyMaintainer dealloc](&v3, sel_dealloc);
}

- (void)registerContactDeletionNotifications
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  _PASSimpleCoalescingTimer *v8;
  _PASSimpleCoalescingTimer *coalescingContactChangeTimer;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *notificationCenterToken;
  _QWORD v14[5];
  id v15;
  _QWORD handler[5];
  id v17;
  id location;
  _QWORD v19[5];

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v3, (dispatch_qos_class_t)5u, 0);
  v4 = objc_claimAutoreleasedReturnValue();

  v5 = dispatch_queue_create("contactChangeIntentDeletionQueue", v4);
  v6 = objc_alloc(MEMORY[0x1E0D81618]);
  v7 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __68___DKContactsPrivacyMaintainer_registerContactDeletionNotifications__block_invoke;
  v19[3] = &unk_1E26E2F20;
  v19[4] = self;
  v8 = (_PASSimpleCoalescingTimer *)objc_msgSend(v6, "initWithQueue:operation:", v5, v19);
  coalescingContactChangeTimer = self->_coalescingContactChangeTimer;
  self->_coalescingContactChangeTimer = v8;

  objc_initWeak(&location, self);
  handler[0] = v7;
  handler[1] = 3221225472;
  handler[2] = __68___DKContactsPrivacyMaintainer_registerContactDeletionNotifications__block_invoke_2;
  handler[3] = &unk_1E26E4350;
  objc_copyWeak(&v17, &location);
  handler[4] = self;
  notify_register_dispatch("__ABDataBaseChangedByOtherProcessNotification", &self->_notifyToken, v5, handler);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  getCNContactStoreDidChangeNotification();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __68___DKContactsPrivacyMaintainer_registerContactDeletionNotifications__block_invoke_334;
  v14[3] = &unk_1E26E4378;
  objc_copyWeak(&v15, &location);
  v14[4] = self;
  objc_msgSend(v10, "addObserverForName:object:queue:usingBlock:", v11, 0, 0, v14);
  v12 = objc_claimAutoreleasedReturnValue();
  notificationCenterToken = self->_notificationCenterToken;
  self->_notificationCenterToken = v12;

  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

- (void)_unregisterContactDeletionNotifications
{
  int notifyToken;
  id v4;

  notifyToken = self->_notifyToken;
  if (notifyToken != -1)
    notify_cancel(notifyToken);
  if (self->_notificationCenterToken)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:", self->_notificationCenterToken);

  }
}

- (void)handleContactDeletionNotification
{
  BOOL v3;
  NSObject *v4;
  _BOOL4 v5;
  objc_class *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = -[NSUserDefaults BOOLForKey:](self->_userDefaults, "BOOLForKey:", CFSTR("kCDIntentDeletionPendingDeletesQueued"));
  +[_CDLogging spotlightReceiverChannel](_CDLogging, "spotlightReceiverChannel");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v7;
      _os_log_impl(&dword_18DDBE000, v4, OS_LOG_TYPE_DEFAULT, "%@ - handleContactDeletionNotification pendingDeletesQueued = YES, skipping", (uint8_t *)&v10, 0xCu);

    }
  }
  else
  {
    if (v5)
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v9;
      _os_log_impl(&dword_18DDBE000, v4, OS_LOG_TYPE_DEFAULT, "%@ - handleContactDeletionNotification pendingDeletesQueued = NO, proceeding", (uint8_t *)&v10, 0xCu);

    }
    -[_DKContactsPrivacyMaintainer handleRecentlyDeletedContactsWithLimit:](self, "handleRecentlyDeletedContactsWithLimit:", 300);
  }
}

- (void)handleRecentlyDeletedContactsWithLimit:(unint64_t)a3
{
  void *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _CDContactChangeHistoryEventVisitor *v14;
  void *v15;
  NSObject *v16;
  NSUserDefaults *userDefaults;
  void *v18;
  NSObject *v19;
  objc_class *v20;
  id v21;
  void *v22;
  objc_class *v23;
  void *v24;
  _QWORD v25[8];
  _QWORD v26[4];
  id v27;
  uint8_t v28[4];
  id v29;
  __int16 v30;
  void *v31;
  _BYTE buf[24];
  char v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  -[NSUserDefaults dataForKey:](self->_userDefaults, "dataForKey:", CFSTR("kCDIntentDeletionContactStoreChangeHistoryToken"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDLogging spotlightReceiverChannel](_CDLogging, "spotlightReceiverChannel");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v5;
    _os_log_impl(&dword_18DDBE000, v6, OS_LOG_TYPE_DEFAULT, "%@ - handleContactDeletionNotification using startingToken: %@", buf, 0x16u);

  }
  getCNChangeHistoryFetchRequestClass();
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setStartingToken:", v5);
  getCNContactStoreClass();
  v10 = (void *)objc_opt_new();
  v27 = 0;
  objc_msgSend(v10, "enumeratorForChangeHistoryFetchRequest:error:", v9, &v27);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v27;
  v13 = v12;
  if (!v11 || v12)
  {
    +[_CDLogging spotlightReceiverChannel](_CDLogging, "spotlightReceiverChannel");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[_DKContactsPrivacyMaintainer handleRecentlyDeletedContactsWithLimit:].cold.1((uint64_t)self, (uint64_t)v13, v16);
  }
  else
  {
    v14 = [_CDContactChangeHistoryEventVisitor alloc];
    objc_msgSend(v11, "value");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[_CDContactChangeHistoryEventVisitor initWithChangeEnumerator:](v14, "initWithChangeEnumerator:", v15);

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v33 = 1;
    v26[0] = 0;
    v26[1] = v26;
    v26[2] = 0x2020000000;
    v26[3] = 0;
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __71___DKContactsPrivacyMaintainer_handleRecentlyDeletedContactsWithLimit___block_invoke;
    v25[3] = &unk_1E26E43A0;
    v25[4] = self;
    v25[5] = v26;
    v25[6] = buf;
    v25[7] = a3;
    -[NSObject visitEventsWithBatchSize:batchCallback:](v16, "visitEventsWithBatchSize:batchCallback:", 100, v25);
    userDefaults = self->_userDefaults;
    if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
    {
      objc_msgSend(v11, "currentHistoryToken");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSUserDefaults setValue:forKey:](userDefaults, "setValue:forKey:", v18, CFSTR("kCDIntentDeletionContactStoreChangeHistoryToken"));

      +[_CDLogging spotlightReceiverChannel](_CDLogging, "spotlightReceiverChannel");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = (objc_class *)objc_opt_class();
        NSStringFromClass(v20);
        v21 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "currentHistoryToken");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v28 = 138412546;
        v29 = v21;
        v30 = 2112;
        v31 = v22;
        _os_log_impl(&dword_18DDBE000, v19, OS_LOG_TYPE_DEFAULT, "%@ - handleContactDeletionNotification saved new currentHistoryToken: %@", v28, 0x16u);

      }
    }
    else
    {
      -[NSUserDefaults setBool:forKey:](self->_userDefaults, "setBool:forKey:", 1, CFSTR("kCDIntentDeletionPendingDeletesQueued"));
      +[_CDLogging spotlightReceiverChannel](_CDLogging, "spotlightReceiverChannel");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v23 = (objc_class *)objc_opt_class();
        NSStringFromClass(v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v28 = 138412290;
        v29 = v24;
        _os_log_impl(&dword_18DDBE000, v19, OS_LOG_TYPE_DEFAULT, "%@ - handleContactDeletionNotification NOT saving currentHistoryToken, set pendingDeletesQueued = YES", v28, 0xCu);

      }
    }

    _Block_object_dispose(v26, 8);
    _Block_object_dispose(buf, 8);
  }

}

- (void)_deleteIntentsRelatedToContactIdentifiers:(id)a3
{
  id v3;
  objc_class *BMLibraryStreamsPrunerClass;
  void *v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _DKKnowledgeQuerying *knowledgeStore;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  BOOL v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t j;
  uint64_t v51;
  void *v52;
  NSObject *v53;
  _CDSpotlightItemRecorder *spotlightRecorder;
  void *v55;
  objc_class *v56;
  void *v57;
  objc_class *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  NSObject *v62;
  objc_class *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  NSObject *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *context;
  uint64_t v78;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  id v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _BYTE v93[128];
  uint8_t v94[128];
  uint8_t buf[4];
  void *v96;
  __int16 v97;
  uint64_t v98;
  __int16 v99;
  id v100;
  void *v101;
  void *v102;
  _QWORD v103[2];
  _BYTE v104[128];
  uint64_t v105;

  v105 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v72 = objc_opt_new();
  BMLibraryStreamsPrunerClass = getBMLibraryStreamsPrunerClass();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class pruneWithDeletedContactIdentifiers:](BMLibraryStreamsPrunerClass, "pruneWithDeletedContactIdentifiers:", v5);

  v91 = 0u;
  v92 = 0u;
  v89 = 0u;
  v90 = 0u;
  v6 = v3;
  v69 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v89, v104, 16);
  if (v69)
  {
    v7 = *(_QWORD *)v90;
    v78 = *MEMORY[0x1E0CB2AB8];
    v8 = 0x1E0CB3000uLL;
    v71 = v6;
    v68 = *(_QWORD *)v90;
    do
    {
      v9 = 0;
      while (2)
      {
        if (*(_QWORD *)v90 != v7)
          objc_enumerationMutation(v6);
        v70 = v9;
        v10 = *(_QWORD *)(*((_QWORD *)&v89 + 1) + 8 * v9);
        +[_DKIntentMetadataKey relatedContactIdentifiers](_DKIntentMetadataKey, "relatedContactIdentifiers");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[_DKQuery structuredMetadataKeyPathForMetadataKey:](_DKQuery, "structuredMetadataKeyPathForMetadataKey:", v11);
        v12 = objc_claimAutoreleasedReturnValue();

        v13 = *(void **)(v8 + 1320);
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != nil"), v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v103[0] = v14;
        v73 = v12;
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K CONTAINS[n] %@"), v12, v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v103[1] = v15;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v103, 2);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "andPredicateWithSubpredicates:", v16);
        v74 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = 0;
        v18 = 0;
        v19 = 0;
        do
        {
          context = (void *)MEMORY[0x193FEE914]();
          +[_DKSystemEventStreams appIntentsStream](_DKSystemEventStreams, "appIntentsStream");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v102 = v20;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v102, 1);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          +[_DKQuery startDateSortDescriptorAscending:](_DKQuery, "startDateSortDescriptorAscending:", 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v101 = v22;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v101, 1);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          +[_DKEventQuery eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:](_DKEventQuery, "eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:", v74, v21, v19, 100, v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          knowledgeStore = self->_knowledgeStore;
          v88 = 0;
          -[_DKKnowledgeQuerying executeQuery:error:](knowledgeStore, "executeQuery:error:", v24, &v88);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v88;

          +[_CDLogging spotlightReceiverChannel](_CDLogging, "spotlightReceiverChannel");
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          {
            v58 = (objc_class *)objc_opt_class();
            NSStringFromClass(v58);
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            v60 = objc_msgSend(v26, "count");
            *(_DWORD *)buf = 138412802;
            v96 = v59;
            v97 = 2048;
            v98 = v60;
            v99 = 2112;
            v100 = v27;
            _os_log_debug_impl(&dword_18DDBE000, v28, OS_LOG_TYPE_DEBUG, "%@ _deleteIntentsRelatedToContactIdentifiers fetched %lu intent events, with err: %@", buf, 0x20u);

          }
          if (v27)
          {

            objc_autoreleasePoolPop(context);
            v6 = v71;
            v66 = (void *)v72;
            v61 = v71;
            v62 = v73;
            goto LABEL_40;
          }
          v75 = v24;
          v76 = v19;
          v29 = (void *)objc_opt_new();
          v84 = 0u;
          v85 = 0u;
          v86 = 0u;
          v87 = 0u;
          v30 = v26;
          v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v84, v94, 16);
          v17 = v30;
          if (v31)
          {
            v32 = v31;
            v33 = *(_QWORD *)v85;
            do
            {
              for (i = 0; i != v32; ++i)
              {
                if (*(_QWORD *)v85 != v33)
                  objc_enumerationMutation(v17);
                v35 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * i);
                v36 = (void *)MEMORY[0x193FEE914]();
                objc_msgSend(v35, "metadata");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                +[_DKIntentMetadataKey interactionIdentifier](_DKIntentMetadataKey, "interactionIdentifier");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v37, "objectForKeyedSubscript:", v38);
                v39 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v35, "source");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v40, "bundleID");
                v41 = (void *)objc_claimAutoreleasedReturnValue();

                if (v39)
                  v42 = v41 == 0;
                else
                  v42 = 1;
                if (!v42)
                {
                  objc_msgSend(v29, "objectForKeyedSubscript:", v41);
                  v43 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!v43)
                  {
                    v44 = (void *)objc_opt_new();
                    objc_msgSend(v29, "setObject:forKeyedSubscript:", v44, v41);

                  }
                  objc_msgSend(v29, "objectForKeyedSubscript:", v41);
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v45, "addObject:", v39);

                }
                objc_autoreleasePoolPop(v36);
              }
              v30 = v17;
              v32 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v84, v94, 16);
            }
            while (v32);
          }

          v82 = 0u;
          v83 = 0u;
          v80 = 0u;
          v81 = 0u;
          objc_msgSend(v29, "allKeys");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v80, v93, 16);
          if (v47)
          {
            v48 = v47;
            v49 = *(_QWORD *)v81;
            do
            {
              for (j = 0; j != v48; ++j)
              {
                if (*(_QWORD *)v81 != v49)
                  objc_enumerationMutation(v46);
                v51 = *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * j);
                objc_msgSend(v29, "objectForKeyedSubscript:", v51);
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                +[_CDLogging spotlightReceiverChannel](_CDLogging, "spotlightReceiverChannel");
                v53 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
                {
                  v56 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v56);
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412802;
                  v96 = v57;
                  v97 = 2112;
                  v98 = v51;
                  v99 = 2112;
                  v100 = v52;
                  _os_log_debug_impl(&dword_18DDBE000, v53, OS_LOG_TYPE_DEBUG, "%@ _deleteIntentsRelatedToContactIdentifiers deleting for bundleId: %@ following identifiers: %@", buf, 0x20u);

                }
                spotlightRecorder = self->_spotlightRecorder;
                objc_msgSend(v52, "allObjects");
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                -[_CDSpotlightItemRecorder deleteInteractionsWithIdentifiers:bundleID:protectionClass:](spotlightRecorder, "deleteInteractionsWithIdentifiers:bundleID:protectionClass:", v55, v51, v78);

              }
              v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v80, v93, 16);
            }
            while (v48);
          }

          objc_autoreleasePoolPop(context);
          v19 = v76 + 100;
          v18 = v75;
        }
        while (objc_msgSend(v17, "count") == 100);

        v9 = v70 + 1;
        v6 = v71;
        v7 = v68;
        v8 = 0x1E0CB3000;
        if (v70 + 1 != v69)
          continue;
        break;
      }
      v69 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v89, v104, 16);
    }
    while (v69);
  }

  v61 = (void *)objc_opt_new();
  +[_CDLogging spotlightReceiverChannel](_CDLogging, "spotlightReceiverChannel");
  v62 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
  {
    v63 = (objc_class *)objc_opt_class();
    NSStringFromClass(v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = objc_msgSend(v6, "count");
    v66 = (void *)v72;
    objc_msgSend(v61, "timeIntervalSinceDate:", v72);
    *(_DWORD *)buf = 138412802;
    v96 = v64;
    v97 = 2048;
    v98 = v65;
    v99 = 2048;
    v100 = v67;
    _os_log_impl(&dword_18DDBE000, v62, OS_LOG_TYPE_DEFAULT, "%@ _deleteIntentsRelatedToContactIdentifiers for %lu contact identifiers took %f seconds", buf, 0x20u);

  }
  else
  {
    v66 = (void *)v72;
  }
LABEL_40:

}

- (void)scheduleIntentsPruningXPCActivity
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_18DDBE000, v2, v3, "%@ scheduleIntentsPruningXPCActivity scheduled XPC activity", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)cleanupPendingDeletedContacts
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[_DKContactsPrivacyMaintainer handleRecentlyDeletedContactsWithLimit:](self, "handleRecentlyDeletedContactsWithLimit:", -1);
  -[NSUserDefaults setBool:forKey:](self->_userDefaults, "setBool:forKey:", 0, CFSTR("kCDIntentDeletionPendingDeletesQueued"));
  +[_CDLogging spotlightReceiverChannel](_CDLogging, "spotlightReceiverChannel");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_18DDBE000, v3, OS_LOG_TYPE_DEFAULT, "%@ - cleanupPendingDeletedContacts setting pendingDeletesQueued = NO", (uint8_t *)&v6, 0xCu);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coalescingContactChangeTimer, 0);
  objc_storeStrong((id *)&self->_notificationCenterToken, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_spotlightRecorder, 0);
  objc_storeStrong((id *)&self->_knowledgeStore, 0);
}

- (void)handleRecentlyDeletedContactsWithLimit:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  objc_class *v5;
  void *v6;
  uint8_t v7[12];
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  v8 = 2112;
  v9 = a2;
  _os_log_error_impl(&dword_18DDBE000, a3, OS_LOG_TYPE_ERROR, "%@ - handleContactDeletionNotification failed to fetch contacts enumerator with error: %@", v7, 0x16u);

}

@end

@implementation VSSubscriptionRegistry

- (VSSubscriptionRegistry)init
{
  VSSubscriptionRegistry *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VSSubscriptionRegistry;
  v2 = -[VSSubscriptionRegistry init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__installedAppsDidChange_, CFSTR("VSInstalledApplicationsDidChange"), 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("VSInstalledApplicationsDidChange"), 0);

  v4.receiver = self;
  v4.super_class = (Class)VSSubscriptionRegistry;
  -[VSSubscriptionRegistry dealloc](&v4, sel_dealloc);
}

- (VSSubscriptionPersistentContainer)persistentContainer
{
  VSSubscriptionRegistry *v2;
  VSSubscriptionPersistentContainer *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_persistentContainer;
  if (!v3)
  {
    v3 = objc_alloc_init(VSSubscriptionPersistentContainer);
    objc_storeStrong((id *)&v2->_persistentContainer, v3);
  }
  objc_sync_exit(v2);

  if (!v3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The result parameter must not be nil."));
  return v3;
}

- (VSSubscriptionPredicateFactory)predicateFactory
{
  VSSubscriptionRegistry *v2;
  VSSubscriptionPredicateFactory *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_predicateFactory;
  if (!v3)
  {
    v3 = objc_alloc_init(VSSubscriptionPredicateFactory);
    objc_storeStrong((id *)&v2->_predicateFactory, v3);
  }
  objc_sync_exit(v2);

  if (!v3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The result parameter must not be nil."));
  return v3;
}

- (VSRemoteNotifier)remoteNotifier
{
  VSSubscriptionRegistry *v2;
  VSRemoteNotifier *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_remoteNotifier;
  if (!v3)
  {
    v3 = -[VSRemoteNotifier initWithNotificationName:]([VSRemoteNotifier alloc], "initWithNotificationName:", CFSTR("VSActiveSubscriptionsDidChangeNotification"));
    objc_storeStrong((id *)&v2->_remoteNotifier, v3);
  }
  objc_sync_exit(v2);

  if (!v3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The result parameter must not be nil."));
  return v3;
}

- (void)_sendRemoteNotification
{
  id v2;

  -[VSSubscriptionRegistry remoteNotifier](self, "remoteNotifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotification");

}

- (void)_installedAppsDidChange:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];

  v4 = a3;
  v5 = (void *)MEMORY[0x1D8236758]();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__VSSubscriptionRegistry__installedAppsDidChange___block_invoke;
  v6[3] = &unk_1E939EDB8;
  v6[4] = self;
  -[VSSubscriptionRegistry _performBlock:](self, "_performBlock:", v6);
  objc_autoreleasePoolPop(v5);

}

uint64_t __50__VSSubscriptionRegistry__installedAppsDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendRemoteNotification");
}

- (void)_performBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = (void *)MEMORY[0x1D8236758]();
  -[VSSubscriptionRegistry persistentContainer](self, "persistentContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40__VSSubscriptionRegistry__performBlock___block_invoke;
  v8[3] = &unk_1E939F5E0;
  v7 = v4;
  v9 = v7;
  objc_msgSend(v6, "performBlockAndWait:", v8);

  objc_autoreleasePoolPop(v5);
}

void __40__VSSubscriptionRegistry__performBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  v4 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __40__VSSubscriptionRegistry__performBlock___block_invoke_2;
  v10[3] = &unk_1E93A03F8;
  v11 = *(id *)(a1 + 32);
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __40__VSSubscriptionRegistry__performBlock___block_invoke_4;
  v7[3] = &unk_1E93A0420;
  v5 = *(id *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  objc_msgSend(v6, "unwrapObject:error:", v10, v7);

}

void __40__VSSubscriptionRegistry__performBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;

  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B88]), "initWithConcurrencyType:", 1);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__VSSubscriptionRegistry__performBlock___block_invoke_3;
  v7[3] = &unk_1E939F1F8;
  v8 = v4;
  v9 = v3;
  v10 = *(id *)(a1 + 32);
  v5 = v3;
  v6 = v4;
  objc_msgSend(v6, "performBlock:", v7);

}

void __40__VSSubscriptionRegistry__performBlock___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "setParentContext:", *(_QWORD *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 48);
  +[VSFailable failableWithObject:](VSFailable, "failableWithObject:", *(_QWORD *)(a1 + 32));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

uint64_t __40__VSSubscriptionRegistry__performBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (BOOL)_saveChangesToContext:(id)a3
{
  id v4;
  void *v5;
  id v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  int64_t v12;
  int64_t v13;
  NSObject *v14;
  void *v16;
  void *v17;
  void *context;
  uint64_t v19;
  uint64_t v20;
  uint8_t buf[16];

  v4 = a3;
  v17 = (void *)MEMORY[0x1D8236758]();
  objc_msgSend(MEMORY[0x1E0C99D68], "vs_currentDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v19 = 0;
  v7 = 0;
  v20 = *MEMORY[0x1E0C99778];
  v8 = *MEMORY[0x1E0C99768];
  v16 = v6;
  do
  {
    context = (void *)MEMORY[0x1D8236758]();
    v9 = 0;
    do
    {
      v10 = (void *)MEMORY[0x1D8236758]();
      if (!v6)
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v20, CFSTR("The currentContextOrNil parameter must not be nil."));
      v11 = v6;
      v12 = -[VSSubscriptionRegistry _saveChangesToContext:withDate:](self, "_saveChangesToContext:withDate:", v11, v5);
      v13 = v12;
      if (v12 == 2)
      {

        v6 = 0;
        v7 = 0;
      }
      else
      {
        if (v12 == 1)
        {
          VSDefaultLogObject();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D2419000, v14, OS_LOG_TYPE_DEFAULT, "Resolved constraint violation.  Will attempt to save again.", buf, 2u);
          }
          ++v9;

LABEL_13:
          v6 = v11;
          goto LABEL_17;
        }
        if (v12)
          goto LABEL_13;
        objc_msgSend(v11, "parentContext");
        v6 = (id)objc_claimAutoreleasedReturnValue();

        if (v6)
          ++v19;
        else
          -[VSSubscriptionRegistry _sendRemoteNotification](self, "_sendRemoteNotification");
        v7 = 1;
      }
LABEL_17:
      if (v9 >= 11)
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v8, CFSTR("Too many constraints resolved."));

      objc_autoreleasePoolPop(v10);
    }
    while (v13 == 1);
    if (v19 >= 2)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v8, CFSTR("Too many ancestor contexts."));
    objc_autoreleasePoolPop(context);
  }
  while (v6);

  objc_autoreleasePoolPop(v17);
  return v7 & 1;
}

- (int64_t)_saveChangesToContext:(id)a3 withDate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  int64_t v10;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1D8236758]();
  if (!v5)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The context parameter must not be nil."));
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __57__VSSubscriptionRegistry__saveChangesToContext_withDate___block_invoke;
  v12[3] = &unk_1E93A0488;
  v8 = v5;
  v13 = v8;
  v9 = v6;
  v14 = v9;
  v15 = &v16;
  objc_msgSend(v8, "performBlockAndWait:", v12);
  v10 = v17[3];

  _Block_object_dispose(&v16, 8);
  objc_autoreleasePoolPop(v7);

  return v10;
}

void __57__VSSubscriptionRegistry__saveChangesToContext_withDate___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  id v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t j;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  int v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  id v54;
  void *v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t k;
  NSObject *v61;
  void *v62;
  id obj;
  id v64;
  uint64_t v65;
  uint64_t v66;
  id v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  void *v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  id v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
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
  _BYTE v94[128];
  uint8_t v95[128];
  uint8_t buf[4];
  int v97;
  __int16 v98;
  id v99;
  _BYTE v100[128];
  uint64_t v101;

  v101 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(*(id *)(a1 + 32), "insertedObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unionSet:", v3);

  v74 = a1;
  objc_msgSend(*(id *)(a1 + 32), "updatedObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unionSet:", v4);

  v91 = 0u;
  v92 = 0u;
  v89 = 0u;
  v90 = 0u;
  v5 = v2;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v89, v100, 16);
  v72 = v5;
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v90;
    v9 = *MEMORY[0x1E0C99778];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v90 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * i);
        v12 = (void *)MEMORY[0x1D8236758]();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v13 = (void *)MEMORY[0x1E0C99DA0];
            v14 = (objc_class *)objc_opt_class();
            NSStringFromClass(v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = v13;
            v5 = v72;
            objc_msgSend(v16, "raise:format:", v9, CFSTR("Unexpectedly, object was %@, instead of VSPersistentSubscription."), v15);

          }
          objc_msgSend(v11, "setMostRecentSaveDate:", *(_QWORD *)(a1 + 40));
        }
        objc_autoreleasePoolPop(v12);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v89, v100, 16);
    }
    while (v7);
  }

  v17 = a1;
  v18 = *(void **)(a1 + 32);
  v88 = 0;
  v19 = objc_msgSend(v18, "save:", &v88);
  v20 = v88;
  VSDefaultLogObject();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    v97 = v19;
    v98 = 2112;
    v99 = v20;
    _os_log_impl(&dword_1D2419000, v21, OS_LOG_TYPE_DEFAULT, "_saveChangesToContext didSave %d,localError %@", buf, 0x12u);
  }

  if (v19)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    goto LABEL_62;
  }
  objc_msgSend(v20, "domain");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "isEqual:", *MEMORY[0x1E0CB28A8]))
  {
    v23 = objc_msgSend(v20, "code");

    if (v23 == 133021)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 2;
      objc_msgSend(v20, "userInfo");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectForKey:", *MEMORY[0x1E0C97980]);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_32);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = v25;
      objc_msgSend(v25, "filteredArrayUsingPredicate:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v86 = 0u;
      v87 = 0u;
      v84 = 0u;
      v85 = 0u;
      obj = v27;
      v66 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v95, 16);
      if (!v66)
        goto LABEL_57;
      v65 = *(_QWORD *)v85;
      v73 = *MEMORY[0x1E0C99778];
      v64 = v20;
      while (1)
      {
        for (j = 0; j != v66; ++j)
        {
          if (*(_QWORD *)v85 != v65)
            objc_enumerationMutation(obj);
          v29 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * j);
          v30 = (void *)MEMORY[0x1D8236758]();
          objc_msgSend(v29, "conflictingObjects");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = (void *)objc_msgSend(v31, "mutableCopy");

          objc_msgSend(v29, "databaseObject");
          v33 = objc_claimAutoreleasedReturnValue();
          if (v33)
            objc_msgSend(v32, "addObject:", v33);
          v71 = (void *)v33;
          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_36);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "filterUsingPredicate:", v34);

          v35 = v32;
          v36 = objc_msgSend(v35, "count");
          v37 = v36;
          if (!v36)
          {
            *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v17 + 48) + 8) + 24) = 2;
            goto LABEL_54;
          }
          v68 = v36;
          v69 = v30;
          v70 = j;
          v82 = 0u;
          v83 = 0u;
          v80 = 0u;
          v81 = 0u;
          v67 = v35;
          v38 = v35;
          v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v80, v94, 16);
          if (v39)
          {
            v40 = v39;
            v41 = 0;
            v42 = 0;
            v43 = *(_QWORD *)v81;
            v75 = v38;
            do
            {
              v44 = 0;
              v45 = v42;
              do
              {
                if (*(_QWORD *)v81 != v43)
                  objc_enumerationMutation(v75);
                v46 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * v44);
                if (!v45)
                  goto LABEL_33;
                objc_msgSend(*(id *)(*((_QWORD *)&v80 + 1) + 8 * v44), "creationDate");
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                v42 = v45;
                objc_msgSend(v42, "creationDate");
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                v49 = objc_msgSend(v47, "vs_isBefore:", v48);

                if (v49)
                {
LABEL_33:
                  v42 = v46;

                }
                if (!v41)
                  goto LABEL_38;
                objc_msgSend(v46, "mostRecentSaveDate");
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v41, "mostRecentSaveDate");
                v51 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v51)
                  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v73, CFSTR("The [mostRecentlyUpdatedSubscription mostRecentSaveDate] parameter must not be nil."));
                objc_msgSend(v41, "mostRecentSaveDate");
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                v53 = objc_msgSend(v50, "vs_isAfter:", v52);

                if (v53)
                {
LABEL_38:
                  v54 = v46;

                  v41 = v54;
                }
                ++v44;
                v45 = v42;
              }
              while (v40 != v44);
              v38 = v75;
              v40 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v80, v94, 16);
            }
            while (v40);

            v17 = v74;
            if (v41)
              goto LABEL_46;
          }
          else
          {

            v42 = 0;
          }
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v73, CFSTR("The mostRecentlyUpdatedSubscription parameter must not be nil."));
          v41 = 0;
LABEL_46:
          objc_msgSend(v38, "removeObject:", v41);
          objc_msgSend(v42, "creationDate");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "setCreationDate:", v55);

          v78 = 0u;
          v79 = 0u;
          v76 = 0u;
          v77 = 0u;
          v56 = v38;
          v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v76, v93, 16);
          if (v57)
          {
            v58 = v57;
            v59 = *(_QWORD *)v77;
            do
            {
              for (k = 0; k != v58; ++k)
              {
                if (*(_QWORD *)v77 != v59)
                  objc_enumerationMutation(v56);
                objc_msgSend(*(id *)(v17 + 32), "deleteObject:", *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * k));
              }
              v58 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v76, v93, 16);
            }
            while (v58);
          }

          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v17 + 48) + 8) + 24) = 1;
          v5 = v72;
          v20 = v64;
          v30 = v69;
          j = v70;
          v35 = v67;
          v37 = v68;
LABEL_54:

          objc_autoreleasePoolPop(v30);
          if (!v37)
            goto LABEL_57;
        }
        v66 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v95, 16);
        if (!v66)
        {
LABEL_57:

          goto LABEL_62;
        }
      }
    }
  }
  else
  {

  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 2;
  VSErrorLogObject();
  v61 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
    __57__VSSubscriptionRegistry__saveChangesToContext_withDate___block_invoke_cold_1();

LABEL_62:
}

uint64_t __57__VSSubscriptionRegistry__saveChangesToContext_withDate___block_invoke_31(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __57__VSSubscriptionRegistry__saveChangesToContext_withDate___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_subscriptionEntity
{
  return (id)+[VSPersistentSubscription entity](VSPersistentSubscription, "entity");
}

- (id)_fetchRequest
{
  void *v2;

  +[VSPersistentSubscription fetchRequest](VSPersistentSubscription, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIncludesPendingChanges:", 0);
  return v2;
}

- (id)_securityTaskForCurrentConnection
{
  return +[VSSecurityTask securityTaskForCurrentConnection](VSSecurityTask, "securityTaskForCurrentConnection");
}

- (id)_predicateForCurrentConnectionWithRequestKind:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSubscriptionRegistry _securityTaskForCurrentConnection](self, "_securityTaskForCurrentConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[VSSubscriptionRegistry predicateFactory](self, "predicateFactory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allowedSubscriptionsPredicateForRequestKind:fromTask:", a3, v6);
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v8;
  }

  return v5;
}

- (void)fetchActiveSubscriptionsWithOptions:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (v7)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The options parameter must not be nil."));
    if (v8)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The completionHandler parameter must not be nil."));
LABEL_3:
  VSDefaultLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v24 = "-[VSSubscriptionRegistry fetchActiveSubscriptionsWithOptions:completionHandler:]";
    _os_log_impl(&dword_1D2419000, v9, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  -[VSSubscriptionRegistry _securityTaskForCurrentConnection](self, "_securityTaskForCurrentConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("VSSubscriptionFetchOptionSubscriberIdentifierHashModifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 && (objc_msgSend(v10, "shouldAllowAccessToSubscriberIdentifierHashModifier:", v11) & 1) == 0)
  {

    v11 = 0;
  }
  -[VSSubscriptionRegistry predicateFactory](self, "predicateFactory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "subscriptionFetchPredicateForTask:withOptions:", v10, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __80__VSSubscriptionRegistry_fetchActiveSubscriptionsWithOptions_completionHandler___block_invoke;
  v18[3] = &unk_1E93A0500;
  v18[4] = self;
  v19 = v12;
  v20 = v13;
  v21 = v11;
  v22 = v8;
  v14 = v8;
  v15 = v11;
  v16 = v13;
  v17 = v12;
  -[VSSubscriptionRegistry _performBlock:](self, "_performBlock:", v18);

}

void __80__VSSubscriptionRegistry_fetchActiveSubscriptionsWithOptions_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;
  id v12;

  v4 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __80__VSSubscriptionRegistry_fetchActiveSubscriptionsWithOptions_completionHandler___block_invoke_2;
  v8[3] = &unk_1E93A04D8;
  v5 = *(void **)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v10 = *(id *)(a1 + 48);
  v11 = *(id *)(a1 + 56);
  v12 = *(id *)(a1 + 64);
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __80__VSSubscriptionRegistry_fetchActiveSubscriptionsWithOptions_completionHandler___block_invoke_2_67;
  v6[3] = &unk_1E939F2C0;
  v7 = *(id *)(a1 + 64);
  objc_msgSend(a2, "unwrapObject:error:", v8, v6);

}

void __80__VSSubscriptionRegistry_fetchActiveSubscriptionsWithOptions_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  NSObject *v2;
  NSObject *v3;
  uint64_t i;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  VSHash *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  id v28;
  id v29;
  NSObject *v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  id obj;
  id v37;
  void *v38;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *context;
  _QWORD v44[4];
  id v45;
  id v46;
  _QWORD v47[4];
  id v48;
  id v49;
  _QWORD v50[6];
  uint8_t v51;
  _BYTE v52[15];
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  id v57;
  __int128 buf;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  VSSubscription *v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v32 = a2;
  VSDefaultLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1D2419000, v2, OS_LOG_TYPE_DEFAULT, "Successfully obtained context.", (uint8_t *)&buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_subscriptionEntity");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "predicateByConvertingSubscriptionKeyPathsInPredicate:toAttributeKeysInEntity:", *(_QWORD *)(a1 + 48), v38);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_fetchRequest");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setPredicate:", v33);
  VSDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1D2419000, v3, OS_LOG_TYPE_DEFAULT, "Will execute fetch request", (uint8_t *)&buf, 2u);
  }

  v57 = 0;
  objc_msgSend(v32, "executeFetchRequest:error:", v35, &v57);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v57;
  if (v34)
  {
    v37 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    obj = v34;
    v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
    if (v42)
    {
      v40 = 0;
      v41 = *(_QWORD *)v54;
      do
      {
        for (i = 0; i != v42; ++i)
        {
          if (*(_QWORD *)v54 != v41)
            objc_enumerationMutation(obj);
          v5 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
          context = (void *)MEMORY[0x1D8236758]();
          VSDefaultLogObject();
          v6 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v5, "committedValuesForKeys:", 0);
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(buf) = 138412290;
            *(_QWORD *)((char *)&buf + 4) = v7;
            _os_log_impl(&dword_1D2419000, v6, OS_LOG_TYPE_DEFAULT, "Result: %@", (uint8_t *)&buf, 0xCu);

          }
          VSDefaultLogObject();
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v5, "objectID");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            v10 = objc_msgSend(v9, "isTemporaryID");
            LODWORD(buf) = 134217984;
            *(_QWORD *)((char *)&buf + 4) = v10;
            _os_log_impl(&dword_1D2419000, v8, OS_LOG_TYPE_DEFAULT, "Subscription isTemporary=%lu", (uint8_t *)&buf, 0xCu);

          }
          objc_msgSend(v5, "sourceKind");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v11 == 0;

          if (v12)
          {
            VSErrorLogObject();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              __80__VSSubscriptionRegistry_fetchActiveSubscriptionsWithOptions_completionHandler___block_invoke_2_cold_3(&v51, v52, v25);

            ++v40;
          }
          else
          {
            *(_QWORD *)&buf = 0;
            *((_QWORD *)&buf + 1) = &buf;
            v59 = 0x3032000000;
            v60 = __Block_byref_object_copy__9;
            v61 = __Block_byref_object_dispose__9;
            v62 = objc_alloc_init(VSSubscription);
            objc_msgSend(v37, "addObject:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));
            objc_msgSend(v38, "attributesByName");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v50[0] = MEMORY[0x1E0C809B0];
            v50[1] = 3221225472;
            v50[2] = __80__VSSubscriptionRegistry_fetchActiveSubscriptionsWithOptions_completionHandler___block_invoke_52;
            v50[3] = &unk_1E93A04B0;
            v50[4] = v5;
            v50[5] = &buf;
            objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v50);

            objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "subscriberIdentifierHash");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v14, "length") && objc_msgSend(*(id *)(a1 + 56), "length"))
            {
              v15 = objc_alloc_init(VSHash);
              -[VSHash updateWithString:](v15, "updateWithString:", v14);
              -[VSHash updateWithString:](v15, "updateWithString:", *(_QWORD *)(a1 + 56));
              v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("3AE626BD-CE1D-4C64-94CB-ED0095DE91EC"));
              +[VSOptional optionalWithObject:](VSOptional, "optionalWithObject:", v16);
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v17, "forceUnwrapObject");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              -[VSHash updateWithUUID:](v15, "updateWithUUID:", v18);

              -[VSHash finalData](v15, "finalData");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3B20], "valueTransformerForName:", CFSTR("VSBase64DataValueTransformer"));
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "transformedValue:", v19);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              +[VSOptional optionalWithObject:](VSOptional, "optionalWithObject:", v21);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = *(void **)(*((_QWORD *)&buf + 1) + 40);
              objc_msgSend(v22, "forceUnwrapObject");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "setSubscriberIdentifierHash:", v24);

            }
            _Block_object_dispose(&buf, 8);

          }
          objc_autoreleasePoolPop(context);
        }
        v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
      }
      while (v42);

      if (!v40)
        goto LABEL_30;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Skipped %lu empty objects."), v40);
      obj = (id)objc_claimAutoreleasedReturnValue();
      VSErrorLogObject();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
        __80__VSSubscriptionRegistry_fetchActiveSubscriptionsWithOptions_completionHandler___block_invoke_2_cold_2();

    }
LABEL_30:
    VSDefaultLogObject();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v37;
      _os_log_impl(&dword_1D2419000, v27, OS_LOG_TYPE_DEFAULT, "Will return matching subscriptions: %@", (uint8_t *)&buf, 0xCu);
    }

    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __80__VSSubscriptionRegistry_fetchActiveSubscriptionsWithOptions_completionHandler___block_invoke_65;
    v47[3] = &unk_1E939F1A8;
    v28 = *(id *)(a1 + 64);
    v48 = v37;
    v49 = v28;
    v29 = v37;
    VSPerformCompletionHandler(v47);

    goto LABEL_36;
  }
  VSErrorLogObject();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    __80__VSSubscriptionRegistry_fetchActiveSubscriptionsWithOptions_completionHandler___block_invoke_2_cold_1();

  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __80__VSSubscriptionRegistry_fetchActiveSubscriptionsWithOptions_completionHandler___block_invoke_66;
  v44[3] = &unk_1E939F1A8;
  v46 = *(id *)(a1 + 64);
  v45 = v31;
  VSPerformCompletionHandler(v44);

  v29 = v46;
LABEL_36:

}

void __80__VSSubscriptionRegistry_fetchActiveSubscriptionsWithOptions_completionHandler___block_invoke_52(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1D8236758]();
  if (objc_msgSend(v6, "vs_isSuitableForPurpose:", 4))
  {
    objc_msgSend(v6, "vs_subscriptionKeyPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 32), "valueForKey:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      VSDefaultLogObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 138412546;
        v12 = v9;
        v13 = 2112;
        v14 = v8;
        _os_log_impl(&dword_1D2419000, v10, OS_LOG_TYPE_DEFAULT, "Will set value %@ for key path %@", (uint8_t *)&v11, 0x16u);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setValue:forKeyPath:", v9, v8);
    }

  }
  objc_autoreleasePoolPop(v7);

}

uint64_t __80__VSSubscriptionRegistry_fetchActiveSubscriptionsWithOptions_completionHandler___block_invoke_65(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __80__VSSubscriptionRegistry_fetchActiveSubscriptionsWithOptions_completionHandler___block_invoke_66(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "vs_secureCodingSafeError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __80__VSSubscriptionRegistry_fetchActiveSubscriptionsWithOptions_completionHandler___block_invoke_2_67(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  VSErrorLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __80__VSSubscriptionRegistry_fetchActiveSubscriptionsWithOptions_completionHandler___block_invoke_2_67_cold_1();

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __80__VSSubscriptionRegistry_fetchActiveSubscriptionsWithOptions_completionHandler___block_invoke_68;
  v7[3] = &unk_1E939F1A8;
  v5 = *(id *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  VSPerformCompletionHandler(v7);

}

void __80__VSSubscriptionRegistry_fetchActiveSubscriptionsWithOptions_completionHandler___block_invoke_68(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "vs_secureCodingSafeError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

- (void)registerSubscription:(id)a3
{
  -[VSSubscriptionRegistry registerSubscription:withCompletionHandler:](self, "registerSubscription:withCompletionHandler:", a3, 0);
}

- (void)registerSubscription:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  char *v10;
  NSObject *v11;
  void *v12;
  char *v13;
  NSObject *v14;
  _QWORD v15[4];
  char *v16;
  _QWORD v17[5];
  char *v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void *)MEMORY[0x1D8236758]();
  v8 = a3;
  VSDefaultLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v21 = "-[VSSubscriptionRegistry registerSubscription:withCompletionHandler:]";
    _os_log_impl(&dword_1D2419000, v9, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  v10 = (char *)objc_msgSend(v8, "copy");
  VSDefaultLogObject();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v10;
    _os_log_impl(&dword_1D2419000, v11, OS_LOG_TYPE_DEFAULT, "Provided subscription: %@", buf, 0xCu);
  }

  -[VSSubscriptionRegistry _predicateForCurrentConnectionWithRequestKind:](self, "_predicateForCurrentConnectionWithRequestKind:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "evaluateWithObject:", v10))
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __69__VSSubscriptionRegistry_registerSubscription_withCompletionHandler___block_invoke;
    v17[3] = &unk_1E93A0528;
    v17[4] = self;
    v18 = v10;
    v19 = v6;
    -[VSSubscriptionRegistry _performBlock:](self, "_performBlock:", v17);

    v13 = v18;
LABEL_11:

    goto LABEL_12;
  }
  VSErrorLogObject();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    -[VSSubscriptionRegistry registerSubscription:withCompletionHandler:].cold.1();

  if (v6)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __69__VSSubscriptionRegistry_registerSubscription_withCompletionHandler___block_invoke_73;
    v15[3] = &unk_1E939F2E8;
    v16 = (char *)v6;
    VSPerformCompletionHandler(v15);
    v13 = v16;
    goto LABEL_11;
  }
LABEL_12:

  objc_autoreleasePoolPop(v7);
}

void __69__VSSubscriptionRegistry_registerSubscription_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v6 = a2;
  v3 = (void *)MEMORY[0x1D8236758]();
  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __69__VSSubscriptionRegistry_registerSubscription_withCompletionHandler___block_invoke_2;
  v9[3] = &unk_1E93A0318;
  v5 = *(void **)(a1 + 40);
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v5;
  v11 = *(id *)(a1 + 48);
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __69__VSSubscriptionRegistry_registerSubscription_withCompletionHandler___block_invoke_2_71;
  v7[3] = &unk_1E939F2C0;
  v8 = *(id *)(a1 + 48);
  objc_msgSend(v6, "unwrapObject:error:", v9, v7);

  objc_autoreleasePoolPop(v3);
}

void __69__VSSubscriptionRegistry_registerSubscription_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  VSPersistentSubscription *v6;
  void *v7;
  uint64_t v8;
  VSPersistentSubscription *v9;
  NSObject *v10;
  NSObject *v11;
  uint32_t v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  id *v17;
  _QWORD v18[5];
  _QWORD v19[5];
  uint8_t buf[16];
  _QWORD v21[4];
  id v22;
  VSPersistentSubscription *v23;

  v3 = a2;
  v4 = (void *)MEMORY[0x1D8236758]();
  objc_msgSend(*(id *)(a1 + 32), "_subscriptionEntity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[VSPersistentSubscription initWithEntity:insertIntoManagedObjectContext:]([VSPersistentSubscription alloc], "initWithEntity:insertIntoManagedObjectContext:", v5, v3);
  objc_msgSend(v5, "attributesByName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __69__VSSubscriptionRegistry_registerSubscription_withCompletionHandler___block_invoke_3;
  v21[3] = &unk_1E939F248;
  v22 = *(id *)(a1 + 40);
  v9 = v6;
  v23 = v9;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v21);

  VSDefaultLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D2419000, v10, OS_LOG_TYPE_DEFAULT, "Will attempt to persist registration", buf, 2u);
  }

  if (objc_msgSend(*(id *)(a1 + 32), "_saveChangesToContext:", v3))
  {
    VSDefaultLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D2419000, v11, OS_LOG_TYPE_DEFAULT, "Will send registration notification", buf, 2u);
    }

    v12 = notify_post("com.apple.VideoSubscriberAccount.DidRegisterSubscription");
    if (v12)
    {
      v13 = v12;
      VSErrorLogObject();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        __69__VSSubscriptionRegistry_registerSubscription_withCompletionHandler___block_invoke_2_cold_1(v13, v14);
    }
    else
    {
      VSDefaultLogObject();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D2419000, v14, OS_LOG_TYPE_DEFAULT, "Did send registration notification", buf, 2u);
      }
    }

    v16 = *(void **)(a1 + 48);
    if (v16)
    {
      v19[0] = v8;
      v19[1] = 3221225472;
      v19[2] = __69__VSSubscriptionRegistry_registerSubscription_withCompletionHandler___block_invoke_69;
      v19[3] = &unk_1E939F2E8;
      v17 = (id *)v19;
      goto LABEL_17;
    }
  }
  else
  {
    VSErrorLogObject();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      __69__VSSubscriptionRegistry_registerSubscription_withCompletionHandler___block_invoke_2_cold_2();

    v16 = *(void **)(a1 + 48);
    if (v16)
    {
      v18[0] = v8;
      v18[1] = 3221225472;
      v18[2] = __69__VSSubscriptionRegistry_registerSubscription_withCompletionHandler___block_invoke_70;
      v18[3] = &unk_1E939F2E8;
      v17 = (id *)v18;
LABEL_17:
      v17[4] = v16;
      VSPerformCompletionHandler(v17);

    }
  }

  objc_autoreleasePoolPop(v4);
}

void __69__VSSubscriptionRegistry_registerSubscription_withCompletionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v6, "vs_isSuitableForPurpose:", 2))
  {
    v7 = (void *)MEMORY[0x1D8236758]();
    objc_msgSend(v6, "vs_subscriptionKeyPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 32), "valueForKeyPath:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      VSDefaultLogObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 138412802;
        v12 = v9;
        v13 = 2112;
        v14 = v8;
        v15 = 2112;
        v16 = v5;
        _os_log_impl(&dword_1D2419000, v10, OS_LOG_TYPE_DEFAULT, "Using subscription value %@ for key %@ as value for persistent name %@.", (uint8_t *)&v11, 0x20u);
      }

      objc_msgSend(*(id *)(a1 + 40), "setValue:forKey:", v9, v5);
    }

    objc_autoreleasePoolPop(v7);
  }

}

uint64_t __69__VSSubscriptionRegistry_registerSubscription_withCompletionHandler___block_invoke_69(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __69__VSSubscriptionRegistry_registerSubscription_withCompletionHandler___block_invoke_70(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __69__VSSubscriptionRegistry_registerSubscription_withCompletionHandler___block_invoke_2_71(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  VSErrorLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __80__VSSubscriptionRegistry_fetchActiveSubscriptionsWithOptions_completionHandler___block_invoke_2_67_cold_1();

  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __69__VSSubscriptionRegistry_registerSubscription_withCompletionHandler___block_invoke_72;
    v6[3] = &unk_1E939F2E8;
    v7 = v5;
    VSPerformCompletionHandler(v6);

  }
}

uint64_t __69__VSSubscriptionRegistry_registerSubscription_withCompletionHandler___block_invoke_72(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __69__VSSubscriptionRegistry_registerSubscription_withCompletionHandler___block_invoke_73(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_predicateForPersistentAttributesOfSubscriptions:(id)a3 withEntity:(id)a4 forFiltering:(BOOL)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id obj;
  _QWORD v23[5];
  id v24;
  BOOL v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v7;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v27;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v27 != v12)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v13);
        v15 = (void *)MEMORY[0x1D8236758]();
        v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_msgSend(v8, "attributesByName");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __99__VSSubscriptionRegistry__predicateForPersistentAttributesOfSubscriptions_withEntity_forFiltering___block_invoke;
        v23[3] = &unk_1E93A0550;
        v25 = a5;
        v23[4] = v14;
        v24 = v16;
        v18 = v16;
        objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v23);

        objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v19);

        objc_autoreleasePoolPop(v15);
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v11);
  }

  objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

void __99__VSSubscriptionRegistry__predicateForPersistentAttributesOfSubscriptions_withEntity_forFiltering___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  v6 = objc_msgSend(v5, "vs_isSuitableForPurpose:", 1);
  if (*(_BYTE *)(a1 + 48))
  {
    if (!v6)
      goto LABEL_9;
  }
  else if (!v6 || objc_msgSend(v5, "attributeType") == 1800)
  {
    goto LABEL_9;
  }
  objc_msgSend(v5, "vs_subscriptionKeyPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "valueForKeyPath:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %@"), v10, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);

  }
LABEL_9:

}

- (void)removeSubscriptions:(id)a3
{
  -[VSSubscriptionRegistry removeSubscriptions:withCompletionHandler:](self, "removeSubscriptions:withCompletionHandler:", a3, 0);
}

- (void)removeSubscriptions:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  VSDefaultLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v19 = "-[VSSubscriptionRegistry removeSubscriptions:withCompletionHandler:]";
    _os_log_impl(&dword_1D2419000, v8, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  -[VSSubscriptionRegistry _predicateForCurrentConnectionWithRequestKind:](self, "_predicateForCurrentConnectionWithRequestKind:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "filteredArrayUsingPredicate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "count"))
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __68__VSSubscriptionRegistry_removeSubscriptions_withCompletionHandler___block_invoke;
    v15[3] = &unk_1E93A0528;
    v15[4] = self;
    v16 = v10;
    v17 = v6;
    -[VSSubscriptionRegistry _performBlock:](self, "_performBlock:", v15);

    v11 = v16;
LABEL_9:

    goto LABEL_10;
  }
  VSErrorLogObject();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    -[VSSubscriptionRegistry removeSubscriptions:withCompletionHandler:].cold.1();

  if (v6)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __68__VSSubscriptionRegistry_removeSubscriptions_withCompletionHandler___block_invoke_84;
    v13[3] = &unk_1E939F2E8;
    v14 = v6;
    VSPerformCompletionHandler(v13);
    v11 = v14;
    goto LABEL_9;
  }
LABEL_10:

}

void __68__VSSubscriptionRegistry_removeSubscriptions_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v4 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__VSSubscriptionRegistry_removeSubscriptions_withCompletionHandler___block_invoke_2;
  v8[3] = &unk_1E93A0318;
  v5 = *(void **)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v10 = *(id *)(a1 + 48);
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __68__VSSubscriptionRegistry_removeSubscriptions_withCompletionHandler___block_invoke_2_82;
  v6[3] = &unk_1E939F2C0;
  v7 = *(id *)(a1 + 48);
  objc_msgSend(a2, "unwrapObject:error:", v8, v6);

}

void __68__VSSubscriptionRegistry_removeSubscriptions_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  id *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[5];
  _QWORD v40[5];
  _QWORD v41[5];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  id v46;
  uint8_t buf[4];
  uint64_t v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v34 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_fetchRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "entity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_predicateForPersistentAttributesOfSubscriptions:withEntity:forFiltering:", *(_QWORD *)(a1 + 40), v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPredicate:", v5);
  VSDefaultLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D2419000, v6, OS_LOG_TYPE_DEFAULT, "Will execute fetch request", buf, 2u);
  }

  v46 = 0;
  objc_msgSend(v34, "executeFetchRequest:error:", v3, &v46);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v46;
  if (v7)
  {
    if (objc_msgSend(v7, "count"))
    {
      v33 = a1;
      objc_msgSend(*(id *)(a1 + 32), "_predicateForPersistentAttributesOfSubscriptions:withEntity:forFiltering:", *(_QWORD *)(a1 + 40), v4, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      v10 = v7;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
      if (v11)
      {
        v12 = v11;
        v28 = v8;
        v29 = v7;
        v30 = v5;
        v31 = v4;
        v32 = v3;
        v13 = 0;
        v14 = *(_QWORD *)v43;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v43 != v14)
              objc_enumerationMutation(v10);
            v16 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i);
            if (objc_msgSend(v9, "evaluateWithObject:", v16, v28, v29, v30, v31, v32))
            {
              objc_msgSend(v34, "deleteObject:", v16);
              v13 = 1;
            }
            else
            {
              VSDefaultLogObject();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v48 = v16;
                _os_log_impl(&dword_1D2419000, v17, OS_LOG_TYPE_DEFAULT, "Fetched object %@ does not match in-memory filter.", buf, 0xCu);
              }

            }
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
        }
        while (v12);

        v4 = v31;
        v3 = v32;
        v7 = v29;
        v5 = v30;
        v8 = v28;
        if ((v13 & 1) != 0)
        {
          VSDefaultLogObject();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D2419000, v18, OS_LOG_TYPE_DEFAULT, "Will attempt to persist removal of subscriptions.", buf, 2u);
          }

          if (objc_msgSend(*(id *)(v33 + 32), "_saveChangesToContext:", v34))
          {
            VSDefaultLogObject();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D2419000, v19, OS_LOG_TYPE_DEFAULT, "Did remove subscriptions.", buf, 2u);
            }

            v20 = *(void **)(v33 + 48);
            if (!v20)
              goto LABEL_39;
            v41[0] = MEMORY[0x1E0C809B0];
            v41[1] = 3221225472;
            v41[2] = __68__VSSubscriptionRegistry_removeSubscriptions_withCompletionHandler___block_invoke_77;
            v41[3] = &unk_1E939F2E8;
            v21 = (id *)v41;
          }
          else
          {
            VSErrorLogObject();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              __68__VSSubscriptionRegistry_removeSubscriptions_withCompletionHandler___block_invoke_2_cold_3();

            v20 = *(void **)(v33 + 48);
            if (!v20)
              goto LABEL_39;
            v40[0] = MEMORY[0x1E0C809B0];
            v40[1] = 3221225472;
            v40[2] = __68__VSSubscriptionRegistry_removeSubscriptions_withCompletionHandler___block_invoke_78;
            v40[3] = &unk_1E939F2E8;
            v21 = (id *)v40;
          }
          goto LABEL_38;
        }
      }
      else
      {

      }
      VSErrorLogObject();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        __68__VSSubscriptionRegistry_removeSubscriptions_withCompletionHandler___block_invoke_2_cold_2();

      v20 = *(void **)(v33 + 48);
      if (!v20)
        goto LABEL_39;
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __68__VSSubscriptionRegistry_removeSubscriptions_withCompletionHandler___block_invoke_79;
      v39[3] = &unk_1E939F2E8;
      v21 = (id *)v39;
LABEL_38:
      v21[4] = v20;
      VSPerformCompletionHandler(v21);

      goto LABEL_39;
    }
    VSDefaultLogObject();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D2419000, v24, OS_LOG_TYPE_DEFAULT, "No matching subscriptions to remove.", buf, 2u);
    }

    v25 = *(void **)(a1 + 48);
    if (v25)
    {
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __68__VSSubscriptionRegistry_removeSubscriptions_withCompletionHandler___block_invoke_80;
      v37[3] = &unk_1E939F2E8;
      v38 = v25;
      VSPerformCompletionHandler(v37);
      v9 = v38;
      goto LABEL_39;
    }
  }
  else
  {
    VSErrorLogObject();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      __68__VSSubscriptionRegistry_removeSubscriptions_withCompletionHandler___block_invoke_2_cold_1();

    v23 = *(void **)(a1 + 48);
    if (v23)
    {
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __68__VSSubscriptionRegistry_removeSubscriptions_withCompletionHandler___block_invoke_81;
      v35[3] = &unk_1E939F2E8;
      v36 = v23;
      VSPerformCompletionHandler(v35);
      v9 = v36;
LABEL_39:

    }
  }

}

uint64_t __68__VSSubscriptionRegistry_removeSubscriptions_withCompletionHandler___block_invoke_77(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __68__VSSubscriptionRegistry_removeSubscriptions_withCompletionHandler___block_invoke_78(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __68__VSSubscriptionRegistry_removeSubscriptions_withCompletionHandler___block_invoke_79(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __68__VSSubscriptionRegistry_removeSubscriptions_withCompletionHandler___block_invoke_80(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __68__VSSubscriptionRegistry_removeSubscriptions_withCompletionHandler___block_invoke_81(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __68__VSSubscriptionRegistry_removeSubscriptions_withCompletionHandler___block_invoke_2_82(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  VSErrorLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __80__VSSubscriptionRegistry_fetchActiveSubscriptionsWithOptions_completionHandler___block_invoke_2_67_cold_1();

  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __68__VSSubscriptionRegistry_removeSubscriptions_withCompletionHandler___block_invoke_83;
    v6[3] = &unk_1E939F2E8;
    v7 = v5;
    VSPerformCompletionHandler(v6);

  }
}

uint64_t __68__VSSubscriptionRegistry_removeSubscriptions_withCompletionHandler___block_invoke_83(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __68__VSSubscriptionRegistry_removeSubscriptions_withCompletionHandler___block_invoke_84(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setRemoteNotifier:(id)a3
{
  objc_storeStrong((id *)&self->_remoteNotifier, a3);
}

- (void)setPersistentContainer:(id)a3
{
  objc_storeStrong((id *)&self->_persistentContainer, a3);
}

- (void)setPredicateFactory:(id)a3
{
  objc_storeStrong((id *)&self->_predicateFactory, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predicateFactory, 0);
  objc_storeStrong((id *)&self->_persistentContainer, 0);
  objc_storeStrong((id *)&self->_remoteNotifier, 0);
}

void __57__VSSubscriptionRegistry__saveChangesToContext_withDate___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1D2419000, v0, v1, "Error saving changes: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __80__VSSubscriptionRegistry_fetchActiveSubscriptionsWithOptions_completionHandler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1D2419000, v0, v1, "Error fetching subscriptions: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __80__VSSubscriptionRegistry_fetchActiveSubscriptionsWithOptions_completionHandler___block_invoke_2_cold_2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_0();
  _os_log_fault_impl(&dword_1D2419000, v0, OS_LOG_TYPE_FAULT, "%@", v1, 0xCu);
  OUTLINED_FUNCTION_3();
}

void __80__VSSubscriptionRegistry_fetchActiveSubscriptionsWithOptions_completionHandler___block_invoke_2_cold_3(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1D2419000, log, OS_LOG_TYPE_ERROR, "Skipping empty object.", buf, 2u);
}

void __80__VSSubscriptionRegistry_fetchActiveSubscriptionsWithOptions_completionHandler___block_invoke_2_67_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1D2419000, v0, v1, "Error obtaining context: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)registerSubscription:withCompletionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_1D2419000, v0, v1, "Caller lacks ability to modify subscription.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __69__VSSubscriptionRegistry_registerSubscription_withCompletionHandler___block_invoke_2_cold_1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1D2419000, a2, OS_LOG_TYPE_ERROR, "Error sending registration notification: %d", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_2_0();
}

void __69__VSSubscriptionRegistry_registerSubscription_withCompletionHandler___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_1D2419000, v0, v1, "Unable to register subscription", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)removeSubscriptions:withCompletionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_1D2419000, v0, v1, "No filtered subscriptions to remove.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __68__VSSubscriptionRegistry_removeSubscriptions_withCompletionHandler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1D2419000, v0, v1, "Unable to execute fetch request: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __68__VSSubscriptionRegistry_removeSubscriptions_withCompletionHandler___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_1D2419000, v0, v1, "Nothing to delete.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __68__VSSubscriptionRegistry_removeSubscriptions_withCompletionHandler___block_invoke_2_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_1D2419000, v0, v1, "Unable to remove subscriptions", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

@end

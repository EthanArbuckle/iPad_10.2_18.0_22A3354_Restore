@implementation FCPrivateChannelMembershipController

id __60__FCPrivateChannelMembershipController_membershipChannelIDs__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v2 = (void *)objc_opt_new();
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    v4 = *(void **)(v3 + 96);
  else
    v4 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__FCPrivateChannelMembershipController_membershipChannelIDs__block_invoke_2;
  v7[3] = &unk_1E463D820;
  v5 = v2;
  v8 = v5;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v7);

  return v5;
}

- (void)setMembershipsByChannelID:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 96), a2);
}

void __80__FCPrivateChannelMembershipController__refreshPublicMembershipsWithCompletion___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[13];
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "membershipID", (_QWORD)v10);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v9);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

void __64__FCPrivateChannelMembershipController_loadLocalCachesFromStore__block_invoke(uint64_t a1)
{
  -[FCPrivateChannelMembershipController setMembershipsByChannelID:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

+ (BOOL)requiresHighPriorityFirstSync
{
  return 0;
}

+ (unint64_t)localStoreVersion
{
  return 1;
}

+ (id)localStoreFilename
{
  return CFSTR("private-channel-membership-list");
}

+ (id)commandStoreFileName
{
  return CFSTR("private-channel-membership-commands");
}

+ (int64_t)commandQueueUrgency
{
  return 1;
}

- (void)activityObservingApplicationWindowDidBecomeForeground
{
  if (self)
    -[FCPrivateChannelMembershipController _refreshPublicMembershipsWithCompletion:](self, 0);
}

- (id)membershipChannelIDs
{
  FCMTWriterLock *membershipsLock;
  FCMTWriterLock *v3;
  void *v4;
  _QWORD v6[5];

  if (self)
    membershipsLock = self->_membershipsLock;
  else
    membershipsLock = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__FCPrivateChannelMembershipController_membershipChannelIDs__block_invoke;
  v6[3] = &unk_1E463B350;
  v6[4] = self;
  v3 = membershipsLock;
  -[FCMTWriterLock readObject:](v3, "readObject:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)loadLocalCachesFromStore
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  void *v12;
  id v13;
  FCReferenceToMembership *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  objc_class *v20;
  char *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  void *v36;
  FCMTWriterLock *membershipsLock;
  uint64_t v38;
  id v39;
  void *v40;
  _QWORD v41[5];
  _QWORD v42[5];
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t v52[128];
  uint8_t buf[4];
  const char *v54;
  __int16 v55;
  char *v56;
  __int16 v57;
  int v58;
  __int16 v59;
  void *v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCPrivateDataController localStore](self, "localStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
  v40 = v3;
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v49;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v49 != v8)
          objc_enumerationMutation(v5);
        v10 = *(char **)(*((_QWORD *)&v48 + 1) + 8 * v9);
        if ((objc_msgSend((id)objc_opt_class(), "isLocalStoreKeyInternal:", v10) & 1) == 0)
        {
          objc_opt_class();
          objc_msgSend(v4, "objectForKeyedSubscript:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v12 = v11;
            else
              v12 = 0;
          }
          else
          {
            v12 = 0;
          }
          v13 = v12;

          if (v13)
          {
            v14 = -[FCReferenceToMembership initWithIdentifier:dictionaryRepresentation:]([FCReferenceToMembership alloc], "initWithIdentifier:dictionaryRepresentation:", v10, v13);
            if (v14)
            {
              -[FCPrivateChannelMembershipController addItem:toStore:](self, v14, 0);
              -[FCReferenceToMembership membershipID](v14, "membershipID");
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v15 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              {
                v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "reference.membershipID");
                *(_DWORD *)buf = 136315906;
                v54 = "-[FCPrivateChannelMembershipController loadLocalCachesFromStore]";
                v55 = 2080;
                v56 = "FCPrivateChannelMembershipController.m";
                v57 = 1024;
                v58 = 355;
                v59 = 2114;
                v60 = v22;
                _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

              }
              -[FCReferenceToMembership membershipID](v14, "membershipID");
              v16 = (void *)objc_claimAutoreleasedReturnValue();

              if (v16)
              {
                -[FCReferenceToMembership membershipID](v14, "membershipID");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v3, "addObject:", v17);
                goto LABEL_19;
              }
            }
            else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "reference");
              *(_DWORD *)buf = 136315906;
              v54 = "-[FCPrivateChannelMembershipController loadLocalCachesFromStore]";
              v55 = 2080;
              v56 = "FCPrivateChannelMembershipController.m";
              v57 = 1024;
              v58 = 350;
              v59 = 2114;
              v60 = v17;
              _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
LABEL_19:

            }
          }
          else
          {
            v18 = (void *)FCDefaultLog;
            if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
            {
              v19 = v18;
              v20 = (objc_class *)objc_opt_class();
              NSStringFromClass(v20);
              v21 = (char *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v54 = v21;
              v55 = 2114;
              v56 = v10;
              _os_log_error_impl(&dword_1A1B90000, v19, OS_LOG_TYPE_ERROR, "ERROR: Object of type %{public}@ is not dictionary for key %{public}@", buf, 0x16u);

              v3 = v40;
            }
          }

        }
        ++v9;
      }
      while (v7 != v9);
      v23 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
      v7 = v23;
    }
    while (v23);
  }

  -[FCPrivateDataController context](self, "context");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "internalContentContext");
  v25 = v3;
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "channelMembershipController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v27, "cachedChannelMembershipsForIDs:", v25);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v30 = v28;
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v32; ++i)
      {
        if (*(_QWORD *)v45 != v33)
          objc_enumerationMutation(v30);
        objc_msgSend(v30, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "channelID");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setObject:forKey:", v35, v36);

      }
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
    }
    while (v32);
  }

  if (self)
    membershipsLock = self->_membershipsLock;
  else
    membershipsLock = 0;
  v38 = MEMORY[0x1E0C809B0];
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __64__FCPrivateChannelMembershipController_loadLocalCachesFromStore__block_invoke;
  v42[3] = &unk_1E463AD10;
  v42[4] = self;
  v43 = v29;
  v39 = v29;
  -[FCMTWriterLock performWriteSync:](membershipsLock, "performWriteSync:", v42);
  v41[0] = v38;
  v41[1] = 3221225472;
  v41[2] = __64__FCPrivateChannelMembershipController_loadLocalCachesFromStore__block_invoke_2;
  v41[3] = &unk_1E463AB18;
  v41[4] = self;
  +[FCTaskScheduler scheduleLowPriorityBlockForMainThread:](FCTaskScheduler, "scheduleLowPriorityBlockForMainThread:", v41);

}

- (void)_refreshPublicMembershipsWithCompletion:(_QWORD *)a1
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, void *);
  void *v19;
  _QWORD *v20;
  id v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[5];
  uint64_t *v25;

  v3 = a2;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)a1[14];
    v6 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __80__FCPrivateChannelMembershipController__refreshPublicMembershipsWithCompletion___block_invoke;
    v22[3] = &unk_1E463AD10;
    v22[4] = a1;
    v23 = v4;
    v7 = v4;
    objc_msgSend(v5, "performReadSync:", v22);
    v16 = v6;
    v17 = 3221225472;
    v18 = __80__FCPrivateChannelMembershipController__refreshPublicMembershipsWithCompletion___block_invoke_2;
    v19 = &unk_1E463B858;
    v20 = a1;
    v21 = v3;
    v8 = &v16;
    v9 = (void *)MEMORY[0x1E0C80D38];
    v10 = MEMORY[0x1E0C80D38];
    v11 = v7;
    objc_msgSend(a1, "context", v16, v17, v18, v19, v20);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "internalContentContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "channelMembershipController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v24[0] = v6;
    v24[1] = 3221225472;
    v24[2] = __86__FCPrivateChannelMembershipController_fetchMembershipsWithIDs_queue_completionBlock___block_invoke;
    v24[3] = &unk_1E463D848;
    v24[4] = a1;
    v15 = v8;
    v25 = v15;
    objc_msgSend(v14, "fetchChannelMembershipsForIDs:maximumCachedAge:callbackQueue:completionHandler:", v11, v9, v24, 1.0);

  }
}

void __86__FCPrivateChannelMembershipController_fetchMembershipsWithIDs_queue_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  FCRemoveReferenceToChannelMembershipCommand *v13;
  void *v14;
  FCRemoveReferenceToChannelMembershipCommand *v15;
  _QWORD *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v26 = a2;
  v7 = a3;
  v27 = a4;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v33;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v33 != v10)
          objc_enumerationMutation(v7);
        -[FCPrivateChannelMembershipController referenceToMembershipForMembershipID:](*(_QWORD **)(a1 + 32), *(void **)(*((_QWORD *)&v32 + 1) + 8 * v11));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v13 = [FCRemoveReferenceToChannelMembershipCommand alloc];
          objc_msgSend(v12, "identifier", v26);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = -[FCRemoveReferenceToChannelMembershipCommand initWithReferenceToChannelMembershipID:](v13, "initWithReferenceToChannelMembershipID:", v14);

          objc_msgSend(*(id *)(a1 + 32), "addCommandToCommandQueue:", v15);
          v16 = *(_QWORD **)(a1 + 32);
          objc_msgSend(v12, "identifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[FCPrivateChannelMembershipController removeItemWithItemID:](v16, v17);

        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v9);
  }
  v18 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v19 = v26;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v29;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v29 != v22)
          objc_enumerationMutation(v19);
        objc_msgSend(v19, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v23), v26);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "channelID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setObject:forKey:", v24, v25);

        ++v23;
      }
      while (v21 != v23);
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v21);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __80__FCPrivateChannelMembershipController__refreshPublicMembershipsWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t k;
  void *v37;
  uint64_t v38;
  void *v39;
  id v40;
  id v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  _QWORD v47[5];
  id v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
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
  __int128 v67;
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    v50 = 0;
    v51 = &v50;
    v52 = 0x3032000000;
    v53 = __Block_byref_object_copy__12;
    v54 = __Block_byref_object_dispose__12;
    v55 = 0;
    v42 = a1;
    v7 = *(_QWORD **)(a1 + 32);
    if (v7)
      v7 = (_QWORD *)v7[14];
    v8 = v7;
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __80__FCPrivateChannelMembershipController__refreshPublicMembershipsWithCompletion___block_invoke_50;
    v47[3] = &unk_1E463AD58;
    v9 = *(_QWORD *)(a1 + 32);
    v49 = &v50;
    v47[4] = v9;
    v10 = v5;
    v48 = v10;
    objc_msgSend(v8, "performWriteSync:", v47);

    v11 = *(void **)(v42 + 32);
    v46 = (id)v51[5];
    v41 = v10;
    v44 = v11;
    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = 0u;
      v67 = 0u;
      v64 = 0u;
      v65 = 0u;
      v13 = v41;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
      if (v14)
      {
        v15 = *(_QWORD *)v65;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v65 != v15)
              objc_enumerationMutation(v13);
            v17 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * i);
            objc_msgSend(v46, "objectForKeyedSubscript:", v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "objectForKeyedSubscript:", v17);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = v12;
            if (!v18 || (v21 = objc_msgSend(v18, "isEqual:", v19), v20 = v45, (v21 & 1) == 0))
              objc_msgSend(v20, "addObject:", v19);

          }
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
        }
        while (v14);
      }

      v62 = 0u;
      v63 = 0u;
      v60 = 0u;
      v61 = 0u;
      v22 = v46;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
      if (v23)
      {
        v24 = *(_QWORD *)v61;
        do
        {
          for (j = 0; j != v23; ++j)
          {
            if (*(_QWORD *)v61 != v24)
              objc_enumerationMutation(v22);
            v26 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * j);
            objc_msgSend(v13, "objectForKeyedSubscript:", v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "objectForKeyedSubscript:", v26);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = v28;
            if (v27)
            {
              if ((objc_msgSend(v28, "isEqual:", v27) & 1) == 0)
                objc_msgSend(v45, "addObject:", v27);
            }
            else
            {
              objc_msgSend(v43, "addObject:", v28);
            }

          }
          v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
        }
        while (v23);
      }

      v30 = (void *)objc_msgSend(v12, "copy");
      v31 = (void *)objc_msgSend(v45, "copy");
      v32 = (void *)objc_msgSend(v43, "copy");
      if (objc_msgSend(v32, "count") || objc_msgSend(v31, "count") || objc_msgSend(v30, "count"))
      {
        v58 = 0u;
        v59 = 0u;
        v56 = 0u;
        v57 = 0u;
        objc_msgSend(v44, "observers");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
        v40 = v5;
        if (v34)
        {
          v35 = *(_QWORD *)v57;
          do
          {
            for (k = 0; k != v34; ++k)
            {
              if (*(_QWORD *)v57 != v35)
                objc_enumerationMutation(v33);
              v37 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * k);
              if ((objc_opt_respondsToSelector() & 1) != 0)
                objc_msgSend(v37, "privateChannelMembershipController:didAddMemberships:changedMemberships:removedMemberships:", v44, v30, v31, v32);
            }
            v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
          }
          while (v34);
        }

        v6 = 0;
        v5 = v40;
      }

    }
    _Block_object_dispose(&v50, 8);

    a1 = v42;
  }
  v38 = *(_QWORD *)(a1 + 40);
  if (v38)
  {
    objc_msgSend(v5, "allValues");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, id))(v38 + 16))(v38, v39, v6);

  }
}

- (FCPrivateChannelMembershipController)initWithContext:(id)a3 pushNotificationCenter:(id)a4 storeDirectory:(id)a5
{
  id v8;
  FCPrivateChannelMembershipController *v9;
  FCMTWriterLock *v10;
  FCMTWriterLock *membershipsLock;
  void *v12;
  objc_super v14;

  v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)FCPrivateChannelMembershipController;
  v9 = -[FCPrivateDataController initWithContext:pushNotificationCenter:storeDirectory:](&v14, sel_initWithContext_pushNotificationCenter_storeDirectory_, v8, a4, a5);
  if (v9)
  {
    v10 = objc_alloc_init(FCMTWriterLock);
    membershipsLock = v9->_membershipsLock;
    v9->_membershipsLock = v10;

    objc_msgSend(v8, "appActivityMonitor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:", v9);

  }
  return v9;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)FCPrivateChannelMembershipController;
  -[FCPrivateDataController dealloc](&v4, sel_dealloc);
}

- (BOOL)isMemberOfChannelID:(id)a3
{
  id v4;
  char v5;
  FCMTWriterLock *membershipsLock;
  FCMTWriterLock *v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  if (v4)
  {
    if ((-[FCPrivateChannelMembershipController shouldShowAllDraftContent]((uint64_t)self) & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      if (self)
        membershipsLock = self->_membershipsLock;
      else
        membershipsLock = 0;
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __60__FCPrivateChannelMembershipController_isMemberOfChannelID___block_invoke_2;
      v9[3] = &unk_1E463ABB8;
      v9[4] = self;
      v10 = v4;
      v7 = membershipsLock;
      v5 = -[FCMTWriterLock readBool:](v7, "readBool:", v9);

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (uint64_t)shouldShowAllDraftContent
{
  void *v1;
  uint64_t v2;

  if (!a1 || !NFInternalBuild())
    return 0;
  NewsCoreUserDefaults();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLForKey:", CFSTR("news.draft_content.show_drafts"));

  return v2;
}

BOOL __60__FCPrivateChannelMembershipController_isMemberOfChannelID___block_invoke_2(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  _BOOL8 v3;

  v1 = *(_QWORD **)(a1 + 32);
  if (v1)
    v1 = (_QWORD *)v1[12];
  objc_msgSend(v1, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isAllowedToSeeDraftsForChannelID:(id)a3
{
  id v4;
  char v5;
  FCMTWriterLock *membershipsLock;
  FCMTWriterLock *v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  if (v4)
  {
    if ((-[FCPrivateChannelMembershipController shouldShowAllDraftContent]((uint64_t)self) & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      if (self)
        membershipsLock = self->_membershipsLock;
      else
        membershipsLock = 0;
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __73__FCPrivateChannelMembershipController_isAllowedToSeeDraftsForChannelID___block_invoke_2;
      v9[3] = &unk_1E463ABB8;
      v9[4] = self;
      v10 = v4;
      v7 = membershipsLock;
      v5 = -[FCMTWriterLock readBool:](v7, "readBool:", v9);

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __73__FCPrivateChannelMembershipController_isAllowedToSeeDraftsForChannelID___block_invoke_2(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  v1 = *(_QWORD **)(a1 + 32);
  if (v1)
    v1 = (_QWORD *)v1[12];
  objc_msgSend(v1, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "isAllowedToSeeDrafts");
  else
    v4 = 0;

  return v4;
}

- (id)feedDescriptorForDraftFeedForChannel:(id)a3
{
  id v4;
  void *v5;
  FCMTWriterLock *membershipsLock;
  id v7;
  FCChannelMembership *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  FCDraftFeedDescriptor *v14;
  void *v15;
  void *v16;
  FCDraftFeedDescriptor *v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t);
  void *v22;
  FCPrivateChannelMembershipController *v23;
  id v24;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[FCPrivateChannelMembershipController isAllowedToSeeDraftsForChannelID:](self, "isAllowedToSeeDraftsForChannelID:", v5))
  {
    if (self)
      membershipsLock = self->_membershipsLock;
    else
      membershipsLock = 0;
    v19 = MEMORY[0x1E0C809B0];
    v20 = 3221225472;
    v21 = __77__FCPrivateChannelMembershipController_feedDescriptorForDraftFeedForChannel___block_invoke;
    v22 = &unk_1E463D4B8;
    v23 = self;
    v7 = v5;
    v24 = v7;
    -[FCMTWriterLock readObject:](membershipsLock, "readObject:", &v19);
    v8 = (FCChannelMembership *)objc_claimAutoreleasedReturnValue();
    if (-[FCPrivateChannelMembershipController shouldShowAllDraftContent]((uint64_t)self) && !v8)
    {
      v9 = objc_alloc_init(MEMORY[0x1E0D62680]);
      objc_msgSend(v9, "setChannelID:", v7, v19, v20, v21, v22, v23);
      objc_msgSend(v7, "substringFromIndex:", 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(CFSTR("LDT"), "stringByAppendingString:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setDraftArticleListID:", v11);

      objc_msgSend(v7, "substringFromIndex:", 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(CFSTR("MD"), "stringByAppendingString:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setDraftIssueListID:", v13);

      v8 = -[FCChannelMembership initWithRecord:interestToken:]([FCChannelMembership alloc], "initWithRecord:interestToken:", v9, 0);
    }
    v14 = [FCDraftFeedDescriptor alloc];
    -[FCChannelMembership draftArticleListID](v8, "draftArticleListID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCChannelMembership draftIssueListID](v8, "draftIssueListID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[FCDraftFeedDescriptor initWithChannel:articleListID:issueListID:](v14, "initWithChannel:articleListID:issueListID:", v4, v15, v16);

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

uint64_t __77__FCPrivateChannelMembershipController_feedDescriptorForDraftFeedForChannel___block_invoke(uint64_t a1)
{
  _QWORD *v1;

  v1 = *(_QWORD **)(a1 + 32);
  if (v1)
    v1 = (_QWORD *)v1[12];
  return objc_msgSend(v1, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
}

- (void)isAllowedToSeeArticleID:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "articleID != nil");
    *(_DWORD *)buf = 136315906;
    v16 = "-[FCPrivateChannelMembershipController isAllowedToSeeArticleID:completionBlock:]";
    v17 = 2080;
    v18 = "FCPrivateChannelMembershipController.m";
    v19 = 1024;
    v20 = 172;
    v21 = 2114;
    v22 = v10;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v7)
      goto LABEL_6;
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "completion != nil");
    *(_DWORD *)buf = 136315906;
    v16 = "-[FCPrivateChannelMembershipController isAllowedToSeeArticleID:completionBlock:]";
    v17 = 2080;
    v18 = "FCPrivateChannelMembershipController.m";
    v19 = 1024;
    v20 = 173;
    v21 = 2114;
    v22 = v11;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __80__FCPrivateChannelMembershipController_isAllowedToSeeArticleID_completionBlock___block_invoke;
  v12[3] = &unk_1E463D7F8;
  v13 = v6;
  v14 = v7;
  v12[4] = self;
  v8 = v6;
  v9 = v7;
  -[FCPrivateChannelMembershipController _fetchPrivateChannelMembershipsWithCompletion:](self, v12);

}

void __80__FCPrivateChannelMembershipController_isAllowedToSeeArticleID_completionBlock___block_invoke(id *a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[5];

  if (a3)
  {
    (*((void (**)(void))a1[6] + 2))();
  }
  else
  {
    v4 = a1[4];
    if (v4)
      v5 = (void *)v4[14];
    else
      v5 = 0;
    v6 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __80__FCPrivateChannelMembershipController_isAllowedToSeeArticleID_completionBlock___block_invoke_2;
    v15[3] = &unk_1E463B350;
    v15[4] = v4;
    objc_msgSend(v5, "readObject:", v15);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_opt_new();
    objc_msgSend(a1[4], "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setContext:", v9);

    objc_msgSend(v8, "setChannelMemberships:", v7);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", a1[5]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setArticleIDs:", v10);

    objc_msgSend(v8, "setQualityOfService:", 17);
    v12[0] = v6;
    v12[1] = 3221225472;
    v12[2] = __80__FCPrivateChannelMembershipController_isAllowedToSeeArticleID_completionBlock___block_invoke_3;
    v12[3] = &unk_1E463B858;
    v13 = a1[5];
    v14 = a1[6];
    objc_msgSend(v8, "setCheckAccessCompletion:", v12);
    objc_msgSend(MEMORY[0x1E0CB3828], "fc_sharedConcurrentQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addOperation:", v8);

  }
}

uint64_t __80__FCPrivateChannelMembershipController_isAllowedToSeeArticleID_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    v2 = *(void **)(v1 + 96);
  else
    v2 = 0;
  return objc_msgSend(v2, "allValues");
}

uint64_t __80__FCPrivateChannelMembershipController_isAllowedToSeeArticleID_completionBlock___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;

  if (!a3)
  {
    objc_msgSend(a2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "BOOLValue");

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_fetchPrivateChannelMembershipsWithCompletion:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (!v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "completion != nil");
      *(_DWORD *)buf = 136315906;
      v9 = "-[FCPrivateChannelMembershipController _fetchPrivateChannelMembershipsWithCompletion:]";
      v10 = 2080;
      v11 = "FCPrivateChannelMembershipController.m";
      v12 = 1024;
      v13 = 696;
      v14 = 2114;
      v15 = v5;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __86__FCPrivateChannelMembershipController__fetchPrivateChannelMembershipsWithCompletion___block_invoke;
    v6[3] = &unk_1E463D8B8;
    v6[4] = a1;
    v7 = v4;
    objc_msgSend(a1, "syncWithCompletion:", v6);

  }
}

- (void)isAllowedToSeeIssueID:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "issueID != nil");
    *(_DWORD *)buf = 136315906;
    v16 = "-[FCPrivateChannelMembershipController isAllowedToSeeIssueID:completionBlock:]";
    v17 = 2080;
    v18 = "FCPrivateChannelMembershipController.m";
    v19 = 1024;
    v20 = 210;
    v21 = 2114;
    v22 = v10;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v7)
      goto LABEL_6;
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "completion != nil");
    *(_DWORD *)buf = 136315906;
    v16 = "-[FCPrivateChannelMembershipController isAllowedToSeeIssueID:completionBlock:]";
    v17 = 2080;
    v18 = "FCPrivateChannelMembershipController.m";
    v19 = 1024;
    v20 = 211;
    v21 = 2114;
    v22 = v11;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __78__FCPrivateChannelMembershipController_isAllowedToSeeIssueID_completionBlock___block_invoke;
  v12[3] = &unk_1E463D7F8;
  v13 = v6;
  v14 = v7;
  v12[4] = self;
  v8 = v6;
  v9 = v7;
  -[FCPrivateChannelMembershipController _fetchPrivateChannelMembershipsWithCompletion:](self, v12);

}

void __78__FCPrivateChannelMembershipController_isAllowedToSeeIssueID_completionBlock___block_invoke(id *a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[5];

  if (a3)
  {
    (*((void (**)(void))a1[6] + 2))();
  }
  else
  {
    v4 = a1[4];
    if (v4)
      v5 = (void *)v4[14];
    else
      v5 = 0;
    v6 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __78__FCPrivateChannelMembershipController_isAllowedToSeeIssueID_completionBlock___block_invoke_2;
    v15[3] = &unk_1E463B350;
    v15[4] = v4;
    objc_msgSend(v5, "readObject:", v15);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_opt_new();
    objc_msgSend(a1[4], "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setContext:", v9);

    objc_msgSend(v8, "setChannelMemberships:", v7);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", a1[5]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setIssueIDs:", v10);

    objc_msgSend(v8, "setQualityOfService:", 17);
    v12[0] = v6;
    v12[1] = 3221225472;
    v12[2] = __78__FCPrivateChannelMembershipController_isAllowedToSeeIssueID_completionBlock___block_invoke_3;
    v12[3] = &unk_1E463B858;
    v13 = a1[5];
    v14 = a1[6];
    objc_msgSend(v8, "setCheckAccessCompletion:", v12);
    objc_msgSend(MEMORY[0x1E0CB3828], "fc_sharedConcurrentQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addOperation:", v8);

  }
}

uint64_t __78__FCPrivateChannelMembershipController_isAllowedToSeeIssueID_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    v2 = *(void **)(v1 + 96);
  else
    v2 = 0;
  return objc_msgSend(v2, "allValues");
}

uint64_t __78__FCPrivateChannelMembershipController_isAllowedToSeeIssueID_completionBlock___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;

  if (!a3)
  {
    objc_msgSend(a2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "BOOLValue");

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (BOOL)hasMemberships
{
  FCMTWriterLock *membershipsLock;
  FCMTWriterLock *v4;
  BOOL v5;
  _QWORD v7[5];

  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (self)
    membershipsLock = self->_membershipsLock;
  else
    membershipsLock = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__FCPrivateChannelMembershipController_hasMemberships__block_invoke;
  v7[3] = &unk_1E463AB90;
  v7[4] = self;
  v4 = membershipsLock;
  v5 = -[FCMTWriterLock readBool:](v4, "readBool:", v7);

  return v5;
}

BOOL __54__FCPrivateChannelMembershipController_hasMemberships__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    v2 = *(void **)(v1 + 104);
  else
    v2 = 0;
  return objc_msgSend(v2, "count") != 0;
}

void __60__FCPrivateChannelMembershipController_membershipChannelIDs__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend(a3, "isAllowedToSeeDrafts"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

}

+ (BOOL)requiresPushNotificationSupport
{
  return 1;
}

+ (BOOL)requiresBatchedSync
{
  return 0;
}

+ (id)backingRecordZoneIDs
{
  id v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0C95098]);
  v3 = (void *)objc_msgSend(v2, "initWithZoneName:ownerName:", CFSTR("ChannelMemberships"), *MEMORY[0x1E0C94730]);
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)backingRecordIDs
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (id)commandsToMergeLocalDataToCloud:(id)a3 privateDataDirectory:(id)a4
{
  return 0;
}

- (void)addItem:(int)a3 toStore:
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  _QWORD *v15;
  id v16;

  v5 = a2;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
    if (v5)
    {
      v6 = (void *)a1[14];
      v11 = MEMORY[0x1E0C809B0];
      v12 = 3221225472;
      v13 = __56__FCPrivateChannelMembershipController_addItem_toStore___block_invoke;
      v14 = &unk_1E463AD10;
      v15 = a1;
      v7 = v5;
      v16 = v7;
      objc_msgSend(v6, "performWriteSync:", &v11);
      if (a3)
      {
        objc_msgSend(v7, "dictionaryRepresentation", v11, v12, v13, v14, v15);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "localStore");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v10);

      }
    }
  }

}

uint64_t __64__FCPrivateChannelMembershipController_loadLocalCachesFromStore__block_invoke_2(uint64_t a1)
{
  _QWORD *v2;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
  {
    -[FCPrivateChannelMembershipController _refreshPublicMembershipsWithCompletion:](v2, 0);
    v2 = *(_QWORD **)(a1 + 32);
  }
  return objc_msgSend(v2, "forceSyncWithCompletion:", 0);
}

+ (id)desiredKeys
{
  if (qword_1ED0F7B40 != -1)
    dispatch_once(&qword_1ED0F7B40, &__block_literal_global_47_0);
  return (id)_MergedGlobals_7;
}

void __51__FCPrivateChannelMembershipController_desiredKeys__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("membershipID"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_7;
  _MergedGlobals_7 = v0;

}

uint64_t __56__FCPrivateChannelMembershipController_addItem_toStore___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2 && *(_QWORD *)(v2 + 104))
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    objc_storeStrong((id *)(v4 + 104), v3);

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
LABEL_6:
    v5 = *(void **)(v2 + 104);
  else
    v5 = 0;
  return objc_msgSend(v5, "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)removeItemWithItemID:(_QWORD *)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  _QWORD *v11;
  id v12;

  v3 = a2;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
    v4 = (void *)a1[14];
    v7 = MEMORY[0x1E0C809B0];
    v8 = 3221225472;
    v9 = __61__FCPrivateChannelMembershipController_removeItemWithItemID___block_invoke;
    v10 = &unk_1E463AD10;
    v11 = a1;
    v5 = v3;
    v12 = v5;
    objc_msgSend(v4, "performWriteSync:", &v7);
    objc_msgSend(a1, "localStore", v7, v8, v9, v10, v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectForKey:", v5);

  }
}

void __61__FCPrivateChannelMembershipController_removeItemWithItemID___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[13];
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
LABEL_5:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v6)
        objc_enumerationMutation(v3);
      v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v7);
      objc_msgSend(v8, "identifier", (_QWORD)v14);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", *(_QWORD *)(a1 + 40));

      if ((v10 & 1) != 0)
        break;
      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v5)
          goto LABEL_5;
        goto LABEL_11;
      }
    }
    v11 = v8;

    if (!v11)
      return;
    v12 = *(_QWORD *)(a1 + 32);
    if (v12)
      v13 = *(void **)(v12 + 104);
    else
      v13 = 0;
    objc_msgSend(v13, "removeObject:", v11);
  }
  else
  {
LABEL_11:
    v11 = v3;
  }

}

- (_QWORD)referenceToMembershipForMembershipID:(_QWORD *)a1
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  id v9;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = (void *)a1[14];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __77__FCPrivateChannelMembershipController_referenceToMembershipForMembershipID___block_invoke;
    v8[3] = &unk_1E463D4B8;
    v8[4] = a1;
    v9 = v3;
    v6 = v5;
    objc_msgSend(v6, "readObject:", v8);
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();

  }
  return a1;
}

void __80__FCPrivateChannelMembershipController__refreshPublicMembershipsWithCompletion___block_invoke_50(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 96);
  else
    v3 = 0;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v3);
  -[FCPrivateChannelMembershipController setMembershipsByChannelID:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

- (void)handleSyncWithChangedRecords:(id)a3 deletedRecordNames:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  FCReferenceToMembership *v11;
  void *v12;
  void *v13;
  FCRemoveReferenceToChannelMembershipCommand *v14;
  void *v15;
  FCRemoveReferenceToChannelMembershipCommand *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v23 = a4;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v29;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v29 != v9)
          objc_enumerationMutation(v6);
        v11 = -[FCReferenceToMembership initWithRecord:]([FCReferenceToMembership alloc], "initWithRecord:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v10));
        -[FCReferenceToMembership membershipID](v11, "membershipID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          -[FCReferenceToMembership membershipID](v11, "membershipID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[FCPrivateChannelMembershipController referenceToMembershipForMembershipID:](self, v13);
          v14 = (FCRemoveReferenceToChannelMembershipCommand *)objc_claimAutoreleasedReturnValue();

          if (v14)
          {
            -[FCRemoveReferenceToChannelMembershipCommand identifier](v14, "identifier");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[FCPrivateChannelMembershipController removeItemWithItemID:](self, v15);

          }
          -[FCPrivateChannelMembershipController addItem:toStore:](self, v11, 1);
        }
        else
        {
          v16 = [FCRemoveReferenceToChannelMembershipCommand alloc];
          -[FCReferenceToMembership identifier](v11, "identifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = -[FCRemoveReferenceToChannelMembershipCommand initWithReferenceToChannelMembershipID:](v16, "initWithReferenceToChannelMembershipID:", v17);

          -[FCPrivateDataController addCommandToCommandQueue:](self, "addCommandToCommandQueue:", v14);
        }

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v8);
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v18 = v23;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v25;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v25 != v21)
          objc_enumerationMutation(v18);
        -[FCPrivateChannelMembershipController removeItemWithItemID:](self, *(void **)(*((_QWORD *)&v24 + 1) + 8 * v22++));
      }
      while (v20 != v22);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v20);
  }

  if (self)
    -[FCPrivateChannelMembershipController _refreshPublicMembershipsWithCompletion:](self, 0);

}

- (id)allKnownRecordNamesWithinRecordZoneWithID:(id)a3
{
  FCMTWriterLock *membershipsLock;
  FCMTWriterLock *v5;
  void *v6;
  _QWORD v8[5];

  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", a3);
  if (self)
    membershipsLock = self->_membershipsLock;
  else
    membershipsLock = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __82__FCPrivateChannelMembershipController_allKnownRecordNamesWithinRecordZoneWithID___block_invoke;
  v8[3] = &unk_1E463B350;
  v8[4] = self;
  v5 = membershipsLock;
  -[FCMTWriterLock readObject:](v5, "readObject:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __82__FCPrivateChannelMembershipController_allKnownRecordNamesWithinRecordZoneWithID___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    v2 = *(void **)(v1 + 104);
  else
    v2 = 0;
  return objc_msgSend(v2, "fc_arrayByTransformingWithBlock:", &__block_literal_global_52_0);
}

uint64_t __82__FCPrivateChannelMembershipController_allKnownRecordNamesWithinRecordZoneWithID___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

id __77__FCPrivateChannelMembershipController_referenceToMembershipForMembershipID___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    v2 = *(void **)(v1 + 104);
  else
    v2 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __77__FCPrivateChannelMembershipController_referenceToMembershipForMembershipID___block_invoke_2;
  v6[3] = &unk_1E463D890;
  v7 = *(id *)(a1 + 40);
  v3 = v2;
  objc_msgSend(v3, "fc_firstObjectPassingTest:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __77__FCPrivateChannelMembershipController_referenceToMembershipForMembershipID___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "membershipID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)addObserver:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (v4)
  {
    -[FCPrivateDataController observers](self, "observers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "containsObject:", v4);

    if (v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%p is already a state observer"), v4);
      *(_DWORD *)buf = 136315906;
      v10 = "-[FCPrivateChannelMembershipController addObserver:]";
      v11 = 2080;
      v12 = "FCPrivateChannelMembershipController.m";
      v13 = 1024;
      v14 = 599;
      v15 = 2114;
      v16 = v8;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    -[FCPrivateDataController observers](self, "observers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v4);
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_8;
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "stateObserver != nil");
    *(_DWORD *)buf = 136315906;
    v10 = "-[FCPrivateChannelMembershipController addObserver:]";
    v11 = 2080;
    v12 = "FCPrivateChannelMembershipController.m";
    v13 = 1024;
    v14 = 595;
    v15 = 2114;
    v16 = v7;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }

LABEL_8:
}

- (void)removeObserver:(id)a3
{
  id v4;
  void *v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (v4)
  {
    -[FCPrivateDataController observers](self, "observers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObject:", v4);
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_5;
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "stateObserver != nil");
    *(_DWORD *)buf = 136315906;
    v7 = "-[FCPrivateChannelMembershipController removeObserver:]";
    v8 = 2080;
    v9 = "FCPrivateChannelMembershipController.m";
    v10 = 1024;
    v11 = 608;
    v12 = 2114;
    v13 = v5;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }

LABEL_5:
}

void __86__FCPrivateChannelMembershipController__fetchPrivateChannelMembershipsWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    -[FCPrivateChannelMembershipController _refreshPublicMembershipsWithCompletion:](*(_QWORD **)(a1 + 32), *(void **)(a1 + 40));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_membershipsLock, 0);
  objc_storeStrong((id *)&self->_membershipReferences, 0);
  objc_storeStrong((id *)&self->_membershipsByChannelID, 0);
}

@end

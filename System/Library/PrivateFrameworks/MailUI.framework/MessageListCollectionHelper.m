@implementation MessageListCollectionHelper

- (MessageListCollectionHelper)initWithLog:(id)a3 updateQueueName:(id)a4 sectionObjectID:(id)a5
{
  id v9;
  id v10;
  id v11;
  MessageListCollectionHelper *v12;
  MessageListCollectionHelper *v13;
  const char *v14;
  NSObject *v15;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *updateQueue;
  EMObjectID *v19;
  EMObjectID *sectionObjectID;
  objc_super v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)MessageListCollectionHelper;
  v12 = -[MessageListCollectionHelper init](&v22, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_clientLog, a3);
    if (objc_msgSend(v10, "length"))
    {
      v14 = (const char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v15 = objc_claimAutoreleasedReturnValue();
      dispatch_queue_attr_make_with_qos_class(v15, QOS_CLASS_USER_INTERACTIVE, 0);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = dispatch_queue_create(v14, v16);
      updateQueue = v13->_updateQueue;
      v13->_updateQueue = (OS_dispatch_queue *)v17;

    }
    if (v11)
      v19 = (EMObjectID *)v11;
    else
      v19 = (EMObjectID *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E2A8]), "initAsEphemeralID:", 1);
    sectionObjectID = v13->_sectionObjectID;
    v13->_sectionObjectID = v19;

  }
  return v13;
}

- (MessageListCollectionHelper)initWithLoggableClient:(id)a3 updateQueueName:(id)a4 sectionObjectID:(id)a5
{
  id v7;
  id v8;
  void *v9;
  MessageListCollectionHelper *v10;

  v7 = a5;
  v8 = a4;
  objc_msgSend((id)objc_opt_class(), "log");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[MessageListCollectionHelper initWithLog:updateQueueName:sectionObjectID:](self, "initWithLog:updateQueueName:sectionObjectID:", v9, v8, v7);

  return v10;
}

- (int64_t)addItemIDs:(id)a3 before:(id)a4 snapshot:(id)a5 section:(id)a6 validateOtherSections:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  id v13;
  id v14;
  id v15;
  int64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  int v37;
  uint64_t v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v7 = a7;
  v41 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = objc_msgSend(v12, "count");
  if (v7)
    -[MessageListCollectionHelper _removeItemsIDsFromOtherSections:currentSection:snapshot:](self, v12, v15, v14);
  if (v13)
  {
    objc_msgSend(v14, "mui_validItemIDFromExistingItemID:updateReason:", v13, CFSTR("Adding items before existing item"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      -[MessageListCollectionHelper _filterExistingItemIDFromItemIDs:validExistingItemID:](self, v12, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      -[MessageListCollectionHelper clientLog](self, "clientLog");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v37 = 134349314;
        v38 = objc_msgSend(v18, "count");
        v39 = 2114;
        v40 = v17;
        _os_log_impl(&dword_1D5522000, v19, OS_LOG_TYPE_DEFAULT, "Inserting %{public}ld identifiers before %{public}@", (uint8_t *)&v37, 0x16u);
      }

      -[MessageListCollectionHelper clientLog](self, "clientLog");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        -[MessageListCollectionHelper addItemIDs:before:snapshot:section:validateOtherSections:].cold.3((uint64_t)v18, v20, v21, v22, v23, v24, v25, v26);

      objc_msgSend(v14, "insertItemsWithIdentifiers:beforeItemWithIdentifier:", v18, v17);
      v12 = v18;
    }
    else
    {
      -[MessageListCollectionHelper clientLog](self, "clientLog");
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        -[MessageListCollectionHelper addItemIDs:before:snapshot:section:validateOtherSections:].cold.2(v12);

      v16 = 0x7FFFFFFFFFFFFFFFLL;
    }

  }
  else
  {
    -[MessageListCollectionHelper clientLog](self, "clientLog");
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v37 = 134349056;
      v38 = objc_msgSend(v12, "count");
      _os_log_impl(&dword_1D5522000, v27, OS_LOG_TYPE_DEFAULT, "Appending %{public}ld identifiers", (uint8_t *)&v37, 0xCu);
    }

    -[MessageListCollectionHelper clientLog](self, "clientLog");
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      -[MessageListCollectionHelper addItemIDs:before:snapshot:section:validateOtherSections:].cold.1((uint64_t)v12, v28, v29, v30, v31, v32, v33, v34);

    objc_msgSend(v14, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v12, v15);
  }

  return v16;
}

- (OS_os_log)clientLog
{
  return self->_clientLog;
}

- (void)_removeItemsIDsFromOtherSections:(void *)a3 currentSection:(void *)a4 snapshot:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v26 = a2;
  v7 = a3;
  v8 = a4;
  v9 = v8;
  v25 = a1;
  if (a1)
  {
    objc_msgSend(v8, "mui_validSectionIdentifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v10, "count") >= 2 && objc_msgSend(v26, "count"))
    {
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v24 = v10;
      v11 = v10;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v30;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v30 != v14)
              objc_enumerationMutation(v11);
            v16 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
            if ((objc_msgSend(v16, "isEqual:", v7) & 1) == 0)
            {
              v17 = (void *)MEMORY[0x1E0C99E60];
              objc_msgSend(v9, "itemIdentifiersInSectionWithIdentifier:", v16);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "setWithArray:", v18);
              v19 = (void *)objc_claimAutoreleasedReturnValue();

              v27[0] = MEMORY[0x1E0C809B0];
              v27[1] = 3221225472;
              v27[2] = __88__MessageListCollectionHelper__removeItemsIDsFromOtherSections_currentSection_snapshot___block_invoke;
              v27[3] = &unk_1E99E13B0;
              v20 = v19;
              v28 = v20;
              objc_msgSend(v26, "ef_filter:", v27);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v21, "count"))
              {
                objc_msgSend(v25, "clientLog");
                v22 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                {
                  v23 = objc_msgSend(v21, "count");
                  *(_DWORD *)buf = 134218498;
                  v34 = v23;
                  v35 = 2048;
                  v36 = v16;
                  v37 = 2114;
                  v38 = v21;
                  _os_log_impl(&dword_1D5522000, v22, OS_LOG_TYPE_DEFAULT, "Remove %ld item ids from other section (%p): %{public}@", buf, 0x20u);
                }

                objc_msgSend(v9, "deleteItemsWithIdentifiers:", v21);
              }

            }
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
        }
        while (v13);
      }

      v10 = v24;
    }

  }
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__MessageListCollectionHelper_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_1 != -1)
    dispatch_once(&log_onceToken_1, block);
  return (OS_os_log *)(id)log_log_1;
}

void __34__MessageListCollectionHelper_log__block_invoke(uint64_t a1)
{
  const char *v2;
  id v3;
  os_log_t v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "mailUISubsystem");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v2 = (const char *)objc_msgSend(v6, "UTF8String");
  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = os_log_create(v2, (const char *)objc_msgSend(v3, "UTF8String"));
  v5 = (void *)log_log_1;
  log_log_1 = (uint64_t)v4;

}

+ (id)signpostLog
{
  uint64_t v0;
  _QWORD block[5];

  v0 = objc_opt_self();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__MessageListCollectionHelper_signpostLog__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v0;
  if (signpostLog_onceToken != -1)
    dispatch_once(&signpostLog_onceToken, block);
  return (id)signpostLog_log;
}

void __42__MessageListCollectionHelper_signpostLog__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email.signposts", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)signpostLog_log;
  signpostLog_log = (uint64_t)v1;

}

- (id)_filterExistingItemIDFromItemIDs:(void *)a3 validExistingItemID:
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  size_t v10;
  _DWORD __b[162];
  int v12[2];
  int v13;
  pid_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    if (objc_msgSend(v5, "indexOfObject:", v6) == 0x7FFFFFFFFFFFFFFFLL)
    {
      v7 = v5;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v5);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObject:", v6);
      objc_msgSend(a1, "clientLog");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[MessageListCollectionHelper _filterExistingItemIDFromItemIDs:validExistingItemID:].cold.1(v5);

      memset(__b, 170, sizeof(__b));
      __b[8] = 0;
      *(_QWORD *)v12 = 0xE00000001;
      v13 = 1;
      v14 = getpid();
      v10 = 648;
      if (!sysctl(v12, 4u, __b, &v10, 0, 0) && (__b[8] & 0x800) != 0)
        __debugbreak();
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (int64_t)addItemIDs:(id)a3 after:(id)a4 snapshot:(id)a5 section:(id)a6 validateOtherSections:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  id v13;
  id v14;
  id v15;
  int64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  int v29;
  uint64_t v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v7 = a7;
  v33 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = objc_msgSend(v12, "count");
  if (v7)
    -[MessageListCollectionHelper _removeItemsIDsFromOtherSections:currentSection:snapshot:](self, v12, v15, v14);
  if (v13)
  {
    objc_msgSend(v14, "mui_validItemIDFromExistingItemID:updateReason:", v13, CFSTR("Adding items after existing item"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      -[MessageListCollectionHelper _filterExistingItemIDFromItemIDs:validExistingItemID:](self, v12, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      -[MessageListCollectionHelper clientLog](self, "clientLog");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v29 = 134349314;
        v30 = objc_msgSend(v18, "count");
        v31 = 2114;
        v32 = v17;
        _os_log_impl(&dword_1D5522000, v19, OS_LOG_TYPE_DEFAULT, "Inserting %{public}ld identifiers after %{public}@", (uint8_t *)&v29, 0x16u);
      }

      -[MessageListCollectionHelper clientLog](self, "clientLog");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        -[MessageListCollectionHelper addItemIDs:before:snapshot:section:validateOtherSections:].cold.3((uint64_t)v18, v20, v21, v22, v23, v24, v25, v26);

      objc_msgSend(v14, "insertItemsWithIdentifiers:afterItemWithIdentifier:", v18, v17);
      v12 = v18;
    }
    else
    {
      -[MessageListCollectionHelper clientLog](self, "clientLog");
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        -[MessageListCollectionHelper addItemIDs:after:snapshot:section:validateOtherSections:].cold.1(v12);

      v16 = 0x7FFFFFFFFFFFFFFFLL;
    }

  }
  else
  {
    -[MessageListCollectionHelper _insertItemIDs:beforeFirstItemOfSnapshot:section:errorString:](self, v12, v14, v15, 0);
  }

  return v16;
}

- (void)_insertItemIDs:(void *)a3 beforeFirstItemOfSnapshot:(void *)a4 section:(void *)a5 errorString:
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (a1)
  {
    objc_msgSend(v10, "itemIdentifiersInSectionWithIdentifier:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "clientLog");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v14)
    {
      if (v12)
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v17 = 134349826;
          v18 = objc_msgSend(v9, "count");
          v19 = 2112;
          v20 = v9;
          v21 = 2114;
          v22 = v14;
          v23 = 2114;
          v24 = v12;
          _os_log_error_impl(&dword_1D5522000, v16, OS_LOG_TYPE_ERROR, "Inserting identifiers (%{public}ld) %@ before first item %{public}@ due to: %{public}@", (uint8_t *)&v17, 0x2Au);
        }
      }
      else if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v17 = 134349570;
        v18 = objc_msgSend(v9, "count");
        v19 = 2112;
        v20 = v9;
        v21 = 2114;
        v22 = v14;
        _os_log_impl(&dword_1D5522000, v16, OS_LOG_TYPE_DEFAULT, "Inserting identifiers (%{public}ld) %@ before first item %{public}@", (uint8_t *)&v17, 0x20u);
      }

      objc_msgSend(v10, "insertItemsWithIdentifiers:beforeItemWithIdentifier:", v9, v14);
    }
    else
    {
      if (v12)
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          -[MessageListCollectionHelper _insertItemIDs:beforeFirstItemOfSnapshot:section:errorString:].cold.1(v9);
      }
      else if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v17 = 134349314;
        v18 = objc_msgSend(v9, "count");
        v19 = 2112;
        v20 = v9;
        _os_log_impl(&dword_1D5522000, v16, OS_LOG_TYPE_DEFAULT, "Appending identifiers (%{public}ld) %@ to empty list", (uint8_t *)&v17, 0x16u);
      }

      objc_msgSend(v10, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v9, v11);
    }

  }
}

uint64_t __88__MessageListCollectionHelper__removeItemsIDsFromOtherSections_currentSection_snapshot___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

- (int64_t)moveItemID:(id)a3 before:(id)a4 snapshot:(id)a5 section:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  int64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  int v22;
  NSObject *v23;
  _BOOL4 v24;
  void *v25;
  size_t v27;
  _DWORD __b[162];
  int v29[2];
  int v30;
  pid_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = a4;
  objc_msgSend(v12, "mui_validItemIDFromExistingItemID:updateReason:", v11, CFSTR("Moving item before - itemID"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "mui_validItemIDFromExistingItemID:updateReason:", v14, CFSTR("Moving item before - existingItemID"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    v18 = 0;
    goto LABEL_24;
  }
  if (objc_msgSend(v15, "isEqual:", v16))
  {
    -[MessageListCollectionHelper clientLog](self, "clientLog");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[MessageListCollectionHelper moveItemID:before:snapshot:section:].cold.1((uint64_t)v11, v12);

    memset(__b, 170, sizeof(__b));
    __b[8] = 0;
    *(_QWORD *)v29 = 0xE00000001;
    v30 = 1;
    v31 = getpid();
    v27 = 648;
    v18 = 0;
    if (!sysctl(v29, 4u, __b, &v27, 0, 0) && (__b[8] & 0x800) != 0)
    {
      __debugbreak();
      JUMPOUT(0x1D55354C8);
    }
    goto LABEL_24;
  }
  if (!v16)
  {
    objc_msgSend(v12, "itemIdentifiersInSectionWithIdentifier:", v13);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "lastObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      v22 = objc_msgSend(v21, "isEqual:", v15);
      -[MessageListCollectionHelper clientLog](self, "clientLog");
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
      if (!v22)
      {
        if (v24)
        {
          __b[0] = 138543618;
          *(_QWORD *)&__b[1] = v15;
          LOWORD(__b[3]) = 2114;
          *(_QWORD *)((char *)&__b[3] + 2) = v21;
          _os_log_impl(&dword_1D5522000, v23, OS_LOG_TYPE_DEFAULT, "Moving identifier %{public}@ after last item %{public}@", (uint8_t *)__b, 0x16u);
        }

        objc_msgSend(v12, "moveItemWithIdentifier:afterItemWithIdentifier:", v15, v21);
        v18 = 1;
        goto LABEL_23;
      }
      if (v24)
      {
        __b[0] = 138543362;
        *(_QWORD *)&__b[1] = v15;
        _os_log_impl(&dword_1D5522000, v23, OS_LOG_TYPE_DEFAULT, "Identifier %{public}@ is already last item", (uint8_t *)__b, 0xCu);
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MessageListCollectionHelper.m"), 201, CFSTR("Attempted to move an item to the end of a snapshot which has no items."));

    }
    v18 = 0;
LABEL_23:

    goto LABEL_24;
  }
  -[MessageListCollectionHelper clientLog](self, "clientLog");
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    __b[0] = 138543618;
    *(_QWORD *)&__b[1] = v15;
    LOWORD(__b[3]) = 2114;
    *(_QWORD *)((char *)&__b[3] + 2) = v16;
    _os_log_impl(&dword_1D5522000, v19, OS_LOG_TYPE_DEFAULT, "Moving identifier %{public}@ before %{public}@", (uint8_t *)__b, 0x16u);
  }

  objc_msgSend(v12, "moveItemWithIdentifier:beforeItemWithIdentifier:", v15, v16);
  v18 = 1;
LABEL_24:

  return v18;
}

- (int64_t)moveItemID:(id)a3 after:(id)a4 snapshot:(id)a5 section:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  int64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  int v21;
  NSObject *v22;
  _BOOL4 v23;
  size_t v25;
  _DWORD __b[162];
  int v27[2];
  int v28;
  pid_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = a4;
  objc_msgSend(v11, "mui_validItemIDFromExistingItemID:updateReason:", v10, CFSTR("Moving item after - itemID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "mui_validItemIDFromExistingItemID:updateReason:", v13, CFSTR("Moving item after - existingItemID"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    v17 = 0;
    goto LABEL_23;
  }
  if (objc_msgSend(v14, "isEqual:", v15))
  {
    -[MessageListCollectionHelper clientLog](self, "clientLog");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[MessageListCollectionHelper moveItemID:before:snapshot:section:].cold.1((uint64_t)v10, v11);

    memset(__b, 170, sizeof(__b));
    __b[8] = 0;
    *(_QWORD *)v27 = 0xE00000001;
    v28 = 1;
    v29 = getpid();
    v25 = 648;
    v17 = 0;
    if (!sysctl(v27, 4u, __b, &v25, 0, 0) && (__b[8] & 0x800) != 0)
    {
      __debugbreak();
      JUMPOUT(0x1D5535828);
    }
    goto LABEL_23;
  }
  if (!v15)
  {
    objc_msgSend(v11, "itemIdentifiersInSectionWithIdentifier:", v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "firstObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v21 = objc_msgSend(v20, "isEqual:", v14);
      -[MessageListCollectionHelper clientLog](self, "clientLog");
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
      if (!v21)
      {
        if (v23)
        {
          __b[0] = 138543618;
          *(_QWORD *)&__b[1] = v14;
          LOWORD(__b[3]) = 2114;
          *(_QWORD *)((char *)&__b[3] + 2) = v20;
          _os_log_impl(&dword_1D5522000, v22, OS_LOG_TYPE_DEFAULT, "Moving identifier %{public}@ before first item %{public}@", (uint8_t *)__b, 0x16u);
        }

        objc_msgSend(v11, "moveItemWithIdentifier:beforeItemWithIdentifier:", v14, v20);
        v17 = 1;
        goto LABEL_22;
      }
      if (v23)
      {
        __b[0] = 138543362;
        *(_QWORD *)&__b[1] = v14;
        _os_log_impl(&dword_1D5522000, v22, OS_LOG_TYPE_DEFAULT, "Identifier %{public}@ is already first item", (uint8_t *)__b, 0xCu);
      }

    }
    v17 = 0;
LABEL_22:

    goto LABEL_23;
  }
  -[MessageListCollectionHelper clientLog](self, "clientLog");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    __b[0] = 138543618;
    *(_QWORD *)&__b[1] = v14;
    LOWORD(__b[3]) = 2114;
    *(_QWORD *)((char *)&__b[3] + 2) = v15;
    _os_log_impl(&dword_1D5522000, v18, OS_LOG_TYPE_DEFAULT, "Moving identifier %{public}@ after %{public}@", (uint8_t *)__b, 0x16u);
  }

  objc_msgSend(v11, "moveItemWithIdentifier:afterItemWithIdentifier:", v14, v15);
  v17 = 1;
LABEL_23:

  return v17;
}

- (id)changeItemIDs:(id)a3 snapshot:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[MessageListCollectionHelper clientLog](self, "clientLog");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v6;
    _os_log_impl(&dword_1D5522000, v8, OS_LOG_TYPE_DEFAULT, "changedItemIDs: %@", (uint8_t *)&v11, 0xCu);
  }

  -[MessageListCollectionHelper _reportChangedItemIDs:](self, v6);
  objc_msgSend(v7, "mui_validItemIDsFromExistingItemIDs:updateReason:", v6, CFSTR("Changing itemIDs"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_reportChangedItemIDs:(void *)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  os_signpost_id_t v14;
  NSObject *v15;
  NSObject *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  int v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    if (v5)
    {
      v7 = v5;
      v8 = *(_QWORD *)v19;
      *(_QWORD *)&v6 = 67240192;
      v17 = v6;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v19 != v8)
            objc_enumerationMutation(v4);
          v10 = *(const void **)(*((_QWORD *)&v18 + 1) + 8 * v9);
          objc_msgSend(a1, "pendingReadTimeoutCancelables", v17);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKeyedSubscript:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            objc_msgSend(a1, "removePendingReadCancelablesForItemID:", v10);
            +[MessageListCollectionHelper signpostLog]();
            v13 = objc_claimAutoreleasedReturnValue();
            v14 = os_signpost_id_make_with_pointer(v13, v10);

            +[MessageListCollectionHelper signpostLog]();
            v15 = objc_claimAutoreleasedReturnValue();
            v16 = v15;
            if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
            {
              *(_DWORD *)buf = v17;
              v23 = 0;
              _os_signpost_emit_with_name_impl(&dword_1D5522000, v16, OS_SIGNPOST_INTERVAL_END, v14, "EMMessageListItemReadUnread", "TimedOut=%{public,signpost.telemetry:number1}u enableTelemetry=YES ", buf, 8u);
            }

          }
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
      }
      while (v7);
    }
  }

}

- (void)didScheduleReadInteractionForItemID:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  os_unfair_lock_s *p_pendingReadCancelableLock;
  void *v16;
  _QWORD v17[5];
  id v18;
  os_signpost_id_t v19;
  uint8_t buf[16];

  v4 = a3;
  +[MessageListCollectionHelper signpostLog]();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_make_with_pointer(v5, v4);

  +[MessageListCollectionHelper signpostLog]();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D5522000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "EMMessageListItemReadUnread", ", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D1F070], "globalAsyncScheduler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __67__MessageListCollectionHelper_didScheduleReadInteractionForItemID___block_invoke;
  v17[3] = &unk_1E99E13D8;
  v19 = v6;
  v17[4] = self;
  v10 = v4;
  v18 = v10;
  objc_msgSend(v9, "afterDelay:performBlock:", v17, 2.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[MessageListCollectionHelper pendingReadTimeoutCancelables](self, "pendingReadTimeoutCancelables");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v13, "setByAddingObject:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  p_pendingReadCancelableLock = &self->pendingReadCancelableLock;
  os_unfair_lock_lock(&self->pendingReadCancelableLock);
  -[MessageListCollectionHelper pendingReadTimeoutCancelables](self, "pendingReadTimeoutCancelables");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v14, v10);

  os_unfair_lock_unlock(p_pendingReadCancelableLock);
}

uint64_t __67__MessageListCollectionHelper_didScheduleReadInteractionForItemID___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  +[MessageListCollectionHelper signpostLog]();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 48);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    v6[0] = 67240192;
    v6[1] = 1;
    _os_signpost_emit_with_name_impl(&dword_1D5522000, v3, OS_SIGNPOST_INTERVAL_END, v4, "EMMessageListItemReadUnread", "TimedOut=%{public,signpost.telemetry:number1}u enableTelemetry=YES ", (uint8_t *)v6, 8u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "removePendingReadCancelablesForItemID:", *(_QWORD *)(a1 + 40));
}

- (void)removePendingReadCancelablesForItemID:(id)a3
{
  os_unfair_lock_s *p_pendingReadCancelableLock;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  p_pendingReadCancelableLock = &self->pendingReadCancelableLock;
  os_unfair_lock_lock(&self->pendingReadCancelableLock);
  -[MessageListCollectionHelper pendingReadTimeoutCancelables](self, "pendingReadTimeoutCancelables");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "makeObjectsPerformSelector:", sel_cancel);
  -[MessageListCollectionHelper pendingReadTimeoutCancelables](self, "pendingReadTimeoutCancelables");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectForKey:", v8);

  os_unfair_lock_unlock(p_pendingReadCancelableLock);
}

- (EMObjectID)sectionObjectID
{
  return self->_sectionObjectID;
}

- (OS_dispatch_queue)updateQueue
{
  return self->_updateQueue;
}

- (void)setUpdateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_updateQueue, a3);
}

- (int64_t)destructiveActionConversationID
{
  return self->_destructiveActionConversationID;
}

- (void)setDestructiveActionConversationID:(int64_t)a3
{
  self->_destructiveActionConversationID = a3;
}

- (void)setClientLog:(id)a3
{
  objc_storeStrong((id *)&self->_clientLog, a3);
}

- (NSMutableDictionary)pendingReadTimeoutCancelables
{
  return self->_pendingReadTimeoutCancelables;
}

- (void)setPendingReadTimeoutCancelables:(id)a3
{
  objc_storeStrong((id *)&self->_pendingReadTimeoutCancelables, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingReadTimeoutCancelables, 0);
  objc_storeStrong((id *)&self->_clientLog, 0);
  objc_storeStrong((id *)&self->_updateQueue, 0);
  objc_storeStrong((id *)&self->_sectionObjectID, 0);
}

- (void)addItemIDs:(uint64_t)a3 before:(uint64_t)a4 snapshot:(uint64_t)a5 section:(uint64_t)a6 validateOtherSections:(uint64_t)a7 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_1D5522000, a2, a3, "Appending identifiers: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)addItemIDs:(void *)a1 before:snapshot:section:validateOtherSections:.cold.2(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_1(&dword_1D5522000, v1, v2, "Failed to insert %{public}ld identifiers before %{public}@. Could not find validExistingItemId", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1();
}

- (void)addItemIDs:(uint64_t)a3 before:(uint64_t)a4 snapshot:(uint64_t)a5 section:(uint64_t)a6 validateOtherSections:(uint64_t)a7 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_1D5522000, a2, a3, "Inserting identifiers: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)_filterExistingItemIDFromItemIDs:(void *)a1 validExistingItemID:.cold.1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_3_0(&dword_1D5522000, v1, v2, "Inserting existing identifiers (%{public}ld) %@ before or after %{public}@", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_6();
}

- (void)addItemIDs:(void *)a1 after:snapshot:section:validateOtherSections:.cold.1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_1(&dword_1D5522000, v1, v2, "Failed to insert %{public}ld identifiers after %{public}@. Could not find validExistingItemId", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1();
}

- (void)_insertItemIDs:(void *)a1 beforeFirstItemOfSnapshot:section:errorString:.cold.1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_3_0(&dword_1D5522000, v1, v2, "Appending identifiers (%{public}ld) %@ to empty list due to: %{public}@", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_6();
}

- (void)moveItemID:(uint64_t)a1 before:(void *)a2 snapshot:section:.cold.1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a2, "itemIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_1(&dword_1D5522000, v3, v4, "Moving existing identifiers %{public}@ before or after snapshot %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3();
}

@end

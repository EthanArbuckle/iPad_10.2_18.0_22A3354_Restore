@implementation ATXBestContactHandleForServiceDataSource

- (ATXBestContactHandleForServiceDataSource)initWithDevice:(id)a3
{
  id v5;
  ATXBestContactHandleForServiceDataSource *v6;
  ATXBestContactHandleForServiceDataSource *v7;
  id v8;
  void *v9;
  uint64_t v10;
  _PASLock *lock;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ATXBestContactHandleForServiceDataSource;
  v6 = -[ATXBestContactHandleForServiceDataSource init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    v8 = objc_alloc(MEMORY[0x1E0D815F0]);
    v9 = (void *)objc_opt_new();
    v10 = objc_msgSend(v8, "initWithGuardedData:", v9);
    lock = v7->_lock;
    v7->_lock = (_PASLock *)v10;

  }
  return v7;
}

- (void)allHandlesForContact:(id)a3 callback:(id)a4
{
  id v5;
  void (**v6)(id, void *, _QWORD);
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, void *, _QWORD))a4;
  v7 = (void *)objc_opt_new();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(v5, "phoneNumbers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v26;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v12), "value");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "unformattedInternationalStringValue");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v14, "length"))
          objc_msgSend(v7, "addObject:", v14);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v10);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v5, "emailAddresses", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v22;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v22 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v19), "value");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v20, "length"))
          objc_msgSend(v7, "addObject:", v20);

        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v17);
  }

  v6[2](v6, v7, 0);
}

- (void)bestHandleForContact:(id)a3 service:(id)a4 callback:(id)a5
{
  id v7;
  void (**v8)(id, const __CFString *, _QWORD);
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_class *v28;
  const char *v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t k;
  void *v35;
  dispatch_semaphore_t v36;
  void *v37;
  BOOL v38;
  void *v39;
  uint64_t v40;
  void *v41;
  NSObject *v42;
  NSObject *v43;
  _PASLock *lock;
  BOOL v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void (**v51)(id, uint64_t, _QWORD);
  id v52;
  dispatch_queue_t v53;
  void *v54;
  id v55;
  id obj;
  id obja;
  void *v59;
  _QWORD v60[5];
  _QWORD v61[6];
  NSObject *v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t (*v70)(uint64_t, uint64_t);
  void (*v71)(uint64_t);
  id v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  uint8_t buf[4];
  void *v82;
  __int16 v83;
  id v84;
  _BYTE v85[128];
  _BYTE v86[128];
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v55 = a4;
  v8 = (void (**)(id, const __CFString *, _QWORD))a5;
  if ((ATXHeuristicCanLearnFromApp(&unk_1E82D5500) & 1) != 0)
  {
    v51 = (void (**)(id, uint64_t, _QWORD))v8;
    v59 = (void *)objc_opt_new();
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    objc_msgSend(v7, "phoneNumbers");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v87, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v78;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v78 != v10)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v77 + 1) + 8 * i), "value");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_alloc(MEMORY[0x1E0D15880]);
          objc_msgSend(v12, "stringValue");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "givenName");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (void *)objc_msgSend(v13, "initWithIdentifier:type:displayName:personId:personIdType:", v14, 1, v15, v16, 3);

          objc_msgSend(v59, "addObject:", v17);
        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v87, 16);
      }
      while (v9);
    }

    if ((objc_msgSend(v55, "isEqualToString:", *MEMORY[0x1E0D34208]) & 1) == 0)
    {
      v75 = 0u;
      v76 = 0u;
      v73 = 0u;
      v74 = 0u;
      objc_msgSend(v7, "emailAddresses");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v73, v86, 16);
      if (v19)
      {
        v20 = *(_QWORD *)v74;
        do
        {
          for (j = 0; j != v19; ++j)
          {
            if (*(_QWORD *)v74 != v20)
              objc_enumerationMutation(v18);
            objc_msgSend(*(id *)(*((_QWORD *)&v73 + 1) + 8 * j), "value");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_alloc(MEMORY[0x1E0D15880]);
            objc_msgSend(v7, "givenName");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "identifier");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = (void *)objc_msgSend(v23, "initWithIdentifier:type:displayName:personId:personIdType:", v22, 2, v24, v25, 3);

            objc_msgSend(v59, "addObject:", v26);
          }
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v73, v86, 16);
        }
        while (v19);
      }

    }
    objc_msgSend(MEMORY[0x1E0D158C0], "sharedInteractionAdvisor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D158C8], "interactionAdvisorSettingsDefault");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "rankCandidateContacts:usingSettings:", v59, v49);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (objc_class *)objc_opt_class();
    NSStringFromClass(v28);
    obja = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v29 = (const char *)objc_msgSend(obja, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v30 = objc_claimAutoreleasedReturnValue();
    v53 = dispatch_queue_create(v29, v30);

    objc_msgSend(MEMORY[0x1E0D34310], "sharedInstance");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "addDelegate:forService:listenerID:queue:", self, v55, obja, v53);
    v67 = 0;
    v68 = &v67;
    v69 = 0x3032000000;
    v70 = __Block_byref_object_copy__13;
    v71 = __Block_byref_object_dispose__13;
    v72 = 0;
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v52 = v27;
    v31 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v63, v85, 16);
    if (v31)
    {
      v32 = *(_QWORD *)v64;
      v33 = MEMORY[0x1E0C809B0];
      while (2)
      {
        for (k = 0; k != v31; ++k)
        {
          if (*(_QWORD *)v64 != v32)
            objc_enumerationMutation(v52);
          v35 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * k);
          v36 = dispatch_semaphore_create(0);
          objc_msgSend(v35, "identifier");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v37, "rangeOfString:", CFSTR("@")) == 0x7FFFFFFFFFFFFFFFLL;

          objc_msgSend(v35, "identifier");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          if (v38)
            v40 = IDSCopyIDForPhoneNumber();
          else
            v40 = MEMORY[0x1CAA46A58]();
          v41 = (void *)v40;

          if (v41)
          {
            __atxlog_handle_heuristic();
            v42 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              v82 = v41;
              v83 = 2112;
              v84 = v55;
              _os_log_debug_impl(&dword_1C99DF000, v42, OS_LOG_TYPE_DEBUG, "Refreshing ID status for %@ on service %@", buf, 0x16u);
            }

            v61[0] = v33;
            v61[1] = 3221225472;
            v61[2] = __82__ATXBestContactHandleForServiceDataSource_bestHandleForContact_service_callback___block_invoke;
            v61[3] = &unk_1E82C54C8;
            v61[4] = self;
            v61[5] = v35;
            v43 = v36;
            v62 = v43;
            objc_msgSend(v54, "refreshIDStatusForDestination:service:listenerID:queue:completionBlock:", v41, v55, obja, v53, v61);
            objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:", v43, 5.0);
            lock = self->_lock;
            v60[0] = v33;
            v60[1] = 3221225472;
            v60[2] = __82__ATXBestContactHandleForServiceDataSource_bestHandleForContact_service_callback___block_invoke_3;
            v60[3] = &unk_1E82C54F0;
            v60[4] = &v67;
            -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v60);
            v45 = v68[5] == 0;

            if (!v45)
            {

              goto LABEL_35;
            }
          }

        }
        v31 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v63, v85, 16);
        if (v31)
          continue;
        break;
      }
    }
LABEL_35:

    objc_msgSend(v54, "removeDelegate:forService:listenerID:", self, *MEMORY[0x1E0D34240], obja);
    v46 = v68[5];
    if (!v46)
    {
      -[ATXBestContactHandleForServiceDataSource _getBestGuessFromRankedHandle:forService:](self, "_getBestGuessFromRankedHandle:forService:", v52, v55);
      v47 = objc_claimAutoreleasedReturnValue();
      v48 = (void *)v68[5];
      v68[5] = v47;

      v46 = v68[5];
    }
    v51[2](v51, v46, 0);
    _Block_object_dispose(&v67, 8);

    v8 = (void (**)(id, const __CFString *, _QWORD))v51;
  }
  else
  {
    v8[2](v8, &stru_1E82C5A18, 0);
  }

}

intptr_t __82__ATXBestContactHandleForServiceDataSource_bestHandleForContact_service_callback___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  _QWORD v6[5];

  if (a2 == 1)
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __82__ATXBestContactHandleForServiceDataSource_bestHandleForContact_service_callback___block_invoke_2;
    v6[3] = &unk_1E82C54A0;
    v6[4] = v3;
    objc_msgSend(v4, "runWithLockAcquired:", v6);
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void __82__ATXBestContactHandleForServiceDataSource_bestHandleForContact_service_callback___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "identifier");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (id)v3[1];
  v3[1] = v4;

}

void __82__ATXBestContactHandleForServiceDataSource_bestHandleForContact_service_callback___block_invoke_3(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 8));
}

- (id)_getBestGuessFromRankedHandle:(id)a3 forService:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    v11 = *MEMORY[0x1E0D34208];
    while (2)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v12);
        if (objc_msgSend(v6, "isEqualToString:", v11, (_QWORD)v16) && objc_msgSend(v13, "type") == 1)
        {
          objc_msgSend(v13, "identifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_12;
        }
        ++v12;
      }
      while (v9 != v12);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v9)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_12:

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end

@implementation EKAvailabilityCache

- (EKAvailabilityCache)init
{
  return -[EKAvailabilityCache initWithSource:](self, "initWithSource:", 0);
}

- (EKAvailabilityCache)initWithSource:(id)a3
{
  id v4;
  EKAvailabilityCache *v5;
  char v6;
  void *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *addressesToCachedSpanRanges;
  NSMutableDictionary *v10;
  NSMutableDictionary *ignoredEventIDsToAddressBasedCaches;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  const char *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *processingQueue;
  void *v19;
  id v20;
  const char *v21;
  dispatch_queue_t v22;
  OS_dispatch_queue *callbackQueue;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)EKAvailabilityCache;
  v5 = -[EKAvailabilityCache init](&v25, sel_init);
  if (v5)
  {
    if (v4)
      v6 = objc_msgSend(v4, "constraintSupportsAvailabilityRequests");
    else
      v6 = 0;
    objc_msgSend(v4, "externalID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v5->_sourceIsInvalid = 1;
      if (os_log_type_enabled((os_log_t)EKAvailabilityHandle, OS_LOG_TYPE_ERROR))
        -[EKAvailabilityCache initWithSource:].cold.2();
    }
    objc_storeStrong((id *)&v5->_accountID, v7);
    v5->_sourceSupportsAvailabilityRequests = v6;
    v5->_nextRequestID = 0;
    v5->_cancelledID = 0;
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    addressesToCachedSpanRanges = v5->_addressesToCachedSpanRanges;
    v5->_addressesToCachedSpanRanges = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    ignoredEventIDsToAddressBasedCaches = v5->_ignoredEventIDsToAddressBasedCaches;
    v5->_ignoredEventIDsToAddressBasedCaches = v10;

    objc_msgSend(v4, "sourceIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "title");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@-%@-processing"), v13, v12);
    objc_opt_class();
    CalGenerateQualifiedIdentifierWithClassAndSubdomain();
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v16 = (const char *)objc_msgSend(v15, "UTF8String");

    v17 = dispatch_queue_create(v16, 0);
    processingQueue = v5->_processingQueue;
    v5->_processingQueue = (OS_dispatch_queue *)v17;

    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@-%@-callback"), v13, v12);
    objc_opt_class();
    CalGenerateQualifiedIdentifierWithClassAndSubdomain();
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v21 = (const char *)objc_msgSend(v20, "UTF8String");

    v22 = dispatch_queue_create(v21, 0);
    callbackQueue = v5->_callbackQueue;
    v5->_callbackQueue = (OS_dispatch_queue *)v22;

    if (os_log_type_enabled((os_log_t)EKAvailabilityHandle, OS_LOG_TYPE_DEBUG))
      -[EKAvailabilityCache initWithSource:].cold.1();

  }
  return v5;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = objc_alloc(MEMORY[0x1E0D0C2D0]);
  v8.receiver = self;
  v8.super_class = (Class)EKAvailabilityCache;
  -[EKAvailabilityCache description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithSuperclassDescription:", v4);

  objc_msgSend(v5, "setKey:withString:", CFSTR("accountID"), self->_accountID);
  objc_msgSend(v5, "setKey:withBoolean:", CFSTR("sourceIsInvalid"), self->_sourceIsInvalid);
  objc_msgSend(v5, "setKey:withBoolean:", CFSTR("sourceSupportsAvailabilityRequests"), self->_sourceSupportsAvailabilityRequests);
  objc_msgSend(v5, "setKey:withDictionary:", CFSTR("addressesToCachedSpanRanges"), self->_addressesToCachedSpanRanges);
  objc_msgSend(v5, "setKey:withDictionary:", CFSTR("ignoredEventIDsToAddressBasedCaches"), self->_ignoredEventIDsToAddressBasedCaches);
  objc_msgSend(v5, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_cachedSpanResultsBetweenStartDate:(id)a3 endDate:(id)a4 ignoredEventID:(id)a5 addresses:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  uint64_t v28;
  __int128 v30;
  void *v31;
  id v32;
  id obj;
  id v34;
  uint8_t v35;
  _BYTE v36[15];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  id v44;
  __int16 v45;
  id v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v34 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_processingQueue);
  v31 = v11;
  -[EKAvailabilityCache _dictionaryForIgnoredEventID:](self, "_dictionaryForIgnoredEventID:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = v12;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
  if (v14)
  {
    v16 = v14;
    v17 = *(_QWORD *)v38;
    *(_QWORD *)&v15 = 138412546;
    v30 = v15;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v38 != v17)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v18);
        v20 = EKAvailabilityHandle;
        if (os_log_type_enabled((os_log_t)EKAvailabilityHandle, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v42 = v19;
          _os_log_debug_impl(&dword_1A2318000, v20, OS_LOG_TYPE_DEBUG, "Gathering cached availability for address: [%@]", buf, 0xCu);
        }
        objc_msgSend(v13, "objectForKey:", v19, v30);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21
          || (EKUtils_AdjustedAttendeeAddress(v19),
              v22 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v13, "objectForKey:", v22),
              v21 = (void *)objc_claimAutoreleasedReturnValue(),
              v22,
              v21))
        {
          objc_msgSend(v21, "gatherFreshlyCachedSpansBetweenStartDate:endDate:", v34, v10);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v23;
          if (v23 && objc_msgSend(v23, "count"))
          {
            v25 = EKAvailabilityHandle;
            if (os_log_type_enabled((os_log_t)EKAvailabilityHandle, OS_LOG_TYPE_DEBUG))
              -[EKAvailabilityCache _cachedSpanResultsBetweenStartDate:endDate:ignoredEventID:addresses:].cold.1(&v35, v36, v25);
            CalAnalyticsSendEvent();
            objc_msgSend(v32, "setObject:forKey:", v24, v19);
          }
          else
          {
            v26 = EKAvailabilityHandle;
            if (os_log_type_enabled((os_log_t)EKAvailabilityHandle, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412802;
              v42 = v19;
              v43 = 2112;
              v44 = v34;
              v45 = 2112;
              v46 = v10;
              _os_log_debug_impl(&dword_1A2318000, v26, OS_LOG_TYPE_DEBUG, "Found stale cached spans for address [%@] in range with start date [%@] and end date: [%@].  Will send out remote fetch for availability.", buf, 0x20u);
            }
            CalAnalyticsSendEvent();
          }

        }
        else
        {
          v27 = EKAvailabilityHandle;
          if (os_log_type_enabled((os_log_t)EKAvailabilityHandle, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v30;
            v42 = v19;
            v43 = 2112;
            v44 = v31;
            _os_log_debug_impl(&dword_1A2318000, v27, OS_LOG_TYPE_DEBUG, "No cached spans found for address: [%@].  Ignored event ID: [%@].  Will send out remote fetch for availability.", buf, 0x16u);
          }
        }
        ++v18;
      }
      while (v16 != v18);
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
      v16 = v28;
    }
    while (v28);
  }

  return v32;
}

- (BOOL)_validateRequestStartDate:(id)a3 endDate:(id)a4 addresses:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (self->_sourceIsInvalid)
  {
    if (os_log_type_enabled((os_log_t)EKAvailabilityHandle, OS_LOG_TYPE_ERROR))
      -[EKAvailabilityCache _validateRequestStartDate:endDate:addresses:error:].cold.4();
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = 0;
LABEL_5:
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("EKAvailabilityCacheError"), v14, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  if (!self->_sourceSupportsAvailabilityRequests)
  {
    v18 = EKAvailabilityHandle;
    if (os_log_type_enabled((os_log_t)EKAvailabilityHandle, OS_LOG_TYPE_DEBUG))
      -[EKAvailabilityCache _validateRequestStartDate:endDate:addresses:error:].cold.1((uint64_t)self, v18);
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = 1;
    goto LABEL_5;
  }
  if ((objc_msgSend((id)objc_opt_class(), "_isValidStartDate:endDate:", v10, v11) & 1) == 0)
  {
    v19 = EKAvailabilityHandle;
    if (os_log_type_enabled((os_log_t)EKAvailabilityHandle, OS_LOG_TYPE_ERROR))
      -[EKAvailabilityCache _validateRequestStartDate:endDate:addresses:error:].cold.3(v19);
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = 2;
    goto LABEL_5;
  }
  if (v12 && objc_msgSend(v12, "count"))
  {
    v15 = 0;
    v16 = 1;
    if (!a6)
      goto LABEL_8;
    goto LABEL_7;
  }
  v20 = EKAvailabilityHandle;
  if (os_log_type_enabled((os_log_t)EKAvailabilityHandle, OS_LOG_TYPE_DEBUG))
    -[EKAvailabilityCache _validateRequestStartDate:endDate:addresses:error:].cold.2(v20, v21, v22);
  v15 = 0;
LABEL_6:
  v16 = 0;
  if (a6)
LABEL_7:
    *a6 = objc_retainAutorelease(v15);
LABEL_8:

  return v16;
}

- (id)requestAvailabilityBetweenStartDate:(id)a3 endDate:(id)a4 ignoredEventID:(id)a5 addresses:(id)a6 resultsBlock:(id)a7 completionBlock:(id)a8
{
  id v14;
  id v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  BOOL v21;
  id v22;
  NSObject *processingQueue;
  _BOOL4 v24;
  NSObject *callbackQueue;
  id v26;
  _QWORD v28[4];
  id v29;
  id v30;
  _QWORD block[5];
  id v32;
  id v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  id v35;
  id v36;
  id v37;
  uint64_t *v38;
  _BYTE *v39;
  id v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  char v44;
  _BYTE buf[24];
  uint64_t (*v46)(uint64_t, uint64_t);
  __int128 v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = (uint64_t (*)(uint64_t, uint64_t))a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = EKAvailabilityHandle;
  if (os_log_type_enabled((os_log_t)EKAvailabilityHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)&buf[4] = v14;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v15;
    *(_WORD *)&buf[22] = 2112;
    v46 = v16;
    LOWORD(v47) = 2112;
    *(_QWORD *)((char *)&v47 + 2) = v17;
    _os_log_debug_impl(&dword_1A2318000, v20, OS_LOG_TYPE_DEBUG, "A client requested availability between start date [%@] and end date [%@].  Ignored event ID: [%@].  Addresses: [%@]", buf, 0x2Au);
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v46 = __Block_byref_object_copy_;
  *(_QWORD *)&v47 = __Block_byref_object_dispose_;
  *((_QWORD *)&v47 + 1) = 0;
  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = 0;
  v40 = 0;
  v21 = -[EKAvailabilityCache _validateRequestStartDate:endDate:addresses:error:](self, "_validateRequestStartDate:endDate:addresses:error:", v14, v15, v17, &v40);
  v22 = v40;
  if (v21)
  {
    processingQueue = self->_processingQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __121__EKAvailabilityCache_requestAvailabilityBetweenStartDate_endDate_ignoredEventID_addresses_resultsBlock_completionBlock___block_invoke;
    block[3] = &unk_1E4784E90;
    block[4] = self;
    v32 = v14;
    v33 = v15;
    v34 = v16;
    v35 = v17;
    v36 = v18;
    v38 = &v41;
    v39 = buf;
    v37 = v19;
    dispatch_sync(processingQueue, block);

    v24 = *((_BYTE *)v42 + 24) != 0;
    if (!v19)
      goto LABEL_9;
  }
  else
  {
    v24 = 1;
    *((_BYTE *)v42 + 24) = 1;
    if (!v19)
      goto LABEL_9;
  }
  if (v24)
  {
    callbackQueue = self->_callbackQueue;
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __121__EKAvailabilityCache_requestAvailabilityBetweenStartDate_endDate_ignoredEventID_addresses_resultsBlock_completionBlock___block_invoke_3;
    v28[3] = &unk_1E4784D78;
    v30 = v19;
    v29 = v22;
    dispatch_async(callbackQueue, v28);

  }
LABEL_9:
  v26 = *(id *)(*(_QWORD *)&buf[8] + 40);

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(buf, 8);

  return v26;
}

void __121__EKAvailabilityCache_requestAvailabilityBetweenStartDate_endDate_ignoredEventID_addresses_resultsBlock_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(uint64_t, void *);
  void *v38;
  id v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD v44[4];
  id v45;
  uint64_t v46;
  id v47;
  id v48;
  uint64_t v49;
  _QWORD v50[4];
  id v51;
  _QWORD block[4];
  id v53;
  id v54;
  uint8_t buf[4];
  uint64_t v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  uint64_t v60;
  __int16 v61;
  uint64_t v62;
  __int16 v63;
  uint64_t v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_cachedSpanResultsBetweenStartDate:endDate:ignoredEventID:addresses:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");
  v4 = MEMORY[0x1E0C809B0];
  if (v3)
  {
    v5 = v3;
    v6 = (void *)EKAvailabilityHandle;
    if (os_log_type_enabled((os_log_t)EKAvailabilityHandle, OS_LOG_TYPE_DEBUG))
    {
      v28 = v6;
      objc_msgSend(v2, "allKeys");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 134218498;
      v56 = v5;
      v57 = 2112;
      v58 = v29;
      v59 = 2112;
      v60 = v30;
      _os_log_debug_impl(&dword_1A2318000, v28, OS_LOG_TYPE_DEBUG, "[%lu] local cached spans were found for addresses: [%@].  Ignored event ID: [%@].  Sending these results immediately to the requesting client.", buf, 0x20u);

    }
    v7 = *(void **)(a1 + 72);
    if (v7)
    {
      v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
      block[0] = v4;
      block[1] = 3221225472;
      block[2] = __121__EKAvailabilityCache_requestAvailabilityBetweenStartDate_endDate_ignoredEventID_addresses_resultsBlock_completionBlock___block_invoke_26;
      block[3] = &unk_1E4784D78;
      v54 = v7;
      v53 = v2;
      dispatch_async(v8, block);

    }
  }
  v9 = *(void **)(a1 + 64);
  v10 = (void *)MEMORY[0x1E0CB3880];
  v50[0] = v4;
  v50[1] = 3221225472;
  v50[2] = __121__EKAvailabilityCache_requestAvailabilityBetweenStartDate_endDate_ignoredEventID_addresses_resultsBlock_completionBlock___block_invoke_2;
  v50[3] = &unk_1E4784DA0;
  v11 = v2;
  v51 = v11;
  objc_msgSend(v10, "predicateWithBlock:", v50);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "filteredArrayUsingPredicate:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "count");
  if (v14)
  {
    v15 = v14;
    v16 = EKAvailabilityHandle;
    if (os_log_type_enabled((os_log_t)EKAvailabilityHandle, OS_LOG_TYPE_DEBUG))
    {
      v31 = *(_QWORD *)(a1 + 48);
      v32 = *(_QWORD *)(a1 + 56);
      v33 = *(void **)(a1 + 40);
      v34 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
      *(_DWORD *)buf = 138413314;
      v56 = (uint64_t)v13;
      v57 = 2112;
      v58 = v33;
      v59 = 2112;
      v60 = v31;
      v61 = 2112;
      v62 = v32;
      v63 = 2112;
      v64 = v34;
      _os_log_debug_impl(&dword_1A2318000, v16, OS_LOG_TYPE_DEBUG, "Sending network request for addresses: [%@].  Start date: [%@].  End date: [%@]  Ignored event ID: [%@].  Account ID: [%@]", buf, 0x34u);
    }
    v17 = objc_alloc_init(MEMORY[0x1E0D0C3B0]);
    objc_msgSend(v17, "start");
    v44[0] = v4;
    v44[1] = 3221225472;
    v44[2] = __121__EKAvailabilityCache_requestAvailabilityBetweenStartDate_endDate_ignoredEventID_addresses_resultsBlock_completionBlock___block_invoke_31;
    v44[3] = &unk_1E4784DF0;
    v49 = *(_QWORD *)(a1 + 96);
    v18 = v17;
    v19 = *(_QWORD *)(a1 + 32);
    v45 = v18;
    v46 = v19;
    v48 = *(id *)(a1 + 72);
    v47 = *(id *)(a1 + 56);
    v20 = (void *)MEMORY[0x1A85849D4](v44);
    v35 = v4;
    v36 = 3221225472;
    v37 = __121__EKAvailabilityCache_requestAvailabilityBetweenStartDate_endDate_ignoredEventID_addresses_resultsBlock_completionBlock___block_invoke_2_34;
    v38 = &unk_1E4784E68;
    v42 = *(_QWORD *)(a1 + 96);
    v21 = *(_QWORD *)(a1 + 32);
    v39 = v18;
    v40 = v21;
    v41 = *(id *)(a1 + 80);
    v43 = v15;
    v22 = v18;
    v23 = (void *)MEMORY[0x1A85849D4](&v35);
    objc_msgSend(MEMORY[0x1E0D1C3F8], "sharedConnection");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "requestCalendarAvailabilityWithAccountID:startDate:endDate:ignoredEventID:addresses:resultsBlock:completionBlock:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v13, v20, v23, v35, v36, v37, v38);
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
    v27 = *(void **)(v26 + 40);
    *(_QWORD *)(v26 + 40) = v25;

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 1;
  }

}

uint64_t __121__EKAvailabilityCache_requestAvailabilityBetweenStartDate_endDate_ignoredEventID_addresses_resultsBlock_completionBlock___block_invoke_26(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

BOOL __121__EKAvailabilityCache_requestAvailabilityBetweenStartDate_endDate_ignoredEventID_addresses_resultsBlock_completionBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

void __121__EKAvailabilityCache_requestAvailabilityBetweenStartDate_endDate_ignoredEventID_addresses_resultsBlock_completionBlock___block_invoke_31(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;

  v3 = a2;
  v4 = (void *)EKAvailabilityHandle;
  if (os_log_type_enabled((os_log_t)EKAvailabilityHandle, OS_LOG_TYPE_DEBUG))
    __121__EKAvailabilityCache_requestAvailabilityBetweenStartDate_endDate_ignoredEventID_addresses_resultsBlock_completionBlock___block_invoke_31_cold_1(a1, (uint64_t)v3, v4);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(NSObject **)(v5 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __121__EKAvailabilityCache_requestAvailabilityBetweenStartDate_endDate_ignoredEventID_addresses_resultsBlock_completionBlock___block_invoke_32;
  v8[3] = &unk_1E4784DC8;
  v8[4] = v5;
  v9 = v3;
  v11 = *(id *)(a1 + 56);
  v10 = *(id *)(a1 + 48);
  v7 = v3;
  dispatch_async(v6, v8);

}

uint64_t __121__EKAvailabilityCache_requestAvailabilityBetweenStartDate_endDate_ignoredEventID_addresses_resultsBlock_completionBlock___block_invoke_32(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleResults:resultsBlock:ignoredEventID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

void __121__EKAvailabilityCache_requestAvailabilityBetweenStartDate_endDate_ignoredEventID_addresses_resultsBlock_completionBlock___block_invoke_2_34(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;
  double v12;
  uint64_t v13;

  v3 = a2;
  v4 = (void *)EKAvailabilityHandle;
  if (os_log_type_enabled((os_log_t)EKAvailabilityHandle, OS_LOG_TYPE_DEBUG))
    __121__EKAvailabilityCache_requestAvailabilityBetweenStartDate_endDate_ignoredEventID_addresses_resultsBlock_completionBlock___block_invoke_2_34_cold_1(a1, (uint64_t)v3, v4);
  v5 = (double)(unint64_t)objc_msgSend(*(id *)(a1 + 32), "elapsedTimeAsNumber:", 1);
  v6 = *(void **)(a1 + 48);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __121__EKAvailabilityCache_requestAvailabilityBetweenStartDate_endDate_ignoredEventID_addresses_resultsBlock_completionBlock___block_invoke_35;
  block[3] = &unk_1E4784E40;
  v10 = v3;
  v11 = v6;
  block[4] = *(_QWORD *)(a1 + 40);
  v12 = v5;
  v13 = *(_QWORD *)(a1 + 64);
  v8 = v3;
  dispatch_async(v7, block);

}

uint64_t __121__EKAvailabilityCache_requestAvailabilityBetweenStartDate_endDate_ignoredEventID_addresses_resultsBlock_completionBlock___block_invoke_35(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  _QWORD v5[4];
  id v6;
  id v7;

  if (*(_QWORD *)(a1 + 48))
  {
    v2 = *(void **)(a1 + 40);
    v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __121__EKAvailabilityCache_requestAvailabilityBetweenStartDate_endDate_ignoredEventID_addresses_resultsBlock_completionBlock___block_invoke_2_36;
    v5[3] = &unk_1E4784E18;
    v6 = v2;
    v7 = *(id *)(a1 + 48);
    dispatch_async(v3, v5);

  }
  return objc_msgSend((id)objc_opt_class(), "_logRequestElapsedTime:forNumberOfAddresses:", *(_QWORD *)(a1 + 64), *(double *)(a1 + 56));
}

void __121__EKAvailabilityCache_requestAvailabilityBetweenStartDate_endDate_ignoredEventID_addresses_resultsBlock_completionBlock___block_invoke_2_36(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0CB35C8];
    v6 = *MEMORY[0x1E0CB3388];
    v7[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("EKAvailabilityCacheError"), 3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __121__EKAvailabilityCache_requestAvailabilityBetweenStartDate_endDate_ignoredEventID_addresses_resultsBlock_completionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)cachedAvailabilityInDateRange:(id)a3 ignoredEventID:(id)a4 addresses:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  NSObject *processingQueue;
  id v15;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  v27 = 0;
  objc_msgSend(v8, "startDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[EKAvailabilityCache _validateRequestStartDate:endDate:addresses:error:](self, "_validateRequestStartDate:endDate:addresses:error:", v11, v12, v10, 0);

  if (v13)
  {
    processingQueue = self->_processingQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __78__EKAvailabilityCache_cachedAvailabilityInDateRange_ignoredEventID_addresses___block_invoke;
    block[3] = &unk_1E4784EB8;
    v21 = &v22;
    block[4] = self;
    v18 = v8;
    v19 = v9;
    v20 = v10;
    dispatch_sync(processingQueue, block);

  }
  v15 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  return v15;
}

void __78__EKAvailabilityCache_cachedAvailabilityInDateRange_ignoredEventID_addresses___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "startDate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "endDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_cachedSpanResultsBetweenStartDate:endDate:ignoredEventID:addresses:", v7, v3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (void)cachedAvailabilityInDateRange:(id)a3 ignoredEventID:(id)a4 addresses:(id)a5 results:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  NSObject *processingQueue;
  _QWORD block[5];
  id v19;
  id v20;
  id v21;
  id v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v10, "startDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "endDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[EKAvailabilityCache _validateRequestStartDate:endDate:addresses:error:](self, "_validateRequestStartDate:endDate:addresses:error:", v14, v15, v12, 0);

  if (v16)
  {
    processingQueue = self->_processingQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __86__EKAvailabilityCache_cachedAvailabilityInDateRange_ignoredEventID_addresses_results___block_invoke;
    block[3] = &unk_1E4784EE0;
    block[4] = self;
    v19 = v10;
    v20 = v11;
    v21 = v12;
    v22 = v13;
    dispatch_async(processingQueue, block);

  }
  else
  {
    (*((void (**)(id, _QWORD))v13 + 2))(v13, 0);
  }

}

void __86__EKAvailabilityCache_cachedAvailabilityInDateRange_ignoredEventID_addresses_results___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "endDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_cachedSpanResultsBetweenStartDate:endDate:ignoredEventID:addresses:", v3, v4, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

- (void)cancelAvailabilityRequestWithID:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)EKAvailabilityHandle, OS_LOG_TYPE_DEBUG))
      -[EKAvailabilityCache cancelAvailabilityRequestWithID:].cold.1();
    objc_msgSend(MEMORY[0x1E0D1C3F8], "sharedConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cancelCalendarAvailabilityRequestWithID:", v3);

  }
}

- (void)_handleResults:(id)a3 resultsBlock:(id)a4 ignoredEventID:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  NSObject *callbackQueue;
  _QWORD v15[4];
  id v16;
  EKAvailabilityCache *v17;
  _QWORD block[4];
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8 && objc_msgSend(v8, "count"))
  {
    v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v12 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __66__EKAvailabilityCache__handleResults_resultsBlock_ignoredEventID___block_invoke;
    v21[3] = &unk_1E4784F08;
    v21[4] = self;
    v13 = v11;
    v22 = v13;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v21);
    if (v9)
    {
      callbackQueue = self->_callbackQueue;
      block[0] = v12;
      block[1] = 3221225472;
      block[2] = __66__EKAvailabilityCache__handleResults_resultsBlock_ignoredEventID___block_invoke_2;
      block[3] = &unk_1E4784D78;
      v20 = v9;
      v19 = v13;
      dispatch_async(callbackQueue, block);

    }
    v15[0] = v12;
    v15[1] = 3221225472;
    v15[2] = __66__EKAvailabilityCache__handleResults_resultsBlock_ignoredEventID___block_invoke_3;
    v15[3] = &unk_1E4784F08;
    v16 = v10;
    v17 = self;
    objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v15);

  }
}

void __66__EKAvailabilityCache__handleResults_resultsBlock_ignoredEventID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "_generateEventKitSpansFromPersistenceSpans:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v6, v7);

}

uint64_t __66__EKAvailabilityCache__handleResults_resultsBlock_ignoredEventID___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __66__EKAvailabilityCache__handleResults_resultsBlock_ignoredEventID___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  EKAvailabilityCachedSpanRange *v8;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(*(id *)(a1 + 40), "_dictionaryForIgnoredEventID:", *(_QWORD *)(a1 + 32));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v5);
    v8 = (EKAvailabilityCachedSpanRange *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v8 = objc_alloc_init(EKAvailabilityCachedSpanRange);
      objc_msgSend(v7, "setObject:forKey:", v8, v5);
    }
    -[EKAvailabilityCachedSpanRange insertSpans:](v8, "insertSpans:", v6);

  }
  else if (os_log_type_enabled((os_log_t)EKAvailabilityHandle, OS_LOG_TYPE_ERROR))
  {
    __66__EKAvailabilityCache__handleResults_resultsBlock_ignoredEventID___block_invoke_3_cold_1();
  }

}

- (id)_dictionaryForIgnoredEventID:(id)a3
{
  id v4;
  NSMutableDictionary *v5;

  v4 = a3;
  if (v4)
  {
    -[NSMutableDictionary objectForKey:](self->_ignoredEventIDsToAddressBasedCaches, "objectForKey:", v4);
    v5 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      -[NSMutableDictionary setObject:forKey:](self->_ignoredEventIDsToAddressBasedCaches, "setObject:forKey:", v5, v4);
    }
  }
  else
  {
    v5 = self->_addressesToCachedSpanRanges;
  }

  return v5;
}

+ (BOOL)_isValidStartDate:(id)a3 endDate:(id)a4
{
  BOOL result;

  result = 0;
  if (a3)
  {
    if (a4)
      return objc_msgSend(a3, "CalIsAfterDate:", a4) ^ 1;
  }
  return result;
}

+ (id)_generateEventKitSpansFromPersistenceSpans:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v5);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66__EKAvailabilityCache__generateEventKitSpansFromPersistenceSpans___block_invoke;
  v9[3] = &unk_1E4784F30;
  v11 = a1;
  v7 = v6;
  v10 = v7;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);

  return v7;
}

void __66__EKAvailabilityCache__generateEventKitSpansFromPersistenceSpans___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  EKAvailabilitySpan *v6;
  id v7;

  v3 = a2;
  v4 = objc_msgSend(v3, "type");
  objc_msgSend(v3, "startDate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[EKAvailabilitySpan initWithStartDate:endDate:type:]([EKAvailabilitySpan alloc], "initWithStartDate:endDate:type:", v7, v5, objc_msgSend((id)objc_opt_class(), "_convertType:", v4));
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);

}

+ (int64_t)_convertType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 6)
    return 0;
  else
    return a3;
}

+ (void)_logRequestElapsedTime:(double)a3 forNumberOfAddresses:(unint64_t)a4
{
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (a4 >= 3)
  {
    if (a4 >= 6)
    {
      if (a4 >= 0xB)
      {
        if (a4 >= 0x10)
        {
          if (a4 >= 0x15)
          {
            if (a4 >= 0x1A)
            {
              if (a4 >= 0x33)
              {
                if (a4 >= 0x65)
                {
                  if (a4 >= 0x97)
                  {
                    v5 = CFSTR("(201+)");
                    if (a4 < 0xC9)
                      v5 = CFSTR("(151-200)");
                  }
                  else
                  {
                    v5 = CFSTR("(101-150)");
                  }
                }
                else
                {
                  v5 = CFSTR("(51-100)");
                }
              }
              else
              {
                v5 = CFSTR("(26-50)");
              }
            }
            else
            {
              v5 = CFSTR("(21-25)");
            }
          }
          else
          {
            v5 = CFSTR("(16-20)");
          }
        }
        else
        {
          v5 = CFSTR("(11-15)");
        }
      }
      else
      {
        v5 = CFSTR("(6-10)");
      }
    }
    else
    {
      v5 = CFSTR("(3-5)");
    }
  }
  else
  {
    v5 = off_1E4784F50[a4];
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AvailabilityCacheRoundtripTimeInMilliseconds-%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("elapsedTime");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  CalAnalyticsSendEvent();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ignoredEventIDsToAddressBasedCaches, 0);
  objc_storeStrong((id *)&self->_addressesToCachedSpanRanges, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
}

- (void)initWithSource:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8(&dword_1A2318000, v0, v1, "[%@] initialized.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithSource:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7(&dword_1A2318000, v0, v1, "The given source's 'accountID' is nil.  The availability cache will not be able to give availability data.  Cache: [%@]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_cachedSpanResultsBetweenStartDate:(NSObject *)a3 endDate:ignoredEventID:addresses:.cold.1(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_9(&dword_1A2318000, a3, (uint64_t)a3, "Cache hit.   freshly cached spans found.", a1);
}

- (void)_validateRequestStartDate:(uint64_t)a1 endDate:(NSObject *)a2 addresses:error:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 16);
  v3 = 138412546;
  v4 = v2;
  v5 = 2112;
  v6 = a1;
  _os_log_debug_impl(&dword_1A2318000, a2, OS_LOG_TYPE_DEBUG, "This availability cache's source does not support availability requests. Will not execute the availability request.  Source account ID: [%@]. Cache: [%@].", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_validateRequestStartDate:(uint64_t)a3 endDate:addresses:error:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_9(&dword_1A2318000, a1, a3, "No addresses given in the availability request.  Completing quickly.", v3);
}

- (void)_validateRequestStartDate:(os_log_t)log endDate:addresses:error:.cold.3(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A2318000, log, OS_LOG_TYPE_ERROR, "Invalid start and end dates given.  Will not execute the availability request.", v1, 2u);
}

- (void)_validateRequestStartDate:endDate:addresses:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7(&dword_1A2318000, v0, v1, "This availability cache's source is invalid.  Will not execute the availability request.  Cache: [%@]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __121__EKAvailabilityCache_requestAvailabilityBetweenStartDate_endDate_ignoredEventID_addresses_resultsBlock_completionBlock___block_invoke_31_cold_1(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_4(a1, a2, a3);
  v4 = OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_4((double)(unint64_t)v4, 1000000.0);
  OUTLINED_FUNCTION_2(&dword_1A2318000, v5, v6, "Availability request with ID [%@] received a response with results: [%@]. Elapsed milliseconds: [%f]", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_5_0();
}

void __121__EKAvailabilityCache_requestAvailabilityBetweenStartDate_endDate_ignoredEventID_addresses_resultsBlock_completionBlock___block_invoke_2_34_cold_1(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_4(a1, a2, a3);
  v4 = OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_4((double)(unint64_t)v4, 1000000.0);
  OUTLINED_FUNCTION_2(&dword_1A2318000, v5, v6, "Availability request with ID [%@] completed with error: [%@].  Total elapsed milliseconds: [%f]", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_5_0();
}

- (void)cancelAvailabilityRequestWithID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8(&dword_1A2318000, v0, v1, "Cancelling availability request with request ID: [%@]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __66__EKAvailabilityCache__handleResults_resultsBlock_ignoredEventID___block_invoke_3_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_1A2318000, v1, OS_LOG_TYPE_ERROR, "No spans were returned for address [%@] and ignored event ID [%@]", v2, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

@end

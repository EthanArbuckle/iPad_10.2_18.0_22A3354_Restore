@implementation EDMessageCategorizer

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__EDMessageCategorizer_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_47 != -1)
    dispatch_once(&log_onceToken_47, block);
  return (id)log_log_47;
}

void __27__EDMessageCategorizer_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_47;
  log_log_47 = (uint64_t)v1;

}

+ (OS_os_log)signpostLog
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__EDMessageCategorizer_signpostLog__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (signpostLog_onceToken_1 != -1)
    dispatch_once(&signpostLog_onceToken_1, block);
  return (OS_os_log *)(id)signpostLog_log_1;
}

void __35__EDMessageCategorizer_signpostLog__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email.signposts", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)signpostLog_log_1;
  signpostLog_log_1 = (uint64_t)v1;

}

- (unint64_t)signpostID
{
  NSObject *v3;
  os_signpost_id_t v4;

  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_make_with_pointer(v3, self);

  return v4;
}

+ (EDMessageCategorizationResult)noneMessageCategorizationResult
{
  if (noneMessageCategorizationResult_onceToken != -1)
    dispatch_once(&noneMessageCategorizationResult_onceToken, &__block_literal_global_77);
  return (EDMessageCategorizationResult *)(id)noneMessageCategorizationResult_sInstance;
}

void __55__EDMessageCategorizer_noneMessageCategorizationResult__block_invoke()
{
  EDMessageCategorizationResult *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [EDMessageCategorizationResult alloc];
  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E110]), "initWithType:subtype:isHighImpact:state:", 0, 0, 0, 1);
  v1 = -[EDMessageCategorizationResult initWithCategory:metadata:](v0, "initWithCategory:metadata:");
  v2 = (void *)noneMessageCategorizationResult_sInstance;
  noneMessageCategorizationResult_sInstance = v1;

}

- (EDMessageCategorizer)initWithCategoryPersistence:(id)a3 eventLog:(id)a4 vipManager:(id)a5 contactStore:(id)a6 analyticsLogger:(id)a7 senderPersistence:(id)a8 hookRegistry:(id)a9
{
  id v16;
  id v17;
  id v18;
  EDMessageCategorizer *v19;
  NSObject *v20;
  NSObject *v21;
  dispatch_queue_t v22;
  OS_dispatch_queue *processingQueue;
  uint64_t v24;
  NSConditionLock *categorizationState;
  uint64_t v26;
  EMCachingContactStore *contactStore;
  ECDKIMVerifier *v28;
  ECDKIMVerifier *verifier;
  NSObject *v30;
  id v31;
  uint64_t v32;
  EMNSUserDefaultsBoolObserver *automaticallySummarizeMessages;
  id v35;
  id v36;
  id v37;
  id v38;
  _QWORD block[4];
  id v40;
  id location;
  objc_super v42;

  v38 = a3;
  v37 = a4;
  v36 = a5;
  v16 = a6;
  v35 = a7;
  v17 = a8;
  v18 = a9;
  v42.receiver = self;
  v42.super_class = (Class)EDMessageCategorizer;
  v19 = -[EDMessageCategorizer init](&v42, sel_init);
  if (v19)
  {
    if (LoadicloudMCCKit_loadPredicate != -1)
      dispatch_once(&LoadicloudMCCKit_loadPredicate, &__block_literal_global_320);
    objc_storeStrong((id *)&v19->_persistence, a3);
    objc_storeStrong((id *)&v19->_eventLog, a4);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v20 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v20, QOS_CLASS_UTILITY, 0);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = dispatch_queue_create("com.apple.email.EDMessageCategorizer", v21);
    processingQueue = v19->_processingQueue;
    v19->_processingQueue = (OS_dispatch_queue *)v22;

    v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3538]), "initWithCondition:", 1, v35, v36, v37, v38);
    categorizationState = v19->_categorizationState;
    v19->_categorizationState = (NSConditionLock *)v24;

    objc_storeStrong((id *)&v19->_vipManager, a5);
    if ((_os_feature_enabled_impl() & 1) != 0
      || _os_feature_enabled_impl() && EMIsGreymatterSupportedWithOverride())
    {
      v26 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1E108]), "initWithStore:options:", v16, 2);
      contactStore = v19->_contactStore;
      v19->_contactStore = (EMCachingContactStore *)v26;

    }
    objc_storeStrong((id *)&v19->_analyticsLogger, a7);
    objc_storeStrong((id *)&v19->_senderPersistence, a8);
    v28 = (ECDKIMVerifier *)objc_alloc_init(MEMORY[0x1E0D1E6B0]);
    verifier = v19->_verifier;
    v19->_verifier = v28;

    objc_msgSend(v18, "registerMessageChangeHookResponder:", v19);
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v19);
    v30 = v19->_processingQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __132__EDMessageCategorizer_initWithCategoryPersistence_eventLog_vipManager_contactStore_analyticsLogger_senderPersistence_hookRegistry___block_invoke;
    block[3] = &unk_1E949C258;
    objc_copyWeak(&v40, &location);
    dispatch_async(v30, block);
    if (_os_feature_enabled_impl() && EMIsGreymatterSupportedWithOverride())
    {
      v31 = objc_alloc(MEMORY[0x1E0D1E2A0]);
      v32 = objc_msgSend(v31, "initWithUserDefaultKey:keyRepresentsDisabled:handler:", *MEMORY[0x1E0D1E018], 1, 0);
      automaticallySummarizeMessages = v19->_automaticallySummarizeMessages;
      v19->_automaticallySummarizeMessages = (EMNSUserDefaultsBoolObserver *)v32;

    }
    objc_destroyWeak(&v40);
    objc_destroyWeak(&location);
  }

  return v19;
}

void __132__EDMessageCategorizer_initWithCategoryPersistence_eventLog_vipManager_contactStore_analyticsLogger_senderPersistence_hookRegistry___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "categorizationState");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "lock");

  objc_msgSend(WeakRetained, "categorizationState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unlockWithCondition:", 0);

}

- (BOOL)_shouldGenerateSummaries
{
  void *v3;
  char v4;

  if (!_os_feature_enabled_impl() || !EMIsGreymatterAvailableWithOverride())
    return 0;
  -[EDMessageCategorizer automaticallySummarizeMessages](self, "automaticallySummarizeMessages");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEnabled");

  return v4;
}

- (void)persistenceWillAddNewMessages:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  void (**v11)(void *, uint64_t);
  id v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD aBlock[4];
  id v21;
  os_signpost_id_t v22;
  uint8_t buf[4];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((_os_feature_enabled_impl() & 1) != 0
    || -[EDMessageCategorizer _shouldGenerateSummaries](self, "_shouldGenerateSummaries"))
  {
    +[EDMessageCategorizer signpostLog](EDMessageCategorizer, "signpostLog");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_signpost_id_make_with_pointer(v5, (const void *)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"));

    +[EDMessageCategorizer signpostLog](EDMessageCategorizer, "signpostLog");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      *(_DWORD *)buf = 134349056;
      v24 = objc_msgSend(v4, "count");
      _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "EDMessageCategorization", "Begin message categorization (count=%{public,signpost.telemetry:number1}lu) enableTelemetry=YES ", buf, 0xCu);
    }

    v9 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __54__EDMessageCategorizer_persistenceWillAddNewMessages___block_invoke;
    aBlock[3] = &unk_1E949CFD8;
    v22 = v6;
    v10 = v4;
    v21 = v10;
    v11 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
    objc_msgSend(MEMORY[0x1E0C99D68], "ef_dateHoursAgo:", 24);
    v18[0] = v9;
    v18[1] = 3221225472;
    v18[2] = __54__EDMessageCategorizer_persistenceWillAddNewMessages___block_invoke_94;
    v18[3] = &unk_1E949D028;
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v19 = v12;
    objc_msgSend(v10, "ef_filter:", v18);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    -[EDMessageCategorizer _categorizeMessages:signpostID:results:reason:](self, "_categorizeMessages:signpostID:results:reason:", v13, v6, &v17, 0);
    v14 = v17;
    if (objc_msgSend(v14, "count"))
    {
      objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_97);
      -[EDMessageCategorizer analyticsLogger](self, "analyticsLogger");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "logCategorizationEventForMessagesWithResult:", v14);

      v16 = objc_msgSend(v14, "count");
    }
    else
    {
      v16 = 0;
    }
    v11[2](v11, v16);

  }
}

void __54__EDMessageCategorizer_persistenceWillAddNewMessages___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  +[EDMessageCategorizer signpostLog](EDMessageCategorizer, "signpostLog");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 40);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    v7 = objc_msgSend(*(id *)(a1 + 32), "count");
    v8 = 134349312;
    v9 = v7;
    v10 = 2050;
    v11 = a2;
    _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v5, OS_SIGNPOST_INTERVAL_END, v6, "EDMessageCategorization", "Finish message categorization (count=%{public,signpost.telemetry:number1}lu, result=%{public,signpost.telemetry:number2}lu) enableTelemetry=YES ", (uint8_t *)&v8, 0x16u);
  }

}

uint64_t __54__EDMessageCategorizer_persistenceWillAddNewMessages___block_invoke_94(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "dateReceived");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "ef_isLaterThanDate:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __54__EDMessageCategorizer_persistenceWillAddNewMessages___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setCategorizationResult:");
}

- (void)persistenceDidReconcileJournaledMessages:(id)a3 generationWindow:(id)a4
{
  void *v5;
  id v6;

  v6 = a3;
  if ((_os_feature_enabled_impl() & 1) != 0
    || _os_feature_enabled_impl() && (EMIsGreymatterAvailableWithOverride() & 1) != 0)
  {
    objc_msgSend(v6, "ef_filter:", &__block_literal_global_99);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDMessageCategorizer categorizeMessages:reason:](self, "categorizeMessages:reason:", v5, 4);

  }
}

BOOL __82__EDMessageCategorizer_persistenceDidReconcileJournaledMessages_generationWindow___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "category");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "state") == 2;

  return v3;
}

- (id)_transformBaseMessages:(id)a3 senderAttributes:(id)a4 signpostID:(unint64_t)a5
{
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t spid;
  unint64_t v44;
  id v45;
  id obj;
  uint64_t v47;
  id v48;
  id v49;
  uint64_t v50;
  void *context;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint8_t buf[4];
  uint64_t v63;
  __int16 v64;
  uint64_t v65;
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v45 = a3;
  v48 = a4;
  +[EDMessageCategorizer signpostLog](EDMessageCategorizer, "signpostLog");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  spid = a5;
  v44 = a5 - 1;
  if (a5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_DWORD *)buf = 134349056;
    v63 = objc_msgSend(v45, "count");
    _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v8, OS_SIGNPOST_INTERVAL_BEGIN, a5, "EDMessageCategorizationTransformMessage", "Begin message transformation (count=%{public,signpost.telemetry:number1}lu) enableTelemetry=YES ", buf, 0xCu);
  }

  v49 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  obj = v45;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
  if (v9)
  {
    v47 = *(_QWORD *)v59;
    do
    {
      v10 = 0;
      v50 = v9;
      do
      {
        if (*(_QWORD *)v59 != v47)
          objc_enumerationMutation(obj);
        v52 = v10;
        v11 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * v10);
        context = (void *)MEMORY[0x1D824B334]();
        objc_msgSend(v11, "to");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "count"))
        {
          objc_msgSend(v11, "to");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v57 = (void *)MEMORY[0x1E0C9AA60];
        }

        objc_msgSend(v11, "cc");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "count"))
        {
          objc_msgSend(v11, "cc");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v56 = (void *)MEMORY[0x1E0C9AA60];
        }

        objc_msgSend(v11, "bcc");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "count"))
        {
          objc_msgSend(v11, "bcc");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v55 = (void *)MEMORY[0x1E0C9AA60];
        }

        v15 = objc_alloc(MEMORY[0x1E0D469B0]);
        v54 = (void *)objc_msgSend(v15, "initWithStringsTo:cc:bcc:replyTo:", v57, v56, v55, MEMORY[0x1E0C9AA60]);
        v16 = objc_alloc(MEMORY[0x1E0D46990]);
        objc_msgSend(v11, "from");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "firstObject");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = (void *)objc_msgSend(v16, "initWithRawString:", v18);

        objc_msgSend(v11, "senders");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "firstObject");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "emailAddressValue");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v21, "simpleAddress");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "lowercaseString");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v48, "objectForKey:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "isContact");
        v26 = objc_msgSend(v24, "isVIP");
        v27 = objc_msgSend(v24, "isPrimarySender");
        objc_msgSend(v11, "headers");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "allHeaderKeys");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "containsObject:", CFSTR("list-unsubscribe"));

        v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D469B8]), "initWithSenderEmailAddress:isVIP:isContact:isUnsubscribeHeaderPresent:isPrimarySender:", v23, v26, v25, v30, v27);
        v32 = objc_alloc(MEMORY[0x1E0D46998]);
        objc_msgSend(v11, "subject");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "subjectString");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "dateSent");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "dateReceived");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = (void *)objc_msgSend(v32, "initWithState:encryptionState:signatureState:subject:recipients:from:dataSent:dateReceived:headers:rawData:senderMetadata:", 0, 0, 0, v34, v54, v53, v35, v36, 0, 0, v31);

        objc_msgSend(v49, "setObject:forKeyedSubscript:", v11, v37);
        objc_autoreleasePoolPop(context);
        v10 = v52 + 1;
      }
      while (v50 != v52 + 1);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
    }
    while (v9);
  }

  +[EDMessageCategorizer signpostLog](EDMessageCategorizer, "signpostLog");
  v38 = objc_claimAutoreleasedReturnValue();
  v39 = v38;
  if (v44 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
  {
    v40 = objc_msgSend(obj, "count");
    v41 = objc_msgSend(v49, "count");
    *(_DWORD *)buf = 134349312;
    v63 = v40;
    v64 = 2050;
    v65 = v41;
    _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v39, OS_SIGNPOST_INTERVAL_END, spid, "EDMessageCategorizationTransformMessage", "Finish message transformation (count=%{public,signpost.telemetry:number1}lu, result=%{public,signpost.telemetry:number2}lu) enableTelemetry=YES ", buf, 0x16u);
  }

  return v49;
}

- (BOOL)categorizeMessages:(id)a3 reason:(int64_t)a4
{
  id v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  unint64_t v11;
  id v12;
  void (**v13)(void *, uint64_t);
  BOOL v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  id v25;
  _QWORD aBlock[4];
  id v27;
  os_signpost_id_t v28;
  uint8_t buf[4];
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[EDMessageCategorizer signpostLog](EDMessageCategorizer, "signpostLog");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_make_with_pointer(v7, (const void *)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"));

  +[EDMessageCategorizer signpostLog](EDMessageCategorizer, "signpostLog");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = v8 - 1;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_DWORD *)buf = 134349056;
    v30 = objc_msgSend(v6, "count");
    _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "EDMessageCategorization", "Begin message categorization (count=%{public,signpost.telemetry:number1}lu) enableTelemetry=YES ", buf, 0xCu);
  }

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__EDMessageCategorizer_categorizeMessages_reason___block_invoke;
  aBlock[3] = &unk_1E949CFD8;
  v28 = v8;
  v12 = v6;
  v27 = v12;
  v13 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  v25 = 0;
  v14 = -[EDMessageCategorizer _categorizeMessages:signpostID:results:reason:](self, "_categorizeMessages:signpostID:results:reason:", v12, v8, &v25, a4);
  v15 = v25;
  if (objc_msgSend(v15, "count"))
  {
    +[EDMessageCategorizer log](EDMessageCategorizer, "log");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v30 = (uint64_t)v15;
      _os_log_impl(&dword_1D2F2C000, v16, OS_LOG_TYPE_DEFAULT, "Persisting categorization results map: %{public}@", buf, 0xCu);
    }

    +[EDMessageCategorizer signpostLog](EDMessageCategorizer, "signpostLog");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      v19 = objc_msgSend(v15, "count");
      *(_DWORD *)buf = 134349056;
      v30 = v19;
      _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v8, "EDMessageCategorizationPersistResult", "Begin persisting categorization results (count=%{public,signpost.telemetry:number1}lu) enableTelemetry=YES ", buf, 0xCu);
    }

    -[EDMessageCategorizer persistence](self, "persistence");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "persistCategorizationResultMap:", v15);

    +[EDMessageCategorizer signpostLog](EDMessageCategorizer, "signpostLog");
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      v23 = objc_msgSend(v15, "count");
      *(_DWORD *)buf = 134349056;
      v30 = v23;
      _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v22, OS_SIGNPOST_INTERVAL_END, v8, "EDMessageCategorizationPersistResult", "Finish persisting categorization results (count=%{public,signpost.telemetry:number1}lu) enableTelemetry=YES ", buf, 0xCu);
    }

    v13[2](v13, objc_msgSend(v15, "count"));
    v14 = 1;
  }
  else
  {
    v13[2](v13, 0);
  }

  return v14;
}

void __50__EDMessageCategorizer_categorizeMessages_reason___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  +[EDMessageCategorizer signpostLog](EDMessageCategorizer, "signpostLog");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 40);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    v7 = objc_msgSend(*(id *)(a1 + 32), "count");
    v8 = 134349312;
    v9 = v7;
    v10 = 2050;
    v11 = a2;
    _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v5, OS_SIGNPOST_INTERVAL_END, v6, "EDMessageCategorization", "Finish message categorization (count=%{public,signpost.telemetry:number1}lu, result=%{public,signpost.telemetry:number2}lu) enableTelemetry=YES ", (uint8_t *)&v8, 0x16u);
  }

}

- (BOOL)_categorizeMessages:(id)a3 signpostID:(unint64_t)a4 results:(id *)a5 reason:(int64_t)a6
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void (**v24)(void *, id, uint64_t);
  id v25;
  void *v26;
  int v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  id *v37;
  void *v40;
  id v41;
  EDMessageCategorizer *v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  void *v49;
  _QWORD v50[4];
  id v51;
  id v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD aBlock[5];
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint8_t buf[4];
  uint64_t v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v41 = a3;
  v42 = self;
  -[EDMessageCategorizer _messagesToCategorizeFromMessages:](self, "_messagesToCategorizeFromMessages:");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v40, "count"))
  {
    v45 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v48 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v44 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v47 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v43 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v46 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v37 = a5;
    -[EDMessageCategorizer senderPersistence](self, "senderPersistence");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v8 = v41;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v59, v65, 16);
    if (!v9)
      goto LABEL_19;
    v10 = *(_QWORD *)v60;
    while (1)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v60 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
        objc_msgSend(v12, "senders");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "firstObject");
        v14 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "emailAddressValue");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "simpleAddress");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v16)
        {
          v18 = v16;
        }
        else
        {
          objc_msgSend(v14, "stringValue");
          v18 = (id)objc_claimAutoreleasedReturnValue();
        }
        v19 = v18;

        objc_msgSend(v19, "lowercaseString");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v21 = objc_msgSend(v49, "userHasSentToSenderAddress:", v20);
        if (v21)
        {
          if (v21 == 1)
          {
            objc_msgSend(v44, "addObject:", v20);
            v22 = v47;
          }
          else
          {
            if (v21 != 2)
              goto LABEL_17;
            objc_msgSend(v45, "addObject:", v20);
            v22 = v48;
          }
        }
        else
        {
          objc_msgSend(v43, "addObject:", v20);
          v22 = v46;
        }
        objc_msgSend(v22, "addObject:", v12);
LABEL_17:

      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v59, v65, 16);
      if (!v9)
      {
LABEL_19:

        v23 = MEMORY[0x1E0C809B0];
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __70__EDMessageCategorizer__categorizeMessages_signpostID_results_reason___block_invoke;
        aBlock[3] = &unk_1E949D0B0;
        aBlock[4] = v42;
        v24 = (void (**)(void *, id, uint64_t))_Block_copy(aBlock);
        v25 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        if (!objc_msgSend(v48, "count")
          || (v24[2](v24, v45, 1),
              v26 = (void *)objc_claimAutoreleasedReturnValue(),
              v27 = -[EDMessageCategorizer _categorizeMessages:senderAttributes:signpostID:results:reason:](v42, "_categorizeMessages:senderAttributes:signpostID:results:reason:", v48, v26, a4, v25, a6), v26, v27))
        {
          if (!objc_msgSend(v47, "count")
            || (v24[2](v24, v44, 0),
                v28 = (void *)objc_claimAutoreleasedReturnValue(),
                v27 = -[EDMessageCategorizer _categorizeMessages:senderAttributes:signpostID:results:reason:](v42, "_categorizeMessages:senderAttributes:signpostID:results:reason:", v47, v28, a4, v25, a6), v28, v27))
          {
            if (objc_msgSend(v46, "count"))
            {
              v29 = objc_alloc_init(MEMORY[0x1E0C99E08]);
              v24[2](v24, v43, 1);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              if (-[EDMessageCategorizer _categorizeMessages:senderAttributes:signpostID:results:reason:](v42, "_categorizeMessages:senderAttributes:signpostID:results:reason:", v46, v30, a4, v29, a6))
              {
                v31 = objc_alloc_init(MEMORY[0x1E0C99E08]);
                objc_msgSend(v30, "ef_mapValues:", &__block_literal_global_113);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = -[EDMessageCategorizer _categorizeMessages:senderAttributes:signpostID:results:reason:](v42, "_categorizeMessages:senderAttributes:signpostID:results:reason:", v46, v32, a4, v31, a6);
                if ((v27 & 1) != 0)
                {
                  v54 = 0;
                  v55 = &v54;
                  v56 = 0x2020000000;
                  v57 = 0;
                  v50[0] = v23;
                  v50[1] = 3221225472;
                  v50[2] = __70__EDMessageCategorizer__categorizeMessages_signpostID_results_reason___block_invoke_4;
                  v50[3] = &unk_1E949D118;
                  v51 = v31;
                  v52 = v25;
                  v53 = &v54;
                  objc_msgSend(v29, "enumerateKeysAndObjectsUsingBlock:", v50);
                  +[EDMessageCategorizer log](EDMessageCategorizer, "log");
                  v33 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
                  {
                    v34 = v55[3];
                    *(_DWORD *)buf = 134217984;
                    v64 = v34;
                    _os_log_impl(&dword_1D2F2C000, v33, OS_LOG_TYPE_DEFAULT, "%lu messages with temporary categorization", buf, 0xCu);
                  }

                  _Block_object_dispose(&v54, 8);
                }

              }
              else
              {
                v27 = 0;
              }

            }
            else
            {
              v27 = 1;
            }
          }
        }
        if (v37)
        {
          if (v27)
            v35 = v25;
          else
            v35 = 0;
          *v37 = objc_retainAutorelease(v35);
        }

        goto LABEL_42;
      }
    }
  }
  if (a5)
    *a5 = 0;
  LOBYTE(v27) = 1;
LABEL_42:

  return v27;
}

id __70__EDMessageCategorizer__categorizeMessages_signpostID_results_reason___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _EDSenderAttributes *v14;
  id v16;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v16 = a2;
  v5 = (void *)objc_opt_new();
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v16, "allObjects");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v19;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v8);
        objc_msgSend(*(id *)(a1 + 32), "contactStore", v16);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "contactExistsForEmailAddress:", v9);

        objc_msgSend(*(id *)(a1 + 32), "vipManager");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isVIPAddress:", v9);

        v14 = -[_EDSenderAttributes initWithisVIP:isContact:isCoreRecent:isPrimarySender:]([_EDSenderAttributes alloc], "initWithisVIP:isContact:isCoreRecent:isPrimarySender:", v13, v11, 0, a3);
        objc_msgSend(v5, "setObject:forKey:", v14, v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }

  return v5;
}

_EDSenderAttributes *__70__EDMessageCategorizer__categorizeMessages_signpostID_results_reason___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  _EDSenderAttributes *v3;

  v2 = a2;
  v3 = -[_EDSenderAttributes initWithisVIP:isContact:isCoreRecent:isPrimarySender:]([_EDSenderAttributes alloc], "initWithisVIP:isContact:isCoreRecent:isPrimarySender:", objc_msgSend(v2, "isVIP"), objc_msgSend(v2, "isContact"), objc_msgSend(v2, "isCoreRecent"), objc_msgSend(v2, "isPrimarySender") ^ 1);

  return v3;
}

void __70__EDMessageCategorizer__categorizeMessages_signpostID_results_reason___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  EDMessageCategorizationResult *v11;
  void *v12;
  EDMessageCategorizationResult *v13;
  id v14;

  v14 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "category");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "category");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v5, v14);
  }
  else
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E110]), "initWithType:subtype:isHighImpact:state:", objc_msgSend(v7, "type"), objc_msgSend(v7, "subtype"), objc_msgSend(v7, "isHighImpact"), 2);
    v11 = [EDMessageCategorizationResult alloc];
    objc_msgSend(v5, "metadata");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[EDMessageCategorizationResult initWithCategory:metadata:](v11, "initWithCategory:metadata:", v10, v12);
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v13, v14);

    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  }

}

- (BOOL)_categorizeMessages:(id)a3 senderAttributes:(id)a4 signpostID:(unint64_t)a5 results:(id)a6 reason:(int64_t)a7
{
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  id v24;
  _QWORD v25[4];
  NSObject *v26;
  EDMessageCategorizer *v27;
  id v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v24 = a6;
  -[EDMessageCategorizer _transformBaseMessages:senderAttributes:signpostID:](self, "_transformBaseMessages:senderAttributes:signpostID:", v12, v13, a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDCategoryPowerLog logStartCategorizationWithReason:](EDCategoryPowerLog, "logStartCategorizationWithReason:", a7);
  +[EDMessageCategorizer signpostLog](EDMessageCategorizer, "signpostLog");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (a5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_DWORD *)buf = 134349056;
    v30 = objc_msgSend(v12, "count");
    _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v16, OS_SIGNPOST_INTERVAL_BEGIN, a5, "EDMessageCategorizationMessageCategorizer", "Begin categorizer call (count=%{public,signpost.telemetry:number1}lu) enableTelemetry=YES ", buf, 0xCu);
  }

  +[EDCategoryPowerLog logStartCategorizationWithReason:](EDCategoryPowerLog, "logStartCategorizationWithReason:", a7);
  -[EDMessageCategorizer _categorizeMappedMessages:](self, "_categorizeMappedMessages:", v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDCategoryPowerLog logStopCategorizationWithReason:count:](EDCategoryPowerLog, "logStopCategorizationWithReason:count:", a7, objc_msgSend(v17, "count"));
  +[EDMessageCategorizer signpostLog](EDMessageCategorizer, "signpostLog");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (a5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    v20 = objc_msgSend(v12, "count");
    v21 = objc_msgSend(v17, "count");
    *(_DWORD *)buf = 134349312;
    v30 = v20;
    v31 = 2050;
    v32 = v21;
    _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v19, OS_SIGNPOST_INTERVAL_END, a5, "EDMessageCategorizationMessageCategorizer", "Finish categorizer call (count=%{public,signpost.telemetry:number1}lu, result=%{public,signpost.telemetry:number2}lu) enableTelemetry=YES ", buf, 0x16u);
  }

  if (v17)
  {
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __87__EDMessageCategorizer__categorizeMessages_senderAttributes_signpostID_results_reason___block_invoke;
    v25[3] = &unk_1E949D140;
    v26 = v17;
    v27 = self;
    v28 = v24;
    objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v25);

    v22 = v26;
  }
  else
  {
    +[EDMessageCategorizer log](EDMessageCategorizer, "log");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[EDMessageCategorizer _categorizeMessages:senderAttributes:signpostID:results:reason:].cold.1(v22);
  }

  return v17 != 0;
}

void __87__EDMessageCategorizer__categorizeMessages_senderAttributes_signpostID_results_reason___block_invoke(id *a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a1[4], "objectForKeyedSubscript:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(a1[5], "_transformResult:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "setObject:forKeyedSubscript:", v7, v5);

  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      +[EDMessageCategorizer log](EDMessageCategorizer, "log");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v5, "globalMessageID"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138543618;
        v12 = v9;
        v13 = 2112;
        v14 = v5;
        _os_log_impl(&dword_1D2F2C000, v8, OS_LOG_TYPE_DEFAULT, "Model did not categorize message with globalID:%{public}@ message:%@. Treating as non-commerce.", (uint8_t *)&v11, 0x16u);

      }
    }
    else
    {
      +[EDMessageCategorizer log](EDMessageCategorizer, "log");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 138412290;
        v12 = v5;
        _os_log_impl(&dword_1D2F2C000, v8, OS_LOG_TYPE_DEFAULT, "Model did not categorize newly synced message:%@. Treating as non-commerce.", (uint8_t *)&v11, 0xCu);
      }
    }

    +[EDMessageCategorizer noneMessageCategorizationResult](EDMessageCategorizer, "noneMessageCategorizationResult");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "setObject:forKeyedSubscript:", v10, v5);

  }
}

- (id)_transformResult:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  EDMessageCategorizationResult *v9;
  void *v10;
  EDMessageCategorizationResult *v11;

  v3 = a3;
  v4 = objc_msgSend(v3, "categoryType");
  v5 = objc_msgSend(v3, "subcategory");
  if (v5 > 15)
  {
    if (v5 > 63)
    {
      if (v5 == 64)
      {
        v7 = 0;
        v6 = 7;
        goto LABEL_15;
      }
      if (v5 != 128)
        goto LABEL_20;
      v6 = 8;
    }
    else
    {
      if (v5 != 16)
      {
        if (v5 == 32)
        {
          v7 = 0;
          v6 = 1;
          goto LABEL_15;
        }
LABEL_20:
        v7 = 0;
        v6 = 0;
        goto LABEL_15;
      }
      v6 = 6;
    }
LABEL_14:
    v7 = 2;
    goto LABEL_15;
  }
  v6 = 2;
  v7 = 3;
  switch(v5)
  {
    case 1:
      break;
    case 2:
      v6 = 3;
      goto LABEL_14;
    case 4:
      v6 = 4;
      v7 = 1;
      break;
    case 8:
      v6 = 5;
      goto LABEL_14;
    default:
      goto LABEL_20;
  }
LABEL_15:
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E110]), "initWithType:subtype:isHighImpact:state:", v7, v6, v4 == 2, 1);
  if (v8)
  {
    v9 = [EDMessageCategorizationResult alloc];
    objc_msgSend(v3, "metadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[EDMessageCategorizationResult initWithCategory:metadata:](v9, "initWithCategory:metadata:", v8, v10);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)queryForMessagesToCategorizeForVersion:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  +[EDMessageListItemPredicates predicateForCategorizationVersionLessThanVersion:](EDMessageListItemPredicates, "predicateForCategorizationVersionLessThanVersion:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDMessageListItemPredicates predicateForNilModelVersion](EDMessageListItemPredicates, "predicateForNilModelVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3528];
  v20[0] = v4;
  v20[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "orPredicateWithSubpredicates:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D1E248], "predicateForMessagesInMailboxWithType:", 7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB3528];
  v19[0] = v7;
  v19[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "andPredicateWithSubpredicates:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_alloc(MEMORY[0x1E0D1E2C0]);
  v13 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0D1E248], "sortDescriptorForDateAscending:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v12, "initWithTargetClass:predicate:sortDescriptors:", v13, v11, v15);

  return v16;
}

- (id)_messagesToCategorizeFromMessages:(id)a3
{
  objc_msgSend(a3, "ef_filter:", &__block_literal_global_126_0);
  return (id)objc_claimAutoreleasedReturnValue();
}

BOOL __58__EDMessageCategorizer__messagesToCategorizeFromMessages___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "mailbox");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "type") == 7;

  return v3;
}

- (id)_categorizeMappedMessages:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  EDMessageCategorizer *v14;
  id v15;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = objc_alloc_init((Class)getMCCSecretAgentControllerClass[0]());
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __50__EDMessageCategorizer__categorizeMappedMessages___block_invoke;
  v12[3] = &unk_1E949D140;
  v7 = v5;
  v13 = v7;
  v14 = self;
  v15 = v6;
  v8 = v6;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v12);
  v9 = v15;
  v10 = v7;

  return v10;
}

void __50__EDMessageCategorizer__categorizeMappedMessages___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  const char *v46;
  const char *v47;
  int v48;
  int v49;
  const char *v50;
  const char *v51;
  const char *v52;
  id v53;
  _QWORD v54[4];
  id v55;
  id v56;
  uint64_t v57;
  id v58;
  id v59;
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  const char *v63;
  __int16 v64;
  const char *v65;
  __int16 v66;
  const char *v67;
  __int16 v68;
  const char *v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v53 = a3;
  v6 = (void *)MEMORY[0x1D824B334]();
  objc_msgSend(v5, "fromAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "emailAddressValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v5, "senderMetadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      +[EDMessageCategorizer log](EDMessageCategorizer, "log");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        if (objc_msgSend(v9, "isVIP"))
          v46 = "true";
        else
          v46 = "false";
        v52 = v46;
        if (objc_msgSend(v9, "isContact"))
          v47 = "true";
        else
          v47 = "false";
        v48 = objc_msgSend(v9, "isUnsubscribeHeaderPresent");
        v49 = objc_msgSend(v9, "isPrimarySender");
        if (v48)
          v50 = "true";
        else
          v50 = "false";
        *(_DWORD *)buf = 138544386;
        if (v49)
          v51 = "true";
        else
          v51 = "false";
        v61 = v8;
        v62 = 2080;
        v63 = v52;
        v64 = 2080;
        v65 = v47;
        v66 = 2080;
        v67 = v50;
        v68 = 2080;
        v69 = v51;
        _os_log_debug_impl(&dword_1D2F2C000, v10, OS_LOG_TYPE_DEBUG, "Sender %{public}@ isVIP: %s isContact: %s unsubPresent: %s isPrimarySender: %s", buf, 0x34u);
      }

      v11 = objc_alloc_init((Class)getMCCCategoryContextClass[0]());
      objc_msgSend(v8, "displayName");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      if (v12)
        v14 = (const __CFString *)v12;
      else
        v14 = &stru_1E94A4508;
      objc_msgSend(v11, "setSenderName:", v14);

      v15 = v8;
      objc_msgSend(v15, "emailAddressValue");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "simpleAddress");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v17)
      {
        v19 = v17;
      }
      else
      {
        objc_msgSend(v15, "stringValue");
        v19 = (id)objc_claimAutoreleasedReturnValue();
      }
      v35 = v19;

      objc_msgSend(v11, "setSenderEmail:", v35);
      objc_msgSend(v5, "subject");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setEmailSubject:", v36);

      objc_msgSend(v11, "setIsUnsubscribeHeaderPresent:", objc_msgSend(v9, "isUnsubscribeHeaderPresent"));
      objc_msgSend(v11, "setIsSenderVIP:", objc_msgSend(v9, "isVIP"));
      objc_msgSend(v11, "setIsSenderInAddressBook:", objc_msgSend(v9, "isContact"));
      objc_msgSend(v11, "setIsSenderRecentContact:", 0);
      objc_msgSend(v11, "setIsSenderPrimary:", objc_msgSend(v9, "isPrimarySender"));
      objc_msgSend(*(id *)(a1 + 40), "_stableEmailAddressForMessage:", v53);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setReceiverEmail:", v37);

      objc_msgSend(v53, "account");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "systemAccount");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "accountPropertyForKey:", CFSTR("kMCCCategoryIsNonPersonalAccountKey"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setIsNonPersonalAccount:", objc_msgSend(v40, "BOOLValue"));

      +[EDMessageCategorizer log](EDMessageCategorizer, "log");
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v11, "receiverEmail");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        __50__EDMessageCategorizer__categorizeMappedMessages___block_invoke_cold_3(v42, objc_msgSend(v11, "isNonPersonalAccount"), buf, v41);
      }

      v43 = *(void **)(a1 + 48);
      v54[0] = MEMORY[0x1E0C809B0];
      v54[1] = 3221225472;
      v54[2] = __50__EDMessageCategorizer__categorizeMappedMessages___block_invoke_132;
      v54[3] = &unk_1E949D1A8;
      v55 = *(id *)(a1 + 32);
      v44 = v5;
      v45 = *(_QWORD *)(a1 + 40);
      v56 = v44;
      v57 = v45;
      v58 = v15;
      v59 = v9;
      objc_msgSend(v43, "predictCommerceEmailWithContext:completion:", v11, v54);

    }
    else
    {
      +[EDMessageCategorizer log](EDMessageCategorizer, "log");
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        __50__EDMessageCategorizer__categorizeMappedMessages___block_invoke_cold_2((uint64_t)v8, v28, v29, v30, v31, v32, v33, v34);

      v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D469A0]), "initWithCategoryType:subCategoryType:metadata:", 0, 16, 0);
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v11, v5);
    }

  }
  else
  {
    +[EDMessageCategorizer log](EDMessageCategorizer, "log");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      __50__EDMessageCategorizer__categorizeMappedMessages___block_invoke_cold_1(v20, v21, v22, v23, v24, v25, v26, v27);

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D469A0]), "initWithCategoryType:subCategoryType:metadata:", 1, 1, 0);
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, v5);
  }

  objc_autoreleasePoolPop(v6);
}

void __50__EDMessageCategorizer__categorizeMappedMessages___block_invoke_132(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 48), "_makeCategorizationResultFromPrediction:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, *(_QWORD *)(a1 + 40));

  }
  else
  {
    +[EDMessageCategorizer log](EDMessageCategorizer, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "ef_publicDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 56);
      v11 = objc_msgSend(*(id *)(a1 + 64), "isVIP");
      v12 = objc_msgSend(*(id *)(a1 + 64), "isContact");
      v13 = objc_msgSend(*(id *)(a1 + 64), "isUnsubscribeHeaderPresent");
      v14 = objc_msgSend(*(id *)(a1 + 64), "isPrimarySender");
      v15 = 138544642;
      v16 = v9;
      v17 = 2114;
      v18 = v10;
      v19 = 1024;
      v20 = v11;
      v21 = 1024;
      v22 = v12;
      v23 = 1024;
      v24 = v13;
      v25 = 1024;
      v26 = v14;
      _os_log_error_impl(&dword_1D2F2C000, v8, OS_LOG_TYPE_ERROR, "Failed to categorize message with error %{public}@ sender %{public}@ isVIP: %{BOOL}d isContact: %{BOOL}d unsubPresent: %{BOOL}d isPrimarySender: %{BOOL}d", (uint8_t *)&v15, 0x2Eu);

    }
  }

}

- (id)_stableEmailAddressForMessage:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  uint64_t v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a3;
  objc_msgSend(v3, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    objc_msgSend(v3, "account");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstEmailAddress");
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v12 = (void *)v7;
    goto LABEL_9;
  }
  objc_msgSend(v3, "account");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    objc_msgSend(v3, "account");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "canonicalEmailAddress");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  objc_msgSend(v3, "account");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "emailAddressStrings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v6, "count") < 2)
  {
    objc_msgSend(v6, "firstObject");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  objc_msgSend(v6, "sortedArrayUsingSelector:", sel_localizedCaseInsensitiveCompare_);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v12;
}

- (id)_makeCategorizationResultFromPrediction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;

  v4 = a3;
  -[EDMessageCategorizer _makeCategorizationResultMetadataFromPrediction:](self, "_makeCategorizationResultMetadataFromPrediction:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  getkDecisionSubCategoryKey[0]();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[EDMessageCategorizer _subCategoryFor:](self, "_subCategoryFor:", v7);

  getkDecisionTimeSensitiveKey();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v10, "BOOLValue");

  v11 = objc_alloc(MEMORY[0x1E0D469A0]);
  if ((_DWORD)v7)
    v12 = 2;
  else
    v12 = v8 != 32;
  v13 = (void *)objc_msgSend(v11, "initWithCategoryType:subCategoryType:metadata:", v12, v8, v5);

  return v13;
}

- (id)_makeCategorizationResultMetadataFromPrediction:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v23;
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
  id v39;
  void *v40;

  v39 = a3;
  getkDecisionScoreKey[0]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  getkDecisionSenderScoreKey[0]();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  getkDecisionTSScoreKey[0]();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue");
  v14 = v13;

  v15 = objc_alloc(MEMORY[0x1E0D469A8]);
  getkDecisionReasonCodesKey[0]();
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "objectForKey:", v38);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  getkDecisionBPModelVersionKey[0]();
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "objectForKey:", v37);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  getkDecisionBPSenderModelVersionKey[0]();
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "objectForKey:", v36);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  getkDecisionBPTSModelVersionKey[0]();
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "objectForKey:", v35);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  getkDecisionBPFinalRuleModelVersionKey[0]();
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "objectForKey:", v34);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  getkDecisionBPExperimentIdKey[0]();
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "objectForKey:", v32);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  getkDecisionBPExperimentDeploymentIdKey[0]();
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "objectForKey:", v30);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  getkDecisionBPTreatmentIdKey[0]();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "objectForKey:", v28);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  getkDecisionBPRolloutIdKey[0]();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "objectForKey:", v26);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  getkDecisionBPRolloutDeploymentIdKey[0]();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "objectForKey:", v24);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  getkDecisionBPRolloutFactorPackIdKey[0]();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "objectForKey:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (id)objc_msgSend(v15, "initWithScore:senderScore:tsScore:reasonCodes:modelVersion:senderModelVersion:tsModelVersion:finalRuleVersion:experimentID:experimentDeploymentID:experimentTreatmentID:rolloutID:rolloutDeploymentID:rolloutFactorPackID:", v40, v16, v17, v18, v33, v31, v6, v10, v14, v29, v27, v25, v19, v21);

  return v23;
}

- (unint64_t)_subCategoryFor:(id)a3
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;

  v3 = a3;
  if (objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("personal")))
  {
    if (objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("promotions")))
    {
      if (objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("social")))
      {
        if (objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("transactions")))
        {
          if (objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("news")))
          {
            if (objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("unsupported_language")))
            {
              if (objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("nop_sa")))
              {
                if (objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("others")))
                {
                  +[EDMessageCategorizer log](EDMessageCategorizer, "log");
                  v4 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
                    -[EDMessageCategorizer _subCategoryFor:].cold.1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

                }
                v11 = 16;
              }
              else
              {
                v11 = 128;
              }
            }
            else
            {
              v11 = 64;
            }
          }
          else
          {
            v11 = 8;
          }
        }
        else
        {
          v11 = 4;
        }
      }
      else
      {
        v11 = 2;
      }
    }
    else
    {
      v11 = 1;
    }
  }
  else
  {
    v11 = 32;
  }

  return v11;
}

- (EMVIPManager)vipManager
{
  return self->_vipManager;
}

- (EMCachingContactStore)contactStore
{
  return self->_contactStore;
}

- (OS_dispatch_queue)processingQueue
{
  return self->_processingQueue;
}

- (void)setProcessingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_processingQueue, a3);
}

- (EDCategoryPersistence)persistence
{
  return self->_persistence;
}

- (void)setPersistence:(id)a3
{
  objc_storeStrong((id *)&self->_persistence, a3);
}

- (EDInteractionEventLog)eventLog
{
  return self->_eventLog;
}

- (void)setEventLog:(id)a3
{
  objc_storeStrong((id *)&self->_eventLog, a3);
}

- (NSConditionLock)categorizationState
{
  return self->_categorizationState;
}

- (EDCategoryCoreAnalyticsLogger)analyticsLogger
{
  return self->_analyticsLogger;
}

- (void)setAnalyticsLogger:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsLogger, a3);
}

- (EDSenderPersistence)senderPersistence
{
  return self->_senderPersistence;
}

- (void)setSenderPersistence:(id)a3
{
  objc_storeStrong((id *)&self->_senderPersistence, a3);
}

- (ECDKIMVerifier)verifier
{
  return self->_verifier;
}

- (EMNSUserDefaultsBoolObserver)automaticallySummarizeMessages
{
  return self->_automaticallySummarizeMessages;
}

- (void)setAutomaticallySummarizeMessages:(id)a3
{
  objc_storeStrong((id *)&self->_automaticallySummarizeMessages, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_automaticallySummarizeMessages, 0);
  objc_storeStrong((id *)&self->_verifier, 0);
  objc_storeStrong((id *)&self->_senderPersistence, 0);
  objc_storeStrong((id *)&self->_analyticsLogger, 0);
  objc_storeStrong((id *)&self->_categorizationState, 0);
  objc_storeStrong((id *)&self->_eventLog, 0);
  objc_storeStrong((id *)&self->_persistence, 0);
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_vipManager, 0);
}

- (void)_categorizeMessages:(os_log_t)log senderAttributes:signpostID:results:reason:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D2F2C000, log, OS_LOG_TYPE_ERROR, "Categorizer failed to categorize messages", v1, 2u);
}

void __50__EDMessageCategorizer__categorizeMappedMessages___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1D2F2C000, a1, a3, "Address string for address %{public}@ is invalid. Treating as commerce", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __50__EDMessageCategorizer__categorizeMappedMessages___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1D2F2C000, a2, a3, "BlackPearl requires senderMetadata. Treating as category none for address %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __50__EDMessageCategorizer__categorizeMappedMessages___block_invoke_cold_3(void *a1, char a2, uint8_t *buf, os_log_t log)
{
  const char *v5;

  v5 = "false";
  if ((a2 & 1) != 0)
    v5 = "true";
  *(_DWORD *)buf = 138543618;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2080;
  *(_QWORD *)(buf + 14) = v5;
  _os_log_debug_impl(&dword_1D2F2C000, log, OS_LOG_TYPE_DEBUG, "Recipient %{public}@ isNotPersonal: %s", buf, 0x16u);

}

- (void)_subCategoryFor:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1D2F2C000, a2, a3, "Attempt to convert unknown subcategory string %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end

@implementation SGMessageEventDissectorTrialClientWrapper

- (SGMessageEventDissectorTrialClientWrapper)init
{
  SGMessageEventDissectorTrialClientWrapper *v2;
  id v3;
  void *v4;
  uint64_t v5;
  _PASLock *lock;
  TRIClient *triClient;
  id v8;
  _QWORD v10[4];
  id v11;
  id location;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SGMessageEventDissectorTrialClientWrapper;
  v2 = -[SGTrialClientWrapper initWithClientIdentifier:](&v13, sel_initWithClientIdentifier_, 245);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0D815F0]);
    v4 = (void *)objc_opt_new();
    v5 = objc_msgSend(v3, "initWithGuardedData:", v4);
    lock = v2->_lock;
    v2->_lock = (_PASLock *)v5;

    -[SGMessageEventDissectorTrialClientWrapper updateFactors](v2, "updateFactors");
    location = 0;
    objc_initWeak(&location, v2);
    triClient = v2->super._triClient;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __49__SGMessageEventDissectorTrialClientWrapper_init__block_invoke;
    v10[3] = &unk_1E7DAF4B8;
    objc_copyWeak(&v11, &location);
    v8 = (id)-[TRIClient addUpdateHandlerForNamespaceName:usingBlock:](triClient, "addUpdateHandlerForNamespaceName:usingBlock:", CFSTR("SMS_FILTER_INEN_CLASSIFICATION"), v10);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)updateFactors
{
  _PASLock *lock;
  _QWORD v3[5];

  lock = self->_lock;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __58__SGMessageEventDissectorTrialClientWrapper_updateFactors__block_invoke;
  v3[3] = &unk_1E7DA8460;
  v3[4] = self;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v3);
}

- (id)eventExtractionAssetsPath
{
  _PASLock *lock;
  id v3;
  NSObject *v4;
  int v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  const __CFString *v11;
  char v12;
  _QWORD v13[5];
  _BYTE buf[24];
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v15 = __Block_byref_object_copy__1814;
  v16 = __Block_byref_object_dispose__1815;
  lock = self->_lock;
  v17 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __70__SGMessageEventDissectorTrialClientWrapper_eventExtractionAssetsPath__block_invoke;
  v13[3] = &unk_1E7DA8488;
  v13[4] = buf;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v13);
  v3 = *(id *)(*(_QWORD *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  if (!v3)
  {
    sgEventsLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C3607000, v4, OS_LOG_TYPE_ERROR, "SGMessageEventDissectorTrialClientWrapper: trialEventExtractionAssetsPath is nil, bailing", buf, 2u);
    }
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v5 = -[NSObject fileExistsAtPath:isDirectory:](v4, "fileExistsAtPath:isDirectory:", v3, &v12);
  if (v12)
    v6 = v5;
  else
    v6 = 0;
  sgEventsLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v11 = CFSTR("YES");
      if (!v12)
        v11 = CFSTR("NO");
      *(_DWORD *)buf = 138478083;
      *(_QWORD *)&buf[4] = v3;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v11;
      _os_log_error_impl(&dword_1C3607000, v8, OS_LOG_TYPE_ERROR, "SGMessageEventDissectorTrialClientWrapper: No assets found at trialEventExtractionAssetsPath: %{private}@ isDirectory: %@", buf, 0x16u);
    }

LABEL_13:
    v9 = 0;
    goto LABEL_14;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138477827;
    *(_QWORD *)&buf[4] = v3;
    _os_log_debug_impl(&dword_1C3607000, v8, OS_LOG_TYPE_DEBUG, "SGMessageEventDissectorTrialClientWrapper: EventExtractionAssetsPath loaded with Trial %{private}@", buf, 0xCu);
  }

  v9 = v3;
LABEL_14:

  return v9;
}

- (id)eventClassifierModelPath
{
  _PASLock *lock;
  id v3;
  NSObject *v4;
  int v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  const __CFString *v11;
  char v12;
  _QWORD v13[5];
  _BYTE buf[24];
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v15 = __Block_byref_object_copy__1814;
  v16 = __Block_byref_object_dispose__1815;
  lock = self->_lock;
  v17 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __69__SGMessageEventDissectorTrialClientWrapper_eventClassifierModelPath__block_invoke;
  v13[3] = &unk_1E7DA8488;
  v13[4] = buf;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v13);
  v3 = *(id *)(*(_QWORD *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  if (!v3)
  {
    sgEventsLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C3607000, v4, OS_LOG_TYPE_ERROR, "SGMessageEventDissectorTrialClientWrapper: trialEventClassifierModelPath is nil, bailing", buf, 2u);
    }
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v5 = -[NSObject fileExistsAtPath:isDirectory:](v4, "fileExistsAtPath:isDirectory:", v3, &v12);
  if (v12)
    v6 = v5;
  else
    v6 = 0;
  sgEventsLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v11 = CFSTR("YES");
      if (!v12)
        v11 = CFSTR("NO");
      *(_DWORD *)buf = 138478083;
      *(_QWORD *)&buf[4] = v3;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v11;
      _os_log_error_impl(&dword_1C3607000, v8, OS_LOG_TYPE_ERROR, "SGMessageEventDissectorTrialClientWrapper: No assets found at trialEventClassifierModelPath: %{private}@ isDirectory: %@", buf, 0x16u);
    }

LABEL_13:
    v9 = 0;
    goto LABEL_14;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138477827;
    *(_QWORD *)&buf[4] = v3;
    _os_log_debug_impl(&dword_1C3607000, v8, OS_LOG_TYPE_DEBUG, "SGMessageEventDissectorTrialClientWrapper: EventClassifierModelPath loaded with Trial %{private}@", buf, 0xCu);
  }

  v9 = v3;
LABEL_14:

  return v9;
}

- (id)eventClassifierThreshold
{
  _PASLock *lock;
  id v3;
  NSObject *v4;
  _QWORD v6[5];
  __int128 buf;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__1814;
  v10 = __Block_byref_object_dispose__1815;
  lock = self->_lock;
  v11 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69__SGMessageEventDissectorTrialClientWrapper_eventClassifierThreshold__block_invoke;
  v6[3] = &unk_1E7DA8488;
  v6[4] = &buf;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v6);
  v3 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  sgEventsLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_debug_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEBUG, "SGMessageEventDissectorTrialClientWrapper: eventClassifierThreshold: %@", (uint8_t *)&buf, 0xCu);
  }

  return v3;
}

- (id)messageProcessingLimit
{
  _PASLock *lock;
  id v3;
  NSObject *v4;
  _QWORD v6[5];
  __int128 buf;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__1814;
  v10 = __Block_byref_object_dispose__1815;
  lock = self->_lock;
  v11 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67__SGMessageEventDissectorTrialClientWrapper_messageProcessingLimit__block_invoke;
  v6[3] = &unk_1E7DA8488;
  v6[4] = &buf;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v6);
  v3 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  sgEventsLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_debug_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEBUG, "SGMessageEventDissectorTrialClientWrapper: messageProcessingLimit: %@", (uint8_t *)&buf, 0xCu);
  }

  return v3;
}

- (id)rateLimitInterval
{
  _PASLock *lock;
  id v3;
  NSObject *v4;
  _QWORD v6[5];
  __int128 buf;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__1814;
  v10 = __Block_byref_object_dispose__1815;
  lock = self->_lock;
  v11 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__SGMessageEventDissectorTrialClientWrapper_rateLimitInterval__block_invoke;
  v6[3] = &unk_1E7DA8488;
  v6[4] = &buf;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v6);
  v3 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  sgEventsLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_debug_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEBUG, "SGMessageEventDissectorTrialClientWrapper: rateLimitInterval: %@", (uint8_t *)&buf, 0xCu);
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
}

void __62__SGMessageEventDissectorTrialClientWrapper_rateLimitInterval__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 40));
}

void __67__SGMessageEventDissectorTrialClientWrapper_messageProcessingLimit__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 32));
}

void __69__SGMessageEventDissectorTrialClientWrapper_eventClassifierThreshold__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 24));
}

void __69__SGMessageEventDissectorTrialClientWrapper_eventClassifierModelPath__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 16));
}

void __70__SGMessageEventDissectorTrialClientWrapper_eventExtractionAssetsPath__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 8));
}

void __58__SGMessageEventDissectorTrialClientWrapper_updateFactors__block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  int v23;
  NSObject *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  NSObject *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  NSObject *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  int v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)v3[4];
  v3[4] = &unk_1E7E0BE10;

  v5 = (void *)v3[5];
  v3[5] = &unk_1E7E0BE28;

  v6 = (void *)v3[3];
  v3[3] = &unk_1E7E0CDA0;

  sgEventsLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v48) = 0;
    _os_log_impl(&dword_1C3607000, v7, OS_LOG_TYPE_DEFAULT, "SGMessageEventDissectorTrialClientWrapper: Updating factors", (uint8_t *)&v48, 2u);
  }

  if ((objc_msgSend(*(id *)(a1 + 32), "refreshEnrollmentInformationForNamespace:", CFSTR("SMS_FILTER_INEN_CLASSIFICATION")) & 1) != 0|| (objc_msgSend(*(id *)(a1 + 32), "refreshRolloutIdentifiersForNamespace:", CFSTR("SMS_FILTER_INEN_CLASSIFICATION")) & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "levelForFactor:withNamespaceName:", CFSTR("trialEventExtractionAssets"), CFSTR("SMS_FILTER_INEN_CLASSIFICATION"));
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject directoryValue](v8, "directoryValue");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9
      && (v10 = (void *)v9,
          -[NSObject directoryValue](v8, "directoryValue"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v12 = objc_msgSend(v11, "hasPath"),
          v11,
          v10,
          v12))
    {
      sgEventsLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        -[NSObject directoryValue](v8, "directoryValue");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "path");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = 138477827;
        v49 = v15;
        _os_log_impl(&dword_1C3607000, v13, OS_LOG_TYPE_DEFAULT, "SGMessageEventDissectorTrialClientWrapper: Updating trialEventExtractionAssetsPath from trial: %{private}@", (uint8_t *)&v48, 0xCu);

      }
      -[NSObject directoryValue](v8, "directoryValue");
      v16 = objc_claimAutoreleasedReturnValue();
      -[NSObject path](v16, "path");
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)v3[1];
      v3[1] = v17;

    }
    else
    {
      sgEventsLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v48) = 0;
        _os_log_error_impl(&dword_1C3607000, v16, OS_LOG_TYPE_ERROR, "SGMessageEventDissectorTrialClientWrapper: TRILevel is nil for trialEventExtractionAssetsPath", (uint8_t *)&v48, 2u);
      }
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "levelForFactor:withNamespaceName:", CFSTR("trialEventClassifierModel"), CFSTR("SMS_FILTER_INEN_CLASSIFICATION"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "directoryValue");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v20
      && (v21 = (void *)v20,
          objc_msgSend(v19, "directoryValue"),
          v22 = (void *)objc_claimAutoreleasedReturnValue(),
          v23 = objc_msgSend(v22, "hasPath"),
          v22,
          v21,
          v23))
    {
      sgEventsLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v19, "directoryValue");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "path");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = 138477827;
        v49 = v26;
        _os_log_impl(&dword_1C3607000, v24, OS_LOG_TYPE_DEFAULT, "SGMessageEventDissectorTrialClientWrapper: Updating trialEventClassifierModelPath from trial: %{private}@", (uint8_t *)&v48, 0xCu);

      }
      objc_msgSend(v19, "directoryValue");
      v27 = objc_claimAutoreleasedReturnValue();
      -[NSObject path](v27, "path");
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = (void *)v3[2];
      v3[2] = v28;

    }
    else
    {
      sgEventsLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v48) = 0;
        _os_log_error_impl(&dword_1C3607000, v27, OS_LOG_TYPE_ERROR, "SGMessageEventDissectorTrialClientWrapper: TRILevel is nil for trialEventClassifierModelPath", (uint8_t *)&v48, 2u);
      }
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "levelForFactor:withNamespaceName:", CFSTR("trialEventClassifierThreshold"), CFSTR("SMS_FILTER_INEN_CLASSIFICATION"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    sgEventsLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = v31;
    if (v30)
    {
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v30, "doubleValue");
        v48 = 134217984;
        v49 = v33;
        _os_log_impl(&dword_1C3607000, v32, OS_LOG_TYPE_DEFAULT, "SGMessageEventDissectorTrialClientWrapper: Updating trialEventClassifierThreshold from trial: %.02f", (uint8_t *)&v48, 0xCu);
      }

      v34 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v30, "doubleValue");
      objc_msgSend(v34, "numberWithDouble:");
      v35 = objc_claimAutoreleasedReturnValue();
      v32 = v3[3];
      v3[3] = v35;
    }
    else if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v48) = 0;
      _os_log_error_impl(&dword_1C3607000, v32, OS_LOG_TYPE_ERROR, "SGMessageEventDissectorTrialClientWrapper: TRILevel is nil for trialEventClassifierThreshold", (uint8_t *)&v48, 2u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "levelForFactor:withNamespaceName:", CFSTR("trialEventExtractionMessageProcessingLimit"), CFSTR("SMS_FILTER_INEN_CLASSIFICATION"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    sgEventsLogHandle();
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = v37;
    if (v36)
    {
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v36, "doubleValue");
        v48 = 134217984;
        v49 = v39;
        _os_log_impl(&dword_1C3607000, v38, OS_LOG_TYPE_DEFAULT, "SGMessageEventDissectorTrialClientWrapper: Updating trialMessageProcessingLimit from trial: %.02f", (uint8_t *)&v48, 0xCu);
      }

      v40 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v36, "doubleValue");
      objc_msgSend(v40, "numberWithDouble:");
      v41 = objc_claimAutoreleasedReturnValue();
      v38 = v3[4];
      v3[4] = v41;
    }
    else if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v48) = 0;
      _os_log_error_impl(&dword_1C3607000, v38, OS_LOG_TYPE_ERROR, "SGMessageEventDissectorTrialClientWrapper: TRILevel is nil for trialMessageProcessingLimit", (uint8_t *)&v48, 2u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "levelForFactor:withNamespaceName:", CFSTR("trialEventExtractionRateLimitInterval"), CFSTR("SMS_FILTER_INEN_CLASSIFICATION"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    sgEventsLogHandle();
    v43 = objc_claimAutoreleasedReturnValue();
    v44 = v43;
    if (v42)
    {
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v42, "doubleValue");
        v48 = 134217984;
        v49 = v45;
        _os_log_impl(&dword_1C3607000, v44, OS_LOG_TYPE_DEFAULT, "SGMessageEventDissectorTrialClientWrapper: Updating trialRateLimitInterval from trial: %.02f", (uint8_t *)&v48, 0xCu);
      }

      v46 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v42, "doubleValue");
      objc_msgSend(v46, "numberWithDouble:");
      v47 = objc_claimAutoreleasedReturnValue();
      v44 = v3[5];
      v3[5] = v47;
    }
    else if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v48) = 0;
      _os_log_error_impl(&dword_1C3607000, v44, OS_LOG_TYPE_ERROR, "SGMessageEventDissectorTrialClientWrapper: TRILevel is nil for trialRateLimitInterval", (uint8_t *)&v48, 2u);
    }

  }
  else
  {
    sgEventsLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v48) = 0;
      _os_log_error_impl(&dword_1C3607000, v8, OS_LOG_TYPE_ERROR, "SGMessageEventDissectorTrialClientWrapper: No active Trial deployment found", (uint8_t *)&v48, 2u);
    }
  }

}

void __49__SGMessageEventDissectorTrialClientWrapper_init__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  id *v8;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v8 = WeakRetained;
    objc_msgSend(MEMORY[0x1E0DC09C8], "clientWithIdentifier:", 245);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "levelForFactor:withNamespaceName:", CFSTR("trialEventExtractionAssets"), CFSTR("SMS_FILTER_INEN_CLASSIFICATION"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "directoryValue");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      objc_msgSend(v3, "directoryValue");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "hasPath");

      if (v7)
      {
        objc_msgSend(v8[1], "refresh");
        objc_msgSend(v8, "updateFactors");
      }
    }

    WeakRetained = v8;
  }

}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken2 != -1)
    dispatch_once(&sharedInstance__pasOnceToken2, &__block_literal_global_1861);
  return (id)sharedInstance__pasExprOnceResult_1862;
}

void __59__SGMessageEventDissectorTrialClientWrapper_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_1862;
  sharedInstance__pasExprOnceResult_1862 = v1;

  objc_autoreleasePoolPop(v0);
}

@end

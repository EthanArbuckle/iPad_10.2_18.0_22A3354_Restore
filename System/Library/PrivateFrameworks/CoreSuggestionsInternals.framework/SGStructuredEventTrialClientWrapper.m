@implementation SGStructuredEventTrialClientWrapper

- (SGStructuredEventTrialClientWrapper)init
{
  SGStructuredEventTrialClientWrapper *v2;
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
  v13.super_class = (Class)SGStructuredEventTrialClientWrapper;
  v2 = -[SGTrialClientWrapper initWithClientIdentifier:](&v13, sel_initWithClientIdentifier_, 106);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0D815F0]);
    v4 = (void *)objc_opt_new();
    v5 = objc_msgSend(v3, "initWithGuardedData:", v4);
    lock = v2->_lock;
    v2->_lock = (_PASLock *)v5;

    -[SGStructuredEventTrialClientWrapper updateFactors](v2, "updateFactors");
    location = 0;
    objc_initWeak(&location, v2);
    triClient = v2->super._triClient;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __43__SGStructuredEventTrialClientWrapper_init__block_invoke;
    v10[3] = &unk_1E7DAF4B8;
    objc_copyWeak(&v11, &location);
    v8 = (id)-[TRIClient addUpdateHandlerForNamespaceName:usingBlock:](triClient, "addUpdateHandlerForNamespaceName:usingBlock:", CFSTR("PRODUCTIVITY_INTELLIGENCE_STRUCTURED_EVENTS"), v10);
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
  v3[2] = __52__SGStructuredEventTrialClientWrapper_updateFactors__block_invoke;
  v3[3] = &unk_1E7DACC60;
  v3[4] = self;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v3);
}

- (id)baseModelName
{
  return CFSTR("StructuredEventModel");
}

- (id)supportedProviders
{
  _PASLock *lock;
  id v3;
  NSObject *v4;
  uint64_t v6;
  const __CFString *v7;
  _QWORD v8[5];
  __int128 buf;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__12885;
  v12 = __Block_byref_object_dispose__12886;
  lock = self->_lock;
  v13 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__SGStructuredEventTrialClientWrapper_supportedProviders__block_invoke;
  v8[3] = &unk_1E7DACC88;
  v8[4] = &buf;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v8);
  v3 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  sgEventsLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v6 = objc_msgSend(v3, "count");
    v7 = CFSTR("YES");
    if (!v6)
      v7 = CFSTR("NO");
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_debug_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEBUG, "SGStructuredEventTrialClientWrapper: supportedProviders list loaded with Trial: %@", (uint8_t *)&buf, 0xCu);
  }

  return v3;
}

- (id)engineConfig
{
  _PASLock *lock;
  id v3;
  NSObject *v4;
  uint64_t v6;
  const __CFString *v7;
  _QWORD v8[5];
  __int128 buf;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__12885;
  v12 = __Block_byref_object_dispose__12886;
  lock = self->_lock;
  v13 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__SGStructuredEventTrialClientWrapper_engineConfig__block_invoke;
  v8[3] = &unk_1E7DACC88;
  v8[4] = &buf;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v8);
  v3 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  sgEventsLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v6 = objc_msgSend(v3, "count");
    v7 = CFSTR("YES");
    if (!v6)
      v7 = CFSTR("NO");
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_debug_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEBUG, "SGStructuredEventTrialClientWrapper: engineConfig list loaded with Trial: %@", (uint8_t *)&buf, 0xCu);
  }

  return v3;
}

- (id)structuredEventInputMapping
{
  _PASLock *lock;
  id v3;
  NSObject *v4;
  uint64_t v6;
  const __CFString *v7;
  _QWORD v8[5];
  __int128 buf;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__12885;
  v12 = __Block_byref_object_dispose__12886;
  lock = self->_lock;
  v13 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__SGStructuredEventTrialClientWrapper_structuredEventInputMapping__block_invoke;
  v8[3] = &unk_1E7DACC88;
  v8[4] = &buf;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v8);
  v3 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  sgEventsLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v6 = objc_msgSend(v3, "count");
    v7 = CFSTR("YES");
    if (!v6)
      v7 = CFSTR("NO");
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_debug_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEBUG, "SGStructuredEventTrialClientWrapper: structuredEventInputMapping list loaded with Trial: %@", (uint8_t *)&buf, 0xCu);
  }

  return v3;
}

- (id)structuredEventOutputMapping
{
  _PASLock *lock;
  id v3;
  NSObject *v4;
  uint64_t v6;
  const __CFString *v7;
  _QWORD v8[5];
  __int128 buf;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__12885;
  v12 = __Block_byref_object_dispose__12886;
  lock = self->_lock;
  v13 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67__SGStructuredEventTrialClientWrapper_structuredEventOutputMapping__block_invoke;
  v8[3] = &unk_1E7DACC88;
  v8[4] = &buf;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v8);
  v3 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  sgEventsLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v6 = objc_msgSend(v3, "count");
    v7 = CFSTR("YES");
    if (!v6)
      v7 = CFSTR("NO");
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_debug_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEBUG, "SGStructuredEventTrialClientWrapper: structuredEventOutputMapping list loaded with Trial: %@", (uint8_t *)&buf, 0xCu);
  }

  return v3;
}

- (BOOL)foundInMailNotifications
{
  _PASLock *lock;
  int v3;
  NSObject *v4;
  const __CFString *v6;
  _QWORD v7[5];
  __int128 buf;
  uint64_t v9;
  char v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v9 = 0x2020000000;
  lock = self->_lock;
  v10 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__SGStructuredEventTrialClientWrapper_foundInMailNotifications__block_invoke;
  v7[3] = &unk_1E7DACC88;
  v7[4] = &buf;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);
  v3 = *(unsigned __int8 *)(*((_QWORD *)&buf + 1) + 24);
  _Block_object_dispose(&buf, 8);
  sgEventsLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v6 = CFSTR("NO");
    if (v3)
      v6 = CFSTR("YES");
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_debug_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEBUG, "SGStructuredEventTrialClientWrapper: foundInMailNotifications: %@", (uint8_t *)&buf, 0xCu);
  }

  return v3 != 0;
}

- (id)notificationsAllowListOverride
{
  void *v2;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  if (-[SGStructuredEventTrialClientWrapper foundInMailNotifications](self, "foundInMailNotifications"))
  {
    v4[0] = *MEMORY[0x1E0D19A28];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
}

uint64_t __63__SGStructuredEventTrialClientWrapper_foundInMailNotifications__block_invoke(uint64_t result, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_BYTE *)(a2 + 40);
  return result;
}

void __67__SGStructuredEventTrialClientWrapper_structuredEventOutputMapping__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 32));
}

void __66__SGStructuredEventTrialClientWrapper_structuredEventInputMapping__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 24));
}

void __51__SGStructuredEventTrialClientWrapper_engineConfig__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 16));
}

void __57__SGStructuredEventTrialClientWrapper_supportedProviders__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 8));
}

void __52__SGStructuredEventTrialClientWrapper_updateFactors__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  char v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  NSObject *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  NSObject *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  int v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  id v60;
  NSObject *v61;
  void *v62;
  void *v63;
  NSObject *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  id v76;
  id v77;
  id v78;
  _QWORD block[5];
  uint8_t buf[4];
  void *v81;
  __int16 v82;
  id v83;
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  sgEventsLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEFAULT, "SGStructuredEventTrialClientWrapper: Updating factors", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "refreshEnrollmentInformationForNamespace:", CFSTR("PRODUCTIVITY_INTELLIGENCE_STRUCTURED_EVENTS"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "levelForFactor:withNamespaceName:", CFSTR("StructuredEventModel.mlmodelc"), CFSTR("PRODUCTIVITY_INTELLIGENCE_STRUCTURED_EVENTS"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fileValue");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6
    && (v7 = (void *)v6,
        objc_msgSend(v5, "fileValue"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "hasPath"),
        v8,
        v7,
        v9))
  {
    objc_msgSend(*(id *)(a1 + 32), "modelPathForCurrentEnrollment");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "fileExistsAtPath:", v10);

      if ((v12 & 1) == 0)
      {
        v65 = *(void **)(a1 + 32);
        objc_msgSend(v5, "fileValue");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "path");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "uncompressModelAndUpdateFactors:destinationPath:", v38, v10);
        goto LABEL_43;
      }
    }

  }
  else
  {
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(NSObject **)(v13 + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__SGStructuredEventTrialClientWrapper_updateFactors__block_invoke_32;
    block[3] = &unk_1E7DB56F0;
    block[4] = v13;
    dispatch_async(v14, block);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "levelForFactor:withNamespaceName:", CFSTR("supportedProviders"), CFSTR("PRODUCTIVITY_INTELLIGENCE_STRUCTURED_EVENTS"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fileValue");
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
    objc_msgSend(v10, "fileValue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "hasPath");

    if (v18)
    {
      v19 = (void *)MEMORY[0x1E0D815D0];
      objc_msgSend(v10, "fileValue");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "path");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = 0;
      objc_msgSend(v19, "dictionaryWithPath:error:", v21, &v78);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v78;

      if (v22)
      {
        v24 = v22;
        v25 = *((_QWORD *)v3 + 1);
        *((_QWORD *)v3 + 1) = v24;
      }
      else
      {
        sgEventsLogHandle();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v10, "fileValue");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "path");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v81 = v67;
          v82 = 2112;
          v83 = v23;
          _os_log_error_impl(&dword_1C3607000, v25, OS_LOG_TYPE_ERROR, "SGStructuredEventTrialClientWrapper: Unable to load plplist for %@ : %@", buf, 0x16u);

        }
      }

    }
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "levelForFactor:withNamespaceName:", CFSTR("engineConfig"), CFSTR("PRODUCTIVITY_INTELLIGENCE_STRUCTURED_EVENTS"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "fileValue");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    objc_msgSend(v26, "fileValue");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "hasPath");

    if (v30)
    {
      v31 = (void *)MEMORY[0x1E0D815D0];
      objc_msgSend(v26, "fileValue");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "path");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = 0;
      objc_msgSend(v31, "dictionaryWithPath:error:", v33, &v77);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v77;

      if (v34)
      {
        v36 = v34;
        v37 = *((_QWORD *)v3 + 2);
        *((_QWORD *)v3 + 2) = v36;
      }
      else
      {
        sgEventsLogHandle();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v26, "fileValue");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "path");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v81 = v69;
          v82 = 2112;
          v83 = v35;
          _os_log_error_impl(&dword_1C3607000, v37, OS_LOG_TYPE_ERROR, "SGStructuredEventTrialClientWrapper: Unable to load plplist for %@ : %@", buf, 0x16u);

        }
      }

    }
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "levelForFactor:withNamespaceName:", CFSTR("structuredEventInputMapping"), CFSTR("PRODUCTIVITY_INTELLIGENCE_STRUCTURED_EVENTS"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "fileValue");
  v39 = objc_claimAutoreleasedReturnValue();
  if (v39)
  {
    v40 = (void *)v39;
    objc_msgSend(v38, "fileValue");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "hasPath");

    if (v42)
    {
      v43 = (void *)MEMORY[0x1E0D815D0];
      objc_msgSend(v38, "fileValue");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "path");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = 0;
      objc_msgSend(v43, "dictionaryWithPath:error:", v45, &v76);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v76;

      if (v46)
      {
        v48 = v46;
        v49 = *((_QWORD *)v3 + 3);
        *((_QWORD *)v3 + 3) = v48;
      }
      else
      {
        sgEventsLogHandle();
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v38, "fileValue");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "path");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v81 = v70;
          v82 = 2112;
          v83 = v47;
          _os_log_error_impl(&dword_1C3607000, v49, OS_LOG_TYPE_ERROR, "SGStructuredEventTrialClientWrapper: Unable to load plplist content for %@: %@", buf, 0x16u);

        }
      }

    }
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "levelForFactor:withNamespaceName:", CFSTR("structuredEventOutputMapping"), CFSTR("PRODUCTIVITY_INTELLIGENCE_STRUCTURED_EVENTS"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "fileValue");
  v51 = objc_claimAutoreleasedReturnValue();
  if (v51)
  {
    v52 = (void *)v51;
    objc_msgSend(v50, "fileValue");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v53, "hasPath");

    if (v54)
    {
      v73 = v5;
      v55 = (void *)MEMORY[0x1E0D815D0];
      objc_msgSend(v50, "fileValue");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "path");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = 0;
      objc_msgSend(v55, "dictionaryWithPath:error:", v57, &v75);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = v75;

      if (v58)
      {
        v60 = v58;
        v61 = *((_QWORD *)v3 + 4);
        *((_QWORD *)v3 + 4) = v60;
      }
      else
      {
        sgRemindersLogHandle();
        v61 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v50, "fileValue");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "path");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v81 = v71;
          v82 = 2112;
          v83 = v59;
          _os_log_error_impl(&dword_1C3607000, v61, OS_LOG_TYPE_ERROR, "SGStructuredEventTrialClientWrapper: Unable to load plplist content for %@: %@", buf, 0x16u);

        }
      }

      v5 = v73;
    }
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "levelForFactor:withNamespaceName:", CFSTR("foundInMailNotifications"), CFSTR("PRODUCTIVITY_INTELLIGENCE_STRUCTURED_EVENTS"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = v62;
  if (v62)
  {
    *((_BYTE *)v3 + 40) = objc_msgSend(v62, "BOOLeanValue");
  }
  else
  {
    sgEventsLogHandle();
    v64 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C3607000, v64, OS_LOG_TYPE_ERROR, "SGStructuredEventTrialClientWrapper: TRILevel is nil for foundInMailNotifications", buf, 2u);
    }

  }
LABEL_43:

}

uint64_t __52__SGStructuredEventTrialClientWrapper_updateFactors__block_invoke_32(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cleanExperimentModelsFromTrialModelsFolder");
}

void __43__SGStructuredEventTrialClientWrapper_init__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0DC09C8], "clientWithIdentifier:", 106);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "levelForFactor:withNamespaceName:", CFSTR("StructuredEventModel.mlmodelc"), CFSTR("PRODUCTIVITY_INTELLIGENCE_STRUCTURED_EVENTS"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "fileValue");
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3
      && (v4 = (void *)v3,
          objc_msgSend(v2, "fileValue"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v6 = objc_msgSend(v5, "hasPath"),
          v5,
          v4,
          v6))
    {
      objc_msgSend(WeakRetained, "modelPathForTriClient:andNamespace:", v1, CFSTR("PRODUCTIVITY_INTELLIGENCE_STRUCTURED_EVENTS"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "fileExistsAtPath:", v7);

        if ((v9 & 1) == 0)
        {
          objc_msgSend(v2, "fileValue");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "path");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(WeakRetained, "uncompressModelAndUpdateFactors:destinationPath:", v11, v7);

        }
      }

    }
    else
    {
      objc_msgSend(WeakRetained[1], "refresh");
      objc_msgSend(WeakRetained, "updateFactors");
    }

  }
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken2_12922 != -1)
    dispatch_once(&sharedInstance__pasOnceToken2_12922, &__block_literal_global_12923);
  return (id)sharedInstance__pasExprOnceResult_12924;
}

void __53__SGStructuredEventTrialClientWrapper_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_12924;
  sharedInstance__pasExprOnceResult_12924 = v1;

  objc_autoreleasePoolPop(v0);
}

@end

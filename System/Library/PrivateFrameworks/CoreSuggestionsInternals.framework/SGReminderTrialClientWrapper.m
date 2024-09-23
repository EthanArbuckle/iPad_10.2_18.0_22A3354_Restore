@implementation SGReminderTrialClientWrapper

- (SGReminderTrialClientWrapper)init
{
  SGReminderTrialClientWrapper *v2;
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
  v13.super_class = (Class)SGReminderTrialClientWrapper;
  v2 = -[SGTrialClientWrapper initWithClientIdentifier:](&v13, sel_initWithClientIdentifier_, 106);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0D815F0]);
    v4 = (void *)objc_opt_new();
    v5 = objc_msgSend(v3, "initWithGuardedData:", v4);
    lock = v2->_lock;
    v2->_lock = (_PASLock *)v5;

    -[SGReminderTrialClientWrapper updateFactors](v2, "updateFactors");
    location = 0;
    objc_initWeak(&location, v2);
    triClient = v2->super._triClient;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __36__SGReminderTrialClientWrapper_init__block_invoke;
    v10[3] = &unk_1E7DAF4B8;
    objc_copyWeak(&v11, &location);
    v8 = (id)-[TRIClient addUpdateHandlerForNamespaceName:usingBlock:](triClient, "addUpdateHandlerForNamespaceName:usingBlock:", CFSTR("PRODUCTIVITY_INTELLIGENCE_REMINDERS"), v10);
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
  v3[2] = __45__SGReminderTrialClientWrapper_updateFactors__block_invoke;
  v3[3] = &unk_1E7DAF4E0;
  v3[4] = self;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v3);
}

- (id)baseModelName
{
  return CFSTR("ReminderModel");
}

- (BOOL)confirmationOptional
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
  v7[2] = __52__SGReminderTrialClientWrapper_confirmationOptional__block_invoke;
  v7[3] = &unk_1E7DAF508;
  v7[4] = &buf;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);
  v3 = *(unsigned __int8 *)(*((_QWORD *)&buf + 1) + 24);
  _Block_object_dispose(&buf, 8);
  sgRemindersLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v6 = CFSTR("NO");
    if (v3)
      v6 = CFSTR("YES");
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_debug_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEBUG, "SGReminderTrialClientWrapper: confirmationOptional: %@", (uint8_t *)&buf, 0xCu);
  }

  return v3 != 0;
}

- (BOOL)triggerOptional
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
  v7[2] = __47__SGReminderTrialClientWrapper_triggerOptional__block_invoke;
  v7[3] = &unk_1E7DAF508;
  v7[4] = &buf;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);
  v3 = *(unsigned __int8 *)(*((_QWORD *)&buf + 1) + 24);
  _Block_object_dispose(&buf, 8);
  sgRemindersLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v6 = CFSTR("NO");
    if (v3)
      v6 = CFSTR("YES");
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_debug_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEBUG, "SGReminderTrialClientWrapper: triggerOptional: %@", (uint8_t *)&buf, 0xCu);
  }

  return v3 != 0;
}

- (BOOL)actionVerbOptional
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
  v7[2] = __50__SGReminderTrialClientWrapper_actionVerbOptional__block_invoke;
  v7[3] = &unk_1E7DAF508;
  v7[4] = &buf;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);
  v3 = *(unsigned __int8 *)(*((_QWORD *)&buf + 1) + 24);
  _Block_object_dispose(&buf, 8);
  sgRemindersLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v6 = CFSTR("NO");
    if (v3)
      v6 = CFSTR("YES");
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_debug_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEBUG, "SGReminderTrialClientWrapper: actionVerbOptional: %@", (uint8_t *)&buf, 0xCu);
  }

  return v3 != 0;
}

- (id)messagesBannerLimit
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
  v9 = __Block_byref_object_copy__20147;
  v10 = __Block_byref_object_dispose__20148;
  lock = self->_lock;
  v11 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__SGReminderTrialClientWrapper_messagesBannerLimit__block_invoke;
  v6[3] = &unk_1E7DAF508;
  v6[4] = &buf;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v6);
  v3 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  sgRemindersLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_debug_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEBUG, "SGReminderTrialClientWrapper: messagesBannerLimit: %@", (uint8_t *)&buf, 0xCu);
  }

  return v3;
}

- (id)reminderOverrides
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
  v11 = __Block_byref_object_copy__20147;
  v12 = __Block_byref_object_dispose__20148;
  lock = self->_lock;
  v13 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__SGReminderTrialClientWrapper_reminderOverrides__block_invoke;
  v8[3] = &unk_1E7DAF508;
  v8[4] = &buf;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v8);
  v3 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  sgRemindersLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v6 = objc_msgSend(v3, "count");
    v7 = CFSTR("YES");
    if (!v6)
      v7 = CFSTR("NO");
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_debug_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEBUG, "SGReminderTrialClientWrapper: reminderOverrides list loaded with Trial: %@", (uint8_t *)&buf, 0xCu);
  }

  return v3;
}

- (id)reminderEnrichments
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
  v11 = __Block_byref_object_copy__20147;
  v12 = __Block_byref_object_dispose__20148;
  lock = self->_lock;
  v13 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__SGReminderTrialClientWrapper_reminderEnrichments__block_invoke;
  v8[3] = &unk_1E7DAF508;
  v8[4] = &buf;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v8);
  v3 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  sgRemindersLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v6 = objc_msgSend(v3, "count");
    v7 = CFSTR("YES");
    if (!v6)
      v7 = CFSTR("NO");
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_debug_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEBUG, "SGReminderTrialClientWrapper: reminderEnrichments list loaded with Trial: %@", (uint8_t *)&buf, 0xCu);
  }

  return v3;
}

- (id)reminderInputMapping
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
  v11 = __Block_byref_object_copy__20147;
  v12 = __Block_byref_object_dispose__20148;
  lock = self->_lock;
  v13 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__SGReminderTrialClientWrapper_reminderInputMapping__block_invoke;
  v8[3] = &unk_1E7DAF508;
  v8[4] = &buf;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v8);
  v3 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  sgRemindersLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v6 = objc_msgSend(v3, "count");
    v7 = CFSTR("YES");
    if (!v6)
      v7 = CFSTR("NO");
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_debug_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEBUG, "SGReminderTrialClientWrapper: reminderInputMapping list loaded with Trial: %@", (uint8_t *)&buf, 0xCu);
  }

  return v3;
}

- (id)reminderOutputMapping
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
  v11 = __Block_byref_object_copy__20147;
  v12 = __Block_byref_object_dispose__20148;
  lock = self->_lock;
  v13 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__SGReminderTrialClientWrapper_reminderOutputMapping__block_invoke;
  v8[3] = &unk_1E7DAF508;
  v8[4] = &buf;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v8);
  v3 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  sgRemindersLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v6 = objc_msgSend(v3, "count");
    v7 = CFSTR("YES");
    if (!v6)
      v7 = CFSTR("NO");
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_debug_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEBUG, "SGReminderTrialClientWrapper: reminderOutputMapping list loaded with Trial: %@", (uint8_t *)&buf, 0xCu);
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
}

void __53__SGReminderTrialClientWrapper_reminderOutputMapping__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 48));
}

void __52__SGReminderTrialClientWrapper_reminderInputMapping__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 40));
}

void __51__SGReminderTrialClientWrapper_reminderEnrichments__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 32));
}

void __49__SGReminderTrialClientWrapper_reminderOverrides__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 24));
}

void __51__SGReminderTrialClientWrapper_messagesBannerLimit__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 16));
}

uint64_t __50__SGReminderTrialClientWrapper_actionVerbOptional__block_invoke(uint64_t result, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_BYTE *)(a2 + 10);
  return result;
}

uint64_t __47__SGReminderTrialClientWrapper_triggerOptional__block_invoke(uint64_t result, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_BYTE *)(a2 + 9);
  return result;
}

uint64_t __52__SGReminderTrialClientWrapper_confirmationOptional__block_invoke(uint64_t result, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_BYTE *)(a2 + 8);
  return result;
}

void __45__SGReminderTrialClientWrapper_updateFactors__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  char v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  NSObject *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  NSObject *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  int v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  id v63;
  NSObject *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  int v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  id v75;
  NSObject *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  id v93;
  id v94;
  id v95;
  id v96;
  _QWORD block[5];
  uint8_t buf[4];
  void *v99;
  __int16 v100;
  id v101;
  uint64_t v102;

  v102 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  *((_WORD *)v3 + 4) = 0;
  *((_BYTE *)v3 + 10) = 0;
  v4 = (void *)*((_QWORD *)v3 + 2);
  *((_QWORD *)v3 + 2) = &unk_1E7E0C668;

  sgRemindersLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C3607000, v5, OS_LOG_TYPE_DEFAULT, "SGReminderTrialClientWrapper: Updating factors", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "refreshEnrollmentInformationForNamespace:", CFSTR("PRODUCTIVITY_INTELLIGENCE_REMINDERS"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "levelForFactor:withNamespaceName:", CFSTR("ReminderModel.mlmodelc"), CFSTR("PRODUCTIVITY_INTELLIGENCE_REMINDERS"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fileValue");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7
    && (v8 = (void *)v7,
        objc_msgSend(v6, "fileValue"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "hasPath"),
        v9,
        v8,
        v10))
  {
    objc_msgSend(*(id *)(a1 + 32), "modelPathForCurrentEnrollment");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "fileExistsAtPath:", v11);

      if ((v13 & 1) == 0)
      {
        v79 = *(void **)(a1 + 32);
        objc_msgSend(v6, "fileValue");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "path");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "uncompressModelAndUpdateFactors:destinationPath:", v78, v11);
        goto LABEL_57;
      }
    }

  }
  else
  {
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(NSObject **)(v14 + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__SGReminderTrialClientWrapper_updateFactors__block_invoke_43;
    block[3] = &unk_1E7DB56F0;
    block[4] = v14;
    dispatch_async(v15, block);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "levelForFactor:withNamespaceName:", CFSTR("confirmationOptional"), CFSTR("PRODUCTIVITY_INTELLIGENCE_REMINDERS"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v16;
  if (v16)
  {
    *((_BYTE *)v3 + 8) = objc_msgSend(v16, "BOOLeanValue");
  }
  else
  {
    sgRemindersLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C3607000, v17, OS_LOG_TYPE_ERROR, "SGReminderTrialClientWrapper: TRILevel is nil for confirmationOptional", buf, 2u);
    }

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "levelForFactor:withNamespaceName:", CFSTR("triggerOptional"), CFSTR("PRODUCTIVITY_INTELLIGENCE_REMINDERS"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    *((_BYTE *)v3 + 9) = objc_msgSend(v18, "BOOLeanValue");
  }
  else
  {
    sgRemindersLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C3607000, v20, OS_LOG_TYPE_ERROR, "SGReminderTrialClientWrapper: TRILevel is nil for triggerOptional", buf, 2u);
    }

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "levelForFactor:withNamespaceName:", CFSTR("actionVerbOptional"), CFSTR("PRODUCTIVITY_INTELLIGENCE_REMINDERS"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21)
  {
    *((_BYTE *)v3 + 10) = objc_msgSend(v21, "BOOLeanValue");
  }
  else
  {
    sgRemindersLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C3607000, v23, OS_LOG_TYPE_ERROR, "SGReminderTrialClientWrapper: TRILevel is nil for actionVerbOptional", buf, 2u);
    }

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "levelForFactor:withNamespaceName:", CFSTR("messagesBannerLimit"), CFSTR("PRODUCTIVITY_INTELLIGENCE_REMINDERS"));
  v24 = objc_claimAutoreleasedReturnValue();
  v91 = v22;
  v92 = v19;
  v90 = (void *)v24;
  if (v24)
  {
    v25 = (void *)v24;
    v26 = objc_alloc(MEMORY[0x1E0CB37E8]);
    objc_msgSend(v25, "doubleValue");
    v27 = objc_msgSend(v26, "initWithDouble:");
    v28 = *((_QWORD *)v3 + 2);
    *((_QWORD *)v3 + 2) = v27;
  }
  else
  {
    sgRemindersLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C3607000, v28, OS_LOG_TYPE_ERROR, "SGReminderTrialClientWrapper: TRILevel is nil for messagesBannerLimit", buf, 2u);
    }
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "levelForFactor:withNamespaceName:", CFSTR("reminderOverrides"), CFSTR("PRODUCTIVITY_INTELLIGENCE_REMINDERS"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "fileValue");
  v30 = objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    v31 = (void *)v30;
    objc_msgSend(v29, "fileValue");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "hasPath");

    if (v33)
    {
      v34 = (void *)MEMORY[0x1E0D815D0];
      objc_msgSend(v29, "fileValue");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "path");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v96 = 0;
      objc_msgSend(v34, "dictionaryWithPath:error:", v36, &v96);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v96;

      if (v37)
      {
        v39 = v37;
        v40 = *((_QWORD *)v3 + 3);
        *((_QWORD *)v3 + 3) = v39;
      }
      else
      {
        sgRemindersLogHandle();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v29, "fileValue");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "path");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v99 = v81;
          v100 = 2112;
          v101 = v38;
          _os_log_error_impl(&dword_1C3607000, v40, OS_LOG_TYPE_ERROR, "Unable to load plplist content for %@: %@", buf, 0x16u);

        }
      }

    }
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "levelForFactor:withNamespaceName:", CFSTR("reminderPreprocessor"), CFSTR("PRODUCTIVITY_INTELLIGENCE_REMINDERS"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "fileValue");
  v42 = objc_claimAutoreleasedReturnValue();
  if (v42)
  {
    v43 = (void *)v42;
    objc_msgSend(v41, "fileValue");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "hasPath");

    if (v45)
    {
      v46 = (void *)MEMORY[0x1E0D815D0];
      objc_msgSend(v41, "fileValue");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "path");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v95 = 0;
      objc_msgSend(v46, "dictionaryWithPath:error:", v48, &v95);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v95;

      if (v49)
      {
        v51 = v49;
        v52 = *((_QWORD *)v3 + 4);
        *((_QWORD *)v3 + 4) = v51;
      }
      else
      {
        sgRemindersLogHandle();
        v52 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v29, "fileValue");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v89, "path");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v99 = v82;
          v100 = 2112;
          v101 = v50;
          _os_log_error_impl(&dword_1C3607000, v52, OS_LOG_TYPE_ERROR, "Unable to load plplist content for %@: %@", buf, 0x16u);

        }
      }

    }
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "levelForFactor:withNamespaceName:", CFSTR("reminderInputMapping"), CFSTR("PRODUCTIVITY_INTELLIGENCE_REMINDERS"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "fileValue");
  v54 = objc_claimAutoreleasedReturnValue();
  if (v54)
  {
    v55 = (void *)v54;
    objc_msgSend(v53, "fileValue");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v56, "hasPath");

    if (v57)
    {
      v87 = v6;
      v58 = (void *)MEMORY[0x1E0D815D0];
      objc_msgSend(v53, "fileValue");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "path");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v94 = 0;
      objc_msgSend(v58, "dictionaryWithPath:error:", v60, &v94);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = v94;

      if (v61)
      {
        v63 = v61;
        v64 = *((_QWORD *)v3 + 5);
        *((_QWORD *)v3 + 5) = v63;
      }
      else
      {
        sgRemindersLogHandle();
        v64 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v53, "fileValue");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v85, "path");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v99 = v83;
          v100 = 2112;
          v101 = v62;
          _os_log_error_impl(&dword_1C3607000, v64, OS_LOG_TYPE_ERROR, "Unable to load plplist content for %@: %@", buf, 0x16u);

        }
      }

      v6 = v87;
    }
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "levelForFactor:withNamespaceName:", CFSTR("reminderOutputMapping"), CFSTR("PRODUCTIVITY_INTELLIGENCE_REMINDERS"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "fileValue");
  v66 = objc_claimAutoreleasedReturnValue();
  if (v66)
  {
    v67 = (void *)v66;
    objc_msgSend(v65, "fileValue");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = objc_msgSend(v68, "hasPath");

    if (v69)
    {
      v88 = v6;
      v70 = (void *)MEMORY[0x1E0D815D0];
      objc_msgSend(v65, "fileValue");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "path");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = 0;
      objc_msgSend(v70, "dictionaryWithPath:error:", v72, &v93);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = v93;

      if (v73)
      {
        v75 = v73;
        v76 = *((_QWORD *)v3 + 6);
        *((_QWORD *)v3 + 6) = v75;
      }
      else
      {
        sgRemindersLogHandle();
        v76 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v65, "fileValue");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "path");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v99 = v84;
          v100 = 2112;
          v101 = v74;
          _os_log_error_impl(&dword_1C3607000, v76, OS_LOG_TYPE_ERROR, "Unable to load plplist content for %@: %@", buf, 0x16u);

        }
      }

      v6 = v88;
    }
  }

  v78 = v91;
  v77 = v92;
LABEL_57:

}

uint64_t __45__SGReminderTrialClientWrapper_updateFactors__block_invoke_43(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cleanExperimentModelsFromTrialModelsFolder");
}

void __36__SGReminderTrialClientWrapper_init__block_invoke(uint64_t a1)
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
    objc_msgSend(v1, "levelForFactor:withNamespaceName:", CFSTR("ReminderModel.mlmodelc"), CFSTR("PRODUCTIVITY_INTELLIGENCE_REMINDERS"));
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
      objc_msgSend(WeakRetained, "modelPathForTriClient:andNamespace:", v1, CFSTR("PRODUCTIVITY_INTELLIGENCE_REMINDERS"));
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
  if (sharedInstance__pasOnceToken2_20205 != -1)
    dispatch_once(&sharedInstance__pasOnceToken2_20205, &__block_literal_global_20206);
  return (id)sharedInstance__pasExprOnceResult_20207;
}

void __46__SGReminderTrialClientWrapper_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_20207;
  sharedInstance__pasExprOnceResult_20207 = v1;

  objc_autoreleasePoolPop(v0);
}

@end

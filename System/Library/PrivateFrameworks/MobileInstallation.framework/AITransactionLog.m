@implementation AITransactionLog

+ (void)initializeWithLog:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__AITransactionLog_initializeWithLog___block_invoke;
  block[3] = &unk_1E6163790;
  v7 = v3;
  v4 = initializeWithLog__onceToken;
  v5 = v3;
  if (v4 != -1)
    dispatch_once(&initializeWithLog__onceToken, block);

}

+ (void)logStep:(unint64_t)a3 byParty:(unint64_t)a4 phase:(unint64_t)a5 success:(BOOL)a6 forBundleID:(id)a7 description:(id)a8
{
  +[AITransactionLog logStep:byParty:phase:success:forBundleID:persona:description:](AITransactionLog, "logStep:byParty:phase:success:forBundleID:persona:description:", a3, a4, a5, a6, a7, CFSTR("Unknown Persona"), a8);
}

void __38__AITransactionLog_initializeWithLog___block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = -[AITransactionLog _initWithLog:]([AITransactionLog alloc], "_initWithLog:", *(_QWORD *)(a1 + 32));
  v2 = (void *)__defaultLog;
  __defaultLog = (uint64_t)v1;

}

+ (void)logScenario:(id)a3 step:(unint64_t)a4 success:(BOOL)a5 forBundleID:(id)a6 description:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  id v15;

  v8 = a5;
  v12 = a7;
  v13 = a6;
  v14 = a3;
  objc_msgSend(a1, "_defaultLog");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_logScenario:step:success:forBundleID:persona:description:", v14, a4, v8, v13, CFSTR("Unknown Persona"), v12);

}

+ (void)logStep:(unint64_t)a3 byParty:(unint64_t)a4 phase:(unint64_t)a5 success:(BOOL)a6 forBundleID:(id)a7 persona:(id)a8 description:(id)a9
{
  _BOOL4 v10;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  int v18;
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  unint64_t v23;
  __int16 v24;
  unint64_t v25;
  __int16 v26;
  unint64_t v27;
  __int16 v28;
  _BOOL4 v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v10 = a6;
  v32 = *MEMORY[0x1E0C80C00];
  v14 = a7;
  v15 = a8;
  v16 = a9;
  if (logStep_byParty_phase_success_forBundleID_persona_description__onceToken != -1)
    dispatch_once(&logStep_byParty_phase_success_forBundleID_persona_description__onceToken, &__block_literal_global_1);
  v17 = logStep_byParty_phase_success_forBundleID_persona_description__sharedLog;
  if (os_log_type_enabled((os_log_t)logStep_byParty_phase_success_forBundleID_persona_description__sharedLog, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 138544898;
    v19 = v14;
    v20 = 2114;
    v21 = v15;
    v22 = 2048;
    v23 = a4;
    v24 = 2048;
    v25 = a3;
    v26 = 2048;
    v27 = a5;
    v28 = 1024;
    v29 = v10;
    v30 = 2114;
    v31 = v16;
    _os_log_impl(&dword_1B0766000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@/%{public}@:%lu:%lu:%lu:%u:%{public}@", (uint8_t *)&v18, 0x44u);
  }

}

void __82__AITransactionLog_logStep_byParty_phase_success_forBundleID_persona_description___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.appinstallation", "TransactionLog");
  v1 = (void *)logStep_byParty_phase_success_forBundleID_persona_description__sharedLog;
  logStep_byParty_phase_success_forBundleID_persona_description__sharedLog = (uint64_t)v0;

}

- (id)_initWithLog:(id)a3
{
  id v5;
  AITransactionLog *v6;
  AITransactionLog *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AITransactionLog;
  v6 = -[AITransactionLog init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_log, a3);

  return v7;
}

+ (id)_defaultLog
{
  void *v3;
  void *v6;

  v3 = (void *)__defaultLog;
  if (!__defaultLog)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("AITransactionLog.m"), 63, CFSTR("Transaction log must be initialized before use. Please call +[AITransactionLog initializeWithLog:]."));

    v3 = (void *)__defaultLog;
  }
  return v3;
}

- (void)_logScenario:(id)a3 step:(unint64_t)a4 success:(BOOL)a5 forBundleID:(id)a6 persona:(id)a7 description:(id)a8
{
  _BOOL4 v11;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  NSObject *log;
  const char *v26;
  const char *v27;
  const char *v28;
  const char *v29;
  const char *v30;
  int v31;
  const char *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  unint64_t v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  const char *v42;
  uint64_t v43;

  v11 = a5;
  v43 = *MEMORY[0x1E0C80C00];
  v14 = objc_retainAutorelease(a3);
  v15 = a8;
  v16 = a7;
  v17 = a6;
  v18 = objc_msgSend(v14, "UTF8String");
  v19 = objc_retainAutorelease(v17);
  v20 = objc_msgSend(v19, "UTF8String");

  v21 = objc_retainAutorelease(v16);
  v22 = objc_msgSend(v21, "UTF8String");

  v23 = objc_retainAutorelease(v15);
  v24 = objc_msgSend(v23, "UTF8String");

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v26 = "_";
    if (v24)
      v27 = (const char *)v24;
    else
      v27 = "_";
    v31 = 136316418;
    if (v22)
      v28 = (const char *)v22;
    else
      v28 = "_";
    if (v20)
      v29 = (const char *)v20;
    else
      v29 = "_";
    v32 = v29;
    v33 = 2080;
    v34 = v28;
    if (v18)
      v26 = (const char *)v18;
    v35 = 2080;
    v36 = v26;
    v30 = "Success";
    v37 = 2048;
    v38 = a4;
    if (!v11)
      v30 = "Fail";
    v39 = 2080;
    v40 = v30;
    v41 = 2080;
    v42 = v27;
    _os_log_impl(&dword_1B0766000, log, OS_LOG_TYPE_DEFAULT, "%s:%s:%s:%ld:%s:%s", (uint8_t *)&v31, 0x3Eu);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
}

@end

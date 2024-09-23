@implementation ENTestResultManager

+ (BOOL)checkValidNonce:(id)a3 size:(unint64_t)a4
{
  objc_class *v5;
  id v6;
  void *v7;
  BOOL v8;

  if (!a3)
    return 0;
  v5 = (objc_class *)MEMORY[0x1E0C99D58];
  v6 = a3;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithBase64EncodedString:options:", v6, 0);

  if (v7)
    v8 = objc_msgSend(v7, "length") == a4;
  else
    v8 = 0;

  return v8;
}

+ (id)generateSecureNonce:(unint64_t)a3
{
  void *v4;
  const __SecRandom *v5;
  id v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99DF8], "dataWithLength:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (const __SecRandom *)*MEMORY[0x1E0CD7008];
  v6 = objc_retainAutorelease(v4);
  if (SecRandomCopyBytes(v5, a3, (void *)objc_msgSend(v6, "mutableBytes")))
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v6, "base64EncodedStringWithOptions:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (ENTestResultManager)initWithConfigurationStore:(id)a3 exposureDatabase:(id)a4 temporaryExposureKeyManager:(id)a5 queue:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  ENTestResultManager *v15;
  ENTestResultManager *v16;
  uint64_t v17;
  NSURLSession *URLSession;
  uint64_t v19;
  NSURLSession *URLBackupSession;
  objc_super v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)ENTestResultManager;
  v15 = -[ENTestResultManager init](&v22, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_configurationStore, a3);
    objc_storeStrong((id *)&v16->_exposureDatabase, a4);
    objc_storeStrong((id *)&v16->_temporaryExposureKeyManager, a5);
    objc_storeStrong((id *)&v16->_queue, a6);
    -[ENTestResultManager _createURLSessionWithSecondaryIdentifier:](v16, "_createURLSessionWithSecondaryIdentifier:", 1);
    v17 = objc_claimAutoreleasedReturnValue();
    URLSession = v16->_URLSession;
    v16->_URLSession = (NSURLSession *)v17;

    -[ENTestResultManager _createURLSessionWithSecondaryIdentifier:](v16, "_createURLSessionWithSecondaryIdentifier:", 0);
    v19 = objc_claimAutoreleasedReturnValue();
    URLBackupSession = v16->_URLBackupSession;
    v16->_URLBackupSession = (NSURLSession *)v19;

    v16->_maxRetryTime = 900;
  }

  return v16;
}

- (void)invalidate
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__ENTestResultManager_invalidate__block_invoke;
  block[3] = &unk_1E87D9C28;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __33__ENTestResultManager_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

- (void)_invalidate
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  ENRegion *chaffingRegion;
  ENXPCTimer *chaffingTimer;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[ENChaffTestResultSession invalidate](self->_chaffSession, "invalidate");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[NSMutableDictionary allValues](self->_sessionsByUUID, "allValues", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
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
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7++), "invalidate");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  -[NSMutableDictionary removeAllObjects](self->_sessionsByUUID, "removeAllObjects");
  chaffingRegion = self->_chaffingRegion;
  self->_chaffingRegion = 0;

  -[ENXPCTimer invalidate](self->_chaffingTimer, "invalidate");
  chaffingTimer = self->_chaffingTimer;
  self->_chaffingTimer = 0;

}

- (id)_createURLSessionWithSecondaryIdentifier:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C92CA8], "defaultSessionConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ENBundleIdentifierForURLSessions();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "set_sourceApplicationBundleIdentifier:", v5);

  if (v3)
    objc_msgSend(v4, "set_sourceApplicationSecondaryIdentifier:", *MEMORY[0x1E0CAA2C8]);
  objc_msgSend(MEMORY[0x1E0C92C90], "sessionWithConfiguration:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)activateAutomatedChaffingWithRegion:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__ENTestResultManager_activateAutomatedChaffingWithRegion___block_invoke;
  v7[3] = &unk_1E87D9DD8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __59__ENTestResultManager_activateAutomatedChaffingWithRegion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activateAutomatedChaffingWithRegion:", *(_QWORD *)(a1 + 40));
}

- (void)_activateAutomatedChaffingWithRegion:(id)a3
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  id v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  int v23;
  uint64_t Int64;
  double v25;
  _BOOL4 v27;
  void *v28;
  int v29;
  const char *v30;
  const char *v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  char v36;
  void *v37;
  int v38;
  uint64_t v39;
  uint32_t v40;
  uint32_t v41;
  double v42;
  double v43;
  double v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  int v48;
  void *v49;
  ENXPCTimer *v50;
  ENXPCTimer *v51;
  ENXPCTimer *chaffingTimer;
  void *v53;
  int v54;
  void *v55;
  int v56;
  void *v57;
  int v58;
  void *v59;
  int v60;
  void *v61;
  int v62;
  double v63;
  double v64;
  const char *v65;
  void *v66;
  const char *v67;
  id v68;
  _QWORD v69[5];
  id v70;

  v5 = a3;
  if (self->_chaffingTimer && (-[ENRegion isEqual:](self->_chaffingRegion, "isEqual:", v5) & 1) == 0)
  {
    +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isSensitiveLoggingAllowed");

    if (v7
      && gLogCategory_ENTestResultManager <= 40
      && (gLogCategory_ENTestResultManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    -[ENTestResultManager _deactivateAutomatedChaffing](self, "_deactivateAutomatedChaffing");
  }
  objc_msgSend(MEMORY[0x1E0C99D60], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  CFPrefs_GetDouble();
  if (v9 != 0.0)
  {
    objc_msgSend(MEMORY[0x1E0C99D60], "dateWithTimeIntervalSince1970:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D40], "currentCalendar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isDate:inSameDayAsDate:", v10, v8);

    if ((v12 & 1) == 0)
    {
      CFPrefs_RemoveValue();
      CFPrefs_RemoveValue();
    }

  }
  v70 = 0;
  -[ENTestResultManager _serverConfigurationForRegion:error:](self, "_serverConfigurationForRegion:error:", v5, &v70);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v70;
  if (!v13)
  {
    -[ENTestResultManager _deactivateAutomatedChaffing](self, "_deactivateAutomatedChaffing");
    +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v55, "isSensitiveLoggingAllowed");

    if (!v56
      || gLogCategory_ENTestResultManager > 40
      || gLogCategory_ENTestResultManager == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_74;
    }
LABEL_95:
    LogPrintF_safe();
    goto LABEL_74;
  }
  if (!objc_msgSend(v13, "isChaffingEnabled")
    || (objc_msgSend(v13, "chaffingSelectionPercentage"), v15 <= 0.0)
    && (objc_msgSend(v13, "chaffingSelectionPercentageAlternative"), v16 <= 0.0))
  {
    -[ENTestResultManager _deactivateAutomatedChaffing](self, "_deactivateAutomatedChaffing");
    +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v53, "isSensitiveLoggingAllowed");

    if (!v54
      || gLogCategory_ENTestResultManager > 40
      || gLogCategory_ENTestResultManager == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_74;
    }
    goto LABEL_95;
  }
  CFPrefs_GetInt64();
  CFPrefs_GetInt64();
  if (self->_chaffingTimer)
  {
    +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v57, "isSensitiveLoggingAllowed");

    if (!v58
      || gLogCategory_ENTestResultManager > 10
      || gLogCategory_ENTestResultManager == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_74;
    }
    objc_msgSend(v13, "maximumChaffsAllowedPerDay");
    goto LABEL_95;
  }
  -[ENTestResultManager delegate](self, "delegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "isProxyEnabledForTestResultManager:", self))
    objc_msgSend(v13, "chaffingSelectionPercentageAlternative");
  else
    objc_msgSend(v13, "chaffingSelectionPercentage");
  v19 = v18;

  CFPrefs_GetDouble();
  if (v20 == 0.0 || (v21 = v20, !IsAppleInternalBuild()))
    v21 = v19;
  +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "isSensitiveLoggingAllowed");

  if (v23
    && gLogCategory_ENTestResultManager <= 40
    && (gLogCategory_ENTestResultManager != -1 || _LogCategory_Initialize()))
  {
    v63 = v21;
    LogPrintF_safe();
  }
  if (v21 <= 0.0)
  {
    -[ENTestResultManager _deactivateAutomatedChaffing](self, "_deactivateAutomatedChaffing");
    goto LABEL_74;
  }
  v68 = v14;
  Int64 = CFPrefs_GetInt64();
  v25 = (double)arc4random() * 2.32830644e-10 * 100.0;
  v27 = v25 < v21 || Int64 != 0;
  +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs", *(_QWORD *)&v63);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "isSensitiveLoggingAllowed");

  if (v29
    && gLogCategory_ENTestResultManager <= 40
    && (gLogCategory_ENTestResultManager != -1 || _LogCategory_Initialize()))
  {
    v30 = "no";
    if (v27)
      v31 = "yes";
    else
      v31 = "no";
    if (Int64)
      v30 = "yes";
    v64 = v25;
    v65 = v31;
    v67 = v30;
    LogPrintF_safe();
  }
  if (!Int64)
  {
    CFPrefs_GetDouble();
    v33 = v32;
    if (v32 == 0.0)
    {
      objc_msgSend(v8, "timeIntervalSince1970");
      CFPrefs_SetDouble();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D60], "dateWithTimeIntervalSince1970:", v32);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D40], "currentCalendar");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "isDate:inSameDayAsDate:", v34, v8);

      if ((v36 & 1) == 0)
      {
        +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v37, "isSensitiveLoggingAllowed");

        if (v38
          && gLogCategory_ENTestResultManager <= 40
          && (gLogCategory_ENTestResultManager != -1 || _LogCategory_Initialize()))
        {
          LogPrintF_safe();
        }
        objc_msgSend(v8, "timeIntervalSince1970", *(_QWORD *)&v64, v65, v67);
        CFPrefs_SetDouble();
        v33 = 0.0;
      }

    }
    if (v33 != 0.0)
    {
      +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = objc_msgSend(v61, "isSensitiveLoggingAllowed");

      v14 = v68;
      if (!v62
        || gLogCategory_ENTestResultManager > 10
        || gLogCategory_ENTestResultManager == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_74;
      }
      goto LABEL_95;
    }
  }
  if (!v27)
  {
    +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v59, "isSensitiveLoggingAllowed");

    v14 = v68;
    if (!v60
      || gLogCategory_ENTestResultManager > 40
      || gLogCategory_ENTestResultManager == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_74;
    }
    goto LABEL_95;
  }
  v39 = 0x15180 / objc_msgSend(v13, "maximumChaffsAllowedPerDay");
  v40 = arc4random_uniform(0x1C20u);
  if (Int64)
    v41 = arc4random_uniform(0x2A30u) + 3600;
  else
    v41 = v40 + 60;
  v42 = (double)v41;
  CFPrefs_GetDouble();
  if (v43 <= 0.0)
  {
    v44 = 900.0;
  }
  else
  {
    v42 = v43;
    v44 = 10.0;
  }
  v45 = CFPrefs_GetInt64();
  if (v45)
    v46 = v45;
  else
    v46 = v39;
  +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs", *(_QWORD *)&v64);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v47, "isSensitiveLoggingAllowed");

  if (v48
    && gLogCategory_ENTestResultManager <= 50
    && (gLogCategory_ENTestResultManager != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(MEMORY[0x1E0CB37E0], "numberWithDouble:", v42);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E0], "numberWithUnsignedInteger:", v46);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();

  }
  v50 = [ENXPCTimer alloc];
  v69[0] = MEMORY[0x1E0C809B0];
  v69[1] = 3221225472;
  v69[2] = __60__ENTestResultManager__activateAutomatedChaffingWithRegion___block_invoke;
  v69[3] = &unk_1E87DA278;
  v69[4] = self;
  v51 = -[ENXPCTimer initWithName:delay:gracePeriod:cadence:priority:options:block:](v50, "initWithName:delay:gracePeriod:cadence:priority:options:block:", CFSTR("com.apple.exposureNotification.chaffing"), v46, 0, 9153, v69, v42, v44);
  chaffingTimer = self->_chaffingTimer;
  self->_chaffingTimer = v51;

  objc_storeStrong((id *)&self->_chaffingRegion, a3);
  v14 = v68;
LABEL_74:

}

void __60__ENTestResultManager__activateAutomatedChaffingWithRegion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__ENTestResultManager__activateAutomatedChaffingWithRegion___block_invoke_2;
  block[3] = &unk_1E87D9C28;
  block[4] = v1;
  dispatch_async(v2, block);
}

uint64_t __60__ENTestResultManager__activateAutomatedChaffingWithRegion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateChaffingTimerBlock");
}

- (void)activateWebSession:(id)a3 verificationTimestamp:(double)a4 nonceTimestamp:(double)a5
{
  id v5;

  v5 = a3;
  CFPrefs_SetDouble();
  CFPrefs_SetDouble();
  CFPrefs_SetValue();

}

- (void)deactivateAutomatedChaffing
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__ENTestResultManager_deactivateAutomatedChaffing__block_invoke;
  block[3] = &unk_1E87D9C28;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __50__ENTestResultManager_deactivateAutomatedChaffing__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deactivateAutomatedChaffing");
}

- (void)_deactivateAutomatedChaffing
{
  void *v3;
  int v4;
  ENRegion *chaffingRegion;
  ENXPCTimer *chaffingTimer;
  void *v7;
  int v8;

  if (self->_chaffSession)
  {
    +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isSensitiveLoggingAllowed");

    if (v8
      && gLogCategory_ENTestResultManager <= 40
      && (gLogCategory_ENTestResultManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
  }
  else
  {
    if (self->_chaffingRegion)
    {
      +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "isSensitiveLoggingAllowed");

      if (v4)
      {
        if (gLogCategory_ENTestResultManager <= 40
          && (gLogCategory_ENTestResultManager != -1 || _LogCategory_Initialize()))
        {
          LogPrintF_safe();
        }
      }
    }
    chaffingRegion = self->_chaffingRegion;
    self->_chaffingRegion = 0;

    -[ENXPCTimer invalidate](self->_chaffingTimer, "invalidate");
    chaffingTimer = self->_chaffingTimer;
    self->_chaffingTimer = 0;

    CFPrefs_RemoveValue();
    CFPrefs_RemoveValue();
    CFPrefs_RemoveValue();
    CFPrefs_SetInt64();
  }
}

- (void)deactivateWebSession
{
  CFPrefs_RemoveValue();
  CFPrefs_RemoveValue();
}

- (void)_updateChaffingTimerBlock
{
  ENRegion *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t Int64;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  _QWORD v28[6];
  id v29;

  v3 = self->_chaffingRegion;
  if (v3)
  {
    v29 = 0;
    -[ENTestResultManager _serverConfigurationForRegion:error:](self, "_serverConfigurationForRegion:error:", v3, &v29);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v29;
    v6 = v5;
    if (!v4)
    {
      -[ENTestResultManager _deactivateAutomatedChaffing](self, "_deactivateAutomatedChaffing");
      +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isSensitiveLoggingAllowed");

      if (v18
        && gLogCategory_ENTestResultManager <= 40
        && (gLogCategory_ENTestResultManager != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
      goto LABEL_17;
    }
    v27 = v5;
    objc_msgSend(MEMORY[0x1E0C99D60], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D40], "currentCalendar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    Int64 = CFPrefs_GetInt64();
    CFPrefs_GetDouble();
    v11 = v10;
    if (!Int64 && v10 == 0.0)
    {
      objc_msgSend(v7, "timeIntervalSince1970");
      v11 = v12;
      CFPrefs_SetDouble();
    }
    objc_msgSend(MEMORY[0x1E0C99D60], "dateWithTimeIntervalSince1970:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isSensitiveLoggingAllowed");

    if (v15
      && gLogCategory_ENTestResultManager <= 40
      && (gLogCategory_ENTestResultManager != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(MEMORY[0x1E0CB37E0], "numberWithUnsignedLongLong:", Int64);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v13;
      LogPrintF_safe();

    }
    if (self->_chaffSession)
    {
      +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isSensitiveLoggingAllowed");

      if (!v20
        || gLogCategory_ENTestResultManager > 40
        || gLogCategory_ENTestResultManager == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB37E0], "numberWithUnsignedLongLong:", Int64 + 1, v24, v25);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();
    }
    else
    {
      if ((objc_msgSend(v13, "isEqualToDate:", v7) & 1) == 0
        && (objc_msgSend(v8, "isDate:inSameDayAsDate:", v13, v7) & 1) == 0)
      {
        -[ENTestResultManager _deactivateAutomatedChaffing](self, "_deactivateAutomatedChaffing");
        goto LABEL_16;
      }
      v16 = CFPrefs_GetInt64();
      if (Int64 < (unint64_t)objc_msgSend(v4, "maximumChaffsAllowedPerDay") - v16)
      {
        v28[0] = MEMORY[0x1E0C809B0];
        v28[1] = 3221225472;
        v28[2] = __48__ENTestResultManager__updateChaffingTimerBlock__block_invoke;
        v28[3] = &unk_1E87DB368;
        v28[4] = self;
        v28[5] = Int64;
        -[ENTestResultManager _startChaffTestVerficationSessionForRegion:completionHandler:](self, "_startChaffTestVerficationSessionForRegion:completionHandler:", v3, v28);
LABEL_16:

        v6 = v27;
LABEL_17:

        goto LABEL_18;
      }
      +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "isSensitiveLoggingAllowed");

      if (!v23
        || gLogCategory_ENTestResultManager > 40
        || gLogCategory_ENTestResultManager == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB37E0], "numberWithUnsignedLongLong:", Int64, v24, v25);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E0], "numberWithUnsignedLongLong:", v16);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    goto LABEL_16;
  }
LABEL_18:

}

void __48__ENTestResultManager__updateChaffingTimerBlock__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  if (v10)
  {
    +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isSensitiveLoggingAllowed");

    if (v4
      && gLogCategory_ENTestResultManager <= 40
      && (gLogCategory_ENTestResultManager != -1 || _LogCategory_Initialize()))
    {
      v9 = v10;
      LogPrintF_safe();
    }
  }
  else
  {
    CFPrefs_SetInt64();
    +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isSensitiveLoggingAllowed");

    if (v6
      && gLogCategory_ENTestResultManager <= 40
      && (gLogCategory_ENTestResultManager != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(MEMORY[0x1E0CB37E0], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 40) + 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "invalidate", v9);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 16);
  *(_QWORD *)(v7 + 16) = 0;

}

- (void)startChaffTestVerficationSessionForRegion:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__ENTestResultManager_startChaffTestVerficationSessionForRegion_completionHandler___block_invoke;
  block[3] = &unk_1E87D9D18;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

uint64_t __83__ENTestResultManager_startChaffTestVerficationSessionForRegion_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startChaffTestVerficationSessionForRegion:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_startChaffTestVerficationSessionForRegion:(id)a3 completionHandler:(id)a4
{
  void (**v6)(id, id);
  void *v7;
  id v8;
  void *v9;
  int v10;
  uint64_t v11;
  id v12;
  OS_dispatch_queue *queue;
  void *v14;
  id v15;
  id v16;
  id v17;

  v6 = (void (**)(id, id))a4;
  v17 = 0;
  -[ENTestResultManager _configurationForRegion:error:](self, "_configurationForRegion:error:", a3, &v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v17;
  if (v7)
  {
    -[ENTestResultManager delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isProxyEnabledForTestResultManager:", self);
    v11 = 40;
    if (v10)
      v11 = 32;
    v12 = *(id *)((char *)&self->super.isa + v11);

    queue = self->_queue;
    v16 = v8;
    +[ENChaffTestResultSession sessionWithConfiguration:URLSession:queue:error:](ENChaffTestResultSession, "sessionWithConfiguration:URLSession:queue:error:", v7, v12, queue, &v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v16;

    if (v14)
    {
      -[ENChaffTestResultSession invalidate](self->_chaffSession, "invalidate");
      objc_storeStrong((id *)&self->_chaffSession, v14);
      objc_msgSend(v14, "sendChaffMessagesWithCompletion:", v6);
    }
    else
    {
      v6[2](v6, v15);
    }

  }
  else
  {
    v6[2](v6, v8);
    v15 = v8;
  }

}

- (void)startTestVerficationSessionWithCode:(id)a3 proxyEnabled:(BOOL)a4 region:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *queue;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  BOOL v21;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __97__ENTestResultManager_startTestVerficationSessionWithCode_proxyEnabled_region_completionHandler___block_invoke;
  block[3] = &unk_1E87DB390;
  block[4] = self;
  v18 = v10;
  v21 = a4;
  v19 = v11;
  v20 = v12;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(queue, block);

}

uint64_t __97__ENTestResultManager_startTestVerficationSessionWithCode_proxyEnabled_region_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startTestVerficationSessionWithCode:proxyEnabled:region:completionHandler:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_startTestVerficationSessionWithCode:(id)a3 proxyEnabled:(BOOL)a4 region:(id)a5 completionHandler:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  void (**v12)(id, _QWORD, id);
  void *v13;
  unint64_t maxRetryTime;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  void (**v21)(id, _QWORD, id);
  id v22;

  v8 = a4;
  v10 = a3;
  v11 = a5;
  v12 = (void (**)(id, _QWORD, id))a6;
  -[ENTestResultManager _existingSessionForVerificationCode:region:](self, "_existingSessionForVerificationCode:region:", v10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    maxRetryTime = self->_maxRetryTime;
    v22 = 0;
    -[ENTestResultManager _createSessionWithVerificationCode:proxyEnabled:region:maxRetryTime:error:](self, "_createSessionWithVerificationCode:proxyEnabled:region:maxRetryTime:error:", v10, v8, v11, maxRetryTime, &v22);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v22;
    v13 = v16;
    if (!v15)
    {
      v12[2](v12, 0, v16);
      goto LABEL_5;
    }

    v13 = (void *)v15;
  }
  objc_msgSend(v13, "UUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __98__ENTestResultManager__startTestVerficationSessionWithCode_proxyEnabled_region_completionHandler___block_invoke;
  v19[3] = &unk_1E87DB3B8;
  v20 = v17;
  v21 = v12;
  v18 = v17;
  objc_msgSend(v13, "verifyCodeWithCompletionHandler:", v19);

LABEL_5:
}

uint64_t __98__ENTestResultManager__startTestVerficationSessionWithCode_proxyEnabled_region_completionHandler___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a1 + 40);
  if (a2)
  {
    a3 = 0;
    v5 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v5 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v4, v5, a3);
}

- (void)startSelfReportWebSession:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__ENTestResultManager_startSelfReportWebSession_completionHandler___block_invoke;
  block[3] = &unk_1E87D9D18;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

uint64_t __67__ENTestResultManager_startSelfReportWebSession_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startSelfReportWebSession:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_startSelfReportWebSession:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  id v22;
  id v23;

  v6 = a3;
  v7 = a4;
  v23 = 0;
  -[ENTestResultManager _configurationForRegion:error:](self, "_configurationForRegion:error:", v6, &v23);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v23;
  v10 = v9;
  if (!v8)
  {
    (*((void (**)(id, _QWORD, _QWORD, id))v7 + 2))(v7, 0, 0, v9);
    v12 = v10;
    goto LABEL_10;
  }
  v22 = v9;
  -[ENTestResultManager _serverConfigurationForRegion:error:](self, "_serverConfigurationForRegion:error:", v6, &v22);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v22;

  if (!v11)
  {
    (*((void (**)(id, _QWORD, _QWORD, id))v7 + 2))(v7, 0, 0, v12);
    goto LABEL_9;
  }
  objc_msgSend(v8, "testVerificationAPIKey");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    ENTestResultErrorF(10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, v14);
    goto LABEL_8;
  }
  +[ENTestResultManager generateSecureNonce:](ENTestResultManager, "generateSecureNonce:", 256);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!+[ENTestResultManager checkValidNonce:size:](ENTestResultManager, "checkValidNonce:size:", v14, 256))
  {
    ENTestResultErrorF(5);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, v21);
LABEL_16:

    goto LABEL_8;
  }
  CFPrefs_GetDouble();
  if (v15 > 0.0)
  {
    v16 = v15;
    objc_msgSend(MEMORY[0x1E0C99D60], "date");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "timeIntervalSince1970");
    v19 = v18 - v16;

    if (v19 < (double)(int)(86400 * objc_msgSend(v11, "selfReportTimeoutDays")))
    {
      ENTestResultErrorF(5);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *, _QWORD, void *))v7 + 2))(v7, v13, 0, v21);
      goto LABEL_16;
    }
  }
  CFPrefs_SetValue();
  objc_msgSend(MEMORY[0x1E0C99D60], "date");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "timeIntervalSince1970");
  CFPrefs_SetDouble();

  (*((void (**)(id, void *, void *, id))v7 + 2))(v7, v13, v14, v12);
LABEL_8:

LABEL_9:
LABEL_10:

}

- (void)setMaxRetryTime:(unint64_t)a3
{
  self->_maxRetryTime = a3;
}

- (id)metadataForSessionWithUUID:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *queue;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  id *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__6;
  v19 = __Block_byref_object_dispose__6;
  v20 = 0;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __56__ENTestResultManager_metadataForSessionWithUUID_error___block_invoke;
  v11[3] = &unk_1E87DA0C0;
  v11[4] = self;
  v12 = v6;
  v13 = &v15;
  v14 = a4;
  v8 = v6;
  dispatch_sync(queue, v11);
  v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

void __56__ENTestResultManager_metadataForSessionWithUUID_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_metadataForSessionWithUUID:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_metadataForSessionWithUUID:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;

  -[ENTestResultManager _sessionWithUUID:error:](self, "_sessionWithUUID:error:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "getMetadataAndReturnError:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)finishSessionWithUUID:(id)a3 userDidConsent:(BOOL)a4 metadata:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *queue;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  BOOL v21;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__ENTestResultManager_finishSessionWithUUID_userDidConsent_metadata_completionHandler___block_invoke;
  block[3] = &unk_1E87DB390;
  block[4] = self;
  v18 = v10;
  v21 = a4;
  v19 = v11;
  v20 = v12;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_sync(queue, block);

}

uint64_t __87__ENTestResultManager_finishSessionWithUUID_userDidConsent_metadata_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishSessionWithUUID:userDidConsent:metadata:completionHandler:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_finishSessionWithUUID:(id)a3 userDidConsent:(BOOL)a4 metadata:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, _QWORD, id);
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  BOOL v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  char v26;
  void *v27;
  id v28;
  _QWORD v29[7];
  void (**v30)(id, _QWORD, id);
  char v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;

  v10 = a3;
  v11 = a5;
  v12 = (void (**)(id, _QWORD, id))a6;
  v36 = 0;
  -[ENTestResultManager _sessionWithUUID:error:](self, "_sessionWithUUID:error:", v10, &v36);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v36;
  if (!v13)
  {
    v12[2](v12, 0, v14);
    goto LABEL_16;
  }
  if (!a4)
  {
    -[ENTestResultManager _invalidateSession:](self, "_invalidateSession:", v13);
    v12[2](v12, 1, 0);
    goto LABEL_16;
  }
  objc_msgSend(v13, "getUploadingTemporaryExposureKeys");
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
  }
  else
  {
    objc_msgSend(v13, "region");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v14;
    -[ENTestResultManager _getTemporaryExposureKeysForUpload:requireConsentForRegion:error:](self, "_getTemporaryExposureKeysForUpload:requireConsentForRegion:error:", 1, v17, &v35);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v35;

    if (!v16)
    {
      -[ENTestResultManager _invalidateSession:](self, "_invalidateSession:", v13);
      v12[2](v12, 0, v18);
      v14 = v18;
      goto LABEL_16;
    }
    v14 = v18;
  }
  v33 = v14;
  v34 = 0;
  v19 = -[ENTestResultManager _getRevisionToken:forSession:error:](self, "_getRevisionToken:forSession:error:", &v34, v13, &v33);
  v20 = v34;
  v21 = v33;

  if (v19)
  {
    v32 = v21;
    -[ENTestResultManager _metadataForSessionWithUUID:error:](self, "_metadataForSessionWithUUID:error:", v10, &v32);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v32;

    if (v22)
    {
      CFStringGetTypeID();
      v27 = (void *)CFPrefs_CopyTypedValue();
      objc_msgSend(v22, "objectForKeyedSubscript:", *MEMORY[0x1E0CAA268]);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v11;
      v24 = v22;
      v25 = v20;
      v26 = objc_msgSend(v23, "isEqualToNumber:", &unk_1E87EE168);

      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __88__ENTestResultManager__finishSessionWithUUID_userDidConsent_metadata_completionHandler___block_invoke;
      v29[3] = &unk_1E87DB3E0;
      v29[4] = self;
      v29[5] = v13;
      v29[6] = v27;
      v31 = v26;
      v20 = v25;
      v22 = v24;
      v11 = v28;
      v30 = v12;
      objc_msgSend(v13, "uploadTemporaryExposureKeys:revisionToken:userMetadata:completionHandler:", v16, v20, v28, v29);

    }
    else
    {
      -[ENTestResultManager _invalidateSession:](self, "_invalidateSession:", v13);
      v12[2](v12, 0, v14);
    }

  }
  else
  {
    -[ENTestResultManager _invalidateSession:](self, "_invalidateSession:", v13);
    v12[2](v12, 0, v21);
    v14 = v21;
  }

LABEL_16:
}

void __88__ENTestResultManager__finishSessionWithUUID_userDidConsent_metadata_completionHandler___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  int v11;
  id v12;
  void *v13;
  uint64_t Int64;
  void *v15;
  id v16;

  v7 = a3;
  v8 = a4;
  if (v7 && a2)
  {
    v9 = *(void **)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    v16 = v8;
    v11 = objc_msgSend(v9, "_setRevisionToken:forSession:error:", v7, v10, &v16);
    v12 = v16;

    v8 = v12;
    if (!v11)
      goto LABEL_11;
  }
  else if (v7 || (a2 & 1) == 0)
  {
    goto LABEL_11;
  }
  if (*(_QWORD *)(a1 + 48) && *(_BYTE *)(a1 + 64))
  {
    objc_msgSend(MEMORY[0x1E0C99D60], "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "timeIntervalSince1970");
    CFPrefs_SetDouble();

    CFPrefs_RemoveValue();
    CFPrefs_RemoveValue();
  }
  objc_msgSend(*(id *)(a1 + 32), "_invalidateSession:", *(_QWORD *)(a1 + 40));
LABEL_11:
  Int64 = CFPrefs_GetInt64();
  CFPrefs_SetInt64();
  if (!Int64)
  {
    objc_msgSend(MEMORY[0x1E0C99D60], "date");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "timeIntervalSince1970");
    CFPrefs_SetDouble();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

- (void)_invalidateSession:(id)a3
{
  NSMutableDictionary *sessionsByUUID;
  void *v4;
  id v5;

  sessionsByUUID = self->_sessionsByUUID;
  v5 = a3;
  objc_msgSend(v5, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](sessionsByUUID, "setObject:forKeyedSubscript:", 0, v4);

  objc_msgSend(v5, "invalidate");
}

- (id)_configurationForRegion:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v13;

  v6 = a3;
  -[ENConfigurationStore serverConfigurationForRegion:](self->_configurationStore, "serverConfigurationForRegion:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    if (a4)
    {
      v13 = 9;
      goto LABEL_12;
    }
LABEL_13:
    v10 = 0;
    goto LABEL_7;
  }
  if ((unint64_t)objc_msgSend(v7, "enVersion") < 2 || (objc_msgSend(v8, "enEnabled") & 1) == 0)
  {
    if (a4)
    {
      v13 = 10;
LABEL_12:
      ENTestResultErrorF(v13);
      v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    goto LABEL_13;
  }
  -[ENConfigurationStore downloadConfigurationForRegion:](self->_configurationStore, "downloadConfigurationForRegion:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else if (a4)
  {
    ENTestResultErrorF(9);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_7:
  return v10;
}

- (id)_serverConfigurationForRegion:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v11;

  v6 = a3;
  -[ENConfigurationStore serverConfigurationForRegion:](self->_configurationStore, "serverConfigurationForRegion:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    if (a4)
    {
      v11 = 9;
      goto LABEL_10;
    }
LABEL_11:
    v9 = 0;
    goto LABEL_5;
  }
  if ((unint64_t)objc_msgSend(v7, "enVersion") < 2 || (objc_msgSend(v8, "enEnabled") & 1) == 0)
  {
    if (a4)
    {
      v11 = 10;
LABEL_10:
      ENTestResultErrorF(v11);
      v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    }
    goto LABEL_11;
  }
  v9 = v8;
LABEL_5:

  return v9;
}

- (id)_createSessionWithVerificationCode:(id)a3 proxyEnabled:(BOOL)a4 region:(id)a5 maxRetryTime:(unint64_t)a6 error:(id *)a7
{
  _BOOL4 v10;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  id v21;
  uint64_t v22;
  id v23;
  void *v24;
  int v25;
  void *v26;
  NSMutableDictionary *sessionsByUUID;
  NSMutableDictionary *v28;
  NSMutableDictionary *v29;
  void *v30;
  id v31;
  void *v33;

  v10 = a4;
  v12 = a3;
  -[ENTestResultManager _configurationForRegion:error:](self, "_configurationForRegion:error:", a5, a7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    v26 = 0;
    goto LABEL_23;
  }
  -[ENTestResultManager _getTemporaryExposureKeysForUpload:requireConsentForRegion:error:](self, "_getTemporaryExposureKeysForUpload:requireConsentForRegion:error:", 0, 0, a7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    v26 = 0;
    goto LABEL_22;
  }
  CFStringGetTypeID();
  v15 = (void *)CFPrefs_CopyTypedValue();
  v33 = v14;
  if (!v15)
    goto LABEL_8;
  if (+[ENTestResultManager checkValidNonce:size:](ENTestResultManager, "checkValidNonce:size:", v15, 256))
  {
    CFPrefs_GetDouble();
    if (v16 > 0.0)
    {
      v17 = v16;
      objc_msgSend(MEMORY[0x1E0C99D60], "date");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "timeIntervalSince1970");
      v20 = v19 - v17;

      if (v20 > 86400.0)
      {
        v21 = v12;
        CFPrefs_RemoveValue();

        v15 = 0;
LABEL_9:
        v22 = 40;
        if (v10)
          v22 = 32;
        v23 = *(id *)((char *)&self->super.isa + v22);
        +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "isSensitiveLoggingAllowed");

        if (v25
          && gLogCategory_ENTestResultManager <= 40
          && (gLogCategory_ENTestResultManager != -1 || _LogCategory_Initialize()))
        {
          LogPrintF_safe();
        }
        v12 = v21;
        +[ENTestResultSession sessionWithVerificationCode:configuration:maxRetryTime:nonce:URLSession:queue:error:](ENTestResultSession, "sessionWithVerificationCode:configuration:maxRetryTime:nonce:URLSession:queue:error:", v21, v13, a6, v15, v23, self->_queue, a7);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (v26)
        {
          sessionsByUUID = self->_sessionsByUUID;
          if (!sessionsByUUID)
          {
            v28 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E00]);
            v29 = self->_sessionsByUUID;
            self->_sessionsByUUID = v28;

            sessionsByUUID = self->_sessionsByUUID;
          }
          objc_msgSend(v26, "UUID");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](sessionsByUUID, "setObject:forKeyedSubscript:", v26, v30);

          v31 = v26;
        }

        v14 = v33;
        goto LABEL_21;
      }
    }
LABEL_8:
    v21 = v12;
    goto LABEL_9;
  }
  if (a7)
  {
    ENTestResultErrorF(5);
    v26 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v26 = 0;
  }
LABEL_21:

LABEL_22:
LABEL_23:

  return v26;
}

- (id)_getTemporaryExposureKeysForUpload:(BOOL)a3 requireConsentForRegion:(id)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  ENTemporaryExposureKeyManager *temporaryExposureKeyManager;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v20;
  id v21;

  v6 = a3;
  v8 = a4;
  if (v8)
  {
    -[ENConfigurationStore configurationForRegion:](self->_configurationStore, "configurationForRegion:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "userConsent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "consent");

      if (v12 == 2)
      {

        goto LABEL_5;
      }
      if (a5)
        goto LABEL_19;
    }
    else if (a5)
    {
LABEL_19:
      ENTestResultErrorF(9);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

    v18 = 0;
    goto LABEL_9;
  }
LABEL_5:
  v13 = 144 * (((CFAbsoluteTimeGetCurrent() + *MEMORY[0x1E0C9ADF0]) / 600.0) / 0x90) - 2016;
  temporaryExposureKeyManager = self->_temporaryExposureKeyManager;
  v21 = 0;
  -[ENTemporaryExposureKeyManager getTemporaryExposureKeysFromRollingStart:includingActive:refresh:error:](temporaryExposureKeyManager, "getTemporaryExposureKeysFromRollingStart:includingActive:refresh:error:", v13, v6 ^ 1, v6, &v21);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v21;
  v17 = v16;
  if (!v15)
  {
    if (a5)
    {
      ENNestedTestResultErrorF(v16, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:
      v18 = 0;
      *a5 = v20;
      goto LABEL_8;
    }
LABEL_15:
    v18 = 0;
    goto LABEL_8;
  }
  if (!objc_msgSend(v15, "count"))
  {
    if (a5)
    {
      ENTestResultErrorF(1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  v18 = v15;
LABEL_8:

LABEL_9:
  return v18;
}

- (id)_sessionWithUUID:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  id v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_sessionsByUUID, "objectForKeyedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else if (a4)
  {
    ENTestResultErrorF(5);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)_existingSessionForVerificationCode:(id)a3 region:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[NSMutableDictionary allValues](self->_sessionsByUUID, "allValues", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v12, "verificationCode");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v13, "isEqualToString:", v6) & 1) != 0)
        {
          objc_msgSend(v12, "region");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqual:", v7);

          if ((v15 & 1) != 0)
          {
            v9 = v12;
            goto LABEL_12;
          }
        }
        else
        {

        }
      }
      v9 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }
LABEL_12:

  return v9;
}

- (BOOL)_getRevisionToken:(id *)a3 forSession:(id)a4 error:(id *)a5
{
  id v8;
  ENExposureDatabase *exposureDatabase;
  void *v10;
  BOOL v11;

  v8 = a4;
  if (-[ENExposureDatabase openWithError:](self->_exposureDatabase, "openWithError:", a5))
  {
    exposureDatabase = self->_exposureDatabase;
    -[ENTestResultManager _revisionTokenKeyForSession:](self, "_revisionTokenKeyForSession:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[ENExposureDatabase getValue:forKey:ofClass:error:](exposureDatabase, "getValue:forKey:ofClass:error:", a3, v10, objc_opt_class(), a5);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)_setRevisionToken:(id)a3 forSession:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  ENExposureDatabase *exposureDatabase;
  void *v11;
  void *v12;
  BOOL v13;

  v8 = a3;
  v9 = a4;
  if (-[ENExposureDatabase openWithError:](self->_exposureDatabase, "openWithError:", a5))
  {
    exposureDatabase = self->_exposureDatabase;
    -[ENTestResultManager _revisionTokenKeyForSession:](self, "_revisionTokenKeyForSession:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    ENDefaultExpirationDate();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[ENExposureDatabase setValue:forKey:expiryDate:error:](exposureDatabase, "setValue:forKey:expiryDate:error:", v8, v11, v12, a5);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)_revisionTokenKeyForSession:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "uploadURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3938];
  objc_msgSend(v3, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("TEKUploadRevisionToken(%@)"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (ENConfigurationStore)configurationStore
{
  return self->_configurationStore;
}

- (ENExposureDatabase)exposureDatabase
{
  return self->_exposureDatabase;
}

- (ENTemporaryExposureKeyManager)temporaryExposureKeyManager
{
  return self->_temporaryExposureKeyManager;
}

- (ENTestResultManagerDelegate)delegate
{
  return (ENTestResultManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_temporaryExposureKeyManager, 0);
  objc_storeStrong((id *)&self->_exposureDatabase, 0);
  objc_storeStrong((id *)&self->_configurationStore, 0);
  objc_storeStrong((id *)&self->_chaffingRegion, 0);
  objc_storeStrong((id *)&self->_chaffingTimer, 0);
  objc_storeStrong((id *)&self->_URLBackupSession, 0);
  objc_storeStrong((id *)&self->_URLSession, 0);
  objc_storeStrong((id *)&self->_sessionsByUUID, 0);
  objc_storeStrong((id *)&self->_chaffSession, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end

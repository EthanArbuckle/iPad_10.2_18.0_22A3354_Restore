@implementation ENTemporaryExposureKeyManager

- (ENTemporaryExposureKeyManager)initWithQueue:(id)a3
{
  id v5;
  ENTemporaryExposureKeyManager *v6;
  ENTemporaryExposureKeyManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ENTemporaryExposureKeyManager;
  v6 = -[ENTemporaryExposureKeyManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_queue, a3);

  return v7;
}

- (BOOL)requireKeyReleasePromptForClient:(id)a3
{
  NSDate *nextPromptDate;
  id v4;
  double v5;
  double v6;
  int v7;

  nextPromptDate = self->_nextPromptDate;
  if (!nextPromptDate)
    return 1;
  v4 = a3;
  -[NSDate timeIntervalSinceNow](nextPromptDate, "timeIntervalSinceNow");
  v6 = v5;
  v7 = objc_msgSend(v4, "appAPIVersion");

  return v6 <= 0.0 || v7 > 1;
}

- (id)getTemporaryExposureKeysForClient:(id)a3 fromRollingStart:(unsigned int)a4 didPrompt:(BOOL)a5 forTesting:(BOOL)a6 forceRefresh:(BOOL)a7 error:(id *)a8
{
  _BOOL4 v9;
  _BOOL8 v10;
  _BOOL4 v11;
  uint64_t v12;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  int v25;
  void *v26;
  const char *v27;
  const char *v28;
  _BOOL4 v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  int v33;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  uint64_t i;
  void *v41;
  void *v42;
  void *v43;
  char v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  void *v48;
  int v49;
  uint64_t v50;
  ENTemporaryExposureKey *v51;
  ENTemporaryExposureKey *v52;
  char v53;
  void *v54;
  int v55;
  NSDate *v56;
  NSDate *nextPromptDate;
  ENTemporaryExposureKey *v58;
  ENTemporaryExposureKey *oldestTEK;
  void *v60;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  void *v68;
  const char *v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  uint64_t lastTEKRequestENIN;
  _BOOL4 v74;
  void *v75;
  const char *v76;
  void *v77;
  uint64_t v78;
  int v79;
  uint64_t v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  uint64_t v85;
  _BYTE v86[128];
  uint64_t v87;

  v9 = a7;
  v10 = a6;
  v11 = a5;
  v12 = *(_QWORD *)&a4;
  v87 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = v14;
  if (v9)
  {
    v16 = 1;
  }
  else if ((int)objc_msgSend(v14, "appAPIVersion") > 1)
  {
    v16 = v10 ^ 1;
  }
  else
  {
    v16 = 0;
  }
  -[ENTemporaryExposureKeyManager _getTemporaryExposureKeysFromRollingStart:includingActive:refresh:error:](self, "_getTemporaryExposureKeysFromRollingStart:includingActive:refresh:error:", v12, v10, v16, a8);
  v17 = objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    v60 = 0;
    goto LABEL_74;
  }
  v18 = (void *)v17;
  -[NSDate timeIntervalSinceNow](self->_nextPromptDate, "timeIntervalSinceNow");
  v20 = v19;
  v80 = v12;
  if (objc_msgSend(v18, "count"))
  {
    objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "rollingStartNumber");
    v23 = objc_msgSend(v21, "rollingPeriod");

  }
  else
  {
    v22 = 0;
    v23 = 0;
  }
  +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "isSensitiveLoggingAllowed");

  if (v25
    && gLogCategory_ENTemporaryExposureKeyManager <= 30
    && (gLogCategory_ENTemporaryExposureKeyManager != -1 || _LogCategory_Initialize()))
  {
    v26 = v18;
    if (v10)
      v27 = "yes";
    else
      v27 = "no";
    v76 = v27;
    v78 = v22;
    if (v9)
      v28 = "yes";
    else
      v28 = "no";
    v29 = v11;
    if (v11)
      v30 = "yes";
    else
      v30 = "no";
    v31 = objc_msgSend(v26, "count");
    CUPrintDuration32();
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    lastTEKRequestENIN = self->_lastTEKRequestENIN;
    v70 = v30;
    v71 = v31;
    v11 = v29;
    v69 = v28;
    v22 = v78;
    v18 = v26;
    v65 = v80;
    v67 = v76;
    v62 = v15;
    LogPrintF_safe();

  }
  +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs", v62, v65, v67, v69, v70, v71, v72, lastTEKRequestENIN);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "isRPILoggingAllowed");

  if (v33
    && gLogCategory_ENTemporaryExposureKeyManager <= 30
    && (gLogCategory_ENTemporaryExposureKeyManager != -1 || _LogCategory_Initialize()))
  {
    -[ENTemporaryExposureKey keyData](self->_oldestTEK, "keyData");
    v66 = v23;
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = v22;
    LogPrintF_safe();

  }
  if ((int)objc_msgSend(v15, "appAPIVersion", v63, v66, v68) <= 1)
  {
    if (v11 || v10 || !self->_nextPromptDate)
    {
LABEL_68:
      if (v11)
      {
        if (!self->_nextPromptDate || v20 <= 0.0)
        {
          objc_msgSend(MEMORY[0x1E0C99D60], "dateWithTimeIntervalSinceNow:", 108000.0);
          v56 = (NSDate *)objc_claimAutoreleasedReturnValue();
          nextPromptDate = self->_nextPromptDate;
          self->_nextPromptDate = v56;

        }
        self->_lastTEKRequestENIN = v22;
        objc_msgSend(v18, "lastObject");
        v58 = (ENTemporaryExposureKey *)objc_claimAutoreleasedReturnValue();
        oldestTEK = self->_oldestTEK;
        self->_oldestTEK = v58;

      }
      goto LABEL_73;
    }
    if (self->_lastTEKRequestENIN)
    {
      v77 = v15;
      v79 = v22;
      v34 = objc_alloc_init(MEMORY[0x1E0C99DE0]);
      v81 = 0u;
      v82 = 0u;
      v83 = 0u;
      v84 = 0u;
      v75 = v18;
      v35 = v18;
      v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v81, v86, 16);
      v74 = v11;
      if (v36)
      {
        v37 = v36;
        v38 = *(_QWORD *)v82;
        v39 = 1;
        do
        {
          for (i = 0; i != v37; ++i)
          {
            if (*(_QWORD *)v82 != v38)
              objc_enumerationMutation(v35);
            v41 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * i);
            if (objc_msgSend(v41, "rollingStartNumber") <= self->_lastTEKRequestENIN + 144)
              objc_msgSend(v34, "addObject:", v41);
            -[ENTemporaryExposureKey keyData](self->_oldestTEK, "keyData");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "keyData");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = objc_msgSend(v42, "isEqualToData:", v43);

            v39 &= v44 ^ 1;
          }
          v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v81, v86, 16);
        }
        while (v37);
      }
      else
      {
        v39 = 1;
      }

      v47 = objc_msgSend(v34, "count");
      v18 = v75;
      LODWORD(v22) = v79;
      if (v47 < objc_msgSend(v35, "count"))
      {
        +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = objc_msgSend(v48, "isSensitiveLoggingAllowed");

        if (v49
          && gLogCategory_ENTemporaryExposureKeyManager <= 30
          && (gLogCategory_ENTemporaryExposureKeyManager != -1 || _LogCategory_Initialize()))
        {
          v50 = objc_msgSend(v35, "count");
          v64 = v50 - objc_msgSend(v34, "count");
          LogPrintF_safe();
        }
        v51 = self->_oldestTEK;
        v52 = v51;
        if (v51)
          v53 = v39;
        else
          v53 = 0;
        if ((v53 & 1) != 0
          && -[ENTemporaryExposureKey rollingStartNumber](v51, "rollingStartNumber") >= v80)
        {
          +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = objc_msgSend(v54, "isSensitiveLoggingAllowed");

          if (v55
            && gLogCategory_ENTemporaryExposureKeyManager <= 30
            && (gLogCategory_ENTemporaryExposureKeyManager != -1 || _LogCategory_Initialize()))
          {
            LogPrintF_safe();
          }
          objc_msgSend(v34, "addObject:", v52, v64);
        }

      }
      v46 = objc_msgSend(v34, "copy", v64);
      v11 = v74;
    }
    else
    {
      objc_msgSend(v18, "lastObject");
      v45 = objc_claimAutoreleasedReturnValue();
      v34 = (id)v45;
      if (!v45)
      {
LABEL_67:

        goto LABEL_68;
      }
      v77 = v15;
      v85 = v45;
      objc_msgSend(MEMORY[0x1E0C99D18], "arrayWithObjects:count:", &v85, 1);
      v46 = objc_claimAutoreleasedReturnValue();
    }

    v18 = (void *)v46;
    v15 = v77;
    goto LABEL_67;
  }
LABEL_73:
  v60 = (void *)objc_msgSend(v18, "copy");

LABEL_74:
  return v60;
}

- (id)_getTemporaryExposureKeysFromRollingStart:(unsigned int)a3 includingActive:(BOOL)a4 refresh:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  id v22;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v7 = a5;
  v8 = a4;
  v30 = *MEMORY[0x1E0C80C00];
  -[ENTemporaryExposureKeyManager delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "temporaryExposureKeyManager:retrieveTEKHistoryIncludingActive:generateNewTEK:", self, v8, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v24 = v12;
      v14 = objc_alloc_init(MEMORY[0x1E0C99DE0]);
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v15 = v13;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v26;
        while (2)
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v26 != v18)
              objc_enumerationMutation(v15);
            objc_msgSend((id)objc_opt_class(), "temporaryExposureKeyFromRawKey:error:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i), a6);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v20)
            {

              v22 = 0;
              goto LABEL_15;
            }
            v21 = v20;
            if (objc_msgSend(v20, "rollingStartNumber") >= a3)
              objc_msgSend(v14, "addObject:", v21);

          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
          if (v17)
            continue;
          break;
        }
      }

      v22 = v14;
LABEL_15:

      v12 = v24;
    }
    else if (a6)
    {
      ENErrorF();
      v22 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = 0;
    }

  }
  else if (a6)
  {
    ENErrorF();
    v22 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (void)resetClientState
{
  void *v3;
  int v4;
  NSDate *nextPromptDate;
  ENTemporaryExposureKey *oldestTEK;

  +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSensitiveLoggingAllowed");

  if (v4
    && gLogCategory_ENTemporaryExposureKeyManager <= 50
    && (gLogCategory_ENTemporaryExposureKeyManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  nextPromptDate = self->_nextPromptDate;
  self->_nextPromptDate = 0;

  self->_lastTEKRequestENIN = 0;
  oldestTEK = self->_oldestTEK;
  self->_oldestTEK = 0;

}

+ (id)temporaryExposureKeyFromRawKey:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;

  v5 = a3;
  v6 = objc_msgSend(v5, "length");
  v7 = objc_retainAutorelease(v5);
  v8 = objc_msgSend(v7, "bytes");
  if (v6 == 21)
  {
    v9 = v8;
    v10 = objc_alloc_init(MEMORY[0x1E0CAA3D0]);
    objc_msgSend(v7, "subdataWithRange:", 0, 16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setKeyData:", v11);

    objc_msgSend(v10, "setRollingStartNumber:", *(unsigned int *)(v9 + 16));
    objc_msgSend(v10, "setRollingPeriod:", *(unsigned __int8 *)(v9 + 20));
  }
  else if (a4)
  {
    ENErrorF();
    v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSDate)nextPromptDate
{
  return self->_nextPromptDate;
}

- (void)setNextPromptDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (ENTemporaryExposureKeyManagerDelegate)delegate
{
  return (ENTemporaryExposureKeyManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (ENTemporaryExposureKey)oldestTEK
{
  return self->_oldestTEK;
}

- (unsigned)lastTEKRequestENIN
{
  return self->_lastTEKRequestENIN;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oldestTEK, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_nextPromptDate, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end

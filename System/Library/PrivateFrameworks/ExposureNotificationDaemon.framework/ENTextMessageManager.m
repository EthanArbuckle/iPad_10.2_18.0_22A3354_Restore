@implementation ENTextMessageManager

- (ENTextMessageManager)initWithDirectoryURL:(id)a3
{
  id v5;
  ENTextMessageManager *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  int v11;
  id v12;
  void *v13;
  uint64_t v14;
  char v15;
  id v16;
  ENSecureArchiveFileWrapper *v17;
  ENSecureArchiveFileWrapper *textMessageHistoryFileWrapper;
  ENTextMessageManager *v19;
  void *v20;
  id v22;
  id v23;
  objc_super v24;

  v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)ENTextMessageManager;
  v6 = -[ENTextMessageManager init](&v24, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3490], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("ENTextMessageManager.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("directoryPath != nil"));

    }
    objc_msgSend(v5, "URLByAppendingPathComponent:", CFSTR("verificationHashes.dat"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = objc_alloc_init(MEMORY[0x1E0CB3618]);
      v23 = 0;
      v11 = objc_msgSend(v10, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v7, 1, 0, &v23);
      v12 = v23;
      v13 = v12;
      if ((v11 & 1) != 0)
      {
        v14 = *MEMORY[0x1E0C999E0];
        v22 = v12;
        v15 = objc_msgSend(v5, "setResourceValue:forKey:error:", MEMORY[0x1E0C9AA98], v14, &v22);
        v16 = v22;

        if ((v15 & 1) == 0
          && gLogCategory_ENTextMessageManager <= 90
          && (gLogCategory_ENTextMessageManager != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        v17 = -[ENSecureArchiveFileWrapper initWithPath:]([ENSecureArchiveFileWrapper alloc], "initWithPath:", v9);
        textMessageHistoryFileWrapper = v6->_textMessageHistoryFileWrapper;
        v6->_textMessageHistoryFileWrapper = v17;

        v13 = v16;
      }
      else if (gLogCategory_ENTextMessageManager <= 90
             && (gLogCategory_ENTextMessageManager != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }

      if (v11)
        goto LABEL_18;
    }
    else
    {

    }
    v19 = 0;
    goto LABEL_21;
  }
LABEL_18:
  v19 = v6;
LABEL_21:

  return v19;
}

- (void)activateIfNeeded
{
  BOOL v2;
  id v3;
  id v4;

  v4 = 0;
  v2 = -[ENTextMessageManager _readIfNecessaryWithError:](self, "_readIfNecessaryWithError:", &v4);
  v3 = v4;
  if (!v2
    && gLogCategory__ENTextMessageManager <= 90
    && (gLogCategory__ENTextMessageManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

- (BOOL)_readIfNecessaryWithError:(id *)a3
{
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  ENSecureArchiveFileWrapper *textMessageHistoryFileWrapper;
  _BOOL4 v10;
  id v11;
  NSMutableDictionary *v12;
  id v13;
  void *v14;
  uint64_t v15;
  NSMutableDictionary *textMessageHashes;
  void *v17;
  int v18;
  id v20;
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  v5 = -[ENSecureArchiveFileWrapper openWithError:](self->_textMessageHistoryFileWrapper, "openWithError:");
  if (v5)
  {
    if (!self->_textMessageHashes)
    {
      v6 = (void *)MEMORY[0x1E0C99E68];
      v21[0] = objc_opt_class();
      v21[1] = objc_opt_class();
      v21[2] = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D18], "arrayWithObjects:count:", v21, 3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setWithArray:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      textMessageHistoryFileWrapper = self->_textMessageHistoryFileWrapper;
      v20 = 0;
      v10 = -[ENSecureArchiveFileWrapper readObject:ofClasses:error:](textMessageHistoryFileWrapper, "readObject:ofClasses:error:", &v20, v8, a3);
      v11 = v20;
      if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        objc_msgSend(MEMORY[0x1E0C99E00], "dictionaryWithDictionary:", v11);
        v12 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = *a3;
        objc_msgSend(v13, "domain");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0CAA290]) & 1) != 0)
        {
          v15 = objc_msgSend(v13, "code");

          if (v15 == 16)
          {

            LOBYTE(v5) = 0;
            return v5;
          }
        }
        else
        {

        }
        objc_msgSend(MEMORY[0x1E0C99E00], "dictionaryWithCapacity:", 1);
        v12 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      }
      textMessageHashes = self->_textMessageHashes;
      self->_textMessageHashes = v12;

    }
    +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isSensitiveLoggingAllowed");

    if (v18
      && gLogCategory_ENTextMessageManager <= 10
      && (gLogCategory_ENTextMessageManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (void)invalidate
{
  NSMutableDictionary *textMessageHashes;

  -[ENSecureArchiveFileWrapper close](self->_textMessageHistoryFileWrapper, "close");
  textMessageHashes = self->_textMessageHashes;
  self->_textMessageHashes = 0;

}

- (void)purgeAllHashes
{
  void *v3;
  void *v4;
  char v5;
  id v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB3618], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENSecureArchiveFileWrapper path](self->_textMessageHistoryFileWrapper, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v5 = objc_msgSend(v3, "removeItemAtPath:error:", v4, &v7);
  v6 = v7;

  if ((v5 & 1) == 0
    && gLogCategory__ENTextMessageManager <= 90
    && (gLogCategory__ENTextMessageManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

- (void)purgeOldHashes
{
  BOOL v3;
  id v4;
  id v5;
  id v6;
  int v7;
  id v8;

  if (self->_textMessageHashes)
    goto LABEL_4;
  v8 = 0;
  v3 = -[ENTextMessageManager _readIfNecessaryWithError:](self, "_readIfNecessaryWithError:", &v8);
  v4 = v8;
  if (v3)
  {

LABEL_4:
    -[ENTextMessageManager _purgeOldHashes](self, "_purgeOldHashes");
    return;
  }
  if (gLogCategory__ENTextMessageManager <= 90)
  {
    if (gLogCategory__ENTextMessageManager != -1 || (v6 = v4, v7 = _LogCategory_Initialize(), v4 = v6, v7))
    {
      v5 = v4;
      LogPrintF();
      v4 = v5;
    }
  }

}

- (void)_purgeOldHashes
{
  NSMutableDictionary *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  NSMutableDictionary *textMessageHashes;
  ENSecureArchiveFileWrapper *textMessageHistoryFileWrapper;
  BOOL v16;
  id v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = self->_textMessageHashes;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[NSMutableDictionary allKeys](v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        -[NSMutableDictionary objectForKey:](v3, "objectForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0C99D60], "date");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "timeIntervalSinceDate:", v10);
          v13 = v12;

          if (v13 > 172800.0)
            -[NSMutableDictionary removeObjectForKey:](self->_textMessageHashes, "removeObjectForKey:", v9);
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v6);
  }

  textMessageHashes = self->_textMessageHashes;
  if (textMessageHashes)
  {
    textMessageHistoryFileWrapper = self->_textMessageHistoryFileWrapper;
    v18 = 0;
    v16 = -[ENSecureArchiveFileWrapper saveObject:error:](textMessageHistoryFileWrapper, "saveObject:error:", textMessageHashes, &v18);
    v17 = v18;
    if (!v16
      && gLogCategory__ENTextMessageManager <= 90
      && (gLogCategory__ENTextMessageManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    v17 = 0;
  }

}

- (BOOL)verifyTextMessage:(id)a3 phoneNumber:(id)a4 verificationDate:(id)a5 publicKey:(id)a6 publicKeyVersion:(id)a7 userReport:(BOOL *)a8 outError:(id *)a9
{
  id v15;
  id v16;
  id v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t i;
  void *v27;
  void *v28;
  int v29;
  BOOL v30;
  id v31;
  void *v32;
  void *v33;
  int v34;
  BOOL v35;
  _BOOL4 v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  int v41;
  const char *v42;
  int v43;
  BOOL v44;
  void *v45;
  int v46;
  NSMutableDictionary *textMessageHashes;
  const char *v49;
  id v50;
  id v51;
  void *v52;
  id v53;
  id v54;
  BOOL *v55;
  void *v56;
  uint64_t v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v60 = a4;
  v16 = a5;
  v59 = a6;
  v17 = a7;
  if (!self->_textMessageHashes
    && !-[ENTextMessageManager _readIfNecessaryWithError:](self, "_readIfNecessaryWithError:", a9))
  {
    v44 = 0;
    goto LABEL_58;
  }
  +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isSensitiveLoggingAllowed");

  if (v19
    && gLogCategory_ENTextMessageManager <= 10
    && (gLogCategory_ENTextMessageManager != -1 || _LogCategory_Initialize()))
  {
    textMessageHashes = self->_textMessageHashes;
    LogPrintF();
  }
  objc_msgSend(v15, "testVerificationCode", textMessageHashes);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    -[NSMutableDictionary objectForKey:](self->_textMessageHashes, "objectForKey:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v21)
    {
      v56 = v20;
      v22 = v16;
      v66 = 0u;
      v67 = 0u;
      v64 = 0u;
      v65 = 0u;
      v23 = objc_msgSend(&unk_1E87EDDC0, "countByEnumeratingWithState:objects:count:", &v64, v68, 16);
      v58 = v15;
      if (v23)
      {
        v24 = v23;
        v55 = a8;
        v25 = 0;
        v57 = *(_QWORD *)v65;
        while (2)
        {
          for (i = 0; i != v24; ++i)
          {
            if (*(_QWORD *)v65 != v57)
              objc_enumerationMutation(&unk_1E87EDDC0);
            v27 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
            +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs", v49);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = objc_msgSend(v28, "isSensitiveLoggingAllowed");

            if (v29
              && gLogCategory_ENTextMessageManager <= 30
              && (gLogCategory_ENTextMessageManager != -1 || _LogCategory_Initialize()))
            {
              v53 = v59;
              v54 = v17;
              v51 = v60;
              v52 = v22;
              v50 = v15;
              LogPrintF();
            }

            v63 = 0;
            v30 = -[ENTextMessageManager _verifyTextMessage:phoneNumber:verificationDate:publicKey:publicKeyVersion:reportType:outError:](self, "_verifyTextMessage:phoneNumber:verificationDate:publicKey:publicKeyVersion:reportType:outError:", v15, v60, v22, v59, v17, v27, &v63);
            v31 = v63;
            v25 = v31;
            if (v30)
              goto LABEL_27;

            objc_msgSend(v22, "dateByAddingTimeInterval:", -86400.0);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = objc_msgSend(v33, "isSensitiveLoggingAllowed");

            if (v34
              && gLogCategory_ENTextMessageManager <= 30
              && (gLogCategory_ENTextMessageManager != -1 || _LogCategory_Initialize()))
            {
              LogPrintF();
            }
            v62 = 0;
            v35 = -[ENTextMessageManager _verifyTextMessage:phoneNumber:verificationDate:publicKey:publicKeyVersion:reportType:outError:](self, "_verifyTextMessage:phoneNumber:verificationDate:publicKey:publicKeyVersion:reportType:outError:", v15, v60, v32, v59, v17, v27, &v62, v50, v51, v52, v53, v54);
            v25 = v62;

            if (v35)
            {
LABEL_27:
              v36 = 1;
            }
            else
            {

              objc_msgSend(v22, "dateByAddingTimeInterval:", 86400.0);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v39 = objc_msgSend(v38, "isSensitiveLoggingAllowed");

              if (v39
                && gLogCategory_ENTextMessageManager <= 30
                && (gLogCategory_ENTextMessageManager != -1 || _LogCategory_Initialize()))
              {
                LogPrintF();
              }
              v61 = 0;
              v36 = -[ENTextMessageManager _verifyTextMessage:phoneNumber:verificationDate:publicKey:publicKeyVersion:reportType:outError:](self, "_verifyTextMessage:phoneNumber:verificationDate:publicKey:publicKeyVersion:reportType:outError:", v15, v60, v37, v59, v17, v27, &v61);
              v25 = v61;

            }
            +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = objc_msgSend(v40, "isSensitiveLoggingAllowed");

            if (v41
              && gLogCategory_ENTextMessageManager <= 40
              && (gLogCategory_ENTextMessageManager != -1 || _LogCategory_Initialize()))
            {
              v42 = "no";
              if (v36)
                v42 = "yes";
              v49 = v42;
              v50 = v27;
              LogPrintF();
            }
            if (v36)
            {
              v43 = objc_msgSend(v27, "isEqualToString:", CFSTR("User Report"));
              v44 = 1;
              if (v43)
                *v55 = 1;
              goto LABEL_51;
            }
            v15 = v58;
          }
          v24 = objc_msgSend(&unk_1E87EDDC0, "countByEnumeratingWithState:objects:count:", &v64, v68, 16);
          if (v24)
            continue;
          break;
        }
      }
      else
      {
        v25 = 0;
      }
      if (a9)
      {
        v25 = objc_retainAutorelease(v25);
        v44 = 0;
        *a9 = v25;
      }
      else
      {
        v44 = 0;
      }
LABEL_51:
      v16 = v22;
      v20 = v56;
      +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs", v49);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v45, "isSensitiveLoggingAllowed");

      if (v46
        && gLogCategory_ENTextMessageManager <= 10
        && (gLogCategory_ENTextMessageManager != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }

      v15 = v58;
      goto LABEL_57;
    }
    if (a9)
      goto LABEL_62;
LABEL_63:
    v44 = 0;
    goto LABEL_57;
  }
  if (!a9)
    goto LABEL_63;
LABEL_62:
  ENErrorF();
  v44 = 0;
  *a9 = (id)objc_claimAutoreleasedReturnValue();
LABEL_57:

LABEL_58:
  return v44;
}

- (BOOL)_verifyTextMessage:(id)a3 phoneNumber:(id)a4 verificationDate:(id)a5 publicKey:(id)a6 publicKeyVersion:(id)a7 reportType:(id)a8 outError:(id *)a9
{
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  int v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  const __CFData *v38;
  void *v39;
  uint64_t v40;
  const __CFData *v41;
  __SecKey *v42;
  int v43;
  CFErrorRef v44;
  void *v45;
  const __CFData *v46;
  uint64_t v47;
  uint64_t v48;
  BOOL v49;
  const __CFData *v50;
  void *v51;
  NSMutableDictionary *textMessageHashes;
  void *v53;
  void *v54;
  void *v55;
  BOOL v56;
  void *v58;
  void *v59;
  const __CFData *v60;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  CFErrorRef error;

  v14 = a3;
  v15 = a6;
  v16 = a7;
  v17 = (void *)MEMORY[0x1E0C99D40];
  v18 = *MEMORY[0x1E0C996C0];
  v19 = a8;
  v20 = a5;
  v21 = a4;
  objc_msgSend(v17, "calendarWithIdentifier:", v18);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E78], "timeZoneForSecondsFromGMT:", 0);
  v23 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setTimeZone:", v23);
  v24 = objc_alloc_init(MEMORY[0x1E0CB3580]);
  objc_msgSend(v24, "setDateFormat:", CFSTR("yyyy-MM-dd"));
  objc_msgSend(v24, "setCalendar:", v22);
  objc_msgSend(v24, "stringFromDate:", v20);
  v25 = objc_claimAutoreleasedReturnValue();

  v67 = (void *)v25;
  objc_msgSend(MEMORY[0x1E0CB3938], "stringWithFormat:", CFSTR("%@.%@.%@"), v19, v21, v25);
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v21) = objc_msgSend(v26, "isSensitiveLoggingAllowed");

  if ((_DWORD)v21
    && gLogCategory_ENTextMessageManager <= 30
    && (gLogCategory_ENTextMessageManager != -1 || _LogCategory_Initialize()))
  {
    v58 = v70;
    LogPrintF();
  }
  +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs", v58);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "isSensitiveLoggingAllowed");

  if (v28
    && gLogCategory_ENTextMessageManager <= 10
    && (gLogCategory_ENTextMessageManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v68 = v16;
  if (v15 && v16)
  {
    objc_msgSend(v14, "verificationString");
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = (void *)v29;
    if (!v29)
    {
      v54 = (void *)v23;
      if (a9)
      {
        ENErrorF();
        v56 = 0;
        *a9 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v56 = 0;
      }
      v55 = v67;
      goto LABEL_45;
    }
    v66 = (void *)v29;
    v31 = (void *)MEMORY[0x1E0CB3938];
    objc_msgSend(v14, "verificationString");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "stringWithFormat:", CFSTR("%@.%@"), v70, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v32) = objc_msgSend(v34, "isSensitiveLoggingAllowed");

    if ((_DWORD)v32
      && gLogCategory_ENTextMessageManager <= 30
      && (gLogCategory_ENTextMessageManager != -1 || _LogCategory_Initialize()))
    {
      v59 = v33;
      LogPrintF();
    }
    objc_msgSend(v14, "signature", v59);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "isSensitiveLoggingAllowed");

    if (v36
      && gLogCategory_ENTextMessageManager <= 30
      && (gLogCategory_ENTextMessageManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (!v69)
    {
      v54 = (void *)v23;
      v55 = (void *)v25;
      if (a9)
      {
        ENErrorF();
        v56 = 0;
        *a9 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v56 = 0;
      }
      v30 = v66;
      goto LABEL_44;
    }
    objc_msgSend(v14, "message");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v37, "containsString:", v16) & 1) == 0)
    {
      v54 = (void *)v23;
      if (a9)
      {
        ENErrorF();
        v49 = 0;
        *a9 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v49 = 0;
      }
      v30 = v66;
      v55 = v67;
LABEL_43:

      v56 = v49;
LABEL_44:

LABEL_45:
      goto LABEL_46;
    }
    v63 = v37;
    v64 = (void *)v23;
    v65 = v22;
    objc_msgSend(v33, "dataUsingEncoding:", 4);
    v38 = (const __CFData *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "signature");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "en_base64PaddedString");
    v40 = objc_claimAutoreleasedReturnValue();

    v62 = (void *)v40;
    v41 = (const __CFData *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D58]), "initWithBase64EncodedString:options:", v40, 1);
    error = 0;
    v42 = (__SecKey *)objc_msgSend(v15, "keyRef");
    v43 = SecKeyVerifySignature(v42, (SecKeyAlgorithm)*MEMORY[0x1E0CD6DF0], v38, v41, &error);
    v44 = error;
    if (!error)
    {
LABEL_38:
      v49 = v43 != 0;
      if (v43)
      {
        v60 = v41;
        v50 = v38;
        objc_msgSend(v14, "testVerificationCode");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        textMessageHashes = self->_textMessageHashes;
        objc_msgSend(MEMORY[0x1E0C99D60], "date");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](textMessageHashes, "setObject:forKey:", v53, v51);

        -[ENTextMessageManager purgeOldHashes](self, "purgeOldHashes");
        if (a9)
          *a9 = 0;

        v38 = v50;
        v41 = v60;
      }

      v54 = v64;
      v22 = v65;
      v30 = v66;
      v55 = v67;
      v37 = v63;
      goto LABEL_43;
    }
    -[__CFError domain](error, "domain");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v45, "isEqualToString:", *MEMORY[0x1E0CB2F98]))
    {
      v46 = v38;
      v47 = -[__CFError code](v44, "code");

      v48 = v47 + 0x10000;
      v38 = v46;
      if (v48 == -2272)
      {
LABEL_35:
        if (a9)
          *a9 = objc_retainAutorelease(v44);

        goto LABEL_38;
      }
    }
    else
    {

    }
    if (gLogCategory__ENTextMessageManager <= 90
      && (gLogCategory__ENTextMessageManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    goto LABEL_35;
  }
  v54 = (void *)v23;
  v55 = (void *)v25;
  if (a9)
  {
    ENErrorF();
    v56 = 0;
    *a9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v56 = 0;
  }
LABEL_46:

  return v56;
}

- (ENTextMessageManagerDelegate)delegate
{
  return (ENTextMessageManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (ENSecureArchiveFileWrapper)textMessageHistoryFileWrapper
{
  return self->_textMessageHistoryFileWrapper;
}

- (void)setTextMessageHistoryFileWrapper:(id)a3
{
  objc_storeStrong((id *)&self->_textMessageHistoryFileWrapper, a3);
}

- (NSMutableDictionary)textMessageHashes
{
  return self->_textMessageHashes;
}

- (void)setTextMessageHashes:(id)a3
{
  objc_storeStrong((id *)&self->_textMessageHashes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textMessageHashes, 0);
  objc_storeStrong((id *)&self->_textMessageHistoryFileWrapper, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

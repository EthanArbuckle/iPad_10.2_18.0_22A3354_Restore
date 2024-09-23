@implementation IMLogDump

+ (id)sharedInstance
{
  if (qword_1ECFC7620 != -1)
    dispatch_once(&qword_1ECFC7620, &unk_1E3FB34C8);
  return (id)qword_1ECFC7578;
}

- (IMLogDump)init
{
  IMLogDump *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *logDumpQueue;
  void *v5;
  int v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)IMLogDump;
  v2 = -[IMLogDump init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.private.Messages.IMLogDump", 0);
    logDumpQueue = v2->_logDumpQueue;
    v2->_logDumpQueue = (OS_dispatch_queue *)v3;

    objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isInternalInstall");

    if (v6)
      v2->_shouldCollectPowerWifiStats = 1;
  }
  return v2;
}

- (id)_predicateToAppend:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" --predicate '%@'"), a3);
}

- (id)_lastHoursToAppend:(int)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" --last %dh"), *(_QWORD *)&a3);
}

- (void)dumpMOCLoggingMetaData
{
  id v2;
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  id v24;
  void *v26;
  void *v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  uint8_t v34[128];
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C8F2B8]);
  v3 = (id)*MEMORY[0x1E0C8F0D0];
  v33 = 0;
  v26 = v2;
  v24 = v3;
  objc_msgSend(v2, "accountTypeWithAccountTypeIdentifier:error:");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  objc_msgSend(v2, "accountsWithAccountType:", v27);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      v36 = v4;
      v37 = 2112;
      v38 = v23;
      v39 = 2112;
      v40 = v24;
      _os_log_impl(&dword_19E239000, v5, OS_LOG_TYPE_INFO, "Accounts %@ accountTypeError %@ ID Type %@", buf, 0x20u);
    }

  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v30;
    v8 = *MEMORY[0x1E0C8EF90];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v30 != v7)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v10, "accountProperties");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "valueForKey:", v8);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v10, "username");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringWithFormat:", CFSTR("%@@%@"), v14, v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v10, "qualifiedUsername");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v36 = v15;
            v37 = 2112;
            v38 = v17;
            _os_log_impl(&dword_19E239000, v16, OS_LOG_TYPE_INFO, "<StartAccountDetails>Account userName %@ | Account qualifiedUserName %@ <EndAccountDetails>", buf, 0x16u);

          }
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v6);
  }

  IMGetCachedDomainValueForKey();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  IMGetCachedDomainValueForKey();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  IMGetCachedDomainValueForKey();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v18;
      _os_log_impl(&dword_19E239000, v21, OS_LOG_TYPE_INFO, "<StartCoreDuetSyncInfo> LastFullSyncAttempt\x05 %@ <EndCoreDuetLastFullSyncInfo>", buf, 0xCu);
    }

  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v36 = v19;
      v37 = 2112;
      v38 = v20;
      _os_log_impl(&dword_19E239000, v22, OS_LOG_TYPE_INFO, "<StartAHDAgentSyncInfo> LastSyncAttempt %@  | Info %@ <EndAHDAgentSyncInfo>", buf, 0x16u);
    }

  }
  -[IMLogDump printSyncDurationStats](self, "printSyncDurationStats");
  -[IMLogDump printPowerAndWifiStats](self, "printPowerAndWifiStats");

}

- (void)_compressAndDeleteFilesAtPath:(id)a3 destinationFilePath:(id)a4 withCompletion:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD aBlock[4];
  id v19;
  id v20;
  id v21;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_19E28472C;
  aBlock[3] = &unk_1E3FB5BA0;
  v19 = v8;
  v20 = v7;
  v21 = v9;
  v10 = v9;
  v11 = v7;
  v12 = v8;
  v13 = _Block_copy(aBlock);
  v14 = objc_alloc(MEMORY[0x1E0D36A30]);
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v14, "initWithInputURL:outputURL:identifier:operation:completionBlock:queue:", v15, v16, 0, 2, v13, MEMORY[0x1E0C80D38]);

  objc_msgSend(v17, "start");
}

- (BOOL)_checkArgumentValidity:(id)a3 withFileName:(id)a4 withPredicate:(id)a5 withError:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  char v13;
  void *v14;
  char v15;
  void *v16;
  int v17;
  id v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  BOOL v23;
  void *v24;
  char v25;
  char v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  const __CFString *v30;
  id v32;
  char v33;
  uint8_t buf[4];
  const __CFString *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isInternalInstall");

  if ((v13 & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19E239000, v21, OS_LOG_TYPE_INFO, "Cannot run dumpLogsToFile as device not on internal build", buf, 2u);
      }

    }
    if (a6)
      goto LABEL_24;
LABEL_57:
    v23 = 0;
    goto LABEL_58;
  }
  if (v9 && v10)
  {
    v33 = 0;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "fileExistsAtPath:isDirectory:", v9, &v33);

    if ((v15 & 1) == 0)
    {
      v33 = 0;
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 0;
      v17 = objc_msgSend(v16, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v9, 1, 0, &v32);
      v18 = v32;

      if (v17)
      {
        if (v18)
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19E239000, v19, OS_LOG_TYPE_INFO, "dumpLogsToFile outFilePath is not a valid file path", buf, 2u);
            }

          }
          if (a6)
          {
            v20 = objc_retainAutorelease(v18);
            v18 = v20;
LABEL_39:
            v23 = 0;
            *a6 = v20;
LABEL_56:

            goto LABEL_58;
          }
          goto LABEL_55;
        }
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "fileExistsAtPath:isDirectory:", v9, &v33);
        if (v33)
          v26 = v25;
        else
          v26 = 0;

        if ((v26 & 1) == 0)
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
            {
              if (v33)
                v30 = CFSTR("YES");
              else
                v30 = CFSTR("NO");
              *(_DWORD *)buf = 138412290;
              v35 = v30;
              _os_log_impl(&dword_19E239000, v29, OS_LOG_TYPE_INFO, "dumpLogsToFile file was not created or filepath is not a directory %@", buf, 0xCu);
            }

          }
          if (a6)
          {
            v20 = 0;
            goto LABEL_39;
          }
          goto LABEL_55;
        }
      }

    }
    objc_msgSend(v10, "lastPathComponent");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v27;
    if (v27 && objc_msgSend(v27, "length") && !objc_msgSend(v18, "isEqualToString:", CFSTR("..")))
    {
      if (!objc_msgSend(v11, "containsString:", CFSTR(";")))
      {
        v23 = 1;
        goto LABEL_56;
      }
      if (!IMOSLoggingEnabled())
      {
LABEL_37:
        if (a6)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IMLogDumpErrorDomain"), 3, 0);
          v20 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_39;
        }
LABEL_55:
        v23 = 0;
        goto LABEL_56;
      }
      OSLogHandleForIMFoundationCategory();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19E239000, v28, OS_LOG_TYPE_INFO, "dumpLogsToFile predicate is invalid and should not contain \";\",
          buf,
          2u);
      }
    }
    else
    {
      if (!IMOSLoggingEnabled())
        goto LABEL_37;
      OSLogHandleForIMFoundationCategory();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19E239000, v28, OS_LOG_TYPE_INFO, "dumpLogsToFile failName is invalid", buf, 2u);
      }
    }

    goto LABEL_37;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19E239000, v22, OS_LOG_TYPE_INFO, "dumpLogsToFile outFilePath is nil", buf, 2u);
    }

  }
  if (!a6)
    goto LABEL_57;
LABEL_24:
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IMLogDumpErrorDomain"), 3, 0);
  v23 = 0;
  *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_58:

  return v23;
}

- (void)dumpLogsToFolderAtPath:(id)a3 withFileName:(id)a4 lastHours:(int)a5 predicate:(id)a6 includeCKDebug:(BOOL)a7 withCompletion:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  void *v19;
  NSObject *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD block[5];
  id v26;
  id v27;
  id v28;
  id v29;
  int v30;
  _QWORD aBlock[4];
  id v32;

  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = a8;
  v17 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_19E284F88;
  aBlock[3] = &unk_1E3FB5BF0;
  v32 = v16;
  v18 = v16;
  v19 = _Block_copy(aBlock);
  -[IMLogDump logDumpQueue](self, "logDumpQueue");
  v20 = objc_claimAutoreleasedReturnValue();
  block[0] = v17;
  block[1] = 3221225472;
  block[2] = sub_19E285200;
  block[3] = &unk_1E3FB5C18;
  block[4] = self;
  v26 = v13;
  v30 = a5;
  v27 = v14;
  v28 = v15;
  v29 = v19;
  v21 = v19;
  v22 = v15;
  v23 = v14;
  v24 = v13;
  dispatch_async(v20, block);

}

- (id)logShowCommandToFilePath:(id)a3 lastHours:(int)a4 predicate:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("/usr/bin/log show --source --info"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 - 1) <= 0xFFFFFFFD)
  {
    -[IMLogDump _lastHoursToAppend:](self, "_lastHoursToAppend:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "appendString:", v11);

  }
  if (v9)
  {
    -[IMLogDump _predicateToAppend:](self, "_predicateToAppend:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "appendString:", v12);

  }
  objc_msgSend(v10, "appendFormat:", CFSTR(" > %@ 2>&1"), v8);

  return v10;
}

- (void)clearSyncStats
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  IMSetDomainValueForKey();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  IMSetDomainValueForKey();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  IMSetDomainValueForKey();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  IMSetDomainValueForKey();

}

- (void)printIfWeAreInTheMiddleOfASync
{
  void *v2;
  void *v3;
  NSObject *v4;
  const __CFString *v5;
  const __CFString *v6;
  int v7;
  const __CFString *v8;
  __int16 v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  IMGetCachedDomainValueForKey();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  IMGetCachedDomainValueForKey();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = CFSTR("YES");
      if (v2)
        v6 = CFSTR("YES");
      else
        v6 = CFSTR("NO");
      if (!v3)
        v5 = CFSTR("NO");
      v7 = 138412546;
      v8 = v6;
      v9 = 2112;
      v10 = v5;
      _os_log_impl(&dword_19E239000, v4, OS_LOG_TYPE_INFO, "*** Dumping logs while we are syncing | CoreDuet Sync %@ AHDA Sync %@", (uint8_t *)&v7, 0x16u);
    }

  }
}

- (double)_calculateMinutesSyncingWithDurationKey:(id)a3 attemptDateKey:(id)a4
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;

  v4 = a4;
  IMGetCachedDomainValueForKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  IMGetCachedDomainValueForKey();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceReferenceDate");
    v11 = v10;
    objc_msgSend(v8, "timeIntervalSinceReferenceDate");
    v7 = v7 + v11 - v12;

  }
  return v7 / 60.0;
}

- (void)printSyncDurationStats
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (-[IMLogDump shouldCollectPowerWifiStats](self, "shouldCollectPowerWifiStats"))
  {
    IMGetCachedDomainValueForKey();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "unsignedIntegerValue");

    IMGetCachedDomainValueForKey();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "unsignedIntegerValue");

    -[IMLogDump _calculateMinutesSyncingWithDurationKey:attemptDateKey:](self, "_calculateMinutesSyncingWithDurationKey:attemptDateKey:", CFSTR("IMCKTotalDurationOfCoreDuetSync"), CFSTR("CoreduetLastFullSyncAttemptDate"));
    v8 = v7;
    -[IMLogDump _calculateMinutesSyncingWithDurationKey:attemptDateKey:](self, "_calculateMinutesSyncingWithDurationKey:attemptDateKey:", CFSTR("IMCKTotalDurationOfAHDASync"), CFSTR("AHDAgentLastSyncAttemptDate"));
    v10 = v9;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138412546;
        v16 = v12;
        v17 = 2048;
        v18 = v8;
        _os_log_impl(&dword_19E239000, v11, OS_LOG_TYPE_INFO, "<StartCoreDuetAttemptInfo> Number of Attempts %@ | Duration of Sync %.04f Minutes <EndCoreDuetAttemptInfo>", (uint8_t *)&v15, 0x16u);

      }
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138412546;
        v16 = v14;
        v17 = 2048;
        v18 = v10;
        _os_log_impl(&dword_19E239000, v13, OS_LOG_TYPE_INFO, "<StartAHDAAttemptInfo> Number of Attempts %@ | Duration of Sync %.04f Minutes <EndAHDAAttemptInfo>", (uint8_t *)&v15, 0x16u);

      }
    }
  }
}

- (id)_dictionaryForDayKey:(id)a3
{
  return (id)IMGetCachedDomainValueForKey();
}

- (BOOL)_isWifiUsable
{
  void *v2;
  char v3;

  +[IMDeviceConditions sharedInstance](IMDeviceConditions, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDeviceOnWifi");

  return v3;
}

- (BOOL)_isOnPower
{
  void *v2;
  char v3;

  +[IMDeviceConditions sharedInstance](IMDeviceConditions, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDeviceCharging");

  return v3;
}

- (void)_calculateConnectedMinutesForDateKey:(id)a3 durationKey:(id)a4 daysDictionary:(id)a5 totalDurationDictionary:(id)a6 totalDurationKey:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  _BOOL4 v23;
  _BOOL4 v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  int v30;
  double v31;
  double v32;
  void *v33;
  id v34;

  v34 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  objc_msgSend(v12, "objectForKeyedSubscript:", v34);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "doubleValue");
  v18 = v17;

  objc_msgSend(v13, "objectForKeyedSubscript:", v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "doubleValue");
  v21 = v18 + v20;
  objc_msgSend(v13, "objectForKeyedSubscript:", v15);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    v23 = -[IMLogDump _isOnPower](self, "_isOnPower");
    v24 = -[IMLogDump _isWifiUsable](self, "_isWifiUsable");
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "timeIntervalSinceReferenceDate");
    v27 = v26;
    objc_msgSend(v22, "timeIntervalSinceReferenceDate");
    v29 = v27 - v28;
    if (objc_msgSend(v34, "isEqualToString:", CFSTR("totalPowerWifi")) && v24 && v23
      || (objc_msgSend(v34, "isEqualToString:", CFSTR("totalPower")) & v23) == 1)
    {
      v21 = v21 + v29;
    }
    else
    {
      v30 = objc_msgSend(v34, "isEqualToString:", CFSTR("totalWifi"));
      v31 = -0.0;
      if (v24)
        v31 = v29;
      v32 = v21 + v31;
      if (v30)
        v21 = v32;
    }

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v21);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v33, v34);

}

- (id)_calculatePowerAndWifiConnectedTimeInMinutesForDictionary:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, void *, void *);
  void *v26;
  IMLogDump *v27;
  id v28;

  v4 = a3;
  if (-[IMLogDump shouldCollectPowerWifiStats](self, "shouldCollectPowerWifiStats"))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("totalPowerWifi"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("totalPower"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("totalWifi"));

    v23 = MEMORY[0x1E0C809B0];
    v24 = 3221225472;
    v25 = sub_19E286164;
    v26 = &unk_1E3FB5C40;
    v27 = self;
    v9 = v5;
    v28 = v9;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", &v23);
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("totalPowerWifi"), v23, v24, v25, v26, v27);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValue");
    v12 = v11 / 60.0;

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("totalPower"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "doubleValue");
    v15 = v14 / 60.0;

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("totalWifi"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "doubleValue");
    v18 = v17 / 60.0;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v19, CFSTR("totalPowerWifi"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v15);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v20, CFSTR("totalPower"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v21, CFSTR("totalWifi"));

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)printPowerAndWifiStats
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (-[IMLogDump shouldCollectPowerWifiStats](self, "shouldCollectPowerWifiStats"))
  {
    IMGetCachedDomainValueForKey();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        v21 = 138412290;
        v22 = v3;
        _os_log_impl(&dword_19E239000, v4, OS_LOG_TYPE_INFO, "dictionaryOfDays %@", (uint8_t *)&v21, 0xCu);
      }

    }
    -[IMLogDump _calculatePowerAndWifiConnectedTimeInMinutesForDictionary:](self, "_calculatePowerAndWifiConnectedTimeInMinutesForDictionary:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("totalPowerWifi"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValue");
    v8 = v7;

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("totalPower"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    v11 = v10;

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("totalWifi"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    v14 = v13;

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "count"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 134218242;
        v22 = v8;
        v23 = 2112;
        v24 = v16;
        _os_log_impl(&dword_19E239000, v15, OS_LOG_TYPE_INFO, "<StartPowerAndWifiConnectedStats> We were connected to POWER & WIFI for a total of %.04f minutes over the past %@ days <EndPowerAndWifiConnectedStats>", (uint8_t *)&v21, 0x16u);

      }
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "count"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 134218242;
        v22 = v11;
        v23 = 2112;
        v24 = v18;
        _os_log_impl(&dword_19E239000, v17, OS_LOG_TYPE_INFO, "<StartPowerAndWifiConnectedStats> We were connected to POWER for a total of %.04f minutes over the past %@ days <EndPowerAndWifiConnectedStats>", (uint8_t *)&v21, 0x16u);

      }
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "count"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 134218242;
        v22 = v14;
        v23 = 2112;
        v24 = v20;
        _os_log_impl(&dword_19E239000, v19, OS_LOG_TYPE_INFO, "<StartPowerAndWifiConnectedStats> We were connected to WIFI for a total of %.04f minutes over the past %@ days <EndPowerAndWifiConnectedStats>", (uint8_t *)&v21, 0x16u);

      }
    }

  }
}

- (void)incrementCoreDuetSyncAttempts
{
  MEMORY[0x1E0DE7D20](self, sel__incrementSyncAttemptsWithKey_syncDateKey_);
}

- (void)incrementAHDASyncAttempts
{
  MEMORY[0x1E0DE7D20](self, sel__incrementSyncAttemptsWithKey_syncDateKey_);
}

- (void)_incrementSyncAttemptsWithKey:(id)a3 syncDateKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[IMLogDump shouldCollectPowerWifiStats](self, "shouldCollectPowerWifiStats"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    IMGetCachedDomainValueForKey();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "unsignedIntegerValue");

    v11 = v10 + 1;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138412546;
        v16 = v6;
        v17 = 2112;
        v18 = v13;
        _os_log_impl(&dword_19E239000, v12, OS_LOG_TYPE_INFO, "Incrementing %@ | numberOfSyncAttempts %@", (uint8_t *)&v15, 0x16u);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    IMSetDomainValueForKey();

    IMSetDomainValueForKey();
  }

}

- (void)noteCoreDuetSyncEnded
{
  MEMORY[0x1E0DE7D20](self, sel__noteSyncEndedForDurationKey_dateKey_);
}

- (void)noteAHDASyncEnded
{
  MEMORY[0x1E0DE7D20](self, sel__noteSyncEndedForDurationKey_dateKey_);
}

- (void)_noteSyncEndedForDurationKey:(id)a3 dateKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  NSObject *v17;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[IMLogDump shouldCollectPowerWifiStats](self, "shouldCollectPowerWifiStats"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    IMGetCachedDomainValueForKey();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    v11 = v10;

    IMGetCachedDomainValueForKey();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v8, "timeIntervalSinceReferenceDate");
      v14 = v13;
      objc_msgSend(v12, "timeIntervalSinceReferenceDate");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11 + v14 - v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      IMSetDomainValueForKey();

      IMSetDomainValueForKey();
    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v18 = 138412290;
        v19 = v7;
        _os_log_impl(&dword_19E239000, v17, OS_LOG_TYPE_INFO, "We for some reason did not have a %@, early returning as that would mess up our statistics", (uint8_t *)&v18, 0xCu);
      }

    }
  }

}

- (OS_dispatch_queue)logDumpQueue
{
  return self->_logDumpQueue;
}

- (BOOL)shouldCollectPowerWifiStats
{
  return self->_shouldCollectPowerWifiStats;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logDumpQueue, 0);
}

@end

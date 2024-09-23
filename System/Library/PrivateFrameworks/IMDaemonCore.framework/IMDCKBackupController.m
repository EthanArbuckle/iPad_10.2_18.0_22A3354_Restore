@implementation IMDCKBackupController

- (BOOL)iCloudBackupsDisabled
{
  __CFString *v2;
  void *v3;
  char v4;
  id v5;
  uint64_t v6;
  int v7;
  NSObject *v8;
  const __CFString *v9;
  BOOL v10;
  NSObject *v11;
  __CFString *v12;
  id v14;
  char v15;
  uint8_t buf[4];
  const __CFString *v17;
  __int16 v18;
  __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[IMDCKBackupController _disabledDirectoryPath](self, "_disabledDirectoryPath");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v4 = objc_msgSend(v3, "__im_getiCloudBackupAttributeForItemAtPath:attributeValue:error:", v2, &v15, &v14);
  v5 = v14;

  v7 = IMOSLoggingEnabled(v6);
  if ((v4 & 1) != 0)
  {
    if (v7)
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = CFSTR("DISABLED");
        if (!v15)
          v9 = CFSTR("ENABLED");
        *(_DWORD *)buf = 138412546;
        v17 = v9;
        v18 = 2112;
        v19 = v2;
        _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "iCloud backups are %@ (at path '%@')", buf, 0x16u);
      }

    }
    v10 = v15 != 0;
  }
  else
  {
    if (v7)
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v5, "localizedDescription");
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v17 = v2;
        v18 = 2112;
        v19 = v12;
        _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Failed to get iCloud backup attribute for path '%@', error: %@", buf, 0x16u);

      }
    }
    v10 = 0;
  }

  return v10;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D156B4C8;
  block[3] = &unk_1E9227F30;
  block[4] = a1;
  if (qword_1ED935EE0 != -1)
    dispatch_once(&qword_1ED935EE0, block);
  return (id)qword_1ED935E40;
}

- (IMDCKUtilities)ckUtilities
{
  IMDCKUtilities **p_ckUtilities;
  id WeakRetained;
  void *v4;

  p_ckUtilities = &self->_ckUtilities;
  WeakRetained = objc_loadWeakRetained((id *)&self->_ckUtilities);

  if (!WeakRetained)
  {
    +[IMDCKUtilities sharedInstance](IMDCKUtilities, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)p_ckUtilities, v4);

  }
  return (IMDCKUtilities *)objc_loadWeakRetained((id *)p_ckUtilities);
}

- (void)_ensureRestoredDatabaseToBackup
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = IMGetCachedDomainBoolForKey();
  if ((v3 & 1) == 0)
  {
    if (IMOSLoggingEnabled(v3))
    {
      OSLogHandleForIMFoundationCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_1D1413000, v4, OS_LOG_TYPE_INFO, "_ensureRestoredDatabaseToBackup restoring everything to iCloudBackup.", v5, 2u);
      }

    }
    IMSetDomainBoolForKey();
    -[IMDCKBackupController _setICloudBackupsDisabled:](self, "_setICloudBackupsDisabled:", 0);
  }
}

- (void)setUserDefaultBool:(BOOL)a3 forKey:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithBool:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[IMDCKBackupController writeUserDefault:forKey:](self, "writeUserDefault:forKey:", v8, v7);

}

- (void)removeUserDefault:(id)a3
{
  -[IMDCKBackupController writeUserDefault:forKey:](self, "writeUserDefault:forKey:", 0, a3);
}

- (BOOL)readUserDefaultBoolForKey:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  -[IMDCKBackupController readUserDefaultForKey:](self, "readUserDefaultForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "BOOLValue");
  else
    v5 = 0;

  return v5;
}

- (id)readUserDefaultForKey:(id)a3
{
  return (id)IMGetCachedDomainValueForKey();
}

- (void)writeUserDefault:(id)a3 forKey:(id)a4
{
  IMSetDomainValueForKey();
}

- (int64_t)_readRecordCount
{
  void *v2;
  void *v3;
  int64_t v4;

  -[IMDCKBackupController readUserDefaultForKey:](self, "readUserDefaultForKey:", CFSTR("IMDCKBackupControllerBackupRecordCountKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "longLongValue");
  else
    v4 = 0;

  return v4;
}

- (void)_saveRecordCount:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[IMDCKBackupController writeUserDefault:forKey:](self, "writeUserDefault:forKey:", v4, CFSTR("IMDCKBackupControllerBackupRecordCountKey"));

}

- (void)_savePreviousDeviceState:(id)a3
{
  -[IMDCKBackupController writeUserDefault:forKey:](self, "writeUserDefault:forKey:", a3, CFSTR("IMDCKBackupControllerBackupDeviceStateKey"));
}

- (id)_readPreviousDeviceState
{
  return -[IMDCKBackupController readUserDefaultForKey:](self, "readUserDefaultForKey:", CFSTR("IMDCKBackupControllerBackupDeviceStateKey"));
}

- (id)_serverBagTimeIntervalForFirstSyncTimeout
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("disable-icloud-backup-after-first-sync-interval"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (double)_firstSyncExpirationTimeInterval
{
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = IMDCKBackupControllerDefaultTimebombIntervalInDays;
  -[IMDCKBackupController _serverBagTimeIntervalForFirstSyncTimeout](self, "_serverBagTimeIntervalForFirstSyncTimeout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v2 = objc_msgSend(v3, "integerValue");

  return (double)v2 * 86400.0;
}

- (void)setFirstSyncDate:(id)a3
{
  -[IMDCKBackupController writeUserDefault:forKey:](self, "writeUserDefault:forKey:", a3, CFSTR("IMDCKBackupControllerTimebombStartUserDefaultsKey"));
}

- (NSDate)firstSyncDate
{
  return (NSDate *)-[IMDCKBackupController readUserDefaultForKey:](self, "readUserDefaultForKey:", CFSTR("IMDCKBackupControllerTimebombStartUserDefaultsKey"));
}

- (void)setFirstSyncDateToNow
{
  void *v3;
  id v4;

  -[IMDCKBackupController firstSyncDate](self, "firstSyncDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[IMDCKBackupController setFirstSyncDate:](self, "setFirstSyncDate:", v4);

  }
}

- (BOOL)_firstSyncTimeoutHasExpired
{
  void *v3;
  void *v4;
  BOOL v5;
  NSObject *v6;
  uint8_t v8[16];

  -[IMDCKBackupController firstSyncDate](self, "firstSyncDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[IMDCKBackupController _timeIntervalFromFirstSync:hasExpiredForDate:](self, "_timeIntervalFromFirstSync:hasExpiredForDate:", v3, v4);

  }
  else
  {
    if (IMOSLoggingEnabled(0))
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "First sync date is nil, this is a bug -- setFirstSyncDateToNow should have been called before this.", v8, 2u);
      }

    }
    v5 = 0;
  }

  return v5;
}

- (BOOL)_timeIntervalFromFirstSync:(id)a3 hasExpiredForDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  BOOL v14;
  NSObject *v15;
  uint8_t v17[16];

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    objc_msgSend(v6, "timeIntervalSinceReferenceDate");
    v10 = v9;
    objc_msgSend(v8, "timeIntervalSinceReferenceDate");
    v12 = v11 - v10;
    -[IMDCKBackupController _firstSyncExpirationTimeInterval](self, "_firstSyncExpirationTimeInterval");
    v14 = v12 > v13;
  }
  else
  {
    if (IMOSLoggingEnabled(v7))
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "nil dates sent into _timeIntervalFromFirstSync", v17, 2u);
      }

    }
    v14 = 0;
  }

  return v14;
}

- (void)toggleiCloudBackupsIfNeeded:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  void (**v9)(void *, uint64_t, _QWORD);
  void *v10;
  int v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  void (**v15)(void *, uint64_t, _QWORD);
  _QWORD aBlock[5];
  id v17;
  id v18;

  v4 = a3;
  -[IMDCKBackupController _readCurrentDeviceState](self, "_readCurrentDeviceState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1D156BC1C;
  aBlock[3] = &unk_1E922D7C8;
  aBlock[4] = self;
  v7 = v5;
  v17 = v7;
  v8 = v4;
  v18 = v8;
  v9 = (void (**)(void *, uint64_t, _QWORD))_Block_copy(aBlock);
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D360A8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  if (v11)
  {
    if (v9)
      v9[2](v9, 3, 0);
  }
  else
  {
    -[IMDCKBackupController ckUtilities](self, "ckUtilities");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v6;
    v13[1] = 3221225472;
    v13[2] = sub_1D156BDC8;
    v13[3] = &unk_1E922D7C8;
    v13[4] = self;
    v14 = v7;
    v15 = v9;
    objc_msgSend(v12, "fetchCloudKitAccountStatusWithCompletion:", v13);

  }
}

- (void)registerForDistributedNotifications
{
  id v3;

  if ((IMIsRunningInUnitTesting() & 1) == 0)
  {
    +[IMDDistributedNotificationXPCEventStreamHandler sharedInstance](IMDDistributedNotificationXPCEventStreamHandler, "sharedInstance");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addDelegate:queue:", self, MEMORY[0x1E0C80D38]);

  }
}

- (id)_primaryAccountAltDSID
{
  void *v2;
  void *v3;

  -[IMDCKBackupController ckUtilities](self, "ckUtilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_primaryiCloudAccountAltDSID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)_disableiCloudBackupIfSyncPercentageIsHighEnough:(int64_t)a3 totalCount:(int64_t)a4
{
  float v7;
  uint64_t v8;
  NSObject *v9;
  _BOOL4 v10;
  int v11;
  NSObject *v12;
  NSObject *v14;
  int v15;
  double v16;
  __int16 v17;
  int64_t v18;
  __int16 v19;
  int64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (a4 < 1)
    v7 = 1.0;
  else
    v7 = (float)a3 / (float)a4;
  v8 = IMOSLoggingEnabled(self);
  if ((_DWORD)v8)
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v15 = 134218496;
      v16 = v7;
      v17 = 2048;
      v18 = a3;
      v19 = 2048;
      v20 = a4;
      _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "Calculated percent synced (%f) from (%lld synced of %lld total records) ok ", (uint8_t *)&v15, 0x20u);
    }

  }
  v10 = v7 > *(float *)a33s;
  v11 = IMOSLoggingEnabled(v8);
  if (v10)
  {
    if (v11)
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v15 = 134218240;
        v16 = v7;
        v17 = 2048;
        *(double *)&v18 = *(float *)a33s;
        _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "Disabling iCloud backup since percentage of synced cloudkit records is high enough: %f >= %f ", (uint8_t *)&v15, 0x16u);
      }

    }
    -[IMDCKBackupController setICloudBackupsDisabled:](self, "setICloudBackupsDisabled:", 1);
    return 1;
  }
  else
  {
    if (v11)
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v15 = 134218240;
        v16 = v7;
        v17 = 2048;
        *(double *)&v18 = *(float *)a33s;
        _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "NOT disabling iCloud backup since percentage of synced cloudkit records is NOT high enough: %f < %f. We will check again later.", (uint8_t *)&v15, 0x16u);
      }

    }
    return 5;
  }
}

- (void)_fetchCountOfSyncedCloudKitRecords:(int64_t *)a3 totalCount:(int64_t *)a4
{
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  int64_t v16;
  int64_t v17;
  NSObject *v18;
  int v19;
  int64_t v20;
  __int16 v21;
  int64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  IMDMessageRecordCalculateLocalCloudKitStatistics();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = IMOSLoggingEnabled(v6);
  if (v6)
  {
    if (v7)
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v6, "description");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "description");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), &stru_1E92346B0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138412290;
        v20 = (int64_t)v11;
        _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Loaded cloud kit stats: %@", (uint8_t *)&v19, 0xCu);

      }
    }
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D37D50]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *a4 = objc_msgSend(v12, "unsignedLongValue");

    objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D37CE8]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *a3 = objc_msgSend(v13, "unsignedLongValue");

    if (IMOSLoggingEnabled(v14))
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v16 = *a4;
        v17 = *a3;
        v19 = 134218240;
        v20 = v16;
        v21 = 2048;
        v22 = v17;
        _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "Total record count: %lld, total syncedCount: %lld", (uint8_t *)&v19, 0x16u);
      }

    }
  }
  else if (v7)
  {
    OSLogHandleForIMFoundationCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, "IMDMessageRecordCalculateLocalCloudKitStatistics returned NULL stats", (uint8_t *)&v19, 2u);
    }

  }
}

- (BOOL)_currentDeviceStateIsRestore:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D36098]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "BOOLValue") & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D36090]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "BOOLValue") & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D360A0]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v7, "BOOLValue");

    }
  }

  return v5;
}

- (BOOL)_deviceStateHasChanged:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  int v11;

  v4 = a3;
  -[IMDCKBackupController _readPreviousDeviceState](self, "_readPreviousDeviceState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = *MEMORY[0x1E0D36088];
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D36088]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v7)
      v10 = v8 == 0;
    else
      v10 = 1;
    if (v10)
      LOBYTE(v11) = 1;
    else
      v11 = objc_msgSend(v7, "isEqual:", v8) ^ 1;

  }
  else
  {
    LOBYTE(v11) = 1;
  }

  return v11;
}

- (int64_t)_attemptToDisableiCloudBackupsWithCurrentDeviceState:(id)a3
{
  id v4;
  _BOOL8 v5;
  _BOOL4 v6;
  int v7;
  NSObject *v8;
  _BOOL8 v9;
  _BOOL4 v10;
  int v11;
  NSObject *v12;
  int64_t v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v18;
  uint8_t buf[16];

  v4 = a3;
  if (v4)
  {
    v5 = -[IMDCKBackupController _currentDeviceStateIsRestore:](self, "_currentDeviceStateIsRestore:", v4);
    v6 = v5;
    v7 = IMOSLoggingEnabled(v5);
    if (v6)
    {
      if (v7)
      {
        OSLogHandleForIMFoundationCategory();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Device has been restored, checking to see if we can disable iCloud backups", buf, 2u);
        }

      }
      v9 = -[IMDCKBackupController _canDisableiCloudBackupsAfterRestore](self, "_canDisableiCloudBackupsAfterRestore");
      v10 = v9;
      v11 = IMOSLoggingEnabled(v9);
      if (v10)
      {
        if (v11)
        {
          OSLogHandleForIMFoundationCategory();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "Device has been restored ok and is in acceptable state, wa are disabling iClound backups now", buf, 2u);
          }

        }
        v13 = 1;
        -[IMDCKBackupController setICloudBackupsDisabled:](self, "setICloudBackupsDisabled:", 1);
      }
      else
      {
        if (v11)
        {
          OSLogHandleForIMFoundationCategory();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "Enabling iCloud backup and restore until restore is complete.", buf, 2u);
          }

        }
        -[IMDCKBackupController setICloudBackupsDisabled:](self, "setICloudBackupsDisabled:", 0);
        v13 = 5;
      }
    }
    else
    {
      if (v7)
      {
        OSLogHandleForIMFoundationCategory();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "Checking counts of synced records to see if we can automatically disable iCloud backups", buf, 2u);
        }

      }
      v18 = 0;
      *(_QWORD *)buf = 0;
      -[IMDCKBackupController _fetchCountOfSyncedCloudKitRecords:totalCount:](self, "_fetchCountOfSyncedCloudKitRecords:totalCount:", buf, &v18);
      v13 = -[IMDCKBackupController _disableiCloudBackupIfSyncPercentageIsHighEnough:totalCount:](self, "_disableiCloudBackupIfSyncPercentageIsHighEnough:totalCount:", *(_QWORD *)buf, v18);
    }
  }
  else
  {
    if (IMOSLoggingEnabled(0))
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "Device State is unexpectedly nil", buf, 2u);
      }

    }
    v13 = 8;
  }

  return v13;
}

- (void)_setICloudBackupsDisabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  NSObject *v22;
  id v23;
  id v24;
  uint8_t buf[4];
  const __CFString *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v3 = a3;
  v31 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    -[IMDCKBackupController _disabledDirectoryPath](self, "_disabledDirectoryPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    v10 = objc_msgSend(v13, "__im_setiCloudBackupAttribute:onDirectoryAndChildrenAtPath:error:", 0, v8, &v23);
    v11 = v23;

    goto LABEL_5;
  }
  -[IMDCKBackupController ckUtilities](self, "ckUtilities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "removeFromBackUpAllowed");

  if ((v6 & 1) != 0)
  {
    -[IMDCKBackupController _disabledDirectoryPath](self, "_disabledDirectoryPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    v10 = objc_msgSend(v9, "__im_setiCloudBackupAttribute:onItemAtPath:error:", 1, v8, &v24);
    v11 = v24;

LABEL_5:
    if ((v10 & 1) != 0)
    {
      if (IMOSLoggingEnabled(v12))
      {
        OSLogHandleForIMFoundationCategory();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          -[IMDCKBackupController _disabledDirectoryPath](self, "_disabledDirectoryPath");
          v15 = objc_claimAutoreleasedReturnValue();
          v16 = (void *)v15;
          v17 = CFSTR("ENABLED");
          if (v3)
            v17 = CFSTR("DISABLED");
          *(_DWORD *)buf = 138412546;
          v26 = v17;
          v27 = 2112;
          v28 = v15;
          _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "set iCloud backups to %@ (at path '%@')", buf, 0x16u);

        }
      }
    }
    else if (IMOSLoggingEnabled(v12))
    {
      OSLogHandleForIMFoundationCategory();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v11, "localizedDescription");
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = (void *)v19;
        v21 = CFSTR("NO");
        *(_DWORD *)buf = 138412802;
        if (v3)
          v21 = CFSTR("YES");
        v26 = v21;
        v27 = 2112;
        v28 = (uint64_t)v8;
        v29 = 2112;
        v30 = v19;
        _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, "Failed to set iCloud backup file attribute to %@ on path: '%@'. Error: %@", buf, 0x20u);

      }
    }

    return;
  }
  if (IMOSLoggingEnabled(v7))
  {
    OSLogHandleForIMFoundationCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v22, OS_LOG_TYPE_INFO, "We are not allowed to remove backups from iCloud and we got called to disable the back up -- early returning", buf, 2u);
    }

  }
}

- (BOOL)_setiCloudBackupAttribute:(BOOL)a3 onItemAtPath:(id)a4 error:(id *)a5
{
  void *v6;
  id v7;
  void *v8;

  v6 = (void *)MEMORY[0x1E0CB3620];
  v7 = a4;
  objc_msgSend(v6, "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend(v8, "__im_setiCloudBackupAttribute:onItemAtPath:error:", 1, v7, a5);

  return (char)a5;
}

- (void)removePathFromiCloudBackup:(id)a3
{
  id v4;
  void *v5;
  char v6;
  uint64_t v7;
  _BOOL8 v8;
  NSObject *v9;
  _BOOL4 v10;
  id v11;
  int v12;
  NSObject *v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IMDCKBackupController ckUtilities](self, "ckUtilities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "removeFromBackUpAllowed");

  if ((v6 & 1) == 0)
  {
    if (!IMOSLoggingEnabled(v7))
      goto LABEL_21;
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v4;
      _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "We are not allowed to remove this device from backup -- not removing path (%@) from backup", buf, 0xCu);
    }
    goto LABEL_6;
  }
  v8 = -[IMDCKBackupController iCloudBackupsDisabled](self, "iCloudBackupsDisabled");
  if (!v8)
  {
    v15 = 0;
    v10 = -[IMDCKBackupController _setiCloudBackupAttribute:onItemAtPath:error:](self, "_setiCloudBackupAttribute:onItemAtPath:error:", 1, v4, &v15);
    v11 = v15;
    v12 = IMOSLoggingEnabled(v11);
    if (v10)
    {
      if (v12)
      {
        OSLogHandleForIMFoundationCategory();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v17 = v4;
          _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "removed path from iCloud backup: '%@'", buf, 0xCu);
        }
LABEL_19:

      }
    }
    else if (v12)
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v11, "localizedDescription");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v17 = v4;
        v18 = 2112;
        v19 = v14;
        _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "Failed to set iCloud backup file attribute to YES on path: '%@'. Error: %@", buf, 0x16u);

      }
      goto LABEL_19;
    }

    goto LABEL_21;
  }
  if (IMOSLoggingEnabled(v8))
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v4;
      _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "All iCloud backups disabled so path is already not backing up: %@", buf, 0xCu);
    }
LABEL_6:

  }
LABEL_21:

}

- (BOOL)pathRemovedFromBackup:(id)a3
{
  __CFString *v4;
  BOOL v5;
  void *v6;
  char v7;
  id v8;
  uint64_t v9;
  int v10;
  NSObject *v11;
  const __CFString *v12;
  NSObject *v13;
  __CFString *v14;
  id v16;
  char v17;
  uint8_t buf[4];
  const __CFString *v19;
  __int16 v20;
  __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = (__CFString *)a3;
  if (-[IMDCKBackupController iCloudBackupsDisabled](self, "iCloudBackupsDisabled"))
  {
    v5 = 1;
  }
  else
  {
    v17 = 0;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    v7 = objc_msgSend(v6, "__im_getiCloudBackupAttributeForItemAtPath:attributeValue:error:", v4, &v17, &v16);
    v8 = v16;

    v10 = IMOSLoggingEnabled(v9);
    if ((v7 & 1) != 0)
    {
      if (v10)
      {
        OSLogHandleForIMFoundationCategory();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          v12 = CFSTR("DISABLED");
          if (!v17)
            v12 = CFSTR("ENABLED");
          *(_DWORD *)buf = 138412546;
          v19 = v12;
          v20 = 2112;
          v21 = v4;
          _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "iCloud backups are %@ for path '%@')", buf, 0x16u);
        }

      }
      v5 = v17 != 0;
    }
    else
    {
      if (v10)
      {
        OSLogHandleForIMFoundationCategory();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v8, "localizedDescription");
          v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v19 = v4;
          v20 = 2112;
          v21 = v14;
          _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "Failed to get iCloud backup attribute for path '%@', error: %@", buf, 0x16u);

        }
      }
      v5 = 0;
    }

  }
  return v5;
}

- (id)createBackupManager
{
  id v2;

  if (qword_1EFC63E30 != -1)
    dispatch_once(&qword_1EFC63E30, &unk_1E922D7E8);
  v2 = (id)qword_1EFC63E28;
  if (qword_1EFC63E28)
    v2 = objc_alloc_init((Class)qword_1EFC63E28);
  return v2;
}

- (BOOL)iCloudBackupEnabledSystemWide
{
  void *v2;
  void *v3;
  char v4;

  -[IMDCKBackupController createBackupManager](self, "createBackupManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "isBackupEnabled");
  else
    v4 = 0;

  return v4;
}

- (BOOL)setupAssistantNeedsToRun
{
  if (qword_1EFC63E40 != -1)
    dispatch_once(&qword_1EFC63E40, &unk_1E922D808);
  if (off_1EFC63E38)
    return off_1EFC63E38();
  else
    return 1;
}

- (void)_deviceIDFromMobileBackupManager:(id *)a3 legacyDeviceID:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[IMDCKBackupController createBackupManager](self, "createBackupManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "backupDeviceUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "backupDeviceUDID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v6;
  }
  else
  {
    v9 = 0;
    v8 = 0;
  }
  if (IMOSLoggingEnabled(v6))
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = 138412546;
      v12 = v8;
      v13 = 2112;
      v14 = v9;
      _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "Device ID from MobileBackup deviceID (deviceUUID) = %@, legacyDevice (deviceUDID) = %@", (uint8_t *)&v11, 0x16u);
    }

  }
  if (a3)
    *a3 = objc_retainAutorelease(v8);
  if (a4)
    *a4 = objc_retainAutorelease(v9);

}

- (void)_enqueOperation:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (IMOSLoggingEnabled(v3))
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_impl(&dword_1D1413000, v4, OS_LOG_TYPE_INFO, "Starting operation: '%@'", (uint8_t *)&v7, 0xCu);
    }

  }
  +[IMDCKDatabaseManager sharedInstance](IMDCKDatabaseManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "truthDatabase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addOperation:", v3);

}

- (void)sendDeviceIDToCloudKitWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  int v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  void *v24;
  id v25;
  NSObject *v26;
  _QWORD v27[4];
  id v28;
  IMDCKBackupController *v29;
  void (**v30)(id, uint64_t, _QWORD);
  id v31;
  id v32;
  uint8_t buf[4];
  unint64_t v34;
  __int16 v35;
  unint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  -[IMDCKBackupController ckUtilities](self, "ckUtilities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "cloudKitSyncingEnabled");

  if ((v6 & 1) != 0)
  {
    -[IMDCKBackupController readUserDefaultForKey:](self, "readUserDefaultForKey:", CFSTR("IMDCKBackupControllerWrittenQuotaRecordKeyV2"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLValue");

    if (v9)
    {
      if (IMOSLoggingEnabled(v10))
      {
        OSLogHandleForIMFoundationCategory();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "The iCloud quota record has already been written, returning", buf, 2u);
        }

      }
      if (v4)
        v4[2](v4, 1, 0);
      goto LABEL_37;
    }
    v31 = 0;
    v32 = 0;
    -[IMDCKBackupController _deviceIDFromMobileBackupManager:legacyDeviceID:](self, "_deviceIDFromMobileBackupManager:legacyDeviceID:", &v32, &v31);
    v14 = (unint64_t)v32;
    v15 = (unint64_t)v31;
    v16 = IMOSLoggingEnabled(v15);
    if (v14 | v15)
    {
      if (v16)
      {
        OSLogHandleForIMFoundationCategory();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v34 = v14;
          v35 = 2112;
          v36 = v15;
          _os_log_impl(&dword_1D1413000, v17, OS_LOG_TYPE_INFO, "deviceID (deviceUUID) = %@, legacyDevice (deviceUDID) = %@", buf, 0x16u);
        }

      }
      _IMCreatePredicateWithDeviceUDIDAndDeviceUUID((void *)v14, (void *)v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (IMOSLoggingEnabled(v18))
      {
        OSLogHandleForIMFoundationCategory();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v18, "predicateFormat");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v34 = (unint64_t)v20;
          _os_log_impl(&dword_1D1413000, v19, OS_LOG_TYPE_INFO, "Writing grace quota with device IDs: '%@'", buf, 0xCu);

        }
      }
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95010]), "initWithRecordType:predicate:", CFSTR("InitialGraceQuota"), v18);
      if (IMOSLoggingEnabled(v21))
      {
        OSLogHandleForIMFoundationCategory();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v34 = (unint64_t)v21;
          _os_log_impl(&dword_1D1413000, v22, OS_LOG_TYPE_INFO, "created query ok: %@", buf, 0xCu);
        }

      }
      v23 = objc_alloc_init(MEMORY[0x1E0C94F80]);
      objc_msgSend(v23, "setAllowsCellularAccess:", 1);
      objc_msgSend(v23, "setQualityOfService:", 17);
      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95038]), "initWithQuery:", v21);
      objc_msgSend(v24, "setConfiguration:", v23);
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = sub_1D156DDC8;
      v27[3] = &unk_1E922D830;
      v28 = v18;
      v29 = self;
      v30 = v4;
      v25 = v18;
      objc_msgSend(v24, "setQueryCompletionBlock:", v27);
      -[IMDCKBackupController _enqueOperation:](self, "_enqueOperation:", v24);

    }
    else
    {
      if (v16)
      {
        OSLogHandleForIMFoundationCategory();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1413000, v26, OS_LOG_TYPE_INFO, "both device UUID or UDID are nil", buf, 2u);
        }

      }
      if (!v4)
        goto LABEL_36;
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IMDCKBackupControllerErrorDomain"), 0, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, uint64_t, void *))v4)[2](v4, 0, v21);
    }

LABEL_36:
    goto LABEL_37;
  }
  if (IMOSLoggingEnabled(v7))
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "Messages in iCloud is not on, not sending up quota grace request", buf, 2u);
    }

  }
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IMDCKBackupControllerErrorDomain"), 1, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, uint64_t, void *))v4)[2](v4, 0, v13);

  }
LABEL_37:

}

- (id)dateOfLastBackUp
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[IMDCKBackupController createBackupManager](self, "createBackupManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "dateOfLastBackup");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
  }
  else
  {
    v4 = IMOSLoggingEnabled(0);
    if ((_DWORD)v4)
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "BackupManager is nil, no date for last backup", (uint8_t *)&v9, 2u);
      }

    }
    v5 = 0;
  }
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v9 = 138412290;
      v10 = v5;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Date of last backup %@", (uint8_t *)&v9, 0xCu);
    }

  }
  return v5;
}

- (BOOL)checkDatabaseWasRestored
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  const __CFString *v5;
  uint64_t v7;
  uint64_t v8;
  uint8_t buf[4];
  const __CFString *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  v8 = 0;
  v2 = -[IMDCKBackupController _fetchCountOfSyncedCloudKitRecords:totalCount:](self, "_fetchCountOfSyncedCloudKitRecords:totalCount:", &v8, &v7);
  v3 = v7;
  if (IMOSLoggingEnabled(v2))
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = CFSTR("NO");
      *(_DWORD *)buf = 138412802;
      if (v3 > 9)
        v5 = CFSTR("YES");
      v10 = v5;
      v11 = 2048;
      v12 = v7;
      v13 = 1024;
      v14 = 10;
      _os_log_impl(&dword_1D1413000, v4, OS_LOG_TYPE_INFO, "Database is in acceptable restore state: %@ (%lld records found, at least %d expected before we can disable iCloud backups if device is in restore state)", buf, 0x1Cu);
    }

  }
  return v3 > 9;
}

- (id)_debuggingRestoreStateDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  const __CFString *v8;
  __CFString *v9;
  void *v10;

  -[IMDCKBackupController createBackupManager](self, "createBackupManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "restoreState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v6 = (void *)MEMORY[0x1E0CB3940];
      v7 = objc_msgSend(v4, "state");
      if (v7 > 6)
        v8 = &stru_1E92346B0;
      else
        v8 = off_1E922D8B0[v7];
      objc_msgSend(v5, "description");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", CFSTR("Got valid restore state (%@) from MBManager: %@"), v8, v10);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = CFSTR("BackupManager restore state is nil");
    }

  }
  else
  {
    v9 = CFSTR("BackupManager is nil, can't disable iCloud backups");
  }

  return v9;
}

- (BOOL)_canDisableiCloudBackupsAfterRestore
{
  NSObject *v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  unsigned int v10;
  const __CFString *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  unsigned int v17;
  const __CFString *v18;
  int v20;
  const __CFString *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "checking to see if device is restoring…", (uint8_t *)&v20, 2u);
    }

  }
  if (!-[IMDCKBackupController setupAssistantNeedsToRun](self, "setupAssistantNeedsToRun"))
  {
    -[IMDCKBackupController createBackupManager](self, "createBackupManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (!v5)
    {
      if (IMOSLoggingEnabled(0))
      {
        OSLogHandleForIMFoundationCategory();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          LOWORD(v20) = 0;
          _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "BackupManager is nil, can't disable iCloud backups", (uint8_t *)&v20, 2u);
        }

      }
      v4 = 0;
      goto LABEL_38;
    }
    objc_msgSend(v5, "restoreState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = IMOSLoggingEnabled(v7);
    if (v7)
    {
      if (v8)
      {
        OSLogHandleForIMFoundationCategory();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          v10 = objc_msgSend(v7, "state");
          if (v10 > 6)
            v11 = &stru_1E92346B0;
          else
            v11 = off_1E922D8B0[v10];
          objc_msgSend(v7, "description");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = 138412546;
          v21 = v11;
          v22 = 2112;
          v23 = v14;
          _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "Got valid restore state (%@) from MBManager: %@", (uint8_t *)&v20, 0x16u);

        }
      }
      v15 = objc_msgSend(v7, "state");
      if (v15 > 6)
        goto LABEL_36;
      if (((1 << v15) & 0x6E) != 0)
      {
        if (IMOSLoggingEnabled(v15))
        {
          OSLogHandleForIMFoundationCategory();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            v17 = objc_msgSend(v7, "state");
            if (v17 > 6)
              v18 = &stru_1E92346B0;
            else
              v18 = off_1E922D8B0[v17];
            v20 = 138412290;
            v21 = v18;
            _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "Can't disable iCloud backups because restore state is: %@. Will try again later.", (uint8_t *)&v20, 0xCu);
          }

        }
LABEL_36:
        v4 = 0;
        goto LABEL_37;
      }
    }
    else if (v8)
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        LOWORD(v20) = 0;
        _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "BackupManager restore state is nil, checking database directly...", (uint8_t *)&v20, 2u);
      }

    }
    v4 = -[IMDCKBackupController checkDatabaseWasRestored](self, "checkDatabaseWasRestored");
LABEL_37:

LABEL_38:
    return v4;
  }
  return 0;
}

- (id)syncStateDebuggingInfo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  id v31;
  id v32;
  id v33;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDCKBackupController _debuggingRestoreStateDescription](self, "_debuggingRestoreStateDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("restore-state"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IMDCKBackupController setupAssistantNeedsToRun](self, "setupAssistantNeedsToRun"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("setup-assistant-needs-to-run"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IMDCKBackupController checkDatabaseWasRestored](self, "checkDatabaseWasRestored"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("db-has-records"));

  -[IMDCKBackupController dateOfLastBackUp](self, "dateOfLastBackUp");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("last-backup-date"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IMDCKBackupController iCloudBackupsDisabled](self, "iCloudBackupsDisabled"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("icloud-backups-disabled"));

  -[IMDCKBackupController firstSyncDate](self, "firstSyncDate");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    v15 = v13;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  v16 = v15;

  objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("first-sync-date"));
  -[IMDCKBackupController _readCurrentDeviceState](self, "_readCurrentDeviceState");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    v19 = v17;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = (id)objc_claimAutoreleasedReturnValue();
  }
  v20 = v19;

  objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("device-state"));
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDCKBackupController _disabledDirectoryPath](self, "_disabledDirectoryPath");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v33 = 0;
  v31 = 0;
  objc_msgSend(v21, "__im_getItemsRemovedFromiCloudBackupsAtDirectoryPath:outPaths:outRemovedPaths:error:", v22, &v33, &v32, &v31);
  v23 = v33;
  v24 = v32;
  v25 = v31;

  v26 = v24;
  v27 = v26;
  if (v26)
  {
    v28 = v26;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v28 = (id)objc_claimAutoreleasedReturnValue();
  }
  v29 = v28;

  objc_msgSend(v4, "setObject:forKey:", v29, CFSTR("paths-removed-from-backup"));
  return v4;
}

- (void)eventStreamHandler:(id)a3 didReceiveEventWithName:(id)a4 userInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0D37C18]);
  if ((_DWORD)v11)
  {
    if (IMOSLoggingEnabled(v11))
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = 138412546;
        v14 = v9;
        v15 = 2112;
        v16 = v10;
        _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "Handling event with name %@ userInfo %@", (uint8_t *)&v13, 0x16u);
      }

    }
    -[IMDCKBackupController setICloudBackupsDisabled:](self, "setICloudBackupsDisabled:", 0);
  }

}

- (void)setCkUtilities:(id)a3
{
  objc_storeWeak((id *)&self->_ckUtilities, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_ckUtilities);
}

@end

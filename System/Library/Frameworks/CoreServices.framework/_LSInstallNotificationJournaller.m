@implementation _LSInstallNotificationJournaller

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)createInstallJournalDirectoryIfRequired
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_5(&dword_182882000, v0, v1, "Failed to create install journal directory with error: %@", v2);
  OUTLINED_FUNCTION_1();
}

- (_LSInstallNotificationJournaller)initWithCoder:(id)a3
{
  id v4;
  _LSInstallNotificationJournaller *v5;
  uint64_t v6;
  NSString *primaryBundleID;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSMutableArray *journalledNotifications;
  double v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_LSInstallNotificationJournaller;
  v5 = -[_LSInstallNotificationJournaller init](&v15, sel_init);
  if (v5)
  {
    v5->_preliminary = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_preliminary"));
    objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_primaryBundleID"));
    v6 = objc_claimAutoreleasedReturnValue();
    primaryBundleID = v5->_primaryBundleID;
    v5->_primaryBundleID = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ls_decodeObjectOfClasses:forKey:", v10, CFSTR("_journalledNotifications"));
    v11 = objc_claimAutoreleasedReturnValue();
    journalledNotifications = v5->_journalledNotifications;
    v5->_journalledNotifications = (NSMutableArray *)v11;

    v5->_operationType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_operationType"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_timestamp"));
    v5->_timestamp = v13;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 preliminary;
  id v5;

  preliminary = self->_preliminary;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", preliminary, CFSTR("_preliminary"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_primaryBundleID, CFSTR("_primaryBundleID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_journalledNotifications, CFSTR("_journalledNotifications"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_operationType, CFSTR("_operationType"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_timestamp"), self->_timestamp);

}

- (_LSInstallNotificationJournaller)initWithPrimaryBundleID:(id)a3 operation:(unint64_t)a4
{
  id v6;
  _LSInstallNotificationJournaller *v7;
  _LSInstallNotificationJournaller *v8;
  uint64_t v9;
  NSMutableArray *journalledNotifications;
  uint64_t v11;
  NSString *primaryBundleID;
  double v13;
  objc_super v15;

  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_LSInstallNotificationJournaller;
  v7 = -[_LSInstallNotificationJournaller init](&v15, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_preliminary = 1;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = objc_claimAutoreleasedReturnValue();
    journalledNotifications = v8->_journalledNotifications;
    v8->_journalledNotifications = (NSMutableArray *)v9;

    v11 = objc_msgSend(v6, "copy");
    primaryBundleID = v8->_primaryBundleID;
    v8->_primaryBundleID = (NSString *)v11;

    v8->_operationType = a4;
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v8->_timestamp = v13;
  }

  return v8;
}

- (BOOL)isApplicationRegisteredWithbundleID:(id)a3 placeholder:(BOOL)a4
{
  id v5;
  os_unfair_lock_s *v6;
  id v7;
  char v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  BOOL v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v5 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  _LSServer_DatabaseExecutionContext();
  v6 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __84___LSInstallNotificationJournaller_isApplicationRegisteredWithbundleID_placeholder___block_invoke;
  v10[3] = &unk_1E1046778;
  v7 = v5;
  v13 = a4;
  v11 = v7;
  v12 = &v14;
  -[LSDBExecutionContext syncRead:](v6, v10);

  v8 = *((_BYTE *)v15 + 24);
  _Block_object_dispose(&v14, 8);

  return v8;
}

- (BOOL)shouldExpectEntityToExist
{
  unint64_t v3;
  _BOOL4 v4;
  NSObject *v5;

  v3 = -[_LSInstallNotificationJournaller installOperation](self, "installOperation");
  if (v3 >= 9)
  {
    _LSInstallLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[_LSInstallNotificationJournaller shouldExpectEntityToExist].cold.1(self, v5);

    LOBYTE(v4) = 0;
  }
  else
  {
    return (0x7Fu >> v3) & 1;
  }
  return v4;
}

- (BOOL)entityExists
{
  _LSInstallNotificationJournaller *v2;
  _BOOL8 v3;
  void *v4;

  v2 = self;
  v3 = ((-[_LSInstallNotificationJournaller installOperation](self, "installOperation") - 2) & 0xFFFFFFFFFFFFFFFALL) == 0;
  -[_LSInstallNotificationJournaller primaryBundleID](v2, "primaryBundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[_LSInstallNotificationJournaller isApplicationRegisteredWithbundleID:placeholder:](v2, "isApplicationRegisteredWithbundleID:placeholder:", v4, v3);

  return (char)v2;
}

- (BOOL)applicableForCurrentDatabase
{
  _BOOL4 v3;
  _BOOL4 v4;
  int v5;
  int v6;
  _BOOL4 v7;
  BOOL result;
  NSObject *v9;

  v3 = -[_LSInstallNotificationJournaller shouldExpectEntityToExist](self, "shouldExpectEntityToExist");
  v4 = -[_LSInstallNotificationJournaller entityExists](self, "entityExists");
  v5 = !v4;
  if (v3)
    v6 = v4;
  else
    v6 = !v4;
  if (v6 != 1)
    return 0;
  v7 = v4;
  result = 1;
  if ((!v3 | v5) == 1 && (v3 || v7))
  {
    _LSInstallLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[_LSInstallNotificationJournaller applicableForCurrentDatabase].cold.1(v3, v7, v9);

    return 0;
  }
  return result;
}

- (id)synthesizedPreliminaryJournalledNotifications
{
  _BOOL8 v3;
  uint64_t v4;
  _LSJournalledNotification *v5;
  void *v6;
  void *v7;
  _LSJournalledNotification *v8;
  void *v9;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = -[_LSInstallNotificationJournaller installOperation](self, "installOperation") == 8;
  v4 = +[_LSInstallProgressService notificationTypeForOperation:](_LSInstallProgressService, "notificationTypeForOperation:", -[_LSInstallNotificationJournaller installOperation](self, "installOperation"));
  v5 = [_LSJournalledNotification alloc];
  -[_LSInstallNotificationJournaller primaryBundleID](self, "primaryBundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[_LSJournalledNotification initWithNotification:bundleIDs:plugins:options:](v5, "initWithNotification:bundleIDs:plugins:options:", v4, v7, v3, 0);
  v12[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)journalledNotifications
{
  NSMutableArray *v2;

  if (self->_preliminary)
  {
    -[_LSInstallNotificationJournaller synthesizedPreliminaryJournalledNotifications](self, "synthesizedPreliminaryJournalledNotifications");
    v2 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = self->_journalledNotifications;
  }
  return v2;
}

- (id)primaryBundleID
{
  return self->_primaryBundleID;
}

- (unint64_t)installOperation
{
  return self->_operationType;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (id)journalURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend((id)__LSDefaultsGetSharedInstance(), "installJournalDirectoryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%f.%d"), self->_primaryBundleID, *(_QWORD *)&self->_timestamp, self->_operationType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathExtension:", CFSTR("notejournal"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)removeJournalFile
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "journalURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_5(&dword_182882000, a2, v4, "Couldn't remove journal file at %@", v5);

  OUTLINED_FUNCTION_5_1();
}

- (void)_writeJournalUnconditionally
{
  void *v5;
  uint8_t v6[14];
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "journalURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_7();
  v7 = a2;
  _os_log_fault_impl(&dword_182882000, a3, OS_LOG_TYPE_FAULT, "couldn't write data to journal file %@: %@", v6, 0x16u);

  OUTLINED_FUNCTION_18_0();
}

- (void)writePreliminaryJournal
{
  NSString *primaryBundleID;
  NSObject *v5;
  NSObject *v6;
  NSString *v7;
  void *v8;
  void *v9;
  int v10;
  NSString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  primaryBundleID = self->_primaryBundleID;
  _LSInstallLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (primaryBundleID)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7 = self->_primaryBundleID;
      v10 = 138412290;
      v11 = v7;
      _os_log_impl(&dword_182882000, v6, OS_LOG_TYPE_INFO, "writing preliminary journal for %@", (uint8_t *)&v10, 0xCu);
    }

    if (!self->_preliminary)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_LSInstallProgressService.m"), 2224, CFSTR("writing preliminary journal but journaller no longer preliminary?"));

    }
    if (-[NSMutableArray count](self->_journalledNotifications, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_LSInstallProgressService.m"), 2225, CFSTR("writing preliminary journal but more than 0 journalled notifications?"));

    }
    -[_LSInstallNotificationJournaller _writeJournalUnconditionally](self, "_writeJournalUnconditionally");
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_182882000, v6, OS_LOG_TYPE_DEFAULT, "not writing preliminary journal for install operation with no known bundle ID.", (uint8_t *)&v10, 2u);
    }

  }
}

- (void)writeFinalJournal
{
  NSString *primaryBundleID;
  NSObject *v4;
  NSObject *v5;
  NSString *v6;
  NSObject *v7;
  NSString *v8;
  int v9;
  NSString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  primaryBundleID = self->_primaryBundleID;
  _LSInstallLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (primaryBundleID)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v6 = self->_primaryBundleID;
      v9 = 138412290;
      v10 = v6;
      _os_log_impl(&dword_182882000, v5, OS_LOG_TYPE_INFO, "writing final journal for %@", (uint8_t *)&v9, 0xCu);
    }

    self->_preliminary = 0;
    if (!-[NSMutableArray count](self->_journalledNotifications, "count"))
    {
      _LSInstallLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = self->_primaryBundleID;
        v9 = 138412290;
        v10 = v8;
        _os_log_impl(&dword_182882000, v7, OS_LOG_TYPE_DEFAULT, "journal for %@ had no logs but was the final journal... that's suspicious.", (uint8_t *)&v9, 0xCu);
      }

    }
    -[_LSInstallNotificationJournaller _writeJournalUnconditionally](self, "_writeJournalUnconditionally");
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_182882000, v5, OS_LOG_TYPE_DEFAULT, "not writing final journal for install operation with no known bundle ID.", (uint8_t *)&v9, 2u);
    }

  }
}

- (void)setPrimaryBundleID:(id)a3
{
  id v4;
  NSString *primaryBundleID;
  NSObject *v6;
  NSObject *v7;
  NSString *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  primaryBundleID = self->_primaryBundleID;
  _LSInstallLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (primaryBundleID)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[_LSInstallNotificationJournaller setPrimaryBundleID:].cold.1(v7);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = v4;
      _os_log_impl(&dword_182882000, v7, OS_LOG_TYPE_DEFAULT, "Setting bundleID of journaller to %@", (uint8_t *)&v9, 0xCu);
    }

    v8 = (NSString *)objc_msgSend(v4, "copy");
    v7 = self->_primaryBundleID;
    self->_primaryBundleID = v8;
  }

}

- (void)removeJournalAfterNotificationFence
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v3 = (void *)os_transaction_create();
  +[_LSInstallProgressService sharedInstance](_LSInstallProgressService, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __71___LSInstallNotificationJournaller_removeJournalAfterNotificationFence__block_invoke;
  v6[3] = &unk_1E103FCC8;
  v6[4] = self;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "addSendNotificationFenceWithTimeout:fenceBlock:", v6, 60.0);

}

+ (BOOL)shouldJournalNotificationType:(int)a3
{
  return a3 != 3 && a3 != 0;
}

- (void)sendNotification:(int)a3 forApps:(id)a4 withPlugins:(BOOL)a5 options:(id)a6
{
  _BOOL8 v7;
  uint64_t v8;
  id v10;
  _LSJournalledNotification *v11;
  void *v12;
  id v13;

  v7 = a5;
  v8 = *(_QWORD *)&a3;
  v13 = a4;
  v10 = a6;
  if (objc_msgSend((id)objc_opt_class(), "shouldJournalNotificationType:", v8))
  {
    v11 = -[_LSJournalledNotification initWithNotification:bundleIDs:plugins:options:]([_LSJournalledNotification alloc], "initWithNotification:bundleIDs:plugins:options:", v8, v13, v7, v10);
    -[NSMutableArray addObject:](self->_journalledNotifications, "addObject:", v11);

  }
  +[_LSInstallProgressService sharedInstance](_LSInstallProgressService, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sendNotification:forApps:withPlugins:completion:", v8, v13, v7, 0);

}

- (void)sendNotification:(int)a3 forApps:(id)a4 withPlugins:(BOOL)a5
{
  -[_LSInstallNotificationJournaller sendNotification:forApps:withPlugins:options:](self, "sendNotification:forApps:withPlugins:options:", *(_QWORD *)&a3, a4, a5, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_journalledNotifications, 0);
  objc_storeStrong((id *)&self->_primaryBundleID, 0);
}

- (void)shouldExpectEntityToExist
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "installOperation");
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_5(&dword_182882000, a2, v3, "bogus install operation %lu?", v4);
  OUTLINED_FUNCTION_5_1();
}

- (void)applicableForCurrentDatabase
{
  _DWORD v3[2];
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109376;
  v3[1] = a1 & 1;
  v4 = 1024;
  v5 = a2 & 1;
  _os_log_fault_impl(&dword_182882000, log, OS_LOG_TYPE_FAULT, "Unreachable code reached. This is a bug. %d %d", (uint8_t *)v3, 0xEu);
  OUTLINED_FUNCTION_1();
}

- (void)setPrimaryBundleID:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_182882000, log, OS_LOG_TYPE_ERROR, "Attempt to set primary bundle id for journaller that already has a primary bundle ID", v1, 2u);
  OUTLINED_FUNCTION_33();
}

@end

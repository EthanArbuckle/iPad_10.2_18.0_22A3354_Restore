@implementation IMDaemonCoreSpotlightManager

+ (IMDaemonCoreSpotlightManager)sharedManager
{
  if (qword_1ED9362B0 != -1)
    dispatch_once(&qword_1ED9362B0, &unk_1E92296D0);
  return (IMDaemonCoreSpotlightManager *)(id)qword_1ED9362C0;
}

- (int64_t)_batchIndexingIntervalBagValue
{
  return IMBagIntValueWithDefault();
}

- (id)spotlightIndexQueue
{
  void *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  void *v5;

  v2 = (void *)qword_1ED9363E0;
  if (!qword_1ED9363E0)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("IMDCoreSpotlightProcessingQueue", v3);
    v5 = (void *)qword_1ED9363E0;
    qword_1ED9363E0 = (uint64_t)v4;

    v2 = (void *)qword_1ED9363E0;
  }
  return v2;
}

- (void)_reindexResumed
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0D36130], "sharedNotifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D36130], "sharedNotifier");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[IMDaemonCoreSpotlightManager _currentClientState](self, "_currentClientState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D397C8], "reindexReason");
    objc_msgSend(v5, "reindexResumedWithState:reason:", v4, IMCoreSpotlightIndexReasonFromReindexReason());

  }
}

- (void)_reindexPaused
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0D36130], "sharedNotifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D36130], "sharedNotifier");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[IMDaemonCoreSpotlightManager _currentClientState](self, "_currentClientState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D397C8], "reindexReason");
    objc_msgSend(v5, "reindexPausedWithState:reason:", v4, IMCoreSpotlightIndexReasonFromReindexReason());

  }
}

- (void)registerForCoreSpotlightIndexing
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  IMDSpotlightDaemonClient *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD handler[5];
  uint8_t buf[16];

  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "Setting up xpc activity handler for Core Spotlight indexing or donation", buf, 2u);
    }

  }
  v4 = (void *)*MEMORY[0x1E0C80748];
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = sub_1D146CED0;
  handler[3] = &unk_1E9229718;
  handler[4] = self;
  xpc_activity_register("com.apple.messages.spotlightIndexing", v4, handler);
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isSpotlightDaemonDelegateEnabled");

  if (v6)
  {
    v7 = objc_alloc_init(IMDSpotlightDaemonClient);
    -[IMDaemonCoreSpotlightManager setIndexingDelegate:](self, "setIndexingDelegate:", v7);

    -[IMDaemonCoreSpotlightManager indexingDelegate](self, "indexingDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    SpotlightDaemonClientRegister();

    if (IMOSLoggingEnabled(v9))
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "Initialized Spotlight daemon client", buf, 2u);
      }

    }
  }
}

- (void)registerForCoreSpotlightMigration
{
  xpc_object_t v2;
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x1E0C80860], 1);
  xpc_activity_register("com.apple.messages.spotlightMigration", v2, &unk_1E9229758);
  if (IMOSLoggingEnabled(v3))
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1D1413000, v4, OS_LOG_TYPE_INFO, "Registered migration spotlight activity", v5, 2u);
    }

  }
}

- (id)_newSpotlightBatchIndexingXPCCriteria
{
  int64_t v2;
  xpc_object_t v3;

  v2 = -[IMDaemonCoreSpotlightManager _batchIndexingIntervalBagValue](self, "_batchIndexingIntervalBagValue");
  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80888]);
  xpc_dictionary_set_int64(v3, (const char *)*MEMORY[0x1E0C807A8], v2);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E0C80738], 0);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E0C808D0], 0);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E0C80898], 1);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E0C808D8], 1);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E0C808B8], 1);
  return v3;
}

- (void)_indexNextBatchIfNecessaryForActivity:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  const __CFString *v9;
  dispatch_group_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  id v17;
  id v18;
  NSObject *v19;
  _QWORD v20[5];
  id v21;
  _QWORD block[4];
  id v23;
  id v24;
  _QWORD v25[4];
  NSObject *v26;
  _QWORD aBlock[5];
  NSObject *v28;
  uint8_t buf[4];
  const __CFString *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Index next batch request received", buf, 2u);
    }

  }
  v6 = objc_msgSend(MEMORY[0x1E0D397C8], "skipIndexing");
  if ((_DWORD)v6)
  {
    if (IMOSLoggingEnabled(v6))
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = objc_msgSend(MEMORY[0x1E0D397C8], "skipIndexing");
        v9 = CFSTR("NO");
        if (v8)
          v9 = CFSTR("YES");
        *(_DWORD *)buf = 138412290;
        v30 = v9;
        _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Skipping indexing next batch since skipIndexing is set to %@", buf, 0xCu);
      }

    }
  }
  else
  {
    v10 = dispatch_group_create();
    v11 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_1D146DD14;
    aBlock[3] = &unk_1E9228750;
    aBlock[4] = self;
    v12 = v10;
    v28 = v12;
    v13 = _Block_copy(aBlock);
    v25[0] = v11;
    v25[1] = 3221225472;
    v25[2] = sub_1D146DE3C;
    v25[3] = &unk_1E92287A0;
    v26 = v12;
    v14 = v12;
    v15 = _Block_copy(v25);
    dispatch_group_enter(v14);
    -[IMDaemonCoreSpotlightManager spotlightIndexQueue](self, "spotlightIndexQueue");
    v16 = objc_claimAutoreleasedReturnValue();
    block[0] = v11;
    block[1] = 3221225472;
    block[2] = sub_1D146DF54;
    block[3] = &unk_1E92297E0;
    v23 = v13;
    v24 = v15;
    v17 = v15;
    v18 = v13;
    dispatch_async(v16, block);

    -[IMDaemonCoreSpotlightManager spotlightIndexQueue](self, "spotlightIndexQueue");
    v19 = objc_claimAutoreleasedReturnValue();
    v20[0] = v11;
    v20[1] = 3221225472;
    v20[2] = sub_1D146E084;
    v20[3] = &unk_1E9228750;
    v20[4] = self;
    v21 = v4;
    dispatch_group_notify(v14, v19, v20);

  }
}

- (BOOL)_deviceConditionsAllowsSpotlightIndexingForActivity:(id)a3
{
  id v4;
  void *v5;
  _BOOL8 v6;
  _BOOL4 v7;
  NSObject *v8;
  const __CFString *v9;
  NSObject *v10;
  _BOOL8 v11;
  NSObject *v12;
  BOOL v13;
  void *v15;
  int v16;
  uint64_t v17;
  NSObject *v18;
  int v19;
  const char *v20;
  __int16 v21;
  const __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = -[IMDaemonCoreSpotlightManager _shouldDeferXPCActivity:](self, "_shouldDeferXPCActivity:", v4);
    v7 = v6;
    v4 = (id)IMOSLoggingEnabled(v6);
    if ((_DWORD)v4)
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = CFSTR("NO");
        if (v7)
          v9 = CFSTR("YES");
        v19 = 136315394;
        v20 = "-[IMDaemonCoreSpotlightManager _deviceConditionsAllowsSpotlightIndexingForActivity:]";
        v21 = 2112;
        v22 = v9;
        _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "%s xpc_activity_should_defer should defer %@", (uint8_t *)&v19, 0x16u);
      }

    }
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isLowPowerModeEnabled");

      if (!v16)
      {
        v13 = 1;
        goto LABEL_19;
      }
      v4 = (id)IMOSLoggingEnabled(v17);
      if ((_DWORD)v4)
      {
        OSLogHandleForIMFoundationCategory();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          v19 = 136315138;
          v20 = "-[IMDaemonCoreSpotlightManager _deviceConditionsAllowsSpotlightIndexingForActivity:]";
          _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, "%s deferring activity due to LPM", (uint8_t *)&v19, 0xCu);
        }

      }
    }
  }
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "Setting xpc_activity_t to XPC_ACTIVITY_STATE_DEFER because conditions are no longer met", (uint8_t *)&v19, 2u);
    }

  }
  v11 = -[IMDaemonCoreSpotlightManager _deferXPCActivity:](self, "_deferXPCActivity:", v5);
  if (!v11 && IMOSLoggingEnabled(v11))
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "Error forcing xpc_activity_t to XPC_ACTIVITY_STATE_DEFER", (uint8_t *)&v19, 2u);
    }

  }
  v13 = 0;
LABEL_19:

  return v13;
}

- (BOOL)_needsReindexingDueToVersionMismatch
{
  void *v3;
  char v4;
  _BOOL8 v5;
  _BOOL4 v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[IMDaemonCoreSpotlightManager _currentClientState](self, "_currentClientState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "needsReindex");
  v5 = -[IMDaemonCoreSpotlightManager _needsDeferredIndexing](self, "_needsDeferredIndexing");
  v6 = v5;
  if (IMOSLoggingEnabled(v5))
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = objc_msgSend(v3, "indexRevision");
      v9 = objc_msgSend(MEMORY[0x1E0D39B00], "_latestIndexRevision");
      v10 = CFSTR("NO");
      v12 = 134218498;
      v13 = v8;
      if (v6)
        v10 = CFSTR("YES");
      v14 = 2048;
      v15 = v9;
      v16 = 2112;
      v17 = v10;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Current index version %lld expected %lld. Needs Deferred Indexing %@", (uint8_t *)&v12, 0x20u);
    }

  }
  return v6 | v4;
}

- (id)_currentClientState
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_1D146E894;
  v10 = sub_1D146E8A4;
  v11 = 0;
  objc_msgSend(MEMORY[0x1E0D360F0], "synchronousDatabase");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1D146E8AC;
  v5[3] = &unk_1E9229808;
  v5[4] = &v6;
  objc_msgSend(v2, "fetchSpotlightClientStateWithCompletion:", v5);

  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (int64_t)_currentSpotlightVersion
{
  void *v2;
  int64_t v3;

  -[IMDaemonCoreSpotlightManager _currentClientState](self, "_currentClientState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "indexRevision");

  return v3;
}

- (int64_t)_expectedSpotlightVersion
{
  return objc_msgSend(MEMORY[0x1E0D39B00], "_latestIndexRevision");
}

- (BOOL)_needsDeferredIndexing
{
  return MEMORY[0x1E0DE7D20](MEMORY[0x1E0D397C8], sel_needsDeferredIndexing);
}

- (void)_checkSpotlightClientStateForReindexIfNeededWithAttempts:(int64_t)a3
{
  NSObject *v3;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  uint8_t buf[16];

  if (a3 >= 5)
  {
    IMLogHandleForCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      sub_1D1666A18(v3);
LABEL_4:

    return;
  }
  v5 = objc_msgSend(MEMORY[0x1E0D397C8], "needsIndexing");
  if ((_DWORD)v5)
  {
    if (IMOSLoggingEnabled(v5))
    {
      OSLogHandleForIMFoundationCategory();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "CS already needs reindexing, not checking client state", buf, 2u);
      }
      goto LABEL_4;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D360F0], "database");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = sub_1D146EAB4;
    v7[3] = &unk_1E9229870;
    v7[4] = self;
    objc_msgSend(v6, "validateSpotlightClientStateWithCompletion:", v7);

  }
}

- (void)_checkSpotlightClientStateForReindexIfNeeded
{
  MEMORY[0x1E0DE7D20](self, sel__checkSpotlightClientStateForReindexIfNeededWithAttempts_);
}

- (void)_checkSpotlightIndexCountForReindexIfNeeded
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[5];
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (IMSharedHelperSpotlightIndexingPreference() != 1)
  {
    IMGetCachedDomainValueForKey();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3
      && (objc_msgSend(MEMORY[0x1E0C99D68], "date"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v4, "timeIntervalSinceDate:", v3),
          v6 = fabs(v5),
          v4,
          v6 < 86400.0))
    {
      if (IMOSLoggingEnabled(v7))
      {
        OSLogHandleForIMFoundationCategory();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v14 = v3;
          _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "Last record recheck date is %@, not checking again", buf, 0xCu);
        }
        goto LABEL_13;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      IMSetDomainValueForKey();

      v9 = objc_msgSend(MEMORY[0x1E0D397C8], "needsIndexing");
      if ((_DWORD)v9)
      {
        if (IMOSLoggingEnabled(v9))
        {
          OSLogHandleForIMFoundationCategory();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "CS already needs reindexing, not checking record counts", buf, 2u);
          }
LABEL_13:

        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0D360F0], "database");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = sub_1D146EF1C;
        v12[3] = &unk_1E92298E0;
        v12[4] = self;
        objc_msgSend(v11, "checkSpotlightIndexCountWithCompletion:", v12);

      }
    }

  }
}

- (BOOL)_shouldDeferXPCActivity:(id)a3
{
  return xpc_activity_should_defer((xpc_activity_t)a3);
}

- (BOOL)_deferXPCActivity:(id)a3
{
  return a3 && xpc_activity_set_state((xpc_activity_t)a3, 3);
}

- (IMDSpotlightDaemonClient)indexingDelegate
{
  return self->_indexingDelegate;
}

- (void)setIndexingDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_indexingDelegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexingDelegate, 0);
}

@end

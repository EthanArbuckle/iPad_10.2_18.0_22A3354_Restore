@implementation IMDCKRampManager

+ (id)sharedInstance
{
  if (qword_1ED935CD0 != -1)
    dispatch_once(&qword_1ED935CD0, &unk_1E922CAB0);
  return (id)qword_1ED935E08;
}

- (IMDCKRampManager)init
{
  IMDCKRampManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *ckQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IMDCKRampManager;
  v2 = -[IMDCKRampManager init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.private.Messages.IMDCKRampManager", 0);
    ckQueue = v2->_ckQueue;
    v2->_ckQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[IMDCKRampManager retryTimer](self, "retryTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[IMDCKRampManager retryTimer](self, "retryTimer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

    -[IMDCKRampManager setRetryTimer:](self, "setRetryTimer:", 0);
  }
  v5.receiver = self;
  v5.super_class = (Class)IMDCKRampManager;
  -[IMDCKRampManager dealloc](&v5, sel_dealloc);
}

- (id)_CKUtilitiesSharedInstance
{
  return +[IMDCKUtilities sharedInstance](IMDCKUtilities, "sharedInstance");
}

- (void)_scheduleOperation:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  +[IMDCKDatabaseManager sharedInstance](IMDCKDatabaseManager, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "truthDatabase");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addOperation:", v3);

}

- (id)_rampUpRecordID
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95088]), "initWithZoneName:", CFSTR("metadata_zone"));
  v3 = objc_alloc(MEMORY[0x1E0C95070]);
  objc_msgSend(v2, "zoneID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithRecordName:zoneID:", CFSTR("metadata_rampstate_v3"), v4);

  return v5;
}

- (void)_fetchLatestRampStateFromCK:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *, void *);
  void *v20;
  IMDCKRampManager *v21;
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C94F80]);
  objc_msgSend(v5, "setAllowsCellularAccess:", 1);
  objc_msgSend(v5, "setQualityOfService:", 17);
  v6 = objc_alloc(MEMORY[0x1E0C94E18]);
  -[IMDCKRampManager _rampUpRecordID](self, "_rampUpRecordID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  IMSingleObjectArray();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithRecordIDs:", v8);

  if (IMOSLoggingEnabled(objc_msgSend(v9, "setDesiredKeys:", &unk_1E9271940)))
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v9, "operationID");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "desiredKeys");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v24 = v11;
      v25 = 2112;
      v26 = v12;
      _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "Starting ramp operation %@ Desired keys %@", buf, 0x16u);

    }
  }
  v13 = objc_alloc_init(MEMORY[0x1E0C94F88]);
  objc_msgSend(v13, "setName:", CFSTR("Sync.fetch.RampState"));
  objc_msgSend(v9, "setGroup:", v13);
  objc_msgSend(v9, "setConfiguration:", v5);
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = sub_1D1536B68;
  v20 = &unk_1E9229198;
  v21 = self;
  v14 = v4;
  v22 = v14;
  objc_msgSend(v9, "setFetchRecordsCompletionBlock:", &v17);
  if (IMOSLoggingEnabled(objc_msgSend(v9, "setPerRecordCompletionBlock:", &unk_1E922CAF0, v17, v18, v19, v20, v21)))
  {
    OSLogHandleForIMFoundationCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v9, "operationID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v24 = v16;
      _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "Attempting to fetch ramp state from CloudKit with operation %@", buf, 0xCu);

    }
  }
  -[IMDCKRampManager _scheduleOperation:](self, "_scheduleOperation:", v9);

}

- (void)_writeRampStatePromoted:(BOOL)a3 hadServerError:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  const __CFString *v11;
  const __CFString *v12;
  int v13;
  const __CFString *v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v4 = a4;
  v5 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0D37B10]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0D37B18]);

  if (IMOSLoggingEnabled(v9))
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = CFSTR("NO");
      if (v5)
        v12 = CFSTR("YES");
      else
        v12 = CFSTR("NO");
      if (v4)
        v11 = CFSTR("YES");
      v13 = 138412546;
      v14 = v12;
      v15 = 2112;
      v16 = v11;
      _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "Writing cachedRampState featurePromoted(%@) fetchHadServerError(%@)", (uint8_t *)&v13, 0x16u);
    }

  }
  IMSetDomainValueForKey();

}

- (void)_persistRampFetchServerError:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  IMGetCachedDomainValueForKey();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v6, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0D37B18]);

  IMSetDomainValueForKey();
}

- (void)_performRampCheckWithRetryAfter:(double)a3 recordFetchedCompletionBlock:(id)a4
{
  id v6;
  void *v7;
  char v8;
  uint64_t v9;
  int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  IMDCKRampManager *v22;
  id v23;
  uint8_t buf[4];
  double v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[IMDCKRampManager retryTimer](self, "retryTimer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isValid");

  v10 = IMOSLoggingEnabled(v9);
  if ((v8 & 1) != 0)
  {
    if (v10)
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        -[IMDCKRampManager retryTimer](self, "retryTimer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "fireDate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v25 = *(double *)&v13;
        _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Not setting up new retryAfter, last one is firing at %@", buf, 0xCu);

      }
    }
  }
  else
  {
    if (v10)
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v25 = a3;
        _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "scheduling new timer with retryAfter %f", buf, 0xCu);
      }

    }
    v15 = (void *)MEMORY[0x1E0C99E88];
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = sub_1D1537418;
    v21 = &unk_1E922CB18;
    v22 = self;
    v23 = v6;
    objc_msgSend(v15, "timerWithTimeInterval:repeats:block:", 0, &v18, a3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDCKRampManager setRetryTimer:](self, "setRetryTimer:", v16, v18, v19, v20, v21, v22);
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addTimer:forMode:", v16, *MEMORY[0x1E0C99860]);

  }
}

- (void)fetchLatestRampStateFromCK:(id)a3
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  int v8;
  NSObject *v9;
  id *v10;
  id v11;
  NSObject *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD block[4];
  id v17;
  uint8_t buf[16];

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D39B78], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isUnderFirstDataProtectionLock");

  v8 = IMOSLoggingEnabled(v7);
  if (v6)
  {
    if (v8)
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "Not Requesting ramp state. Is under first unlock.", buf, 2u);
      }

    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1D15376E4;
    block[3] = &unk_1E9228700;
    v10 = &v17;
    v17 = v4;
    v11 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  else
  {
    if (v8)
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "Request to fetch ramp state", buf, 2u);
      }

    }
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = sub_1D1537700;
    v14[3] = &unk_1E922CB68;
    v10 = &v15;
    v14[4] = self;
    v15 = v4;
    v13 = v4;
    -[IMDCKRampManager cachedRampState:](self, "cachedRampState:", v14);
  }

}

- (void)cachedRampState:(id)a3
{
  void (**v3)(id, uint64_t, uint64_t);
  uint64_t AppBooleanValue;
  BOOL v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  const __CFString *v13;
  const __CFString *v14;
  NSObject *v16;
  Boolean keyExistsAndHasValidFormat;
  uint8_t buf[4];
  const __CFString *v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = (void (**)(id, uint64_t, uint64_t))a3;
  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("RampStateOverride"), (CFStringRef)*MEMORY[0x1E0D37950], &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v5 = (_DWORD)AppBooleanValue == 0;
  else
    v5 = 1;
  if (v5)
  {
    IMGetCachedDomainValueForKey();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D37B10]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "BOOLValue");

    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D37B18]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "BOOLValue");

    if (IMOSLoggingEnabled(v11))
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = CFSTR("NO");
        if ((_DWORD)v8)
          v14 = CFSTR("YES");
        else
          v14 = CFSTR("NO");
        if ((_DWORD)v10)
          v13 = CFSTR("YES");
        *(_DWORD *)buf = 138412546;
        v19 = v14;
        v20 = 2112;
        v21 = v13;
        _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "cachedRampState featurePromoted(%@) fetchHadServerError(%@)", buf, 0x16u);
      }

    }
    if (v3)
      v3[2](v3, v8, v10);

  }
  else
  {
    if (IMOSLoggingEnabled(AppBooleanValue))
    {
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "Defaults override, returning YES", buf, 2u);
      }

    }
    if (v3)
      v3[2](v3, 1, 0);
  }

}

- (OS_dispatch_queue)ckQueue
{
  return self->_ckQueue;
}

- (NSTimer)retryTimer
{
  return self->_retryTimer;
}

- (void)setRetryTimer:(id)a3
{
  objc_storeStrong((id *)&self->_retryTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retryTimer, 0);
  objc_storeStrong((id *)&self->_ckQueue, 0);
}

@end

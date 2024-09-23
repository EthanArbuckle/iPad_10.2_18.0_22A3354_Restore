@implementation ICCloudContext

- (id)readinessLoggingDescription
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[ICCloudContext accountStatus](self, "accountStatus");
  CKStringFromAccountStatus();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("accountStatus=%@ syncDisabledByServer=%d accountAvailable=%d"), v4, -[ICCloudContext syncDisabledByServer](self, "syncDisabledByServer"), -[ICCloudContext isCloudKitAccountAvailable](self, "isCloudKitAccountAvailable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)syncWithReason:(id)a3 uploadUnsyncedChanges:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  void (**v9)(id, void *);
  NSObject *v10;
  uint64_t v11;
  BOOL v12;
  os_log_t v13;
  os_log_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  _QWORD v20[5];
  void (**v21)(id, void *);
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v6 = a4;
  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, void *))a5;
  v10 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[ICCloudContext syncWithReason:uploadUnsyncedChanges:completionHandler:].cold.2();

  if (!-[ICCloudContext isReadyToSync](self, "isReadyToSync"))
  {
    v12 = -[ICCloudContext isCloudKitAccountAvailable](self, "isCloudKitAccountAvailable");
    v13 = os_log_create("com.apple.notes", "Cloud");
    v14 = v13;
    if (v12)
    {
      v15 = v13;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        -[ICCloudContext readinessLoggingDescription](self, "readinessLoggingDescription");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v23 = v16;
        _os_log_impl(&dword_1BD918000, v15, OS_LOG_TYPE_DEFAULT, "Trying to sync while not ready <%@>", buf, 0xCu);

      }
      objc_msgSend((id)objc_opt_class(), "errorForDisabledCloudSyncing");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
        goto LABEL_28;
    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        -[ICCloudContext syncWithReason:uploadUnsyncedChanges:completionHandler:].cold.1();

      v17 = 0;
      if (!v9)
        goto LABEL_28;
    }
LABEL_27:
    v9[2](v9, v17);
LABEL_28:

    goto LABEL_29;
  }
  if (!-[ICCloudContext syncOnlyIfReachable](self, "syncOnlyIfReachable")
    || -[ICCloudContext isInternetReachable](self, "isInternetReachable"))
  {
    if (-[ICCloudContext isFetchingEnabled](self, "isFetchingEnabled"))
    {
      if (-[ICCloudContext syncOnlyIfReachable](self, "syncOnlyIfReachable"))
        v11 = 0;
      else
        v11 = 2;
      -[ICCloudContext setDiscretionaryNetworkBehavior:](self, "setDiscretionaryNetworkBehavior:", v11);
      -[ICCloudContext _syncWithReason:uploadUnsyncedChanges:completionHandler:](self, "_syncWithReason:uploadUnsyncedChanges:completionHandler:", v8, v6, v9);
    }
    else
    {
      v18 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BD918000, v18, OS_LOG_TYPE_INFO, "Trying to sync with fetching disabled, so only pushing", buf, 2u);
      }

      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __73__ICCloudContext_syncWithReason_uploadUnsyncedChanges_completionHandler___block_invoke;
      v20[3] = &unk_1E76CDA20;
      v20[4] = self;
      v21 = v9;
      -[ICCloudContext processAllCloudObjectsWithCompletionHandler:](self, "processAllCloudObjectsWithCompletionHandler:", v20);

    }
    goto LABEL_29;
  }
  v19 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BD918000, v19, OS_LOG_TYPE_INFO, "Trying to sync with no network connection", buf, 2u);
  }

  if (v9)
  {
    objc_msgSend((id)objc_opt_class(), "errorForDisabledCloudSyncing");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_27;
  }
LABEL_29:

}

- (void)syncWithReason:uploadUnsyncedChanges:completionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_2(&dword_1BD918000, v0, v1, "Asked to sync with reason: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (BOOL)syncDisabledByServer
{
  return self->_syncDisabledByServer;
}

- (BOOL)isReadyToSync
{
  return (-[ICCloudContext accountStatus](self, "accountStatus") == 1
       || !-[ICCloudContext accountStatus](self, "accountStatus"))
      && !-[ICCloudContext syncDisabledByServer](self, "syncDisabledByServer")
      && -[ICCloudContext isCloudKitAccountAvailable](self, "isCloudKitAccountAvailable");
}

- (int64_t)accountStatus
{
  void *v2;
  int64_t v3;

  objc_msgSend(MEMORY[0x1E0D64188], "sharedAppGroupDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("CloudKitAccountStatus"));

  return v3;
}

+ (id)errorForDisabledCloudSyncing
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB35C8];
  v6 = *MEMORY[0x1E0CB2D50];
  v7[0] = CFSTR("Cloud syncing is not enabled.");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("com.apple.notes.cloud"), 1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)updateConfiguration:(id)a3
{
  id v3;
  void (**v4)(void *, void *);
  void *v5;
  void *v6;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __38__ICCloudContext_updateConfiguration___block_invoke;
  aBlock[3] = &unk_1E76CD928;
  aBlock[4] = self;
  v3 = a3;
  v4 = (void (**)(void *, void *))_Block_copy(aBlock);
  objc_opt_class();
  objc_msgSend(v3, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  ICDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v4[2](v4, v6);
  else
    +[ICCloudConfiguration loadSharedConfigurationWithCompletionHandler:](ICCloudConfiguration, "loadSharedConfigurationWithCompletionHandler:", v4);

}

void __38__ICCloudContext_updateConfiguration___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "disableCloudSyncingIfCurrentVersionNotSupported:", v4);
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v4, "throttlingPolicy");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "updateSelectorDelayers:", v6);
}

- (void)disableCloudSyncingIfCurrentVersionNotSupported:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[3];

  objc_msgSend(a3, "minimumClientVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsSeparatedByString:", CFSTR(","));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") != 3)
  {
    v13 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[ICCloudContext disableCloudSyncingIfCurrentVersionNotSupported:].cold.2();
    goto LABEL_9;
  }
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (int)objc_msgSend(v6, "intValue");

  objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (int)objc_msgSend(v8, "intValue");

  objc_msgSend(v5, "objectAtIndexedSubscript:", 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (int)objc_msgSend(v10, "intValue");

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v7;
  v14[1] = v9;
  v14[2] = v11;
  LODWORD(v7) = objc_msgSend(v12, "isOperatingSystemAtLeastVersion:", v14);

  if (!(_DWORD)v7)
  {
    -[ICCloudContext setSyncDisabledByServer:](self, "setSyncDisabledByServer:", 1);
    v13 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[ICCloudContext disableCloudSyncingIfCurrentVersionNotSupported:].cold.1();

LABEL_9:
    goto LABEL_10;
  }
  -[ICCloudContext setSyncDisabledByServer:](self, "setSyncDisabledByServer:", 0);
LABEL_10:

}

- (void)setSyncDisabledByServer:(BOOL)a3
{
  self->_syncDisabledByServer = a3;
}

- (void)updateSelectorDelayers:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  ICCloudContext *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  objc_opt_class();
  ICDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_opt_class();
    ICDynamicCast();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    objc_msgSend(v5, "object");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      +[ICCloudConfiguration sharedConfiguration](ICCloudConfiguration, "sharedConfiguration");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "throttlingPolicy");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  objc_msgSend(v4, "batchInterval");
  v9 = v8;
  objc_msgSend(v4, "maximumBatchIntervalFactor");
  v11 = v10;
  v12 = self;
  objc_sync_enter(v12);
  -[ICCloudContext processingSelectorDelayer](v12, "processingSelectorDelayer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v9 * v11;

  if (!v13)
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D64268]), "initWithTarget:selector:delay:maximumDelay:callOnMainThread:", v12, sel_processPendingCloudObjects, 1, v9, v14);
    -[ICCloudContext setProcessingSelectorDelayer:](v12, "setProcessingSelectorDelayer:", v15);

  }
  objc_sync_exit(v12);

  -[ICCloudContext processingSelectorDelayer](v12, "processingSelectorDelayer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setDelay:", v9);

  -[ICCloudContext processingSelectorDelayer](v12, "processingSelectorDelayer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setMaximumDelay:", v14);

  -[ICCloudContext processingSelectorDelayer](v12, "processingSelectorDelayer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isScheduledToFire");

  if (v19)
  {
    -[ICCloudContext processingSelectorDelayer](v12, "processingSelectorDelayer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "cancelPreviousFireRequests");

    -[ICCloudContext processingSelectorDelayer](v12, "processingSelectorDelayer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "requestFire");

  }
}

- (ICSelectorDelayer)processingSelectorDelayer
{
  return (ICSelectorDelayer *)objc_getProperty(self, a2, 112, 1);
}

- (void)setSyncOnlyIfReachable:(BOOL)a3
{
  self->_syncOnlyIfReachable = a3;
}

- (void)setSubscribedSubscriptionIDs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (void)setRetryCountsByOperationType:(id)a3
{
  objc_storeStrong((id *)&self->_retryCountsByOperationType, a3);
}

- (void)setQualityOfService:(int64_t)a3
{
  self->_qualityOfService = a3;
}

- (void)setProcessingSelectorDelayer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (void)setProcessingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_processingQueue, a3);
}

- (void)setOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_operationQueue, a3);
}

- (void)setOperationIDsBeforeEnqueuingLongLivedOperations:(id)a3
{
  objc_storeStrong((id *)&self->_operationIDsBeforeEnqueuingLongLivedOperations, a3);
}

- (void)setObjectIDsToRetry:(id)a3
{
  objc_storeStrong((id *)&self->_objectIDsToRetry, a3);
}

- (void)setObjectIDsToProcess:(id)a3
{
  objc_storeStrong((id *)&self->_objectIDsToProcess, a3);
}

- (void)setNeedsToUpdateSubscriptions:(BOOL)a3
{
  self->_needsToUpdateSubscriptions = a3;
}

- (void)setFetchingEnabled:(BOOL)a3
{
  self->_fetchingEnabled = a3;
}

- (void)setEnableLongLivedOperations:(BOOL)a3
{
  self->_enableLongLivedOperations = a3;
}

- (void)setDiscretionaryNetworkBehavior:(unint64_t)a3
{
  self->_discretionaryNetworkBehavior = a3;
}

- (void)setDisabledInternal:(BOOL)a3
{
  self->_disabledInternal = a3;
}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
}

- (void)setDisableAutomaticallyRetryNetworkFailures:(BOOL)a3
{
  self->_disableAutomaticallyRetryNetworkFailures = a3;
}

- (void)setDidEnqueueLongLivedOperations:(BOOL)a3
{
  self->_didEnqueueLongLivedOperations = a3;
}

- (void)setDidAddObservers:(BOOL)a3
{
  self->_didAddObservers = a3;
}

- (void)setContainersCreationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_containersCreationQueue, a3);
}

- (void)setAccountZoneIDsNeedingToBeSaved:(id)a3
{
  objc_storeStrong((id *)&self->_accountZoneIDsNeedingToBeSaved, a3);
}

- (void)loadZoneFetchState
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "accountZoneIDsNeedingFetchChanges");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Loaded zone fetch state: zonesNeedingFetchChanges=%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

- (void)setAccountZoneIDsNeedingFetchChanges:(id)a3
{
  objc_storeStrong((id *)&self->_accountZoneIDsNeedingFetchChanges, a3);
}

- (void)setAccountZoneIDsFetchingChanges:(id)a3
{
  objc_storeStrong((id *)&self->_accountZoneIDsFetchingChanges, a3);
}

- (NSMutableDictionary)accountZoneIDsNeedingFetchChanges
{
  return self->_accountZoneIDsNeedingFetchChanges;
}

void __36__ICCloudContext_loadZoneFetchState__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "removeObjectForKey:", CFSTR("CloudKitZonesNeedingFetchChanges"));

}

- (void)syncWithReason:(id)a3 completionHandler:(id)a4
{
  -[ICCloudContext syncWithReason:uploadUnsyncedChanges:completionHandler:](self, "syncWithReason:uploadUnsyncedChanges:completionHandler:", a3, 1, a4);
}

- (void)setCloudContextDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_cloudContextDelegate, a3);
}

- (void)setCloudAnalyticsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_cloudAnalyticsDelegate, a3);
}

+ (ICCloudContext)sharedContext
{
  if (sharedContext_onceToken != -1)
    dispatch_once(&sharedContext_onceToken, &__block_literal_global_54);
  return (ICCloudContext *)(id)sharedContext_sCloudContext;
}

void __31__ICCloudContext_sharedContext__block_invoke()
{
  ICCloudContext *v0;
  void *v1;

  v0 = -[ICCloudContext initWithDelegate:]([ICCloudContext alloc], "initWithDelegate:", 0);
  v1 = (void *)sharedContext_sCloudContext;
  sharedContext_sCloudContext = (uint64_t)v0;

}

+ (id)newNotesContainer
{
  return (id)objc_msgSend(a1, "newNotesContainerForAccountID:", 0);
}

+ (id)newNotesContainerForAccountID:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  char v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (ICIsSandboxModeEnabled())
    v4 = 2;
  else
    v4 = 1;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94C40]), "initWithContainerIdentifier:environment:", CFSTR("com.apple.notes"), v4);
  v6 = objc_alloc_init(MEMORY[0x1E0C94C50]);
  if (objc_msgSend(v3, "length"))
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C94B98]), "initWithAccountID:", v3);
    objc_msgSend(v6, "setAccountOverrideInfo:", v7);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94C28]), "initWithContainerID:options:", v5, v6);
    v9 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v24 = 138412290;
      v25 = v3;
      _os_log_impl(&dword_1BD918000, v9, OS_LOG_TYPE_DEFAULT, "Created new container for account ID %@", (uint8_t *)&v24, 0xCu);
    }

  }
  else
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94C28]), "initWithContainerID:", v5);
    v7 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v24) = 0;
      _os_log_impl(&dword_1BD918000, v7, OS_LOG_TYPE_DEFAULT, "Created new default container", (uint8_t *)&v24, 2u);
    }
  }

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v24 = 138412290;
    v25 = v11;
    _os_log_impl(&dword_1BD918000, v12, OS_LOG_TYPE_DEFAULT, "BundleIDDebug: bundleIdentifier is %@", (uint8_t *)&v24, 0xCu);
  }

  ICNotesAppBundleIdentifier();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v11, "hasPrefix:", v13);

  if ((v14 & 1) == 0)
  {
    v15 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      ICNotesAppBundleIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138412290;
      v25 = v16;
      _os_log_impl(&dword_1BD918000, v15, OS_LOG_TYPE_DEFAULT, "BundleIDDebug: bundleIdentifier does not have prefix %@, so updating bundleID", (uint8_t *)&v24, 0xCu);

    }
    ICNotesAppBundleIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "options");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setApplicationBundleIdentifierOverrideForContainerAccess:", v17);

    ICNotesAppBundleIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "options");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setApplicationBundleIdentifierOverrideForNetworkAttribution:", v19);

    ICNotesAppBundleIdentifier();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "options");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setApplicationBundleIdentifierOverrideForPushTopicGeneration:", v21);

  }
  return v8;
}

- (ICCloudContext)initWithDelegate:(id)a3
{
  id v4;
  ICCloudContext *v5;
  ICCloudContext *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  NSObject *v11;
  dispatch_queue_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  dispatch_time_t v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(uint64_t);
  void *v41;
  id v42;
  id location;
  objc_super v44;

  v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)ICCloudContext;
  v5 = -[ICCloudContext init](&v44, sel_init);
  v6 = v5;
  if (v5)
  {
    -[ICCloudContext setCloudContextDelegate:](v5, "setCloudContextDelegate:", v4);
    -[ICCloudContext setSyncOnlyIfReachable:](v6, "setSyncOnlyIfReachable:", 1);
    v7 = (void *)objc_opt_new();
    -[ICCloudContext setOperationQueue:](v6, "setOperationQueue:", v7);

    -[ICCloudContext operationQueue](v6, "operationQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setMaxConcurrentOperationCount:", 10);

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("com.apple.notes.cloud", v9);
    -[ICCloudContext setProcessingQueue:](v6, "setProcessingQueue:", v10);

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("com.apple.notes.cloud.container-creation", v11);
    -[ICCloudContext setContainersCreationQueue:](v6, "setContainersCreationQueue:", v12);

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCloudContext setObjectIDsToProcess:](v6, "setObjectIDsToProcess:", v13);

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCloudContext setAccountZoneIDsNeedingToBeSaved:](v6, "setAccountZoneIDsNeedingToBeSaved:", v14);

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCloudContext setObjectIDsToRetry:](v6, "setObjectIDsToRetry:", v15);

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCloudContext setRetryCountsByOperationType:](v6, "setRetryCountsByOperationType:", v16);

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCloudContext setSubscribedSubscriptionIDs:](v6, "setSubscribedSubscriptionIDs:", v17);

    -[ICCloudContext setNeedsToUpdateSubscriptions:](v6, "setNeedsToUpdateSubscriptions:", 1);
    v18 = -[ICCloudContext hasNoteContextOptions:](v6, "hasNoteContextOptions:", 16);
    -[ICCloudContext setDisabled:](v6, "setDisabled:", !v18);
    -[ICCloudContext setDisabledInternal:](v6, "setDisabledInternal:", 0);
    -[ICCloudContext setQualityOfService:](v6, "setQualityOfService:", 17);
    -[ICCloudContext setDiscretionaryNetworkBehavior:](v6, "setDiscretionaryNetworkBehavior:", 0);
    -[ICCloudContext setEnableLongLivedOperations:](v6, "setEnableLongLivedOperations:", -[ICCloudContext hasNoteContextOptions:](v6, "hasNoteContextOptions:", 0x100000) ^ 1);
    -[ICCloudContext setDisableAutomaticallyRetryNetworkFailures:](v6, "setDisableAutomaticallyRetryNetworkFailures:", 0);
    -[ICCloudContext setFetchingEnabled:](v6, "setFetchingEnabled:", -[ICCloudContext hasNoteContextOptions:](v6, "hasNoteContextOptions:", 0x80000));
    -[ICCloudContext setDidEnqueueLongLivedOperations:](v6, "setDidEnqueueLongLivedOperations:", 0);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCloudContext setOperationIDsBeforeEnqueuingLongLivedOperations:](v6, "setOperationIDsBeforeEnqueuingLongLivedOperations:", v19);

    objc_msgSend(MEMORY[0x1E0D64210], "currentConfiguration");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "resetsCloud");

    if (v21)
    {
      -[ICCloudContext viewContext](v6, "viewContext");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      +[ICAccount cloudKitAccountInContext:](ICAccount, "cloudKitAccountInContext:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        -[ICCloudContext resetZoneForCloudAccount:withReason:](v6, "resetZoneForCloudAccount:withReason:", v23, CFSTR("LaunchArgument"));
      }
      else
      {
        v24 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
          -[ICCloudContext initWithDelegate:].cold.1();

      }
    }
    -[ICCloudContext loadZoneFetchState](v6, "loadZoneFetchState");
    if (v18)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = *MEMORY[0x1E0D64498];
      objc_msgSend(MEMORY[0x1E0D64250], "sharedReachabilityForInternetConnection");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addObserver:selector:name:object:", v6, sel_reachabilityChanged_, v26, v27);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "addObserver:selector:name:object:", v6, sel_contextDidSaveOrMerge_, *MEMORY[0x1E0C978A8], 0);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "addObserver:selector:name:object:", v6, sel_contextDidSaveOrMerge_, *MEMORY[0x1E0C97898], 0);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "addObserver:selector:name:object:", v6, sel_cloudKitAccountChanged_, *MEMORY[0x1E0C94690], 0);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "addObserver:selector:name:object:", v6, sel_cloudKitAccountChanged_, CFSTR("ICAccountsDidChangeNotification"), 0);

      objc_initWeak(&location, v6);
      v32 = dispatch_time(0, 2000000000);
      dispatch_get_global_queue(-2, 0);
      v33 = objc_claimAutoreleasedReturnValue();
      v38 = MEMORY[0x1E0C809B0];
      v39 = 3221225472;
      v40 = __35__ICCloudContext_initWithDelegate___block_invoke;
      v41 = &unk_1E76C7940;
      objc_copyWeak(&v42, &location);
      dispatch_after(v32, v33, &v38);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", v38, v39, v40, v41);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "addObserver:selector:name:object:", v6, sel_updateConfiguration_, CFSTR("ICCloudConfigurationChanged"), 0);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "addObserver:selector:name:object:", v6, sel_updateSelectorDelayers_, CFSTR("ICCloudBatchIntervalDidChangeNotification"), 0);

      -[ICCloudContext operationQueue](v6, "operationQueue");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "ic_addObserver:forKeyPath:context:", v6, CFSTR("operationCount"), compoundliteral_1);

      -[ICCloudContext setDidAddObservers:](v6, "setDidAddObservers:", 1);
      objc_destroyWeak(&v42);
      objc_destroyWeak(&location);
    }
    else
    {
      -[ICCloudContext setDidAddObservers:](v6, "setDidAddObservers:", 0);
    }
    -[ICCloudContext updateConfiguration:](v6, "updateConfiguration:", 0);
  }

  return v6;
}

void __35__ICCloudContext_initWithDelegate___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateCloudContextState");

}

- (id)persistentStoreCoordinator
{
  void *v3;
  void *v4;
  void *v5;

  -[ICCloudContext cloudContextDelegate](self, "cloudContextDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[ICCloudContext cloudContextDelegate](self, "cloudContextDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "persistentStoreCoordinatorForCloudContext:", self);
  }
  else
  {
    +[ICNoteContext sharedContext](ICNoteContext, "sharedContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "persistentStoreCoordinator");
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)viewContext
{
  void *v3;
  void *v4;
  void *v5;

  -[ICCloudContext cloudContextDelegate](self, "cloudContextDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[ICCloudContext cloudContextDelegate](self, "cloudContextDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "viewContextForCloudContext:", self);
  }
  else
  {
    +[ICNoteContext sharedContext](ICNoteContext, "sharedContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "managedObjectContext");
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)backgroundContext
{
  void *v3;
  void *v4;
  void *v5;

  -[ICCloudContext cloudContextDelegate](self, "cloudContextDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[ICCloudContext cloudContextDelegate](self, "cloudContextDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "backgroundContextForCloudContext:", self);
  }
  else
  {
    +[ICNoteContext sharedContext](ICNoteContext, "sharedContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "workerManagedObjectContext");
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)hasNoteContextOptions:(unint64_t)a3
{
  void *v5;
  void *v6;
  char v7;
  BOOL v8;

  -[ICCloudContext cloudContextDelegate](self, "cloudContextDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[ICCloudContext cloudContextDelegate](self, "cloudContextDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "cloudContext:hasContextOptions:", self, a3);
  }
  else
  {
    +[ICNoteContext sharedContext](ICNoteContext, "sharedContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "hasContextOptions:", a3);
  }
  v8 = v7;

  return v8;
}

- (NSDictionary)containersByAccountID
{
  NSObject *v3;
  _QWORD block[5];

  -[ICCloudContext containersCreationQueue](self, "containersCreationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__ICCloudContext_containersByAccountID__block_invoke;
  block[3] = &unk_1E76C73F8;
  block[4] = self;
  dispatch_sync(v3, block);

  return self->_containersByAccountID;
}

void __39__ICCloudContext_containersByAccountID__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  char v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD **)(a1 + 32);
  if (!v2[15])
  {
    objc_msgSend(v2, "cloudContextDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_respondsToSelector();

    if ((v4 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "cloudContextDelegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "containersByAccountIDForCloudContext:", *(_QWORD *)(a1 + 32));
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(void **)(v7 + 120);
      *(_QWORD *)(v7 + 120) = v6;

    }
    if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 120))
    {
      v9 = (void *)objc_opt_new();
      objc_msgSend(*(id *)(a1 + 32), "backgroundContext");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "cloudContextDelegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "accountIDsForCloudContext:managedObjectContext:", *(_QWORD *)(a1 + 32), v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v13 = v12;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v24;
        do
        {
          v17 = 0;
          do
          {
            if (*(_QWORD *)v24 != v16)
              objc_enumerationMutation(v13);
            v18 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v17);
            v19 = (void *)objc_msgSend((id)objc_opt_class(), "newNotesContainerForAccountID:", v18, (_QWORD)v23);
            objc_msgSend(v9, "setObject:forKeyedSubscript:", v19, v18);

            ++v17;
          }
          while (v15 != v17);
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        }
        while (v15);
      }

      v20 = objc_msgSend(v9, "copy");
      v21 = *(_QWORD *)(a1 + 32);
      v22 = *(void **)(v21 + 120);
      *(_QWORD *)(v21 + 120) = v20;

    }
  }
}

- (void)clearContainers
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, v0, v1, "Clearing cloud containers.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __33__ICCloudContext_clearContainers__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 120);
  *(_QWORD *)(v1 + 120) = 0;

}

- (id)containerForAccountID:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  if (!v4)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "accountID != ((void *)0)", "-[ICCloudContext containerForAccountID:]", 1, 0, CFSTR("accountID must not be nil to get container."));
  if (objc_msgSend(v4, "length"))
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__46;
    v16 = __Block_byref_object_dispose__46;
    -[ICCloudContext containersByAccountID](self, "containersByAccountID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v17 = (id)objc_claimAutoreleasedReturnValue();

    -[ICCloudContext containersCreationQueue](self, "containersCreationQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__ICCloudContext_containerForAccountID___block_invoke;
    block[3] = &unk_1E76C8358;
    v11 = &v12;
    block[4] = self;
    v10 = v4;
    dispatch_sync(v6, block);

    v7 = (id)v13[5];
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __40__ICCloudContext_containerForAccountID___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  if (!*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    v2 = objc_msgSend((id)objc_opt_class(), "newNotesContainerForAccountID:", a1[5]);
    v3 = *(_QWORD *)(a1[6] + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

    v5 = (void *)objc_msgSend(*(id *)(a1[4] + 120), "mutableCopy");
    objc_msgSend(v5, "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), a1[5]);
    v6 = a1[4];
    v7 = *(void **)(v6 + 120);
    *(_QWORD *)(v6 + 120) = v5;

  }
}

- (id)invernessClientForAccountID:(id)a3
{
  void *v3;
  ICNotesInvernessClient *v4;

  -[ICCloudContext containerForAccountID:](self, "containerForAccountID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ICNotesInvernessClient initWithContainer:]([ICNotesInvernessClient alloc], "initWithContainer:", v3);

  return v4;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  if (-[ICCloudContext didAddObservers](self, "didAddObservers"))
  {
    -[ICCloudContext operationQueue](self, "operationQueue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "ic_removeObserver:forKeyPath:context:", self, CFSTR("operationCount"), compoundliteral_1);

  }
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:", self);
  -[ICCloudContext retryTimer](self, "retryTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  -[ICCloudContext processingSelectorDelayer](self, "processingSelectorDelayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancelPreviousFireRequests");

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:", self);

  v7.receiver = self;
  v7.super_class = (Class)ICCloudContext;
  -[ICCloudContext dealloc](&v7, sel_dealloc);
}

- (NSDictionary)cloudObjectClassesByRecordType
{
  _QWORD v3[11];
  _QWORD v4[12];

  v4[11] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("Note");
  v4[0] = objc_opt_class();
  v3[1] = CFSTR("Folder");
  v4[1] = objc_opt_class();
  v3[2] = CFSTR("Attachment");
  v4[2] = objc_opt_class();
  v3[3] = CFSTR("InlineAttachment");
  v4[3] = objc_opt_class();
  v3[4] = CFSTR("Media");
  v4[4] = objc_opt_class();
  v3[5] = CFSTR("MigrationState");
  v4[5] = objc_opt_class();
  v3[6] = CFSTR("LegacyTombstone");
  v4[6] = objc_opt_class();
  v3[7] = *MEMORY[0x1E0C94A28];
  v4[7] = objc_opt_class();
  v3[8] = CFSTR("PasswordProtectedNote");
  v4[8] = objc_opt_class();
  v3[9] = CFSTR("AccountData");
  v4[9] = objc_opt_class();
  v3[10] = CFSTR("Hashtag");
  v4[10] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 11);
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue();
}

+ (CKRecordZoneID)notesZoneID
{
  if (notesZoneID_onceToken != -1)
    dispatch_once(&notesZoneID_onceToken, &__block_literal_global_104);
  return (CKRecordZoneID *)(id)notesZoneID_sNotesZoneID;
}

void __29__ICCloudContext_notesZoneID__block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;

  v0 = objc_alloc(MEMORY[0x1E0C95098]);
  v1 = objc_msgSend(v0, "initWithZoneName:ownerName:", CFSTR("Notes"), *MEMORY[0x1E0C94730]);
  v2 = (void *)notesZoneID_sNotesZoneID;
  notesZoneID_sNotesZoneID = v1;

}

+ (CKRecordZoneID)metadataZoneID
{
  if (metadataZoneID_onceToken != -1)
    dispatch_once(&metadataZoneID_onceToken, &__block_literal_global_106);
  return (CKRecordZoneID *)(id)metadataZoneID_sMetadataZoneID;
}

void __32__ICCloudContext_metadataZoneID__block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;

  v0 = objc_alloc(MEMORY[0x1E0C95098]);
  v1 = objc_msgSend(v0, "initWithZoneName:ownerName:", CFSTR("Metadata"), *MEMORY[0x1E0C94730]);
  v2 = (void *)metadataZoneID_sMetadataZoneID;
  metadataZoneID_sMetadataZoneID = v1;

}

- (void)reachabilityChanged:(id)a3
{
  _BOOL4 v4;
  NSObject *v5;
  _BOOL4 v6;

  v4 = -[ICCloudContext isInternetReachable](self, "isInternetReachable", a3);
  v5 = os_log_create("com.apple.notes", "Cloud");
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v6)
      -[ICCloudContext reachabilityChanged:].cold.1();

    -[ICCloudContext processPendingCloudObjects](self, "processPendingCloudObjects");
  }
  else
  {
    if (v6)
      -[ICCloudContext reachabilityChanged:].cold.2();

  }
  -[ICCloudContext updateCloudContextState](self, "updateCloudContextState");
}

- (void)cloudKitAccountChanged:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[ICCloudContext processingQueue](self, "processingQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__ICCloudContext_cloudKitAccountChanged___block_invoke;
  block[3] = &unk_1E76C73F8;
  block[4] = self;
  dispatch_async(v4, block);

}

uint64_t __41__ICCloudContext_cloudKitAccountChanged___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  _QWORD v6[6];

  v2 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __41__ICCloudContext_cloudKitAccountChanged___block_invoke_cold_1();

  v3 = objc_msgSend(*(id *)(a1 + 32), "accountStatus");
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41__ICCloudContext_cloudKitAccountChanged___block_invoke_107;
  v6[3] = &unk_1E76CD990;
  v6[4] = v4;
  v6[5] = v3;
  return objc_msgSend(v4, "updateAccountStatusWithCompletionHandler:", v6);
}

uint64_t __41__ICCloudContext_cloudKitAccountChanged___block_invoke_107(uint64_t result, uint64_t a2)
{
  if (*(_QWORD *)(result + 40) != a2)
    return objc_msgSend(*(id *)(result + 32), "updateCloudContextState");
  return result;
}

- (BOOL)hasPendingOperations
{
  void *v2;
  BOOL v3;

  -[ICCloudContext operationQueue](self, "operationQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "operationCount") != 0;

  return v3;
}

- (void)printOperationQueue
{
  NSObject *v0;
  uint64_t v1;
  id v2;
  void *v3;
  uint64_t v4;
  _DWORD v5[2];
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_17();
  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v2, "operationQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 67109378;
  v5[1] = objc_msgSend(v3, "operationCount");
  v6 = 2112;
  v7 = v1;
  OUTLINED_FUNCTION_40_0(&dword_1BD918000, v0, v4, "Operation queue has %d operation(s):%@", (uint8_t *)v5);

  OUTLINED_FUNCTION_2();
}

+ (void)registerStateHandler
{
  objc_msgSend(MEMORY[0x1E0D64280], "addStateHandlerWithName:stateBlock:", "ICCloudContext", &__block_literal_global_115_0);
}

id __38__ICCloudContext_registerStateHandler__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  +[ICCloudContext sharedContext](ICCloudContext, "sharedContext");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "operationQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "operations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v9 = (void *)MEMORY[0x1E0CB3940];
        v10 = (objc_class *)objc_opt_class();
        NSStringFromClass(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "ic_loggingIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringWithFormat:", CFSTR("%@ %@"), v11, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "ic_loggingValues");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v0, "setObject:forKeyedSubscript:", v14, v13);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v5);
  }

  objc_msgSend(v16, "setObject:forKeyedSubscript:", v0, CFSTR("operations"));
  return v16;
}

- (id)allZoneIDs
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  +[ICCloudContext notesZoneID](ICCloudContext, "notesZoneID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  +[ICCloudContext metadataZoneID](ICCloudContext, "metadataZoneID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)receivedZoneNotFound:(id)a3 operation:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "database");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudContext accountIDForDatabase:](self, "accountIDForDatabase:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v8, "ic_isOwnedByCurrentUser");
  v14 = os_log_create("com.apple.notes", "Cloud");
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v13)
  {
    if (v15)
    {
      objc_msgSend(v8, "ic_loggingDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "ic_loggingDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138412546;
      v25 = v16;
      v26 = 2112;
      v27 = v17;
      _os_log_impl(&dword_1BD918000, v14, OS_LOG_TYPE_DEFAULT, "Zone not found %@ %@", (uint8_t *)&v24, 0x16u);

    }
    -[ICCloudContext accountZoneIDsNeedingToBeSaved](self, "accountZoneIDsNeedingToBeSaved");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "ic_addZoneID:forAccountID:", v8, v12);

    -[ICCloudContext cloudContextDelegate](self, "cloudContextDelegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "cloudContext:receivedZoneNotFound:accountID:", self, v8, v12);
  }
  else
  {
    if (v15)
    {
      objc_msgSend(v8, "ic_loggingDescription");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "ic_loggingDescription");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138412546;
      v25 = v20;
      v26 = 2112;
      v27 = v21;
      _os_log_impl(&dword_1BD918000, v14, OS_LOG_TYPE_DEFAULT, "Shared zone not found %@ %@", (uint8_t *)&v24, 0x16u);

    }
    -[ICCloudContext accountZoneIDsFetchingChanges](self, "accountZoneIDsFetchingChanges");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "ic_removeZoneID:forAccountID:", v8, v12);

    -[ICCloudContext cloudContextDelegate](self, "cloudContextDelegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "cloudContext:sharedZoneWasDeleted:accountID:", self, v8, v12);
  }

  -[ICCloudContext saveZoneFetchState](self, "saveZoneFetchState");
  objc_msgSend(v9, "database");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudContext deleteServerChangeTokenForRecordZoneID:databaseScope:accountID:context:](self, "deleteServerChangeTokenForRecordZoneID:databaseScope:accountID:context:", v8, objc_msgSend(v23, "databaseScope"), v12, v10);

}

- (id)allCloudObjectIDsInContext:(id)a3
{
  return -[ICCloudContext allCloudObjectIDsInContext:predicate:](self, "allCloudObjectIDsInContext:predicate:", a3, 0);
}

- (id)allCloudObjectIDsInContext:(id)a3 predicate:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v5 = (void *)MEMORY[0x1E0C99E20];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __55__ICCloudContext_allCloudObjectIDsInContext_predicate___block_invoke;
  v12[3] = &unk_1E76CD9F8;
  v13 = v8;
  v9 = v8;
  +[ICCloudSyncingObject enumerateAllCloudObjectsInContext:predicate:sortDescriptors:relationshipKeyPathsForPrefetching:batchSize:saveAfterBatch:usingBlock:](ICCloudSyncingObject, "enumerateAllCloudObjectsInContext:predicate:sortDescriptors:relationshipKeyPathsForPrefetching:batchSize:saveAfterBatch:usingBlock:", v7, v6, 0, 0, 20, 0, v12);

  v10 = (void *)objc_msgSend(v9, "copy");
  return v10;
}

void __55__ICCloudContext_allCloudObjectIDsInContext_predicate___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "objectID");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (void)enumerateAllCloudObjectsInContext:(id)a3 batchSize:(unint64_t)a4 saveAfterBatch:(BOOL)a5 usingBlock:(id)a6
{
  +[ICCloudSyncingObject enumerateAllCloudObjectsInContext:predicate:sortDescriptors:relationshipKeyPathsForPrefetching:batchSize:saveAfterBatch:usingBlock:](ICCloudSyncingObject, "enumerateAllCloudObjectsInContext:predicate:sortDescriptors:relationshipKeyPathsForPrefetching:batchSize:saveAfterBatch:usingBlock:", a3, 0, 0, 0, a4, a5, a6);
}

void __73__ICCloudContext_syncWithReason_uploadUnsyncedChanges_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  id v11;
  id v12;

  v3 = a2;
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend((id)objc_opt_class(), "errorFromErrors:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v8 = 3221225472;
    v9 = __73__ICCloudContext_syncWithReason_uploadUnsyncedChanges_completionHandler___block_invoke_2;
    v10 = &unk_1E76C9218;
    v5 = *(id *)(a1 + 40);
    v11 = v4;
    v12 = v5;
    v6 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], &v7);

  }
  objc_msgSend(*(id *)(a1 + 32), "syncCompletedWithErrors:", v3, v7, v8, v9, v10);

}

uint64_t __73__ICCloudContext_syncWithReason_uploadUnsyncedChanges_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_syncWithReason:(id)a3 uploadUnsyncedChanges:(BOOL)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  ICCloudContext *v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  ICCloudContext *v27;
  id v28;
  NSObject *v29;
  BOOL v30;

  v8 = a3;
  v9 = a5;
  v10 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[ICCloudContext _syncWithReason:uploadUnsyncedChanges:completionHandler:].cold.1();

  objc_msgSend(MEMORY[0x1E0D64288], "postFullSyncTelemetryWithReason:", v8);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = dispatch_group_create();
  dispatch_group_enter(v12);
  v13 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __74__ICCloudContext__syncWithReason_uploadUnsyncedChanges_completionHandler___block_invoke;
  v25[3] = &unk_1E76CDA98;
  v14 = v11;
  v26 = v14;
  v27 = self;
  v15 = v8;
  v28 = v15;
  v30 = a4;
  v16 = v12;
  v29 = v16;
  -[ICCloudContext fetchDatabaseChangesWithReason:completionHandler:](self, "fetchDatabaseChangesWithReason:completionHandler:", v15, v25);
  if (v9)
  {
    dispatch_get_global_queue(0, 0);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v13;
    v19 = 3221225472;
    v20 = __74__ICCloudContext__syncWithReason_uploadUnsyncedChanges_completionHandler___block_invoke_133;
    v21 = &unk_1E76C7780;
    v22 = self;
    v23 = v14;
    v24 = v9;
    dispatch_group_notify(v16, v17, &v18);

  }
  -[ICCloudContext syncCompletedWithErrors:](self, "syncCompletedWithErrors:", v14, v18, v19, v20, v21, v22);

}

void __74__ICCloudContext__syncWithReason_uploadUnsyncedChanges_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  char v14;
  uint8_t buf[16];

  v3 = a2;
  v4 = os_log_create("com.apple.notes", "Cloud");
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BD918000, v5, OS_LOG_TYPE_INFO, "Error fetching database changes during sync", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __74__ICCloudContext__syncWithReason_uploadUnsyncedChanges_completionHandler___block_invoke_cold_1();

  }
  v7 = *(void **)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __74__ICCloudContext__syncWithReason_uploadUnsyncedChanges_completionHandler___block_invoke_130;
  v10[3] = &unk_1E76CDA70;
  v8 = *(id *)(a1 + 32);
  v14 = *(_BYTE *)(a1 + 64);
  v9 = *(_QWORD *)(a1 + 40);
  v11 = v8;
  v12 = v9;
  v13 = *(id *)(a1 + 56);
  objc_msgSend(v7, "fetchRecordZoneChangesWithReason:completionHandler:", v6, v10);

}

void __74__ICCloudContext__syncWithReason_uploadUnsyncedChanges_completionHandler___block_invoke_130(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[16];

  v3 = a2;
  v4 = os_log_create("com.apple.notes", "Cloud");
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BD918000, v5, OS_LOG_TYPE_INFO, "Error fetching record zone changes during sync", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __74__ICCloudContext__syncWithReason_uploadUnsyncedChanges_completionHandler___block_invoke_130_cold_1();

  }
  if (*(_BYTE *)(a1 + 56))
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __74__ICCloudContext__syncWithReason_uploadUnsyncedChanges_completionHandler___block_invoke_131;
    v7[3] = &unk_1E76CDA48;
    v6 = *(void **)(a1 + 40);
    v8 = *(id *)(a1 + 32);
    v9 = *(id *)(a1 + 48);
    objc_msgSend(v6, "processAllCloudObjectsWithCompletionHandler:", v7);

  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }

}

void __74__ICCloudContext__syncWithReason_uploadUnsyncedChanges_completionHandler___block_invoke_131(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a2;
  v4 = os_log_create("com.apple.notes", "Cloud");
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1BD918000, v5, OS_LOG_TYPE_INFO, "Error while processing for full sync", v6, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v3);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __74__ICCloudContext__syncWithReason_uploadUnsyncedChanges_completionHandler___block_invoke_131_cold_1();

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __74__ICCloudContext__syncWithReason_uploadUnsyncedChanges_completionHandler___block_invoke_133(uint64_t a1)
{
  id v2;

  objc_msgSend((id)objc_opt_class(), "errorFromErrors:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)syncCompletedWithErrors:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  id v15;
  id v16;

  v4 = a3;
  v5 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[ICCloudContext syncCompletedWithErrors:].cold.1(v4, (const char *)v5);

  if (!objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCloudContext backgroundContext](self, "backgroundContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __42__ICCloudContext_syncCompletedWithErrors___block_invoke;
    v14 = &unk_1E76C73B0;
    v15 = v7;
    v16 = v6;
    v8 = v6;
    v9 = v7;
    objc_msgSend(v9, "performBlockAndWait:", &v11);
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter", v11, v12, v13, v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "postNotificationName:object:", CFSTR("ICCloudContextSyncCompletedNotification"), 0);

  }
}

uint64_t __42__ICCloudContext_syncCompletedWithErrors___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  +[ICAccount allActiveCloudKitAccountsInContext:](ICAccount, "allActiveCloudKitAccountsInContext:", *(_QWORD *)(a1 + 32), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6++), "setLastSyncDate:", *(_QWORD *)(a1 + 40));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  return objc_msgSend(*(id *)(a1 + 32), "ic_save");
}

- (void)cancelEverythingWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatch_get_global_queue(0, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__ICCloudContext_cancelEverythingWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E76C8430;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __56__ICCloudContext_cancelEverythingWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  dispatch_time_t v16;
  id v17;
  const char *v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  id v22;
  _QWORD v23[5];
  id v24;
  _QWORD *v25;
  _QWORD v26[4];
  id v27;
  _QWORD *v28;
  _QWORD v29[5];
  id v30;
  _QWORD aBlock[5];
  id v32;
  _QWORD block[5];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "operationQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "operations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v35;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v35 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v9, "ic_removeAllCompletionBlocks");
        objc_msgSend(v9, "ic_loggingDescription");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "appendFormat:", CFSTR("\n\t%@"), v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v6);
  }

  v11 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    __56__ICCloudContext_cancelEverythingWithCompletionHandler___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "setDisabledInternal:", 1);
  objc_msgSend(*(id *)(a1 + 32), "clearPendingActivity");
  objc_msgSend(*(id *)(a1 + 32), "operationQueue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "cancelAllOperations");

  objc_msgSend(*(id *)(a1 + 32), "processingQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__ICCloudContext_cancelEverythingWithCompletionHandler___block_invoke_137;
  block[3] = &unk_1E76C73F8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v13, block);

  aBlock[0] = v14;
  aBlock[1] = 3221225472;
  aBlock[2] = __56__ICCloudContext_cancelEverythingWithCompletionHandler___block_invoke_2;
  aBlock[3] = &unk_1E76C8430;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v32 = *(id *)(a1 + 40);
  v15 = _Block_copy(aBlock);
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__46;
  v29[4] = __Block_byref_object_dispose__46;
  v30 = (id)MEMORY[0x1E0C9AAA0];
  v16 = dispatch_time(0, 5000000000);
  v26[0] = v14;
  v26[1] = 3221225472;
  v26[2] = __56__ICCloudContext_cancelEverythingWithCompletionHandler___block_invoke_4;
  v26[3] = &unk_1E76CDAC0;
  v28 = v29;
  v17 = v15;
  v27 = v17;
  dispatch_after(v16, MEMORY[0x1E0C80D38], v26);
  v18 = (const char *)objc_msgSend(CFSTR("com.apple.notes.cloud.waiting"), "UTF8String");
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = dispatch_queue_create(v18, v19);
  v23[0] = v14;
  v23[1] = 3221225472;
  v23[2] = __56__ICCloudContext_cancelEverythingWithCompletionHandler___block_invoke_138;
  v23[3] = &unk_1E76CDAE8;
  v21 = *(_QWORD *)(a1 + 32);
  v24 = v17;
  v25 = v29;
  v23[4] = v21;
  v22 = v17;
  dispatch_async(v20, v23);

  _Block_object_dispose(v29, 8);
}

uint64_t __56__ICCloudContext_cancelEverythingWithCompletionHandler___block_invoke_137(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "loadZoneFetchState");
}

void __56__ICCloudContext_cancelEverythingWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  _QWORD block[4];
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "clearPendingActivity");
  objc_msgSend(*(id *)(a1 + 32), "setDisabledInternal:", 0);
  if (*(_QWORD *)(a1 + 40))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__ICCloudContext_cancelEverythingWithCompletionHandler___block_invoke_3;
    block[3] = &unk_1E76C91F0;
    v3 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __56__ICCloudContext_cancelEverythingWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __56__ICCloudContext_cancelEverythingWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;

  if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "BOOLValue") & 1) == 0)
  {
    v2 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      __56__ICCloudContext_cancelEverythingWithCompletionHandler___block_invoke_4_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = MEMORY[0x1E0C9AAB0];

  }
}

void __56__ICCloudContext_cancelEverythingWithCompletionHandler___block_invoke_138(uint64_t a1)
{
  void *v2;
  id v3;
  __int128 v4;
  _QWORD block[4];
  __int128 v6;

  objc_msgSend(*(id *)(a1 + 32), "operationQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "waitUntilAllOperationsAreFinished");

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__ICCloudContext_cancelEverythingWithCompletionHandler___block_invoke_2_139;
  block[3] = &unk_1E76CDAC0;
  v4 = *(_OWORD *)(a1 + 40);
  v3 = (id)v4;
  v6 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __56__ICCloudContext_cancelEverythingWithCompletionHandler___block_invoke_2_139(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "BOOLValue") & 1) == 0)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v3 = *(void **)(v2 + 40);
    *(_QWORD *)(v2 + 40) = MEMORY[0x1E0C9AAB0];

  }
}

- (void)clearPendingActivity
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, v0, v1, "clearPendingActivity called", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __38__ICCloudContext_clearPendingActivity__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  void *v5;

  v2 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __38__ICCloudContext_clearPendingActivity__block_invoke_cold_2();

  objc_msgSend(*(id *)(a1 + 32), "objectIDsToProcess");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  v4 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __38__ICCloudContext_clearPendingActivity__block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "objectIDsToRetry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

}

uint64_t __38__ICCloudContext_clearPendingActivity__block_invoke_140(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:", *(_QWORD *)(a1 + 32));
}

- (void)deleteRecordZonesWithZoneIDs:(id)a3 accountID:(id)a4 markZonesAsUserPurged:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, void *, void *, void *);
  void *v28;
  id v29;
  ICCloudContext *v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  uint8_t buf[4];
  _BOOL4 v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v7 = a5;
  v41 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109634;
    v36 = v7;
    v37 = 2112;
    v38 = v11;
    v39 = 2112;
    v40 = v10;
    _os_log_debug_impl(&dword_1BD918000, v13, OS_LOG_TYPE_DEBUG, "Deleting record zones (markZonesAsUserPurged=%d) in account ID %@: %@", buf, 0x1Cu);
  }

  if (objc_msgSend(v11, "length"))
  {
    -[ICCloudContext containerForAccountID:](self, "containerForAccountID:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94EF0]), "initWithRecordZonesToSave:recordZoneIDsToDelete:", 0, v10);
    objc_msgSend(v15, "setQualityOfService:", -[ICCloudContext qualityOfService](self, "qualityOfService"));
    v16 = -[ICCloudContext discretionaryNetworkBehavior](self, "discretionaryNetworkBehavior");
    objc_msgSend(v15, "configuration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setDiscretionaryNetworkBehavior:", v16);

    objc_msgSend(v14, "privateCloudDatabase");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setDatabase:", v18);
    objc_msgSend(v15, "setMarkZonesAsUserPurged:", v7);
    -[ICCloudContext backgroundContext](self, "backgroundContext");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = MEMORY[0x1E0C809B0];
    v26 = 3221225472;
    v27 = __97__ICCloudContext_deleteRecordZonesWithZoneIDs_accountID_markZonesAsUserPurged_completionHandler___block_invoke;
    v28 = &unk_1E76CDB78;
    v29 = v11;
    v30 = self;
    v31 = v18;
    v32 = v19;
    v33 = v12;
    v20 = v19;
    v21 = v18;
    objc_msgSend(v15, "setModifyRecordZonesCompletionBlock:", &v25);
    v22 = objc_alloc_init(MEMORY[0x1E0C94F88]);
    objc_msgSend(v22, "setName:", CFSTR("DeleteRecordZones"), v25, v26, v27, v28);
    objc_msgSend(v22, "setQuantity:", objc_msgSend(v10, "count"));
    objc_msgSend(v22, "setExpectedSendSize:", 1);
    objc_msgSend(v22, "setExpectedReceiveSize:", 1);
    objc_msgSend(v15, "setGroup:", v22);
    v34 = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCloudContext addOperations:](self, "addOperations:", v23);

LABEL_9:
    goto LABEL_10;
  }
  v24 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    -[ICCloudContext deleteRecordZonesWithZoneIDs:accountID:markZonesAsUserPurged:completionHandler:].cold.1();

  if (v12)
  {
    ICGenericError();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v12 + 2))(v12, v14);
    goto LABEL_9;
  }
LABEL_10:

}

void __97__ICCloudContext_deleteRecordZonesWithZoneIDs_accountID_markZonesAsUserPurged_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = os_log_create("com.apple.notes", "Cloud");
  v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __97__ICCloudContext_deleteRecordZonesWithZoneIDs_accountID_markZonesAsUserPurged_completionHandler___block_invoke_cold_2();
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    __97__ICCloudContext_deleteRecordZonesWithZoneIDs_accountID_markZonesAsUserPurged_completionHandler___block_invoke_cold_1();
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v12 = v8;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v26;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v26 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(a1 + 40), "deleteServerChangeTokenForRecordZoneID:databaseScope:accountID:context:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v16++), objc_msgSend(*(id *)(a1 + 48), "databaseScope"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v14);
  }

  objc_msgSend(*(id *)(a1 + 40), "updateCloudContextState");
  objc_msgSend(*(id *)(a1 + 40), "backgroundContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __97__ICCloudContext_deleteRecordZonesWithZoneIDs_accountID_markZonesAsUserPurged_completionHandler___block_invoke_142;
  v21[3] = &unk_1E76CDB50;
  v21[4] = *(_QWORD *)(a1 + 40);
  v22 = v17;
  v18 = *(id *)(a1 + 64);
  v23 = v9;
  v24 = v18;
  v19 = v9;
  v20 = v17;
  objc_msgSend(v20, "performBlockAndWait:", v21);

}

uint64_t __97__ICCloudContext_deleteRecordZonesWithZoneIDs_accountID_markZonesAsUserPurged_completionHandler___block_invoke_142(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;

  v2 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __97__ICCloudContext_deleteRecordZonesWithZoneIDs_accountID_markZonesAsUserPurged_completionHandler___block_invoke_142_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "enumerateAllCloudObjectsInContext:batchSize:saveAfterBatch:usingBlock:", *(_QWORD *)(a1 + 40), 10, 1, &__block_literal_global_144);
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 48));
  return result;
}

void __97__ICCloudContext_deleteRecordZonesWithZoneIDs_accountID_markZonesAsUserPurged_completionHandler___block_invoke_143(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  objc_opt_class();
  ICCheckedDynamicCast();
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "clearServerRecords");
}

- (BOOL)isFetchingAllRecordZones
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[ICCloudContext operationQueue](self, "operationQueue", 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "operations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

- (BOOL)isInternetReachable
{
  return objc_msgSend(MEMORY[0x1E0D64290], "isInternetReachable");
}

+ (id)errorForWaitingForRetryTimer
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB35C8];
  v6 = *MEMORY[0x1E0CB2D50];
  v7[0] = CFSTR("Cloud syncing is waiting for retry timer.");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("com.apple.notes.cloud"), 2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)errorFromErrors:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    if (objc_msgSend(v3, "count") == 1)
    {
      objc_msgSend(v3, "firstObject");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = (void *)MEMORY[0x1E0CB35C8];
      v8 = CFSTR("Errors");
      v9[0] = v3;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("com.apple.notes.cloud"), 3, v6);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)errorFromOperations:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "error", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(v10, "error");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v12);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  objc_msgSend((id)objc_opt_class(), "errorFromErrors:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (double)timeIntervalToRetryAfterFromError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  double v11;
  void *v12;
  _QWORD v14[5];
  uint64_t v15;
  double *v16;
  uint64_t v17;
  uint64_t v18;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v15 = 0;
    v16 = (double *)&v15;
    v17 = 0x2020000000;
    v18 = 0;
    objc_msgSend(v3, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x1E0C94808];
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0C94808]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v4, "userInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "doubleValue");
      *((_QWORD *)v16 + 3) = v10;

    }
    else
    {
      if (objc_msgSend(v4, "code") != 2)
      {
LABEL_8:
        v11 = v16[3];
        _Block_object_dispose(&v15, 8);
        goto LABEL_9;
      }
      objc_msgSend(v4, "userInfo");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0C94940]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __52__ICCloudContext_timeIntervalToRetryAfterFromError___block_invoke;
      v14[3] = &unk_1E76CDBA0;
      v14[4] = &v15;
      objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v14);
    }

    goto LABEL_8;
  }
  v11 = 0.0;
LABEL_9:

  return v11;
}

void __52__ICCloudContext_timeIntervalToRetryAfterFromError___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  objc_msgSend(a3, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0C94808]);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v9;
  if (v9)
  {
    objc_msgSend(v9, "doubleValue");
    v7 = v9;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v8;
    *a4 = 1;
  }

}

- (void)finishOperationsForRecordID:(id)a3 completionHandler:(id)a4
{
  -[ICCloudContext finishOperationsForRecordID:qualityOfService:completionHandler:](self, "finishOperationsForRecordID:qualityOfService:completionHandler:", a3, -1, a4);
}

- (void)finishOperationsForRecordID:(id)a3 qualityOfService:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  ICCloudContext *v15;
  id v16;
  int64_t v17;

  v8 = a3;
  v9 = a5;
  -[ICCloudContext processingQueue](self, "processingQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __81__ICCloudContext_finishOperationsForRecordID_qualityOfService_completionHandler___block_invoke;
  v13[3] = &unk_1E76CDBC8;
  v16 = v9;
  v17 = a4;
  v14 = v8;
  v15 = self;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

void __81__ICCloudContext_finishOperationsForRecordID_qualityOfService_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  char v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  int v23;
  id v24;
  void *v25;
  char v26;
  NSObject *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  __int128 v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[4];
  id v47;
  id v48;
  void *v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  void *v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __81__ICCloudContext_finishOperationsForRecordID_qualityOfService_completionHandler___block_invoke_cold_1(a1);

  v3 = (void *)MEMORY[0x1E0CB34C8];
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __81__ICCloudContext_finishOperationsForRecordID_qualityOfService_completionHandler___block_invoke_158;
  v46[3] = &unk_1E76C8430;
  v47 = *(id *)(a1 + 32);
  v48 = *(id *)(a1 + 48);
  objc_msgSend(v3, "blockOperationWithBlock:", v46);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setQualityOfService:", *(_QWORD *)(a1 + 56));
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "operationQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "operations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v6;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v42, v55, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v43;
    *(_QWORD *)&v9 = 138412546;
    v33 = v9;
    v35 = v4;
    v36 = *(_QWORD *)v43;
    v34 = v6;
    do
    {
      v12 = 0;
      v37 = v10;
      do
      {
        if (*(_QWORD *)v43 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v12);
        objc_msgSend(v13, "setQualityOfService:", *(_QWORD *)(a1 + 56), v33);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_27;
          v24 = v13;
          objc_msgSend(v24, "recordIDs");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "containsObject:", *(_QWORD *)(a1 + 32));

          v11 = v36;
          if ((v26 & 1) == 0)
            goto LABEL_27;
          goto LABEL_24;
        }
        v14 = v13;
        objc_msgSend(v14, "recordIDsToDelete");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "containsObject:", *(_QWORD *)(a1 + 32));

        if ((v16 & 1) != 0)
        {
LABEL_23:

          v10 = v37;
LABEL_24:
          v27 = os_log_create("com.apple.notes", "Cloud");
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v13, "ic_loggingDescription");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 32), "ic_loggingDescription");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v33;
            v51 = v28;
            v52 = 2112;
            v53 = v29;
            _os_log_debug_impl(&dword_1BD918000, v27, OS_LOG_TYPE_DEBUG, "Waiting on operation %@ for record ID %@", buf, 0x16u);

            v11 = v36;
          }

          objc_msgSend(v4, "addDependency:", v13);
          goto LABEL_27;
        }
        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        objc_msgSend(v14, "recordsToSave");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v38, v54, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v39;
          while (2)
          {
            for (i = 0; i != v19; ++i)
            {
              if (*(_QWORD *)v39 != v20)
                objc_enumerationMutation(v17);
              objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "recordID");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = objc_msgSend(v22, "isEqual:", *(_QWORD *)(a1 + 32));

              if (v23)
              {

                v7 = v34;
                v4 = v35;
                v11 = v36;
                goto LABEL_23;
              }
            }
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v38, v54, 16);
            if (v19)
              continue;
            break;
          }

          v7 = v34;
          v4 = v35;
          v11 = v36;
        }
        else
        {

        }
        v10 = v37;
LABEL_27:
        ++v12;
      }
      while (v12 != v10);
      v30 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v42, v55, 16);
      v10 = v30;
    }
    while (v30);
  }

  objc_msgSend(v4, "ic_setResistsCancellation:", 1);
  v31 = *(void **)(a1 + 40);
  v49 = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v49, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addOperations:", v32);

}

uint64_t __81__ICCloudContext_finishOperationsForRecordID_qualityOfService_completionHandler___block_invoke_158(uint64_t a1)
{
  NSObject *v2;

  v2 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __81__ICCloudContext_finishOperationsForRecordID_qualityOfService_completionHandler___block_invoke_158_cold_1(a1);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)pauseCloudSyncWhileSynchronouslyPerformingBlock:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  -[ICCloudContext processingQueue](self, "processingQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_sync(v5, v4);

}

- (void)ingestCloudKitRecord:(id)a3 forAccountID:(id)a4 forceMerge:(BOOL)a5 context:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  id v19;
  ICCloudContext *v20;
  id v21;
  BOOL v22;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[ICCloudContext processingQueue](self, "processingQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__ICCloudContext_ingestCloudKitRecord_forAccountID_forceMerge_context___block_invoke;
  block[3] = &unk_1E76CDBF0;
  v22 = a5;
  v18 = v11;
  v19 = v10;
  v20 = self;
  v21 = v12;
  v14 = v12;
  v15 = v10;
  v16 = v11;
  dispatch_sync(v13, block);

}

uint64_t __71__ICCloudContext_ingestCloudKitRecord_forAccountID_forceMerge_context___block_invoke(uint64_t a1)
{
  NSObject *v2;

  v2 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __71__ICCloudContext_ingestCloudKitRecord_forAccountID_forceMerge_context___block_invoke_cold_1(a1);

  return objc_msgSend(*(id *)(a1 + 48), "_ingestCloudKitRecord:forAccountID:forceMerge:context:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 56));
}

- (void)_ingestCloudKitRecord:(id)a3 forAccountID:(id)a4 forceMerge:(BOOL)a5 context:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  ICCloudContext *v21;
  BOOL v22;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[ICCloudContext processingQueue](self, "processingQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v13);

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __72__ICCloudContext__ingestCloudKitRecord_forAccountID_forceMerge_context___block_invoke;
  v17[3] = &unk_1E76CDBF0;
  v18 = v12;
  v19 = v11;
  v20 = v10;
  v21 = self;
  v22 = a5;
  v14 = v10;
  v15 = v11;
  v16 = v12;
  objc_msgSend(v16, "performBlockAndWait:", v17);

}

void __72__ICCloudContext__ingestCloudKitRecord_forAccountID_forceMerge_context___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (+[ICAccount isCloudKitAccountAvailableInContext:](ICAccount, "isCloudKitAccountAvailableInContext:", *(_QWORD *)(a1 + 32)))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 56), "didFetchShare:accountID:context:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
      return;
    }
    objc_msgSend(*(id *)(a1 + 48), "recordType");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = +[ICUserSpecificRecordIDParser isUserSpecificRecordType:](ICUserSpecificRecordIDParser, "isUserSpecificRecordType:", v3);

    v5 = *(void **)(a1 + 56);
    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 48), "recordID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "existingCloudObjectForUserSpecificRecordID:createPlaceholderIfNecessary:accountID:context:", v6, 1, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
      v8 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "didFetchUserSpecificRecord:accountID:force:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64));
LABEL_14:

      return;
    }
    objc_msgSend(*(id *)(a1 + 56), "existingCloudObjectForRecord:accountID:context:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = v7;
      objc_msgSend(v7, "objectWasFetchedFromCloudWithRecord:accountID:force:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64));
      +[ICShareNotifier showNotificationIfNecessaryForCloudObject:accountID:](ICShareNotifier, "showNotificationIfNecessaryForCloudObject:accountID:", v8, *(_QWORD *)(a1 + 40));
      goto LABEL_14;
    }
    v8 = (id)objc_msgSend(*(id *)(a1 + 56), "newCloudObjectForRecord:accountID:context:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
    if (v8)
    {
      +[ICShareNotifier showNotificationIfNecessaryForCloudObject:accountID:](ICShareNotifier, "showNotificationIfNecessaryForCloudObject:accountID:", v8, *(_QWORD *)(a1 + 40));
      goto LABEL_14;
    }
  }
  else
  {
    v2 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __72__ICCloudContext__ingestCloudKitRecord_forAccountID_forceMerge_context___block_invoke_cold_1(a1);

  }
}

- (void)setAccountStatus:(int64_t)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0D64188], "sharedAppGroupDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInteger:forKey:", a3, CFSTR("CloudKitAccountStatus"));

  objc_msgSend(MEMORY[0x1E0D64188], "sharedAppGroupDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronize");

}

- (void)updateAccountStatusWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ICCloudContext processingQueue](self, "processingQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__ICCloudContext_updateAccountStatusWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E76C8430;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __59__ICCloudContext_updateAccountStatusWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "containersByAccountID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "containersByAccountID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __59__ICCloudContext_updateAccountStatusWithCompletionHandler___block_invoke_2;
    v7[3] = &unk_1E76CDC68;
    v5 = *(void **)(a1 + 40);
    v7[4] = *(_QWORD *)(a1 + 32);
    v8 = v5;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v7);

  }
  else
  {
    v6 = *(_QWORD *)(a1 + 40);
    if (v6)
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v6 + 16))(v6, 3, 0);
  }
}

void __59__ICCloudContext_updateAccountStatusWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __59__ICCloudContext_updateAccountStatusWithCompletionHandler___block_invoke_2_cold_1();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __59__ICCloudContext_updateAccountStatusWithCompletionHandler___block_invoke_165;
  v10[3] = &unk_1E76CDC40;
  v8 = *(void **)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 32);
  v11 = v5;
  v12 = v8;
  v9 = v5;
  objc_msgSend(v6, "accountStatusWithCompletionHandler:", v10);

}

void __59__ICCloudContext_updateAccountStatusWithCompletionHandler___block_invoke_165(id *a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;

  v5 = a3;
  objc_msgSend(a1[4], "processingQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__ICCloudContext_updateAccountStatusWithCompletionHandler___block_invoke_2_166;
  block[3] = &unk_1E76CDC18;
  v11 = v5;
  v7 = a1[5];
  v8 = a1[4];
  v12 = v7;
  v13 = v8;
  v15 = a2;
  v14 = a1[6];
  v9 = v5;
  dispatch_async(v6, block);

}

uint64_t __59__ICCloudContext_updateAccountStatusWithCompletionHandler___block_invoke_2_166(uint64_t a1)
{
  uint64_t *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t result;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = (uint64_t *)(a1 + 32);
  if (*(_QWORD *)(a1 + 32))
  {
    v3 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __59__ICCloudContext_updateAccountStatusWithCompletionHandler___block_invoke_2_166_cold_2(a1, v2, v3);

  }
  else
  {
    v4 = objc_msgSend(*(id *)(a1 + 48), "accountStatus");
    v5 = *(_QWORD *)(a1 + 64);
    v6 = os_log_create("com.apple.notes", "Cloud");
    v7 = v6;
    if (v4 == v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        __59__ICCloudContext_updateAccountStatusWithCompletionHandler___block_invoke_2_166_cold_1();

    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        CKStringFromAccountStatus();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = *(_QWORD *)(a1 + 40);
        v12 = 138412546;
        v13 = v8;
        v14 = 2112;
        v15 = v9;
        _os_log_impl(&dword_1BD918000, v7, OS_LOG_TYPE_DEFAULT, "CloudKit account status changed to %@ for account: %@", (uint8_t *)&v12, 0x16u);

      }
      objc_msgSend(*(id *)(a1 + 48), "setAccountStatus:", *(_QWORD *)(a1 + 64));
      objc_msgSend(*(id *)(a1 + 48), "setNeedsToUpdateSubscriptions:", 1);
      objc_msgSend(*(id *)(a1 + 48), "subscribedSubscriptionIDs");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeAllObjects");

      objc_msgSend(*(id *)(a1 + 48), "clearZoneFetchState");
    }
  }
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32));
  return result;
}

- (void)fetchUserRecordWithAccountID:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  NSObject *v9;
  void *v10;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  if (objc_msgSend(v6, "length"))
  {
    -[ICCloudContext containerForAccountID:](self, "containerForAccountID:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCloudContext fetchUserRecordWithContainer:completionHandler:](self, "fetchUserRecordWithContainer:completionHandler:", v8, v7);

  }
  else
  {
    v9 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[ICCloudContext fetchUserRecordWithAccountID:completionHandler:].cold.1();

    if (v7)
    {
      ICGenericError();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, 0, v10);

    }
  }

}

- (void)fetchUserRecordWithContainer:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  _QWORD *v19;
  id v20;
  _QWORD v21[5];
  _QWORD v22[5];
  id v23;
  id location;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C94E18], "fetchCurrentUserRecordOperation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setQualityOfService:", -[ICCloudContext qualityOfService](self, "qualityOfService"));
  v9 = -[ICCloudContext discretionaryNetworkBehavior](self, "discretionaryNetworkBehavior");
  objc_msgSend(v8, "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDiscretionaryNetworkBehavior:", v9);

  objc_msgSend(v6, "privateCloudDatabase");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDatabase:", v11);

  objc_initWeak(&location, v8);
  v12 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[ICCloudContext fetchUserRecordWithContainer:completionHandler:].cold.1();

  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__46;
  v22[4] = __Block_byref_object_dispose__46;
  v13 = MEMORY[0x1E0C809B0];
  v23 = 0;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __65__ICCloudContext_fetchUserRecordWithContainer_completionHandler___block_invoke;
  v21[3] = &unk_1E76CDC90;
  v21[4] = v22;
  objc_msgSend(v8, "setPerRecordCompletionBlock:", v21);
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __65__ICCloudContext_fetchUserRecordWithContainer_completionHandler___block_invoke_169;
  v17[3] = &unk_1E76CDCB8;
  objc_copyWeak(&v20, &location);
  v14 = v7;
  v18 = v14;
  v19 = v22;
  objc_msgSend(v8, "setFetchRecordsCompletionBlock:", v17);
  v15 = objc_alloc_init(MEMORY[0x1E0C94F88]);
  objc_msgSend(v15, "setName:", CFSTR("FetchUserRecord"));
  objc_msgSend(v15, "setQuantity:", 1);
  objc_msgSend(v15, "setExpectedSendSize:", 1);
  objc_msgSend(v15, "setExpectedReceiveSize:", 1);
  objc_msgSend(v8, "setGroup:", v15);
  v25[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudContext addOperations:](self, "addOperations:", v16);

  objc_destroyWeak(&v20);
  _Block_object_dispose(v22, 8);

  objc_destroyWeak(&location);
}

void __65__ICCloudContext_fetchUserRecordWithContainer_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;

  v7 = a2;
  v8 = a4;
  if (v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    v9 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __65__ICCloudContext_fetchUserRecordWithContainer_completionHandler___block_invoke_cold_2();
  }
  else
  {
    v9 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __91__ICMigrationUtilities_fetchMigrationStateAndUserRecordForAccountID_withCompletionHandler___block_invoke_cold_1();
  }

}

void __65__ICCloudContext_fetchUserRecordWithContainer_completionHandler___block_invoke_169(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;

  v4 = a3;
  v5 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __65__ICCloudContext_fetchUserRecordWithContainer_completionHandler___block_invoke_169_cold_2(a1);

  if (v4)
  {
    v6 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __91__ICMigrationUtilities_fetchMigrationStateAndUserRecordForAccountID_withCompletionHandler___block_invoke_5_cold_1();

  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, _QWORD, id))(v7 + 16))(v7, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v4);

}

+ (id)userRecordNameForContainer:(id)a3
{
  id v3;
  dispatch_semaphore_t v4;
  NSObject *v5;
  dispatch_time_t v6;
  id v7;
  _QWORD v9[4];
  NSObject *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v3 = a3;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "![NSThread isMainThread]", "+[ICCloudContext userRecordNameForContainer:]", 1, 0, CFSTR("Unexpected call from main thread"));
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__46;
  v16 = __Block_byref_object_dispose__46;
  v17 = 0;
  v4 = dispatch_semaphore_create(0);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45__ICCloudContext_userRecordNameForContainer___block_invoke;
  v9[3] = &unk_1E76CDCE0;
  v11 = &v12;
  v5 = v4;
  v10 = v5;
  objc_msgSend(v3, "fetchUserRecordIDWithCompletionHandler:", v9);
  v6 = dispatch_time(0, 120000000000);
  dispatch_semaphore_wait(v5, v6);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __45__ICCloudContext_userRecordNameForContainer___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "recordName");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  if (!v5 || v6)
  {
    v10 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __45__ICCloudContext_userRecordNameForContainer___block_invoke_cold_1();

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (id)existingCloudObjectForRecord:(id)a3 accountID:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "recordID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "recordType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICCloudContext existingCloudObjectForRecordID:recordType:accountID:context:](self, "existingCloudObjectForRecordID:recordType:accountID:context:", v11, v12, v9, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)existingCloudObjectForRecordID:(id)a3 recordType:(id)a4 accountID:(id)a5 context:(id)a6
{
  return -[ICCloudContext existingCloudObjectForRecordID:recordType:accountID:context:excludingRecordTypes:](self, "existingCloudObjectForRecordID:recordType:accountID:context:excludingRecordTypes:", a3, a4, a5, a6, 0);
}

- (id)existingCloudObjectForRecordID:(id)a3 recordType:(id)a4 accountID:(id)a5 context:(id)a6 excludingRecordTypes:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v31 = a6;
  v15 = a7;
  if (!v12 || !v14)
  {
    if (v12)
    {
      if (v14)
      {
LABEL_7:
        v18 = 0;
        goto LABEL_24;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "recordID", "-[ICCloudContext existingCloudObjectForRecordID:recordType:accountID:context:excludingRecordTypes:]", 1, 0, CFSTR("Trying to fetch a cloud object without a record ID"));
      if (v14)
        goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "accountID", "-[ICCloudContext existingCloudObjectForRecordID:recordType:accountID:context:excludingRecordTypes:]", 1, 0, CFSTR("Trying to fetch a cloud object without an account ID"));
    goto LABEL_7;
  }
  if (v13)
  {
    -[ICCloudContext cloudObjectClassesByRecordType](self, "cloudObjectClassesByRecordType");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "objectForKeyedSubscript:", v13);

    objc_msgSend(v17, "existingCloudObjectForRecordID:accountID:context:", v12, v14, v31);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    -[ICCloudContext cloudObjectClassesByRecordType](self, "cloudObjectClassesByRecordType");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "allKeys");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v21)
    {
      v22 = v21;
      v30 = 0;
      v23 = *(_QWORD *)v33;
      while (2)
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v33 != v23)
            objc_enumerationMutation(v20);
          v25 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
          if ((objc_msgSend(v15, "containsObject:", v25, v30) & 1) == 0)
          {
            -[ICCloudContext cloudObjectClassesByRecordType](self, "cloudObjectClassesByRecordType");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = (void *)objc_msgSend(v26, "objectForKeyedSubscript:", v25);

            objc_msgSend(v27, "existingCloudObjectForRecordID:accountID:context:", v12, v14, v31);
            v28 = objc_claimAutoreleasedReturnValue();
            if (v28)
            {
              v18 = (void *)v28;
              goto LABEL_21;
            }
          }
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        if (v22)
          continue;
        break;
      }
      v18 = 0;
LABEL_21:
      v13 = v30;
    }
    else
    {
      v18 = 0;
    }

  }
LABEL_24:

  return v18;
}

- (id)existingCloudObjectForUserSpecificRecordID:(id)a3 createPlaceholderIfNecessary:(BOOL)a4 accountID:(id)a5 context:(id)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  id v12;
  ICUserSpecificRecordIDParser *v13;
  void *v14;
  ICUserSpecificRecordIDParser *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;

  v8 = a4;
  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = [ICUserSpecificRecordIDParser alloc];
  objc_msgSend(v10, "recordName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[ICUserSpecificRecordIDParser initWithRecordName:](v13, "initWithRecordName:", v14);

  if (!v15)
  {
    v24 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[ICCloudContext existingCloudObjectForUserSpecificRecordID:createPlaceholderIfNecessary:accountID:context:].cold.1();
    goto LABEL_12;
  }
  -[ICCloudContext cloudObjectClassesByRecordType](self, "cloudObjectClassesByRecordType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICUserSpecificRecordIDParser sharedRecordType](v15, "sharedRecordType");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "objectForKeyedSubscript:", v17);

  if ((objc_msgSend(v18, "supportsUserSpecificRecords") & 1) == 0)
  {
    v24 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[ICCloudContext existingCloudObjectForUserSpecificRecordID:createPlaceholderIfNecessary:accountID:context:].cold.3();
LABEL_12:
    v21 = 0;
    v23 = v24;
LABEL_13:

    goto LABEL_14;
  }
  -[ICUserSpecificRecordIDParser sharedRecordID](v15, "sharedRecordID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICUserSpecificRecordIDParser sharedRecordType](v15, "sharedRecordType");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudContext existingCloudObjectForRecordID:recordType:accountID:context:](self, "existingCloudObjectForRecordID:recordType:accountID:context:", v19, v20, v11, v12);
  v21 = (id)objc_claimAutoreleasedReturnValue();

  if (!v21 && v8)
  {
    v22 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      -[ICCloudContext existingCloudObjectForUserSpecificRecordID:createPlaceholderIfNecessary:accountID:context:].cold.2();

    -[ICUserSpecificRecordIDParser sharedRecordID](v15, "sharedRecordID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICUserSpecificRecordIDParser sharedRecordType](v15, "sharedRecordType");
    v24 = objc_claimAutoreleasedReturnValue();
    v21 = -[ICCloudContext newPlaceholderObjectForRecordID:recordType:accountID:context:](self, "newPlaceholderObjectForRecordID:recordType:accountID:context:", v23, v24, v11, v12);
    goto LABEL_13;
  }
LABEL_14:

  return v21;
}

- (id)newCloudObjectForRecord:(id)a3 accountID:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[ICCloudContext cloudObjectClassesByRecordType](self, "cloudObjectClassesByRecordType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "recordType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "objectForKeyedSubscript:", v12);

  v14 = (void *)objc_msgSend(v13, "newCloudObjectForRecord:accountID:context:", v10, v9, v8);
  return v14;
}

- (id)newPlaceholderObjectForRecordID:(id)a3 recordType:(id)a4 accountID:(id)a5 context:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[ICCloudContext cloudObjectClassesByRecordType](self, "cloudObjectClassesByRecordType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "objectForKeyedSubscript:", v12);

  objc_msgSend(v13, "recordName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)objc_msgSend(v15, "newPlaceholderObjectForRecordName:accountID:context:", v16, v11, v10);
  return v17;
}

- (void)fetchCloudObjects:(id)a3 accountID:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "count"))
  {
    if (-[ICCloudContext isFetchingEnabled](self, "isFetchingEnabled"))
    {
      objc_msgSend(MEMORY[0x1E0C97B80], "ic_objectIDsFromObjects:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICCloudContext processingQueue](self, "processingQueue");
      v12 = objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __64__ICCloudContext_fetchCloudObjects_accountID_completionHandler___block_invoke;
      v15[3] = &unk_1E76C8408;
      v15[4] = self;
      v16 = v11;
      v17 = v9;
      v18 = v10;
      v13 = v11;
      dispatch_async(v12, v15);

      goto LABEL_9;
    }
    v14 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BD918000, v14, OS_LOG_TYPE_INFO, "Trying to fetch cloud objects, but fetching is disabled", buf, 2u);
    }

  }
  if (v10)
    (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
LABEL_9:

}

void __64__ICCloudContext_fetchCloudObjects_accountID_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "backgroundContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__ICCloudContext_fetchCloudObjects_accountID_completionHandler___block_invoke_2;
  v8[3] = &unk_1E76C7708;
  v9 = *(id *)(a1 + 40);
  v10 = v3;
  v11 = v2;
  v4 = v2;
  v7 = v3;
  objc_msgSend(v7, "performBlockAndWait:", v8);
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v4, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addFetchOperationsForRecordIDs:accountID:qualityOfService:operationGroupName:completionHandler:", v6, *(_QWORD *)(a1 + 48), 17, 0, *(_QWORD *)(a1 + 56));

}

void __64__ICCloudContext_fetchCloudObjects_accountID_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  +[ICCloudSyncingObject ic_objectsFromObjectIDs:context:](ICCloudSyncingObject, "ic_objectsFromObjectIDs:context:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6), "recordID");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
          objc_msgSend(*(id *)(a1 + 48), "addObject:", v7);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)fetchRecordIDs:(id)a3 accountID:(id)a4 operationGroupName:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[ICCloudContext processingQueue](self, "processingQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__ICCloudContext_fetchRecordIDs_accountID_operationGroupName_completionHandler___block_invoke;
  block[3] = &unk_1E76CDD08;
  block[4] = self;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  dispatch_async(v14, block);

}

uint64_t __80__ICCloudContext_fetchRecordIDs_accountID_operationGroupName_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addFetchOperationsForRecordIDs:accountID:qualityOfService:operationGroupName:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 17, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (void)addFetchOperationsForRecordIDs:(id)a3 accountID:(id)a4 qualityOfService:(int64_t)a5 operationGroupName:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[5];
  id v34;
  id v35;
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v16 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    -[ICCloudContext addFetchOperationsForRecordIDs:accountID:qualityOfService:operationGroupName:completionHandler:].cold.1(v12, (const char *)v16);

  -[ICCloudContext operationsToFetchRecordIDs:qualityOfService:operationGroupName:accountID:](self, "operationsToFetchRecordIDs:qualityOfService:operationGroupName:accountID:", v12, a5, v14, v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudContext operationQueue](self, "operationQueue");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addOperations:waitUntilFinished:", v17, 0);

  if (v15)
  {
    v28 = v12;
    v19 = (void *)MEMORY[0x1E0CB34C8];
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __113__ICCloudContext_addFetchOperationsForRecordIDs_accountID_qualityOfService_operationGroupName_completionHandler___block_invoke;
    v33[3] = &unk_1E76C7780;
    v33[4] = self;
    v20 = v17;
    v34 = v20;
    v35 = v15;
    objc_msgSend(v19, "blockOperationWithBlock:", v33);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setName:", CFSTR("FetchCompletion"));
    objc_msgSend(v21, "ic_setResistsCancellation:", 1);
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v22 = v20;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v30;
      do
      {
        v26 = 0;
        do
        {
          if (*(_QWORD *)v30 != v25)
            objc_enumerationMutation(v22);
          objc_msgSend(v21, "addDependency:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v26++));
        }
        while (v24 != v26);
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      }
      while (v24);
    }

    v36 = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCloudContext addOperations:](self, "addOperations:", v27);

    v12 = v28;
  }

}

void __113__ICCloudContext_addFetchOperationsForRecordIDs_accountID_qualityOfService_operationGroupName_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD block[5];
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "processingQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __113__ICCloudContext_addFetchOperationsForRecordIDs_accountID_qualityOfService_operationGroupName_completionHandler___block_invoke_2;
  block[3] = &unk_1E76C7780;
  v3 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v6 = *(id *)(a1 + 48);
  dispatch_async(v2, block);

}

void __113__ICCloudContext_addFetchOperationsForRecordIDs_accountID_qualityOfService_operationGroupName_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  objc_msgSend((id)objc_opt_class(), "errorFromOperations:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __113__ICCloudContext_addFetchOperationsForRecordIDs_accountID_qualityOfService_operationGroupName_completionHandler___block_invoke_3;
  v5[3] = &unk_1E76C9218;
  v3 = *(id *)(a1 + 48);
  v6 = v2;
  v7 = v3;
  v4 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

uint64_t __113__ICCloudContext_addFetchOperationsForRecordIDs_accountID_qualityOfService_operationGroupName_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)operationsToFetchRecordIDs:(id)a3 qualityOfService:(int64_t)a4 operationGroupName:(id)a5 accountID:(id)a6
{
  id v10;
  __CFString *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  os_log_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  id v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[4];
  id v31;
  ICCloudContext *v32;
  id v33;
  _QWORD *v34;
  int64_t v35;
  _QWORD v36[4];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = (__CFString *)a5;
  v12 = a6;
  if (objc_msgSend(v12, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "objectsByDatabaseScope:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = 0;
    v36[1] = v36;
    v36[2] = 0x2020000000;
    v36[3] = 0;
    -[ICCloudContext containerForAccountID:](self, "containerForAccountID:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __91__ICCloudContext_operationsToFetchRecordIDs_qualityOfService_operationGroupName_accountID___block_invoke;
    v30[3] = &unk_1E76CDD30;
    v16 = v15;
    v31 = v16;
    v32 = self;
    v35 = a4;
    v17 = v13;
    v33 = v17;
    v34 = v36;
    objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v30);
    if (!v11)
      v11 = CFSTR("FetchIndividualRecords");
    v18 = objc_alloc_init(MEMORY[0x1E0C94F88]);
    objc_msgSend(v18, "setName:", v11);
    objc_msgSend(v18, "setQuantity:", objc_msgSend(v10, "count"));
    objc_msgSend(v18, "setExpectedSendSize:", 1);
    objc_msgSend(v18, "setExpectedReceiveSize:", CKOperationGroupTransferSizeForBytes());
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v19 = (os_log_t)v17;
    v20 = -[NSObject countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v26, v37, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v27;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v27 != v21)
            objc_enumerationMutation(v19);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v22++), "setGroup:", v18, (_QWORD)v26);
        }
        while (v20 != v22);
        v20 = -[NSObject countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v26, v37, 16);
      }
      while (v20);
    }

    v23 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v18, "ic_loggingDescription");
      objc_claimAutoreleasedReturnValue();
      -[ICCloudContext operationsToFetchRecordIDs:qualityOfService:operationGroupName:accountID:].cold.2();
    }

    v24 = -[NSObject copy](v19, "copy");
    _Block_object_dispose(v36, 8);

  }
  else
  {
    v19 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[ICCloudContext operationsToFetchRecordIDs:qualityOfService:operationGroupName:accountID:].cold.1();
    v24 = (id)MEMORY[0x1E0C9AA60];
  }

  return v24;
}

void __91__ICCloudContext_operationsToFetchRecordIDs_qualityOfService_operationGroupName_accountID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "databaseWithDatabaseScope:", objc_msgSend(a2, "integerValue"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "operationsToFetchRecordIDs:database:qualityOfService:", v5, v8, *(_QWORD *)(a1 + 64));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "addObjectsFromArray:", v6);
  v7 = objc_msgSend(v5, "count");

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) += 10240 * v7;
}

- (id)operationsToFetchRecordIDs:(id)a3 database:(id)a4 qualityOfService:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  int v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  int v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ic_arrayByGroupingIntoArraysWithMaxCount:", 100);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v11, "count") >= 2)
  {
    v12 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v20 = objc_msgSend(v8, "count");
      objc_msgSend(v9, "databaseScope");
      CKDatabaseScopeString();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109634;
      v28 = v20;
      v29 = 2112;
      v30 = v21;
      v31 = 1024;
      v32 = objc_msgSend(v11, "count");
      _os_log_debug_impl(&dword_1BD918000, v12, OS_LOG_TYPE_DEBUG, "Grouping fetch requests for %d %@ records into %d batches", buf, 0x18u);

    }
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v23;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v23 != v16)
          objc_enumerationMutation(v13);
        -[ICCloudContext operationToFetchRecordIDs:database:qualityOfService:](self, "operationToFetchRecordIDs:database:qualityOfService:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v17), v9, a5, (_QWORD)v22);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v18);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v15);
  }

  return v10;
}

- (id)operationToFetchRecordIDs:(id)a3 database:(id)a4 qualityOfService:(int64_t)a5
{
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v22;
  _QWORD v24[5];
  id v25;
  _QWORD v26[5];
  id v27;
  _QWORD v28[5];
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  id location;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v22 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94E18]), "initWithRecordIDs:", v7);
  objc_msgSend(v8, "setQualityOfService:", a5);
  objc_msgSend(v8, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDiscretionaryNetworkBehavior:", 0);

  objc_msgSend(v8, "setDatabase:", v22);
  objc_initWeak(&location, v8);
  v10 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v8, "ic_loggingDescription");
    objc_claimAutoreleasedReturnValue();
    -[ICCloudContext operationToFetchRecordIDs:database:qualityOfService:].cold.1();
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v11 = v7;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v31;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v31 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v14);
        v16 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v15, "ic_loggingDescription");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "ic_loggingDescription");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v36 = v17;
          v37 = 2112;
          v38 = v18;
          _os_log_debug_impl(&dword_1BD918000, v16, OS_LOG_TYPE_DEBUG, "Will fetch %@ %@", buf, 0x16u);

        }
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    }
    while (v12);
  }

  v19 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __70__ICCloudContext_operationToFetchRecordIDs_database_qualityOfService___block_invoke;
  v28[3] = &unk_1E76CDD58;
  v28[4] = self;
  objc_copyWeak(&v29, &location);
  objc_msgSend(v8, "setPerRecordProgressBlock:", v28);
  v26[0] = v19;
  v26[1] = 3221225472;
  v26[2] = __70__ICCloudContext_operationToFetchRecordIDs_database_qualityOfService___block_invoke_2;
  v26[3] = &unk_1E76CDD80;
  v26[4] = self;
  objc_copyWeak(&v27, &location);
  objc_msgSend(v8, "setPerRecordCompletionBlock:", v26);
  v24[0] = v19;
  v24[1] = 3221225472;
  v24[2] = __70__ICCloudContext_operationToFetchRecordIDs_database_qualityOfService___block_invoke_3;
  v24[3] = &unk_1E76CDDA8;
  v24[4] = self;
  objc_copyWeak(&v25, &location);
  objc_msgSend(v8, "setFetchRecordsCompletionBlock:", v24);
  v20 = v8;
  objc_destroyWeak(&v25);
  objc_destroyWeak(&v27);
  objc_destroyWeak(&v29);

  objc_destroyWeak(&location);
  return v20;
}

void __70__ICCloudContext_operationToFetchRecordIDs_database_qualityOfService___block_invoke(uint64_t a1, void *a2, double a3)
{
  void *v4;
  id *v5;
  id v6;
  id WeakRetained;

  v4 = *(void **)(a1 + 32);
  v5 = (id *)(a1 + 40);
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(v4, "fetchOperation:progressChangedWithRecordID:progress:", WeakRetained, v6, a3);

}

void __70__ICCloudContext_operationToFetchRecordIDs_database_qualityOfService___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  void *v6;
  id *v7;
  id v8;
  id v9;
  id v10;
  id WeakRetained;

  v6 = *(void **)(a1 + 32);
  v7 = (id *)(a1 + 40);
  v8 = a4;
  v9 = a3;
  v10 = a2;
  WeakRetained = objc_loadWeakRetained(v7);
  objc_msgSend(v6, "fetchOperation:recordWasFetchedWithRecordID:record:error:", WeakRetained, v9, v10, v8);

}

void __70__ICCloudContext_operationToFetchRecordIDs_database_qualityOfService___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id *v6;
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  id v11;

  v5 = *(void **)(a1 + 32);
  v6 = (id *)(a1 + 40);
  v7 = a3;
  v8 = a2;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(v5, "fetchOperation:didCompleteWithRecordsByRecordID:error:", WeakRetained, v8, v7);

  v10 = *(void **)(a1 + 32);
  v11 = objc_loadWeakRetained(v6);
  objc_msgSend(v10, "informCloudAnalyticsDelegateForOperationDidEnd:recordsByRecordID:operationError:", v11, v8, v7);

}

- (void)fetchOperation:(id)a3 progressChangedWithRecordID:(id)a4 progress:(double)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (((int)(a5 * 100.0) - 1) <= 0x62)
  {
    v9 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v8, "ic_loggingDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "ic_loggingDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412802;
      v13 = v10;
      v14 = 1024;
      v15 = (int)(a5 * 100.0);
      v16 = 2112;
      v17 = v11;
      _os_log_debug_impl(&dword_1BD918000, v9, OS_LOG_TYPE_DEBUG, "Progress fetching %@: %d%% %@", (uint8_t *)&v12, 0x1Cu);

    }
  }

}

- (void)fetchOperation:(id)a3 recordWasFetchedWithRecordID:(id)a4 record:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[ICCloudContext processingQueue](self, "processingQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__ICCloudContext_fetchOperation_recordWasFetchedWithRecordID_record_error___block_invoke;
  block[3] = &unk_1E76CDDF8;
  block[4] = self;
  v20 = v10;
  v21 = v13;
  v22 = v11;
  v23 = v12;
  v15 = v12;
  v16 = v11;
  v17 = v13;
  v18 = v10;
  dispatch_async(v14, block);

}

void __75__ICCloudContext_fetchOperation_recordWasFetchedWithRecordID_record_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "backgroundContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __75__ICCloudContext_fetchOperation_recordWasFetchedWithRecordID_record_error___block_invoke_2;
  v5[3] = &unk_1E76CDDD0;
  v3 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v7 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  v9 = *(id *)(a1 + 64);
  v10 = v2;
  v4 = v2;
  objc_msgSend(v4, "performBlockAndWait:", v5);

}

void __75__ICCloudContext_fetchOperation_recordWasFetchedWithRecordID_record_error___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  char isKindOfClass;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "database");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountIDForDatabase:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_QWORD *)(a1 + 48))
  {
    v5 = *(void **)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 64), "recordType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "existingCloudObjectForRecordID:recordType:accountID:context:", v6, v7, v4, *(_QWORD *)(a1 + 72));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v9 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 56), "ic_loggingDescription");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "ic_loggingDescription");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 138413058;
        v33 = v4;
        v34 = 2112;
        v35 = v26;
        v36 = 2112;
        v37 = v27;
        v38 = 2112;
        v39 = v28;
        _os_log_error_impl(&dword_1BD918000, v9, OS_LOG_TYPE_ERROR, "Failed to find existing cloud object for fetch error in account ID %@: %@ %@: %@", buf, 0x2Au);

      }
    }
    if (objc_msgSend(*(id *)(a1 + 48), "code") == 26 || objc_msgSend(*(id *)(a1 + 48), "code") == 11)
    {
      v10 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(*(id *)(a1 + 56), "ic_loggingDescription");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "ic_loggingDescription");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v33 = v4;
        v34 = 2112;
        v35 = v22;
        v36 = 2112;
        v37 = v23;
        _os_log_debug_impl(&dword_1BD918000, v10, OS_LOG_TYPE_DEBUG, "Tried to fetch record that doesn't exist in account ID %@: %@ %@", buf, 0x20u);

      }
      objc_msgSend(v8, "objectWasFetchedButDoesNotExistInCloud");
      if (objc_msgSend(*(id *)(a1 + 48), "code") != 26)
        goto LABEL_22;
      v11 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 56), "zoneID");
      v12 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "receivedZoneNotFound:operation:context:", v12, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72));
    }
    else
    {
      v12 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 56), "ic_loggingDescription");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "ic_loggingDescription");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 138413058;
        v33 = v4;
        v34 = 2112;
        v35 = v29;
        v36 = 2112;
        v37 = v30;
        v38 = 2112;
        v39 = v31;
        _os_log_error_impl(&dword_1BD918000, v12, OS_LOG_TYPE_ERROR, "Failed to fetch in account ID %@: %@ %@: %@", buf, 0x2Au);

      }
    }

LABEL_22:
    if (!v8)
    {
LABEL_26:

      goto LABEL_27;
    }
    objc_msgSend(*(id *)(a1 + 32), "objectIDsToRetry");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v19);
    goto LABEL_24;
  }
  v13 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 64), "ic_loggingDescription");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "ic_loggingDescription");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v33 = v4;
    v34 = 2112;
    v35 = v24;
    v36 = 2112;
    v37 = v25;
    _os_log_debug_impl(&dword_1BD918000, v13, OS_LOG_TYPE_DEBUG, "Fetched in account ID %@: %@ %@", buf, 0x20u);

  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v15 = *(void **)(a1 + 32);
  if ((isKindOfClass & 1) == 0)
  {
    v16 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 64), "recordType");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "existingCloudObjectForRecordID:recordType:accountID:context:", v16, v17, v4, *(_QWORD *)(a1 + 72));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v18 = (void *)objc_msgSend(*(id *)(a1 + 32), "newCloudObjectForRecord:accountID:context:", *(_QWORD *)(a1 + 64), v4, *(_QWORD *)(a1 + 72));
      goto LABEL_25;
    }
    objc_msgSend(v8, "objectWasFetchedFromCloudWithRecord:accountID:", *(_QWORD *)(a1 + 64), v4);
    objc_msgSend(*(id *)(a1 + 32), "objectIDsToRetry");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "removeObject:", v19);
LABEL_24:

LABEL_25:
    goto LABEL_26;
  }
  objc_msgSend(*(id *)(a1 + 32), "didFetchShare:accountID:context:", *(_QWORD *)(a1 + 64), v4, *(_QWORD *)(a1 + 72));
LABEL_27:
  v20 = *(void **)(a1 + 72);
  objc_msgSend(*(id *)(a1 + 40), "operationID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "ic_saveWithLogDescription:", CFSTR("fetch records operation %@"), v21);

}

- (void)fetchOperation:(id)a3 didCompleteWithRecordsByRecordID:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  ICCloudContext *v15;

  v7 = a3;
  v8 = a5;
  -[ICCloudContext processingQueue](self, "processingQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__ICCloudContext_fetchOperation_didCompleteWithRecordsByRecordID_error___block_invoke;
  block[3] = &unk_1E76C7708;
  v13 = v8;
  v14 = v7;
  v15 = self;
  v10 = v7;
  v11 = v8;
  dispatch_async(v9, block);

}

void __72__ICCloudContext_fetchOperation_didCompleteWithRecordsByRecordID_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = os_log_create("com.apple.notes", "Cloud");
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __72__ICCloudContext_fetchOperation_didCompleteWithRecordsByRecordID_error___block_invoke_cold_2();

    objc_msgSend(*(id *)(a1 + 48), "startRetryTimerIfNecessaryWithError:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __72__ICCloudContext_fetchOperation_didCompleteWithRecordsByRecordID_error___block_invoke_cold_1(a1);

  }
}

- (void)didFetchShare:(id)a3 accountID:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  os_log_t v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "rootRecordID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("RootRecord"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "recordID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("RootRecordType"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    if (v11)
    {
LABEL_5:
      -[ICCloudContext existingCloudObjectForRecordID:recordType:accountID:context:](self, "existingCloudObjectForRecordID:recordType:accountID:context:", v11, v13, v9, v10);
      v14 = (os_log_t)objc_claimAutoreleasedReturnValue();
      v15 = os_log_create("com.apple.notes", "Cloud");
      v16 = v15;
      if (v14)
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          -[ICCloudContext didFetchShare:accountID:context:].cold.1(v8, v14, v16);

        -[NSObject setServerShareIfNewer:](v14, "setServerShareIfNewer:", v8);
      }
      else
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v8, "recordID");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "ic_loggingDescription");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = 138412290;
          v24 = v21;
          _os_log_impl(&dword_1BD918000, v16, OS_LOG_TYPE_DEFAULT, "Received share for unknown object: %@", (uint8_t *)&v23, 0xCu);

        }
      }
      goto LABEL_18;
    }
  }
  else
  {
    v17 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[ICCloudContext didFetchShare:accountID:context:].cold.2();

    if (v11)
      goto LABEL_5;
  }
  v14 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "recordID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "ic_loggingDescription");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138412290;
    v24 = v19;
    _os_log_impl(&dword_1BD918000, v14, OS_LOG_TYPE_DEFAULT, "Received a share with no root record ID: %@", (uint8_t *)&v23, 0xCu);

  }
LABEL_18:

  -[ICCloudContext cloudContextDelegate](self, "cloudContextDelegate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "cloudContext:didFetchShare:accountID:", self, v8, v9);

}

- (void)pushCloudObjects:(id)a3 operationGroupName:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD v21[4];
  _QWORD v22[5];
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[ICCloudContext objectsByAccount:](ICCloudContext, "objectsByAccount:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__46;
  v22[4] = __Block_byref_object_dispose__46;
  v23 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v21[3] = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __72__ICCloudContext_pushCloudObjects_operationGroupName_completionHandler___block_invoke;
  v15[3] = &unk_1E76CDE48;
  v15[4] = self;
  v12 = v9;
  v16 = v12;
  v19 = v22;
  v13 = v11;
  v17 = v13;
  v20 = v21;
  v14 = v10;
  v18 = v14;
  objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v15);

  _Block_object_dispose(v21, 8);
  _Block_object_dispose(v22, 8);

}

void __72__ICCloudContext_pushCloudObjects_operationGroupName_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v21 = 0;
  v22 = 0;
  objc_msgSend(v6, "_filterCloudSyncingObjects:accountID:objectsToSave:objectsToDelete:objectsToDeleteShares:objectsToSaveUserSpecificRecord:", a3, v5, &v22, &v21, 0, 0);
  v7 = v22;
  v8 = v21;
  v9 = *(void **)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __72__ICCloudContext_pushCloudObjects_operationGroupName_completionHandler___block_invoke_2;
  v15[3] = &unk_1E76CDE20;
  v11 = *(_QWORD *)(a1 + 64);
  v16 = v5;
  v19 = v11;
  v12 = *(id *)(a1 + 48);
  v13 = *(_QWORD *)(a1 + 72);
  v17 = v12;
  v20 = v13;
  v18 = *(id *)(a1 + 56);
  v14 = v5;
  objc_msgSend(v9, "addModifyRecordsOperationsWithCloudObjectsToSave:delete:accountID:operationGroupName:waitForDependencies:completionHandler:", v7, v8, v14, v10, 0, v15);

}

void __72__ICCloudContext_pushCloudObjects_operationGroupName_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  id v6;
  unint64_t v7;
  uint64_t v8;

  v4 = a2;
  if (v4)
  {
    v5 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __72__ICCloudContext_pushCloudObjects_operationGroupName_completionHandler___block_invoke_2_cold_1();

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
  }
  v6 = *(id *)(a1 + 40);
  objc_sync_enter(v6);
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  objc_sync_exit(v6);

  v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  if (v7 >= objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v8 = *(_QWORD *)(a1 + 48);
    if (v8)
      (*(void (**)(uint64_t, _QWORD))(v8 + 16))(v8, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  }

}

- (void)deleteSharesForObjects:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  id v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD v14[4];
  _QWORD v15[5];
  id v16;

  v6 = a3;
  v7 = a4;
  +[ICCloudContext objectsByAccount:](ICCloudContext, "objectsByAccount:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x3032000000;
    v15[3] = __Block_byref_object_copy__46;
    v15[4] = __Block_byref_object_dispose__46;
    v16 = 0;
    v14[0] = 0;
    v14[1] = v14;
    v14[2] = 0x2020000000;
    v14[3] = 0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __59__ICCloudContext_deleteSharesForObjects_completionHandler___block_invoke;
    v9[3] = &unk_1E76CDE70;
    v9[4] = self;
    v12 = v15;
    v10 = v8;
    v13 = v14;
    v11 = v7;
    objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v9);

    _Block_object_dispose(v14, 8);
    _Block_object_dispose(v15, 8);

  }
  else if (v7)
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

void __59__ICCloudContext_deleteSharesForObjects_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;

  v5 = a2;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __59__ICCloudContext_deleteSharesForObjects_completionHandler___block_invoke_2;
  v11[3] = &unk_1E76CDE20;
  v6 = *(_QWORD *)(a1 + 56);
  v12 = v5;
  v15 = v6;
  v7 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 64);
  v13 = v8;
  v16 = v9;
  v14 = *(id *)(a1 + 48);
  v10 = v5;
  objc_msgSend(v7, "deleteSharesForObjects:accountID:completionHandler:", a3, v10, v11);

}

void __59__ICCloudContext_deleteSharesForObjects_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  id v6;
  unint64_t v7;
  uint64_t v8;

  v4 = a2;
  if (v4)
  {
    v5 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __59__ICCloudContext_deleteSharesForObjects_completionHandler___block_invoke_2_cold_1();

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
  }
  v6 = *(id *)(a1 + 40);
  objc_sync_enter(v6);
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  objc_sync_exit(v6);

  v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  if (v7 >= objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v8 = *(_QWORD *)(a1 + 48);
    if (v8)
      (*(void (**)(uint64_t, _QWORD))(v8 + 16))(v8, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  }

}

- (void)deleteSharesForObjects:(id)a3 accountID:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[5];
  id v38;
  id v39;
  _QWORD aBlock[4];
  id v41;
  id v42;
  id v43;
  id v44;
  id location;
  _QWORD v46[4];
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  void *v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v32 = a4;
  v9 = a5;
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v12 = v8;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v49 != v14)
          objc_enumerationMutation(v12);
        v16 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        if (objc_msgSend(v16, "isSharedRootObject"))
        {
          objc_msgSend(v10, "addObject:", v16);
          objc_msgSend(v16, "objectID");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v17);

        }
      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
    }
    while (v13);
  }

  if (objc_msgSend(v10, "count") && objc_msgSend(MEMORY[0x1E0D64290], "isInternetReachable"))
  {
    v18 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      -[ICCloudContext deleteSharesForObjects:accountID:completionHandler:].cold.1();

    v19 = MEMORY[0x1E0C809B0];
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __69__ICCloudContext_deleteSharesForObjects_accountID_completionHandler___block_invoke;
    v46[3] = &unk_1E76CDE98;
    v20 = v32;
    v47 = v20;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v46);
    -[ICCloudContext operationsToModifyRecordsForCloudObjectsToSave:delete:deleteShares:saveUserSpecificRecords:operationGroupName:addDependencies:accountID:](self, "operationsToModifyRecordsForCloudObjectsToSave:delete:deleteShares:saveUserSpecificRecords:operationGroupName:addDependencies:accountID:", 0, 0, v10, 0, CFSTR("DeleteShares"), 0, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCloudContext addOperations:](self, "addOperations:", v21);
    objc_initWeak(&location, self);
    aBlock[0] = v19;
    aBlock[1] = 3221225472;
    aBlock[2] = __69__ICCloudContext_deleteSharesForObjects_accountID_completionHandler___block_invoke_197;
    aBlock[3] = &unk_1E76CDF28;
    objc_copyWeak(&v44, &location);
    v43 = v9;
    v41 = v11;
    v42 = v20;
    v22 = _Block_copy(aBlock);
    v23 = (void *)MEMORY[0x1E0CB34C8];
    v37[0] = v19;
    v37[1] = 3221225472;
    v37[2] = __69__ICCloudContext_deleteSharesForObjects_accountID_completionHandler___block_invoke_6;
    v37[3] = &unk_1E76C7780;
    v37[4] = self;
    v24 = v21;
    v38 = v24;
    v31 = v22;
    v39 = v31;
    objc_msgSend(v23, "blockOperationWithBlock:", v37);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setName:", CFSTR("deleteSharesForObjectsFetchAndCompletion"));
    objc_msgSend(v25, "ic_setResistsCancellation:", 1);
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v26 = v24;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v33, v53, 16);
    if (v27)
    {
      v28 = *(_QWORD *)v34;
      do
      {
        for (j = 0; j != v27; ++j)
        {
          if (*(_QWORD *)v34 != v28)
            objc_enumerationMutation(v26);
          objc_msgSend(v25, "addDependency:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * j));
        }
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v33, v53, 16);
      }
      while (v27);
    }

    v52 = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v52, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCloudContext addOperations:](self, "addOperations:", v30);

    objc_destroyWeak(&v44);
    objc_destroyWeak(&location);

  }
  else if (v9)
  {
    (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
  }

}

void __69__ICCloudContext_deleteSharesForObjects_accountID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __69__ICCloudContext_deleteSharesForObjects_accountID_completionHandler___block_invoke_cold_1(a1, v3);

}

void __69__ICCloudContext_deleteSharesForObjects_accountID_completionHandler___block_invoke_197(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id to;

  v3 = a2;
  objc_copyWeak(&to, (id *)(a1 + 56));
  v4 = objc_loadWeakRetained(&to);

  if (v4)
  {
    v5 = objc_loadWeakRetained(&to);
    objc_msgSend(v5, "backgroundContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v8 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __69__ICCloudContext_deleteSharesForObjects_accountID_completionHandler___block_invoke_2;
    v20[3] = &unk_1E76C7708;
    v21 = *(id *)(a1 + 32);
    v9 = v6;
    v22 = v9;
    v10 = v7;
    v23 = v10;
    objc_msgSend(v9, "performBlockAndWait:", v20);
    v11 = objc_loadWeakRetained(&to);
    objc_msgSend(v10, "allObjects");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1 + 40);
    v15[0] = v8;
    v15[1] = 3221225472;
    v15[2] = __69__ICCloudContext_deleteSharesForObjects_accountID_completionHandler___block_invoke_3;
    v15[3] = &unk_1E76CDF00;
    objc_copyWeak(&v19, &to);
    v16 = *(id *)(a1 + 32);
    v17 = v3;
    v18 = *(id *)(a1 + 48);
    objc_msgSend(v11, "fetchRecordZoneChangesForZoneIDs:accountID:reason:completionHandler:", v12, v13, CFSTR("SyncAfterDeleteShare"), v15);

    objc_destroyWeak(&v19);
  }
  else
  {
    v14 = *(_QWORD *)(a1 + 48);
    if (v14)
      (*(void (**)(uint64_t, _QWORD))(v14 + 16))(v14, 0);
  }
  objc_destroyWeak(&to);

}

void __69__ICCloudContext_deleteSharesForObjects_accountID_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  +[ICCloudSyncingObject ic_objectsFromObjectIDs:context:](ICCloudSyncingObject, "ic_objectsFromObjectIDs:context:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(a1 + 48);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v6), "recordID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "zoneID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v9);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  objc_msgSend(*(id *)(a1 + 40), "ic_save");

}

void __69__ICCloudContext_deleteSharesForObjects_accountID_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "backgroundContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __69__ICCloudContext_deleteSharesForObjects_accountID_completionHandler___block_invoke_4;
  v12[3] = &unk_1E76C95A8;
  v13 = *(id *)(a1 + 32);
  v6 = v5;
  v14 = v6;
  v15 = &v16;
  objc_msgSend(v6, "performBlockAndWait:", v12);
  if (*((_BYTE *)v17 + 24)
    && (objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D63F58], 213, 0),
        (v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v8 = v7;
    v9 = v8;
  }
  else
  {
    if (v3)
      v10 = v3;
    else
      v10 = *(id *)(a1 + 40);
    v9 = v10;
    v8 = 0;
  }
  v11 = *(_QWORD *)(a1 + 48);
  if (v11)
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v9);

  _Block_object_dispose(&v16, 8);
}

void __69__ICCloudContext_deleteSharesForObjects_accountID_completionHandler___block_invoke_4(_QWORD *a1)
{
  id v2;

  +[ICCloudSyncingObject ic_objectsFromObjectIDs:context:](ICCloudSyncingObject, "ic_objectsFromObjectIDs:context:", a1[4], a1[5]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v2, "ic_containsObjectPassingTest:", &__block_literal_global_201);

}

BOOL __69__ICCloudContext_deleteSharesForObjects_accountID_completionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "serverShare");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

void __69__ICCloudContext_deleteSharesForObjects_accountID_completionHandler___block_invoke_6(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD block[5];
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "processingQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__ICCloudContext_deleteSharesForObjects_accountID_completionHandler___block_invoke_7;
  block[3] = &unk_1E76C7780;
  v3 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v6 = *(id *)(a1 + 48);
  dispatch_async(v2, block);

}

void __69__ICCloudContext_deleteSharesForObjects_accountID_completionHandler___block_invoke_7(uint64_t a1)
{
  id v2;

  objc_msgSend((id)objc_opt_class(), "errorFromOperations:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)addModifyRecordsOperationsWithCloudObjectsToSave:(id)a3 delete:(id)a4 accountID:(id)a5 operationGroupName:(id)a6 waitForDependencies:(BOOL)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v22;
  id v23;
  _QWORD block[5];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  BOOL v30;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  if (objc_msgSend(v14, "count") || objc_msgSend(v15, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C97B80], "ic_objectIDsFromObjects:", v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C97B80], "ic_objectIDsFromObjects:", v15);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCloudContext processingQueue](self, "processingQueue");
    v21 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __141__ICCloudContext_addModifyRecordsOperationsWithCloudObjectsToSave_delete_accountID_operationGroupName_waitForDependencies_completionHandler___block_invoke;
    block[3] = &unk_1E76CDF78;
    block[4] = self;
    v25 = v19;
    v26 = v20;
    v27 = v16;
    v28 = v17;
    v30 = a7;
    v29 = v18;
    v22 = v20;
    v23 = v19;
    dispatch_async(v21, block);

  }
  else if (v18)
  {
    (*((void (**)(id, _QWORD))v18 + 2))(v18, 0);
  }

}

void __141__ICCloudContext_addModifyRecordsOperationsWithCloudObjectsToSave_delete_accountID_operationGroupName_waitForDependencies_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  char v14;

  objc_msgSend(*(id *)(a1 + 32), "backgroundContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __141__ICCloudContext_addModifyRecordsOperationsWithCloudObjectsToSave_delete_accountID_operationGroupName_waitForDependencies_completionHandler___block_invoke_2;
  v6[3] = &unk_1E76CDF50;
  v7 = *(id *)(a1 + 40);
  v8 = v2;
  v3 = *(id *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v10 = v4;
  v11 = *(id *)(a1 + 56);
  v12 = *(id *)(a1 + 64);
  v14 = *(_BYTE *)(a1 + 80);
  v13 = *(id *)(a1 + 72);
  v5 = v2;
  objc_msgSend(v5, "performBlockAndWait:", v6);

}

void __141__ICCloudContext_addModifyRecordsOperationsWithCloudObjectsToSave_delete_accountID_operationGroupName_waitForDependencies_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  +[ICCloudSyncingObject ic_objectsFromObjectIDs:context:](ICCloudSyncingObject, "ic_objectsFromObjectIDs:context:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  +[ICCloudSyncingObject ic_objectsFromObjectIDs:context:](ICCloudSyncingObject, "ic_objectsFromObjectIDs:context:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "_addModifyRecordsOperationsWithCloudObjectsToSave:delete:accountID:operationGroupName:waitForDependencies:completionHandler:", v3, v2, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(unsigned __int8 *)(a1 + 88), *(_QWORD *)(a1 + 80));

}

- (void)_addModifyRecordsOperationsWithCloudObjectsToSave:(id)a3 delete:(id)a4 accountID:(id)a5 operationGroupName:(id)a6 waitForDependencies:(BOOL)a7 completionHandler:(id)a8
{
  _BOOL8 v8;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[5];
  id v30;
  id v31;
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v8 = a7;
  v34 = *MEMORY[0x1E0C80C00];
  v14 = a8;
  -[ICCloudContext operationsToModifyRecordsForCloudObjectsToSave:delete:deleteShares:saveUserSpecificRecords:operationGroupName:addDependencies:accountID:](self, "operationsToModifyRecordsForCloudObjectsToSave:delete:deleteShares:saveUserSpecificRecords:operationGroupName:addDependencies:accountID:", a3, a4, 0, 0, a6, v8, a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudContext addOperations:](self, "addOperations:", v15);
  if (v14)
  {
    v16 = (void *)MEMORY[0x1E0CB34C8];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __142__ICCloudContext__addModifyRecordsOperationsWithCloudObjectsToSave_delete_accountID_operationGroupName_waitForDependencies_completionHandler___block_invoke;
    v29[3] = &unk_1E76C7780;
    v29[4] = self;
    v17 = v15;
    v30 = v17;
    v31 = v14;
    objc_msgSend(v16, "blockOperationWithBlock:", v29);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setName:", CFSTR("ModifyCompletion"));
    objc_msgSend(v18, "ic_setResistsCancellation:", 1);
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v19 = v17;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v26;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v26 != v22)
            objc_enumerationMutation(v19);
          objc_msgSend(v18, "addDependency:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v23++));
        }
        while (v21 != v23);
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      }
      while (v21);
    }

    v32 = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCloudContext addOperations:](self, "addOperations:", v24);

  }
}

void __142__ICCloudContext__addModifyRecordsOperationsWithCloudObjectsToSave_delete_accountID_operationGroupName_waitForDependencies_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD block[5];
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "processingQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __142__ICCloudContext__addModifyRecordsOperationsWithCloudObjectsToSave_delete_accountID_operationGroupName_waitForDependencies_completionHandler___block_invoke_2;
  block[3] = &unk_1E76C7780;
  v3 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v6 = *(id *)(a1 + 48);
  dispatch_async(v2, block);

}

void __142__ICCloudContext__addModifyRecordsOperationsWithCloudObjectsToSave_delete_accountID_operationGroupName_waitForDependencies_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend((id)objc_opt_class(), "errorFromOperations:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (id)operationsToModifyRecordsForCloudObjectsToSave:(id)a3 delete:(id)a4 deleteShares:(id)a5 saveUserSpecificRecords:(id)a6 operationGroupName:(id)a7 addDependencies:(BOOL)a8 accountID:(id)a9
{
  id v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t k;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t m;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t n;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  os_log_t v60;
  id v61;
  id v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t ii;
  NSObject *v67;
  NSObject *v68;
  void *v69;
  void *v70;
  id v71;
  id v74;
  void *v75;
  __CFString *v76;
  id v77;
  id v78;
  id v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  void *v85;
  void *v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _QWORD v91[4];
  os_log_t v92;
  ICCloudContext *v93;
  id v94;
  id v95;
  _BYTE *v96;
  BOOL v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  _BYTE v118[32];
  _BYTE v119[32];
  uint8_t v120[128];
  _BYTE buf[24];
  uint64_t v122;
  _BYTE v123[128];
  _BYTE v124[128];
  _BYTE v125[128];
  _BYTE v126[128];
  _BYTE v127[128];
  uint64_t v128;

  v128 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v78 = a4;
  v77 = a5;
  v74 = a6;
  v76 = (__CFString *)a7;
  v79 = a9;
  v75 = v13;
  if (v79)
  {
    if (objc_msgSend(v13, "count"))
    {
      v14 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[ICCloudContext operationsToModifyRecordsForCloudObjectsToSave:delete:deleteShares:saveUserSpecificRecords:operationGroupName:addDependencies:accountID:].cold.6();

    }
    if (objc_msgSend(v78, "count"))
    {
      v15 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        -[ICCloudContext operationsToModifyRecordsForCloudObjectsToSave:delete:deleteShares:saveUserSpecificRecords:operationGroupName:addDependencies:accountID:].cold.5();

    }
    if (objc_msgSend(v77, "count"))
    {
      v16 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        -[ICCloudContext operationsToModifyRecordsForCloudObjectsToSave:delete:deleteShares:saveUserSpecificRecords:operationGroupName:addDependencies:accountID:].cold.4();

    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v116 = 0u;
    v117 = 0u;
    v114 = 0u;
    v115 = 0u;
    v17 = v13;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v114, v127, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v115;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v115 != v19)
            objc_enumerationMutation(v17);
          v21 = *(void **)(*((_QWORD *)&v114 + 1) + 8 * i);
          objc_msgSend(v21, "recordID");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (v22)
            objc_msgSend(v81, "setObject:forKeyedSubscript:", v21, v22);

        }
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v114, v127, 16);
      }
      while (v18);
    }

    v23 = v76;
    if (!v76)
      v23 = CFSTR("ModifyRecords");
    v76 = (__CFString *)v23;
    v83 = objc_alloc_init(MEMORY[0x1E0C94F88]);
    objc_msgSend(v83, "setName:", v76);
    objc_msgSend(v83, "setQuantity:", objc_msgSend(v78, "count") + objc_msgSend(v17, "count") + objc_msgSend(v77, "count"));
    objc_msgSend(v83, "setExpectedReceiveSize:", 1);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "deduplicatedRecordsForCloudObjects:", v17);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = (void *)objc_msgSend(v24, "mutableCopy");

    objc_msgSend((id)objc_opt_class(), "deduplicatedRecordsForCloudObjects:", v78);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = (void *)objc_msgSend(v25, "mutableCopy");

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v112 = 0u;
    v113 = 0u;
    v110 = 0u;
    v111 = 0u;
    v26 = v77;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v110, v126, 16);
    if (v27)
    {
      v28 = *(_QWORD *)v111;
      do
      {
        for (j = 0; j != v27; ++j)
        {
          if (*(_QWORD *)v111 != v28)
            objc_enumerationMutation(v26);
          v30 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * j);
          objc_msgSend(v30, "serverShare");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (v31)
          {
            objc_msgSend(v86, "addObject:", v31);
            objc_msgSend(v30, "recordID");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            if (v32)
            {
              objc_msgSend(v30, "recordID");
              v33 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "recordID");
              v34 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v85, "setObject:forKeyedSubscript:", v33, v34);
            }
            else
            {
              v34 = os_log_create("com.apple.notes", "Cloud");
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v30, "shortLoggingDescription");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                *(_QWORD *)&buf[4] = v35;
                *(_WORD *)&buf[12] = 2112;
                *(_QWORD *)&buf[14] = v79;
                _os_log_impl(&dword_1BD918000, v34, OS_LOG_TYPE_DEFAULT, "No root record ID when trying to delete share for %@ for account ID %@", buf, 0x16u);

              }
              v33 = v34;
            }

          }
          else
          {
            v33 = os_log_create("com.apple.notes", "Cloud");
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v30, "serverRecord");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "ic_loggingDescription");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)&buf[4] = v37;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v79;
              _os_log_error_impl(&dword_1BD918000, v33, OS_LOG_TYPE_ERROR, "Record to delete share from doesn't have a server share %@ for account ID %@", buf, 0x16u);

            }
            v32 = v33;
          }

        }
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v110, v126, 16);
      }
      while (v27);
    }

    v108 = 0u;
    v109 = 0u;
    v106 = 0u;
    v107 = 0u;
    v38 = v74;
    v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v106, v125, 16);
    if (v39)
    {
      v40 = *(_QWORD *)v107;
      do
      {
        for (k = 0; k != v39; ++k)
        {
          if (*(_QWORD *)v107 != v40)
            objc_enumerationMutation(v38);
          objc_msgSend(*(id *)(*((_QWORD *)&v106 + 1) + 8 * k), "makeUserSpecificCloudKitRecordForApproach:", 0);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          if (v42)
            objc_msgSend(v80, "addObject:", v42);

        }
        v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v106, v125, 16);
      }
      while (v39);
    }

    v104 = 0u;
    v105 = 0u;
    v102 = 0u;
    v103 = 0u;
    v43 = v78;
    v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v102, v124, 16);
    if (v44)
    {
      v45 = *(_QWORD *)v103;
      do
      {
        for (m = 0; m != v44; ++m)
        {
          if (*(_QWORD *)v103 != v45)
            objc_enumerationMutation(v43);
          objc_msgSend(*(id *)(*((_QWORD *)&v102 + 1) + 8 * m), "userSpecificServerRecord");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "ic_addNonNilObject:", v47);

        }
        v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v102, v124, 16);
      }
      while (v44);
    }

    objc_msgSend((id)objc_opt_class(), "objectsByDatabaseScope:", v80);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "objectsByDatabaseScope:", v86);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCloudContext containerForAccountID:](self, "containerForAccountID:", v79);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = 0u;
    v101 = 0u;
    v98 = 0u;
    v99 = 0u;
    v51 = objc_msgSend(&unk_1E771ABD8, "countByEnumeratingWithState:objects:count:", &v98, v123, 16);
    if (v51)
    {
      v52 = *(_QWORD *)v99;
      do
      {
        for (n = 0; n != v51; ++n)
        {
          if (*(_QWORD *)v99 != v52)
            objc_enumerationMutation(&unk_1E771ABD8);
          v54 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * n);
          objc_msgSend(v50, "databaseWithDatabaseScope:", objc_msgSend(v54, "integerValue"));
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "objectForKeyedSubscript:", v54);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "objectForKeyedSubscript:", v54);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          -[ICCloudContext operationsToModifyRecordsToSave:delete:rootRecordIDsByShareID:database:](self, "operationsToModifyRecordsToSave:delete:rootRecordIDsByShareID:database:", v56, v57, v85, v55);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "addObjectsFromArray:", v58);

        }
        v51 = objc_msgSend(&unk_1E771ABD8, "countByEnumeratingWithState:objects:count:", &v98, v123, 16);
      }
      while (v51);
    }
    -[ICCloudContext operationToSaveZonesIfNecessaryForAccountID:](self, "operationToSaveZonesIfNecessaryForAccountID:", v79);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v122 = 0;
    v91[0] = MEMORY[0x1E0C809B0];
    v91[1] = 3221225472;
    v91[2] = __154__ICCloudContext_operationsToModifyRecordsForCloudObjectsToSave_delete_deleteShares_saveUserSpecificRecords_operationGroupName_addDependencies_accountID___block_invoke;
    v91[3] = &unk_1E76CDFA0;
    v60 = v81;
    v96 = buf;
    v97 = a8;
    v92 = v60;
    v93 = self;
    v61 = v59;
    v94 = v61;
    v62 = v82;
    v95 = v62;
    objc_msgSend(v62, "enumerateObjectsUsingBlock:", v91);
    objc_msgSend(v83, "setExpectedSendSize:", CKOperationGroupTransferSizeForBytes());
    if (v61)
      objc_msgSend(v62, "addObject:", v61);
    v89 = 0u;
    v90 = 0u;
    v87 = 0u;
    v88 = 0u;
    v63 = v62;
    v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v87, v120, 16);
    if (v64)
    {
      v65 = *(_QWORD *)v88;
      do
      {
        for (ii = 0; ii != v64; ++ii)
        {
          if (*(_QWORD *)v88 != v65)
            objc_enumerationMutation(v63);
          objc_msgSend(*(id *)(*((_QWORD *)&v87 + 1) + 8 * ii), "setGroup:", v83);
        }
        v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v87, v120, 16);
      }
      while (v64);
    }

    if ((unint64_t)objc_msgSend(v63, "count") >= 2)
    {
      v67 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
        -[ICCloudContext operationsToModifyRecordsForCloudObjectsToSave:delete:deleteShares:saveUserSpecificRecords:operationGroupName:addDependencies:accountID:].cold.3((uint64_t)v79, (uint64_t)v119, objc_msgSend(v63, "count"), v67);

    }
    v68 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v83, "ic_loggingDescription");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICCloudContext operationsToModifyRecordsForCloudObjectsToSave:delete:deleteShares:saveUserSpecificRecords:operationGroupName:addDependencies:accountID:].cold.2(v69, (uint64_t)v79, (uint64_t)v118);
    }

    v70 = v95;
    v71 = v63;

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v60 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      -[ICCloudContext operationsToModifyRecordsForCloudObjectsToSave:delete:deleteShares:saveUserSpecificRecords:operationGroupName:addDependencies:accountID:].cold.1();
    v71 = (id)MEMORY[0x1E0C9AA60];
  }

  return v71;
}

void __154__ICCloudContext_operationsToModifyRecordsForCloudObjectsToSave_delete_deleteShares_saveUserSpecificRecords_operationGroupName_addDependencies_accountID___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  unint64_t v27;
  __int16 v28;
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_opt_class();
  v20 = v4;
  ICDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(v5, "recordsToSave");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v12 = *(void **)(a1 + 32);
        objc_msgSend(v11, "recordID", v20);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "objectWillBePushedToCloudWithOperation:", v5);
        v15 = objc_msgSend(v11, "size");
        if (v15 > 0x100000)
        {
          v16 = os_log_create("com.apple.notes", "Cloud");
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v11, "ic_loggingDescription");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218242;
            v27 = v15;
            v28 = 2112;
            v29 = v17;
            _os_log_error_impl(&dword_1BD918000, v16, OS_LOG_TYPE_ERROR, "Record size (%lu bytes) exceeds CloudKit limit for record: %@", buf, 0x16u);

          }
          objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICCloudContext operationsToModifyRecordsForCloudObjectsToSave:delete:deleteShares:saveUserSpecificRecords:operationGroupName:addDependencies:accountID:]_block_invoke", 1, 1, CFSTR("Oversized CloudKit Record"));
        }
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) += v15;

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v8);
  }

  if (*(_BYTE *)(a1 + 72))
    objc_msgSend(*(id *)(a1 + 40), "addDependenciesForModifyRecordsOperation:", v5);
  if (*(_QWORD *)(a1 + 48))
    objc_msgSend(v5, "addDependency:");
  if (a3)
  {
    v18 = 0;
    do
    {
      objc_msgSend(*(id *)(a1 + 56), "objectAtIndexedSubscript:", v18, v20);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addDependency:", v19);

      ++v18;
    }
    while (a3 != v18);
  }

}

+ (void)batchRecordsToSave:(id)a3 delete:(id)a4 maxRecordCountPerBatch:(unint64_t)a5 maxRecordSizePerBatch:(unint64_t)a6 withBlock:(id)a7
{
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  NSObject *v22;
  int v23;
  void *v24;
  int v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  BOOL v30;
  char v31;
  _BOOL4 v32;
  NSObject *v33;
  _BOOL4 v34;
  void *v35;
  void *v36;
  unint64_t v37;
  BOOL v38;
  NSObject *v39;
  NSObject *v40;
  NSObject *v41;
  NSObject *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  _BOOL4 v58;
  void (**v59)(id, _QWORD, void *, void *);
  uint64_t v60;
  void *v63;
  uint8_t v64;
  _BYTE v65[15];
  uint8_t v66;
  _BYTE v67[15];
  _BYTE v68[16];
  _BYTE v69[16];
  _BYTE v70[16];
  _QWORD v71[2];
  uint8_t buf[4];
  _BYTE v73[10];
  _BYTE v74[10];
  _BYTE v75[10];
  unint64_t v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v59 = (void (**)(id, _QWORD, void *, void *))a7;
  v11 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v9, "ic_map:", &__block_literal_global_215);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "ic_map:", &__block_literal_global_216);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)v73 = v54;
    *(_WORD *)&v73[8] = 2112;
    *(_QWORD *)v74 = v55;
    *(_WORD *)&v74[8] = 2048;
    *(_QWORD *)v75 = a5;
    *(_WORD *)&v75[8] = 2048;
    v76 = a6;
    _os_log_debug_impl(&dword_1BD918000, v11, OS_LOG_TYPE_DEBUG, "Batching with recordsToSave:%@ recordsToDelete:%@, maxRecordCountPerBatch:%lu, maxRecordSizePerBatch:%lu", buf, 0x2Au);

  }
  v57 = v9;
  v12 = (void *)objc_msgSend(v9, "mutableCopy");
  v56 = v10;
  v13 = (void *)objc_msgSend(v10, "mutableCopy");
  v14 = 0;
  while (objc_msgSend(v12, "count") || objc_msgSend(v13, "count"))
  {
    v60 = v14 + 1;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a5);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    while (1)
    {
      if (objc_msgSend(v12, "count"))
      {
        objc_msgSend(v12, "firstObject");
        v17 = objc_claimAutoreleasedReturnValue();
        -[NSObject recordType](v17, "recordType");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("Media"));

        if ((unint64_t)objc_msgSend(v12, "count") < 2)
        {
          v20 = 0;
        }
        else
        {
          objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v20, "recordType");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("Attachment"));

        v26 = -[NSObject size](v17, "size");
        if ((v19 & v25) == 1)
        {
          v27 = v26 + v16 + objc_msgSend(v20, "size");
          v28 = objc_msgSend(v15, "count");
          v29 = v28 + objc_msgSend(v63, "count") + 2;
          v30 = v27 >= a6 || v29 > a5;
          v31 = !v30;
          v32 = !v30 || v16 != 0;
          if (v32)
          {
            if ((v31 & 1) == 0)
            {
              v33 = os_log_create("com.apple.notes", "Cloud");
              if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
              {
                v58 = v29 <= a5;
                v34 = v27 < a6;
                -[NSObject recordID](v17, "recordID");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "recordID");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 67109890;
                *(_DWORD *)v73 = v34;
                *(_WORD *)&v73[4] = 1024;
                *(_DWORD *)&v73[6] = v58;
                *(_WORD *)v74 = 2112;
                *(_QWORD *)&v74[2] = v35;
                *(_WORD *)v75 = 2112;
                *(_QWORD *)&v75[2] = v36;
                _os_log_debug_impl(&dword_1BD918000, v33, OS_LOG_TYPE_DEBUG, "Ending batch because Media/Attachment pair does not fit isSizeOK: %d isCountOK: %d Media: %@ Attachment: %@", buf, 0x22u);

              }
              goto LABEL_39;
            }
          }
          else
          {
            v41 = os_log_create("com.apple.notes", "Cloud");
            if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
            {
              -[NSObject recordID](v17, "recordID");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "recordID");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)v73 = v47;
              *(_WORD *)&v73[8] = 2112;
              *(_QWORD *)v74 = v48;
              _os_log_error_impl(&dword_1BD918000, v41, OS_LOG_TYPE_ERROR, "Ending batch because an impossible batch was detected ICCloudContext. Media: %@ Attachment: %@", buf, 0x16u);

            }
          }
          v42 = os_log_create("com.apple.notes", "Cloud");
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
          {
            -[NSObject recordID](v17, "recordID");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "recordID");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)v73 = v45;
            *(_WORD *)&v73[8] = 2112;
            *(_QWORD *)v74 = v46;
            _os_log_debug_impl(&dword_1BD918000, v42, OS_LOG_TYPE_DEBUG, "Adding Media/Attachment pair to batch: %@ %@", buf, 0x16u);

          }
          v23 = !v32;

          objc_msgSend(v12, "removeObjectsInRange:", 0, 2);
          v71[0] = v17;
          v71[1] = v20;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 2);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObjectsFromArray:", v43);

          v16 = v27;
        }
        else
        {
          v37 = v26 + v16;
          if (v16)
            v38 = 0;
          else
            v38 = v37 >= a6;
          v23 = v38;
          if (v38 || v37 < a6)
          {
            if (v23)
            {
              v39 = os_log_create("com.apple.notes", "Cloud");
              if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
                +[ICCloudContext batchRecordsToSave:delete:maxRecordCountPerBatch:maxRecordSizePerBatch:withBlock:].cold.4((uint64_t)v70, (uint64_t)v17);

            }
            v40 = os_log_create("com.apple.notes", "Cloud");
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
              +[ICCloudContext batchRecordsToSave:delete:maxRecordCountPerBatch:maxRecordSizePerBatch:withBlock:].cold.3((uint64_t)v69, (uint64_t)v17);

            objc_msgSend(v12, "removeObjectAtIndex:", 0);
            objc_msgSend(v15, "addObject:", v17);
            v16 = v37;
          }
          else
          {
            v33 = os_log_create("com.apple.notes", "Cloud");
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
              +[ICCloudContext batchRecordsToSave:delete:maxRecordCountPerBatch:maxRecordSizePerBatch:withBlock:].cold.5((uint64_t)v68, (uint64_t)v17);
LABEL_39:

            v23 = 1;
          }
        }

        goto LABEL_54;
      }
      if (objc_msgSend(v13, "count"))
      {
        objc_msgSend(v13, "firstObject");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "recordID");
        v17 = objc_claimAutoreleasedReturnValue();

        v22 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v73 = v17;
          _os_log_debug_impl(&dword_1BD918000, v22, OS_LOG_TYPE_DEBUG, "Adding record to delete batch: %@", buf, 0xCu);
        }

        objc_msgSend(v13, "removeObjectAtIndex:", 0);
        objc_msgSend(v63, "addObject:", v17);
        v23 = 0;
      }
      else
      {
        v17 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          +[ICCloudContext batchRecordsToSave:delete:maxRecordCountPerBatch:maxRecordSizePerBatch:withBlock:].cold.2(&v66, v67, v17);
        v23 = 1;
      }
LABEL_54:

      v44 = objc_msgSend(v15, "count");
      if (objc_msgSend(v63, "count") + v44 >= a5)
        break;
      if (v23)
        goto LABEL_63;
    }
    v49 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
      +[ICCloudContext batchRecordsToSave:delete:maxRecordCountPerBatch:maxRecordSizePerBatch:withBlock:].cold.1(&v64, v65, v49);

LABEL_63:
    v50 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v15, "ic_map:", &__block_literal_global_218);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v73 = v53;
      *(_WORD *)&v73[8] = 2112;
      *(_QWORD *)v74 = v63;
      _os_log_debug_impl(&dword_1BD918000, v50, OS_LOG_TYPE_DEBUG, "Finished batch with batchRecordsToSave:%@ batchRecordIDsToDelete:%@", buf, 0x16u);

    }
    v51 = (void *)objc_msgSend(v15, "copy");
    v52 = (void *)objc_msgSend(v63, "copy");
    v14 = v60;
    v59[2](v59, v60, v51, v52);

  }
}

uint64_t __99__ICCloudContext_batchRecordsToSave_delete_maxRecordCountPerBatch_maxRecordSizePerBatch_withBlock___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ic_loggingDescription");
}

uint64_t __99__ICCloudContext_batchRecordsToSave_delete_maxRecordCountPerBatch_maxRecordSizePerBatch_withBlock___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ic_loggingDescription");
}

uint64_t __99__ICCloudContext_batchRecordsToSave_delete_maxRecordCountPerBatch_maxRecordSizePerBatch_withBlock___block_invoke_217(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ic_loggingDescription");
}

- (id)operationsToModifyRecordsToSave:(id)a3 delete:(id)a4 rootRecordIDsByShareID:(id)a5 database:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v15 = (void *)MEMORY[0x1E0C9AA60];
    if (v11)
      goto LABEL_3;
LABEL_5:
    v18 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_6;
  }
  objc_msgSend((id)objc_opt_class(), "sortedRecords:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
    goto LABEL_5;
LABEL_3:
  objc_msgSend((id)objc_opt_class(), "sortedRecords:", v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "reverseObjectEnumerator");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "allObjects");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  v19 = (void *)objc_opt_class();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __89__ICCloudContext_operationsToModifyRecordsToSave_delete_rootRecordIDsByShareID_database___block_invoke;
  v26[3] = &unk_1E76CE048;
  v26[4] = self;
  v27 = v12;
  v28 = v13;
  v20 = v14;
  v29 = v20;
  v21 = v13;
  v22 = v12;
  objc_msgSend(v19, "batchRecordsToSave:delete:maxRecordCountPerBatch:maxRecordSizePerBatch:withBlock:", v15, v18, 100, 0x200000, v26);
  v23 = v29;
  v24 = v20;

  return v24;
}

void __89__ICCloudContext_operationsToModifyRecordsToSave_delete_rootRecordIDsByShareID_database___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "operationToModifyRecordsToSave:delete:rootRecordIDsByShareID:database:", a3, a4, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "addObject:", v5);

}

- (id)operationToModifyRecordsToSave:(id)a3 delete:(id)a4 rootRecordIDsByShareID:(id)a5 database:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  _BOOL8 v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v41;
  id v42;
  ICCloudContext *v43;
  void *v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t v54[128];
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  void *v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v42 = a5;
  v12 = a6;
  v13 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[ICCloudContext operationToModifyRecordsToSave:delete:rootRecordIDsByShareID:database:].cold.2();

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94F10]), "initWithRecordsToSave:recordIDsToDelete:", v10, v11);
  objc_msgSend(v14, "setQualityOfService:", -[ICCloudContext qualityOfService](self, "qualityOfService"));
  v15 = -[ICCloudContext discretionaryNetworkBehavior](self, "discretionaryNetworkBehavior");
  objc_msgSend(v14, "configuration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setDiscretionaryNetworkBehavior:", v15);

  objc_msgSend(v14, "setDatabase:", v12);
  v17 = -[ICCloudContext enableLongLivedOperations](self, "enableLongLivedOperations");
  objc_msgSend(v14, "configuration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setLongLived:", v17);

  if (-[ICCloudContext disableAutomaticallyRetryNetworkFailures](self, "disableAutomaticallyRetryNetworkFailures"))
  {
    objc_msgSend(v14, "configuration");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setAutomaticallyRetryNetworkFailures:", 0);

  }
  v41 = v12;
  v43 = self;
  v44 = v11;
  v45 = v10;
  v20 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    -[ICCloudContext operationToModifyRecordsToSave:delete:rootRecordIDsByShareID:database:].cold.1(v14);

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v21 = v14;
  objc_msgSend(v14, "recordsToSave");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v51;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v51 != v25)
          objc_enumerationMutation(v22);
        v27 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v26);
        v28 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v27, "ic_loggingDescription");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "ic_loggingDescription");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v56 = v29;
          v57 = 2112;
          v58 = v30;
          _os_log_debug_impl(&dword_1BD918000, v28, OS_LOG_TYPE_DEBUG, "Will push %@ %@", buf, 0x16u);

        }
        ++v26;
      }
      while (v24 != v26);
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
    }
    while (v24);
  }

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  objc_msgSend(v21, "recordIDsToDelete");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v47;
    do
    {
      v35 = 0;
      do
      {
        if (*(_QWORD *)v47 != v34)
          objc_enumerationMutation(v31);
        v36 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v35);
        v37 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v36, "ic_loggingDescription");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "ic_loggingDescription");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v56 = v38;
          v57 = 2112;
          v58 = v39;
          _os_log_debug_impl(&dword_1BD918000, v37, OS_LOG_TYPE_DEBUG, "Will delete %@ %@", buf, 0x16u);

        }
        ++v35;
      }
      while (v33 != v35);
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    }
    while (v33);
  }

  -[ICCloudContext addCallbackBlocksToModifyRecordsOperation:rootRecordIDsByShareID:](v43, "addCallbackBlocksToModifyRecordsOperation:rootRecordIDsByShareID:", v21, v42);
  return v21;
}

- (void)addCallbackBlocksToModifyRecordsOperation:(id)a3 rootRecordIDsByShareID:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, v6);
  v8 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __83__ICCloudContext_addCallbackBlocksToModifyRecordsOperation_rootRecordIDsByShareID___block_invoke;
  v18[3] = &unk_1E76CE070;
  v18[4] = self;
  objc_copyWeak(&v19, &location);
  objc_msgSend(v6, "setPerRecordSaveBlock:", v18);
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __83__ICCloudContext_addCallbackBlocksToModifyRecordsOperation_rootRecordIDsByShareID___block_invoke_2;
  v15[3] = &unk_1E76CE098;
  v15[4] = self;
  objc_copyWeak(&v17, &location);
  v9 = v7;
  v16 = v9;
  objc_msgSend(v6, "setPerRecordDeleteBlock:", v15);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __83__ICCloudContext_addCallbackBlocksToModifyRecordsOperation_rootRecordIDsByShareID___block_invoke_3;
  v13[3] = &unk_1E76CE0C0;
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v14 = v10;
  objc_msgSend(v6, "setPerRecordProgressBlock:", v13);
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __83__ICCloudContext_addCallbackBlocksToModifyRecordsOperation_rootRecordIDsByShareID___block_invoke_222;
  v11[3] = &unk_1E76CE0E8;
  v11[4] = self;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v6, "setModifyRecordsCompletionBlock:", v11);
  objc_destroyWeak(&v12);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

void __83__ICCloudContext_addCallbackBlocksToModifyRecordsOperation_rootRecordIDsByShareID___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  void *v6;
  id *v7;
  id v8;
  id v9;
  id v10;
  id WeakRetained;

  v6 = *(void **)(a1 + 32);
  v7 = (id *)(a1 + 40);
  v8 = a4;
  v9 = a3;
  v10 = a2;
  WeakRetained = objc_loadWeakRetained(v7);
  objc_msgSend(v6, "modifyRecordsOperation:recordWasSavedWithRecordID:record:error:", WeakRetained, v10, v9, v8);

}

void __83__ICCloudContext_addCallbackBlocksToModifyRecordsOperation_rootRecordIDsByShareID___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id *v6;
  id v7;
  id v8;
  id WeakRetained;

  v5 = *(void **)(a1 + 32);
  v6 = (id *)(a1 + 48);
  v7 = a3;
  v8 = a2;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(v5, "modifyRecordsOperation:recordWasDeletedWithRecordID:rootRecordIDsByShareID:error:", WeakRetained, v8, *(_QWORD *)(a1 + 40), v7);

}

void __83__ICCloudContext_addCallbackBlocksToModifyRecordsOperation_rootRecordIDsByShareID___block_invoke_3(uint64_t a1, void *a2, double a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = a2;
  v6 = v5;
  if (((int)(a3 * 100.0) - 1) <= 0x61)
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v5, "recordID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9 || (objc_msgSend(v9, "timeIntervalSinceNow"), v10 < -0.7))
    {
      v11 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        __83__ICCloudContext_addCallbackBlocksToModifyRecordsOperation_rootRecordIDsByShareID___block_invoke_3_cold_1(v6, (int)(a3 * 100.0), v11);

      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(void **)(a1 + 32);
      objc_msgSend(v6, "recordID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, v14);

    }
  }

}

void __83__ICCloudContext_addCallbackBlocksToModifyRecordsOperation_rootRecordIDsByShareID___block_invoke_222(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v5;
  id *v6;
  id v7;
  id WeakRetained;
  void *v9;
  id v10;

  v5 = *(void **)(a1 + 32);
  v6 = (id *)(a1 + 40);
  v7 = a4;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(v5, "modifyRecordsOperation:didCompleteWithError:", WeakRetained, v7);

  v9 = *(void **)(a1 + 32);
  v10 = objc_loadWeakRetained(v6);
  objc_msgSend(v9, "informCloudAnalyticsDelegateForOperationDidEnd:recordsByRecordID:operationError:", v10, MEMORY[0x1E0C9AA70], v7);

}

- (void)modifyRecordsOperation:(id)a3 recordWasSavedWithRecordID:(id)a4 record:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[ICCloudContext processingQueue](self, "processingQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__ICCloudContext_modifyRecordsOperation_recordWasSavedWithRecordID_record_error___block_invoke;
  block[3] = &unk_1E76CDDF8;
  block[4] = self;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  dispatch_async(v14, block);

}

void __81__ICCloudContext_modifyRecordsOperation_recordWasSavedWithRecordID_record_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "backgroundContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __81__ICCloudContext_modifyRecordsOperation_recordWasSavedWithRecordID_record_error___block_invoke_2;
  v5[3] = &unk_1E76CDDD0;
  v3 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v7 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  v9 = *(id *)(a1 + 64);
  v10 = v2;
  v4 = v2;
  objc_msgSend(v4, "performBlockAndWait:", v5);

}

uint64_t __81__ICCloudContext_modifyRecordsOperation_recordWasSavedWithRecordID_record_error___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "modifyRecordsOperation:recordWasSavedWithRecordID:record:error:context:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
}

- (void)modifyRecordsOperation:(id)a3 recordWasSavedWithRecordID:(id)a4 record:(id)a5 error:(id)a6 context:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  int v22;
  NSObject *v23;
  _BOOL4 v24;
  void *v25;
  int v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  unint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (!v14)
  {
    if (objc_msgSend(v15, "code") == 14)
    {
      objc_msgSend(v15, "userInfo");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0C949B8]);
      v14 = (id)objc_claimAutoreleasedReturnValue();

      if (!v14)
        objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "record != ((void *)0)", "-[ICCloudContext modifyRecordsOperation:recordWasSavedWithRecordID:record:error:context:]", 1, 1, CFSTR("Missing server record for CKErrorServerRecordChanged"));
    }
    else
    {
      v14 = 0;
    }
  }
  objc_msgSend(v12, "database");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudContext accountIDForDatabase:](self, "accountIDForDatabase:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = +[ICUserSpecificRecordIDParser isUserSpecificRecordID:](ICUserSpecificRecordIDParser, "isUserSpecificRecordID:", v13);
  if (v15)
  {
    if (v20)
    {
      -[ICCloudContext existingCloudObjectForUserSpecificRecordID:createPlaceholderIfNecessary:accountID:context:](self, "existingCloudObjectForUserSpecificRecordID:createPlaceholderIfNecessary:accountID:context:", v13, 0, v19, v16);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "didFailToSaveUserSpecificRecordWithID:accountID:error:", v13, v19, v15);
    }
    else
    {
      -[ICCloudContext existingCloudObjectForRecordID:recordType:accountID:context:](self, "existingCloudObjectForRecordID:recordType:accountID:context:", v13, 0, v19, v16);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "objectFailedToBePushedToCloudWithOperation:recordID:error:", v12, v13, v15);
    }
    v26 = v22;
    if (!v21)
    {
      v27 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v13, "ic_loggingDescription");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "ic_loggingDescription");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v46 = v19;
        v47 = 2112;
        v48 = v44;
        v49 = 2112;
        v50 = v43;
        v51 = 2112;
        v52 = v15;
        _os_log_error_impl(&dword_1BD918000, v27, OS_LOG_TYPE_ERROR, "Failed to find existing cloud object for modify error in account ID %@: %@ %@: %@", buf, 0x2Au);

      }
    }
    objc_msgSend(v21, "objectID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v28)
      v26 = 0;

    if (v26 == 1)
    {
      -[ICCloudContext objectIDsToRetry](self, "objectIDsToRetry");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "addObject:", v30);

    }
    v31 = objc_msgSend(v15, "code");
    if (v31 <= 0x1F && ((1 << v31) & 0xC0081400) != 0)
      objc_msgSend(v21, "incrementFailureCounts");
  }
  else
  {
    v23 = os_log_create("com.apple.notes", "Cloud");
    v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG);
    if (v20)
    {
      if (v24)
      {
        objc_msgSend(v14, "ic_loggingDescription");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "ic_loggingDescription");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v46 = v19;
        v47 = 2112;
        v48 = v39;
        v49 = 2112;
        v50 = v40;
        _os_log_debug_impl(&dword_1BD918000, v23, OS_LOG_TYPE_DEBUG, "Pushed user-specific record for account ID %@: %@ %@", buf, 0x20u);

      }
      objc_msgSend(v14, "recordID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICCloudContext existingCloudObjectForUserSpecificRecordID:createPlaceholderIfNecessary:accountID:context:](self, "existingCloudObjectForUserSpecificRecordID:createPlaceholderIfNecessary:accountID:context:", v25, 0, v19, v16);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v21, "didSaveUserSpecificRecord:", v14);
    }
    else
    {
      if (v24)
      {
        objc_msgSend(v14, "ic_loggingDescription");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "ic_loggingDescription");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v46 = v19;
        v47 = 2112;
        v48 = v41;
        v49 = 2112;
        v50 = v42;
        _os_log_debug_impl(&dword_1BD918000, v23, OS_LOG_TYPE_DEBUG, "Pushed account ID %@: %@ %@", buf, 0x20u);

      }
      -[ICCloudContext cloudContextDelegate](self, "cloudContextDelegate");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "recordID");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "cloudContext:didPushRecordID:accountID:", self, v35, v19);

      -[ICCloudContext existingCloudObjectForRecord:accountID:context:](self, "existingCloudObjectForRecord:accountID:context:", v14, v19, v16);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v36;
      if (v36)
      {
        objc_msgSend(v36, "objectWasPushedToCloudWithOperation:serverRecord:", v12, v14);
        -[ICCloudContext objectIDsToRetry](self, "objectIDsToRetry");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectID");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "removeObject:", v38);

      }
    }
  }

  objc_msgSend(v14, "recordID");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "recordName");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "ic_saveWithLogDescription:", CFSTR("pushing record for account ID %@: %@"), v19, v33);

}

- (void)modifyRecordsOperation:(id)a3 recordWasDeletedWithRecordID:(id)a4 rootRecordIDsByShareID:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[ICCloudContext processingQueue](self, "processingQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __99__ICCloudContext_modifyRecordsOperation_recordWasDeletedWithRecordID_rootRecordIDsByShareID_error___block_invoke;
  block[3] = &unk_1E76CDDF8;
  block[4] = self;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  dispatch_async(v14, block);

}

void __99__ICCloudContext_modifyRecordsOperation_recordWasDeletedWithRecordID_rootRecordIDsByShareID_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "backgroundContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __99__ICCloudContext_modifyRecordsOperation_recordWasDeletedWithRecordID_rootRecordIDsByShareID_error___block_invoke_2;
  v5[3] = &unk_1E76CDDD0;
  v3 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v7 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  v9 = *(id *)(a1 + 64);
  v10 = v2;
  v4 = v2;
  objc_msgSend(v4, "performBlockAndWait:", v5);

}

uint64_t __99__ICCloudContext_modifyRecordsOperation_recordWasDeletedWithRecordID_rootRecordIDsByShareID_error___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "modifyRecordsOperation:recordWasDeletedWithRecordID:rootRecordIDsByShareID:error:context:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
}

- (void)modifyRecordsOperation:(id)a3 recordWasDeletedWithRecordID:(id)a4 rootRecordIDsByShareID:(id)a5 error:(id)a6 context:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  _BOOL4 v27;
  uint64_t v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  NSObject *v38;
  NSObject *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint8_t buf[4];
  void *v69;
  __int16 v70;
  void *v71;
  __int16 v72;
  uint64_t v73;
  __int16 v74;
  uint64_t v75;
  __int16 v76;
  id v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v16 = a5;
  objc_msgSend(v12, "database");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudContext accountIDForDatabase:](self, "accountIDForDatabase:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = +[ICUserSpecificRecordIDParser isUserSpecificRecordID:](ICUserSpecificRecordIDParser, "isUserSpecificRecordID:", v13);
  objc_msgSend(v16, "objectForKeyedSubscript:", v13);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[ICCloudContext existingCloudObjectForUserSpecificRecordID:createPlaceholderIfNecessary:accountID:context:](self, "existingCloudObjectForUserSpecificRecordID:createPlaceholderIfNecessary:accountID:context:", v13, 0, v18, v15);
    v21 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v20)
      v22 = v20;
    else
      v22 = v13;
    -[ICCloudContext existingCloudObjectForRecordID:recordType:accountID:context:](self, "existingCloudObjectForRecordID:recordType:accountID:context:", v22, 0, v18, v15);
    v21 = objc_claimAutoreleasedReturnValue();
  }
  v23 = (void *)v21;
  if (v21)
  {
    if (v14)
      goto LABEL_9;
  }
  else
  {
    v25 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v13, "ic_loggingDescription");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "ic_loggingDescription");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v69 = v18;
      v70 = 2112;
      v71 = v62;
      v72 = 2112;
      v73 = (uint64_t)v59;
      v74 = 2112;
      v75 = (uint64_t)v14;
      _os_log_error_impl(&dword_1BD918000, v25, OS_LOG_TYPE_ERROR, "Failed to find existing cloud object for delete error in account ID %@: %@ %@: %@", buf, 0x2Au);

    }
    if (v14)
    {
LABEL_9:
      if (v19)
      {
        v24 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v13, "ic_loggingDescription");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v69 = v18;
          v70 = 2112;
          v71 = v42;
          v72 = 2112;
          v73 = (uint64_t)v14;
          _os_log_error_impl(&dword_1BD918000, v24, OS_LOG_TYPE_ERROR, "Error deleting user-specific record in account ID %@: %@: %@", buf, 0x20u);

        }
LABEL_12:

LABEL_56:
        goto LABEL_57;
      }
      v28 = objc_msgSend(v14, "code");
      if (v20)
      {
        if (v28 != 26)
        {
          if (v28 != 11)
          {
            v24 = os_log_create("com.apple.notes", "Cloud");
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v13, "ic_loggingDescription");
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "shortLoggingDescription");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "ic_loggingDescription");
              v36 = objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413314;
              v69 = v18;
              v70 = 2112;
              v71 = v60;
              v72 = 2112;
              v73 = (uint64_t)v35;
              v74 = 2112;
              v75 = v36;
              v37 = (void *)v36;
              v76 = 2112;
              v77 = v14;
              _os_log_error_impl(&dword_1BD918000, v24, OS_LOG_TYPE_ERROR, "Error deleting share in account ID %@: %@ for %@ %@: %@", buf, 0x34u);

            }
            goto LABEL_12;
          }
          v29 = os_log_create("com.apple.notes", "Cloud");
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v13, "ic_loggingDescription");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "shortLoggingDescription");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "ic_loggingDescription");
            v50 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413058;
            v69 = v18;
            v70 = 2112;
            v71 = v64;
            v72 = 2112;
            v73 = (uint64_t)v49;
            v74 = 2112;
            v75 = v50;
            v51 = (void *)v50;
            _os_log_debug_impl(&dword_1BD918000, v29, OS_LOG_TYPE_DEBUG, "Unknown item deleting share in account ID %@: %@ for %@ %@", buf, 0x2Au);

          }
          goto LABEL_30;
        }
        v33 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v13, "ic_loggingDescription");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "shortLoggingDescription");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "ic_loggingDescription");
          v52 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          v69 = v18;
          v70 = 2112;
          v71 = v65;
          v72 = 2112;
          v73 = (uint64_t)v59;
          v74 = 2112;
          v75 = v52;
          v53 = (void *)v52;
          _os_log_debug_impl(&dword_1BD918000, v33, OS_LOG_TYPE_DEBUG, "Zone not found deleting share in account ID %@: %@ for %@ %@", buf, 0x2Au);

        }
        objc_msgSend(v23, "setServerShare:", 0);
        objc_msgSend(v13, "zoneID");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICCloudContext receivedZoneNotFound:operation:context:](self, "receivedZoneNotFound:operation:context:", v34, v12, v15);

        goto LABEL_57;
      }
      switch(v28)
      {
        case 31:
          v38 = os_log_create("com.apple.notes", "Cloud");
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v13, "ic_loggingDescription");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "ic_loggingDescription");
            v56 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v69 = v18;
            v70 = 2112;
            v71 = v67;
            v72 = 2112;
            v73 = v56;
            v57 = (void *)v56;
            _os_log_error_impl(&dword_1BD918000, v38, OS_LOG_TYPE_ERROR, "Reference violation in account ID %@: for %@ %@", buf, 0x20u);

          }
          objc_msgSend(v23, "fixBrokenReferences");
          objc_msgSend(v23, "incrementFailureCounts");
          goto LABEL_53;
        case 22:
          v39 = os_log_create("com.apple.notes", "Cloud");
          if (!os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
            goto LABEL_52;
          objc_msgSend(v13, "ic_loggingDescription");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "ic_loggingDescription");
          v40 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v69 = v18;
          v70 = 2112;
          v71 = v61;
          v72 = 2112;
          v73 = v40;
          v41 = (void *)v40;
          _os_log_debug_impl(&dword_1BD918000, v39, OS_LOG_TYPE_DEBUG, "Batch request failed for deleting in account ID %@: %@ %@", buf, 0x20u);
          break;
        case 11:
          v30 = os_log_create("com.apple.notes", "Cloud");
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v13, "ic_loggingDescription");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "ic_loggingDescription");
            v54 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v69 = v18;
            v70 = 2112;
            v71 = v66;
            v72 = 2112;
            v73 = v54;
            v55 = (void *)v54;
            _os_log_debug_impl(&dword_1BD918000, v30, OS_LOG_TYPE_DEBUG, "No record on server to delete in account ID %@: %@ %@", buf, 0x20u);

          }
          objc_msgSend(v23, "objectWasDeletedFromCloud");
          goto LABEL_53;
        default:
          v39 = os_log_create("com.apple.notes", "Cloud");
          if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
LABEL_52:

LABEL_53:
            if (!v23)
              goto LABEL_57;
            -[ICCloudContext objectIDsToRetry](self, "objectIDsToRetry");
            v24 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "objectID");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject addObject:](v24, "addObject:", v32);
LABEL_55:

            goto LABEL_56;
          }
          objc_msgSend(v13, "ic_loggingDescription");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "ic_loggingDescription");
          v58 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          v69 = v18;
          v70 = 2112;
          v71 = v61;
          v72 = 2112;
          v73 = v58;
          v41 = (void *)v58;
          v74 = 2112;
          v75 = (uint64_t)v14;
          _os_log_error_impl(&dword_1BD918000, v39, OS_LOG_TYPE_ERROR, "Error deleting record in account ID %@: %@ %@: %@", buf, 0x2Au);
          break;
      }

      goto LABEL_52;
    }
  }
  v26 = os_log_create("com.apple.notes", "Cloud");
  v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG);
  if (v19)
  {
    if (v27)
    {
      objc_msgSend(v13, "ic_loggingDescription");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "ic_loggingDescription");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v69 = v18;
      v70 = 2112;
      v71 = v43;
      v72 = 2112;
      v73 = (uint64_t)v44;
      _os_log_debug_impl(&dword_1BD918000, v26, OS_LOG_TYPE_DEBUG, "Deleted user-specific record in account ID %@: %@ %@", buf, 0x20u);

    }
    objc_msgSend(v23, "didDeleteUserSpecificRecordID:", v13);
    goto LABEL_57;
  }
  if (v20)
  {
    if (v27)
    {
      objc_msgSend(v13, "ic_loggingDescription");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "ic_loggingDescription");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v69 = v18;
      v70 = 2112;
      v71 = v45;
      v72 = 2112;
      v73 = (uint64_t)v46;
      _os_log_debug_impl(&dword_1BD918000, v26, OS_LOG_TYPE_DEBUG, "Deleted share in account ID %@: %@ %@", buf, 0x20u);

    }
LABEL_30:
    objc_msgSend(v23, "setServerShare:", 0, v59);
    goto LABEL_57;
  }
  if (v27)
  {
    objc_msgSend(v13, "ic_loggingDescription");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "ic_loggingDescription");
    v47 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v69 = v18;
    v70 = 2112;
    v71 = v63;
    v72 = 2112;
    v73 = v47;
    v48 = (void *)v47;
    _os_log_debug_impl(&dword_1BD918000, v26, OS_LOG_TYPE_DEBUG, "Deleted record in account ID %@: %@ %@", buf, 0x20u);

  }
  objc_msgSend(v23, "objectWasDeletedFromCloud");
  objc_msgSend(v23, "objectID");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    -[ICCloudContext objectIDsToRetry](self, "objectIDsToRetry");
    v24 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectID");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject removeObject:](v24, "removeObject:", v32);
    goto LABEL_55;
  }
LABEL_57:
  objc_msgSend(v15, "ic_saveWithLogDescription:", CFSTR("finished modify operation"), v59);

}

- (void)modifyRecordsOperation:(id)a3 didCompleteWithError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[ICCloudContext processingQueue](self, "processingQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__ICCloudContext_modifyRecordsOperation_didCompleteWithError___block_invoke;
  block[3] = &unk_1E76C7708;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __62__ICCloudContext_modifyRecordsOperation_didCompleteWithError___block_invoke(id *a1)
{
  id v2;
  id *v3;
  objc_class *v4;
  void *v5;
  id *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  void *v25;
  NSObject *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v2 = a1[4];
  v3 = a1 + 5;
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = a1 + 6;
  objc_msgSend(v2, "incrementOrClearRetryCountForOperationType:error:", v5, a1[6]);

  if (!a1[6])
    goto LABEL_25;
  v7 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*v3, "ic_loggingDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v33 = v8;
    _os_log_impl(&dword_1BD918000, v7, OS_LOG_TYPE_INFO, "Error modifying records, canceling dependent operations: %@", buf, 0xCu);

  }
  objc_msgSend(a1[4], "operationQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v9, "iterativelyCancelDependentOperations:", a1[5]);

  v11 = objc_msgSend(a1[6], "code");
  if ((unint64_t)(v11 - 3) < 2)
    goto LABEL_7;
  if (v11 == 2)
  {
    v15 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*v3, "ic_loggingDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = *v6;
      *(_DWORD *)buf = 138412546;
      v33 = v16;
      v34 = 2112;
      v35 = v17;
      _os_log_impl(&dword_1BD918000, v15, OS_LOG_TYPE_DEFAULT, "Partial error for modify operation %@: %@", buf, 0x16u);

    }
    objc_msgSend(a1[4], "handleGenericPartialFailuresForError:operation:", a1[6], a1[5]);
    goto LABEL_15;
  }
  if (v11 == 20)
  {
LABEL_7:
    v12 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*v3, "ic_loggingDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *v6;
      *(_DWORD *)buf = 138412546;
      v33 = v13;
      v34 = 2112;
      v35 = v14;
      _os_log_impl(&dword_1BD918000, v12, OS_LOG_TYPE_INFO, "Error modifying records %@: %@", buf, 0x16u);

    }
  }
  else
  {
    v12 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __62__ICCloudContext_modifyRecordsOperation_didCompleteWithError___block_invoke_cold_2();
  }

LABEL_15:
  if (objc_msgSend(*v6, "code") != 2)
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    objc_msgSend(*v3, "recordsToSave", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v28;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v28 != v21)
            objc_enumerationMutation(v18);
          v23 = a1[4];
          v24 = a1[5];
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v22), "recordID");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "modifyRecordsOperation:recordWasSavedWithRecordID:record:error:", v24, v25, 0, a1[6]);

          ++v22;
        }
        while (v20 != v22);
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v20);
    }

  }
  objc_msgSend(a1[4], "startRetryTimerIfNecessaryWithError:", a1[6]);
LABEL_25:
  v26 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    __62__ICCloudContext_modifyRecordsOperation_didCompleteWithError___block_invoke_cold_1((uint64_t)v3);

}

- (void)handleGenericPartialFailuresForError:(id)a3 operation:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[4];
  id v43;
  id v44;
  uint64_t *v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  char v56;
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  void *v60;
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v31 = a3;
  v6 = a4;
  objc_msgSend(v6, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudContext accountIDForDatabase:](self, "accountIDForDatabase:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v53 = 0;
  v54 = &v53;
  v55 = 0x2020000000;
  v56 = 0;
  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__46;
  v51 = __Block_byref_object_dispose__46;
  v52 = 0;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "userInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0C94940]);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __65__ICCloudContext_handleGenericPartialFailuresForError_operation___block_invoke;
  v42[3] = &unk_1E76CE110;
  v45 = &v53;
  v46 = &v47;
  v12 = v9;
  v43 = v12;
  v13 = v10;
  v44 = v13;
  objc_msgSend(v29, "enumerateKeysAndObjectsUsingBlock:", v42);
  if (*((_BYTE *)v54 + 24))
  {
    v14 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v58 = v8;
      _os_log_impl(&dword_1BD918000, v14, OS_LOG_TYPE_DEFAULT, "User exceeded iCloud quota in account ID %@", buf, 0xCu);
    }

    -[ICCloudContext cloudContextDelegate](self, "cloudContextDelegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "cloudContext:didExceedQuotaForRecordID:accountID:", self, v48[5], v8);

  }
  -[ICCloudContext backgroundContext](self, "backgroundContext", v29);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v12;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v62, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v39 != v18)
          objc_enumerationMutation(obj);
        -[ICCloudContext receivedZoneNotFound:operation:context:](self, "receivedZoneNotFound:operation:context:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i), v6, v16);
      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v62, 16);
    }
    while (v17);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v32 = v13;
  v20 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v34, v61, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v35;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v35 != v21)
          objc_enumerationMutation(v32);
        v23 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
        v24 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v23, "ic_loggingDescription");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v58 = v8;
          v59 = 2112;
          v60 = v25;
          _os_log_impl(&dword_1BD918000, v24, OS_LOG_TYPE_DEFAULT, "User deleted zone in account ID %@: %@", buf, 0x16u);

        }
        -[ICCloudContext accountZoneIDsNeedingToBeSaved](self, "accountZoneIDsNeedingToBeSaved");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "ic_addZoneID:forAccountID:", v23, v8);

        objc_msgSend(v6, "database");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICCloudContext deleteServerChangeTokenForRecordZoneID:databaseScope:accountID:context:](self, "deleteServerChangeTokenForRecordZoneID:databaseScope:accountID:context:", v23, objc_msgSend(v27, "databaseScope"), v8, v16);

        -[ICCloudContext cloudContextDelegate](self, "cloudContextDelegate");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "cloudContext:userDidDeleteRecordZoneWithID:accountID:", self, v23, v8);

      }
      v20 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v34, v61, 16);
    }
    while (v20);
  }

  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v53, 8);

}

void __65__ICCloudContext_handleGenericPartialFailuresForError_operation___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v13;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v13;
      objc_msgSend(v7, "zoneID");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    v6 = 0;
  }
  v7 = 0;
LABEL_7:
  v8 = objc_msgSend(v5, "code");
  switch(v8)
  {
    case 28:
      v12 = (void *)a1[5];
LABEL_15:
      objc_msgSend(v12, "ic_addNonNilObject:", v6);
      break;
    case 26:
      v12 = (void *)a1[4];
      goto LABEL_15;
    case 25:
      *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
      if (v7)
      {
        v9 = *(_QWORD *)(a1[7] + 8);
        v11 = *(_QWORD *)(v9 + 40);
        v10 = (id *)(v9 + 40);
        if (!v11)
          objc_storeStrong(v10, v7);
      }
      break;
  }

}

- (id)overrideAccountID
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[ICCloudContext cloudContextDelegate](self, "cloudContextDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[ICCloudContext cloudContextDelegate](self, "cloudContextDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "overrideAccountIDForCloudContext:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)accountIDForDatabase:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[ICCloudContext overrideAccountID](self, "overrideAccountID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(v4, "container");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setupInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "accountOverrideInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "accountID");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

+ (id)sortedRecords:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  id obj;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  id v55;
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  void *v61;
  _BYTE v62[128];
  _BYTE v63[24];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v55 = 0;
  objc_msgSend(MEMORY[0x1E0C95068], "topologicallySortRecords:withError:", v3, &v55);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v55;
  v43 = v3;
  if (v41)
  {
    v5 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[ICCloudContext sortedRecords:].cold.2();

    v6 = v3;
    v4 = v6;
  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", (unint64_t)objc_msgSend(v4, "count") >> 1);
  v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", (unint64_t)objc_msgSend(v4, "count") >> 1);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  obj = v4;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v64, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v52;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v52 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v12);
        objc_msgSend(v13, "recordID", v41);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v8, "containsObject:", v14);

        if (v15)
        {
          v16 = os_log_create("com.apple.notes", "Cloud");
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            +[ICCloudContext sortedRecords:].cold.1((uint64_t)v63, (uint64_t)v13);

          objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "+[ICCloudContext sortedRecords:]", 1, 1, CFSTR("Duplicate record ID after sorting in ICCloudContext"));
        }
        else
        {
          objc_msgSend(v13, "recordID");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v17);

          objc_msgSend(v13, "recordType");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("Media"));

          if (v19)
          {
            v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
            objc_msgSend(v20, "setObject:atIndexedSubscript:", v13, 0);
            objc_msgSend(v44, "addObject:", v20);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v44, "count") - 1);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "recordID");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "setObject:forKeyedSubscript:", v21, v22);

LABEL_16:
            goto LABEL_23;
          }
          objc_msgSend(v13, "recordType");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v23, "isEqualToString:", CFSTR("Attachment")) & 1) != 0)
          {
            objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("Media"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            if (v24)
            {
              objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("Media"));
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "recordID");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "objectForKeyedSubscript:", v25);
              v21 = (void *)objc_claimAutoreleasedReturnValue();

              if (v21)
              {
                objc_msgSend(v44, "objectAtIndexedSubscript:", objc_msgSend(v21, "integerValue"));
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "addObject:", v13);

              }
              else
              {
                objc_msgSend(v7, "addObject:", v13);
              }
              goto LABEL_16;
            }
          }
          else
          {

          }
          objc_msgSend(v7, "addObject:", v13);
        }
LABEL_23:
        ++v12;
      }
      while (v10 != v12);
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v64, 16);
      v10 = v27;
    }
    while (v27);
  }

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v28 = v44;
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v47, v62, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v48 != v31)
          objc_enumerationMutation(v28);
        objc_msgSend(v7, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i), v41);
      }
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v47, v62, 16);
    }
    while (v30);
  }

  v33 = objc_msgSend(v7, "count");
  if (v33 != objc_msgSend(v43, "count") || (v34 = objc_msgSend(v7, "count"), v34 != objc_msgSend(obj, "count")))
  {
    v35 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v43, "count"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(obj, "count"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v57 = v38;
      v58 = 2112;
      v59 = v39;
      v60 = 2112;
      v61 = v40;
      _os_log_error_impl(&dword_1BD918000, v35, OS_LOG_TYPE_ERROR, "Record counts after sorting in ICCloudContext were not equal {#unsortedRecords: %@, #topoRecords: %@, #finalRecords: %@}", buf, 0x20u);

    }
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "+[ICCloudContext sortedRecords:]", 1, 1, CFSTR("Record counts after sorting in ICCloudContext were not equal"));
  }
  v36 = (void *)objc_msgSend(v7, "copy", v41);

  return v36;
}

+ (id)objectsByAccount:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id obj;
  _QWORD v15[5];
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v24;
    v7 = MEMORY[0x1E0C809B0];
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v24 != v6)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v8);
        v17 = 0;
        v18 = &v17;
        v19 = 0x3032000000;
        v20 = __Block_byref_object_copy__46;
        v21 = __Block_byref_object_dispose__46;
        v22 = 0;
        objc_msgSend(v9, "managedObjectContext");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v16[0] = v7;
        v16[1] = 3221225472;
        v16[2] = __35__ICCloudContext_objectsByAccount___block_invoke;
        v16[3] = &unk_1E76C7730;
        v16[4] = v9;
        v16[5] = &v17;
        objc_msgSend(v10, "performBlockAndWait:", v16);

        if (objc_msgSend((id)v18[5], "length"))
        {
          objc_msgSend(v4, "objectForKeyedSubscript:", v18[5]);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v11)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, v18[5]);
          }
          objc_msgSend(v11, "addObject:", v9);

        }
        else
        {
          objc_msgSend(v9, "managedObjectContext");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v15[0] = v7;
          v15[1] = 3221225472;
          v15[2] = __35__ICCloudContext_objectsByAccount___block_invoke_2;
          v15[3] = &unk_1E76C73F8;
          v15[4] = v9;
          objc_msgSend(v12, "performBlockAndWait:", v15);

        }
        _Block_object_dispose(&v17, 8);

        ++v8;
      }
      while (v5 != v8);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v5);
  }

  return v4;
}

void __35__ICCloudContext_objectsByAccount___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "cloudAccount");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __35__ICCloudContext_objectsByAccount___block_invoke_2()
{
  NSObject *v0;

  v0 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __35__ICCloudContext_objectsByAccount___block_invoke_2_cold_1();

}

+ (id)objectsByDatabaseScope:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "databaseScope", (_QWORD)v16);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, v14);

        }
        objc_msgSend(v13, "addObject:", v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)deduplicatedRecordsForCloudObjects:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  id v19;
  const char *v20;
  const char *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v29;
    v11 = "com.apple.notes";
    v12 = "Cloud";
    *(_QWORD *)&v8 = 138412290;
    v26 = v8;
    do
    {
      v13 = 0;
      v27 = v9;
      do
      {
        if (*(_QWORD *)v29 != v10)
          objc_enumerationMutation(v6);
        v14 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v13);
        objc_msgSend(v14, "recordID", v26);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          if (objc_msgSend(v4, "containsObject:", v15))
          {
            v16 = os_log_create(v11, v12);
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v15, "ic_loggingDescription");
              v17 = v10;
              v18 = v4;
              v19 = v6;
              v20 = v12;
              v21 = v11;
              v22 = v5;
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v26;
              v33 = v23;
              _os_log_impl(&dword_1BD918000, v16, OS_LOG_TYPE_DEFAULT, "Trying to modify two instances of the same object %@", buf, 0xCu);

              v5 = v22;
              v11 = v21;
              v12 = v20;
              v6 = v19;
              v4 = v18;
              v10 = v17;
              v9 = v27;
            }

          }
          else
          {
            objc_msgSend(v4, "addObject:", v15);
            objc_msgSend(v14, "makeCloudKitRecordForApproach:", 0);
            v16 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObject:", v16);
          }
        }
        else
        {
          v16 = os_log_create(v11, v12);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1BD918000, v16, OS_LOG_TYPE_DEFAULT, "No record ID when trying to modify record", buf, 2u);
          }
        }

        ++v13;
      }
      while (v9 != v13);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v9);
  }

  v24 = (void *)objc_msgSend(v5, "copy");
  return v24;
}

+ (id)allZoneIDsInAccountZoneIDs:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  v4 = a3;
  objc_msgSend(v3, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_241);

  v6 = (void *)objc_msgSend(v5, "copy");
  return v6;
}

void __45__ICCloudContext_allZoneIDsInAccountZoneIDs___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "allObjects");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v3);

  }
}

+ (BOOL)haveZoneIDsInAccountZoneIDs:(id)a3
{
  id v3;
  char v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__ICCloudContext_haveZoneIDsInAccountZoneIDs___block_invoke;
  v6[3] = &unk_1E76CE178;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v6);
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __46__ICCloudContext_haveZoneIDsInAccountZoneIDs___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a3, "count");
  if (result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (void)resetZoneForCloudAccount:(id)a3 withReason:(id)a4
{
  id v5;
  dispatch_semaphore_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  dispatch_semaphore_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "accountType") == 1)
  {
    v6 = dispatch_semaphore_create(0);
    +[ICCloudContext notesZoneID](ICCloudContext, "notesZoneID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v8 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __54__ICCloudContext_resetZoneForCloudAccount_withReason___block_invoke;
    v11[3] = &unk_1E76CE1A0;
    v12 = v5;
    v13 = v6;
    v10 = v6;
    -[ICCloudContext deleteRecordZonesWithZoneIDs:accountID:markZonesAsUserPurged:completionHandler:](self, "deleteRecordZonesWithZoneIDs:accountID:markZonesAsUserPurged:completionHandler:", v8, v9, 1, v11);
    dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);

  }
  else
  {
    v8 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[ICCloudContext resetZoneForCloudAccount:withReason:].cold.1();
  }

}

void __54__ICCloudContext_resetZoneForCloudAccount_withReason___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    v4 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      __54__ICCloudContext_resetZoneForCloudAccount_withReason___block_invoke_cold_1();

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

+ (id)errorsFromError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v10 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_22;
  }
  objc_msgSend(v4, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C947D8]))
  {
    v7 = objc_msgSend(v5, "code");

    if (v7 == 2)
    {
      objc_msgSend(v5, "userInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0C94940]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v9, "allValues");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = (void *)MEMORY[0x1E0C9AA60];
      }

      goto LABEL_22;
    }
  }
  else
  {

  }
  objc_msgSend(v5, "domain");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.notes.cloud")))
  {

    goto LABEL_19;
  }
  v12 = objc_msgSend(v5, "code");

  if (v12 != 3)
  {
LABEL_19:
    v26 = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("Errors"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v15 = v14;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v23 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(a1, "errorsFromError:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i), (_QWORD)v22);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObjectsFromArray:", v20);

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v17);
  }

LABEL_22:
  return v10;
}

- (BOOL)partialError:(id)a3 containsErrorCode:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "code") != 2)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "partialError.code == CKErrorPartialFailure", "-[ICCloudContext partialError:containsErrorCode:]", 1, 0, CFSTR("Called -partialFailure:containsError with a non-partialFailure."));
  objc_msgSend(v5, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0C94940]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "code", (_QWORD)v16) == a4)
        {
          v14 = 1;
          goto LABEL_13;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v11)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_13:

  return v14;
}

- (void)addDependenciesForModifyRecordsOperation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[ICCloudContext operationQueue](self, "operationQueue", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "operations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          objc_msgSend(v4, "addDependency:", v12);
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (BOOL)isCloudKitAccountAvailable
{
  void *v3;
  BOOL v4;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) != 0)
    -[ICCloudContext viewContext](self, "viewContext");
  else
    -[ICCloudContext backgroundContext](self, "backgroundContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[ICAccount isCloudKitAccountAvailableInContext:](ICAccount, "isCloudKitAccountAvailableInContext:", v3);

  return v4;
}

- (void)addOperations:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (!-[ICCloudContext didEnqueueLongLivedOperations](self, "didEnqueueLongLivedOperations"))
  {
    objc_msgSend(v7, "ic_compactMap:", &__block_literal_global_247);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCloudContext operationIDsBeforeEnqueuingLongLivedOperations](self, "operationIDsBeforeEnqueuingLongLivedOperations");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v4);

  }
  -[ICCloudContext operationQueue](self, "operationQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addOperations:waitUntilFinished:", v7, 0);

}

id __32__ICCloudContext_addOperations___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  objc_opt_class();
  ICDynamicCast();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "operationID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)informCloudAnalyticsDelegateForOperationDidEnd:(id)a3 recordsByRecordID:(id)a4 operationError:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[ICCloudContext cloudAnalyticsDelegate](self, "cloudAnalyticsDelegate");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "cloudContext:reportOperationEnd:recordsByRecordID:operationError:", self, v10, v9, v8);

}

- (id)operationToSaveZonesIfNecessaryForAccountID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v32;
  void *v33;
  void *v35;
  void *v36;
  ICCloudContext *v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = self;
  -[ICCloudContext accountZoneIDsNeedingToBeSaved](self, "accountZoneIDsNeedingToBeSaved");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v4;
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v48;
    v13 = *MEMORY[0x1E0C94730];
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v48 != v12)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        objc_msgSend(v15, "ownerName");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqualToString:", v13);

        if (v17)
          objc_msgSend(v5, "addObject:", v15);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
    }
    while (v11);
  }
  v35 = v9;

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  -[ICCloudContext operationQueue](v37, "operationQueue");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "operations");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v44;
    do
    {
      v23 = 0;
      v38 = v21;
      do
      {
        if (*(_QWORD *)v44 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v23);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v25 = v24;
          v39 = 0u;
          v40 = 0u;
          v41 = 0u;
          v42 = 0u;
          objc_msgSend(v25, "recordZonesToSave");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
          if (v27)
          {
            v28 = v27;
            v29 = *(_QWORD *)v40;
            do
            {
              for (j = 0; j != v28; ++j)
              {
                if (*(_QWORD *)v40 != v29)
                  objc_enumerationMutation(v26);
                objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * j), "zoneID");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "removeObject:", v31);

              }
              v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
            }
            while (v28);
          }

          v21 = v38;
        }
        ++v23;
      }
      while (v23 != v21);
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
    }
    while (v21);
  }

  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "allObjects");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCloudContext operationToSaveZonesForZoneIDs:accountID:](v37, "operationToSaveZonesForZoneIDs:accountID:", v32, v36);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v33 = 0;
  }

  return v33;
}

- (id)operationToSaveZonesForZoneIDs:(id)a3 accountID:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  os_log_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v26;
  void *v27;
  id v28;
  id val;
  id obj;
  _QWORD v32[5];
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  id location;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v28 = a4;
  v27 = v5;
  if (objc_msgSend(v28, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    obj = v5;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v41 != v8)
            objc_enumerationMutation(obj);
          v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95088]), "initWithZoneID:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i));
          objc_msgSend(v6, "addObject:", v10);

        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
      }
      while (v7);
    }

    -[ICCloudContext containerForAccountID:](self, "containerForAccountID:", v28);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    val = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C94EF0]), "initWithRecordZonesToSave:recordZoneIDsToDelete:", v6, 0);
    objc_msgSend(val, "setQualityOfService:", -[ICCloudContext qualityOfService](self, "qualityOfService"));
    v11 = -[ICCloudContext discretionaryNetworkBehavior](self, "discretionaryNetworkBehavior");
    objc_msgSend(val, "configuration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDiscretionaryNetworkBehavior:", v11);

    objc_msgSend(v26, "privateCloudDatabase");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(val, "setDatabase:", v13);

    objc_initWeak(&location, val);
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v14 = v6;
    v15 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v35, v48, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v36;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v36 != v16)
            objc_enumerationMutation(v14);
          v18 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v17);
          v19 = os_log_create("com.apple.notes", "Cloud");
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v18, "zoneID");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "ic_loggingDescription");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(val, "ic_loggingDescription");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v45 = v21;
            v46 = 2112;
            v47 = v22;
            _os_log_debug_impl(&dword_1BD918000, v19, OS_LOG_TYPE_DEBUG, "Will save zone %@ %@", buf, 0x16u);

          }
          ++v17;
        }
        while (v15 != v17);
        v15 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v35, v48, 16);
      }
      while (v15);
    }

    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __59__ICCloudContext_operationToSaveZonesForZoneIDs_accountID___block_invoke;
    v32[3] = &unk_1E76CE208;
    objc_copyWeak(&v34, &location);
    v32[4] = self;
    v33 = v28;
    objc_msgSend(val, "setModifyRecordZonesCompletionBlock:", v32);
    v23 = objc_alloc_init(MEMORY[0x1E0C94F88]);
    objc_msgSend(v23, "setName:", CFSTR("SaveRecordZones"));
    objc_msgSend(v23, "setQuantity:", objc_msgSend(obj, "count"));
    objc_msgSend(v23, "setExpectedSendSize:", 1);
    objc_msgSend(v23, "setExpectedReceiveSize:", 1);
    objc_msgSend(val, "setGroup:", v23);
    v24 = val;

    objc_destroyWeak(&v34);
    objc_destroyWeak(&location);

  }
  else
  {
    v14 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[ICCloudContext operationToSaveZonesForZoneIDs:accountID:].cold.1();
    v24 = 0;
  }

  return v24;
}

void __59__ICCloudContext_operationToSaveZonesForZoneIDs_accountID___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id WeakRetained;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;

  v6 = a2;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "processingQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__ICCloudContext_operationToSaveZonesForZoneIDs_accountID___block_invoke_2;
  block[3] = &unk_1E76CDDF8;
  v16 = v7;
  v17 = WeakRetained;
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(a1 + 40);
  v18 = v6;
  v19 = v10;
  v20 = v11;
  v12 = v6;
  v13 = WeakRetained;
  v14 = v7;
  dispatch_async(v9, block);

}

void __59__ICCloudContext_operationToSaveZonesForZoneIDs_accountID___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = os_log_create("com.apple.notes", "Cloud");
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __59__ICCloudContext_operationToSaveZonesForZoneIDs_accountID___block_invoke_2_cold_2();
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    __59__ICCloudContext_operationToSaveZonesForZoneIDs_accountID___block_invoke_2_cold_1(a1);
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = *(id *)(a1 + 48);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    v17 = v5;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v9);
        v11 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v10, "zoneID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "ic_loggingDescription");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "ic_loggingDescription");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v23 = v15;
          v24 = 2112;
          v25 = v16;
          _os_log_debug_impl(&dword_1BD918000, v11, OS_LOG_TYPE_DEBUG, "Saved record zone %@ %@", buf, 0x16u);

          v5 = v17;
        }

        objc_msgSend(*(id *)(a1 + 56), "accountZoneIDsNeedingToBeSaved");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "zoneID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "ic_removeZoneID:forAccountID:", v13, *(_QWORD *)(a1 + 64));

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v7);
  }

}

- (void)contextDidSaveOrMerge:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  id v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *context;
  _QWORD block[4];
  id v30;
  id v31;
  ICCloudContext *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ICCloudContext persistentStoreCoordinator](self, "persistentStoreCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v4, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "persistentStoreCoordinator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", v5);

  if (v9)
  {
    context = (void *)MEMORY[0x1C3B7AC74]();
    objc_msgSend(v4, "userInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0C97838]);
    v25 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "userInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0C97870]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "userInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0C97A18]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "count"))
      objc_msgSend(v15, "unionSet:", v12);
    v27 = v12;
    if (objc_msgSend(v14, "count", v25))
      objc_msgSend(v15, "unionSet:", v14);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v17 = v15;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v34;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v34 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(v16, "addObject:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v21++));
        }
        while (v19 != v21);
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v19);
    }

    -[ICCloudContext processingQueue](self, "processingQueue");
    v22 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__ICCloudContext_contextDidSaveOrMerge___block_invoke;
    block[3] = &unk_1E76C7708;
    v30 = v26;
    v31 = v16;
    v32 = self;
    v23 = v16;
    v24 = v26;
    dispatch_async(v22, block);

    objc_autoreleasePoolPop(context);
  }

}

void __40__ICCloudContext_contextDidSaveOrMerge___block_invoke(id *a1)
{
  _QWORD *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;

  v2 = a1 + 4;
  if (objc_msgSend(a1[4], "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", *v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __40__ICCloudContext_contextDidSaveOrMerge___block_invoke_cold_2();

    objc_msgSend(a1[5], "minusSet:", v3);
    objc_msgSend(a1[6], "objectIDsToProcess");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "minusSet:", v3);

    objc_msgSend(a1[6], "objectIDsToRetry");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "minusSet:", v3);

  }
  if (objc_msgSend(a1[5], "count"))
  {
    v7 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __40__ICCloudContext_contextDidSaveOrMerge___block_invoke_cold_1();

    objc_msgSend(a1[6], "objectIDsToProcess");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "unionSet:", a1[5]);

    objc_msgSend(a1[6], "processingSelectorDelayer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "requestFire");

  }
}

- (void)processPendingCloudObjects
{
  -[ICCloudContext processPendingCloudObjectsWithCompletionHandler:](self, "processPendingCloudObjectsWithCompletionHandler:", 0);
}

- (void)processAllCloudObjectsWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ICCloudContext processingQueue](self, "processingQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__ICCloudContext_processAllCloudObjectsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E76C8430;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __62__ICCloudContext_processAllCloudObjectsWithCompletionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setNeedsToProcessAllObjects:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "addOperationToProcessObjectsWithCompletionHandler:", *(_QWORD *)(a1 + 40));
}

- (void)addOperationToProcessObjectsWithCompletionHandler:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void **v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  _QWORD v23[5];
  id v24;
  void *v25;
  void *v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[ICCloudContext isDisabled](self, "isDisabled")
    || -[ICCloudContext isDisabledInternal](self, "isDisabledInternal")
    || !-[ICCloudContext isReadyToSync](self, "isReadyToSync")
    || -[ICCloudContext syncOnlyIfReachable](self, "syncOnlyIfReachable")
    && !-[ICCloudContext isInternetReachable](self, "isInternetReachable"))
  {
    v15 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICCloudContext isDisabled](self, "isDisabled"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICCloudContext isDisabledInternal](self, "isDisabledInternal"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICCloudContext isReadyToSync](self, "isReadyToSync"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICCloudContext syncOnlyIfReachable](self, "syncOnlyIfReachable"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICCloudContext isInternetReachable](self, "isInternetReachable"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v28 = v16;
      v29 = 2112;
      v30 = v17;
      v31 = 2112;
      v32 = v18;
      v33 = 2112;
      v34 = v19;
      v35 = 2112;
      v36 = v20;
      _os_log_impl(&dword_1BD918000, v15, OS_LOG_TYPE_DEFAULT, "Not adding operation to process objects because we're not able to sync: isDisabled=%@, isDisabledInternal=%@, isReadyToSync=%@, syncOnlyIfReachable=%@, isInternetReachable=%@", buf, 0x34u);

    }
    if (v4)
    {
      objc_msgSend((id)objc_opt_class(), "errorForDisabledCloudSyncing");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v12;
      v13 = (void *)MEMORY[0x1E0C99D20];
      v14 = &v26;
      goto LABEL_17;
    }
  }
  else
  {
    if (-[ICCloudContext disableRetryTimer](self, "disableRetryTimer"))
      goto LABEL_19;
    -[ICCloudContext retryTimer](self, "retryTimer");
    v5 = objc_claimAutoreleasedReturnValue();
    if (!v5)
      goto LABEL_19;
    v6 = (void *)v5;
    -[ICCloudContext retryTimer](self, "retryTimer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fireDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "ic_isLaterThanDate:", v9);

    if (!v10)
    {
LABEL_19:
      -[ICCloudContext processingQueue](self, "processingQueue");
      v22 = objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __68__ICCloudContext_addOperationToProcessObjectsWithCompletionHandler___block_invoke;
      v23[3] = &unk_1E76C8430;
      v23[4] = self;
      v24 = v4;
      dispatch_async(v22, v23);

      goto LABEL_18;
    }
    v11 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BD918000, v11, OS_LOG_TYPE_DEFAULT, "Not adding operation to process objects because we're waiting for a retry timer", buf, 2u);
    }

    if (v4)
    {
      objc_msgSend((id)objc_opt_class(), "errorForWaitingForRetryTimer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v12;
      v13 = (void *)MEMORY[0x1E0C99D20];
      v14 = &v25;
LABEL_17:
      objc_msgSend(v13, "arrayWithObjects:count:", v14, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v4 + 2))(v4, v21);

    }
  }
LABEL_18:

}

void __68__ICCloudContext_addOperationToProcessObjectsWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id location;
  id v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  uint64_t v30;
  _BYTE v31[128];
  _BYTE v32[24];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0CB34C8]);
  objc_msgSend(v2, "setName:", CFSTR("ProcessObjects"));
  objc_initWeak(&location, v2);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __68__ICCloudContext_addOperationToProcessObjectsWithCompletionHandler___block_invoke_2;
  v22[3] = &unk_1E76CB1D8;
  objc_copyWeak(&v24, &location);
  v3 = *(void **)(a1 + 40);
  v22[4] = *(_QWORD *)(a1 + 32);
  v23 = v3;
  objc_msgSend(v2, "addExecutionBlock:", v22);
  v4 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __68__ICCloudContext_addOperationToProcessObjectsWithCompletionHandler___block_invoke_cold_1((uint64_t)v2, objc_msgSend(*(id *)(a1 + 32), "needsToProcessAllObjects"), (uint64_t)v32, v4);

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "operationQueue", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "operations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v31, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v19;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(v2, "addDependency:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v31, 16);
    }
    while (v8);
  }

  objc_msgSend(v2, "dependencies");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count") == 0;

  if (!v12)
  {
    v13 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v2, "dependencies");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");
      *(_DWORD *)buf = 134218240;
      v28 = v2;
      v29 = 2048;
      v30 = v17;
      _os_log_debug_impl(&dword_1BD918000, v13, OS_LOG_TYPE_DEBUG, "Process operation %p waiting on %ld other operations", buf, 0x16u);

    }
  }
  v14 = *(void **)(a1 + 32);
  v26 = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addOperations:", v15);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

}

void __68__ICCloudContext_addOperationToProcessObjectsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  v2 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __68__ICCloudContext_addOperationToProcessObjectsWithCompletionHandler___block_invoke_2_cold_1(a1);

  objc_msgSend(*(id *)(a1 + 32), "processingQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __68__ICCloudContext_addOperationToProcessObjectsWithCompletionHandler___block_invoke_255;
  v5[3] = &unk_1E76C8430;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  dispatch_async(v3, v5);

}

uint64_t __68__ICCloudContext_addOperationToProcessObjectsWithCompletionHandler___block_invoke_255(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  if (objc_msgSend(*(id *)(a1 + 32), "needsToProcessAllObjects"))
  {
    objc_msgSend(*(id *)(a1 + 32), "setNeedsToProcessAllObjects:", 0);
    objc_msgSend(*(id *)(a1 + 32), "backgroundContext");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_objectIDsToProcessForFullSyncInContext:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "objectIDsToProcess");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unionSet:", v3);

  }
  return objc_msgSend(*(id *)(a1 + 32), "_processPendingCloudObjectsWithCompletionHandler:", *(_QWORD *)(a1 + 40));
}

- (id)_objectIDsToProcessForFullSyncInContext:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;
  id v12;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __58__ICCloudContext__objectIDsToProcessForFullSyncInContext___block_invoke;
  v10[3] = &unk_1E76C7708;
  v10[4] = self;
  v11 = v4;
  v12 = v5;
  v6 = v5;
  v7 = v4;
  objc_msgSend(v7, "performBlockAndWait:", v10);
  v8 = (void *)objc_msgSend(v6, "copy");

  return v8;
}

void __58__ICCloudContext__objectIDsToProcessForFullSyncInContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("needsToBeFetchedFromCloud == YES"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("cloudState.currentLocalVersion > cloudState.latestVersionSyncedToCloud"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("needsToSaveUserSpecificRecord == YES"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orPredicateWithSubpredicates:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "allCloudObjectIDsInContext:predicate:", *(_QWORD *)(a1 + 40), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    __58__ICCloudContext__objectIDsToProcessForFullSyncInContext___block_invoke_cold_1(v8, (const char *)v9);

  objc_msgSend(*(id *)(a1 + 48), "unionSet:", v8);
}

- (void)_processPendingCloudObjectsWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  BOOL v6;
  os_log_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[ICCloudContext isReadyToSync](self, "isReadyToSync"))
  {
    if (!-[ICCloudContext syncOnlyIfReachable](self, "syncOnlyIfReachable")
      || -[ICCloudContext isInternetReachable](self, "isInternetReachable"))
    {
      -[ICCloudContext processingQueue](self, "processingQueue");
      v5 = objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __67__ICCloudContext__processPendingCloudObjectsWithCompletionHandler___block_invoke;
      v11[3] = &unk_1E76C8430;
      v11[4] = self;
      v12 = v4;
      dispatch_async(v5, v11);

      goto LABEL_15;
    }
    v8 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[ICCloudContext _processPendingCloudObjectsWithCompletionHandler:].cold.1();
  }
  else
  {
    v6 = -[ICCloudContext isCloudKitAccountAvailable](self, "isCloudKitAccountAvailable");
    v7 = os_log_create("com.apple.notes", "Cloud");
    v8 = v7;
    if (v6)
    {
      v8 = v7;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        -[ICCloudContext _processPendingCloudObjectsWithCompletionHandler:].cold.2(self);

    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      -[ICCloudContext _processPendingCloudObjectsWithCompletionHandler:].cold.3();
    }
  }

  if (v4)
  {
    objc_msgSend((id)objc_opt_class(), "errorForDisabledCloudSyncing");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v4 + 2))(v4, v10);

  }
LABEL_15:

}

void __67__ICCloudContext__processPendingCloudObjectsWithCompletionHandler___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;

  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "objectIDsToRetry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __67__ICCloudContext__processPendingCloudObjectsWithCompletionHandler___block_invoke_cold_3((uint64_t)v2);

    objc_msgSend(*v2, "objectIDsToProcess");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*v2, "objectIDsToRetry");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unionSet:", v7);

    objc_msgSend(*v2, "objectIDsToRetry");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeAllObjects");

  }
  v9 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    __67__ICCloudContext__processPendingCloudObjectsWithCompletionHandler___block_invoke_cold_2((uint64_t)v2);

  v10 = *(void **)(a1 + 32);
  objc_msgSend(v10, "objectIDsToProcess");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "processObjectIDs:completionHandler:", v11, *(_QWORD *)(a1 + 40));

  v12 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    __38__ICCloudContext_clearPendingActivity__block_invoke_cold_2();

  objc_msgSend(*v2, "objectIDsToProcess");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeAllObjects");

}

- (void)processObjectIDs:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  ICCloudContext *v15;
  id v16;

  v6 = a3;
  v7 = a4;
  -[ICCloudContext backgroundContext](self, "backgroundContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __53__ICCloudContext_processObjectIDs_completionHandler___block_invoke;
  v12[3] = &unk_1E76C8408;
  v13 = v6;
  v14 = v8;
  v15 = self;
  v16 = v7;
  v9 = v7;
  v10 = v8;
  v11 = v6;
  objc_msgSend(v10, "performBlockAndWait:", v12);

}

void __53__ICCloudContext_processObjectIDs_completionHandler___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  void *v26;
  objc_class *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD *v41;
  void *v42;
  void *v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  void *v58;
  _BYTE v59[128];
  void *v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v41 = (_QWORD *)a1;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v54;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v54 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
        objc_msgSend(v7, "entity", v41);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "name");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (objc_class *)objc_opt_class();
        NSStringFromClass(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v9, "isEqualToString:", v11);

        if (v12)
          v13 = v43;
        else
          v13 = v44;
        objc_msgSend(v13, "addObject:", v7);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
    }
    while (v4);
  }

  v14 = (void *)MEMORY[0x1C3B7AC74]();
  v15 = (objc_class *)objc_opt_class();
  NSStringFromClass(v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v60, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICCloudSyncingObject ic_objectsFromObjectIDs:relationshipKeyPathsForPrefetching:context:](ICCloudSyncingObject, "ic_objectsFromObjectIDs:relationshipKeyPathsForPrefetching:context:", v44, v17, v41[5]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v19 = v18;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v50;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v50 != v22)
          objc_enumerationMutation(v19);
        ICProtocolCast();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v24;
        if (v24
          && ((objc_msgSend(v24, "isInICloudAccount") & 1) != 0
           || objc_msgSend(v25, "needsToBeDeletedFromCloud")))
        {
          objc_msgSend(v42, "addObject:", v25, v41);
        }

      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
    }
    while (v21);
  }

  objc_autoreleasePoolPop(v14);
  v26 = (void *)MEMORY[0x1C3B7AC74]();
  v27 = (objc_class *)objc_opt_class();
  NSStringFromClass(v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v58, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICCloudState ic_objectsFromObjectIDs:relationshipKeyPathsForPrefetching:context:](ICCloudState, "ic_objectsFromObjectIDs:relationshipKeyPathsForPrefetching:context:", v43, v29, v41[5]);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v31 = v30;
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v46;
    do
    {
      for (k = 0; k != v33; ++k)
      {
        if (*(_QWORD *)v46 != v34)
          objc_enumerationMutation(v31);
        objc_opt_class();
        ICDynamicCast();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "cloudSyncingObject");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v37;
        if (v37
          && ((objc_msgSend(v37, "isInICloudAccount") & 1) != 0
           || objc_msgSend(v38, "needsToBeDeletedFromCloud")))
        {
          objc_msgSend(v42, "addObject:", v38, v41);
        }

      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
    }
    while (v33);
  }

  objc_autoreleasePoolPop(v26);
  v39 = (void *)v41[6];
  objc_msgSend(v42, "array");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "_processCloudObjects:completionHandler:", v40, v41[7]);

}

- (void)_processCloudObjects:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[4];
  id v30;
  ICCloudContext *v31;
  id v32;
  _QWORD v33[5];
  id v34;
  _QWORD v35[4];
  id v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "objectsByAccount:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __57__ICCloudContext__processCloudObjects_completionHandler___block_invoke_2;
    v33[3] = &unk_1E76CE230;
    v33[4] = self;
    v11 = v8;
    v34 = v11;
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v33);
    if (objc_msgSend(v11, "count"))
    {
      +[ICCloudConfiguration sharedConfiguration](ICCloudConfiguration, "sharedConfiguration");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "throttlingPolicy");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "incrementBatchCount");

      -[ICCloudContext addOperations:](self, "addOperations:", v11);
    }
    if (v7)
    {
      v14 = (void *)MEMORY[0x1E0CB34C8];
      v29[0] = v10;
      v29[1] = 3221225472;
      v29[2] = __57__ICCloudContext__processCloudObjects_completionHandler___block_invoke_415;
      v29[3] = &unk_1E76C7780;
      v15 = v11;
      v30 = v15;
      v31 = self;
      v32 = v7;
      objc_msgSend(v14, "blockOperationWithBlock:", v29);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setName:", CFSTR("ProcessCompletion"));
      objc_msgSend(v16, "ic_setResistsCancellation:", 1);
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v17 = v15;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v26;
        do
        {
          v21 = 0;
          do
          {
            if (*(_QWORD *)v26 != v20)
              objc_enumerationMutation(v17);
            objc_msgSend(v16, "addDependency:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v21++), (_QWORD)v25);
          }
          while (v19 != v21);
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
        }
        while (v19);
      }

      -[ICCloudContext operationQueue](self, "operationQueue");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addOperation:", v16);

    }
    goto LABEL_18;
  }
  v23 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    -[ICCloudContext _processCloudObjects:completionHandler:].cold.1();

  if (v7)
  {
    -[ICCloudContext operationQueue](self, "operationQueue");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __57__ICCloudContext__processCloudObjects_completionHandler___block_invoke;
    v35[3] = &unk_1E76C91F0;
    v36 = v7;
    objc_msgSend(v24, "addOperationWithBlock:", v35);

    v11 = v36;
LABEL_18:

  }
}

uint64_t __57__ICCloudContext__processCloudObjects_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __57__ICCloudContext__processCloudObjects_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  id v29;
  id v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  v6 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __57__ICCloudContext__processCloudObjects_completionHandler___block_invoke_2_cold_1();

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v34 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        if (objc_msgSend(v13, "needsToBeFetchedFromCloud"))
        {
          objc_msgSend(v13, "recordID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
            objc_msgSend(v7, "addObject:", v14);

        }
        if (objc_msgSend(v13, "canBeRootShareObject"))
        {
          objc_msgSend(v13, "serverRecord");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "share");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "recordID");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            objc_msgSend(v13, "serverShare");
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v18)
            {
              objc_msgSend(v7, "addObject:", v17);
              objc_msgSend(MEMORY[0x1E0D64288], "postBasicEvent:", 10);
            }
          }

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v10);
  }

  v19 = *(void **)(a1 + 32);
  objc_msgSend(v7, "allObjects");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "operationsToFetchRecordIDs:qualityOfService:operationGroupName:accountID:", v20, objc_msgSend(*(id *)(a1 + 32), "qualityOfService"), 0, v4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v21);
  v22 = *(void **)(a1 + 32);
  v31 = 0;
  v32 = 0;
  v29 = 0;
  v30 = 0;
  objc_msgSend(v22, "_filterCloudSyncingObjects:accountID:objectsToSave:objectsToDelete:objectsToDeleteShares:objectsToSaveUserSpecificRecord:", v8, v4, &v32, &v31, &v30, &v29);
  v23 = v32;
  v24 = v31;
  v25 = v30;
  v26 = v29;
  objc_msgSend(*(id *)(a1 + 32), "operationsToModifyRecordsForCloudObjectsToSave:delete:deleteShares:saveUserSpecificRecords:operationGroupName:addDependencies:accountID:", v23, v24, v25, v26, CFSTR("SaveChangedObjects"), 1, v4);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v27);

}

void __57__ICCloudContext__processCloudObjects_completionHandler___block_invoke_415(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v8, "error", (_QWORD)v14);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          objc_msgSend(v8, "error");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "addObject:", v10);

          v11 = *(void **)(a1 + 40);
          objc_msgSend(v8, "error");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "startRetryTimerIfNecessaryWithError:", v12);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

  if (objc_msgSend(v2, "count"))
    v13 = v2;
  else
    v13 = 0;
  (*(void (**)(_QWORD, void *))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v13);

}

- (void)_filterCloudSyncingObjects:(id)a3 accountID:(id)a4 objectsToSave:(id *)a5 objectsToDelete:(id *)a6 objectsToDeleteShares:(id *)a7 objectsToSaveUserSpecificRecord:(id *)a8
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  id *v28;
  void *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  id v39;
  __int16 v40;
  void *v41;
  _BYTE v42[128];
  uint64_t v43;

  v28 = a5;
  v43 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v33 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v14 = v9;
  v15 = (void *)v13;
  v16 = v14;
  v17 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  v32 = (void *)v13;
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v35 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        if (objc_msgSend(v21, "needsToBePushedToCloud", v28)
          && (objc_msgSend(v21, "shouldBeIgnoredForSync") & 1) == 0
          && (objc_msgSend(v21, "needsToBeDeletedFromCloud") & 1) == 0)
        {
          if ((objc_msgSend(v21, "hasAllMandatoryFields") & 1) != 0)
          {
            v22 = v10;
LABEL_18:
            objc_msgSend(v22, "addObject:", v21);
            goto LABEL_19;
          }
          v23 = os_log_create("com.apple.notes", "Cloud");
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v21, "loggingDescription");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v39 = v33;
            v40 = 2112;
            v41 = v24;
            _os_log_impl(&dword_1BD918000, v23, OS_LOG_TYPE_DEFAULT, "Not syncing object because it's missing mandatory fields in account ID %@: %@", buf, 0x16u);

            v15 = v32;
          }

        }
        if (objc_msgSend(v21, "shouldBeIgnoredForSync"))
        {
          objc_msgSend(v21, "decrementFailureCounts");
          goto LABEL_19;
        }
        if (objc_msgSend(v21, "needsToBeDeletedFromCloud"))
        {
          v22 = v11;
          goto LABEL_18;
        }
LABEL_19:
        if (objc_msgSend(v21, "needsToDeleteShare"))
        {
          objc_msgSend(v12, "addObject:", v21);
          objc_msgSend(v10, "removeObject:", v21);
        }
        if ((objc_msgSend(v21, "needsToBeDeletedFromCloud") & 1) == 0
          && objc_msgSend(v21, "wantsUserSpecificRecord")
          && objc_msgSend(v21, "needsToSaveUserSpecificRecord"))
        {
          objc_msgSend(v21, "userSpecificRecordID");
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (v25)
          {
            objc_msgSend(v15, "addObject:", v21);
          }
          else
          {
            v26 = os_log_create("com.apple.notes", "Cloud");
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v21, "loggingDescription");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v39 = v33;
              v40 = 2112;
              v41 = v27;
              _os_log_error_impl(&dword_1BD918000, v26, OS_LOG_TYPE_ERROR, "Not syncing user-specific object because it's missing its user-specific record ID in account ID %@: %@", buf, 0x16u);

              v15 = v32;
            }

          }
        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    }
    while (v18);
  }

  if (v28)
    *v28 = (id)objc_msgSend(v10, "copy");
  if (a6)
    *a6 = (id)objc_msgSend(v11, "copy");
  if (a7)
    *a7 = (id)objc_msgSend(v12, "copy");
  if (a8)
    *a8 = (id)objc_msgSend(v32, "copy");

}

- (void)handleRemoteNotificationWithUserInfo:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a4;
  v7 = (void *)MEMORY[0x1E0C94F40];
  v8 = a3;
  objc_msgSend(v7, "notificationFromRemoteNotificationDictionary:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("aps"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("content-available"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __66__ICCloudContext_handleRemoteNotificationWithUserInfo_completion___block_invoke;
    v15[3] = &unk_1E76C75F0;
    v16 = v6;
    -[ICCloudContext handleCloudKitNotification:completionHandler:](self, "handleCloudKitNotification:completionHandler:", v9, v15);
    v12 = v16;
LABEL_5:

    goto LABEL_6;
  }
  if (objc_msgSend(v11, "integerValue") == 1)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __66__ICCloudContext_handleRemoteNotificationWithUserInfo_completion___block_invoke_2;
    v13[3] = &unk_1E76C75F0;
    v14 = v6;
    -[ICCloudContext syncWithReason:uploadUnsyncedChanges:completionHandler:](self, "syncWithReason:uploadUnsyncedChanges:completionHandler:", CFSTR("GenericContentAvailablePush"), 0, v13);
    v12 = v14;
    goto LABEL_5;
  }
  if (v6)
    (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);
LABEL_6:

}

uint64_t __66__ICCloudContext_handleRemoteNotificationWithUserInfo_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, 1);
  return result;
}

void __66__ICCloudContext_handleRemoteNotificationWithUserInfo_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  v5 = *(id *)(a1 + 32);
  v4 = v3;
  performBlockOnMainThread();

}

uint64_t __66__ICCloudContext_handleRemoteNotificationWithUserInfo_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, *(_QWORD *)(a1 + 32), 1);
  return result;
}

- (void)handleCloudKitNotification:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  os_log_t v15;
  void *v16;
  BOOL v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  ICCloudContext *v21;
  id v22;
  __int128 *p_buf;
  uint64_t v24;
  __int128 buf;
  uint64_t v26;
  char v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[ICCloudContext handleCloudKitNotification:completionHandler:].cold.2(v6, v8);

  if (-[ICCloudContext isReadyToSync](self, "isReadyToSync")
    && !-[ICCloudContext isDisabled](self, "isDisabled")
    && !-[ICCloudContext isDisabledInternal](self, "isDisabledInternal"))
  {
    v12 = objc_msgSend(v6, "notificationType");
    if (v12 == 2 || v12 == 4)
    {
      v13 = v6;
      v14 = objc_msgSend(v13, "databaseScope");
      objc_msgSend(v13, "subscriptionOwnerUserRecordID");
      v15 = (os_log_t)objc_claimAutoreleasedReturnValue();

      -[NSObject recordName](v15, "recordName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[ICCloudContext handleCloudKitNotification:completionHandler:].cold.1((uint64_t)v6, v15);

      v11 = 0;
      v14 = 0;
    }

    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v26 = 0x2020000000;
    v27 = 0;
    if (v14)
    {
      if (v11)
      {
        -[ICCloudContext containersByAccountID](self, "containersByAccountID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "count") == 0;

        if (!v17)
        {
          -[ICCloudContext containersByAccountID](self, "containersByAccountID");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19[0] = MEMORY[0x1E0C809B0];
          v19[1] = 3221225472;
          v19[2] = __63__ICCloudContext_handleCloudKitNotification_completionHandler___block_invoke;
          v19[3] = &unk_1E76CE2A8;
          p_buf = &buf;
          v24 = v14;
          v20 = v11;
          v21 = self;
          v22 = v7;
          objc_msgSend(v18, "enumerateKeysAndObjectsUsingBlock:", v19);

        }
      }
    }
    if (v7 && !*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
      (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
    _Block_object_dispose(&buf, 8);
    goto LABEL_10;
  }
  v9 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    -[ICCloudContext readinessLoggingDescription](self, "readinessLoggingDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_1BD918000, v9, OS_LOG_TYPE_INFO, "Not handling CloudKit push notification: %@", (uint8_t *)&buf, 0xCu);

  }
  if (v7)
  {
    objc_msgSend((id)objc_opt_class(), "errorForDisabledCloudSyncing");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v11);
LABEL_10:

  }
}

void __63__ICCloudContext_handleCloudKitNotification_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __63__ICCloudContext_handleCloudKitNotification_completionHandler___block_invoke_2;
  v9[3] = &unk_1E76CE280;
  v10 = *(id *)(a1 + 32);
  v11 = v4;
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(void **)(a1 + 48);
  v14 = *(_QWORD *)(a1 + 64);
  v12 = v6;
  v13 = v7;
  v8 = v4;
  objc_msgSend(v8, "fetchUserRecordIDWithCompletionHandler:", v9);

}

void __63__ICCloudContext_handleCloudKitNotification_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  __CFString *v9;
  id v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "recordName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", v3))
  {
    objc_msgSend(*(id *)(a1 + 40), "databaseWithDatabaseScope:", *(_QWORD *)(a1 + 64));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 48);
    v11[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __63__ICCloudContext_handleCloudKitNotification_completionHandler___block_invoke_3;
    v8[3] = &unk_1E76CE258;
    v7 = *(void **)(a1 + 56);
    v8[4] = *(_QWORD *)(a1 + 48);
    v9 = CFSTR("PushNotification");
    v10 = v7;
    objc_msgSend(v5, "fetchDatabaseChangesForDatabases:reason:completionHandler:", v6, CFSTR("PushNotification"), v8);

  }
}

uint64_t __63__ICCloudContext_handleCloudKitNotification_completionHandler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fetchRecordZoneChangesWithReason:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)validateAccountZoneIDsNeedingFetchChanges
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];

  v3 = (void *)MEMORY[0x1E0C99E20];
  -[ICCloudContext accountZoneIDsNeedingFetchChanges](self, "accountZoneIDsNeedingFetchChanges");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v5);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0C99E60];
  -[ICCloudContext containersByAccountID](self, "containersByAccountID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "minusSet:", v9);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __59__ICCloudContext_validateAccountZoneIDsNeedingFetchChanges__block_invoke;
  v11[3] = &unk_1E76CE2D0;
  v11[4] = self;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v11);

}

void __59__ICCloudContext_validateAccountZoneIDsNeedingFetchChanges__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_1BD918000, v4, OS_LOG_TYPE_DEFAULT, "Filtering out account ID %@ from needing fetch changes since there is no corresponding container.", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "accountZoneIDsNeedingFetchChanges");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", 0, v3);

}

- (void)fetchRecordZoneChangesWithReason:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[ICCloudContext processingQueue](self, "processingQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__ICCloudContext_fetchRecordZoneChangesWithReason_completionHandler___block_invoke;
  block[3] = &unk_1E76C7780;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __69__ICCloudContext_fetchRecordZoneChangesWithReason_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "validateAccountZoneIDsNeedingFetchChanges");
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "accountZoneIDsNeedingFetchChanges");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRecordZoneChangesForAccountZoneIDs:reason:completionHandler:", v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)fetchRecordZoneChangesForZoneIDs:(id)a3 accountID:(id)a4 reason:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", a3);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v10)
  {
    v16 = v10;
    v17[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
  -[ICCloudContext fetchRecordZoneChangesForAccountZoneIDs:reason:completionHandler:](self, "fetchRecordZoneChangesForAccountZoneIDs:reason:completionHandler:", v15, v11, v12);

}

- (void)fetchRecordZoneChangesForAccountZoneIDs:(id)a3 reason:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  ICCloudContext *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0D64288], "postFetchZoneChangesTelemetryWithReason:", v9);
  -[ICCloudContext processingQueue](self, "processingQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __83__ICCloudContext_fetchRecordZoneChangesForAccountZoneIDs_reason_completionHandler___block_invoke;
  v15[3] = &unk_1E76C8408;
  v16 = v8;
  v17 = self;
  v18 = v9;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

void __83__ICCloudContext_fetchRecordZoneChangesForAccountZoneIDs_reason_completionHandler___block_invoke(id *a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  id v23;
  void *v24;
  void *v25;
  int8x16_t v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[4];
  int8x16_t v33;
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  void *v38;
  _BYTE v39[16];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("Asking to fetch changes for:"));
  v3 = a1[4];
  v4 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __83__ICCloudContext_fetchRecordZoneChangesForAccountZoneIDs_reason_completionHandler___block_invoke_2;
  v36[3] = &unk_1E76CE2F8;
  v5 = v2;
  v37 = v5;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v36);
  v6 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __83__ICCloudContext_fetchRecordZoneChangesForAccountZoneIDs_reason_completionHandler___block_invoke_cold_2();
  v25 = v5;

  v7 = (void *)MEMORY[0x1E0CB34C8];
  v32[0] = v4;
  v32[1] = 3221225472;
  v32[2] = __83__ICCloudContext_fetchRecordZoneChangesForAccountZoneIDs_reason_completionHandler___block_invoke_431;
  v32[3] = &unk_1E76C8408;
  v26 = *((int8x16_t *)a1 + 2);
  v8 = (id)v26.i64[0];
  v33 = vextq_s8(v26, v26, 8uLL);
  v34 = a1[6];
  v35 = a1[7];
  objc_msgSend(v7, "blockOperationWithBlock:", v32);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setName:", CFSTR("CreateFetchZoneChanges"));
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(a1[5], "operationQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "operations");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v29;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v29 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v14);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v16 = v15;
          v17 = a1[5];
          objc_msgSend(v16, "database", v25);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "accountIDForDatabase:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
          {
            objc_msgSend(a1[4], "objectForKeyedSubscript:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "count");

            if (v21)
            {
              v22 = os_log_create("com.apple.notes", "Cloud");
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
                __83__ICCloudContext_fetchRecordZoneChangesForAccountZoneIDs_reason_completionHandler___block_invoke_cold_1((uint64_t)v39, (uint64_t)v16);

              objc_msgSend(v27, "addDependency:", v16);
            }
          }

        }
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
    }
    while (v12);
  }

  v23 = a1[5];
  v38 = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addOperations:", v24);

}

void __83__ICCloudContext_fetchRecordZoneChangesForAccountZoneIDs_reason_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "ic_loggingDescription");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  objc_msgSend(v7, "componentsJoinedByString:", CFSTR(" "));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR(" account ID: %@, zone IDs: %@."), v5, v14, (_QWORD)v15);

}

uint64_t __83__ICCloudContext_fetchRecordZoneChangesForAccountZoneIDs_reason_completionHandler___block_invoke_431(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addOperationsToFetchRecordZoneChangesForAccountZoneIDs:reason:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)addOperationsToFetchRecordZoneChangesForAccountZoneIDs:(id)a3 reason:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  ICCloudContext *v14;
  id v15;

  v7 = a3;
  v8 = a5;
  -[ICCloudContext processingQueue](self, "processingQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __98__ICCloudContext_addOperationsToFetchRecordZoneChangesForAccountZoneIDs_reason_completionHandler___block_invoke;
  block[3] = &unk_1E76C7780;
  v13 = v7;
  v14 = self;
  v15 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(v9, block);

}

void __98__ICCloudContext_addOperationsToFetchRecordZoneChangesForAccountZoneIDs_reason_completionHandler___block_invoke(id *a1)
{
  void *v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  int v31;
  int v32;
  int v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t j;
  id v48;
  void *v49;
  __int128 v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  id obj;
  void *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _QWORD v61[5];
  id v62;
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _QWORD v72[4];
  id v73;
  id v74;
  void *v75;
  uint8_t v76[128];
  uint8_t buf[4];
  int v78;
  __int16 v79;
  int v80;
  __int16 v81;
  int v82;
  __int16 v83;
  void *v84;
  char v85[24];
  _BYTE v86[128];
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = a1[4];
  v72[0] = MEMORY[0x1E0C809B0];
  v72[1] = 3221225472;
  v72[2] = __98__ICCloudContext_addOperationsToFetchRecordZoneChangesForAccountZoneIDs_reason_completionHandler___block_invoke_2;
  v72[3] = &unk_1E76CE320;
  v4 = v2;
  v5 = a1[5];
  v73 = v4;
  v74 = v5;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v72);
  objc_msgSend(a1[5], "operationQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSuspended:", 1);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  obj = v4;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v87, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v69;
    *(_QWORD *)&v8 = 67109890;
    v50 = v8;
    v51 = *(_QWORD *)v69;
    do
    {
      v11 = 0;
      v53 = v9;
      do
      {
        if (*(_QWORD *)v69 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * v11);
        if ((objc_msgSend(v12, "isFinished", v50) & 1) != 0
          || (objc_msgSend(v12, "isExecuting") & 1) != 0
          || (objc_msgSend(v12, "isCancelled") & 1) != 0
          || (objc_msgSend(a1[5], "operationQueue"),
              v13 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v13, "operations"),
              v14 = (void *)objc_claimAutoreleasedReturnValue(),
              v15 = objc_msgSend(v14, "containsObject:", v12),
              v14,
              v13,
              (v15 & 1) != 0))
        {
          v16 = os_log_create("com.apple.notes", "Cloud");
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            v31 = objc_msgSend(v12, "isFinished");
            v32 = objc_msgSend(v12, "isExecuting");
            v33 = objc_msgSend(v12, "isCancelled");
            objc_msgSend(v12, "ic_loggingDescription");
            v34 = v11;
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v50;
            v78 = v31;
            v79 = 1024;
            v80 = v32;
            v81 = 1024;
            v82 = v33;
            v83 = 2112;
            v84 = v35;
            _os_log_debug_impl(&dword_1BD918000, v16, OS_LOG_TYPE_DEBUG, "Not adding operation to queue. isFinished=%d isExecuting=%d isCancelled=%d %@", buf, 0x1Eu);

            v11 = v34;
          }

        }
        else
        {
          v56 = v12;
          v54 = v11;
          v66 = 0u;
          v67 = 0u;
          v64 = 0u;
          v65 = 0u;
          objc_msgSend(a1[5], "operationQueue");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "operations");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v64, v86, 16);
          if (v19)
          {
            v20 = v19;
            v21 = *(_QWORD *)v65;
            do
            {
              for (i = 0; i != v20; ++i)
              {
                if (*(_QWORD *)v65 != v21)
                  objc_enumerationMutation(v18);
                v23 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v24 = v23;
                  v25 = a1[5];
                  objc_msgSend(v24, "database");
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v25, "accountIDForDatabase:", v26);
                  v27 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v27)
                  {
                    objc_msgSend(a1[4], "objectForKeyedSubscript:", v27);
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    v29 = objc_msgSend(v28, "count");

                    if (v29)
                    {
                      v30 = os_log_create("com.apple.notes", "Cloud");
                      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
                        __98__ICCloudContext_addOperationsToFetchRecordZoneChangesForAccountZoneIDs_reason_completionHandler___block_invoke_cold_1((uint64_t)v85, (uint64_t)v24);

                      objc_msgSend(v56, "addDependency:", v24);
                    }
                  }

                }
              }
              v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v64, v86, 16);
            }
            while (v20);
          }

          objc_msgSend(v52, "addObject:", v56);
          v10 = v51;
          v9 = v53;
          v11 = v54;
        }
        ++v11;
      }
      while (v11 != v9);
      v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v87, 16);
      v9 = v36;
    }
    while (v36);
  }

  v37 = a1[5];
  v38 = (void *)objc_msgSend(v52, "copy");
  objc_msgSend(v37, "addOperations:", v38);

  objc_msgSend(a1[5], "operationQueue");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setSuspended:", 0);

  if (a1[6])
  {
    v40 = (void *)MEMORY[0x1E0CB34C8];
    v61[0] = MEMORY[0x1E0C809B0];
    v61[1] = 3221225472;
    v61[2] = __98__ICCloudContext_addOperationsToFetchRecordZoneChangesForAccountZoneIDs_reason_completionHandler___block_invoke_434;
    v61[3] = &unk_1E76C7780;
    v61[4] = a1[5];
    v41 = obj;
    v62 = v41;
    v63 = a1[6];
    objc_msgSend(v40, "blockOperationWithBlock:", v61);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setName:", CFSTR("FetchZoneChangesCompletion"));
    objc_msgSend(v42, "ic_setResistsCancellation:", 1);
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v43 = v41;
    v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v57, v76, 16);
    if (v44)
    {
      v45 = v44;
      v46 = *(_QWORD *)v58;
      do
      {
        for (j = 0; j != v45; ++j)
        {
          if (*(_QWORD *)v58 != v46)
            objc_enumerationMutation(v43);
          objc_msgSend(v42, "addDependency:", *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * j));
        }
        v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v57, v76, 16);
      }
      while (v45);
    }

    v48 = a1[5];
    v75 = v42;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v75, 1);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "addOperations:", v49);

  }
}

void __98__ICCloudContext_addOperationsToFetchRecordZoneChangesForAccountZoneIDs_reason_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v4 = *(void **)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = a2;
  objc_msgSend(a3, "allObjects");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "operationsToFetchRecordZoneChangesForZoneIDs:accountID:", v8, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObjectsFromArray:", v7);
}

void __98__ICCloudContext_addOperationsToFetchRecordZoneChangesForAccountZoneIDs_reason_completionHandler___block_invoke_434(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD block[5];
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "processingQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __98__ICCloudContext_addOperationsToFetchRecordZoneChangesForAccountZoneIDs_reason_completionHandler___block_invoke_2_435;
  block[3] = &unk_1E76C7780;
  v3 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v6 = *(id *)(a1 + 48);
  dispatch_async(v2, block);

}

void __98__ICCloudContext_addOperationsToFetchRecordZoneChangesForAccountZoneIDs_reason_completionHandler___block_invoke_2_435(uint64_t a1)
{
  id v2;

  objc_msgSend((id)objc_opt_class(), "errorFromOperations:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (id)operationsToFetchRecordZoneChangesForZoneIDs:(id)a3 accountID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *, void *);
  void *v23;
  id v24;
  ICCloudContext *v25;
  id v26;
  id v27;
  id v28;
  id v29;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "objectsByDatabaseScope:", v6);
    v9 = objc_claimAutoreleasedReturnValue();
    -[ICCloudContext containerForAccountID:](self, "containerForAccountID:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "userRecordNameForContainer:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc_init(MEMORY[0x1E0C94F88]);
    objc_msgSend(v12, "setName:", CFSTR("FetchRecordZoneChanges"));
    objc_msgSend(v12, "setExpectedSendSize:", 1);
    objc_msgSend(v12, "setExpectedReceiveSize:", 0);
    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __73__ICCloudContext_operationsToFetchRecordZoneChangesForZoneIDs_accountID___block_invoke;
    v23 = &unk_1E76CE348;
    v24 = v10;
    v25 = self;
    v26 = v7;
    v27 = v11;
    v13 = v12;
    v28 = v13;
    v29 = v8;
    v14 = v8;
    v15 = v11;
    v16 = v10;
    -[NSObject enumerateKeysAndObjectsUsingBlock:](v9, "enumerateKeysAndObjectsUsingBlock:", &v20);
    v17 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[ICCloudContext operationsToFetchRecordZoneChangesForZoneIDs:accountID:].cold.2();

    v18 = (void *)objc_msgSend(v14, "copy", v20, v21, v22, v23);
  }
  else
  {
    v9 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[ICCloudContext operationsToFetchRecordZoneChangesForZoneIDs:accountID:].cold.1();
    v18 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v18;
}

void __73__ICCloudContext_operationsToFetchRecordZoneChangesForZoneIDs_accountID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  uint64_t v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_msgSend(a2, "integerValue");
  objc_msgSend(*(id *)(a1 + 32), "databaseWithDatabaseScope:", v6);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v26;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v12);
        objc_msgSend(*(id *)(a1 + 40), "accountZoneIDsNeedingFetchChanges");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "ic_removeZoneID:forAccountID:", v13, *(_QWORD *)(a1 + 48));

        if (v6 == 3
          && (objc_msgSend(v13, "ownerName"),
              v15 = (void *)objc_claimAutoreleasedReturnValue(),
              v16 = objc_msgSend(v15, "isEqualToString:", *(_QWORD *)(a1 + 56)),
              v15,
              v16))
        {
          v17 = os_log_create("com.apple.notes", "Cloud");
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            v19 = *(_QWORD *)(a1 + 48);
            *(_DWORD *)buf = 138412290;
            v30 = v19;
            _os_log_debug_impl(&dword_1BD918000, v17, OS_LOG_TYPE_DEBUG, "Filtered the current users zone from being fetched from the shared db in account ID %@.", buf, 0xCu);
          }

        }
        else
        {
          objc_msgSend(*(id *)(a1 + 40), "accountZoneIDsFetchingChanges");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "ic_addZoneID:forAccountID:", v13, *(_QWORD *)(a1 + 48));

          objc_msgSend(v7, "addObject:", v13);
        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    }
    while (v10);
  }

  v20 = *(void **)(a1 + 40);
  v21 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v20, "operationToFetchRecordZoneChangesForZoneIDs:database:", v21, v24);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "group");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23)
  {
    objc_msgSend(v22, "setGroup:", *(_QWORD *)(a1 + 64));
    objc_msgSend(*(id *)(a1 + 64), "setQuantity:", objc_msgSend(*(id *)(a1 + 64), "quantity") + 1);
  }
  objc_msgSend(*(id *)(a1 + 72), "addObject:", v22);

}

- (id)operationToFetchRecordZoneChangesForZoneIDs:(id)a3 database:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  void *v33;
  id v34;
  __int128 v36;
  id v37;
  void *v38;
  id obj;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t v48[128];
  uint8_t buf[4];
  void *v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v37 = a4;
  -[ICCloudContext accountIDForDatabase:](self, "accountIDForDatabase:");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v45;
    v12 = *MEMORY[0x1E0C94A30];
    *(_QWORD *)&v9 = 138412290;
    v36 = v9;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v45 != v11)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        objc_msgSend(v14, "zoneName", v36);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqualToString:", v12);

        if (v16)
        {
          v17 = os_log_create("com.apple.notes", "Cloud");
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v36;
            v50 = v38;
            _os_log_debug_impl(&dword_1BD918000, v17, OS_LOG_TYPE_DEBUG, "Not trying to sync the default record zone in account ID %@.", buf, 0xCu);
          }
        }
        else
        {
          v17 = objc_alloc_init(MEMORY[0x1E0C94DD8]);
          -[ICCloudContext backgroundContext](self, "backgroundContext");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[ICCloudContext serverChangeTokenForRecordZoneID:databaseScope:accountID:context:](self, "serverChangeTokenForRecordZoneID:databaseScope:accountID:context:", v14, objc_msgSend(v37, "databaseScope"), v38, v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setPreviousServerChangeToken:](v17, "setPreviousServerChangeToken:", v19);

          +[ICCloudConfiguration sharedConfiguration](ICCloudConfiguration, "sharedConfiguration");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setResultsLimit:](v17, "setResultsLimit:", objc_msgSend(v20, "resultsLimitPerSyncOperation"));

          objc_msgSend(v7, "setObject:forKeyedSubscript:", v17, v14);
        }

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
    }
    while (v10);
  }

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  -[ICCloudContext operationQueue](self, "operationQueue");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "operations");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
  v24 = v7;
  if (!v23)
  {
LABEL_22:

LABEL_27:
    v33 = v37;
    v29 = -[ICCloudContext newOperationToFetchRecordZoneChangesWithZoneConfigurations:database:](self, "newOperationToFetchRecordZoneChangesWithZoneConfigurations:database:", v24, v37);
    goto LABEL_28;
  }
  v25 = v23;
  v26 = *(_QWORD *)v41;
LABEL_14:
  v27 = 0;
  while (1)
  {
    if (*(_QWORD *)v41 != v26)
      objc_enumerationMutation(v22);
    v28 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v27);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_20;
    v29 = v28;
    v30 = objc_opt_class();
    objc_msgSend(v29, "configurationsByRecordZoneID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v30) = objc_msgSend((id)v30, "isZoneConfigurations:subsetOfZoneConfigurations:", v24, v31);

    if ((v30 & 1) != 0)
      break;

LABEL_20:
    if (v25 == ++v27)
    {
      v25 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
      if (v25)
        goto LABEL_14;
      goto LABEL_22;
    }
  }

  if (!v29)
    goto LABEL_27;
  v32 = os_log_create("com.apple.notes", "Cloud");
  v33 = v37;
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    -[ICCloudContext operationToFetchRecordZoneChangesForZoneIDs:database:].cold.1();

LABEL_28:
  v34 = v29;

  return v34;
}

+ (BOOL)isZoneConfigurations:(id)a3 subsetOfZoneConfigurations:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  BOOL v21;
  id obj;
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v24 = a3;
  v25 = a4;
  objc_msgSend(v24, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v27;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v27 != v10)
        objc_enumerationMutation(obj);
      v12 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v11);
      objc_msgSend(v25, "objectForKeyedSubscript:", v12);
      v13 = objc_claimAutoreleasedReturnValue();
      if (!v13)
        goto LABEL_15;
      v14 = (void *)v13;
      objc_msgSend(v24, "objectForKeyedSubscript:", v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "previousServerChangeToken");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
        break;
      objc_msgSend(v15, "previousServerChangeToken");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
        goto LABEL_10;
LABEL_11:
      objc_msgSend(v7, "removeObject:", v12);

      if (v9 == ++v11)
      {
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v9)
          goto LABEL_3;
        goto LABEL_15;
      }
    }

LABEL_10:
    objc_msgSend(v14, "previousServerChangeToken");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "previousServerChangeToken");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "isEqual:", v19);

    if ((v20 & 1) == 0)
    {

      goto LABEL_15;
    }
    goto LABEL_11;
  }
LABEL_15:

  v21 = objc_msgSend(v7, "count") == 0;
  return v21;
}

- (id)newOperationToFetchRecordZoneChangesWithZoneConfigurations:(id)a3 database:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  id v29;
  _QWORD v30[5];
  id v31;
  id v32;
  _QWORD v33[5];
  id v34;
  _QWORD *v35;
  id v36;
  _QWORD v37[5];
  id v38;
  id v39;
  _QWORD *v40;
  id v41;
  _QWORD v42[6];
  id v43;
  _QWORD v44[6];
  id v45;
  _QWORD aBlock[6];
  _QWORD v47[5];
  id v48;
  id location;
  _BYTE v50[32];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v29 = a4;
  -[ICCloudContext overrideAccountID](self, "overrideAccountID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(v29, "container");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "options");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "accountOverrideInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "accountID");
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  v13 = objc_alloc(MEMORY[0x1E0C94DE8]);
  objc_msgSend(v6, "allKeys");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithRecordZoneIDs:configurationsByRecordZoneID:", v14, v6);

  objc_msgSend(v15, "setQualityOfService:", -[ICCloudContext qualityOfService](self, "qualityOfService"));
  v16 = -[ICCloudContext discretionaryNetworkBehavior](self, "discretionaryNetworkBehavior");
  objc_msgSend(v15, "configuration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setDiscretionaryNetworkBehavior:", v16);

  objc_msgSend(v15, "setDatabase:", v29);
  objc_initWeak(&location, v15);
  objc_msgSend(v15, "setFetchAllChanges:", 1);
  v47[0] = 0;
  v47[1] = v47;
  v47[2] = 0x3032000000;
  v47[3] = __Block_byref_object_copy__46;
  v47[4] = __Block_byref_object_dispose__46;
  -[ICCloudContext backgroundContext](self, "backgroundContext");
  v48 = (id)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __86__ICCloudContext_newOperationToFetchRecordZoneChangesWithZoneConfigurations_database___block_invoke;
  aBlock[3] = &unk_1E76C96E0;
  aBlock[4] = self;
  aBlock[5] = v47;
  v19 = _Block_copy(aBlock);
  v44[0] = v18;
  v44[1] = 3221225472;
  v44[2] = __86__ICCloudContext_newOperationToFetchRecordZoneChangesWithZoneConfigurations_database___block_invoke_4;
  v44[3] = &unk_1E76CE370;
  v44[4] = self;
  objc_copyWeak(&v45, &location);
  v44[5] = v47;
  objc_msgSend(v15, "setRecordWasChangedBlock:", v44);
  v42[0] = v18;
  v42[1] = 3221225472;
  v42[2] = __86__ICCloudContext_newOperationToFetchRecordZoneChangesWithZoneConfigurations_database___block_invoke_5;
  v42[3] = &unk_1E76CE398;
  v42[4] = self;
  objc_copyWeak(&v43, &location);
  v42[5] = v47;
  objc_msgSend(v15, "setRecordWithIDWasDeletedBlock:", v42);
  v37[0] = v18;
  v37[1] = 3221225472;
  v37[2] = __86__ICCloudContext_newOperationToFetchRecordZoneChangesWithZoneConfigurations_database___block_invoke_6;
  v37[3] = &unk_1E76CE3C0;
  v37[4] = self;
  objc_copyWeak(&v41, &location);
  v20 = v9;
  v38 = v20;
  v40 = v47;
  v21 = v19;
  v39 = v21;
  objc_msgSend(v15, "setRecordZoneChangeTokensUpdatedBlock:", v37);
  v33[0] = v18;
  v33[1] = 3221225472;
  v33[2] = __86__ICCloudContext_newOperationToFetchRecordZoneChangesWithZoneConfigurations_database___block_invoke_7;
  v33[3] = &unk_1E76CE3E8;
  v33[4] = self;
  objc_copyWeak(&v36, &location);
  v35 = v47;
  v22 = v21;
  v34 = v22;
  objc_msgSend(v15, "setRecordZoneFetchCompletionBlock:", v33);
  v30[0] = v18;
  v30[1] = 3221225472;
  v30[2] = __86__ICCloudContext_newOperationToFetchRecordZoneChangesWithZoneConfigurations_database___block_invoke_8;
  v30[3] = &unk_1E76CE410;
  v30[4] = self;
  objc_copyWeak(&v32, &location);
  v23 = v22;
  v31 = v23;
  objc_msgSend(v15, "setFetchRecordZoneChangesCompletionBlock:", v30);
  v24 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v15, "ic_loggingDescription");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCloudContext newOperationToFetchRecordZoneChangesWithZoneConfigurations:database:].cold.1((uint64_t)v20, v25, (uint64_t)v50);
  }

  v26 = v31;
  v27 = v15;

  objc_destroyWeak(&v32);
  objc_destroyWeak(&v36);

  objc_destroyWeak(&v41);
  objc_destroyWeak(&v43);
  objc_destroyWeak(&v45);

  _Block_object_dispose(v47, 8);
  objc_destroyWeak(&location);

  return v27;
}

void __86__ICCloudContext_newOperationToFetchRecordZoneChangesWithZoneConfigurations_database___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "processingQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __86__ICCloudContext_newOperationToFetchRecordZoneChangesWithZoneConfigurations_database___block_invoke_2;
  v7[3] = &unk_1E76C7730;
  v5 = *(_QWORD *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

void __86__ICCloudContext_newOperationToFetchRecordZoneChangesWithZoneConfigurations_database___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(v1 + 8) + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __86__ICCloudContext_newOperationToFetchRecordZoneChangesWithZoneConfigurations_database___block_invoke_3;
  v4[3] = &unk_1E76C7730;
  v6 = v1;
  v5 = v2;
  objc_msgSend(v3, "performBlockAndWait:", v4);

}

uint64_t __86__ICCloudContext_newOperationToFetchRecordZoneChangesWithZoneConfigurations_database___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "ic_saveWithLogDescription:", CFSTR("%@"), *(_QWORD *)(a1 + 32));
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "reset");
}

void __86__ICCloudContext_newOperationToFetchRecordZoneChangesWithZoneConfigurations_database___block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4)
{
  void *v7;
  id *v8;
  id v9;
  id v10;
  id v11;
  id WeakRetained;

  v7 = *(void **)(a1 + 32);
  v8 = (id *)(a1 + 48);
  v9 = a4;
  v10 = a3;
  v11 = a2;
  WeakRetained = objc_loadWeakRetained(v8);
  objc_msgSend(v7, "fetchRecordZoneChangesOperation:recordWasChangedWithRecordID:record:error:context:", WeakRetained, v11, v10, v9, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

}

void __86__ICCloudContext_newOperationToFetchRecordZoneChangesWithZoneConfigurations_database___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id *v6;
  id v7;
  id v8;
  id WeakRetained;

  v5 = *(void **)(a1 + 32);
  v6 = (id *)(a1 + 48);
  v7 = a3;
  v8 = a2;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(v5, "fetchRecordZoneChangesOperation:recordWasDeletedWithRecordID:recordType:context:", WeakRetained, v8, v7, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

}

uint64_t __86__ICCloudContext_newOperationToFetchRecordZoneChangesWithZoneConfigurations_database___block_invoke_6(_QWORD *a1, void *a2, void *a3)
{
  void *v5;
  id *v6;
  id v7;
  id v8;
  id WeakRetained;

  v5 = (void *)a1[4];
  v6 = (id *)(a1 + 8);
  v7 = a3;
  v8 = a2;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(v5, "fetchRecordZoneChangesOperation:zoneID:accountID:changeTokenUpdated:context:", WeakRetained, v8, a1[5], v7, *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40));

  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

uint64_t __86__ICCloudContext_newOperationToFetchRecordZoneChangesWithZoneConfigurations_database___block_invoke_7(_QWORD *a1, void *a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  void *v9;
  id *v10;
  id v11;
  id v12;
  id v13;
  id WeakRetained;

  v9 = (void *)a1[4];
  v10 = (id *)(a1 + 7);
  v11 = a6;
  v12 = a3;
  v13 = a2;
  WeakRetained = objc_loadWeakRetained(v10);
  objc_msgSend(v9, "fetchRecordZoneChangesOperation:completedFetchForZoneID:serverChangeToken:error:context:", WeakRetained, v13, v12, v11, *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));

  return (*(uint64_t (**)(void))(a1[5] + 16))();
}

void __86__ICCloudContext_newOperationToFetchRecordZoneChangesWithZoneConfigurations_database___block_invoke_8(uint64_t a1, void *a2)
{
  void *v3;
  id *v4;
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  ICParticipantUpdater *v9;
  ICParticipantUpdater *v10;
  id v11;

  v3 = *(void **)(a1 + 32);
  v4 = (id *)(a1 + 48);
  v5 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(v3, "fetchRecordZoneChangesOperationDidComplete:error:", WeakRetained, v5);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v7 = *(void **)(a1 + 32);
  v8 = objc_loadWeakRetained(v4);
  objc_msgSend(v7, "informCloudAnalyticsDelegateForOperationDidEnd:recordsByRecordID:operationError:", v8, MEMORY[0x1E0C9AA70], v5);

  v9 = [ICParticipantUpdater alloc];
  objc_msgSend(*(id *)(a1 + 32), "backgroundContext");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v10 = -[ICParticipantUpdater initWithManagedObjectContext:](v9, "initWithManagedObjectContext:", v11);
  -[ICParticipantUpdater updateWithCompletion:](v10, "updateWithCompletion:", 0);

}

- (void)fetchRecordZoneChangesOperation:(id)a3 completedFetchForZoneID:(id)a4 serverChangeToken:(id)a5 error:(id)a6 context:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  -[ICCloudContext processingQueue](self, "processingQueue");
  v17 = objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __106__ICCloudContext_fetchRecordZoneChangesOperation_completedFetchForZoneID_serverChangeToken_error_context___block_invoke;
  v23[3] = &unk_1E76CDDD0;
  v23[4] = self;
  v24 = v12;
  v25 = v15;
  v26 = v13;
  v27 = v14;
  v28 = v16;
  v18 = v16;
  v19 = v14;
  v20 = v13;
  v21 = v15;
  v22 = v12;
  dispatch_async(v17, v23);

}

void __106__ICCloudContext_fetchRecordZoneChangesOperation_completedFetchForZoneID_serverChangeToken_error_context___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  os_log_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  int v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD block[4];
  id v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "database");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountIDForDatabase:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "backgroundContext");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(*(id *)(a1 + 48), "code");
    switch(v6)
    {
      case 20:
        goto LABEL_10;
      case 21:
        v7 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(a1 + 56), "ic_loggingDescription");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "ic_loggingDescription");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v42 = v8;
          v43 = 2112;
          v44 = v9;
          v45 = 2112;
          v46 = v4;
          _os_log_impl(&dword_1BD918000, v7, OS_LOG_TYPE_DEFAULT, "Server change token expired for zone %@ %@ in account ID %@", buf, 0x20u);

        }
        v10 = *(_QWORD *)(a1 + 56);
        v11 = *(void **)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "database");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "deleteServerChangeTokenForRecordZoneID:databaseScope:accountID:context:", v10, objc_msgSend(v12, "databaseScope"), v4, v5);

        goto LABEL_16;
      case 22:
      case 23:
      case 24:
      case 25:
      case 27:
        goto LABEL_13;
      case 26:
        objc_msgSend(*(id *)(a1 + 32), "receivedZoneNotFound:operation:context:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), v5);
        goto LABEL_22;
      case 28:
        v19 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(a1 + 56), "ic_loggingDescription");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "ic_loggingDescription");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v42 = v20;
          v43 = 2112;
          v44 = v21;
          v45 = 2112;
          v46 = v4;
          _os_log_impl(&dword_1BD918000, v19, OS_LOG_TYPE_DEFAULT, "User deleted zone %@ %@ in account ID %@", buf, 0x20u);

        }
        v22 = *(_QWORD *)(a1 + 56);
        v23 = *(void **)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "database");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "deleteServerChangeTokenForRecordZoneID:databaseScope:accountID:context:", v22, objc_msgSend(v24, "databaseScope"), v4, v5);

        objc_msgSend(*(id *)(a1 + 32), "cloudContextDelegate");
        v13 = (os_log_t)objc_claimAutoreleasedReturnValue();
        -[NSObject cloudContext:userDidDeleteRecordZoneWithID:accountID:](v13, "cloudContext:userDidDeleteRecordZoneWithID:accountID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), v4);
        goto LABEL_21;
      default:
        if (v6 == 3)
        {
LABEL_10:
          v13 = os_log_create("com.apple.notes", "Cloud");
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(*(id *)(a1 + 56), "ic_loggingDescription");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 40), "ic_loggingDescription");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = *(void **)(a1 + 48);
            *(_DWORD *)buf = 138413058;
            v42 = v14;
            v43 = 2112;
            v44 = v15;
            v45 = 2112;
            v46 = v4;
            v47 = 2112;
            v48 = v16;
            _os_log_impl(&dword_1BD918000, v13, OS_LOG_TYPE_DEFAULT, "Non-fatal error fetching zone changes for zone %@ %@  in account ID %@: %@", buf, 0x2Au);

          }
LABEL_21:

          goto LABEL_22;
        }
LABEL_13:
        v17 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(*(id *)(a1 + 56), "ic_loggingDescription");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "ic_loggingDescription");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = *(void **)(a1 + 48);
          *(_DWORD *)buf = 138413058;
          v42 = v36;
          v43 = 2112;
          v44 = v37;
          v45 = 2112;
          v46 = v4;
          v47 = 2112;
          v48 = v38;
          _os_log_error_impl(&dword_1BD918000, v17, OS_LOG_TYPE_ERROR, "Error fetching zone changes %@ %@ in account ID %@: %@", buf, 0x2Au);

        }
LABEL_16:
        v18 = 1;
        break;
    }
  }
  else
  {
    v5 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 56), "ic_loggingDescription");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 64), "ic_loggingDescription");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "ic_loggingDescription");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v42 = v33;
      v43 = 2112;
      v44 = v34;
      v45 = 2112;
      v46 = v35;
      v47 = 2112;
      v48 = v4;
      _os_log_debug_impl(&dword_1BD918000, v5, OS_LOG_TYPE_DEBUG, "Fetched changes for record zone %@ %@ %@ in account ID %@", buf, 0x2Au);

    }
LABEL_22:
    v18 = 0;
  }

  objc_msgSend(*(id *)(a1 + 32), "accountZoneIDsFetchingChanges");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "ic_removeZoneID:forAccountID:", *(_QWORD *)(a1 + 56), v4);

  if (v18)
  {
    objc_msgSend(*(id *)(a1 + 56), "zoneName");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "isEqualToString:", *MEMORY[0x1E0C94A30]);

    if ((v27 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "accountZoneIDsNeedingFetchChanges");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "ic_addZoneID:forAccountID:", *(_QWORD *)(a1 + 56), v4);

      objc_msgSend(*(id *)(a1 + 32), "startRetryTimerIfNecessaryWithError:", *(_QWORD *)(a1 + 48));
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "saveZoneFetchState");
  v29 = *(_QWORD *)(a1 + 64);
  if (v29)
  {
    v30 = *(_QWORD *)(a1 + 56);
    v31 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "database");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "saveServerChangeToken:forRecordZoneID:databaseScope:accountID:context:", v29, v30, objc_msgSend(v32, "databaseScope"), v4, *(_QWORD *)(a1 + 72));

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __106__ICCloudContext_fetchRecordZoneChangesOperation_completedFetchForZoneID_serverChangeToken_error_context___block_invoke_452;
  block[3] = &unk_1E76C73F8;
  v40 = *(id *)(a1 + 56);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __106__ICCloudContext_fetchRecordZoneChangesOperation_completedFetchForZoneID_serverChangeToken_error_context___block_invoke_452(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("ICCloudContextFetchRecordChangeOperationDidFinishNotification"), *(_QWORD *)(a1 + 32));

}

- (void)fetchRecordZoneChangesOperationDidComplete:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[ICCloudContext processingQueue](self, "processingQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__ICCloudContext_fetchRecordZoneChangesOperationDidComplete_error___block_invoke;
  block[3] = &unk_1E76C7708;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(v8, block);

}

void __67__ICCloudContext_fetchRecordZoneChangesOperationDidComplete_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v2 = a1 + 40;
  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accountIDForDatabase:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *(void **)(v2 + 8);
  if (!v6)
  {
    v9 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __67__ICCloudContext_fetchRecordZoneChangesOperationDidComplete_error___block_invoke_cold_1();
    goto LABEL_14;
  }
  v7 = objc_msgSend(v6, "code");
  if (v7 == 20 || v7 == 3)
  {
    v9 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "ic_loggingDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138412802;
      v29 = v5;
      v30 = 2112;
      v31 = v10;
      v32 = 2112;
      v33 = v11;
      _os_log_impl(&dword_1BD918000, v9, OS_LOG_TYPE_DEFAULT, "Non-fatal error fetching zone changes in account ID %@: %@: %@", buf, 0x20u);

    }
    goto LABEL_14;
  }
  if (v7 == 2)
  {
    v9 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __67__ICCloudContext_fetchRecordZoneChangesOperationDidComplete_error___block_invoke_cold_2();
LABEL_14:
    v12 = 0;
    goto LABEL_15;
  }
  v9 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 40), "ic_loggingDescription");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138412802;
    v29 = v5;
    v30 = 2112;
    v31 = v21;
    v32 = 2112;
    v33 = v22;
    _os_log_error_impl(&dword_1BD918000, v9, OS_LOG_TYPE_ERROR, "Error fetching zone changes in account ID %@: %@: %@", buf, 0x20u);

  }
  v12 = 1;
LABEL_15:

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(*(id *)v2, "recordZoneIDs", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v24;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v24 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v17);
        objc_msgSend(*(id *)(a1 + 32), "accountZoneIDsFetchingChanges");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "ic_removeZoneID:forAccountID:", v18, v5);

        if (v12)
        {
          objc_msgSend(*(id *)(a1 + 32), "accountZoneIDsNeedingFetchChanges");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "ic_addZoneID:forAccountID:", v18, v5);

        }
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v15);
  }

  objc_msgSend(*(id *)(a1 + 32), "saveZoneFetchState");
  if (v12)
    objc_msgSend(*(id *)(a1 + 32), "startRetryTimerIfNecessaryWithError:", *(_QWORD *)(a1 + 48));

}

- (void)fetchRecordZoneChangesOperation:(id)a3 recordWasChangedWithRecordID:(id)a4 record:(id)a5 error:(id)a6 context:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  -[ICCloudContext processingQueue](self, "processingQueue");
  v17 = objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __100__ICCloudContext_fetchRecordZoneChangesOperation_recordWasChangedWithRecordID_record_error_context___block_invoke;
  v23[3] = &unk_1E76CDDD0;
  v23[4] = self;
  v24 = v12;
  v25 = v14;
  v26 = v16;
  v27 = v13;
  v28 = v15;
  v18 = v15;
  v19 = v13;
  v20 = v16;
  v21 = v14;
  v22 = v12;
  dispatch_async(v17, v23);

}

void __100__ICCloudContext_fetchRecordZoneChangesOperation_recordWasChangedWithRecordID_record_error_context___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "database");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountIDForDatabase:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(_QWORD *)(a1 + 48);
  v6 = os_log_create("com.apple.notes", "Cloud");
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 48), "ic_loggingDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "ic_shortLoggingDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412802;
      v14 = v4;
      v15 = 2112;
      v16 = v8;
      v17 = 2112;
      v18 = v9;
      _os_log_debug_impl(&dword_1BD918000, v6, OS_LOG_TYPE_DEBUG, "Record changed for account ID %@: %@ %@", (uint8_t *)&v13, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 32), "_ingestCloudKitRecord:forAccountID:forceMerge:context:", *(_QWORD *)(a1 + 48), v4, 0, *(_QWORD *)(a1 + 56));
  }
  else
  {
    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 64), "ic_loggingDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(void **)(a1 + 72);
      objc_msgSend(*(id *)(a1 + 40), "ic_shortLoggingDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138413058;
      v14 = v4;
      v15 = 2112;
      v16 = v10;
      v17 = 2112;
      v18 = v11;
      v19 = 2112;
      v20 = v12;
      _os_log_debug_impl(&dword_1BD918000, v6, OS_LOG_TYPE_DEBUG, "Error fetching record for account ID %@: %@ %@ %@", (uint8_t *)&v13, 0x2Au);

    }
  }

}

- (void)fetchRecordZoneChangesOperation:(id)a3 recordWasDeletedWithRecordID:(id)a4 recordType:(id)a5 context:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  ICCloudContext *v21;
  id v22;
  id v23;
  id v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[ICCloudContext processingQueue](self, "processingQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __98__ICCloudContext_fetchRecordZoneChangesOperation_recordWasDeletedWithRecordID_recordType_context___block_invoke;
  block[3] = &unk_1E76CDDF8;
  v20 = v13;
  v21 = self;
  v22 = v10;
  v23 = v11;
  v24 = v12;
  v15 = v12;
  v16 = v11;
  v17 = v10;
  v18 = v13;
  dispatch_async(v14, block);

}

void __98__ICCloudContext_fetchRecordZoneChangesOperation_recordWasDeletedWithRecordID_recordType_context___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;
  id v5;
  id v6;
  id v7;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __98__ICCloudContext_fetchRecordZoneChangesOperation_recordWasDeletedWithRecordID_recordType_context___block_invoke_2;
  v3[3] = &unk_1E76CDDF8;
  v2 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  v4 = *(id *)(a1 + 48);
  v5 = *(id *)(a1 + 56);
  v6 = *(id *)(a1 + 32);
  v7 = *(id *)(a1 + 64);
  objc_msgSend(v2, "performBlockAndWait:", v3);

}

void __98__ICCloudContext_fetchRecordZoneChangesOperation_recordWasDeletedWithRecordID_recordType_context___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "database");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountIDForDatabase:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[ICUserSpecificRecordIDParser isUserSpecificRecordID:](ICUserSpecificRecordIDParser, "isUserSpecificRecordID:", *(_QWORD *)(a1 + 48)))
  {
    v5 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 48), "ic_loggingDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "ic_shortLoggingDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412802;
      v16 = v4;
      v17 = 2112;
      v18 = v11;
      v19 = 2112;
      v20 = v12;
      _os_log_debug_impl(&dword_1BD918000, v5, OS_LOG_TYPE_DEBUG, "User-specific record was deleted in account ID %@: %@ %@", (uint8_t *)&v15, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 32), "existingCloudObjectForUserSpecificRecordID:createPlaceholderIfNecessary:accountID:context:", *(_QWORD *)(a1 + 48), 0, v4, *(_QWORD *)(a1 + 56));
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject didDeleteUserSpecificRecordID:](v6, "didDeleteUserSpecificRecordID:", *(_QWORD *)(a1 + 48));
  }
  else
  {
    v7 = objc_msgSend(*(id *)(a1 + 64), "isEqualToString:", *MEMORY[0x1E0C94A20]);
    v8 = os_log_create("com.apple.notes", "Cloud");
    v6 = v8;
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(*(id *)(a1 + 48), "ic_loggingDescription");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "ic_shortLoggingDescription");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138412802;
        v16 = v4;
        v17 = 2112;
        v18 = v9;
        v19 = 2112;
        v20 = v10;
        _os_log_impl(&dword_1BD918000, v6, OS_LOG_TYPE_INFO, "Share was deleted in account ID %@: %@ %@", (uint8_t *)&v15, 0x20u);

      }
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(*(id *)(a1 + 48), "ic_loggingDescription");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "ic_shortLoggingDescription");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138412802;
        v16 = v4;
        v17 = 2112;
        v18 = v13;
        v19 = 2112;
        v20 = v14;
        _os_log_debug_impl(&dword_1BD918000, v6, OS_LOG_TYPE_DEBUG, "Record was deleted in account ID %@: %@ %@", (uint8_t *)&v15, 0x20u);

      }
      objc_msgSend(*(id *)(a1 + 32), "existingCloudObjectForRecordID:recordType:accountID:context:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), v4, *(_QWORD *)(a1 + 56));
      v6 = objc_claimAutoreleasedReturnValue();
      -[NSObject objectWasDeletedFromCloudByAnotherDevice](v6, "objectWasDeletedFromCloudByAnotherDevice");
    }
  }

}

- (void)fetchRecordZoneChangesOperation:(id)a3 zoneID:(id)a4 accountID:(id)a5 changeTokenUpdated:(id)a6 context:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  ICCloudContext *v27;
  id v28;
  id v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  -[ICCloudContext processingQueue](self, "processingQueue");
  v17 = objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __94__ICCloudContext_fetchRecordZoneChangesOperation_zoneID_accountID_changeTokenUpdated_context___block_invoke;
  v23[3] = &unk_1E76CDDD0;
  v24 = v13;
  v25 = v15;
  v26 = v12;
  v27 = self;
  v28 = v14;
  v29 = v16;
  v18 = v16;
  v19 = v14;
  v20 = v12;
  v21 = v15;
  v22 = v13;
  dispatch_async(v17, v23);

}

void __94__ICCloudContext_fetchRecordZoneChangesOperation_zoneID_accountID_changeTokenUpdated_context___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v2 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __94__ICCloudContext_fetchRecordZoneChangesOperation_zoneID_accountID_changeTokenUpdated_context___block_invoke_cold_1();

  v4 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 48), "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "saveServerChangeToken:forRecordZoneID:databaseScope:accountID:context:", v3, v4, objc_msgSend(v6, "databaseScope"), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));

}

- (void)fetchDatabaseChangesWithReason:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  -[ICCloudContext containersByAccountID](self, "containersByAccountID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __67__ICCloudContext_fetchDatabaseChangesWithReason_completionHandler___block_invoke;
  v12[3] = &unk_1E76CE438;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v12);

  v10 = (void *)objc_msgSend(v11, "copy");
  -[ICCloudContext fetchDatabaseChangesForDatabases:reason:completionHandler:](self, "fetchDatabaseChangesForDatabases:reason:completionHandler:", v10, v7, v6);

}

void __67__ICCloudContext_fetchDatabaseChangesWithReason_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a2;
  v6 = a3;
  v7 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __67__ICCloudContext_fetchDatabaseChangesWithReason_completionHandler___block_invoke_cold_1();

  v8 = *(void **)(a1 + 32);
  objc_msgSend(v6, "privateCloudDatabase");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v9);

  v10 = *(void **)(a1 + 32);
  objc_msgSend(v6, "sharedCloudDatabase");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "addObject:", v11);
}

- (void)fetchDatabaseChangesForDatabases:(id)a3 reason:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  ICCloudContext *v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0D64288], "postFetchDatabaseChangesTelemetryWithReason:", v9);
  -[ICCloudContext processingQueue](self, "processingQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __76__ICCloudContext_fetchDatabaseChangesForDatabases_reason_completionHandler___block_invoke;
  v15[3] = &unk_1E76C8408;
  v16 = v9;
  v17 = v8;
  v18 = self;
  v19 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_async(v11, v15);

}

void __76__ICCloudContext_fetchDatabaseChangesForDatabases_reason_completionHandler___block_invoke(uint64_t a1)
{
  const __CFString *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  NSObject *v19;
  __CFString *v20;
  id v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[5];
  id v28;
  _QWORD *v29;
  _QWORD v30[6];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[5];
  id v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v21 = objc_alloc_init(MEMORY[0x1E0C94F88]);
  v22 = a1;
  if (objc_msgSend(*(id *)(a1 + 32), "length"))
  {
    objc_msgSend(CFSTR("FetchDatabaseChanges"), "stringByAppendingFormat:", CFSTR("-%@"), *(_QWORD *)(a1 + 32));
    v2 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = CFSTR("FetchDatabaseChanges");
  }
  v20 = (__CFString *)v2;
  objc_msgSend(v21, "setName:");
  objc_msgSend(v21, "setQuantity:", objc_msgSend(*(id *)(a1 + 40), "count"));
  objc_msgSend(v21, "setExpectedSendSize:", 1);
  objc_msgSend(v21, "setExpectedReceiveSize:", 1);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = __Block_byref_object_copy__46;
  v35[4] = __Block_byref_object_dispose__46;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v36 = (id)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v4 = *(id *)(a1 + 40);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
  v6 = MEMORY[0x1E0C809B0];
  if (v5)
  {
    v7 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v32 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
        v10 = *(void **)(a1 + 48);
        v30[0] = v6;
        v30[1] = 3221225472;
        v30[2] = __76__ICCloudContext_fetchDatabaseChangesForDatabases_reason_completionHandler___block_invoke_2;
        v30[3] = &unk_1E76CE460;
        v30[4] = v10;
        v30[5] = v35;
        objc_msgSend(v10, "operationToFetchDatabaseChangesForDatabase:completionHandler:", v9, v30);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setGroup:", v21);
        objc_msgSend(v3, "addObject:", v11);

      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
    }
    while (v5);
  }

  v12 = *(void **)(a1 + 56);
  if (v12)
  {
    v13 = (void *)MEMORY[0x1E0CB34C8];
    v27[0] = v6;
    v27[1] = 3221225472;
    v27[2] = __76__ICCloudContext_fetchDatabaseChangesForDatabases_reason_completionHandler___block_invoke_4;
    v27[3] = &unk_1E76CDAE8;
    v27[4] = *(_QWORD *)(a1 + 48);
    v29 = v35;
    v28 = v12;
    objc_msgSend(v13, "blockOperationWithBlock:", v27);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setName:", CFSTR("FetchDatabaseChangesCompletion"));
    objc_msgSend(v14, "ic_setResistsCancellation:", 1);
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v15 = v3;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v37, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v24;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v24 != v17)
            objc_enumerationMutation(v15);
          objc_msgSend(v14, "addDependency:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j));
        }
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v37, 16);
      }
      while (v16);
    }

    objc_msgSend(v15, "addObject:", v14);
  }
  v19 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v21, "ic_loggingDescription");
    objc_claimAutoreleasedReturnValue();
    __76__ICCloudContext_fetchDatabaseChangesForDatabases_reason_completionHandler___block_invoke_cold_1();
  }

  objc_msgSend(*(id *)(v22 + 48), "addOperations:", v3);
  _Block_object_dispose(v35, 8);

}

void __76__ICCloudContext_fetchDatabaseChangesForDatabases_reason_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "processingQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __76__ICCloudContext_fetchDatabaseChangesForDatabases_reason_completionHandler___block_invoke_3;
    v5[3] = &unk_1E76C7730;
    v7 = *(_QWORD *)(a1 + 40);
    v6 = v3;
    dispatch_async(v4, v5);

  }
}

uint64_t __76__ICCloudContext_fetchDatabaseChangesForDatabases_reason_completionHandler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", *(_QWORD *)(a1 + 32));
}

void __76__ICCloudContext_fetchDatabaseChangesForDatabases_reason_completionHandler___block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  id v3;
  __int128 v4;
  _QWORD block[5];
  __int128 v6;

  objc_msgSend(*(id *)(a1 + 32), "processingQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__ICCloudContext_fetchDatabaseChangesForDatabases_reason_completionHandler___block_invoke_5;
  block[3] = &unk_1E76CDAE8;
  block[4] = *(_QWORD *)(a1 + 32);
  v4 = *(_OWORD *)(a1 + 40);
  v3 = (id)v4;
  v6 = v4;
  dispatch_async(v2, block);

}

void __76__ICCloudContext_fetchDatabaseChangesForDatabases_reason_completionHandler___block_invoke_5(uint64_t a1)
{
  id v2;

  objc_msgSend((id)objc_opt_class(), "errorFromErrors:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)operationToFetchDatabaseChangesForDatabase:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  NSObject *v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  id v36;
  id v37;
  id v38;
  void *v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[5];
  id v46;
  id v47;
  id v48;
  id v49;
  _QWORD v50[5];
  id v51;
  id v52;
  id v53;
  _QWORD v54[5];
  id v55;
  id v56;
  _QWORD v57[5];
  id v58;
  id v59;
  id location;
  uint8_t buf[4];
  id v62;
  __int16 v63;
  void *v64;
  _BYTE v65[128];
  _BYTE v66[24];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v40 = a3;
  v6 = a4;
  -[ICCloudContext overrideAccountID](self, "overrideAccountID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(v40, "container");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "options");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "accountOverrideInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "accountID");
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[ICCloudContext backgroundContext](self, "backgroundContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudContext serverChangeTokenForChangedZonesInDatabase:accountID:context:](self, "serverChangeTokenForChangedZonesInDatabase:accountID:context:", v40, v9, v13);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94DB0]), "initWithPreviousServerChangeToken:", v39);
  objc_msgSend(v14, "setQualityOfService:", -[ICCloudContext qualityOfService](self, "qualityOfService"));
  v15 = -[ICCloudContext discretionaryNetworkBehavior](self, "discretionaryNetworkBehavior");
  objc_msgSend(v14, "configuration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setDiscretionaryNetworkBehavior:", v15);

  objc_msgSend(v14, "setDatabase:", v40);
  objc_msgSend(v14, "setFetchAllChanges:", 1);
  objc_initWeak(&location, v14);
  v17 = MEMORY[0x1E0C809B0];
  v57[0] = MEMORY[0x1E0C809B0];
  v57[1] = 3221225472;
  v57[2] = __79__ICCloudContext_operationToFetchDatabaseChangesForDatabase_completionHandler___block_invoke;
  v57[3] = &unk_1E76CE488;
  v57[4] = self;
  objc_copyWeak(&v59, &location);
  v18 = v9;
  v58 = v18;
  objc_msgSend(v14, "setRecordZoneWithIDChangedBlock:", v57);
  v54[0] = v17;
  v54[1] = 3221225472;
  v54[2] = __79__ICCloudContext_operationToFetchDatabaseChangesForDatabase_completionHandler___block_invoke_2;
  v54[3] = &unk_1E76CE488;
  v54[4] = self;
  objc_copyWeak(&v56, &location);
  v19 = v18;
  v55 = v19;
  objc_msgSend(v14, "setRecordZoneWithIDWasDeletedBlock:", v54);
  v50[0] = v17;
  v50[1] = 3221225472;
  v50[2] = __79__ICCloudContext_operationToFetchDatabaseChangesForDatabase_completionHandler___block_invoke_3;
  v50[3] = &unk_1E76CE4B0;
  v50[4] = self;
  objc_copyWeak(&v53, &location);
  v20 = v19;
  v51 = v20;
  v21 = v13;
  v52 = v21;
  objc_msgSend(v14, "setChangeTokenUpdatedBlock:", v50);
  v45[0] = v17;
  v45[1] = 3221225472;
  v45[2] = __79__ICCloudContext_operationToFetchDatabaseChangesForDatabase_completionHandler___block_invoke_4;
  v45[3] = &unk_1E76CE4D8;
  v45[4] = self;
  objc_copyWeak(&v49, &location);
  v38 = v20;
  v46 = v38;
  v36 = v6;
  v48 = v36;
  v37 = v21;
  v47 = v37;
  objc_msgSend(v14, "setFetchDatabaseChangesCompletionBlock:", v45);
  v22 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v14, "ic_loggingDescription");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCloudContext operationToFetchDatabaseChangesForDatabase:completionHandler:].cold.1((uint64_t)v38, v23, (uint64_t)v66);
  }

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  -[ICCloudContext operationQueue](self, "operationQueue");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "operations");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v41, v65, 16);
  if (v26)
  {
    v27 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v42 != v27)
          objc_enumerationMutation(v25);
        v29 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v30 = os_log_create("com.apple.notes", "Cloud");
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v14, "ic_loggingDescription");
            v31 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "ic_loggingDescription");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v62 = v31;
            v63 = 2112;
            v64 = v32;
            _os_log_debug_impl(&dword_1BD918000, v30, OS_LOG_TYPE_DEBUG, "Database changes operation %@ will wait for %@", buf, 0x16u);

          }
          objc_msgSend(v14, "addDependency:", v29);
        }
      }
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v41, v65, 16);
    }
    while (v26);
  }

  v33 = v47;
  v34 = v14;

  objc_destroyWeak(&v49);
  objc_destroyWeak(&v53);

  objc_destroyWeak(&v56);
  objc_destroyWeak(&v59);

  objc_destroyWeak(&location);
  return v34;
}

void __79__ICCloudContext_operationToFetchDatabaseChangesForDatabase_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id *v4;
  id v5;
  id WeakRetained;

  v3 = *(void **)(a1 + 32);
  v4 = (id *)(a1 + 48);
  v5 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(v3, "fetchDatabaseChangesOperation:recordZoneWithIDChanged:accountID:", WeakRetained, v5, *(_QWORD *)(a1 + 40));

}

void __79__ICCloudContext_operationToFetchDatabaseChangesForDatabase_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id *v4;
  id v5;
  id WeakRetained;

  v3 = *(void **)(a1 + 32);
  v4 = (id *)(a1 + 48);
  v5 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(v3, "fetchDatabaseChangesOperation:recordZoneWithIDWasDeleted:accountID:", WeakRetained, v5, *(_QWORD *)(a1 + 40));

}

void __79__ICCloudContext_operationToFetchDatabaseChangesForDatabase_completionHandler___block_invoke_3(_QWORD *a1, void *a2)
{
  void *v3;
  id *v4;
  id v5;
  id WeakRetained;

  v3 = (void *)a1[4];
  v4 = (id *)(a1 + 7);
  v5 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(v3, "fetchDatabaseChangesOperation:changeTokenUpdated:accountID:context:", WeakRetained, v5, a1[5], a1[6]);

}

void __79__ICCloudContext_operationToFetchDatabaseChangesForDatabase_completionHandler___block_invoke_4(_QWORD *a1, void *a2, uint64_t a3, void *a4)
{
  void *v6;
  id *v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  id v12;

  v6 = (void *)a1[4];
  v7 = (id *)(a1 + 8);
  v8 = a4;
  v9 = a2;
  WeakRetained = objc_loadWeakRetained(v7);
  objc_msgSend(v6, "fetchDatabaseChangesOperation:finishedWithServerChangeToken:accountID:error:completionHandler:context:", WeakRetained, v9, a1[5], v8, a1[7], a1[6]);

  v11 = (void *)a1[4];
  v12 = objc_loadWeakRetained(v7);
  objc_msgSend(v11, "informCloudAnalyticsDelegateForOperationDidEnd:recordsByRecordID:operationError:", v12, MEMORY[0x1E0C9AA70], v8);

}

- (void)fetchDatabaseChangesOperation:(id)a3 recordZoneWithIDChanged:(id)a4 accountID:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  ICCloudContext *v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[ICCloudContext processingQueue](self, "processingQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __82__ICCloudContext_fetchDatabaseChangesOperation_recordZoneWithIDChanged_accountID___block_invoke;
  v15[3] = &unk_1E76C8C70;
  v16 = v10;
  v17 = v9;
  v18 = v8;
  v19 = self;
  v12 = v8;
  v13 = v9;
  v14 = v10;
  dispatch_async(v11, v15);

}

void __82__ICCloudContext_fetchDatabaseChangesOperation_recordZoneWithIDChanged_accountID___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  char v4;
  void *v5;

  v2 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __82__ICCloudContext_fetchDatabaseChangesOperation_recordZoneWithIDChanged_accountID___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 40), "zoneName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C94A30]);

  if ((v4 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 56), "accountZoneIDsNeedingFetchChanges");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ic_addZoneID:forAccountID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));

    objc_msgSend(*(id *)(a1 + 56), "saveZoneFetchState");
  }
}

- (void)fetchDatabaseChangesOperation:(id)a3 recordZoneWithIDWasDeleted:(id)a4 accountID:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  ICCloudContext *v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[ICCloudContext processingQueue](self, "processingQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __85__ICCloudContext_fetchDatabaseChangesOperation_recordZoneWithIDWasDeleted_accountID___block_invoke;
  v15[3] = &unk_1E76C8C70;
  v16 = v10;
  v17 = v9;
  v18 = v8;
  v19 = self;
  v12 = v8;
  v13 = v9;
  v14 = v10;
  dispatch_async(v11, v15);

}

void __85__ICCloudContext_fetchDatabaseChangesOperation_recordZoneWithIDWasDeleted_accountID___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __85__ICCloudContext_fetchDatabaseChangesOperation_recordZoneWithIDWasDeleted_accountID___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 48), "database");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "databaseScope") == 3)
  {
    objc_msgSend(*(id *)(a1 + 40), "ownerName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C94730]);

    if (v5)
    {
      v6 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 40), "ic_loggingDescription");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "ic_loggingDescription");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138412546;
        v19 = v7;
        v20 = 2112;
        v21 = v8;
        _os_log_impl(&dword_1BD918000, v6, OS_LOG_TYPE_DEFAULT, "Callback for operation in shared database says private zone was deleted %@: %@", (uint8_t *)&v18, 0x16u);

      }
      objc_msgSend(MEMORY[0x1E0D64288], "postBasicEvent:", 11);
      return;
    }
  }
  else
  {

  }
  if (objc_msgSend(*(id *)(a1 + 40), "ic_isOwnedByCurrentUser"))
  {
    objc_msgSend(*(id *)(a1 + 40), "zoneName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0C94A30]);

    if ((v10 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 56), "accountZoneIDsNeedingFetchChanges");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "ic_addZoneID:forAccountID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));

      objc_msgSend(*(id *)(a1 + 56), "saveZoneFetchState");
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 56), "cloudContextDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "cloudContext:sharedZoneWasDeleted:accountID:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));

    objc_msgSend(*(id *)(a1 + 56), "accountZoneIDsNeedingFetchChanges");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "ic_removeZoneID:forAccountID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));

    objc_msgSend(*(id *)(a1 + 56), "saveZoneFetchState");
    objc_msgSend(*(id *)(a1 + 56), "backgroundContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(void **)(a1 + 56);
    v16 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "database");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "deleteServerChangeTokenForRecordZoneID:databaseScope:accountID:context:", v16, objc_msgSend(v17, "databaseScope"), *(_QWORD *)(a1 + 32), v14);

  }
}

- (void)fetchDatabaseChangesOperation:(id)a3 changeTokenUpdated:(id)a4 accountID:(id)a5 context:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;
  id v22;
  ICCloudContext *v23;
  id v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[ICCloudContext processingQueue](self, "processingQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__ICCloudContext_fetchDatabaseChangesOperation_changeTokenUpdated_accountID_context___block_invoke;
  block[3] = &unk_1E76CDDF8;
  v20 = v12;
  v21 = v11;
  v22 = v10;
  v23 = self;
  v24 = v13;
  v15 = v13;
  v16 = v10;
  v17 = v11;
  v18 = v12;
  dispatch_async(v14, block);

}

void __85__ICCloudContext_fetchDatabaseChangesOperation_changeTokenUpdated_accountID_context___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __85__ICCloudContext_fetchDatabaseChangesOperation_changeTokenUpdated_accountID_context___block_invoke_cold_1();

  v3 = *(void **)(a1 + 56);
  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "saveServerChangeToken:forRecordZoneID:databaseScope:accountID:context:", v4, 0, objc_msgSend(v5, "databaseScope"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64));

}

- (void)fetchDatabaseChangesOperation:(id)a3 finishedWithServerChangeToken:(id)a4 accountID:(id)a5 error:(id)a6 completionHandler:(id)a7 context:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD block[4];
  id v28;
  id v29;
  id v30;
  id v31;
  ICCloudContext *v32;
  id v33;
  id v34;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  -[ICCloudContext processingQueue](self, "processingQueue");
  v20 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __120__ICCloudContext_fetchDatabaseChangesOperation_finishedWithServerChangeToken_accountID_error_completionHandler_context___block_invoke;
  block[3] = &unk_1E76CE500;
  v28 = v17;
  v29 = v16;
  v30 = v14;
  v31 = v15;
  v32 = self;
  v33 = v19;
  v34 = v18;
  v21 = v18;
  v22 = v19;
  v23 = v15;
  v24 = v14;
  v25 = v16;
  v26 = v17;
  dispatch_async(v20, block);

}

uint64_t __120__ICCloudContext_fetchDatabaseChangesOperation_finishedWithServerChangeToken_accountID_error_completionHandler_context___block_invoke(uint64_t a1)
{
  void *v2;
  id *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t result;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = (id *)(a1 + 32);
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    if (objc_msgSend(v2, "code") == 21)
    {
      v4 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        v5 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 48), "ic_loggingDescription");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138412546;
        v26 = v5;
        v27 = 2112;
        v28 = v6;
        _os_log_impl(&dword_1BD918000, v4, OS_LOG_TYPE_INFO, "Database changes server change token expired for account %@, %@", (uint8_t *)&v25, 0x16u);

      }
      v7 = *(void **)(a1 + 64);
      objc_msgSend(*(id *)(a1 + 48), "database");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "deleteServerChangeTokenForChangedZonesInDatabase:accountID:context:", v8, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72));

LABEL_6:
      objc_msgSend(*(id *)(a1 + 64), "startRetryTimerIfNecessaryWithError:", *(_QWORD *)(a1 + 32));
      goto LABEL_19;
    }
    if (objc_msgSend(*v3, "code") == 20)
    {
      v13 = os_log_create("com.apple.notes", "Cloud");
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
LABEL_18:

        goto LABEL_19;
      }
      v14 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 48), "ic_loggingDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138412546;
      v26 = v14;
      v27 = 2112;
      v28 = v15;
      v16 = "Operation to fetch database changes was cancelled for account %@, %@";
    }
    else
    {
      v17 = objc_msgSend(*v3, "code");
      v18 = os_log_create("com.apple.notes", "Cloud");
      v13 = v18;
      if (v17 != 3)
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          __120__ICCloudContext_fetchDatabaseChangesOperation_finishedWithServerChangeToken_accountID_error_completionHandler_context___block_invoke_cold_2();

        goto LABEL_6;
      }
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        goto LABEL_18;
      v19 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 48), "ic_loggingDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138412546;
      v26 = v19;
      v27 = 2112;
      v28 = v15;
      v16 = "Operation to fetch database changes failed with no network connection for account %@, %@";
    }
    _os_log_impl(&dword_1BD918000, v13, OS_LOG_TYPE_INFO, v16, (uint8_t *)&v25, 0x16u);

    goto LABEL_18;
  }
  v9 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    __120__ICCloudContext_fetchDatabaseChangesOperation_finishedWithServerChangeToken_accountID_error_completionHandler_context___block_invoke_cold_1(a1);

  v10 = *(_QWORD *)(a1 + 56);
  if (v10)
  {
    v11 = *(void **)(a1 + 64);
    objc_msgSend(*(id *)(a1 + 48), "database");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "saveServerChangeToken:forChangedZonesInDatabase:accountID:context:", v10, v12, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72));

  }
LABEL_19:
  if (*v3)
  {
    v20 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 48), "ic_loggingDescription");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138412290;
      v26 = v21;
      _os_log_impl(&dword_1BD918000, v20, OS_LOG_TYPE_INFO, "Error fetching database changes, canceling dependent operations: %@", (uint8_t *)&v25, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 64), "operationQueue");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (id)objc_msgSend(v22, "iterativelyCancelDependentOperations:", *(_QWORD *)(a1 + 48));

  }
  result = *(_QWORD *)(a1 + 80);
  if (result)
    return (*(uint64_t (**)(uint64_t, id))(result + 16))(result, *v3);
  return result;
}

void __36__ICCloudContext_loadZoneFetchState__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "zoneIDsFromZoneInfos:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "accountZoneIDsNeedingFetchChanges");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v9);

  }
}

- (void)saveZoneFetchState
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_2(&dword_1BD918000, v0, v1, "Saving zone fetch state: zonesNeedingFetchChanges=%@", v2);
  OUTLINED_FUNCTION_1_0();
}

void __36__ICCloudContext_saveZoneFetchState__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "zoneInfosFromZoneIDs:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v6, v7);

}

void __36__ICCloudContext_saveZoneFetchState__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "zoneInfosFromZoneIDs:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v9, v10);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v6, v10);
    }

  }
}

- (void)clearZoneFetchState
{
  NSObject *v3;
  _QWORD block[5];

  -[ICCloudContext processingQueue](self, "processingQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__ICCloudContext_clearZoneFetchState__block_invoke;
  block[3] = &unk_1E76C73F8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __37__ICCloudContext_clearZoneFetchState__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;

  v2 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __37__ICCloudContext_clearZoneFetchState__block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "accountZoneIDsNeedingFetchChanges");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  objc_msgSend(*(id *)(a1 + 32), "accountZoneIDsFetchingChanges");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  return objc_msgSend(*(id *)(a1 + 32), "saveZoneFetchState");
}

+ (id)zoneInfosFromZoneIDs:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    v8 = *MEMORY[0x1E0C94730];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v9);
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "zoneName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("ZoneName"));

        objc_msgSend(v10, "ownerName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", v8);

        if ((v14 & 1) == 0)
        {
          objc_msgSend(v10, "ownerName");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v15, CFSTR("OwnerName"));

        }
        objc_msgSend(v4, "addObject:", v11);

        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }

  return v4;
}

+ (id)zoneIDsFromZoneInfos:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v14;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    v14 = (void *)*MEMORY[0x1E0C94730];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ZoneName"), v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("OwnerName"));
        v11 = (id)objc_claimAutoreleasedReturnValue();
        if (!v11)
          v11 = v14;
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95098]), "initWithZoneName:ownerName:", v10, v11);
        objc_msgSend(v4, "addObject:", v12);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  return v4;
}

- (id)subscriptionForDatabase:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a3, "databaseScope");
  CKDatabaseScopeString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("DatabaseSubscription-%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94CB8]), "initWithSubscriptionID:", v5);
  v7 = objc_alloc_init(MEMORY[0x1E0C94F50]);
  objc_msgSend(v7, "setShouldSendContentAvailable:", 1);
  objc_msgSend(v6, "setNotificationInfo:", v7);

  return v6;
}

- (void)updateSubscriptionsWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (-[ICCloudContext hasNoteContextOptions:](self, "hasNoteContextOptions:", 1))
  {
    -[ICCloudContext processingQueue](self, "processingQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __59__ICCloudContext_updateSubscriptionsWithCompletionHandler___block_invoke;
    v6[3] = &unk_1E76C8430;
    v6[4] = self;
    v7 = v4;
    dispatch_async(v5, v6);

  }
  else
  {
    -[ICCloudContext setNeedsToUpdateSubscriptions:](self, "setNeedsToUpdateSubscriptions:", 0);
    if (v4)
      (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

void __59__ICCloudContext_updateSubscriptionsWithCompletionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void (**v9)(void *, void *, _QWORD);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  _BOOL4 v20;
  void *v21;
  void (**v22)(void *, void *, _QWORD);
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id obj;
  _QWORD v28[5];
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD aBlock[5];
  id v35;
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  char v40[16];
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __59__ICCloudContext_updateSubscriptionsWithCompletionHandler___block_invoke_cold_2();

  objc_msgSend(*(id *)(a1 + 32), "setNeedsToUpdateSubscriptions:", 0);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "containersByAccountID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __59__ICCloudContext_updateSubscriptionsWithCompletionHandler___block_invoke_470;
  v38[3] = &unk_1E76CE438;
  v6 = v3;
  v39 = v6;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v38);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = v5;
  aBlock[1] = 3221225472;
  aBlock[2] = __59__ICCloudContext_updateSubscriptionsWithCompletionHandler___block_invoke_2;
  aBlock[3] = &unk_1E76CE5C0;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v8 = v6;
  v35 = v8;
  v25 = v7;
  v36 = v25;
  v37 = *(id *)(a1 + 40);
  v9 = (void (**)(void *, void *, _QWORD))_Block_copy(aBlock);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v26 = v8;
  obj = (id)objc_msgSend(v8, "copy");
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v45, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v31 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "subscriptionForDatabase:", v14, v25);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "subscribedSubscriptionIDs");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "subscriptionID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v16, "containsObject:", v17);

        v19 = os_log_create("com.apple.notes", "Cloud");
        v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG);
        if (v18)
        {
          if (v20)
          {
            objc_msgSend(v14, "databaseScope");
            CKDatabaseScopeString();
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "subscriptionID");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v42 = v23;
            v43 = 2112;
            v44 = v24;
            _os_log_debug_impl(&dword_1BD918000, v19, OS_LOG_TYPE_DEBUG, "Not fetching subscriptions for %@, already subscribed to %@", buf, 0x16u);

          }
          v9[2](v9, v14, 0);
        }
        else
        {
          if (v20)
            __59__ICCloudContext_updateSubscriptionsWithCompletionHandler___block_invoke_cold_1((uint64_t)v40, (uint64_t)v15);

          v21 = *(void **)(a1 + 32);
          v28[0] = MEMORY[0x1E0C809B0];
          v28[1] = 3221225472;
          v28[2] = __59__ICCloudContext_updateSubscriptionsWithCompletionHandler___block_invoke_472;
          v28[3] = &unk_1E76CE5E8;
          v22 = v9;
          v28[4] = v14;
          v29 = v22;
          objc_msgSend(v21, "saveSubscriptionsForDatabase:completionHandler:", v14, v28);

        }
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v45, 16);
    }
    while (v11);
  }

}

void __59__ICCloudContext_updateSubscriptionsWithCompletionHandler___block_invoke_470(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(v5, "privateCloudDatabase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v6);

  v7 = *(void **)(a1 + 32);
  objc_msgSend(v5, "sharedCloudDatabase");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addObject:", v8);
}

void __59__ICCloudContext_updateSubscriptionsWithCompletionHandler___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v5 = a2;
  v6 = a3;
  objc_msgSend(a1[4], "processingQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __59__ICCloudContext_updateSubscriptionsWithCompletionHandler___block_invoke_3;
  v12[3] = &unk_1E76CE598;
  v13 = a1[5];
  v14 = v5;
  v15 = v6;
  v8 = a1[6];
  v9 = a1[4];
  v16 = v8;
  v17 = v9;
  v18 = a1[7];
  v10 = v6;
  v11 = v5;
  dispatch_async(v7, v12);

}

void __59__ICCloudContext_updateSubscriptionsWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "removeObject:", *(_QWORD *)(a1 + 40));
  if (*(_QWORD *)(a1 + 48))
    objc_msgSend(*(id *)(a1 + 56), "addObject:");
  if (!objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    objc_msgSend((id)objc_opt_class(), "errorFromErrors:", *(_QWORD *)(a1 + 56));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 64), "setNeedsToUpdateSubscriptions:", v3 != 0);
    v2 = *(_QWORD *)(a1 + 72);
    if (v2)
      (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
    if (*(_QWORD *)(a1 + 48))
      objc_msgSend(*(id *)(a1 + 64), "startRetryTimerIfNecessaryWithError:");

  }
}

uint64_t __59__ICCloudContext_updateSubscriptionsWithCompletionHandler___block_invoke_472(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), a2);
}

- (void)fetchSubscriptionsForDatabase:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[ICCloudContext processingQueue](self, "processingQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__ICCloudContext_fetchSubscriptionsForDatabase_completionHandler___block_invoke;
  block[3] = &unk_1E76C7780;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __66__ICCloudContext_fetchSubscriptionsForDatabase_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id location;
  _QWORD v12[5];

  v12[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C94E60], "fetchAllSubscriptionsOperation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setQualityOfService:", objc_msgSend(*(id *)(a1 + 32), "qualityOfService"));
  v3 = objc_msgSend(*(id *)(a1 + 32), "discretionaryNetworkBehavior");
  objc_msgSend(v2, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDiscretionaryNetworkBehavior:", v3);

  objc_msgSend(v2, "setDatabase:", *(_QWORD *)(a1 + 40));
  objc_initWeak(&location, v2);
  v5 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v2, "ic_loggingDescription");
    objc_claimAutoreleasedReturnValue();
    __66__ICCloudContext_fetchSubscriptionsForDatabase_completionHandler___block_invoke_cold_1();
  }

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__ICCloudContext_fetchSubscriptionsForDatabase_completionHandler___block_invoke_474;
  v8[3] = &unk_1E76CE610;
  objc_copyWeak(&v10, &location);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v2, "setFetchSubscriptionCompletionBlock:", v8);
  v6 = *(void **)(a1 + 32);
  v12[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addOperations:", v7);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __66__ICCloudContext_fetchSubscriptionsForDatabase_completionHandler___block_invoke_474(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "processingQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__ICCloudContext_fetchSubscriptionsForDatabase_completionHandler___block_invoke_2;
  block[3] = &unk_1E76CDD08;
  v14 = v5;
  v15 = WeakRetained;
  v9 = *(void **)(a1 + 40);
  v16 = *(_QWORD *)(a1 + 32);
  v17 = v6;
  v18 = v9;
  v10 = v6;
  v11 = WeakRetained;
  v12 = v5;
  dispatch_async(v8, block);

}

uint64_t __66__ICCloudContext_fetchSubscriptionsForDatabase_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t result;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v19;
    v17 = v2;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v19 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v6);
        v8 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v7, "subscriptionID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "ic_loggingDescription");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v23 = v11;
          v24 = 2112;
          v25 = v12;
          _os_log_debug_impl(&dword_1BD918000, v8, OS_LOG_TYPE_DEBUG, "Fetched subscription %@ %@", buf, 0x16u);

          v2 = v17;
        }

        objc_msgSend(*(id *)(a1 + 48), "subscribedSubscriptionIDs");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "subscriptionID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v10);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v4);
  }

  v13 = *(_QWORD *)(a1 + 56);
  v14 = os_log_create("com.apple.notes", "Cloud");
  v15 = v14;
  if (v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      __66__ICCloudContext_fetchSubscriptionsForDatabase_completionHandler___block_invoke_2_cold_2();
  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    __66__ICCloudContext_fetchSubscriptionsForDatabase_completionHandler___block_invoke_2_cold_1(a1);
  }

  result = *(_QWORD *)(a1 + 64);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 56));
  return result;
}

- (void)saveSubscriptionsForDatabase:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[ICCloudContext processingQueue](self, "processingQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__ICCloudContext_saveSubscriptionsForDatabase_completionHandler___block_invoke;
  block[3] = &unk_1E76C7780;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __65__ICCloudContext_saveSubscriptionsForDatabase_completionHandler___block_invoke(uint64_t a1)
{
  id *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id location;
  void *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  v3 = a1 + 40;
  objc_msgSend(*(id *)(a1 + 32), "subscriptionForDatabase:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v2, "subscribedSubscriptionIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subscriptionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "containsObject:", v6);

  if (v7)
  {
    v8 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __65__ICCloudContext_saveSubscriptionsForDatabase_completionHandler___block_invoke_cold_1(v3, v4);

    v9 = *(_QWORD *)(a1 + 48);
    if (v9)
      (*(void (**)(uint64_t, _QWORD))(v9 + 16))(v9, 0);
  }
  else
  {
    v10 = objc_alloc(MEMORY[0x1E0C94F28]);
    v25[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithSubscriptionsToSave:subscriptionIDsToDelete:", v11, 0);

    objc_msgSend(v12, "setQualityOfService:", objc_msgSend(*(id *)(a1 + 32), "qualityOfService"));
    v13 = objc_msgSend(*(id *)(a1 + 32), "discretionaryNetworkBehavior");
    objc_msgSend(v12, "configuration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setDiscretionaryNetworkBehavior:", v13);

    objc_msgSend(v12, "setDatabase:", *(_QWORD *)(a1 + 40));
    objc_initWeak(&location, v12);
    v15 = objc_alloc_init(MEMORY[0x1E0C94F88]);
    objc_msgSend(v15, "setName:", CFSTR("SaveSubscriptions"));
    objc_msgSend(v12, "subscriptionsToSave");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setQuantity:", objc_msgSend(v16, "count"));

    objc_msgSend(v15, "setExpectedSendSize:", 1);
    objc_msgSend(v15, "setExpectedReceiveSize:", 1);
    objc_msgSend(v12, "setGroup:", v15);
    v17 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v4, "subscriptionID");
      objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "ic_loggingDescription");
      objc_claimAutoreleasedReturnValue();
      __65__ICCloudContext_saveSubscriptionsForDatabase_completionHandler___block_invoke_cold_2();
    }

    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __65__ICCloudContext_saveSubscriptionsForDatabase_completionHandler___block_invoke_478;
    v20[3] = &unk_1E76CE638;
    objc_copyWeak(&v22, &location);
    v20[4] = *(_QWORD *)(a1 + 32);
    v21 = *(id *)(a1 + 48);
    objc_msgSend(v12, "setModifySubscriptionsCompletionBlock:", v20);
    v18 = *(void **)(a1 + 32);
    v24 = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addOperations:", v19);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);

  }
}

void __65__ICCloudContext_saveSubscriptionsForDatabase_completionHandler___block_invoke_478(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id WeakRetained;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;

  v6 = a2;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "processingQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__ICCloudContext_saveSubscriptionsForDatabase_completionHandler___block_invoke_2;
  block[3] = &unk_1E76CDD08;
  v16 = v7;
  v17 = WeakRetained;
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(a1 + 40);
  v18 = v6;
  v19 = v10;
  v20 = v11;
  v12 = v6;
  v13 = WeakRetained;
  v14 = v7;
  dispatch_async(v9, block);

}

uint64_t __65__ICCloudContext_saveSubscriptionsForDatabase_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t result;
  _QWORD *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = (_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 32);
  v4 = os_log_create("com.apple.notes", "Cloud");
  v5 = v4;
  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __65__ICCloudContext_saveSubscriptionsForDatabase_completionHandler___block_invoke_2_cold_2();

  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __65__ICCloudContext_saveSubscriptionsForDatabase_completionHandler___block_invoke_2_cold_1(a1);

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v5 = *(id *)(a1 + 48);
    v6 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    if (v6)
    {
      v7 = v6;
      v17 = v3;
      v8 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v19 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          v11 = os_log_create("com.apple.notes", "Cloud");
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v10, "subscriptionID");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 40), "ic_loggingDescription");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v23 = v14;
            v24 = 2112;
            v25 = v15;
            _os_log_debug_impl(&dword_1BD918000, v11, OS_LOG_TYPE_DEBUG, "Saved subscription %@ %@", buf, 0x16u);

          }
          objc_msgSend(*(id *)(a1 + 56), "subscribedSubscriptionIDs");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "subscriptionID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v13);

        }
        v7 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      }
      while (v7);
      v3 = v17;
    }
  }

  result = *(_QWORD *)(a1 + 64);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *v3);
  return result;
}

- (void)clearSubscribedSubscriptionIDs
{
  NSObject *v3;
  _QWORD block[5];

  -[ICCloudContext processingQueue](self, "processingQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__ICCloudContext_clearSubscribedSubscriptionIDs__block_invoke;
  block[3] = &unk_1E76C73F8;
  block[4] = self;
  dispatch_async(v3, block);

}

void __48__ICCloudContext_clearSubscribedSubscriptionIDs__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  v2 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1BD918000, v2, OS_LOG_TYPE_INFO, "Clearing subscribed subscription IDs", v4, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "subscribedSubscriptionIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

}

- (BOOL)isInForeground
{
  return 1;
}

- (void)updateCloudContextState
{
  -[ICCloudContext updateCloudContextStateWithCompletion:](self, "updateCloudContextStateWithCompletion:", 0);
}

- (void)updateCloudContextStateWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;
  _QWORD *v9;
  _QWORD v10[3];
  char v11;

  v4 = a3;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v11 = 0;
  -[ICCloudContext processingQueue](self, "processingQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__ICCloudContext_updateCloudContextStateWithCompletion___block_invoke;
  block[3] = &unk_1E76CE6B0;
  block[4] = self;
  v8 = v4;
  v9 = v10;
  v6 = v4;
  dispatch_async(v5, block);

  _Block_object_dispose(v10, 8);
}

void __56__ICCloudContext_updateCloudContextStateWithCompletion___block_invoke(uint64_t a1)
{
  id *v2;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  id v7;
  __int128 v8;
  _QWORD v9[5];
  __int128 v10;
  uint8_t buf[16];

  v2 = (id *)(a1 + 32);
  if ((objc_msgSend(*(id *)(a1 + 32), "isDisabled") & 1) != 0 || objc_msgSend(*v2, "isDisabledInternal"))
  {
    v3 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BD918000, v3, OS_LOG_TYPE_INFO, "Not updating cloud context state because it's disabled", buf, 2u);
    }

    v4 = *(_QWORD *)(a1 + 40);
    if (v4)
      (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  }
  else
  {
    v5 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __56__ICCloudContext_updateCloudContextStateWithCompletion___block_invoke_cold_1();

    v6 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __56__ICCloudContext_updateCloudContextStateWithCompletion___block_invoke_487;
    v9[3] = &unk_1E76CE688;
    v9[4] = v6;
    v8 = *(_OWORD *)(a1 + 40);
    v7 = (id)v8;
    v10 = v8;
    objc_msgSend(v6, "updateAccountStatusWithCompletionHandler:", v9);

  }
}

void __56__ICCloudContext_updateCloudContextStateWithCompletion___block_invoke_487(uint64_t a1)
{
  NSObject *v2;
  id v3;
  __int128 v4;
  _QWORD block[5];
  __int128 v6;

  objc_msgSend(*(id *)(a1 + 32), "processingQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__ICCloudContext_updateCloudContextStateWithCompletion___block_invoke_2;
  block[3] = &unk_1E76CDAE8;
  block[4] = *(_QWORD *)(a1 + 32);
  v4 = *(_OWORD *)(a1 + 40);
  v3 = (id)v4;
  v6 = v4;
  dispatch_async(v2, block);

}

void __56__ICCloudContext_updateCloudContextStateWithCompletion___block_invoke_2(uint64_t a1)
{
  char v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  const char *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  __int128 *p_buf;
  _QWORD v17[5];
  __int128 buf;
  uint64_t v19;
  char v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "syncOnlyIfReachable")
    && (objc_msgSend(*(id *)(a1 + 32), "isInForeground") & 1) == 0)
  {
    v9 = os_log_create("com.apple.notes", "Cloud");
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      goto LABEL_23;
    LOWORD(buf) = 0;
    v11 = "No longer in foreground after updating cloud context state";
LABEL_22:
    _os_log_impl(&dword_1BD918000, v9, OS_LOG_TYPE_INFO, v11, (uint8_t *)&buf, 2u);
    goto LABEL_23;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "syncOnlyIfReachable")
    && (objc_msgSend(*(id *)(a1 + 32), "isInternetReachable") & 1) == 0)
  {
    v9 = os_log_create("com.apple.notes", "Cloud");
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      goto LABEL_23;
    LOWORD(buf) = 0;
    v11 = "No longer reachable after updating cloud context state";
    goto LABEL_22;
  }
  v2 = objc_msgSend(*(id *)(a1 + 32), "isReadyToSync");
  v3 = os_log_create("com.apple.notes", "Cloud");
  v4 = v3;
  if ((v2 & 1) != 0)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __56__ICCloudContext_updateCloudContextStateWithCompletion___block_invoke_2_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "enqueueLongLivedOperationsIfNeededWithCompletionHandler:", 0);
    if (objc_msgSend(*(id *)(a1 + 32), "needsToUpdateSubscriptions"))
      objc_msgSend(*(id *)(a1 + 32), "updateSubscriptionsWithCompletionHandler:", 0);
    objc_msgSend(*(id *)(a1 + 32), "containersByAccountID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __56__ICCloudContext_updateCloudContextStateWithCompletion___block_invoke_488;
    v17[3] = &unk_1E76CE438;
    v17[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v17);

    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v19 = 0x2020000000;
    v20 = 0;
    objc_msgSend(*(id *)(a1 + 32), "backgroundContext");
    v14[0] = v6;
    v14[1] = 3221225472;
    v14[2] = __56__ICCloudContext_updateCloudContextStateWithCompletion___block_invoke_491;
    v14[3] = &unk_1E76C76B0;
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v15 = v7;
    p_buf = &buf;
    objc_msgSend(v7, "performBlockAndWait:", v14);

    if (*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
    {
      objc_msgSend(*(id *)(a1 + 32), "syncWithReason:completionHandler:", CFSTR("UpdateContextState"), 0);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    }
    v8 = *(_QWORD *)(a1 + 40);
    if (v8)
      (*(void (**)(uint64_t, _QWORD))(v8 + 16))(v8, *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
    _Block_object_dispose(&buf, 8);
    return;
  }
  v9 = v3;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "readinessLoggingDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_1BD918000, v9, OS_LOG_TYPE_INFO, "Not ready to sync after updating cloud context state: %@", (uint8_t *)&buf, 0xCu);

  }
LABEL_23:

  objc_msgSend(*(id *)(a1 + 32), "processingSelectorDelayer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "cancelPreviousFireRequests");

  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
    (*(void (**)(uint64_t, _QWORD))(v13 + 16))(v13, *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
}

void __56__ICCloudContext_updateCloudContextStateWithCompletion___block_invoke_488(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__ICCloudContext_updateCloudContextStateWithCompletion___block_invoke_2_489;
  v8[3] = &unk_1E76CE660;
  v8[4] = v6;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "fetchUserRecordWithContainer:completionHandler:", a3, v8);

}

void __56__ICCloudContext_updateCloudContextStateWithCompletion___block_invoke_2_489(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;
  id v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "processingQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __56__ICCloudContext_updateCloudContextStateWithCompletion___block_invoke_3;
  v11[3] = &unk_1E76C8C70;
  v12 = v6;
  v13 = v5;
  v8 = *(void **)(a1 + 40);
  v14 = *(_QWORD *)(a1 + 32);
  v15 = v8;
  v9 = v5;
  v10 = v6;
  dispatch_async(v7, v11);

}

void __56__ICCloudContext_updateCloudContextStateWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = os_log_create("com.apple.notes", "Cloud");
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __56__ICCloudContext_updateCloudContextStateWithCompletion___block_invoke_3_cold_2();
  }
  else
  {
    v5 = v3;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __56__ICCloudContext_updateCloudContextStateWithCompletion___block_invoke_3_cold_1(a1);

  }
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 48), "cloudContextDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cloudContext:didFetchUserRecord:accountID:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));

  }
}

void __56__ICCloudContext_updateCloudContextStateWithCompletion___block_invoke_491(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  +[ICAccount allActiveCloudKitAccountsInContext:](ICAccount, "allActiveCloudKitAccountsInContext:", *(_QWORD *)(a1 + 32), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v7, "serverChangeTokens");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "count");

        if (!v9)
        {
          v10 = os_log_create("com.apple.notes", "Cloud");
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
            __56__ICCloudContext_updateCloudContextStateWithCompletion___block_invoke_491_cold_1(v7);

          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
          goto LABEL_13;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_13:

}

- (void)enqueueLongLivedOperationsIfNeededWithCompletionHandler:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  uint64_t v6;
  dispatch_group_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v12[5];
  void (**v13)(_QWORD);
  _QWORD v14[4];
  dispatch_group_t v15;
  ICCloudContext *v16;

  v4 = (void (**)(_QWORD))a3;
  if (-[ICCloudContext isEnqueueingLongLivedOperations](self, "isEnqueueingLongLivedOperations")
    || -[ICCloudContext didEnqueueLongLivedOperations](self, "didEnqueueLongLivedOperations")
    || (-[ICCloudContext setEnqueueingLongLivedOperations:](self, "setEnqueueingLongLivedOperations:", 1),
        -[ICCloudContext containersByAccountID](self, "containersByAccountID"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "count"),
        v5,
        !v6))
  {
    if (v4)
      v4[2](v4);
  }
  else
  {
    v7 = dispatch_group_create();
    -[ICCloudContext containersByAccountID](self, "containersByAccountID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __74__ICCloudContext_enqueueLongLivedOperationsIfNeededWithCompletionHandler___block_invoke;
    v14[3] = &unk_1E76CE700;
    v15 = v7;
    v16 = self;
    v10 = v7;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v14);

    -[ICCloudContext processingQueue](self, "processingQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    v12[0] = v9;
    v12[1] = 3221225472;
    v12[2] = __74__ICCloudContext_enqueueLongLivedOperationsIfNeededWithCompletionHandler___block_invoke_2_496;
    v12[3] = &unk_1E76C8430;
    v12[4] = self;
    v13 = v4;
    dispatch_group_notify(v10, v11, v12);

  }
}

void __74__ICCloudContext_enqueueLongLivedOperationsIfNeededWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;

  v4 = a3;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __74__ICCloudContext_enqueueLongLivedOperationsIfNeededWithCompletionHandler___block_invoke_2;
  v8[3] = &unk_1E76CE6D8;
  v9 = v4;
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v10 = v5;
  v11 = v6;
  v7 = v4;
  objc_msgSend(v7, "fetchAllLongLivedOperationIDsWithCompletionHandler:", v8);

}

void __74__ICCloudContext_enqueueLongLivedOperationsIfNeededWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  if (v5)
  {
    v6 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __74__ICCloudContext_enqueueLongLivedOperationsIfNeededWithCompletionHandler___block_invoke_2_cold_1();

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __74__ICCloudContext_enqueueLongLivedOperationsIfNeededWithCompletionHandler___block_invoke_494;
    v9[3] = &unk_1E76C73F8;
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(a1 + 48);
    v10 = *(id *)(a1 + 40);
    objc_msgSend(v8, "enqueueLongLivedOperationsWithIDsIfNeeded:container:completionHandler:", a2, v7, v9);

  }
}

void __74__ICCloudContext_enqueueLongLivedOperationsIfNeededWithCompletionHandler___block_invoke_494(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __74__ICCloudContext_enqueueLongLivedOperationsIfNeededWithCompletionHandler___block_invoke_2_496(uint64_t a1)
{
  void *v2;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setDidEnqueueLongLivedOperations:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setEnqueueingLongLivedOperations:", 0);
  objc_msgSend(*(id *)(a1 + 32), "operationIDsBeforeEnqueuingLongLivedOperations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)enqueueLongLivedOperationsWithIDsIfNeeded:(id)a3 container:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  id obj;
  _QWORD block[4];
  id v22;
  _QWORD v23[5];
  id v24;
  uint64_t v25;
  NSObject *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v19 = a5;
  v10 = dispatch_group_create();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v8;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v28;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v28 != v13)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v14);
        dispatch_group_enter(v10);
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __88__ICCloudContext_enqueueLongLivedOperationsWithIDsIfNeeded_container_completionHandler___block_invoke;
        v23[3] = &unk_1E76CE748;
        v23[4] = self;
        v16 = v9;
        v24 = v16;
        v25 = v15;
        v26 = v10;
        objc_msgSend(v16, "fetchLongLivedOperationWithID:completionHandler:", v15, v23);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v12);
  }

  -[ICCloudContext processingQueue](self, "processingQueue");
  v17 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__ICCloudContext_enqueueLongLivedOperationsWithIDsIfNeeded_container_completionHandler___block_invoke_499;
  block[3] = &unk_1E76C91F0;
  v22 = v19;
  v18 = v19;
  dispatch_group_notify(v10, v17, block);

}

void __88__ICCloudContext_enqueueLongLivedOperationsWithIDsIfNeeded_container_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  int isKindOfClass;
  _BOOL4 v17;
  void *v18;
  void *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(*(id *)(a1 + 32), "operationQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "operations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ic_compactMap:", &__block_literal_global_497);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v12 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __88__ICCloudContext_enqueueLongLivedOperationsWithIDsIfNeeded_container_completionHandler___block_invoke_cold_6();
LABEL_4:
    v13 = v12;
    goto LABEL_5;
  }
  if (!v5)
  {
    v12 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      __88__ICCloudContext_enqueueLongLivedOperationsWithIDsIfNeeded_container_completionHandler___block_invoke_cold_1();
    goto LABEL_4;
  }
  if (objc_msgSend(v11, "containsObject:", *(_QWORD *)(a1 + 48)))
  {
    v12 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      __88__ICCloudContext_enqueueLongLivedOperationsWithIDsIfNeeded_container_completionHandler___block_invoke_cold_2();
    goto LABEL_4;
  }
  objc_msgSend(*(id *)(a1 + 32), "operationIDsBeforeEnqueuingLongLivedOperations");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "containsObject:", *(_QWORD *)(a1 + 48));

  if (v15)
  {
    v12 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      __88__ICCloudContext_enqueueLongLivedOperationsWithIDsIfNeeded_container_completionHandler___block_invoke_cold_3();
    goto LABEL_4;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v12 = os_log_create("com.apple.notes", "Cloud");
  v17 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
  if ((isKindOfClass & 1) == 0)
  {
    if (v17)
      __88__ICCloudContext_enqueueLongLivedOperationsWithIDsIfNeeded_container_completionHandler___block_invoke_cold_5();
    goto LABEL_4;
  }
  if (v17)
    __88__ICCloudContext_enqueueLongLivedOperationsWithIDsIfNeeded_container_completionHandler___block_invoke_cold_4();

  v18 = *(void **)(a1 + 32);
  v12 = v5;
  objc_msgSend(v18, "addCallbackBlocksToModifyRecordsOperation:rootRecordIDsByShareID:", v12, 0);
  v19 = *(void **)(a1 + 32);
  v20[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addOperations:", v13);
LABEL_5:

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

id __88__ICCloudContext_enqueueLongLivedOperationsWithIDsIfNeeded_container_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  objc_opt_class();
  ICDynamicCast();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "operationID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __88__ICCloudContext_enqueueLongLivedOperationsWithIDsIfNeeded_container_completionHandler___block_invoke_499(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)incrementRetryCountForOperationType:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ICCloudContext processingQueue](self, "processingQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__ICCloudContext_incrementRetryCountForOperationType___block_invoke;
  v7[3] = &unk_1E76C73B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __54__ICCloudContext_incrementRetryCountForOperationType___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "retryCountsByOperationType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = &unk_1E771A6A8;
  if (v3)
    v5 = (void *)v3;
  v6 = v5;

  v7 = objc_msgSend(v6, "unsignedIntegerValue") + 1;
  v8 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v11 = *(_QWORD *)(a1 + 40);
    v12 = 138412802;
    v13 = v11;
    v14 = 1024;
    v15 = objc_msgSend(v6, "unsignedIntegerValue");
    v16 = 1024;
    v17 = v7;
    _os_log_debug_impl(&dword_1BD918000, v8, OS_LOG_TYPE_DEBUG, "Incrementing retry count for %@ from %d to %d", (uint8_t *)&v12, 0x18u);
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "retryCountsByOperationType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, *(_QWORD *)(a1 + 40));

}

- (void)clearRetryCountForOperationType:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  ICCloudContext *v9;

  v4 = a3;
  -[ICCloudContext processingQueue](self, "processingQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__ICCloudContext_clearRetryCountForOperationType___block_invoke;
  v7[3] = &unk_1E76C73B0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __50__ICCloudContext_clearRetryCountForOperationType___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;

  v2 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __50__ICCloudContext_clearRetryCountForOperationType___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 40), "retryCountsByOperationType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectForKey:", *(_QWORD *)(a1 + 32));

}

- (void)incrementOrClearRetryCountForOperationType:(id)a3 error:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (v6)
  {
    if ((objc_msgSend((id)objc_opt_class(), "shouldIgnoreErrorForBackoffTimer:", v6) & 1) == 0)
      -[ICCloudContext incrementRetryCountForOperationType:](self, "incrementRetryCountForOperationType:", v7);
  }
  else
  {
    -[ICCloudContext clearRetryCountForOperationType:](self, "clearRetryCountForOperationType:", v7);
  }

}

+ (id)errorCodesToIgnoreForBackoffTimer
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E771A6C0, &unk_1E771A6D8, &unk_1E771A6F0, 0);
}

+ (BOOL)shouldIgnoreErrorForBackoffTimer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  _QWORD v12[5];

  v4 = a3;
  if (objc_msgSend(v4, "code") == 2)
  {
    objc_msgSend(v4, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0C94940]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __51__ICCloudContext_shouldIgnoreErrorForBackoffTimer___block_invoke;
    v12[3] = &__block_descriptor_40_e24_B32__0__NSError_8Q16_B24l;
    v12[4] = a1;
    v8 = objc_msgSend(v7, "ic_containsObjectPassingTest:", v12);

  }
  else
  {
    objc_msgSend(a1, "errorCodesToIgnoreForBackoffTimer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "code"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "containsObject:", v10);

  }
  return v8;
}

uint64_t __51__ICCloudContext_shouldIgnoreErrorForBackoffTimer___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "shouldIgnoreErrorForBackoffTimer:", a2);
}

- (void)startRetryTimerIfNecessaryWithError:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ICCloudContext processingQueue](self, "processingQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__ICCloudContext_startRetryTimerIfNecessaryWithError___block_invoke;
  v7[3] = &unk_1E76C73B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __54__ICCloudContext_startRetryTimerIfNecessaryWithError___block_invoke(uint64_t a1)
{
  int v2;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  double v12;
  double v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD block[6];
  _QWORD v18[5];
  __int128 buf;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "syncOnlyIfReachable")
    && (objc_msgSend(*(id *)(a1 + 32), "isInternetReachable") & 1) == 0)
  {
    v7 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1BD918000, v7, OS_LOG_TYPE_INFO, "Not retrying because we have no internet connection", (uint8_t *)&buf, 2u);
    }

  }
  else if ((objc_msgSend(*(id *)(a1 + 32), "isReadyToSync") & 1) != 0)
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "disableRetryTimer");
    v3 = os_log_create("com.apple.notes", "Cloud");
    v4 = v3;
    if (v2)
    {
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1BD918000, v4, OS_LOG_TYPE_INFO, "Not starting retry timer because disableRetryTimer has been set.", (uint8_t *)&buf, 2u);
      }

    }
    else
    {
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
        __54__ICCloudContext_startRetryTimerIfNecessaryWithError___block_invoke_cold_2();

      objc_msgSend(*(id *)(a1 + 32), "timeIntervalToRetryAfterFromError:", *(_QWORD *)(a1 + 40));
      v9 = v8;
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v20 = 0x2020000000;
      v21 = 0;
      objc_msgSend(*(id *)(a1 + 32), "retryCountsByOperationType");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = MEMORY[0x1E0C809B0];
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __54__ICCloudContext_startRetryTimerIfNecessaryWithError___block_invoke_507;
      v18[3] = &unk_1E76CE790;
      v18[4] = &buf;
      objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v18);

      v12 = (double)(unint64_t)(*(_QWORD *)(*((_QWORD *)&buf + 1) + 24) + 1)
          * (double)(unint64_t)(*(_QWORD *)(*((_QWORD *)&buf + 1) + 24) + 1);
      v13 = fmin(v12 + v12, 273.0);
      if (v13 > v9)
      {
        v14 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          __54__ICCloudContext_startRetryTimerIfNecessaryWithError___block_invoke_cold_1(v14, v13, v15, v16);

        v9 = v13;
      }
      if (v9 > 0.0)
      {
        block[0] = v11;
        block[1] = 3221225472;
        block[2] = __54__ICCloudContext_startRetryTimerIfNecessaryWithError___block_invoke_509;
        block[3] = &unk_1E76CAB58;
        block[4] = *(_QWORD *)(a1 + 32);
        *(double *)&block[5] = v9;
        dispatch_async(MEMORY[0x1E0C80D38], block);
      }
      _Block_object_dispose(&buf, 8);
    }
  }
  else
  {
    v5 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "readinessLoggingDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v6;
      _os_log_impl(&dword_1BD918000, v5, OS_LOG_TYPE_INFO, "Not retrying because we're not ready: %@", (uint8_t *)&buf, 0xCu);

    }
  }
}

unint64_t __54__ICCloudContext_startRetryTimerIfNecessaryWithError___block_invoke_507(uint64_t a1, uint64_t a2, void *a3)
{
  unint64_t v4;
  unint64_t result;
  unint64_t v6;

  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  result = objc_msgSend(a3, "unsignedIntegerValue");
  if (v4 <= result)
    v6 = result;
  else
    v6 = v4;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v6;
  return result;
}

void __54__ICCloudContext_startRetryTimerIfNecessaryWithError___block_invoke_509(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  char v5;
  NSObject *v6;
  int v7;
  void *v8;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "retryTimer");
  v2 = objc_claimAutoreleasedReturnValue();
  if (!v2
    || (v3 = (void *)v2,
        objc_msgSend(*(id *)(a1 + 32), "retryTimer"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "isValid"),
        v4,
        v3,
        (v5 & 1) == 0))
  {
    v6 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = (int)*(double *)(a1 + 40);
      v9[0] = 67109120;
      v9[1] = v7;
      _os_log_impl(&dword_1BD918000, v6, OS_LOG_TYPE_INFO, "Retrying operations after %ds", (uint8_t *)v9, 8u);
    }

    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", *(_QWORD *)(a1 + 32), sel_retryOperationsIfNecessary, 0, 0, *(double *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setRetryTimer:", v8);

  }
}

- (void)retryOperationsIfNecessary
{
  uint64_t v3;
  NSObject *v4;
  _QWORD v5[5];
  _QWORD block[5];

  v3 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__ICCloudContext_retryOperationsIfNecessary__block_invoke;
  block[3] = &unk_1E76C73F8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  -[ICCloudContext processingQueue](self, "processingQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __44__ICCloudContext_retryOperationsIfNecessary__block_invoke_2;
  v5[3] = &unk_1E76C73F8;
  v5[4] = self;
  dispatch_async(v4, v5);

}

uint64_t __44__ICCloudContext_retryOperationsIfNecessary__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "retryTimer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

  return objc_msgSend(*(id *)(a1 + 32), "setRetryTimer:", 0);
}

void __44__ICCloudContext_retryOperationsIfNecessary__block_invoke_2(uint64_t a1)
{
  id *v1;
  char v2;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  _QWORD v20[5];
  _QWORD v21[4];
  id v22;
  uint8_t v23[16];
  id buf[2];

  v1 = (id *)(a1 + 32);
  if (objc_msgSend(*(id *)(a1 + 32), "syncOnlyIfReachable")
    && (objc_msgSend(*v1, "isInternetReachable") & 1) == 0)
  {
    v16 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      __44__ICCloudContext_retryOperationsIfNecessary__block_invoke_2_cold_2();

  }
  else
  {
    v2 = objc_msgSend(*v1, "isReadyToSync");
    v3 = os_log_create("com.apple.notes", "Cloud");
    v4 = v3;
    if ((v2 & 1) != 0)
    {
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_1BD918000, v4, OS_LOG_TYPE_INFO, "Retrying operations", (uint8_t *)buf, 2u);
      }

      objc_initWeak(buf, *v1);
      if (objc_msgSend(*v1, "needsToUpdateSubscriptions"))
      {
        v5 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v23 = 0;
          _os_log_impl(&dword_1BD918000, v5, OS_LOG_TYPE_INFO, "Retrying to update subscriptions", v23, 2u);
        }

        v6 = *v1;
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __44__ICCloudContext_retryOperationsIfNecessary__block_invoke_513;
        v21[3] = &unk_1E76CE7B8;
        objc_copyWeak(&v22, buf);
        objc_msgSend(v6, "updateSubscriptionsWithCompletionHandler:", v21);
        objc_destroyWeak(&v22);
      }
      v7 = (void *)objc_opt_class();
      objc_msgSend(*v1, "accountZoneIDsNeedingToBeSaved");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v7) = objc_msgSend(v7, "haveZoneIDsInAccountZoneIDs:", v8);

      if ((_DWORD)v7)
      {
        v9 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v23 = 0;
          _os_log_impl(&dword_1BD918000, v9, OS_LOG_TYPE_INFO, "Retrying to save record zones", v23, 2u);
        }

        objc_msgSend(*v1, "containersByAccountID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __44__ICCloudContext_retryOperationsIfNecessary__block_invoke_516;
        v20[3] = &unk_1E76CE438;
        v20[4] = *v1;
        objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v20);

      }
      v11 = (void *)objc_opt_class();
      objc_msgSend(*v1, "accountZoneIDsNeedingFetchChanges");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v11) = objc_msgSend(v11, "haveZoneIDsInAccountZoneIDs:", v12);

      if ((_DWORD)v11)
      {
        v13 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v23 = 0;
          _os_log_impl(&dword_1BD918000, v13, OS_LOG_TYPE_INFO, "Retrying to fetch record zone changes", v23, 2u);
        }

        objc_msgSend(*v1, "fetchRecordZoneChangesWithReason:completionHandler:", CFSTR("RetryOperations"), 0);
      }
      objc_msgSend(*v1, "objectIDsToProcess");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "count"))
      {

      }
      else
      {
        objc_msgSend(*v1, "objectIDsToRetry");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "count");

        if (!v18)
        {
LABEL_30:
          objc_destroyWeak(buf);
          return;
        }
      }
      v19 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v23 = 0;
        _os_log_impl(&dword_1BD918000, v19, OS_LOG_TYPE_INFO, "Retrying to process changes", v23, 2u);
      }

      objc_msgSend(*v1, "processPendingCloudObjects");
      goto LABEL_30;
    }
    v15 = v3;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      __44__ICCloudContext_retryOperationsIfNecessary__block_invoke_2_cold_1((uint64_t)v1);

  }
}

void __44__ICCloudContext_retryOperationsIfNecessary__block_invoke_513(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "incrementOrClearRetryCountForOperationType:error:", CFSTR("Subscriptions"), v3);

}

void __44__ICCloudContext_retryOperationsIfNecessary__block_invoke_516(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "operationToSaveZonesIfNecessaryForAccountID:", a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    v5 = *(void **)(a1 + 32);
    v7[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addOperations:", v6);

  }
}

- (void)saveServerChangeToken:(id)a3 forRecordZoneID:(id)a4 databaseScope:(int64_t)a5 accountID:(id)a6 context:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  int64_t v30;
  uint8_t buf[4];
  const __CFString *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = a7;
  v15 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v12, "ic_loggingDescription");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v20;
    if (v20)
      v22 = (const __CFString *)v20;
    else
      v22 = CFSTR("zone changes");
    CKDatabaseScopeString();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "ic_loggingDescription");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v32 = v22;
    v33 = 2112;
    v34 = v23;
    v35 = 2112;
    v36 = v24;
    _os_log_debug_impl(&dword_1BD918000, v15, OS_LOG_TYPE_DEBUG, "Saving server change token for %@ %@: %@", buf, 0x20u);

  }
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __88__ICCloudContext_saveServerChangeToken_forRecordZoneID_databaseScope_accountID_context___block_invoke;
  v25[3] = &unk_1E76CE7E0;
  v26 = v13;
  v27 = v14;
  v29 = v11;
  v30 = a5;
  v28 = v12;
  v16 = v11;
  v17 = v12;
  v18 = v14;
  v19 = v13;
  objc_msgSend(v18, "performBlockAndWait:", v25);

}

void __88__ICCloudContext_saveServerChangeToken_forRecordZoneID_databaseScope_accountID_context___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  id v5;

  +[ICAccount accountWithIdentifier:context:](ICAccount, "accountWithIdentifier:context:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    +[ICServerChangeToken serverChangeTokenForAccount:zoneID:databaseScope:context:](ICServerChangeToken, "serverChangeTokenForAccount:zoneID:databaseScope:context:", v2, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
      -[NSObject setCkServerChangeToken:](v3, "setCkServerChangeToken:", *(_QWORD *)(a1 + 56));
    else
      v5 = +[ICServerChangeToken addServerChangeTokenForAccount:ckServerChangeToken:zoneID:databaseScope:context:](ICServerChangeToken, "addServerChangeTokenForAccount:ckServerChangeToken:zoneID:databaseScope:context:", v2, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40));
  }
  else
  {
    v4 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __88__ICCloudContext_saveServerChangeToken_forRecordZoneID_databaseScope_accountID_context___block_invoke_cold_1();
  }

  objc_msgSend(*(id *)(a1 + 40), "ic_saveWithLogDescription:", CFSTR("saving server change token"));
}

- (id)serverChangeTokenForRecordZoneID:(id)a3 databaseScope:(int64_t)a4 accountID:(id)a5 context:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  uint64_t *v21;
  int64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__46;
  v27 = __Block_byref_object_dispose__46;
  v28 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __83__ICCloudContext_serverChangeTokenForRecordZoneID_databaseScope_accountID_context___block_invoke;
  v17[3] = &unk_1E76CE808;
  v12 = v10;
  v18 = v12;
  v13 = v11;
  v19 = v13;
  v14 = v9;
  v21 = &v23;
  v22 = a4;
  v20 = v14;
  objc_msgSend(v13, "performBlockAndWait:", v17);
  v15 = (id)v24[5];

  _Block_object_dispose(&v23, 8);
  return v15;
}

void __83__ICCloudContext_serverChangeTokenForRecordZoneID_databaseScope_accountID_context___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;

  +[ICAccount accountWithIdentifier:context:](ICAccount, "accountWithIdentifier:context:", a1[4], a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    +[ICServerChangeToken serverChangeTokenForAccount:zoneID:databaseScope:context:](ICServerChangeToken, "serverChangeTokenForAccount:zoneID:databaseScope:context:", v2, a1[6], a1[8], a1[5]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "ckServerChangeToken");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1[7] + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
  else
  {
    v7 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __83__ICCloudContext_serverChangeTokenForRecordZoneID_databaseScope_accountID_context___block_invoke_cold_1();

  }
}

- (void)deleteServerChangeTokenForRecordZoneID:(id)a3 databaseScope:(int64_t)a4 accountID:(id)a5 context:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  int64_t v20;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  v12 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[ICCloudContext deleteServerChangeTokenForRecordZoneID:databaseScope:accountID:context:].cold.1();

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __89__ICCloudContext_deleteServerChangeTokenForRecordZoneID_databaseScope_accountID_context___block_invoke;
  v16[3] = &unk_1E76CE830;
  v17 = v10;
  v18 = v11;
  v19 = v9;
  v20 = a4;
  v13 = v9;
  v14 = v11;
  v15 = v10;
  objc_msgSend(v14, "performBlockAndWait:", v16);

}

void __89__ICCloudContext_deleteServerChangeTokenForRecordZoneID_databaseScope_accountID_context___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;

  +[ICAccount accountWithIdentifier:context:](ICAccount, "accountWithIdentifier:context:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    +[ICServerChangeToken serverChangeTokenForAccount:zoneID:databaseScope:context:](ICServerChangeToken, "serverChangeTokenForAccount:zoneID:databaseScope:context:", v2, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 40), "deleteObject:", v3);
      objc_msgSend(v2, "removeServerChangeTokensObject:", v3);
      objc_msgSend(*(id *)(a1 + 40), "ic_saveWithLogDescription:", CFSTR("deleting server change token"));
    }

  }
  else
  {
    v4 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __83__ICCloudContext_serverChangeTokenForRecordZoneID_databaseScope_accountID_context___block_invoke_cold_1();

  }
}

- (void)deleteAllServerChangeTokens
{
  NSObject *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint8_t buf[16];

  v3 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BD918000, v3, OS_LOG_TYPE_INFO, "Deleting all server change tokens", buf, 2u);
  }

  -[ICCloudContext backgroundContext](self, "backgroundContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__ICCloudContext_deleteAllServerChangeTokens__block_invoke;
  v6[3] = &unk_1E76C73F8;
  v7 = v4;
  v5 = v4;
  objc_msgSend(v5, "performBlockAndWait:", v6);

}

uint64_t __45__ICCloudContext_deleteAllServerChangeTokens__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  uint64_t v13;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  +[ICAccount allActiveCloudKitAccountsInContext:](ICAccount, "allActiveCloudKitAccountsInContext:", *(_QWORD *)(a1 + 32));
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v21 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        objc_msgSend(v6, "serverChangeTokens");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = (void *)objc_msgSend(v7, "copy");

        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v17;
          do
          {
            for (j = 0; j != v10; ++j)
            {
              if (*(_QWORD *)v17 != v11)
                objc_enumerationMutation(v8);
              v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * j);
              objc_msgSend(*(id *)(a1 + 32), "deleteObject:", v13);
              objc_msgSend(v6, "removeServerChangeTokensObject:", v13);
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
          }
          while (v10);
        }

      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v3);
  }

  return objc_msgSend(*(id *)(a1 + 32), "ic_saveWithLogDescription:", CFSTR("deleting all server change tokens"));
}

- (void)saveServerChangeToken:(id)a3 forChangedZonesInDatabase:(id)a4 accountID:(id)a5 context:(id)a6
{
  id v10;
  id v11;
  id v12;

  v10 = a6;
  v11 = a5;
  v12 = a3;
  -[ICCloudContext saveServerChangeToken:forRecordZoneID:databaseScope:accountID:context:](self, "saveServerChangeToken:forRecordZoneID:databaseScope:accountID:context:", v12, 0, objc_msgSend(a4, "databaseScope"), v11, v10);

}

- (void)deleteServerChangeTokenForChangedZonesInDatabase:(id)a3 accountID:(id)a4 context:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  v9 = a4;
  -[ICCloudContext deleteServerChangeTokenForRecordZoneID:databaseScope:accountID:context:](self, "deleteServerChangeTokenForRecordZoneID:databaseScope:accountID:context:", 0, objc_msgSend(a3, "databaseScope"), v9, v8);

}

- (id)serverChangeTokenForChangedZonesInDatabase:(id)a3 accountID:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a5;
  v9 = a4;
  -[ICCloudContext serverChangeTokenForRecordZoneID:databaseScope:accountID:context:](self, "serverChangeTokenForRecordZoneID:databaseScope:accountID:context:", 0, objc_msgSend(a3, "databaseScope"), v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  char v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  _QWORD v21[5];
  _QWORD block[5];
  objc_super v23;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  if ((-[ICCloudContext ic_didAddObserverForContext:inScope:](self, "ic_didAddObserverForContext:inScope:", a6, "/Library/Caches/com.apple.xbs/Sources/MobileNotesSupport/Ironcade/Shared/CloudKit/ICCloudContext.m") & 1) != 0)
  {
    v13 = -[ICCloudContext ic_shouldIgnoreObserveValue:ofObject:forKeyPath:](self, "ic_shouldIgnoreObserveValue:ofObject:forKeyPath:", v10, v11, v12);

    if (a6 == compoundliteral_1 && (v13 & 1) == 0)
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CC8]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "unsignedIntegerValue");

      objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "unsignedIntegerValue");

      v18 = MEMORY[0x1E0C809B0];
      if (!v15 && v17 || v15 && !v17)
      {
        dispatch_get_global_queue(0, 0);
        v19 = objc_claimAutoreleasedReturnValue();
        block[0] = v18;
        block[1] = 3221225472;
        block[2] = __65__ICCloudContext_observeValueForKeyPath_ofObject_change_context___block_invoke;
        block[3] = &unk_1E76C73F8;
        block[4] = self;
        dispatch_async(v19, block);

      }
      -[ICCloudContext processingQueue](self, "processingQueue");
      v20 = objc_claimAutoreleasedReturnValue();
      v21[0] = v18;
      v21[1] = 3221225472;
      v21[2] = __65__ICCloudContext_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
      v21[3] = &unk_1E76C73F8;
      v21[4] = self;
      dispatch_async(v20, v21);

    }
  }
  else
  {
    v23.receiver = self;
    v23.super_class = (Class)ICCloudContext;
    -[ICCloudContext observeValueForKeyPath:ofObject:change:context:](&v23, sel_observeValueForKeyPath_ofObject_change_context_, v12, v11, v10, a6);

  }
}

void __65__ICCloudContext_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("ICCloudContextHasPendingOperationsDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

uint64_t __65__ICCloudContext_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "printOperationQueue");
}

- (ICCloudContextDelegate)cloudContextDelegate
{
  return (ICCloudContextDelegate *)objc_loadWeakRetained((id *)&self->_cloudContextDelegate);
}

- (ICCloudAnalyticsDelegate)cloudAnalyticsDelegate
{
  return (ICCloudAnalyticsDelegate *)objc_loadWeakRetained((id *)&self->_cloudAnalyticsDelegate);
}

- (BOOL)fetchOperationsPending
{
  return self->_fetchOperationsPending;
}

- (BOOL)needsToUpdateSubscriptions
{
  return self->_needsToUpdateSubscriptions;
}

- (BOOL)shouldResumeSyncOnForeground
{
  return self->_shouldResumeSyncOnForeground;
}

- (void)setShouldResumeSyncOnForeground:(BOOL)a3
{
  self->_shouldResumeSyncOnForeground = a3;
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (unint64_t)discretionaryNetworkBehavior
{
  return self->_discretionaryNetworkBehavior;
}

- (BOOL)enableLongLivedOperations
{
  return self->_enableLongLivedOperations;
}

- (BOOL)disableAutomaticallyRetryNetworkFailures
{
  return self->_disableAutomaticallyRetryNetworkFailures;
}

- (BOOL)disableRetryTimer
{
  return self->_disableRetryTimer;
}

- (void)setDisableRetryTimer:(BOOL)a3
{
  self->_disableRetryTimer = a3;
}

- (BOOL)syncOnlyIfReachable
{
  return self->_syncOnlyIfReachable;
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (OS_dispatch_queue)processingQueue
{
  return self->_processingQueue;
}

- (OS_dispatch_queue)containersCreationQueue
{
  return self->_containersCreationQueue;
}

- (NSMutableSet)objectIDsToRetry
{
  return self->_objectIDsToRetry;
}

- (NSTimer)retryTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 88, 1);
}

- (void)setRetryTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSMutableDictionary)retryCountsByOperationType
{
  return self->_retryCountsByOperationType;
}

- (BOOL)isDisabledInternal
{
  return self->_disabledInternal;
}

- (BOOL)needsToProcessAllObjects
{
  return self->_needsToProcessAllObjects;
}

- (void)setNeedsToProcessAllObjects:(BOOL)a3
{
  self->_needsToProcessAllObjects = a3;
}

- (NSMutableSet)objectIDsToProcess
{
  return self->_objectIDsToProcess;
}

- (BOOL)didAddObservers
{
  return self->_didAddObservers;
}

- (BOOL)isFetchingEnabled
{
  return self->_fetchingEnabled;
}

- (void)setContainersByAccountID:(id)a3
{
  objc_storeStrong((id *)&self->_containersByAccountID, a3);
}

- (NSMutableDictionary)accountZoneIDsFetchingChanges
{
  return self->_accountZoneIDsFetchingChanges;
}

- (NSMutableDictionary)accountZoneIDsNeedingToBeSaved
{
  return self->_accountZoneIDsNeedingToBeSaved;
}

- (NSMutableSet)subscribedSubscriptionIDs
{
  return (NSMutableSet *)objc_getProperty(self, a2, 152, 1);
}

- (BOOL)didEnqueueLongLivedOperations
{
  return self->_didEnqueueLongLivedOperations;
}

- (BOOL)isEnqueueingLongLivedOperations
{
  return self->_enqueueingLongLivedOperations;
}

- (void)setEnqueueingLongLivedOperations:(BOOL)a3
{
  self->_enqueueingLongLivedOperations = a3;
}

- (NSMutableSet)operationIDsBeforeEnqueuingLongLivedOperations
{
  return self->_operationIDsBeforeEnqueuingLongLivedOperations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationIDsBeforeEnqueuingLongLivedOperations, 0);
  objc_storeStrong((id *)&self->_subscribedSubscriptionIDs, 0);
  objc_storeStrong((id *)&self->_accountZoneIDsNeedingToBeSaved, 0);
  objc_storeStrong((id *)&self->_accountZoneIDsFetchingChanges, 0);
  objc_storeStrong((id *)&self->_accountZoneIDsNeedingFetchChanges, 0);
  objc_storeStrong((id *)&self->_containersByAccountID, 0);
  objc_storeStrong((id *)&self->_processingSelectorDelayer, 0);
  objc_storeStrong((id *)&self->_objectIDsToProcess, 0);
  objc_storeStrong((id *)&self->_retryCountsByOperationType, 0);
  objc_storeStrong((id *)&self->_retryTimer, 0);
  objc_storeStrong((id *)&self->_objectIDsToRetry, 0);
  objc_storeStrong((id *)&self->_containersCreationQueue, 0);
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_destroyWeak((id *)&self->_cloudAnalyticsDelegate);
  objc_destroyWeak((id *)&self->_cloudContextDelegate);
}

- (void)initWithDelegate:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(&dword_1BD918000, v0, OS_LOG_TYPE_FAULT, "Cannot reset zone of primary iCloud account because there is no iCloud account enabled", v1, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)disableCloudSyncingIfCurrentVersionNotSupported:.cold.1()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_6_0();
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "operatingSystemVersionString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1(&dword_1BD918000, v2, v3, "Current version of the OS (%@) is not supported for sync. Needs at least (%@)", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)disableCloudSyncingIfCurrentVersionNotSupported:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1BD918000, v0, v1, "OS version sent from server is in the incorrect format. Should be majorVersion,minorVersion,patchVersion", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)reachabilityChanged:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, v0, v1, "Cloud context found an internet connection.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)reachabilityChanged:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, v0, v1, "Cloud context lost an internet connection.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __41__ICCloudContext_cloudKitAccountChanged___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, v0, v1, "CloudKit account status may have changed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)syncWithReason:uploadUnsyncedChanges:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, v0, v1, "Trying to sync with no CloudKit account", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_syncWithReason:uploadUnsyncedChanges:completionHandler:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_9(&dword_1BD918000, v0, (uint64_t)v0, "Starting sync with reason: %@ (uploadUnsyncedChanges=%@)", v1);
  OUTLINED_FUNCTION_1_0();
}

void __74__ICCloudContext__syncWithReason_uploadUnsyncedChanges_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, v0, v1, "Fetched database changes for full sync", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __74__ICCloudContext__syncWithReason_uploadUnsyncedChanges_completionHandler___block_invoke_130_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, v0, v1, "Fetched record zone changes for sync", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __74__ICCloudContext__syncWithReason_uploadUnsyncedChanges_completionHandler___block_invoke_131_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, v0, v1, "Processed everything for full sync", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)syncCompletedWithErrors:(void *)a1 .cold.1(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_38_0(a1, a2);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Sync completed with error count: %lu", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_4_0();
}

void __56__ICCloudContext_cancelEverythingWithCompletionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_2(&dword_1BD918000, v0, v1, "Cancelling all operations: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

void __56__ICCloudContext_cancelEverythingWithCompletionHandler___block_invoke_4_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, v0, v1, "Timed out when cancelling the cloud operations. Performing cleanup anyway.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __38__ICCloudContext_clearPendingActivity__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, v0, v1, "Cleared the list of objectIDsToRetry", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __38__ICCloudContext_clearPendingActivity__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, v0, v1, "Cleared the list of objectIDsToProcess", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)deleteRecordZonesWithZoneIDs:accountID:markZonesAsUserPurged:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1BD918000, v0, v1, "Trying to deleteRecordZonesWithZoneIDs with empty accountID.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __97__ICCloudContext_deleteRecordZonesWithZoneIDs_accountID_markZonesAsUserPurged_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];

  OUTLINED_FUNCTION_42(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_9(&dword_1BD918000, v0, (uint64_t)v0, "Deleted record zones in account ID %@: %@", v1);
  OUTLINED_FUNCTION_1_0();
}

void __97__ICCloudContext_deleteRecordZonesWithZoneIDs_accountID_markZonesAsUserPurged_completionHandler___block_invoke_cold_2()
{
  NSObject *v0;
  uint8_t v1[24];

  OUTLINED_FUNCTION_42(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_10(&dword_1BD918000, v0, (uint64_t)v0, "Error deleting zones in account ID %@: %@", v1);
  OUTLINED_FUNCTION_1_0();
}

void __97__ICCloudContext_deleteRecordZonesWithZoneIDs_accountID_markZonesAsUserPurged_completionHandler___block_invoke_142_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, v0, v1, "Deleting record zones", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __81__ICCloudContext_finishOperationsForRecordID_qualityOfService_completionHandler___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_48(a1), "ic_loggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Finishing operations for record ID %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __81__ICCloudContext_finishOperationsForRecordID_qualityOfService_completionHandler___block_invoke_158_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_48(a1), "ic_loggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "All operations finished for record ID %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __71__ICCloudContext_ingestCloudKitRecord_forAccountID_forceMerge_context___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 40), "ic_loggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_2_2(&dword_1BD918000, v2, v3, "Ingesting record (forced=%@) for account ID %@: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_7();
}

void __72__ICCloudContext__ingestCloudKitRecord_forAccountID_forceMerge_context___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 48), "ic_loggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_1(&dword_1BD918000, v2, v3, "No CloudKit accounts available for ingesting record (account ID %@) %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2();
}

void __59__ICCloudContext_updateAccountStatusWithCompletionHandler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_2(&dword_1BD918000, v0, v1, "Updating CloudKit account status for account: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

void __59__ICCloudContext_updateAccountStatusWithCompletionHandler___block_invoke_2_166_cold_1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_18(v0);
  CKStringFromAccountStatus();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_5_1(&dword_1BD918000, v2, v3, "No change in CloudKit status %@ for account: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

void __59__ICCloudContext_updateAccountStatusWithCompletionHandler___block_invoke_2_166_cold_2(uint64_t a1, uint64_t *a2, NSObject *a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *a2;
  v5 = 138412546;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  OUTLINED_FUNCTION_10(&dword_1BD918000, a3, (uint64_t)a3, "Error updating account status for account: %@, %@", (uint8_t *)&v5);
  OUTLINED_FUNCTION_1_0();
}

- (void)fetchUserRecordWithAccountID:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1BD918000, v0, v1, "Trying to fetchUserRecordWithAccountID with empty accountID.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)fetchUserRecordWithContainer:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_2(&dword_1BD918000, v0, v1, "Fetching user record in cloud context: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

void __65__ICCloudContext_fetchUserRecordWithContainer_completionHandler___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_36(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_7();
  OUTLINED_FUNCTION_1_2(&dword_1BD918000, v0, v1, "Fetched user record in cloud context: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

void __65__ICCloudContext_fetchUserRecordWithContainer_completionHandler___block_invoke_169_cold_2(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = OUTLINED_FUNCTION_47(a1);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Fetch user record operation completed: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __45__ICCloudContext_userRecordNameForContainer___block_invoke_cold_1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_17();
  objc_msgSend(v0, "ic_loggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1(&dword_1BD918000, v2, v3, "Error fetching user record ID: %@, error: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)existingCloudObjectForUserSpecificRecordID:createPlaceholderIfNecessary:accountID:context:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_7_2();
  objc_msgSend((id)OUTLINED_FUNCTION_8(v0, v1), "ic_loggingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_1(&dword_1BD918000, v3, v4, "Cannot parse user-specific record in account ID %@: %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)existingCloudObjectForUserSpecificRecordID:createPlaceholderIfNecessary:accountID:context:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_7_2();
  objc_msgSend((id)OUTLINED_FUNCTION_8(v0, v1), "ic_loggingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_5_1(&dword_1BD918000, v3, v4, "Creating placeholder object from user-specific record in account ID %@: %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)existingCloudObjectForUserSpecificRecordID:createPlaceholderIfNecessary:accountID:context:.cold.3()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_7_2();
  objc_msgSend((id)OUTLINED_FUNCTION_8(v0, v1), "ic_loggingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_1(&dword_1BD918000, v3, v4, "User-specific record synced for class that doesn't support user-specific records in account ID %@: %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)addFetchOperationsForRecordIDs:(void *)a1 accountID:(const char *)a2 qualityOfService:operationGroupName:completionHandler:.cold.1(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_38_0(a1, a2);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Adding operations to fetch %ld records", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_4_0();
}

- (void)operationsToFetchRecordIDs:qualityOfService:operationGroupName:accountID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1BD918000, v0, v1, "Account ID is required to create fetch record operations.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)operationsToFetchRecordIDs:qualityOfService:operationGroupName:accountID:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_45(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_1_2(&dword_1BD918000, v3, (uint64_t)v3, "Fetching records with operation group %@", v4);

  OUTLINED_FUNCTION_1_6();
}

- (void)operationToFetchRecordIDs:database:qualityOfService:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_45(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_1_2(&dword_1BD918000, v3, (uint64_t)v3, "Creating %@", v4);

  OUTLINED_FUNCTION_1_6();
}

void __72__ICCloudContext_fetchOperation_didCompleteWithRecordsByRecordID_error___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_25_0(a1), "ic_loggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Finished %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __72__ICCloudContext_fetchOperation_didCompleteWithRecordsByRecordID_error___block_invoke_cold_2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_17();
  objc_msgSend((id)OUTLINED_FUNCTION_25_0(v1), "ic_loggingDescription");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_1(&dword_1BD918000, v2, v3, "Error fetching %@: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)didFetchShare:(void *)a1 accountID:(void *)a2 context:(NSObject *)a3 .cold.1(void *a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "recordID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ic_loggingDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "recordType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "recordID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ic_loggingDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 138412802;
  v11 = v6;
  v12 = 2112;
  v13 = v7;
  OUTLINED_FUNCTION_21();
  _os_log_debug_impl(&dword_1BD918000, a3, OS_LOG_TYPE_DEBUG, "Received share %@ for %@ %@", (uint8_t *)&v10, 0x20u);

  OUTLINED_FUNCTION_1_1();
}

- (void)didFetchShare:accountID:context:.cold.2()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_17();
  objc_msgSend(v1, "ic_loggingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "ic_loggingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_5_1(&dword_1BD918000, v4, v5, "No root record type in share %@ for %@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_2();
}

void __72__ICCloudContext_pushCloudObjects_operationGroupName_completionHandler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_42(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_7();
  OUTLINED_FUNCTION_0_1(&dword_1BD918000, v0, v1, "Error pushing cloud objects for account ID %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __59__ICCloudContext_deleteSharesForObjects_completionHandler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_42(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_7();
  OUTLINED_FUNCTION_0_1(&dword_1BD918000, v0, v1, "Error deleting shares for objects in account ID %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)deleteSharesForObjects:accountID:completionHandler:.cold.1()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_7_2();
  objc_msgSend(v0, "count");
  OUTLINED_FUNCTION_5_1(&dword_1BD918000, v1, v2, "Will delete shares in account ID %@ for %lu objects", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_4_0();
}

void __69__ICCloudContext_deleteSharesForObjects_accountID_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(a2, "shortLoggingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_5_1(&dword_1BD918000, v3, v4, "Will delete share in account ID %@ for %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)operationsToModifyRecordsForCloudObjectsToSave:delete:deleteShares:saveUserSpecificRecords:operationGroupName:addDependencies:accountID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1BD918000, v0, v1, "Account ID is required to create operations.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)operationsToModifyRecordsForCloudObjectsToSave:(uint64_t)a3 delete:deleteShares:saveUserSpecificRecords:operationGroupName:addDependencies:accountID:.cold.2(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_26_0((uint64_t)a1, a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_9(&dword_1BD918000, v6, v4, "Modifying records with operation group %@ for account ID %@", v5);

  OUTLINED_FUNCTION_1_6();
}

- (void)operationsToModifyRecordsForCloudObjectsToSave:(uint64_t)a3 delete:(NSObject *)a4 deleteShares:saveUserSpecificRecords:operationGroupName:addDependencies:accountID:.cold.3(uint64_t a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a2 = 134218242;
  *(_QWORD *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 12) = 2112;
  *(_QWORD *)(a2 + 14) = a1;
  OUTLINED_FUNCTION_9(&dword_1BD918000, a4, a3, "Grouping modify operations into %ld batches for account ID %@", (uint8_t *)a2);
}

- (void)operationsToModifyRecordsForCloudObjectsToSave:delete:deleteShares:saveUserSpecificRecords:operationGroupName:addDependencies:accountID:.cold.4()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_17();
  objc_msgSend(v0, "count");
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_5_1(&dword_1BD918000, v1, v2, "Creating operations to delete %ld share records for account ID %@", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_4_0();
}

- (void)operationsToModifyRecordsForCloudObjectsToSave:delete:deleteShares:saveUserSpecificRecords:operationGroupName:addDependencies:accountID:.cold.5()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_17();
  objc_msgSend(v0, "count");
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_5_1(&dword_1BD918000, v1, v2, "Creating operations to delete %ld records for account ID %@", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_4_0();
}

- (void)operationsToModifyRecordsForCloudObjectsToSave:delete:deleteShares:saveUserSpecificRecords:operationGroupName:addDependencies:accountID:.cold.6()
{
  void *v0;
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_38_0(v0, v1);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_5_1(&dword_1BD918000, v2, v3, "Creating operations to push %ld records for account ID %@", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_4_0();
}

+ (void)batchRecordsToSave:(NSObject *)a3 delete:maxRecordCountPerBatch:maxRecordSizePerBatch:withBlock:.cold.1(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_1_7(&dword_1BD918000, a3, (uint64_t)a3, "Ending batch because we've reached maxRecordCountPerBatch", a1);
}

+ (void)batchRecordsToSave:(NSObject *)a3 delete:maxRecordCountPerBatch:maxRecordSizePerBatch:withBlock:.cold.2(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_1_7(&dword_1BD918000, a3, (uint64_t)a3, "Ending batch because we're out of records", a1);
}

+ (void)batchRecordsToSave:(uint64_t)a1 delete:(uint64_t)a2 maxRecordCountPerBatch:maxRecordSizePerBatch:withBlock:.cold.3(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  uint8_t *v3;
  void *v4;

  objc_msgSend((id)OUTLINED_FUNCTION_18_1(a1, a2), "recordID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_34_0((uint64_t)v4, 5.7779e-34);
  OUTLINED_FUNCTION_9_3(&dword_1BD918000, v2, OS_LOG_TYPE_DEBUG, "Adding record to save batch: %@", v3);

  OUTLINED_FUNCTION_16();
}

+ (void)batchRecordsToSave:(uint64_t)a1 delete:(uint64_t)a2 maxRecordCountPerBatch:maxRecordSizePerBatch:withBlock:.cold.4(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  uint8_t *v3;
  void *v4;

  objc_msgSend((id)OUTLINED_FUNCTION_18_1(a1, a2), "recordID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_34_0((uint64_t)v4, 5.7779e-34);
  OUTLINED_FUNCTION_28(&dword_1BD918000, v2, OS_LOG_TYPE_ERROR, "Ending batch because an impossible batch was detected ICCloudContext: %@", v3);

  OUTLINED_FUNCTION_16();
}

+ (void)batchRecordsToSave:(uint64_t)a1 delete:(uint64_t)a2 maxRecordCountPerBatch:maxRecordSizePerBatch:withBlock:.cold.5(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  uint8_t *v3;
  void *v4;

  objc_msgSend((id)OUTLINED_FUNCTION_18_1(a1, a2), "recordID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_34_0((uint64_t)v4, 5.7779e-34);
  OUTLINED_FUNCTION_9_3(&dword_1BD918000, v2, OS_LOG_TYPE_DEBUG, "Ending batch because record does not fit: %@", v3);

  OUTLINED_FUNCTION_16();
}

- (void)operationToModifyRecordsToSave:(void *)a1 delete:rootRecordIDsByShareID:database:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "ic_loggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Creating modify operation %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

- (void)operationToModifyRecordsToSave:delete:rootRecordIDsByShareID:database:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_2(&dword_1BD918000, v0, v1, "About to create modify operation for database: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

void __83__ICCloudContext_addCallbackBlocksToModifyRecordsOperation_rootRecordIDsByShareID___block_invoke_3_cold_1(void *a1, int a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  uint8_t v7[12];
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "ic_loggingDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  v8 = 1024;
  v9 = a2;
  OUTLINED_FUNCTION_40_0(&dword_1BD918000, a3, v6, "Progress pushing %@: %d%%", v7);

  OUTLINED_FUNCTION_2();
}

void __62__ICCloudContext_modifyRecordsOperation_didCompleteWithError___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_18(a1), "ic_loggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Finished modify operation %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __62__ICCloudContext_modifyRecordsOperation_didCompleteWithError___block_invoke_cold_2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_17();
  objc_msgSend((id)OUTLINED_FUNCTION_18(v1), "ic_loggingDescription");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_1(&dword_1BD918000, v2, v3, "Error modifying records %@: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

+ (void)sortedRecords:(uint64_t)a1 .cold.1(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  uint8_t *v3;
  void *v4;

  objc_msgSend((id)OUTLINED_FUNCTION_18_1(a1, a2), "recordID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_34_0((uint64_t)v4, 5.7779e-34);
  OUTLINED_FUNCTION_28(&dword_1BD918000, v2, OS_LOG_TYPE_ERROR, "Duplicate record ID after sorting in ICCloudContext — skipping {recordID: %@}", v3);

  OUTLINED_FUNCTION_16();
}

+ (void)sortedRecords:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1BD918000, v0, v1, "Error topologically sorting records: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __35__ICCloudContext_objectsByAccount___block_invoke_2_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_48(v1);
  v2 = (void *)objc_opt_class();
  v3 = *(void **)(v0 + 32);
  v4 = v2;
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_1(&dword_1BD918000, v6, v7, "Ignoring this object that doesn't have an account id: %@, %@", v8, v9, v10, v11, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)resetZoneForCloudAccount:withReason:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  _os_log_fault_impl(&dword_1BD918000, v0, OS_LOG_TYPE_FAULT, "Cannot reset zone for non-CloudKit account {account: %@}", v1, 0xCu);
  OUTLINED_FUNCTION_1_0();
}

void __54__ICCloudContext_resetZoneForCloudAccount_withReason___block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_2();
  _os_log_fault_impl(&dword_1BD918000, v0, OS_LOG_TYPE_FAULT, "Error deleting zone records {error: %@, account: %@}", v1, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

- (void)operationToSaveZonesForZoneIDs:accountID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1BD918000, v0, v1, "Trying to create operationToSaveZonesForZoneIDs with empty accountID.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __59__ICCloudContext_operationToSaveZonesForZoneIDs_accountID___block_invoke_2_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_25_0(a1), "ic_loggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Saved record zones %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __59__ICCloudContext_operationToSaveZonesForZoneIDs_accountID___block_invoke_2_cold_2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_17();
  objc_msgSend((id)OUTLINED_FUNCTION_25_0(v1), "ic_loggingDescription");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_1(&dword_1BD918000, v2, v3, "Error saving zones %@: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

void __40__ICCloudContext_contextDidSaveOrMerge___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_36(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_7();
  OUTLINED_FUNCTION_1_2(&dword_1BD918000, v0, v1, "Adding to objectIDsToProcess from a MOC save: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

void __40__ICCloudContext_contextDidSaveOrMerge___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_36(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_7();
  OUTLINED_FUNCTION_1_2(&dword_1BD918000, v0, v1, "Removing deletedObjectIDs from list of objectIDsToProcess and objectIDsToRetry: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

void __68__ICCloudContext_addOperationToProcessObjectsWithCompletionHandler___block_invoke_cold_1(uint64_t a1, char a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 134218240;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 1024;
  *(_DWORD *)(a3 + 14) = a2 & 1;
  OUTLINED_FUNCTION_40_0(&dword_1BD918000, a4, a3, "Adding process objects operation %p. allObjects=%d", (uint8_t *)a3);
}

void __68__ICCloudContext_addOperationToProcessObjectsWithCompletionHandler___block_invoke_2_cold_1(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = OUTLINED_FUNCTION_47(a1);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Processing objects with operation %p", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __58__ICCloudContext__objectIDsToProcessForFullSyncInContext___block_invoke_cold_1(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_38_0(a1, a2);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Fetched %lu cloud objects to process", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_4_0();
}

- (void)_processPendingCloudObjectsWithCompletionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, v0, v1, "Not processing objects because the network isn't reachable", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_processPendingCloudObjectsWithCompletionHandler:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "readinessLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Trying to process objects while not ready <%@>", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

- (void)_processPendingCloudObjectsWithCompletionHandler:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, v0, v1, "Trying to process objects with no CloudKit account", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __67__ICCloudContext__processPendingCloudObjectsWithCompletionHandler___block_invoke_cold_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_18(a1), "objectIDsToProcess");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Processing objectIDs: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __67__ICCloudContext__processPendingCloudObjectsWithCompletionHandler___block_invoke_cold_3(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_18(a1), "objectIDsToRetry");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Adding objectIDsToRetry to objectIDsToProcess: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

- (void)_processCloudObjects:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, v0, v1, "Skipping processing of empty cloud objects.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __57__ICCloudContext__processCloudObjects_completionHandler___block_invoke_2_cold_1()
{
  void *v0;
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_38_0(v0, v1);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_5_1(&dword_1BD918000, v2, v3, "Processing %lu cloud objects for accountID %@", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_4_0();
}

- (void)handleCloudKitNotification:(uint64_t)a1 completionHandler:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_28(&dword_1BD918000, a2, OS_LOG_TYPE_ERROR, "Unsupported CloudKit notification type: %@", v5);

  OUTLINED_FUNCTION_4_0();
}

- (void)handleCloudKitNotification:(void *)a1 completionHandler:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_opt_class();
  v5 = v4;
  objc_msgSend(a1, "subscriptionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = v4;
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_9(&dword_1BD918000, a2, v7, "Received CloudKit notification %@ for subscription %@", (uint8_t *)&v8);

  OUTLINED_FUNCTION_2();
}

void __83__ICCloudContext_fetchRecordZoneChangesForAccountZoneIDs_reason_completionHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  uint8_t *v3;
  void *v4;

  objc_msgSend((id)OUTLINED_FUNCTION_18_1(a1, a2), "ic_loggingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_34_0((uint64_t)v4, 5.7779e-34);
  OUTLINED_FUNCTION_9_3(&dword_1BD918000, v2, OS_LOG_TYPE_DEBUG, "Waiting for previous fetch zone changes operation to finish %@", v3);

  OUTLINED_FUNCTION_16();
}

void __83__ICCloudContext_fetchRecordZoneChangesForAccountZoneIDs_reason_completionHandler___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_2(&dword_1BD918000, v0, v1, "%@", v2);
  OUTLINED_FUNCTION_1_0();
}

void __98__ICCloudContext_addOperationsToFetchRecordZoneChangesForAccountZoneIDs_reason_completionHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  uint8_t *v3;
  void *v4;

  objc_msgSend((id)OUTLINED_FUNCTION_18_1(a1, a2), "ic_loggingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_34_0((uint64_t)v4, 5.8381e-34);
  OUTLINED_FUNCTION_9_3(&dword_1BD918000, v2, OS_LOG_TYPE_DEBUG, "fetch record zone changes operation waiting for previous fetch zone changes operation to finish %{public}@", v3);

  OUTLINED_FUNCTION_16();
}

- (void)operationsToFetchRecordZoneChangesForZoneIDs:accountID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1BD918000, v0, v1, "Trying to populate operationsToFetchRecordZoneChangesForZoneIDs with empty accountID.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)operationsToFetchRecordZoneChangesForZoneIDs:accountID:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_7_2();
  objc_msgSend((id)OUTLINED_FUNCTION_8(v0, v1), "ic_loggingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_5_1(&dword_1BD918000, v3, v4, "Fetching record zone changes with operation group in account ID %@: %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)operationToFetchRecordZoneChangesForZoneIDs:database:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_7_2();
  objc_msgSend((id)OUTLINED_FUNCTION_8(v0, v1), "ic_loggingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_5_1(&dword_1BD918000, v3, v4, "Found existing operation with identical zone options in account ID %@: %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)newOperationToFetchRecordZoneChangesWithZoneConfigurations:(uint64_t)a3 database:.cold.1(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_26_0(a1, (uint64_t)a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_9(&dword_1BD918000, v6, v4, "Creating fetch changes operation in account ID %@: %@", v5);

  OUTLINED_FUNCTION_1_6();
}

void __67__ICCloudContext_fetchRecordZoneChangesOperationDidComplete_error___block_invoke_cold_1()
{
  id *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_7_2();
  objc_msgSend(*v0, "ic_loggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_5_1(&dword_1BD918000, v2, v3, "Fetched zone changes in account ID %@: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2();
}

void __67__ICCloudContext_fetchRecordZoneChangesOperationDidComplete_error___block_invoke_cold_2()
{
  id *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_7_2();
  objc_msgSend(*v0, "ic_loggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_5_1(&dword_1BD918000, v2, v3, "Fetch changes operation had partial failure in account ID %@: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2();
}

void __94__ICCloudContext_fetchRecordZoneChangesOperation_zoneID_accountID_changeTokenUpdated_context___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_6_0();
  objc_msgSend(*(id *)(v1 + 32), "ic_loggingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v0 + 40), "ic_loggingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v0 + 48), "ic_loggingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_2_2(&dword_1BD918000, v5, v6, "Zone change token updated %@ %@ %@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_7();
}

void __67__ICCloudContext_fetchDatabaseChangesWithReason_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_2(&dword_1BD918000, v0, v1, "Adding private and shared cloud databases for account: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

void __76__ICCloudContext_fetchDatabaseChangesForDatabases_reason_completionHandler___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_45(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_1_2(&dword_1BD918000, v3, (uint64_t)v3, "Fetching database changes with operation group %@", v4);

  OUTLINED_FUNCTION_1_6();
}

- (void)operationToFetchDatabaseChangesForDatabase:(uint64_t)a3 completionHandler:.cold.1(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_26_0(a1, (uint64_t)a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_9(&dword_1BD918000, v6, v4, "Creating fetch database changes operation for account %@, %@", v5);

  OUTLINED_FUNCTION_1_6();
}

void __82__ICCloudContext_fetchDatabaseChangesOperation_recordZoneWithIDChanged_accountID___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_6_0();
  objc_msgSend(*(id *)(v1 + 40), "ic_loggingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v0 + 48), "ic_loggingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_2_2(&dword_1BD918000, v4, v5, "Zone changed for account %@, %@ %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_7();
}

void __85__ICCloudContext_fetchDatabaseChangesOperation_recordZoneWithIDWasDeleted_accountID___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_6_0();
  objc_msgSend(*(id *)(v1 + 40), "ic_loggingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v0 + 48), "ic_loggingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_2_2(&dword_1BD918000, v4, v5, "Zone was deleted for account %@, %@ %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_7();
}

void __85__ICCloudContext_fetchDatabaseChangesOperation_changeTokenUpdated_accountID_context___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_6_0();
  objc_msgSend(*(id *)(v1 + 40), "ic_loggingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v0 + 48), "ic_loggingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_2_2(&dword_1BD918000, v4, v5, "Database change token updated for account %@, %@ %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_7();
}

void __120__ICCloudContext_fetchDatabaseChangesOperation_finishedWithServerChangeToken_accountID_error_completionHandler_context___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 48), "ic_loggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_5_1(&dword_1BD918000, v2, v3, "Fetched database changes for account %@, %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2();
}

void __120__ICCloudContext_fetchDatabaseChangesOperation_finishedWithServerChangeToken_accountID_error_completionHandler_context___block_invoke_cold_2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_17();
  objc_msgSend(*(id *)(v1 + 48), "ic_loggingDescription");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_1_5(&dword_1BD918000, v2, v3, "Error fetching database changes for account %@, %@: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_7();
}

void __37__ICCloudContext_clearZoneFetchState__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, v0, v1, "Clearing zone fetch state", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __59__ICCloudContext_updateSubscriptionsWithCompletionHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  uint8_t *v3;
  void *v4;

  objc_msgSend((id)OUTLINED_FUNCTION_18_1(a1, a2), "subscriptionID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_34_0((uint64_t)v4, 5.7779e-34);
  OUTLINED_FUNCTION_9_3(&dword_1BD918000, v2, OS_LOG_TYPE_DEBUG, "Not sure if subscribed to %@", v3);

  OUTLINED_FUNCTION_16();
}

void __59__ICCloudContext_updateSubscriptionsWithCompletionHandler___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, v0, v1, "Updating subscriptions", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __66__ICCloudContext_fetchSubscriptionsForDatabase_completionHandler___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_45(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_1_2(&dword_1BD918000, v3, (uint64_t)v3, "Fetching subscriptions %@", v4);

  OUTLINED_FUNCTION_1_6();
}

void __66__ICCloudContext_fetchSubscriptionsForDatabase_completionHandler___block_invoke_2_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_25_0(a1), "ic_loggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Fetched subscriptions %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __66__ICCloudContext_fetchSubscriptionsForDatabase_completionHandler___block_invoke_2_cold_2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_17();
  objc_msgSend((id)OUTLINED_FUNCTION_25_0(v1), "ic_loggingDescription");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_1(&dword_1BD918000, v2, v3, "Error fetching subscriptions %@: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

void __65__ICCloudContext_saveSubscriptionsForDatabase_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  objc_msgSend((id)OUTLINED_FUNCTION_18(a1), "databaseScope");
  CKDatabaseScopeString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "subscriptionID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_5_1(&dword_1BD918000, v5, v6, "Not saving subscriptions for %@, already subscribed to %@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_2();
}

void __65__ICCloudContext_saveSubscriptionsForDatabase_completionHandler___block_invoke_cold_2()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t *v6;
  NSObject *v7;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_26_0(v2, v3, v4, 5.778e-34);
  OUTLINED_FUNCTION_9(&dword_1BD918000, v7, v5, "Saving subscription %@ %@", v6);

  OUTLINED_FUNCTION_1_6();
}

void __65__ICCloudContext_saveSubscriptionsForDatabase_completionHandler___block_invoke_2_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_25_0(a1), "ic_loggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Saved subscriptions %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __65__ICCloudContext_saveSubscriptionsForDatabase_completionHandler___block_invoke_2_cold_2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_17();
  objc_msgSend((id)OUTLINED_FUNCTION_25_0(v1), "ic_loggingDescription");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_1(&dword_1BD918000, v2, v3, "Error saving subscriptions %@: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

void __56__ICCloudContext_updateCloudContextStateWithCompletion___block_invoke_cold_1()
{
  id *v0;
  id *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_6_0();
  objc_msgSend(*v1, "isInForeground");
  objc_msgSend(*v0, "isInternetReachable");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*v0, "syncOnlyIfReachable"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_2_2(&dword_1BD918000, v3, v4, "Updating cloud context state. %@ and internet %@. syncOnlyIfReachable: %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_1_1();
}

void __56__ICCloudContext_updateCloudContextStateWithCompletion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, v0, v1, "Syncing enabled after updating account status", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __56__ICCloudContext_updateCloudContextStateWithCompletion___block_invoke_3_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_25_0(a1), "ic_loggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Fetched user record %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __56__ICCloudContext_updateCloudContextStateWithCompletion___block_invoke_3_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_36(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_7();
  OUTLINED_FUNCTION_0_1(&dword_1BD918000, v0, v1, "Error fetching user record: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __56__ICCloudContext_updateCloudContextStateWithCompletion___block_invoke_491_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "ic_loggingIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Syncing account (%@) due to missing change tokens", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __74__ICCloudContext_enqueueLongLivedOperationsIfNeededWithCompletionHandler___block_invoke_2_cold_1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_17();
  objc_msgSend((id)OUTLINED_FUNCTION_48(v0), "ic_loggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1(&dword_1BD918000, v2, v3, "Cannot fetch all long-lived operation IDs {container: %@, error: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

void __88__ICCloudContext_enqueueLongLivedOperationsWithIDsIfNeeded_container_completionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_6_0();
  objc_msgSend((id)OUTLINED_FUNCTION_25_0(v0), "ic_loggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_5_1(&dword_1BD918000, v2, v3, "Not adding long-lived operation because it's completed or canceled {container: %@, operationID: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

void __88__ICCloudContext_enqueueLongLivedOperationsWithIDsIfNeeded_container_completionHandler___block_invoke_cold_2()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_17();
  objc_msgSend((id)OUTLINED_FUNCTION_25_0(v0), "ic_loggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_5_1(&dword_1BD918000, v2, v3, "Not adding long-lived operation because it's already queued {container: %@, operation: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

void __88__ICCloudContext_enqueueLongLivedOperationsWithIDsIfNeeded_container_completionHandler___block_invoke_cold_3()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_17();
  objc_msgSend((id)OUTLINED_FUNCTION_25_0(v0), "ic_loggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_5_1(&dword_1BD918000, v2, v3, "Not adding long-lived operation because it's been added since launch {container: %@, operation: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

void __88__ICCloudContext_enqueueLongLivedOperationsWithIDsIfNeeded_container_completionHandler___block_invoke_cold_4()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_17();
  objc_msgSend((id)OUTLINED_FUNCTION_25_0(v0), "ic_loggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_5_1(&dword_1BD918000, v2, v3, "Adding long-lived operation back to the queue {container: %@, operation: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

void __88__ICCloudContext_enqueueLongLivedOperationsWithIDsIfNeeded_container_completionHandler___block_invoke_cold_5()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_17();
  objc_msgSend((id)OUTLINED_FUNCTION_25_0(v0), "ic_loggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_5_1(&dword_1BD918000, v2, v3, "Not adding long-lived operation because it's not a modify operation {container: %@, operation: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

void __88__ICCloudContext_enqueueLongLivedOperationsWithIDsIfNeeded_container_completionHandler___block_invoke_cold_6()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_17();
  objc_msgSend(*(id *)(v0 + 40), "ic_loggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_1_5(&dword_1BD918000, v2, v3, "Cannot fetch long-lived operation {container: %@, operationID: %@, error: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_7();
}

void __50__ICCloudContext_clearRetryCountForOperationType___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_42(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_7();
  OUTLINED_FUNCTION_1_2(&dword_1BD918000, v0, v1, "Clearing retry count for %@", v2);
  OUTLINED_FUNCTION_1_0();
}

void __54__ICCloudContext_startRetryTimerIfNecessaryWithError___block_invoke_cold_1(NSObject *a1, double a2, uint64_t a3, uint64_t a4)
{
  int v4;
  double v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v4 = 134217984;
  v5 = a2;
  OUTLINED_FUNCTION_1_2(&dword_1BD918000, a1, a4, "Using backoff time for retry (%.0fs)", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1_0();
}

void __54__ICCloudContext_startRetryTimerIfNecessaryWithError___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_7();
  OUTLINED_FUNCTION_1_2(&dword_1BD918000, v0, v1, "Starting a retry timer if necessary for error: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

void __44__ICCloudContext_retryOperationsIfNecessary__block_invoke_2_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_18(a1), "readinessLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Retry timer fired, but we're not ready to sync: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __44__ICCloudContext_retryOperationsIfNecessary__block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, v0, v1, "Retry timer fired, but we have no internet connection", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __88__ICCloudContext_saveServerChangeToken_forRecordZoneID_databaseScope_accountID_context___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1BD918000, v0, v1, "Trying to save server change token without an account", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __83__ICCloudContext_serverChangeTokenForRecordZoneID_databaseScope_accountID_context___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_36(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_7();
  OUTLINED_FUNCTION_0_1(&dword_1BD918000, v0, v1, "Couldn't find account to obtain server change token with account ID: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)deleteServerChangeTokenForRecordZoneID:databaseScope:accountID:context:.cold.1()
{
  id v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_17();
  objc_msgSend(v0, "ic_loggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  CKDatabaseScopeString();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_5_1(&dword_1BD918000, v3, v4, "Deleting server change token for %@ %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_2();
}

@end

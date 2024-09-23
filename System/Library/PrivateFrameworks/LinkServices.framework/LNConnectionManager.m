@implementation LNConnectionManager

- (NSMutableDictionary)connectionsByBundleIdentifier
{
  return self->_connectionsByBundleIdentifier;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_6376);
  return (id)sharedInstance_value;
}

- (void)connection:(id)a3 didCloseWithError:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD);
  _QWORD aBlock[5];

  v6 = a3;
  v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__LNConnectionManager_connection_didCloseWithError___block_invoke;
  aBlock[3] = &unk_1E45DDE18;
  aBlock[4] = self;
  v8 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[LNConnectionManager removeConnection:](self, "removeConnection:", v6);
  v8[2](v8);

}

void __52__LNConnectionManager_connection_didCloseWithError___block_invoke(uint64_t a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
}

- (void)removeConnection:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNConnectionManager connectionsByBundleIdentifier](self, "connectionsByBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v9;
  if (v6 == v9)
  {
    -[LNConnectionManager connectionsByBundleIdentifier](self, "connectionsByBundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", 0, v4);

    v7 = v9;
  }
  objc_msgSend(v7, "setManager:", 0);

}

- (void)addConnection:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[LNConnectionManager connectionsByBundleIdentifier](self, "connectionsByBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v5);

  objc_msgSend(v6, "setManager:", self);
  objc_msgSend(v6, "setIdleTimer");

}

- (LNConnectionManager)init
{
  LNConnectionManager *v2;
  LNConnectionManager *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *connectionsByBundleIdentifier;
  LNTranscriptPrivilegedProvider *v6;
  LNTranscriptPrivilegedProvider *transcriptProvider;
  void *v8;
  LNConnectionManager *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)LNConnectionManager;
  v2 = -[LNConnectionManager init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    connectionsByBundleIdentifier = v3->_connectionsByBundleIdentifier;
    v3->_connectionsByBundleIdentifier = v4;

    v6 = objc_alloc_init(LNTranscriptPrivilegedProvider);
    transcriptProvider = v3->_transcriptProvider;
    v3->_transcriptProvider = v6;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v3, sel_appWillResignActive_, CFSTR("UIApplicationWillResignActiveNotification"), 0);

    v9 = v3;
  }

  return v3;
}

- (void)appWillResignActive:(id)a3
{
  _BOOL4 v4;
  NSObject *v5;
  _BOOL4 v6;
  uint8_t v7[16];
  uint8_t buf[16];

  v4 = +[LNEntitlementsValidator validateEntitlement:forCurrentTaskWithValidator:](LNEntitlementsValidator, "validateEntitlement:forCurrentTaskWithValidator:", CFSTR("com.apple.private.appintents.exception.background-task-allowed"), &__block_literal_global_15);
  getLNLogCategoryConnection();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A18F6000, v5, OS_LOG_TYPE_INFO, "The app will resign active; The app will close all connections manually",
        buf,
        2u);
    }

  }
  else
  {
    if (v6)
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1A18F6000, v5, OS_LOG_TYPE_INFO, "The app will resign active; Closing all connections immediately...",
        v7,
        2u);
    }

    -[LNConnectionManager invalidateAllConnections](self, "invalidateAllConnections");
  }
}

- (void)invalidateAllConnections
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint8_t v12[16];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[LNConnectionManager connectionsByBundleIdentifier](self, "connectionsByBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  os_unfair_lock_unlock(p_lock);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10++), "close");
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  getLNLogCategoryConnection();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_1A18F6000, v11, OS_LOG_TYPE_INFO, "Closed all connections", v12, 2u);
  }

}

- (id)newConnectionForBundleIdentifier:(id)a3 bundleURL:(id)a4 bundleType:(id)a5 appBundleIdentifier:(id)a6 mangledTypeName:(id)a7 userIdentity:(id)a8 error:(id *)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  if (v18)
    +[LNConnectionPolicy shouldHandleInProcessWithMangledTypeName:bundleIdentifier:](LNConnectionPolicy, "shouldHandleInProcessWithMangledTypeName:bundleIdentifier:", v18, v14);
  v20 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBundleIdentifier:bundleURL:bundleType:appBundleIdentifier:appIntentsEnabledOnly:userIdentity:error:", v14, v15, v16, v17, 1, v19, a9);

  return v20;
}

- (id)connectionForBundleIdentifier:(id)a3 bundleURL:(id)a4 bundleType:(id)a5 appBundleIdentifier:(id)a6 mangledTypeName:(id)a7 userIdentity:(id)a8 error:(id *)a9
{
  id v15;
  id v16;
  id v17;
  void (**v18)(_QWORD);
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  int v30;
  id v31;
  id v32;
  void *v33;
  char v34;
  id v35;
  id v36;
  id v37;
  char v39;
  id v40;
  id v41;
  id v42;
  _QWORD aBlock[5];

  v15 = a3;
  v42 = a4;
  v41 = a5;
  v16 = a6;
  v40 = a7;
  v17 = a8;
  os_unfair_lock_lock(&self->_lock);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __129__LNConnectionManager_connectionForBundleIdentifier_bundleURL_bundleType_appBundleIdentifier_mangledTypeName_userIdentity_error___block_invoke;
  aBlock[3] = &unk_1E45DDE18;
  aBlock[4] = self;
  v18 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v15, 0, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v20 = v19;
      else
        v20 = 0;
    }
    else
    {
      v20 = 0;
    }
    v21 = v20;

    objc_msgSend(v21, "entitlements");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKey:ofClass:", CFSTR("com.apple.private.appintents.attribution.bundle-identifier"), objc_opt_class());
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      v16 = v23;
    }
    else
    {
      objc_msgSend(v21, "containingBundleRecord");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "bundleIdentifier");
      v16 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  -[LNConnectionManager connectionsByBundleIdentifier](self, "connectionsByBundleIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectForKeyedSubscript:", v15);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v26)
    goto LABEL_29;
  objc_msgSend(v26, "userIdentity");
  v27 = (id)objc_claimAutoreleasedReturnValue();
  v28 = v17;
  v29 = v28;
  if (v27 == v28)
  {

  }
  else
  {
    if (!v28 || !v27)
    {
      v31 = v27;
LABEL_24:

      goto LABEL_26;
    }
    v30 = objc_msgSend(v27, "isEqual:", v28);

    if (!v30)
      goto LABEL_27;
  }
  objc_msgSend(v26, "appBundleIdentifier");
  v31 = (id)objc_claimAutoreleasedReturnValue();
  v32 = v16;
  v33 = v32;
  if (v31 == v32)
  {
LABEL_38:

LABEL_39:
    goto LABEL_40;
  }
  if (!v32 || !v31)
  {

    if (v33)
      goto LABEL_26;
    objc_msgSend(v26, "bundleIdentifier");
    v29 = (id)objc_claimAutoreleasedReturnValue();
    v36 = v15;
    v33 = v36;
    if (v29 != v36)
    {
      if (v36 && v29)
      {
        v39 = objc_msgSend(v29, "isEqual:", v36);

        if ((v39 & 1) != 0)
          goto LABEL_40;
        goto LABEL_28;
      }

      goto LABEL_24;
    }

    goto LABEL_38;
  }
  v34 = objc_msgSend(v31, "isEqual:", v32);

  if ((v34 & 1) != 0)
    goto LABEL_39;
LABEL_26:

LABEL_27:
LABEL_28:
  objc_msgSend(v26, "close");
  -[LNConnectionManager removeConnection:](self, "removeConnection:", v26);
LABEL_29:
  v35 = -[LNConnectionManager newConnectionForBundleIdentifier:bundleURL:bundleType:appBundleIdentifier:mangledTypeName:userIdentity:error:](self, "newConnectionForBundleIdentifier:bundleURL:bundleType:appBundleIdentifier:mangledTypeName:userIdentity:error:", v15, v42, v41, v16, v40, v17, a9);

  if (v35)
  {
    -[LNConnectionManager addConnection:](self, "addConnection:", v35);
    v26 = v35;
  }
  else
  {
    v26 = 0;
  }
LABEL_40:
  v37 = v26;

  v18[2](v18);
  return v37;
}

- (void)donateActionRecord:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  BOOL v12;
  NSObject *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "hasNextAction");
  -[LNConnectionManager transcriptProvider](self, "transcriptProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v21);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v21;
  if (v11)
    v12 = 1;
  else
    v12 = v10 == 0;
  if (v12)
  {
    getLNLogCategoryGeneral();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v23 = v6;
      v24 = 2112;
      v25 = v11;
      _os_log_impl(&dword_1A18F6000, v13, OS_LOG_TYPE_ERROR, "Object archival failed for %@: %@", buf, 0x16u);
    }

  }
  objc_msgSend(v6, "bundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "executionDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "timeIntervalSinceReferenceDate");
  v17 = v16;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __60__LNConnectionManager_donateActionRecord_completionHandler___block_invoke;
  v19[3] = &unk_1E45DE2E8;
  v20 = v7;
  v18 = v7;
  objc_msgSend(v9, "donateActionRecordData:bundleIdentifier:timestamp:writeImmediately:reply:", v10, v14, v8, v19, v17);

}

- (LNTranscriptPrivilegedProvider)transcriptProvider
{
  return self->_transcriptProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transcriptProvider, 0);
  objc_storeStrong((id *)&self->_connectionsByBundleIdentifier, 0);
}

void __60__LNConnectionManager_donateActionRecord_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  if (v3)
  {
    getLNLogCategoryConnection();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v3;
      _os_log_impl(&dword_1A18F6000, v5, OS_LOG_TYPE_ERROR, "Error when donating action record to transcript: %@", (uint8_t *)&v6, 0xCu);
    }

  }
}

void __129__LNConnectionManager_connectionForBundleIdentifier_bundleURL_bundleType_appBundleIdentifier_mangledTypeName_userIdentity_error___block_invoke(uint64_t a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
}

uint64_t __43__LNConnectionManager_appWillResignActive___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;

  v2 = a2;
  if (v2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = v2;
    else
      v3 = 0;
  }
  else
  {
    v3 = 0;
  }
  v4 = v3;
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

void __37__LNConnectionManager_sharedInstance__block_invoke()
{
  LNConnectionManager *v0;
  void *v1;

  v0 = objc_alloc_init(LNConnectionManager);
  v1 = (void *)sharedInstance_value;
  sharedInstance_value = (uint64_t)v0;

}

@end

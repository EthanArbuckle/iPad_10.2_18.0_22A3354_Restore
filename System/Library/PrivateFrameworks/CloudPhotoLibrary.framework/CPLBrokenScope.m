@implementation CPLBrokenScope

- (CPLBrokenScope)initWithEngineScope:(id)a3 engineLibrary:(id)a4
{
  id v7;
  id v8;
  CPLBrokenScope *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *queue;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CPLBrokenScope;
  v9 = -[CPLBrokenScope init](&v13, sel_init);
  if (v9)
  {
    v10 = dispatch_queue_create("com.apple.warnalert", 0);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v10;

    objc_storeStrong((id *)&v9->_engineScope, a3);
    objc_storeWeak((id *)&v9->_engineLibrary, v8);
    v9->_internal = os_variant_has_internal_content();
    v9->_shouldShowAlertToUser = CPLDontWarnAboutUnsupportedScopes() ^ 1;
  }

  return v9;
}

- (NSString)alternateRecoverDescription
{
  int64_t v4;
  void *v6;
  void *v7;

  v4 = -[CPLEngineScope scopeType](self->_engineScope, "scopeType");
  if ((unint64_t)(v4 - 4) < 2)
    return (NSString *)CFSTR("feature is enabled");
  if ((unint64_t)(v4 - 1) <= 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLBrokenScope.m");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v7, 54, CFSTR("%@ should not be a broken scope"), self->_engineScope);

    abort();
  }
  return 0;
}

- (NSString)brokenTitle
{
  return (NSString *)CFSTR("iCloud Photo Library");
}

- (NSString)brokenMessage
{
  int64_t v4;
  void *v6;
  void *v7;

  if (self->_internal)
  {
    v4 = -[CPLEngineScope scopeType](self->_engineScope, "scopeType");
    if ((unint64_t)(v4 - 4) < 2)
      return (NSString *)CFSTR("Library has remains of shared library and must be cleaned before synchronization can continue.");
    if ((unint64_t)(v4 - 1) <= 2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLBrokenScope.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v7, 80, CFSTR("%@ should not be a broken scope"), self->_engineScope);

      abort();
    }
  }
  return (NSString *)CFSTR("Library has unsupported scopes and must be cleaned before synchronization can continue.");
}

- (NSString)alertMessage
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  -[CPLBrokenScope brokenMessage](self, "brokenMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_internal)
  {
    -[CPLBrokenScope internalRecoveryInstructions](self, "internalRecoveryInstructions");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    if (v4)
    {
      objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("\n\nTo clean-up library, run the following command:\n%@"), v4);
      v6 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v6;
    }

  }
  return (NSString *)v3;
}

- (NSString)readMoreButtonTitle
{
  return (NSString *)CFSTR("Read More");
}

- (NSURL)readMoreURL
{
  void *v2;

  if (self->_internal)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://at.apple.com/icpl-unsupported-scopes"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return (NSURL *)v2;
}

- (NSString)radarTitle
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[CPLEngineScope scopeIdentifier](self->_engineScope, "scopeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPLScopeChange descriptionForScopeType:](CPLScopeChange, "descriptionForScopeType:", -[CPLEngineScope scopeType](self->_engineScope, "scopeType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("Library has broken scope %@ (%@)"), v4, v5);

  return (NSString *)v6;
}

- (NSString)radarDescription
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[CPLBrokenScope brokenMessage](self, "brokenMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@\n\nremaining scope is: %@"), v4, self->_engineScope);

  return (NSString *)v5;
}

- (NSString)createRadarButtonTitle
{
  return (NSString *)CFSTR("Create Radar");
}

- (NSURL)createRadarURL
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (!self->_internal)
    return (NSURL *)0;
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[CPLBrokenScope radarTitle](self, "radarTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("Title"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("Other Bug"), CFSTR("Classification"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("com.apple.PhotoLibraryServices.PhotosDiagnostics"), CFSTR("ExtensionIdentifiers"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("Not Applicable"), CFSTR("Reproducibility"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("Photos Backend iCloud"), CFSTR("ComponentName"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("630691"), CFSTR("ComponentID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("all"), CFSTR("ComponentVersion"));
  -[CPLBrokenScope radarDescription](self, "radarDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("Description"));

  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithString:", CFSTR("tap-to-radar://new"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = v3;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        v14 = (void *)MEMORY[0x1E0CB39D8];
        objc_msgSend(v8, "objectForKeyedSubscript:", v13, (_QWORD)v19);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "queryItemWithName:value:", v13, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v16);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }

  objc_msgSend(v6, "setQueryItems:", v7);
  objc_msgSend(v6, "URL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v17;
}

- (void)_showAlertWithMessage:(id)a3 readMoreURL:(id)a4 createRadarURL:(id)a5 showsRecoverButton:(BOOL)a6
{
  _BOOL4 v6;
  CPLEngineScope *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  CFUserNotificationRef v20;
  __CFUserNotification *v21;
  NSObject *v22;
  CFOptionFlags v23;
  NSObject *v24;
  CPLEngineScope *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  NSObject *v30;
  CPLEngineScope *engineScope;
  BOOL shouldShowAlertToUser;
  _QWORD v33[5];
  BOOL v34;
  CFOptionFlags responseFlags;
  SInt32 error;
  uint8_t buf[4];
  CPLEngineScope *v38;
  __int16 v39;
  SInt32 v40;
  _QWORD v41[4];
  _QWORD v42[5];

  v6 = a6;
  v42[4] = *MEMORY[0x1E0C80C00];
  v10 = (CPLEngineScope *)a3;
  v11 = a4;
  v12 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v13 = *MEMORY[0x1E0C9B810];
  v41[0] = *MEMORY[0x1E0C9B800];
  v41[1] = v13;
  v42[0] = CFSTR("iCloud Photo Library");
  v42[1] = v10;
  v14 = *MEMORY[0x1E0C9B820];
  v41[2] = *MEMORY[0x1E0C9B838];
  v41[3] = v14;
  v42[2] = CFSTR("OK");
  v42[3] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "mutableCopy");

  if (v11)
  {
    -[CPLBrokenScope readMoreButtonTitle](self, "readMoreButtonTitle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0C9B830]);

  }
  if (v6)
  {
    -[CPLBrokenScope recoverButtonTitle](self, "recoverButtonTitle");
    v18 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v12)
      goto LABEL_8;
    -[CPLBrokenScope createRadarButtonTitle](self, "createRadarButtonTitle");
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)v18;
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v18, *MEMORY[0x1E0C9B868]);

LABEL_8:
  error = 0;
  v20 = CFUserNotificationCreate(0, 60.0, 3uLL, &error, (CFDictionaryRef)v16);
  if (v20)
  {
    v21 = v20;
    if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v38 = v10;
        _os_log_impl(&dword_1B03C2000, v22, OS_LOG_TYPE_DEFAULT, "Waiting for response to message: %@", buf, 0xCu);
      }

    }
    responseFlags = 0;
    CFUserNotificationReceiveResponse(v21, 60.0, &responseFlags);
    CFRelease(v21);
    v23 = responseFlags & 3;
    if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v23);
        v25 = (CPLEngineScope *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v38 = v25;
        _os_log_impl(&dword_1B03C2000, v24, OS_LOG_TYPE_DEFAULT, "Button pressed is %@", buf, 0xCu);

      }
    }
    if (v11 && v23 == 1)
    {
      v26 = (void *)MEMORY[0x1E0CA5878];
      v27 = v11;
    }
    else
    {
      if (v23 != 2)
        goto LABEL_30;
      if (v6)
      {
        shouldShowAlertToUser = self->_shouldShowAlertToUser;
        self->_shouldShowAlertToUser = 0;
        v33[0] = MEMORY[0x1E0C809B0];
        v33[1] = 3221225472;
        v33[2] = __86__CPLBrokenScope__showAlertWithMessage_readMoreURL_createRadarURL_showsRecoverButton___block_invoke;
        v33[3] = &unk_1E60DC138;
        v33[4] = self;
        v34 = shouldShowAlertToUser;
        -[CPLBrokenScope recoverUsingEngineWithCompletionHandler:](self, "recoverUsingEngineWithCompletionHandler:", v33);
        goto LABEL_30;
      }
      if (!v12)
        goto LABEL_30;
      v26 = (void *)MEMORY[0x1E0CA5878];
      v27 = v12;
    }
    v28 = v27;
    objc_msgSend(v26, "defaultWorkspace");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "openURL:configuration:completionHandler:", v28, 0, 0);

  }
  else if (!_CPLSilentLogging)
  {
    __CPLGenericOSLogDomain();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      engineScope = self->_engineScope;
      *(_DWORD *)buf = 138412546;
      v38 = engineScope;
      v39 = 1024;
      v40 = error;
      _os_log_impl(&dword_1B03C2000, v30, OS_LOG_TYPE_ERROR, "Could not create user notification for broken scope %@: %d", buf, 0x12u);
    }

  }
LABEL_30:

}

- (void)showAlertToUser
{
  uint64_t v2;
  OS_dispatch_queue *queue;
  _QWORD *v4;
  NSObject *v5;
  dispatch_block_t v6;
  _QWORD v7[5];
  _QWORD block[4];
  id v9;

  v2 = MEMORY[0x1E0C809B0];
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __33__CPLBrokenScope_showAlertToUser__block_invoke;
  v7[3] = &unk_1E60D65B8;
  v7[4] = self;
  v4 = v7;
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_15726;
  block[3] = &unk_1E60D71F8;
  v9 = v4;
  v5 = queue;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);

}

- (BOOL)hasEngineRecoveryMechanism
{
  void *v2;
  char v3;

  if (!self->_internal)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("CPLProposeBrokenScopeRecovery"));

  return v3;
}

- (NSString)recoverButtonTitle
{
  return (NSString *)CFSTR("Clean-up For Me");
}

- (void)recoverUsingEngineWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  +[CPLErrors notImplementedError](CPLErrors, "notImplementedError");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a3 + 2))(v4, v5);

}

- (NSString)internalRecoveryInstructions
{
  return 0;
}

- (CPLEngineScope)engineScope
{
  return self->_engineScope;
}

- (CPLEngineLibrary)engineLibrary
{
  return (CPLEngineLibrary *)objc_loadWeakRetained((id *)&self->_engineLibrary);
}

- (BOOL)isInternal
{
  return self->_internal;
}

- (BOOL)shouldShowAlertToUser
{
  return self->_shouldShowAlertToUser;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_engineLibrary);
  objc_storeStrong((id *)&self->_engineScope, 0);
  objc_storeStrong((id *)&self->_lastShownAlertDate, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __33__CPLBrokenScope_showAlertToUser__block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  if (!v2 || (objc_msgSend(v2, "timeIntervalSinceNow"), v3 < -180.0))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 16);
    *(_QWORD *)(v5 + 16) = v4;

    if (objc_msgSend(*(id *)(a1 + 32), "shouldShowAlertToUser"))
    {
      v7 = *(void **)(a1 + 32);
      objc_msgSend(v7, "alertMessage");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "readMoreURL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "createRadarURL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_showAlertWithMessage:readMoreURL:createRadarURL:showsRecoverButton:", v14, v8, v9, objc_msgSend(*(id *)(a1 + 32), "hasEngineRecoveryMechanism"));

    }
    else if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = *(_QWORD **)(a1 + 32);
        v12 = v11[4];
        objc_msgSend(v11, "brokenMessage");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v16 = v12;
        v17 = 2112;
        v18 = v13;
        _os_log_impl(&dword_1B03C2000, v10, OS_LOG_TYPE_ERROR, "Broken scope detected: %@\n%@", buf, 0x16u);

      }
    }
  }
}

void __86__CPLBrokenScope__showAlertWithMessage_readMoreURL_createRadarURL_showsRecoverButton___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  NSObject *v8;
  id v9;
  dispatch_block_t v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  char v14;
  _QWORD block[4];
  id v16;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 8);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __86__CPLBrokenScope__showAlertWithMessage_readMoreURL_createRadarURL_showsRecoverButton___block_invoke_2;
  v11[3] = &unk_1E60DC110;
  v12 = v3;
  v13 = v4;
  v14 = *(_BYTE *)(a1 + 40);
  v7 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_15726;
  block[3] = &unk_1E60D71F8;
  v16 = v7;
  v8 = v5;
  v9 = v3;
  v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);

}

void __86__CPLBrokenScope__showAlertWithMessage_readMoreURL_createRadarURL_showsRecoverButton___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  _BYTE *v5;
  __CFString *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id WeakRetained;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        v4 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v15 = v4;
        _os_log_impl(&dword_1B03C2000, v3, OS_LOG_TYPE_ERROR, "Failed to clean-up: %@", buf, 0xCu);
      }

      v2 = *(void **)(a1 + 32);
    }
    if ((objc_msgSend(v2, "isCPLOperationCancelledError") & 1) == 0)
    {
      v5 = *(_BYTE **)(a1 + 40);
      v6 = CFSTR("Failed to clean-up library");
      if (v5[24])
      {
        v7 = objc_alloc(MEMORY[0x1E0CB3940]);
        objc_msgSend(*(id *)(a1 + 32), "localizedDescription");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = (__CFString *)objc_msgSend(v7, "initWithFormat:", CFSTR("%@\n\n%@"), CFSTR("Failed to clean-up library"), v8);

        v5 = *(_BYTE **)(a1 + 40);
      }
      objc_msgSend(v5, "readMoreURL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "createRadarURL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_showAlertWithMessage:readMoreURL:createRadarURL:showsRecoverButton:", v6, v9, v10, 0);

    }
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 25) = *(_BYTE *)(a1 + 48);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_showAlertWithMessage:readMoreURL:createRadarURL:showsRecoverButton:", CFSTR("Library has been cleaned up successfully."), 0, 0, 0);
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 40));
    objc_msgSend(WeakRetained, "syncManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "engineScope");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeBrokenScope:", v12);

  }
}

@end

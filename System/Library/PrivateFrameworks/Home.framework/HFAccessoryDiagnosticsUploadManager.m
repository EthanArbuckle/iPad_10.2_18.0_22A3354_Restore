@implementation HFAccessoryDiagnosticsUploadManager

+ (id)sharedManager
{
  if (qword_1ED378E20 != -1)
    dispatch_once(&qword_1ED378E20, &__block_literal_global_34);
  return (id)_MergedGlobals_228;
}

void __52__HFAccessoryDiagnosticsUploadManager_sharedManager__block_invoke()
{
  HFAccessoryDiagnosticsUploadManager *v0;
  void *v1;

  v0 = objc_alloc_init(HFAccessoryDiagnosticsUploadManager);
  v1 = (void *)_MergedGlobals_228;
  _MergedGlobals_228 = (uint64_t)v0;

}

- (HFAccessoryDiagnosticsUploadManager)init
{
  HFAccessoryDiagnosticsUploadManager *v2;
  uint64_t v3;
  NSMutableOrderedSet *pendingIdentifiers;
  uint64_t v5;
  NSMutableSet *uploadedIdentifiers;
  uint64_t v7;
  NSMutableSet *failedUploadIdentifiers;
  uint64_t v9;
  NSMutableDictionary *diagnosticItems;
  NSObject *v11;
  void *v12;
  void *v13;
  uint8_t v15[16];
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)HFAccessoryDiagnosticsUploadManager;
  v2 = -[HFAccessoryDiagnosticsUploadManager init](&v16, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v3 = objc_claimAutoreleasedReturnValue();
    pendingIdentifiers = v2->_pendingIdentifiers;
    v2->_pendingIdentifiers = (NSMutableOrderedSet *)v3;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = objc_claimAutoreleasedReturnValue();
    uploadedIdentifiers = v2->_uploadedIdentifiers;
    v2->_uploadedIdentifiers = (NSMutableSet *)v5;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v7 = objc_claimAutoreleasedReturnValue();
    failedUploadIdentifiers = v2->_failedUploadIdentifiers;
    v2->_failedUploadIdentifiers = (NSMutableSet *)v7;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    diagnosticItems = v2->_diagnosticItems;
    v2->_diagnosticItems = (NSMutableDictionary *)v9;

    HFLogForCategory(1uLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1DD34E000, v11, OS_LOG_TYPE_DEFAULT, "Accessory Diagnostics Upload service started", v15, 2u);
    }

    +[HFAccessoryDiagnosticsUploadManager backgroundURLSessionIdentifier](HFAccessoryDiagnosticsUploadManager, "backgroundURLSessionIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFAccessoryDiagnosticsUploadManager resumeServiceForURLSessionIdentifier:](v2, "resumeServiceForURLSessionIdentifier:", v12);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v2, sel_willResignActive_, *MEMORY[0x1E0CEB358], 0);

  }
  return v2;
}

- (void)resumeServiceForURLSessionIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[HFAccessoryDiagnosticsUploadManager backgroundSession](self, "backgroundSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", v10);

  if ((v7 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB39F8], "backgroundSessionConfigurationWithIdentifier:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB39F0], "sessionWithConfiguration:delegate:delegateQueue:", v8, self, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFAccessoryDiagnosticsUploadManager setBackgroundSession:](self, "setBackgroundSession:", v9);

  }
}

+ (NSString)backgroundURLSessionIdentifier
{
  return (NSString *)CFSTR("com.apple.home.accessoryDiagnosticsServiceIdentifier");
}

- (void)uploadDiagnosticLogUsingItem:(id)a3
{
  id v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((objc_msgSend(v5, "isEligibleForUpload") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "filename");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFAccessoryDiagnosticsUploadManager.m"), 102, CFSTR("Attempting to upload a diagnostic item that is not eligible for uploading. Log: (%@)"), v17);

  }
  objc_msgSend(v5, "filename");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HFAccessoryDiagnosticsUploadManager _didPreviouslySubmitLog:](self, "_didPreviouslySubmitLog:", v6);

  if (!v7)
  {
    objc_msgSend(v5, "filename");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "metadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFAccessoryDiagnosticsUploadManager diagnosticItems](self, "diagnosticItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v8);

    -[HFAccessoryDiagnosticsUploadManager _addToPendingUploads:](self, "_addToPendingUploads:", v8);
    HFLogForCategory(1uLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "metadata");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "uploadDestination");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v19 = v8;
      v20 = 2112;
      v21 = v13;
      _os_log_impl(&dword_1DD34E000, v11, OS_LOG_TYPE_DEFAULT, "Accessory Diagnostics upload requested for log %@  to URL %@", buf, 0x16u);

    }
  }
  -[HFAccessoryDiagnosticsUploadManager pendingIdentifiers](self, "pendingIdentifiers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (v15 <= 1)
    -[HFAccessoryDiagnosticsUploadManager _submitNextPendingLog](self, "_submitNextPendingLog");

}

- (id)fileURLForIdentifier:(id)a3
{
  void *v3;
  void *v4;

  -[HFAccessoryDiagnosticsUploadManager filePathForIdentifier:](self, "filePathForIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)filePathForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[HFAccessoryDiagnosticsUploadManager diagnosticItems](self, "diagnosticItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "snapshotPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_nextFilenameIdentifierToProcess
{
  void *v2;
  void *v3;

  -[HFAccessoryDiagnosticsUploadManager pendingIdentifiers](self, "pendingIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_submitNextPendingLog
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  id v15;
  NSObject *v16;
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
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  -[HFAccessoryDiagnosticsUploadManager _nextFilenameIdentifierToProcess](self, "_nextFilenameIdentifierToProcess");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[HFAccessoryDiagnosticsUploadManager diagnosticItems](self, "diagnosticItems");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v3);
    v5 = objc_claimAutoreleasedReturnValue();

    -[NSObject snapshotPath](v5, "snapshotPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject hf_serviceURLWithParameters](v5, "hf_serviceURLWithParameters");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 && v6)
    {
      HFLogForCategory(1uLL);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v29 = v6;
        v30 = 2112;
        v31 = v7;
        _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "Preparing to upload %@ to %@", buf, 0x16u);
      }

      objc_msgSend(v6, "lastPathComponent");
      v9 = objc_claimAutoreleasedReturnValue();
      NSTemporaryDirectory();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringByAppendingPathComponent:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v12;
      v26 = (void *)v9;
      if ((objc_msgSend(v12, "fileExistsAtPath:", v11) & 1) != 0)
      {
        v24 = 0;
      }
      else
      {
        v27 = 0;
        v13 = objc_msgSend(v12, "copyItemAtPath:toPath:error:", v6, v11, &v27);
        v14 = v27;
        v24 = v14;
        if ((v13 & 1) == 0)
        {
          v15 = v14;
          HFLogForCategory(1uLL);
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412802;
            v29 = v6;
            v30 = 2112;
            v31 = v11;
            v32 = 2112;
            v33 = v15;
            _os_log_error_impl(&dword_1DD34E000, v16, OS_LOG_TYPE_ERROR, "Copying %@ to %@ failed:%@", buf, 0x20u);
          }

        }
      }
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v11);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v17, "lastPathComponent");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringWithFormat:", CFSTR("attachment; filename=\"%@\"), v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB37A8], "requestWithURL:", v7);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setHTTPMethod:", CFSTR("POST"));
      objc_msgSend(v21, "setValue:forHTTPHeaderField:", CFSTR("application/zip"), CFSTR("Content-Type"));
      objc_msgSend(v21, "setValue:forHTTPHeaderField:", v20, CFSTR("Content-Disposition"));
      -[HFAccessoryDiagnosticsUploadManager backgroundSession](self, "backgroundSession");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "uploadTaskWithRequest:fromFile:", v21, v17);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v23, "setTaskDescription:", v3);
      objc_msgSend(v23, "resume");

    }
  }
  else
  {
    HFLogForCategory(1uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "No pending logs to upload.", buf, 2u);
    }
  }

}

- (void)_addToPendingUploads:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory(1uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[HFAccessoryDiagnosticsUploadManager pendingIdentifiers](self, "pendingIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v4;
    v10 = 2048;
    v11 = objc_msgSend(v6, "count");
    _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "Adding log:%@ to Accessory Diagnostics upload service pending queue %lu.", (uint8_t *)&v8, 0x16u);

  }
  -[HFAccessoryDiagnosticsUploadManager pendingIdentifiers](self, "pendingIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v4);

}

- (BOOL)_didPreviouslySubmitLog:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  const char *v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  BOOL v13;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HFAccessoryDiagnosticsUploadManager pendingIdentifiers](self, "pendingIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if (v6)
  {
    HFLogForCategory(1uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412290;
      v16 = v4;
      v8 = "Previously submitted. Pending identifiers contains log: %@";
LABEL_10:
      _os_log_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v15, 0xCu);
    }
  }
  else
  {
    -[HFAccessoryDiagnosticsUploadManager failedUploadIdentifiers](self, "failedUploadIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "containsObject:", v4);

    if (v10)
    {
      HFLogForCategory(1uLL);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 138412290;
        v16 = v4;
        v8 = "Previously submitted. Failed identifiers contains log: %@";
        goto LABEL_10;
      }
    }
    else
    {
      -[HFAccessoryDiagnosticsUploadManager uploadedIdentifiers](self, "uploadedIdentifiers");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "containsObject:", v4);

      if (!v12)
      {
        v13 = 0;
        goto LABEL_12;
      }
      HFLogForCategory(1uLL);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 138412290;
        v16 = v4;
        v8 = "Previously submitted. Uploaded identifiers contains log: %@";
        goto LABEL_10;
      }
    }
  }

  v13 = 1;
LABEL_12:

  return v13;
}

- (void)_failAttemptToUploadCurrentIdentifier
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__HFAccessoryDiagnosticsUploadManager__failAttemptToUploadCurrentIdentifier__block_invoke;
  block[3] = &unk_1EA727DD8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __76__HFAccessoryDiagnosticsUploadManager__failAttemptToUploadCurrentIdentifier__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "pendingIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "pendingIdentifiers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObject:", v3);

    objc_msgSend(*(id *)(a1 + 32), "failedUploadIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v3);

    v6 = *(void **)(a1 + 32);
    objc_msgSend(v6, "failedUploadIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_updatePreviousLogIdentifiers:forKey:", v7, CFSTR("HFAccessoryDiagnosticsFailed"));

    HFLogForCategory(1uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = v3;
      _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "Attempting next upload after failure to upload:%@", (uint8_t *)&v9, 0xCu);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "_submitNextPendingLog");

}

- (void)_finalizeHandlingOfIdentifier:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69__HFAccessoryDiagnosticsUploadManager__finalizeHandlingOfIdentifier___block_invoke;
  v6[3] = &unk_1EA727188;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __69__HFAccessoryDiagnosticsUploadManager__finalizeHandlingOfIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "pendingIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "failedUploadIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObject:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "uploadedIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", *(_QWORD *)(a1 + 40));

  v5 = *(void **)(a1 + 32);
  objc_msgSend(v5, "uploadedIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_updatePreviousLogIdentifiers:forKey:", v6, CFSTR("HFAccessoryDiagnosticsUploaded"));

  return objc_msgSend(*(id *)(a1 + 32), "_submitNextPendingLog");
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void (**)(id, uint64_t, _QWORD))a5;
  HFLogForCategory(1uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v6;
    _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "Received auth challenge:%@", (uint8_t *)&v9, 0xCu);
  }

  v7[2](v7, 1, 0);
}

- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7
{
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  int64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  if (a6 == a7)
  {
    HFLogForCategory(1uLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v10, "taskDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412546;
      v15 = v12;
      v16 = 2048;
      v17 = a6;
      _os_log_impl(&dword_1DD34E000, v11, OS_LOG_TYPE_DEFAULT, "Finished uploading task %@ of size:%lld", (uint8_t *)&v14, 0x16u);

    }
    objc_msgSend(v10, "taskDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFAccessoryDiagnosticsUploadManager _finalizeHandlingOfIdentifier:](self, "_finalizeHandlingOfIdentifier:", v13);

  }
}

- (void)URLSessionDidFinishEventsForBackgroundURLSession:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  void (**v9)(void);
  void *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HFAccessoryDiagnosticsUploadManager pendingIdentifiers](self, "pendingIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  HFLogForCategory(1uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_DEFAULT, "Finished uploading task in background. Submitting next identifier.", (uint8_t *)&v12, 2u);
    }

    -[HFAccessoryDiagnosticsUploadManager _nextFilenameIdentifierToProcess](self, "_nextFilenameIdentifierToProcess");
    v9 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    -[HFAccessoryDiagnosticsUploadManager _finalizeHandlingOfIdentifier:](self, "_finalizeHandlingOfIdentifier:", v9);
  }
  else
  {
    if (v8)
    {
      objc_msgSend(v4, "configuration");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = v4;
      v14 = 2112;
      v15 = v11;
      _os_log_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_DEFAULT, "Did finish all events for background url session:%@ identifier:%@", (uint8_t *)&v12, 0x16u);

    }
    -[HFAccessoryDiagnosticsUploadManager backgroundUrlSessionCompletionHandler](self, "backgroundUrlSessionCompletionHandler");
    v9 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v9[2]();
  }

}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  const char *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  objc_opt_class();
  objc_msgSend(v7, "response");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  if (v8)
  {
    HFLogForCategory(1uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "taskDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412546;
      v18 = v13;
      v19 = 2112;
      v20 = (uint64_t)v8;
      v14 = "Unable to complete task:%@ with error:%@";
LABEL_16:
      _os_log_error_impl(&dword_1DD34E000, v12, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v17, 0x16u);

      goto LABEL_10;
    }
    goto LABEL_10;
  }
  if (objc_msgSend(v11, "statusCode") < 200 || objc_msgSend(v11, "statusCode") >= 206)
  {
    HFLogForCategory(1uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "taskDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412546;
      v18 = v13;
      v19 = 2048;
      v20 = objc_msgSend(v11, "statusCode");
      v14 = "Unable to complete task:%@ with statusCode:%ld";
      goto LABEL_16;
    }
LABEL_10:

    -[HFAccessoryDiagnosticsUploadManager _failAttemptToUploadCurrentIdentifier](self, "_failAttemptToUploadCurrentIdentifier");
    goto LABEL_11;
  }
  HFLogForCategory(1uLL);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "taskDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138412546;
    v18 = v16;
    v19 = 2048;
    v20 = objc_msgSend(v11, "statusCode");
    _os_log_impl(&dword_1DD34E000, v15, OS_LOG_TYPE_DEFAULT, "Did complete task:%@ with response:%ld", (uint8_t *)&v17, 0x16u);

  }
LABEL_11:

}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  HFLogForCategory(1uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412546;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_DEFAULT, "Session %@ Did Become Invalid with error:%@", (uint8_t *)&v8, 0x16u);
  }

}

- (BOOL)_isValidFilenameIdentifier:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  -[HFAccessoryDiagnosticsUploadManager filePathForIdentifier:](self, "filePathForIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fileExistsAtPath:", v3);

  return v5;
}

- (void)willResignActive:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  HFLogForCategory(1uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "Resigning app.", v5, 2u);
  }

  -[HFAccessoryDiagnosticsUploadManager purgeStaleSubmittedLogs](self, "purgeStaleSubmittedLogs");
}

- (void)purgeStaleSubmittedLogs
{
  void *v3;
  void *v4;

  if (-[HFAccessoryDiagnosticsUploadManager _needsToPurgeOldLogs](self, "_needsToPurgeOldLogs"))
  {
    -[HFAccessoryDiagnosticsUploadManager uploadedIdentifiers](self, "uploadedIdentifiers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFAccessoryDiagnosticsUploadManager _updatePreviousLogIdentifiers:forKey:](self, "_updatePreviousLogIdentifiers:forKey:", v3, CFSTR("HFAccessoryDiagnosticsUploaded"));

    -[HFAccessoryDiagnosticsUploadManager failedUploadIdentifiers](self, "failedUploadIdentifiers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFAccessoryDiagnosticsUploadManager _updatePreviousLogIdentifiers:forKey:](self, "_updatePreviousLogIdentifiers:forKey:", v4, CFSTR("HFAccessoryDiagnosticsFailed"));

    -[HFAccessoryDiagnosticsUploadManager updateLastPurgeDate](self, "updateLastPurgeDate");
  }
}

- (BOOL)_needsToPurgeOldLogs
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  BOOL v6;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("HFAccessoryDiagnosticsLastCheckedDate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceDate:", v3);
    v6 = v5 > 86400.0;

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (void)updateLastPurgeDate
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v2, CFSTR("HFAccessoryDiagnosticsLastCheckedDate"));

}

- (void)_updatePreviousLogIdentifiers:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  _QWORD v17[5];
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "valueForKey:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(v6, "addObjectsFromArray:", v10);
  HFLogForCategory(1uLL);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v21 = v7;
    v22 = 2048;
    v23 = objc_msgSend(v6, "count");
    _os_log_impl(&dword_1DD34E000, v11, OS_LOG_TYPE_DEFAULT, "Begin update for previous identifiers with key: %@ with count: %lu", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __76__HFAccessoryDiagnosticsUploadManager__updatePreviousLogIdentifiers_forKey___block_invoke;
  v17[3] = &unk_1EA72A9F0;
  v17[4] = self;
  v18 = v8;
  v13 = v12;
  v19 = v13;
  v14 = v8;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v17);
  HFLogForCategory(1uLL);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = objc_msgSend(v13, "count");
    *(_DWORD *)buf = 138412546;
    v21 = v7;
    v22 = 2048;
    v23 = v16;
    _os_log_impl(&dword_1DD34E000, v15, OS_LOG_TYPE_DEFAULT, "Finish update for previous identifiers with key: %@ with count: %lu", buf, 0x16u);
  }

  objc_msgSend(v6, "removeAllObjects");
  objc_msgSend(v6, "addObjectsFromArray:", v13);
  objc_msgSend(v9, "setObject:forKey:", v13, v7);

}

void __76__HFAccessoryDiagnosticsUploadManager__updatePreviousLogIdentifiers_forKey___block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  int v6;
  id v7;
  id v8;
  double v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(a1[4], "fileURLForIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v5 = *MEMORY[0x1E0C998E8];
  v13 = 0;
  v6 = objc_msgSend(v4, "getResourceValue:forKey:error:", &v14, v5, &v13);
  v7 = v14;
  v8 = v13;
  if (v6 && (objc_msgSend(a1[5], "timeIntervalSinceDate:", v7), v9 < 864000.0))
  {
    HFLogForCategory(1uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v16 = v3;
      v17 = 2112;
      v18 = v7;
      _os_log_impl(&dword_1DD34E000, v10, OS_LOG_TYPE_DEFAULT, "NOT purging %@ with date = %@", buf, 0x16u);
    }

    objc_msgSend(a1[6], "addObject:", v3);
  }
  else
  {
    HFLogForCategory(1uLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v16 = v3;
      v17 = 2112;
      v18 = v7;
      _os_log_impl(&dword_1DD34E000, v11, OS_LOG_TYPE_DEFAULT, "Purging expired identifier %@ with date = %@", buf, 0x16u);
    }

    objc_msgSend(a1[4], "_cleanUpLocalFilesForIdentifier:", v3);
    objc_msgSend(a1[4], "diagnosticItems");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObjectForKey:", v3);

  }
}

- (void)_cleanUpLocalFilesForIdentifier:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[HFAccessoryDiagnosticsUploadManager filePathForIdentifier:](self, "filePathForIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "fileExistsAtPath:", v3))
  {
    v7 = 0;
    objc_msgSend(v4, "removeItemAtPath:error:", v3, &v7);
    v5 = v7;
    if (v5)
    {
      HFLogForCategory(1uLL);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v9 = v3;
        v10 = 2112;
        v11 = v5;
        _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "Failure to clean up file:%@ with error:%@", buf, 0x16u);
      }

    }
  }

}

- (id)backgroundUrlSessionCompletionHandler
{
  return self->_backgroundUrlSessionCompletionHandler;
}

- (void)setBackgroundUrlSessionCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSMutableDictionary)diagnosticItems
{
  return self->_diagnosticItems;
}

- (void)setDiagnosticItems:(id)a3
{
  objc_storeStrong((id *)&self->_diagnosticItems, a3);
}

- (NSMutableOrderedSet)pendingIdentifiers
{
  return self->_pendingIdentifiers;
}

- (void)setPendingIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_pendingIdentifiers, a3);
}

- (NSMutableSet)failedUploadIdentifiers
{
  return self->_failedUploadIdentifiers;
}

- (void)setFailedUploadIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_failedUploadIdentifiers, a3);
}

- (NSMutableSet)uploadedIdentifiers
{
  return self->_uploadedIdentifiers;
}

- (void)setUploadedIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_uploadedIdentifiers, a3);
}

- (NSURLSession)backgroundSession
{
  return self->_backgroundSession;
}

- (void)setBackgroundSession:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundSession, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundSession, 0);
  objc_storeStrong((id *)&self->_uploadedIdentifiers, 0);
  objc_storeStrong((id *)&self->_failedUploadIdentifiers, 0);
  objc_storeStrong((id *)&self->_pendingIdentifiers, 0);
  objc_storeStrong((id *)&self->_diagnosticItems, 0);
  objc_storeStrong(&self->_backgroundUrlSessionCompletionHandler, 0);
}

@end

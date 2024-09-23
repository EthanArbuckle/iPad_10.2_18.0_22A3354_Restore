@implementation IMDaemonQueryController

- (NSMutableDictionary)queries
{
  return self->_queries;
}

- (void)performQueryWithKey:(id)a3 expectsSynchronousResult:(BOOL)a4 block:(id)a5 completionHandler:(id)a6
{
  _BOOL4 v8;
  __CFString *v10;
  void (**v11)(id, void *);
  id v12;
  uint64_t v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  char *v18;
  NSObject *v19;
  const __CFString *v20;
  const __CFString *v21;
  IMDaemonQuery *v22;
  void *v23;
  void *v24;
  void *v25;
  BOOL v26;
  void *v27;
  NSObject *v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  const __CFString *v32;
  __int16 v33;
  const __CFString *v34;
  uint64_t v35;

  v8 = a4;
  v35 = *MEMORY[0x1E0C80C00];
  v10 = (__CFString *)a3;
  v11 = (void (**)(id, void *))a5;
  v12 = a6;
  -[IMDaemonQueryController _validateOutstandingQueries](self, "_validateOutstandingQueries");
  if (v11)
  {
    v13 = -[__CFString length](v10, "length");
    v14 = CFSTR("anonymous");
    if (v13)
      v14 = v10;
    v15 = v14;
    v16 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("%@-%@"), v15, v17);
    v18 = (char *)objc_claimAutoreleasedReturnValue();

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v20 = CFSTR("NO");
        if (v8)
          v21 = CFSTR("YES");
        else
          v21 = CFSTR("NO");
        *(_DWORD *)buf = 138412802;
        v30 = v18;
        v32 = v21;
        v31 = 2112;
        if (v12)
          v20 = CFSTR("YES");
        v33 = 2112;
        v34 = v20;
        _os_log_impl(&dword_1A1FF4000, v19, OS_LOG_TYPE_INFO, "Initiating query: %@ expectsSynchronousResult: %@ hasCompletionHandler: %@", buf, 0x20u);
      }

    }
    v22 = -[IMDaemonQuery initWithID:key:completionHandler:]([IMDaemonQuery alloc], "initWithID:key:completionHandler:", v18, v15, v12);
    -[IMDaemonQueryController queries](self, "queries");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setObject:forKey:", v22, v18);

    v11[2](v11, v18);
    if (v8)
    {
      -[IMDaemonQueryController queries](self, "queries");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectForKeyedSubscript:", v18);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25 == 0;

      if (!v26)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.Messages.IMDaemonQueryErrorDomain"), 2, 0);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMDaemonQueryController failQuery:error:](self, "failQuery:error:", v18, v27);

      }
    }

  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v30 = "-[IMDaemonQueryController performQueryWithKey:expectsSynchronousResult:block:completionHandler:]";
      _os_log_impl(&dword_1A1FF4000, v28, OS_LOG_TYPE_INFO, "%s: No execute block for query!", buf, 0xCu);
    }

  }
}

- (IMDaemonQueryController)initWithDaemonController:(id)a3
{
  id v4;
  IMDaemonQueryController *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *queries;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IMDaemonQueryController;
  v5 = -[IMDaemonQueryController init](&v10, sel_init);
  if (v5)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    queries = v5->_queries;
    v5->_queries = v6;

    objc_storeWeak((id *)&v5->_daemonController, v4);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v5, sel__daemonDisconnected_, CFSTR("__kIMDaemonDidDisconnectNotification"), 0);

  }
  return v5;
}

- (void)completeQuery:(id)a3 userInfo:(id)a4
{
  MEMORY[0x1E0DE7D20](self, sel__completeQuery_success_error_userInfo_);
}

- (void)_validateOutstandingQueries
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[4];
  id v21;
  __int128 *p_buf;
  uint8_t v23[128];
  __int128 buf;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[IMDaemonQueryController queries](self, "queries");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        -[IMDaemonQueryController queries](self, "queries");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v6;
        _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "Outstanding queries: %@", (uint8_t *)&buf, 0xCu);

      }
    }
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v25 = 0x3032000000;
    v26 = sub_1A200AE04;
    v27 = sub_1A200AC74;
    v28 = 0;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDaemonQueryController queries](self, "queries");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = sub_1A200BE50;
    v20[3] = &unk_1E4720830;
    v9 = v7;
    v21 = v9;
    p_buf = &buf;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v20);

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v10 = *(id *)(*((_QWORD *)&buf + 1) + 40);
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v23, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v17;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v10);
          v14 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13);
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.Messages.IMDaemonQueryErrorDomain"), 3, 0, (_QWORD)v16);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[IMDaemonQueryController failQuery:error:](self, "failQuery:error:", v14, v15);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v23, 16);
      }
      while (v11);
    }

    _Block_object_dispose(&buf, 8);
  }
}

- (void)_completeQuery:(id)a3 success:(BOOL)a4 error:(id)a5 userInfo:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  const __CFString *v18;
  double v19;
  void (**v20)(_QWORD, _QWORD, _QWORD, _QWORD);
  NSObject *v21;
  NSObject *v22;
  _BYTE v23[22];
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v8 = a4;
  v28 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  -[IMDaemonQueryController queries](self, "queries");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[IMDaemonQueryController queries](self, "queries");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeObjectForKey:", v10);

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v14, "startDate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "timeIntervalSinceNow");
        v18 = CFSTR("NO");
        *(_DWORD *)v23 = 134218754;
        *(double *)&v23[4] = -v19;
        if (v8)
          v18 = CFSTR("YES");
        *(_WORD *)&v23[12] = 2112;
        *(_QWORD *)&v23[14] = v14;
        v24 = 2112;
        v25 = v18;
        v26 = 2112;
        v27 = v11;
        _os_log_impl(&dword_1A1FF4000, v16, OS_LOG_TYPE_INFO, " ==> completed query (took %f seconds): %@ success: %@ error: %@", v23, 0x2Au);

      }
    }
    objc_msgSend(v14, "completionHandler", *(_OWORD *)v23);
    v20 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v23 = 138412290;
          *(_QWORD *)&v23[4] = v10;
          _os_log_impl(&dword_1A1FF4000, v21, OS_LOG_TYPE_INFO, " ==> invoking query completion block: %@", v23, 0xCu);
        }

      }
      ((void (**)(_QWORD, _BOOL8, id, id))v20)[2](v20, v8, v11, v12);
    }

  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v23 = 138412290;
      *(_QWORD *)&v23[4] = v10;
      _os_log_impl(&dword_1A1FF4000, v22, OS_LOG_TYPE_INFO, "Attempted to complete query %@, but query not in query controller!", v23, 0xCu);
    }

  }
}

- (void)performQueryWithKey:(id)a3 expectsSynchronousResult:(BOOL)a4 block:(id)a5
{
  -[IMDaemonQueryController performQueryWithKey:expectsSynchronousResult:block:completionHandler:](self, "performQueryWithKey:expectsSynchronousResult:block:completionHandler:", a3, a4, a5, 0);
}

- (void)completeQuery:(id)a3
{
  -[IMDaemonQueryController completeQuery:userInfo:](self, "completeQuery:userInfo:", a3, 0);
}

- (void)failQuery:(id)a3 error:(id)a4
{
  MEMORY[0x1E0DE7D20](self, sel__completeQuery_success_error_userInfo_);
}

- (void)_daemonDisconnected:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[5];
  uint8_t buf[16];

  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "Daemon disconnected, failing all queries", buf, 2u);
    }

  }
  -[IMDaemonQueryController queries](self, "queries");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1A20A2F68;
  v7[3] = &unk_1E4720808;
  v7[4] = self;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v7);

}

- (IMDaemonController)daemonController
{
  return (IMDaemonController *)objc_loadWeakRetained((id *)&self->_daemonController);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queries, 0);
  objc_destroyWeak((id *)&self->_daemonController);
}

@end

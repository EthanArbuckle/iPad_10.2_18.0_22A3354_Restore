@implementation CRKInternetDateProvider

- (CRKInternetDateProvider)init
{
  CRKInternetDateProvider *v2;
  uint64_t v3;
  NSMutableDictionary *completionHandlerTable;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRKInternetDateProvider;
  v2 = -[CRKInternetDateProvider init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    completionHandlerTable = v2->_completionHandlerTable;
    v2->_completionHandlerTable = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (void)fetchInternetDateWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  -[CRKInternetDateProvider session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDB74B8], "ephemeralSessionConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHTTPCookieAcceptPolicy:", 1);
    objc_msgSend(v6, "setHTTPMaximumConnectionsPerHost:", 1);
    objc_msgSend(v6, "setRequestCachePolicy:", 4);
    objc_msgSend(v6, "setAllowsCellularAccess:", 1);
    v7 = (void *)MEMORY[0x24BDB74B0];
    objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sessionWithConfiguration:delegate:delegateQueue:", v6, self, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKInternetDateProvider setSession:](self, "setSession:", v9);

  }
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("https://www.apple.com"));
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDB7458], "requestWithURL:", v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHTTPMethod:", CFSTR("HEAD"));
  -[CRKInternetDateProvider session](self, "session");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dataTaskWithRequest:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[CRKInternetDateProvider storeCompletionHandler:forTask:](self, "storeCompletionHandler:forTask:", v4, v12);
  objc_msgSend(v12, "resume");

}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  if (a5)
    -[CRKInternetDateProvider callAndRemoveCompletionHandlerWithDate:error:task:](self, "callAndRemoveCompletionHandlerWithDate:error:task:", 0, a5, a4);
  else
    -[CRKInternetDateProvider internetDateRequestDidReceiveTask:](self, "internetDateRequestDidReceiveTask:", a4);
}

- (void)internetDateRequestDidReceiveTask:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  objc_msgSend(v4, "response");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && objc_msgSend(v5, "statusCode") <= 299 && objc_msgSend(v6, "statusCode") > 199)
  {
    objc_msgSend(v6, "allHeaderFields");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Date"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD14E8], "dataDetectorWithTypes:error:", 8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__4;
    v17 = __Block_byref_object_dispose__4;
    v18 = 0;
    if (v8
      && (v10 = objc_msgSend(v8, "length"),
          v12[0] = MEMORY[0x24BDAC760],
          v12[1] = 3221225472,
          v12[2] = __61__CRKInternetDateProvider_internetDateRequestDidReceiveTask___block_invoke,
          v12[3] = &unk_24D9CA7A8,
          v12[4] = &v13,
          objc_msgSend(v9, "enumerateMatchesInString:options:range:usingBlock:", v8, 0, 0, v10, v12),
          v14[5]))
    {
      v11 = 0;
    }
    else
    {
      CRKErrorWithCodeAndUserInfo(113, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[CRKInternetDateProvider callAndRemoveCompletionHandlerWithDate:error:task:](self, "callAndRemoveCompletionHandlerWithDate:error:task:", v14[5], v11, v4);

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    CRKErrorWithCodeAndUserInfo(113, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKInternetDateProvider callAndRemoveCompletionHandlerWithDate:error:task:](self, "callAndRemoveCompletionHandlerWithDate:error:task:", 0, v7, v4);
  }

}

void __61__CRKInternetDateProvider_internetDateRequestDidReceiveTask___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;

  if (a2)
  {
    objc_msgSend(a2, "date");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    *a4 = 1;
  }
}

- (void)storeCompletionHandler:(id)a3 forTask:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  v8 = (id)MEMORY[0x219A226E8](a3);
  -[CRKInternetDateProvider completionHandlerTable](self, "completionHandlerTable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, v6);

}

- (void)callAndRemoveCompletionHandlerWithDate:(id)a3 error:(id)a4 task:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  uint8_t v19[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[CRKInternetDateProvider completionHandlerTable](self, "completionHandlerTable");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v10);
  v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    ((void (**)(_QWORD, id, id))v12)[2](v12, v8, v9);
    -[CRKInternetDateProvider completionHandlerTable](self, "completionHandlerTable");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", 0, v10);

    -[CRKInternetDateProvider completionHandlerTable](self, "completionHandlerTable");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "allKeys");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");

    if (!v16)
    {
      -[CRKInternetDateProvider session](self, "session");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "invalidateAndCancel");

      -[CRKInternetDateProvider setSession:](self, "setSession:", 0);
      if (_CRKLogGeneral_onceToken_39 != -1)
        dispatch_once(&_CRKLogGeneral_onceToken_39, &__block_literal_global_111);
      v18 = _CRKLogGeneral_logObj_39;
      if (os_log_type_enabled((os_log_t)_CRKLogGeneral_logObj_39, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v19 = 0;
        _os_log_impl(&dword_218C99000, v18, OS_LOG_TYPE_INFO, "All tasks to fetch the internet date and time have been completed. The session has been invalidated.", v19, 2u);
      }
    }
  }

}

- (NSURLSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (NSMutableDictionary)completionHandlerTable
{
  return self->_completionHandlerTable;
}

- (void)setCompletionHandlerTable:(id)a3
{
  objc_storeStrong((id *)&self->_completionHandlerTable, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionHandlerTable, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end

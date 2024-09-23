@implementation FBKHTTPClient

- (FBKHTTPClient)init
{
  FBKHTTPClient *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  __CFString *v10;
  __CFString *v11;
  uint64_t v12;
  void *v13;
  _BOOL4 v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSURLSession *session;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  objc_super v35;
  _QWORD v36[8];
  _QWORD v37[8];
  utsname v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v35.receiver = self;
  v35.super_class = (Class)FBKHTTPClient;
  v2 = -[FBKHTTPClient init](&v35, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1858], "defaultSessionConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "copy");

    v34 = v4;
    objc_msgSend(v4, "setURLCache:", 0);
    -[FBKHTTPClient bundle](v2, "bundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "infoDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "objectForKey:", CFSTR("CFBundleShortVersionString"));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v33 = v6;
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BDBD2A0]);
    v8 = objc_claimAutoreleasedReturnValue();
    memset(&v38, 0, 512);
    uname(&v38);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), v38.machine);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = CFSTR("Unknown");
    v32 = (void *)v8;
    if (v8)
      v10 = (__CFString *)v8;
    if (v7)
      v10 = v7;
    v11 = v10;
    +[FBKSSharedConstants productVersion](FBKSharedConstants, "productVersion");
    v12 = objc_claimAutoreleasedReturnValue();
    +[FBKSSharedConstants swVers](FBKSharedConstants, "swVers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = +[FBKSharedConstants isRunningInFBA](FBKSharedConstants, "isRunningInFBA");
    v15 = CFSTR("Feedback Framework");
    if (v14)
      v15 = CFSTR("Feedback Assistant");
    v30 = (void *)v12;
    v31 = (void *)v9;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/%@ (%@ %@) (Build %@) (Model %@)"), v15, v11, CFSTR("iOS"), v12, v13, v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 9);
    v36[0] = CFSTR("X-SP-API");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.1f"), *MEMORY[0x24BE312B0]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v18;
    v37[1] = v16;
    v36[1] = CFSTR("User-Agent");
    v36[2] = CFSTR("X-FBA-VERSION");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v37[2] = v19;
    v37[3] = CFSTR("iOS");
    v36[3] = CFSTR("X-FBA-PLATFORM");
    v36[4] = CFSTR("X-FBA-OSBUILD");
    v37[4] = v13;
    v37[5] = CFSTR("application/json");
    v36[5] = CFSTR("Accept");
    v36[6] = CFSTR("Content-Type");
    v37[6] = CFSTR("application/json");
    v36[7] = CFSTR("Accept-Language");
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKey:", *MEMORY[0x24BDBCB20]);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v21;
    v23 = CFSTR("en");
    if (v21)
      v23 = (const __CFString *)v21;
    v37[7] = v23;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v37, v36, 8);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addEntriesFromDictionary:", v24);

    +[FBKSSharedConstants overrideGeoCountryCode](FBKSharedConstants, "overrideGeoCountryCode");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      +[FBKSSharedConstants overrideGeoCountryCode](FBKSharedConstants, "overrideGeoCountryCode");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setValue:forKey:", v26, CFSTR("X-SP-Geo-Override"));

    }
    objc_msgSend(v34, "setHTTPAdditionalHeaders:", v17);
    objc_msgSend(MEMORY[0x24BDD1850], "sessionWithConfiguration:delegate:delegateQueue:", v34, v2, 0);
    v27 = objc_claimAutoreleasedReturnValue();
    session = v2->_session;
    v2->_session = (NSURLSession *)v27;

  }
  return v2;
}

- (void)didLogOutWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  +[FBKLog net](FBKLog, "net");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21D9A9000, v5, OS_LOG_TYPE_DEFAULT, "cancelling all requests", buf, 2u);
  }

  -[FBKHTTPClient session](self, "session");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __41__FBKHTTPClient_didLogOutWithCompletion___block_invoke;
  v8[3] = &unk_24E158E60;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "getAllTasksWithCompletionHandler:", v8);

}

void __41__FBKHTTPClient_didLogOutWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[4];
  void *v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v13;
    *(_QWORD *)&v5 = 138412290;
    v11 = v5;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v8);
        +[FBKLog net](FBKLog, "net", v11);
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v11;
          v17 = v9;
          _os_log_impl(&dword_21D9A9000, v10, OS_LOG_TYPE_DEFAULT, "cancelling task [%@]", buf, 0xCu);
        }

        objc_msgSend(v9, "cancel");
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
    }
    while (v6);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)didLogInWithLoginUserInfo:(id)a3 completion:(id)a4
{
  (*((void (**)(id))a4 + 2))(a4);
}

- (void)dataForURLRequest:(id)a3 success:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v8 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __49__FBKHTTPClient_dataForURLRequest_success_error___block_invoke;
  v10[3] = &unk_24E157A88;
  v11 = v8;
  v9 = v8;
  -[FBKHTTPClient dataForURLRequest:successWithResponse:error:](self, "dataForURLRequest:successWithResponse:error:", a3, v10, a5);

}

uint64_t __49__FBKHTTPClient_dataForURLRequest_success_error___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)dataForURLRequest:(id)a3 successWithResponse:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  CFTimeInterval v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *, void *, void *);
  void *v27;
  id v28;
  FBKHTTPClient *v29;
  id v30;
  id v31;
  id v32;
  CFTimeInterval v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[FBKLog net](FBKLog, "net");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v8, "HTTPMethod");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "path");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v35 = v12;
    v36 = 2114;
    v37 = v14;
    _os_log_impl(&dword_21D9A9000, v11, OS_LOG_TYPE_INFO, "-> %{public}@ %{public}@", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x24BDD15B0], "sharedHTTPCookieStorage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "cookies");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = CACurrentMediaTime();
  -[FBKHTTPClient session](self, "session");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = MEMORY[0x24BDAC760];
  v25 = 3221225472;
  v26 = __61__FBKHTTPClient_dataForURLRequest_successWithResponse_error___block_invoke;
  v27 = &unk_24E158F00;
  v28 = v8;
  v29 = self;
  v33 = v17;
  v30 = v16;
  v31 = v10;
  v32 = v9;
  v19 = v9;
  v20 = v10;
  v21 = v16;
  v22 = v8;
  objc_msgSend(v18, "dataTaskWithRequest:completionHandler:", v22, &v24);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "resume", v24, v25, v26, v27);
}

void __61__FBKHTTPClient_dataForURLRequest_successWithResponse_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  FBKRequestRecordWrapper *v17;
  uint64_t v18;
  void *v19;
  FBKRequestRecordWrapper *v20;
  void *v21;
  void *v22;
  int v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  id v38;
  id v39;
  id v40;
  uint64_t v41;
  _QWORD block[5];
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  uint64_t v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  uint64_t v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v8;
  +[FBKLog net](FBKLog, "net");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "HTTPMethod");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "URL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "path");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v50 = v12;
    v51 = 2114;
    v52 = v14;
    v53 = 2048;
    v54 = objc_msgSend(v10, "statusCode");
    _os_log_impl(&dword_21D9A9000, v11, OS_LOG_TYPE_INFO, "<- %{public}@ %{public}@ %li", buf, 0x20u);

  }
  +[FBKRequestsLog sharedInstance](FBKRequestsLog, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "active");

  if (v16)
  {
    v17 = [FBKRequestRecordWrapper alloc];
    v18 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "session");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[FBKRequestRecordWrapper initWithRequest:response:session:cookies:body:error:](v17, "initWithRequest:response:session:cookies:body:error:", v18, v10, v19, *(_QWORD *)(a1 + 48), v7, v9);

    +[FBKRequestsLog sharedInstance](FBKRequestsLog, "sharedInstance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addRequest:", v20);

  }
  if (v9)
  {
    if (objc_msgSend(v9, "code") == -999)
    {
      objc_msgSend(v9, "domain");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "isEqualToString:", *MEMORY[0x24BDD1308]);

      if (v23)
      {
        +[FBKLog net](FBKLog, "net");
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(a1 + 32), "URL");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "path");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v50 = v26;
          _os_log_impl(&dword_21D9A9000, v24, OS_LOG_TYPE_DEFAULT, "Request was cancelled, ignoring error on [%{public}@]", buf, 0xCu);

        }
        goto LABEL_12;
      }
    }
    v24 = _os_activity_create(&dword_21D9A9000, "HTTP Error", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __61__FBKHTTPClient_dataForURLRequest_successWithResponse_error___block_invoke_61;
    block[3] = &unk_24E158E88;
    block[4] = *(_QWORD *)(a1 + 40);
    v43 = v10;
    v44 = v7;
    v45 = *(id *)(a1 + 32);
    v46 = v9;
    v48 = *(_QWORD *)(a1 + 72);
    v47 = *(id *)(a1 + 56);
    os_activity_apply(v24, block);

    v27 = v43;
LABEL_11:

LABEL_12:
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%li"), objc_msgSend(v10, "statusCode"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v28, "characterAtIndex:", 0) == 50)
  {

  }
  else
  {
    v29 = objc_msgSend(v10, "statusCode");

    if (v29 != 302)
    {
      v24 = _os_activity_create(&dword_21D9A9000, "HTTP Error", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
      v33[0] = MEMORY[0x24BDAC760];
      v33[1] = 3221225472;
      v33[2] = __61__FBKHTTPClient_dataForURLRequest_successWithResponse_error___block_invoke_2;
      v33[3] = &unk_24E158ED8;
      v34 = v7;
      v35 = *(id *)(a1 + 32);
      v39 = *(id *)(a1 + 64);
      v36 = v10;
      v31 = *(id *)(a1 + 56);
      v32 = *(_QWORD *)(a1 + 40);
      v40 = v31;
      v37 = v32;
      v38 = v36;
      v41 = *(_QWORD *)(a1 + 72);
      os_activity_apply(v24, v33);

      v27 = v34;
      goto LABEL_11;
    }
  }
  objc_msgSend(MEMORY[0x24BE2CA48], "logEventWithRequest:httpStatusCode:nsurlErrorCode:success:startedAt:endedAt:", *(_QWORD *)(a1 + 32), objc_msgSend(v10, "statusCode"), 0, 1, *(double *)(a1 + 72), CACurrentMediaTime());
  v30 = *(_QWORD *)(a1 + 64);
  if (v30)
    (*(void (**)(uint64_t, id, id))(v30 + 16))(v30, v7, v10);
LABEL_13:

}

void __61__FBKHTTPClient_dataForURLRequest_successWithResponse_error___block_invoke_61(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "logHTTPErrorWithResponse:withData:fromRequest:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(id *)(a1 + 64);
  if (v10)
  {
    objc_msgSend(*(id *)(a1 + 64), "userInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      v4 = (void *)MEMORY[0x24BDBCED8];
      objc_msgSend(*(id *)(a1 + 64), "userInfo");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "dictionaryWithDictionary:", v5);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BE31348]);
    }
    v6 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(*(id *)(a1 + 64), "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, objc_msgSend(*(id *)(a1 + 64), "code"), v3);
    v8 = objc_claimAutoreleasedReturnValue();

    v2 = (id)v8;
  }
  objc_msgSend(MEMORY[0x24BE2CA48], "logEventWithRequest:httpStatusCode:nsurlErrorCode:success:startedAt:endedAt:", *(_QWORD *)(a1 + 56), objc_msgSend(*(id *)(a1 + 40), "statusCode"), objc_msgSend(*(id *)(a1 + 64), "code"), 0, *(double *)(a1 + 80), CACurrentMediaTime());
  v9 = *(_QWORD *)(a1 + 72);
  if (v9)
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v2);

}

void __61__FBKHTTPClient_dataForURLRequest_successWithResponse_error___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  FBKBoxedRequest *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  id v37;
  const __CFString *v38;
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v37 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v2, 0, &v37);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v37;
    v5 = 0;
    v6 = 0;
    if (FBKSIsValidErrorResponse())
    {
      v28 = v4;
      v29 = v3;
      v7 = v3;
      v8 = (void *)MEMORY[0x24BDBCEB8];
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("errors"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "arrayWithCapacity:", objc_msgSend(v9, "count"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v27 = v7;
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("errors"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
      if (v12)
      {
        v13 = v12;
        v5 = 0;
        v14 = *(_QWORD *)v34;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v34 != v14)
              objc_enumerationMutation(v11);
            FBKSErrorForDict(*(void **)(*((_QWORD *)&v33 + 1) + 8 * i));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = v16;
            if (v16)
            {
              if (objc_msgSend(v16, "code") == 16)
              {
                v18 = [FBKBoxedRequest alloc];
                v19 = *(_QWORD *)(a1 + 40);
                v30[0] = MEMORY[0x24BDAC760];
                v30[1] = 3221225472;
                v30[2] = __61__FBKHTTPClient_dataForURLRequest_successWithResponse_error___block_invoke_3;
                v30[3] = &unk_24E158EB0;
                v32 = *(id *)(a1 + 72);
                v31 = *(id *)(a1 + 48);
                v20 = -[FBKBoxedRequest initWithRequest:successBlock:errorBlock:](v18, "initWithRequest:successBlock:errorBlock:", v19, v30, *(_QWORD *)(a1 + 80));

                objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v38 = CFSTR("error");
                v39 = v17;
                objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "postNotificationName:object:userInfo:", CFSTR("FBKSessionDidBecomeInvalidNotification"), v20, v22);

                v5 = (void *)v20;
              }
              objc_msgSend(v10, "addObject:", v17);
            }

          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
        }
        while (v13);
      }
      else
      {
        v5 = 0;
      }

      v6 = (void *)objc_msgSend(v10, "copy");
      v4 = v28;
      v3 = v29;
    }

  }
  else
  {
    v5 = 0;
    v6 = 0;
  }
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 3);
  v24 = v23;
  if (v6)
    objc_msgSend(v23, "setObject:forKey:", v6, *MEMORY[0x24BE31310]);
  objc_msgSend(*(id *)(a1 + 56), "logHTTPErrorWithResponse:withData:fromRequest:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v25, *MEMORY[0x24BE31348]);
  if (!v5 && *(_QWORD *)(a1 + 80))
  {
    objc_msgSend(MEMORY[0x24BE2CA48], "logEventWithRequest:httpStatusCode:nsurlErrorCode:success:startedAt:endedAt:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 64), "statusCode"), 0, 0, *(double *)(a1 + 88), CACurrentMediaTime());
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("HTTPErrorDomain"), objc_msgSend(*(id *)(a1 + 64), "statusCode"), v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();

  }
}

uint64_t __61__FBKHTTPClient_dataForURLRequest_successWithResponse_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 32));
}

- (void)jsonForURLRequest:(id)a3 success:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v8 = a4;
  v9 = a5;
  v10 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __49__FBKHTTPClient_jsonForURLRequest_success_error___block_invoke;
  v15[3] = &unk_24E157A60;
  v16 = v8;
  v17 = v9;
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __49__FBKHTTPClient_jsonForURLRequest_success_error___block_invoke_79;
  v13[3] = &unk_24E157188;
  v14 = v17;
  v11 = v17;
  v12 = v8;
  -[FBKHTTPClient dataForURLRequest:success:error:](self, "dataForURLRequest:success:error:", a3, v15, v13);

}

void __49__FBKHTTPClient_jsonForURLRequest_success_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  void (*v7)(void);
  id v8;

  if (*(_QWORD *)(a1 + 32))
  {
    v8 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", a2, 0, &v8);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v8;
    if (v4)
    {
      +[FBKLog net](FBKLog, "net");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        __49__FBKHTTPClient_jsonForURLRequest_success_error___block_invoke_cold_1();

      v6 = *(_QWORD *)(a1 + 40);
      if (!v6)
        goto LABEL_9;
      v7 = *(void (**)(void))(v6 + 16);
    }
    else
    {
      v7 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    }
    v7();
LABEL_9:

  }
}

uint64_t __49__FBKHTTPClient_jsonForURLRequest_success_error___block_invoke_79(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)dataForURL:(id)a3 success:(id)a4 error:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;

  v8 = (void *)MEMORY[0x24BDD1840];
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "requestWithURL:", a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[FBKHTTPClient dataForURLRequest:success:error:](self, "dataForURLRequest:success:error:", v11, v10, v9);

}

- (void)dataForURL:(id)a3 successWithResponse:(id)a4 error:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;

  v8 = (void *)MEMORY[0x24BDD1840];
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "requestWithURL:", a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[FBKHTTPClient dataForURLRequest:successWithResponse:error:](self, "dataForURLRequest:successWithResponse:error:", v11, v10, v9);

}

- (void)jsonForURL:(id)a3 success:(id)a4 error:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;

  v8 = (void *)MEMORY[0x24BDD1840];
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "requestWithURL:", a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[FBKHTTPClient jsonForURLRequest:success:error:](self, "jsonForURLRequest:success:error:", v11, v10, v9);

}

- (void)postToURL:(id)a3 parameters:(id)a4 encoding:(unint64_t)a5 success:(id)a6 error:(id)a7
{
  -[FBKHTTPClient performHTTPMethod:toURL:parameters:encoding:success:error:](self, "performHTTPMethod:toURL:parameters:encoding:success:error:", CFSTR("POST"), a3, a4, a5, a6, a7);
}

- (void)putToURL:(id)a3 parameters:(id)a4 encoding:(unint64_t)a5 success:(id)a6 error:(id)a7
{
  -[FBKHTTPClient performHTTPMethod:toURL:parameters:encoding:success:error:](self, "performHTTPMethod:toURL:parameters:encoding:success:error:", CFSTR("PUT"), a3, a4, a5, a6, a7);
}

- (void)deleteResourceAtURL:(id)a3 success:(id)a4 error:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;

  v8 = (void *)MEMORY[0x24BDD16B0];
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "requestWithURL:", a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHTTPMethod:", CFSTR("DELETE"));
  -[FBKHTTPClient dataForURLRequest:success:error:](self, "dataForURLRequest:success:error:", v11, v10, v9);

}

- (void)deleteAtURL:(id)a3 parameters:(id)a4 encoding:(unint64_t)a5 success:(id)a6 error:(id)a7
{
  -[FBKHTTPClient performHTTPMethod:toURL:parameters:encoding:success:error:](self, "performHTTPMethod:toURL:parameters:encoding:success:error:", CFSTR("DELETE"), a3, a4, a5, a6, a7);
}

- (void)performHTTPMethod:(id)a3 toURL:(id)a4 parameters:(id)a5 encoding:(unint64_t)a6 success:(id)a7 error:(id)a8
{
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  _QWORD block[4];
  id v26;
  id v27;
  id v28;

  v14 = a7;
  v15 = a8;
  v16 = (void *)MEMORY[0x24BDD16B0];
  v17 = a5;
  v18 = a3;
  objc_msgSend(v16, "requestWithURL:", a4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setHTTPMethod:", v18);

  v28 = 0;
  -[FBKHTTPClient bodyDataForParameters:encoding:error:](self, "bodyDataForParameters:encoding:error:", v17, a6, &v28);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = v28;
  if (v20)
  {
    objc_msgSend(v19, "setHTTPBody:", v20);
    -[FBKHTTPClient contentTypeForParameterEncoding:](self, "contentTypeForParameterEncoding:", a6);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setValue:forHTTPHeaderField:", v22, CFSTR("Content-Type"));

  }
  if (v21)
  {
    +[FBKLog net](FBKLog, "net");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[FBKHTTPClient performHTTPMethod:toURL:parameters:encoding:success:error:].cold.1();

    dispatch_get_global_queue(0, 0);
    v24 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __75__FBKHTTPClient_performHTTPMethod_toURL_parameters_encoding_success_error___block_invoke;
    block[3] = &unk_24E156FA8;
    v27 = v15;
    v26 = v21;
    dispatch_async(v24, block);

  }
  else
  {
    -[FBKHTTPClient dataForURLRequest:success:error:](self, "dataForURLRequest:success:error:", v19, v14, v15);
  }

}

uint64_t __75__FBKHTTPClient_performHTTPMethod_toURL_parameters_encoding_success_error___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  id v4;
  NSObject *v5;

  v4 = a4;
  +[FBKLog net](FBKLog, "net");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[FBKHTTPClient URLSession:didBecomeInvalidWithError:].cold.1();

}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  uint64_t v8;
  int v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  uint8_t *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  uint64_t AppleSSLPinned;
  const void *v25;
  void *v26;
  __SecTrust *v27;
  void *v28;
  __CFError *v29;
  NSObject *v30;
  CFErrorRef error;
  uint8_t buf[2];
  __int16 v33;

  v6 = a4;
  v7 = (void (**)(id, uint64_t, _QWORD))a5;
  v8 = +[FBKSSharedConstants environment](FBKSharedConstants, "environment");
  v9 = v8;
  if (FBKIsInternalInstall(v8, v10) && (v9 & 0xFFFFFFFD) == 1)
  {
    +[FBKLog net](FBKLog, "net");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v33 = 0;
      v12 = "Running in development/stagingDev mode; skipping pinning check (internal only).";
      v13 = (uint8_t *)&v33;
LABEL_13:
      _os_log_impl(&dword_21D9A9000, v11, OS_LOG_TYPE_DEFAULT, v12, v13, 2u);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  objc_msgSend(v6, "protectionSpace");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "host");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[FBKSSharedConstants appleSeedURL](FBKSharedConstants, "appleSeedURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "host");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v15, "isEqualToString:", v17);

  if ((v18 & 1) == 0)
  {
    +[FBKLog net](FBKLog, "net");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v12 = "Connecting to other server; skipping pinning check.";
      v13 = buf;
      goto LABEL_13;
    }
LABEL_14:

    goto LABEL_15;
  }
  objc_msgSend(v6, "protectionSpace");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "authenticationMethod");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "isEqualToString:", *MEMORY[0x24BDD12F8]);

  if (!v21)
  {
LABEL_15:
    v7[2](v7, 1, 0);
    goto LABEL_16;
  }
  +[FBKSSharedConstants appleSeedURL](FBKSharedConstants, "appleSeedURL");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "host");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  AppleSSLPinned = SecPolicyCreateAppleSSLPinned();
  if (AppleSSLPinned)
  {
    v25 = (const void *)AppleSSLPinned;
    objc_msgSend(v6, "protectionSpace");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (__SecTrust *)objc_msgSend(v26, "serverTrust");

    LODWORD(v26) = SecTrustSetPolicies(v27, v25);
    CFRelease(v25);
    if (!(_DWORD)v26)
    {
      error = 0;
      if (SecTrustEvaluateWithError(v27, &error))
      {
        objc_msgSend(MEMORY[0x24BDD1818], "credentialForTrust:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(id, uint64_t, void *))v7)[2](v7, 0, v28);

        goto LABEL_10;
      }
      if (error)
      {
        v29 = error;
        +[FBKLog net](FBKLog, "net");
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          -[FBKHTTPClient URLSession:didReceiveChallenge:completionHandler:].cold.1(v29, v30);

        CFRelease(error);
      }
    }
  }
  v7[2](v7, 2, 0);
LABEL_10:

LABEL_16:
}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  id v9;
  id v10;
  void (**v11)(id, id);
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  __int16 v20[8];

  v9 = a4;
  v10 = a6;
  v11 = (void (**)(id, id))a7;
  objc_msgSend(v9, "originalRequest");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "URL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "absoluteString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v14, "containsString:", CFSTR("file_promise")) & 1) == 0)
  {

    goto LABEL_7;
  }
  objc_msgSend(v9, "originalRequest");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "URL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "absoluteString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "containsString:", CFSTR("download"));

  if (!v18)
  {
LABEL_7:
    v11[2](v11, v10);
    goto LABEL_8;
  }
  +[FBKLog net](FBKLog, "net");
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v20[0] = 0;
    _os_log_impl(&dword_21D9A9000, v19, OS_LOG_TYPE_INFO, "File Promise redirect detected; cancelling redirect.",
      (uint8_t *)v20,
      2u);
  }

  v11[2](v11, 0);
LABEL_8:

}

- (id)bodyDataForParameters:(id)a3 encoding:(unint64_t)a4 error:(id *)a5
{
  id v8;
  uint64_t v9;
  void *v10;

  v8 = a3;
  if (v8)
  {
    if (a4 == 1)
    {
      -[FBKHTTPClient _formEncodedBodyForDictionary:](self, "_formEncodedBodyForDictionary:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    if (a4 == 2)
    {
      objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v8, 0, a5);
      v9 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v10 = (void *)v9;
      goto LABEL_8;
    }
  }
  v10 = 0;
LABEL_8:

  return v10;
}

- (id)contentTypeForParameterEncoding:(unint64_t)a3
{
  if (a3 == 2)
    return CFSTR("application/json; charset=utf-8");
  else
    return CFSTR("application/x-www-form-urlencoded; charset=utf-8");
}

- (id)_formEncodedBodyForDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
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
  id obj;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _QWORD v31[3];

  v31[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:selector:", CFSTR("description"), 1, sel_caseInsensitiveCompare_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingDescriptors:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = v3;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v7;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v27 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v25, "objectForKey:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "description");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR(":/?#[]@!$&'()*+,;="));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "invertedSet");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringByAddingPercentEncodingWithAllowedCharacters:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[FBKHTTPClient _keyValuePairsForKey:value:](self, "_keyValuePairsForKey:value:", v18, v14);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObjectsFromArray:", v19);

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v10);
  }

  objc_msgSend(v8, "componentsJoinedByString:", CFSTR("&"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "dataUsingEncoding:", 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)_keyValuePairsForKey:(id)a3 value:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v32;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id obj;
  uint64_t v39;
  id v40;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  void *v50;
  _BYTE v51[128];
  _BYTE v52[128];
  _QWORD v53[3];

  v53[1] = *MEMORY[0x24BDAC8D0];
  v40 = a3;
  v5 = a4;
  v6 = (void *)objc_opt_class();
  if (objc_msgSend(v6, "isSubclassOfClass:", objc_opt_class()))
  {
    objc_msgSend(v5, "allKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:selector:", CFSTR("description"), 1, sel_caseInsensitiveCompare_);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v53[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v53, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sortedArrayUsingDescriptors:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v12 = v10;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
    if (v13)
    {
      v14 = v13;
      obj = v12;
      v39 = *(_QWORD *)v47;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          v16 = v5;
          if (*(_QWORD *)v47 != v39)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
          v18 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v17, "description");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR(":/?#[]@!$&'()*+,;="));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "invertedSet");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "stringByAddingPercentEncodingWithAllowedCharacters:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "stringWithFormat:", CFSTR("%@[%@]"), v40, v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          v5 = v16;
          objc_msgSend(v16, "objectForKeyedSubscript:", v17);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[FBKHTTPClient _keyValuePairsForKey:value:](self, "_keyValuePairsForKey:value:", v23, v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObjectsFromArray:", v25);

        }
        v12 = obj;
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
      }
      while (v14);
    }

  }
  else
  {
    if ((objc_msgSend(v6, "isSubclassOfClass:", objc_opt_class()) & 1) == 0
      && !objc_msgSend(v6, "isSubclassOfClass:", objc_opt_class()))
    {
      v34 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v5, "description");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR(":/?#[]@!$&'()*+,;="));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "invertedSet");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringByAddingPercentEncodingWithAllowedCharacters:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "stringWithFormat:", CFSTR("%@=%@"), v40, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v37;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v50, 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_21;
    }
    objc_msgSend(v40, "stringByAppendingString:", CFSTR("[]"));
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v26 = v5;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v43;
      do
      {
        for (j = 0; j != v28; ++j)
        {
          if (*(_QWORD *)v43 != v29)
            objc_enumerationMutation(v26);
          -[FBKHTTPClient _keyValuePairsForKey:value:](self, "_keyValuePairsForKey:value:", v12, *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * j));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObjectsFromArray:", v31);

        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
      }
      while (v28);
    }

  }
  v32 = (void *)objc_msgSend(v11, "copy");
LABEL_21:

  return v32;
}

- (id)logHTTPErrorWithResponse:(id)a3 withData:(id)a4 fromRequest:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v40;
  _BYTE v41[24];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 5);
  +[FBKLog net](FBKLog, "net");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    -[FBKHTTPClient logHTTPErrorWithResponse:withData:fromRequest:].cold.5(v7, v9, v11);

  objc_msgSend(v7, "allHeaderFields");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "description");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14)
    v16 = (const __CFString *)v14;
  else
    v16 = &stru_24E15EAF8;
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, *MEMORY[0x24BE31340]);

  objc_msgSend(v9, "HTTPMethod");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (v17)
    v19 = (const __CFString *)v17;
  else
    v19 = &stru_24E15EAF8;
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v19, *MEMORY[0x24BE31328]);

  +[FBKSSharedConstants environment](FBKSharedConstants, "environment");
  FBKSStringFromEnvironment();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v20;
  if (v20)
    v22 = (const __CFString *)v20;
  else
    v22 = &stru_24E15EAF8;
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v22, *MEMORY[0x24BE31318]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v7, "statusCode"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v23, *MEMORY[0x24BE31320]);

  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("X-Request-Id"));
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = (void *)v24;
  if (v24)
    v26 = (const __CFString *)v24;
  else
    v26 = &stru_24E15EAF8;
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v26, *MEMORY[0x24BE31338]);

  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Content-Type"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (((objc_msgSend(v27, "containsString:", CFSTR("application/json")) & 1) != 0
     || objc_msgSend(v27, "containsString:", CFSTR("text/html")))
    && objc_msgSend(v7, "statusCode") != 404)
  {
    v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v8, 4);
    +[FBKLog net](FBKLog, "net");
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      -[FBKHTTPClient logHTTPErrorWithResponse:withData:fromRequest:].cold.4();

    +[FBKLog net](FBKLog, "net");
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("X-Request-Id"));
      v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
      -[FBKHTTPClient logHTTPErrorWithResponse:withData:fromRequest:].cold.3(v30, (uint64_t)v41, v29);
    }

    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v8, 0, 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("errors"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (v32)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v32, "firstObject");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("message"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          if (v34)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              objc_msgSend(v10, "setObject:forKeyedSubscript:", v34, *MEMORY[0x24BE31330]);
          }

        }
      }
      objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("message"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (v35 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v35, *MEMORY[0x24BE31330]);
      }
      else
      {
        objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("error"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (v36)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v10, "setObject:forKeyedSubscript:", v36, *MEMORY[0x24BE31330]);
        }

      }
    }

  }
  +[FBKLog net](FBKLog, "net");
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    -[FBKHTTPClient logHTTPErrorWithResponse:withData:fromRequest:].cold.2();

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v10);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  return v38;
}

- (id)bundle
{
  return (id)objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
}

- (void)tearDown
{
  void *v3;
  void *v4;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  dispatch_semaphore_t v11;

  -[FBKHTTPClient setDidTearDown:](self, "setDidTearDown:", 1);
  -[FBKHTTPClient session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidateAndCancel");

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__2;
  v10 = __Block_byref_object_dispose__2;
  v11 = dispatch_semaphore_create(0);
  -[FBKHTTPClient session](self, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __25__FBKHTTPClient_tearDown__block_invoke;
  v5[3] = &unk_24E156A30;
  v5[4] = &v6;
  objc_msgSend(v4, "resetWithCompletionHandler:", v5);

  dispatch_semaphore_wait((dispatch_semaphore_t)v7[5], 0xFFFFFFFFFFFFFFFFLL);
  _Block_object_dispose(&v6, 8);

}

intptr_t __25__FBKHTTPClient_tearDown__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
}

- (BOOL)_shouldSimulateInvalidSessionWithRequestAndHalt:(id)a3 successHandler:(id)a4 errorHandler:(id)a5
{
  return 0;
}

- (NSURLSession)session
{
  return (NSURLSession *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSession:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (BOOL)didTearDown
{
  return self->_didTearDown;
}

- (void)setDidTearDown:(BOOL)a3
{
  self->_didTearDown = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
}

void __49__FBKHTTPClient_jsonForURLRequest_success_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_1(&dword_21D9A9000, v0, v1, "Could not create object from JSON data. Error %@", v2);
  OUTLINED_FUNCTION_7();
}

- (void)performHTTPMethod:toURL:parameters:encoding:success:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_1(&dword_21D9A9000, v0, v1, "performHTTPMethod failed with error %@", v2);
  OUTLINED_FUNCTION_7();
}

- (void)URLSession:didBecomeInvalidWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_1(&dword_21D9A9000, v0, v1, "URLSession became invalid with error %@", v2);
  OUTLINED_FUNCTION_7();
}

- (void)URLSession:(void *)a1 didReceiveChallenge:(NSObject *)a2 completionHandler:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "debugDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_1(&dword_21D9A9000, a2, v4, "Error in certificate: %{public}@", v5);

}

- (void)logHTTPErrorWithResponse:withData:fromRequest:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_0();
  v3 = 2114;
  v4 = v0;
  _os_log_error_impl(&dword_21D9A9000, v1, OS_LOG_TYPE_ERROR, "Exception [%{public}@] decoding HTTP error for response [%{public}@]", v2, 0x16u);
  OUTLINED_FUNCTION_7();
}

- (void)logHTTPErrorWithResponse:withData:fromRequest:.cold.2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_0();
  _os_log_debug_impl(&dword_21D9A9000, v0, OS_LOG_TYPE_DEBUG, "SP2 Request Attributes: %@", v1, 0xCu);
  OUTLINED_FUNCTION_7();
}

- (void)logHTTPErrorWithResponse:(__CFString *)a1 withData:(uint64_t)a2 fromRequest:(NSObject *)a3 .cold.3(__CFString *a1, uint64_t a2, NSObject *a3)
{
  const __CFString *v4;

  v4 = CFSTR("unknown");
  if (a1)
    v4 = a1;
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = v4;
  OUTLINED_FUNCTION_1_1(&dword_21D9A9000, a3, (uint64_t)a3, "Request ID: [%{public}@]", (uint8_t *)a2);

}

- (void)logHTTPErrorWithResponse:withData:fromRequest:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_1(&dword_21D9A9000, v0, v1, "Error Body: [%{public}@]", v2);
  OUTLINED_FUNCTION_7();
}

- (void)logHTTPErrorWithResponse:(void *)a1 withData:(void *)a2 fromRequest:(NSObject *)a3 .cold.5(void *a1, void *a2, NSObject *a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend(a1, "statusCode");
  objc_msgSend(a2, "HTTPMethod");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 134218498;
  v10 = v5;
  v11 = 2114;
  v12 = v6;
  v13 = 2114;
  v14 = v8;
  _os_log_error_impl(&dword_21D9A9000, a3, OS_LOG_TYPE_ERROR, "HTTP Error: [%ld] from request: [%{public}@ %{public}@]", (uint8_t *)&v9, 0x20u);

}

@end

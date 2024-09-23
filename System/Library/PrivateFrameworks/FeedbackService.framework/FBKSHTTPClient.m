@implementation FBKSHTTPClient

- (FBKSHTTPClient)init
{
  FBKSHTTPClient *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSURLSession *session;
  void *v24;
  void *v25;
  void *v26;
  objc_super v27;
  _QWORD v28[4];
  _QWORD v29[4];
  utsname v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v27.receiver = self;
  v27.super_class = (Class)FBKSHTTPClient;
  v2 = -[FBKSHTTPClient init](&v27, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDB74B8], "defaultSessionConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "copy");

    objc_msgSend(v4, "setURLCache:", 0);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "infoDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = v6;
    objc_msgSend(v6, "objectForKey:", CFSTR("CFBundleShortVersionString"));
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BDBD2A0]);
    v8 = objc_claimAutoreleasedReturnValue();
    memset(&v30, 0, 512);
    uname(&v30);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), v30.machine);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = CFSTR("Unknown");
    v24 = (void *)v8;
    v25 = (void *)v7;
    if (v8)
      v10 = (__CFString *)v8;
    if (v7)
      v10 = (__CFString *)v7;
    v11 = v10;
    +[FBKSSharedConstants productVersion](FBKSSharedConstants, "productVersion");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[FBKSSharedConstants swVers](FBKSSharedConstants, "swVers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "processName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("%@/%@ (Feedback Framework) (%@ %@) (Build %@) (Model %@)"), v16, v11, CFSTR("iOS"), v12, v13, v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 6);
    v28[0] = CFSTR("X-SP-API");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.1f"), 4.2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v19;
    v29[1] = v17;
    v28[1] = CFSTR("User-Agent");
    v28[2] = CFSTR("Accept");
    v28[3] = CFSTR("Content-Type");
    v29[2] = CFSTR("application/json");
    v29[3] = CFSTR("application/json");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v28, 4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addEntriesFromDictionary:", v20);

    objc_msgSend(v4, "setHTTPAdditionalHeaders:", v18);
    objc_msgSend(MEMORY[0x24BDB74B0], "sessionWithConfiguration:delegate:delegateQueue:", v4, v2, 0);
    v21 = objc_claimAutoreleasedReturnValue();
    session = v2->_session;
    v2->_session = (NSURLSession *)v21;

  }
  return v2;
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
  v15[2] = __50__FBKSHTTPClient_jsonForURLRequest_success_error___block_invoke;
  v15[3] = &unk_250C5F540;
  v16 = v8;
  v17 = v9;
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __50__FBKSHTTPClient_jsonForURLRequest_success_error___block_invoke_34;
  v13[3] = &unk_250C5F568;
  v14 = v17;
  v11 = v17;
  v12 = v8;
  -[FBKSHTTPClient dataForURLRequest:success:error:](self, "dataForURLRequest:success:error:", a3, v15, v13);

}

void __50__FBKSHTTPClient_jsonForURLRequest_success_error___block_invoke(uint64_t a1, uint64_t a2)
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
      Log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        __50__FBKSHTTPClient_jsonForURLRequest_success_error___block_invoke_cold_1();

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

uint64_t __50__FBKSHTTPClient_jsonForURLRequest_success_error___block_invoke_34(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
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
  v10[2] = __50__FBKSHTTPClient_dataForURLRequest_success_error___block_invoke;
  v10[3] = &unk_250C5F590;
  v11 = v8;
  v9 = v8;
  -[FBKSHTTPClient dataForURLRequest:successWithResponse:error:](self, "dataForURLRequest:successWithResponse:error:", a3, v10, a5);

}

uint64_t __50__FBKSHTTPClient_dataForURLRequest_success_error___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)formattedRequestHeader:(id)a3 session:(id)a4 cookies:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
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
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t k;
  uint64_t v39;
  void *v40;
  void *v41;
  id v43;
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
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v43 = a5;
  v9 = (void *)MEMORY[0x24BDD16A8];
  objc_msgSend(v7, "HTTPMethod");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "debugDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@ %@\n"), v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v44 = v7;
  objc_msgSend(v7, "URL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "host");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "appendFormat:", CFSTR("Host: %@\n"), v15);

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v45 = v8;
  objc_msgSend(v8, "configuration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "HTTPAdditionalHeaders");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v55 != v20)
          objc_enumerationMutation(v17);
        v22 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * i);
        objc_msgSend(v45, "configuration");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "HTTPAdditionalHeaders");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "objectForKeyedSubscript:", v22);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "appendFormat:", CFSTR("%@: %@\n"), v22, v25);

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
    }
    while (v19);
  }

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v26 = v43;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v51;
    do
    {
      for (j = 0; j != v28; ++j)
      {
        if (*(_QWORD *)v51 != v29)
          objc_enumerationMutation(v26);
        v31 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * j);
        objc_msgSend(v31, "name");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "value");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "appendFormat:", CFSTR("%@: %@\n"), v32, v33);

      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
    }
    while (v28);
  }

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  objc_msgSend(v44, "allHTTPHeaderFields");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v47;
    do
    {
      for (k = 0; k != v36; ++k)
      {
        if (*(_QWORD *)v47 != v37)
          objc_enumerationMutation(v34);
        v39 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * k);
        objc_msgSend(v44, "valueForHTTPHeaderField:", v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "appendFormat:", CFSTR("%@: %@\n"), v39, v40);

      }
      v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
    }
    while (v36);
  }

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v13);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  return v41;
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
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *, void *, void *);
  void *v23;
  FBKSHTTPClient *v24;
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  Log();
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
    v29 = v12;
    v30 = 2114;
    v31 = v14;
    _os_log_impl(&dword_23B433000, v11, OS_LOG_TYPE_INFO, "-> %{public}@ %{public}@", buf, 0x16u);

  }
  -[FBKSHTTPClient session](self, "session");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x24BDAC760];
  v21 = 3221225472;
  v22 = __62__FBKSHTTPClient_dataForURLRequest_successWithResponse_error___block_invoke;
  v23 = &unk_250C5F608;
  v24 = self;
  v25 = v8;
  v26 = v10;
  v27 = v9;
  v16 = v9;
  v17 = v10;
  v18 = v8;
  objc_msgSend(v15, "dataTaskWithRequest:completionHandler:", v18, &v20);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "resume", v20, v21, v22, v23, v24);
}

void __62__FBKSHTTPClient_dataForURLRequest_successWithResponse_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  int v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  id v38;
  void *v39;
  id v40;
  _QWORD v42[4];
  id v43;
  uint64_t v44;
  id v45;
  id v46;
  id v47;
  _QWORD block[5];
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  uint64_t v63;
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  v40 = a4;
  v8 = v7;
  v9 = (void *)MEMORY[0x24BDB7440];
  objc_msgSend(v8, "allHeaderFields");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v8;
  objc_msgSend(v8, "URL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cookiesWithResponseHeaderFields:forURL:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v13 = v12;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v55;
    v38 = v6;
    while (2)
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v55 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
        objc_msgSend(v18, "name");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v19, "isEqualToString:", CFSTR("_seedportal_session")))
        {

LABEL_12:
          objc_msgSend(*(id *)(a1 + 32), "setSeedPortalSession:", v18);
          v6 = v38;
          goto LABEL_13;
        }
        objc_msgSend(v18, "name");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("_seedportal_session_uat"));

        if (v21)
          goto LABEL_12;
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
      v6 = v38;
      if (v15)
        continue;
      break;
    }
  }
LABEL_13:

  Log();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 40), "HTTPMethod");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "URL");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "path");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v39, "statusCode");
    *(_DWORD *)buf = 138543874;
    v59 = v23;
    v60 = 2114;
    v61 = v25;
    v62 = 2048;
    v63 = v26;
    _os_log_impl(&dword_23B433000, v22, OS_LOG_TYPE_INFO, "<- %{public}@ %{public}@ %li", buf, 0x20u);

  }
  if (v40)
  {
    if (objc_msgSend(v40, "code") == -999)
    {
      objc_msgSend(v40, "domain");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "isEqualToString:", *MEMORY[0x24BDD1308]);

      if (v28)
      {
        Log();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(a1 + 40), "URL");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "path");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v59 = v31;
          _os_log_impl(&dword_23B433000, v29, OS_LOG_TYPE_DEFAULT, "Request was cancelled, ignoring error on [%{public}@]", buf, 0xCu);

        }
        goto LABEL_22;
      }
    }
    v29 = _os_activity_create(&dword_23B433000, "HTTP Error", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __62__FBKSHTTPClient_dataForURLRequest_successWithResponse_error___block_invoke_47;
    block[3] = &unk_250C5F5B8;
    block[4] = *(_QWORD *)(a1 + 32);
    v49 = v39;
    v50 = v6;
    v51 = *(id *)(a1 + 40);
    v52 = v40;
    v53 = *(id *)(a1 + 48);
    os_activity_apply(v29, block);

    v32 = v49;
LABEL_21:

LABEL_22:
    goto LABEL_23;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%li"), objc_msgSend(v39, "statusCode"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v33, "characterAtIndex:", 0) == 50)
  {

  }
  else
  {
    v34 = objc_msgSend(v39, "statusCode");

    if (v34 != 302)
    {
      v29 = _os_activity_create(&dword_23B433000, "HTTP Error", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
      v42[0] = MEMORY[0x24BDAC760];
      v42[1] = 3221225472;
      v42[2] = __62__FBKSHTTPClient_dataForURLRequest_successWithResponse_error___block_invoke_2;
      v42[3] = &unk_250C5F5E0;
      v36 = v6;
      v37 = *(_QWORD *)(a1 + 32);
      v43 = v36;
      v44 = v37;
      v45 = v39;
      v46 = *(id *)(a1 + 40);
      v47 = *(id *)(a1 + 48);
      os_activity_apply(v29, v42);

      v32 = v43;
      goto LABEL_21;
    }
  }
  v35 = *(_QWORD *)(a1 + 56);
  if (v35)
    (*(void (**)(uint64_t, id, void *))(v35 + 16))(v35, v6, v39);
LABEL_23:

}

void __62__FBKSHTTPClient_dataForURLRequest_successWithResponse_error___block_invoke_47(uint64_t a1)
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

      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("SeedingHTTPRequestDetails"));
    }
    v6 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(*(id *)(a1 + 64), "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, objc_msgSend(*(id *)(a1 + 64), "code"), v3);
    v8 = objc_claimAutoreleasedReturnValue();

    v2 = (id)v8;
  }
  v9 = *(_QWORD *)(a1 + 72);
  if (v9)
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v2);

}

void __62__FBKSHTTPClient_dataForURLRequest_successWithResponse_error___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v24 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v2, 0, &v24);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v24;
    v5 = 0;
    if (FBKSIsValidErrorResponse(v3))
    {
      v6 = v3;
      v7 = (void *)MEMORY[0x24BDBCEB8];
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("errors"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "arrayWithCapacity:", objc_msgSend(v8, "count"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("errors"), 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v21;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v21 != v13)
              objc_enumerationMutation(v10);
            FBKSErrorForDict(*(void **)(*((_QWORD *)&v20 + 1) + 8 * v14));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (v15)
              objc_msgSend(v9, "addObject:", v15);

            ++v14;
          }
          while (v12 != v14);
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
        }
        while (v12);
      }

      v5 = (void *)objc_msgSend(v9, "copy");
    }

  }
  else
  {
    v5 = 0;
  }
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 3);
  v17 = v16;
  if (v5)
    objc_msgSend(v16, "setObject:forKey:", v5, CFSTR("FBKSSeedPortalErrorsKey"));
  objc_msgSend(*(id *)(a1 + 40), "logHTTPErrorWithResponse:withData:fromRequest:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v18, CFSTR("SeedingHTTPRequestDetails"));
  if (*(_QWORD *)(a1 + 64))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("HTTPErrorDomain"), objc_msgSend(*(id *)(a1 + 48), "statusCode"), v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

  }
}

- (void)dataForURL:(id)a3 success:(id)a4 error:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;

  v8 = (void *)MEMORY[0x24BDB74A0];
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "requestWithURL:", a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[FBKSHTTPClient dataForURLRequest:success:error:](self, "dataForURLRequest:success:error:", v11, v10, v9);

}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  id v4;
  NSObject *v5;

  v4 = a4;
  Log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[FBKSHTTPClient URLSession:didBecomeInvalidWithError:].cold.1();

}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  int v8;
  NSObject *v9;
  const char *v10;
  uint8_t *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  uint64_t AppleSSLPinned;
  const void *v23;
  void *v24;
  __SecTrust *v25;
  void *v26;
  __CFError *v27;
  NSObject *v28;
  CFErrorRef error;
  uint8_t buf[2];
  __int16 v31;

  v6 = a4;
  v7 = (void (**)(id, uint64_t, _QWORD))a5;
  v8 = +[FBKSSharedConstants environment](FBKSSharedConstants, "environment");
  if (FBKSHasInternalUI() && (v8 & 0xFFFFFFFD) == 1)
  {
    Log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v31 = 0;
      v10 = "Running in development/stagingDev mode; skipping pinning check (internal only).";
      v11 = (uint8_t *)&v31;
LABEL_13:
      _os_log_impl(&dword_23B433000, v9, OS_LOG_TYPE_DEFAULT, v10, v11, 2u);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  objc_msgSend(v6, "protectionSpace");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "host");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[FBKSSharedConstants appleSeedURL](FBKSSharedConstants, "appleSeedURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "host");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v13, "isEqualToString:", v15);

  if ((v16 & 1) == 0)
  {
    Log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v10 = "Connecting to other server; skipping pinning check.";
      v11 = buf;
      goto LABEL_13;
    }
LABEL_14:

    goto LABEL_15;
  }
  objc_msgSend(v6, "protectionSpace");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "authenticationMethod");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isEqualToString:", *MEMORY[0x24BDB7410]);

  if (!v19)
  {
LABEL_15:
    v7[2](v7, 1, 0);
    goto LABEL_16;
  }
  +[FBKSSharedConstants appleSeedURL](FBKSSharedConstants, "appleSeedURL");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "host");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  AppleSSLPinned = SecPolicyCreateAppleSSLPinned();
  if (AppleSSLPinned)
  {
    v23 = (const void *)AppleSSLPinned;
    objc_msgSend(v6, "protectionSpace");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (__SecTrust *)objc_msgSend(v24, "serverTrust");

    LODWORD(v24) = SecTrustSetPolicies(v25, v23);
    CFRelease(v23);
    if (!(_DWORD)v24)
    {
      error = 0;
      if (SecTrustEvaluateWithError(v25, &error))
      {
        objc_msgSend(MEMORY[0x24BDB7480], "credentialForTrust:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(id, uint64_t, void *))v7)[2](v7, 0, v26);

        goto LABEL_10;
      }
      if (error)
      {
        v27 = error;
        Log();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          -[FBKSHTTPClient URLSession:didReceiveChallenge:completionHandler:].cold.1(v27, v28);

        CFRelease(error);
      }
    }
  }
  v7[2](v7, 2, 0);
LABEL_10:

LABEL_16:
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
  NSObject *v35;
  void *v36;
  void *v38;
  _BYTE v39[24];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 5);
  Log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    -[FBKSHTTPClient logHTTPErrorWithResponse:withData:fromRequest:].cold.5(v7, v9, v11);

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
    v16 = &stru_250C613A8;
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, CFSTR("url"));

  objc_msgSend(v9, "HTTPMethod");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (v17)
    v19 = (const __CFString *)v17;
  else
    v19 = &stru_250C613A8;
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v19, CFSTR("HTTP method"));

  FBKSStringFromEnvironment(+[FBKSSharedConstants environment](FBKSSharedConstants, "environment"));
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v20;
  if (v20)
    v22 = (const __CFString *)v20;
  else
    v22 = &stru_250C613A8;
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v22, CFSTR("environment"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v7, "statusCode"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v23, CFSTR("HTTP error"));

  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("X-Request-Id"));
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = (void *)v24;
  if (v24)
    v26 = (const __CFString *)v24;
  else
    v26 = &stru_250C613A8;
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v26, CFSTR("request id"));

  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Content-Type"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (((objc_msgSend(v27, "containsString:", CFSTR("application/json")) & 1) != 0
     || objc_msgSend(v27, "containsString:", CFSTR("text/html")))
    && objc_msgSend(v7, "statusCode") != 404)
  {
    v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v8, 4);
    Log();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      -[FBKSHTTPClient logHTTPErrorWithResponse:withData:fromRequest:].cold.4();

    Log();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("X-Request-Id"));
      v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
      -[FBKSHTTPClient logHTTPErrorWithResponse:withData:fromRequest:].cold.3(v30, (uint64_t)v39, v29);
    }

    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v8, 0, 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_32;
    objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("errors"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v32, "firstObject");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("message"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v34)
        goto LABEL_31;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_31;
    }
    else
    {
      objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("error"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v34)
        goto LABEL_31;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_31;
    }
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v34, CFSTR("error message"));
LABEL_31:

LABEL_32:
  }
  Log();
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
    -[FBKSHTTPClient logHTTPErrorWithResponse:withData:fromRequest:].cold.2();

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v10);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  return v36;
}

- (NSURLSession)session
{
  return (NSURLSession *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSession:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSHTTPCookie)seedPortalSession
{
  return (NSHTTPCookie *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSeedPortalSession:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seedPortalSession, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

void __50__FBKSHTTPClient_jsonForURLRequest_success_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23B433000, v0, v1, "Could not create object from JSON data. Error %@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)URLSession:didBecomeInvalidWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23B433000, v0, v1, "URLSession became invalid with error %@", v2);
  OUTLINED_FUNCTION_2();
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
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23B433000, a2, v4, "Error in certificate: %{public}@", v5);

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
  OUTLINED_FUNCTION_1();
  v3 = 2114;
  v4 = v0;
  _os_log_error_impl(&dword_23B433000, v1, OS_LOG_TYPE_ERROR, "Exception [%{public}@] decoding HTTP error for response [%{public}@]", v2, 0x16u);
  OUTLINED_FUNCTION_2();
}

- (void)logHTTPErrorWithResponse:withData:fromRequest:.cold.2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_23B433000, v0, OS_LOG_TYPE_DEBUG, "SP2 Request Attributes: %@", v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (void)logHTTPErrorWithResponse:(__CFString *)a1 withData:(uint64_t)a2 fromRequest:(NSObject *)a3 .cold.3(__CFString *a1, uint64_t a2, NSObject *a3)
{
  const __CFString *v4;

  v4 = CFSTR("unknown");
  if (a1)
    v4 = a1;
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = v4;
  OUTLINED_FUNCTION_0(&dword_23B433000, a3, (uint64_t)a3, "Request ID: [%{public}@]", (uint8_t *)a2);

}

- (void)logHTTPErrorWithResponse:withData:fromRequest:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23B433000, v0, v1, "Error Body: [%{public}@]", v2);
  OUTLINED_FUNCTION_2();
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
  _os_log_error_impl(&dword_23B433000, a3, OS_LOG_TYPE_ERROR, "HTTP Error: [%ld] from request: [%{public}@ %{public}@]", (uint8_t *)&v9, 0x20u);

}

@end

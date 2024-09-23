@implementation DEDSeedingClient

- (DEDSeedingClient)initWithConfiguration:(id)a3 sessionID:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  DEDSeedingClient *v11;
  DEDSeedingClient *v12;
  uint64_t v13;
  DEDBugSessionConfiguration *config;
  void *v15;
  os_log_t v16;
  OS_os_log *log;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  NSURLSession *foregroundSession;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSURLSession *backgroundSession;
  uint8_t buf[8];
  objc_super v33;
  _QWORD v34[2];
  _QWORD v35[3];

  v35[2] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v33.receiver = self;
  v33.super_class = (Class)DEDSeedingClient;
  v11 = -[DEDSeedingClient init](&v33, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_uploadDelegate, v10);
    v13 = objc_msgSend(v8, "copy");
    config = v12->_config;
    v12->_config = (DEDBugSessionConfiguration *)v13;

    objc_storeStrong((id *)&v12->_bugSessionIdentifier, a4);
    +[DEDConfiguration sharedInstance](DEDConfiguration, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = os_log_create((const char *)objc_msgSend(v15, "loggingSubsystem"), "seeding-client");
    log = v12->_log;
    v12->_log = (OS_os_log *)v16;

    if (!v12->_config)
    {
      v18 = v12->_log;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[DEDSeedingClient initWithConfiguration:sessionID:delegate:].cold.1((uint64_t *)&v12->_bugSessionIdentifier, v18, v19);
    }
    v34[0] = CFSTR("X-SP-API");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.1f"), 0x4010666660000000);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v34[1] = CFSTR("User-Agent");
    v35[0] = v20;
    v35[1] = CFSTR("Feedback Assistant/remote");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = v12->_log;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21469E000, v22, OS_LOG_TYPE_INFO, "Using ephemeral url session configuration", buf, 2u);
    }
    objc_msgSend(MEMORY[0x24BDD1858], "ephemeralSessionConfiguration");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setHTTPAdditionalHeaders:", v21);
    objc_msgSend(v23, "setUpDataUsageWithConfiguration:", v8);
    objc_msgSend(MEMORY[0x24BDD1850], "sessionWithConfiguration:", v23);
    v24 = objc_claimAutoreleasedReturnValue();
    foregroundSession = v12->_foregroundSession;
    v12->_foregroundSession = (NSURLSession *)v24;

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ded:%@"), v9);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1858], "backgroundSessionConfigurationWithIdentifier:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v27, "copy");

    objc_msgSend(v28, "setHTTPAdditionalHeaders:", v21);
    objc_msgSend(v28, "setUpDataUsageWithConfiguration:", v8);
    objc_msgSend(MEMORY[0x24BDD1850], "sessionWithConfiguration:delegate:delegateQueue:", v28, v12, 0);
    v29 = objc_claimAutoreleasedReturnValue();
    backgroundSession = v12->_backgroundSession;
    v12->_backgroundSession = (NSURLSession *)v29;

  }
  return v12;
}

- (void)seedingLoginWithSuccess:(id)a3 error:(id)a4
{
  void (**v6)(_QWORD);
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  void (**v16)(_QWORD);
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(_QWORD))a3;
  v7 = a4;
  if (-[DEDSeedingClient isLoggedIn](self, "isLoggedIn"))
  {
    v6[2](v6);
  }
  else
  {
    -[DEDSeedingClient loginWithTokenURL](self, "loginWithTokenURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = CFSTR("device_token");
    -[DEDSeedingClient config](self, "config");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "seedingDeviceToken");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x24BDAC760];
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __50__DEDSeedingClient_seedingLoginWithSuccess_error___block_invoke;
    v15[3] = &unk_24D1E6798;
    v15[4] = self;
    v16 = v6;
    v13[0] = v12;
    v13[1] = 3221225472;
    v13[2] = __50__DEDSeedingClient_seedingLoginWithSuccess_error___block_invoke_35;
    v13[3] = &unk_24D1E67C0;
    v13[4] = self;
    v14 = v7;
    -[DEDSeedingClient postToURL:parameters:encoding:success:error:](self, "postToURL:parameters:encoding:success:error:", v8, v11, 2, v15, v13);

  }
}

uint64_t __50__DEDSeedingClient_seedingLoginWithSuccess_error___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  uint8_t v4[16];

  objc_msgSend(*(id *)(a1 + 32), "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21469E000, v2, OS_LOG_TYPE_DEFAULT, "logged in", v4, 2u);
  }

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __50__DEDSeedingClient_seedingLoginWithSuccess_error___block_invoke_35(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __50__DEDSeedingClient_seedingLoginWithSuccess_error___block_invoke_35_cold_1();

  }
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

- (void)sendFile:(id)a3 promise:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __52__DEDSeedingClient_sendFile_promise_withCompletion___block_invoke;
  v18[3] = &unk_24D1E4E98;
  v18[4] = self;
  v19 = v9;
  v20 = v8;
  v21 = v10;
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __52__DEDSeedingClient_sendFile_promise_withCompletion___block_invoke_55;
  v15[3] = &unk_24D1E6810;
  v15[4] = self;
  v16 = v19;
  v17 = v21;
  v12 = v21;
  v13 = v19;
  v14 = v8;
  -[DEDSeedingClient seedingLoginWithSuccess:error:](self, "seedingLoginWithSuccess:error:", v18, v15);

}

void __52__DEDSeedingClient_sendFile_promise_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;

  v3 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v4 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __52__DEDSeedingClient_sendFile_promise_withCompletion___block_invoke_2;
  v11[3] = &unk_24D1E67E8;
  v5 = v2;
  v6 = *(_QWORD *)(a1 + 32);
  v12 = v5;
  v13 = v6;
  v14 = *(id *)(a1 + 48);
  v15 = *(id *)(a1 + 56);
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __52__DEDSeedingClient_sendFile_promise_withCompletion___block_invoke_53;
  v8[3] = &unk_24D1E6810;
  v7 = *(void **)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v7;
  v10 = *(id *)(a1 + 56);
  objc_msgSend(v3, "getFilerTokenForPromise:withSuccess:error:", v5, v11, v8);

}

void __52__DEDSeedingClient_sendFile_promise_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  int v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void (*v27)(void);
  id v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = a2;
  objc_msgSend(v4, "entityID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@_-_%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BDD16B0];
  objc_msgSend(*(id *)(a1 + 40), "filerURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "requestWithURL:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v4, "token");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setValue:forHTTPHeaderField:", v11, CFSTR("Auth_Token"));

  objc_msgSend(v4, "dsid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setValue:forHTTPHeaderField:", v12, CFSTR("DS_Person_ID"));
  objc_msgSend(v10, "setValue:forHTTPHeaderField:", v7, CFSTR("Form_Response_ID"));
  objc_msgSend(v10, "setValue:forHTTPHeaderField:", CFSTR("application/gzip"), CFSTR("Content-Type"));
  objc_msgSend(*(id *)(a1 + 40), "config");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAllowsCellularAccess:", objc_msgSend(v13, "allowsCellularUpload"));

  v14 = *(void **)(a1 + 40);
  v15 = *(_QWORD *)(a1 + 48);
  v28 = 0;
  objc_msgSend(v14, "beginUploadWithRequest:fromFileURL:error:", v10, v15, &v28);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v28;
  objc_msgSend(*(id *)(a1 + 40), "log");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v16)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v20 = objc_msgSend(v16, "taskIdentifier");
      objc_msgSend(*(id *)(a1 + 32), "UUIDString");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "config");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "allowsCellularUpload");
      *(_DWORD *)buf = 134218498;
      v30 = v20;
      v31 = 2114;
      v32 = v21;
      v33 = 1024;
      v34 = v23;
      _os_log_impl(&dword_21469E000, v19, OS_LOG_TYPE_DEFAULT, "created upload task [%lu] for promise UUID [%{public}@] with cellular access? [%i]", buf, 0x1Cu);

    }
    objc_msgSend(*(id *)(a1 + 40), "log");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v10, "URL");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "allHTTPHeaderFields");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v30 = (uint64_t)v25;
      v31 = 2112;
      v32 = v26;
      _os_log_impl(&dword_21469E000, v24, OS_LOG_TYPE_DEFAULT, "Uploading to [%@] with headers [%@]", buf, 0x16u);

    }
    v27 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
  }
  else
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      __52__DEDSeedingClient_sendFile_promise_withCompletion___block_invoke_2_cold_1((id *)(a1 + 32), v17);

    v27 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
  }
  v27();

}

void __52__DEDSeedingClient_sendFile_promise_withCompletion___block_invoke_53(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __52__DEDSeedingClient_sendFile_promise_withCompletion___block_invoke_53_cold_1(a1, v4);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __52__DEDSeedingClient_sendFile_promise_withCompletion___block_invoke_55(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __52__DEDSeedingClient_sendFile_promise_withCompletion___block_invoke_55_cold_1(a1, v4);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)getFilerTokenForPromise:(id)a3 withSuccess:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  id v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  id v29;
  _QWORD v30[3];
  _QWORD v31[3];
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x24BDD16E0];
  v11 = a3;
  -[DEDSeedingClient config](self, "config");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "numberWithInteger:", objc_msgSend(v12, "seedingSubmissionID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "UUIDString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x24BDD17C8];
  -[DEDSeedingClient config](self, "config");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "seedingSubmissionType");
  v18 = "Unknown";
  if (v17 == 2)
    v18 = "FFU";
  if (v17 == 1)
    v19 = "FR";
  else
    v19 = v18;
  objc_msgSend(v15, "stringWithUTF8String:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[DEDSeedingClient config](self, "config");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  -[DEDSeedingClient log](self, "log");
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v21 && v13 && v14 && v20)
  {
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      -[DEDSeedingClient getFilerTokenForPromise:withSuccess:error:].cold.1();

    v30[0] = CFSTR("Form_Response_ID");
    v30[1] = CFSTR("Promise_UUID");
    v31[0] = v13;
    v31[1] = v14;
    v30[2] = CFSTR("Token_Type");
    v31[2] = v20;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, v30, 3);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[DEDSeedingClient newFilerTokenURL](self, "newFilerTokenURL");
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __62__DEDSeedingClient_getFilerTokenForPromise_withSuccess_error___block_invoke;
    v27[3] = &unk_24D1E6838;
    v27[4] = self;
    v28 = v8;
    v29 = v9;
    -[DEDSeedingClient postToURL:parameters:encoding:success:error:](self, "postToURL:parameters:encoding:success:error:", v25, v24, 1, v27, v29);

  }
  else
  {
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      -[DEDSeedingClient config](self, "config");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v33 = v26;
      v34 = 2114;
      v35 = v13;
      v36 = 2114;
      v37 = v14;
      v38 = 2114;
      v39 = v20;
      _os_log_error_impl(&dword_21469E000, v23, OS_LOG_TYPE_ERROR, "Cannot get Filer Token. One of these is nil: Config: [%{public}@] Form_Response_ID:[%{public}@] UUID:[%{public}@] Type:[%{public}@]", buf, 0x2Au);

    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("FBAFilerErrorDomain"), 3, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v9 + 2))(v9, v24);
  }

}

void __62__DEDSeedingClient_getFilerTokenForPromise_withSuccess_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  DEDSeedingFilerToken *v10;
  void *v11;
  void *v12;
  void *v13;
  DEDSeedingFilerToken *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  id v19;

  v19 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", a2, 0, &v19);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v19;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v3;
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("error_code"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("token"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", &unk_24D202F98))
      v8 = v7 == 0;
    else
      v8 = 1;
    if (v8 || !objc_msgSend(v7, "length"))
    {
      objc_msgSend(*(id *)(a1 + 32), "log");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        __62__DEDSeedingClient_getFilerTokenForPromise_withSuccess_error___block_invoke_cold_1(v6, v16);

      v17 = *(_QWORD *)(a1 + 48);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("FBAFilerErrorDomain"), objc_msgSend(v6, "integerValue"), 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v9);
    }
    else
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("dsid"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = [DEDSeedingFilerToken alloc];
      v11 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(*(id *)(a1 + 32), "config");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "numberWithInteger:", objc_msgSend(v18, "seedingSubmissionID"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "config");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[DEDSeedingFilerToken initWithEntityID:type:token:dsid:](v10, "initWithEntityID:type:token:dsid:", v12, objc_msgSend(v13, "seedingSubmissionType"), v7, v9);

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }

  }
  else
  {
    v15 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("FBAFilerErrorDomain"), 2, 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v15 + 16))(v15, v5);
  }

}

- (void)dataForURLRequest:(id)a3 success:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  CFTimeInterval v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  DEDSeedingClient *v23;
  id v24;
  id v25;
  CFTimeInterval v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[DEDSeedingClient log](self, "log");
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
    v28 = v12;
    v29 = 2114;
    v30 = v14;
    _os_log_impl(&dword_21469E000, v11, OS_LOG_TYPE_INFO, "-> %{public}@ %{public}@", buf, 0x16u);

  }
  v15 = CACurrentMediaTime();
  -[DEDSeedingClient foregroundSession](self, "foregroundSession");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __52__DEDSeedingClient_dataForURLRequest_success_error___block_invoke;
  v21[3] = &unk_24D1E68B0;
  v22 = v8;
  v23 = self;
  v26 = v15;
  v24 = v10;
  v25 = v9;
  v17 = v9;
  v18 = v10;
  v19 = v8;
  objc_msgSend(v16, "dataTaskWithRequest:completionHandler:", v19, v21);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "resume");
}

void __52__DEDSeedingClient_dataForURLRequest_success_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  DEDRequestRecord *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  DEDRequestRecord *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  _QWORD block[5];
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;

  v24 = a2;
  v7 = a3;
  v8 = a4;
  v9 = v7;
  v10 = [DEDRequestRecord alloc];
  v11 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "foregroundSession");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "foregroundSession");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "configuration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "HTTPCookieStorage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "cookies");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[DEDRequestRecord initWithRequest:response:session:cookies:body:error:](v10, "initWithRequest:response:session:cookies:body:error:", v11, v9, v12, v16, v24, v8);

  +[DEDRequestAdvertiser sharedInstance](DEDRequestAdvertiser, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "broadcastRecord:", v17);

  if (v8)
  {
    v19 = _os_activity_create(&dword_21469E000, "HTTP Error", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __52__DEDSeedingClient_dataForURLRequest_success_error___block_invoke_2;
    block[3] = &unk_24D1E6860;
    block[4] = *(_QWORD *)(a1 + 40);
    v32 = v9;
    v33 = v24;
    v34 = *(id *)(a1 + 32);
    v35 = v8;
    v37 = *(_QWORD *)(a1 + 64);
    v36 = *(id *)(a1 + 48);
    os_activity_apply(v19, block);

    v20 = v32;
LABEL_7:

    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%li"), objc_msgSend(v9, "statusCode"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "characterAtIndex:", 0);

  if (v22 != 50)
  {
    v19 = _os_activity_create(&dword_21469E000, "HTTP Error", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __52__DEDSeedingClient_dataForURLRequest_success_error___block_invoke_3;
    v25[3] = &unk_24D1E6888;
    v25[4] = *(_QWORD *)(a1 + 40);
    v26 = v9;
    v27 = v24;
    v28 = *(id *)(a1 + 32);
    v30 = *(_QWORD *)(a1 + 64);
    v29 = *(id *)(a1 + 48);
    os_activity_apply(v19, v25);

    v20 = v26;
    goto LABEL_7;
  }
  +[DEDFeedbackAnalytics logEventWithRequest:httpStatusCode:nsurlErrorCode:success:startedAt:endedAt:](DEDFeedbackAnalytics, "logEventWithRequest:httpStatusCode:nsurlErrorCode:success:startedAt:endedAt:", *(_QWORD *)(a1 + 32), objc_msgSend(v9, "statusCode"), 0, 1, *(double *)(a1 + 64), CACurrentMediaTime());
  v23 = *(_QWORD *)(a1 + 56);
  if (v23)
    (*(void (**)(uint64_t, id))(v23 + 16))(v23, v24);
LABEL_8:

}

uint64_t __52__DEDSeedingClient_dataForURLRequest_success_error___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t result;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "HTTPErrorWithResponse:withData:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  +[DEDFeedbackAnalytics logEventWithRequest:httpStatusCode:nsurlErrorCode:success:startedAt:endedAt:](DEDFeedbackAnalytics, "logEventWithRequest:httpStatusCode:nsurlErrorCode:success:startedAt:endedAt:", *(_QWORD *)(a1 + 56), objc_msgSend(*(id *)(a1 + 40), "statusCode"), objc_msgSend(*(id *)(a1 + 64), "code"), 0, *(double *)(a1 + 80), CACurrentMediaTime());
  result = *(_QWORD *)(a1 + 72);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 64));
  return result;
}

void __52__DEDSeedingClient_dataForURLRequest_success_error___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "HTTPErrorWithResponse:withData:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  +[DEDFeedbackAnalytics logEventWithRequest:httpStatusCode:nsurlErrorCode:success:startedAt:endedAt:](DEDFeedbackAnalytics, "logEventWithRequest:httpStatusCode:nsurlErrorCode:success:startedAt:endedAt:", *(_QWORD *)(a1 + 56), objc_msgSend(*(id *)(a1 + 40), "statusCode"), 0, 0, *(double *)(a1 + 72), CACurrentMediaTime());
  v2 = *(_QWORD *)(a1 + 64);
  if (v2)
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

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
  _QWORD v15[5];
  id v16;
  id v17;

  v8 = a4;
  v9 = a5;
  v10 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __52__DEDSeedingClient_jsonForURLRequest_success_error___block_invoke;
  v15[3] = &unk_24D1E68D8;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __52__DEDSeedingClient_jsonForURLRequest_success_error___block_invoke_77;
  v13[3] = &unk_24D1E6900;
  v14 = v17;
  v11 = v17;
  v12 = v8;
  -[DEDSeedingClient dataForURLRequest:success:error:](self, "dataForURLRequest:success:error:", a3, v15, v13);

}

void __52__DEDSeedingClient_jsonForURLRequest_success_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  void (*v7)(void);
  id v8;

  if (*(_QWORD *)(a1 + 40))
  {
    v8 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", a2, 0, &v8);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v8;
    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "log");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        __52__DEDSeedingClient_jsonForURLRequest_success_error___block_invoke_cold_1();

      v6 = *(_QWORD *)(a1 + 48);
      if (!v6)
        goto LABEL_9;
      v7 = *(void (**)(void))(v6 + 16);
    }
    else
    {
      v7 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    }
    v7();
LABEL_9:

  }
}

uint64_t __52__DEDSeedingClient_jsonForURLRequest_success_error___block_invoke_77(uint64_t a1)
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
  -[DEDSeedingClient dataForURLRequest:success:error:](self, "dataForURLRequest:success:error:", v11, v10, v9);

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
  -[DEDSeedingClient jsonForURLRequest:success:error:](self, "jsonForURLRequest:success:error:", v11, v10, v9);

}

- (void)postToURL:(id)a3 parameters:(id)a4 encoding:(unint64_t)a5 success:(id)a6 error:(id)a7
{
  -[DEDSeedingClient performHTTPMethod:toURL:parameters:encoding:success:error:](self, "performHTTPMethod:toURL:parameters:encoding:success:error:", CFSTR("POST"), a3, a4, a5, a6, a7);
}

- (void)putToURL:(id)a3 parameters:(id)a4 encoding:(unint64_t)a5 success:(id)a6 error:(id)a7
{
  -[DEDSeedingClient performHTTPMethod:toURL:parameters:encoding:success:error:](self, "performHTTPMethod:toURL:parameters:encoding:success:error:", CFSTR("PUT"), a3, a4, a5, a6, a7);
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
  -[DEDSeedingClient dataForURLRequest:success:error:](self, "dataForURLRequest:success:error:", v11, v10, v9);

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
  -[DEDSeedingClient bodyDataForParameters:encoding:error:](self, "bodyDataForParameters:encoding:error:", v17, a6, &v28);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = v28;
  if (v20)
  {
    objc_msgSend(v19, "setHTTPBody:", v20);
    -[DEDSeedingClient contentTypeForParameterEncoding:](self, "contentTypeForParameterEncoding:", a6);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setValue:forHTTPHeaderField:", v22, CFSTR("Content-Type"));

  }
  if (v21)
  {
    -[DEDSeedingClient log](self, "log");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[DEDSeedingClient performHTTPMethod:toURL:parameters:encoding:success:error:].cold.1();

    dispatch_get_global_queue(0, 0);
    v24 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __78__DEDSeedingClient_performHTTPMethod_toURL_parameters_encoding_success_error___block_invoke;
    block[3] = &unk_24D1E4628;
    v27 = v15;
    v26 = v21;
    dispatch_async(v24, block);

  }
  else
  {
    -[DEDSeedingClient dataForURLRequest:success:error:](self, "dataForURLRequest:success:error:", v19, v14, v15);
  }

}

uint64_t __78__DEDSeedingClient_performHTTPMethod_toURL_parameters_encoding_success_error___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (id)beginUploadWithRequest:(id)a3 fromFileURL:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  int v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v20 = 0;
  v10 = objc_msgSend(v9, "checkResourceIsReachableAndReturnError:", &v20);
  v11 = v20;
  v12 = v11;
  if (!v10 || v11)
  {
    -[DEDSeedingClient log](self, "log");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      -[DEDSeedingClient beginUploadWithRequest:fromFileURL:error:].cold.1((uint64_t)v9, v12, v18);

    v14 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v12);
  }
  else
  {
    -[DEDSeedingClient backgroundSession](self, "backgroundSession");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "uploadTaskWithRequest:fromFile:", v8, v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[DEDSeedingClient log](self, "log");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = objc_msgSend(v14, "taskIdentifier");
      -[DEDSeedingClient bugSessionIdentifier](self, "bugSessionIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v22 = v16;
      v23 = 2114;
      v24 = v17;
      _os_log_impl(&dword_21469E000, v15, OS_LOG_TYPE_DEFAULT, "Beginning upload task with identifier [%lu] for session [%{public}@]", buf, 0x16u);

    }
    objc_msgSend(v14, "resume");
  }

  return v14;
}

- (id)ongoingUploads
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  dispatch_time_t v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  NSObject *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 5);
  -[DEDSeedingClient backgroundSession](self, "backgroundSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __34__DEDSeedingClient_ongoingUploads__block_invoke;
  v13[3] = &unk_24D1E6928;
  v6 = v4;
  v14 = v6;
  v16 = &v17;
  v7 = v3;
  v15 = v7;
  objc_msgSend(v5, "getAllTasksWithCompletionHandler:", v13);

  v8 = dispatch_time(0, 2000000000);
  dispatch_group_wait(v7, v8);
  if (!*((_BYTE *)v18 + 24))
  {
    -[DEDSeedingClient log](self, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[DEDSeedingClient ongoingUploads].cold.1(v9);

  }
  v10 = v15;
  v11 = v6;

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __34__DEDSeedingClient_ongoingUploads__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", a2);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)cleanup
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[DEDSeedingClient backgroundSession](self, "backgroundSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidateAndCancel");

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[DEDSeedingClient foregroundSession](self, "foregroundSession", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "HTTPCookieStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cookies");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v11);
        -[DEDSeedingClient foregroundSession](self, "foregroundSession");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "configuration");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "HTTPCookieStorage");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "deleteCookie:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

}

- (void)makePromiseWithUUID:(id)a3 extensionID:(id)a4 success:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;
  _QWORD v29[5];
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_alloc(MEMORY[0x24BDBCED8]);
  -[DEDSeedingClient promiseConfiguration](self, "promiseConfiguration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithDictionary:", v15);

  objc_msgSend(v10, "UUIDString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v17, CFSTR("uuid"));

  if (v11)
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v11, CFSTR("de_bundle_identifier"));
  -[DEDSeedingClient log](self, "log");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "UUIDString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v36 = v19;
    v37 = 2114;
    v38 = v11;
    _os_log_impl(&dword_21469E000, v18, OS_LOG_TYPE_DEFAULT, "will make promise with uuid: [%{public}@] extension: [%{public}@]", buf, 0x16u);

  }
  v20 = MEMORY[0x24BDAC760];
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __66__DEDSeedingClient_makePromiseWithUUID_extensionID_success_error___block_invoke;
  v29[3] = &unk_24D1E6978;
  v29[4] = self;
  v30 = v16;
  v31 = v10;
  v32 = v11;
  v33 = v12;
  v34 = v13;
  v26[0] = v20;
  v26[1] = 3221225472;
  v26[2] = __66__DEDSeedingClient_makePromiseWithUUID_extensionID_success_error___block_invoke_93;
  v26[3] = &unk_24D1E6810;
  v26[4] = self;
  v27 = v30;
  v28 = v34;
  v21 = v34;
  v22 = v30;
  v23 = v12;
  v24 = v11;
  v25 = v10;
  -[DEDSeedingClient seedingLoginWithSuccess:error:](self, "seedingLoginWithSuccess:error:", v29, v26);

}

void __66__DEDSeedingClient_makePromiseWithUUID_extensionID_success_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)objc_msgSend(v2, "newFilePromiseURL");
  v4 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __66__DEDSeedingClient_makePromiseWithUUID_extensionID_success_error___block_invoke_2;
  v8[3] = &unk_24D1E6950;
  v5 = *(_QWORD *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 56);
  v11 = *(id *)(a1 + 64);
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __66__DEDSeedingClient_makePromiseWithUUID_extensionID_success_error___block_invoke_92;
  v6[3] = &unk_24D1E67C0;
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = *(id *)(a1 + 72);
  objc_msgSend(v2, "postToURL:parameters:encoding:success:error:", v3, v5, 2, v8, v6);

}

uint64_t __66__DEDSeedingClient_makePromiseWithUUID_extensionID_success_error___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t result;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 40), "UUIDString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 48);
    v6 = 138543618;
    v7 = v3;
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_21469E000, v2, OS_LOG_TYPE_INFO, "did make promise with uuid: [%{public}@] extension: [%{public}@]", (uint8_t *)&v6, 0x16u);

  }
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __66__DEDSeedingClient_makePromiseWithUUID_extensionID_success_error___block_invoke_92(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __66__DEDSeedingClient_makePromiseWithUUID_extensionID_success_error___block_invoke_92_cold_1(v3, v4);

  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __66__DEDSeedingClient_makePromiseWithUUID_extensionID_success_error___block_invoke_93(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __66__DEDSeedingClient_makePromiseWithUUID_extensionID_success_error___block_invoke_93_cold_1(a1, v4, v5);

  }
  v6 = *(_QWORD *)(a1 + 48);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);

}

- (void)getPromise:(id)a3 withSuccess:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __49__DEDSeedingClient_getPromise_withSuccess_error___block_invoke;
  v18[3] = &unk_24D1E69C8;
  v18[4] = self;
  v19 = v8;
  v20 = v9;
  v21 = v10;
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __49__DEDSeedingClient_getPromise_withSuccess_error___block_invoke_4;
  v15[3] = &unk_24D1E6810;
  v15[4] = self;
  v16 = v19;
  v17 = v21;
  v12 = v21;
  v13 = v19;
  v14 = v9;
  -[DEDSeedingClient seedingLoginWithSuccess:error:](self, "seedingLoginWithSuccess:error:", v18, v15);

}

void __49__DEDSeedingClient_getPromise_withSuccess_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "filePromiseURLForPromise:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49__DEDSeedingClient_getPromise_withSuccess_error___block_invoke_2;
  v7[3] = &unk_24D1E69A0;
  v8 = *(id *)(a1 + 48);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __49__DEDSeedingClient_getPromise_withSuccess_error___block_invoke_3;
  v5[3] = &unk_24D1E6900;
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v2, "jsonForURL:success:error:", v3, v7, v5);

}

uint64_t __49__DEDSeedingClient_getPromise_withSuccess_error___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __49__DEDSeedingClient_getPromise_withSuccess_error___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __49__DEDSeedingClient_getPromise_withSuccess_error___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __49__DEDSeedingClient_getPromise_withSuccess_error___block_invoke_4_cold_1(a1, v4);

  }
  v5 = *(_QWORD *)(a1 + 48);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

- (void)updatePromise:(id)a3 withAttachmentGroup:(id)a4 status:(int64_t)a5 success:(id)a6 error:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;

  v12 = a7;
  v13 = a6;
  v14 = a4;
  v15 = a3;
  objc_msgSend(v14, "archiveName");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "totalFileSize");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "integerValue");

  objc_msgSend(v14, "extensionID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[DEDSeedingClient updatePromise:withFilename:size:extensionID:status:success:error:](self, "updatePromise:withFilename:size:extensionID:status:success:error:", v15, v19, v17, v18, a5, v13, v12);
}

- (void)updatePromise:(id)a3 withFilename:(id)a4 size:(int64_t)a5 status:(int64_t)a6 success:(id)a7 error:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;

  v14 = a4;
  v15 = a8;
  v16 = a7;
  v17 = a3;
  -[DEDSeedingClient log](self, "log");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    -[DEDSeedingClient updatePromise:withFilename:size:status:success:error:].cold.1((uint64_t)v14, v18);

  -[DEDSeedingClient updatePromise:withFilename:size:extensionID:status:success:error:](self, "updatePromise:withFilename:size:extensionID:status:success:error:", v17, v14, a5, 0, a6, v16, v15);
}

- (void)updatePromise:(id)a3 withFilename:(id)a4 size:(int64_t)a5 extensionID:(id)a6 status:(int64_t)a7 success:(id)a8 error:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  void *v20;
  const char *v21;
  void *v22;
  void *v23;
  const char *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  id v30;
  _QWORD v32[5];
  id v33;
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  DEDSeedingClient *v40;
  id v41;
  id v42;
  id v43;
  int64_t v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  id v48;
  __int16 v49;
  const char *v50;
  __int16 v51;
  id v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a8;
  v18 = a9;
  -[DEDSeedingClient log](self, "log");
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v29 = v14;
    v30 = v17;
    objc_msgSend(v14, "UUIDString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = "user_canceled";
    switch(a7)
    {
      case 0:
        break;
      case 1:
        v21 = "promised";
        break;
      case 2:
        v21 = "collected";
        break;
      case 3:
        v21 = "uploading";
        break;
      case 4:
        v21 = "uploaded";
        break;
      case 5:
        v21 = "received";
        break;
      case 6:
        v21 = "virus_scanning";
        break;
      case 7:
        v21 = "analyzing:";
        break;
      case 8:
        v21 = "done";
        break;
      case 9:
      case 10:
      case 11:
      case 12:
        goto LABEL_6;
      case 13:
        v21 = "deleted";
        break;
      case 14:
        v21 = "user_delete_requested";
        break;
      case 15:
        v21 = "user_deleted";
        break;
      default:
        if (a7 == 99)
          v21 = "upload_error";
        else
LABEL_6:
          v21 = "Unknown";
        break;
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", a5);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v46 = v20;
    v47 = 2114;
    v48 = v16;
    v49 = 2082;
    v50 = v21;
    v51 = 2114;
    v52 = v15;
    v53 = 2114;
    v54 = v22;
    _os_log_impl(&dword_21469E000, v19, OS_LOG_TYPE_DEFAULT, "Will update [%{public}@ | %{public}@ ] with status [%{public}s] filename [%{public}@] file size [%{public}@]", buf, 0x34u);

    v14 = v29;
    v17 = v30;
  }

  if (v14)
  {
    v23 = v15;
    v24 = "user_canceled";
    switch(a7)
    {
      case 0:
        break;
      case 1:
        v24 = "promised";
        break;
      case 2:
        v24 = "collected";
        break;
      case 3:
        v24 = "uploading";
        break;
      case 4:
        v24 = "uploaded";
        break;
      case 5:
        v24 = "received";
        break;
      case 6:
        v24 = "virus_scanning";
        break;
      case 7:
        v24 = "analyzing:";
        break;
      case 8:
        v24 = "done";
        break;
      case 9:
      case 10:
      case 11:
      case 12:
        goto LABEL_26;
      case 13:
        v24 = "deleted";
        break;
      case 14:
        v24 = "user_delete_requested";
        break;
      case 15:
        v24 = "user_deleted";
        break;
      default:
        if (a7 == 99)
          v24 = "upload_error";
        else
LABEL_26:
          v24 = "Unknown";
        break;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v24);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = MEMORY[0x24BDAC760];
    v36[0] = MEMORY[0x24BDAC760];
    v36[1] = 3221225472;
    v36[2] = __85__DEDSeedingClient_updatePromise_withFilename_size_extensionID_status_success_error___block_invoke;
    v36[3] = &unk_24D1E6A18;
    v37 = v15;
    v38 = v16;
    v44 = a5;
    v26 = v14;
    v39 = v14;
    v40 = self;
    v41 = v27;
    v42 = v17;
    v43 = v18;
    v32[0] = v28;
    v32[1] = 3221225472;
    v32[2] = __85__DEDSeedingClient_updatePromise_withFilename_size_extensionID_status_success_error___block_invoke_105;
    v32[3] = &unk_24D1E6A40;
    v32[4] = self;
    v33 = v39;
    v34 = v41;
    v35 = v43;
    v25 = v41;
    -[DEDSeedingClient seedingLoginWithSuccess:error:](self, "seedingLoginWithSuccess:error:", v36, v32);

  }
  else
  {
    -[DEDSeedingClient log](self, "log");
    v25 = objc_claimAutoreleasedReturnValue();
    v23 = v15;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[DEDSeedingClient updatePromise:withFilename:size:extensionID:status:success:error:].cold.1();
    v26 = 0;
  }

}

void __85__DEDSeedingClient_updatePromise_withFilename_size_extensionID_status_success_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  int8x16_t v19;
  _QWORD v20[5];
  id v21;
  id v22;
  _QWORD v23[4];
  int8x16_t v24;
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  uint64_t v31;
  _QWORD v32[2];
  _QWORD v33[3];

  v33[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("name"));
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("de_bundle_identifier"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", *(_QWORD *)(a1 + 88));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("size"));

  objc_msgSend(*(id *)(a1 + 48), "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("uuid"));

  objc_msgSend(*(id *)(a1 + 56), "promiseConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v8);

  v9 = *(_QWORD *)(a1 + 64);
  v32[0] = CFSTR("status");
  v32[1] = CFSTR("options");
  v33[0] = v9;
  v33[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "log");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 48), "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1 + 64);
    *(_DWORD *)buf = 138543618;
    v29 = v12;
    v30 = 2114;
    v31 = v13;
    _os_log_impl(&dword_21469E000, v11, OS_LOG_TYPE_INFO, "will update promise [%{public}@] with status [%{public}@]", buf, 0x16u);

  }
  v14 = *(void **)(a1 + 56);
  objc_msgSend(v14, "filePromiseURLForPromise:", *(_QWORD *)(a1 + 48));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x24BDAC760];
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __85__DEDSeedingClient_updatePromise_withFilename_size_extensionID_status_success_error___block_invoke_103;
  v23[3] = &unk_24D1E69F0;
  v19 = *(int8x16_t *)(a1 + 48);
  v17 = (id)v19.i64[0];
  v24 = vextq_s8(v19, v19, 8uLL);
  v25 = *(id *)(a1 + 64);
  v26 = *(id *)(a1 + 32);
  v27 = *(id *)(a1 + 72);
  v20[0] = v16;
  v20[1] = 3221225472;
  v20[2] = __85__DEDSeedingClient_updatePromise_withFilename_size_extensionID_status_success_error___block_invoke_104;
  v20[3] = &unk_24D1E6810;
  v18 = *(void **)(a1 + 64);
  v20[4] = *(_QWORD *)(a1 + 56);
  v21 = v18;
  v22 = *(id *)(a1 + 80);
  objc_msgSend(v14, "putToURL:parameters:encoding:success:error:", v15, v10, 2, v23, v20);

}

uint64_t __85__DEDSeedingClient_updatePromise_withFilename_size_extensionID_status_success_error___block_invoke_103(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "UUIDString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 48);
    v5 = *(_QWORD *)(a1 + 56);
    v7 = 138543874;
    v8 = v3;
    v9 = 2114;
    v10 = v4;
    v11 = 2114;
    v12 = v5;
    _os_log_impl(&dword_21469E000, v2, OS_LOG_TYPE_DEFAULT, "did update promise [%{public}@] [%{public}@] [%{public}@]", (uint8_t *)&v7, 0x20u);

  }
  result = *(_QWORD *)(a1 + 64);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __85__DEDSeedingClient_updatePromise_withFilename_size_extensionID_status_success_error___block_invoke_104(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __85__DEDSeedingClient_updatePromise_withFilename_size_extensionID_status_success_error___block_invoke_104_cold_1(a1, v3);

  v5 = *(_QWORD *)(a1 + 48);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __85__DEDSeedingClient_updatePromise_withFilename_size_extensionID_status_success_error___block_invoke_105(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __85__DEDSeedingClient_updatePromise_withFilename_size_extensionID_status_success_error___block_invoke_105_cold_1(a1);

  }
  v5 = *(_QWORD *)(a1 + 56);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

- (void)cancelPromise:(id)a3 withSuccess:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = a4;
  -[DEDSeedingClient log](self, "log");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543362;
    v14 = v12;
    _os_log_impl(&dword_21469E000, v11, OS_LOG_TYPE_DEFAULT, "Will cancel promise [%{public}@]", (uint8_t *)&v13, 0xCu);

  }
  -[DEDSeedingClient updatePromise:withFilename:size:status:success:error:](self, "updatePromise:withFilename:size:status:success:error:", v8, &stru_24D1E6AF0, 0, 0, v10, v9);

}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[DEDSeedingClient log](self, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[DEDSeedingClient URLSession:didBecomeInvalidWithError:].cold.1(v6);
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v6, "configuration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543362;
    v13 = v11;
    _os_log_impl(&dword_21469E000, v9, OS_LOG_TYPE_INFO, "URL Session [%{public}@] became invalid", (uint8_t *)&v12, 0xCu);

  }
}

- (void)URLSessionDidFinishEventsForBackgroundURLSession:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[DEDSeedingClient log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "configuration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_21469E000, v5, OS_LOG_TYPE_INFO, "did finish event for URL Session [%{public}@]", (uint8_t *)&v8, 0xCu);

  }
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t, _QWORD);
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  uint64_t AppleSSLPinned;
  const void *v29;
  void *v30;
  __SecTrust *v31;
  void *v32;
  int v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, _QWORD))a5;
  -[DEDSeedingClient log](self, "log");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "configuration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 138543362;
    v34 = v13;
    _os_log_impl(&dword_21469E000, v11, OS_LOG_TYPE_DEFAULT, "URL Session [%{public}@] did receive challenge", (uint8_t *)&v33, 0xCu);

  }
  -[DEDSeedingClient config](self, "config");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "seedingEnvironment");

  if (v15 == 4)
  {
    -[DEDSeedingClient log](self, "log");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v33) = 0;
      v17 = "Running in development mode; skipping pinning check.";
LABEL_15:
      _os_log_impl(&dword_21469E000, v16, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v33, 2u);
      goto LABEL_16;
    }
    goto LABEL_16;
  }
  objc_msgSend(v9, "protectionSpace");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "host");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDSeedingClient baseURL](self, "baseURL");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "host");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v19, "isEqualToString:", v21);

  if ((v22 & 1) == 0)
  {
    -[DEDSeedingClient log](self, "log");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v33) = 0;
      v17 = "Connecting to other server; skipping pinning check.";
      goto LABEL_15;
    }
LABEL_16:

    goto LABEL_17;
  }
  objc_msgSend(v9, "protectionSpace");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "authenticationMethod");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "isEqualToString:", *MEMORY[0x24BDD12F8]);

  if (!v25)
  {
LABEL_17:
    v10[2](v10, 1, 0);
    goto LABEL_18;
  }
  -[DEDSeedingClient baseURL](self, "baseURL");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "host");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  AppleSSLPinned = SecPolicyCreateAppleSSLPinned();
  if (!AppleSSLPinned)
    goto LABEL_11;
  v29 = (const void *)AppleSSLPinned;
  objc_msgSend(v9, "protectionSpace");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (__SecTrust *)objc_msgSend(v30, "serverTrust");

  LODWORD(v30) = SecTrustSetPolicies(v31, v29);
  CFRelease(v29);
  if ((_DWORD)v30)
    goto LABEL_11;
  v33 = 0;
  if (!MEMORY[0x2199D3E60](v31, &v33) && (v33 == 4 || v33 == 1))
  {
    objc_msgSend(MEMORY[0x24BDD1818], "credentialForTrust:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, uint64_t, void *))v10)[2](v10, 0, v32);

  }
  else
  {
LABEL_11:
    v10[2](v10, 2, 0);
  }

LABEL_18:
}

- (id)_serverErrorFromTask:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;

  v4 = a3;
  objc_msgSend(v4, "response");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "statusCode");

  -[DEDSeedingClient log](self, "log");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[DEDSeedingClient _serverErrorFromTask:].cold.2();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%li"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "characterAtIndex:", 0);

  v10 = 0;
  if (v9 != 50)
  {
    v11 = (void *)objc_opt_new();
    objc_msgSend(v4, "originalRequest");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "valueForHTTPHeaderField:", CFSTR("Form_Response_ID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, CFSTR("Form_Response_ID"));
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("HTTPErrorDomain"), v6, v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEDSeedingClient log](self, "log");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[DEDSeedingClient _serverErrorFromTask:].cold.1((uint64_t)v13, v6, v14);

  }
  return v10;
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v7;
  unint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _BYTE v20[12];
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = (unint64_t)a5;
  -[DEDSeedingClient _serverErrorFromTask:](self, "_serverErrorFromTask:", v7);
  v9 = objc_claimAutoreleasedReturnValue();
  -[DEDSeedingClient log](self, "log");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v8 | v9)
  {
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_10;
    v12 = objc_msgSend(v7, "taskIdentifier");
    -[DEDSeedingClient bugSessionIdentifier](self, "bugSessionIdentifier");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    *(_DWORD *)v20 = 134218498;
    if (v8)
      v15 = v8;
    else
      v15 = v9;
    *(_QWORD *)&v20[4] = v12;
    v21 = 2114;
    v22 = v13;
    v23 = 2114;
    v24 = v15;
    _os_log_error_impl(&dword_21469E000, v11, OS_LOG_TYPE_ERROR, "Upload task [%lu] for session [%{public}@] completed with error %{public}@", v20, 0x20u);
  }
  else
  {
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_10;
    v16 = objc_msgSend(v7, "taskIdentifier");
    -[DEDSeedingClient bugSessionIdentifier](self, "bugSessionIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v20 = 134218242;
    *(_QWORD *)&v20[4] = v16;
    v21 = 2114;
    v22 = (uint64_t)v14;
    _os_log_impl(&dword_21469E000, v11, OS_LOG_TYPE_DEFAULT, "Upload task [%lu] completed successfully for session [%{public}@]", v20, 0x16u);
  }

LABEL_10:
  -[DEDSeedingClient uploadDelegate](self, "uploadDelegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v8)
    v19 = v8;
  else
    v19 = v9;
  objc_msgSend(v17, "uploadTask:didCompleteWithError:", v7, v19, *(_QWORD *)v20);

}

- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7
{
  id v10;
  id v11;

  v10 = a4;
  -[DEDSeedingClient uploadDelegate](self, "uploadDelegate");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "uploadTask:didSendBytes:totalBytesExpectedToSend:", v10, a6, a7);

}

- (id)baseURL
{
  void *v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  -[DEDSeedingClient config](self, "config");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "seedingEnvironment");

  if ((unint64_t)(v4 - 2) > 3)
  {
    v6 = CFSTR("https://fba.apple.com/");
  }
  else
  {
    -[DEDSeedingClient config](self, "config");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "seedingHost");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7 || (objc_msgSend(v7, "host"), v9 = (void *)objc_claimAutoreleasedReturnValue(), v9, !v9))
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("https://fba.apple.com/"));
    v10 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v10;
  }

  return v8;
}

- (id)seedingURL
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;

  -[DEDSeedingClient config](self, "config");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "seedingEnvironment");

  if (v4 < 4 || v4 == 5)
  {
    -[DEDSeedingClient baseURL](self, "baseURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("sp"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (v4 == 4)
  {
    -[DEDSeedingClient baseURL](self, "baseURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)loginWithTokenURL
{
  void *v2;
  void *v3;

  -[DEDSeedingClient seedingURL](self, "seedingURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("login/with_token"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)newFilePromiseURL
{
  void *v2;
  void *v3;

  -[DEDSeedingClient seedingURL](self, "seedingURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("feedback/file_promise/new"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)filePromiseURLForPromise:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[DEDSeedingClient seedingURL](self, "seedingURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v4, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringWithFormat:", CFSTR("feedback/file_promise/%@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)newFilerTokenURL
{
  void *v2;
  void *v3;

  -[DEDSeedingClient seedingURL](self, "seedingURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("feedback/filer/get_token"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)filerURL
{
  void *v3;
  __CFString *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint8_t v11[16];

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringForKey:", CFSTR("FBAFilerURL"));
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v4 && -[__CFString length](v4, "length"))
  {
    -[DEDSeedingClient log](self, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_21469E000, v5, OS_LOG_TYPE_INFO, "Using user default value for filer URL", v11, 2u);
    }

  }
  else
  {
    -[DEDSeedingClient config](self, "config");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "seedingEnvironment") == 3)
    {

    }
    else
    {
      -[DEDSeedingClient config](self, "config");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "seedingEnvironment");

      if (v8 != 4)
      {

        v4 = CFSTR("https://cssubmissions.apple.com/CusSeedSub/submit?version=2");
        goto LABEL_11;
      }
    }

    v4 = CFSTR("https://cssubmissions-uat.corp.apple.com/CusSeedSub/submit?version=2");
  }
LABEL_11:
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)HTTPErrorWithResponse:(id)a3 withData:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  __CFString *v9;
  id v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "allHeaderFields");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Content-Type"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "containsString:", CFSTR("application/json"))
    && objc_msgSend(v5, "statusCode") != 404)
  {
    v9 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v6, 4);
  }
  else
  {
    v9 = 0;
  }

  v10 = objc_alloc(MEMORY[0x24BDBCED8]);
  if (v9)
    v11 = v9;
  else
    v11 = &stru_24D1E6AF0;
  v19 = CFSTR("body");
  v20[0] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v10, "initWithDictionary:", v12);

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v5, "statusCode"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, CFSTR("HTTP Status Code"));

    objc_msgSend(v5, "URL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v5, "URL");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v16, CFSTR("URL"));

    }
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("HTTPErrorDomain"), objc_msgSend(v5, "statusCode"), v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)promiseConfiguration
{
  void *v3;
  void *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  _QWORD v18[5];

  v18[4] = *MEMORY[0x24BDAC8D0];
  v17[0] = CFSTR("parent_type");
  v3 = (void *)MEMORY[0x24BDD17C8];
  -[DEDSeedingClient config](self, "config");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "seedingSubmissionType");
  v6 = "Unknown";
  if (v5 == 2)
    v6 = "FeedbackFollowup";
  if (v5 == 1)
    v7 = "FormResponse";
  else
    v7 = v6;
  objc_msgSend(v3, "stringWithUTF8String:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v8;
  v17[1] = CFSTR("parent_id");
  v9 = (void *)MEMORY[0x24BDD16E0];
  -[DEDSeedingClient config](self, "config");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "numberWithInteger:", objc_msgSend(v10, "seedingSubmissionID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v11;
  v17[2] = CFSTR("device_udid");
  +[DEDUtils uniqueDeviceSpecifier](DEDUtils, "uniqueDeviceSpecifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v12;
  v17[3] = CFSTR("build");
  +[DEDDevice currentDevice](DEDDevice, "currentDevice");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "build");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
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
      -[DEDSeedingClient _formEncodedBodyForDictionary:](self, "_formEncodedBodyForDictionary:", v8);
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
        objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR(":/?#[]@!$&'(void)*+,;="));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "invertedSet");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringByAddingPercentEncodingWithAllowedCharacters:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[DEDSeedingClient _keyValuePairsForKey:value:](self, "_keyValuePairsForKey:value:", v18, v14);
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
          -[DEDSeedingClient _keyValuePairsForKey:value:](self, "_keyValuePairsForKey:value:", v23, v24);
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
          -[DEDSeedingClient _keyValuePairsForKey:value:](self, "_keyValuePairsForKey:value:", v12, *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * j));
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

- (BOOL)isLoggedIn
{
  void *v3;
  uint64_t v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  BOOL v20;
  NSObject *v21;
  void *v22;
  DEDSeedingClient *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  const __CFString *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  -[DEDSeedingClient config](self, "config");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "seedingEnvironment");

  if (v4 == 3)
    v5 = CFSTR("_seedportal_session_uat");
  else
    v5 = CFSTR("_seedportal_session");
  -[DEDSeedingClient foregroundSession](self, "foregroundSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "HTTPCookieStorage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[DEDSeedingClient baseURL](self, "baseURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cookiesForURL:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v11)
  {
    v12 = v11;
    v24 = self;
    v13 = *(_QWORD *)v26;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v26 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v15, "expiresDate", v24);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v17, "compare:", v16) == -1)
        {
          objc_msgSend(v15, "name");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "isEqualToString:", v5);

          if (v19)
          {
            -[DEDSeedingClient log](v24, "log");
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              -[DEDSeedingClient baseURL](v24, "baseURL");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v30 = v22;
              v31 = 2114;
              v32 = v5;
              _os_log_impl(&dword_21469E000, v21, OS_LOG_TYPE_INFO, "has valid cookie from [%{public}@] name [%{public}@]", buf, 0x16u);

            }
            v20 = 1;
            goto LABEL_18;
          }
        }

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      if (v12)
        continue;
      break;
    }
    v20 = 0;
  }
  else
  {
    v20 = 0;
  }
LABEL_18:

  return v20;
}

- (OS_os_log)log
{
  return (OS_os_log *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLog:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (DEDBugSessionConfiguration)config
{
  return (DEDBugSessionConfiguration *)objc_getProperty(self, a2, 16, 1);
}

- (void)setConfig:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (DEDSeedingClientDelegate)uploadDelegate
{
  return (DEDSeedingClientDelegate *)objc_loadWeakRetained((id *)&self->_uploadDelegate);
}

- (void)setUploadDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_uploadDelegate, a3);
}

- (NSURLSession)foregroundSession
{
  return (NSURLSession *)objc_getProperty(self, a2, 32, 1);
}

- (void)setForegroundSession:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)bugSessionIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setBugSessionIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSURLSession)backgroundSession
{
  return (NSURLSession *)objc_getProperty(self, a2, 48, 1);
}

- (void)setBackgroundSession:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundSession, 0);
  objc_storeStrong((id *)&self->_bugSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_foregroundSession, 0);
  objc_destroyWeak((id *)&self->_uploadDelegate);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

- (void)initWithConfiguration:(uint64_t *)a1 sessionID:(NSObject *)a2 delegate:(uint64_t)a3 .cold.1(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = 138543362;
  v5 = v3;
  OUTLINED_FUNCTION_2_1(&dword_21469E000, a2, a3, "Started session [%{public}@] with nil config!", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

void __50__DEDSeedingClient_seedingLoginWithSuccess_error___block_invoke_35_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_1(&dword_21469E000, v0, v1, "Error logging in: [%{public}@]", v2);
  OUTLINED_FUNCTION_1();
}

void __52__DEDSeedingClient_sendFile_promise_withCompletion___block_invoke_2_cold_1(id *a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  objc_msgSend(*a1, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_2_0(&dword_21469E000, v5, v6, "Error creating upload task for promise [%{public}@]. Error: %{public}@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_4();
}

void __52__DEDSeedingClient_sendFile_promise_withCompletion___block_invoke_53_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  objc_msgSend((id)OUTLINED_FUNCTION_10_0(a1), "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_1(&dword_21469E000, a2, v4, "Error getting token to upload promise: [%{public}@]", v5);

  OUTLINED_FUNCTION_1_2();
}

void __52__DEDSeedingClient_sendFile_promise_withCompletion___block_invoke_55_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  objc_msgSend((id)OUTLINED_FUNCTION_10_0(a1), "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_1(&dword_21469E000, a2, v4, "Error logging in to upload promise: [%{public}@]", v5);

  OUTLINED_FUNCTION_1_2();
}

- (void)getFilerTokenForPromise:withSuccess:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_21469E000, v0, v1, "Getting Filer Token for promise UUID [%{public}@]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __62__DEDSeedingClient_getFilerTokenForPromise_withSuccess_error___block_invoke_cold_1(void *a1, NSObject *a2)
{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109120;
  v3[1] = objc_msgSend(a1, "intValue");
  _os_log_error_impl(&dword_21469E000, a2, OS_LOG_TYPE_ERROR, "Failed to get Filer Token with error code [%i]", (uint8_t *)v3, 8u);
  OUTLINED_FUNCTION_1();
}

void __52__DEDSeedingClient_jsonForURLRequest_success_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_1(&dword_21469E000, v0, v1, "Could not create object from JSON data. Error %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)performHTTPMethod:toURL:parameters:encoding:success:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_1(&dword_21469E000, v0, v1, "performHTTPMethod failed with error %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)beginUploadWithRequest:(uint64_t)a1 fromFileURL:(void *)a2 error:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "localizedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = a1;
  OUTLINED_FUNCTION_7_0();
  _os_log_fault_impl(&dword_21469E000, a3, OS_LOG_TYPE_FAULT, "File [%{public}@] doesn't exist on disk. Not creating upload task. Error: %{public}@", (uint8_t *)&v6, 0x16u);

  OUTLINED_FUNCTION_4();
}

- (void)ongoingUploads
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21469E000, log, OS_LOG_TYPE_ERROR, "Failed to get upload tasks. Timed out.", v1, 2u);
}

void __66__DEDSeedingClient_makePromiseWithUUID_extensionID_success_error___block_invoke_92_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_1(&dword_21469E000, a2, v4, "make promise failed with error [%{public}@]", v5);

  OUTLINED_FUNCTION_1_2();
}

void __66__DEDSeedingClient_makePromiseWithUUID_extensionID_success_error___block_invoke_93_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = 138543362;
  v5 = v3;
  OUTLINED_FUNCTION_2_1(&dword_21469E000, a2, a3, "Error logging in to make promise with configuration [%{public}@]", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

void __49__DEDSeedingClient_getPromise_withSuccess_error___block_invoke_4_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  objc_msgSend((id)OUTLINED_FUNCTION_10_0(a1), "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_1(&dword_21469E000, a2, v4, "Error logging in to get promise: [%{public}@]", v5);

  OUTLINED_FUNCTION_1_2();
}

- (void)updatePromise:(uint64_t)a1 withFilename:(NSObject *)a2 size:status:success:error:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "-[DEDSeedingClient updatePromise:withFilename:size:status:success:error:]";
  v4 = 2112;
  v5 = a1;
  _os_log_debug_impl(&dword_21469E000, a2, OS_LOG_TYPE_DEBUG, "%s: %@", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)updatePromise:withFilename:size:extensionID:status:success:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_1(&dword_21469E000, v0, v1, "nil uuid promise for file [%{public}@] cannot update", v2);
  OUTLINED_FUNCTION_1();
}

void __85__DEDSeedingClient_updatePromise_withFilename_size_extensionID_status_success_error___block_invoke_104_cold_1(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(a2, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0(&dword_21469E000, v2, v3, "update promise to [%{public}@] failed with error [%{public}@]", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_4();
}

void __85__DEDSeedingClient_updatePromise_withFilename_size_extensionID_status_success_error___block_invoke_105_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_10_0(a1), "UUIDString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_2_0(&dword_21469E000, v2, v3, "Error logging in to update promise: [%{public}@] with status [%{public}@]", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4();
}

- (void)URLSession:(void *)a1 didBecomeInvalidWithError:.cold.1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a1, "configuration");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_2_0(&dword_21469E000, v3, v4, "URL Session [%{public}@] became invalid with error %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_4();
}

- (void)_serverErrorFromTask:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 134218242;
  v4 = a2;
  v5 = 2114;
  v6 = a1;
  OUTLINED_FUNCTION_1_3(&dword_21469E000, a3, (uint64_t)a3, "did complete upload with HTTP error [%ld] for upload identifier [%{public}@]", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

- (void)_serverErrorFromTask:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_21469E000, v0, v1, "session task returned [%li] status code", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)HTTPErrorWithResponse:withData:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_9_1();
  v3 = v0;
  OUTLINED_FUNCTION_1_3(&dword_21469E000, v1, (uint64_t)v1, "Exception [%{public}@] decoding HTTP error for response [%{public}@]", v2);
  OUTLINED_FUNCTION_1();
}

@end

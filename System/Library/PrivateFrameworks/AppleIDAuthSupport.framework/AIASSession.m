@implementation AIASSession

- (AIASSession)init
{
  AIASSession *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AIASSession;
  v2 = -[AIASSession init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIASSession setTaskMap:](v2, "setTaskMap:", v3);

    -[AIASSession setInvalidated:](v2, "setInvalidated:", 0);
  }
  return v2;
}

- (id)getRequest:(id)a3
{
  id v4;
  AIASSession *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[AIASSession taskMap](v5, "taskMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v4, "taskIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v5);
  return v8;
}

- (id)requestWithURL:(id)a3 data:(__CFDictionary *)a4 clientInfo:(id)a5 proxiedClientInfo:(id)a6 companionClientInfo:(id)a7 appleITeamId:(id)a8 appleIClientId:(id)a9 additionalHeaders:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  AIASRequest *v23;
  id v24;
  void *v25;
  void *v26;
  AIASRequest *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  AIASSession *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  AIASRequest *v37;
  id v39;
  void *v40;

  v16 = a3;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  v23 = [AIASRequest alloc];
  v40 = v17;
  v24 = v17;
  v25 = v18;
  v26 = v19;
  v27 = -[AIASRequest initWithURL:data:clientInfo:proxiedClientInfo:companionClientInfo:appleITeamId:appleIClientId:additionalHeaders:](v23, "initWithURL:data:clientInfo:proxiedClientInfo:companionClientInfo:appleITeamId:appleIClientId:additionalHeaders:", v16, a4, v24, v25, v19, v20, v21, v22);
  if (v27)
  {
    v39 = v16;
    -[AIASSession URLSession](self, "URLSession");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIASRequest setSession:](v27, "setSession:", v28);

    -[AIASSession URLSession](self, "URLSession");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIASRequest URLRequest](v27, "URLRequest");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "dataTaskWithRequest:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIASRequest setTask:](v27, "setTask:", v31);

    v32 = self;
    objc_sync_enter(v32);
    -[AIASSession taskMap](v32, "taskMap");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)MEMORY[0x24BDD16E0];
    -[AIASRequest task](v27, "task");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "numberWithUnsignedInteger:", objc_msgSend(v35, "taskIdentifier"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setObject:forKeyedSubscript:", v27, v36);

    objc_sync_exit(v32);
    v37 = v27;
    v16 = v39;
  }

  return v27;
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  id v9;
  void (**v10)(id, uint64_t, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __SecTrust *v16;
  NSObject *v17;
  void *v18;
  __CFString *v19;
  const void *AppleGSService;
  const void *v21;
  int v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  const char *v26;
  SecPolicyRef SSL;
  SecPolicyRef v28;
  int v29;
  int v30;
  const char *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v9 = a5;
  v10 = (void (**)(id, uint64_t, _QWORD))a6;
  -[AIASSession getRequest:](self, "getRequest:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
    goto LABEL_33;
  objc_msgSend(v9, "protectionSpace");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "authenticationMethod");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x24BDB7410]);

  if (!v14)
  {
    v10[2](v10, 1, 0);
    goto LABEL_34;
  }
  objc_msgSend(v9, "protectionSpace");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (__SecTrust *)objc_msgSend(v15, "serverTrust");

  _AIDASOSLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v30 = 136446210;
    v31 = "-[AIASSession URLSession:task:didReceiveChallenge:completionHandler:]";
    _os_log_impl(&dword_2067E5000, v17, OS_LOG_TYPE_DEFAULT, "%{public}s: checking pinning", (uint8_t *)&v30, 0xCu);
  }

  objc_msgSend(v9, "protectionSpace");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "host");
  v19 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  AppleGSService = (const void *)SecPolicyCreateAppleGSService();
  if (AppleGSService)
  {
    v21 = AppleGSService;
    if (SecTrustSetPolicies(v16, AppleGSService) || MEMORY[0x20BCFD65C](v16, &v30))
    {
      CFRelease(v21);
    }
    else
    {
      v22 = v30;
      CFRelease(v21);
      if (v22 == 1 || v22 == 4)
      {

        goto LABEL_11;
      }
    }
  }
  if (!allowSkipSettingOnInternalHardware(CFSTR("AppleIDAuthSupportNoPinning"), 0))
    goto LABEL_28;
  SSL = SecPolicyCreateSSL(1u, v19);
  if (!SSL)
    goto LABEL_28;
  v28 = SSL;
  if (SecTrustSetPolicies(v16, SSL) || MEMORY[0x20BCFD65C](v16, &v30))
  {
    CFRelease(v28);
LABEL_28:

    goto LABEL_29;
  }
  v29 = v30;
  CFRelease(v28);

  if (v29 != 1 && v29 != 4)
  {
LABEL_29:
    _AIDASOSLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v30 = 136446210;
      v31 = "-[AIASSession URLSession:task:didReceiveChallenge:completionHandler:]";
      v26 = "%{public}s: pinning failed";
      goto LABEL_31;
    }
LABEL_32:

LABEL_33:
    v10[2](v10, 2, 0);
    goto LABEL_34;
  }
LABEL_11:
  if (objc_msgSend(v11, "context")
    && (checkChannelBindings(v16, (CFDictionaryRef *)objc_msgSend(v11, "context")) & 1) == 0)
  {
    _AIDASOSLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v30 = 136446210;
      v31 = "-[AIASSession URLSession:task:didReceiveChallenge:completionHandler:]";
      v26 = "%{public}s: channel bindings failed";
LABEL_31:
      _os_log_impl(&dword_2067E5000, v25, OS_LOG_TYPE_DEFAULT, v26, (uint8_t *)&v30, 0xCu);
      goto LABEL_32;
    }
    goto LABEL_32;
  }
  _AIDASOSLog();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v30 = 136446210;
    v31 = "-[AIASSession URLSession:task:didReceiveChallenge:completionHandler:]";
    _os_log_impl(&dword_2067E5000, v23, OS_LOG_TYPE_DEFAULT, "%{public}s: use credentials", (uint8_t *)&v30, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDB7480], "credentialForTrust:", v16);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(id, uint64_t, void *))v10)[2](v10, 0, v24);

LABEL_34:
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  (*((void (**)(id, uint64_t))a6 + 2))(a6, 1);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  -[AIASSession getRequest:](self, "getRequest:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    _AIDASOSLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136446722;
      v12 = "-[AIASSession URLSession:dataTask:didReceiveData:]";
      v13 = 2112;
      v14 = v8;
      v15 = 2048;
      v16 = objc_msgSend(v7, "length");
      _os_log_impl(&dword_2067E5000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s: %@ got more data: %lu bytes", (uint8_t *)&v11, 0x20u);
    }

    objc_msgSend(v8, "data");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "appendData:", v7);

  }
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  BOOL v16;
  AIASSession *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  int v21;
  const char *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[AIASSession getRequest:](self, "getRequest:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v9, "description");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setNetworkTaskDescription:", v12);

    _AIDASOSLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v11, "networkTaskDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 136446978;
      v22 = "-[AIASSession URLSession:task:didCompleteWithError:]";
      v23 = 2112;
      v24 = v11;
      v25 = 2112;
      v26 = v14;
      v27 = 2112;
      v28 = v10;
      _os_log_impl(&dword_2067E5000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s: %@: %@: %@", (uint8_t *)&v21, 0x2Au);

    }
    objc_msgSend(v11, "session");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v16 = v15 == v8;

    if (v16)
    {
      if (v10)
        objc_msgSend(v11, "setError:", v10);
      else
        objc_msgSend(v11, "setSuccess:", 1);
      objc_msgSend(v11, "sema");
      v18 = objc_claimAutoreleasedReturnValue();
      dispatch_semaphore_signal(v18);

      v17 = self;
      objc_sync_enter(v17);
      -[AIASSession taskMap](v17, "taskMap");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v9, "taskIdentifier"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "removeObjectForKey:", v20);

      objc_sync_exit(v17);
    }
    else
    {
      _AIDASOSLog();
      v17 = (AIASSession *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v17->super, OS_LOG_TYPE_DEFAULT))
      {
        v21 = 136446210;
        v22 = "-[AIASSession URLSession:task:didCompleteWithError:]";
        _os_log_impl(&dword_2067E5000, &v17->super, OS_LOG_TYPE_DEFAULT, "%{public}s: got reply after we abandoned the request", (uint8_t *)&v21, 0xCu);
      }
    }

  }
}

- (void)invalidateAndCancel
{
  void *v2;
  AIASSession *obj;

  obj = self;
  objc_sync_enter(obj);
  if (!-[AIASSession invalidated](obj, "invalidated"))
  {
    -[AIASSession URLSession](obj, "URLSession");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "invalidateAndCancel");

    -[AIASSession setInvalidated:](obj, "setInvalidated:", 1);
  }
  objc_sync_exit(obj);

}

- (NSMutableDictionary)taskMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTaskMap:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSURLSession)URLSession
{
  return (NSURLSession *)objc_getProperty(self, a2, 24, 1);
}

- (void)setURLSession:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URLSession, 0);
  objc_storeStrong((id *)&self->_taskMap, 0);
}

@end

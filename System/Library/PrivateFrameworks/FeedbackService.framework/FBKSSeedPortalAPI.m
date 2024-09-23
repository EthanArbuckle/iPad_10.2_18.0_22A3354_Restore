@implementation FBKSSeedPortalAPI

- (id)initClient:(id)a3
{
  id v5;
  FBKSSeedPortalAPI *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSURL *feedbackURL;
  NSObject *v12;
  NSURL *v13;
  objc_super v15;
  uint8_t buf[4];
  NSURL *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)FBKSSeedPortalAPI;
  v6 = -[FBKSSeedPortalAPI init](&v15, sel_init);
  if (v6)
  {
    -[FBKSSeedPortalAPI setEnvironment:](v6, "setEnvironment:", +[FBKSSharedConstants environment](FBKSSharedConstants, "environment"));
    +[FBKSSharedConstants appleSeedURL](FBKSSharedConstants, "appleSeedURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[FBKSSeedPortalAPI environment](v6, "environment") != 3)
    {
      objc_msgSend(v7, "URLByAppendingPathComponent:", CFSTR("sp"));
      v8 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v8;
    }
    objc_storeStrong((id *)&v6->_seedPortalURL, v7);
    -[FBKSSeedPortalAPI seedPortalURL](v6, "seedPortalURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URLByAppendingPathComponent:", CFSTR("feedback"));
    v10 = objc_claimAutoreleasedReturnValue();
    feedbackURL = v6->_feedbackURL;
    v6->_feedbackURL = (NSURL *)v10;

    FBKSLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = v6->_feedbackURL;
      *(_DWORD *)buf = 138543362;
      v17 = v13;
      _os_log_impl(&dword_23B433000, v12, OS_LOG_TYPE_DEFAULT, "Feedback URL [%{public}@]", buf, 0xCu);
    }

    objc_storeStrong((id *)&v6->_coreHTTPClient, a3);
  }

  return v6;
}

- (NSHTTPCookie)seedPortalSession
{
  FBKSSeedPortalAPI *v2;
  void *v3;
  char v4;
  void *v5;
  void *v6;

  v2 = self;
  objc_sync_enter(v2);
  -[FBKSSeedPortalAPI coreHTTPClient](v2, "coreHTTPClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[FBKSSeedPortalAPI coreHTTPClient](v2, "coreHTTPClient");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "seedPortalSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  objc_sync_exit(v2);

  return (NSHTTPCookie *)v6;
}

- (id)loginWithTokenURL
{
  void *v2;
  void *v3;

  -[FBKSSeedPortalAPI seedPortalURL](self, "seedPortalURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("login/with_token"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)unauthenticatedLoginURL
{
  void *v2;
  void *v3;

  -[FBKSSeedPortalAPI seedPortalURL](self, "seedPortalURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("login/with_anon"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)signOutURL
{
  void *v2;
  void *v3;

  -[FBKSSeedPortalAPI seedPortalURL](self, "seedPortalURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("signout"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)formItemsURLFormTat:(id)a3
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
  void *v13;
  void *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[FBKSSeedPortalAPI feedbackURL](self, "feedbackURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("form_items/%@"), v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLByAppendingPathComponent:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v5, "URLByAppendingPathComponent:", CFSTR("form_items.json"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(MEMORY[0x24BDD1808], "componentsWithURL:resolvingAgainstBaseURL:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDD1838];
  -[FBKSSeedPortalAPI _filterForValue](self, "_filterForValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "queryItemWithName:value:", CFSTR("filter_for"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setQueryItems:", v13);

  objc_msgSend(v9, "URL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)_filterForValue
{
  void *v2;
  char v3;
  const __CFString *v4;
  int64_t v5;
  const __CFString *v6;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("OSXProjects"));

  v4 = CFSTR("macos");
  if ((v3 & 1) == 0)
  {
    v5 = +[FBKSSharedConstants platform](FBKSSharedConstants, "platform");
    v6 = CFSTR("ios");
    if (v5 != 1)
      v6 = CFSTR("macos");
    if (v5 == 2)
      return CFSTR("visionos");
    else
      return (id)v6;
  }
  return (id)v4;
}

- (void)seedPortalLoginWithDeviceToken:(id)a3 success:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void (**v11)(id, id);
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  _QWORD v19[4];
  void (**v20)(id, id);
  id v21;
  const __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x24BDB7458];
  v11 = (void (**)(id, id))a5;
  -[FBKSSeedPortalAPI loginWithTokenURL](self, "loginWithTokenURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "requestWithURL:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setHTTPMethod:", CFSTR("POST"));
  v22 = CFSTR("device_token");
  v23[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v14, 0, &v21);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v21;
  if (v16)
  {
    FBKSSP2Log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[FBKSSeedPortalAPI seedPortalLoginWithDeviceToken:success:error:].cold.1((uint64_t)v16, v17);

    v11[2](v11, v16);
  }
  else
  {
    objc_msgSend(v13, "setHTTPBody:", v15);
    objc_msgSend(v13, "setHTTPContentType:", CFSTR("application/json; charset=utf-8"));
    -[FBKSSeedPortalAPI coreHTTPClient](self, "coreHTTPClient");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __66__FBKSSeedPortalAPI_seedPortalLoginWithDeviceToken_success_error___block_invoke;
    v19[3] = &unk_250C5F648;
    v20 = (void (**)(id, id))v9;
    objc_msgSend(v18, "jsonForURLRequest:success:error:", v13, v19, v11);

    v11 = v20;
  }

}

void __66__FBKSSeedPortalAPI_seedPortalLoginWithDeviceToken_success_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  FBKSUserLoginInfo *v4;

  v3 = a2;
  v4 = -[FBKSUserLoginInfo initWithDictionary:]([FBKSUserLoginInfo alloc], "initWithDictionary:", v3);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)seedPortalLoginAsUnauthenticatedUserWithSuccessHandler:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDB7458];
  v8 = a4;
  -[FBKSSeedPortalAPI unauthenticatedLoginURL](self, "unauthenticatedLoginURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "requestWithURL:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v10, "setHTTPContentType:", CFSTR("application/json; charset=utf-8"));
  -[FBKSSeedPortalAPI coreHTTPClient](self, "coreHTTPClient");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __82__FBKSSeedPortalAPI_seedPortalLoginAsUnauthenticatedUserWithSuccessHandler_error___block_invoke;
  v13[3] = &unk_250C5F648;
  v14 = v6;
  v12 = v6;
  objc_msgSend(v11, "jsonForURLRequest:success:error:", v10, v13, v8);

}

void __82__FBKSSeedPortalAPI_seedPortalLoginAsUnauthenticatedUserWithSuccessHandler_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  FBKSUserLoginInfo *v4;

  v3 = a2;
  v4 = -[FBKSUserLoginInfo initWithDictionary:]([FBKSUserLoginInfo alloc], "initWithDictionary:", v3);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)logOutServerSideWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  -[FBKSSeedPortalAPI signOutURL](self, "signOutURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKSSeedPortalAPI coreHTTPClient](self, "coreHTTPClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __52__FBKSSeedPortalAPI_logOutServerSideWithCompletion___block_invoke;
  v13[3] = &unk_250C5F670;
  v14 = v4;
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __52__FBKSSeedPortalAPI_logOutServerSideWithCompletion___block_invoke_2;
  v10[3] = &unk_250C5F698;
  v11 = v5;
  v12 = v14;
  v8 = v14;
  v9 = v5;
  objc_msgSend(v6, "dataForURL:success:error:", v9, v13, v10);

}

uint64_t __52__FBKSSeedPortalAPI_logOutServerSideWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __52__FBKSSeedPortalAPI_logOutServerSideWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  FBKSSP2Log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __52__FBKSSeedPortalAPI_logOutServerSideWithCompletion___block_invoke_2_cold_1(a1, (uint64_t)v3, v4);

  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(void))(v5 + 16))();

}

- (void)loadFormItemWithFormTat:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD14A8], "URLQueryAllowedCharacterSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAddingPercentEncodingWithAllowedCharacters:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[FBKSSeedPortalAPI formItemsURLFormTat:](self, "formItemsURLFormTat:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDB74A0], "requestWithURL:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKSSeedPortalAPI coreHTTPClient](self, "coreHTTPClient");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __60__FBKSSeedPortalAPI_loadFormItemWithFormTat_withCompletion___block_invoke;
  v18[3] = &unk_250C5F6C0;
  v19 = v6;
  v20 = v7;
  v16[0] = v13;
  v16[1] = 3221225472;
  v16[2] = __60__FBKSSeedPortalAPI_loadFormItemWithFormTat_withCompletion___block_invoke_44;
  v16[3] = &unk_250C5F568;
  v17 = v20;
  v14 = v20;
  v15 = v6;
  objc_msgSend(v12, "jsonForURLRequest:success:error:", v11, v18, v16);

}

void __60__FBKSSeedPortalAPI_loadFormItemWithFormTat_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;

  v3 = a2;
  if (*(_QWORD *)(a1 + 32) && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.FeedbackService"), -1001, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 40);
    if (v5)
      (*(void (**)(uint64_t, _QWORD, void *))(v5 + 16))(v5, 0, v4);
    FBKSSP2Log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __60__FBKSSeedPortalAPI_loadFormItemWithFormTat_withCompletion___block_invoke_cold_1(v6);

  }
}

uint64_t __60__FBKSSeedPortalAPI_loadFormItemWithFormTat_withCompletion___block_invoke_44(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (signed)environment
{
  return self->_environment;
}

- (void)setEnvironment:(signed __int16)a3
{
  self->_environment = a3;
}

- (NSURL)seedPortalURL
{
  return self->_seedPortalURL;
}

- (void)setSeedPortalURL:(id)a3
{
  objc_storeStrong((id *)&self->_seedPortalURL, a3);
}

- (NSURL)feedbackURL
{
  return self->_feedbackURL;
}

- (void)setFeedbackURL:(id)a3
{
  objc_storeStrong((id *)&self->_feedbackURL, a3);
}

- (FBKSHTTPClientProtocol)coreHTTPClient
{
  return self->_coreHTTPClient;
}

- (void)setCoreHTTPClient:(id)a3
{
  objc_storeStrong((id *)&self->_coreHTTPClient, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreHTTPClient, 0);
  objc_storeStrong((id *)&self->_feedbackURL, 0);
  objc_storeStrong((id *)&self->_seedPortalURL, 0);
}

- (void)seedPortalLoginWithDeviceToken:(uint64_t)a1 success:(NSObject *)a2 error:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_23B433000, a2, OS_LOG_TYPE_ERROR, "Encountered an error serializing JSON: %@", (uint8_t *)&v2, 0xCu);
}

void __52__FBKSSeedPortalAPI_logOutServerSideWithCompletion___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = v5;
  v8 = 2114;
  v9 = a2;
  _os_log_error_impl(&dword_23B433000, a3, OS_LOG_TYPE_ERROR, "[%{public}@] Failed with error [%{public}@]", (uint8_t *)&v6, 0x16u);

}

void __60__FBKSSeedPortalAPI_loadFormItemWithFormTat_withCompletion___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_23B433000, log, OS_LOG_TYPE_ERROR, "bad data format in forms index", v1, 2u);
}

@end

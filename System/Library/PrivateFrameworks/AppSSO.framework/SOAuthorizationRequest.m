@implementation SOAuthorizationRequest

- (SOAuthorizationRequest)initWithRequestParameters:(id)a3 remoteExtensionContext:(id)a4
{
  id v7;
  id v8;
  SOAuthorizationRequest *v9;
  SOAuthorizationRequest *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SOAuthorizationRequest;
  v9 = -[SOAuthorizationRequest init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_requestParameters, a3);
    objc_storeWeak((id *)&v10->_remoteExtensionContext, v8);
  }

  return v10;
}

- (void)doNotHandle
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20DABC000, v0, v1, "%@: cancel -> doNotHandle", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)cancel
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20DABC000, v0, v1, "%@: cancel -> cancel", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)complete
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20DABC000, v0, v1, "%@: cancel -> complete", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)completeWithHTTPAuthorizationHeaders:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *canceledAuthorizationError;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  id v33;
  __int16 v34;
  SOAuthorizationRequest *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  SO_LOG_SOAuthorizationRequest();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[SOAuthorizationRequestParameters identifier](self->_requestParameters, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316163;
    v27 = "-[SOAuthorizationRequest completeWithHTTPAuthorizationHeaders:]";
    v28 = 2114;
    v29 = v6;
    v30 = 2160;
    v31 = 1752392040;
    v32 = 2117;
    v33 = v4;
    v34 = 2112;
    v35 = self;
    _os_log_impl(&dword_20DABC000, v5, OS_LOG_TYPE_DEFAULT, "%s extension API called, identifier = %{public}@, httpAuthorizationHeaders = %{sensitive, mask.hash}@ on %@", buf, 0x34u);

  }
  -[SOAuthorizationRequest _invalidateLoginManager](self, "_invalidateLoginManager");
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v8, "objectForKeyedSubscript:", v13, (_QWORD)v21);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "description");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "description");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, v16);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }

  v17 = objc_alloc_init((Class)getSOAuthorizationCredentialClass());
  objc_msgSend(v17, "setHttpAuthorizationHeaders:", v7);
  if (-[SOAuthorizationRequest isAuthorizationCanceled](self, "isAuthorizationCanceled"))
  {
    SO_LOG_SOAuthorizationRequest();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      -[SOAuthorizationRequest completeWithHTTPAuthorizationHeaders:].cold.1();

    objc_storeStrong((id *)&self->_canceledAuthorizationCredential, v17);
    canceledAuthorizationError = self->_canceledAuthorizationError;
    self->_canceledAuthorizationError = 0;
  }
  else
  {
    -[SOAuthorizationRequest _hostExtensionContext](self, "_hostExtensionContext");
    canceledAuthorizationError = (void *)objc_claimAutoreleasedReturnValue();
    -[SOAuthorizationRequestParameters identifier](self->_requestParameters, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(canceledAuthorizationError, "authorization:didCompleteWithCredential:error:", v20, v17, 0);

  }
}

- (void)completeWithHTTPResponse:(id)a3 httpBody:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  NSObject *v11;
  void *canceledAuthorizationError;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  id v23;
  __int16 v24;
  SOAuthorizationRequest *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  SO_LOG_SOAuthorizationRequest();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 136316419;
    v15 = "-[SOAuthorizationRequest completeWithHTTPResponse:httpBody:]";
    v16 = 2160;
    v17 = 1752392040;
    v18 = 2117;
    v19 = v6;
    v20 = 2160;
    v21 = 1752392040;
    v22 = 2117;
    v23 = v7;
    v24 = 2112;
    v25 = self;
    _os_log_impl(&dword_20DABC000, v8, OS_LOG_TYPE_DEFAULT, "%s extension API called, httpResponse = %{sensitive, mask.hash}@, httpBody = %{sensitive, mask.hash}@ on %@", (uint8_t *)&v14, 0x3Eu);
  }

  -[SOAuthorizationRequest _invalidateLoginManager](self, "_invalidateLoginManager");
  v9 = objc_alloc_init((Class)getSOAuthorizationCredentialClass());
  objc_msgSend(v9, "setHttpResponse:", v6);
  if (v7)
  {
    objc_msgSend(v9, "setHttpBody:", v7);
  }
  else
  {
    v10 = objc_alloc_init(MEMORY[0x24BDBCE50]);
    objc_msgSend(v9, "setHttpBody:", v10);

  }
  if (-[SOAuthorizationRequest isAuthorizationCanceled](self, "isAuthorizationCanceled"))
  {
    SO_LOG_SOAuthorizationRequest();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[SOAuthorizationRequest completeWithHTTPResponse:httpBody:].cold.1();

    objc_storeStrong((id *)&self->_canceledAuthorizationCredential, v9);
    canceledAuthorizationError = self->_canceledAuthorizationError;
    self->_canceledAuthorizationError = 0;
  }
  else
  {
    -[SOAuthorizationRequest _hostExtensionContext](self, "_hostExtensionContext");
    canceledAuthorizationError = (void *)objc_claimAutoreleasedReturnValue();
    -[SOAuthorizationRequestParameters identifier](self->_requestParameters, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(canceledAuthorizationError, "authorization:didCompleteWithCredential:error:", v13, v9, 0);

  }
}

- (void)completeWithAuthorizationResult:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSArray *v10;
  id canceledAuthorizationError;
  NSArray *secKeyProxies;
  void *v13;
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  id v29;
  uint8_t v30[128];
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  SOAuthorizationRequest *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  SO_LOG_SOAuthorizationRequest();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315651;
    v32 = "-[SOAuthorizationRequest completeWithAuthorizationResult:]";
    v33 = 2113;
    v34 = v4;
    v35 = 2112;
    v36 = self;
    _os_log_impl(&dword_20DABC000, v5, OS_LOG_TYPE_DEFAULT, "%s extension API called, completeWithAuthorizationResult = %{private}@ on %@", buf, 0x20u);
  }

  -[SOAuthorizationRequest _invalidateLoginManager](self, "_invalidateLoginManager");
  v6 = (void *)objc_msgSend(objc_alloc((Class)getSOAuthorizationCredentialClass()), "initWithAuthorizationResult:", v4);
  objc_msgSend(v4, "privateKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (!v8)
    goto LABEL_13;
  objc_msgSend(v4, "privateKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  -[SOAuthorizationRequest _createSecKeyProxiesForSecKeys:error:](self, "_createSecKeyProxiesForSecKeys:error:", v9, &v29);
  v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
  canceledAuthorizationError = v29;
  secKeyProxies = self->_secKeyProxies;
  self->_secKeyProxies = v10;

  if (self->_secKeyProxies)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v14 = self->_secKeyProxies;
    v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v26;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v26 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v18), "endpoint", (_QWORD)v25);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v19);

          ++v18;
        }
        while (v16 != v18);
        v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v16);
    }

    objc_msgSend(v6, "setSecKeyProxyEndpoints:", v13);
LABEL_13:
    if (-[SOAuthorizationRequest isAuthorizationCanceled](self, "isAuthorizationCanceled", (_QWORD)v25))
    {
      SO_LOG_SOAuthorizationRequest();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        -[SOAuthorizationRequest completeWithHTTPAuthorizationHeaders:].cold.1();

      objc_storeStrong((id *)&self->_canceledAuthorizationCredential, v6);
      canceledAuthorizationError = self->_canceledAuthorizationError;
      self->_canceledAuthorizationError = 0;
    }
    else
    {
      -[SOAuthorizationRequest _hostExtensionContext](self, "_hostExtensionContext");
      canceledAuthorizationError = (id)objc_claimAutoreleasedReturnValue();
      -[SOAuthorizationRequestParameters identifier](self->_requestParameters, "identifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(canceledAuthorizationError, "authorization:didCompleteWithCredential:error:", v21, v6, 0);

    }
    goto LABEL_21;
  }
  SO_LOG_SOAuthorizationRequest();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    -[SOAuthorizationRequest completeWithAuthorizationResult:].cold.2();

  -[SOAuthorizationRequest _hostExtensionContext](self, "_hostExtensionContext");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[SOAuthorizationRequestParameters identifier](self->_requestParameters, "identifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "authorization:didCompleteWithCredential:error:", v24, 0, canceledAuthorizationError);

LABEL_21:
}

- (void)completeWithError:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  SOAuthorizationCredential *canceledAuthorizationCredential;
  NSError *v8;
  void *canceledAuthorizationError;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  SOAuthorizationRequest *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  SO_LOG_SOAuthorizationRequest();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315650;
    v12 = "-[SOAuthorizationRequest completeWithError:]";
    v13 = 2114;
    v14 = v4;
    v15 = 2112;
    v16 = self;
    _os_log_impl(&dword_20DABC000, v5, OS_LOG_TYPE_DEFAULT, "%s extension API called, error = %{public}@ on %@", (uint8_t *)&v11, 0x20u);
  }

  -[SOAuthorizationRequest _invalidateLoginManager](self, "_invalidateLoginManager");
  if (-[SOAuthorizationRequest isAuthorizationCanceled](self, "isAuthorizationCanceled"))
  {
    SO_LOG_SOAuthorizationRequest();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[SOAuthorizationRequest completeWithError:].cold.1();

    canceledAuthorizationCredential = self->_canceledAuthorizationCredential;
    self->_canceledAuthorizationCredential = 0;

    v8 = (NSError *)v4;
    canceledAuthorizationError = self->_canceledAuthorizationError;
    self->_canceledAuthorizationError = v8;
  }
  else
  {
    -[SOAuthorizationRequest _hostExtensionContext](self, "_hostExtensionContext");
    canceledAuthorizationError = (void *)objc_claimAutoreleasedReturnValue();
    -[SOAuthorizationRequestParameters identifier](self->_requestParameters, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(canceledAuthorizationError, "authorization:didCompleteWithCredential:error:", v10, 0, v4);

  }
}

- (void)presentAuthorizationViewControllerWithCompletion:(id)a3
{
  -[SOAuthorizationRequest presentAuthorizationViewControllerWithHints:completion:](self, "presentAuthorizationViewControllerWithHints:completion:", MEMORY[0x24BDBD1B8], a3);
}

- (void)presentAuthorizationViewControllerWithHints:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  void (**v24)(id, _QWORD, void *);
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  SOAuthorizationRequest *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  SO_LOG_SOAuthorizationRequest();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v26 = "-[SOAuthorizationRequest presentAuthorizationViewControllerWithHints:completion:]";
    v27 = 2112;
    v28 = self;
    _os_log_impl(&dword_20DABC000, v8, OS_LOG_TYPE_DEFAULT, "%s extension API called on %@", buf, 0x16u);
  }

  if (-[SOAuthorizationRequest isAuthorizationCanceled](self, "isAuthorizationCanceled"))
  {
    SO_LOG_SOAuthorizationRequest();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[SOAuthorizationRequest presentAuthorizationViewControllerWithHints:completion:].cold.1();

    if (v7)
    {
      objc_msgSend(getSOErrorHelperClass_1(), "internalErrorWithMessage:", CFSTR("Authorization has been already canceled"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, 0, v10);
LABEL_22:

    }
  }
  else
  {
    if (!-[SOAuthorizationRequestParameters isUserInteractionEnabled](self->_requestParameters, "isUserInteractionEnabled"))
    {
      SO_LOG_SOAuthorizationRequest();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[SOAuthorizationRequest presentAuthorizationViewControllerWithHints:completion:].cold.3();

      if (v7)
      {
        v14 = (void *)MEMORY[0x24BDD1540];
        getASAuthorizationErrorDomain();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, 1005, 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v7[2](v7, 0, v16);

      }
      objc_msgSend(getSOErrorHelperClass_1(), "errorWithCode:", -12);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      SO_LOG_SOAuthorizationRequest();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v26 = (const char *)v10;
        _os_log_impl(&dword_20DABC000, v17, OS_LOG_TYPE_DEFAULT, "finish authorization with error: %{public}@", buf, 0xCu);
      }

      -[SOAuthorizationRequest _hostExtensionContext](self, "_hostExtensionContext");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[SOAuthorizationRequestParameters identifier](self->_requestParameters, "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "authorization:didCompleteWithCredential:error:", v19, 0, v10);

      goto LABEL_22;
    }
    if (-[SOAuthorizationRequest _isUserInterfaceAllowed](self, "_isUserInterfaceAllowed"))
    {
      -[SOAuthorizationRequest _hostExtensionContext](self, "_hostExtensionContext");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SOAuthorizationRequestParameters identifier](self->_requestParameters, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __81__SOAuthorizationRequest_presentAuthorizationViewControllerWithHints_completion___block_invoke;
      v23[3] = &unk_24C80C898;
      v23[4] = self;
      v24 = v7;
      objc_msgSend(v11, "presentAuthorizationViewControllerWithHints:requestIdentifier:completion:", v6, v12, v23);

      v10 = v24;
      goto LABEL_22;
    }
    SO_LOG_SOAuthorizationRequest();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[SOAuthorizationRequest presentAuthorizationViewControllerWithHints:completion:].cold.2();

    if (v7)
    {
      v21 = (void *)MEMORY[0x24BDD1540];
      getASAuthorizationErrorDomain();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "errorWithDomain:code:userInfo:", v10, 1001, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, 0, v22);

      goto LABEL_22;
    }
  }

}

void __81__SOAuthorizationRequest_presentAuthorizationViewControllerWithHints_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;

  v4 = a3;
  v5 = v4;
  if (*(_QWORD *)(a1 + 40))
  {
    if (v4 && objc_msgSend(v4, "code") == -8)
    {
      objc_msgSend(v5, "userInfo");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Subcode"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7 && objc_msgSend(v7, "intValue") == 1)
      {
        SO_LOG_SOAuthorizationRequest();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          __81__SOAuthorizationRequest_presentAuthorizationViewControllerWithHints_completion___block_invoke_cold_1(a1, v8, v9, v10, v11, v12, v13, v14);

        v15 = (void *)MEMORY[0x24BDD1540];
        getASAuthorizationErrorDomain();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, 1001, 0);
        v17 = objc_claimAutoreleasedReturnValue();

        v5 = (void *)v17;
      }

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (BOOL)_isUserInterfaceAllowed
{
  void *v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  int v6;
  _Unwind_Exception *ASAuthorizationErrorDomain_cold_1;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  -[SOAuthorizationRequest authorizationOptions](self, "authorizationOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v3 = (_QWORD *)getSOAuthorizationOptionCoreNoUserInterfaceSymbolLoc_ptr;
  v12 = getSOAuthorizationOptionCoreNoUserInterfaceSymbolLoc_ptr;
  if (!getSOAuthorizationOptionCoreNoUserInterfaceSymbolLoc_ptr)
  {
    v4 = (void *)AppSSOCoreLibrary_1();
    v3 = dlsym(v4, "SOAuthorizationOptionCoreNoUserInterface");
    v10[3] = (uint64_t)v3;
    getSOAuthorizationOptionCoreNoUserInterfaceSymbolLoc_ptr = (uint64_t)v3;
  }
  _Block_object_dispose(&v9, 8);
  if (!v3)
  {
    ASAuthorizationErrorDomain_cold_1 = (_Unwind_Exception *)getASAuthorizationErrorDomain_cold_1();
    _Block_object_dispose(&v9, 8);
    _Unwind_Resume(ASAuthorizationErrorDomain_cold_1);
  }
  objc_msgSend(v2, "objectForKeyedSubscript:", *v3, v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue") ^ 1;

  return v6;
}

- (id)_hostExtensionContext
{
  id WeakRetained;
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v15;

  WeakRetained = objc_loadWeakRetained((id *)&self->_remoteExtensionContext);
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v15 = 0;
    objc_msgSend(WeakRetained, "hostContextWithError:", &v15);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v15;
    if (!v4)
    {
      SO_LOG_SOAuthorizationRequest();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[SOAuthorizationRequest _hostExtensionContext].cold.2();

    }
  }
  else
  {
    SO_LOG_SOAuthorizationRequest();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SOAuthorizationRequest _hostExtensionContext].cold.1(v5, v7, v8, v9, v10, v11, v12, v13);
    v4 = 0;
  }

  return v4;
}

- (void)_completeFinishAuthorizationWithRequestIdentifier:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_remoteExtensionContext);
  v9 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "completeFinishAuthorization:error:", v6, v7);
  }
  else
  {
    SO_LOG_SOAuthorizationRequest();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[SOAuthorizationRequest _hostExtensionContext].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);

  }
}

- (id)_createSecKeyProxiesForSecKeys:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  const void *v12;
  CFTypeID v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id obj;
  _QWORD v23[5];
  _QWORD v24[5];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v26;
    v10 = MEMORY[0x24BDAC760];
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(obj);
        v12 = *(const void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        v13 = CFGetTypeID(v12);
        if (v13 != SecKeyGetTypeID())
        {
          SO_LOG_SOAuthorizationRequest();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            -[SOAuthorizationRequest _createSecKeyProxiesForSecKeys:error:].cold.1();

          v15 = obj;
          if (a4)
          {
            v18 = (void *)MEMORY[0x24BDD1540];
            getASAuthorizationErrorDomain();
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, 1002, 0);
            *a4 = (id)objc_claimAutoreleasedReturnValue();

          }
          v16 = 0;
          goto LABEL_15;
        }
        v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDE84F0]), "initWithKey:", v12);
        v24[0] = v10;
        v24[1] = 3221225472;
        v24[2] = __63__SOAuthorizationRequest__createSecKeyProxiesForSecKeys_error___block_invoke;
        v24[3] = &unk_24C80C8C0;
        v24[4] = self;
        objc_msgSend(v14, "setClientConnectionHandler:", v24);
        v23[0] = v10;
        v23[1] = 3221225472;
        v23[2] = __63__SOAuthorizationRequest__createSecKeyProxiesForSecKeys_error___block_invoke_7;
        v23[3] = &unk_24C80C8C0;
        v23[4] = self;
        objc_msgSend(v14, "setClientDisconnectionHandler:", v23);
        objc_msgSend(v6, "addObject:", v14);

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v8)
        continue;
      break;
    }
  }
  v15 = obj;

  v16 = v6;
LABEL_15:

  return v16;
}

void __63__SOAuthorizationRequest__createSecKeyProxiesForSecKeys_error___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;
  NSObject *v5;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x24BDAC8D0];
  v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  objc_msgSend(*(id *)(a1 + 32), "setSecKeyProxiesConnectedClients:", objc_msgSend(*(id *)(a1 + 32), "secKeyProxiesConnectedClients") + 1);
  SO_LOG_SOAuthorizationRequest();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __63__SOAuthorizationRequest__createSecKeyProxiesForSecKeys_error___block_invoke_cold_1(a2, (uint64_t)v6, objc_msgSend(*(id *)(a1 + 32), "secKeyProxiesConnectedClients"));

  objc_sync_exit(v4);
}

void __63__SOAuthorizationRequest__createSecKeyProxiesForSecKeys_error___block_invoke_7(uint64_t a1, uint64_t a2)
{
  id v4;
  NSObject *v5;
  id *v6;
  void *v7;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  objc_msgSend(*(id *)(a1 + 32), "setSecKeyProxiesConnectedClients:", objc_msgSend(*(id *)(a1 + 32), "secKeyProxiesConnectedClients") - 1);
  SO_LOG_SOAuthorizationRequest();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __63__SOAuthorizationRequest__createSecKeyProxiesForSecKeys_error___block_invoke_7_cold_1(a2, (uint64_t)v8, objc_msgSend(*(id *)(a1 + 32), "secKeyProxiesConnectedClients"));

  if (!objc_msgSend(*(id *)(a1 + 32), "secKeyProxiesConnectedClients"))
  {
    objc_msgSend(*(id *)(a1 + 32), "setSecKeyProxies:", 0);
    v6 = *(id **)(a1 + 32);
    objc_msgSend(v6[1], "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_completeFinishAuthorizationWithRequestIdentifier:error:", v7, 0);

  }
  objc_sync_exit(v4);

}

- (void)_invalidateLoginManager
{
  POLoginManager *loginManager;
  POLoginManager *v4;

  loginManager = self->_loginManager;
  if (loginManager)
  {
    -[POLoginManager invalidate](loginManager, "invalidate");
    v4 = self->_loginManager;
    self->_loginManager = 0;

  }
}

- (NSURL)url
{
  return -[SOAuthorizationRequestParameters url](self->_requestParameters, "url");
}

- (void)setUrl:(id)a3
{
  -[SOAuthorizationRequestParameters setUrl:](self->_requestParameters, "setUrl:", a3);
}

- (NSString)requestedOperation
{
  __CFString *v2;
  __CFString *v3;
  NSString *v4;

  -[SOAuthorizationRequestParameters requestedOperation](self->_requestParameters, "requestedOperation");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = &stru_24C80D4A8;
  v4 = v2;

  return v4;
}

- (void)setRequestedOperation:(id)a3
{
  -[SOAuthorizationRequestParameters setRequestedOperation:](self->_requestParameters, "setRequestedOperation:", a3);
}

- (NSDictionary)httpHeaders
{
  void *v2;
  void *v3;
  NSDictionary *v4;

  -[SOAuthorizationRequestParameters httpHeaders](self->_requestParameters, "httpHeaders");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = (void *)MEMORY[0x24BDBD1B8];
  v4 = v2;

  return v4;
}

- (void)setHttpHeaders:(id)a3
{
  -[SOAuthorizationRequestParameters setHttpHeaders:](self->_requestParameters, "setHttpHeaders:", a3);
}

- (NSData)httpBody
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[SOAuthorizationRequestParameters httpBody](self->_requestParameters, "httpBody");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = v2;
  else
    v4 = objc_alloc_init(MEMORY[0x24BDBCE50]);
  v5 = v4;

  return (NSData *)v5;
}

- (void)setHttpBody:(id)a3
{
  -[SOAuthorizationRequestParameters setHttpBody:](self->_requestParameters, "setHttpBody:", a3);
}

- (NSString)realm
{
  __CFString *v2;
  __CFString *v3;
  NSString *v4;

  -[SOAuthorizationRequestParameters realm](self->_requestParameters, "realm");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = &stru_24C80D4A8;
  v4 = v2;

  return v4;
}

- (void)setRealm:(id)a3
{
  -[SOAuthorizationRequestParameters setRealm:](self->_requestParameters, "setRealm:", a3);
}

- (NSDictionary)extensionData
{
  void *v2;
  void *v3;
  NSDictionary *v4;

  -[SOAuthorizationRequestParameters extensionData](self->_requestParameters, "extensionData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = (void *)MEMORY[0x24BDBD1B8];
  v4 = v2;

  return v4;
}

- (void)setExtensionData:(id)a3
{
  -[SOAuthorizationRequestParameters setExtensionData:](self->_requestParameters, "setExtensionData:", a3);
}

- (NSString)callerBundleIdentifier
{
  __CFString *v2;
  __CFString *v3;
  NSString *v4;

  -[SOAuthorizationRequestParameters callerBundleIdentifier](self->_requestParameters, "callerBundleIdentifier");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = &stru_24C80D4A8;
  v4 = v2;

  return v4;
}

- (void)setCallerBundleIdentifier:(id)a3
{
  -[SOAuthorizationRequestParameters setCallerBundleIdentifier:](self->_requestParameters, "setCallerBundleIdentifier:", a3);
}

- (NSData)auditTokenData
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[SOAuthorizationRequestParameters auditTokenData](self->_requestParameters, "auditTokenData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = v2;
  else
    v4 = objc_alloc_init(MEMORY[0x24BDBCE50]);
  v5 = v4;

  return (NSData *)v5;
}

- (void)setAuditTokenData:(id)a3
{
  -[SOAuthorizationRequestParameters setAuditTokenData:](self->_requestParameters, "setAuditTokenData:", a3);
}

- (NSDictionary)authorizationOptions
{
  void *v2;
  void *v3;
  NSDictionary *v4;

  -[SOAuthorizationRequestParameters authorizationOptions](self->_requestParameters, "authorizationOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = (void *)MEMORY[0x24BDBD1B8];
  v4 = v2;

  return v4;
}

- (void)setAuthorizationOptions:(id)a3
{
  -[SOAuthorizationRequestParameters setAuthorizationOptions:](self->_requestParameters, "setAuthorizationOptions:", a3);
}

- (BOOL)isCFNetworkInterception
{
  return -[SOAuthorizationRequestParameters isCFNetworkInterception](self->_requestParameters, "isCFNetworkInterception");
}

- (void)setCFNetworkInterception:(BOOL)a3
{
  -[SOAuthorizationRequestParameters setCfNetworkInterception:](self->_requestParameters, "setCfNetworkInterception:", a3);
}

- (BOOL)isCallerManaged
{
  return -[SOAuthorizationRequestParameters isCallerManaged](self->_requestParameters, "isCallerManaged");
}

- (void)setCallerManaged:(BOOL)a3
{
  -[SOAuthorizationRequestParameters setCallerManaged:](self->_requestParameters, "setCallerManaged:", a3);
}

- (NSString)callerTeamIdentifier
{
  __CFString *v2;
  __CFString *v3;
  NSString *v4;

  -[SOAuthorizationRequestParameters callerTeamIdentifier](self->_requestParameters, "callerTeamIdentifier");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = &stru_24C80D4A8;
  v4 = v2;

  return v4;
}

- (void)setCallerTeamIdentifier:(id)a3
{
  -[SOAuthorizationRequestParameters setCallerTeamIdentifier:](self->_requestParameters, "setCallerTeamIdentifier:", a3);
}

- (NSString)localizedCallerDisplayName
{
  __CFString *v2;
  __CFString *v3;
  NSString *v4;

  -[SOAuthorizationRequestParameters localizedCallerDisplayName](self->_requestParameters, "localizedCallerDisplayName");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = &stru_24C80D4A8;
  v4 = v2;

  return v4;
}

- (void)setLocalizedCallerDisplayName:(id)a3
{
  -[SOAuthorizationRequestParameters setLocalizedCallerDisplayName:](self->_requestParameters, "setLocalizedCallerDisplayName:", a3);
}

- (BOOL)isUserInteractionEnabled
{
  return -[SOAuthorizationRequestParameters isUserInteractionEnabled](self->_requestParameters, "isUserInteractionEnabled");
}

- (void)setEnableUserInteraction:(BOOL)a3
{
  -[SOAuthorizationRequestParameters setEnableUserInteraction:](self->_requestParameters, "setEnableUserInteraction:", a3);
}

- (NSString)impersonationBundleIdentifier
{
  return -[SOAuthorizationRequestParameters impersonationBundleIdentifier](self->_requestParameters, "impersonationBundleIdentifier");
}

- (void)setImpersonationBundleIdentifier:(id)a3
{
  -[SOAuthorizationRequestParameters setImpersonationBundleIdentifier:](self->_requestParameters, "setImpersonationBundleIdentifier:", a3);
}

- (POLoginManager)loginManager
{
  void *v4;
  objc_class *v5;
  POLoginManager *v6;
  POLoginManager *loginManager;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  if (-[SOAuthorizationRequestParameters pssoAuthenticationMethod](self->_requestParameters, "pssoAuthenticationMethod") == 1000)return (POLoginManager *)0;
  if (!self->_loginManager)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2050000000;
    v4 = (void *)getPOLoginManagerClass_softClass;
    v15 = getPOLoginManagerClass_softClass;
    if (!getPOLoginManagerClass_softClass)
    {
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __getPOLoginManagerClass_block_invoke;
      v11[3] = &unk_24C80C0B8;
      v11[4] = &v12;
      __getPOLoginManagerClass_block_invoke((uint64_t)v11);
      v4 = (void *)v13[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v12, 8);
    v6 = (POLoginManager *)objc_alloc_init(v5);
    loginManager = self->_loginManager;
    self->_loginManager = v6;

  }
  -[SOAuthorizationRequest _hostExtensionContext](self, "_hostExtensionContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[POLoginManager setHostExtensionContext:](self->_loginManager, "setHostExtensionContext:", v8);

  -[SOAuthorizationRequestParameters identifier](self->_requestParameters, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[POLoginManager setRequestIdentifier:](self->_loginManager, "setRequestIdentifier:", v9);

  -[SOAuthorizationRequestParameters extensionData](self->_requestParameters, "extensionData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[POLoginManager setExtensionData:](self->_loginManager, "setExtensionData:", v10);

  return self->_loginManager;
}

- (NSString)identifier
{
  return -[SOAuthorizationRequestParameters identifier](self->_requestParameters, "identifier");
}

- (BOOL)isAuthorizationCanceled
{
  return self->_authorizationCanceled;
}

- (void)setAuthorizationCanceled:(BOOL)a3
{
  self->_authorizationCanceled = a3;
}

- (SOAuthorizationCredential)canceledAuthorizationCredential
{
  return self->_canceledAuthorizationCredential;
}

- (void)setCanceledAuthorizationCredential:(id)a3
{
  objc_storeStrong((id *)&self->_canceledAuthorizationCredential, a3);
}

- (NSError)canceledAuthorizationError
{
  return self->_canceledAuthorizationError;
}

- (void)setCanceledAuthorizationError:(id)a3
{
  objc_storeStrong((id *)&self->_canceledAuthorizationError, a3);
}

- (NSArray)secKeyProxies
{
  return self->_secKeyProxies;
}

- (void)setSecKeyProxies:(id)a3
{
  objc_storeStrong((id *)&self->_secKeyProxies, a3);
}

- (int)secKeyProxiesConnectedClients
{
  return self->_secKeyProxiesConnectedClients;
}

- (void)setSecKeyProxiesConnectedClients:(int)a3
{
  self->_secKeyProxiesConnectedClients = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secKeyProxies, 0);
  objc_storeStrong((id *)&self->_canceledAuthorizationError, 0);
  objc_storeStrong((id *)&self->_canceledAuthorizationCredential, 0);
  objc_storeStrong((id *)&self->_loginManager, 0);
  objc_destroyWeak((id *)&self->_remoteExtensionContext);
  objc_storeStrong((id *)&self->_requestParameters, 0);
}

- (void)completeWithHTTPAuthorizationHeaders:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20DABC000, v0, v1, "%@: cancel -> completeWithHTTPAuthorizationHeaders", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)completeWithHTTPResponse:httpBody:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20DABC000, v0, v1, "%@: cancel -> completeWithHTTPResponse", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)completeWithAuthorizationResult:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20DABC000, v0, v1, "failed to create SecKey proxies: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)completeWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20DABC000, v0, v1, "%@: cancel -> completeWithError", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)presentAuthorizationViewControllerWithHints:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20DABC000, v0, v1, "%@, authorization has been already canceled", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)presentAuthorizationViewControllerWithHints:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20DABC000, v0, v1, "%@, authorization wants to display UI but it is not allowed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)presentAuthorizationViewControllerWithHints:completion:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20DABC000, v0, v1, "%@, authorization wants to display UI but user interaction is not enabled", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __81__SOAuthorizationRequest_presentAuthorizationViewControllerWithHints_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_20DABC000, a2, a3, "%@, authorization wants to display UI but the device screen is locked", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_hostExtensionContext
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20DABC000, v0, v1, "Failed to get host extension context with error = %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_createSecKeyProxiesForSecKeys:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20DABC000, v0, v1, "invalid SecKey in the authorization result: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __63__SOAuthorizationRequest__createSecKeyProxiesForSecKeys_error___block_invoke_cold_1(uint64_t a1, uint64_t a2, int a3)
{
  uint8_t *v3;
  NSObject *v4;

  OUTLINED_FUNCTION_4_0(a1, a2, a3, 1.5047e-36);
  OUTLINED_FUNCTION_5_0(&dword_20DABC000, "SecKeyProxy:clientConnectionHandler(firstClientConnected: %d, connectedClients: %d)", v3, v4);
}

void __63__SOAuthorizationRequest__createSecKeyProxiesForSecKeys_error___block_invoke_7_cold_1(uint64_t a1, uint64_t a2, int a3)
{
  uint8_t *v3;
  NSObject *v4;

  OUTLINED_FUNCTION_4_0(a1, a2, a3, 1.5047e-36);
  OUTLINED_FUNCTION_5_0(&dword_20DABC000, "SecKeyProxy:clientDisconnectionHandler(lastClientDisconnected: %d, connectedClients: %d)", v3, v4);
}

@end

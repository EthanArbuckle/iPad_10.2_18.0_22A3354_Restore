@implementation AKIDPHandler

- (AKIDPHandler)initWithConfiguration:(id)a3 withCompletionHandler:(id)a4
{
  id v7;
  id v8;
  AKIDPHandler *v9;
  AKIDPHandler *v10;
  uint64_t v11;
  id completion;
  AKURLRequestApprover *v13;
  void *v14;
  uint64_t v15;
  AKURLRequestApprover *redirectApprover;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)AKIDPHandler;
  v9 = -[AKIDPHandler init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_configuration, a3);
    v11 = MEMORY[0x1C3B760D8](v8);
    completion = v10->_completion;
    v10->_completion = (id)v11;

    v13 = [AKURLRequestApprover alloc];
    objc_msgSend(v7, "whitelistedPathURLs");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[AKURLRequestApprover initWithWhitelistedPaths:](v13, "initWithWhitelistedPaths:", v14);
    redirectApprover = v10->_redirectApprover;
    v10->_redirectApprover = (AKURLRequestApprover *)v15;

  }
  return v10;
}

- (void)cancel
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7003);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[AKIDPHandler _completeFlowWithError:](self, "_completeFlowWithError:", v3);

}

- (id)_safeACSDictionaryFromResult:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = (void *)objc_msgSend(v3, "mutableCopy");
  else
    v4 = 0;

  return v4;
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  void *v5;
  id v6;

  v6 = a3;
  -[AKIDPHandler delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "IDPHandler:didFinishLoadingPageInWebView:", self, v6);

}

- (id)_samlJavaScriptQuery
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0D002A0], "bagForAltDSID:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "acsURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
    v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  id v8;
  void *v9;
  AKURLRequestApprover *redirectApprover;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void (**v24)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void (**v30)(id, AKURLRequestApprover *);
  id v31;
  uint8_t buf[8];
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v31 = a3;
  v8 = a4;
  v30 = (void (**)(id, AKURLRequestApprover *))a5;
  redirectApprover = self->_redirectApprover;
  objc_msgSend(v8, "request");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(redirectApprover) = -[AKURLRequestApprover shouldAllowRequest:](redirectApprover, "shouldAllowRequest:", v9);

  _AKLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[AKIDPHandler webView:decidePolicyForNavigationAction:decisionHandler:].cold.1(v8, v11);

  objc_msgSend(v8, "request");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "URL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "absoluteString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D002A0], "bagForAltDSID:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "acsURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "absoluteString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v14, "hasPrefix:", v17);

  if (!v18)
  {
    redirectApprover = (AKURLRequestApprover *)redirectApprover;
LABEL_11:
    v28 = v31;
    goto LABEL_13;
  }
  _AKLogSystem();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BD795000, v19, OS_LOG_TYPE_DEFAULT, "We reached the acsURL path, canceling the webView and providing the request to idMS", buf, 2u);
  }

  objc_msgSend(v8, "request");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "HTTPMethod");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("GET"));

  if (v22)
  {
    -[AKIDPHandler completion](self, "completion");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      -[AKIDPHandler completion](self, "completion");
      v24 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v33 = *MEMORY[0x1E0D00088];
      objc_msgSend(v8, "request");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "URL");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = v26;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, void *, _QWORD))v24)[2](v24, 0, v27, 0);

      -[AKIDPHandler setCompletion:](self, "setCompletion:", 0);
    }
    redirectApprover = 0;
    goto LABEL_11;
  }
  v28 = v31;
  -[AKIDPHandler _completeWithACSPostRequestFromWebView:](self, "_completeWithACSPostRequestFromWebView:", v31);
  redirectApprover = 0;
LABEL_13:
  -[AKIDPHandler delegate](self, "delegate");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v29, "IDPHandler:didStartLoadingPageInWebView:", self, v28);
  v30[2](v30, redirectApprover);

}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  -[AKIDPHandler _completeFlowWithError:](self, "_completeFlowWithError:", a5, a4);
}

- (void)webView:(id)a3 didReceiveAuthenticationChallenge:(id)a4 completionHandler:(id)a5
{
  (*((void (**)(id, uint64_t, _QWORD))a5 + 2))(a5, 1, 0);
}

- (void)_completeWithACSPostRequestFromWebView:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];

  v4 = a3;
  -[AKIDPHandler _samlJavaScriptQuery](self, "_samlJavaScriptQuery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__AKIDPHandler__completeWithACSPostRequestFromWebView___block_invoke;
  v6[3] = &unk_1E7679770;
  v6[4] = self;
  objc_msgSend(v4, "evaluateJavaScript:completionHandler:", v5, v6);

}

void __55__AKIDPHandler__completeWithACSPostRequestFromWebView___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void (**v15)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v16;
  void *v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _AKLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __55__AKIDPHandler__completeWithACSPostRequestFromWebView___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "_safeACSDictionaryFromResult:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("acs_action"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObjectForKey:", CFSTR("acs_action"));
    objc_msgSend(v9, "aaf_toUrlQueryString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(void **)(a1 + 32);
    if (v11 && v12)
    {
      objc_msgSend(v13, "completion");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_msgSend(*(id *)(a1 + 32), "completion");
        v15 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v16 = *MEMORY[0x1E0D00088];
        v18[0] = *MEMORY[0x1E0D00080];
        v18[1] = v16;
        v19[0] = v11;
        v19[1] = v12;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, _QWORD, void *, _QWORD))v15)[2](v15, 0, v17, 0);

        objc_msgSend(*(id *)(a1 + 32), "setCompletion:", 0);
      }
    }
    else
    {
      objc_msgSend(v13, "_completeFlowWithError:", v6);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_completeFlowWithError:", v6);
  }

}

- (id)_sanitizeError:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  id v10;

  v4 = a3;
  if (v4)
  {
    _AKLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[AKIDPHandler _sanitizeError:].cold.2();

    -[AKIDPHandler delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v4;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "IDPHandler:sanitizeError:", self, v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if ((objc_msgSend(v4, "ak_isAuthenticationErrorWithCode:", objc_msgSend(v4, "code")) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7019);
      v8 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v8;
    }
    _AKLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[AKIDPHandler _sanitizeError:].cold.1();

    v10 = v7;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)_completeFlowWithError:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v6;
  id v7;

  v7 = a3;
  -[AKIDPHandler completion](self, "completion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AKIDPHandler completion](self, "completion");
    v5 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[AKIDPHandler _sanitizeError:](self, "_sanitizeError:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, _QWORD, void *))v5)[2](v5, 0, 0, v6);

    -[AKIDPHandler setCompletion:](self, "setCompletion:", 0);
  }

}

- (AKServerRequestConfiguration)configuration
{
  return self->_configuration;
}

- (AKIDPHandlerDelegate)delegate
{
  return (AKIDPHandlerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_redirectApprover, 0);
}

- (void)webView:(void *)a1 decidePolicyForNavigationAction:(NSObject *)a2 decisionHandler:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  _os_log_debug_impl(&dword_1BD795000, a2, OS_LOG_TYPE_DEBUG, "Processing IDP URL navigation: %@", v4, 0xCu);

}

void __55__AKIDPHandler__completeWithACSPostRequestFromWebView___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  v3 = 2112;
  v4 = v0;
  _os_log_debug_impl(&dword_1BD795000, v1, OS_LOG_TYPE_DEBUG, "Evaluating ACS result: %@, error: %@", v2, 0x16u);
  OUTLINED_FUNCTION_5();
}

- (void)_sanitizeError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(&dword_1BD795000, v0, v1, "Sanitized IDP error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_sanitizeError:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(&dword_1BD795000, v0, v1, "IDP error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end

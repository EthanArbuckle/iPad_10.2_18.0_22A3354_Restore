@implementation SOAuthorizationResultClientImpl

- (void)authorizationDidNotHandle:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  SOAuthorizationResultClientImpl *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SO_LOG_SOClientImpl();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[SOAuthorizationResultClientImpl authorizationDidNotHandle:]";
    v9 = 2112;
    v10 = self;
    _os_log_impl(&dword_1CF39B000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v7, 0x16u);
  }

  +[SOErrorHelper errorWithCode:](SOErrorHelper, "errorWithCode:", -5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SOAuthorizationResultClientImpl authorization:didCompleteWithError:](self, "authorization:didCompleteWithError:", v4, v6);

}

- (void)authorizationDidCancel:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  SOAuthorizationResultClientImpl *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SO_LOG_SOClientImpl();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[SOAuthorizationResultClientImpl authorizationDidCancel:]";
    v9 = 2112;
    v10 = self;
    _os_log_impl(&dword_1CF39B000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v7, 0x16u);
  }

  +[SOErrorHelper errorWithCode:](SOErrorHelper, "errorWithCode:", -2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SOAuthorizationResultClientImpl authorization:didCompleteWithError:](self, "authorization:didCompleteWithError:", v4, v6);

}

- (void)authorizationDidComplete:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  SOAuthorizationResultClientImpl *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SO_LOG_SOClientImpl();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[SOAuthorizationResultClientImpl authorizationDidComplete:]";
    v9 = 2112;
    v10 = self;
    _os_log_impl(&dword_1CF39B000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v7, 0x16u);
  }

  +[SOErrorHelper errorWithCode:](SOErrorHelper, "errorWithCode:", -3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SOAuthorizationResultClientImpl authorization:didCompleteWithError:](self, "authorization:didCompleteWithError:", v4, v6);

}

- (void)authorization:(id)a3 didCompleteWithError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD, _QWORD);
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  SOAuthorizationResultClientImpl *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  SO_LOG_SOClientImpl();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136315650;
    v14 = "-[SOAuthorizationResultClientImpl authorization:didCompleteWithError:]";
    v15 = 2114;
    v16 = v7;
    v17 = 2112;
    v18 = self;
    _os_log_impl(&dword_1CF39B000, v8, OS_LOG_TYPE_DEFAULT, "%s error=%{public}@ on %@", (uint8_t *)&v13, 0x20u);
  }

  -[SOAuthorizationResultClientImpl authorizationHandleCredentialCompletion](self, "authorizationHandleCredentialCompletion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[SOAuthorizationResultClientImpl authorizationHandleCredentialCompletion](self, "authorizationHandleCredentialCompletion");
    v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, id))v10)[2](v10, 0, v7);

    -[SOAuthorizationResultClientImpl setAuthorizationHandleCredentialCompletion:](self, "setAuthorizationHandleCredentialCompletion:", 0);
  }
  else
  {
    -[SOAuthorizationResultClientImpl authorizationHandleResponseCompletion](self, "authorizationHandleResponseCompletion");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[SOAuthorizationResultClientImpl authorizationHandleResponseCompletion](self, "authorizationHandleResponseCompletion");
      v12 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, _QWORD, id))v12)[2](v12, 0, 0, v7);

      -[SOAuthorizationResultClientImpl setAuthorizationHandleResponseCompletion:](self, "setAuthorizationHandleResponseCompletion:", 0);
    }
  }
  objc_msgSend((id)_authorizationPool, "removeAuthorization:", v6);

}

- (void)authorization:(id)a3 didCompleteWithHTTPResponse:(id)a4 httpBody:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);
  void *v15;
  void (**v16)(_QWORD, _QWORD, _QWORD, _QWORD);
  int v17;
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  id v26;
  __int16 v27;
  SOAuthorizationResultClientImpl *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  SO_LOG_SOClientImpl();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 136316419;
    v18 = "-[SOAuthorizationResultClientImpl authorization:didCompleteWithHTTPResponse:httpBody:]";
    v19 = 2160;
    v20 = 1752392040;
    v21 = 2117;
    v22 = v9;
    v23 = 2160;
    v24 = 1752392040;
    v25 = 2117;
    v26 = v10;
    v27 = 2112;
    v28 = self;
    _os_log_impl(&dword_1CF39B000, v11, OS_LOG_TYPE_DEFAULT, "%s httpResponse = %{sensitive, mask.hash}@, httpBody = %{sensitive, mask.hash}@ on %@", (uint8_t *)&v17, 0x3Eu);
  }

  -[SOAuthorizationResultClientImpl authorizationHandleCredentialCompletion](self, "authorizationHandleCredentialCompletion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    SO_LOG_SOClientImpl();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[SOAuthorizationResultClientImpl authorization:didCompleteWithHTTPResponse:httpBody:].cold.1();

    -[SOAuthorizationResultClientImpl authorizationHandleCredentialCompletion](self, "authorizationHandleCredentialCompletion");
    v14 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v14[2](v14, 0, _unexpectedResponseError);

    -[SOAuthorizationResultClientImpl setAuthorizationHandleCredentialCompletion:](self, "setAuthorizationHandleCredentialCompletion:", 0);
  }
  else
  {
    -[SOAuthorizationResultClientImpl authorizationHandleResponseCompletion](self, "authorizationHandleResponseCompletion");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[SOAuthorizationResultClientImpl authorizationHandleResponseCompletion](self, "authorizationHandleResponseCompletion");
      v16 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, uint64_t, id, _QWORD))v16)[2](v16, objc_msgSend(v9, "_CFURLResponse"), v10, 0);

      -[SOAuthorizationResultClientImpl setAuthorizationHandleResponseCompletion:](self, "setAuthorizationHandleResponseCompletion:", 0);
    }
  }
  objc_msgSend((id)_authorizationPool, "removeAuthorization:", v8);

}

- (void)authorization:(id)a3 didCompleteWithHTTPAuthorizationHeaders:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  void *v11;
  NSObject *v12;
  void (**v13)(_QWORD, _QWORD, _QWORD, _QWORD);
  int v14;
  const char *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  __int16 v20;
  SOAuthorizationResultClientImpl *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  SO_LOG_SOClientImpl();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 136315907;
    v15 = "-[SOAuthorizationResultClientImpl authorization:didCompleteWithHTTPAuthorizationHeaders:]";
    v16 = 2160;
    v17 = 1752392040;
    v18 = 2117;
    v19 = v7;
    v20 = 2112;
    v21 = self;
    _os_log_impl(&dword_1CF39B000, v8, OS_LOG_TYPE_DEFAULT, "%s httpAuthorizationHeaders = %{sensitive, mask.hash}@ on %@", (uint8_t *)&v14, 0x2Au);
  }

  -[SOAuthorizationResultClientImpl authorizationHandleCredentialCompletion](self, "authorizationHandleCredentialCompletion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[SOAuthorizationResultClientImpl authorizationHandleCredentialCompletion](self, "authorizationHandleCredentialCompletion");
    v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, _QWORD))v10)[2](v10, v7, 0);

    -[SOAuthorizationResultClientImpl setAuthorizationHandleCredentialCompletion:](self, "setAuthorizationHandleCredentialCompletion:", 0);
  }
  else
  {
    -[SOAuthorizationResultClientImpl authorizationHandleResponseCompletion](self, "authorizationHandleResponseCompletion");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      SO_LOG_SOClientImpl();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[SOAuthorizationResultClientImpl authorization:didCompleteWithHTTPResponse:httpBody:].cold.1();

      -[SOAuthorizationResultClientImpl authorizationHandleResponseCompletion](self, "authorizationHandleResponseCompletion");
      v13 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v13[2](v13, 0, 0, _unexpectedResponseError);

      -[SOAuthorizationResultClientImpl setAuthorizationHandleResponseCompletion:](self, "setAuthorizationHandleResponseCompletion:", 0);
    }
  }
  objc_msgSend((id)_authorizationPool, "removeAuthorization:", v6);

}

- (id)authorizationHandleResponseCompletion
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setAuthorizationHandleResponseCompletion:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (id)authorizationHandleCredentialCompletion
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setAuthorizationHandleCredentialCompletion:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_authorizationHandleCredentialCompletion, 0);
  objc_storeStrong(&self->_authorizationHandleResponseCompletion, 0);
}

- (void)authorization:didCompleteWithHTTPResponse:httpBody:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2_0(&dword_1CF39B000, v0, v1, "unexpected response from the extension - check type of the extension (redirect/credential)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end

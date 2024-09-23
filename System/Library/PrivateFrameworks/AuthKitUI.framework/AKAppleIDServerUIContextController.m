@implementation AKAppleIDServerUIContextController

- (void)tearDownContext
{
  id serverUICompletion;
  NSURL *initiatingURL;

  serverUICompletion = self->_serverUICompletion;
  self->_serverUICompletion = 0;

  initiatingURL = self->_initiatingURL;
  self->_initiatingURL = 0;

}

- (AKAppleIDServerUIContextController)initWithRequestConfiguration:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  AKAppleIDServerUIContextController *v9;
  uint64_t v10;
  AKAppleIDServerResourceLoadDelegate *serverUIDelegate;
  uint64_t v12;
  id serverUICompletion;
  void *v14;
  uint64_t v15;
  NSURL *initiatingURL;
  uint64_t v17;
  AKAppleIDServerUIDataHarvester *serverDataHarvester;

  v7 = a3;
  v8 = a4;
  v9 = -[AKAppleIDServerUIContextController init](self, "init");
  if (v9)
  {
    objc_msgSend(v7, "resourceLoadDelegate");
    v10 = objc_claimAutoreleasedReturnValue();
    serverUIDelegate = v9->_serverUIDelegate;
    v9->_serverUIDelegate = (AKAppleIDServerResourceLoadDelegate *)v10;

    v12 = MEMORY[0x1C3B760D8](v8);
    serverUICompletion = v9->_serverUICompletion;
    v9->_serverUICompletion = (id)v12;

    objc_msgSend(v7, "request");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "URL");
    v15 = objc_claimAutoreleasedReturnValue();
    initiatingURL = v9->_initiatingURL;
    v9->_initiatingURL = (NSURL *)v15;

    objc_storeStrong((id *)&v9->_configuration, a3);
    v17 = objc_opt_new();
    serverDataHarvester = v9->_serverDataHarvester;
    v9->_serverDataHarvester = (AKAppleIDServerUIDataHarvester *)v17;

  }
  return v9;
}

- (BOOL)handleAuthKitActionAttribute:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    _AKLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = v4;
      _os_log_impl(&dword_1BD795000, v5, OS_LOG_TYPE_DEFAULT, "Detected BuddyML button tap with %@ action", (uint8_t *)&v11, 0xCu);
    }

  }
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CFFED0]))
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v7 = -7038;
LABEL_9:
    objc_msgSend(v6, "ak_errorWithCode:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKAppleIDServerUIContextController completeWithError:](self, "completeWithError:", v8);

    goto LABEL_10;
  }
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CFFEC0]))
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v7 = -7003;
    goto LABEL_9;
  }
  if (!objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CFFEC8]))
  {
    v9 = 0;
    goto LABEL_11;
  }
  -[AKAppleIDServerUIContextController completeWithFinalResponse:](self, "completeWithFinalResponse:", self->_latestReadResponse);
LABEL_10:
  v9 = 1;
LABEL_11:

  return v9;
}

- (void)signRequest:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  NSObject *v11;

  v6 = a3;
  v7 = a4;
  if (-[AKServerRequestConfiguration presentationType](self->_configuration, "presentationType"))
  {
    objc_msgSend(v6, "URL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqual:", self->_initiatingURL);

    if (v9)
    {
      -[AKAppleIDServerUIContextController _headerValueFromType:](self, "_headerValueFromType:", -[AKServerRequestConfiguration presentationType](self->_configuration, "presentationType"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      _AKLogSystem();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[AKAppleIDServerUIContextController signRequest:withCompletionHandler:].cold.1((uint64_t)v10, v11);

      if (v10)
        objc_msgSend(v6, "setValue:forHTTPHeaderField:", v10, CFSTR("X-Apple-ServerUI-Action"));

    }
  }
  -[AKAppleIDServerResourceLoadDelegate signRequest:withCompletionHandler:](self->_serverUIDelegate, "signRequest:withCompletionHandler:", v6, v7);

}

- (id)_headerValueFromType:(unint64_t)a3
{
  if (a3 - 1 > 2)
    return 0;
  else
    return off_1E7678C10[a3 - 1];
}

- (void)processResponse:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _AKLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_1BD795000, v6, OS_LOG_TYPE_DEFAULT, "Processing a server UI response: %@", (uint8_t *)&v8, 0xCu);
  }

  if (objc_msgSend(MEMORY[0x1E0D00138], "signalFromServerResponse:", v5) == 6)
    objc_storeStrong((id *)&self->_latestReadResponse, a3);
  if (v5)
  {
    -[AKAppleIDServerUIContextController serverDataHarvester](self, "serverDataHarvester");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "harvestDataFromServerHTTPResponse:", v5);

    -[AKAppleIDServerResourceLoadDelegate processResponse:](self->_serverUIDelegate, "processResponse:", v5);
  }

}

- (void)completeWithError:(id)a3
{
  -[AKAppleIDServerUIContextController _completeWithResponse:additionalData:error:](self, "_completeWithResponse:additionalData:error:", 0, 0, a3);
}

- (void)completeWithError:(id)a3 additionalData:(id)a4
{
  -[AKAppleIDServerUIContextController _completeWithResponse:additionalData:error:](self, "_completeWithResponse:additionalData:error:", 0, a4, a3);
}

- (void)completeWithFinalResponse:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[AKAppleIDServerUIContextController serverDataHarvester](self, "serverDataHarvester");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "harvestedData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAppleIDServerUIContextController _completeWithResponse:additionalData:error:](self, "_completeWithResponse:additionalData:error:", v4, v5, 0);

}

- (void)_completeWithResponse:(id)a3 additionalData:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void (**serverUICompletion)(id, id, id, void *);
  void *v17;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (self->_serverUICompletion)
  {
    if (v8)
    {
      _AKLogSystem();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v18 = 138412290;
        v19 = v8;
        _os_log_impl(&dword_1BD795000, v12, OS_LOG_TYPE_DEFAULT, "Completed server UI request with final response: %@", (uint8_t *)&v18, 0xCu);
      }

      _AKLogSystem();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v8, "allHeaderFields");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138412290;
        v19 = v14;
        _os_log_impl(&dword_1BD795000, v13, OS_LOG_TYPE_DEFAULT, "Final response headers: %@", (uint8_t *)&v18, 0xCu);

      }
    }
    else
    {
      if (!v10)
      {
LABEL_13:
        serverUICompletion = (void (**)(id, id, id, void *))self->_serverUICompletion;
        objc_msgSend(v11, "ac_secureCodingError");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        serverUICompletion[2](serverUICompletion, v8, v9, v17);

        v15 = self->_serverUICompletion;
        self->_serverUICompletion = 0;
        goto LABEL_14;
      }
      _AKLogSystem();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[AKAppleIDServerUIContextController _completeWithResponse:additionalData:error:].cold.2((uint64_t)v11, v13);
    }

    goto LABEL_13;
  }
  _AKLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    -[AKAppleIDServerUIContextController _completeWithResponse:additionalData:error:].cold.1(v15);
LABEL_14:

}

- (AKAppleIDServerResourceLoadDelegate)serverUIDelegate
{
  return self->_serverUIDelegate;
}

- (AKAppleIDServerUIDataHarvester)serverDataHarvester
{
  return self->_serverDataHarvester;
}

- (NSURL)initiatingURL
{
  return self->_initiatingURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initiatingURL, 0);
  objc_storeStrong((id *)&self->_serverDataHarvester, 0);
  objc_storeStrong((id *)&self->_serverUIDelegate, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_latestReadResponse, 0);
  objc_storeStrong(&self->_serverUICompletion, 0);
}

- (void)signRequest:(uint64_t)a1 withCompletionHandler:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1BD795000, a2, OS_LOG_TYPE_DEBUG, "Signing request with presentation action: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_completeWithResponse:(os_log_t)log additionalData:error:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BD795000, log, OS_LOG_TYPE_ERROR, "We're done with the server UI flow client-side, but there's no completion block to call!", v1, 2u);
}

- (void)_completeWithResponse:(uint64_t)a1 additionalData:(NSObject *)a2 error:.cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1BD795000, a2, OS_LOG_TYPE_ERROR, "Completed server UI request with error: %@", (uint8_t *)&v2, 0xCu);
}

@end

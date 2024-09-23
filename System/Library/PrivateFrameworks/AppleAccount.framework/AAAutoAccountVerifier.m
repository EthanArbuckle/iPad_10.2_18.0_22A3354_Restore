@implementation AAAutoAccountVerifier

- (AAAutoAccountVerifier)init
{
  AAAutoAccountVerifier *v2;
  NSOperationQueue *v3;
  NSOperationQueue *requesterQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AAAutoAccountVerifier;
  v2 = -[AAAutoAccountVerifier init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    requesterQueue = v2->_requesterQueue;
    v2->_requesterQueue = v3;

    v2->_attempts = 0;
    v2->_canceled = 0;
  }
  return v2;
}

- (AAAutoAccountVerifier)initWithAccount:(id)a3
{
  id v5;
  AAAutoAccountVerifier *v6;
  AAAutoAccountVerifier *v7;

  v5 = a3;
  v6 = -[AAAutoAccountVerifier init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_account, a3);

  return v7;
}

- (void)sendVerificationEmail
{
  ACAccount *account;

  account = self->_account;
  if (account)
    -[AAAutoAccountVerifier _resendVerificationEmailForAccount:completion:](self, "_resendVerificationEmailForAccount:completion:", account, &__block_literal_global_16);
}

void __46__AAAutoAccountVerifier_sendVerificationEmail__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _AALogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v6)
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_19EACA000, v5, OS_LOG_TYPE_DEFAULT, "Sent verification email", (uint8_t *)&v8, 2u);
    }
  }
  else if (v6)
  {
    objc_msgSend(v4, "localizedDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_19EACA000, v5, OS_LOG_TYPE_DEFAULT, "Error sending verification email: %@", (uint8_t *)&v8, 0xCu);

  }
}

- (void)verifyWithHandler:(id)a3
{
  void *v4;
  id handler;
  dispatch_time_t v6;
  _QWORD block[5];

  if (self->_handler != a3)
  {
    v4 = (void *)objc_msgSend(a3, "copy");
    handler = self->_handler;
    self->_handler = v4;

  }
  v6 = dispatch_time(0, 3000000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__AAAutoAccountVerifier_verifyWithHandler___block_invoke;
  block[3] = &unk_1E416E3A8;
  block[4] = self;
  dispatch_after(v6, MEMORY[0x1E0C80D38], block);
}

uint64_t __43__AAAutoAccountVerifier_verifyWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_verify");
}

- (void)cancel
{
  NSObject *v3;
  MSSearch *search;
  id handler;
  uint8_t v6[16];

  _AALogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_19EACA000, v3, OS_LOG_TYPE_DEFAULT, "Verifier canceling all operations", v6, 2u);
  }

  self->_canceled = 1;
  -[NSOperationQueue cancelAllOperations](self->_requesterQueue, "cancelAllOperations");
  -[MSSearch cancel](self->_search, "cancel");
  search = self->_search;
  self->_search = 0;

  handler = self->_handler;
  if (handler)
    (*((void (**)(id, _QWORD, _QWORD))handler + 2))(handler, 0, 0);
}

- (void)_verify
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMSResultsKeySubject(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("AAAutoAccountVerifier.m"), 34, CFSTR("%s"), OUTLINED_FUNCTION_9());

  __break(1u);
}

- (void)_validateToken:(id)a3
{
  id v4;
  NSObject *v5;
  AACompleteEmailVettingRequest *v6;
  AARequester *v7;
  AARequester *v8;
  _QWORD v9[5];
  uint8_t buf[16];

  v4 = a3;
  _AALogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19EACA000, v5, OS_LOG_TYPE_DEFAULT, "Validating token", buf, 2u);
  }

  v6 = -[AACompleteEmailVettingRequest initWithAccount:token:]([AACompleteEmailVettingRequest alloc], "initWithAccount:token:", self->_account, v4);
  v7 = [AARequester alloc];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __40__AAAutoAccountVerifier__validateToken___block_invoke;
  v9[3] = &unk_1E416FC70;
  v9[4] = self;
  v8 = -[AARequester initWithRequest:handler:](v7, "initWithRequest:handler:", v6, v9);
  -[NSOperationQueue addOperation:](self->_requesterQueue, "addOperation:", v8);

}

void __40__AAAutoAccountVerifier__validateToken___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  __CFString *v7;
  _BOOL8 v8;
  id v9;
  NSObject *v10;
  const __CFString *v11;
  uint64_t v12;
  void *v13;
  int v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    _AALogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "error");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "description");
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v14 = 138412290;
      v15 = v7;
      _os_log_impl(&dword_19EACA000, v5, OS_LOG_TYPE_DEFAULT, "Error vetting email address: %@", (uint8_t *)&v14, 0xCu);

    }
    v8 = 0;
  }
  else
  {
    v9 = v3;
    v8 = !objc_msgSend(v9, "vettingStatus") || objc_msgSend(v9, "vettingStatus") == 1;

  }
  _AALogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = CFSTR("Not validated");
    if (v8)
      v11 = CFSTR("Validated");
    v14 = 138412290;
    v15 = v11;
    _os_log_impl(&dword_19EACA000, v10, OS_LOG_TYPE_DEFAULT, "Calling handler with validation result: %@", (uint8_t *)&v14, 0xCu);
  }

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(v3, "error");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _BOOL8, void *))(v12 + 16))(v12, v8, v13);

}

- (void)_resendVerificationEmailForAccount:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  AAInitiateEmailVettingRequest *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v6 = a3;
  v7 = -[AAEmailVettingRequest initWithAccount:]([AAInitiateEmailVettingRequest alloc], "initWithAccount:", v6);

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __71__AAAutoAccountVerifier__resendVerificationEmailForAccount_completion___block_invoke;
  v9[3] = &unk_1E416E208;
  v10 = v5;
  v8 = v5;
  -[AARequest performRequestWithHandler:](v7, "performRequestWithHandler:", v9);

}

void __71__AAAutoAccountVerifier__resendVerificationEmailForAccount_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  if (a3)
  {
    objc_msgSend(a3, "error");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

- (BOOL)search:(id)a3 didFindResults:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  BOOL v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  id v28;
  AAAutoAccountVerifier *v30;
  id *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t v37[128];
  uint8_t buf[4];
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  _AALogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19EACA000, v6, OS_LOG_TYPE_DEFAULT, "search founds results", buf, 2u);
  }

  if (objc_msgSend(v5, "count"))
  {
    v30 = self;
    _AALogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v39 = v5;
      _os_log_impl(&dword_19EACA000, v7, OS_LOG_TYPE_DEFAULT, "Email search found results: %@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v32 = v5;
    v10 = v5;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v34 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          getMSResultsKeyDateSent();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKey:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v15, "objectForKey:", _AAVettingToken);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "lastObject");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
          {
            objc_msgSend(v8, "setValue:forKey:", v19, v17);
            objc_msgSend(v9, "addObject:", v19);
            _AALogSystem();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v39 = v19;
              _os_log_impl(&dword_19EACA000, v20, OS_LOG_TYPE_DEFAULT, "Found token: %@", buf, 0xCu);
            }

          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v12);
    }

    v21 = objc_msgSend(v9, "count");
    v22 = v21 == 0;
    if (v21)
    {
      objc_msgSend(v8, "allKeys");
      v23 = (id)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if ((unint64_t)objc_msgSend(v23, "count") >= 2)
      {
        objc_msgSend(v23, "sortedArrayUsingSelector:", sel_compare_);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v24, "lastObject", v30);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      _AALogSystem();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v39 = v26;
        _os_log_impl(&dword_19EACA000, v27, OS_LOG_TYPE_DEFAULT, "Most recent token: %@", buf, 0xCu);
      }

      objc_msgSend(v31, "_validateToken:", v26);
      objc_msgSend(v31[1], "cancel");
      v28 = v31[1];
      v31[1] = 0;

    }
    v5 = v32;
  }
  else
  {
    v22 = 1;
  }

  return v22;
}

- (void)search:(id)a3 didFinishWithError:(id)a4
{
  id v5;
  NSObject *v6;
  MSSearch *search;
  MSSearch *v8;
  dispatch_time_t v9;
  _QWORD block[5];
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  _AALogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v5;
    _os_log_impl(&dword_19EACA000, v6, OS_LOG_TYPE_DEFAULT, "Email search finished with error: %@", buf, 0xCu);
  }

  search = self->_search;
  if (search)
  {
    -[MSSearch cancel](search, "cancel");
    v8 = self->_search;
    self->_search = 0;

    if (v5 && objc_msgSend(v5, "code") != 1501)
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __51__AAAutoAccountVerifier_search_didFinishWithError___block_invoke;
      v11[3] = &unk_1E416E8E8;
      v11[4] = self;
      v12 = v5;
      dispatch_async(MEMORY[0x1E0C80D38], v11);

    }
    else if (!self->_canceled)
    {
      v9 = dispatch_time(0, 5000000000);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __51__AAAutoAccountVerifier_search_didFinishWithError___block_invoke_2;
      block[3] = &unk_1E416E3A8;
      block[4] = self;
      dispatch_after(v9, MEMORY[0x1E0C80D38], block);
    }
  }

}

uint64_t __51__AAAutoAccountVerifier_search_didFinishWithError___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, *(_QWORD *)(a1 + 40));
  return result;
}

uint64_t __51__AAAutoAccountVerifier_search_didFinishWithError___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_verify");
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_requesterQueue, 0);
  objc_storeStrong((id *)&self->_search, 0);
}

@end

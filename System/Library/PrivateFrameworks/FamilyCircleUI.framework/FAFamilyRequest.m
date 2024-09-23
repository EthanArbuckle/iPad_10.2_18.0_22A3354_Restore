@implementation FAFamilyRequest

- (FAFamilyRequest)initWithGrandSlamSigner:(id)a3
{
  id v4;
  FAFamilyRequest *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  ACAccount *appleAccount;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FAFamilyRequest;
  v5 = -[AAFamilyRequest initWithGrandSlamSigner:](&v11, sel_initWithGrandSlamSigner_, v4);
  if (v5)
  {
    objc_msgSend(v4, "accountStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "grandSlamAccount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "aida_iCloudAccountMatchingAppleIDAuthAccount:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    appleAccount = v5->_appleAccount;
    v5->_appleAccount = (ACAccount *)v8;

  }
  return v5;
}

- (void)_configureRequest:(id)a3 includePayload:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a4;
  v9 = a3;
  v6 = objc_alloc(MEMORY[0x24BE30AE0]);
  -[FAFamilyRequest appleAccount](self, "appleAccount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithAccount:", v7);

  objc_msgSend(v8, "setAttachSetupHeader:", 0);
  objc_msgSend(v8, "addFresnoHeadersToRequest:", v9);
  if (v4)
    objc_msgSend(v8, "addFresnoPayloadToRequest:additionalPayload:", v9, 0);

}

- (id)_endpoint
{
  return (id)*MEMORY[0x24BE30A08];
}

- (id)_queryString
{
  return 0;
}

- (void)_baseURLForEndpoint:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __54__FAFamilyRequest__baseURLForEndpoint_withCompletion___block_invoke;
  v10[3] = &unk_24C88D6D0;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  objc_msgSend(v7, "URLForEndpoint:withCompletion:", v9, v10);

}

void __54__FAFamilyRequest__baseURLForEndpoint_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a2;
  _FALogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = 138412290;
      v11 = v9;
      _os_log_impl(&dword_20DE41000, v8, OS_LOG_TYPE_DEFAULT, "Recieved url for endpoint %@", (uint8_t *)&v10, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __54__FAFamilyRequest__baseURLForEndpoint_withCompletion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_decoratedURLWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[FAFamilyRequest _endpoint](self, "_endpoint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __47__FAFamilyRequest__decoratedURLWithCompletion___block_invoke;
  v7[3] = &unk_24C88D6F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[FAFamilyRequest _baseURLForEndpoint:withCompletion:](self, "_baseURLForEndpoint:withCompletion:", v5, v7);

}

void __47__FAFamilyRequest__decoratedURLWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    _FALogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __47__FAFamilyRequest__decoratedURLWithCompletion___block_invoke_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1808], "componentsWithURL:resolvingAgainstBaseURL:", v5, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_queryString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setQuery:", v9);

    v10 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v8, "URL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v10 + 16))(v10, v11, 0);

  }
}

- (void)URLRequestWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  FAFamilyRequest *v11;
  id v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FAFamilyRequest;
  -[AAFamilyRequest urlRequest](&v13, sel_urlRequest);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __44__FAFamilyRequest_URLRequestWithCompletion___block_invoke;
  v9[3] = &unk_24C88D720;
  v10 = v6;
  v11 = self;
  v12 = v4;
  v7 = v4;
  v8 = v6;
  -[FAFamilyRequest _decoratedURLWithCompletion:](self, "_decoratedURLWithCompletion:", v9);

}

void __44__FAFamilyRequest_URLRequestWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "setURL:", a2);
  objc_msgSend(*(id *)(a1 + 40), "_configureRequest:includePayload:", *(_QWORD *)(a1 + 32), 0);
  objc_msgSend(*(id *)(a1 + 32), "setHTTPMethod:", CFSTR("GET"));
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (id)urlRequest
{
  NSObject *v3;
  dispatch_semaphore_t v4;
  NSObject *v5;
  id v6;
  _QWORD v8[4];
  NSObject *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  _FALogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    -[FAFamilyRequest urlRequest].cold.1(v3);

  v4 = dispatch_semaphore_create(0);
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__8;
  v15 = __Block_byref_object_dispose__8;
  v16 = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __29__FAFamilyRequest_urlRequest__block_invoke;
  v8[3] = &unk_24C88D748;
  v10 = &v11;
  v5 = v4;
  v9 = v5;
  -[FAFamilyRequest URLRequestWithCompletion:](self, "URLRequestWithCompletion:", v8);
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __29__FAFamilyRequest_urlRequest__block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (ACAccount)appleAccount
{
  return self->_appleAccount;
}

- (void)setAppleAccount:(id)a3
{
  objc_storeStrong((id *)&self->_appleAccount, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appleAccount, 0);
}

void __54__FAFamilyRequest__baseURLForEndpoint_withCompletion___block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_1();
  _os_log_error_impl(&dword_20DE41000, v0, OS_LOG_TYPE_ERROR, "No url received %@", v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

void __47__FAFamilyRequest__decoratedURLWithCompletion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_1();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_20DE41000, v1, OS_LOG_TYPE_ERROR, "Unable to decorate URL %@ error %@", v2, 0x16u);
  OUTLINED_FUNCTION_2();
}

- (void)urlRequest
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20DE41000, log, OS_LOG_TYPE_ERROR, "Please use URLRequestWithCompletion:", v1, 2u);
}

@end

@implementation ENChaffTestResultSession

- (id)_initWithAgencyAPIKey:(id)a3 certificateURL:(id)a4 queue:(id)a5 region:(id)a6 uploadURL:(id)a7 URLSession:(id)a8 verifyURL:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  ENChaffTestResultSession *v22;
  uint64_t v23;
  NSString *agencyAPIKey;
  uint64_t v25;
  ENRegion *region;
  uint64_t v27;
  NSURL *certificateURL;
  uint64_t v29;
  NSURL *uploadURL;
  uint64_t v31;
  NSURL *verificationURL;
  objc_super v34;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v34.receiver = self;
  v34.super_class = (Class)ENChaffTestResultSession;
  v22 = -[ENChaffTestResultSession init](&v34, sel_init);
  if (v22)
  {
    v23 = objc_msgSend(v15, "copy");
    agencyAPIKey = v22->_agencyAPIKey;
    v22->_agencyAPIKey = (NSString *)v23;

    objc_storeStrong((id *)&v22->_queue, a5);
    v25 = objc_msgSend(v18, "copy");
    region = v22->_region;
    v22->_region = (ENRegion *)v25;

    objc_storeStrong((id *)&v22->_URLSession, a8);
    v27 = objc_msgSend(v16, "copy");
    certificateURL = v22->_certificateURL;
    v22->_certificateURL = (NSURL *)v27;

    v29 = objc_msgSend(v19, "copy");
    uploadURL = v22->_uploadURL;
    v22->_uploadURL = (NSURL *)v29;

    v31 = objc_msgSend(v21, "copy");
    verificationURL = v22->_verificationURL;
    v22->_verificationURL = (NSURL *)v31;

  }
  return v22;
}

- (void)dealloc
{
  objc_super v3;

  -[ENChaffTestResultSession _invalidate](self, "_invalidate");
  v3.receiver = self;
  v3.super_class = (Class)ENChaffTestResultSession;
  -[ENChaffTestResultSession dealloc](&v3, sel_dealloc);
}

+ (id)sessionWithConfiguration:(id)a3 URLSession:(id)a4 queue:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v10, "testVerificationAPIKey");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v10, "testVerificationCertificateURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v10, "testVerificationURL");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        objc_msgSend(v10, "tekUploadURL");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v17 = objc_alloc((Class)a1);
          objc_msgSend(v10, "region");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = (void *)objc_msgSend(v17, "_initWithAgencyAPIKey:certificateURL:queue:region:uploadURL:URLSession:verifyURL:", v13, v14, v12, v18, v16, v11, v15);

        }
        else if (a6)
        {
          ENTestResultErrorF(10);
          v19 = 0;
          *a6 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v19 = 0;
        }

      }
      else if (a6)
      {
        ENTestResultErrorF(10);
        v19 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v19 = 0;
      }

    }
    else if (a6)
    {
      ENTestResultErrorF(10);
      v19 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = 0;
    }

  }
  else if (a6)
  {
    ENTestResultErrorF(10);
    v19 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (void)_invalidate
{
  ENTestResultNetworkRequest *networkRequest;
  id v4;

  if (self->_state <= 4)
  {
    self->_state = 5;
    -[ENTestResultNetworkRequest invalidate](self->_networkRequest, "invalidate");
    networkRequest = self->_networkRequest;
    self->_networkRequest = 0;

    ENTestResultErrorF(5);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[ENChaffTestResultSession _callCompletionIfNecessaryWithError:](self, "_callCompletionIfNecessaryWithError:", v4);

  }
}

- (void)sendChaffMessagesWithCompletion:(id)a3
{
  void (**v4)(id, void *);
  int64_t state;
  void *v6;
  id completion;
  void *v8;
  void (**v9)(id, void *);

  v4 = (void (**)(id, void *))a3;
  state = self->_state;
  v9 = v4;
  if (state)
  {
    ENErrorF();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v8);

  }
  else
  {
    v6 = (void *)objc_msgSend(v4, "copy");
    completion = self->_completion;
    self->_completion = v6;

    -[ENChaffTestResultSession _sendVerificationChaffRequest](self, "_sendVerificationChaffRequest");
  }

}

- (void)_sendVerificationChaffRequest
{
  void *v3;
  _QWORD v4[5];

  if (self->_state <= 0)
  {
    self->_state = 1;
    -[ENChaffTestResultSession verificationURL](self, "verificationURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __57__ENChaffTestResultSession__sendVerificationChaffRequest__block_invoke;
    v4[3] = &unk_1E87D9C28;
    v4[4] = self;
    -[ENChaffTestResultSession _sendChaffRequestWithURL:useAPIKey:successHandler:](self, "_sendChaffRequestWithURL:useAPIKey:successHandler:", v3, 1, v4);

  }
}

void __57__ENChaffTestResultSession__sendVerificationChaffRequest__block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;
  dispatch_time_t v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD block[5];

  v2 = (double)(arc4random_uniform(0x78u) + 60);
  CFPrefs_GetDouble();
  if (v3 != 0.0)
    v2 = v3;
  objc_msgSend(MEMORY[0x1E0CB38A0], "processInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "environment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("XCTestSessionIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = 100000000;
  else
    v7 = (uint64_t)(v2 * 1000000000.0);
  v8 = dispatch_time(0, v7);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(NSObject **)(v9 + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__ENChaffTestResultSession__sendVerificationChaffRequest__block_invoke_2;
  block[3] = &unk_1E87D9C28;
  block[4] = v9;
  dispatch_after(v8, v10, block);
}

uint64_t __57__ENChaffTestResultSession__sendVerificationChaffRequest__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendCertificateChaffRequest");
}

- (void)_sendCertificateChaffRequest
{
  void *v3;
  _QWORD v4[5];

  if (self->_state <= 1)
  {
    self->_state = 2;
    -[ENChaffTestResultSession certificateURL](self, "certificateURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __56__ENChaffTestResultSession__sendCertificateChaffRequest__block_invoke;
    v4[3] = &unk_1E87D9C28;
    v4[4] = self;
    -[ENChaffTestResultSession _sendChaffRequestWithURL:useAPIKey:successHandler:](self, "_sendChaffRequestWithURL:useAPIKey:successHandler:", v3, 1, v4);

  }
}

uint64_t __56__ENChaffTestResultSession__sendCertificateChaffRequest__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendUploadChaffRequest");
}

- (void)_sendUploadChaffRequest
{
  void *v3;
  _QWORD v4[5];

  if (self->_state <= 2)
  {
    self->_state = 3;
    -[ENChaffTestResultSession uploadURL](self, "uploadURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __51__ENChaffTestResultSession__sendUploadChaffRequest__block_invoke;
    v4[3] = &unk_1E87D9C28;
    v4[4] = self;
    -[ENChaffTestResultSession _sendChaffRequestWithURL:useAPIKey:successHandler:](self, "_sendChaffRequestWithURL:useAPIKey:successHandler:", v3, 0, v4);

  }
}

uint64_t __51__ENChaffTestResultSession__sendUploadChaffRequest__block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = 4;
  return objc_msgSend(*(id *)(a1 + 32), "_callCompletionIfNecessaryWithError:", 0);
}

- (void)_sendChaffRequestWithURL:(id)a3 useAPIKey:(BOOL)a4 successHandler:(id)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  ENTestResultChaffRequest *v10;
  NSString *agencyAPIKey;
  ENTestResultNetworkRequest *networkRequest;
  ENTestResultChaffRequest *v13;
  id v14;
  _QWORD v15[5];
  id v16;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  v10 = -[ENTestResultNetworkRequest initWithRequestURL:URLSession:queue:]([ENTestResultChaffRequest alloc], "initWithRequestURL:URLSession:queue:", v9, self->_URLSession, self->_queue);

  -[ENTestResultNetworkRequest setPaddedRequestSize:](v10, "setPaddedRequestSize:", 3072);
  if (v5)
    agencyAPIKey = self->_agencyAPIKey;
  else
    agencyAPIKey = 0;
  -[ENTestResultNetworkRequest setAPIKey:](v10, "setAPIKey:", agencyAPIKey);
  networkRequest = self->_networkRequest;
  self->_networkRequest = &v10->super;
  v13 = v10;

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __78__ENChaffTestResultSession__sendChaffRequestWithURL_useAPIKey_successHandler___block_invoke;
  v15[3] = &unk_1E87D9C50;
  v15[4] = self;
  v16 = v8;
  v14 = v8;
  -[ENTestResultNetworkRequest resumeWithCompletionHandler:](v13, "resumeWithCompletionHandler:", v15);

}

void __78__ENChaffTestResultSession__sendChaffRequestWithURL_useAPIKey_successHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 16);
  *(_QWORD *)(v4 + 16) = 0;

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "_callCompletionIfNecessaryWithError:", v6);
    objc_msgSend(*(id *)(a1 + 32), "invalidate");
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)_callCompletionIfNecessaryWithError:(id)a3
{
  void (**v4)(_QWORD, _QWORD);
  id completion;
  id v6;

  v6 = a3;
  v4 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17A7E5C](self->_completion);
  if (v4)
  {
    completion = self->_completion;
    self->_completion = 0;

    ((void (**)(_QWORD, id))v4)[2](v4, v6);
  }

}

- (ENRegion)region
{
  return self->_region;
}

- (NSString)agencyAPIKey
{
  return self->_agencyAPIKey;
}

- (NSURL)certificateURL
{
  return self->_certificateURL;
}

- (NSURL)verificationURL
{
  return self->_verificationURL;
}

- (NSURL)uploadURL
{
  return self->_uploadURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uploadURL, 0);
  objc_storeStrong((id *)&self->_verificationURL, 0);
  objc_storeStrong((id *)&self->_certificateURL, 0);
  objc_storeStrong((id *)&self->_agencyAPIKey, 0);
  objc_storeStrong((id *)&self->_region, 0);
  objc_storeStrong((id *)&self->_URLSession, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_networkRequest, 0);
  objc_storeStrong(&self->_completion, 0);
}

@end

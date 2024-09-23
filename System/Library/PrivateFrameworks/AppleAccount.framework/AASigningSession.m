@implementation AASigningSession

+ (id)establishedSessionWithCertURL:(id)a3 sessionURL:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  AASigningSession *v10;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7 && v8)
  {
    v10 = -[AASigningSession initWithCertURL:sessionURL:]([AASigningSession alloc], "initWithCertURL:sessionURL:", v7, v8);
    -[AASigningSession establishSession](v10, "establishSession");
  }
  else if (a5)
  {
    objc_msgSend((id)objc_opt_class(), "_badURLError");
    v10 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)_badURLError
{
  return (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB32E8], -1000, 0);
}

- (AASigningSession)initWithCertURL:(id)a3 sessionURL:(id)a4
{
  id v6;
  id v7;
  AASigningSession *v8;
  uint64_t v9;
  NSString *certURL;
  uint64_t v11;
  NSString *sessionURL;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AASigningSession;
  v8 = -[AASigningSession init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    certURL = v8->_certURL;
    v8->_certURL = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    sessionURL = v8->_sessionURL;
    v8->_sessionURL = (NSString *)v11;

  }
  return v8;
}

- (void)establishSession
{
  NSObject *v3;
  void *v4;
  dispatch_semaphore_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *, void *, void *);
  void *v12;
  AASigningSession *v13;
  dispatch_semaphore_t v14;
  uint8_t buf[16];

  _AALogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19EACA000, v3, OS_LOG_TYPE_DEFAULT, "Fetching absinthe cert", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", self->_certURL);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = dispatch_semaphore_create(0);
  +[AAURLSession sharedSession](AAURLSession, "sharedSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __36__AASigningSession_establishSession__block_invoke;
  v12 = &unk_1E416FE68;
  v13 = self;
  v14 = v5;
  v7 = v5;
  objc_msgSend(v6, "dataTaskWithURL:completion:", v4, &v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resume", v9, v10, v11, v12, v13);

  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
}

void __36__AASigningSession_establishSession__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  AASigningSessionRequest *v26;
  void *v27;
  _QWORD v28[5];
  id v29;
  uint8_t v30[12];
  unsigned int v31;
  _BYTE buf[24];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v7 || v9)
  {
    if (v9)
    {
      _AALogSystem();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v10, "localizedDescription");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v13;
        _os_log_impl(&dword_19EACA000, v12, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);

      }
    }
    *(_QWORD *)buf = 0;
    v31 = 0;
    if (!v7)
    {
      LODWORD(v17) = -1;
LABEL_19:
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 32) = v17;
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
      goto LABEL_20;
    }
  }
  else
  {
    _AALogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = objc_msgSend(v7, "length");
      _os_log_impl(&dword_19EACA000, v11, OS_LOG_TYPE_DEFAULT, "Got Absinthe cert: %lu bytes", buf, 0xCu);
    }

    *(_QWORD *)buf = 0;
    v31 = 0;
  }
  _AALogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v30 = 0;
    _os_log_impl(&dword_19EACA000, v14, OS_LOG_TYPE_DEFAULT, "Initializing absinthe session", v30, 2u);
  }

  v15 = objc_retainAutorelease(v7);
  KxmB0CKvgWt(objc_msgSend(v15, "bytes"), objc_msgSend(v15, "length"));
  if ((_DWORD)v16)
  {
    v17 = v16;
    _AALogSystem();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      __36__AASigningSession_establishSession__block_invoke_cold_1(v17, v18, v19, v20, v21, v22, v23, v24);

    goto LABEL_19;
  }
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", *(_QWORD *)buf, v31);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  Be81a395Bf0(*(uint64_t *)buf);
  v26 = -[AASigningSessionRequest initWithURLString:sessionInfoRequestData:]([AASigningSessionRequest alloc], "initWithURLString:sessionInfoRequestData:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), v25);
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __36__AASigningSession_establishSession__block_invoke_50;
  v28[3] = &unk_1E416F268;
  v27 = *(void **)(a1 + 40);
  v28[4] = *(_QWORD *)(a1 + 32);
  v29 = v27;
  -[AARequest performRequestWithHandler:](v26, "performRequestWithHandler:", v28);

LABEL_20:
}

void __36__AASigningSession_establishSession__block_invoke_50(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint8_t v30[16];

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    _AALogSystem();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      __36__AASigningSession_establishSession__block_invoke_50_cold_2((uint64_t)v9, v23, v24, v25, v26, v27, v28, v29);

    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 32) = -1;
  }
  else
  {
    objc_msgSend(v8, "sessionData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      _AALogSystem();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v30 = 0;
        _os_log_impl(&dword_19EACA000, v11, OS_LOG_TYPE_DEFAULT, "Initialized absinthe session, establishing key", v30, 2u);
      }

      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v13 = objc_retainAutorelease(v10);
      nDYmeMqvWb(v12, objc_msgSend(v13, "bytes"), objc_msgSend(v13, "length"));
      if ((_DWORD)v14)
      {
        v15 = v14;
        _AALogSystem();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          __36__AASigningSession_establishSession__block_invoke_cold_1(v15, v16, v17, v18, v19, v20, v21, v22);

        *(_DWORD *)(*(_QWORD *)(a1 + 32) + 32) = v15;
      }
    }

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

- (id)signatureForData:(id)a3
{
  id v4;
  NSObject *v5;
  NACContextOpaque_ *context;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint8_t v21[4];
  int v22;
  uint64_t v23;

  if (self->_context)
  {
    v23 = 0;
    v22 = 0;
    v4 = a3;
    _AALogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_19EACA000, v5, OS_LOG_TYPE_DEFAULT, "Absinthe signing data", v21, 2u);
    }

    context = self->_context;
    v7 = objc_retainAutorelease(v4);
    v8 = objc_msgSend(v7, "bytes");
    v9 = objc_msgSend(v7, "length");

    t1BoNctgaUu66((uint64_t)context, v8, v9, (uint64_t)&v23);
    if ((_DWORD)v10)
    {
      v11 = v10;
      _AALogSystem();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        __36__AASigningSession_establishSession__block_invoke_cold_1(v11, v12, v13, v14, v15, v16, v17, v18);

      self->_error = v11;
    }
    v19 = 0;
    if (v23 && v22)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      Be81a395Bf0(v23);
    }
  }
  else
  {
    v19 = 0;
  }
  return v19;
}

- (void)dealloc
{
  objc_super v3;

  IW1PcFszqNK((uint64_t)self->_context);
  v3.receiver = self;
  v3.super_class = (Class)AASigningSession;
  -[AASigningSession dealloc](&v3, sel_dealloc);
}

- (int)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionURL, 0);
  objc_storeStrong((id *)&self->_certURL, 0);
}

void __36__AASigningSession_establishSession__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_5(&dword_19EACA000, a2, a3, "Error, status: %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __36__AASigningSession_establishSession__block_invoke_50_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, a2, a3, "Error: failed to initialize absinthe session with error: %@", a5, a6, a7, a8, 2u);
}

@end

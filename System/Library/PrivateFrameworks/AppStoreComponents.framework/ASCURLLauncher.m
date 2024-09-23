@implementation ASCURLLauncher

+ (ASCURLLauncher)sharedLauncher
{
  void *v2;

  v2 = (void *)ASCURLLauncher_testingURLLauncher;
  if (!ASCURLLauncher_testingURLLauncher)
  {
    if (sharedLauncher_onceToken != -1)
      dispatch_once(&sharedLauncher_onceToken, &__block_literal_global_29);
    v2 = (void *)sharedLauncher_sharedLauncher;
  }
  return (ASCURLLauncher *)v2;
}

void __32__ASCURLLauncher_sharedLauncher__block_invoke()
{
  ASCURLLauncher *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [ASCURLLauncher alloc];
  +[ASCServicesConnection sharedConnection](ASCServicesConnection, "sharedConnection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[ASCURLLauncher initWithConnection:](v0, "initWithConnection:", v3);
  v2 = (void *)sharedLauncher_sharedLauncher;
  sharedLauncher_sharedLauncher = v1;

}

- (ASCURLLauncher)initWithConnection:(id)a3
{
  id v5;
  ASCURLLauncher *v6;
  ASCURLLauncher *v7;
  ASCPendingPromises *v8;
  ASCPendingPromises *pendingPromises;
  void *v10;
  void *v11;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ASCURLLauncher;
  v6 = -[ASCURLLauncher init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    v8 = objc_alloc_init(ASCPendingPromises);
    pendingPromises = v7->_pendingPromises;
    v7->_pendingPromises = v8;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v7, sel_daemonConnectionWasLost_, 0x1E7565F68, v5);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v7, sel_daemonConnectionWasLost_, 0x1E7565F88, v5);

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ASCURLLauncher;
  -[ASCURLLauncher dealloc](&v4, sel_dealloc);
}

+ (void)withSharedLauncher:(id)a3 perform:(id)a4
{
  void (**v6)(_QWORD);
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = (void (**)(_QWORD))a4;
  v7 = (id)ASCURLLauncher_testingURLLauncher;
  objc_storeStrong((id *)&ASCURLLauncher_testingURLLauncher, a3);
  v6[2](v6);
  v8 = (void *)ASCURLLauncher_testingURLLauncher;
  ASCURLLauncher_testingURLLauncher = (uint64_t)v7;

}

- (void)daemonConnectionWasLost:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v8 = *MEMORY[0x1E0CB2D50];
  v9[0] = CFSTR("Connection to daemon was lost");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithDomain:code:userInfo:", CFSTR("ASCURLLauncherErrorDomain"), 0, v5);

  -[ASCURLLauncher pendingPromises](self, "pendingPromises");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "finishAllWithError:", v6);

}

- (id)openURL:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id location;

  v4 = a3;
  -[ASCURLLauncher pendingPromises](self, "pendingPromises");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v5);

  v6 = objc_alloc_init(MEMORY[0x1E0CFDBA8]);
  -[ASCURLLauncher connection](self, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "urlLauncherService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __26__ASCURLLauncher_openURL___block_invoke;
  v18[3] = &unk_1E75618E8;
  objc_copyWeak(&v21, &location);
  v10 = v6;
  v19 = v10;
  v11 = v4;
  v20 = v11;
  objc_msgSend(v8, "addSuccessBlock:", v18);
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __26__ASCURLLauncher_openURL___block_invoke_3;
  v16[3] = &unk_1E7560410;
  v12 = v10;
  v17 = v12;
  objc_msgSend(v8, "addErrorBlock:", v16);
  v13 = v17;
  v14 = v12;

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

  return v14;
}

void __26__ASCURLLauncher_openURL___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  uint64_t v6;
  _QWORD v7[4];
  id v8;

  v3 = (id *)(a1 + 48);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "addBinaryPromise:", *(_QWORD *)(a1 + 32));

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __26__ASCURLLauncher_openURL___block_invoke_2;
  v7[3] = &unk_1E7560410;
  v6 = *(_QWORD *)(a1 + 40);
  v8 = *(id *)(a1 + 32);
  objc_msgSend(v4, "openURL:withReplyHandler:", v6, v7);

}

uint64_t __26__ASCURLLauncher_openURL___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "finishWithError:", a2);
  else
    return objc_msgSend(v2, "finishWithSuccess");
}

uint64_t __26__ASCURLLauncher_openURL___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
}

- (ASCServices)connection
{
  return self->_connection;
}

- (ASCPendingPromises)pendingPromises
{
  return self->_pendingPromises;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingPromises, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end

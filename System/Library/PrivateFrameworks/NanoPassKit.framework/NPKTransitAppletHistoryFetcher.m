@implementation NPKTransitAppletHistoryFetcher

- (NPKTransitAppletHistoryFetcher)initWithCallbackQueue:(id)a3
{
  id v5;
  NPKTransitAppletHistoryFetcher *v6;
  NPKTransitAppletHistoryFetcher *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *internalQueue;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NPKTransitAppletHistoryFetcher;
  v6 = -[NPKTransitAppletHistoryFetcher init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_callbackQueue, a3);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("NPKTransitAppletHistoryFetcher", v8);
    internalQueue = v7->_internalQueue;
    v7->_internalQueue = (OS_dispatch_queue *)v9;

  }
  return v7;
}

- (void)setAIDToFetch:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48__NPKTransitAppletHistoryFetcher_setAIDToFetch___block_invoke;
  v7[3] = &unk_24CFE7E40;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

void __48__NPKTransitAppletHistoryFetcher_setAIDToFetch___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));
  pk_Payment_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    pk_Payment_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 40);
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: History fetcher set AID to %@", (uint8_t *)&v6, 0xCu);
    }

  }
}

- (void)requestTransitHistoryFetch
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD block[5];
  uint8_t buf[16];

  pk_Payment_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    pk_Payment_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: History fetcher received fetch request", buf, 2u);
    }

  }
  -[NPKTransitAppletHistoryFetcher internalQueue](self, "internalQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__NPKTransitAppletHistoryFetcher_requestTransitHistoryFetch__block_invoke;
  block[3] = &unk_24CFE7998;
  block[4] = self;
  dispatch_async(v6, block);

}

void __60__NPKTransitAppletHistoryFetcher_requestTransitHistoryFetch__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[8];
  _QWORD v8[5];

  objc_msgSend(*(id *)(a1 + 32), "pendingSessionHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    pk_Payment_log();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

    if (!v4)
      return;
    pk_Payment_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: History fetcher already has an outstanding session handle; not creating a new session.",
        v7,
        2u);
    }
  }
  else
  {
    objc_msgSend((id)PKGetClassNFHardwareManager(), "sharedHardwareManager");
    v5 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __60__NPKTransitAppletHistoryFetcher_requestTransitHistoryFetch__block_invoke_2;
    v8[3] = &unk_24CFE9950;
    v8[4] = *(_QWORD *)(a1 + 32);
    -[NSObject startSecureElementManagerSession:](v5, "startSecureElementManagerSession:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setPendingSessionHandle:", v6);

  }
}

void __60__NPKTransitAppletHistoryFetcher_requestTransitHistoryFetch__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  uint64_t v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "internalQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__NPKTransitAppletHistoryFetcher_requestTransitHistoryFetch__block_invoke_3;
  block[3] = &unk_24CFE8288;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v5;
  v13 = v8;
  v14 = v6;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __60__NPKTransitAppletHistoryFetcher_requestTransitHistoryFetch__block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v3)
  {
    objc_msgSend(v2, "_handleActiveSecureElementManagerSession:");
    objc_msgSend(*(id *)(a1 + 32), "endSession");
  }
  else
  {
    objc_msgSend(v2, "_handleSecureElementSessionFailureWithError:", *(_QWORD *)(a1 + 48));
  }
  return objc_msgSend(*(id *)(a1 + 40), "setPendingSessionHandle:", 0);
}

- (void)_handleActiveSecureElementManagerSession:(id)a3
{
  NSString *v4;
  NSObject *v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  NSString *aidToFetch;
  NSString *v10;
  void *v11;
  void *v12;
  id *v13;
  void *v14;
  Class *v15;
  NSObject *v16;
  NSString *v17;
  NSObject *v18;
  _BOOL4 v19;
  NSObject *v20;
  NSObject *v21;
  _BOOL4 v22;
  NSObject *v23;
  _BOOL4 v24;
  NSObject *v25;
  NSObject *callbackQueue;
  NSString *v27;
  NSString *v28;
  _QWORD block[5];
  NSString *v30;
  NSString *v31;
  uint64_t v32;
  uint64_t v33;
  uint8_t buf[4];
  NSString *v35;
  __int16 v36;
  NSString *v37;
  __int16 v38;
  NSObject *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v4 = (NSString *)a3;
  -[NPKTransitAppletHistoryFetcher internalQueue](self, "internalQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  pk_Payment_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    pk_Payment_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      aidToFetch = self->_aidToFetch;
      *(_DWORD *)buf = 138412546;
      v35 = aidToFetch;
      v36 = 2112;
      v37 = v4;
      _os_log_impl(&dword_213518000, v8, OS_LOG_TYPE_DEFAULT, "Notice: History fetcher (AID %@) got secure element manager session: %@", buf, 0x16u);
    }

  }
  v10 = self->_aidToFetch;
  -[NSString appletWithIdentifier:](v4, "appletWithIdentifier:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    if (objc_msgSend(v11, "isTypeF") && objc_msgSend(v12, "supportedTypeFSystem") == 1)
    {
      v33 = 0;
      v13 = (id *)&v33;
      -[NSString felicaAppletState:error:](v4, "felicaAppletState:error:", v12, &v33);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (Class *)0x24BE6EB18;
    }
    else
    {
      v32 = 0;
      v13 = (id *)&v32;
      -[NSString transitAppletState:error:](v4, "transitAppletState:error:", v12, &v32);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (Class *)0x24BE6EF40;
    }
    v16 = *v13;
    v17 = (NSString *)objc_msgSend(objc_alloc(*v15), "initWithDictionary:source:", v14, 1);

    if (v16)
    {
      pk_General_log();
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);

      if (v19)
      {
        pk_General_log();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          v35 = (NSString *)v12;
          v36 = 2112;
          v37 = v10;
          v38 = 2112;
          v39 = v16;
          _os_log_impl(&dword_213518000, v20, OS_LOG_TYPE_ERROR, "Error: Fail to creat Transit Applet history with Applet:%@ AID:%@ with error:%@", buf, 0x20u);
        }

      }
    }
LABEL_19:

    goto LABEL_20;
  }
  pk_General_log();
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);

  if (v22)
  {
    pk_General_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v35 = v10;
      v36 = 2112;
      v37 = v4;
      _os_log_impl(&dword_213518000, v16, OS_LOG_TYPE_DEFAULT, "Notice: Could not fetch Applet with ID:%@ from session:%@", buf, 0x16u);
    }
    v17 = 0;
    goto LABEL_19;
  }
  v17 = 0;
LABEL_20:
  pk_Payment_log();
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);

  if (v24)
  {
    pk_Payment_log();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v35 = v17;
      v36 = 2112;
      v37 = (NSString *)v12;
      _os_log_impl(&dword_213518000, v25, OS_LOG_TYPE_DEFAULT, "Notice: History fetcher got applet history: %@ for applet: %@", buf, 0x16u);
    }

  }
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __75__NPKTransitAppletHistoryFetcher__handleActiveSecureElementManagerSession___block_invoke;
  block[3] = &unk_24CFE8288;
  block[4] = self;
  v30 = v17;
  v31 = v10;
  v27 = v10;
  v28 = v17;
  dispatch_async(callbackQueue, block);

}

void __75__NPKTransitAppletHistoryFetcher__handleActiveSecureElementManagerSession___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transitAppletHistoryFetcher:gotTransitAppletHistory:forAppletWithAID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)_handleSecureElementSessionFailureWithError:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NPKTransitAppletHistoryFetcher internalQueue](self, "internalQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  pk_Payment_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);

  if (v7)
  {
    pk_Payment_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412290;
      v10 = v4;
      _os_log_impl(&dword_213518000, v8, OS_LOG_TYPE_ERROR, "Error: History fetcher failed to start secure element manager session: %@", (uint8_t *)&v9, 0xCu);
    }

  }
}

- (NPKTransitAppletHistoryFetcherDelegate)delegate
{
  return (NPKTransitAppletHistoryFetcherDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)aidToFetch
{
  return self->_aidToFetch;
}

- (void)setAidToFetch:(id)a3
{
  objc_storeStrong((id *)&self->_aidToFetch, a3);
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void)setInternalQueue:(id)a3
{
  objc_storeStrong((id *)&self->_internalQueue, a3);
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
  objc_storeStrong((id *)&self->_callbackQueue, a3);
}

- (NFSession)pendingSessionHandle
{
  return self->_pendingSessionHandle;
}

- (void)setPendingSessionHandle:(id)a3
{
  objc_storeStrong((id *)&self->_pendingSessionHandle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingSessionHandle, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_aidToFetch, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

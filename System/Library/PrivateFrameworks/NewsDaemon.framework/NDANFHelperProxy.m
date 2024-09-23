@implementation NDANFHelperProxy

- (NDANFHelperProxy)init
{
  NDANFHelperProxy *v2;
  NFUnfairLock *v3;
  NFUnfairLock *xpcConnectionLock;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NDANFHelperProxy;
  v2 = -[NDANFHelperProxy init](&v6, sel_init);
  if (v2)
  {
    v3 = (NFUnfairLock *)objc_alloc_init(MEMORY[0x1E0D60B18]);
    xpcConnectionLock = v2->_xpcConnectionLock;
    v2->_xpcConnectionLock = v3;

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[NDANFHelperProxy xpcConnection](self, "xpcConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)NDANFHelperProxy;
  -[NDANFHelperProxy dealloc](&v4, sel_dealloc);
}

- (id)manifestFromANFDocumentData:(id)a3 reachedService:(BOOL *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v6 = a3;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy_;
  v29 = __Block_byref_object_dispose_;
  v30 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NDANFHelperProxy pushInterest](self, "pushInterest");
  -[NDANFHelperProxy _connectionToXPCService](self, "_connectionToXPCService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __63__NDANFHelperProxy_manifestFromANFDocumentData_reachedService___block_invoke_5;
  v17[3] = &unk_1E9BD9D58;
  v19 = &v21;
  v10 = v7;
  v18 = v10;
  v20 = &v25;
  objc_msgSend(v9, "decodeANFDocumentData:completion:", v6, v17);

  -[NDANFHelperProxy popInterest](self, "popInterest");
  if (a4)
    *a4 = *((_BYTE *)v22 + 24);
  v11 = (void *)v26[5];
  if (!v11)
  {
    v12 = objc_alloc(MEMORY[0x1E0D58900]);
    v13 = objc_msgSend(v12, "initWithNonImageResourceIDs:optimalImageResourceIDs:smallestImageResourceIDs:", MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60]);
    v14 = (void *)v26[5];
    v26[5] = v13;

    v11 = (void *)v26[5];
  }
  v15 = v11;

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);

  return v15;
}

void __63__NDANFHelperProxy_manifestFromANFDocumentData_reachedService___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  v3 = *MEMORY[0x1E0D583E8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D583E8], OS_LOG_TYPE_ERROR))
    __63__NDANFHelperProxy_manifestFromANFDocumentData_reachedService___block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

void __63__NDANFHelperProxy_manifestFromANFDocumentData_reachedService___block_invoke_5(_QWORD *a1, void *a2, void *a3)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[5];
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  v8 = v7;
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
  if (v7)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __63__NDANFHelperProxy_manifestFromANFDocumentData_reachedService___block_invoke_2;
    v12[3] = &unk_1E9BD9D30;
    v12[4] = v7;
    __63__NDANFHelperProxy_manifestFromANFDocumentData_reachedService___block_invoke_2((uint64_t)v12);
  }
  else
  {
    v9 = (void *)*MEMORY[0x1E0D583E8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D583E8], OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)a1[4];
      v11 = v9;
      *(_DWORD *)buf = 134217984;
      v14 = objc_msgSend(v10, "fc_millisecondTimeIntervalUntilNow");
      _os_log_impl(&dword_1D7105000, v11, OS_LOG_TYPE_DEFAULT, "ANFDecoder returned manifest, time=%llums", buf, 0xCu);

    }
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
  }

}

void __63__NDANFHelperProxy_manifestFromANFDocumentData_reachedService___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *MEMORY[0x1E0D583E8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D583E8], OS_LOG_TYPE_ERROR))
    __63__NDANFHelperProxy_manifestFromANFDocumentData_reachedService___block_invoke_2_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);
}

- (id)manifestFromANFDocumentData:(id)a3
{
  return -[NDANFHelperProxy manifestFromANFDocumentData:reachedService:](self, "manifestFromANFDocumentData:reachedService:", a3, 0);
}

- (void)pushInterest
{
  void *v3;
  id v4;

  -[NDANFHelperProxy xpcConnectionLock](self, "xpcConnectionLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  -[NDANFHelperProxy setXpcConnectionInterest:](self, "setXpcConnectionInterest:", -[NDANFHelperProxy xpcConnectionInterest](self, "xpcConnectionInterest") + 1);
  -[NDANFHelperProxy xpcConnectionLock](self, "xpcConnectionLock");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unlock");

}

- (void)popInterest
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  -[NDANFHelperProxy xpcConnectionLock](self, "xpcConnectionLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  -[NDANFHelperProxy setXpcConnectionInterest:](self, "setXpcConnectionInterest:", -[NDANFHelperProxy xpcConnectionInterest](self, "xpcConnectionInterest") - 1);
  if (!-[NDANFHelperProxy xpcConnectionInterest](self, "xpcConnectionInterest"))
  {
    v4 = *MEMORY[0x1E0D583E8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D583E8], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1D7105000, v4, OS_LOG_TYPE_DEFAULT, "ANFDecoder will invalidate connection due to zero interest", v7, 2u);
    }
    -[NDANFHelperProxy xpcConnection](self, "xpcConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invalidate");

    -[NDANFHelperProxy setXpcConnection:](self, "setXpcConnection:", 0);
  }
  -[NDANFHelperProxy xpcConnectionLock](self, "xpcConnectionLock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unlock");

}

- (id)_connectionToXPCService
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[NDANFHelperProxy xpcConnectionLock](self, "xpcConnectionLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  -[NDANFHelperProxy xpcConnection](self, "xpcConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    NDANFDecodingServiceXPCConnection();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDANFHelperProxy setXpcConnection:](self, "setXpcConnection:", v5);

    -[NDANFHelperProxy xpcConnection](self, "xpcConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setInvalidationHandler:", &__block_literal_global_9);

    -[NDANFHelperProxy xpcConnection](self, "xpcConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setInterruptionHandler:", &__block_literal_global_11);

    -[NDANFHelperProxy xpcConnection](self, "xpcConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "activate");

  }
  -[NDANFHelperProxy xpcConnection](self, "xpcConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NDANFHelperProxy xpcConnectionLock](self, "xpcConnectionLock");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "unlock");

  return v9;
}

void __43__NDANFHelperProxy__connectionToXPCService__block_invoke()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = *MEMORY[0x1E0D583E8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D583E8], OS_LOG_TYPE_ERROR))
    __43__NDANFHelperProxy__connectionToXPCService__block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
}

void __43__NDANFHelperProxy__connectionToXPCService__block_invoke_10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = *MEMORY[0x1E0D583E8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D583E8], OS_LOG_TYPE_ERROR))
    __43__NDANFHelperProxy__connectionToXPCService__block_invoke_10_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (int64_t)xpcConnectionInterest
{
  return self->_xpcConnectionInterest;
}

- (void)setXpcConnectionInterest:(int64_t)a3
{
  self->_xpcConnectionInterest = a3;
}

- (NFUnfairLock)xpcConnectionLock
{
  return self->_xpcConnectionLock;
}

- (void)setXpcConnectionLock:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnectionLock, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnectionLock, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

void __63__NDANFHelperProxy_manifestFromANFDocumentData_reachedService___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D7105000, a2, a3, "ANFDecoder connection failed with error: %{public}@", a5, a6, a7, a8, 2u);
}

void __63__NDANFHelperProxy_manifestFromANFDocumentData_reachedService___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D7105000, a2, a3, "ANFDecoder returned error: %{public}@", a5, a6, a7, a8, 2u);
}

void __43__NDANFHelperProxy__connectionToXPCService__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_1D7105000, a1, a3, "ANFDecoder connection invalidated", a5, a6, a7, a8, 0);
}

void __43__NDANFHelperProxy__connectionToXPCService__block_invoke_10_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_1D7105000, a1, a3, "ANFDecoder connection interrupted", a5, a6, a7, a8, 0);
}

@end

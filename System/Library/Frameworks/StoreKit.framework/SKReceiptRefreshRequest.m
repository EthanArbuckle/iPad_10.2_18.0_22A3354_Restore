@implementation SKReceiptRefreshRequest

- (SKReceiptRefreshRequest)initWithReceiptProperties:(NSDictionary *)properties
{
  NSDictionary *v4;
  SKReceiptRefreshRequest *v5;
  uint64_t v6;
  NSDictionary *v7;

  v4 = properties;
  v5 = -[SKRequest init](self, "init");
  if (v5)
  {
    v6 = -[NSDictionary copy](v4, "copy");
    v7 = v5->_properties;
    v5->_properties = (NSDictionary *)v6;

  }
  return v5;
}

- (void)_start
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD aBlock[4];
  id v20;
  id location;
  uint8_t buf[4];
  SKReceiptRefreshRequest *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SKReceiptRefreshRequest _wantsExpired](self, "_wantsExpired"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v4, CFSTR("expired"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SKReceiptRefreshRequest _wantsRevoked](self, "_wantsRevoked"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v5, CFSTR("revoked"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SKReceiptRefreshRequest _wantsVPP](self, "_wantsVPP"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v6, CFSTR("vpp"));

  objc_initWeak(&location, self);
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __33__SKReceiptRefreshRequest__start__block_invoke;
  aBlock[3] = &unk_1E5B27328;
  objc_copyWeak(&v20, &location);
  v8 = _Block_copy(aBlock);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v23 = self;
    _os_log_impl(&dword_1ABFBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Starting receipt refresh request", buf, 0xCu);
  }
  +[SKServiceBroker defaultBroker](SKServiceBroker, "defaultBroker");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v7;
  v17[1] = 3221225472;
  v17[2] = __33__SKReceiptRefreshRequest__start__block_invoke_4;
  v17[3] = &unk_1E5B26C08;
  v10 = v8;
  v18 = v10;
  objc_msgSend(v9, "storeKitServiceWithErrorHandler:", v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[SKRequest paymentQueueClient](self, "paymentQueueClient");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "plist");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v7;
  v15[1] = 3221225472;
  v15[2] = __33__SKReceiptRefreshRequest__start__block_invoke_2_5;
  v15[3] = &unk_1E5B26948;
  v14 = v10;
  v16 = v14;
  objc_msgSend(v11, "renewReceiptWithOptions:client:replyBlock:", v3, v13, v15);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

void __33__SKReceiptRefreshRequest__start__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__SKReceiptRefreshRequest__start__block_invoke_2;
  v5[3] = &unk_1E5B27300;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __33__SKReceiptRefreshRequest__start__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = *(_QWORD *)(a1 + 32);
  v3 = (_QWORD *)(a1 + 32);
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      __33__SKReceiptRefreshRequest__start__block_invoke_2_cold_1((uint64_t)WeakRetained, (uint64_t)v3, v5, v6, v7, v8, v9, v10);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138543362;
    v12 = WeakRetained;
    _os_log_impl(&dword_1ABFBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Finished refreshing receipt", (uint8_t *)&v11, 0xCu);
  }
  objc_msgSend(WeakRetained, "_requestCompletedWithError:", *v3);

}

uint64_t __33__SKReceiptRefreshRequest__start__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __33__SKReceiptRefreshRequest__start__block_invoke_2_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_handleReply:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__SKReceiptRefreshRequest__handleReply___block_invoke;
  v6[3] = &unk_1E5B27350;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __40__SKReceiptRefreshRequest__handleReply___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  CFDictionaryRef v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (*(_QWORD *)(a1 + 40) && MEMORY[0x1AF43BC3C]() == MEMORY[0x1E0C812F8])
    {
      v3 = *(void **)(a1 + 40);
      objc_opt_class();
      v4 = SKXPCDictionaryCopyCFObjectWithClass(v3, "1");
      SKGetErrorForData((uint64_t)v4);
      v2 = (void *)objc_claimAutoreleasedReturnValue();

      if (v2)
      {
LABEL_5:
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v5, "request:didFailWithError:", *(_QWORD *)(a1 + 32), v2);
LABEL_10:

        goto LABEL_11;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SKErrorDomain"), 0, 0);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      if (v2)
        goto LABEL_5;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v5, "requestDidFinish:", *(_QWORD *)(a1 + 32));
    goto LABEL_10;
  }
LABEL_11:

}

- (void)_requestCompletedWithError:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  if (!v4)
    goto LABEL_5;
  v14 = v4;
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("ASDErrorDomain")) & 1) != 0)
  {
    v6 = objc_msgSend(v14, "code");

    if (v6 == 603)
    {

LABEL_5:
      -[SKRequest delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_opt_respondsToSelector();

      if ((v8 & 1) == 0)
      {
        v13 = 0;
        goto LABEL_13;
      }
      -[SKRequest delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "requestDidFinish:", self);
      v14 = 0;
      goto LABEL_10;
    }
  }
  else
  {

  }
  -[SKRequest delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[SKRequest delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _SKErrorFromNSError(v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "request:didFailWithError:", self, v12);

LABEL_10:
  }
  v13 = v14;
LABEL_13:

}

- (BOOL)_wantsExpired
{
  void *v2;
  char v3;

  -[NSDictionary objectForKey:](self->_properties, "objectForKey:", CFSTR("expired"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)_wantsRevoked
{
  void *v2;
  char v3;

  -[NSDictionary objectForKey:](self->_properties, "objectForKey:", CFSTR("revoked"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)_wantsVPP
{
  void *v2;
  char v3;

  -[NSDictionary objectForKey:](self->_properties, "objectForKey:", CFSTR("vpp"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (NSDictionary)receiptProperties
{
  return self->_properties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
}

void __33__SKReceiptRefreshRequest__start__block_invoke_2_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_1ABFBE000, MEMORY[0x1E0C81028], a3, "%{public}@: Finished refreshing receipt with error: %{public}@", a5, a6, a7, a8, 2u);
}

@end

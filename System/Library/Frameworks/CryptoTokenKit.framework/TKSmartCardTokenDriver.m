@implementation TKSmartCardTokenDriver

- (id)createTokenWithSlot:(id)a3 AID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  TKSmartCardSlot *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  TKSmartCardTokenDriver *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  id v41;
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;
  uint8_t v48[24];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__3;
  v38 = __Block_byref_object_dispose__3;
  v39 = 0;
  v10 = -[TKSmartCardSlot initWithEndpoint:error:]([TKSmartCardSlot alloc], "initWithEndpoint:error:", v8, a5);
  if (v10)
  {
    TK_LOG_token_1();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      -[TKSmartCardSlot name](v10, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[TKSmartCardTokenDriver createTokenWithSlot:AID:error:].cold.1(v12, (uint64_t)v9, v48, v11);
    }

    -[TKTokenDriver delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKSmartCardSlot makeSmartCard](v10, "makeSmartCard");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v9)
    {
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __56__TKSmartCardTokenDriver_createTokenWithSlot_AID_error___block_invoke;
      v28[3] = &unk_1E7089F70;
      v29 = v14;
      v30 = v9;
      v33 = &v34;
      v31 = v13;
      v32 = self;
      objc_msgSend(v29, "inSessionWithError:executeBlock:", a5, v28);

      v16 = v29;
    }
    else
    {
      objc_msgSend(v13, "tokenDriver:createTokenForSmartCard:AID:error:", self, v14, 0, a5);
      v17 = objc_claimAutoreleasedReturnValue();
      v16 = (id)v35[5];
      v35[5] = v17;
    }

    if (v35[5])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("SmartCard driver created token not inherited from TKSmartCardToken class (token %@)"), v35[5]);
      objc_msgSend((id)v35[5], "tokenDriver");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "keepAlive");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v35[5], "setKeepAlive:", v19);

    }
    else
    {
      TK_LOG_token_1();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        -[TKSmartCardSlot name](v10, "name");
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = (void *)v25;
        if (a5)
          v27 = *a5;
        else
          v27 = 0;
        *(_DWORD *)buf = 138543874;
        v43 = v25;
        v44 = 2114;
        v45 = v9;
        v46 = 2114;
        v47 = v27;
        _os_log_error_impl(&dword_1B9768000, v22, OS_LOG_TYPE_ERROR, "failed to create token in slot %{public}@ (AID:%{public}@, error:%{public}@)", buf, 0x20u);

      }
      if (!a5)
        goto LABEL_12;
      v23 = (void *)MEMORY[0x1E0CB35C8];
      v24 = *a5;
      if (*a5)
      {
        v40 = *MEMORY[0x1E0CB3388];
        v41 = v24;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v18 = 0;
      }
      objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("CryptoTokenKit"), -7, v18);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      if (!v24)
        goto LABEL_12;
    }

LABEL_12:
  }
  v20 = (id)v35[5];

  _Block_object_dispose(&v34, 8);
  return v20;
}

uint64_t __56__TKSmartCardTokenDriver_createTokenWithSlot_AID_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  if (objc_msgSend(*(id *)(a1 + 32), "selectApplication:error:", *(_QWORD *)(a1 + 40), a2))
  {
    objc_msgSend(*(id *)(a1 + 48), "tokenDriver:createTokenForSmartCard:AID:error:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a2);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
  return 1;
}

- (void)createTokenWithSlot:(uint8_t *)buf AID:(os_log_t)log error:.cold.1(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_1B9768000, log, OS_LOG_TYPE_DEBUG, "create token for token in %{public}@ (AID:%{public}@)", buf, 0x16u);

}

@end

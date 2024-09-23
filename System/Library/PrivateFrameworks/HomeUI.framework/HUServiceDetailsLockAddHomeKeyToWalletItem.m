@implementation HUServiceDetailsLockAddHomeKeyToWalletItem

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char isKindOfClass;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v33[5];
  id v34;
  id v35;
  _BYTE location[12];
  __int16 v37;
  const char *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  int v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0D319D0], "isAnIPhone")
    && (-[HUServiceDetailsAbstractItem sourceServiceItem](self, "sourceServiceItem"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "accessories"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "count"),
        v7,
        v6,
        v8 == 1))
  {
    -[HUServiceDetailsAbstractItem sourceServiceItem](self, "sourceServiceItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "accessories");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "anyObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)objc_opt_new();
    -[HUServiceDetailsAbstractItem home](self, "home");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "na_safeAddObject:", v13);

    objc_msgSend(v12, "na_safeAddObject:", v11);
    v14 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v5, "na_safeSetObject:forKey:", v14, *MEMORY[0x1E0D30B80]);

    _HULocalizedStringWithDefaultValue(CFSTR("HUHomeSettingsLockAddHomeKeyToWallet"), CFSTR("HUHomeSettingsLockAddHomeKeyToWallet"), 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "na_safeSetObject:forKey:", v15, *MEMORY[0x1E0D30D18]);

    if (objc_msgSend(v11, "hf_showAsIndividualServices")
      && (-[HUServiceDetailsAbstractItem sourceServiceItem](self, "sourceServiceItem"),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          isKindOfClass = objc_opt_isKindOfClass(),
          v16,
          (isKindOfClass & 1) == 0))
    {
      objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30D70]);
      v30 = (void *)MEMORY[0x1E0D519C0];
      objc_msgSend(MEMORY[0x1E0D314B8], "outcomeWithResults:", v5);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "futureWithResult:", v31);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else if (objc_msgSend(v11, "supportsWalletKey")
           && (-[HUServiceDetailsAbstractItem home](self, "home"),
               v18 = (void *)objc_claimAutoreleasedReturnValue(),
               v19 = objc_msgSend(v18, "hasOnboardedForWalletKey"),
               v18,
               (v19 & 1) != 0))
    {
      objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D30CE8]);
      objc_initWeak((id *)location, self);
      -[HUServiceDetailsAbstractItem home](self, "home");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "hf_fetchWalletKeyDeviceStateForCurrentDeviceIfNecessary");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __74__HUServiceDetailsLockAddHomeKeyToWalletItem__subclass_updateWithOptions___block_invoke;
      v33[3] = &unk_1E6F604A0;
      v33[4] = self;
      v34 = v5;
      objc_copyWeak(&v35, (id *)location);
      objc_msgSend(v21, "flatMap:", v33);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_destroyWeak(&v35);

      objc_destroyWeak((id *)location);
    }
    else
    {
      HFLogForCategory();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = objc_msgSend(v11, "supportsWalletKey");
        -[HUServiceDetailsAbstractItem home](self, "home");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)location = 138413058;
        *(_QWORD *)&location[4] = self;
        v37 = 2080;
        v38 = "-[HUServiceDetailsLockAddHomeKeyToWalletItem _subclass_updateWithOptions:]";
        v39 = 1024;
        v40 = v26;
        v41 = 1024;
        v42 = objc_msgSend(v27, "hasOnboardedForWalletKey");
        _os_log_impl(&dword_1B8E1E000, v25, OS_LOG_TYPE_DEFAULT, "(%@: %s) Hiding \"Add/Show Home Key to Wallet\" buttonbecause accessory.supportsWalletKey=%{BOOL}d and home.hasOnboardedForWalletKey=%{BOOL}d", location, 0x22u);

      }
      objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30D70]);
      v28 = (void *)MEMORY[0x1E0D519C0];
      objc_msgSend(MEMORY[0x1E0D314B8], "outcomeWithResults:", v5);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "futureWithResult:", v29);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    objc_msgSend(v5, "na_safeSetObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30D70]);
    v23 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0D314B8], "outcomeWithResults:", v5);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "futureWithResult:", v24);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v22;
}

id __74__HUServiceDetailsLockAddHomeKeyToWalletItem__subclass_updateWithOptions___block_invoke(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "canAddWalletKeyErrorCode") == 8)
  {
    HFLogForCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = a1[4];
      *(_DWORD *)buf = 138412546;
      v15 = v5;
      v16 = 2080;
      v17 = "-[HUServiceDetailsLockAddHomeKeyToWalletItem _subclass_updateWithOptions:]_block_invoke";
      _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "(%@: %s) Hiding \"Add/Show Home Key to Wallet\" buttonbecause current device has Wallet app deleted", buf, 0x16u);
    }

    objc_msgSend(a1[5], "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30D70]);
    v6 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0D314B8], "outcomeWithResults:", a1[5]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "futureWithResult:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1[4], "home");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "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");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __74__HUServiceDetailsLockAddHomeKeyToWalletItem__subclass_updateWithOptions___block_invoke_6;
    v11[3] = &unk_1E6F4E9B8;
    objc_copyWeak(&v13, a1 + 6);
    v12 = a1[5];
    objc_msgSend(v9, "flatMap:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v13);
  }

  return v8;
}

id __74__HUServiceDetailsLockAddHomeKeyToWalletItem__subclass_updateWithOptions___block_invoke_6(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  id *v10;
  _QWORD *v11;
  void *v12;
  _QWORD v14[4];
  _QWORD v15[2];
  _QWORD v16[4];
  id v17;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v6 = objc_msgSend(v4, "BOOLValue");

  objc_msgSend(WeakRetained, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    objc_msgSend(v7, "hf_hasWalletKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __74__HUServiceDetailsLockAddHomeKeyToWalletItem__subclass_updateWithOptions___block_invoke_2;
    v16[3] = &unk_1E6F4CD58;
    v10 = &v17;
    v17 = *(id *)(a1 + 32);
    v11 = v16;
  }
  else
  {
    objc_msgSend(v7, "hf_walletKeyDeviceStatesOfCompatiblePairedWatches");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __74__HUServiceDetailsLockAddHomeKeyToWalletItem__subclass_updateWithOptions___block_invoke_8;
    v14[3] = &unk_1E6F51740;
    v10 = (id *)v15;
    v15[0] = *(id *)(a1 + 32);
    v15[1] = WeakRetained;
    v11 = v14;
  }
  objc_msgSend(v9, "flatMap:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id __74__HUServiceDetailsLockAddHomeKeyToWalletItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "BOOLValue"))
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30D70]);
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v10 = 136315650;
    v11 = "-[HUServiceDetailsLockAddHomeKeyToWalletItem _subclass_updateWithOptions:]_block_invoke_2";
    v12 = 2112;
    v13 = v5;
    v14 = 1024;
    v15 = objc_msgSend(v3, "BOOLValue");
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "(HUServiceDetailsLockAddHomeKeyToWalletItem: %s) Results for \"Add/Show Home Key to Wallet\" button is %@ because current device is wallet key compatible and hasWalletKey = %{BOOL}d", (uint8_t *)&v10, 0x1Cu);
  }

  v6 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0D314B8], "outcomeWithResults:", *(_QWORD *)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "futureWithResult:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __74__HUServiceDetailsLockAddHomeKeyToWalletItem__subclass_updateWithOptions___block_invoke_8(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  int v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const __CFString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "na_filter:", &__block_literal_global_292);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");
    v6 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5 == 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "na_safeSetObject:forKey:", v7, *MEMORY[0x1E0D30D70]);

    HFLogForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v9;
      v11 = CFSTR("Showing");
      if (!v5)
        v11 = CFSTR("Hiding");
      v18 = 138412802;
      v19 = (const char *)v9;
      v20 = 2080;
      v21 = "-[HUServiceDetailsLockAddHomeKeyToWalletItem _subclass_updateWithOptions:]_block_invoke_2";
      v22 = 2112;
      v23 = v11;
      _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "(%@: %s) %@ \"Add/Show Home Key to Wallet\" buttonbecause iPhone is not compatible and there are no wallet key compatible paired watches that doesn't have a wallet key.", (uint8_t *)&v18, 0x20u);

    }
    v12 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0D314B8], "outcomeWithResults:", *(_QWORD *)(a1 + 32));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "futureWithResult:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "na_safeSetObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30D70]);
    HFLogForCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 136315138;
      v19 = "-[HUServiceDetailsLockAddHomeKeyToWalletItem _subclass_updateWithOptions:]_block_invoke";
      _os_log_impl(&dword_1B8E1E000, v15, OS_LOG_TYPE_DEFAULT, "(HUServiceDetailsLockAddHomeKeyToWalletItem: %s) Hiding \"Add/Show Home Key to Wallet\" buttonbecause iPhone and all paired watches are not wallet key compatible.", (uint8_t *)&v18, 0xCu);
    }

    v16 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0D314B8], "outcomeWithResults:", *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "futureWithResult:", v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

BOOL __74__HUServiceDetailsLockAddHomeKeyToWalletItem__subclass_updateWithOptions___block_invoke_9(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "walletKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

@end

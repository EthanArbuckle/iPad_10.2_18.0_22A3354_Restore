@implementation DKWalletProvider

- (id)localPaymentCards
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  DKWalletLocalPaymentCardViewModel *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(MEMORY[0x24BDE3330], "sharedInstance", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "paymentPassesWithLocallyStoredValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v8);
        v10 = objc_alloc_init(DKWalletLocalPaymentCardViewModel);
        objc_msgSend(v9, "localizedName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[DKWalletLocalPaymentCardViewModel setTitle:](v10, "setTitle:", v11);

        objc_msgSend(v9, "localizedDescription");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[DKWalletLocalPaymentCardViewModel setSubtitle:](v10, "setSubtitle:", v12);

        -[DKWalletLocalPaymentCardViewModel title](v10, "title");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {

        }
        else
        {
          -[DKWalletLocalPaymentCardViewModel subtitle](v10, "subtitle");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v14)
            goto LABEL_10;
        }
        objc_msgSend(v2, "addObject:", v10);
LABEL_10:

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  return v2;
}

- (void)fetchAppleWalletCards:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDE3350]), "initWithSetupAssistant:", 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDE3340]), "initWithSetupAssistantContext:", v5);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __42__DKWalletProvider_fetchAppleWalletCards___block_invoke;
  v8[3] = &unk_24F20E2C0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "expressResetCardsWithCompletion:", v8);

}

void __42__DKWalletProvider_fetchAppleWalletCards___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  DKNotableUserDataWallet *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (!v3)
  {
    _DKLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __42__DKWalletProvider_fetchAppleWalletCards___block_invoke_cold_1(v4);

  }
  objc_msgSend(*(id *)(a1 + 32), "localPaymentCards");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "count"))
  {
    _DKLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 134217984;
      v9 = objc_msgSend(v5, "count");
      _os_log_impl(&dword_229405000, v6, OS_LOG_TYPE_DEFAULT, "Local cards not found, localPaymentCards cout:%lu", (uint8_t *)&v8, 0xCu);
    }

  }
  v7 = -[DKNotableUserDataWallet initWithContext:localCards:]([DKNotableUserDataWallet alloc], "initWithContext:localCards:", v3, v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __42__DKWalletProvider_fetchAppleWalletCards___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_229405000, log, OS_LOG_TYPE_ERROR, "PKPaymentSetupAssistantResetController failed to provide provisioning context", v1, 2u);
}

@end

@implementation GEOPDBankTransactionInformation(MSPWallet)

- (id)initWithMSPWalletBankTransactionInformation:()MSPWallet rawMerchantCode:industryCategory:
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v27.receiver = a1;
  v27.super_class = (Class)&off_1EF08DDC0;
  v11 = objc_msgSendSuper2(&v27, sel_init);
  if (v11)
  {
    objc_msgSend(v11, "setBankTransactionType:", objc_msgSend(v8, "transactionType"));
    objc_msgSend(v8, "bankTransactionDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBankTransactionDescription:", v12);

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(v8, "otherTransactionLocations", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v24;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v24 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(v11, "addOtherTransactionLocations:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v17++));
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v15);
    }

    objc_msgSend(v8, "transactionTimestamp");
    objc_msgSend(v11, "setTransactionTimestamp:");
    objc_msgSend(v11, "setIndustryCode:", objc_msgSend(v8, "industryCode"));
    objc_msgSend(v11, "setEnableBrandMuidFallback:", objc_msgSend(v8, "enableBrandMuidFallback"));
    objc_msgSend(v8, "transactionCurrencyCode");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTransactionCurrencyCode:", v18);

    objc_msgSend(v11, "setTransactionStatus:", objc_msgSend(v8, "transactionStatus"));
    objc_msgSend(v8, "merchantInformation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setMerchantInformation:", v19);

    objc_msgSend(v8, "bankTransactionDescriptionClean");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBankTransactionDescriptionClean:", v20);

    objc_msgSend(v8, "bankIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBankIdentifier:", v21);

    objc_msgSend(v11, "setRawMerchantCode:", v9);
    objc_msgSend(v11, "setIndustryCategory:", v10);
  }

  return v11;
}

@end

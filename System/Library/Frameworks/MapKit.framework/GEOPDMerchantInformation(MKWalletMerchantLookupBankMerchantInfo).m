@implementation GEOPDMerchantInformation(MKWalletMerchantLookupBankMerchantInfo)

- (id)initWithMKMerchantInfo:()MKWalletMerchantLookupBankMerchantInfo
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v23;

  v4 = a3;
  v23.receiver = a1;
  v23.super_class = (Class)&off_1EE05FA08;
  v5 = objc_msgSendSuper2(&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "bankMerchantId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMerchantId:", v6);

    objc_msgSend(v4, "bankMerchantDoingBizAsName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMerchantDoingBusinessAsName:", v7);

    objc_msgSend(v4, "bankMerchantEnhancedName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMerchantEnhancedName:", v8);

    objc_msgSend(v4, "bankMerchantCity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMerchantCity:", v9);

    objc_msgSend(v4, "bankMerchantRawCity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMerchantRawCity:", v10);

    objc_msgSend(v4, "bankMerchantState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMerchantState:", v11);

    objc_msgSend(v4, "bankMerchantRawState");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMerchantRawState:", v12);

    objc_msgSend(v4, "bankMerchantZip");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMerchantZip:", v13);

    objc_msgSend(v4, "bankMerchantAddress");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMerchantAddress:", v14);

    objc_msgSend(v4, "bankMerchantRawAddress");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMerchantRawAddress:", v15);

    objc_msgSend(v4, "bankMerchantCountryCode");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMerchantCountryCode:", v16);

    objc_msgSend(v4, "bankMerchantType");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMerchantType:", v17);

    objc_msgSend(v4, "bankMerchantCleanConfidenceLevel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v4, "bankMerchantCleanConfidenceLevel");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setMerchantCleanConfidenceLevel:", objc_msgSend(v19, "intValue"));

    }
    objc_msgSend(v4, "bankMerchantAdditionalData");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMerchantAdditionalData:", v20);

    objc_msgSend(v4, "bankMerchantCanl");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMerchantCanl:", v21);

  }
  return v5;
}

@end

@implementation SGWalletOrderSuggestionHelpers

- (SGWalletOrderSuggestionHelpers)initWithOrderData:(id)a3
{
  id v4;
  SGWalletOrderSuggestionHelpers *v5;
  void *v6;
  objc_class *v7;
  uint64_t v8;
  id v9;
  FKSuggestionsOrderBanner *banner;
  NSObject *v11;
  SGWalletOrderSuggestionHelpers *v12;
  objc_class *v14;
  void *v15;
  void *v16;
  id v17;
  objc_super v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE buf[24];
  void *v24;
  uint64_t *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SGWalletOrderSuggestionHelpers;
  v5 = -[SGWalletOrderSuggestionHelpers init](&v18, sel_init);
  if (!v5)
    goto LABEL_8;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2050000000;
  v6 = (void *)getFKSuggestionsOrderBannerClass_softClass;
  v22 = getFKSuggestionsOrderBannerClass_softClass;
  if (!getFKSuggestionsOrderBannerClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getFKSuggestionsOrderBannerClass_block_invoke;
    v24 = &unk_1E62D7128;
    v25 = &v19;
    __getFKSuggestionsOrderBannerClass_block_invoke((uint64_t)buf);
    v6 = (void *)v20[3];
  }
  v7 = objc_retainAutorelease(v6);
  _Block_object_dispose(&v19, 8);
  v17 = 0;
  v8 = objc_msgSend([v7 alloc], "initWithData:error:", v4, &v17);
  v9 = v17;
  banner = v5->_banner;
  v5->_banner = (FKSuggestionsOrderBanner *)v8;

  if (v9)
  {
    sgLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "description");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v15;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v16;
      _os_log_error_impl(&dword_1B1170000, v11, OS_LOG_TYPE_ERROR, "%@: Encountered Error during initialization. Error: %@", buf, 0x16u);

    }
    v12 = 0;
  }
  else
  {
LABEL_8:
    v12 = v5;
  }

  return v12;
}

- (id)merchantName
{
  return (id)-[FKSuggestionsOrderBanner merchantName](self->_banner, "merchantName");
}

- (id)orderDeepLink
{
  void *v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[FKSuggestionsOrderBanner orderDeepLink](self->_banner, "orderDeepLink");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)attributedSubtitle
{
  void *v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[FKSuggestionsOrderBanner bannerAttributedSubtitle](self->_banner, "bannerAttributedSubtitle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)walletLogo
{
  void *v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[FKSuggestionsOrderBanner walletLogo](self->_banner, "walletLogo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)orderPreviewControllerForURL:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;
  objc_class *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[5];
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  _BYTE buf[24];
  void *v28;
  uint64_t *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2050000000;
  v8 = (void *)getFKOrderImportPreviewControllerProviderClass_softClass;
  v26 = getFKOrderImportPreviewControllerProviderClass_softClass;
  v9 = MEMORY[0x1E0C809B0];
  if (!getFKOrderImportPreviewControllerProviderClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getFKOrderImportPreviewControllerProviderClass_block_invoke;
    v28 = &unk_1E62D7128;
    v29 = &v23;
    __getFKOrderImportPreviewControllerProviderClass_block_invoke((uint64_t)buf);
    v8 = (void *)v24[3];
  }
  v10 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v23, 8);
  v21[0] = v9;
  v21[1] = 3221225472;
  v21[2] = __74__SGWalletOrderSuggestionHelpers_orderPreviewControllerForURL_completion___block_invoke;
  v21[3] = &unk_1E62D6BE8;
  v21[4] = self;
  v11 = v7;
  v22 = v11;
  v20 = 0;
  objc_msgSend(v10, "makeViewControllerWithOrderURL:completion:error:", v6, v21, &v20);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v20;
  if (v13)
  {
    sgLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "description");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v18;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v19;
      _os_log_error_impl(&dword_1B1170000, v14, OS_LOG_TYPE_ERROR, "%@: Failed to initialize Wallet preview controller. Error: %{public}@", buf, 0x16u);

    }
    v15 = 0;
  }
  else
  {
    v15 = v12;
  }

  return v15;
}

- (void)saveOrderForURL:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v6 = a3;
  v7 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2050000000;
  v8 = (void *)getFKSaveOrderClass_softClass;
  v18 = getFKSaveOrderClass_softClass;
  v9 = MEMORY[0x1E0C809B0];
  if (!getFKSaveOrderClass_softClass)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __getFKSaveOrderClass_block_invoke;
    v14[3] = &unk_1E62D7128;
    v14[4] = &v15;
    __getFKSaveOrderClass_block_invoke((uint64_t)v14);
    v8 = (void *)v16[3];
  }
  v10 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v15, 8);
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __61__SGWalletOrderSuggestionHelpers_saveOrderForURL_completion___block_invoke;
  v12[3] = &unk_1E62D6BE8;
  v12[4] = self;
  v13 = v7;
  v11 = v7;
  objc_msgSend(v10, "saveOrderAtURL:completion:", v6, v12);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_banner, 0);
}

void __61__SGWalletOrderSuggestionHelpers_saveOrderForURL_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    sgLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "description");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412546;
      v10 = v7;
      v11 = 2114;
      v12 = v8;
      _os_log_error_impl(&dword_1B1170000, v5, OS_LOG_TYPE_ERROR, "%@: Failed to initialize Wallet preview controller. Error: %{public}@", (uint8_t *)&v9, 0x16u);

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __74__SGWalletOrderSuggestionHelpers_orderPreviewControllerForURL_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2 == 1)
  {
    sgLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "description");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412546;
      v11 = v8;
      v12 = 2114;
      v13 = v9;
      _os_log_error_impl(&dword_1B1170000, v6, OS_LOG_TYPE_ERROR, "%@: Failed to initialize Wallet preview controller. Error: %{public}@", (uint8_t *)&v10, 0x16u);

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

@end

@implementation ASCLockupProductDetails

+ (id)URLForLockupID:(id)a3 ofKind:(id)a4 withOfferFlags:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a4;
  v9 = a3;
  +[ASCEligibility assertCurrentProcessEligibility]();
  objc_msgSend(a1, "URLForLockupID:ofKind:offerFlags:queryParameters:", v9, v8, a5, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)URLForLockupID:(id)a3 ofKind:(id)a4 offerFlags:(int64_t)a5 queryParameters:(id)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v24;
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];

  v28[3] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a6;
  +[ASCEligibility assertCurrentProcessEligibility]();
  objc_msgSend(v8, "stringValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "URLPathAllowedCharacterSet");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByAddingPercentEncodingWithAllowedCharacters:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  objc_msgSend(v14, "setScheme:", CFSTR("itms-apps"));
  if (!objc_msgSend(v9, "isEqualToString:", CFSTR("app")))
    ASCUnknownEnumCase(CFSTR("ASCLockupKind"), v9);
  objc_msgSend(v14, "setPercentEncodedHost:", CFSTR("apps.apple.com"));
  v15 = (void *)MEMORY[0x1E0CB3940];
  v28[0] = CFSTR("/");
  v28[1] = CFSTR("app");
  objc_msgSend(CFSTR("id"), "stringByAppendingString:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "pathWithComponents:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPercentEncodedPath:", v18);

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __76__ASCLockupProductDetails_URLForLockupID_ofKind_offerFlags_queryParameters___block_invoke;
    v26[3] = &unk_1E7560660;
    v27 = v19;
    v20 = v19;
    objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v26);
    objc_msgSend(v14, "setQueryItems:", v20);

  }
  objc_msgSend(v14, "URL");
  v21 = objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Lockup id %@ of kind %@ is invalid"), v8, v9);
    v25 = objc_alloc(MEMORY[0x1E0C99DA0]);
    objc_exception_throw((id)objc_msgSend(v25, "initWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v24, 0));
  }
  v22 = (void *)v21;

  return v22;
}

void __76__ASCLockupProductDetails_URLForLockupID_ofKind_offerFlags_queryParameters___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", a2, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

}

+ (id)queryParametersForLockup:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  __int16 v8;
  void *v9;

  v3 = a3;
  +[ASCEligibility assertCurrentProcessEligibility]();
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "productVariantID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v3, "productVariantID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("ppid"));

  }
  objc_msgSend(v3, "offer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "flags");

  if ((v8 & 0x200) != 0)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("1"), CFSTR("isViewOnly"));
  if (objc_msgSend(v4, "count"))
    v9 = (void *)objc_msgSend(v4, "copy");
  else
    v9 = 0;

  return v9;
}

- (ASCLockupProductDetails)initWithLockup:(id)a3
{
  return -[ASCLockupProductDetails initWithLockup:storeSheetHostBundleID:storeSheetUsageContext:parameters:](self, "initWithLockup:storeSheetHostBundleID:storeSheetUsageContext:parameters:", a3, 0, 0, 0);
}

- (ASCLockupProductDetails)initWithLockup:(id)a3 storeSheetHostBundleID:(id)a4 storeSheetUsageContext:(id)a5
{
  return -[ASCLockupProductDetails initWithLockup:storeSheetHostBundleID:storeSheetUsageContext:parameters:](self, "initWithLockup:storeSheetHostBundleID:storeSheetUsageContext:parameters:", a3, a4, a5, 0);
}

- (ASCLockupProductDetails)initWithLockup:(id)a3 storeSheetHostBundleID:(id)a4 storeSheetUsageContext:(id)a5 parameters:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  ASCLockupProductDetails *v14;
  uint64_t v15;
  ASCLockup *lockup;
  uint64_t v17;
  NSString *storeSheetHostBundleID;
  uint64_t v19;
  NSString *storeSheetUsageContext;
  uint64_t v21;
  NSDictionary *parameters;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  +[ASCEligibility assertCurrentProcessEligibility]();
  v24.receiver = self;
  v24.super_class = (Class)ASCLockupProductDetails;
  v14 = -[ASCLockupProductDetails init](&v24, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    lockup = v14->_lockup;
    v14->_lockup = (ASCLockup *)v15;

    v17 = objc_msgSend(v11, "copy");
    storeSheetHostBundleID = v14->_storeSheetHostBundleID;
    v14->_storeSheetHostBundleID = (NSString *)v17;

    v19 = objc_msgSend(v12, "copy");
    storeSheetUsageContext = v14->_storeSheetUsageContext;
    v14->_storeSheetUsageContext = (NSString *)v19;

    v21 = objc_msgSend(v13, "copy");
    parameters = v14->_parameters;
    v14->_parameters = (NSDictionary *)v21;

  }
  return v14;
}

- (void)presentFromViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_class *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD *v30;
  void *v31;
  BOOL v32;
  void *v33;
  void *v34;
  BOOL v35;
  void *v36;
  void *v37;
  _QWORD *SKStoreProductParameterCustomProductPageIdentifierSymbolLoc;
  void *v39;
  BOOL v40;
  void *v41;
  void *v42;
  BOOL v43;
  void *v44;
  void *v45;
  void *v46;
  BOOL v47;
  _QWORD *v48;
  void *v49;
  _QWORD *v50;
  void *v51;
  _QWORD *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  id v56;
  void (**v57)(_QWORD);
  _QWORD v58[4];
  id v59;
  id v60;
  id v61;
  BOOL v62;
  _QWORD v63[4];
  id v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t v68;
  __int128 buf;
  uint64_t v70;
  void *v71;
  uint64_t *v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  +[ASCWorkspace sharedWorkspace](ASCWorkspace, "sharedWorkspace");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isExtension");

  if (v11)
  {
    v63[0] = MEMORY[0x1E0C809B0];
    v63[1] = 3221225472;
    v63[2] = __73__ASCLockupProductDetails_presentFromViewController_animated_completion___block_invoke;
    v63[3] = &unk_1E7560D48;
    v64 = v9;
    -[ASCLockupProductDetails present:](self, "present:", v63);

    goto LABEL_48;
  }
  -[ASCLockupProductDetails lockup](self, "lockup");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "id");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ASCAdamID invalidAdamID](ASCAdamID, "invalidAdamID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "isEqual:", v14);

  v16 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO);
  if (!v15)
  {
    if (v16)
    {
      -[ASCLockupProductDetails lockup](self, "lockup");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "id");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v20;
      _os_log_impl(&dword_1BCB7B000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Presenting product details for lockup %{public}@", (uint8_t *)&buf, 0xCu);

    }
    v65 = 0;
    v66 = &v65;
    v67 = 0x2050000000;
    v21 = (void *)getSKStoreProductViewControllerClass_softClass;
    v68 = getSKStoreProductViewControllerClass_softClass;
    if (!getSKStoreProductViewControllerClass_softClass)
    {
      *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
      *((_QWORD *)&buf + 1) = 3221225472;
      v70 = (uint64_t)__getSKStoreProductViewControllerClass_block_invoke;
      v71 = &unk_1E7560230;
      v72 = &v65;
      __getSKStoreProductViewControllerClass_block_invoke((uint64_t)&buf);
      v21 = (void *)v66[3];
    }
    v22 = objc_retainAutorelease(v21);
    _Block_object_dispose(&v65, 8);
    v23 = objc_alloc_init(v22);
    -[ASCLockupProductDetails parameters](self, "parameters");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      -[ASCLockupProductDetails parameters](self, "parameters");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)objc_msgSend(v25, "mutableCopy");

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }

    -[ASCLockupProductDetails lockup](self, "lockup");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "id");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "numberValue");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v70 = 0x2020000000;
    v30 = (_QWORD *)getSKStoreProductParameterITunesItemIdentifierSymbolLoc_ptr;
    v71 = (void *)getSKStoreProductParameterITunesItemIdentifierSymbolLoc_ptr;
    if (!getSKStoreProductParameterITunesItemIdentifierSymbolLoc_ptr)
    {
      v31 = (void *)StoreKitLibrary();
      v30 = dlsym(v31, "SKStoreProductParameterITunesItemIdentifier");
      *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v30;
      getSKStoreProductParameterITunesItemIdentifierSymbolLoc_ptr = (uint64_t)v30;
    }
    _Block_object_dispose(&buf, 8);
    if (v30)
    {
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v29, *v30);
      v32 = a4;

      objc_msgSend(v23, "setDelegate:", self);
      if (!StoreKitLibraryCore_frameworkLibrary)
      {
        buf = xmmword_1E7560DB8;
        v70 = 0;
        StoreKitLibraryCore_frameworkLibrary = _sl_dlopen();
      }
      if (StoreKitLibraryCore_frameworkLibrary)
      {
        if (getSKStoreProductParameterCustomProductPageIdentifierSymbolLoc())
        {
          -[ASCLockupProductDetails lockup](self, "lockup");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "productVariantID");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = v34 == 0;

          if (!v35)
          {
            -[ASCLockupProductDetails lockup](self, "lockup");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "productVariantID");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            SKStoreProductParameterCustomProductPageIdentifierSymbolLoc = getSKStoreProductParameterCustomProductPageIdentifierSymbolLoc();
            if (!SKStoreProductParameterCustomProductPageIdentifierSymbolLoc)
              goto LABEL_49;
            objc_msgSend(v26, "setObject:forKeyedSubscript:", v37, *SKStoreProductParameterCustomProductPageIdentifierSymbolLoc);

          }
        }
      }
      -[ASCLockupProductDetails storeSheetHostBundleID](self, "storeSheetHostBundleID");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v39 == 0;

      if (!v40)
      {
        -[ASCLockupProductDetails storeSheetHostBundleID](self, "storeSheetHostBundleID");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setHostBundleIdentifier:", v41);

      }
      -[ASCLockupProductDetails storeSheetUsageContext](self, "storeSheetUsageContext");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = v42 == 0;

      if (!v43)
      {
        -[ASCLockupProductDetails storeSheetUsageContext](self, "storeSheetUsageContext");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setUsageContext:", v44);

      }
      -[ASCLockupProductDetails lockup](self, "lockup");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "featureWithClass:", objc_opt_class());
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v46 == 0;

      if (!v47)
      {
        *(_QWORD *)&buf = 0;
        *((_QWORD *)&buf + 1) = &buf;
        v70 = 0x2020000000;
        v48 = (_QWORD *)getSKStoreProductParameterIsViewOnlySymbolLoc_ptr;
        v71 = (void *)getSKStoreProductParameterIsViewOnlySymbolLoc_ptr;
        if (!getSKStoreProductParameterIsViewOnlySymbolLoc_ptr)
        {
          v49 = (void *)StoreKitLibrary();
          v48 = dlsym(v49, "SKStoreProductParameterIsViewOnly");
          *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v48;
          getSKStoreProductParameterIsViewOnlySymbolLoc_ptr = (uint64_t)v48;
        }
        _Block_object_dispose(&buf, 8);
        if (!v48)
          goto LABEL_49;
        objc_msgSend(v26, "setValue:forKey:", MEMORY[0x1E0C9AAB0], *v48);
      }
      if (-[ASCLockupProductDetails isOpenAppCallbackEnabled](self, "isOpenAppCallbackEnabled"))
      {
        *(_QWORD *)&buf = 0;
        *((_QWORD *)&buf + 1) = &buf;
        v70 = 0x2020000000;
        v50 = (_QWORD *)getSKStoreProductParameterEnableOpenAppCallbackSymbolLoc_ptr;
        v71 = (void *)getSKStoreProductParameterEnableOpenAppCallbackSymbolLoc_ptr;
        if (!getSKStoreProductParameterEnableOpenAppCallbackSymbolLoc_ptr)
        {
          v51 = (void *)StoreKitLibrary();
          v50 = dlsym(v51, "SKStoreProductParameterEnableOpenAppCallback");
          *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v50;
          getSKStoreProductParameterEnableOpenAppCallbackSymbolLoc_ptr = (uint64_t)v50;
        }
        _Block_object_dispose(&buf, 8);
        if (!v50)
          goto LABEL_49;
        objc_msgSend(v26, "setValue:forKey:", MEMORY[0x1E0C9AAB0], *v50);
      }
      if (!-[ASCLockupProductDetails isWebBrowser](self, "isWebBrowser"))
      {
LABEL_44:
        objc_msgSend(v23, "loadProductWithParameters:completionBlock:", v26, 0);
        v58[0] = MEMORY[0x1E0C809B0];
        v58[1] = 3221225472;
        v58[2] = __73__ASCLockupProductDetails_presentFromViewController_animated_completion___block_invoke_34;
        v58[3] = &unk_1E7560D70;
        v59 = v8;
        v56 = v23;
        v60 = v56;
        v62 = v32;
        v61 = v9;
        v57 = (void (**)(_QWORD))MEMORY[0x1BCCFE944](v58);
        if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
          v57[2](v57);
        else
          dispatch_async(MEMORY[0x1E0C80D38], v57);

        goto LABEL_48;
      }
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v70 = 0x2020000000;
      v52 = (_QWORD *)getSKStoreProductParameterWebBrowserSymbolLoc_ptr;
      v71 = (void *)getSKStoreProductParameterWebBrowserSymbolLoc_ptr;
      if (!getSKStoreProductParameterWebBrowserSymbolLoc_ptr)
      {
        v53 = (void *)StoreKitLibrary();
        v52 = dlsym(v53, "SKStoreProductParameterWebBrowser");
        *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v52;
        getSKStoreProductParameterWebBrowserSymbolLoc_ptr = (uint64_t)v52;
      }
      _Block_object_dispose(&buf, 8);
      if (v52)
      {
        objc_msgSend(v26, "setValue:forKey:", MEMORY[0x1E0C9AAB0], *v52);
        ASCLocalizedString(CFSTR("WEB_BROWSER_PRODUCT_DETAILS_CANCEL_BUTTON_TITLE"), v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setCancelButtonTitle:", v55);

        objc_msgSend(v23, "setShowsStoreButton:", 0);
        goto LABEL_44;
      }
    }
LABEL_49:
    ASCAXLabelForElements_cold_1();
    __break(1u);
  }
  if (v16)
  {
    -[ASCLockupProductDetails lockup](self, "lockup");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "id");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v18;
    _os_log_impl(&dword_1BCB7B000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Not presenting product details for lockup %{public}@ because its ID is invalid.", (uint8_t *)&buf, 0xCu);

  }
  if (v9)
    (*((void (**)(id, uint64_t, _QWORD))v9 + 2))(v9, 1, 0);
LABEL_48:

}

uint64_t __73__ASCLockupProductDetails_presentFromViewController_animated_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __73__ASCLockupProductDetails_presentFromViewController_animated_completion___block_invoke_34(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(unsigned __int8 *)(a1 + 56);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __73__ASCLockupProductDetails_presentFromViewController_animated_completion___block_invoke_2;
  v4[3] = &unk_1E7560330;
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v1, "presentViewController:animated:completion:", v2, v3, v4);

}

uint64_t __73__ASCLockupProductDetails_presentFromViewController_animated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, 1, 1);
  return result;
}

- (void)present:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  int v8;
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  void (**v30)(id, _QWORD);
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  -[ASCLockupProductDetails lockup](self, "lockup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "id");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[ASCAdamID invalidAdamID](ASCAdamID, "invalidAdamID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      -[ASCLockupProductDetails lockup](self, "lockup");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "id");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v10;
      _os_log_impl(&dword_1BCB7B000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Not presenting product details for lockup %{public}@ because ID is invalid.", buf, 0xCu);

    }
    if (v4)
      v4[2](v4, 0);
  }
  else
  {
    -[ASCLockupProductDetails lockup](self, "lockup");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[ASCLockupProductDetails queryParametersForLockup:](ASCLockupProductDetails, "queryParametersForLockup:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[ASCLockupProductDetails parameters](self, "parameters");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[ASCLockupProductDetails parameters](self, "parameters");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v14, "mutableCopy");

      if (v12)
        objc_msgSend(v15, "addEntriesFromDictionary:", v12);
    }
    else
    {
      v15 = (void *)objc_msgSend(v12, "mutableCopy");
    }
    v27 = v12;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      -[ASCLockupProductDetails lockup](self, "lockup", v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "id");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v17;
      _os_log_impl(&dword_1BCB7B000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Presenting product details for lockup %{public}@", buf, 0xCu);

    }
    -[ASCLockupProductDetails lockup](self, "lockup", v27);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "id");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCLockupProductDetails lockup](self, "lockup");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "kind");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCLockupProductDetails lockup](self, "lockup");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "offer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[ASCLockupProductDetails URLForLockupID:ofKind:offerFlags:queryParameters:](ASCLockupProductDetails, "URLForLockupID:ofKind:offerFlags:queryParameters:", v19, v21, objc_msgSend(v23, "flags"), v15);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    +[ASCURLLauncher sharedLauncher](ASCURLLauncher, "sharedLauncher");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "openURL:", v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __35__ASCLockupProductDetails_present___block_invoke;
      v29[3] = &unk_1E7560D98;
      v30 = v4;
      objc_msgSend(v26, "addFinishBlock:", v29);

    }
  }

}

uint64_t __35__ASCLockupProductDetails_present___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)productViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_1BCB7B000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "productViewController didFinishWithResult: %{public}@", (uint8_t *)&v8, 0xCu);

  }
  -[ASCLockupProductDetails observer](self, "observer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "productDetailsUserDidInteractWithApp:interactionType:", self, CFSTR("dismissed"));

}

- (void)productViewController:(id)a3 userDidInteractWithProduct:(unint64_t)a4
{
  id v6;
  void *v7;
  __CFString **v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v7;
    _os_log_impl(&dword_1BCB7B000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "productViewController userDidInteractWithProduct: %{public}@", (uint8_t *)&v10, 0xCu);

  }
  if (a4 == 1)
  {
    v8 = ASCLockupProductDetailsInteractionTypeOpened;
    goto LABEL_7;
  }
  if (!a4)
  {
    v8 = ASCLockupProductDetailsInteractionTypePurchased;
LABEL_7:
    -[ASCLockupProductDetails observer](self, "observer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "productDetailsUserDidInteractWithApp:interactionType:", self, *v8);

  }
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[ASCLockupProductDetails lockup](self, "lockup");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash") + 2;

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  ASCLockupProductDetails *v4;
  ASCLockupProductDetails *v5;
  ASCLockupProductDetails *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char v10;

  objc_opt_class();
  v4 = self;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  if (v6)
  {
    -[ASCLockupProductDetails lockup](v4, "lockup");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCLockupProductDetails lockup](v6, "lockup");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v7 && v8)
      v10 = objc_msgSend(v7, "isEqual:", v8);
    else
      v10 = v7 == (void *)v8;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSString)description
{
  ASCDescriber *v3;
  void *v4;
  void *v5;

  v3 = -[ASCDescriber initWithObject:]([ASCDescriber alloc], "initWithObject:", self);
  -[ASCLockupProductDetails lockup](self, "lockup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v4, CFSTR("lockup"));

  -[ASCDescriber finalizeDescription](v3, "finalizeDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (ASCLockup)lockup
{
  return self->_lockup;
}

- (NSString)storeSheetHostBundleID
{
  return self->_storeSheetHostBundleID;
}

- (NSString)storeSheetUsageContext
{
  return self->_storeSheetUsageContext;
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (ASCLockupProductDetailsObserver)observer
{
  return (ASCLockupProductDetailsObserver *)objc_loadWeakRetained((id *)&self->_observer);
}

- (void)setObserver:(id)a3
{
  objc_storeWeak((id *)&self->_observer, a3);
}

- (BOOL)isOpenAppCallbackEnabled
{
  return self->_openAppCallbackEnabled;
}

- (void)setOpenAppCallbackEnabled:(BOOL)a3
{
  self->_openAppCallbackEnabled = a3;
}

- (BOOL)isWebBrowser
{
  return self->_webBrowser;
}

- (void)setWebBrowser:(BOOL)a3
{
  self->_webBrowser = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_storeSheetUsageContext, 0);
  objc_storeStrong((id *)&self->_storeSheetHostBundleID, 0);
  objc_storeStrong((id *)&self->_lockup, 0);
}

@end

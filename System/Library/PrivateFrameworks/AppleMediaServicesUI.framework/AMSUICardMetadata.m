@implementation AMSUICardMetadata

+ (id)appleCardIcon
{
  void *v2;
  void *v3;
  NSObject *v4;
  id v5;
  void *v6;
  objc_class *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE buf[24];
  void *v21;
  uint64_t *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (appleCardIcon_onceToken != -1)
    dispatch_once(&appleCardIcon_onceToken, &__block_literal_global_3);
  AMSSetLogKeyIfNeeded();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "OSLogObject");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = objc_opt_class();
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v2;
    v5 = *(id *)&buf[4];
    _os_log_impl(&dword_211102000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Checking for card icon", buf, 0x16u);

  }
  v16 = 0;
  v17 = &v16;
  v18 = 0x2050000000;
  v6 = (void *)getPKVirtualCardClass_softClass;
  v19 = getPKVirtualCardClass_softClass;
  if (!getPKVirtualCardClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x24BDAC760];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getPKVirtualCardClass_block_invoke;
    v21 = &unk_24CB4F3E8;
    v22 = &v16;
    __getPKVirtualCardClass_block_invoke((uint64_t)buf);
    v6 = (void *)v17[3];
  }
  v7 = objc_retainAutorelease(v6);
  _Block_object_dispose(&v16, 8);
  v8 = objc_alloc_init(v7);
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "cardIcon", v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig", v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v11, "OSLogObject");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v13;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v2;
      v14 = v13;
      _os_log_impl(&dword_211102000, v12, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to fetch virtual card", buf, 0x16u);

    }
    v10 = 0;
  }

  return v10;
}

void __34__AMSUICardMetadata_appleCardIcon__block_invoke()
{
  void *v0;

  if (!PassKitUIFoundationLibraryCore_frameworkLibrary)
  {
    PassKitUIFoundationLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!PassKitUIFoundationLibraryCore_frameworkLibrary)
    {
      v0 = (void *)abort_report_np();
      free(v0);
    }
  }
}

+ (id)appleCardIconString
{
  UIImage *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "appleCardIcon");
  v2 = (UIImage *)objc_claimAutoreleasedReturnValue();
  UIImagePNGRepresentation(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "base64EncodedStringWithOptions:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("data:image/png;base64,%@"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = (void *)objc_opt_class();
      v10 = v9;
      AMSSetLogKeyIfNeeded();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v14 = v9;
      v15 = 2114;
      v16 = v11;
      _os_log_impl(&dword_211102000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to fetch card icon", buf, 0x16u);

    }
    v6 = 0;
  }

  return v6;
}

+ (void)metadataForPassTypeIdentifier:(id)a3 serialNumber:(id)a4 cardArtworkSize:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  dispatch_get_global_queue(2, 0);
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __98__AMSUICardMetadata_metadataForPassTypeIdentifier_serialNumber_cardArtworkSize_completionHandler___block_invoke;
  block[3] = &unk_24CB4F648;
  v23 = v13;
  v24 = a1;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  dispatch_async(v14, block);

}

void __98__AMSUICardMetadata_metadataForPassTypeIdentifier_serialNumber_cardArtworkSize_completionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 64), "metadataForPassTypeIdentifier:serialNumber:cardArtworkSize:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

+ (id)metadataForPassTypeIdentifier:(id)a3 serialNumber:(id)a4 cardArtworkSize:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v23;
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v25 = a3;
  v8 = a4;
  v9 = a5;
  v23 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  AMSSetLogKeyIfNeeded();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_passesForPassTypeIdentifier:serialNumber:", v25, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig", v23);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v12, "OSLogObject", v23);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (void *)objc_opt_class();
    v15 = (void *)MEMORY[0x24BDD16E0];
    v16 = v14;
    objc_msgSend(v15, "numberWithUnsignedInteger:", objc_msgSend(v11, "count"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v32 = v14;
    v33 = 2114;
    v34 = v10;
    v35 = 2114;
    v36 = v17;
    _os_log_impl(&dword_211102000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Found %{public}@ payment passes", buf, 0x20u);

  }
  objc_initWeak((id *)buf, a1);
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __80__AMSUICardMetadata_metadataForPassTypeIdentifier_serialNumber_cardArtworkSize___block_invoke;
  v26[3] = &unk_24CB4F698;
  objc_copyWeak(&v30, (id *)buf);
  v18 = v9;
  v27 = v18;
  v19 = v10;
  v28 = v19;
  v20 = v24;
  v29 = v20;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v26);
  v21 = (void *)objc_msgSend(v20, "copy");

  objc_destroyWeak(&v30);
  objc_destroyWeak((id *)buf);

  return v21;
}

void __80__AMSUICardMetadata_metadataForPassTypeIdentifier_serialNumber_cardArtworkSize___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  float v6;
  double v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  BOOL v26;
  void *v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  void *v33;
  int v34;
  void *v35;
  uint64_t v36;
  id v37;
  void *v38;
  uint64_t v39;
  id v40;
  void *v41;
  void *v42;
  _QWORD block[5];
  id v44;
  uint64_t *v45;
  double v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  _BYTE buf[24];
  void *v58;
  uint64_t *v59;
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v5 = objc_alloc_init(MEMORY[0x24BE080C0]);
  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__0;
  v51 = __Block_byref_object_dispose__0;
  v52 = 0;
  objc_msgSend(*(id *)(a1 + 32), "floatValue");
  if (v6 <= 0.0)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)objc_opt_class();
      v13 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v12;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v13;
      v14 = v12;
      _os_log_impl(&dword_211102000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Caller did not specify a valid image size", buf, 0x16u);

    }
  }
  else
  {
    v7 = v6;
    if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
    {
      objc_msgSend(WeakRetained, "_cardArtworkForPaymentPass:width:", v3, v7);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v48[5];
      v48[5] = v8;

    }
    else
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __80__AMSUICardMetadata_metadataForPassTypeIdentifier_serialNumber_cardArtworkSize___block_invoke_15;
      block[3] = &unk_24CB4F670;
      v45 = &v47;
      block[4] = WeakRetained;
      v44 = v3;
      v46 = v7;
      dispatch_sync(MEMORY[0x24BDAC9B8], block);

    }
    v15 = (void *)v48[5];
    if (v15)
    {
      objc_msgSend(v15, "base64EncodedStringWithOptions:", 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("data:image/png;base64,%@"), v10);
      v11 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setCardArtwork:", v11);
      objc_msgSend(v5, "setCardArtworkData:", v48[5]);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v10, "OSLogObject");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v16 = (void *)objc_opt_class();
        v17 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v16;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v17;
        v18 = v16;
        _os_log_impl(&dword_211102000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to find card artwork", buf, 0x16u);

      }
    }
  }

  objc_msgSend(v3, "localizedDescription");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDescriptionShort:", v19);

  objc_msgSend(v3, "serialNumber");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSerialNumber:", v20);

  objc_msgSend(v3, "passTypeIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPassTypeIdentifier:", v21);

  v53 = 0;
  v54 = &v53;
  v55 = 0x2050000000;
  v22 = (void *)getPKPaymentPassClass_softClass;
  v56 = getPKPaymentPassClass_softClass;
  if (!getPKPaymentPassClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x24BDAC760];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getPKPaymentPassClass_block_invoke;
    v58 = &unk_24CB4F3E8;
    v59 = &v53;
    __getPKPaymentPassClass_block_invoke((uint64_t)buf);
    v22 = (void *)v54[3];
  }
  v23 = objc_retainAutorelease(v22);
  _Block_object_dispose(&v53, 8);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setSuffix:", objc_msgSend(v3, "performSelector:withObject:", sel_primaryAccountNumberSuffix, 0));
  objc_msgSend(v3, "paymentPass");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "associatedAccountServiceAccountIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25 == 0;

  if (v26)
  {
    objc_msgSend(v3, "paymentPass");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "hasAssociatedPeerPaymentAccount");

    if (v34)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v27)
      {
        objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v27, "OSLogObject");
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v35 = (void *)objc_opt_class();
        v36 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v35;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v36;
        v37 = v35;
        _os_log_impl(&dword_211102000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Found cash payment instrument", buf, 0x16u);

      }
      v32 = 1;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v27)
      {
        objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v27, "OSLogObject");
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v38 = (void *)objc_opt_class();
        v39 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v38;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v39;
        v40 = v38;
        _os_log_impl(&dword_211102000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Found credit payment instrument", buf, 0x16u);

      }
      v32 = 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v27)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v27, "OSLogObject");
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = (void *)objc_opt_class();
      v30 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v29;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v30;
      v31 = v29;
      _os_log_impl(&dword_211102000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Found associated account", buf, 0x16u);

    }
    v32 = 2;
  }

  objc_msgSend(v5, "setCardType:", v32);
  objc_msgSend(v3, "paymentPass");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "devicePrimaryInAppPaymentApplication");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPaymentNetwork:", objc_msgSend(v42, "paymentNetworkIdentifier"));

  objc_msgSend(*(id *)(a1 + 48), "addObject:", v5);
  _Block_object_dispose(&v47, 8);

}

void __80__AMSUICardMetadata_metadataForPassTypeIdentifier_serialNumber_cardArtworkSize___block_invoke_15(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_cardArtworkForPaymentPass:width:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 56));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

+ (id)_cardArtworkForPaymentPass:(id)a3 width:(double)a4
{
  id v5;
  UIImage *v6;
  UIImage *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (_cardArtworkForPaymentPass_width__onceToken != -1)
    dispatch_once(&_cardArtworkForPaymentPass_width__onceToken, &__block_literal_global_17);
  objc_msgSend(v5, "cardImageWithDimensions:", a4, a4);
  v6 = (UIImage *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    UIImagePNGRepresentation(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = (void *)objc_opt_class();
      v12 = v11;
      AMSSetLogKeyIfNeeded();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v11;
      v17 = 2114;
      v18 = v13;
      _os_log_impl(&dword_211102000, v10, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to obtain card artwork", (uint8_t *)&v15, 0x16u);

    }
    v8 = 0;
  }

  return v8;
}

void __54__AMSUICardMetadata__cardArtworkForPaymentPass_width___block_invoke()
{
  void *v0;

  if (!PassKitUILibraryCore_frameworkLibrary)
  {
    PassKitUILibraryCore_frameworkLibrary = _sl_dlopen();
    if (!PassKitUILibraryCore_frameworkLibrary)
    {
      v0 = (void *)abort_report_np();
      free(v0);
    }
  }
}

+ (id)_passesForPassTypeIdentifier:(id)a3 serialNumber:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  objc_class *v9;
  id v10;
  BOOL v11;
  int v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  void *v24;
  NSObject *v25;
  void *v26;
  id v27;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _BYTE buf[24];
  void *v35;
  uint64_t *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  AMSSetLogKeyIfNeeded();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v30 = &v29;
  v31 = 0x2050000000;
  v8 = (void *)getPKPassLibraryClass_softClass;
  v32 = getPKPassLibraryClass_softClass;
  if (!getPKPassLibraryClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x24BDAC760];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getPKPassLibraryClass_block_invoke;
    v35 = &unk_24CB4F3E8;
    v36 = &v29;
    __getPKPassLibraryClass_block_invoke((uint64_t)buf);
    v8 = (void *)v30[3];
  }
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v29, 8);
  v10 = objc_alloc_init(v9);
  if (v5)
    v11 = v6 == 0;
  else
    v11 = 1;
  v12 = !v11;
  objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v12)
  {
    if (!v13)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v14, "OSLogObject");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v16;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v7;
      v17 = v16;
      _os_log_impl(&dword_211102000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Attempting to search for specific card", buf, 0x16u);

    }
    objc_msgSend(v10, "passWithPassTypeIdentifier:serialNumber:", v5, v6);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v18;
    if (v18)
    {
      v33 = v18;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v33, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v24)
      {
        objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v24, "OSLogObject");
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v26 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v26;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v7;
        v27 = v26;
        _os_log_impl(&dword_211102000, v25, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Card metadata failed for no card", buf, 0x16u);

      }
      v20 = 0;
    }

  }
  else
  {
    if (!v13)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v14, "OSLogObject");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v22;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v7;
      v23 = v22;
      _os_log_impl(&dword_211102000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Attempting to search for all cards", buf, 0x16u);

    }
    objc_msgSend(v10, "passesOfType:", 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v20;
}

@end

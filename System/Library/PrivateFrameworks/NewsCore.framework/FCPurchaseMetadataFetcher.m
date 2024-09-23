@implementation FCPurchaseMetadataFetcher

- (FCPurchaseMetadataFetcher)init
{
  FCPurchaseMetadataFetcher *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *accessQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FCPurchaseMetadataFetcher;
  v2 = -[FCPurchaseMetadataFetcher init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.news.purchaseMetadataFetcher", v3);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (id)clientIdentifier
{
  if (a1)
  {
    if (qword_1ED0F7F48 != -1)
      dispatch_once(&qword_1ED0F7F48, &__block_literal_global_44);
    a1 = (id)_MergedGlobals_154;
  }
  return a1;
}

void __45__FCPurchaseMetadataFetcher_clientIdentifier__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  const __CFString *v3;
  void *v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.stocks")))
  {
    v2 = (void *)_MergedGlobals_154;
    v3 = CFSTR("com.apple.stocks.subscriptions");
  }
  else
  {
    if (!objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.news"))
      && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("FCPurchaseMetadataFetcher: Unknown clientID for bundle %@."), v1);
      *(_DWORD *)buf = 136315906;
      v6 = "-[FCPurchaseMetadataFetcher clientIdentifier]_block_invoke";
      v7 = 2080;
      v8 = "FCPurchaseMetadataFetcher.m";
      v9 = 1024;
      v10 = 85;
      v11 = 2114;
      v12 = v4;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    v2 = (void *)_MergedGlobals_154;
    v3 = CFSTR("com.apple.news.subscriptions");
  }
  _MergedGlobals_154 = (uint64_t)v3;

}

- (id)fetchPurchaseMetadataForPurchaseID:(id)a3 restorePurchase:(BOOL)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void (**v9)(_QWORD);
  OS_dispatch_queue *accessQueue;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  OS_dispatch_queue *v12;
  OS_dispatch_queue *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  OS_dispatch_queue *v17;
  void (*v18)(void *, OS_dispatch_queue *, _QWORD *);
  OS_dispatch_queue *v19;
  void *v20;
  void (**v21)(_QWORD, _QWORD, _QWORD);
  void *v22;
  void *v23;
  void *v25;
  OS_dispatch_queue *v26;
  void *v27;
  id v28;
  _QWORD v29[5];
  _QWORD v30[5];
  BOOL v31;
  uint64_t v32;
  uint64_t v33;
  id (*v34)(uint64_t, void *);
  void *v35;
  FCPurchaseMetadataFetcher *v36;
  _QWORD v37[5];
  id v38;

  v6 = a3;
  v7 = MEMORY[0x1E0C809B0];
  v8 = (void *)MEMORY[0x1E0D60AF0];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __80__FCPurchaseMetadataFetcher_fetchPurchaseMetadataForPurchaseID_restorePurchase___block_invoke;
  v37[3] = &unk_1E463EBC0;
  v37[4] = self;
  v28 = v6;
  v38 = v28;
  objc_msgSend(v8, "firstly:", v37);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "thenOn");
  v9 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
  if (self)
    accessQueue = self->_accessQueue;
  else
    accessQueue = 0;
  v32 = v7;
  v33 = 3221225472;
  v34 = __80__FCPurchaseMetadataFetcher_fetchPurchaseMetadataForPurchaseID_restorePurchase___block_invoke_2;
  v35 = &unk_1E4640548;
  v36 = self;
  v26 = accessQueue;
  v9[2](v9);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "thenOn");
  v11 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (self)
    v12 = self->_accessQueue;
  else
    v12 = 0;
  v13 = v12;
  v30[0] = v7;
  v30[1] = 3221225472;
  v30[2] = __80__FCPurchaseMetadataFetcher_fetchPurchaseMetadataForPurchaseID_restorePurchase___block_invoke_3;
  v30[3] = &unk_1E4640570;
  v30[4] = self;
  v31 = a4;
  ((void (**)(_QWORD, OS_dispatch_queue *, _QWORD *))v11)[2](v11, v13, v30);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "thenOn");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (self)
    v17 = self->_accessQueue;
  else
    v17 = 0;
  v29[0] = v7;
  v29[1] = 3221225472;
  v29[2] = __80__FCPurchaseMetadataFetcher_fetchPurchaseMetadataForPurchaseID_restorePurchase___block_invoke_4;
  v29[3] = &unk_1E4640598;
  v29[4] = self;
  v18 = *(void (**)(void *, OS_dispatch_queue *, _QWORD *))(v15 + 16);
  v19 = v17;
  v18(v16, v19, v29);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "thenOn");
  v21 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(25, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, void *))v21)[2](v21, v22, &__block_literal_global_32);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

id __80__FCPurchaseMetadataFetcher_fetchPurchaseMetadataForPurchaseID_restorePurchase___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;
  id v3;
  void *v4;
  _QWORD v6[5];
  id v7;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(id *)(a1 + 40);
  if (v1)
  {
    v3 = objc_alloc(MEMORY[0x1E0D60AF0]);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __64__FCPurchaseMetadataFetcher_promisePurchaseLookupWithAppAdamID___block_invoke;
    v6[3] = &unk_1E463F188;
    v6[4] = v1;
    v7 = v2;
    v4 = (void *)objc_msgSend(v3, "initWithResolver:", v6);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id __80__FCPurchaseMetadataFetcher_fetchPurchaseMetadataForPurchaseID_restorePurchase___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  id *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id *v17;
  _QWORD v18[4];
  id v19;

  v2 = *(_QWORD *)(a1 + 32);
  if (!v2 || (objc_storeStrong((id *)(v2 + 24), a2), (v4 = *(id **)(a1 + 32)) == 0))
  {
    v6 = 0;
    v13 = 0;
    goto LABEL_9;
  }
  v5 = v4[3];
  v6 = v5;
  if (!v5)
  {
    v7 = 0;
    goto LABEL_8;
  }
  v7 = (void *)*((_QWORD *)v5 + 6);
  if (!*((_QWORD *)v5 + 7))
  {
LABEL_8:
    -[FCPurchaseMetadataFetcher promiseStoreExternalVersionWithAppAdamID:](v4, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  v8 = v7;
  v9 = objc_alloc(MEMORY[0x1E0D60AF0]);
  v10 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __66__FCPurchaseMetadataFetcher_checkIfOfferUsedAlreadyWithAppAdamID___block_invoke;
  v18[3] = &unk_1E463DAD0;
  v11 = v8;
  v19 = v11;
  v12 = (void *)objc_msgSend(v9, "initWithResolver:", v18);

  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __73__FCPurchaseMetadataFetcher_promiseStoreExternalVersionWithLookupResult___block_invoke;
  v15[3] = &unk_1E4640608;
  v6 = v6;
  v16 = v6;
  v17 = v4;
  objc_msgSend(v12, "then:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v13;
}

id __80__FCPurchaseMetadataFetcher_fetchPurchaseMetadataForPurchaseID_restorePurchase___block_invoke_3(uint64_t a1, void *a2)
{
  const char *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  _QWORD *v23;
  id v24;

  v4 = a2;
  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    objc_setProperty_nonatomic_copy(v5, v3, v4, 16);
    v6 = *(_QWORD *)(a1 + 32);
    if (v6)
    {
      v7 = *(void **)(v6 + 24);
      goto LABEL_4;
    }
  }
  else
  {
    v6 = 0;
  }
  v7 = 0;
LABEL_4:
  v8 = v7;
  v9 = v4;
  if (v6)
  {
    if (v8)
      v10 = (void *)v8[6];
    else
      v10 = 0;
    v11 = v10;
    v12 = objc_alloc(MEMORY[0x1E0D60AF0]);
    v13 = MEMORY[0x1E0C809B0];
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __58__FCPurchaseMetadataFetcher_promiseBundleIDWithAppAdamID___block_invoke;
    v21 = &unk_1E463F188;
    v22 = v6;
    v14 = v11;
    v23 = v14;
    v15 = (void *)objc_msgSend(v12, "initWithResolver:", &v18);

    v18 = v13;
    v19 = 3221225472;
    v20 = __100__FCPurchaseMetadataFetcher_promiseProductLookupWithLookupResult_externalVersionID_restorePurchase___block_invoke;
    v21 = &unk_1E46406A8;
    v22 = v6;
    v23 = v8;
    v24 = v9;
    objc_msgSend(v15, "then:", &v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

FCPurchase *__80__FCPurchaseMetadataFetcher_fetchPurchaseMetadataForPurchaseID_restorePurchase___block_invoke_4(uint64_t a1, void *a2)
{
  FCPurchase *v3;
  id *v4;
  id **v5;
  id *v6;
  uint64_t v7;
  id *v8;
  id **v9;
  id *v10;
  void *v11;
  id *v12;
  id **v13;
  id *v14;
  uint64_t v15;
  id *v16;
  id **v17;
  id *v18;
  void *v19;
  id *v20;
  id **v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  _QWORD *v25;
  void *v26;
  id *v27;
  id **v28;
  void *v29;
  void *v30;
  id *v31;
  id **v32;
  id **v33;
  void *v34;
  id *v35;
  void *v36;
  id v37;
  void *v38;
  id *v40;
  id **v41;
  void *v42;
  _QWORD *v43;
  _QWORD *v44;
  void *v45;
  id *v46;
  id **v47;
  id *v48;
  id **v49;
  id *v50;
  id **v51;
  FCPurchase *v52;
  FCPurchase *v53;
  id *v54;
  id **v55;
  id *v56;
  id **v57;
  id v58;
  void *v59;
  _QWORD v60[5];
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t v64;

  v58 = a2;
  v3 = [FCPurchase alloc];
  v4 = *(id **)(a1 + 32);
  v52 = v3;
  if (v4)
  {
    v5 = (id **)v4[3];
    if (v5)
    {
      v57 = v5;
      v4 = v5[1];
    }
    else
    {
      v57 = 0;
      v4 = 0;
    }
  }
  else
  {
    v57 = 0;
  }
  v6 = v4;
  v7 = objc_msgSend(v6, "copy");
  v8 = *(id **)(a1 + 32);
  v59 = (void *)v7;
  if (v8)
  {
    v9 = (id **)v8[3];
    if (v9)
    {
      v55 = v9;
      v8 = v9[6];
    }
    else
    {
      v55 = 0;
      v8 = 0;
    }
  }
  else
  {
    v55 = 0;
  }
  v10 = v8;
  v11 = (void *)objc_msgSend(v10, "copy");
  v12 = *(id **)(a1 + 32);
  if (v12)
  {
    v13 = (id **)v12[3];
    if (v13)
    {
      v51 = v13;
      v12 = v13[4];
    }
    else
    {
      v51 = 0;
      v12 = 0;
    }
  }
  else
  {
    v51 = 0;
  }
  v14 = v12;
  v15 = objc_msgSend(v14, "copy");
  v16 = *(id **)(a1 + 32);
  if (v16)
  {
    v17 = (id **)v16[3];
    if (v17)
    {
      v49 = v17;
      v16 = v17[3];
    }
    else
    {
      v49 = 0;
      v16 = 0;
    }
  }
  else
  {
    v49 = 0;
  }
  v18 = v16;
  v19 = (void *)objc_msgSend(v18, "copy");
  v20 = *(id **)(a1 + 32);
  if (v20)
  {
    v21 = (id **)v20[3];
    if (v21)
    {
      v47 = v21;
      v20 = v21[2];
    }
    else
    {
      v47 = 0;
      v20 = 0;
    }
  }
  else
  {
    v47 = 0;
  }
  v46 = v20;
  v22 = objc_msgSend(v46, "copy");
  v23 = *(_QWORD **)(a1 + 32);
  v45 = (void *)v22;
  if (v23)
    v23 = (_QWORD *)v23[2];
  v44 = v23;
  v24 = objc_msgSend(v44, "copy");
  v25 = *(_QWORD **)(a1 + 32);
  v42 = (void *)v24;
  if (v25)
    v25 = (_QWORD *)v25[1];
  v43 = v25;
  v26 = (void *)objc_msgSend(v43, "copy");
  v27 = *(id **)(a1 + 32);
  v56 = v6;
  v54 = v10;
  if (v27)
  {
    v28 = (id **)v27[3];
    v29 = v59;
    if (v28)
    {
      v41 = v28;
      v27 = v28[5];
    }
    else
    {
      v41 = 0;
      v27 = 0;
    }
  }
  else
  {
    v29 = v59;
    v41 = 0;
  }
  v40 = v27;
  v30 = (void *)objc_msgSend(v40, "copy");
  v31 = *(id **)(a1 + 32);
  v50 = v14;
  v48 = v18;
  if (v31)
  {
    v32 = (id **)v31[3];
    v33 = v32;
    v34 = (void *)v15;
    if (v32)
      v31 = v32[7];
    else
      v31 = 0;
  }
  else
  {
    v34 = (void *)v15;
    v33 = 0;
  }
  v35 = v31;
  v61 = 0;
  v62 = &v61;
  v63 = 0x2050000000;
  v36 = (void *)qword_1ED0F7F50;
  v64 = qword_1ED0F7F50;
  if (!qword_1ED0F7F50)
  {
    v60[0] = MEMORY[0x1E0C809B0];
    v60[1] = 3221225472;
    v60[2] = __getSKMutablePaymentClass_block_invoke;
    v60[3] = &unk_1E46406D0;
    v60[4] = &v61;
    __getSKMutablePaymentClass_block_invoke((uint64_t)v60);
    v36 = (void *)v62[3];
  }
  v37 = objc_retainAutorelease(v36);
  _Block_object_dispose(&v61, 8);
  objc_msgSend(v37, "paymentWithProduct:", v58);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = -[FCPurchase initWithPurchaseID:appAdamID:subscriptionPriceFormatted:subscriptionPeriodInISO_8601:offerName:storeExternalVersion:bundleID:price:introOffer:payment:](v52, "initWithPurchaseID:appAdamID:subscriptionPriceFormatted:subscriptionPeriodInISO_8601:offerName:storeExternalVersion:bundleID:price:introOffer:payment:", v29, v11, v34, v19, v45, v42, v26, v30, v35, v38);

  return v53;
}

id __80__FCPurchaseMetadataFetcher_fetchPurchaseMetadataForPurchaseID_restorePurchase___block_invoke_5(uint64_t a1, void *a2)
{
  return a2;
}

void __64__FCPurchaseMetadataFetcher_promisePurchaseLookupWithAppAdamID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = objc_alloc(MEMORY[0x1E0CFDB48]);
  -[FCPurchaseMetadataFetcher clientIdentifier](*(id *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCAMSBag bag](FCAMSBag, "bag");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithType:clientIdentifier:clientVersion:bag:", 2, v8, CFSTR("1"), v9);

  v21[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setItemIdentifiers:", v11);

  v20 = *MEMORY[0x1E0CFD908];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAdditionalPlatforms:", v12);

  objc_msgSend(v10, "perform");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __64__FCPurchaseMetadataFetcher_promisePurchaseLookupWithAppAdamID___block_invoke_2;
  v16[3] = &unk_1E46405E0;
  v18 = v6;
  v17 = *(id *)(a1 + 40);
  v19 = v5;
  v14 = v5;
  v15 = v6;
  objc_msgSend(v13, "addFinishBlock:", v16);

}

void __64__FCPurchaseMetadataFetcher_promisePurchaseLookupWithAppAdamID___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  FCPurchaseLookupResult *v28;
  const char *v29;
  id *p_isa;
  SEL v31;
  SEL v32;
  SEL v33;
  SEL v34;
  SEL v35;
  void *v36;
  void (*v37)(void);
  id v38;
  void *v39;
  uint64_t v40;
  id v41;

  v5 = a2;
  v41 = v5;
  if (!a3)
  {
    objc_msgSend(v5, "responseDataItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.news.purchaselookup"), 1001, 0);
    v40 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("attributes"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v9 = v8;
      else
        v9 = 0;
    }
    else
    {
      v9 = 0;
    }
    v10 = v9;

    objc_msgSend(v41, "fc_appAdamID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "fc_offerName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "fc_subscriptionPeriodInISO");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    if (!v13 || !v12)
    {
      v15 = 0;
      v16 = 0;
      goto LABEL_40;
    }
    v15 = 0;
    v16 = 0;
    if (v11)
    {
      objc_opt_class();
      v38 = v10;
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("offers"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v7;
      if (v17)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v18 = v17;
        else
          v18 = 0;
      }
      else
      {
        v18 = 0;
      }
      v19 = v18;

      if (objc_msgSend(v19, "count"))
      {
        objc_opt_class();
        objc_msgSend(v19, "firstObject");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v21 = v20;
          else
            v21 = 0;
        }
        else
        {
          v21 = 0;
        }
        v22 = v21;

        objc_msgSend(v41, "fc_introductoryOffers");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "firstObject");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("priceFormatted"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v24)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v25 = v24;
          else
            v25 = 0;
        }
        else
        {
          v25 = 0;
        }
        v15 = v25;

        objc_opt_class();
        objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("price"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (v26)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v27 = v26;
          else
            v27 = 0;
        }
        else
        {
          v27 = 0;
        }
        v14 = v27;

        if (v15)
        {
          v10 = v38;
          v7 = v39;
          if (v14)
          {
            v28 = objc_alloc_init(FCPurchaseLookupResult);
            p_isa = (id *)&v28->super.isa;
            if (v28)
            {
              objc_setProperty_nonatomic_copy(v28, v29, *(id *)(a1 + 32), 8);
              objc_setProperty_nonatomic_copy(p_isa, v31, v11, 48);
              objc_setProperty_nonatomic_copy(p_isa, v32, v12, 16);
              objc_setProperty_nonatomic_copy(p_isa, v33, v13, 24);
              objc_setProperty_nonatomic_copy(p_isa, v34, v15, 32);
              objc_storeStrong(p_isa + 7, v16);
              objc_setProperty_nonatomic_copy(p_isa, v35, v14, 40);
            }
            (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

            v36 = (void *)v40;
            goto LABEL_41;
          }
          goto LABEL_40;
        }
      }
      else
      {

        v14 = 0;
        v15 = 0;
        v16 = 0;
      }
      v10 = v38;
      v7 = v39;
    }
LABEL_40:
    v37 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    v36 = (void *)v40;
    v37();
LABEL_41:

    goto LABEL_42;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_42:

}

id __73__FCPurchaseMetadataFetcher_promiseStoreExternalVersionWithLookupResult___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;

  if (objc_msgSend(a2, "integerValue") == 1)
    -[FCPurchaseLookupResult setIntroOffer:](*(_QWORD *)(a1 + 32), 0);
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    v4 = *(void **)(v3 + 48);
  else
    v4 = 0;
  return -[FCPurchaseMetadataFetcher promiseStoreExternalVersionWithAppAdamID:](*(void **)(a1 + 40), v4);
}

- (id)promiseStoreExternalVersionWithAppAdamID:(void *)a1
{
  id v3;
  id v4;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = objc_alloc(MEMORY[0x1E0D60AF0]);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __70__FCPurchaseMetadataFetcher_promiseStoreExternalVersionWithAppAdamID___block_invoke;
    v6[3] = &unk_1E463F188;
    v6[4] = a1;
    v7 = v3;
    a1 = (void *)objc_msgSend(v4, "initWithResolver:", v6);

  }
  return a1;
}

void __66__FCPurchaseMetadataFetcher_checkIfOfferUsedAlreadyWithAppAdamID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0CF9CC0], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__FCPurchaseMetadataFetcher_checkIfOfferUsedAlreadyWithAppAdamID___block_invoke_2;
  v6[3] = &unk_1E463D3F8;
  v8 = v3;
  v7 = *(id *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v4, "refreshIAPsForActiveAccountWithCompletionHandler:", v6);

}

void __66__FCPurchaseMetadataFetcher_checkIfOfferUsedAlreadyWithAppAdamID___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CF9CC0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __66__FCPurchaseMetadataFetcher_checkIfOfferUsedAlreadyWithAppAdamID___block_invoke_3;
  v3[3] = &unk_1E4640658;
  v5 = *(id *)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  objc_msgSend(v2, "getAllIAPsForActiveAccountWithResultHandler:", v3);

}

void __66__FCPurchaseMetadataFetcher_checkIfOfferUsedAlreadyWithAppAdamID___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *, uint64_t, _BYTE *);
  void *v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x2020000000;
    v18 = 0;
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __66__FCPurchaseMetadataFetcher_checkIfOfferUsedAlreadyWithAppAdamID___block_invoke_4;
    v12 = &unk_1E4640630;
    v13 = *(id *)(a1 + 32);
    v14 = &v15;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", &v9);
    v7 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v16 + 24), v9, v10, v11, v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

    _Block_object_dispose(&v15, 8);
  }

}

void __66__FCPurchaseMetadataFetcher_checkIfOfferUsedAlreadyWithAppAdamID___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  const __CFString *v12;
  const __CFString *v13;
  _BYTE v14[12];
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  objc_msgSend(v6, "appAdamId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToNumber:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    v9 = (void *)FCPurchaseLog;
    if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = v9;
      if (objc_msgSend(v6, "hasUsedFreeOffer"))
        v12 = CFSTR("YES");
      else
        v12 = CFSTR("NO");
      *(_DWORD *)v14 = 138412802;
      if (objc_msgSend(v6, "hasUsedIntroPricingOffer"))
        v13 = CFSTR("YES");
      else
        v13 = CFSTR("NO");
      *(_QWORD *)&v14[4] = v10;
      v15 = 2112;
      v16 = v12;
      v17 = 2112;
      v18 = v13;
      _os_log_impl(&dword_1A1B90000, v11, OS_LOG_TYPE_DEFAULT, "FCPurchaseMetaDataFetcher checkIfOfferUsedAlready appAdamId=%@ hasUsedFreeOffer = %@ hasUsedIntroPricingOffer = %@", v14, 0x20u);

    }
    if ((objc_msgSend(v6, "hasUsedFreeOffer", *(_QWORD *)v14) & 1) != 0
      || objc_msgSend(v6, "hasUsedIntroPricingOffer"))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      *a4 = 1;
    }
  }

}

void __70__FCPurchaseMetadataFetcher_promiseStoreExternalVersionWithAppAdamID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = objc_alloc(MEMORY[0x1E0CFDB48]);
  -[FCPurchaseMetadataFetcher clientIdentifier](*(id *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCAMSBag bag](FCAMSBag, "bag");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithType:clientIdentifier:clientVersion:bag:", 0, v8, CFSTR("1"), v9);

  objc_msgSend(*(id *)(a1 + 40), "stringValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setItemIdentifiers:", v12);

  v20 = *MEMORY[0x1E0CFD908];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAdditionalPlatforms:", v13);

  objc_msgSend(v10, "perform");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __70__FCPurchaseMetadataFetcher_promiseStoreExternalVersionWithAppAdamID___block_invoke_2;
  v17[3] = &unk_1E4640680;
  v18 = v5;
  v19 = v6;
  v15 = v6;
  v16 = v5;
  objc_msgSend(v14, "addFinishBlock:", v17);

}

void __70__FCPurchaseMetadataFetcher_promiseStoreExternalVersionWithAppAdamID___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void (*v7)(void);
  id v8;

  v8 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.news.purchaselookup"), 1002, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fc_externalVersionID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    else
      v7 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    v7();

  }
}

id __100__FCPurchaseMetadataFetcher_promiseProductLookupWithLookupResult_externalVersionID_restorePurchase___block_invoke(_QWORD *a1, void *a2)
{
  const char *v3;
  id v4;
  void *v5;
  FCProductLookup *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id *v12;
  void *v13;

  v4 = a2;
  v5 = (void *)a1[4];
  if (v5)
    objc_setProperty_nonatomic_copy(v5, v3, v4, 8);
  v6 = [FCProductLookup alloc];
  v7 = a1[5];
  if (v7)
  {
    v8 = *(void **)(v7 + 16);
    v9 = *(void **)(v7 + 48);
  }
  else
  {
    v8 = 0;
    v9 = 0;
  }
  v10 = (void *)a1[6];
  v11 = v8;
  v12 = -[FCProductLookup initWithOfferName:appAdamID:storeExternalVersionID:bundleID:]((id *)&v6->super.isa, v11, v9, v10, v4);

  -[FCProductLookup lookup](v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

void __58__FCPurchaseMetadataFetcher_promiseBundleIDWithAppAdamID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = objc_alloc(MEMORY[0x1E0CFDB48]);
  -[FCPurchaseMetadataFetcher clientIdentifier](*(id *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCAMSBag bag](FCAMSBag, "bag");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithType:clientIdentifier:clientVersion:bag:", 0, v8, CFSTR("1"), v9);

  objc_msgSend(*(id *)(a1 + 40), "stringValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setItemIdentifiers:", v12);

  v20 = *MEMORY[0x1E0CFD908];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAdditionalPlatforms:", v13);

  objc_msgSend(v10, "perform");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __58__FCPurchaseMetadataFetcher_promiseBundleIDWithAppAdamID___block_invoke_2;
  v17[3] = &unk_1E4640680;
  v18 = v5;
  v19 = v6;
  v15 = v6;
  v16 = v5;
  objc_msgSend(v14, "addFinishBlock:", v17);

}

void __58__FCPurchaseMetadataFetcher_promiseBundleIDWithAppAdamID___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void (*v7)(void);
  id v8;

  v8 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.news.purchaselookup"), 1003, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fc_bundleID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    else
      v7 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    v7();

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_lookupResult, 0);
  objc_storeStrong((id *)&self->_externalVersionID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end

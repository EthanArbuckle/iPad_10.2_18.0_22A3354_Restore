@implementation AMSPurchaseRequestEncoder

- (AMSPurchaseRequestEncoder)initWithPurchaseInfo:(id)a3
{
  id v5;
  AMSPurchaseRequestEncoder *v6;
  AMSPurchaseRequestEncoder *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *purchaseRequestQueue;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AMSPurchaseRequestEncoder;
  v6 = -[AMSURLRequestEncoder init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_purchaseInfo, a3);
    v8 = dispatch_queue_create("com.apple.PurchaseRequest", 0);
    purchaseRequestQueue = v7->_purchaseRequestQueue;
    v7->_purchaseRequestQueue = (OS_dispatch_queue *)v8;

  }
  return v7;
}

- (AMSPurchaseRequestEncoder)initWithPurchaseInfo:(id)a3 bag:(id)a4
{
  id v7;
  id v8;
  AMSPurchaseRequestEncoder *v9;
  AMSPurchaseRequestEncoder *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *purchaseRequestQueue;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  objc_super v19;
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)AMSPurchaseRequestEncoder;
  v9 = -[AMSURLRequestEncoder init](&v19, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bag, a4);
    objc_storeStrong((id *)&v10->_purchaseInfo, a3);
    v11 = dispatch_queue_create("com.apple.PurchaseRequest", 0);
    purchaseRequestQueue = v10->_purchaseRequestQueue;
    v10->_purchaseRequestQueue = (OS_dispatch_queue *)v11;

    -[AMSPurchaseRequestEncoder purchaseInfo](v10, "purchaseInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "purchase");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "buyParams");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", 0x1E254E5E0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = v16;

      if (!v17)
      {
LABEL_7:

        goto LABEL_8;
      }
      v20 = CFSTR("purchaseProductType");
      v21[0] = v17;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSURLRequestEncoder setAdditionalMetrics:](v10, "setAdditionalMetrics:", v16);
    }
    else
    {
      v17 = 0;
    }

    goto LABEL_7;
  }
LABEL_8:

  return v10;
}

+ (id)configureRequest:(id)a3 purchaseInfo:(id)a4 bag:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  _QWORD v29[4];
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v8, "account");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    objc_msgSend(v8, "account");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "ams_isEphemeralAccount");

    if ((v12 & 1) == 0)
    {
      objc_msgSend(v8, "account");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "ams_addXTokenHeaderWithAccount:", v13);

    }
  }
  objc_msgSend(v8, "additionalHeaders");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    objc_msgSend(v8, "additionalHeaders");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "keyEnumerator");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v33;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v33 != v19)
            objc_enumerationMutation(v16);
          v21 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v20);
          objc_msgSend(v8, "additionalHeaders");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "objectForKeyedSubscript:", v21);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setValue:forHTTPHeaderField:", v23, v21);

          ++v20;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v18);
    }

  }
  objc_msgSend(a1, "_parametersFromPurchaseInfo:", v8);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __63__AMSPurchaseRequestEncoder_configureRequest_purchaseInfo_bag___block_invoke;
  v29[3] = &unk_1E2545048;
  v30 = v8;
  v31 = v7;
  v25 = v7;
  v26 = v8;
  objc_msgSend(v24, "continueWithBinaryPromiseBlock:", v29);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

id __63__AMSPurchaseRequestEncoder_configureRequest_purchaseInfo_bag___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  id v15;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "purchase");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "useJSONContentType"))
    v9 = 3;
  else
    v9 = 2;

  v10 = *(void **)(a1 + 40);
  v15 = v6;
  v11 = objc_msgSend(v10, "ams_setBodyParameters:encoding:compressBody:error:", v7, v9, 0, &v15);

  v12 = v15;
  if (v11)
    +[AMSBinaryPromise promiseWithSuccess](AMSBinaryPromise, "promiseWithSuccess");
  else
    +[AMSBinaryPromise promiseWithError:](AMSBinaryPromise, "promiseWithError:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)encodeRequest
{
  AMSMutablePromise *v3;
  NSObject *v4;
  AMSMutablePromise *v5;
  AMSMutablePromise *v6;
  AMSMutablePromise *v7;
  _QWORD v9[5];
  AMSMutablePromise *v10;

  v3 = objc_alloc_init(AMSMutablePromise);
  -[AMSPurchaseRequestEncoder purchaseRequestQueue](self, "purchaseRequestQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __42__AMSPurchaseRequestEncoder_encodeRequest__block_invoke;
  v9[3] = &unk_1E253E2B0;
  v9[4] = self;
  v5 = v3;
  v10 = v5;
  dispatch_async(v4, v9);

  v6 = v10;
  v7 = v5;

  return v7;
}

void __42__AMSPurchaseRequestEncoder_encodeRequest__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  AMSKeychainOptions *v12;
  void *v13;
  void *v14;
  char v15;
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
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[5];
  id v34;

  objc_msgSend(*(id *)(a1 + 32), "purchaseInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setClientInfo:", v3);

  objc_msgSend(*(id *)(a1 + 32), "purchaseInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "purchase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "useJSONContentType"))
    v6 = 3;
  else
    v6 = 2;
  objc_msgSend(*(id *)(a1 + 32), "setRequestEncoding:", v6);

  objc_msgSend(*(id *)(a1 + 32), "purchaseInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "purchase");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "logUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setLogUUID:", v9);

  objc_msgSend(*(id *)(a1 + 32), "purchaseInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "account");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setAnisetteType:", +[AMSPurchaseRequestEncoder _anisetteTypeFromAccount:](AMSPurchaseRequestEncoder, "_anisetteTypeFromAccount:", v11));

  v12 = objc_alloc_init(AMSKeychainOptions);
  -[AMSKeychainOptions setStyle:](v12, "setStyle:", +[AMSKeychainOptions preferredAttestationStyle](AMSKeychainOptions, "preferredAttestationStyle"));
  -[AMSKeychainOptions setPurpose:](v12, "setPurpose:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setKeychainOptions:", v12);
  objc_msgSend(*(id *)(a1 + 32), "purchaseInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "purchase");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isUserInitiated");

  if ((v15 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "setDialogOptions:", 1);
  objc_msgSend(*(id *)(a1 + 32), "purchaseInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "account");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(*(id *)(a1 + 32), "purchaseInfo");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "purchase");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "storefront");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(*(id *)(a1 + 32), "purchaseInfo");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "account");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "purchaseInfo");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "purchase");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "storefront");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "ams_setStorefront:", v25);

    }
    objc_msgSend(*(id *)(a1 + 32), "purchaseInfo");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "account");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setAccount:", v27);

  }
  v28 = (void *)objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "purchaseInfo");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "bag");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "bagURLFromPurchaseInfo:bag:", v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __42__AMSPurchaseRequestEncoder_encodeRequest__block_invoke_2;
  v33[3] = &unk_1E2545098;
  v32 = *(void **)(a1 + 40);
  v33[4] = *(_QWORD *)(a1 + 32);
  v34 = v32;
  objc_msgSend(v31, "addFinishBlock:", v33);

}

void __42__AMSPurchaseRequestEncoder_encodeRequest__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  unint64_t v7;
  AMSURLRequest *v8;
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
  AMSURLRequest *v19;
  uint64_t v20;
  void *v21;
  _QWORD v22[4];
  AMSURLRequest *v23;
  uint64_t v24;
  id v25;

  v5 = a2;
  v6 = a3;
  v7 = (unint64_t)v6;
  v8 = 0;
  if (v5)
  {
    if (!v6)
    {
      v8 = -[AMSURLRequest initWithURL:]([AMSURLRequest alloc], "initWithURL:", v5);
      objc_msgSend(*(id *)(a1 + 32), "purchaseInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSURLRequest properties](v8, "properties");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setPurchaseInfo:", v9);

      if (os_variant_has_internal_content())
      {
        -[AMSURLRequest properties](v8, "properties");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "purchaseInfo");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "clientCorrelationKey");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMSURLRequest setValue:forHTTPHeaderField:](v8, "setValue:forHTTPHeaderField:", v13, CFSTR("X-Apple-Purchase-UUID"));

      }
    }
  }
  if (!(v7 | (unint64_t)v8))
  {
    v14 = *(void **)(a1 + 40);
    AMSError(2, CFSTR("Purchase Encoder Failed"), CFSTR("Invalid request"), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "finishWithError:", v15);

    goto LABEL_9;
  }
  if (!v7)
  {
LABEL_9:
    objc_msgSend(*(id *)(a1 + 32), "purchaseInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "bag");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPurchaseRequestEncoder configureRequest:purchaseInfo:bag:](AMSPurchaseRequestEncoder, "configureRequest:purchaseInfo:bag:", v8, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __42__AMSPurchaseRequestEncoder_encodeRequest__block_invoke_3;
    v22[3] = &unk_1E253DB30;
    v19 = v8;
    v20 = *(_QWORD *)(a1 + 32);
    v21 = *(void **)(a1 + 40);
    v23 = v19;
    v24 = v20;
    v25 = v21;
    objc_msgSend(v18, "addFinishBlock:", v22);

    goto LABEL_10;
  }
  objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v7);
LABEL_10:

}

void __42__AMSPurchaseRequestEncoder_encodeRequest__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  objc_super v6;

  v2 = *(_QWORD *)(a1 + 32);
  v6.receiver = *(id *)(a1 + 40);
  v6.super_class = (Class)AMSPurchaseRequestEncoder;
  objc_msgSendSuper2(&v6, sel_requestByEncodingRequest_parameters_, v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __42__AMSPurchaseRequestEncoder_encodeRequest__block_invoke_4;
  v4[3] = &unk_1E2545070;
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v3, "addFinishBlock:", v4);

}

uint64_t __42__AMSPurchaseRequestEncoder_encodeRequest__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", a2, a3);
}

+ (BOOL)isRedirectBagURLOverrideEnabled
{
  return _os_feature_enabled_impl();
}

+ (int64_t)_anisetteTypeFromAccount:(id)a3
{
  id v3;
  void *v4;
  int64_t v5;

  v3 = a3;
  v4 = v3;
  if (v3 && (objc_msgSend(v3, "ams_isEphemeralAccount") & 1) == 0)
  {
    if (objc_msgSend(v4, "ams_isLocalAccount"))
      v5 = 2;
    else
      v5 = 1;
  }
  else
  {
    v5 = 2;
  }

  return v5;
}

+ (id)_buyProductURLKeysForProductType:(id)a3 prefix:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a4;
  v6 = (objc_class *)MEMORY[0x1E0C99DE8];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  AMSBagKeyBuyProductOverrideForProductType(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), v5, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v10);

  }
  else
  {
    if (v9)
      objc_msgSend(v8, "addObject:", v9);
    if (!v5)
    {
      objc_msgSend(v8, "addObject:", 0x1E254D1C0);
      goto LABEL_9;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), v5, 0x1E254D1C0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v11);

LABEL_9:
  v12 = (void *)objc_msgSend(v8, "copy");

  return v12;
}

+ (id)_bagURLKeysForPurchaseType:(int64_t)a3 withProductType:(id)a4 purchase:(id)a5 prefix:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v11, "URLBagKey");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("%@/"), v12);
      v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    }
    v14 = v17;
    if (a3)
    {
      AMSBagKeyForPurchaseType(a3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "appendString:", v18);

    }
    else
    {
      if (v10)
      {
        objc_msgSend(a1, "_buyProductURLKeysForProductType:prefix:", v10, v12);
        v15 = objc_claimAutoreleasedReturnValue();
        goto LABEL_3;
      }
      objc_msgSend(v17, "appendString:", 0x1E254D1C0);
    }
    v19 = (void *)objc_msgSend(v14, "copy");
    v21 = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  objc_msgSend(v11, "URLBagKey");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v15 = objc_claimAutoreleasedReturnValue();
LABEL_3:
  v16 = (void *)v15;
LABEL_10:

  return v16;
}

+ (id)_bagURLKeysFromPurchaseInfo:(id)a3
{
  id v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  __CFString *v17;
  id v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v4, "buyParams");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsKey:", CFSTR("pkPayment"));

  objc_msgSend(v4, "buyParams");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("buyType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "purchase");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "purchaseType");

  objc_msgSend(v4, "purchase");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "buyParams");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", 0x1E254E5E0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v15 = v14;
  else
    v15 = 0;

  if (v7)
  {
    objc_msgSend(v4, "purchase");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = CFSTR("commerce-payment-blob-buy-urls");
    v18 = a1;
    v19 = v11;
    v20 = v15;
    v21 = v16;
  }
  else
  {
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), 0x1E254D1E0, v9);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v22);

    }
    objc_msgSend(v4, "purchase");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = a1;
    v19 = v11;
    v20 = v15;
    v21 = v16;
    v17 = CFSTR("commerce-buy-urls");
  }
  objc_msgSend(v18, "_bagURLKeysForPurchaseType:withProductType:purchase:prefix:", v19, v20, v21, v17);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v23);

  objc_msgSend(v4, "purchase");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_bagURLKeysForPurchaseType:withProductType:purchase:prefix:", v11, v15, v24, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v25);

  v26 = (void *)objc_msgSend(v5, "copy");
  return v26;
}

+ (id)bagURLFromPurchaseInfo:(id)a3 bag:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "_bagURLKeysFromPurchaseInfo:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __56__AMSPurchaseRequestEncoder_bagURLFromPurchaseInfo_bag___block_invoke;
  v15[3] = &unk_1E25450C0;
  v16 = v7;
  v17 = v6;
  v18 = a1;
  v9 = v6;
  v10 = v7;
  objc_msgSend(v8, "ams_mapWithTransformIgnoresNil:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "ams_mapWithTransformIgnoresNil:", &__block_literal_global_108);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSPromise promiseWithAny:](AMSPromise, "promiseWithAny:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id __56__AMSPurchaseRequestEncoder_bagURLFromPurchaseInfo_bag___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "account");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URLForKey:account:", v4, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "account");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v9, "OSLogObject");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        AMSLogKey();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)MEMORY[0x1E0CB3940];
        v13 = objc_opt_class();
        v14 = v13;
        if (v11)
        {
          AMSLogKey();
          v2 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "stringWithFormat:", CFSTR("%@: [%@] "), v14, v2);
        }
        else
        {
          objc_msgSend(v12, "stringWithFormat:", CFSTR("%@: "), v13);
        }
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(sel_URLForKey_account_);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v19 = v15;
        v20 = 2114;
        v21 = v16;
        _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_ERROR, "%{public}@AMSBagProtocol implementation doesn't implement %{public}@ but an account was specified. This may cause mismatches between account used for bag value fetches and account used for request encoding.", buf, 0x16u);
        if (v11)
        {

          v15 = (void *)v2;
        }

      }
    }
    objc_msgSend(*(id *)(a1 + 32), "URLForKey:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

uint64_t __56__AMSPurchaseRequestEncoder_bagURLFromPurchaseInfo_bag___block_invoke_38(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "valuePromise");
}

+ (id)_parametersFromPurchaseInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  AMSBuyParams *v8;
  AMSBuyParams *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  AMSBuyParams *v41;
  id v42;
  void *v43;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  _QWORD v50[4];
  id v51;
  AMSBuyParams *v52;
  id v53;
  _QWORD v54[4];
  id v55;
  AMSBuyParams *v56;
  id v57;
  id v58;
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  void *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "buyParams");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = objc_alloc_init(AMSBuyParams);
  v9 = v8;

  objc_msgSend(v4, "clientCorrelationKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSBuyParams setParameter:forKey:](v9, "setParameter:forKey:", v10, CFSTR("clientCorrelationKey"));

  if (objc_msgSend(v4, "addKBSync"))
  {
    +[AMSKeybag sharedInstance](AMSKeybag, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "account");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "ams_DSID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = 0;
    objc_msgSend(v11, "keybagSyncDataWithAccountID:transactionType:error:", v13, 1, &v58);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v58;

    if (v15)
    {
      +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v16)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v16, "OSLogObject");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v4, "purchase");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "logUUID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)MEMORY[0x1E0CB3940];
        v48 = a1;
        v20 = objc_opt_class();
        v21 = v20;
        if (v18)
        {
          objc_msgSend(v4, "purchase");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "logUUID");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "stringWithFormat:", CFSTR("%@: [%@] "), v21, v45);
        }
        else
        {
          objc_msgSend(v19, "stringWithFormat:", CFSTR("%@: "), v20);
        }
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        AMSLogableError(v15);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v60 = v22;
        v61 = 2114;
        v62 = v23;
        _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to lookup kbsync due to error: %{public}@", buf, 0x16u);
        if (v18)
        {

          v22 = v46;
        }

        a1 = v48;
      }

    }
    else
    {
      if (!v14)
      {
LABEL_19:

        goto LABEL_20;
      }
      objc_msgSend(v14, "base64EncodedStringWithOptions:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSBuyParams setParameter:forKey:](v9, "setParameter:forKey:", v16, CFSTR("kbsync"));
    }

    goto LABEL_19;
  }
LABEL_20:
  +[AMSDevice deviceGUID](AMSDevice, "deviceGUID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
    -[AMSBuyParams setParameter:forKey:](v9, "setParameter:forKey:", v24, CFSTR("guid"));
  if (+[AMSDevice deviceIsiPad](AMSDevice, "deviceIsiPad")
    || +[AMSDevice deviceIsiPhone](AMSDevice, "deviceIsiPhone")
    || +[AMSDevice deviceIsiPod](AMSDevice, "deviceIsiPod"))
  {
    objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "ams_activeiCloudAccount");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v26, "isEnabledForDataclass:", *MEMORY[0x1E0C8F360]))
      -[AMSBuyParams setParameter:forKey:](v9, "setParameter:forKey:", CFSTR("1"), CFSTR("icloud-backup-enabled"));

  }
  objc_msgSend(v4, "account");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "ams_isEphemeralAccount");

  v29 = MEMORY[0x1E0C809B0];
  if ((v28 & 1) != 0)
  {
    +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v30)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v30, "OSLogObject");
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "purchase");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "logUUID");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (void *)MEMORY[0x1E0CB3940];
      v49 = a1;
      v35 = objc_opt_class();
      v36 = v35;
      if (v33)
      {
        objc_msgSend(v4, "purchase");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "logUUID");
        a1 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "stringWithFormat:", CFSTR("%@: [%@] "), v36, a1);
      }
      else
      {
        objc_msgSend(v34, "stringWithFormat:", CFSTR("%@: "), v35);
      }
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v60 = v37;
      _os_log_impl(&dword_18C849000, v31, OS_LOG_TYPE_INFO, "%{public}@Skipping AFDS for Ephemeral Account.", buf, 0xCu);
      if (v33)
      {

        v37 = v47;
      }

      a1 = v49;
      v29 = MEMORY[0x1E0C809B0];
    }

    +[AMSBinaryPromise promiseWithSuccess](AMSBinaryPromise, "promiseWithSuccess");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[AMSFDSService cachedFDSForPurchaseInfo:](AMSFDSService, "cachedFDSForPurchaseInfo:", v4);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "promiseWithTimeout:", 4.0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    v54[0] = v29;
    v54[1] = 3221225472;
    v54[2] = __57__AMSPurchaseRequestEncoder__parametersFromPurchaseInfo___block_invoke;
    v54[3] = &unk_1E2545130;
    v55 = v4;
    v57 = a1;
    v56 = v9;
    objc_msgSend(v39, "continueWithBinaryPromiseBlock:", v54);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v50[0] = v29;
  v50[1] = 3221225472;
  v50[2] = __57__AMSPurchaseRequestEncoder__parametersFromPurchaseInfo___block_invoke_52;
  v50[3] = &unk_1E2545158;
  v52 = v9;
  v53 = a1;
  v51 = v4;
  v41 = v9;
  v42 = v4;
  objc_msgSend(v40, "continueWithPromiseBlock:", v50);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  return v43;
}

id __57__AMSPurchaseRequestEncoder__parametersFromPurchaseInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _UNKNOWN **v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  __CFString *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v55;
  void *v56;
  void *v57;
  __CFString *v58;
  __CFString *v59;
  void *v60;
  id v61;
  id v62;
  _QWORD v63[4];
  id v64;
  uint64_t v65;
  uint8_t buf[4];
  void *v67;
  __int16 v68;
  void *v69;
  __int16 v70;
  void *v71;
  __int16 v72;
  void *v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = &off_1E2519000;
  if (v6)
  {
    +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v60 = v6;
      objc_msgSend(*(id *)(a1 + 32), "purchase");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "logUUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0CB3940];
      v13 = objc_opt_class();
      v14 = v13;
      if (v11)
      {
        objc_msgSend(*(id *)(a1 + 32), "purchase");
        a3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a3, "logUUID");
        v7 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringWithFormat:", CFSTR("%@: [%@] "), v14, v7);
      }
      else
      {
        objc_msgSend(v12, "stringWithFormat:", CFSTR("%@: "), v13);
      }
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v60);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v67 = v15;
      v68 = 2114;
      v69 = v16;
      _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Reading empty AFDS cache, error: %{public}@", buf, 0x16u);
      if (v11)
      {

        v15 = a3;
      }

      v6 = v60;
    }

  }
  objc_msgSend(v5, "value");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v18 = CFSTR("afds");
    if (objc_msgSend(v5, "action") == 4)
    {
      v19 = CFSTR("afdsv2");

      v18 = v19;
    }
    +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v20, "OSLogObject");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "purchase");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "logUUID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)MEMORY[0x1E0CB3940];
      v24 = objc_opt_class();
      v25 = v24;
      v61 = v6;
      if (v22)
      {
        objc_msgSend(*(id *)(a1 + 32), "purchase");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "logUUID");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "stringWithFormat:", CFSTR("%@: [%@] "), v25, v55);
      }
      else
      {
        objc_msgSend(v23, "stringWithFormat:", CFSTR("%@: "), v24);
      }
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = v18;
      AMSHashIfNeeded(v18);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "action"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "value");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v67 = v26;
      v68 = 2114;
      v69 = v35;
      v70 = 2114;
      v71 = v36;
      v72 = 2114;
      v73 = v38;
      _os_log_impl(&dword_18C849000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Adding an AFDS value to the request. buyParam = %{public}@, action = %{public}@, value = %{public}@", buf, 0x2Au);

      if (v22)
      {

        v26 = v56;
      }

      v18 = v58;
      v6 = v61;
    }

    v39 = *(void **)(a1 + 40);
    objc_msgSend(v5, "value");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setParameter:forKey:", v40, v18);

    if (objc_msgSend(v5, "action") == 4)
    {
      +[AMSFDSService didConsumeFDSForPurchaseInfo:](AMSFDSService, "didConsumeFDSForPurchaseInfo:", *(_QWORD *)(a1 + 32));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v63[0] = MEMORY[0x1E0C809B0];
      v63[1] = 3221225472;
      v63[2] = __57__AMSPurchaseRequestEncoder__parametersFromPurchaseInfo___block_invoke_49;
      v63[3] = &unk_1E2545108;
      v42 = *(id *)(a1 + 32);
      v43 = *(_QWORD *)(a1 + 48);
      v64 = v42;
      v65 = v43;
      objc_msgSend(v41, "continueWithBlock:", v63);
      v44 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v45)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v45, "OSLogObject");
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        v59 = v18;
        v62 = v6;
        objc_msgSend(*(id *)(a1 + 32), "purchase");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "logUUID");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = (void *)MEMORY[0x1E0CB3940];
        v50 = objc_opt_class();
        v51 = v50;
        if (v48)
        {
          objc_msgSend(*(id *)(a1 + 32), "purchase");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "logUUID");
          a1 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "stringWithFormat:", CFSTR("%@: [%@] "), v51, a1);
        }
        else
        {
          objc_msgSend(v49, "stringWithFormat:", CFSTR("%@: "), v50);
        }
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "action"));
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v67 = v52;
        v68 = 2114;
        v69 = v53;
        _os_log_impl(&dword_18C849000, v46, OS_LOG_TYPE_INFO, "%{public}@Skipping AFDS completion call for action type: %{public}@", buf, 0x16u);

        v6 = v62;
        if (v48)
        {

          v52 = v39;
        }

        v18 = v59;
      }

      +[AMSBinaryPromise promiseWithSuccess](AMSBinaryPromise, "promiseWithSuccess");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v27)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v27, "OSLogObject");
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "purchase");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "logUUID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)MEMORY[0x1E0CB3940];
      v32 = objc_opt_class();
      v33 = v32;
      if (v30)
      {
        objc_msgSend(*(id *)(a1 + 32), "purchase");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "logUUID");
        a1 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "stringWithFormat:", CFSTR("%@: [%@] "), v33, a1);
      }
      else
      {
        objc_msgSend(v31, "stringWithFormat:", CFSTR("%@: "), v32);
      }
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v67 = v34;
      _os_log_impl(&dword_18C849000, v28, OS_LOG_TYPE_INFO, "%{public}@No AFDS available.", buf, 0xCu);
      if (v30)
      {

        v34 = v17;
      }

    }
    +[AMSBinaryPromise promiseWithSuccess](AMSBinaryPromise, "promiseWithSuccess");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v44;
}

id __57__AMSPurchaseRequestEncoder__parametersFromPurchaseInfo___block_invoke_49(id *a1, uint64_t a2, void *a3)
{
  void *v3;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(a1[4], "purchase");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "logUUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x1E0CB3940];
      v11 = objc_opt_class();
      v12 = v11;
      if (v9)
      {
        objc_msgSend(a1[4], "purchase");
        a1 = (id *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "logUUID");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringWithFormat:", CFSTR("%@: [%@] "), v12, v3);
      }
      else
      {
        objc_msgSend(v10, "stringWithFormat:", CFSTR("%@: "), v11);
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v5);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v19 = v13;
      v20 = 2114;
      v21 = v15;
      _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_ERROR, "%{public}@AFDS completion call failed with error: %{public}@", buf, 0x16u);
      if (v9)
      {

        v13 = a1;
      }

    }
    +[AMSBinaryPromise promiseWithError:](AMSBinaryPromise, "promiseWithError:", v5);
    v14 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[AMSBinaryPromise promiseWithSuccess](AMSBinaryPromise, "promiseWithSuccess");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v16 = (void *)v14;

  return v16;
}

id __57__AMSPurchaseRequestEncoder__parametersFromPurchaseInfo___block_invoke_52(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "hasBeenAuthedForBuy"))
  {
    +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "OSLogObject");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "purchase");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logUUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E0CB3940];
      v9 = objc_opt_class();
      v10 = v9;
      if (v7)
      {
        objc_msgSend(*(id *)(a1 + 32), "purchase");
        v1 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v1, "logUUID");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "stringWithFormat:", CFSTR("%@: [%@] "), v10, v2);
      }
      else
      {
        objc_msgSend(v8, "stringWithFormat:", CFSTR("%@: "), v9);
      }
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v11;
      _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@'hasBeenAuthedForBuy' flag set: Attaching to buyParams", buf, 0xCu);
      if (v7)
      {

        v11 = v1;
      }

    }
    objc_msgSend(*(id *)(a1 + 40), "setParameter:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("hasBeenAuthedForBuy"));
  }
  objc_msgSend(*(id *)(a1 + 32), "paymentServicesURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "paymentServicesURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "absoluteString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setParameter:forKey:", v15, CFSTR("applePayPaymentServiceURL"));

  }
  objc_msgSend(*(id *)(a1 + 32), "paymentToken");
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)v16;
    objc_msgSend(*(id *)(a1 + 32), "expressCheckoutMode");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v19 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "expressCheckoutMode");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setParameter:forKey:", v20, CFSTR("expressCheckoutMode"));

    }
  }
  objc_msgSend(*(id *)(a1 + 40), "normalizedDictionary");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (id)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
  objc_storeStrong((id *)&self->_bag, a3);
}

- (AMSPurchaseInfo)purchaseInfo
{
  return self->_purchaseInfo;
}

- (OS_dispatch_queue)purchaseRequestQueue
{
  return self->_purchaseRequestQueue;
}

- (void)setPurchaseRequestQueue:(id)a3
{
  objc_storeStrong((id *)&self->_purchaseRequestQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purchaseRequestQueue, 0);
  objc_storeStrong((id *)&self->_purchaseInfo, 0);
  objc_storeStrong((id *)&self->_bag, 0);
}

@end

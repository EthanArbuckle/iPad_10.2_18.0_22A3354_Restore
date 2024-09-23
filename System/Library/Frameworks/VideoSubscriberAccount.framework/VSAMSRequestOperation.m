@implementation VSAMSRequestOperation

- (VSAMSRequestOperation)initWithRequest:(id)a3
{
  id v5;
  VSAMSRequestOperation *v6;
  VSAMSRequestOperation *v7;

  v5 = a3;
  v6 = -[VSAMSRequestOperation init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_request, a3);

  return v7;
}

- (VSAMSRequestOperation)init
{
  VSAMSRequestOperation *v2;
  VSOptional *v3;
  VSOptional *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  uint64_t v8;
  NSOperationQueue *privateQueue;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)VSAMSRequestOperation;
  v2 = -[VSAMSRequestOperation init](&v11, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(VSOptional);
    v4 = v2->_result;
    v2->_result = v3;

    v5 = (void *)MEMORY[0x1E0CB3828];
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "queueWithName:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    privateQueue = v2->_privateQueue;
    v2->_privateQueue = (NSOperationQueue *)v8;

  }
  return v2;
}

- (void)executionDidBegin
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  -[VSAMSRequestOperation request](self, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "requestType");

  -[VSAMSRequestOperation request](self, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "methodName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[VSAMSRequestOperation request](self, "request");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "parameters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __42__VSAMSRequestOperation_executionDidBegin__block_invoke;
  v11[3] = &unk_1E939ED10;
  v9 = v6;
  v12 = v9;
  v10 = v8;
  v13 = v10;
  objc_copyWeak(&v14, &location);
  -[VSAMSRequestOperation urlForRequestType:completionHandler:](self, "urlForRequestType:completionHandler:", v4, v11);
  objc_destroyWeak(&v14);

  objc_destroyWeak(&location);
}

void __42__VSAMSRequestOperation_executionDidBegin__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id WeakRetained;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v21 = v6;
    v22 = v5;
    v20 = v5;
    objc_msgSend(MEMORY[0x1E0CB37A8], "requestWithURL:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHTTPMethod:", *(_QWORD *)(a1 + 32));
    objc_msgSend(MEMORY[0x1E0CFD9E8], "vs_defaultBag");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB39F8], "defaultSessionConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFDCA0]), "initWithConfiguration:", v10);
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFDB50]), "initWithClientIdentifier:bag:", CFSTR("VideoSubscriberAccount"), v9);
    objc_msgSend(v12, "setSession:", v11);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFDB30]), "initWithTokenService:", v12);
    objc_msgSend(v11, "setProtocolHandler:", v13);
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFDB38]), "initWithTokenService:bag:", v12, v9);
    objc_msgSend(v14, "requestByEncodingRequest:parameters:", v8, *(_QWORD *)(a1 + 40));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __42__VSAMSRequestOperation_executionDidBegin__block_invoke_2;
    v23[3] = &unk_1E939ECE8;
    objc_copyWeak(&v25, (id *)(a1 + 48));
    v16 = v11;
    v24 = v16;
    objc_msgSend(v15, "addFinishBlock:", v23);

    objc_destroyWeak(&v25);
    v7 = v21;
    v5 = v22;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    if (!v7)
    {
      VSPrivateErrorWithRecoverySuggestion(-25, 0, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7)
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The errorOrNil parameter must not be nil."));
    }
    +[VSFailable failableWithError:](VSFailable, "failableWithError:", v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[VSOptional optionalWithObject:](VSOptional, "optionalWithObject:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setResult:", v19);

    objc_msgSend(WeakRetained, "finishExecutionIfPossible");
  }

}

void __42__VSAMSRequestOperation_executionDidBegin__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *v7;
  id WeakRetained;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;

  v5 = a2;
  v6 = a3;
  v7 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v6)
  {
    v9 = v6;
    VSErrorLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __42__VSAMSRequestOperation_executionDidBegin__block_invoke_2_cold_2();

  }
  else
  {
    if (v5)
    {
      v9 = v5;
      objc_msgSend(*(id *)(a1 + 32), "dataTaskPromiseWithRequest:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __42__VSAMSRequestOperation_executionDidBegin__block_invoke_15;
      v21[3] = &unk_1E939ECC0;
      objc_copyWeak(&v22, v7);
      objc_msgSend(v13, "addFinishBlock:", v21);
      objc_destroyWeak(&v22);

      goto LABEL_8;
    }
    VSErrorLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      __42__VSAMSRequestOperation_executionDidBegin__block_invoke_2_cold_1((uint64_t)WeakRetained, v14, v15, v16, v17, v18, v19, v20);

    VSPrivateErrorWithRecoverySuggestion(-25, 0, 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  +[VSFailable failableWithError:](VSFailable, "failableWithError:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[VSOptional optionalWithObject:](VSOptional, "optionalWithObject:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setResult:", v12);

  objc_msgSend(WeakRetained, "finishExecutionIfPossible");
LABEL_8:

}

void __42__VSAMSRequestOperation_executionDidBegin__block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v6)
  {
    v8 = v6;
    VSErrorLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __42__VSAMSRequestOperation_executionDidBegin__block_invoke_15_cold_2();

LABEL_5:
    +[VSFailable failableWithError:](VSFailable, "failableWithError:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[VSOptional optionalWithObject:](VSOptional, "optionalWithObject:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setResult:", v11);
    goto LABEL_10;
  }
  if (!v5)
  {
    VSErrorLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      __42__VSAMSRequestOperation_executionDidBegin__block_invoke_15_cold_1((uint64_t)WeakRetained, v14, v15, v16, v17, v18, v19, v20);

    VSPrivateErrorWithRecoverySuggestion(-25, 0, 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v8 = v5;
  VSDefaultLogObject();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 138412546;
    v22 = WeakRetained;
    v23 = 2112;
    v24 = v8;
    _os_log_impl(&dword_1D2419000, v12, OS_LOG_TYPE_DEFAULT, "AMS request %@ returned result %@", (uint8_t *)&v21, 0x16u);
  }

  objc_msgSend(v8, "data");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[VSFailable failableWithObject:](VSFailable, "failableWithObject:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[VSOptional optionalWithObject:](VSOptional, "optionalWithObject:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setResult:", v13);

LABEL_10:
  objc_msgSend(WeakRetained, "finishExecutionIfPossible");

}

- (void)cancel
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VSAMSRequestOperation;
  -[VSAsyncOperation cancel](&v4, sel_cancel);
  -[VSAMSRequestOperation privateQueue](self, "privateQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelAllOperations");

}

- (void)urlForRequestType:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  VSAMSBagLoadOperation *v7;
  VSAMSBagLoadOperation *v8;
  VSAMSBagLoadOperation *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  id v19[2];
  id v20;
  id v21;
  id from;
  id location;

  v6 = a4;
  v7 = objc_alloc_init(VSAMSBagLoadOperation);
  -[VSAMSBagLoadOperation setBagKey:](v7, "setBagKey:", CFSTR("countryCode"));
  v8 = objc_alloc_init(VSAMSBagLoadOperation);
  -[VSAMSBagLoadOperation setBagKey:](v8, "setBagKey:", CFSTR("apps-media-api-host"));
  v9 = objc_alloc_init(VSAMSBagLoadOperation);
  -[VSAMSBagLoadOperation setBagKey:](v9, "setBagKey:", CFSTR("language-tag"));
  objc_initWeak(&location, v7);
  objc_initWeak(&from, v8);
  objc_initWeak(&v21, v9);
  objc_initWeak(&v20, self);
  v10 = (void *)MEMORY[0x1E0CB34C8];
  v14[1] = 3221225472;
  v14[2] = __61__VSAMSRequestOperation_urlForRequestType_completionHandler___block_invoke;
  v14[3] = &unk_1E939ED38;
  v14[0] = MEMORY[0x1E0C809B0];
  objc_copyWeak(&v16, &location);
  objc_copyWeak(&v17, &from);
  objc_copyWeak(&v18, &v21);
  objc_copyWeak(v19, &v20);
  v19[1] = (id)a3;
  v11 = v6;
  v15 = v11;
  objc_msgSend(v10, "blockOperationWithBlock:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSAMSRequestOperation privateQueue](self, "privateQueue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addDependency:", v7);
  objc_msgSend(v12, "addDependency:", v8);
  objc_msgSend(v12, "addDependency:", v9);
  objc_msgSend(v13, "addOperation:", v7);
  objc_msgSend(v13, "addOperation:", v8);
  objc_msgSend(v13, "addOperation:", v9);
  objc_msgSend(v13, "addOperation:", v12);

  objc_destroyWeak(v19);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

void __61__VSAMSRequestOperation_urlForRequestType_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  _QWORD *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  id v85;
  id v86;
  void *v87;
  id v88;
  void *v89;
  id v90;
  id v91;
  id v92;
  _QWORD v93[3];
  _QWORD v94[2];
  _QWORD v95[2];
  _QWORD v96[2];
  _QWORD v97[2];
  _QWORD v98[3];
  _QWORD v99[4];

  v1 = a1;
  v99[2] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = objc_loadWeakRetained((id *)(v1 + 48));
  v4 = objc_loadWeakRetained((id *)(v1 + 56));
  v5 = objc_loadWeakRetained((id *)(v1 + 64));
  objc_msgSend(WeakRetained, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    v88 = v5;
    v12 = v7;
    v13 = v1;
    v14 = WeakRetained;
    v15 = v6;
    v16 = v12;
    v17 = v8;
    objc_msgSend(v3, "error");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      v20 = v18;
    }
    else
    {
      objc_msgSend(v4, "error");
      v20 = (id)objc_claimAutoreleasedReturnValue();
    }
    v21 = v20;

    v11 = v21;
    v8 = v17;
    v22 = v16;
    v6 = v15;
    WeakRetained = v14;
    v1 = v13;
    v7 = v22;
    v5 = v88;
  }

  if (v6 && v7 && v8)
  {
    v84 = v11;
    v85 = v3;
    v86 = v4;
    v92 = v6;
    v79 = v7;
    v23 = v7;
    v83 = v8;
    v24 = v8;
    v25 = objc_alloc_init(MEMORY[0x1E0CB3998]);
    objc_msgSend(v25, "setScheme:", CFSTR("https"));
    v82 = v23;
    objc_msgSend(v25, "setHost:", v23);
    +[VSDevice currentDevice](VSDevice, "currentDevice");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)MEMORY[0x1E0CB39D8];
    v81 = v26;
    objc_msgSend(v26, "stringForAMSPlatform");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "queryItemWithName:value:", CFSTR("platform"), v28);
    v29 = objc_claimAutoreleasedReturnValue();

    v80 = v24;
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("l"), v24);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = (void *)v29;
    v99[0] = v29;
    v99[1] = v30;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v99, 2);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setQueryItems:", v31);

    switch(*(_QWORD *)(v1 + 72))
    {
      case 0:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/v1/catalog/%@/tv-providers"), v92);
        v73 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setPath:", v73);
        objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("include"), CFSTR("apps"));
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("redef[multiple-system-operators]"), CFSTR("tv-providers"));
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("extend"), CFSTR("externalVersionId"));
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "queryItems");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v98[0] = v89;
        v98[1] = v76;
        v98[2] = v72;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v98, 3);
        v33 = v30;
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "arrayByAddingObjectsFromArray:", v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setQueryItems:", v35);

        v30 = v33;
        v36 = (void *)v73;

        goto LABEL_17;
      case 1:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/v1/catalog/%@/apps"), v92);
        v74 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setPath:", v74);
        objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("filter[supportsTVProviders]"), CFSTR("true"));
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("fields"), CFSTR("name,artwork,deviceFamilies"));
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "queryItems");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v97[0] = v89;
        v97[1] = v76;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v97, 2);
        v40 = v30;
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "arrayByAddingObjectsFromArray:", v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setQueryItems:", v42);

        v30 = v40;
        v36 = (void *)v74;

LABEL_17:
        goto LABEL_29;
      case 2:
        objc_msgSend(v25, "setPath:", CFSTR("/v1/storefronts"));
        v96[0] = v87;
        v96[1] = v30;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v96, 2);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setQueryItems:", v36);
        goto LABEL_29;
      case 3:
        v77 = v30;
        v43 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v5, "request");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "providerIdentifier");
        v45 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v45)
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The [[strongSelf request] providerIdentifier] parameter must not be nil."));
        objc_msgSend(v5, "request");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "providerIdentifier");
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v43, "stringWithFormat:", CFSTR("/v1/catalog/%@/tv-providers/%@/channel-apps"), v92, v47);
        v90 = v5;
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v25, "setPath:", v36);
        objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("redef[multiple-system-operators]"), CFSTR("tv-providers"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("extend"), CFSTR("externalVersionId"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "queryItems");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v95[0] = v48;
        v95[1] = v49;
        v51 = (void *)MEMORY[0x1E0C99D20];
        v52 = v95;
        goto LABEL_25;
      case 4:
        v77 = v30;
        v53 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v5, "request");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "providerIdentifier");
        v55 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v55)
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The [[strongSelf request] providerIdentifier] parameter must not be nil."));
        objc_msgSend(v5, "request");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "providerIdentifier");
        v57 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v53, "stringWithFormat:", CFSTR("/v1/catalog/%@/tv-providers/%@/subscription-apps"), v92, v57);
        v90 = v5;
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v25, "setPath:", v36);
        objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("redef[multiple-system-operators]"), CFSTR("tv-providers"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("extend"), CFSTR("externalVersionId"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "queryItems");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v94[0] = v48;
        v94[1] = v49;
        v51 = (void *)MEMORY[0x1E0C99D20];
        v52 = v94;
LABEL_25:
        objc_msgSend(v51, "arrayWithObjects:count:", v52, 2);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "arrayByAddingObjectsFromArray:", v58);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setQueryItems:", v59);

        v5 = v90;
        v30 = v77;
        goto LABEL_29;
      case 5:
        v78 = v30;
        v60 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v5, "request");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "providerIdentifier");
        v62 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v62)
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The [[strongSelf request] providerIdentifier] parameter must not be nil."));
        objc_msgSend(v5, "request");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "providerIdentifier");
        v64 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v60, "stringWithFormat:", CFSTR("/v1/catalog/%@/tv-providers/%@"), v92, v64);
        v91 = v5;
        v75 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v25, "setPath:", v75);
        objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("redef[multiple-system-operators]"), CFSTR("tv-providers"));
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("extend"), CFSTR("externalVersionId"));
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("include"), CFSTR("apps,channel-apps,subscription-apps"));
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "queryItems");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v93[0] = v65;
        v93[1] = v66;
        v93[2] = v67;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v93, 3);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "arrayByAddingObjectsFromArray:", v69);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setQueryItems:", v70);

        v5 = v91;
        v36 = (void *)v75;
        v30 = v78;
LABEL_29:

        break;
      default:
        break;
    }
    objc_msgSend(v25, "URL");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(v1 + 32) + 16))();

    v3 = v85;
    v4 = v86;
    v8 = v83;
    v11 = v84;
    v7 = v79;
  }
  else
  {
    if (v11)
    {
      v37 = v11;
    }
    else
    {
      VSPrivateErrorWithRecoverySuggestion(-25, 0, 0);
      v37 = (id)objc_claimAutoreleasedReturnValue();
    }
    v38 = v37;
    (*(void (**)(void))(*(_QWORD *)(v1 + 32) + 16))();

  }
}

- (VSAMSRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (VSOptional)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_storeStrong((id *)&self->_result, a3);
}

- (NSOperationQueue)privateQueue
{
  return self->_privateQueue;
}

- (void)setPrivateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_privateQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateQueue, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

void __42__VSAMSRequestOperation_executionDidBegin__block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1D2419000, a2, a3, "AMS signing request %@ did not return a request or error.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void __42__VSAMSRequestOperation_executionDidBegin__block_invoke_2_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D2419000, v0, v1, "Error signing AMS request %@, returned error: %@");
  OUTLINED_FUNCTION_3();
}

void __42__VSAMSRequestOperation_executionDidBegin__block_invoke_15_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1D2419000, a2, a3, "AMS Request %@ did not return a result or error.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void __42__VSAMSRequestOperation_executionDidBegin__block_invoke_15_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D2419000, v0, v1, "AMS request %@ returned error: %@");
  OUTLINED_FUNCTION_3();
}

@end

@implementation AMSUIMessageGroup

- (void)setClientMetricsOverlay:(id)a3
{
  objc_storeStrong((id *)&self->_clientMetricsOverlay, a3);
}

- (AMSUIMessageGroup)init
{
  AMSUIMessageGroup *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  AMSBagProtocol *bag;
  NSDictionary *clientData;
  NSDictionary *v9;
  NSDictionary *clientMetricsOverlay;
  objc_super v12;
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v12.receiver = self;
  v12.super_class = (Class)AMSUIMessageGroup;
  v2 = -[IAMMessageGroup initWithGroupIdentifier:](&v12, sel_initWithGroupIdentifier_, CFSTR("com.apple.ams"));
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "OSLogObject");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v14 = v5;
      _os_log_impl(&dword_211102000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Incorrect initializer used. This will fetch a bag", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BE08050], "bagForProfile:profileVersion:", CFSTR("AppStore"), CFSTR("1"));
    v6 = objc_claimAutoreleasedReturnValue();
    bag = v2->_bag;
    v2->_bag = (AMSBagProtocol *)v6;

    clientData = v2->_clientData;
    v9 = (NSDictionary *)MEMORY[0x24BDBD1B8];
    v2->_clientData = (NSDictionary *)MEMORY[0x24BDBD1B8];

    clientMetricsOverlay = v2->_clientMetricsOverlay;
    v2->_clientMetricsOverlay = v9;

  }
  return v2;
}

- (AMSUIMessageGroup)initWithBag:(id)a3
{
  id v5;
  AMSUIMessageGroup *v6;
  AMSUIMessageGroup *v7;
  NSDictionary *clientData;
  NSDictionary *v9;
  NSDictionary *clientMetricsOverlay;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AMSUIMessageGroup;
  v6 = -[IAMMessageGroup initWithGroupIdentifier:](&v12, sel_initWithGroupIdentifier_, CFSTR("com.apple.ams"));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bag, a3);
    clientData = v7->_clientData;
    v9 = (NSDictionary *)MEMORY[0x24BDBD1B8];
    v7->_clientData = (NSDictionary *)MEMORY[0x24BDBD1B8];

    clientMetricsOverlay = v7->_clientMetricsOverlay;
    v7->_clientMetricsOverlay = v9;

  }
  return v7;
}

- (void)viewControllerForModalMessagePresentation:(id)a3 completion:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  id v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  id v53;
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
  id v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  id v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  _QWORD v78[5];
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  uint8_t buf[4];
  uint64_t v85;
  __int16 v86;
  id v87;
  __int16 v88;
  void *v89;
  uint64_t v90;

  v90 = *MEMORY[0x24BDAC8D0];
  v70 = a4;
  objc_msgSend(a3, "contentPages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentParameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("url"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;

  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  v75 = (void *)v10;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("clientIdentifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;

  if (v12)
  {
    v13 = v12;
  }
  else
  {
    -[AMSUIMessageGroup clientIdentifier](self, "clientIdentifier");
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v72 = v13;

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("clientVersion"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v15 = v14;
  else
    v15 = 0;

  if (v15)
  {
    v16 = v15;
  }
  else
  {
    -[AMSUIMessageGroup clientVersion](self, "clientVersion");
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  v17 = v16;

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("placement"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v76 = v18;
  else
    v76 = 0;

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("serviceType"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v20 = v19;
  else
    v20 = 0;
  v71 = v20;

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("params"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = 0;
  -[AMSUIMessageGroup _dictionaryForParamObject:error:](self, "_dictionaryForParamObject:error:", v21, &v83);
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = v83;

  v74 = v23;
  if (v23)
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
      v26 = objc_opt_class();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("params"));
      v27 = v22;
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v85 = v26;
      v86 = 2114;
      v87 = v74;
      v88 = 2112;
      v89 = v28;
      _os_log_impl(&dword_211102000, v25, OS_LOG_TYPE_ERROR, "%{public}@: Error deserializing MI params data. %{public}@ %@", buf, 0x20u);

      v22 = v27;
    }

  }
  v69 = v9;
  v66 = (void *)v22;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("sidepack"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = 0;
  -[AMSUIMessageGroup _dictionaryForParamObject:error:](self, "_dictionaryForParamObject:error:", v29, &v82);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v82;

  v73 = v31;
  if (v31)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v32)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v32, "OSLogObject");
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      v34 = objc_opt_class();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("sidepack"));
      v35 = v30;
      v36 = v17;
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v85 = v34;
      v86 = 2114;
      v87 = v73;
      v88 = 2112;
      v89 = v37;
      _os_log_impl(&dword_211102000, v33, OS_LOG_TYPE_ERROR, "%{public}@: Error deserializing sidepack data. %{public}@ %@", buf, 0x20u);

      v17 = v36;
      v30 = v35;
    }

  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("metrics"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = 0;
  -[AMSUIMessageGroup _dictionaryForParamObject:error:](self, "_dictionaryForParamObject:error:", v38, &v81);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v81;

  if (v40)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v41)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v41, "OSLogObject");
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      v43 = v39;
      v44 = v30;
      v45 = v17;
      v46 = objc_opt_class();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("metrics"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v85 = v46;
      v17 = v45;
      v30 = v44;
      v39 = v43;
      v86 = 2114;
      v87 = v40;
      v88 = 2112;
      v89 = v47;
      _os_log_impl(&dword_211102000, v42, OS_LOG_TYPE_ERROR, "%{public}@: Error deserializing metrics overlay. %{public}@ %@", buf, 0x20u);

    }
  }
  -[AMSUIMessageGroup clientMetricsOverlay](self, "clientMetricsOverlay");
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  if (v48)
  {
    if (v39)
      v49 = v39;
    else
      v49 = (void *)MEMORY[0x24BDBD1B8];
    -[AMSUIMessageGroup clientMetricsOverlay](self, "clientMetricsOverlay");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "ams_dictionaryByAddingEntriesFromDictionary:", v50);
    v51 = objc_claimAutoreleasedReturnValue();

    v39 = (void *)v51;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("account"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v53 = v52;
  else
    v53 = 0;
  v54 = v71;

  if (objc_msgSend(v53, "isEqualToString:", CFSTR("activeiTunes")))
  {
    objc_msgSend(MEMORY[0x24BDB4398], "ams_sharedAccountStore");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "ams_activeiTunesAccount");
    v56 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v56 = 0;
  }
  v57 = v72;
  v67 = v53;
  v68 = v40;
  if (v71 && v76 && v72 && v17)
  {
    v58 = v66;
    -[AMSUIMessageGroup _viewControllerForServiceType:placement:clientIdentifier:clientVersion:params:account:sidepack:metrics:](self, "_viewControllerForServiceType:placement:clientIdentifier:clientVersion:params:account:sidepack:metrics:", v71, v76, v72, v17, v66, v56, v30, v39);
    v59 = v17;
    v60 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v59 = v17;
    if (v75)
    {
      -[AMSUIMessageGroup _viewControllerForURL:account:sidepack:metrics:](self, "_viewControllerForURL:account:sidepack:metrics:", v75, v56, v30, v39);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v61 = (void *)MEMORY[0x24BE08340];
      AMSError();
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = v61;
      v57 = v72;
      objc_msgSend(v63, "promiseWithError:", v62);
      v60 = (void *)objc_claimAutoreleasedReturnValue();

      v54 = v71;
    }
    v58 = v66;
  }
  v78[0] = MEMORY[0x24BDAC760];
  v78[1] = 3221225472;
  v78[2] = __74__AMSUIMessageGroup_viewControllerForModalMessagePresentation_completion___block_invoke;
  v78[3] = &unk_24CB50080;
  v78[4] = self;
  v79 = v7;
  v80 = v70;
  v64 = v70;
  v65 = v7;
  objc_msgSend(v60, "addFinishBlock:", v78);

}

void __74__AMSUIMessageGroup_viewControllerForModalMessagePresentation_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[2] = __74__AMSUIMessageGroup_viewControllerForModalMessagePresentation_completion___block_invoke_2;
  block[3] = &unk_24CB50058;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v13 = v5;
  v14 = v7;
  block[1] = 3221225472;
  v12 = v6;
  v15 = v8;
  v16 = *(id *)(a1 + 48);
  v9 = v5;
  v10 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __74__AMSUIMessageGroup_viewControllerForModalMessagePresentation_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 32) || !*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfigOversize");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v2)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v2, "OSLogObject");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = objc_opt_class();
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(a1 + 56);
      v9 = 138543874;
      v10 = v4;
      v11 = 2114;
      v12 = v5;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_211102000, v3, OS_LOG_TYPE_ERROR, "%{public}@: Failed to load view controller. %{public}@ \nparams: %@", (uint8_t *)&v9, 0x20u);
    }
  }
  else
  {
    if (objc_msgSend(MEMORY[0x24BE08118], "deviceIsiPad"))
      v7 = 2;
    else
      v7 = -2;
    objc_msgSend(*(id *)(a1 + 40), "setModalPresentationStyle:", v7);
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v2)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v2, "OSLogObject");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138543362;
      v10 = objc_opt_class();
      _os_log_impl(&dword_211102000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Successfully loaded view controller", (uint8_t *)&v9, 0xCu);
    }
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

- (void)webViewController:(id)a3 didFinishPurchaseWithResult:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  -[AMSUIMessageGroup delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if ((v10 & 1) != 0)
  {
    if (!v11)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v12, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_opt_class();
      AMSLogKey();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v14;
      v21 = 2114;
      v22 = v15;
      _os_log_impl(&dword_211102000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Sending web purchase completion", (uint8_t *)&v19, 0x16u);

    }
    -[AMSUIMessageGroup delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "messageGroup:didFinishPurchaseWithResult:error:", self, v7, v8);
  }
  else
  {
    if (!v11)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v12, "OSLogObject");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_opt_class();
      AMSLogKey();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v17;
      v21 = 2114;
      v22 = v18;
      _os_log_impl(&dword_211102000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Skipping web purchase completion callback", (uint8_t *)&v19, 0x16u);

    }
  }

}

- (void)dynamicViewController:(id)a3 didFinishPurchaseWithResult:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  -[AMSUIMessageGroup delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if ((v10 & 1) != 0)
  {
    if (!v11)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v12, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_opt_class();
      AMSLogKey();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v14;
      v21 = 2114;
      v22 = v15;
      _os_log_impl(&dword_211102000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Sending dynamic purchase completion", (uint8_t *)&v19, 0x16u);

    }
    -[AMSUIMessageGroup delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "messageGroup:didFinishPurchaseWithResult:error:", self, v7, v8);
  }
  else
  {
    if (!v11)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v12, "OSLogObject");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_opt_class();
      AMSLogKey();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v17;
      v21 = 2114;
      v22 = v18;
      _os_log_impl(&dword_211102000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Skipping dynamic purchase completion callback", (uint8_t *)&v19, 0x16u);

    }
  }

}

- (void)dynamicViewController:(id)a3 didFinishCarrierLinkingWithResult:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  -[AMSUIMessageGroup delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if ((v10 & 1) != 0)
  {
    if (!v11)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v12, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_opt_class();
      AMSLogKey();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v14;
      v21 = 2114;
      v22 = v15;
      _os_log_impl(&dword_211102000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Sending dynamic carrier linking completion", (uint8_t *)&v19, 0x16u);

    }
    -[AMSUIMessageGroup delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "messageGroup:didFinishCarrierLinkingWithResult:error:", self, v7, v8);
  }
  else
  {
    if (!v11)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v12, "OSLogObject");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_opt_class();
      AMSLogKey();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v17;
      v21 = 2114;
      v22 = v18;
      _os_log_impl(&dword_211102000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Skipping dynamic carrier linking completion callback", (uint8_t *)&v19, 0x16u);

    }
  }

}

- (id)_dictionaryForParamObject:(id)a3 error:(id *)a4
{
  id v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v11;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = (unint64_t)v5;
  else
    v6 = 0;

  if (v6)
  {
    v7 = 0;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "dataUsingEncoding:", 4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v11 = 0;
        objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v8, 0, &v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = (uint64_t)v11;
        objc_opt_class();
        v6 = 0;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v6 = v9;

      }
      else
      {
        v6 = 0;
        v7 = 0;
      }

    }
    else
    {
      v6 = 0;
      v7 = 0;
    }
    if (!(v6 | v7))
    {
      AMSError();
      v7 = objc_claimAutoreleasedReturnValue();
      v6 = 0;
    }
  }
  if (a4)
    *a4 = objc_retainAutorelease((id)v7);

  return (id)v6;
}

- (id)_viewControllerForServiceType:(id)a3 placement:(id)a4 clientIdentifier:(id)a5 clientVersion:(id)a6 params:(id)a7 account:(id)a8 sidepack:(id)a9 metrics:(id)a10
{
  id v16;
  objc_class *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  id v32;
  id v33;
  _QWORD v34[5];
  id v35;
  id v36;
  id v37;

  v16 = a8;
  v33 = a9;
  v32 = a10;
  v17 = (objc_class *)MEMORY[0x24BE08208];
  v18 = a7;
  v19 = a6;
  v20 = a5;
  v21 = a4;
  v22 = a3;
  v23 = [v17 alloc];
  -[AMSUIMessageGroup bag](self, "bag");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v23, "initWithBag:clientIdentifier:clientVersion:placement:serviceType:", v24, v20, v19, v21, v22);

  objc_msgSend(v25, "setAccount:", v16);
  objc_msgSend(v25, "setContextInfo:", v18);

  objc_msgSend(v25, "perform");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = __124__AMSUIMessageGroup__viewControllerForServiceType_placement_clientIdentifier_clientVersion_params_account_sidepack_metrics___block_invoke;
  v34[3] = &unk_24CB500D0;
  v34[4] = self;
  v35 = v16;
  v36 = v33;
  v37 = v32;
  v27 = v32;
  v28 = v33;
  v29 = v16;
  objc_msgSend(v26, "thenWithBlock:", v34);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

id __124__AMSUIMessageGroup__viewControllerForServiceType_placement_clientIdentifier_clientVersion_params_account_sidepack_metrics___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x24BE08340]);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __124__AMSUIMessageGroup__viewControllerForServiceType_placement_clientIdentifier_clientVersion_params_account_sidepack_metrics___block_invoke_2;
  v12[3] = &unk_24CB500A8;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v13 = v3;
  v14 = v5;
  v15 = v6;
  v16 = *(id *)(a1 + 48);
  v17 = *(id *)(a1 + 56);
  v7 = v4;
  v18 = v7;
  v8 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v12);
  v9 = v18;
  v10 = v7;

  return v10;
}

void __124__AMSUIMessageGroup__viewControllerForServiceType_placement_clientIdentifier_clientVersion_params_account_sidepack_metrics___block_invoke_2(uint64_t a1)
{
  AMSUIMarketingItemViewController *v2;
  uint64_t v3;
  void *v4;
  AMSUIMarketingItemViewController *v5;

  v2 = [AMSUIMarketingItemViewController alloc];
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "bag");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[AMSUIMarketingItemViewController initWithMarketingItem:bag:](v2, "initWithMarketingItem:bag:", v3, v4);

  -[AMSUIDynamicViewController setAccount:](v5, "setAccount:", *(_QWORD *)(a1 + 48));
  -[AMSUIDynamicViewController setClientOptions:](v5, "setClientOptions:", *(_QWORD *)(a1 + 56));
  -[AMSUIDynamicViewController setMetricsOverlay:](v5, "setMetricsOverlay:", *(_QWORD *)(a1 + 64));
  -[AMSUIDynamicViewController setDelegate:](v5, "setDelegate:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 72), "finishWithResult:", v5);

}

- (id)_viewControllerForURL:(id)a3 account:(id)a4 sidepack:(id)a5 metrics:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  id v28;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_alloc(MEMORY[0x24BE083E8]);
  -[AMSUIMessageGroup bag](self, "bag");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithBag:", v15);

  objc_msgSend(v16, "typeForURL:", v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __68__AMSUIMessageGroup__viewControllerForURL_account_sidepack_metrics___block_invoke;
  v24[3] = &unk_24CB50120;
  v24[4] = self;
  v25 = v11;
  v26 = v12;
  v27 = v13;
  v28 = v10;
  v18 = v10;
  v19 = v13;
  v20 = v12;
  v21 = v11;
  objc_msgSend(v17, "thenWithBlock:", v24);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

id __68__AMSUIMessageGroup__viewControllerForURL_account_sidepack_metrics___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD block[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;

  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x24BE08340]);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__AMSUIMessageGroup__viewControllerForURL_account_sidepack_metrics___block_invoke_2;
  block[3] = &unk_24CB500F8;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v13 = v3;
  v14 = v5;
  v15 = v6;
  v16 = *(id *)(a1 + 48);
  v17 = *(id *)(a1 + 56);
  v18 = *(id *)(a1 + 64);
  v7 = v4;
  v19 = v7;
  v8 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  v9 = v19;
  v10 = v7;

  return v10;
}

void __68__AMSUIMessageGroup__viewControllerForURL_account_sidepack_metrics___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  AMSUIWebViewController *v3;
  void *v4;
  AMSUIDynamicViewController *v5;
  id v6;
  AMSUIDynamicViewController *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "integerValue");
  if (v2 == 2)
  {
    v7 = [AMSUIDynamicViewController alloc];
    objc_msgSend(*(id *)(a1 + 40), "bag");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[AMSUIDynamicViewController initWithBag:URL:](v7, "initWithBag:URL:", v8, *(_QWORD *)(a1 + 72));

    -[AMSUIDynamicViewController setAccount:](v5, "setAccount:", *(_QWORD *)(a1 + 48));
    -[AMSUIDynamicViewController setClientOptions:](v5, "setClientOptions:", *(_QWORD *)(a1 + 56));
    -[AMSUIDynamicViewController setDelegate:](v5, "setDelegate:", *(_QWORD *)(a1 + 40));
    -[AMSUIDynamicViewController setMetricsOverlay:](v5, "setMetricsOverlay:", *(_QWORD *)(a1 + 64));
    if (!v5)
      goto LABEL_12;
  }
  else
  {
    if (v2)
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
        v12 = *(_QWORD *)(a1 + 32);
        v15 = 138543618;
        v16 = v11;
        v17 = 2112;
        v18 = v12;
        v13 = v11;
        _os_log_impl(&dword_211102000, v10, OS_LOG_TYPE_ERROR, "%{public}@: Unsupported URL type: %@", (uint8_t *)&v15, 0x16u);

      }
      goto LABEL_12;
    }
    v3 = [AMSUIWebViewController alloc];
    objc_msgSend(*(id *)(a1 + 40), "bag");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[AMSUIWebViewController initWithBag:account:clientInfo:](v3, "initWithBag:account:clientInfo:", v4, *(_QWORD *)(a1 + 48), 0);

    -[AMSUIDynamicViewController setClientOptions:](v5, "setClientOptions:", *(_QWORD *)(a1 + 56));
    -[AMSUIDynamicViewController setMetricsOverlay:](v5, "setMetricsOverlay:", *(_QWORD *)(a1 + 64));
    -[AMSUIDynamicViewController setDelegate:](v5, "setDelegate:", *(_QWORD *)(a1 + 40));
    v6 = (id)-[AMSUIDynamicViewController loadURL:](v5, "loadURL:", *(_QWORD *)(a1 + 72));
    if (!v5)
    {
LABEL_12:
      v14 = *(void **)(a1 + 80);
      AMSError();
      v5 = (AMSUIDynamicViewController *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "finishWithError:", v5);
      goto LABEL_13;
    }
  }
  objc_msgSend(*(id *)(a1 + 80), "finishWithResult:", v5);
LABEL_13:

}

- (NSDictionary)clientData
{
  return self->_clientData;
}

- (void)setClientData:(id)a3
{
  objc_storeStrong((id *)&self->_clientData, a3);
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_clientIdentifier, a3);
}

- (NSString)clientVersion
{
  return self->_clientVersion;
}

- (void)setClientVersion:(id)a3
{
  objc_storeStrong((id *)&self->_clientVersion, a3);
}

- (AMSUIMessageGroupDelegate)delegate
{
  return (AMSUIMessageGroupDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSDictionary)clientMetricsOverlay
{
  return self->_clientMetricsOverlay;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
  objc_storeStrong((id *)&self->_bag, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_clientMetricsOverlay, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientVersion, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_clientData, 0);
}

@end

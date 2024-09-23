@implementation AMSUIPaymentSheetTask

- (void)paymentAuthorizationControllerDidFinish:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AMSUIPaymentSheetTask;
  -[AMSPaymentSheetTask paymentAuthorizationControllerDidFinish:](&v3, sel_paymentAuthorizationControllerDidFinish_, a3);
}

- (id)presentationSceneIdentifierForPaymentAuthorizationController:(id)a3
{
  id v5;
  unint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  id v65;
  NSObject *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  NSObject *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  NSObject *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  void *v90;
  void *v91;
  void *v92;
  NSObject *v93;
  void *v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  const char *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  uint64_t v104;
  void *v105;
  void *v106;
  void *v107;
  uint64_t v108;
  id v109;
  const char *aSelector;
  objc_super v111;
  id v112;
  id v113;
  uint8_t buf[4];
  void *v115;
  __int16 v116;
  uint64_t v117;
  __int16 v118;
  void *v119;
  uint64_t v120;

  v120 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = 0x24BE08000uLL;
  objc_msgSend(MEMORY[0x24BE081D8], "sharedPurchaseConfig");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "OSLogObject");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = (uint64_t)self;
    AMSLogKey();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x24BDD17C8];
    v12 = objc_opt_class();
    if (v10)
    {
      AMSLogKey();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v9 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v12, v13, v9);
    }
    else
    {
      NSStringFromSelector(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("%@: %@ "), v12, v13);
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v115 = v14;
    _os_log_impl(&dword_211102000, v8, OS_LOG_TYPE_DEBUG, "%{public}@begin", buf, 0xCu);
    if (v10)
    {

      v14 = (void *)v9;
    }

    v6 = 0x24BE08000uLL;
  }

  -[AMSPaymentSheetTask purchaseInfo](self, "purchaseInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedPurchaseConfig");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v26)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v26, "OSLogObject");
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      AMSLogKey();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)MEMORY[0x24BDD17C8];
      v30 = objc_opt_class();
      if (v28)
      {
        AMSLogKey();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v30, v31, v15);
      }
      else
      {
        NSStringFromSelector(a2);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "stringWithFormat:", CFSTR("%@: %@ "), v30, v31);
      }
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v115 = v32;
      _os_log_impl(&dword_211102000, v27, OS_LOG_TYPE_DEBUG, "%{public}@Delegate is nil", buf, 0xCu);
      if (v28)
      {

        v32 = v15;
      }

    }
    goto LABEL_47;
  }
  if ((objc_msgSend(v16, "conformsToProtocol:", &unk_254AF8758) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedPurchaseConfig");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v26)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v26, "OSLogObject");
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      AMSLogKey();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (void *)MEMORY[0x24BDD17C8];
      v35 = objc_opt_class();
      if (v33)
      {
        AMSLogKey();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v35, v36, v15);
      }
      else
      {
        NSStringFromSelector(a2);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "stringWithFormat:", CFSTR("%@: %@ "), v35, v36);
      }
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded();
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v115 = v37;
      v116 = 2114;
      v117 = (uint64_t)v57;
      _os_log_impl(&dword_211102000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@Delegate %{public}@ does not conforms to protocol AMSUIPurchaseDelegate, cannot return window.", buf, 0x16u);
      if (v33)
      {

        v37 = v15;
      }

    }
LABEL_47:
    v58 = 0;
    goto LABEL_48;
  }
  v109 = v5;
  aSelector = a2;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v38 = objc_opt_respondsToSelector();
    objc_msgSend(MEMORY[0x24BE081D8], "sharedPurchaseConfig");
    v39 = objc_claimAutoreleasedReturnValue();
    v40 = (void *)v39;
    if ((v38 & 1) == 0)
    {
      if (!v39)
      {
        objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v40, "OSLogObject");
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        AMSLogKey();
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = (void *)MEMORY[0x24BDD17C8];
        v52 = objc_opt_class();
        if (v50)
        {
          AMSLogKey();
          v53 = objc_claimAutoreleasedReturnValue();
          v54 = a2;
          v55 = (void *)v53;
          NSStringFromSelector(v54);
          v38 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v52, v55, v38);
        }
        else
        {
          NSStringFromSelector(a2);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "stringWithFormat:", CFSTR("%@: %@ "), v52, v55);
        }
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(sel_purchase_handleSceneIdentifierRequest_completion_);
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v115 = v56;
        v116 = 2114;
        v117 = (uint64_t)v84;
        _os_log_impl(&dword_211102000, v49, OS_LOG_TYPE_DEFAULT, "%{public}@Delegate does not implement %{public}@, cannot return window.", buf, 0x16u);
        if (v50)
        {

          v56 = (void *)v38;
        }

        v5 = v109;
        a2 = aSelector;
        v6 = 0x24BE08000;
      }

      goto LABEL_86;
    }
    if (!v39)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v40, "OSLogObject");
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
    {
      AMSLogKey();
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = (void *)MEMORY[0x24BDD17C8];
      v44 = objc_opt_class();
      if (v42)
      {
        AMSLogKey();
        v45 = objc_claimAutoreleasedReturnValue();
        v46 = a2;
        v47 = (void *)v45;
        NSStringFromSelector(v46);
        v108 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v44, v47, v108);
      }
      else
      {
        NSStringFromSelector(a2);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "stringWithFormat:", CFSTR("%@: %@ "), v44, v47);
      }
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded();
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel_purchase_handleSceneIdentifierRequest_completion_);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v115 = v48;
      v116 = 2114;
      v117 = (uint64_t)v73;
      v118 = 2114;
      v119 = v74;
      _os_log_impl(&dword_211102000, v41, OS_LOG_TYPE_DEBUG, "%{public}@Calling into delegate: %{public}@, selector: %{public}@", buf, 0x20u);
      if (v42)
      {

        v48 = (void *)v108;
      }

      v5 = v109;
      a2 = aSelector;
    }

    v64 = objc_alloc_init(MEMORY[0x24BE08340]);
    -[AMSPaymentSheetTask purchaseInfo](self, "purchaseInfo");
    v38 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v38, "purchase");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSUISceneIdentifierRequest sceneIdentifierRequest](AMSUISceneIdentifierRequest, "sceneIdentifierRequest");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "completionHandlerAdapter");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "purchase:handleSceneIdentifierRequest:completion:", v75, v76, v77);

    v112 = 0;
    objc_msgSend(v64, "resultWithError:", &v112);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = v112;
    v6 = 0x24BE08000uLL;
    if (!v65)
      goto LABEL_84;
    objc_msgSend(MEMORY[0x24BE081D8], "sharedPurchaseConfig");
    v66 = objc_claimAutoreleasedReturnValue();
    if (!v66)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v66 = objc_claimAutoreleasedReturnValue();
    }
    -[NSObject OSLogObject](v66, "OSLogObject");
    v78 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
    {
      AMSLogKey();
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = (void *)MEMORY[0x24BDD17C8];
      v81 = objc_opt_class();
      v82 = v81;
      if (v79)
      {
        AMSLogKey();
        v108 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "stringWithFormat:", CFSTR("%@: [%@] "), v82, v108);
      }
      else
      {
        objc_msgSend(v80, "stringWithFormat:", CFSTR("%@: "), v81);
      }
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError();
      v38 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v115 = v83;
      v116 = 2114;
      v117 = v38;
      _os_log_impl(&dword_211102000, v78, OS_LOG_TYPE_ERROR, "%{public}@Scene identifier request failed with error: %{public}@", buf, 0x16u);
      if (v79)
      {

        v83 = (void *)v108;
      }

      v5 = v109;
      v6 = 0x24BE08000uLL;
    }

    a2 = aSelector;
LABEL_83:

LABEL_84:
    goto LABEL_85;
  }
  objc_msgSend(MEMORY[0x24BE081D8], "sharedPurchaseConfig");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v17, "OSLogObject");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    AMSLogKey();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x24BDD17C8];
    v21 = objc_opt_class();
    if (v19)
    {
      AMSLogKey();
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = a2;
      v24 = (void *)v22;
      NSStringFromSelector(v23);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v21, v24, v15);
    }
    else
    {
      NSStringFromSelector(a2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringWithFormat:", CFSTR("%@: %@ "), v21, v24);
    }
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded();
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_purchase_handleSceneIdentifierRequest_error_);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v115 = v25;
    v116 = 2114;
    v117 = (uint64_t)v60;
    v118 = 2114;
    v119 = v61;
    _os_log_impl(&dword_211102000, v18, OS_LOG_TYPE_DEBUG, "%{public}@Calling into delegate: %{public}@, selector: %{public}@", buf, 0x20u);
    if (v19)
    {

      v25 = v15;
    }

    v5 = v109;
    a2 = aSelector;
  }

  -[AMSPaymentSheetTask purchaseInfo](self, "purchaseInfo");
  v38 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v38, "purchase");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSUISceneIdentifierRequest sceneIdentifierRequest](AMSUISceneIdentifierRequest, "sceneIdentifierRequest");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v113 = 0;
  objc_msgSend(v16, "purchase:handleSceneIdentifierRequest:error:", v62, v63, &v113);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = v113;

  v6 = 0x24BE08000uLL;
  if (v64)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedPurchaseConfig");
    v65 = (id)objc_claimAutoreleasedReturnValue();
    if (!v65)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v65 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v65, "OSLogObject");
    v66 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
    {
      AMSLogKey();
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = (void *)MEMORY[0x24BDD17C8];
      v69 = objc_opt_class();
      v70 = v69;
      if (v67)
      {
        AMSLogKey();
        v38 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "stringWithFormat:", CFSTR("%@: [%@] "), v70, v38);
      }
      else
      {
        objc_msgSend(v68, "stringWithFormat:", CFSTR("%@: "), v69);
      }
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError();
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v115 = v71;
      v116 = 2114;
      v117 = (uint64_t)v72;
      _os_log_impl(&dword_211102000, v66, OS_LOG_TYPE_ERROR, "%{public}@Sync scene identifier request failed with error: %{public}@", buf, 0x16u);
      if (v67)
      {

        v71 = (void *)v38;
      }

      v5 = v109;
      a2 = aSelector;
      v6 = 0x24BE08000;
    }
    goto LABEL_83;
  }
LABEL_85:

  if (!v58)
  {
LABEL_86:
    objc_msgSend(*(id *)(v6 + 472), "sharedPurchaseConfig");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v85)
    {
      objc_msgSend(*(id *)(v6 + 472), "sharedConfig");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v85, "OSLogObject");
    v86 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_DEBUG))
    {
      AMSLogKey();
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = (void *)MEMORY[0x24BDD17C8];
      v89 = objc_opt_class();
      if (v87)
      {
        AMSLogKey();
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v38 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v89, v90, v38);
      }
      else
      {
        NSStringFromSelector(aSelector);
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "stringWithFormat:", CFSTR("%@: %@ "), v89, v90);
      }
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v115 = v91;
      _os_log_impl(&dword_211102000, v86, OS_LOG_TYPE_DEBUG, "%{public}@Falling back to superclass", buf, 0xCu);
      if (v87)
      {

        v91 = (void *)v38;
      }

      a2 = aSelector;
      v6 = 0x24BE08000uLL;
    }

    v111.receiver = self;
    v111.super_class = (Class)AMSUIPaymentSheetTask;
    -[AMSPaymentSheetTask presentationSceneIdentifierForPaymentAuthorizationController:](&v111, sel_presentationSceneIdentifierForPaymentAuthorizationController_, v5);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v6 + 472), "sharedPurchaseConfig");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v92)
    {
      objc_msgSend(*(id *)(v6 + 472), "sharedConfig");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v92, "OSLogObject");
    v93 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v93, OS_LOG_TYPE_DEBUG))
    {
      AMSLogKey();
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      v95 = (void *)MEMORY[0x24BDD17C8];
      v96 = objc_opt_class();
      if (v94)
      {
        AMSLogKey();
        v97 = objc_claimAutoreleasedReturnValue();
        v98 = a2;
        v99 = (void *)v97;
        NSStringFromSelector(v98);
        v38 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v95, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v96, v99, v38);
      }
      else
      {
        NSStringFromSelector(a2);
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v95, "stringWithFormat:", CFSTR("%@: %@ "), v96, v99);
      }
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded();
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v115 = v100;
      v116 = 2114;
      v117 = (uint64_t)v101;
      _os_log_impl(&dword_211102000, v93, OS_LOG_TYPE_DEBUG, "%{public}@Superclass returned scene identifier %{public}@", buf, 0x16u);
      if (v94)
      {

        v100 = (void *)v38;
      }

      v5 = v109;
      v6 = 0x24BE08000uLL;
    }

  }
  objc_msgSend(*(id *)(v6 + 472), "sharedPurchaseConfig");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v26)
  {
    objc_msgSend(*(id *)(v6 + 472), "sharedConfig");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v26, "OSLogObject");
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    AMSLogKey();
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    v103 = (void *)MEMORY[0x24BDD17C8];
    v104 = objc_opt_class();
    if (v102)
    {
      AMSLogKey();
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(aSelector);
      v38 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v104, v105, v38);
    }
    else
    {
      NSStringFromSelector(aSelector);
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "stringWithFormat:", CFSTR("%@: %@ "), v104, v105);
    }
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded();
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v115 = v106;
    v116 = 2114;
    v117 = (uint64_t)v107;
    _os_log_impl(&dword_211102000, v27, OS_LOG_TYPE_DEBUG, "%{public}@ returning scene identifier %{public}@", buf, 0x16u);
    if (v102)
    {

      v106 = (void *)v38;
    }

  }
LABEL_48:

  return v58;
}

- (id)presentationSceneBundleIdentifierForPaymentAuthorizationController:(id)a3
{
  uint64_t v3;
  void *v4;
  id v6;
  unint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  id v62;
  id v63;
  objc_super v65;
  id v66;
  uint8_t buf[4];
  void *v68;
  __int16 v69;
  void *v70;
  __int16 v71;
  void *v72;
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = 0x24BE08000uLL;
  objc_msgSend(MEMORY[0x24BE081D8], "sharedPurchaseConfig");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v8, "OSLogObject");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    AMSLogKey();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x24BDD17C8];
    v12 = objc_opt_class();
    if (v10)
    {
      AMSLogKey();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v3 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v12, v13, v3);
    }
    else
    {
      NSStringFromSelector(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("%@: %@ "), v12, v13);
    }
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v68 = v4;
    _os_log_impl(&dword_211102000, v9, OS_LOG_TYPE_DEBUG, "%{public}@begin", buf, 0xCu);
    if (v10)
    {

      v4 = (void *)v3;
    }

  }
  -[AMSPaymentSheetTask purchaseInfo](self, "purchaseInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v15, "conformsToProtocol:", &unk_254AF8758)
    || (objc_opt_respondsToSelector() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedPurchaseConfig");
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)v23;
    if (v15)
    {
      if (!v23)
      {
        objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v24, "OSLogObject");
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        v62 = v6;
        AMSLogKey();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (void *)MEMORY[0x24BDD17C8];
        v28 = objc_opt_class();
        if (v26)
        {
          AMSLogKey();
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v61 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v28, v29, v61);
        }
        else
        {
          NSStringFromSelector(a2);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "stringWithFormat:", CFSTR("%@: %@ "), v28, v29);
        }
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(sel_purchase_handleSceneBundleIdentifierRequest_completion_);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded();
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v68 = v30;
        v69 = 2114;
        v70 = v36;
        v71 = 2114;
        v72 = v37;
        _os_log_impl(&dword_211102000, v25, OS_LOG_TYPE_DEBUG, "%{public}@Delegate does not implement %{public}@. delegate: %{public}@", buf, 0x20u);

        if (v26)
        {

          v30 = (void *)v61;
        }

        v6 = v62;
        v7 = 0x24BE08000;
      }
    }
    else
    {
      if (!v23)
      {
        objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v24, "OSLogObject");
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        AMSLogKey();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = (void *)MEMORY[0x24BDD17C8];
        v33 = objc_opt_class();
        if (v31)
        {
          AMSLogKey();
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v33, v34, v4);
        }
        else
        {
          NSStringFromSelector(a2);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "stringWithFormat:", CFSTR("%@: %@ "), v33, v34);
        }
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v68 = v35;
        _os_log_impl(&dword_211102000, v25, OS_LOG_TYPE_DEBUG, "%{public}@Delegate is nil", buf, 0xCu);
        v7 = 0x24BE08000uLL;
        if (v31)
        {

          v35 = v4;
        }

      }
    }

    goto LABEL_37;
  }
  objc_msgSend(MEMORY[0x24BE081D8], "sharedPurchaseConfig");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v16, "OSLogObject");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    AMSLogKey();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x24BDD17C8];
    v20 = objc_opt_class();
    if (v18)
    {
      AMSLogKey();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v20, v21, v4);
    }
    else
    {
      NSStringFromSelector(a2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringWithFormat:", CFSTR("%@: %@ "), v20, v21);
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded();
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v68 = v22;
    v69 = 2114;
    v70 = v48;
    _os_log_impl(&dword_211102000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Calling into delegate: %{public}@", buf, 0x16u);
    if (v18)
    {

      v22 = v4;
    }

    v7 = 0x24BE08000uLL;
  }

  v49 = objc_alloc_init(MEMORY[0x24BE08340]);
  -[AMSPaymentSheetTask purchaseInfo](self, "purchaseInfo");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "purchase");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSUISceneBundleIdentifierRequest bundleIdentifierRequest](AMSUISceneBundleIdentifierRequest, "bundleIdentifierRequest");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "completionHandlerAdapter");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "purchase:handleSceneBundleIdentifierRequest:completion:", v4, v51, v52);

  v66 = 0;
  objc_msgSend(v49, "resultWithError:", &v66);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v66;
  if (v53)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v54)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v54, "OSLogObject");
    v55 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
    {
      v63 = v6;
      AMSLogKey();
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = (void *)MEMORY[0x24BDD17C8];
      v58 = objc_opt_class();
      v59 = v58;
      if (v56)
      {
        AMSLogKey();
        v61 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "stringWithFormat:", CFSTR("%@: [%@] "), v59, v61);
      }
      else
      {
        objc_msgSend(v57, "stringWithFormat:", CFSTR("%@: "), v58);
      }
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v68 = v60;
      v69 = 2114;
      v70 = v4;
      _os_log_impl(&dword_211102000, v55, OS_LOG_TYPE_ERROR, "%{public}@Scene identifier request failed with error: %{public}@", buf, 0x16u);
      if (v56)
      {

        v60 = (void *)v61;
      }

      v6 = v63;
    }

    v7 = 0x24BE08000;
  }

  if (!v38)
  {
LABEL_37:
    v65.receiver = self;
    v65.super_class = (Class)AMSUIPaymentSheetTask;
    -[AMSPaymentSheetTask presentationSceneBundleIdentifierForPaymentAuthorizationController:](&v65, sel_presentationSceneBundleIdentifierForPaymentAuthorizationController_, v6);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(v7 + 472), "sharedPurchaseConfig");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v39)
  {
    objc_msgSend(*(id *)(v7 + 472), "sharedConfig");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v39, "OSLogObject");
  v40 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
  {
    AMSLogKey();
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = (void *)MEMORY[0x24BDD17C8];
    v43 = objc_opt_class();
    if (v41)
    {
      AMSLogKey();
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v43, v44, v4);
    }
    else
    {
      NSStringFromSelector(a2);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "stringWithFormat:", CFSTR("%@: %@ "), v43, v44);
    }
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded();
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v68 = v45;
    v69 = 2114;
    v70 = v46;
    _os_log_impl(&dword_211102000, v40, OS_LOG_TYPE_DEBUG, "%{public}@ returning bundle identifier %{public}@", buf, 0x16u);
    if (v41)
    {

      v45 = v4;
    }

  }
  return v38;
}

- (id)presentationWindowForPaymentAuthorizationController:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  const char *aSelector;
  const char *aSelectora;
  const char *aSelectorb;
  id v78;
  id v79;
  uint8_t buf[4];
  void *v81;
  __int16 v82;
  void *v83;
  uint64_t v84;

  v84 = *MEMORY[0x24BDAC8D0];
  v6 = 0x24BE08000uLL;
  objc_msgSend(MEMORY[0x24BE081D8], "sharedPurchaseConfig", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "OSLogObject");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    AMSLogKey();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x24BDD17C8];
    v11 = objc_opt_class();
    if (v9)
    {
      AMSLogKey();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v3 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v11, v12, v3);
    }
    else
    {
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("%@: %@ "), v11, v12);
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v81 = v13;
    _os_log_impl(&dword_211102000, v8, OS_LOG_TYPE_DEBUG, "%{public}@begin", buf, 0xCu);
    if (v9)
    {

      v13 = (void *)v3;
    }

  }
  -[AMSPaymentSheetTask purchaseInfo](self, "purchaseInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedPurchaseConfig");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v29)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v29, "OSLogObject");
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      AMSLogKey();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (void *)MEMORY[0x24BDD17C8];
      v33 = objc_opt_class();
      if (v31)
      {
        AMSLogKey();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v6 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v33, v34, v6);
      }
      else
      {
        NSStringFromSelector(a2);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "stringWithFormat:", CFSTR("%@: %@ "), v33, v34);
      }
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v81 = v35;
      _os_log_impl(&dword_211102000, v30, OS_LOG_TYPE_DEBUG, "%{public}@Delegate is nil", buf, 0xCu);
      if (v31)
      {

        v35 = (void *)v6;
      }

    }
    goto LABEL_49;
  }
  if ((objc_msgSend(v15, "conformsToProtocol:", &unk_254AF8758) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedPurchaseConfig");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v29)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v29, "OSLogObject");
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      AMSLogKey();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = (void *)MEMORY[0x24BDD17C8];
      v38 = objc_opt_class();
      if (v36)
      {
        AMSLogKey();
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v6 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v38, v39, v6);
      }
      else
      {
        NSStringFromSelector(a2);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "stringWithFormat:", CFSTR("%@: %@ "), v38, v39);
      }
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded();
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v81 = v40;
      v82 = 2114;
      v83 = v55;
      _os_log_impl(&dword_211102000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@Delegate %{public}@ does not conforms to protocol AMSUIPurchaseDelegate, cannot return window.", buf, 0x16u);
      if (v36)
      {

        v40 = (void *)v6;
      }

    }
LABEL_49:
    v19 = 0;
    goto LABEL_50;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedPurchaseConfig");
      v20 = (id)objc_claimAutoreleasedReturnValue();
      if (!v20)
      {
        objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
        v20 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v20, "OSLogObject");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        aSelectorb = a2;
        AMSLogKey();
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = (void *)MEMORY[0x24BDD17C8];
        v52 = objc_opt_class();
        if (v50)
        {
          AMSLogKey();
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(aSelectorb);
          v72 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v52, v53, v72);
        }
        else
        {
          NSStringFromSelector(aSelectorb);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "stringWithFormat:", CFSTR("%@: %@ "), v52, v53);
        }
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(sel_purchase_handleWindowRequest_completion_);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v81 = v54;
        v82 = 2114;
        v83 = v58;
        _os_log_impl(&dword_211102000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Delegate does not implement %{public}@, cannot return window.", buf, 0x16u);
        if (v50)
        {

          v54 = (void *)v72;
        }

        v19 = 0;
        a2 = aSelectorb;
      }
      else
      {
        v19 = 0;
      }
      goto LABEL_66;
    }
    v20 = objc_alloc_init(MEMORY[0x24BE08340]);
    -[AMSPaymentSheetTask purchaseInfo](self, "purchaseInfo");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "purchase");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSUIWindowRequest windowRequest](AMSUIWindowRequest, "windowRequest");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "completionHandlerAdapter");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "purchase:handleWindowRequest:completion:", v42, v43, v44);

    v78 = 0;
    objc_msgSend(v20, "resultWithError:", &v78);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v78;
    if (!v21)
    {
LABEL_66:

      goto LABEL_67;
    }
    objc_msgSend(MEMORY[0x24BE081D8], "sharedPurchaseConfig");
    v22 = objc_claimAutoreleasedReturnValue();
    if (!v22)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v22 = objc_claimAutoreleasedReturnValue();
    }
    -[NSObject OSLogObject](v22, "OSLogObject");
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      aSelectora = a2;
      AMSLogKey();
      v46 = objc_claimAutoreleasedReturnValue();
      v69 = (void *)MEMORY[0x24BDD17C8];
      v47 = objc_opt_class();
      v74 = (void *)v46;
      if (v46)
      {
        AMSLogKey();
        v48 = objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelectora);
        v67 = objc_claimAutoreleasedReturnValue();
        v71 = (void *)v48;
        objc_msgSend(v69, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v47, v48, v67);
      }
      else
      {
        NSStringFromSelector(aSelectora);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "stringWithFormat:", CFSTR("%@: %@ "), v47, v71);
      }
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError();
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v81 = v49;
      v82 = 2114;
      v83 = v59;
      _os_log_impl(&dword_211102000, v45, OS_LOG_TYPE_ERROR, "%{public}@Window request failed with error: %{public}@", buf, 0x16u);
      if (v74)
      {

        v49 = (void *)v67;
      }

      a2 = aSelectora;
    }

LABEL_65:
    goto LABEL_66;
  }
  -[AMSPaymentSheetTask purchaseInfo](self, "purchaseInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "purchase");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSUIWindowRequest windowRequest](AMSUIWindowRequest, "windowRequest");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = 0;
  objc_msgSend(v15, "purchase:handleWindowRequest:error:", v17, v18, &v79);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v79;

  if (v20)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedPurchaseConfig");
    v21 = objc_claimAutoreleasedReturnValue();
    if (!v21)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v21 = objc_claimAutoreleasedReturnValue();
    }
    -[NSObject OSLogObject](v21, "OSLogObject");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      aSelector = a2;
      AMSLogKey();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)MEMORY[0x24BDD17C8];
      v25 = objc_opt_class();
      if (v23)
      {
        AMSLogKey();
        v68 = v24;
        v26 = v23;
        v27 = objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v70 = objc_claimAutoreleasedReturnValue();
        v73 = (void *)v27;
        v66 = v27;
        v23 = v26;
        objc_msgSend(v68, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v25, v66, v70);
      }
      else
      {
        NSStringFromSelector(aSelector);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "stringWithFormat:", CFSTR("%@: %@ "), v25, v73);
      }
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError();
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v81 = v28;
      v82 = 2114;
      v83 = v57;
      _os_log_impl(&dword_211102000, v22, OS_LOG_TYPE_ERROR, "%{public}@Sync Window request failed with error: %{public}@", buf, 0x16u);
      if (v23)
      {

        v28 = (void *)v70;
      }

      a2 = aSelector;
    }
    goto LABEL_65;
  }
LABEL_67:

  objc_msgSend(MEMORY[0x24BE081D8], "sharedPurchaseConfig");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v29)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v29, "OSLogObject");
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
  {
    AMSLogKey();
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = (void *)MEMORY[0x24BDD17C8];
    v62 = objc_opt_class();
    if (v60)
    {
      AMSLogKey();
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v6 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v62, v63, v6);
    }
    else
    {
      NSStringFromSelector(a2);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "stringWithFormat:", CFSTR("%@: %@ "), v62, v63);
    }
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded();
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v81 = v64;
    v82 = 2114;
    v83 = v65;
    _os_log_impl(&dword_211102000, v30, OS_LOG_TYPE_DEBUG, "%{public}@ returning window %{public}@", buf, 0x16u);
    if (v60)
    {

      v64 = (void *)v6;
    }

  }
LABEL_50:

  return v19;
}

@end

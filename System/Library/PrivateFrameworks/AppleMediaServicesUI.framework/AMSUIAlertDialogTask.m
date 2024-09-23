@implementation AMSUIAlertDialogTask

- (AMSUIAlertDialogTask)initWithRequest:(id)a3 presentingViewController:(id)a4
{
  id v7;
  id v8;
  AMSUIAlertDialogTask *v9;
  AMSUIAlertDialogTask *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AMSUIAlertDialogTask;
  v9 = -[AMSTask init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_request, a3);
    objc_storeStrong((id *)&v10->_presentingViewController, a4);
  }

  return v10;
}

- (id)present
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];

  -[AMSUIAlertDialogTask request](self, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (id)AMSSetLogKey();
  }
  else
  {
    AMSLogKey();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)AMSSetLogKey();

  }
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __31__AMSUIAlertDialogTask_present__block_invoke;
  v9[3] = &unk_24CB4F228;
  v9[4] = self;
  -[AMSTask performTaskWithPromiseBlock:](self, "performTaskWithPromiseBlock:", v9);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __31__AMSUIAlertDialogTask_present__block_invoke(uint64_t a1)
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy_;
  v9 = __Block_byref_object_dispose_;
  v10 = objc_alloc_init(MEMORY[0x24BE08340]);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __31__AMSUIAlertDialogTask_present__block_invoke_1;
  v4[3] = &unk_24CB4F200;
  v4[4] = *(_QWORD *)(a1 + 32);
  v4[5] = &v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __31__AMSUIAlertDialogTask_present__block_invoke_1(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __31__AMSUIAlertDialogTask_present__block_invoke_2;
  v6[3] = &unk_24CB4F1D8;
  v6[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "_createIOSViewControllerFromRequest:completion:", v3, v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentViewController:animated:completion:", v4, 1, 0);

}

uint64_t __31__AMSUIAlertDialogTask_present__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "finishWithResult:error:", a2, a3);
}

- (BOOL)cancel
{
  BOOL v3;
  _QWORD block[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AMSUIAlertDialogTask;
  v3 = -[AMSTask cancel](&v6, sel_cancel);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __30__AMSUIAlertDialogTask_cancel__block_invoke;
  block[3] = &unk_24CB4F0E8;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  return v3;
}

void __30__AMSUIAlertDialogTask_cancel__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

- (id)_createIOSViewControllerFromRequest:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  id v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t i;
  uint64_t v49;
  uint64_t v51;
  id obj;
  id v53;
  void *v55;
  uint64_t v56;
  id v57;
  _QWORD v58[6];
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _QWORD v63[4];
  id v64;
  id v65;
  void *v66;
  id v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint8_t v72[128];
  uint8_t buf[4];
  void *v74;
  __int16 v75;
  void *v76;
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v53 = a4;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  v51 = objc_msgSend(v5, "style");
  v6 = (void *)MEMORY[0x24BEBD3B0];
  objc_msgSend(v5, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "message");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "alertControllerWithTitle:message:preferredStyle:", v7, v8, v51 != 2);
  v57 = (id)objc_claimAutoreleasedReturnValue();

  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v55 = v5;
  objc_msgSend(v5, "buttonActions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v68, v77, 16);
  v11 = 0x24BE08000;
  if (v10)
  {
    v12 = v10;
    obj = v9;
    v13 = 0;
    v14 = 0;
    v56 = *(_QWORD *)v69;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v69 != v56)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * v15);
        v17 = objc_msgSend(v16, "style");
        if (v17 == 2)
        {
          v18 = objc_msgSend(v55, "preventsCancelButtonStyle") ^ 1;
        }
        else if (v17 == 1)
        {
          v18 = 2;
        }
        else
        {
          v18 = 0;
        }
        objc_msgSend(v16, "title");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          v20 = (void *)MEMORY[0x24BEBD3A8];
          objc_msgSend(v16, "title");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v63[0] = MEMORY[0x24BDAC760];
          v63[1] = 3221225472;
          v63[2] = __71__AMSUIAlertDialogTask__createIOSViewControllerFromRequest_completion___block_invoke;
          v63[3] = &unk_24CB4F250;
          v22 = v57;
          v64 = v22;
          v23 = v55;
          v65 = v23;
          v66 = v16;
          v67 = v53;
          objc_msgSend(v20, "actionWithTitle:style:handler:", v21, v18, v63);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v14)
          {
            objc_msgSend(v23, "preferredButtonActionIdentifier");
            v14 = (id)objc_claimAutoreleasedReturnValue();
            if (v14)
            {
              objc_msgSend(v16, "identifier");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "preferredButtonActionIdentifier");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = objc_msgSend(v29, "isEqualToString:", v30);

              if (v31)
                v14 = v24;
              else
                v14 = 0;
            }
          }
          objc_msgSend(v22, "addAction:", v24);
          ++v13;

          v25 = v64;
        }
        else
        {
          objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v25)
          {
            objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v25, "OSLogObject");
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            v27 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138543362;
            v74 = v27;
            v28 = v27;
            _os_log_impl(&dword_211102000, v26, OS_LOG_TYPE_ERROR, "%{public}@: No action title is provided. A UIAlertAction requires a title.", buf, 0xCu);

          }
        }

        ++v15;
      }
      while (v12 != v15);
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v77, 16);
      v12 = v32;
    }
    while (v32);

    if (v14)
    {
      objc_msgSend(v57, "setPreferredAction:", v14);
      v11 = 0x24BE08000;
      if (v13)
        goto LABEL_43;
      goto LABEL_38;
    }
    v11 = 0x24BE08000uLL;
  }
  else
  {

    v13 = 0;
  }
  objc_msgSend(v55, "preferredButtonActionIdentifier");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    objc_msgSend(*(id *)(v11 + 472), "sharedConfig");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v34)
    {
      objc_msgSend(*(id *)(v11 + 472), "sharedConfig");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v34, "OSLogObject");
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
    {
      v36 = (void *)objc_opt_class();
      v37 = v36;
      objc_msgSend(v55, "preferredButtonActionIdentifier");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v74 = v36;
      v75 = 2114;
      v76 = v38;
      _os_log_impl(&dword_211102000, v35, OS_LOG_TYPE_DEBUG, "%{public}@: preferredButtonActionIdentifier provided but no action has such identifier (preferredButtonActionIdentifier: %{public}@)", buf, 0x16u);

    }
  }
  v14 = 0;
  if (!v13)
  {
LABEL_38:
    objc_msgSend(*(id *)(v11 + 472), "sharedConfig");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v39)
    {
      objc_msgSend(*(id *)(v11 + 472), "sharedConfig");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v39, "OSLogObject");
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      v41 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v74 = v41;
      v42 = v41;
      _os_log_impl(&dword_211102000, v40, OS_LOG_TYPE_ERROR, "%{public}@: Presented Alert with no actions", buf, 0xCu);

    }
  }
LABEL_43:
  if (v51 != 2)
  {
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    objc_msgSend(v55, "textFields");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
    if (v44)
    {
      v45 = v44;
      v46 = *(_QWORD *)v60;
      v47 = MEMORY[0x24BDAC760];
      do
      {
        for (i = 0; i != v45; ++i)
        {
          if (*(_QWORD *)v60 != v46)
            objc_enumerationMutation(v43);
          v49 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * i);
          v58[0] = v47;
          v58[1] = 3221225472;
          v58[2] = __71__AMSUIAlertDialogTask__createIOSViewControllerFromRequest_completion___block_invoke_13;
          v58[3] = &unk_24CB4F278;
          v58[4] = self;
          v58[5] = v49;
          objc_msgSend(v57, "addTextFieldWithConfigurationHandler:", v58);
        }
        v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
      }
      while (v45);
    }

  }
  return v57;
}

void __71__AMSUIAlertDialogTask__createIOSViewControllerFromRequest_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  unint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;

  v18 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(*(id *)(a1 + 32), "textFields");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3)
  {
    v4 = 0;
    do
    {
      objc_msgSend(*(id *)(a1 + 32), "textFields");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectAtIndexedSubscript:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 40), "textFields");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "count");

      if (v4 < v8)
      {
        objc_msgSend(v6, "text");
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = (void *)v9;
        if (v9)
          v11 = (const __CFString *)v9;
        else
          v11 = &stru_24CB5A078;
        objc_msgSend(v18, "addObject:", v11);

      }
      ++v4;
      objc_msgSend(*(id *)(a1 + 32), "textFields");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");

    }
    while (v4 < v13);
  }
  v14 = objc_alloc(MEMORY[0x24BE08138]);
  v15 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v14, "initWithOriginalRequest:selectedActionIdentifier:", v15, v16);

  objc_msgSend(v17, "setTextfieldValues:", v18);
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void __71__AMSUIAlertDialogTask__createIOSViewControllerFromRequest_completion___block_invoke_13(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(v3, "setKeyboardType:", objc_msgSend((id)objc_opt_class(), "_keyboardTypeFromType:", objc_msgSend(*(id *)(a1 + 40), "keyboardType")));
  objc_msgSend(v3, "setSecureTextEntry:", objc_msgSend(*(id *)(a1 + 40), "secure"));
  objc_msgSend(*(id *)(a1 + 40), "placeholder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPlaceholder:", v4);

  objc_msgSend(*(id *)(a1 + 40), "text");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", v5);

}

+ (int64_t)_keyboardTypeFromType:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
    return 0;
  else
    return qword_211254618[a3];
}

- (AMSDialogRequest)request
{
  return self->_request;
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end

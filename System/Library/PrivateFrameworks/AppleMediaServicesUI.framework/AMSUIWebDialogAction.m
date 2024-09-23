@implementation AMSUIWebDialogAction

- (AMSUIWebDialogAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  char v19;
  AMSDialogRequest *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v26;
  AMSUIWebButtonModel *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  id v36;
  id v37;
  void *v38;
  id v39;
  NSObject *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  id v51;
  AMSDialogRequest *request;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  AMSUIWebDialogAction *v61;
  id v62;
  id obj;
  id v64;
  AMSDialogRequest *v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  objc_super v77;
  uint8_t v78[128];
  uint8_t buf[4];
  uint64_t v80;
  __int16 v81;
  void *v82;
  __int16 v83;
  id v84;
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v77.receiver = self;
  v77.super_class = (Class)AMSUIWebDialogAction;
  v66 = a4;
  v61 = -[AMSUIWebAction initWithJSObject:context:](&v77, sel_initWithJSObject_context_, v6);
  if (v61)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("title"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("message"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;

    v59 = v6;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("buttons"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("preferredButtonIdentifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("textFields"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v60 = v15;
    else
      v60 = 0;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("style"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v17 = objc_msgSend(v16, "integerValue");
    else
      v17 = 1;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("pauseTimeouts"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = v18;
    v55 = v16;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v19 = objc_msgSend(v18, "BOOLValue", v18, v16);
    else
      v19 = 1;
    v61->_pauseTimeouts = v19;
    v57 = v10;
    v58 = v8;
    v20 = (AMSDialogRequest *)objc_msgSend(objc_alloc(MEMORY[0x24BE08130]), "initWithTitle:message:", v8, v10);
    v56 = v14;
    -[AMSDialogRequest setPreferredButtonActionIdentifier:](v20, "setPreferredButtonActionIdentifier:", v14);
    v65 = v20;
    -[AMSDialogRequest setStyle:](v20, "setStyle:", v17);
    v64 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    obj = v12;
    v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v85, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v74;
      do
      {
        v24 = 0;
        v67 = v22;
        do
        {
          if (*(_QWORD *)v74 != v23)
            objc_enumerationMutation(obj);
          v25 = *(id *)(*((_QWORD *)&v73 + 1) + 8 * v24);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v26 = v25;
          else
            v26 = 0;

          if (v26)
          {
            v27 = -[AMSUIWebButtonModel initWithJSObject:context:]([AMSUIWebButtonModel alloc], "initWithJSObject:context:", v26, v66);
            -[AMSUIWebButtonModel createDialogAction](v27, "createDialogAction");
            v28 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "addObject:", v28);
          }
          else
          {
            objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
            v27 = (AMSUIWebButtonModel *)objc_claimAutoreleasedReturnValue();
            if (!v27)
            {
              objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
              v27 = (AMSUIWebButtonModel *)objc_claimAutoreleasedReturnValue();
            }
            -[AMSUIWebButtonModel OSLogObject](v27, "OSLogObject", v54);
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              v29 = v23;
              v30 = objc_opt_class();
              -[AMSUIWebAction context](v61, "context");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "logKey");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v80 = v30;
              v81 = 2114;
              v82 = v32;
              v83 = 2114;
              v84 = v25;
              _os_log_impl(&dword_211102000, v28, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Invalid button object: %{public}@", buf, 0x20u);

              v23 = v29;
              v22 = v67;
            }
          }

          ++v24;
        }
        while (v22 != v24);
        v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v85, 16);
      }
      while (v22);
    }

    -[AMSDialogRequest setButtonActions:](v65, "setButtonActions:", v64);
    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    v62 = v60;
    v33 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v69, v78, 16);
    v6 = v59;
    if (v33)
    {
      v34 = v33;
      v68 = *(_QWORD *)v70;
      do
      {
        for (i = 0; i != v34; ++i)
        {
          if (*(_QWORD *)v70 != v68)
            objc_enumerationMutation(v62);
          v36 = *(id *)(*((_QWORD *)&v69 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v37 = v36;
          else
            v37 = 0;

          if (v37)
          {
            objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("placeholder"));
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v39 = v38;
            else
              v39 = 0;

            objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("initialText"));
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v40 = v44;
            else
              v40 = 0;

            objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("keyboardType"));
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("keyboardType"));
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              v47 = objc_msgSend(v46, "integerValue");

            }
            else
            {
              v47 = 0;
            }

            objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("tag"));
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("tag"));
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              v50 = objc_msgSend(v49, "integerValue");

            }
            else
            {
              v50 = 0;
            }

            v51 = objc_alloc_init(MEMORY[0x24BE08140]);
            objc_msgSend(v51, "setPlaceholder:", v39);
            objc_msgSend(v51, "setText:", v40);
            objc_msgSend(v51, "setKeyboardType:", v47);
            objc_msgSend(v51, "setTag:", v50);
            -[AMSDialogRequest addTextField:](v65, "addTextField:", v51);

          }
          else
          {
            objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
            v39 = (id)objc_claimAutoreleasedReturnValue();
            if (!v39)
            {
              objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
              v39 = (id)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v39, "OSLogObject", v54);
            v40 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
            {
              v41 = objc_opt_class();
              -[AMSUIWebAction context](v61, "context");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "logKey");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v80 = v41;
              v81 = 2114;
              v82 = v43;
              v83 = 2114;
              v84 = v36;
              _os_log_impl(&dword_211102000, v40, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Invalid text field object: %{public}@", buf, 0x20u);

            }
          }

        }
        v34 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v69, v78, 16);
      }
      while (v34);
    }

    request = v61->_request;
    v61->_request = v65;

  }
  return v61;
}

- (id)runAction
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[5];
  objc_super v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v17.receiver = self;
  v17.super_class = (Class)AMSUIWebDialogAction;
  v3 = -[AMSUIWebAction runAction](&v17, sel_runAction);
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_opt_class();
    AMSLogKey();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIWebDialogAction request](self, "request");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v19 = v6;
    v20 = 2114;
    v21 = v7;
    v22 = 2114;
    v23 = v8;
    _os_log_impl(&dword_211102000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Running dialog: %{public}@", buf, 0x20u);

  }
  -[AMSUIWebAction context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "actionDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[AMSUIWebDialogAction pauseTimeouts](self, "pauseTimeouts");
  -[AMSUIWebDialogAction request](self, "request");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "action:pauseTimeouts:handleDialogRequest:", self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __33__AMSUIWebDialogAction_runAction__block_invoke;
  v16[3] = &unk_24CB51010;
  v16[4] = self;
  objc_msgSend(v13, "thenWithBlock:", v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

id __33__AMSUIWebDialogAction_runAction__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  AMSUIWebButtonModel *v9;
  void *v10;
  AMSUIWebButtonModel *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  _QWORD v24[5];
  id v25;
  id v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectedActionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locateActionWithIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v6, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)MEMORY[0x24BDBD1B8];
  }
  v9 = [AMSUIWebButtonModel alloc];
  objc_msgSend(*(id *)(a1 + 32), "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[AMSUIWebButtonModel initWithJSObject:context:](v9, "initWithJSObject:context:", v8, v10);

  -[AMSUIWebButtonModel action](v11, "action");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v13, "OSLogObject");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_opt_class();
      AMSLogKey();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSUIWebButtonModel action](v11, "action");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v28 = v15;
      v29 = 2114;
      v30 = v16;
      v31 = 2114;
      v32 = v17;
      _os_log_impl(&dword_211102000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Running dialog action: %{public}@", buf, 0x20u);

    }
    -[AMSUIWebButtonModel action](v11, "action");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "runAction");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE08340], "promiseWithResult:", MEMORY[0x24BDBD1C8]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __33__AMSUIWebDialogAction_runAction__block_invoke_39;
  v24[3] = &unk_24CB50FE8;
  v24[4] = *(_QWORD *)(a1 + 32);
  v25 = v8;
  v26 = v3;
  v20 = v3;
  v21 = v8;
  objc_msgSend(v19, "continueWithBlock:", v24);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

id __33__AMSUIWebDialogAction_runAction__block_invoke_39(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "acceptedResponseVersions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", &unk_24CB8C188);

  v4 = (void *)MEMORY[0x24BE08340];
  if (v3)
  {
    v6 = *(_QWORD *)(a1 + 40);
    v5 = *(void **)(a1 + 48);
    v11[0] = CFSTR("selectedButton");
    v11[1] = CFSTR("textFieldValues");
    v12[0] = v6;
    objc_msgSend(v5, "textfieldValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "promiseWithResult:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    return v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE08340], "promiseWithResult:", *(_QWORD *)(a1 + 40));
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (AMSDialogRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (BOOL)pauseTimeouts
{
  return self->_pauseTimeouts;
}

- (void)setPauseTimeouts:(BOOL)a3
{
  self->_pauseTimeouts = a3;
}

- (NSArray)buttonModels
{
  return self->_buttonModels;
}

- (void)setButtonModels:(id)a3
{
  objc_storeStrong((id *)&self->_buttonModels, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonModels, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end

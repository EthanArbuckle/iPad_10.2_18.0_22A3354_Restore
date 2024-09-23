@implementation AMSUIWebBagAction

- (AMSUIWebBagAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6;
  AMSUIWebBagAction *v7;
  AMSUIWebBagAction *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  ACAccount *account;
  void *v13;
  NSString *v14;
  NSString *profile;
  void *v16;
  NSString *v17;
  NSString *profileVersion;
  NSArray *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t i;
  id v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  AMSUIWebBagKey *v30;
  NSObject *v31;
  AMSUIWebBagAction *v32;
  id v33;
  uint64_t v34;
  void *v35;
  NSArray *requestedKeys;
  id v38;
  NSArray *v39;
  uint64_t v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  objc_super v46;
  uint8_t buf[4];
  uint64_t v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  id v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v46.receiver = self;
  v46.super_class = (Class)AMSUIWebBagAction;
  v7 = -[AMSUIWebAction initWithJSObject:context:](&v46, sel_initWithJSObject_context_, v6, a4);
  v8 = v7;
  if (v7)
  {
    -[AMSUIWebAction context](v7, "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("account"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "iTunesAccountFromJSAccount:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    account = v8->_account;
    v8->_account = (ACAccount *)v11;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("profile"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;

    profile = v8->_profile;
    v8->_profile = v14;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("profileVersion"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v17 = v16;
    else
      v17 = 0;

    profileVersion = v8->_profileVersion;
    v8->_profileVersion = v17;

    v19 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("keys"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v38 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v21 = v20;
    else
      v21 = 0;

    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v22 = v21;
    v41 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
    if (v41)
    {
      v40 = *(_QWORD *)v43;
      v39 = v19;
      do
      {
        for (i = 0; i != v41; ++i)
        {
          if (*(_QWORD *)v43 != v40)
            objc_enumerationMutation(v22);
          v24 = *(id *)(*((_QWORD *)&v42 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v25 = v24;
          else
            v25 = 0;

          objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("key"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v27 = v26;
          else
            v27 = 0;

          objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("type"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v29 = objc_msgSend(v28, "integerValue");
            if (v27)
              goto LABEL_24;
          }
          else
          {
            v29 = 4;
            if (v27)
            {
LABEL_24:
              v30 = objc_alloc_init(AMSUIWebBagKey);
              -[AMSUIWebBagKey setKey:](v30, "setKey:", v27);
              -[AMSUIWebBagKey setValueType:](v30, "setValueType:", v29);
              -[NSArray addObject:](v19, "addObject:", v30);
              goto LABEL_31;
            }
          }
          objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
          v30 = (AMSUIWebBagKey *)objc_claimAutoreleasedReturnValue();
          if (!v30)
          {
            objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
            v30 = (AMSUIWebBagKey *)objc_claimAutoreleasedReturnValue();
          }
          -[AMSUIWebBagKey OSLogObject](v30, "OSLogObject");
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            v32 = v8;
            v33 = v22;
            v34 = objc_opt_class();
            AMSLogKey();
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v48 = v34;
            v22 = v33;
            v49 = 2114;
            v50 = v35;
            v51 = 2114;
            v52 = v25;
            _os_log_impl(&dword_211102000, v31, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unknown bag key in def: %{public}@", buf, 0x20u);

            v8 = v32;
            v19 = v39;
          }

LABEL_31:
        }
        v41 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
      }
      while (v41);
    }

    requestedKeys = v8->_requestedKeys;
    v8->_requestedKeys = v19;

    v6 = v38;
  }

  return v8;
}

- (id)runAction
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  objc_super v43;
  uint8_t buf[4];
  uint64_t v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v43.receiver = self;
  v43.super_class = (Class)AMSUIWebBagAction;
  v3 = -[AMSUIWebAction runAction](&v43, sel_runAction);
  v4 = objc_alloc_init(MEMORY[0x24BE08340]);
  -[AMSUIWebBagAction requestedKeys](self, "requestedKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    -[AMSUIWebBagAction profile](self, "profile");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIWebBagAction profileVersion](self, "profileVersion");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v36 = v4;
    if (!v7 || !v8)
    {
      -[AMSUIWebAction context](self, "context");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bag");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "profile");
      v12 = objc_claimAutoreleasedReturnValue();

      -[AMSUIWebAction context](self, "context");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "bag");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "profileVersion");
      v15 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v15;
      v7 = (void *)v12;
    }
    v16 = (void *)MEMORY[0x24BE08050];
    -[AMSUIWebAction context](self, "context");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "clientInfo");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bagForProfile:profileVersion:processInfo:", v7, v9, v18);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_alloc_init(MEMORY[0x24BE08298]);
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    -[AMSUIWebBagAction requestedKeys](self, "requestedKeys");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v39, v50, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v40 != v23)
            objc_enumerationMutation(v20);
          v25 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          objc_msgSend(v25, "key");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addBagKey:valueType:", v26, objc_msgSend(v25, "valueType"));

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v39, v50, 16);
      }
      while (v22);
    }

    objc_msgSend(MEMORY[0x24BE08060], "registerBagKeySet:forProfile:profileVersion:", v19, v7, v9);
    objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
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
      v29 = objc_opt_class();
      AMSLogKey();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSUIWebBagAction requestedKeys](self, "requestedKeys");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v45 = v29;
      v46 = 2114;
      v47 = v30;
      v48 = 2114;
      v49 = v31;
      _os_log_impl(&dword_211102000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Looking up keys: %{public}@", buf, 0x20u);

    }
    -[AMSUIWebBagAction requestedKeys](self, "requestedKeys");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_opt_new();
    v37[0] = MEMORY[0x24BDAC760];
    v37[1] = 3221225472;
    v37[2] = __30__AMSUIWebBagAction_runAction__block_invoke;
    v37[3] = &unk_24CB50B68;
    v4 = v36;
    v38 = v36;
    -[AMSUIWebBagAction _fetchValuesForKeys:bag:startingAtIndex:valuesArray:completion:](self, "_fetchValuesForKeys:bag:startingAtIndex:valuesArray:completion:", v32, v35, 0, v33, v37);

  }
  else
  {
    AMSError();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "finishWithError:", v7);
  }

  return v4;
}

uint64_t __30__AMSUIWebBagAction_runAction__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;

  v3 = *(void **)(a1 + 32);
  if (a3)
    return objc_msgSend(v3, "finishWithError:");
  else
    return objc_msgSend(v3, "finishWithResult:", a2);
}

- (void)_fetchValuesForKeys:(id)a3 bag:(id)a4 startingAtIndex:(int64_t)a5 valuesArray:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  char v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  AMSUIWebBagAction *v33;
  id v34;
  id v35;
  id v36;
  int64_t v37;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  objc_msgSend(v12, "objectAtIndexedSubscript:", a5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  switch(objc_msgSend(v16, "valueType"))
  {
    case 0:
      objc_msgSend(v16, "key");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "arrayForKey:", v17);
      v18 = objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    case 1:
      objc_msgSend(v16, "key");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "BOOLForKey:", v17);
      v18 = objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    case 2:
      objc_msgSend(v16, "key");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "doubleForKey:", v17);
      v18 = objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    case 3:
      objc_msgSend(v16, "key");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "integerForKey:", v17);
      v18 = objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    case 4:
      objc_msgSend(v16, "key");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringForKey:", v17);
      v18 = objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    case 5:
      v20 = objc_opt_respondsToSelector();
      objc_msgSend(v16, "key");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v20 & 1) != 0)
      {
        -[AMSUIWebBagAction account](self, "account");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (uint64_t)v21;
        if (!v21)
        {
          -[AMSUIWebAction context](self, "context");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "account");
          v22 = objc_claimAutoreleasedReturnValue();
        }
        v29 = (void *)v22;
        objc_msgSend(v13, "URLForKey:account:", v17, v22);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v21)
        {

        }
      }
      else
      {
        objc_msgSend(v13, "URLForKey:", v17);
        v18 = objc_claimAutoreleasedReturnValue();
LABEL_16:
        v19 = (void *)v18;
      }

LABEL_18:
      v30[0] = MEMORY[0x24BDAC760];
      v30[1] = 3221225472;
      v30[2] = __84__AMSUIWebBagAction__fetchValuesForKeys_bag_startingAtIndex_valuesArray_completion___block_invoke;
      v30[3] = &unk_24CB50B90;
      v31 = v14;
      v32 = v16;
      v36 = v15;
      v37 = a5;
      v33 = self;
      v34 = v12;
      v35 = v13;
      v23 = v13;
      v24 = v12;
      v25 = v15;
      v26 = v16;
      v27 = v14;
      objc_msgSend(v19, "valueWithCompletion:", v30);

      return;
    case 6:
      objc_msgSend(v16, "key");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "dictionaryForKey:", v17);
      v18 = objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    default:
      v19 = 0;
      goto LABEL_18;
  }
}

void __84__AMSUIWebBagAction__fetchValuesForKeys_bag_startingAtIndex_valuesArray_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void (*v18)(void);
  unint64_t v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a4;
  v8 = v6;
  objc_opt_class();
  v9 = v8;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "absoluteString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v10 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "key");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v11);

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v12, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = objc_opt_class();
      objc_msgSend(*(id *)(a1 + 48), "context");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "logKey");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "key");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138544130;
      v21 = v14;
      v22 = 2114;
      v23 = v16;
      v24 = 2114;
      v25 = v17;
      v26 = 2114;
      v27 = v7;
      _os_log_impl(&dword_211102000, v13, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to load bag key: %{public}@. %{public}@", (uint8_t *)&v20, 0x2Au);

    }
  }
  if (objc_msgSend(v7, "code") == 203)
  {
    v18 = *(void (**)(void))(*(_QWORD *)(a1 + 72) + 16);
LABEL_14:
    v18();
    goto LABEL_15;
  }
  v19 = *(_QWORD *)(a1 + 80);
  if (v19 >= objc_msgSend(*(id *)(a1 + 56), "count") - 1)
  {
    v18 = *(void (**)(void))(*(_QWORD *)(a1 + 72) + 16);
    goto LABEL_14;
  }
  objc_msgSend(*(id *)(a1 + 48), "_fetchValuesForKeys:bag:startingAtIndex:valuesArray:completion:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 80) + 1, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 72));
LABEL_15:

}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (NSString)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
  objc_storeStrong((id *)&self->_profile, a3);
}

- (NSString)profileVersion
{
  return self->_profileVersion;
}

- (void)setProfileVersion:(id)a3
{
  objc_storeStrong((id *)&self->_profileVersion, a3);
}

- (NSArray)requestedKeys
{
  return self->_requestedKeys;
}

- (void)setRequestedKeys:(id)a3
{
  objc_storeStrong((id *)&self->_requestedKeys, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedKeys, 0);
  objc_storeStrong((id *)&self->_profileVersion, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end

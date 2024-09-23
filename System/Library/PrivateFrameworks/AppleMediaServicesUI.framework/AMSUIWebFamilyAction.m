@implementation AMSUIWebFamilyAction

- (AMSUIWebFamilyAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  AMSUIWebFamilyAction *v8;
  void *v9;
  uint64_t v10;
  ACAccount *account;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)AMSUIWebFamilyAction;
  v8 = -[AMSUIWebAction initWithJSObject:context:](&v13, sel_initWithJSObject_context_, v6, v7);
  if (v8)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("account"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "iTunesAccountFromJSAccount:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    account = v8->_account;
    v8->_account = (ACAccount *)v10;

  }
  return v8;
}

- (id)runAction
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[5];
  objc_super v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v18.receiver = self;
  v18.super_class = (Class)AMSUIWebFamilyAction;
  v3 = -[AMSUIWebAction runAction](&v18, sel_runAction);
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
    *(_DWORD *)buf = 138543618;
    v20 = v6;
    v21 = 2114;
    v22 = v7;
    _os_log_impl(&dword_211102000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Performing family lookup", buf, 0x16u);

  }
  v8 = objc_alloc(MEMORY[0x24BE08198]);
  -[AMSUIWebFamilyAction account](self, "account");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIWebAction context](self, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bag");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v8, "initWithAccount:bag:", v9, v11);

  AMSLogKey();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setLogKey:", v13);

  objc_msgSend(v12, "performFamilyInfoLookup");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __33__AMSUIWebFamilyAction_runAction__block_invoke;
  v17[3] = &unk_24CB510F0;
  v17[4] = self;
  objc_msgSend(v14, "thenWithBlock:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

id __33__AMSUIWebFamilyAction_runAction__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BE08340];
  objc_msgSend(*(id *)(a1 + 32), "_dictionaryFromLookupResult:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "promiseWithResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_dictionaryFromLookupResult:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
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
  void *v25;
  void *v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v3, "isHeadOfHouseholdSharingPayment"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v4;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("sharedPaymentMethod"));

  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v25 = v3;
  objc_msgSend(v3, "familyMembers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v29;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v29 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v10);
        v12 = objc_alloc_init(MEMORY[0x24BDBCED8]);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v11, "isAskToBuyEnabled"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("askToBuyEnabled"));

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v11, "isCurrentSignedInUser"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, CFSTR("currentSignedInUser"));

        objc_msgSend(v11, "firstName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v15, CFSTR("firstName"));

        objc_msgSend(v11, "iCloudDSID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringValue");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v17, CFSTR("iCloudDSID"));

        objc_msgSend(v11, "iCloudUsername");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v18, CFSTR("iCloudUsername"));

        objc_msgSend(v11, "iTunesDSID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "stringValue");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v20, CFSTR("iTunesDSID"));

        objc_msgSend(v11, "iTunesUsername");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v21, CFSTR("iTunesUsername"));

        objc_msgSend(v11, "lastName");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v22, CFSTR("lastName"));

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v11, "isSharingPurchases"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v23, CFSTR("sharingPurchases"));

        objc_msgSend(v6, "addObject:", v12);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v8);
  }

  objc_msgSend(v26, "setObject:forKeyedSubscript:", v6, CFSTR("familyMembers"));
  return v26;
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
}

@end

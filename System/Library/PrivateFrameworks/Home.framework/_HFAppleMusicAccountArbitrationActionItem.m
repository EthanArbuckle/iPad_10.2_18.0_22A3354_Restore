@implementation _HFAppleMusicAccountArbitrationActionItem

+ (id)logoutActionItemForAccessories:(id)a3 desiredAccount:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;

  v7 = a4;
  v8 = a3;
  if (!objc_msgSend(v8, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HFAppleMusicAccountArbitrator.m"), 187, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("accessories.count > 0"));

  }
  v9 = (void *)objc_opt_new();
  objc_msgSend(v8, "na_filter:", &__block_literal_global_214);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = MEMORY[0x1E0C809B0];
  if (v7)
  {
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __91___HFAppleMusicAccountArbitrationActionItem_logoutActionItemForAccessories_desiredAccount___block_invoke_2;
    v23[3] = &unk_1EA727840;
    v24 = v7;
    objc_msgSend(v10, "na_filter:", v23);
    v12 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v12;
  }
  objc_msgSend(v10, "na_filter:", &__block_literal_global_46_8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setAccessories:", v13);
  v14 = objc_msgSend(v13, "count");
  v15 = (void *)MEMORY[0x1E0D519C0];
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "lazyFutureWithBlock:", &__block_literal_global_47_4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFuture:", v18);

    if (v7)
      goto LABEL_7;
LABEL_9:
    objc_msgSend(v9, "setActionItemDescription:", CFSTR("Accessory Logout"));
    goto LABEL_10;
  }
  v21[0] = v11;
  v21[1] = 3221225472;
  v21[2] = __91___HFAppleMusicAccountArbitrationActionItem_logoutActionItemForAccessories_desiredAccount___block_invoke_5;
  v21[3] = &unk_1EA728A78;
  v22 = v13;
  objc_msgSend(v15, "lazyFutureWithBlock:", v21);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFuture:", v16);

  if (!v7)
    goto LABEL_9;
LABEL_7:
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Accessory Logout for accessories which are not '%@'"), v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setActionItemDescription:", v17);

LABEL_10:
  return v9;
}

+ (id)loginActionItemForAccessories:(id)a3 account:(id)a4 contextGenerator:(id)a5
{
  id v9;
  id v10;
  id v11;
  BOOL v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  const __CFString *v37;
  void *v38;
  id v39;
  id obj;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  id v45;
  _QWORD v46[5];
  id v47;
  id v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  const __CFString *v55;
  _QWORD v56[3];

  v56[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!objc_msgSend(v9, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HFAppleMusicAccountArbitrator.m"), 225, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("accessories.count > 0"));

  }
  if (v11)
    v12 = v10 == 0;
  else
    v12 = 1;
  v13 = CFSTR("Proxy ('Manual') Login Plan");
  if (!v12)
    v13 = CFSTR("Companion ('Magic') ->Proxy ('Manual') Login Plan");
  if (v10)
    v14 = CFSTR("Companion ('Magic') Login Plan");
  else
    v14 = 0;
  if (v11)
    v15 = v13;
  else
    v15 = v14;
  v16 = (void *)objc_opt_new();
  objc_msgSend(v16, "setAccessories:", v9);
  v17 = (void *)objc_opt_new();
  v18 = (void *)objc_opt_new();
  v55 = CFSTR("accessoryUUIDToAuthKitContext");
  v56[0] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, &v55, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setUserInfo:", v19);

  if (v11)
  {
    v37 = v15;
    v38 = v16;
    v20 = v11;
    v39 = v9;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    objc_msgSend(v16, "accessories");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v51;
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v51 != v23)
            objc_enumerationMutation(obj);
          v25 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * v24);
          v26 = (void *)MEMORY[0x1E0D519C0];
          v46[0] = MEMORY[0x1E0C809B0];
          v46[1] = 3221225472;
          v46[2] = __100___HFAppleMusicAccountArbitrationActionItem_loginActionItemForAccessories_account_contextGenerator___block_invoke;
          v46[3] = &unk_1EA73E750;
          v49 = v20;
          v46[4] = v25;
          v47 = v10;
          v48 = v18;
          objc_msgSend(v26, "lazyFutureWithBlock:", v46);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v27);

          ++v24;
        }
        while (v22 != v24);
        v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
      }
      while (v22);
    }

    v16 = v38;
    v9 = v39;
    v11 = v20;
    v15 = v37;
  }
  v28 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v16, "accessories");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "stringWithFormat:", CFSTR("%@ Login for Accessories %@"), v15, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setActionItemDescription:", v30);

  v31 = objc_msgSend(v9, "count");
  v32 = (void *)MEMORY[0x1E0D519C0];
  if (v31)
  {
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __100___HFAppleMusicAccountArbitrationActionItem_loginActionItemForAccessories_account_contextGenerator___block_invoke_4;
    v41[3] = &unk_1EA737000;
    v42 = v10;
    v43 = v9;
    v44 = v17;
    v45 = v18;
    objc_msgSend(v32, "lazyFutureWithBlock:", v41);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setFuture:", v33);

    v34 = v42;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "lazyFutureWithBlock:", &__block_literal_global_66_2);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setFuture:", v34);
  }

  return v16;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HFAppleMusicAccountArbitrationActionItem actionItemDescription](self, "actionItemDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("actionItemDescription"));

  -[_HFAppleMusicAccountArbitrationActionItem accessories](self, "accessories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendObject:withName:", v5, CFSTR("accessories"));

  -[_HFAppleMusicAccountArbitrationActionItem future](self, "future");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v3, "appendObject:withName:", v7, CFSTR("future"));

  -[_HFAppleMusicAccountArbitrationActionItem userInfo](self, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendDictionarySection:withName:skipIfEmpty:", v9, CFSTR("userInfo"), 1);

  objc_msgSend(v3, "build");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)actionItemDescription
{
  return self->_actionItemDescription;
}

- (void)setActionItemDescription:(id)a3
{
  objc_storeStrong((id *)&self->_actionItemDescription, a3);
}

- (NSSet)accessories
{
  return self->_accessories;
}

- (void)setAccessories:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userInfo, a3);
}

- (NAFuture)future
{
  return self->_future;
}

- (void)setFuture:(id)a3
{
  objc_storeStrong((id *)&self->_future, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_future, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_accessories, 0);
  objc_storeStrong((id *)&self->_actionItemDescription, 0);
}

@end

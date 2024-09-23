@implementation HUAppleMusicAccountItem

- (HUAppleMusicAccountItem)initWithMediaProfileContainer:(id)a3 account:(id)a4
{
  id v7;
  id v8;
  HUAppleMusicAccountItem *v9;
  HUAppleMusicAccountItem *v10;
  void *v12;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUAppleMusicAccountItem.m"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("account"));

  }
  v13.receiver = self;
  v13.super_class = (Class)HUAppleMusicAccountItem;
  v9 = -[HUAppleMusicItem initWithMediaProfileContainer:](&v13, sel_initWithMediaProfileContainer_, v7);
  v10 = v9;
  if (v9)
    objc_storeStrong((id *)&v9->_account, a4);

  return v10;
}

- (HUAppleMusicAccountItem)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithMediaProfileContainer_account_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUAppleMusicAccountItem.m"), 35, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUAppleMusicAccountItem init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[HUAppleMusicItem mediaProfileContainer](self, "mediaProfileContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAppleMusicAccountItem account](self, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithMediaProfileContainer:account:", v5, v6);

  objc_msgSend(v7, "copyLatestResultsFromItem:", self);
  return v7;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  objc_super v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v10.receiver = self;
  v10.super_class = (Class)HUAppleMusicAccountItem;
  -[HUAppleMusicItem _subclass_updateWithOptions:](&v10, sel__subclass_updateWithOptions_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__HUAppleMusicAccountItem__subclass_updateWithOptions___block_invoke;
  v8[3] = &unk_1E6F4C8A8;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v5, "flatMap:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
  return v6;
}

id __55__HUAppleMusicAccountItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  v5 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(WeakRetained, "mediaProfileContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hf_appleMusicCurrentLoggedInAccountDSID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "account");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "aa_altDSID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqualToString:", v9);

  objc_msgSend(WeakRetained, "mediaProfileContainer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v11, "hf_homePodSupportsMultiUser");

  if ((_DWORD)v7)
  {
    objc_msgSend(WeakRetained, "mediaProfileContainer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "hf_appleMusicCurrentLoggedInAccount");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(WeakRetained, "mediaProfileContainer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "hf_appleMusicCurrentLoggedInAccount");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, CFSTR("HOAppleMusicAccountKey"));

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v13 != 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, CFSTR("HOAppleMusicAccountIsLoggedInKey"));

    goto LABEL_9;
  }
  objc_msgSend(WeakRetained, "account");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("HOAppleMusicAccountIsLoggedInKey"));
    goto LABEL_9;
  }
  objc_msgSend(WeakRetained, "account");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, CFSTR("HOAppleMusicAccountKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, CFSTR("HOAppleMusicAccountIsLoggedInKey"));

  objc_msgSend(WeakRetained, "account");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "username");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "length");

  if (!v22)
  {
LABEL_9:
    v32 = MEMORY[0x1E0C9AAB0];
    goto LABEL_10;
  }
  objc_msgSend(WeakRetained, "account");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "username");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  HULocalizedStringWithFormat(CFSTR("HUAppleMusicAccountUseFormatString"), CFSTR("%@"), v25, v26, v27, v28, v29, v30, (uint64_t)v24);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v31, *MEMORY[0x1E0D30D18]);

  v32 = MEMORY[0x1E0C9AAA0];
LABEL_10:
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v32, *MEMORY[0x1E0D30D70]);
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v5);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return v33;
}

- (ACAccount)account
{
  return self->_account;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
}

@end

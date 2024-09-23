@implementation HUUserAvatarHeaderView

void __54___HUUserAvatarHeaderView_initWithUser_home_delegate___block_invoke(id *a1, void *a2, uint64_t a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (!a3)
  {
    objc_msgSend(a1[4], "uniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = a1[5];
      objc_msgSend(a1[4], "uniqueIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "UUIDString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v13);

      v14 = (void *)MEMORY[0x1E0D519C0];
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __54___HUUserAvatarHeaderView_initWithUser_home_delegate___block_invoke_2;
      v16[3] = &unk_1E6F4D600;
      v17 = WeakRetained;
      v18 = a1[5];
      v15 = (id)objc_msgSend(v14, "futureWithBlock:", v16);

    }
  }

}

void __54___HUUserAvatarHeaderView_initWithUser_home_delegate___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v3, "contactView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccounts:", *(_QWORD *)(a1 + 40));

  objc_msgSend(v5, "finishWithNoResult");
}

uint64_t __47___HUUserAvatarHeaderView_setAccounts_forHome___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    objc_msgSend(v5, "accountType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C8F170]);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end

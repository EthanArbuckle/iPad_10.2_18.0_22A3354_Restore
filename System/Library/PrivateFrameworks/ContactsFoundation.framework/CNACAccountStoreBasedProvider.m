@implementation CNACAccountStoreBasedProvider

uint64_t __70___CNACAccountStoreBasedProvider_isAnyAccountSyncableIgnoringAccount___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "accountsWithAccountType:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __70___CNACAccountStoreBasedProvider_isAnyAccountSyncableIgnoringAccount___block_invoke_2;
  v6[3] = &unk_1E29BC0F0;
  v7 = *(id *)(a1 + 40);
  v4 = objc_msgSend(v3, "_cn_any:", v6);

  return v4;
}

uint64_t __70___CNACAccountStoreBasedProvider_isAnyAccountSyncableIgnoringAccount___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32)) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v3, "parentAccountIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 || (objc_msgSend(v3, "_cn_isManaged") & 1) != 0)
      v5 = 0;
    else
      v5 = objc_msgSend(v3, "isEnabledForDataclass:", *MEMORY[0x1E0C8F388]);

  }
  return v5;
}

@end

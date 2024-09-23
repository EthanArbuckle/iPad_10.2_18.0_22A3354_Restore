@implementation ACAccountStore

uint64_t __93__ACAccountStore_ContactsFoundation__cardDAVAccountForPrimaryAppleAccountWithAppleID_logger___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v2 = a2;
  objc_msgSend(v2, "parentAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accountType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C8F030]))
  {
    objc_msgSend(v2, "parentAccount");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "_cn_isPrimaryAccount");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end

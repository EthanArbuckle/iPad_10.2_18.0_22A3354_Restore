@implementation ACAccountStore

uint64_t __68__ACAccountStore_BRAdditions__br_allEligibleAppleAccountsWithError___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "br_isEligibleiCloudAccount");
}

uint64_t __90__ACAccountStore_BRAdditions__br_allEnabledAppleAccountsIncludingDataSeparated_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if (objc_msgSend(v3, "br_isEligibleiCloudAccount")
    && objc_msgSend(v3, "br_isEnabledForCloudDocs"))
  {
    if (*(_BYTE *)(a1 + 32))
      v4 = 1;
    else
      v4 = objc_msgSend(v3, "isDataSeparatedAccount") ^ 1;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void __52__ACAccountStore_BRAdditions__br_accountForPersona___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)_accountForPersona;
  _accountForPersona = v0;

}

@end

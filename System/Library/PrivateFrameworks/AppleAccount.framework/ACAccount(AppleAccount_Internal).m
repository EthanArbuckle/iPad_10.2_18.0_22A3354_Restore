@implementation ACAccount(AppleAccount_Internal)

- (uint64_t)_aa_benefactorAccount
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "accountPropertyForKey:", CFSTR("benefactorAccount"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (void)_aa_setBenefactorAccount:()AppleAccount_Internal
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setAccountProperty:forKey:", v2, CFSTR("benefactorAccount"));

}

- (id)_aa_termsServerInfo
{
  return objc_getAssociatedObject(a1, sel__aa_termsServerInfo);
}

- (void)_aa_setTermsServerInfo:()AppleAccount_Internal
{
  objc_setAssociatedObject(a1, sel__aa_termsServerInfo, a3, (void *)3);
}

- (void)_aa_setPersonID:()AppleAccount_Internal
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
    objc_msgSend(a1, "setAccountProperty:forKey:", v4, CFSTR("personID"));

}

- (void)_aa_setLastAgreedTermsInfo:()AppleAccount_Internal
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
    objc_msgSend(a1, "setAccountProperty:forKey:", v4, CFSTR("lastAgreedTerms"));

}

- (uint64_t)_aa_primaryAccountUpdaterVersion
{
  return objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("AAPrimaryAccountUpdaterVersion"));
}

- (uint64_t)_aa_setPrimaryAccountUpdaterVersion:()AppleAccount_Internal
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:", a3, CFSTR("AAPrimaryAccountUpdaterVersion"));
}

- (uint64_t)_aa_appProvidedContext
{
  return objc_msgSend(a1, "accountPropertyForKey:", CFSTR("tempForSignIn_apc"));
}

- (uint64_t)_aa_setAppProvidedContext:()AppleAccount_Internal
{
  return objc_msgSend(a1, "setAccountProperty:forKey:", a3, CFSTR("tempForSignIn_apc"));
}

@end

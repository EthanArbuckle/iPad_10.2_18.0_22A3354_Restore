@implementation NSError(SecureBackup)

- (BOOL)isICSCRecoveryHardLimitError
{
  void *v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BE17C10]))
  {
    objc_msgSend(a1, "userInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE17C88]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "unsignedIntegerValue") == 2;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isICSCInvalidError
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BE17C10]))
    v3 = objc_msgSend(a1, "code") == 26;
  else
    v3 = 0;

  return v3;
}

- (BOOL)isCoolDownError
{
  void *v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BE17C10]))
  {
    objc_msgSend(a1, "userInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE17C88]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "unsignedIntegerValue") == 1;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isRecoveryPETHardLimitError
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BE17C10]))
    v3 = objc_msgSend(a1, "code") == 34;
  else
    v3 = 0;

  return v3;
}

- (BOOL)isRecoveryPETSoftLimitError
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BE17C10]))
    v3 = objc_msgSend(a1, "code") == 35;
  else
    v3 = 0;

  return v3;
}

- (id)errorByExtendingUserInfoWithDictionary:()SecureBackup
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(a1, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v8;

    objc_msgSend(v10, "addEntriesFromDictionary:", v4);
    v11 = (void *)objc_opt_class();
    objc_msgSend(a1, "domain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, objc_msgSend(a1, "code"), v10);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = a1;
  }

  return v9;
}

- (uint64_t)isRecordNotViableError
{
  void *v2;
  uint64_t v3;

  if (objc_msgSend(a1, "code") != 58)
    return 0;
  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BDE8520]);

  return v3;
}

- (uint64_t)isMissingCachedPassphraseError
{
  _BOOL8 v2;
  void *v3;

  if ((objc_msgSend(a1, "cdp_isCDPErrorWithCode:", -5501) & 1) != 0)
    return 1;
  objc_msgSend(a1, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE17C10]))
    v2 = objc_msgSend(a1, "code") == 9;
  else
    v2 = 0;

  return v2;
}

- (uint64_t)indicatesRecoveryCanBeRetried
{
  void *v2;
  int v3;

  if (objc_msgSend(MEMORY[0x24BE1A4A0], "useCDPContextSecretInsteadOfSBDSecretFeatureEnabled")
    && (objc_msgSend(MEMORY[0x24BE1A448], "sharedInstance"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        v3 = objc_msgSend(v2, "hasLocalSecret"),
        v2,
        v3))
  {
    return objc_msgSend(a1, "isMissingCachedPassphraseError");
  }
  else
  {
    return 0;
  }
}

@end

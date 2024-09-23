@implementation NSError

- (id)_hd_cloudKitErrorRequiringUserActionFromCKErrorDomain
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  void *v13;

  if (!a1)
    goto LABEL_16;
  if (objc_msgSend(a1, "code") != 110)
  {
    if (objc_msgSend(a1, "code") == 4 || objc_msgSend(a1, "code") == 3 || objc_msgSend(a1, "code") == 34)
    {
      v8 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(a1, "userInfo");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = CFSTR("Network failure during Cloud Sync Operation");
      v6 = v8;
      v7 = 704;
      goto LABEL_8;
    }
    if (objc_msgSend(a1, "code") == 25)
    {
      v11 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(a1, "userInfo");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = CFSTR("iCloud Quota Exceeded during Cloud Sync Operation");
      v6 = v11;
      v7 = 705;
      goto LABEL_8;
    }
    if (objc_msgSend(a1, "code") == 33)
    {
      v12 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(a1, "userInfo");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = CFSTR("The participant may need HSA2 verification");
      v6 = v12;
      v7 = 731;
      goto LABEL_8;
    }
    if (objc_msgSend(a1, "code") == 9)
    {
      v13 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(a1, "userInfo");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = CFSTR("The user needs to login again into iCloud or accept new user terms and conditions.");
      v6 = v13;
      v7 = 735;
      goto LABEL_8;
    }
LABEL_16:
    v9 = 0;
    return v9;
  }
  v2 = (void *)MEMORY[0x1E0CB35C8];
  objc_msgSend(a1, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = CFSTR("Manatee container is unavailable, device is in CFU state");
  v6 = v2;
  v7 = 706;
LABEL_8:
  objc_msgSend(v6, "hk_error:description:underlyingError:", v7, v5, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __73__NSError_HealthDaemon__hd_errorStrippingExpectedCloudKitPartialFailures__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  uint64_t v5;
  _BOOL4 v6;
  uint64_t v7;

  v2 = a2;
  objc_msgSend(v2, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C947D8]);

  if (v4)
  {
    v5 = objc_msgSend(v2, "code");
    v6 = v5 == 112;
    if (v5 == 22)
      v6 = 1;
    v7 = v5 == 11 || v6;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __45__NSError_HealthDaemon__hd_errorForAnalytics__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqualToString:", *MEMORY[0x1E0CB4E18]) ^ 1;
}

@end

@implementation ACAccount(AppleID)

- (uint64_t)setDSID:()AppleID
{
  return objc_msgSend(a1, "setAccountProperty:forKey:", a3, *MEMORY[0x1E0CFCF10]);
}

- (uint64_t)dsid
{
  return objc_msgSend(a1, "accountPropertyForKey:", *MEMORY[0x1E0CFCF10]);
}

- (id)normalizedDSID
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;

  objc_msgSend(a1, "accountPropertyForKey:", *MEMORY[0x1E0CFCF10]);
  v2 = objc_claimAutoreleasedReturnValue();
  if (!v2
    || (v3 = (void *)v2, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (objc_msgSend(v3, "stringValue"),
        v4 = objc_claimAutoreleasedReturnValue(),
        v3,
        (v3 = (void *)v4) == 0))
  {
    objc_msgSend(a1, "accountType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C8F0E8]);

    if (!v7
      || (objc_msgSend(a1, "accountPropertyForKey:", CFSTR("profile-id")),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("D:"), &stru_1E41752F8),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          v8,
          !v3))
    {
      objc_msgSend(a1, "accountType");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0C8F030]);

      if (v11)
      {
        objc_msgSend(a1, "accountPropertyForKey:", CFSTR("personID"));
        v3 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v3 = 0;
      }
    }
  }
  return v3;
}

- (uint64_t)_registeredBundles
{
  return objc_msgSend(a1, "accountPropertyForKey:", CFSTR("bundleRef"));
}

- (BOOL)canRemoveAccount
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "_registeredBundles");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "count") == 0;

  return v2;
}

@end

@implementation AMSRestrictions

+ (int64_t)explicitContentSettingForBundleID:(id)a3
{
  void *v3;
  _BOOL4 v4;
  int64_t v5;

  objc_msgSend(a3, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.music")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.news")) & 1) != 0
    || objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.podcasts")))
  {
    v4 = +[AMSRestrictions explicitContentAllowed](AMSRestrictions, "explicitContentAllowed");
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.ibooks")))
    {
      v5 = -1;
      goto LABEL_6;
    }
    v4 = +[AMSRestrictions eroticaAllowed](AMSRestrictions, "eroticaAllowed");
  }
  v5 = v4;
LABEL_6:

  return v5;
}

+ (BOOL)onDeviceDiagnosticsAllowed
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDiagnosticSubmissionAllowed");

  return v3;
}

+ (BOOL)allowAccountModifications
{
  int v2;

  v2 = objc_msgSend(a1, "allowActiveAccountModifications");
  if (v2)
    LOBYTE(v2) = !+[AMSDevice isRunningInStoreDemoMode](AMSDevice, "isRunningInStoreDemoMode");
  return v2;
}

+ (BOOL)allowActiveAccountModifications
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D46ED8]) != 2;

  return v3;
}

+ (BOOL)eroticaAllowed
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D46F80]) != 2;

  return v3;
}

+ (BOOL)explicitContentAllowed
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D46FF8]) != 2;

  return v3;
}

+ (BOOL)inAppPurchaseAllowed
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D47098]) != 2;

  return v3;
}

+ (BOOL)isParentalControlEnabled
{
  CFPreferencesAppSynchronize(CFSTR("com.apple.springboard"));
  return CFPreferencesGetAppBooleanValue(CFSTR("SBParentalControlsEnabled"), CFSTR("com.apple.springboard"), 0) != 0;
}

+ (int64_t)maximumMediaRank
{
  return 1000;
}

+ (BOOL)requirePasswordImmediately
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D47088]) == 1;

  return v3;
}

+ (id)rankForMediaType:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "_featureNameForMediaType:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4
    || (objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "effectiveValueForSetting:", v4),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        !v6))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1, "maximumMediaRank"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

+ (id)_featureNameForMediaType:(unint64_t)a3
{
  if (a3 > 2)
    return 0;
  else
    return **((id **)&unk_1E2545690 + a3);
}

@end

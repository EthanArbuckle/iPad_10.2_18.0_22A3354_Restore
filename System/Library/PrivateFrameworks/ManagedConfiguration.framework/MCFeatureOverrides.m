@implementation MCFeatureOverrides

+ (BOOL)isDevFused
{
  return os_variant_allows_internal_security_policies();
}

+ (BOOL)isAppleInternal
{
  return os_variant_has_internal_ui();
}

+ (id)_numberForDefaultsKey:(id)a3 isPresent:(BOOL *)a4
{
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  id v10;

  v6 = a3;
  if (!objc_msgSend(a1, "isAppleInternal"))
  {
    v8 = 0;
    v9 = 0;
    if (!a4)
      goto LABEL_8;
LABEL_7:
    *a4 = v9;
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v8 != 0;
  if (v8)
    v10 = v8;

  if (a4)
    goto LABEL_7;
LABEL_8:

  return v8;
}

+ (BOOL)BOOLForDefaultsKey:(id)a3 isPresent:(BOOL *)a4
{
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(a1, "_numberForDefaultsKey:isPresent:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "BOOLValue");
  else
    v6 = 0;

  return v6;
}

+ (BOOL)BOOLForDefaultsKey:(id)a3
{
  return objc_msgSend(a1, "BOOLForDefaultsKey:isPresent:", a3, 0);
}

+ (BOOL)allowVPNInUserEnrollment
{
  char v3;
  char v4;
  char v6;

  v3 = objc_msgSend(a1, "isAppleInternal");
  if (objc_msgSend(a1, "isAppleInternal"))
  {
    v6 = 0;
    v4 = objc_msgSend(a1, "BOOLForDefaultsKey:isPresent:", CFSTR("MCAllowFullVPNInUserEnrollments"), &v6);
    if (v6)
      return v4;
  }
  return v3;
}

+ (BOOL)allowUnsupervisedWatchEnrollment
{
  char v3;
  char v4;
  char v6;

  v3 = objc_msgSend(a1, "isAppleInternal");
  if (objc_msgSend(a1, "isAppleInternal"))
  {
    v6 = 0;
    v4 = objc_msgSend(a1, "BOOLForDefaultsKey:isPresent:", CFSTR("MCAllowUnsupervisedWatchEnrollment"), &v6);
    if (v6)
      return v4;
  }
  return v3;
}

+ (BOOL)shouldDisablePlatformPayloadFilter
{
  return objc_msgSend(a1, "BOOLForDefaultsKey:", CFSTR("MCDisablePlatformPayloadFilter"));
}

+ (BOOL)shouldSimulatorSupportMDM
{
  return objc_msgSend(a1, "BOOLForDefaultsKey:", CFSTR("MCEnableMDMOnSimulator"));
}

+ (unint64_t)profileEventsMaxLength
{
  void *v2;
  void *v3;
  unint64_t v4;

  objc_msgSend(a1, "_numberForDefaultsKey:isPresent:", CFSTR("MCProfileEventsMaxLength"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "unsignedIntValue");
  else
    v4 = 20;

  return v4;
}

+ (int)profileEventsExpirationInterval
{
  void *v2;
  void *v3;
  int v4;

  objc_msgSend(a1, "_numberForDefaultsKey:isPresent:", CFSTR("MCProfileEventsExpirationInterval"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "intValue");
  else
    v4 = 1209600;

  return v4;
}

+ (double)accountRemovalTimeoutWithDefaultValue:(double)a3
{
  void *v4;
  void *v5;
  double v6;

  objc_msgSend(a1, "_numberForDefaultsKey:isPresent:", CFSTR("MCAccountRemovalTimeout"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "doubleValue");
    a3 = v6;
  }

  return a3;
}

@end

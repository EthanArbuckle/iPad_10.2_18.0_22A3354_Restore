@implementation PRSettingsProvider

+ (BOOL)shouldShowPINPrivacyLockForBundleID:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  NSLog(CFSTR("PRSettingsProvider: shouldShowPINPrivacyLockForBundleID"));
  v4 = +[PRSettingsProvider isProximityReaderSupported:](PRSettingsProvider, "isProximityReaderSupported:", v3);

  return v4;
}

+ (BOOL)isProximityReaderSupported:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  int v10;

  v3 = a3;
  NSLog(CFSTR("PRSettingsProvider: isProximityReaderSupported"));
  if (objc_msgSend(v3, "length"))
  {
    v4 = (void *)MGCopyAnswer();
    NSLog(CFSTR("PRSettingsProvider: ProductType = %@"), v4);
    if (objc_msgSend(v4, "hasPrefix:", CFSTR("iPhone"))
      && (unint64_t)objc_msgSend(v4, "length") >= 7)
    {
      objc_msgSend(v4, "substringFromIndex:", 6);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "componentsSeparatedByString:", CFSTR(","));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "count") == 2)
      {
        objc_msgSend(v6, "objectAtIndex:", 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectAtIndex:", 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((int)objc_msgSend(v7, "intValue") > 11)
        {

          NSLog(CFSTR("PRSettingsProvider: model isSupported = %d"), 1);
LABEL_10:
          v9 = +[PRSettingsProvider hasEntitlement:](PRSettingsProvider, "hasEntitlement:", v3);
LABEL_15:
          NSLog(CFSTR("PRSettingsProvider: hasEntitlement = %d"), v9);

          goto LABEL_16;
        }
        if (objc_msgSend(v7, "intValue") == 11)
        {
          v10 = objc_msgSend(v8, "intValue");

          NSLog(CFSTR("PRSettingsProvider: model isSupported = %d"), v10 > 1);
          if (v10 > 1)
            goto LABEL_10;
LABEL_14:
          v9 = 0;
          goto LABEL_15;
        }

      }
    }
    NSLog(CFSTR("PRSettingsProvider: model isSupported = %d"), 0);
    goto LABEL_14;
  }
  NSLog(CFSTR("PRSettingsProvider: Empty bundleIdentifier, hide"));
  LOBYTE(v9) = 0;
LABEL_16:

  return v9;
}

+ (BOOL)hasEntitlement:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v10;

  v3 = a3;
  v10 = 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithBundleIdentifier:allowPlaceholder:error:", v3, 1, &v10);
  v5 = v10;
  v6 = v5;
  if (!v4)
    NSLog(CFSTR("PRSettingsProvider: hasEntitlement could not get the application record for %@ with error %@"), v3, v5);
  objc_msgSend(v4, "entitlements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:ofClass:", CFSTR("com.apple.developer.proximity-reader.payment.acceptance"), objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v7) = objc_msgSend(v8, "BOOLValue");
  return (char)v7;
}

+ (BOOL)shouldDisablePINPrivacyLockForBundleID:(id)a3
{
  id v3;
  __CFString *v4;
  void *v5;
  void *v6;
  char v7;

  v3 = a3;
  NSLog(CFSTR("PRSettingsProvider: shouldDisablePINPrivacyLockForBundleID"));
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@"), CFSTR("PRMDMAttrPrivacyLock"), v3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)CFPreferencesCopyAppValue(v4, CFSTR("com.apple.merchantd"));
    v6 = v5;
    if (v5)
    {
      NSLog(CFSTR("PRSettingsProvider: shouldDisablePINPrivacyLockForBundleID = %d"), objc_msgSend(v5, "BOOLValue"));
      v7 = objc_msgSend(v6, "BOOLValue");
    }
    else
    {
      NSLog(CFSTR("PRSettingsProvider: No matching mdm attr, default to NO"));
      v7 = 0;
    }

  }
  else
  {
    NSLog(CFSTR("PRSettingsProvider: Empty bundleIdentifier, disable"));
    v7 = 0;
  }

  return v7;
}

+ (BOOL)getPINPrivacyLockForBundleID:(id)a3
{
  id v3;
  __CFString *v4;
  void *v5;
  void *v6;
  char v7;

  v3 = a3;
  NSLog(CFSTR("PRSettingsProvider: getPINPrivacyLockForBundleID"));
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@"), CFSTR("PREnablePrivacyLockKey"), v3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)CFPreferencesCopyAppValue(v4, CFSTR("com.apple.merchantd"));
    v6 = v5;
    if (v5)
    {
      NSLog(CFSTR("PRSettingsProvider: pinPrivacyLock = %d"), objc_msgSend(v5, "BOOLValue"));
      v7 = objc_msgSend(v6, "BOOLValue");
    }
    else
    {
      NSLog(CFSTR("PRSettingsProvider: No matching key, default to NO"));
      v7 = 0;
    }

  }
  else
  {
    NSLog(CFSTR("PRSettingsProvider: Empty bundleIdentifier"));
    v7 = 0;
  }

  return v7;
}

+ (void)setPINPrivacyLock:(BOOL)a3 forBundleID:(id)a4
{
  _BOOL8 v4;
  __CFString *v5;
  const void *v6;
  const __CFString *v7;
  const __CFString *v8;
  id v9;

  v4 = a3;
  v9 = a4;
  NSLog(CFSTR("PRSettingsProvider: setPINPrivacyLock"));
  if (objc_msgSend(v9, "length"))
  {
    NSLog(CFSTR("PRSettingsProvider: setPINPrivacyLock = %d"), v4);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@"), CFSTR("PREnablePrivacyLockKey"), v9);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v6 = (const void *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
    v7 = (const __CFString *)*MEMORY[0x24BDBD590];
    v8 = (const __CFString *)*MEMORY[0x24BDBD570];
    CFPreferencesSetValue(v5, v6, CFSTR("com.apple.merchantd"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
    CFPreferencesSynchronize(CFSTR("com.apple.merchantd"), v7, v8);

  }
  else
  {
    NSLog(CFSTR("PRSettingsProvider: Empty bundleIdentifier, no change"));
  }

}

+ (void)setMDMAppAttribute:(int64_t)a3 withValue:(BOOL)a4 forBundleID:(id)a5
{
  _BOOL8 v5;
  __CFString *v7;
  void *v8;
  void *v9;
  const void *v10;
  const __CFString *v11;
  const __CFString *v12;
  __CFString *v13;
  id v14;

  v5 = a4;
  v14 = a5;
  if (objc_msgSend(v14, "length"))
  {
    if (a3)
    {
      NSLog(CFSTR("PRSettingsProvider setMDMAppAttribute: Unknown attribute type"));
    }
    else
    {
      NSLog(CFSTR("PRSettingsProvider setMDMAppAttribute: set PrivacyLock = %d for %@"), v5, v14);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@"), CFSTR("PRMDMAttrPrivacyLock"), v14);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)CFPreferencesCopyAppValue(v7, CFSTR("com.apple.merchantd"));
      v9 = v8;
      if (!v8 || objc_msgSend(v8, "BOOLValue") != v5)
      {
        NSLog(CFSTR("PRSettingsProvider: set PRMDMAttrPrivacyLock = %d for %@"), v5, v7);
        v10 = (const void *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
        v11 = (const __CFString *)*MEMORY[0x24BDBD590];
        v12 = (const __CFString *)*MEMORY[0x24BDBD570];
        CFPreferencesSetValue(v7, v10, CFSTR("com.apple.merchantd"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@"), CFSTR("PREnablePrivacyLockKey"), v14);
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
        NSLog(CFSTR("PRSettingsProvider: set PREnablePrivacyLockKey = %d for %@"), v5, v13);
        CFPreferencesSetValue(v13, (CFPropertyListRef)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5), CFSTR("com.apple.merchantd"), v11, v12);
        CFPreferencesSynchronize(CFSTR("com.apple.merchantd"), v11, v12);

      }
    }
  }
  else
  {
    NSLog(CFSTR("PRSettingsProvider setMDMAppAttribute: Empty bundleIdentifier, no change"));
  }

}

+ (void)removeMDMAppAttribute:(int64_t)a3 forBundleID:(id)a4
{
  __CFString *v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  __CFString *v9;
  id v10;

  v10 = a4;
  if (objc_msgSend(v10, "length"))
  {
    if (a3)
    {
      NSLog(CFSTR("PRSettingsProvider removeMDMAppAttribute: Unknown attribute type"));
    }
    else
    {
      NSLog(CFSTR("PRSettingsProvider: remove PrivacyLock for %@"), v10);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@"), CFSTR("PRMDMAttrPrivacyLock"), v10);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)CFPreferencesCopyAppValue(v5, CFSTR("com.apple.merchantd"));
      v7 = (const __CFString *)*MEMORY[0x24BDBD590];
      v8 = (const __CFString *)*MEMORY[0x24BDBD570];
      CFPreferencesSetValue(v5, 0, CFSTR("com.apple.merchantd"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
      if (v6 && objc_msgSend(v6, "BOOLValue"))
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@"), CFSTR("PREnablePrivacyLockKey"), v10);
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
        CFPreferencesSetValue(v9, 0, CFSTR("com.apple.merchantd"), v7, v8);

      }
      CFPreferencesSynchronize(CFSTR("com.apple.merchantd"), v7, v8);

    }
  }
  else
  {
    NSLog(CFSTR("PRSettingsProvider removeMDMAppAttribute: Empty bundleIdentifier, no change"));
  }

}

+ (BOOL)getAlwaysPlaySoundForBundleID:(id)a3
{
  id v3;
  __CFString *v4;
  void *v5;
  void *v6;
  char v7;

  v3 = a3;
  NSLog(CFSTR("PRSettingsProvider: getAlwaysPlaySoundForBundleID"));
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@"), CFSTR("PREnableAlwaysPlaySound"), v3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)CFPreferencesCopyAppValue(v4, CFSTR("com.apple.merchantd"));
    v6 = v5;
    if (v5)
    {
      NSLog(CFSTR("PRSettingsProvider: alwaysPlaySoundForBundleID = %d"), objc_msgSend(v5, "BOOLValue"));
      v7 = objc_msgSend(v6, "BOOLValue");
    }
    else
    {
      NSLog(CFSTR("PRSettingsProvider: No matching key, default to YES"));
      v7 = 1;
    }

  }
  else
  {
    NSLog(CFSTR("PRSettingsProvider: Empty bundleIdentifier"));
    v7 = 0;
  }

  return v7;
}

+ (void)setAlwaysPlaySound:(BOOL)a3 forBundleID:(id)a4
{
  _BOOL8 v4;
  __CFString *v5;
  const void *v6;
  const __CFString *v7;
  const __CFString *v8;
  id v9;

  v4 = a3;
  v9 = a4;
  NSLog(CFSTR("PRSettingsProvider: setAlwaysPlaySound"));
  if (objc_msgSend(v9, "length"))
  {
    NSLog(CFSTR("PRSettingsProvider: setAlwaysPlaySound = %d"), v4);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@"), CFSTR("PREnableAlwaysPlaySound"), v9);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v6 = (const void *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
    v7 = (const __CFString *)*MEMORY[0x24BDBD590];
    v8 = (const __CFString *)*MEMORY[0x24BDBD570];
    CFPreferencesSetValue(v5, v6, CFSTR("com.apple.merchantd"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
    CFPreferencesSynchronize(CFSTR("com.apple.merchantd"), v7, v8);

  }
  else
  {
    NSLog(CFSTR("PRSettingsProvider: Empty bundleIdentifier, no change"));
  }

}

@end

@implementation DEDUtils

+ (id)deviceClassForProductType:(id)a3
{
  id v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  NSObject *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = CFSTR("AppleTV");
    if ((objc_msgSend(v4, "containsString:", CFSTR("AppleTV")) & 1) == 0)
    {
      v6 = CFSTR("iPhone");
      if ((objc_msgSend(v5, "containsString:", CFSTR("iPhone")) & 1) == 0)
      {
        v6 = CFSTR("iPad");
        if ((objc_msgSend(v5, "containsString:", CFSTR("iPad")) & 1) == 0)
        {
          v6 = CFSTR("Watch");
          if ((objc_msgSend(v5, "containsString:", CFSTR("Watch")) & 1) == 0)
          {
            if ((objc_msgSend(v5, "containsString:", CFSTR("AudioAccessory")) & 1) != 0)
            {
              v6 = CFSTR("HomePod");
            }
            else if (objc_msgSend(v5, "containsString:", CFSTR("Mac")))
            {
              objc_msgSend(a1, "deriveMacDeviceClassForProductType:", v5);
              v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              +[DEDUtils sharedLog](DEDUtils, "sharedLog");
              v8 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
              {
                v10 = 138543362;
                v11 = v5;
                _os_log_impl(&dword_21469E000, v8, OS_LOG_TYPE_INFO, "No deviceClass for product [%{public}@]", (uint8_t *)&v10, 0xCu);
              }

              v6 = &stru_24D1E6AF0;
            }
          }
        }
      }
    }
    v7 = v6;
  }
  else
  {
    v7 = &stru_24D1E6AF0;
  }

  return v7;
}

+ (id)deriveMacDeviceClassForProductType:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  NSObject *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDF8238], "_typeWithDeviceModelCode:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("com.apple."), &stru_24D1E6AF0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "containsString:", CFSTR("macbookpro")) & 1) != 0)
  {
    v7 = CFSTR("MacBookPro");
  }
  else if ((objc_msgSend(v6, "containsString:", CFSTR("macbookair")) & 1) != 0)
  {
    v7 = CFSTR("MacBookAir");
  }
  else if ((objc_msgSend(v6, "containsString:", CFSTR("macbook")) & 1) != 0)
  {
    v7 = CFSTR("MacBook");
  }
  else if ((objc_msgSend(v6, "containsString:", CFSTR("imac")) & 1) != 0)
  {
    v7 = CFSTR("iMac");
  }
  else if ((objc_msgSend(v6, "containsString:", CFSTR("macmini")) & 1) != 0)
  {
    v7 = CFSTR("Macmini");
  }
  else if ((objc_msgSend(v6, "containsString:", CFSTR("macpro")) & 1) != 0)
  {
    v7 = CFSTR("MacPro");
  }
  else if ((objc_msgSend(v6, "containsString:", CFSTR("macstudio")) & 1) != 0)
  {
    v7 = CFSTR("MacStudio");
  }
  else
  {
    +[DEDUtils sharedLog](DEDUtils, "sharedLog");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138543362;
      v11 = v6;
      _os_log_impl(&dword_21469E000, v8, OS_LOG_TYPE_DEFAULT, "No Mac product mapping for [%{public}@]", (uint8_t *)&v10, 0xCu);
    }

    v7 = &stru_24D1E6AF0;
  }

  return (id)v7;
}

+ (id)modelForProductType:(id)a3
{
  id v3;
  void *v4;
  const __CFString *v5;
  NSObject *v6;

  v3 = a3;
  v4 = v3;
  if (!v3)
    goto LABEL_21;
  if ((objc_msgSend(v3, "containsString:", CFSTR("AppleTV")) & 1) != 0)
  {
    v5 = CFSTR("Apple TV");
    goto LABEL_22;
  }
  v5 = CFSTR("iPhone");
  if ((objc_msgSend(v4, "containsString:", CFSTR("iPhone")) & 1) == 0)
  {
    v5 = CFSTR("iPad");
    if ((objc_msgSend(v4, "containsString:", CFSTR("iPad")) & 1) == 0)
    {
      v5 = CFSTR("Watch");
      if ((objc_msgSend(v4, "containsString:", CFSTR("Watch")) & 1) == 0)
      {
        if ((objc_msgSend(v4, "containsString:", CFSTR("AudioAccessory")) & 1) != 0)
        {
          v5 = CFSTR("HomePod");
          goto LABEL_22;
        }
        if ((objc_msgSend(v4, "containsString:", CFSTR("MacBookPro")) & 1) != 0)
        {
          v5 = CFSTR("MacBook Pro");
          goto LABEL_22;
        }
        if ((objc_msgSend(v4, "containsString:", CFSTR("MacBookAir")) & 1) != 0)
        {
          v5 = CFSTR("MacBook Air");
          goto LABEL_22;
        }
        v5 = CFSTR("MacBook");
        if ((objc_msgSend(v4, "containsString:", CFSTR("MacBook")) & 1) == 0)
        {
          v5 = CFSTR("iMac");
          if ((objc_msgSend(v4, "containsString:", CFSTR("iMac")) & 1) == 0)
          {
            if ((objc_msgSend(v4, "containsString:", CFSTR("Macmini")) & 1) != 0)
            {
              v5 = CFSTR("Mac mini");
              goto LABEL_22;
            }
            v5 = CFSTR("MacPro");
            if ((objc_msgSend(v4, "containsString:", CFSTR("MacPro")) & 1) != 0)
              goto LABEL_22;
            +[DEDUtils sharedLog](DEDUtils, "sharedLog");
            v6 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
              +[DEDUtils modelForProductType:].cold.1((uint64_t)v4, v6);

LABEL_21:
            v5 = &stru_24D1E6AF0;
          }
        }
      }
    }
  }
LABEL_22:

  return (id)v5;
}

+ (id)sharedLog
{
  if (sharedLog_onceToken != -1)
    dispatch_once(&sharedLog_onceToken, &__block_literal_global_94);
  return (id)sharedLog_handle;
}

void __21__DEDUtils_sharedLog__block_invoke()
{
  os_log_t v0;
  void *v1;
  id v2;

  +[DEDConfiguration sharedInstance](DEDConfiguration, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = os_log_create((const char *)objc_msgSend(v2, "loggingSubsystem"), "fmw");
  v1 = (void *)sharedLog_handle;
  sharedLog_handle = (uint64_t)v0;

}

+ (id)deviceColor
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  +[DEDUtils checkDefaultsForOverride:](DEDUtils, "checkDefaultsForOverride:", CFSTR("overrideDeviceColor"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = v2;
  else
    v4 = (id)MGCopyAnswer();
  v5 = v4;

  return v5;
}

+ (id)deviceClass
{
  void *v2;
  void *v3;
  __CFString *v4;
  __CFString *v5;

  +[DEDUtils checkDefaultsForOverride:](DEDUtils, "checkDefaultsForOverride:", CFSTR("overrideDeviceClass"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
LABEL_6:
    v5 = v4;
    goto LABEL_7;
  }
  if (!DEDCurrentDeviceIsHomePod())
  {
    v4 = (__CFString *)MGCopyAnswer();
    goto LABEL_6;
  }
  v5 = CFSTR("HomePod");
LABEL_7:

  return v5;
}

+ (id)deviceEnclosureColor
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  +[DEDUtils checkDefaultsForOverride:](DEDUtils, "checkDefaultsForOverride:", CFSTR("overrideDeviceEnclosureColor"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = v2;
  else
    v4 = (id)MGCopyAnswer();
  v5 = v4;

  return v5;
}

+ (id)platform
{
  __CFString *v2;
  __CFString *v3;
  __CFString **v4;
  __CFString *v5;

  +[DEDUtils checkDefaultsForOverride:](DEDUtils, "checkDefaultsForOverride:", CFSTR("overrideDevicePlatform"));
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
  {
    if (DEDCurrentDeviceIsHomePod())
      v4 = DEDDevicePlatformHomePod;
    else
      v4 = DEDDevicePlatformiOS;
    v3 = *v4;
  }
  v5 = v3;

  return v5;
}

+ (id)uniqueDeviceSpecifier
{
  void *v2;
  id v3;

  +[DEDUtils checkDefaultsForOverride:](DEDUtils, "checkDefaultsForOverride:", CFSTR("overrideDeviceSpecifier"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
    v2 = (void *)MGCopyAnswer();
  v3 = v2;

  return v3;
}

+ (id)deviceProductType
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  +[DEDUtils checkDefaultsForOverride:](DEDUtils, "checkDefaultsForOverride:", CFSTR("overrideDeviceProductType"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = v2;
  else
    v4 = (id)MGCopyAnswer();
  v5 = v4;

  return v5;
}

+ (id)deviceModel
{
  void *v2;
  id v3;

  +[DEDUtils checkDefaultsForOverride:](DEDUtils, "checkDefaultsForOverride:", CFSTR("overrideDeviceModel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
    v2 = (void *)MGCopyAnswer();
  v3 = v2;

  return v3;
}

+ (id)deviceName
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  +[DEDUtils checkDefaultsForOverride:](DEDUtils, "checkDefaultsForOverride:", CFSTR("overrideDeviceName"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = v2;
  else
    v4 = (id)MGCopyAnswer();
  v5 = v4;

  return v5;
}

+ (id)osBuild
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  +[DEDUtils checkDefaultsForOverride:](DEDUtils, "checkDefaultsForOverride:", CFSTR("overrideDeviceOSBuild"));
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
  {
    v2 = (__CFString *)MGCopyAnswer();
    v3 = v2;
    if (!v2)
      v2 = CFSTR("Unknown");
  }
  v4 = v2;

  return v4;
}

+ (id)deviceHardwareCodename
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  +[DEDUtils checkDefaultsForOverride:](DEDUtils, "checkDefaultsForOverride:", CFSTR("overrideDeviceHardwareCodename"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v2 = (void *)MGCopyAnswer();
    if ((objc_msgSend(v2, "hasSuffix:", CFSTR("AP")) & 1) != 0)
    {
      v3 = -2;
LABEL_6:
      objc_msgSend(v2, "substringToIndex:", objc_msgSend(v2, "length") + v3);
      v4 = objc_claimAutoreleasedReturnValue();

      v2 = (void *)v4;
      goto LABEL_7;
    }
    if (objc_msgSend(v2, "hasSuffix:", CFSTR("dev")))
    {
      v3 = -3;
      goto LABEL_6;
    }
  }
LABEL_7:
  v5 = v2;

  return v5;
}

+ (int)deviceHomeButtonType
{
  return MGGetSInt32Answer();
}

+ (id)deviceSerialNumber
{
  void *v2;
  id v3;

  +[DEDUtils checkDefaultsForOverride:](DEDUtils, "checkDefaultsForOverride:", CFSTR("overrideDeviceSerialNumber"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
    v2 = (void *)MGCopyAnswer();
  v3 = v2;

  return v3;
}

+ (id)deviceUniformTypeIdentifier
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  +[DEDUtils checkDefaultsForOverride:](DEDUtils, "checkDefaultsForOverride:", CFSTR("overrideDeviceUniformTypeIdentifier"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF8238], "_typeOfCurrentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

+ (BOOL)isInternalInstall
{
  if (isInternalInstall_onceToken != -1)
    dispatch_once(&isInternalInstall_onceToken, &__block_literal_global_148);
  return isInternalInstall__isInternal;
}

void __29__DEDUtils_isInternalInstall__block_invoke()
{
  void *v0;
  id v1;
  NSObject *v2;
  uint8_t v3[16];

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v1 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v1, "cStringUsingEncoding:", 4);
  isInternalInstall__isInternal = os_variant_has_internal_ui();

  if (isInternalInstall__isInternal)
  {
    +[DEDUtils sharedLog](DEDUtils, "sharedLog");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_21469E000, v2, OS_LOG_TYPE_DEFAULT, "DED internal install", v3, 2u);
    }

  }
}

+ (BOOL)isDebugRequestsEnabled
{
  int v2;
  void *v3;
  char v4;

  v2 = objc_msgSend(a1, "isInternalInstall");
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("showDebugRequests"));

    LOBYTE(v2) = v4;
  }
  return v2;
}

+ (BOOL)isDataClassBAvailable
{
  int v2;

  v2 = MKBGetDeviceLockState();
  return !v2 || v2 == 3;
}

+ (id)checkDefaultsForOverride:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (!+[DEDUtils isInternalInstall](DEDUtils, "isInternalInstall"))
    goto LABEL_5;
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5 || (objc_msgSend(v5, "isEqualToString:", &stru_24D1E6AF0) & 1) != 0)
  {

LABEL_5:
    v5 = 0;
    goto LABEL_6;
  }
  +[DEDUtils sharedLog](DEDUtils, "sharedLog");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v3;
    _os_log_impl(&dword_21469E000, v7, OS_LOG_TYPE_DEFAULT, "DED overriding platform value for %@", (uint8_t *)&v8, 0xCu);
  }

LABEL_6:
  return v5;
}

+ (void)modelForProductType:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_21469E000, a2, OS_LOG_TYPE_ERROR, "No model for product [%{public}@]", (uint8_t *)&v2, 0xCu);
}

@end

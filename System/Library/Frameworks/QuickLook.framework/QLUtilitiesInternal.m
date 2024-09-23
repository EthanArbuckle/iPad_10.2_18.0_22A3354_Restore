@implementation QLUtilitiesInternal

+ (NSString)applicationIdentifierEntitlementKey
{
  if (applicationIdentifierEntitlementKey_onceToken != -1)
    dispatch_once(&applicationIdentifierEntitlementKey_onceToken, &__block_literal_global_10);
  return (NSString *)(id)applicationIdentifierEntitlementKey__applicationIdentifierEntitlementKey;
}

void __58__QLUtilitiesInternal_applicationIdentifierEntitlementKey__block_invoke()
{
  void *v0;

  v0 = (void *)applicationIdentifierEntitlementKey__applicationIdentifierEntitlementKey;
  applicationIdentifierEntitlementKey__applicationIdentifierEntitlementKey = (uint64_t)CFSTR("application-identifier");

}

+ (id)getCurrentApplicationBundleIdentifier
{
  void *v2;
  void *v3;
  NSObject **v4;
  NSObject *v5;
  uint8_t v7[16];

  +[QLUtilitiesInternal getCurrentApplicationBundleIdentifierUsingEntitlement](QLUtilitiesInternal, "getCurrentApplicationBundleIdentifierUsingEntitlement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bundleIdentifier");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = (NSObject **)MEMORY[0x24BE7BF48];
    v5 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      QLSInitLogging();
      v5 = *v4;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_20D4F5000, v5, OS_LOG_TYPE_ERROR, "Could not obtain current application bundle identifier #Generic", v7, 2u);
    }
  }
  return v2;
}

+ (id)getCurrentApplicationBundleIdentifierUsingEntitlement
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _QLGetStringEntitlement(CFSTR("application-identifier"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "processName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[QLUtilitiesInternal appIdentifierFromTeamAppTuple:processName:](QLUtilitiesInternal, "appIdentifierFromTeamAppTuple:processName:", v2, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)currentAppIsAppleApp
{
  void *v2;
  char v3;

  +[QLUtilitiesInternal getCurrentApplicationBundleIdentifierUsingEntitlement](QLUtilitiesInternal, "getCurrentApplicationBundleIdentifierUsingEntitlement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasPrefix:", CFSTR("com.apple."));

  return v3;
}

+ (BOOL)deviceIsLocked
{
  void *v2;
  char v3;

  v2 = (void *)MGCopyAnswer();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

+ (id)appIdentifierFromTeamAppTuple:(id)a3 processName:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;

  v5 = a3;
  v6 = a4;
  if (appIdentifierFromTeamAppTuple_processName__onceToken != -1)
    dispatch_once(&appIdentifierFromTeamAppTuple_processName__onceToken, &__block_literal_global_8);
  if (objc_msgSend(v5, "hasPrefix:", CFSTR("com.apple.")))
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend((id)appIdentifierFromTeamAppTuple_processName____regex, "matchesInString:options:range:", v5, 0, 0, objc_msgSend(v5, "length"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    if (objc_msgSend(v8, "count") == 1)
    {
      objc_msgSend(v8, "objectAtIndex:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 0;
      if (objc_msgSend(v9, "numberOfRanges") == 2)
      {
        v10 = objc_msgSend(v9, "rangeAtIndex:", 1);
        objc_msgSend(v5, "substringWithRange:", v10, v11);
        v7 = (id)objc_claimAutoreleasedReturnValue();
      }

    }
  }

  return v7;
}

void __65__QLUtilitiesInternal_appIdentifierFromTeamAppTuple_processName___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1798]), "initWithPattern:options:error:", CFSTR("[0-9,A-Z]{10}\\.(.*)"), 0, 0);
  v1 = (void *)appIdentifierFromTeamAppTuple_processName____regex;
  appIdentifierFromTeamAppTuple_processName____regex = v0;

}

@end

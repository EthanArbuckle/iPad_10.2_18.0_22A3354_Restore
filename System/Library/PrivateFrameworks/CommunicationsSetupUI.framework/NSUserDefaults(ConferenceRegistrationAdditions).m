@implementation NSUserDefaults(ConferenceRegistrationAdditions)

+ (uint64_t)setCNFObject:()ConferenceRegistrationAdditions forKey:
{
  return objc_msgSend(a1, "_IMSetObject:forKey:inDomain:", a3, a4, CFSTR("com.apple.conference"));
}

+ (uint64_t)CNFObjectForKey:()ConferenceRegistrationAdditions
{
  return objc_msgSend(a1, "_IMObjectForKey:inDomain:", a3, CFSTR("com.apple.conference"));
}

+ (void)setShouldShowCNFRegistrationSettingsUI:()ConferenceRegistrationAdditions
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setCNFObject:forKey:", v2, CFSTR("CNFRegShowRegistrationSettingsUI"));

}

+ (uint64_t)shouldShowCNFRegistrationSettingsUI
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "CNFObjectForKey:", CFSTR("CNFRegShowRegistrationSettingsUI"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

+ (uint64_t)CNFRegEmailValidationTimeout
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "CNFObjectForKey:", CFSTR("registration.emailValidationTimeout"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "unsignedIntegerValue");

  return v2;
}

+ (void)setCNFRegEmailValidationTimeout:()ConferenceRegistrationAdditions
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setCNFObject:forKey:", v2, CFSTR("registration.emailValidationTimeout"));

}

+ (uint64_t)CNFRegSavedAccountName
{
  return objc_msgSend(a1, "CNFObjectForKey:", CFSTR("registration.savedAccountName"));
}

+ (uint64_t)setCNFRegSavedAccountName:()ConferenceRegistrationAdditions
{
  return objc_msgSend(a1, "setCNFObject:forKey:", a3, CFSTR("registration.savedAccountName"));
}

+ (uint64_t)setCNFRegServerURLOverride:()ConferenceRegistrationAdditions
{
  return objc_msgSend(a1, "setCNFObject:forKey:", a3, CFSTR("registration.serverPageURLOverride"));
}

+ (uint64_t)CNFRegServerURLOverride
{
  return objc_msgSend(a1, "CNFObjectForKey:", CFSTR("registration.serverPageURLOverride"));
}

+ (void)setShouldShowCNFRegistrationServerLogs:()ConferenceRegistrationAdditions
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setCNFObject:forKey:", v2, CFSTR("registration.showServerWebPageLogging"));

}

+ (uint64_t)shouldShowCNFRegistrationServerLogs
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "CNFObjectForKey:", CFSTR("registration.showServerWebPageLogging"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

@end

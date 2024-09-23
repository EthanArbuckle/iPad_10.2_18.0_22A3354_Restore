@implementation CDPUIDeviceToDeviceEncryptionIneligibilityAlertViewModel

- (id)title
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[CDPUIDeviceToDeviceEncryptionMessagingViewModel context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "featureName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("D2DENCRYPTION_INELIGIBLE_TITLE_WITH_FEATURE"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPUIDeviceToDeviceEncryptionMessagingViewModel context](self, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "featureName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithValidatedFormat:validFormatSpecifiers:error:", v7, CFSTR("%@"), 0, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("D2DENCRYPTION_INELIGIBLE_TITLE"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (id)message
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x24BE0AC98], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPUIDeviceToDeviceEncryptionMessagingViewModel context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "altDSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "authKitAccountWithAltDSID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BDD17C8];
  v8 = (void *)MEMORY[0x24BE1A458];
  v9 = CFSTR("D2DENCRYPTION_INELIGIBLE_MESSAGE");
  if ((objc_msgSend(CFSTR("D2DENCRYPTION_INELIGIBLE_MESSAGE"), "containsString:", CFSTR("REBRAND")) & 1) != 0
    || !_os_feature_enabled_impl())
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(CFSTR("D2DENCRYPTION_INELIGIBLE_MESSAGE"), "stringByAppendingString:", CFSTR("_REBRAND"));
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v10 = 1;
  }
  objc_msgSend(v8, "builderForKey:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "username");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithValidatedFormat:validFormatSpecifiers:error:", v12, CFSTR("%@"), 0, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  return v14;
}

- (id)continueTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("OK"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end

@implementation CDPUIDeviceToDeviceEncryptionCreatePasscodeViewModel

- (id)title
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("D2DENCRYPTION_CREATE_SECRET_TITLE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSecretType:", -[CDPUIDeviceToDeviceEncryptionCreatePasscodeViewModel _localSecretType](self, "_localSecretType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1A448], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deviceClass");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addDeviceClass:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)message
{
  void *v3;
  uint64_t v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[CDPUIDeviceToDeviceEncryptionMessagingViewModel context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "deviceToDeviceEncryptionUpgradeType");

  if (v4 == 1)
    v5 = CFSTR("D2DENCRYPTION_2FA_CREATE_SECRET_MESSAGE");
  else
    v5 = CFSTR("D2DENCRYPTION_CREATE_SECRET_MESSAGE");
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSecretType:", -[CDPUIDeviceToDeviceEncryptionCreatePasscodeViewModel _localSecretType](self, "_localSecretType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1A448], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deviceClass");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addDeviceClass:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (unint64_t)_localSecretType
{
  return 1;
}

@end

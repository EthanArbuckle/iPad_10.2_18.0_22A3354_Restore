@implementation CDPUIDeviceToDeviceEncryptionCancelCreateViewModel

- (id)title
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("D2DENCRYPTION_CANCEL_CREATE_SECRET_TITLE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSecretType:", -[CDPUIDeviceToDeviceEncryptionCancelCreateViewModel _localSecretType](self, "_localSecretType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)message
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = -[CDPUIDeviceToDeviceEncryptionCancelCreateViewModel _localSecretType](self, "_localSecretType");
  -[CDPUIDeviceToDeviceEncryptionMessagingViewModel context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "featureName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("D2DENCRYPTION_CANCEL_CREATE_SECRET_MESSAGE_WITH_FEATURE"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1A448], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deviceClass");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addDeviceClass:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSecretType:", v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPUIDeviceToDeviceEncryptionMessagingViewModel context](self, "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "featureName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithValidatedFormat:validFormatSpecifiers:error:", v12, CFSTR("%@"), 0, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("D2DENCRYPTION_CANCEL_CREATE_SECRET_MESSAGE"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1A448], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deviceClass");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addDeviceClass:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSecretType:", v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (id)continueTitle
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("D2DENCRYPTION_CANCEL_DONT_USE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSecretType:", -[CDPUIDeviceToDeviceEncryptionCancelCreateViewModel _localSecretType](self, "_localSecretType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)cancelTitle
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("D2DENCRYPTION_CANCEL_CREATE_SECRET"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSecretType:", -[CDPUIDeviceToDeviceEncryptionCancelCreateViewModel _localSecretType](self, "_localSecretType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)_localSecretType
{
  return 1;
}

@end

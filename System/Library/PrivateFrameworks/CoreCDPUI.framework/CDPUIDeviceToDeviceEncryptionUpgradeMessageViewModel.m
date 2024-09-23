@implementation CDPUIDeviceToDeviceEncryptionUpgradeMessageViewModel

- (id)title
{
  void *v3;
  uint64_t v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  -[CDPUIDeviceToDeviceEncryptionMessagingViewModel context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "deviceToDeviceEncryptionUpgradeType");

  if (v4 == 1)
    goto LABEL_7;
  if (-[CDPUIDeviceToDeviceEncryptionMessagingViewModel is2FA](self, "is2FA")
    && !-[CDPUIDeviceToDeviceEncryptionMessagingViewModel hasLocalSecret](self, "hasLocalSecret"))
  {
    -[CDPUIDeviceToDeviceEncryptionUpgradeMessageViewModel _stringWithFeatureIfNeeded:](self, "_stringWithFeatureIfNeeded:", CFSTR("D2DENCRYPTION_UPGRADE_TITLE_UPGRADE_MISSING_SECRET"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1A448], "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "deviceClass");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addDeviceClass:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addSecretType:", -[CDPUIDeviceToDeviceEncryptionUpgradeMessageViewModel _localSecretType](self, "_localSecretType"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[CDPUIDeviceToDeviceEncryptionUpgradeMessageViewModel _stringWithFeatureSubstituted:](self, "_stringWithFeatureSubstituted:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (-[CDPUIDeviceToDeviceEncryptionMessagingViewModel is2FA](self, "is2FA")
    && -[CDPUIDeviceToDeviceEncryptionMessagingViewModel hasLocalSecret](self, "hasLocalSecret"))
  {
    v5 = CFSTR("D2DENCRYPTION_UPGRADE_TITLE_ONLY_MISSING_SECRET");
  }
  else
  {
LABEL_7:
    v5 = CFSTR("D2DENCRYPTION_UPGRADE_TITLE");
  }
  -[CDPUIDeviceToDeviceEncryptionUpgradeMessageViewModel _stringWithFeatureIfNeeded:](self, "_stringWithFeatureIfNeeded:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPUIDeviceToDeviceEncryptionUpgradeMessageViewModel _stringWithFeatureSubstituted:](self, "_stringWithFeatureSubstituted:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v9;
}

- (id)message
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
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
  void *v16;

  -[CDPUIDeviceToDeviceEncryptionMessagingViewModel context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "deviceToDeviceEncryptionUpgradeType");

  if (v4 != 1)
  {
    if (-[CDPUIDeviceToDeviceEncryptionMessagingViewModel is2FA](self, "is2FA")
      && !-[CDPUIDeviceToDeviceEncryptionMessagingViewModel hasLocalSecret](self, "hasLocalSecret"))
    {
      objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("D2DENCRYPTION_UPGRADE_MESSAGE_NO_UPGRADE_MISSING_SECRET"));
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE1A448], "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "deviceClass");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString addDeviceClass:](v5, "addDeviceClass:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addSecretType:", -[CDPUIDeviceToDeviceEncryptionUpgradeMessageViewModel _localSecretType](self, "_localSecretType"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!-[CDPUIDeviceToDeviceEncryptionMessagingViewModel is2FA](self, "is2FA")
        || !-[CDPUIDeviceToDeviceEncryptionMessagingViewModel hasLocalSecret](self, "hasLocalSecret"))
      {
        objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("D2DENCRYPTION_UPGRADE_MESSAGE_UPGRADE_MISSING_SECRET"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addSecretType:", -[CDPUIDeviceToDeviceEncryptionUpgradeMessageViewModel _localSecretType](self, "_localSecretType"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BE1A448], "sharedInstance");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "deviceClass");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addDeviceClass:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "localizedString");
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", v5);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "localizedString");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

        goto LABEL_15;
      }
      v5 = CFSTR("D2DENCRYPTION_UPGRADE_MESSAGE_ONLY_MISSING_SECRET");
      if ((objc_msgSend(CFSTR("D2DENCRYPTION_UPGRADE_MESSAGE_ONLY_MISSING_SECRET"), "containsString:", CFSTR("REBRAND")) & 1) == 0&& _os_feature_enabled_impl())
      {
        objc_msgSend(CFSTR("D2DENCRYPTION_UPGRADE_MESSAGE_ONLY_MISSING_SECRET"), "stringByAppendingString:", CFSTR("_REBRAND"));
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE1A448], "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "deviceClass");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addDeviceClass:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v16 = v10;
    objc_msgSend(v10, "localizedString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("D2DENCRYPTION_UPGRADE_MESSAGE"));
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  -[__CFString localizedString](v5, "localizedString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

  return v6;
}

- (id)continueTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("D2DENCRYPTION_CONTINUE"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)cancelTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("D2DENCRYPTION_CANCEL"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_stringWithFeatureIfNeeded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  -[CDPUIDeviceToDeviceEncryptionMessagingViewModel context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "featureName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "stringByAppendingString:", CFSTR("_WITH_FEATURE"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v4;
  }
  v8 = v7;

  return v8;
}

- (id)_stringWithFeatureSubstituted:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[CDPUIDeviceToDeviceEncryptionMessagingViewModel context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "featureName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)MEMORY[0x24BDD17C8];
    -[CDPUIDeviceToDeviceEncryptionMessagingViewModel context](self, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "featureName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithValidatedFormat:validFormatSpecifiers:error:", v4, CFSTR("%@"), 0, v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = v4;
  }

  return v10;
}

- (unint64_t)_localSecretType
{
  return 1;
}

@end

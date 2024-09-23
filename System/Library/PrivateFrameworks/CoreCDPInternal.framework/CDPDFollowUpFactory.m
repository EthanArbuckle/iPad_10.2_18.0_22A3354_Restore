@implementation CDPDFollowUpFactory

+ (id)contextToIdentifierMap
{
  if (contextToIdentifierMap_onceToken != -1)
    dispatch_once(&contextToIdentifierMap_onceToken, &__block_literal_global_6);
  return (id)contextToIdentifierMap_contextMap;
}

void __45__CDPDFollowUpFactory_contextToIdentifierMap__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[11];
  _QWORD v9[12];

  v9[11] = *MEMORY[0x24BDAC8D0];
  v0 = *MEMORY[0x24BE04838];
  v1 = *MEMORY[0x24BE1A390];
  v8[0] = *MEMORY[0x24BE1A3C0];
  v8[1] = v1;
  v9[0] = v0;
  v9[1] = CFSTR("OfflineLocalSecretChange");
  v2 = *MEMORY[0x24BE1A3B0];
  v8[2] = *MEMORY[0x24BE1A3A0];
  v8[3] = v2;
  v9[2] = CFSTR("RegenerateCDPRecoveryKey");
  v9[3] = CFSTR("com.apple.purplebuddy.revisitSkippedSteps");
  v3 = *MEMORY[0x24BE1A388];
  v8[4] = *MEMORY[0x24BE1A3A8];
  v8[5] = v3;
  v9[4] = CFSTR("SecureTerms");
  v9[5] = CFSTR("ConfirmExistingSecret");
  v4 = *MEMORY[0x24BE1A3B8];
  v8[6] = *MEMORY[0x24BE1A3C8];
  v8[7] = v4;
  v9[6] = CFSTR("OfflineLocalSecretChange");
  v9[7] = CFSTR("SOSCompatibilityMode");
  v5 = *MEMORY[0x24BE1A380];
  v8[8] = *MEMORY[0x24BE1A398];
  v8[9] = v5;
  v9[8] = CFSTR("com.apple.AAFollowUpIdentifier.RecoveryKeyMismatch");
  v9[9] = CFSTR("adpUpsell");
  v8[10] = *MEMORY[0x24BE1A378];
  v9[10] = CFSTR("com.apple.CDPFollowUpIdentifier.adpStateHealing");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 11);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)contextToIdentifierMap_contextMap;
  contextToIdentifierMap_contextMap = v6;

}

- (id)identifierForContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "followUpType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend((id)objc_opt_class(), "contextToIdentifierMap");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "followUpType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)followUpItemWithContext:(id)a3
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  void *v20;
  int v21;
  void *v22;
  int v23;
  void *v24;
  int v25;
  void *v26;
  int v27;
  void *v28;
  int v29;

  v4 = a3;
  objc_msgSend(v4, "followUpType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BE1A3C0]);

  if (v6)
  {
    -[CDPDFollowUpFactory _followUpForRepairWithContext:](self, "_followUpForRepairWithContext:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_26:
    v11 = (void *)v7;
    goto LABEL_27;
  }
  v8 = (void *)MEMORY[0x24BE1A3D0];
  objc_msgSend(v4, "altDSID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v8, "checkIfAltDSIDIsBeneficiary:", v9);

  if ((_DWORD)v8)
  {
    _CDPLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CDPDFollowUpFactory followUpItemWithContext:].cold.1();

  }
  else
  {
    objc_msgSend(v4, "followUpType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BE1A390]);

    if (v13)
    {
      -[CDPDFollowUpFactory _followUpForOfflineSecretChangeWithContext:](self, "_followUpForOfflineSecretChangeWithContext:", v4);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    }
    objc_msgSend(v4, "followUpType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToString:", *MEMORY[0x24BE1A3A0]);

    if (v15)
    {
      -[CDPDFollowUpFactory _followUpForRecoveryKeyRepairWithContext:](self, "_followUpForRecoveryKeyRepairWithContext:", v4);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    }
    objc_msgSend(v4, "followUpType");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqualToString:", *MEMORY[0x24BE1A3B0]);

    if (v17)
    {
      -[CDPDFollowUpFactory _followUpForSettingUpBiometricsWithContext:](self, "_followUpForSettingUpBiometricsWithContext:", v4);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    }
    objc_msgSend(v4, "followUpType");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isEqualToString:", *MEMORY[0x24BE1A3A8]);

    if (v19)
    {
      -[CDPDFollowUpFactory _followUpForSecureTermsWithContext:](self, "_followUpForSecureTermsWithContext:", v4);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    }
    objc_msgSend(v4, "followUpType");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isEqualToString:", *MEMORY[0x24BE1A388]);

    if (v21)
    {
      -[CDPDFollowUpFactory _followUpForConfirmExistingSecretWithContext:](self, "_followUpForConfirmExistingSecretWithContext:", v4);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    }
    objc_msgSend(v4, "followUpType");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "isEqualToString:", *MEMORY[0x24BE1A3C8]);

    if (v23)
    {
      -[CDPDFollowUpFactory _followUpItemForWalrusCreatePasscodeWithContext:](self, "_followUpItemForWalrusCreatePasscodeWithContext:", v4);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    }
    objc_msgSend(v4, "followUpType");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "isEqualToString:", *MEMORY[0x24BE1A3B8]);

    if (v25)
    {
      -[CDPDFollowUpFactory _followUpItemForSOSCompatibilityMode:](self, "_followUpItemForSOSCompatibilityMode:", v4);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    }
    objc_msgSend(v4, "followUpType");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "isEqualToString:", *MEMORY[0x24BE1A398]);

    if (v27)
    {
      -[CDPDFollowUpFactory _followUpItemForRecoveryKeyMismatchHealing:](self, "_followUpItemForRecoveryKeyMismatchHealing:", v4);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    }
    objc_msgSend(v4, "followUpType");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "isEqualToString:", *MEMORY[0x24BE1A378]);

    if (v29)
    {
      -[CDPDFollowUpFactory _followUpForADPStateHealingWithContext:](self, "_followUpForADPStateHealingWithContext:", v4);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    }
  }
  v11 = 0;
LABEL_27:

  return v11;
}

- (id)_followUpForOfflineSecretChangeWithContext:(id)a3
{
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x24BDAC8D0];
  -[CDPDFollowUpFactory _baseFollowUpItemWithContext:](self, "_baseFollowUpItemWithContext:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPDFollowUpFactory _offlineSecretChangeFollowUpAction](self, "_offlineSecretChangeFollowUpAction");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v32;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setActions:", v5);

  objc_msgSend(v4, "notification");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPDFollowUpFactory _offlineSecretChangeFollowUpAction](self, "_offlineSecretChangeFollowUpAction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActivateAction:", v7);

  objc_msgSend(v6, "setFirstNotificationDelay:", 0.0);
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("CONFIRM_NEW_SECRET_FOLLOWUP_ITEM_TITLE"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1A448], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deviceClass");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addDeviceClass:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSecretType:", -[CDPDFollowUpFactory secretType](self, "secretType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v13);

  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("CONFIRM_NEW_SECRET_FOLLOWUP_ITEM_INFORMATIVE"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1A448], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "deviceClass");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addDeviceClass:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInformativeText:", v18);

  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("CONFIRM_NEW_SECRET_FOLLOWUP_NOTIFICATION_TITLE"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1A448], "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "deviceClass");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addDeviceClass:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addSecretType:", -[CDPDFollowUpFactory secretType](self, "secretType"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "localizedString");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v24);

  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("CONFIRM_NEW_SECRET_FOLLOWUP_NOTIFICATION_INFORMATIVE"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1A448], "sharedInstance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "deviceClass");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addDeviceClass:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addSecretType:", -[CDPDFollowUpFactory secretType](self, "secretType"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "localizedString");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInformativeText:", v30);

  return v4;
}

- (id)_offlineSecretChangeFollowUpAction
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(MEMORY[0x24BE1B3A0]);
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("CONFIRM_NEW_SECRET_FOLLOWUP_NOTIFICATION_ACTIVATE_LABEL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLabel:", v4);

  objc_msgSend(v2, "setIdentifier:", CFSTR("com.apple.cdp.offlinesecret.continue"));
  return v2;
}

- (id)_followUpForSecureTermsWithContext:(id)a3
{
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  -[CDPDFollowUpFactory _baseFollowUpItemWithContext:](self, "_baseFollowUpItemWithContext:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPDFollowUpFactory _secureTermsFollowUpAction](self, "_secureTermsFollowUpAction");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v23;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setActions:", v5);

  objc_msgSend(v4, "notification");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPDFollowUpFactory _secureTermsFollowUpAction](self, "_secureTermsFollowUpAction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActivateAction:", v7);

  objc_msgSend(v6, "setFirstNotificationDelay:", 0.0);
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("SECURE_TERMS_FOLLOWUP_ITEM_TITLE"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v9);

  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("SECURE_TERMS_FOLLOWUP_ITEM_INFORMATIVE"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1A448], "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "deviceClass");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addDeviceClass:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInformativeText:", v14);

  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("SECURE_TERMS_FOLLOWUP_ITEM_TITLE"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v16);

  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("SECURE_TERMS_FOLLOWUP_NOTIFICATION_INFORMATIVE"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1A448], "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "deviceClass");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addDeviceClass:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "localizedString");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInformativeText:", v21);

  return v4;
}

- (id)_secureTermsFollowUpAction
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(MEMORY[0x24BE1B3A0]);
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("SECURE_TERMS_FOLLOWUP_NOTIFICATION_ACTIVATE_LABEL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLabel:", v4);

  objc_msgSend(v2, "setIdentifier:", CFSTR("com.apple.cdp.secureterms.continue"));
  return v2;
}

- (id)_followUpForConfirmExistingSecretWithContext:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  -[CDPDFollowUpFactory _baseFollowUpItemWithContext:](self, "_baseFollowUpItemWithContext:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPDFollowUpFactory _confirmExistingSecretFollowUpAction](self, "_confirmExistingSecretFollowUpAction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setActions:", v6);

  objc_msgSend(v4, "notification");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPDFollowUpFactory _confirmExistingSecretFollowUpAction](self, "_confirmExistingSecretFollowUpAction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActivateAction:", v8);

  objc_msgSend(v7, "setFirstNotificationDelay:", 0.0);
  -[CDPDFollowUpFactory _configureConfirmExistingSecretFollowUpItem:](self, "_configureConfirmExistingSecretFollowUpItem:", v4);

  return v4;
}

- (id)_confirmExistingSecretFollowUpAction
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x24BE1B3A0]);
  if (-[CDPDFollowUpFactory _isWalrusEnabled](self, "_isWalrusEnabled"))
    objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:inTable:", CFSTR("FOLLOWUP_VERIFY_PASSCODE"), CFSTR("Localizable-Walrus"));
  else
    objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("CONFIRM_EXISTING_SECRET_FOLLOWUP_NOTIFICATION_ACTIVATE_LABEL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLabel:", v5);

  objc_msgSend(v3, "setIdentifier:", CFSTR("com.apple.cdp.confirmexistingsecret.continue"));
  return v3;
}

- (void)_configureConfirmExistingSecretFollowUpItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "notification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:inTable:", CFSTR("FOLLOWUP_VERIFY_PASSCODE_TITLE"), CFSTR("Localizable-Walrus"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v6);

  v7 = (void *)MEMORY[0x24BE1A458];
  v8 = CFSTR("FOLLOWUP_VERIFY_PASSCODE_MESSAGE");
  if ((objc_msgSend(CFSTR("FOLLOWUP_VERIFY_PASSCODE_MESSAGE"), "containsString:", CFSTR("REBRAND")) & 1) != 0
    || !_os_feature_enabled_impl())
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(CFSTR("FOLLOWUP_VERIFY_PASSCODE_MESSAGE"), "stringByAppendingString:", CFSTR("_REBRAND"));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v9 = 1;
  }
  objc_msgSend(v7, "builderForKey:inTable:", v8, CFSTR("Localizable-Walrus"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInformativeText:", v11);

  if (v9)
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:inTable:", CFSTR("FOLLOWUP_VERIFY_PASSCODE_NOTIFICATION_TITLE"), CFSTR("Localizable-Walrus"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v13);

  v14 = (void *)MEMORY[0x24BE1A458];
  v15 = CFSTR("FOLLOWUP_VERIFY_PASSCODE_NOTIFICATION_MESSAGE");
  if ((objc_msgSend(CFSTR("FOLLOWUP_VERIFY_PASSCODE_NOTIFICATION_MESSAGE"), "containsString:", CFSTR("REBRAND")) & 1) != 0
    || !_os_feature_enabled_impl())
  {
    v16 = 0;
  }
  else
  {
    objc_msgSend(CFSTR("FOLLOWUP_VERIFY_PASSCODE_NOTIFICATION_MESSAGE"), "stringByAppendingString:", CFSTR("_REBRAND"));
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v16 = 1;
  }
  objc_msgSend(v14, "builderForKey:inTable:", v15, CFSTR("Localizable-Walrus"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInformativeText:", v18);

  if (v16)
  objc_msgSend(v4, "options");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = *MEMORY[0x24BE1B348];
  v23[0] = *MEMORY[0x24BE1B358];
  v23[1] = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setByAddingObjectsFromArray:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOptions:", v22);

}

- (id)_followUpItemForWalrusCreatePasscodeWithContext:(id)a3
{
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
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _QWORD v22[2];
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  -[CDPDFollowUpFactory _baseFollowUpItemWithContext:](self, "_baseFollowUpItemWithContext:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPDFollowUpFactory _createPasscodeFollowUpAction](self, "_createPasscodeFollowUpAction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setActions:", v6);

  objc_msgSend(v4, "notification");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPDFollowUpFactory _createPasscodeNoteFollowUpAction](self, "_createPasscodeNoteFollowUpAction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActivateAction:", v8);

  objc_msgSend(v7, "setFirstNotificationDelay:", 0.0);
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:inTable:", CFSTR("FOLLOWUP_CREATE_PASSCODE_TITLE"), CFSTR("Localizable-Walrus"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v10);

  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:inTable:", CFSTR("FOLLOWUP_CREATE_PASSCODE_MESSAGE"), CFSTR("Localizable-Walrus"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInformativeText:", v12);

  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:inTable:", CFSTR("FOLLOWUP_CREATE_PASSCODE_NOTIFICATION_TITLE"), CFSTR("Localizable-Walrus"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:", v14);

  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:inTable:", CFSTR("FOLLOWUP_CREATE_PASSCODE_NOTIFICATION_MESSAGE"), CFSTR("Localizable-Walrus"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setInformativeText:", v16);

  objc_msgSend(v7, "options");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *MEMORY[0x24BE1B348];
  v22[0] = *MEMORY[0x24BE1B358];
  v22[1] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setByAddingObjectsFromArray:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setOptions:", v20);

  return v4;
}

- (id)_followUpItemForSOSCompatibilityMode:(id)a3
{
  void *v3;
  id v4;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  -[CDPDFollowUpFactory _baseFollowUpItemWithContext:](self, "_baseFollowUpItemWithContext:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x24BE1B3A0]);
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("FOLLOWUP_SOS_COMPATIBILITY_BUTTON_PRIMARY"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLabel:", v6);

  objc_msgSend(v4, "setIdentifier:", CFSTR("com.apple.cdp.sos.compatibility.enabled.continue"));
  v21[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setActions:", v7);

  objc_msgSend(v3, "notification");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFirstNotificationDelay:", 0.0);
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("FOLLOWUP_SOS_COMPATIBILITY_TITLE"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v10);

  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("FOLLOWUP_SOS_COMPATIBILITY_MESSAGE"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1A448], "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "deviceClass");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addDeviceClass:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInformativeText:", v15);

  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("FOLLOWUP_SOS_COMPATIBILITY_NOTIFICATION_TITLE"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:", v17);

  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("FOLLOWUP_SOS_COMPATIBILITY_NOTIFICATION_MESSAGE"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setInformativeText:", v19);

  return v3;
}

- (id)_followUpItemForRecoveryKeyMismatchHealing:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  CDPDAccount *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;

  objc_msgSend(a3, "altDSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BE1A3D0], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "primaryAccountAltDSID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CDPDFollowUpFactory _isWalrusEnabled](self, "_isWalrusEnabled"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("hasWalrusEnabled"));

  v8 = objc_alloc_init(CDPDAccount);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CDPDAccount recoveryContactCountForAltDSID:](v8, "recoveryContactCountForAltDSID:", v4) != 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("hasRecoveryContact"));

  objc_msgSend(v6, "setObject:forKeyedSubscript:", v4, *MEMORY[0x24BE04858]);
  objc_msgSend(MEMORY[0x24BE1A3D0], "appleAccountForAltDSID:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, *MEMORY[0x24BE04850]);

  v12 = objc_alloc_init(MEMORY[0x24BE049A0]);
  objc_msgSend(v12, "followUpItemForIdentifier:userInfo:", CFSTR("com.apple.AAFollowUpIdentifier.RecoveryKeyMismatch"), v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_createPasscodeFollowUpAction
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(MEMORY[0x24BE1B3A0]);
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:inTable:", CFSTR("FOLLOWUP_CREATE_PASSCODE"), CFSTR("Localizable-Walrus"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLabel:", v4);

  objc_msgSend(v2, "setIdentifier:", CFSTR("com.apple.cdp.offlinesecretcreate.continue"));
  return v2;
}

- (id)_createPasscodeNoteFollowUpAction
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(MEMORY[0x24BE1B3A0]);
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:inTable:", CFSTR("FOLLOWUP_CREATE_PASSCODE_BUTTON_PRIMARY"), CFSTR("Localizable-Walrus"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLabel:", v4);

  objc_msgSend(v2, "setIdentifier:", CFSTR("com.apple.cdp.offlinesecretcreate.continue"));
  return v2;
}

- (id)_createPasscodeDismissNoteFollowUpAction
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(MEMORY[0x24BE1B3A0]);
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:inTable:", CFSTR("FOLLOWUP_VERIFY_PASSCODE_BUTTON_DISMISS"), CFSTR("Localizable-Walrus"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLabel:", v4);

  objc_msgSend(v2, "setIdentifier:", CFSTR("com.apple.cdp.dismissfollowup"));
  return v2;
}

- (id)_followUpForRepairWithContext:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v43;

  v4 = a3;
  objc_msgSend(v4, "altDSID");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        v7 = (void *)MEMORY[0x24BE1A3D0],
        objc_msgSend(v4, "altDSID"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        LODWORD(v7) = objc_msgSend(v7, "checkIfAltDSIDIsBeneficiary:", v8),
        v8,
        v6,
        (_DWORD)v7))
  {
    objc_msgSend(v4, "altDSID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[CDPDFollowUpFactory _isManateeAvailableForAltDSID:](self, "_isManateeAvailableForAltDSID:", v9);

    if (v10)
    {
      _CDPLogSystem();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        goto LABEL_9;
      goto LABEL_10;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE1A3D0], "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "primaryAccountIsBeneficiary");

    if (v13 && -[CDPDFollowUpFactory _isManateeAvailable](self, "_isManateeAvailable"))
    {
      _CDPLogSystem();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
LABEL_9:
        -[CDPDFollowUpFactory _followUpForRepairWithContext:].cold.1();
LABEL_10:

      v14 = 0;
      goto LABEL_21;
    }
  }
  v15 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v4, "altDSID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    objc_msgSend(MEMORY[0x24BE1A3D0], "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "primaryAccountAltDSID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, *MEMORY[0x24BE04858]);
  objc_msgSend(MEMORY[0x24BE1A3D0], "appleAccountForAltDSID:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v19, *MEMORY[0x24BE04850]);

  v20 = objc_alloc_init(MEMORY[0x24BE049A0]);
  objc_msgSend(v20, "followUpItemForIdentifier:userInfo:", *MEMORY[0x24BE04838], v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[CDPDFollowUpFactory _baseFollowUpNotificationWithContext:](self, "_baseFollowUpNotificationWithContext:", v4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setNotification:", v21);

  objc_msgSend(v14, "actions");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "firstObject");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "identifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)*MEMORY[0x24BE04828];

  if (v24 == v25)
  {
    objc_msgSend(v4, "repairType");
    CDPLocalizedString();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setLabel:", v26);

  }
  objc_msgSend(v14, "notification");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setActivateAction:", v23);
  if (objc_msgSend(v4, "repairType") == 1)
  {
    objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("TRUST_FOLLOWUP_ITEM_TITLE"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "localizedString");
    v43 = v15;
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTitle:", v29);

    objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("TRUST_FOLLOWUP_NOTIFICATION_TITLE"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "localizedString");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setTitle:", v31);

    objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("TRUST_FOLLOWUP_ITEM_INFORMATIVE"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1A448], "sharedInstance");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "deviceClass");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addDeviceClass:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "localizedString");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setInformativeText:", v36);

    objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("TRUST_FOLLOWUP_NOTIFICATION_INFORMATIVE"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1A448], "sharedInstance");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "deviceClass");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addDeviceClass:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "localizedString");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setInformativeText:", v41);

    v15 = v43;
  }
  else if (-[CDPDFollowUpFactory _isWalrusEnabled](self, "_isWalrusEnabled"))
  {
    -[CDPDFollowUpFactory _configureWalrusRepairFollowUpItem:](self, "_configureWalrusRepairFollowUpItem:", v14);
  }
  else
  {
    -[CDPDFollowUpFactory _configureRepairFollowUpItem:](self, "_configureRepairFollowUpItem:", v14);
  }

LABEL_21:
  return v14;
}

- (void)_configureRepairFollowUpItem:(id)a3
{
  id v3;
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
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "notification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("SKIPPED_FOLLOWUP_ITEM_TITLE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v6);

  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("SKIPPED_FOLLOWUP_ITEM_INFORMATIVE"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInformativeText:", v8);

  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("SKIPPED_FOLLOWUP_NOTIFICATION_TITLE"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v10);

  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("SKIPPED_FOLLOWUP_NOTIFICATION_INFORMATIVE"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInformativeText:", v12);

  objc_msgSend(v4, "options");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x24BE1B348];
  v17[0] = *MEMORY[0x24BE1B358];
  v17[1] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setByAddingObjectsFromArray:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOptions:", v16);

}

- (void)_configureWalrusRepairFollowUpItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "notification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:inTable:", CFSTR("FOLLOWUP_JOIN_CDP_TITLE"), CFSTR("Localizable-Walrus"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v6);

  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:inTable:", CFSTR("FOLLOWUP_JOIN_CDP_MESSAGE"), CFSTR("Localizable-Walrus"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInformativeText:", v8);

  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:inTable:", CFSTR("FOLLOWUP_JOIN_CDP_NOTIFICATION_TITLE"), CFSTR("Localizable-Walrus"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v10);

  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:inTable:", CFSTR("FOLLOWUP_JOIN_CDP_NOTIFICATION_MESSAGE"), CFSTR("Localizable-Walrus"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInformativeText:", v12);

  v13 = objc_alloc_init(MEMORY[0x24BE1B3A0]);
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:inTable:", CFSTR("FOLLOWUP_JOIN_CDP_BUTTON_PRIMARY"), CFSTR("Localizable-Walrus"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setLabel:", v15);

  objc_msgSend(v4, "setActivateAction:", v13);
  v16 = objc_alloc_init(MEMORY[0x24BE1B3A0]);
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:inTable:", CFSTR("FOLLOWUP_JOIN_CDP_BUTTON_DISMISS"), CFSTR("Localizable-Walrus"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setLabel:", v18);

  objc_msgSend(v4, "setClearAction:", v16);
  objc_msgSend(v4, "options");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = *MEMORY[0x24BE1B348];
  v23[0] = *MEMORY[0x24BE1B358];
  v23[1] = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setByAddingObjectsFromArray:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOptions:", v22);

}

- (id)_followUpForRecoveryKeyRepairWithContext:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  -[CDPDFollowUpFactory _baseFollowUpItemWithContext:](self, "_baseFollowUpItemWithContext:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CDPLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v5);

  CDPLocalizedString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInformativeText:", v6);

  -[CDPDFollowUpFactory _followUpActionForRecoveryKeyRepair](self, "_followUpActionForRecoveryKeyRepair");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setActions:", v8);

  objc_msgSend(v4, "notification");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v4, "notification");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    CDPLocalizedString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTitle:", v11);

    CDPLocalizedString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setInformativeText:", v12);

    objc_msgSend(v10, "setActivateAction:", v7);
  }

  return v4;
}

- (id)_followUpActionForRecoveryKeyRepair
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x24BE1B3A0]);
  CDPLocalizedString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLabel:", v3);

  objc_msgSend(v2, "setIdentifier:", CFSTR("com.apple.cdp.repair.recoverykey"));
  return v2;
}

- (id)_followUpForSettingUpBiometricsWithContext:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void **v41;
  const __CFString **v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v66;
  uint8_t buf[16];
  NSObject *v68;
  const __CFString *v69;
  const __CFString *v70;
  void *v71;
  const __CFString *v72;
  const __CFString *v73;
  void *v74;
  uint64_t v75;
  _QWORD v76[2];

  v76[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[CDPDFollowUpFactory _isBiometricCapable](self, "_isBiometricCapable")
    && !-[CDPDFollowUpFactory _isBiometricAuthEnrolled](self, "_isBiometricAuthEnrolled"))
  {
    v6 = objc_alloc_init(MEMORY[0x24BE1B3B0]);
    v5 = objc_alloc_init(MEMORY[0x24BE1B3A0]);
    objc_msgSend(v6, "notification");
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setGroupIdentifier:", *MEMORY[0x24BE1B2E8]);
    objc_msgSend(v4, "followUpType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend((id)objc_opt_class(), "contextToIdentifierMap");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "followUpType");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setUniqueIdentifier:", v11);

    }
    if (objc_msgSend(MEMORY[0x24BE1A4A0], "canEnableMultiUserManatee"))
    {
      objc_msgSend(v4, "altDSID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        v75 = *MEMORY[0x24BE1A328];
        objc_msgSend(v4, "altDSID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v76[0] = v13;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v76, &v75, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setUserInfo:", v14);

        v15 = (void *)MEMORY[0x24BE1A3D0];
        objc_msgSend(v4, "altDSID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "appleAccountForAltDSID:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "identifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setAccountIdentifier:", v18);

      }
    }
    v66 = (void *)v7;
    objc_msgSend(v6, "setTargetBundleIdentifier:", *MEMORY[0x24BE1B2B0]);
    if (-[CDPDFollowUpFactory _supportsFaceID](self, "_supportsFaceID"))
    {
      objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("D2DENCRYPTION_FOLLOWUP_FACEID_TITLE"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localizedString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setTitle:", v20);

      objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("D2DENCRYPTION_FOLLOWUP_FACEID_INFOTEXT"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addSecretType:", -[CDPDFollowUpFactory secretType](self, "secretType"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE1A448], "sharedInstance");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "deviceClass");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addDeviceClass:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "localizedString");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setInformativeText:", v26);

      objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("D2DENCRYPTION_FOLLOWUP_FACEID_TITLE"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "localizedString");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v66;
      objc_msgSend(v66, "setTitle:", v28);

      objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("D2DENCRYPTION_FOLLOWUP_FACEID_INFOTEXT"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "addSecretType:", -[CDPDFollowUpFactory secretType](self, "secretType"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE1A448], "sharedInstance");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "deviceClass");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "addDeviceClass:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "localizedString");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "setInformativeText:", v35);

      v36 = (void *)MEMORY[0x24BDBCF48];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("prefs:root=SETUP_FINISH&flow=%@"), CFSTR("faceID"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "URLWithString:", v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setUrl:](v5, "setUrl:", v38);

      v72 = CFSTR("faceID");
      v73 = CFSTR("flowSkipIdentifiers");
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v72, 1);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = v39;
      v40 = (void *)MEMORY[0x24BDBCE70];
      v41 = &v74;
      v42 = &v73;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("D2DENCRYPTION_FOLLOWUP_TOUCHID_TITLE"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "localizedString");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setTitle:", v44);

      objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("D2DENCRYPTION_FOLLOWUP_TOUCHID_INFOTEXT"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "addSecretType:", -[CDPDFollowUpFactory secretType](self, "secretType"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE1A448], "sharedInstance");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "deviceClass");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "addDeviceClass:", v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "localizedString");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setInformativeText:", v50);

      objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("D2DENCRYPTION_FOLLOWUP_TOUCHID_TITLE"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "localizedString");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v66;
      objc_msgSend(v66, "setTitle:", v52);

      objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("D2DENCRYPTION_FOLLOWUP_TOUCHID_INFOTEXT"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "addSecretType:", -[CDPDFollowUpFactory secretType](self, "secretType"));
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE1A448], "sharedInstance");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "deviceClass");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "addDeviceClass:", v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "localizedString");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "setInformativeText:", v58);

      v59 = (void *)MEMORY[0x24BDBCF48];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("prefs:root=SETUP_FINISH&flow=%@"), CFSTR("touchID"));
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "URLWithString:", v60);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setUrl:](v5, "setUrl:", v61);

      v69 = CFSTR("touchID");
      v70 = CFSTR("flowSkipIdentifiers");
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v69, 1);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = v39;
      v40 = (void *)MEMORY[0x24BDBCE70];
      v41 = &v71;
      v42 = &v70;
    }
    objc_msgSend(v40, "dictionaryWithObjects:forKeys:count:", v41, v42, 1);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setUserInfo:](v5, "setUserInfo:", v62);

    CDPLocalizedString();
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setLabel:](v5, "setLabel:", v63);

    v68 = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v68, 1);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setActions:", v64);

    objc_msgSend(v29, "setActivateAction:", v5);
    objc_msgSend(v29, "setFirstNotificationDelay:", 60.0);

  }
  else
  {
    _CDPLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DB2C000, v5, OS_LOG_TYPE_DEFAULT, "\"Device is not biometric auth capable or is already enrolled.\", buf, 2u);
    }
    v6 = 0;
  }

  return v6;
}

- (id)_followUpForADPStateHealingWithContext:(id)a3
{
  id v4;
  id v5;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v28[2];
  _QWORD v29[2];

  v29[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BE1B3B0]);
  objc_msgSend(v5, "setDisplayStyle:", 1);
  objc_msgSend(v5, "setGroupIdentifier:", *MEMORY[0x24BE1B2D8]);
  objc_msgSend(v4, "followUpType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend((id)objc_opt_class(), "contextToIdentifierMap");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "followUpType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setUniqueIdentifier:", v9);

  }
  if (objc_msgSend(v4, "shouldNotify"))
  {
    -[CDPDFollowUpFactory _baseFollowUpNotificationWithContext:](self, "_baseFollowUpNotificationWithContext:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setNotification:", v10);

  }
  objc_msgSend(v5, "setDisplayStyle:", 2);
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:inTable:", CFSTR("ADP_STATE_HEALING_CFU_TITLE"), CFSTR("Localizable-Walrus"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v12);

  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:inTable:", CFSTR("ADP_STATE_HEALING_CFU_TEXT"), CFSTR("Localizable-Walrus"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInformativeText:", v14);

  -[CDPDFollowUpFactory _adpStateHealingFollowUpAction](self, "_adpStateHealingFollowUpAction");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActions:", v16);

  objc_msgSend(v5, "notification");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:inTable:", CFSTR("ADP_STATE_HEALING_CFU_TITLE"), CFSTR("Localizable-Walrus"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTitle:", v19);

  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:inTable:", CFSTR("ADP_STATE_HEALING_NOTIFICATION_TEXT"), CFSTR("Localizable-Walrus"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "localizedString");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setInformativeText:", v21);

  objc_msgSend(v17, "options");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = *MEMORY[0x24BE1B348];
  v28[0] = *MEMORY[0x24BE1B320];
  v28[1] = v23;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setByAddingObjectsFromArray:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setOptions:", v25);

  -[CDPDFollowUpFactory _adpStateHealingFollowUpAction](self, "_adpStateHealingFollowUpAction");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setActivateAction:", v26);

  objc_msgSend(v17, "setFirstNotificationDelay:", 0.0);
  return v5;
}

- (id)_adpStateHealingFollowUpAction
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(MEMORY[0x24BE1B3A0]);
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("CONTINUE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLabel:", v4);

  objc_msgSend(v2, "setIdentifier:", CFSTR("com.apple.cdp.adpStateHealing.continue"));
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/ICLOUD_ADP_SPECIFIER_NAME"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUrl:", v5);

  return v2;
}

- (id)_baseFollowUpItemWithContext:(id)a3
{
  id v4;
  id v5;
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
  void *v17;
  void *v18;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BE1B3B0]);
  objc_msgSend(v5, "setDisplayStyle:", 1);
  objc_msgSend(v5, "setGroupIdentifier:", *MEMORY[0x24BE1B2D8]);
  objc_msgSend(v4, "followUpType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend((id)objc_opt_class(), "contextToIdentifierMap");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "followUpType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setUniqueIdentifier:", v9);

  }
  objc_msgSend(v4, "altDSID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v20 = *MEMORY[0x24BE1A328];
    objc_msgSend(v4, "altDSID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setUserInfo:", v12);

  }
  if (objc_msgSend(MEMORY[0x24BE1A4A0], "canEnableMultiUserManatee"))
  {
    objc_msgSend(v4, "altDSID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = (void *)MEMORY[0x24BE1A3D0];
      objc_msgSend(v4, "altDSID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "appleAccountForAltDSID:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setAccountIdentifier:", v17);

    }
  }
  objc_msgSend(v5, "setExtensionIdentifier:", *MEMORY[0x24BE1A330]);
  if (objc_msgSend(v4, "shouldNotify"))
  {
    -[CDPDFollowUpFactory _baseFollowUpNotificationWithContext:](self, "_baseFollowUpNotificationWithContext:", v4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setNotification:", v18);

  }
  return v5;
}

- (id)_baseFollowUpNotificationWithContext:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v3 = (objc_class *)MEMORY[0x24BE1B3B8];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setFrequency:", 86400.0);
  objc_msgSend(v5, "setFirstNotificationDelay:", 86400.0);
  v6 = objc_msgSend(v4, "force");

  if (v6)
  {
    v7 = (void *)MEMORY[0x24BDBCF20];
    v11[0] = *MEMORY[0x24BE1B338];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWithArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setOptions:", v9);

  }
  return v5;
}

- (unint64_t)secretType
{
  return 1;
}

- (id)_localizedStringForKey:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSecretType:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)_isBiometricAuthEnrolledWithLAEnvironment:(id)a3
{
  void *v3;
  void *v4;
  char v5;
  NSObject *v6;

  objc_msgSend(a3, "state");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "biometry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEnrolled");

  if ((v5 & 1) == 0)
  {
    _CDPLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CDPDFollowUpFactory _isBiometricAuthEnrolledWithLAEnvironment:].cold.1();

  }
  return v5;
}

- (BOOL)_isBiometricAuthEnrolled
{
  LAEnvironment *currentUser;
  void *LAEnvironmentClass;
  LAEnvironment *v5;
  LAEnvironment *v6;

  currentUser = self->_currentUser;
  if (!currentUser)
  {
    LAEnvironmentClass = (void *)LocalAuthenticationLibraryCore();
    if (LAEnvironmentClass)
      LAEnvironmentClass = getLAEnvironmentClass();
    objc_msgSend(LAEnvironmentClass, "currentUser");
    v5 = (LAEnvironment *)objc_claimAutoreleasedReturnValue();
    v6 = self->_currentUser;
    self->_currentUser = v5;

    currentUser = self->_currentUser;
  }
  return -[CDPDFollowUpFactory _isBiometricAuthEnrolledWithLAEnvironment:](self, "_isBiometricAuthEnrolledWithLAEnvironment:", currentUser);
}

- (BOOL)_isManateeAvailableForAltDSID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  NSObject *v8;
  id v10;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BE1A3F8], "contextForAccountWithAltDSID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1A490]), "initWithContext:", v4);
  v10 = 0;
  v6 = objc_msgSend(v5, "isManateeAvailable:", &v10);
  v7 = v10;
  if (v7)
  {
    _CDPLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CDPDFollowUpFactory _isManateeAvailableForAltDSID:].cold.1();

  }
  return v6;
}

- (BOOL)_isManateeAvailable
{
  id v2;
  void *v3;
  void *v4;
  char v5;
  id v6;
  NSObject *v7;
  id v9;

  v2 = objc_alloc(MEMORY[0x24BE1A490]);
  objc_msgSend(MEMORY[0x24BE1A3F8], "contextForPrimaryAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithContext:", v3);

  v9 = 0;
  v5 = objc_msgSend(v4, "isManateeAvailable:", &v9);
  v6 = v9;
  if (v6)
  {
    _CDPLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[CDPDFollowUpFactory _isManateeAvailable].cold.1();

  }
  return v5;
}

- (BOOL)_isBiometricCapable
{
  void *v2;
  char v3;

  -[CDPDFollowUpFactory _deviceCapabilityProvider](self, "_deviceCapabilityProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "supportsPearl") & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(v2, "supportsMesa");

  return v3;
}

- (BOOL)_supportsFaceID
{
  void *v2;
  char v3;

  -[CDPDFollowUpFactory _deviceCapabilityProvider](self, "_deviceCapabilityProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsPearl");

  return v3;
}

- (id)_deviceCapabilityProvider
{
  return objc_alloc_init(CDPMobileGestaltWrapper);
}

- (BOOL)_isWalrusEnabled
{
  CDPInternalWalrusStateController *v2;
  void *v3;
  CDPInternalWalrusStateController *v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v10;

  v2 = [CDPInternalWalrusStateController alloc];
  objc_msgSend(MEMORY[0x24BE1A3F8], "contextForPrimaryAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CDPInternalWalrusStateController initWithContext:](v2, "initWithContext:", v3);

  v10 = 0;
  v5 = -[CDPInternalWalrusStateController walrusStatusWithContext:error:](v4, "walrusStatusWithContext:error:", 0, &v10);
  v6 = v10;
  _CDPLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[CDPDFollowUpFactory _isWalrusEnabled].cold.2();

  _CDPLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[CDPDFollowUpFactory _isWalrusEnabled].cold.1();

  return v5 == 1;
}

- (LAEnvironment)currentUser
{
  return self->_currentUser;
}

- (void)setCurrentUser:(id)a3
{
  objc_storeStrong((id *)&self->_currentUser, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentUser, 0);
}

- (void)followUpItemWithContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_20DB2C000, v0, v1, "\"Beneficiary accounts can only post follow ups for repair.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)_followUpForRepairWithContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_20DB2C000, v0, v1, "\"Beneficiary accounts with valid manatee states are not eligible to post repair followups.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)_isBiometricAuthEnrolledWithLAEnvironment:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_20DB2C000, v0, v1, "\"Bio metric auth not enrolled...\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)_isManateeAvailableForAltDSID:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  v3 = 2114;
  v4 = v0;
  _os_log_error_impl(&dword_20DB2C000, v1, OS_LOG_TYPE_ERROR, "\"Follow up factory manatee check returned an error for altDSID %@: %{public}@\", v2, 0x16u);
  OUTLINED_FUNCTION_4();
}

- (void)_isManateeAvailable
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_20DB2C000, v0, OS_LOG_TYPE_ERROR, "\"Follow up factory manatee check returned an error: %{public}@\", v1, 0xCu);
  OUTLINED_FUNCTION_4();
}

- (void)_isWalrusEnabled
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_20DB2C000, v0, OS_LOG_TYPE_DEBUG, "\"Internal Walrus error %@\", v1, 0xCu);
  OUTLINED_FUNCTION_4();
}

@end

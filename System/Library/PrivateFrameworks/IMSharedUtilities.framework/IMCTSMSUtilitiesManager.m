@implementation IMCTSMSUtilitiesManager

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_19E2F0FD0;
  block[3] = &unk_1E3FB6278;
  block[4] = a1;
  if (qword_1ECFC7140 != -1)
    dispatch_once(&qword_1ECFC7140, block);
  return (id)qword_1ECFC6F70;
}

- (IMCTSMSUtilitiesManager)init
{
  IMCTSMSUtilitiesManager *v2;
  IMCTSMSUtilitiesManager *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IMCTSMSUtilitiesManager;
  v2 = -[IMCTSMSUtilitiesManager init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_QWORD *)&v2->_mmsEnabledToken = -1;
    -[IMCTSMSUtilitiesManager registerServiceCapabilityNotifications](v2, "registerServiceCapabilityNotifications");
  }
  return v3;
}

- (void)registerServiceCapabilityNotifications
{
  _BOOL4 v3;

  v3 = -[IMCTSMSUtilitiesManager mmsEnabledForPhoneNumber:simID:](self, "mmsEnabledForPhoneNumber:simID:", 0, 0);
  notify_register_check("kMMSEnabledDidChange", &self->_mmsEnabledToken);
  notify_set_state(-[IMCTSMSUtilitiesManager mmsEnabledToken](self, "mmsEnabledToken"), v3);
  notify_post("kMMSEnabledDidChange");
}

- (id)uniqueIdentifierForPhoneNumber:(id)a3 simID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a4;
  v6 = a3;
  if (objc_msgSend(v6, "length"))
    v7 = v6;
  else
    v7 = v5;
  v8 = v7;

  return v8;
}

- (BOOL)readMMSUserOverrideForPhoneNumber:(id)a3 simID:(id)a4
{
  id v6;
  id v7;
  __CFString *v8;
  char v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  -[IMCTSMSUtilitiesManager mmsDefaultEnabledForPhoneNumber:simID:](self, "mmsDefaultEnabledForPhoneNumber:simID:", v6, v7);
  v8 = CFSTR("MMSEnabled");
  v9 = IMGetCachedDomainBoolForKeyWithDefaultValue();
  if (IMSharedHelperRetrieveSimDetailsFromTelephony())
  {
    -[IMCTSMSUtilitiesManager uniqueIdentifierForPhoneNumber:simID:](self, "uniqueIdentifierForPhoneNumber:simID:", v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("MMSEnabled-"), v10);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v9 = IMGetCachedDomainBoolForKeyWithDefaultValue();
    }

  }
  return v9;
}

- (BOOL)mmsDefaultEnabledForPhoneNumber:(id)a3 simID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v5 = a3;
  v6 = a4;
  +[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isReadMMSDefaultFromCBEnabled");

  if (v8)
  {
    +[IMCTSubscriptionUtilities sharedInstance](IMCTSubscriptionUtilities, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "ctSubscriptionInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "__im_subscriptionContextForForSimID:phoneNumber:", v6, v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      if ((IMSharedHelperDeviceHasMultipleActiveSubscriptions() & 1) != 0)
      {
        v11 = 0;
      }
      else
      {
        +[IMCTSubscriptionUtilities sharedInstance](IMCTSubscriptionUtilities, "sharedInstance");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "ctSubscriptionInfo");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "subscriptions");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "firstObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    +[IMCTSubscriptionUtilities sharedInstance](IMCTSubscriptionUtilities, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "copyCarrierBundleValueForSubscriptionContext:keyHierarchy:defaultValue:valueIfError:", v11, &unk_1E3FFF020, 0, 0);

    if (v17)
    {
      objc_msgSend(v17, "valueForKey:", CFSTR("MMSDefaultEnabled"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v18)
        v12 = objc_msgSend(v18, "BOOLValue");
      else
        v12 = 1;

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 1;
  }

  return v12;
}

- (id)phoneNumbersEnabledForMultipleSubscriptionDevice
{
  void *v2;
  void *v3;
  void *v4;

  +[IMCTSubscriptionUtilities sharedInstance](IMCTSubscriptionUtilities, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ctSubscriptionInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "phoneNumbersOfActiveSubscriptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)mmsEnabledForPhoneNumber:(id)a3 simID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  void *v20;
  _BOOL4 v21;
  _BOOL4 v22;
  NSObject *v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  _BYTE v31[22];
  __int16 v32;
  id v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  const __CFString *v37;
  __int16 v38;
  const __CFString *v39;
  __int16 v40;
  const __CFString *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!IMSharedHelperRetrieveSimDetailsFromTelephony())
  {
    LOBYTE(v17) = IMMMSEnabled();
    goto LABEL_35;
  }
  +[IMCTSubscriptionUtilities sharedInstance](IMCTSubscriptionUtilities, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ctSubscriptionInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "__im_subscriptionContextOrDefaultForForSimID:phoneNumber:", v7, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v31 = 0;
        _os_log_impl(&dword_19E239000, v18, OS_LOG_TYPE_INFO, "Subscription context was nil, returning NO for MMS enabled", v31, 2u);
      }

    }
    LOBYTE(v17) = 0;
    goto LABEL_32;
  }
  objc_msgSend(v10, "phoneNumber");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "labelID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMCTSMSUtilitiesManager uniqueIdentifierForPhoneNumber:simID:](self, "uniqueIdentifierForPhoneNumber:simID:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!qword_1EE503DB8)
  {
LABEL_13:
    v19 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v20 = (void *)qword_1EE503DB8;
    qword_1EE503DB8 = (uint64_t)v19;

LABEL_14:
    v21 = -[IMCTSMSUtilitiesManager mmsSupportedAndConfiguredForPhoneNumber:simID:](self, "mmsSupportedAndConfiguredForPhoneNumber:simID:", v11, v12);
    v22 = -[IMCTSMSUtilitiesManager readMMSUserOverrideForPhoneNumber:simID:](self, "readMMSUserOverrideForPhoneNumber:simID:", v11, v12);
    v17 = v21 & v22;
    if (objc_msgSend(v13, "length"))
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          v24 = CFSTR("NO");
          *(_DWORD *)v31 = 138413826;
          *(_QWORD *)&v31[4] = v7;
          if (v21)
            v25 = CFSTR("YES");
          else
            v25 = CFSTR("NO");
          if (v22)
            v26 = CFSTR("YES");
          else
            v26 = CFSTR("NO");
          if ((_DWORD)v17)
            v24 = CFSTR("YES");
          *(_WORD *)&v31[12] = 2112;
          *(_QWORD *)&v31[14] = v12;
          v32 = 2112;
          v33 = v6;
          v34 = 2112;
          v35 = v11;
          v36 = 2112;
          v37 = v25;
          v38 = 2112;
          v39 = v26;
          v40 = 2112;
          v41 = v24;
          _os_log_impl(&dword_19E239000, v23, OS_LOG_TYPE_INFO, "Is MMS enabled for simID %@ (default %@) phoneNumber %@ (default %@): mmsSupportedAndConfigured %@ isUserEnabled %@ isMMSEnabled %@", v31, 0x48u);
        }

      }
      v27 = (void *)qword_1EE503DB8;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v17, *(_OWORD *)v31);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setObject:forKey:", v28, v13);

      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v31 = 138412290;
          *(_QWORD *)&v31[4] = qword_1EE503DB8;
          _os_log_impl(&dword_19E239000, v29, OS_LOG_TYPE_INFO, "mmsCapability dict is now %@", v31, 0xCu);
        }

      }
    }
    goto LABEL_31;
  }
  objc_msgSend((id)qword_1EE503DB8, "allKeys");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "containsObject:", v13);

  if (!v15)
  {
    if (qword_1EE503DB8)
      goto LABEL_14;
    goto LABEL_13;
  }
  objc_msgSend((id)qword_1EE503DB8, "objectForKey:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v17) = objc_msgSend(v16, "BOOLValue");

LABEL_31:
LABEL_32:
  if (qword_1EE504200 != -1)
    dispatch_once(&qword_1EE504200, &unk_1E3FB3B88);

LABEL_35:
  return v17;
}

- (BOOL)readEnablePreviewTranscodingQualityCarrierValueForPhoneNumber:(id)a3 simID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  const __CFString *v14;
  int v16;
  const __CFString *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (IMSharedHelperRetrieveSimDetailsFromTelephony())
  {
    +[IMCTSubscriptionUtilities sharedInstance](IMCTSubscriptionUtilities, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ctSubscriptionInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "__im_subscriptionContextOrDefaultForForSimID:phoneNumber:", v6, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      +[IMCTSubscriptionUtilities sharedInstance](IMCTSubscriptionUtilities, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v10, "copyOperatorBundleValueForSubscriptionContext:keyHierarchy:defaultValue:valueIfError:", v9, &unk_1E3FFF038, MEMORY[0x1E0C9AAA0], MEMORY[0x1E0C9AAA0]);
      v12 = objc_msgSend(v11, "BOOLValue");

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = IMGetCachedDomainBoolForKeyWithDefaultValue();
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = CFSTR("NO");
      v16 = 138412802;
      if (v12)
        v14 = CFSTR("YES");
      v17 = v14;
      v18 = 2112;
      v19 = v5;
      v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_19E239000, v13, OS_LOG_TYPE_INFO, "Operator/EnablePreviewTranscodingQuality: %@ for phone number %@ simID %@", (uint8_t *)&v16, 0x20u);
    }

  }
  return v12;
}

- (BOOL)readDisablePreviewTranscodingQualityOnWiFiCarrierValueForPhoneNumber:(id)a3 simID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  const __CFString *v14;
  int v16;
  const __CFString *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (IMSharedHelperRetrieveSimDetailsFromTelephony())
  {
    +[IMCTSubscriptionUtilities sharedInstance](IMCTSubscriptionUtilities, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ctSubscriptionInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "__im_subscriptionContextOrDefaultForForSimID:phoneNumber:", v6, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      +[IMCTSubscriptionUtilities sharedInstance](IMCTSubscriptionUtilities, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v10, "copyOperatorBundleValueForSubscriptionContext:keyHierarchy:defaultValue:valueIfError:", v9, &unk_1E3FFF050, MEMORY[0x1E0C9AAA0], MEMORY[0x1E0C9AAA0]);
      v12 = objc_msgSend(v11, "BOOLValue");

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = IMGetCachedDomainBoolForKeyWithDefaultValue();
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = CFSTR("NO");
      v16 = 138412802;
      if (v12)
        v14 = CFSTR("YES");
      v17 = v14;
      v18 = 2112;
      v19 = v5;
      v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_19E239000, v13, OS_LOG_TYPE_INFO, "Operator/DisablePreviewTranscodingQualityOnWiFi: %@ for phone number %@ simID %@", (uint8_t *)&v16, 0x20u);
    }

  }
  return v12;
}

- (BOOL)readDisablePreviewTranscodingQualityOnWRMCarrierValueForPhoneNumber:(id)a3 simID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  const __CFString *v14;
  int v16;
  const __CFString *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (IMSharedHelperRetrieveSimDetailsFromTelephony())
  {
    +[IMCTSubscriptionUtilities sharedInstance](IMCTSubscriptionUtilities, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ctSubscriptionInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "__im_subscriptionContextOrDefaultForForSimID:phoneNumber:", v6, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      +[IMCTSubscriptionUtilities sharedInstance](IMCTSubscriptionUtilities, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v10, "copyOperatorBundleValueForSubscriptionContext:keyHierarchy:defaultValue:valueIfError:", v9, &unk_1E3FFF068, MEMORY[0x1E0C9AAB0], MEMORY[0x1E0C9AAB0]);
      v12 = objc_msgSend(v11, "BOOLValue");

    }
    else
    {
      v12 = 1;
    }

  }
  else
  {
    v12 = IMGetCachedDomainBoolForKeyWithDefaultValue();
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = CFSTR("NO");
      v16 = 138412802;
      if (v12)
        v14 = CFSTR("YES");
      v17 = v14;
      v18 = 2112;
      v19 = v5;
      v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_19E239000, v13, OS_LOG_TYPE_INFO, "Operator/DisablePreviewTranscodingQualityOnWRMRecommendation: %@ for phone number %@ simID %@", (uint8_t *)&v16, 0x20u);
    }

  }
  return v12;
}

- (unint64_t)readAttachmentPreviewTranscodingQualitySizeCarrierValueForPhoneNumber:(id)a3 simID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  NSObject *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (IMSharedHelperRetrieveSimDetailsFromTelephony())
  {
    +[IMCTSubscriptionUtilities sharedInstance](IMCTSubscriptionUtilities, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ctSubscriptionInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "__im_subscriptionContextOrDefaultForForSimID:phoneNumber:", v6, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      +[IMCTSubscriptionUtilities sharedInstance](IMCTSubscriptionUtilities, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v10, "copyOperatorBundleValueForSubscriptionContext:keyHierarchy:defaultValue:valueIfError:", v9, &unk_1E3FFF080, MEMORY[0x1E0C9AAA0], MEMORY[0x1E0C9AAA0]);
      v12 = (int)objc_msgSend(v11, "intValue");

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = IMGetCachedDomainIntForKeyWithDefaultValue();
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412802;
      v17 = v14;
      v18 = 2112;
      v19 = v5;
      v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_19E239000, v13, OS_LOG_TYPE_INFO, "Operator/AttachmentPreviewTranscodingQualitySize: %@ for phone number %@ simID %@", (uint8_t *)&v16, 0x20u);

    }
  }

  return v12;
}

- (BOOL)mmsSupportedAndConfiguredForPhoneNumber:(id)a3 simID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  char v16;
  NSObject *v17;
  NSObject *v18;
  void *v20;
  char v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if ((IMSharedHelperDeviceIsAltAccount() & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0D20BF8], "sharedInstance"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "supportsMMS"),
        v7,
        (v8 & 1) != 0))
  {
    if (qword_1ECFC7558 != -1)
      dispatch_once(&qword_1ECFC7558, &unk_1E3FB87D0);
    v21 = 1;
    if (IMSharedHelperRetrieveSimDetailsFromTelephony())
    {
      +[IMCTSubscriptionUtilities sharedInstance](IMCTSubscriptionUtilities, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "ctSubscriptionInfo");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v20, "__im_subscriptionContextOrDefaultForForSimID:phoneNumber:", v6, v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v11 = 3;
        do
        {
          objc_msgSend((id)qword_1EE503DC0, "sharedMessageCenter");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isMmsEnabledForSub:enabled:", v10, &v21);

          if (!(_DWORD)v13)
            break;
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412802;
              v23 = v10;
              v24 = 2048;
              v25 = (int)v13;
              v26 = 2048;
              v27 = v13 >> 32;
              _os_log_impl(&dword_19E239000, v14, OS_LOG_TYPE_INFO, "MMS configured check for slot %@ failed (%ld, %ld) retrying...", buf, 0x20u);
            }

          }
          --v11;
        }
        while (v11);
      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v23 = v5;
            _os_log_impl(&dword_19E239000, v18, OS_LOG_TYPE_INFO, "Could not find whether MMS was enabled because no context was found for phone number %@. Returning NO", buf, 0xCu);
          }

        }
        v21 = 0;
      }

      v16 = v21 != 0;
    }
    else
    {
      objc_msgSend((id)qword_1EE503DC0, "sharedMessageCenter");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isMmsConfigured");

    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19E239000, v17, OS_LOG_TYPE_INFO, "Device does not have support MMS", buf, 2u);
      }

    }
    v16 = 0;
  }

  return v16;
}

- (int)mmsMaximumSlideCountForPhoneNumber:(id)a3 simID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  uint8_t v16[16];

  v6 = a3;
  v7 = a4;
  if (IMSharedHelperRetrieveSimDetailsFromTelephony())
  {
    if (-[IMCTSMSUtilitiesManager mmsEnabledForPhoneNumber:simID:](self, "mmsEnabledForPhoneNumber:simID:", v6, v7))
    {
      +[IMCTSubscriptionUtilities sharedInstance](IMCTSubscriptionUtilities, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "ctSubscriptionInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "__im_subscriptionContextOrDefaultForForSimID:phoneNumber:", v7, v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        +[IMCTSubscriptionUtilities sharedInstance](IMCTSubscriptionUtilities, "sharedInstance");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(v11, "copyCarrierBundleValueForSubscriptionContext:keyHierarchy:defaultValue:valueIfError:", v10, &unk_1E3FFF098, &unk_1E3FFE600, &unk_1E3FFE618);
        v13 = objc_msgSend(v12, "intValue");

      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v16 = 0;
            _os_log_impl(&dword_19E239000, v14, OS_LOG_TYPE_INFO, "No context found, returning 0 max slide count", v16, 2u);
          }

        }
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }
  }
  else
  {
    v13 = IMMMSMaximumSlideCount();
  }

  return v13;
}

- (int)mmsMaximumMessageByteCountForPhoneNumber:(id)a3 simID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  int v21;
  _BYTE v22[24];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!IMSharedHelperRetrieveSimDetailsFromTelephony())
  {
    v16 = IMMMSMaximumMessageByteCount();
    goto LABEL_28;
  }
  if (!-[IMCTSMSUtilitiesManager mmsEnabledForPhoneNumber:simID:](self, "mmsEnabledForPhoneNumber:simID:", v6, v7))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v21 = 138412546;
        *(_QWORD *)v22 = v6;
        *(_WORD *)&v22[8] = 2112;
        *(_QWORD *)&v22[10] = v7;
        _os_log_impl(&dword_19E239000, v18, OS_LOG_TYPE_INFO, "MMS is not configured for phone number %@ simID %@", (uint8_t *)&v21, 0x16u);
      }
      goto LABEL_20;
    }
LABEL_21:
    v16 = 0x100000;
    goto LABEL_28;
  }
  objc_msgSend(MEMORY[0x1E0D20BF8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "deviceType");

  if (v9 != 2)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v21 = 67109120;
        *(_DWORD *)v22 = 0x100000;
        _os_log_impl(&dword_19E239000, v18, OS_LOG_TYPE_INFO, "Non iPhone should not have multiple subscriptions! ******** FILE A RADAR **********. Defaulting to %d", (uint8_t *)&v21, 8u);
      }
LABEL_20:

      goto LABEL_21;
    }
    goto LABEL_21;
  }
  +[IMCTSubscriptionUtilities sharedInstance](IMCTSubscriptionUtilities, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ctSubscriptionInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "__im_subscriptionContextOrDefaultForForSimID:phoneNumber:", v7, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    +[IMCTSubscriptionUtilities sharedInstance](IMCTSubscriptionUtilities, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "copyCarrierBundleValueForSubscriptionContext:keyHierarchy:defaultValue:valueIfError:", v12, &unk_1E3FFF0B0, &unk_1E3FFE630, &unk_1E3FFE618);
    v15 = objc_msgSend(v14, "intValue");

    if (v15 <= 0)
      v16 = 0x100000;
    else
      v16 = v15;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v21 = 67109634;
        *(_DWORD *)v22 = v16;
        *(_WORD *)&v22[4] = 2112;
        *(_QWORD *)&v22[6] = v6;
        *(_WORD *)&v22[14] = 2112;
        *(_QWORD *)&v22[16] = v7;
        _os_log_impl(&dword_19E239000, v17, OS_LOG_TYPE_INFO, "Settng MaxMessageSize to:%d for phone number: %@ simID %@", (uint8_t *)&v21, 0x1Cu);
      }

    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v21 = 67109634;
        *(_DWORD *)v22 = 0x100000;
        *(_WORD *)&v22[4] = 2112;
        *(_QWORD *)&v22[6] = v6;
        *(_WORD *)&v22[14] = 2112;
        *(_QWORD *)&v22[16] = v7;
        _os_log_impl(&dword_19E239000, v19, OS_LOG_TYPE_INFO, "No context found, returning %d for MaxMessageSize for phone number: %@ simID %@", (uint8_t *)&v21, 0x1Cu);
      }

    }
    v16 = 0x100000;
  }

LABEL_28:
  return v16;
}

- (BOOL)mmsGroupTextOnlyMessagesSendAsMMSForPhoneNumber:(id)a3 simID:(id)a4
{
  __CFString *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  int v19;
  NSObject *v20;
  const __CFString *v21;
  NSObject *v22;
  NSObject *v23;
  int v25;
  const __CFString *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  const __CFString *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = (__CFString *)a3;
  v7 = a4;
  if (IMSharedHelperRetrieveSimDetailsFromTelephony())
  {
    if (-[IMCTSMSUtilitiesManager mmsEnabledForPhoneNumber:simID:](self, "mmsEnabledForPhoneNumber:simID:", v6, v7))
    {
      objc_msgSend(MEMORY[0x1E0D20BF8], "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "deviceType");

      +[IMCTSubscriptionUtilities sharedInstance](IMCTSubscriptionUtilities, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "ctSubscriptionInfo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "__im_subscriptionContextOrDefaultForForSimID:phoneNumber:", v7, v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        CFPreferencesSynchronize(CFSTR("com.apple.MobileSMS"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
        +[IMCTSubscriptionUtilities sharedInstance](IMCTSubscriptionUtilities, "sharedInstance");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v12, "copyCarrierBundleValueForSubscriptionContext:keyHierarchy:defaultValue:valueIfError:", v11, &unk_1E3FFF0C8, MEMORY[0x1E0C9AAB0], MEMORY[0x1E0C9AAB0]);
        v14 = objc_msgSend(v13, "BOOLValue");

        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            v16 = CFSTR("NO");
            if (v14)
              v16 = CFSTR("YES");
            v25 = 138412290;
            v26 = v16;
            _os_log_impl(&dword_19E239000, v15, OS_LOG_TYPE_INFO, "Fetching carrier bundle value for GroupModeEnabled: %@", (uint8_t *)&v25, 0xCu);
          }

        }
        if ((v14 & 1) == 0)
        {
          +[IMCTSubscriptionUtilities sharedInstance](IMCTSubscriptionUtilities, "sharedInstance");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = (void *)objc_msgSend(v17, "copyCarrierBundleValueForSubscriptionContext:keyHierarchy:defaultValue:valueIfError:", v11, &unk_1E3FFF0E0, MEMORY[0x1E0C9AAA0], MEMORY[0x1E0C9AAA0]);
          v19 = objc_msgSend(v18, "BOOLValue");

          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              v21 = CFSTR("NO");
              if (v19)
                v21 = CFSTR("YES");
              v25 = 138412290;
              v26 = v21;
              _os_log_impl(&dword_19E239000, v20, OS_LOG_TYPE_INFO, "GroupMode disabled, fetching carrier bundle value for GroupModeAllowUserOverride: %@", (uint8_t *)&v25, 0xCu);
            }

          }
          goto LABEL_28;
        }
      }
      else if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          v25 = 138412802;
          v26 = v6;
          v27 = 2112;
          v28 = v7;
          v29 = 2112;
          v30 = CFSTR("YES");
          _os_log_impl(&dword_19E239000, v23, OS_LOG_TYPE_INFO, "Could not find group mode enabled value because no context was found for phone number %@ simID %@. Defaulting to %@", (uint8_t *)&v25, 0x20u);
        }

      }
      LOBYTE(v19) = 1;
LABEL_28:

      goto LABEL_29;
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        v25 = 138412546;
        v26 = v6;
        v27 = 2112;
        v28 = v7;
        _os_log_impl(&dword_19E239000, v22, OS_LOG_TYPE_INFO, "MMS is not configured for phone number %@ simID %@", (uint8_t *)&v25, 0x16u);
      }

    }
    LOBYTE(v19) = 0;
  }
  else
  {
    LOBYTE(v19) = 1;
  }
LABEL_29:

  return v19;
}

- (BOOL)mmsGroupTextReplicationSupportedForPhoneNumber:(id)a3 simID:(id)a4
{
  char *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  const __CFString *v15;
  NSObject *v16;
  NSObject *v17;
  int v19;
  const char *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  const __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = (char *)a3;
  v7 = a4;
  if (-[IMCTSMSUtilitiesManager mmsGroupTextOnlyMessagesSendAsMMSForPhoneNumber:simID:](self, "mmsGroupTextOnlyMessagesSendAsMMSForPhoneNumber:simID:", v6, v7))
  {
    if (IMSharedHelperRetrieveSimDetailsFromTelephony())
    {
      +[IMCTSubscriptionUtilities sharedInstance](IMCTSubscriptionUtilities, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "ctSubscriptionInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "__im_subscriptionContextOrDefaultForForSimID:phoneNumber:", v7, v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        +[IMCTSubscriptionUtilities sharedInstance](IMCTSubscriptionUtilities, "sharedInstance");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(v11, "copyCarrierBundleValueForSubscriptionContext:keyHierarchy:defaultValue:valueIfError:", v10, &unk_1E3FFF0F8, MEMORY[0x1E0C9AAB0], MEMORY[0x1E0C9AAB0]);
        v13 = objc_msgSend(v12, "BOOLValue");

        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            v15 = CFSTR("NO");
            v19 = 138412802;
            v20 = v6;
            v21 = 2112;
            if (v13)
              v15 = CFSTR("YES");
            v22 = v7;
            v23 = 2112;
            v24 = v15;
            _os_log_impl(&dword_19E239000, v14, OS_LOG_TYPE_INFO, "Hybrid groups enabled by carrier for %@ %@: %@", (uint8_t *)&v19, 0x20u);
          }

        }
      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            v19 = 138412802;
            v20 = v6;
            v21 = 2112;
            v22 = v7;
            v23 = 2112;
            v24 = CFSTR("YES");
            _os_log_impl(&dword_19E239000, v17, OS_LOG_TYPE_INFO, "Could not find group replication enabled value because no context was found for phone number %@ simID %@. Defaulting to %@", (uint8_t *)&v19, 0x20u);
          }

        }
        LOBYTE(v13) = 1;
      }

    }
    else
    {
      LOBYTE(v13) = 1;
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v19 = 136315138;
        v20 = "-[IMCTSMSUtilitiesManager mmsGroupTextReplicationSupportedForPhoneNumber:simID:]";
        _os_log_impl(&dword_19E239000, v16, OS_LOG_TYPE_INFO, "Group MMS not enabled, returning NO for %s", (uint8_t *)&v19, 0xCu);
      }

    }
    LOBYTE(v13) = 0;
  }

  return v13;
}

- (BOOL)mmsGroupTextReplicationSupportsSMILContentLocationForPhoneNumber:(id)a3 simID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  const __CFString *v18;
  NSObject *v19;
  int v21;
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  const __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("disable-hybrid-smil-content-location"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && objc_msgSend(v8, "BOOLValue"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        LOWORD(v21) = 0;
        _os_log_impl(&dword_19E239000, v10, OS_LOG_TYPE_INFO, "SMIL content location hybrid support disabled via IDSServerBag", (uint8_t *)&v21, 2u);
      }

    }
    LOBYTE(v11) = 0;
  }
  else if (IMSharedHelperRetrieveSimDetailsFromTelephony())
  {
    +[IMCTSubscriptionUtilities sharedInstance](IMCTSubscriptionUtilities, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "ctSubscriptionInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "__im_subscriptionContextOrDefaultForForSimID:phoneNumber:", v6, v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      +[IMCTSubscriptionUtilities sharedInstance](IMCTSubscriptionUtilities, "sharedInstance");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v15, "copyCarrierBundleValueForSubscriptionContext:keyHierarchy:defaultValue:valueIfError:", v14, &unk_1E3FFF110, MEMORY[0x1E0C9AAB0], MEMORY[0x1E0C9AAB0]);
      v11 = objc_msgSend(v16, "BOOLValue");

      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          v18 = CFSTR("NO");
          v21 = 138412802;
          v22 = v5;
          v23 = 2112;
          if (v11)
            v18 = CFSTR("YES");
          v24 = v6;
          v25 = 2112;
          v26 = v18;
          _os_log_impl(&dword_19E239000, v17, OS_LOG_TYPE_INFO, "SMIL content location supports Apple message identifier for %@ %@: %@", (uint8_t *)&v21, 0x20u);
        }

      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          v21 = 138412802;
          v22 = v5;
          v23 = 2112;
          v24 = v6;
          v25 = 2112;
          v26 = CFSTR("YES");
          _os_log_impl(&dword_19E239000, v19, OS_LOG_TYPE_INFO, "Could not find whether SMIL content location supports Apple message identifiers because no context was found for phone number %@ simID %@. Defaulting to %@", (uint8_t *)&v21, 0x20u);
        }

      }
      LOBYTE(v11) = 1;
    }

  }
  else
  {
    LOBYTE(v11) = 1;
  }

  return v11;
}

- (int)mmsMaxRecipientsForPhoneNumber:(id)a3 simID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  NSObject *v15;
  NSObject *v16;
  _DWORD v18[2];
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (IMSharedHelperRetrieveSimDetailsFromTelephony())
  {
    if (-[IMCTSMSUtilitiesManager mmsEnabledForPhoneNumber:simID:](self, "mmsEnabledForPhoneNumber:simID:", v6, v7))
    {
      +[IMCTSubscriptionUtilities sharedInstance](IMCTSubscriptionUtilities, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "ctSubscriptionInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "__im_subscriptionContextOrDefaultForForSimID:phoneNumber:", v7, v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        +[IMCTSubscriptionUtilities sharedInstance](IMCTSubscriptionUtilities, "sharedInstance");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(v11, "copyCarrierBundleValueForSubscriptionContext:keyHierarchy:defaultValue:valueIfError:", v10, &unk_1E3FFF128, &unk_1E3FFE600, &unk_1E3FFE600);
        v13 = objc_msgSend(v12, "intValue");

        if (v13 >= 1)
        {
          if (v13 <= 10)
            v14 = 10;
          else
            v14 = v13;
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              v18[0] = 67109376;
              v18[1] = v14;
              v19 = 1024;
              v20 = v13;
              _os_log_impl(&dword_19E239000, v15, OS_LOG_TYPE_INFO, "Setting  maxNumberOfRecipents to %d, maxValue from Dictionary was %d", (uint8_t *)v18, 0xEu);
            }

          }
          goto LABEL_19;
        }
      }
      else if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          LOWORD(v18[0]) = 0;
          _os_log_impl(&dword_19E239000, v16, OS_LOG_TYPE_INFO, "Subscription context was nil, returning 0 for max recipients for phone number", (uint8_t *)v18, 2u);
        }

      }
      v14 = 0x7FFFFFFF;
LABEL_19:

      goto LABEL_20;
    }
    v14 = 0x7FFFFFFF;
  }
  else
  {
    v14 = IMMMSMaxRecipients();
  }
LABEL_20:

  return v14;
}

- (int)mmsMaxImageDimensionForPhoneNumber:(id)a3 simID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  int v17;
  int v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (IMSharedHelperRetrieveSimDetailsFromTelephony())
  {
    if (-[IMCTSMSUtilitiesManager mmsEnabledForPhoneNumber:simID:](self, "mmsEnabledForPhoneNumber:simID:", v6, v7))
    {
      +[IMCTSubscriptionUtilities sharedInstance](IMCTSubscriptionUtilities, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "ctSubscriptionInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "__im_subscriptionContextOrDefaultForForSimID:phoneNumber:", v7, v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        +[IMCTSubscriptionUtilities sharedInstance](IMCTSubscriptionUtilities, "sharedInstance");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(v11, "copyCarrierBundleValueForSubscriptionContext:keyHierarchy:defaultValue:valueIfError:", v10, &unk_1E3FFF140, &unk_1E3FFE600, &unk_1E3FFE600);
        v13 = objc_msgSend(v12, "intValue");

        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            v17 = 67109634;
            v18 = v13;
            v19 = 2112;
            v20 = v6;
            v21 = 2112;
            v22 = v7;
            _os_log_impl(&dword_19E239000, v14, OS_LOG_TYPE_INFO, "Setting MaxImageDimension to %d, for phone number %@ simID %@", (uint8_t *)&v17, 0x1Cu);
          }

        }
      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            v17 = 67109120;
            v18 = 0x7FFFFFFF;
            _os_log_impl(&dword_19E239000, v15, OS_LOG_TYPE_INFO, "Subscription context was nil, returning %d for max image dimension", (uint8_t *)&v17, 8u);
          }

        }
        v13 = 0x7FFFFFFF;
      }

    }
    else
    {
      v13 = 0x7FFFFFFF;
    }
  }
  else
  {
    v13 = IMMMSMaxImageDimension();
  }

  return v13;
}

- (BOOL)mmsSupportsH264VideoForPhoneNumber:(id)a3 simID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  char v14;
  NSObject *v15;
  uint8_t v17[16];

  v6 = a3;
  v7 = a4;
  if (IMSharedHelperRetrieveSimDetailsFromTelephony())
  {
    if (-[IMCTSMSUtilitiesManager mmsEnabledForPhoneNumber:simID:](self, "mmsEnabledForPhoneNumber:simID:", v6, v7))
    {
      +[IMCTSubscriptionUtilities sharedInstance](IMCTSubscriptionUtilities, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "ctSubscriptionInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "__im_subscriptionContextOrDefaultForForSimID:phoneNumber:", v7, v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        +[IMCTSubscriptionUtilities sharedInstance](IMCTSubscriptionUtilities, "sharedInstance");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(v11, "copyCarrierBundleValueForSubscriptionContext:keyHierarchy:defaultValue:valueIfError:", v10, &unk_1E3FFF158, MEMORY[0x1E0C9AAA0], MEMORY[0x1E0C9AAA0]);
        v13 = objc_msgSend(v12, "intValue");

        v14 = v13 > 0;
      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v17 = 0;
            _os_log_impl(&dword_19E239000, v15, OS_LOG_TYPE_INFO, "Subscription context was nil, returning NO for SupportsH264Video.", v17, 2u);
          }

        }
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }
  }
  else
  {
    v14 = IMMMSSupportsH264Video();
  }

  return v14;
}

- (double)mmsMaximumAudioDurationForPhoneNumber:(id)a3 simID:(id)a4
{
  id v6;
  id v7;
  void **v8;
  void *v9;
  void *v10;
  void **v11;
  void *v12;
  double v13;
  double v14;

  v6 = a3;
  v7 = a4;
  if (IMSharedHelperRetrieveSimDetailsFromTelephony())
  {
    if (!qword_1EE504208)
    {
      v8 = (void **)MEMORY[0x1A1AE7D58]("AVAssetExportPresetAudioOnlyMMS", CFSTR("AVFoundation"));
      if (v8)
        v9 = *v8;
      else
        v9 = 0;
      objc_storeStrong((id *)&qword_1EE504208, v9);
    }
    -[IMCTSMSUtilitiesManager mmsMaximumDurationWithPreset:phoneNumber:simID:](self, "mmsMaximumDurationWithPreset:phoneNumber:simID:");
  }
  else
  {
    v10 = (void *)qword_1EE504210;
    if (!qword_1EE504210)
    {
      v11 = (void **)MEMORY[0x1A1AE7D58]("AVAssetExportPresetMMS", CFSTR("AVFoundation"));
      if (v11)
        v12 = *v11;
      else
        v12 = 0;
      objc_storeStrong((id *)&qword_1EE504210, v12);
      v10 = (void *)qword_1EE504210;
    }
    v13 = sub_19E2F3A04(v10);
  }
  v14 = v13;

  return v14;
}

- (double)mmsMaximumVideoDurationForPhoneNumber:(id)a3 simID:(id)a4
{
  id v6;
  id v7;
  void **v8;
  void *v9;
  void *v10;
  void **v11;
  void *v12;
  double v13;
  double v14;

  v6 = a3;
  v7 = a4;
  if (IMSharedHelperRetrieveSimDetailsFromTelephony())
  {
    if (!qword_1EE504218)
    {
      v8 = (void **)MEMORY[0x1A1AE7D58]("AVAssetExportPresetMMS", CFSTR("AVFoundation"));
      if (v8)
        v9 = *v8;
      else
        v9 = 0;
      objc_storeStrong((id *)&qword_1EE504218, v9);
    }
    -[IMCTSMSUtilitiesManager mmsMaximumDurationWithPreset:phoneNumber:simID:](self, "mmsMaximumDurationWithPreset:phoneNumber:simID:");
  }
  else
  {
    v10 = (void *)qword_1EE504220;
    if (!qword_1EE504220)
    {
      v11 = (void **)MEMORY[0x1A1AE7D58]("AVAssetExportPresetMMS", CFSTR("AVFoundation"));
      if (v11)
        v12 = *v11;
      else
        v12 = 0;
      objc_storeStrong((id *)&qword_1EE504220, v12);
      v10 = (void *)qword_1EE504220;
    }
    v13 = sub_19E2F3A04(v10);
  }
  v14 = v13;

  return v14;
}

- (double)mmsMaximumDurationWithPreset:(id)a3 phoneNumber:(id)a4 simID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  __int128 v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    if (qword_1EE504230 != -1)
      dispatch_once(&qword_1EE504230, &unk_1E3FB1928);
    if (qword_1EE504240 != -1)
      dispatch_once(&qword_1EE504240, &unk_1E3FB4828);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLongLong:", -[IMCTSMSUtilitiesManager mmsMaximumMessageByteCountForPhoneNumber:simID:](self, "mmsMaximumMessageByteCountForPhoneNumber:simID:", v9, v10));
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v11, CFSTR("fileLengthLimit"), 0);
    v17 = 0uLL;
    v18 = 0;
    if (qword_1EE504228)
      objc_msgSend((id)qword_1EE504228, "maximumDurationForPreset:properties:", v8, v12);
    v15 = v17;
    v16 = v18;
    v13 = off_1EE504238(&v15);

  }
  else
  {
    v13 = INFINITY;
  }

  return v13;
}

- (void)iMessageMaxTransferFileSizeForWifiForPhoneNumber:(unint64_t *)a3 cellSize:(unint64_t *)a4 serverConfigurationBag:(id)a5 phoneNumber:(id)a6 simID:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  int v20;
  NSObject *v21;
  unint64_t v22;
  NSObject *v23;
  unint64_t v24;
  int v25;
  unint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v12 = a5;
  v13 = a6;
  v14 = a7;
  if (IMSharedHelperRetrieveSimDetailsFromTelephony())
  {
    objc_msgSend(v12, "objectForKey:", CFSTR("att-wifi-max-file-size"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "unsignedIntegerValue");

    objc_msgSend(v12, "objectForKey:", CFSTR("att-cellular-max-file-size"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "unsignedIntegerValue");

    if (!v16)
      v16 = 10485760;
    if (v18)
      v19 = v18;
    else
      v19 = 0x400000;
    if (a3)
    {
      if (-[IMCTSMSUtilitiesManager mmsEnabledForPhoneNumber:simID:](self, "mmsEnabledForPhoneNumber:simID:", v13, v14))
      {
        v20 = -[IMCTSMSUtilitiesManager mmsMaximumMessageByteCountForPhoneNumber:simID:](self, "mmsMaximumMessageByteCountForPhoneNumber:simID:", v13, v14);
        if (v16 <= v20)
          v16 = v20;
      }
      *a3 = v16;
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          v22 = *a3;
          v25 = 134217984;
          v26 = v22;
          _os_log_impl(&dword_19E239000, v21, OS_LOG_TYPE_INFO, "Returning carrier bundle value %tu for key IMiMessageMaxTransferFileSizeForWifiForPhoneNumber", (uint8_t *)&v25, 0xCu);
        }

      }
    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        LOWORD(v25) = 0;
        _os_log_impl(&dword_19E239000, v23, OS_LOG_TYPE_INFO, "No wifiSize pointer provided for IMiMessageMaxTransferFileSizeForWifiForPhoneNumber", (uint8_t *)&v25, 2u);
      }

    }
    if (a4)
    {
      if (-[IMCTSMSUtilitiesManager mmsEnabledForPhoneNumber:simID:](self, "mmsEnabledForPhoneNumber:simID:", v13, v14))
      {
        v24 = -[IMCTSMSUtilitiesManager mmsMaximumMessageByteCountForPhoneNumber:simID:](self, "mmsMaximumMessageByteCountForPhoneNumber:simID:", v13, v14);
        if (v19 > v24)
          v24 = v19;
        *a4 = v24;
      }
      else
      {
        *a4 = v19;
      }
    }
  }
  else
  {
    IMiMessageMaxTransferFileSizeForWifi();
  }

}

- (unint64_t)iMessageMaxTransferAudioFileSizeForWifiForPhoneNumber:(unint64_t *)a3 cellSize:(unint64_t *)a4 serverConfigurationBag:(id)a5 phoneNumber:(id)a6 simID:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  unint64_t v16;
  void *v17;
  unint64_t v18;
  NSObject *v19;
  unint64_t v20;
  NSObject *v21;
  unint64_t v22;
  int v24;
  unint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v12 = a5;
  v13 = a6;
  v14 = a7;
  if (IMSharedHelperRetrieveSimDetailsFromTelephony())
  {
    objc_msgSend(v12, "objectForKey:", CFSTR("att-wifi-audio-max-file-size"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "unsignedIntegerValue");

    objc_msgSend(v12, "objectForKey:", CFSTR("att-wifi-audio-cellular-file-size"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "unsignedIntegerValue");

    if (!v16)
      v16 = 10485760;
    if (!v18)
      v18 = 0x400000;
    if (a3)
    {
      *a3 = v16;
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          v20 = *a3;
          v24 = 134217984;
          v25 = v20;
          _os_log_impl(&dword_19E239000, v19, OS_LOG_TYPE_INFO, "Returning carrier bundle value %tu for key IMiMessageMaxTransferAudioFileSizeForWifiForPhoneNumber", (uint8_t *)&v24, 0xCu);
        }

      }
    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        LOWORD(v24) = 0;
        _os_log_impl(&dword_19E239000, v21, OS_LOG_TYPE_INFO, "No wifiSize pointer provided for IMiMessageMaxTransferAudioFileSizeForWifiForPhoneNumber", (uint8_t *)&v24, 2u);
      }

    }
    if (a4)
    {
      if (-[IMCTSMSUtilitiesManager mmsEnabledForPhoneNumber:simID:](self, "mmsEnabledForPhoneNumber:simID:", v13, v14))
      {
        v22 = -[IMCTSMSUtilitiesManager mmsMaximumMessageByteCountForPhoneNumber:simID:](self, "mmsMaximumMessageByteCountForPhoneNumber:simID:", v13, v14);
        if (v18 > v22)
          v22 = v18;
        *a4 = v22;
      }
      else
      {
        *a4 = v18;
      }
    }
  }
  else
  {
    v16 = IMiMessageMaxTransferAudioFileSizeForWifi();
  }

  return v16;
}

- (unint64_t)iMessageMaxTransferVideoFileSizeForWifiForPhoneNumber:(unint64_t *)a3 cellSize:(unint64_t *)a4 serverConfigurationBag:(id)a5 phoneNumber:(id)a6 simID:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  unint64_t v16;
  void *v17;
  unint64_t v18;
  NSObject *v19;
  unint64_t v20;
  NSObject *v21;
  unint64_t v22;
  int v24;
  unint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v12 = a5;
  v13 = a6;
  v14 = a7;
  if (IMSharedHelperRetrieveSimDetailsFromTelephony())
  {
    objc_msgSend(v12, "objectForKey:", CFSTR("att-wifi-video-max-file-size"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "unsignedIntegerValue");

    objc_msgSend(v12, "objectForKey:", CFSTR("att-wifi-video-cellular-file-size"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "unsignedIntegerValue");

    if (!v16)
      v16 = 10485760;
    if (!v18)
      v18 = 0x400000;
    if (a3)
    {
      *a3 = v16;
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          v20 = *a3;
          v24 = 134217984;
          v25 = v20;
          _os_log_impl(&dword_19E239000, v19, OS_LOG_TYPE_INFO, "Returning carrier bundle value %tu for key IMiMessageMaxTransferVideoFileSizeForWifiForPhoneNumber", (uint8_t *)&v24, 0xCu);
        }

      }
    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        LOWORD(v24) = 0;
        _os_log_impl(&dword_19E239000, v21, OS_LOG_TYPE_INFO, "No wifiSize pointer provided for IMiMessageMaxTransferVideoFileSizeForWifiForPhoneNumber", (uint8_t *)&v24, 2u);
      }

    }
    if (a4)
    {
      if (-[IMCTSMSUtilitiesManager mmsEnabledForPhoneNumber:simID:](self, "mmsEnabledForPhoneNumber:simID:", v13, v14))
      {
        v22 = -[IMCTSMSUtilitiesManager mmsMaximumMessageByteCountForPhoneNumber:simID:](self, "mmsMaximumMessageByteCountForPhoneNumber:simID:", v13, v14);
        if (v18 > v22)
          v22 = v18;
        *a4 = v22;
      }
      else
      {
        *a4 = v18;
      }
    }
  }
  else
  {
    v16 = IMiMessageMaxTransferAudioFileSizeForWifi();
  }

  return v16;
}

- (id)mmsEmailAddressToMatchForPhoneNumber:(id)a3 simID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  if (IMSharedHelperRetrieveSimDetailsFromTelephony())
  {
    if (-[IMCTSMSUtilitiesManager mmsEnabledForPhoneNumber:simID:](self, "mmsEnabledForPhoneNumber:simID:", v6, v7))
    {
      +[IMCTSubscriptionUtilities sharedInstance](IMCTSubscriptionUtilities, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "ctSubscriptionInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "__im_subscriptionContextOrDefaultForForSimID:phoneNumber:", v7, v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10
        && (+[IMCTSubscriptionUtilities sharedInstance](IMCTSubscriptionUtilities, "sharedInstance"),
            v11 = (void *)objc_claimAutoreleasedReturnValue(),
            v12 = (void *)objc_msgSend(v11, "copyCarrierBundleValueForSubscriptionContext:keyHierarchy:defaultValue:valueIfError:", v10, &unk_1E3FFF170, MEMORY[0x1E0C9AAA0], MEMORY[0x1E0C9AAA0]), v13 = objc_msgSend(v12, "BOOLValue"), v12, v11, v13))
      {
        v14 = (void *)CFPreferencesCopyAppValue(CFSTR("MMSEmailAddress"), CFSTR("com.apple.MobileSMS"));
        if (qword_1EE504248 != -1)
          dispatch_once(&qword_1EE504248, &unk_1E3FB87B0);
      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }
  }
  else
  {
    IMMMSEmailAddressToMatch();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

- (BOOL)shouldShowMMSEmailAddress:(id)a3 simID:(id)a4
{
  id v5;
  id v6;
  _BOOL4 SimDetailsFromTelephony;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  const __CFString *v18;
  NSObject *v19;
  const __CFString *v20;
  int v22;
  const __CFString *v23;
  __int16 v24;
  const __CFString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  SimDetailsFromTelephony = IMSharedHelperRetrieveSimDetailsFromTelephony();
  +[IMCTSubscriptionUtilities sharedInstance](IMCTSubscriptionUtilities, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ctSubscriptionInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (SimDetailsFromTelephony)
  {
    objc_msgSend(v9, "__im_subscriptionContextOrDefaultForForSimID:phoneNumber:", v6, v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v9, "subscriptions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v13 != 1)
    {
      v11 = 0;
      goto LABEL_8;
    }
    +[IMCTSubscriptionUtilities sharedInstance](IMCTSubscriptionUtilities, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ctSubscriptionInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "subscriptions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v11)
  {
    +[IMCTSubscriptionUtilities sharedInstance](IMCTSubscriptionUtilities, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "copyCarrierBundleValueForSubscriptionContext:keyHierarchy:defaultValue:valueIfError:", v11, &unk_1E3FFF188, MEMORY[0x1E0C9AAA0], MEMORY[0x1E0C9AAA0]);
    v17 = objc_msgSend(v16, "BOOLValue");

    v18 = CFSTR("YES");
    goto LABEL_9;
  }
LABEL_8:
  v17 = 0;
  v18 = CFSTR("NO");
LABEL_9:
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = CFSTR("NO");
      if (v17)
        v20 = CFSTR("YES");
      v22 = 138412546;
      v23 = v18;
      v24 = 2112;
      v25 = v20;
      _os_log_impl(&dword_19E239000, v19, OS_LOG_TYPE_INFO, "Did find context: %@, showMMSEmailAddress: %@", (uint8_t *)&v22, 0x16u);
    }

  }
  return v17;
}

- (BOOL)isEagerUploadEnabledForPhoneNumber:(id)a3 simID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  uint8_t *v13;
  void *v14;
  int v15;
  _BOOL4 v16;
  NSObject *v17;
  BOOL v18;
  uint8_t v20[16];
  uint8_t buf[2];
  __int16 v22;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("disable-eager-upload"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9 && objc_msgSend(v9, "BOOLValue"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v22 = 0;
        v12 = "Eager upload disabled in IDSServerBag";
        v13 = (uint8_t *)&v22;
LABEL_17:
        _os_log_impl(&dword_19E239000, v11, OS_LOG_TYPE_INFO, v12, v13, 2u);
        goto LABEL_18;
      }
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isInternalInstall");

  if (v15 && (IMGetCachedDomainBoolForKeyWithDefaultValue() & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v12 = "Eager upload disabled in defaults com.apple.imessage";
        v13 = buf;
        goto LABEL_17;
      }
LABEL_18:

    }
LABEL_19:
    v18 = 0;
    goto LABEL_20;
  }
  v16 = -[IMCTSMSUtilitiesManager mmsEagerUploadDisabledInCarrierBundleForPhoneNumber:simID:](self, "mmsEagerUploadDisabledInCarrierBundleForPhoneNumber:simID:", v6, v7);
  if (v16 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_19E239000, v17, OS_LOG_TYPE_INFO, "Eager upload disabled in Carrier Bundle", v20, 2u);
    }

  }
  v18 = !v16;
LABEL_20:

  return v18;
}

- (BOOL)mmsEagerUploadDisabledInCarrierBundleForPhoneNumber:(id)a3 simID:(id)a4
{
  id v5;
  id v6;
  _BOOL4 SimDetailsFromTelephony;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  const __CFString *v18;
  NSObject *v19;
  const __CFString *v20;
  int v22;
  const __CFString *v23;
  __int16 v24;
  const __CFString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  SimDetailsFromTelephony = IMSharedHelperRetrieveSimDetailsFromTelephony();
  +[IMCTSubscriptionUtilities sharedInstance](IMCTSubscriptionUtilities, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ctSubscriptionInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (SimDetailsFromTelephony)
  {
    objc_msgSend(v9, "__im_subscriptionContextOrDefaultForForSimID:phoneNumber:", v6, v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v9, "subscriptions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v13 != 1)
    {
      v11 = 0;
      goto LABEL_8;
    }
    +[IMCTSubscriptionUtilities sharedInstance](IMCTSubscriptionUtilities, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ctSubscriptionInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "subscriptions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v11)
  {
    +[IMCTSubscriptionUtilities sharedInstance](IMCTSubscriptionUtilities, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "copyCarrierBundleValueForSubscriptionContext:keyHierarchy:defaultValue:valueIfError:", v11, &unk_1E3FFF1A0, MEMORY[0x1E0C9AAA0], MEMORY[0x1E0C9AAA0]);
    v17 = objc_msgSend(v16, "BOOLValue");

    v18 = CFSTR("NO");
    goto LABEL_9;
  }
LABEL_8:
  v17 = 0;
  v18 = CFSTR("YES");
LABEL_9:
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = CFSTR("NO");
      if (v17)
        v20 = CFSTR("YES");
      v22 = 138412546;
      v23 = v18;
      v24 = 2112;
      v25 = v20;
      _os_log_impl(&dword_19E239000, v19, OS_LOG_TYPE_INFO, "Did find context: %@, DisableEagerUpload: %@", (uint8_t *)&v22, 0x16u);
    }

  }
  return v17;
}

- (BOOL)mmsRestrictedModeEnabledForPhoneNumber:(id)a3 simID:(id)a4
{
  return -[IMCTSMSUtilitiesManager mmsRestrictedModeEnabledForPhoneNumber:simID:reset:](self, "mmsRestrictedModeEnabledForPhoneNumber:simID:reset:", a3, a4, 0);
}

- (BOOL)mmsRestrictedModeEnabledForPhoneNumber:(id)a3 simID:(id)a4 reset:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  __CFString *v11;
  int AppBooleanValue;
  char v13;
  BOOL v14;
  NSObject *v15;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint8_t buf[15];
  Boolean keyExistsAndHasValidFormat;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  if (IMSharedHelperRetrieveSimDetailsFromTelephony())
  {
    -[IMCTSMSUtilitiesManager uniqueIdentifierForPhoneNumber:simID:](self, "uniqueIdentifierForPhoneNumber:simID:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      keyExistsAndHasValidFormat = 0;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("MMSRestricted-"), v10);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      AppBooleanValue = CFPreferencesGetAppBooleanValue(v11, CFSTR("com.apple.MobileSMS"), &keyExistsAndHasValidFormat);
      v13 = AppBooleanValue != 0;
      if (AppBooleanValue)
        v14 = !v5;
      else
        v14 = 0;
      if (!v14 && (byte_1EE504250 & 1) == 0)
      {
        byte_1EE504250 = 1;
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19E239000, v15, OS_LOG_TYPE_INFO, "Now listening for restricted mode changed notifications", buf, 2u);
          }

        }
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_19E2F4F40, CFSTR("com.apple.MobileSMS.MMSRestricted.changed"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      }

    }
    else
    {
      v13 = IMMMSRestrictedModeEnabled();
    }

  }
  else
  {
    v13 = IMMMSRestrictedModeEnabled();
  }

  return v13;
}

- (void)synchronizeMMSCapabilityToWatch:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  double v5;
  double v6;
  int AppBooleanValue;
  NSObject *v8;
  const __CFString *v9;
  const __CFString *v10;
  objc_class *v11;
  id v12;
  NSObject *v13;
  const __CFString *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  Boolean keyExistsAndHasValidFormat;
  uint8_t buf[4];
  const __CFString *v21;
  __int16 v22;
  const __CFString *v23;
  uint64_t v24;

  v3 = a3;
  v24 = *MEMORY[0x1E0C80C00];
  if (qword_1ECFC70A8
    && (objc_msgSend(MEMORY[0x1E0C99D68], "date"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "timeIntervalSinceDate:", qword_1ECFC70A8),
        v6 = v5,
        v4,
        v6 <= 300.0)
    && (keyExistsAndHasValidFormat = 0,
        AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("MMSRelayEnabled"), CFSTR("com.apple.MobileSMS"), &keyExistsAndHasValidFormat), keyExistsAndHasValidFormat == 1)&& (AppBooleanValue != 0) == v3)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = CFSTR("NO");
        if (AppBooleanValue)
          v10 = CFSTR("YES");
        else
          v10 = CFSTR("NO");
        if (v3)
          v9 = CFSTR("YES");
        *(_DWORD *)buf = 138412546;
        v21 = v10;
        v22 = 2112;
        v23 = v9;
        _os_log_impl(&dword_19E239000, v8, OS_LOG_TYPE_INFO, "Not setting MMSEnabled from %@ to %@, skipping sync", buf, 0x16u);
      }

    }
  }
  else
  {
    v11 = (objc_class *)MEMORY[0x1A1AE7D4C](CFSTR("NPSManager"), CFSTR("NanoPreferencesSync"));
    if (v11)
    {
      v12 = objc_alloc_init(v11);
      CFPreferencesSetAppValue(CFSTR("MMSRelayEnabled"), (CFPropertyListRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3), CFSTR("com.apple.MobileSMS"));
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          v14 = CFSTR("NO");
          if (v3)
            v14 = CFSTR("YES");
          *(_DWORD *)buf = 138412290;
          v21 = v14;
          _os_log_impl(&dword_19E239000, v13, OS_LOG_TYPE_INFO, "Setting MMSEnabled Nano Preference to: %@", buf, 0xCu);
        }

      }
      CFPreferencesSynchronize(CFSTR("com.apple.MobileSMS"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("MMSRelayEnabled"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "synchronizeUserDefaultsDomain:keys:", CFSTR("com.apple.MobileSMS"), v15);

      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)qword_1ECFC70A8;
      qword_1ECFC70A8 = v16;

    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19E239000, v18, OS_LOG_TYPE_INFO, "Could not weak link ____NPSManagerClass in _synchronizeMMSCapabilityToWatch", buf, 2u);
      }

    }
  }
}

- (void)synchronizePreferredSubscriptionMMSCapabilityToWatch
{
  _BOOL8 v3;

  v3 = -[IMCTSMSUtilitiesManager mmsEnabledForPhoneNumber:simID:](self, "mmsEnabledForPhoneNumber:simID:", 0, 0);
  if (IMSharedHelperDeviceHasMultipleSubscriptions())
    -[IMCTSMSUtilitiesManager synchronizeMMSCapabilityToWatch:](self, "synchronizeMMSCapabilityToWatch:", v3);
  notify_set_state(-[IMCTSMSUtilitiesManager mmsEnabledToken](self, "mmsEnabledToken"), v3);
  notify_post("kMMSEnabledDidChange");
}

- (id)countryCodeForSimSlot:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v11;
  int64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  +[IMCTSubscriptionUtilities sharedInstance](IMCTSubscriptionUtilities, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ctSubscriptionInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "__im_subscriptionContextForForSlotID:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    +[IMCTSubscriptionUtilities sharedInstance](IMCTSubscriptionUtilities, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copyIsoCountryCodeForSubscriptionContext:", v6);

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v11 = 134217984;
        v12 = a3;
        _os_log_impl(&dword_19E239000, v9, OS_LOG_TYPE_INFO, "Could not find subscription context for slot %ld", (uint8_t *)&v11, 0xCu);
      }

    }
    v8 = 0;
  }

  return v8;
}

- (id)countryCodeForPhoneNumber:(id)a3 simID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  +[IMCTSubscriptionUtilities sharedInstance](IMCTSubscriptionUtilities, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ctSubscriptionInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "__im_subscriptionContextForForSimID:phoneNumber:", v6, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    +[IMCTSubscriptionUtilities sharedInstance](IMCTSubscriptionUtilities, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copyIsoCountryCodeForSubscriptionContext:", v9);

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v14 = 138412546;
        v15 = v5;
        v16 = 2112;
        v17 = v6;
        _os_log_impl(&dword_19E239000, v12, OS_LOG_TYPE_INFO, "Could not find subscription context for phone number %@ and sim ID %@", (uint8_t *)&v14, 0x16u);
      }

    }
    v11 = 0;
  }

  return v11;
}

- (BOOL)messagesFilteringSettingForPreferedSubscription
{
  _BOOL4 SimDetailsFromTelephony;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  const __CFString *v13;
  NSObject *v14;
  const __CFString *v15;
  int v17;
  const __CFString *v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  SimDetailsFromTelephony = IMSharedHelperRetrieveSimDetailsFromTelephony();
  +[IMCTSubscriptionUtilities sharedInstance](IMCTSubscriptionUtilities, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ctSubscriptionInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (SimDetailsFromTelephony)
  {
    objc_msgSend(v4, "preferredOrDefaultSubscriptionContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "subscriptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8 != 1)
    {
      v6 = 0;
      goto LABEL_8;
    }
    +[IMCTSubscriptionUtilities sharedInstance](IMCTSubscriptionUtilities, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "ctSubscriptionInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "subscriptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v6)
  {
    +[IMCTSubscriptionUtilities sharedInstance](IMCTSubscriptionUtilities, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copyCarrierBundleValueForSubscriptionContext:keyHierarchy:defaultValue:valueIfError:", v6, &unk_1E3FFF1B8, MEMORY[0x1E0C9AAB0], MEMORY[0x1E0C9AAA0]);
    v12 = objc_msgSend(v11, "intValue") != 0;

    v13 = CFSTR("YES");
    goto LABEL_9;
  }
LABEL_8:
  v12 = 0;
  v13 = CFSTR("NO");
LABEL_9:
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = CFSTR("NO");
      if (v12)
        v15 = CFSTR("YES");
      v17 = 138412546;
      v18 = v13;
      v19 = 2112;
      v20 = v15;
      _os_log_impl(&dword_19E239000, v14, OS_LOG_TYPE_INFO, "Did find context: %@. filteringEnabled: %@", (uint8_t *)&v17, 0x16u);
    }

  }
  return v12;
}

- (id)carrierBundleValueForKeyHierarchy:(id)a3 phoneNumber:(id)a4 simID:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  +[IMCTSubscriptionUtilities sharedInstance](IMCTSubscriptionUtilities, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ctSubscriptionInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "__im_subscriptionContextForForSimID:phoneNumber:", v7, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[IMCTSubscriptionUtilities sharedInstance](IMCTSubscriptionUtilities, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copyCarrierBundleValueForSubscriptionContext:keyHierarchy:defaultValue:valueIfError:", v12, v9, 0, 0);

  return v14;
}

- (id)carrierNameForPhoneNumber:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int v8;
  id v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (MEMORY[0x1A1AE7D10]())
  {
    -[IMCTSMSUtilitiesManager carrierBundleValueForKeyHierarchy:phoneNumber:simID:](self, "carrierBundleValueForKeyHierarchy:phoneNumber:simID:", &unk_1E3FFF1D0, v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          v8 = 138412546;
          v9 = v4;
          v10 = 2112;
          v11 = v5;
          _os_log_impl(&dword_19E239000, v6, OS_LOG_TYPE_INFO, "Error getting carrier name for phone number - %@. Carrier Bundle Object -> %@", (uint8_t *)&v8, 0x16u);
        }

      }
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)smsAllowCaseSensitiveSenderIDForPhoneNumber:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  NSObject *v10;
  const __CFString *v11;
  int v13;
  const __CFString *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IMCTSMSUtilitiesManager carrierBundleValueForKeyHierarchy:phoneNumber:simID:](self, "carrierBundleValueForKeyHierarchy:phoneNumber:simID:", &unk_1E3FFF1E8, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("AllowCasesensitiveSenderID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
      v8 = objc_msgSend(v6, "BOOLValue");
    else
      v8 = 1;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = CFSTR("NO");
        if (v8)
          v11 = CFSTR("YES");
        v13 = 138412290;
        v14 = v11;
        _os_log_impl(&dword_19E239000, v10, OS_LOG_TYPE_INFO, "AllowCasesensitiveSenderID provided by carrier is -> %@.\n", (uint8_t *)&v13, 0xCu);
      }

    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v13 = 138412546;
        v14 = (const __CFString *)&unk_1E3FFF1E8;
        v15 = 2112;
        v16 = v5;
        _os_log_impl(&dword_19E239000, v9, OS_LOG_TYPE_INFO, "Error getting Carrier Bundle dictionary. Key Hierarchy -> %@.\nPhoneNumber -> %@", (uint8_t *)&v13, 0x16u);
      }

    }
    LOBYTE(v8) = 1;
  }

  return v8;
}

- (BOOL)shouldUploadToMMCS:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  int v15;
  int v16;
  NSObject *v17;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[16];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19E239000, v4, OS_LOG_TYPE_INFO, "Checking to See if we should upload to MMCS", buf, 2u);
    }

  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v19 = v3;
  objc_msgSend(v3, "objectForKey:", CFSTR("k"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v10, "objectForKey:", CFSTR("type"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("text/plain"));

        if (v12)
        {
          if (!IMOSLoggingEnabled())
            continue;
          OSLogHandleForIMFoundationCategory();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19E239000, v13, OS_LOG_TYPE_INFO, "Found A Text Part thats OK", buf, 2u);
          }
          goto LABEL_14;
        }
        objc_msgSend(v10, "objectForKey:", CFSTR("type"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("application/smil"));

        v16 = IMOSLoggingEnabled();
        if (v15)
        {
          if (v16)
          {
            OSLogHandleForIMFoundationCategory();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19E239000, v13, OS_LOG_TYPE_INFO, "Found SMIL data.. thats OK ", buf, 2u);
            }
LABEL_14:

            continue;
          }
        }
        else
        {
          if (v16)
          {
            OSLogHandleForIMFoundationCategory();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19E239000, v17, OS_LOG_TYPE_INFO, "Found Something else that wasnt there, looks like we need to upload this one to MMCS", buf, 2u);
            }

          }
          ++v6;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v7);
  }

  return v6 > 0;
}

- (id)myCTPhoneNumber
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (IMSharedHelperRetrieveSimDetailsFromTelephony())
  {
    +[IMCTSubscriptionUtilities sharedInstance](IMCTSubscriptionUtilities, "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "ctPhoneNumber");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        v10 = 138412290;
        v11 = v3;
        _os_log_impl(&dword_19E239000, v4, OS_LOG_TYPE_INFO, "My CT Phone Number from subscription context is: %@", (uint8_t *)&v10, 0xCu);
      }
LABEL_12:

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D20BF8], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "telephoneNumber");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0D20BF8], "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "telephoneNumber");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v3 = 0;
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        v10 = 138412290;
        v11 = v3;
        _os_log_impl(&dword_19E239000, v4, OS_LOG_TYPE_INFO, "My CT Phone Number from FTDevice is: %@", (uint8_t *)&v10, 0xCu);
      }
      goto LABEL_12;
    }
  }
  IMNormalizePhoneNumber((uint64_t)v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (int)mmsEnabledToken
{
  return self->_mmsEnabledToken;
}

- (void)setMmsEnabledToken:(int)a3
{
  self->_mmsEnabledToken = a3;
}

- (int)rcsEnabledToken
{
  return self->_rcsEnabledToken;
}

- (void)setRcsEnabledToken:(int)a3
{
  self->_rcsEnabledToken = a3;
}

@end

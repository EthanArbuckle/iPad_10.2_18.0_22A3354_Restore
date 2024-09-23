@implementation AKFollowUpFactoryImpl

- (id)itemsForAltDSID:(id)a3 pushMessageInfo:(id)a4 fromIDMSPayload:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[5];
  id v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __73__AKFollowUpFactoryImpl_itemsForAltDSID_pushMessageInfo_fromIDMSPayload___block_invoke;
  v14[3] = &unk_1E2E60B30;
  v14[4] = self;
  v15 = v9;
  v16 = v8;
  v10 = v8;
  v11 = v9;
  objc_msgSend(a5, "aaf_map:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __73__AKFollowUpFactoryImpl_itemsForAltDSID_pushMessageInfo_fromIDMSPayload___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_itemFromPayload:pushMessageInfo:withAltDSID:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (id)itemIdentifiersRequiringNotificationClearFromPayload:(id)a3
{
  return (id)objc_msgSend(a3, "aaf_map:", &__block_literal_global_28);
}

id __78__AKFollowUpFactoryImpl_itemIdentifiersRequiringNotificationClearFromPayload___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = a2;
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("notification"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("dismiss"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "BOOLValue"))
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("id"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_itemShouldSuppressNotification:(id)a3
{
  void *v3;
  int v4;
  NSObject *v5;
  uint8_t v7[16];

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("id"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("adpUpsell"));
  if (v4)
  {
    _AKLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_19202F000, v5, OS_LOG_TYPE_DEFAULT, "adpUpsell CFU should not send a notification.", v7, 2u);
    }

  }
  return v4;
}

- (id)_itemFromPayload:(id)a3 pushMessageInfo:(id)a4 withAltDSID:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  NSObject *v20;
  void *v21;
  id v22;
  objc_class *FLFollowUpItemClass;
  NSString *v24;
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
  NSString *p_isa;
  void *v36;
  NSString *bundleIconName;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  int v42;
  void *v43;
  int v44;
  void *v45;
  int v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  NSObject *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v71;
  id v72;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v72 = a5;
  _AKLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[AKFollowUpFactoryImpl _itemFromPayload:pushMessageInfo:withAltDSID:].cold.3((uint64_t)v8, v10, v11, v12, v13, v14, v15, v16);

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("id"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[AKFeatureManager sharedManager](AKFeatureManager, "sharedManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v18, "isADPExpansionViaCFUEnabled") & 1) != 0)
  {

    goto LABEL_9;
  }
  v19 = objc_msgSend(v17, "isEqualToString:", CFSTR("adpUpsell"));

  if (!v19)
  {
LABEL_9:
    FLFollowUpItemClass = (objc_class *)CoreFollowUpLibraryCore();
    if (FLFollowUpItemClass)
      FLFollowUpItemClass = (objc_class *)getFLFollowUpItemClass();
    v22 = objc_alloc_init(FLFollowUpItemClass);
    v71 = v17;
    objc_msgSend(v22, "setUniqueIdentifier:", v17);
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("bundlePath"));
    v20 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("iconName"));
    v24 = (NSString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("notifyingAppBundleID"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKFollowUpFactoryImpl _extensionIDFromPayload:](self, "_extensionIDFromPayload:", v8);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setExtensionIdentifier:", v26);

    -[AKFollowUpFactoryImpl _actionsFromPayload:pushMessageInfo:](self, "_actionsFromPayload:pushMessageInfo:", v8, v9);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setActions:", v27);

    -[AKFollowUpFactoryImpl _notificationFromPayload:pushMessageInfo:](self, "_notificationFromPayload:pushMessageInfo:", v8, v9);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setNotification:", v28);

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("title"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      objc_msgSend(v22, "setTitle:", v29);
    }
    else
    {
      objc_msgSend(v22, "notification");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "title");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setTitle:", v31);

    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("body"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setInformativeText:", v32);

    if (CoreFollowUpLibraryCore())
    {
      getFLGroupIdentifierAccount();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setGroupIdentifier:", v33);

      if (v20)
      {
LABEL_16:
        v34 = v22;
        p_isa = (NSString *)&v20->isa;
LABEL_19:
        objc_msgSend(v34, "setRepresentingBundlePath:", p_isa);
        if (v24)
        {
          v36 = v22;
          bundleIconName = v24;
        }
        else
        {
          bundleIconName = self->_bundleIconName;
          v36 = v22;
        }
        objc_msgSend(v36, "setBundleIconName:", bundleIconName);
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("priority"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v38, "integerValue");

        if (v39 == 1)
          v40 = 1;
        else
          v40 = 4 * (v39 == 2);
        objc_msgSend(v22, "setDisplayStyle:", v40);
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("zeroAction"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v41, "BOOLValue");

        if (v42)
          objc_msgSend(v22, "setDisplayStyle:", objc_msgSend(v22, "displayStyle") | 2);
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("badgeOnly"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v43, "BOOLValue");

        if (v44)
          objc_msgSend(v22, "setDisplayStyle:", objc_msgSend(v22, "displayStyle") | 8);
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("omitBadge"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = objc_msgSend(v45, "BOOLValue");

        if (v46)
          objc_msgSend(v22, "setDisplayStyle:", objc_msgSend(v22, "displayStyle") | 0x10);
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = v47;
        if (v72)
          objc_msgSend(v47, "setObject:forKeyedSubscript:", v72, CFSTR("AKFollowUpAltDSIDKey"));
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("idmsdata"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();

        if (v49)
        {
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("idmsdata"));
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "setObject:forKeyedSubscript:", v50, CFSTR("idmsdata"));

        }
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("txnid"));
        v51 = (void *)objc_claimAutoreleasedReturnValue();

        if (v51)
        {
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("txnid"));
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "setObject:forKeyedSubscript:", v52, CFSTR("txnid"));

        }
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("cmd"));
        v53 = (void *)objc_claimAutoreleasedReturnValue();

        if (v53)
        {
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("cmd"));
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "setObject:forKeyedSubscript:", v54, CFSTR("cmd"));

        }
        if (v25)
        {
          _AKLogSystem();
          v55 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
            -[AKFollowUpFactoryImpl _itemFromPayload:pushMessageInfo:withAltDSID:].cold.2((uint64_t)v25, v55, v56, v57, v58, v59, v60, v61);

          objc_msgSend(v48, "setObject:forKeyedSubscript:", v25, CFSTR("notifyingAppId"));
        }
        objc_msgSend(v22, "setUserInfo:", v48);
        if (-[AKFollowUpFactoryImpl _itemShouldSuppressNotification:](self, "_itemShouldSuppressNotification:", v8))
        {
          _AKLogSystem();
          v62 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
            -[AKFollowUpFactoryImpl _itemFromPayload:pushMessageInfo:withAltDSID:].cold.1(v62, v63, v64, v65, v66, v67, v68, v69);

          objc_msgSend(v22, "setNotification:", 0);
        }

        v17 = v71;
        v21 = v72;
        goto LABEL_48;
      }
    }
    else
    {
      objc_msgSend(v22, "setGroupIdentifier:", 0);
      if (v20)
        goto LABEL_16;
    }
    p_isa = self->_representingBundlePath;
    v34 = v22;
    goto LABEL_19;
  }
  _AKLogSystem();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = v72;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19202F000, v20, OS_LOG_TYPE_DEFAULT, "Excluding ADP upsell follow up from returned items because feature flag is off.", buf, 2u);
  }
  v22 = 0;
LABEL_48:

  return v22;
}

- (id)_extensionIDFromPayload:(id)a3
{
  void *v4;
  void *v5;
  __CFString **v6;
  __CFString *v7;
  NSObject *v8;
  __CFString *v9;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("extension"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4 || !objc_msgSend(v4, "length"))
    goto LABEL_11;
  if (!objc_msgSend(v5, "isEqual:", CFSTR("data")))
  {
    if (objc_msgSend(v5, "isEqual:", CFSTR("account")))
    {
      v6 = AKFollowUpServerUIExtensionIdentifier;
      goto LABEL_7;
    }
    _AKLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[AKFollowUpFactoryImpl _extensionIDFromPayload:].cold.1((uint64_t)v5, v8);

LABEL_11:
    -[AKFollowUpFactoryImpl extensionIdentifier](self, "extensionIdentifier");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  v6 = AKFollowUpExtensionIdentifierCDP;
LABEL_7:
  v7 = *v6;
LABEL_12:
  v9 = v7;

  return v9;
}

- (id)_actionsFromPayload:(id)a3 pushMessageInfo:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[5];
  id v12;

  v6 = a4;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("actions"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __61__AKFollowUpFactoryImpl__actionsFromPayload_pushMessageInfo___block_invoke;
  v11[3] = &unk_1E2E60B78;
  v11[4] = self;
  v12 = v6;
  v8 = v6;
  objc_msgSend(v7, "aaf_map:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __61__AKFollowUpFactoryImpl__actionsFromPayload_pushMessageInfo___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_actionFromInfo:pushMessageInfo:", a2, *(_QWORD *)(a1 + 40));
}

- (id)_actionFromInfo:(id)a3 pushMessageInfo:(id)a4
{
  id v5;
  id v6;
  objc_class *FLFollowUpActionClass;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;

  v5 = a3;
  v6 = a4;
  FLFollowUpActionClass = (objc_class *)CoreFollowUpLibraryCore();
  if (FLFollowUpActionClass)
    FLFollowUpActionClass = (objc_class *)getFLFollowUpActionClass();
  v8 = objc_alloc_init(FLFollowUpActionClass);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("urlKey"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("AKAction"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("AKNativeAction"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("url"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("localUrlKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("root"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("cmd"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v14, "unsignedIntValue");
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v9)
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v9, CFSTR("ak-action"));
  if (v10)
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v10, CFSTR("ak-native-action"));
  if (v20)
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v20, CFSTR("AKFollowUpServerURL"));
  if (v11)
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v11, CFSTR("AKFollowUpSafariURL"));
  if (v12)
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v12, CFSTR("AKFollowUpLocalURLKey"));
  if (v13)
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v13, CFSTR("AKFollowUpAppleAccountRootKey"));
  if (v15 == 1900)
    objc_msgSend(v8, "setIdentifier:", CFSTR("continuity_push_followup_notification"));
  objc_msgSend(v8, "setUserInfo:", v17);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("title"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLabel:", v18);

  return v8;
}

- (id)_notificationFromPayload:(id)a3 pushMessageInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  objc_class *FLFollowUpNotificationClass;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  int v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  void *v61;
  void *v62;
  NSObject *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  void *v83;
  NSObject *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  id v94;
  id v95;
  AKFollowUpFactoryImpl *v96;
  uint8_t buf[16];
  void *v98;
  void *v99;
  void *v100;
  _QWORD v101[2];
  void *v102;
  _QWORD v103[2];

  v103[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("notification"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("cmd"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedIntValue");

  if (v8)
  {
    FLFollowUpNotificationClass = (objc_class *)CoreFollowUpLibraryCore();
    v95 = v6;
    if (FLFollowUpNotificationClass)
      FLFollowUpNotificationClass = (objc_class *)getFLFollowUpNotificationClass();
    v12 = objc_alloc_init(FLFollowUpNotificationClass);
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("body"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setInformativeText:", v13);

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("title"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTitle:", v14);

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("frequency"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "doubleValue");
    objc_msgSend(v12, "setFrequency:");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("delay"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "doubleValue");
    objc_msgSend(v12, "setFirstNotificationDelay:");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("force"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "BOOLValue");

    v96 = self;
    if (v18)
    {
      objc_msgSend(v12, "options");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = CoreFollowUpLibraryCore();
      if (v20)
      {
        getFLNotificationOptionForce();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v21 = 0;
      }
      v103[0] = v21;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v103, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setByAddingObjectsFromArray:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setOptions:", v24);

      if (v20)
      self = v96;
    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("osAlert"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "BOOLValue");

    if (v26)
    {
      objc_msgSend(v12, "options");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = CoreFollowUpLibraryCore();
      if (v28)
      {
        getFLNotificationOptionSpringboardAlert();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v29 = 0;
      }
      v102 = v29;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v102, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setByAddingObjectsFromArray:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setOptions:", v31);

      if (v28)
      self = v96;
    }
    v94 = v7;
    v32 = v10;
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("osAlertActionOnly"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "BOOLValue");

    if (v34)
    {
      _AKLogSystem();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        -[AKFollowUpFactoryImpl _notificationFromPayload:pushMessageInfo:].cold.3(v35, v36, v37, v38, v39, v40, v41, v42);

      objc_msgSend(v12, "options");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = CoreFollowUpLibraryCore();
      if (v44)
      {
        getFLNotificationOptionSpringboardAlert();
        v45 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v45 = 0;
      }
      v101[0] = v45;
      v46 = CoreFollowUpLibraryCore();
      if (v46)
      {
        getFLNotificationOptionSpringboardAlertActionOnly();
        v47 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v47 = 0;
      }
      v101[1] = v47;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v101, 2);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setByAddingObjectsFromArray:", v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setOptions:", v49);

      if (v46)
      if (v44)

      self = v96;
    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("bannerAlert"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v50, "BOOLValue");

    if (v51)
    {
      objc_msgSend(v12, "options");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = CoreFollowUpLibraryCore();
      if (v53)
      {
        getFLNotificationOptionBannerAlert();
        v54 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v54 = 0;
      }
      v100 = v54;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v100, 1);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "setByAddingObjectsFromArray:", v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setOptions:", v56);

      if (v53)
    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("defbtn"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    if (v57)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("defbtn"));
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKFollowUpFactoryImpl actionWithTitle:andActionKey:](self, "actionWithTitle:andActionKey:", v58, CFSTR("continue"));
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setActivateAction:", v59);

    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("albtn"));
    v60 = objc_claimAutoreleasedReturnValue();
    v22 = v60;
    if (v60 && -[NSObject length](v60, "length"))
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("albtn"));
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKFollowUpFactoryImpl actionWithTitle:andActionKey:](self, "actionWithTitle:andActionKey:", v61, CFSTR("cancel"));
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setClearAction:", v62);

    }
    else
    {
      -[AKFollowUpFactoryImpl _clearAction](self, "_clearAction");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setClearAction:", v61);
    }

    if (v32 == 1900)
    {
      _AKLogSystem();
      v63 = objc_claimAutoreleasedReturnValue();
      v7 = v94;
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
        -[AKFollowUpFactoryImpl _notificationFromPayload:pushMessageInfo:].cold.2(v63, v64, v65, v66, v67, v68, v69, v70);

      -[AKFollowUpFactoryImpl _actionsFromPayload:pushMessageInfo:](self, "_actionsFromPayload:pushMessageInfo:", v95, v94);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "firstObject");
      v72 = (void *)objc_claimAutoreleasedReturnValue();

      if (v72)
      {
        objc_msgSend(v71, "firstObject");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setActivateAction:", v73);

      }
      objc_msgSend(v12, "options");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = CoreFollowUpLibraryCore();
      if (v75)
      {
        getFLNotificationOptionExtensionActions();
        v76 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v76 = 0;
      }
      v99 = v76;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v99, 1);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "setByAddingObjectsFromArray:", v77);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setOptions:", v78);

      if (v75)
      objc_msgSend(v12, "options");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = CoreFollowUpLibraryCore();
      if (v80)
      {
        getFLNotificationOptionExtensionForNotification();
        v81 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v81 = 0;
      }
      v98 = v81;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v98, 1);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "setByAddingObjectsFromArray:", v82);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setOptions:", v83);

      if (v80)
      if (v22 && -[NSObject length](v22, "length"))
      {
        _AKLogSystem();
        v84 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG))
          -[AKFollowUpFactoryImpl _notificationFromPayload:pushMessageInfo:].cold.1(v84, v85, v86, v87, v88, v89, v90, v91);

        -[AKFollowUpFactoryImpl actionWithTitle:andActionKey:](v96, "actionWithTitle:andActionKey:", v22, CFSTR("clear_followup_notification"));
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setClearAction:", v92);

      }
      v6 = v95;
    }
    else
    {
      v7 = v94;
      v6 = v95;
    }
  }
  else
  {
    _AKLogSystem();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19202F000, v22, OS_LOG_TYPE_DEFAULT, "Couldn't find pyaload data to post notification.", buf, 2u);
    }
    v12 = 0;
  }

  return v12;
}

- (id)_clearAction
{
  objc_class *FLFollowUpActionClass;
  id v3;
  void *v4;

  FLFollowUpActionClass = (objc_class *)CoreFollowUpLibraryCore();
  if (FLFollowUpActionClass)
    FLFollowUpActionClass = (objc_class *)getFLFollowUpActionClass();
  v3 = objc_alloc_init(FLFollowUpActionClass);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("clear_followup_notification"), CFSTR("ak-action"));
  objc_msgSend(v3, "setUserInfo:", v4);

  return v3;
}

- (id)actionWithTitle:(id)a3 andActionKey:(id)a4
{
  id v5;
  id v6;
  objc_class *FLFollowUpActionClass;
  id v8;
  void *v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  FLFollowUpActionClass = (objc_class *)CoreFollowUpLibraryCore();
  if (FLFollowUpActionClass)
    FLFollowUpActionClass = (objc_class *)getFLFollowUpActionClass();
  v8 = objc_alloc_init(FLFollowUpActionClass);
  objc_msgSend(v8, "setLabel:", v6);

  v11 = CFSTR("ak-action");
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setUserInfo:", v9);
  return v8;
}

- (BOOL)IsFollowUpItemNotificationForced:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(a3, "notification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "options");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (CoreFollowUpLibraryCore())
  {
    getFLNotificationOptionForce();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "containsObject:", v5);

  }
  else
  {
    v6 = objc_msgSend(v4, "containsObject:", 0);
  }

  return v6;
}

- (NSString)extensionIdentifier
{
  return self->_extensionIdentifier;
}

- (void)setExtensionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)representingBundlePath
{
  return self->_representingBundlePath;
}

- (void)setRepresentingBundlePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)bundleIconName
{
  return self->_bundleIconName;
}

- (void)setBundleIconName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIconName, 0);
  objc_storeStrong((id *)&self->_representingBundlePath, 0);
  objc_storeStrong((id *)&self->_extensionIdentifier, 0);
}

- (void)_itemFromPayload:(uint64_t)a3 pushMessageInfo:(uint64_t)a4 withAltDSID:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_19202F000, a1, a3, "Notification should not be sent.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_7();
}

- (void)_itemFromPayload:(uint64_t)a3 pushMessageInfo:(uint64_t)a4 withAltDSID:(uint64_t)a5 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_19202F000, a2, a3, "Settings a custom icon for the CFU with app id: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_itemFromPayload:(uint64_t)a3 pushMessageInfo:(uint64_t)a4 withAltDSID:(uint64_t)a5 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_19202F000, a2, a3, "Parsing CFU Item Payload: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_extensionIDFromPayload:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_19202F000, a2, OS_LOG_TYPE_ERROR, "Unrecognized follow up extension identifier %{public}@. Please add support for this if necessary. Using extension identifier from factory property.", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)_notificationFromPayload:(uint64_t)a3 pushMessageInfo:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_19202F000, a1, a3, "Continuity push with alternate button title detected.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_7();
}

- (void)_notificationFromPayload:(uint64_t)a3 pushMessageInfo:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_19202F000, a1, a3, "Continuity push detected.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_7();
}

- (void)_notificationFromPayload:(uint64_t)a3 pushMessageInfo:(uint64_t)a4 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_19202F000, a1, a3, "Detected %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end

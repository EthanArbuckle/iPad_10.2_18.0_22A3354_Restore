@implementation HFUserNotificationServiceTopicItem

- (HFUserNotificationServiceTopicItem)initWithHome:(id)a3 topic:(id)a4
{
  id v7;
  id v8;
  HFUserNotificationServiceTopicItem *v9;
  HFUserNotificationServiceTopicItem *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HFUserNotificationServiceTopicItem;
  v9 = -[HFUserNotificationServiceTopicItem init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_home, a3);
    objc_storeStrong((id *)&v10->_topic, a4);
  }

  return v10;
}

- (id)_subclass_updateWithOptions:(id)a3
{
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
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  unsigned int v43;
  void *v44;
  NSObject *v45;
  void *v46;
  int v47;
  int v48;
  void *v49;
  int v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint8_t buf[4];
  _BYTE v62[10];
  void *v63;
  __int16 v64;
  void *v65;
  _QWORD v66[2];

  v66[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_new();
  v6 = (void *)MEMORY[0x1E0C99E60];
  v66[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("dependentHomeKitClasses"));

  -[HFUserNotificationServiceTopicItem topic](self, "topic");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "topicName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("title"));

  -[HFUserNotificationServiceTopicItem topic](self, "topic");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "iconDescriptor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("icon"));

  -[HFUserNotificationServiceTopicItem home](self, "home");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v13, "hf_shouldShowAnnounceFeatureForThisHome"))
    goto LABEL_6;
  -[HFUserNotificationServiceTopicItem topic](self, "topic");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "accessoryCategoryTypes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v15, "containsObject:", *MEMORY[0x1E0CB7A58]) & 1) == 0)
  {

LABEL_6:
    goto LABEL_7;
  }
  -[HFUserNotificationServiceTopicItem topic](self, "topic");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "topicName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  _HFLocalizedStringWithDefaultValue(CFSTR("HFUserNotificationServiceTopicName_Announce"), CFSTR("HFUserNotificationServiceTopicName_Announce"), 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v17, "isEqualToString:", v18);

  if (v19)
  {
    -[HFUserNotificationServiceTopicItem home](self, "home");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "currentUser");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "announceUserSettings");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    -[HFUserNotificationServiceTopicItem _notificationModeToString:](self, "_notificationModeToString:", objc_msgSend(v22, "deviceNotificationMode"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v23, CFSTR("description"));

    objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("Home.HomeSettings.Intercom"), CFSTR("HFResultDisplayAccessibilityIDKey"));
    goto LABEL_25;
  }
LABEL_7:
  -[HFUserNotificationServiceTopicItem topic](self, "topic");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "topicName");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  _HFLocalizedStringWithDefaultValue(CFSTR("HFUserNotificationServiceTopicName_SafetyAndSecurity"), CFSTR("HFUserNotificationServiceTopicName_SafetyAndSecurity"), 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v25, "isEqualToString:", v26);

  if (v27)
  {
    +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "homeManager");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    -[HFUserNotificationServiceTopicItem home](self, "home");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v30, "hf_hasAtleastOneSafetyAndSecuritySupportedAccessory") & 1) != 0)
      v31 = 0;
    else
      v31 = objc_msgSend(v29, "hasOptedToHH2");

    HFLogForCategory(0);
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      -[HFUserNotificationServiceTopicItem home](self, "home");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v62 = objc_msgSend(v41, "hf_hasAtleastOneSafetyAndSecuritySupportedAccessory");
      *(_WORD *)&v62[4] = 1024;
      *(_DWORD *)&v62[6] = objc_msgSend(v29, "hasOptedToHH2");
      _os_log_impl(&dword_1DD34E000, v40, OS_LOG_TYPE_DEFAULT, "Safety Accessory: %{BOOL}d HH2: %{BOOL}d", buf, 0xEu);

    }
    -[HFUserNotificationServiceTopicItem home](self, "home");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v42, "hf_hasEnabledResident") && (objc_msgSend(v29, "hasOptedToHH2") & 1) != 0)
    {
      v43 = 0;
    }
    else
    {
      -[HFUserNotificationServiceTopicItem home](self, "home");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v44, "isEventLogEnabled") ^ 1;

    }
    HFLogForCategory(3uLL);
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      -[HFUserNotificationServiceTopicItem home](self, "home");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v46, "hf_hasEnabledResident");
      v48 = objc_msgSend(v29, "hasOptedToHH2");
      -[HFUserNotificationServiceTopicItem home](self, "home");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v49, "isEventLogEnabled");
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)v62 = v47;
      *(_WORD *)&v62[4] = 1024;
      *(_DWORD *)&v62[6] = v48;
      LOWORD(v63) = 1024;
      *(_DWORD *)((char *)&v63 + 2) = v50;
      _os_log_impl(&dword_1DD34E000, v45, OS_LOG_TYPE_DEFAULT, "Enabled Resident: %{BOOL}d HH2: %{BOOL}d EventLogEnabled: %{BOOL}d", buf, 0x14u);

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v31 & v43);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v51, CFSTR("isDisabled"));

    objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("Home.HomeSettings.SafetyAndSecurity"), CFSTR("HFResultDisplayAccessibilityIDKey"));
  }
  else
  {
    -[HFUserNotificationServiceTopicItem topic](self, "topic");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "topicName");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    _HFLocalizedStringWithDefaultValue(CFSTR("HFUserNotificationServiceTopicName_Energy"), CFSTR("HFUserNotificationServiceTopicName_Energy"), 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v33, "isEqualToString:", v34);

    if (v35)
    {
      HFLogForCategory(0x30uLL);
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[HFUserNotificationServiceTopicItem topic](self, "topic");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "topicName");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)v62 = self;
        *(_WORD *)&v62[8] = 2112;
        v63 = v37;
        v64 = 2112;
        v65 = v39;
        _os_log_impl(&dword_1DD34E000, v36, OS_LOG_TYPE_DEFAULT, "%@:%@ Don't need device count for topic %@", buf, 0x20u);

      }
      objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("Home.HomeSettings.Energy"), CFSTR("HFResultDisplayAccessibilityIDKey"));
    }
    else
    {
      -[HFUserNotificationServiceTopicItem home](self, "home");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFUserNotificationServiceTopicItem topic](self, "topic");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "hf_allObjectsAffectedByServiceTopic:", v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend(v54, "count");

      objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", CFSTR("%lu"), v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v56, CFSTR("description"));

    }
  }
LABEL_25:
  objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("shouldDisableForNonAdminUsers"));
  v57 = (void *)MEMORY[0x1E0D519C0];
  +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v5);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "futureWithResult:", v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  return v59;
}

- (id)_notificationModeToString:(unint64_t)a3
{
  __CFString *v3;
  __CFString *v4;

  switch(a3)
  {
    case 0uLL:
      v3 = CFSTR("HFAnnounceNotificationSetting_NotSet");
      goto LABEL_8;
    case 1uLL:
      v3 = CFSTR("HFAnnounceNotificationSetting_Never");
      goto LABEL_8;
    case 2uLL:
      v3 = CFSTR("HFAnnounceNotificationSetting_AtHome");
      goto LABEL_8;
    case 3uLL:
      v3 = CFSTR("HFAnnounceNotificationSetting_Always");
LABEL_8:
      _HFLocalizedStringWithDefaultValue(v3, v3, 1);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v4 = &stru_1EA741FF8;
      break;
  }
  return v4;
}

- (HMHome)home
{
  return self->_home;
}

- (HFUserNotificationServiceTopic)topic
{
  return self->_topic;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topic, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end

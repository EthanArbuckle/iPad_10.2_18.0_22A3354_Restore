@implementation HUStatusAndNotificationsItemManager

- (HUStatusAndNotificationsItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithServiceItem_delegate_home_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUStatusAndNotificationsItemManager.m"), 63, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUStatusAndNotificationsItemManager initWithDelegate:sourceItem:]",
    v7);

  return 0;
}

- (HUStatusAndNotificationsItemManager)initWithServiceItem:(id)a3 delegate:(id)a4 home:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  HUStatusAndNotificationsItemManager *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  uint64_t v27;
  HUTriggerConditionEditorItemModule *v28;
  HUTriggerConditionEditorItemModule *conditionModule;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  HUAudioAnalysisDetectionSettingsModule *v34;
  HUAudioAnalysisDetectionSettingsModule *audioAnalysisDetectionSettingsModule;
  HUCameraSmartDetectionSettingsModule *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  HUCameraSmartDetectionSettingsModule *cameraSmartDetectionSettingsModule;
  void *v42;
  objc_super v44;

  v9 = a3;
  v10 = a5;
  v11 = a4;
  v12 = (void *)objc_msgSend(v9, "copy");
  v44.receiver = self;
  v44.super_class = (Class)HUStatusAndNotificationsItemManager;
  v13 = -[HFItemManager initWithDelegate:sourceItem:](&v44, sel_initWithDelegate_sourceItem_, v11, v12);

  if (v13)
  {
    objc_storeStrong((id *)&v13->_serviceItem, a3);
    objc_storeStrong((id *)&v13->_overrideHome, a5);
    -[HUStatusAndNotificationsItemManager notificationSettings](v13, "notificationSettings");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
LABEL_21:
      -[HUStatusAndNotificationsItemManager homeStatusVisibleObject](v13, "homeStatusVisibleObject");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v13->_showStatusSection = v42 != 0;

      goto LABEL_22;
    }
    v15 = objc_alloc(MEMORY[0x1E0D31308]);
    v16 = (void *)objc_msgSend(v15, "initWithConditions:", MEMORY[0x1E0C9AA60]);
    objc_msgSend(v14, "smartCameraNotificationCondition");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v18 = (void *)MEMORY[0x1E0D31308];
      objc_msgSend(v14, "smartCameraNotificationCondition");
      v19 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v14, "notificationCondition");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v20)
      {
LABEL_8:
        objc_msgSend(MEMORY[0x1E0C99E60], "set");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v24 = v9;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v25 = v24;
        else
          v25 = 0;
        v26 = v25;

        if (v26
          || -[HUStatusAndNotificationsItemManager _isAudioAnalysisSupportedDevice](v13, "_isAudioAnalysisSupportedDevice"))
        {
          objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", &unk_1E7040978);
          v27 = objc_claimAutoreleasedReturnValue();

          v23 = (void *)v27;
        }
        v28 = -[HUTriggerConditionEditorItemModule initWithItemUpdater:home:conditionCollection:disallowedConditionTypes:]([HUTriggerConditionEditorItemModule alloc], "initWithItemUpdater:home:conditionCollection:disallowedConditionTypes:", v13, v10, v16, v23);
        conditionModule = v13->_conditionModule;
        v13->_conditionModule = v28;

        if (-[HUStatusAndNotificationsItemManager _isAudioAnalysisSupportedDevice](v13, "_isAudioAnalysisSupportedDevice"))
        {
          -[HUStatusAndNotificationsItemManager _sourceItemAsMediaAccessoryItem](v13, "_sourceItemAsMediaAccessoryItem");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = v30;
          if (v30)
          {
            objc_msgSend(v30, "accessories");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "anyObject");
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            v34 = -[HUAudioAnalysisDetectionSettingsModule initWithItemUpdater:accessory:]([HUAudioAnalysisDetectionSettingsModule alloc], "initWithItemUpdater:accessory:", v13, v33);
            audioAnalysisDetectionSettingsModule = v13->_audioAnalysisDetectionSettingsModule;
            v13->_audioAnalysisDetectionSettingsModule = v34;

          }
        }
        if (v26)
        {
          v36 = [HUCameraSmartDetectionSettingsModule alloc];
          v37 = (void *)MEMORY[0x1E0C99E60];
          objc_msgSend(v26, "profile");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "setWithObject:", v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = -[HUCameraSmartDetectionSettingsModule initWithItemUpdater:cameraProfiles:conditionCollection:settingsContext:](v36, "initWithItemUpdater:cameraProfiles:conditionCollection:settingsContext:", v13, v39, v16, 1);
          cameraSmartDetectionSettingsModule = v13->_cameraSmartDetectionSettingsModule;
          v13->_cameraSmartDetectionSettingsModule = (HUCameraSmartDetectionSettingsModule *)v40;

        }
        goto LABEL_21;
      }
      v18 = (void *)MEMORY[0x1E0D31308];
      objc_msgSend(v14, "notificationCondition");
      v19 = objc_claimAutoreleasedReturnValue();
    }
    v21 = (void *)v19;
    objc_msgSend(v18, "conditionCollectionForPredicate:", v19);
    v22 = objc_claimAutoreleasedReturnValue();

    v16 = (void *)v22;
    goto LABEL_8;
  }
LABEL_22:

  return v13;
}

- (void)setShowStatusSection:(BOOL)a3
{
  void *v5;
  id v6;

  if (a3
    && (-[HUStatusAndNotificationsItemManager homeStatusVisibleObject](self, "homeStatusVisibleObject"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        !v5))
  {
    -[HUStatusAndNotificationsItemManager serviceItem](self, "serviceItem");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Cannot show status for an item that does not support status (%@)!"), v6);

  }
  else
  {
    self->_showStatusSection = a3;
  }
}

- (BOOL)showsChimeOnHomePodSection
{
  void *v3;
  void *v4;
  BOOL v5;

  if (!-[HUStatusAndNotificationsItemManager hasDoorbellCamera](self, "hasDoorbellCamera"))
    return 0;
  -[HFItemManager home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hf_allHomePodsOrStereoPairsThatWillChime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (BOOL)showsCameraSnapshotSection
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;

  objc_opt_class();
  -[HUStatusAndNotificationsItemManager serviceItem](self, "serviceItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    objc_msgSend(v5, "profile");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "userSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = ((unint64_t)objc_msgSend(v7, "supportedFeatures") >> 5) & 1;

  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (BOOL)areNotificationsEnabled
{
  void *v3;
  char v4;
  BOOL v5;

  if (-[HUStatusAndNotificationsItemManager hasDoorbellCamera](self, "hasDoorbellCamera")
    && -[HUStatusAndNotificationsItemManager cameraProfileSupportsSmartNotifications](self, "cameraProfileSupportsSmartNotifications"))
  {
    -[HUStatusAndNotificationsItemManager notificationSettings](self, "notificationSettings");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "areSmartDetectionNotificationsEnabled");
  }
  else
  {
    -[HUStatusAndNotificationsItemManager notificationSettings](self, "notificationSettings");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "areNotificationsEnabled");
  }
  v5 = v4;

  return v5;
}

- (BOOL)showsTriggerConditionSection
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v13;

  -[HFItemManager home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentUser");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "hf_userIsRestrictedGuest:", v5);

  if ((v6 & 1) != 0)
  {
    LOBYTE(v7) = 0;
    return v7;
  }
  objc_opt_class();
  -[HUStatusAndNotificationsItemManager serviceItem](self, "serviceItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;

  if (!v9)
  {
    -[HUStatusAndNotificationsItemManager notificationSettings](self, "notificationSettings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "areNotificationsEnabled"))
      v7 = !-[HUStatusAndNotificationsItemManager serviceItemBelongsToCamera](self, "serviceItemBelongsToCamera");
    else
      LOBYTE(v7) = 0;

    return v7;
  }
  if (!-[HUStatusAndNotificationsItemManager isNonHKSVCameraDoorbell](self, "isNonHKSVCameraDoorbell"))
    return -[HUStatusAndNotificationsItemManager areNotificationsEnabled](self, "areNotificationsEnabled");
  -[HUStatusAndNotificationsItemManager notificationSettings](self, "notificationSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "areMotionNotificationsEnabled");

  return v11;
}

- (BOOL)showsActivityNotificationsSection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;

  -[HUStatusAndNotificationsItemManager _sourceItemAsMediaAccessoryItem](self, "_sourceItemAsMediaAccessoryItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "anyObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUStatusAndNotificationsItemManager notificationSettings](self, "notificationSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && !-[HUStatusAndNotificationsItemManager serviceItemBelongsToCamera](self, "serviceItemBelongsToCamera"))
    v7 = objc_msgSend(v5, "hf_isHomePod") ^ 1;
  else
    LOBYTE(v7) = 0;

  return v7;
}

- (BOOL)isNonHKSVCameraDoorbell
{
  _BOOL4 v3;

  v3 = -[HUStatusAndNotificationsItemManager hasDoorbellCamera](self, "hasDoorbellCamera");
  if (v3)
    LOBYTE(v3) = !-[HUStatusAndNotificationsItemManager cameraProfileSupportsSmartNotifications](self, "cameraProfileSupportsSmartNotifications");
  return v3;
}

- (BOOL)cameraProfileSupportsSmartNotifications
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  char v10;
  char v11;

  objc_opt_class();
  -[HUStatusAndNotificationsItemManager serviceItem](self, "serviceItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(v5, "profile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hf_supportsRecordingEvents");

  objc_msgSend(v5, "accessory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hf_hasCameraRecordingResident");

  if (v5)
    v11 = v7;
  else
    v11 = 0;
  return v11 & v10;
}

- (BOOL)showsCameraSmartNotificationSection
{
  void *v3;
  void *v4;
  id v5;
  BOOL v6;
  void *v7;
  void *v8;
  char v9;
  char v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  char v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  -[HUStatusAndNotificationsItemManager serviceItem](self, "serviceItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  v6 = -[HUStatusAndNotificationsItemManager hasDoorbellCamera](self, "hasDoorbellCamera");
  -[HUStatusAndNotificationsItemManager notificationSettings](self, "notificationSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
    v9 = objc_msgSend(v7, "areSmartDetectionNotificationsEnabled");
  else
    v9 = objc_msgSend(v7, "areNotificationsEnabled");
  v10 = v9;

  objc_msgSend(v5, "profile");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hf_supportsRecordingEvents");

  objc_msgSend(v5, "accessory");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "home");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "hf_hasCameraRecordingResident");

  HFLogForCategory();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v5, "accessory");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "home");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromBOOL();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromBOOL();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromBOOL();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138413058;
    v24 = v18;
    v25 = 2112;
    v26 = v19;
    v27 = 2112;
    v28 = v20;
    v29 = 2112;
    v30 = v21;
    _os_log_impl(&dword_1B8E1E000, v16, OS_LOG_TYPE_INFO, "Performing check for show camera smart notification section. home: %@, notificationsEnabled: %@, camera supports recording: %@, home has recording resident: %@", (uint8_t *)&v23, 0x2Au);

  }
  if (!v5)
    v10 = 0;

  return v10 & v12 & v15;
}

- (BOOL)hasDoorbellCamera
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  BOOL v8;

  objc_opt_class();
  -[HUStatusAndNotificationsItemManager serviceItem](self, "serviceItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    objc_msgSend(v5, "accessory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hf_serviceOfType:", *MEMORY[0x1E0CB9A08]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7 != 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)showsCameraStatusChangeSection
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_opt_class();
  -[HUStatusAndNotificationsItemManager serviceItem](self, "serviceItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(v5, "profile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v6, "hf_supportsRecordingEvents");
  return (char)v5;
}

- (BOOL)showsSmartActivitySection
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  objc_opt_class();
  -[HUStatusAndNotificationsItemManager serviceItem](self, "serviceItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(v5, "profile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "hf_supportsRecordingEvents"))
  {
    objc_msgSend(v5, "accessory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "home");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "hf_hasCameraRecordingResident");

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)showsAudioNotificationSection
{
  void *v3;
  BOOL v4;

  -[HUStatusAndNotificationsItemManager notificationSettings](self, "notificationSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = -[HUStatusAndNotificationsItemManager _isAudioAnalysisSupportedDevice](self, "_isAudioAnalysisSupportedDevice");
  else
    v4 = 0;

  return v4;
}

- (BOOL)serviceItemBelongsToCamera
{
  void *v2;
  void *v3;

  v2 = (void *)MEMORY[0x1E0D31228];
  -[HUStatusAndNotificationsItemManager serviceItem](self, "serviceItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v2, "cameraContainsMotionServiceItem:", v3);

  return (char)v2;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  id v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  HUChimeOnAccessoriesListItem *v14;
  void *v15;
  HUChimeOnAccessoriesListItem *v16;
  void *v17;
  HUServiceDetailsCameraAllowSnapshotsItem *v18;
  void *v19;
  HUServiceDetailsCameraAllowSnapshotsItem *v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
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
  id v53;
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
  void *v65;
  void *v66;
  void *v67;
  id v69;
  id v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  _QWORD v75[4];
  id v76;
  _QWORD v77[4];
  id v78;
  id v79;
  char v80;
  _QWORD v81[4];
  id v82;
  id v83;
  char v84;
  _QWORD v85[4];
  id v86;
  id v87;
  char v88;
  _QWORD v89[4];
  id v90;
  id v91;
  id v92;
  char v93;
  _QWORD v94[4];
  id v95;
  id v96;
  char v97;
  _QWORD v98[4];
  id v99;
  id v100;
  char v101;
  _QWORD v102[4];
  id v103;
  id v104;
  char v105;
  _QWORD v106[4];
  id v107;
  id v108;
  id location;
  _QWORD v110[13];

  v110[11] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v5 = objc_msgSend(v4, "areBulletinNotificationsSupported");
  v6 = (void *)MEMORY[0x1E0C99E20];
  -[HUStatusAndNotificationsItemManager serviceItem](self, "serviceItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "homeKitObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "na_setWithSafeObject:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "addObject:", v4);
  v10 = objc_alloc(MEMORY[0x1E0D31840]);
  v11 = MEMORY[0x1E0C809B0];
  v106[0] = MEMORY[0x1E0C809B0];
  v106[1] = 3221225472;
  v106[2] = __66__HUStatusAndNotificationsItemManager__buildItemProvidersForHome___block_invoke;
  v106[3] = &unk_1E6F518D0;
  objc_copyWeak(&v108, &location);
  v12 = v9;
  v107 = v12;
  v13 = (void *)objc_msgSend(v10, "initWithResultsBlock:", v106);
  -[HUStatusAndNotificationsItemManager setIncludeInStatusItem:](self, "setIncludeInStatusItem:", v13);

  v14 = [HUChimeOnAccessoriesListItem alloc];
  -[HFItemManager home](self, "home");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[HUChimeOnAccessoriesListItem initWithHome:](v14, "initWithHome:", v15);
  -[HUStatusAndNotificationsItemManager setChimeOnAccessoriesListItem:](self, "setChimeOnAccessoriesListItem:", v16);

  -[HUStatusAndNotificationsItemManager notificationSettings](self, "notificationSettings");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = [HUServiceDetailsCameraAllowSnapshotsItem alloc];
  -[HUStatusAndNotificationsItemManager serviceItem](self, "serviceItem");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[HUServiceDetailsCameraAllowSnapshotsItem initWithSourceServiceItem:home:shouldBeHidden:](v18, "initWithSourceServiceItem:home:shouldBeHidden:", v19, v4, v17 == 0);
  -[HUStatusAndNotificationsItemManager setAllowCameraSnapshotsItem:](self, "setAllowCameraSnapshotsItem:", v20);

  v21 = objc_alloc(MEMORY[0x1E0D31840]);
  v102[0] = v11;
  v102[1] = 3221225472;
  v102[2] = __66__HUStatusAndNotificationsItemManager__buildItemProvidersForHome___block_invoke_2;
  v102[3] = &unk_1E6F518F8;
  objc_copyWeak(&v104, &location);
  v105 = v5;
  v22 = v12;
  v103 = v22;
  v23 = (void *)objc_msgSend(v21, "initWithResultsBlock:", v102);
  -[HUStatusAndNotificationsItemManager setAllowNotificationsItem:](self, "setAllowNotificationsItem:", v23);

  v24 = objc_alloc(MEMORY[0x1E0D31840]);
  v98[0] = v11;
  v98[1] = 3221225472;
  v98[2] = __66__HUStatusAndNotificationsItemManager__buildItemProvidersForHome___block_invoke_3;
  v98[3] = &unk_1E6F518F8;
  objc_copyWeak(&v100, &location);
  v101 = v5;
  v25 = v22;
  v99 = v25;
  v26 = (void *)objc_msgSend(v24, "initWithResultsBlock:", v98);
  -[HUStatusAndNotificationsItemManager setAllowMotionNotificationsItem:](self, "setAllowMotionNotificationsItem:", v26);

  v27 = objc_alloc(MEMORY[0x1E0D31840]);
  v94[0] = v11;
  v94[1] = 3221225472;
  v94[2] = __66__HUStatusAndNotificationsItemManager__buildItemProvidersForHome___block_invoke_4;
  v94[3] = &unk_1E6F518F8;
  objc_copyWeak(&v96, &location);
  v97 = v5;
  v28 = v25;
  v95 = v28;
  v29 = (void *)objc_msgSend(v27, "initWithResultsBlock:", v94);
  -[HUStatusAndNotificationsItemManager setAllowDoorbellNotificationsItem:](self, "setAllowDoorbellNotificationsItem:", v29);

  v30 = objc_alloc(MEMORY[0x1E0D31840]);
  v89[0] = v11;
  v89[1] = 3221225472;
  v89[2] = __66__HUStatusAndNotificationsItemManager__buildItemProvidersForHome___block_invoke_5;
  v89[3] = &unk_1E6F51920;
  objc_copyWeak(&v92, &location);
  v93 = v5;
  v70 = v4;
  v90 = v70;
  v31 = v28;
  v91 = v31;
  v32 = (void *)objc_msgSend(v30, "initWithResultsBlock:", v89);
  -[HUStatusAndNotificationsItemManager setAllowAnalogChimeNotificationItem:](self, "setAllowAnalogChimeNotificationItem:", v32);

  v33 = objc_alloc(MEMORY[0x1E0D31840]);
  v85[0] = v11;
  v85[1] = 3221225472;
  v85[2] = __66__HUStatusAndNotificationsItemManager__buildItemProvidersForHome___block_invoke_6;
  v85[3] = &unk_1E6F518F8;
  objc_copyWeak(&v87, &location);
  v88 = v5;
  v34 = v31;
  v86 = v34;
  v35 = (void *)objc_msgSend(v33, "initWithResultsBlock:", v85);
  -[HUStatusAndNotificationsItemManager setAllowCameraStatusChangesItem:](self, "setAllowCameraStatusChangesItem:", v35);

  v36 = objc_alloc(MEMORY[0x1E0D31840]);
  v81[0] = v11;
  v81[1] = 3221225472;
  v81[2] = __66__HUStatusAndNotificationsItemManager__buildItemProvidersForHome___block_invoke_7;
  v81[3] = &unk_1E6F518F8;
  objc_copyWeak(&v83, &location);
  v84 = v5;
  v37 = v34;
  v82 = v37;
  v38 = (void *)objc_msgSend(v36, "initWithResultsBlock:", v81);
  -[HUStatusAndNotificationsItemManager setAllowCameraReachabilityChangeNotificationsItem:](self, "setAllowCameraReachabilityChangeNotificationsItem:", v38);

  v39 = objc_alloc(MEMORY[0x1E0D31840]);
  v77[0] = v11;
  v77[1] = 3221225472;
  v77[2] = __66__HUStatusAndNotificationsItemManager__buildItemProvidersForHome___block_invoke_8;
  v77[3] = &unk_1E6F518F8;
  objc_copyWeak(&v79, &location);
  v80 = v5;
  v69 = v37;
  v78 = v69;
  v40 = (void *)objc_msgSend(v39, "initWithResultsBlock:", v77);
  -[HUStatusAndNotificationsItemManager setAllowActivityNotificationsItem:](self, "setAllowActivityNotificationsItem:", v40);

  v41 = objc_alloc(MEMORY[0x1E0D31840]);
  v75[0] = v11;
  v75[1] = 3221225472;
  v75[2] = __66__HUStatusAndNotificationsItemManager__buildItemProvidersForHome___block_invoke_9;
  v75[3] = &unk_1E6F4C4E8;
  objc_copyWeak(&v76, &location);
  v42 = (void *)objc_msgSend(v41, "initWithResultsBlock:", v75);
  -[HUStatusAndNotificationsItemManager setAllowAudioNotificationsItem:](self, "setAllowAudioNotificationsItem:", v42);

  -[HUStatusAndNotificationsItemManager includeInStatusItem](self, "includeInStatusItem");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v110[0] = v73;
  -[HUStatusAndNotificationsItemManager chimeOnAccessoriesListItem](self, "chimeOnAccessoriesListItem");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v110[1] = v72;
  -[HUStatusAndNotificationsItemManager allowCameraSnapshotsItem](self, "allowCameraSnapshotsItem");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v110[2] = v71;
  -[HUStatusAndNotificationsItemManager allowCameraStatusChangesItem](self, "allowCameraStatusChangesItem");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v110[3] = v43;
  -[HUStatusAndNotificationsItemManager allowCameraReachabilityChangeNotificationsItem](self, "allowCameraReachabilityChangeNotificationsItem");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v110[4] = v44;
  -[HUStatusAndNotificationsItemManager allowNotificationsItem](self, "allowNotificationsItem");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v110[5] = v45;
  -[HUStatusAndNotificationsItemManager allowAudioNotificationsItem](self, "allowAudioNotificationsItem");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v110[6] = v46;
  -[HUStatusAndNotificationsItemManager allowMotionNotificationsItem](self, "allowMotionNotificationsItem");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v110[7] = v47;
  -[HUStatusAndNotificationsItemManager allowAnalogChimeNotificationItem](self, "allowAnalogChimeNotificationItem");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v110[8] = v48;
  -[HUStatusAndNotificationsItemManager allowDoorbellNotificationsItem](self, "allowDoorbellNotificationsItem");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v110[9] = v49;
  -[HUStatusAndNotificationsItemManager allowActivityNotificationsItem](self, "allowActivityNotificationsItem");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v110[10] = v50;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v110, 11);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "addObjectsFromArray:", v51);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_alloc(MEMORY[0x1E0D31848]);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v74);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = (void *)objc_msgSend(v53, "initWithItems:", v54);
  objc_msgSend(v52, "addObject:", v55);

  -[HUStatusAndNotificationsItemManager conditionModule](self, "conditionModule");
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  if (v56)
  {
    -[HUStatusAndNotificationsItemManager conditionModule](self, "conditionModule");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "itemProviders");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "allObjects");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "addObjectsFromArray:", v59);

  }
  -[HUStatusAndNotificationsItemManager cameraSmartDetectionSettingsModule](self, "cameraSmartDetectionSettingsModule");
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  if (v60)
  {
    -[HUStatusAndNotificationsItemManager cameraSmartDetectionSettingsModule](self, "cameraSmartDetectionSettingsModule");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "itemProviders");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "allObjects");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "addObjectsFromArray:", v63);

  }
  -[HUStatusAndNotificationsItemManager audioAnalysisDetectionSettingsModule](self, "audioAnalysisDetectionSettingsModule");
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  if (v64)
  {
    -[HUStatusAndNotificationsItemManager audioAnalysisDetectionSettingsModule](self, "audioAnalysisDetectionSettingsModule");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "itemProviders");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "allObjects");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "addObjectsFromArray:", v67);

  }
  objc_destroyWeak(&v76);

  objc_destroyWeak(&v79);
  objc_destroyWeak(&v83);

  objc_destroyWeak(&v87);
  objc_destroyWeak(&v92);

  objc_destroyWeak(&v96);
  objc_destroyWeak(&v100);

  objc_destroyWeak(&v104);
  objc_destroyWeak(&v108);

  objc_destroyWeak(&location);
  return v52;
}

id __66__HUStatusAndNotificationsItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUStatusAndNotificationsIncludeInStatusTitle"), CFSTR("HUStatusAndNotificationsIncludeInStatusTitle"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0D30D18]);

  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("HUStatusAndNotificationsIncludeInStatusTitle"), *MEMORY[0x1E0D30D20]);
  v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0D30B80]);

  objc_msgSend(WeakRetained, "homeStatusVisibleObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6
    && (v7 = (void *)v6,
        objc_msgSend(WeakRetained, "homeStatusVisibleObject"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "hf_supportsHomeStatus"),
        v8,
        v7,
        v9))
  {
    objc_msgSend(WeakRetained, "homeStatusVisibleObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "hf_isVisibleInHomeStatus") & 1) == 0)
    {
      objc_msgSend(WeakRetained, "homeStatusVisibleObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "hf_hasSetVisibleInHomeStatus");

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", HFPrimaryStateFromBOOL());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0D30E20]);

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30D70]);
  }
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id __66__HUStatusAndNotificationsItemManager__buildItemProvidersForHome___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "notificationSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "areNotificationsEnabled");
    objc_msgSend(v6, "numberWithInteger:", HFPrimaryStateFromBOOL());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0D30E20]);

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30D70]);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_BYTE *)(a1 + 48) == 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0D30C80]);

  _HULocalizedStringWithDefaultValue(CFSTR("HUStatusAndNotificationsAllowNotifications"), CFSTR("HUStatusAndNotificationsAllowNotifications"), 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0D30D18]);

  v10 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0D30B80]);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __66__HUStatusAndNotificationsItemManager__buildItemProvidersForHome___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(WeakRetained, "serviceItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(WeakRetained, "notificationSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "areMotionNotificationsEnabled");
    objc_msgSend(v6, "numberWithInteger:", HFPrimaryStateFromBOOL());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0D30E20]);

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30D70]);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_BYTE *)(a1 + 48) == 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0D30C80]);

  _HULocalizedStringWithDefaultValue(CFSTR("HUStatusAndNotificationMotionNotificationsTitle"), CFSTR("HUStatusAndNotificationMotionNotificationsTitle"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0D30D18]);

  objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D30CE8]);
  v11 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0D30B80]);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id __66__HUStatusAndNotificationsItemManager__buildItemProvidersForHome___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(WeakRetained, "serviceItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(WeakRetained, "notificationSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "areDoorbellNotificationsEnabled");
    objc_msgSend(v6, "numberWithInteger:", HFPrimaryStateFromBOOL());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0D30E20]);

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30D70]);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_BYTE *)(a1 + 48) == 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0D30C80]);

  _HULocalizedStringWithDefaultValue(CFSTR("HUStatusAndNotificationDoorbellNotificationsTitle"), CFSTR("HUStatusAndNotificationDoorbellNotificationsTitle"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0D30D18]);

  objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D30CE8]);
  v11 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0D30B80]);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id __66__HUStatusAndNotificationsItemManager__buildItemProvidersForHome___block_invoke_5(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(WeakRetained, "serviceItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(v6, "profile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "hf_doorbellChimeMuteCharacteristic");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v9 = v8 == 0;
  else
    v9 = 1;
  if (v9 || (objc_msgSend(WeakRetained, "showsForServiceDetails") & 1) != 0)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30D70]);
  }
  else
  {
    objc_opt_class();
    objc_msgSend(v8, "value");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    v12 = v11;

    objc_msgSend(v12, "BOOLValue");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", HFPrimaryStateFromBOOL());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0D30E20]);

  }
  v14 = 1;
  _HULocalizedStringWithDefaultValue(CFSTR("HUCameraDoorbellChimeMuteSwitchTitle"), CFSTR("HUCameraDoorbellChimeMuteSwitchTitle"), 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0D30D18]);

  if (*(_BYTE *)(a1 + 56))
    v14 = objc_msgSend(*(id *)(a1 + 32), "hf_currentUserIsAdministrator") ^ 1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0D30C80]);

  v17 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0D30B80]);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

id __66__HUStatusAndNotificationsItemManager__buildItemProvidersForHome___block_invoke_6(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(WeakRetained, "serviceItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v6, "profile");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "userSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "isAccessModeChangeNotificationEnabled");
    objc_msgSend(v7, "numberWithInteger:", HFPrimaryStateFromBOOL());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0D30E20]);

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30D70]);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_BYTE *)(a1 + 48) == 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0D30C80]);

  _HULocalizedStringWithDefaultValue(CFSTR("HUStatusAndNotificationsCameraStatusChangesTitle"), CFSTR("HUStatusAndNotificationsCameraStatusChangesTitle"), 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0D30D18]);

  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("HUStatusAndNotificationsCameraStatusChangesTitle"), *MEMORY[0x1E0D30D20]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D30CE8]);
  v13 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0D30B80]);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

id __66__HUStatusAndNotificationsItemManager__buildItemProvidersForHome___block_invoke_7(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(WeakRetained, "serviceItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(v6, "profile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hf_supportsReachabilityNotifications");

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v6, "profile");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "userSettings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "isReachabilityEventNotificationEnabled");
    objc_msgSend(v9, "numberWithInteger:", HFPrimaryStateFromBOOL());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0D30E20]);

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30D70]);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_BYTE *)(a1 + 48) == 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0D30C80]);

  _HULocalizedStringWithDefaultValue(CFSTR("HUStatusAndNotificationsCameraReachabilityChangesTitle"), CFSTR("HUStatusAndNotificationsCameraReachabilityChangesTitle"), 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0D30D18]);

  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("HUStatusAndNotificationsCameraReachabilityChangesTitle"), *MEMORY[0x1E0D30D20]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D30CE8]);
  v15 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0D30B80]);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

id __66__HUStatusAndNotificationsItemManager__buildItemProvidersForHome___block_invoke_8(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(WeakRetained, "showsActivityNotificationsSection"))
  {
    v4 = objc_msgSend(WeakRetained, "isNonHKSVCameraDoorbell");
    v5 = (void *)MEMORY[0x1E0CB37E8];
    if (v4)
    {
      objc_msgSend(WeakRetained, "notificationSettings");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "areMotionNotificationsEnabled");
      objc_msgSend(v5, "numberWithInteger:", HFPrimaryStateFromBOOL());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0D30E20]);

    }
    else
    {
      objc_msgSend(WeakRetained, "areNotificationsEnabled");
      objc_msgSend(v5, "numberWithInteger:", HFPrimaryStateFromBOOL());
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0D30E20]);

    }
  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30D70]);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_BYTE *)(a1 + 48) == 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0D30C80]);

  objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D30CE8]);
  _HULocalizedStringWithDefaultValue(CFSTR("HUStatusAndNotificationActivityNotificationsTitle"), CFSTR("HUStatusAndNotificationActivityNotificationsTitle"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0D30D18]);

  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("HUStatusAndNotificationActivityNotificationsTitle"), *MEMORY[0x1E0D30D20]);
  v11 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0D30B80]);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id __66__HUStatusAndNotificationsItemManager__buildItemProvidersForHome___block_invoke_9(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(WeakRetained, "showsAudioNotificationSection"))
  {
    v3 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(WeakRetained, "areNotificationsEnabled");
    objc_msgSend(v3, "numberWithInteger:", HFPrimaryStateFromBOOL());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0D30E20]);

  }
  else
  {
    objc_msgSend(v2, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30D70]);
  }
  objc_msgSend(v2, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D30CE8]);
  _HULocalizedStringWithDefaultValue(CFSTR("HUNotificationsTitle"), CFSTR("HUNotificationsTitle"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0D30D18]);

  v6 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(WeakRetained, "serviceItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "homeKitObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "na_setWithSafeObject:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0D30B80]);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  __CFString *v29;
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
  void *v42;
  id v43;
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
  void *v65;
  unint64_t v66;
  __CFString *v67;
  void *v68;
  void *v69;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  uint8_t buf[4];
  const char *v83;
  __int16 v84;
  int v85;
  __int16 v86;
  uint64_t v87;
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUStatusAndNotificationsItemManager _sourceItemAsMediaAccessoryItem](self, "_sourceItemAsMediaAccessoryItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessories");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "anyObject");
  v71 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "homeManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hasOptedToHH2");

  -[HFItemManager home](self, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "residentDevices");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 && objc_msgSend(v12, "count"))
    v13 = 1;
  else
    v13 = v10 ^ 1;
  HFLogForCategory();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v83 = "-[HUStatusAndNotificationsItemManager _buildSectionsWithDisplayedItems:]";
    v84 = 1024;
    v85 = v10;
    v86 = 2048;
    v87 = objc_msgSend(v12, "count");
    _os_log_impl(&dword_1B8E1E000, v14, OS_LOG_TYPE_DEFAULT, "%s hasOptedToHH2 = %{BOOL}d residents = %lu", buf, 0x1Cu);
  }

  if (-[HUStatusAndNotificationsItemManager showStatusSection](self, "showStatusSection"))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUStatusAndNotificationsIncludeInStatusSectionIdentifier"));
    -[HUStatusAndNotificationsItemManager includeInStatusItem](self, "includeInStatusItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v81, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setItems:", v17);

    -[HUStatusAndNotificationsItemManager homeStatusVisibleObject](self, "homeStatusVisibleObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v17) = objc_msgSend(v18, "hf_isForcedVisibleInHomeStatus");

    if ((_DWORD)v17)
      v19 = CFSTR("HUStatusAndNotificationsAlwaysIncludedInStatusFooter");
    else
      v19 = CFSTR("HUStatusAndNotificationsIncludeInStatusFooter");
    _HULocalizedStringWithDefaultValue(v19, v19, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setFooterTitle:", v20);

    objc_msgSend(v5, "addObject:", v15);
  }
  if (v13)
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("Activity"));
    -[HUStatusAndNotificationsItemManager allowActivityNotificationsItem](self, "allowActivityNotificationsItem");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v80, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setItems:", v23);

    if (-[HUStatusAndNotificationsItemManager cameraProfileSupportsSmartNotifications](self, "cameraProfileSupportsSmartNotifications"))
    {
      _HULocalizedStringWithDefaultValue(CFSTR("HUStatusAndNotificationsAllowNotificationsFooter"), CFSTR("HUStatusAndNotificationsAllowNotificationsFooter"), 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setFooterTitle:", v24);

    }
    objc_msgSend(v5, "addObject:", v21, v71);

  }
  if (-[HUStatusAndNotificationsItemManager showsAudioNotificationSection](self, "showsAudioNotificationSection", v71))
  {
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUStatusAndNotificationsAllowAudioNotificationsSectionIdentifier"));
    -[HUStatusAndNotificationsItemManager allowAudioNotificationsItem](self, "allowAudioNotificationsItem");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v79, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setItems:", v27);

    objc_msgSend(v5, "addObject:", v25);
  }
  if ((-[HUStatusAndNotificationsItemManager showsTriggerConditionSection](self, "showsTriggerConditionSection") & v13) == 1
    && (objc_msgSend(v72, "hf_isHomePod")
     && -[HUStatusAndNotificationsItemManager showsAudioNotificationSection](self, "showsAudioNotificationSection")
     || (objc_msgSend(v72, "hf_isHomePod") & 1) == 0))
  {
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUStatusAndNotificationsConditionSectionIdentifier"));
    if (-[HUStatusAndNotificationsItemManager showsCameraSmartNotificationSection](self, "showsCameraSmartNotificationSection"))
    {
      v29 = CFSTR("HUStatusAndNotificationCameraMotionHeader");
    }
    else
    {
      v29 = CFSTR("HUStatusAndNotificationsConditionTitle");
    }
    _HULocalizedStringWithDefaultValue(v29, v29, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setHeaderTitle:", v30);

    v31 = (void *)objc_opt_new();
    -[HUStatusAndNotificationsItemManager conditionModule](self, "conditionModule");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "buildSectionsWithDisplayedItems:", v4);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v33, "na_flatMap:", &__block_literal_global_63);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addObjectsFromArray:", v34);

    objc_msgSend(v28, "setItems:", v31);
    objc_msgSend(v5, "addObject:", v28);

  }
  if ((-[HUStatusAndNotificationsItemManager showsCameraSmartNotificationSection](self, "showsCameraSmartNotificationSection") & v13) == 1)
  {
    -[HUStatusAndNotificationsItemManager cameraSmartDetectionSettingsModule](self, "cameraSmartDetectionSettingsModule");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "buildSectionsWithDisplayedItems:", v4);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "addObjectsFromArray:", v36);
  }
  if ((-[HUStatusAndNotificationsItemManager showsCameraStatusChangeSection](self, "showsCameraStatusChangeSection") & v13) == 1)
  {
    v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("CameraStatusChange"));
    -[HUStatusAndNotificationsItemManager allowCameraStatusChangesItem](self, "allowCameraStatusChangesItem");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = v38;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v78, 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setItems:", v39);

    _HULocalizedStringWithDefaultValue(CFSTR("HUStatusAndNotificationsCameraStatusChangesFooter"), CFSTR("HUStatusAndNotificationsCameraStatusChangesFooter"), 1);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setFooterTitle:", v40);

    objc_msgSend(v5, "addObject:", v37);
  }
  objc_opt_class();
  -[HUStatusAndNotificationsItemManager serviceItem](self, "serviceItem");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v42 = v41;
  else
    v42 = 0;
  v43 = v42;

  objc_msgSend(v43, "profile");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v43) = objc_msgSend(v44, "hf_supportsReachabilityNotifications") & v13;
  if ((_DWORD)v43 == 1)
  {
    v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("CameraReachabilityStatusChange"));
    -[HUStatusAndNotificationsItemManager allowCameraReachabilityChangeNotificationsItem](self, "allowCameraReachabilityChangeNotificationsItem");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = v46;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v77, 1);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setItems:", v47);

    _HULocalizedStringWithDefaultValue(CFSTR("HUStatusAndNotificationsCameraReachabilityChangesFooter"), CFSTR("HUStatusAndNotificationsCameraReachabilityChangesFooter"), 1);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setFooterTitle:", v48);

    objc_msgSend(v5, "addObject:", v45);
  }
  if ((-[HUStatusAndNotificationsItemManager showsCameraSnapshotSection](self, "showsCameraSnapshotSection") & v13) == 1)
  {
    v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUStatusAndNotificationsCameraSnapshotSectionIdentifier"));
    -[HUStatusAndNotificationsItemManager allowCameraSnapshotsItem](self, "allowCameraSnapshotsItem");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = v50;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v76, 1);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setItems:", v51);

    _HULocalizedStringWithDefaultValue(CFSTR("HUStatusAndNotificationCameraSnapshotFooter"), CFSTR("HUStatusAndNotificationCameraSnapshotFooter"), 1);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setFooterTitle:", v52);

    objc_msgSend(v5, "addObject:", v49);
  }
  if ((-[HUStatusAndNotificationsItemManager hasDoorbellCamera](self, "hasDoorbellCamera") & v13) == 1)
  {
    v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("Doorbell"));
    -[HUStatusAndNotificationsItemManager allowDoorbellNotificationsItem](self, "allowDoorbellNotificationsItem");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = v54;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v75, 1);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setItems:", v55);

    _HULocalizedStringWithDefaultValue(CFSTR("HUStatusAndNotificationsDoorbellNotificationsFooter"), CFSTR("HUStatusAndNotificationsDoorbellNotificationsFooter"), 1);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setFooterTitle:", v56);

    objc_msgSend(v5, "addObject:", v53);
    v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("analogChimeSection"));
    -[HUStatusAndNotificationsItemManager allowAnalogChimeNotificationItem](self, "allowAnalogChimeNotificationItem");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = v58;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v74, 1);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setItems:", v59);

    _HULocalizedStringWithDefaultValue(CFSTR("HUCameraDoorbellChimeMuteSwitchFooter"), CFSTR("HUCameraDoorbellChimeMuteSwitchFooter"), 1);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setFooterTitle:", v60);

    objc_msgSend(v5, "addObject:", v57);
  }
  if (-[HUStatusAndNotificationsItemManager showsChimeOnHomePodSection](self, "showsChimeOnHomePodSection"))
  {
    v61 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUStatusAndNotificationsChimeOnHomePodSectionIdentifier"));
    -[HUStatusAndNotificationsItemManager chimeOnAccessoriesListItem](self, "chimeOnAccessoriesListItem");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = v62;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v73, 1);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setItems:", v63);

    -[HFItemManager home](self, "home");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "hf_allHomePodsOrStereoPairs");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = objc_msgSend(v65, "count");

    if (v66 <= 1)
      v67 = CFSTR("HUChimeOnAccessoriesFooter_Single");
    else
      v67 = CFSTR("HUChimeOnAccessoriesFooter_Multiple");
    _HULocalizedStringWithDefaultValue(v67, v67, 1);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setFooterTitle:", v68);

    objc_msgSend(v5, "addObject:", v61);
  }
  objc_msgSend(MEMORY[0x1E0D314B0], "filterSections:toDisplayedItems:", v5, v4);
  v69 = (void *)objc_claimAutoreleasedReturnValue();

  return v69;
}

uint64_t __72__HUStatusAndNotificationsItemManager__buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "items");
}

- (id)updateAllowNotifications:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  -[HUStatusAndNotificationsItemManager notificationSettings](self, "notificationSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "setNotificationsEnabled:", v3);
  objc_msgSend(v6, "setDoorbellNotificationsEnabled:", v3);
  objc_msgSend(v6, "setSmartDetectionNotificationsEnabled:", v3);
  objc_msgSend(v6, "setMotionNotificationsEnabled:", v3);
  -[HUStatusAndNotificationsItemManager _updateNotificationSettings:](self, "_updateNotificationSettings:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)updateAllowAudioNotifications:(BOOL)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t i;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v29;
  _BOOL4 v30;
  id obj;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t v37[128];
  uint8_t buf[4];
  _BYTE v39[14];
  uint64_t v40;

  v30 = a3;
  v40 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[HUStatusAndNotificationsItemManager _sourceItemAsMediaAccessoryItem](self, "_sourceItemAsMediaAccessoryItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mediaProfileContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessories");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v39 = objc_msgSend(v5, "isHomePodMediaSystem");
    *(_WORD *)&v39[4] = 2112;
    *(_QWORD *)&v39[6] = v7;
    _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "Is this a HomePod media system? %{BOOL}d Updating audio analysis notification settings for accessories: %@", buf, 0x12u);
  }
  v29 = v5;

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v7;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  v10 = v30;
  if (v9)
  {
    v11 = v9;
    v32 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v34 != v32)
          objc_enumerationMutation(obj);
        v13 = *(id *)(*((_QWORD *)&v33 + 1) + 8 * i);
        v14 = &unk_1EF347C70;
        if (objc_msgSend(v13, "conformsToProtocol:", v14, v29))
          v15 = v13;
        else
          v15 = 0;
        v16 = v15;

        objc_msgSend(v16, "hf_userNotificationSettings");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)objc_msgSend(v17, "mutableCopy");

        objc_msgSend(v18, "setNotificationsEnabled:", v10);
        if (-[HUStatusAndNotificationsItemManager _isAudioAnalysisSupportedDevice](self, "_isAudioAnalysisSupportedDevice")&& objc_msgSend(v18, "areNotificationsEnabled"))
        {
          v19 = (void *)MEMORY[0x1E0D31308];
          objc_msgSend(v18, "notificationCondition");
          v20 = v4;
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "conditionCollectionForPredicate:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          -[HUStatusAndNotificationsItemManager _updateConditionCollectionForAudioAnalysisNotification:](self, "_updateConditionCollectionForAudioAnalysisNotification:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "predicate");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setNotificationCondition:", v24);

          v4 = v20;
          v10 = v30;

        }
        HFLogForCategory();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v39 = v13;
          _os_log_impl(&dword_1B8E1E000, v25, OS_LOG_TYPE_DEFAULT, "Updating audio analysis notification settings for accessory: %@", buf, 0xCu);
        }

        -[HUStatusAndNotificationsItemManager _updateNotificationSettings:notificationSettingsProvider:](self, "_updateNotificationSettings:notificationSettingsProvider:", v18, v16);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "na_safeAddObject:", v26);

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v11);
  }

  objc_msgSend(MEMORY[0x1E0D519C0], "chainFutures:", v4);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (id)updateAllowMotionNotifications:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  -[HUStatusAndNotificationsItemManager notificationSettings](self, "notificationSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "setMotionNotificationsEnabled:", v3);
  objc_msgSend(v6, "setNotificationsEnabled:", objc_msgSend(v6, "areDoorbellNotificationsEnabled") | v3);
  -[HUStatusAndNotificationsItemManager _updateNotificationSettings:](self, "_updateNotificationSettings:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)updateChimeOnHomePod:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  BOOL v18;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hf_allHomePodsOrStereoPairs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __60__HUStatusAndNotificationsItemManager_updateChimeOnHomePod___block_invoke;
  v16 = &unk_1E6F51968;
  v17 = v5;
  v18 = a3;
  v8 = v5;
  objc_msgSend(v7, "na_each:", &v13);

  v9 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler", v13, v14, v15, v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "combineAllFutures:ignoringErrors:scheduler:", v8, 0, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void __60__HUStatusAndNotificationsItemManager_updateChimeOnHomePod___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a2;
  objc_msgSend(v3, "hf_settingsValueManager");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "hf_accessorySettingAtKeyPath:", *MEMORY[0x1E0D30740]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "changeValueForSetting:toValue:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v8);

}

- (id)updateAllowDoorbellNotifications:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v3 = a3;
  -[HUStatusAndNotificationsItemManager notificationSettings](self, "notificationSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "setDoorbellNotificationsEnabled:", v3);
  objc_opt_class();
  -[HUStatusAndNotificationsItemManager serviceItem](self, "serviceItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "profile");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v9) = objc_msgSend(v10, "hf_supportsRecordingEvents");
  if ((_DWORD)v9)
  {
    if (!v3)
    {
      v11 = objc_msgSend(v6, "areSmartDetectionNotificationsEnabled");
LABEL_10:
      v12 = v11;
      goto LABEL_11;
    }
  }
  else if (!v3)
  {
    v11 = objc_msgSend(v6, "areMotionNotificationsEnabled");
    goto LABEL_10;
  }
  v12 = 1;
LABEL_11:
  objc_msgSend(v6, "setNotificationsEnabled:", v12);
  -[HUStatusAndNotificationsItemManager _updateNotificationSettings:](self, "_updateNotificationSettings:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)updateAllowChimeAnalogNotifications:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v3 = a3;
  -[HUStatusAndNotificationsItemManager notificationSettings](self, "notificationSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "setDoorbellNotificationsEnabled:", v3);
  objc_opt_class();
  -[HUStatusAndNotificationsItemManager serviceItem](self, "serviceItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "profile");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "hf_updateDoorbellChime:", v3);
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)updateAllowSnapshotsInNotifications:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;

  v3 = a3;
  -[HUStatusAndNotificationsItemManager allowCameraSnapshotsItem](self, "allowCameraSnapshotsItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateUserSettingsWithValue:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)updateAllowSmartActivityNotifications:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = a3;
  -[HUStatusAndNotificationsItemManager notificationSettings](self, "notificationSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "setSmartDetectionNotificationsEnabled:", v3);
  objc_msgSend(v6, "setMotionNotificationsEnabled:", v3);
  if ((objc_msgSend(v6, "areDoorbellNotificationsEnabled") & 1) != 0)
    v7 = 1;
  else
    v7 = objc_msgSend(v6, "areSmartDetectionNotificationsEnabled");
  objc_msgSend(v6, "setNotificationsEnabled:", v7);
  -[HUStatusAndNotificationsItemManager _updateNotificationSettings:](self, "_updateNotificationSettings:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)updateAllowCameraStatusChangeNotifications:(BOOL)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  BOOL v17;

  objc_opt_class();
  -[HUStatusAndNotificationsItemManager serviceItem](self, "serviceItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    objc_msgSend(v7, "profile");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "hf_supportsRecordingEvents");

    v10 = (void *)MEMORY[0x1E0D519C0];
    if ((v9 & 1) != 0)
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __82__HUStatusAndNotificationsItemManager_updateAllowCameraStatusChangeNotifications___block_invoke;
      v15[3] = &unk_1E6F51990;
      v16 = v7;
      v17 = a3;
      objc_msgSend(v10, "futureWithBlock:", v15);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 30);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "futureWithError:", v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

void __82__HUStatusAndNotificationsItemManager_updateAllowCameraStatusChangeNotifications___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "profile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(unsigned __int8 *)(a1 + 40);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __82__HUStatusAndNotificationsItemManager_updateAllowCameraStatusChangeNotifications___block_invoke_2;
  v8[3] = &unk_1E6F4E2D8;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v5, "updateAccessModeChangeNotificationEnabled:completionHandler:", v6, v8);

}

uint64_t __82__HUStatusAndNotificationsItemManager_updateAllowCameraStatusChangeNotifications___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "finishWithError:", a2);
  else
    return objc_msgSend(v2, "finishWithNoResult");
}

- (id)updateAllowCameraReachabilityStatusChangeNotifications:(BOOL)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  BOOL v15;

  objc_opt_class();
  -[HUStatusAndNotificationsItemManager serviceItem](self, "serviceItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0D519C0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __94__HUStatusAndNotificationsItemManager_updateAllowCameraReachabilityStatusChangeNotifications___block_invoke;
    v13[3] = &unk_1E6F51990;
    v14 = v7;
    v15 = a3;
    objc_msgSend(v8, "futureWithBlock:", v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 30);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "futureWithError:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

void __94__HUStatusAndNotificationsItemManager_updateAllowCameraReachabilityStatusChangeNotifications___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "profile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(unsigned __int8 *)(a1 + 40);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __94__HUStatusAndNotificationsItemManager_updateAllowCameraReachabilityStatusChangeNotifications___block_invoke_2;
  v8[3] = &unk_1E6F4E2D8;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v5, "updateReachabilityEventNotificationEnabled:completionHandler:", v6, v8);

  objc_msgSend(v7, "finishWithNoResult");
}

uint64_t __94__HUStatusAndNotificationsItemManager_updateAllowCameraReachabilityStatusChangeNotifications___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "finishWithError:", a2);
  else
    return objc_msgSend(v2, "finishWithNoResult");
}

- (id)updateNotificationCondition:(id)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _UNKNOWN **v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  HUStatusAndNotificationsItemManager *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v39;
  id v40;
  id v41;
  uint64_t v42;
  id obj;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t v48[128];
  uint8_t buf[4];
  _BYTE v50[18];
  __int16 v51;
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v40 = a3;
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)v50 = self;
    *(_WORD *)&v50[8] = 2112;
    *(_QWORD *)&v50[10] = v6;
    v51 = 2112;
    v52 = v40;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ Updating notification condition to %@", buf, 0x20u);

  }
  if (-[HUStatusAndNotificationsItemManager showsAudioNotificationSection](self, "showsAudioNotificationSection"))
  {
    v41 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[HUStatusAndNotificationsItemManager _sourceItemAsMediaAccessoryItem](self, "_sourceItemAsMediaAccessoryItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "mediaProfileContainer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accessories");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    HFLogForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v40;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_msgSend(v7, "isHomePodMediaSystem");
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v50 = v12;
      *(_WORD *)&v50[4] = 2112;
      *(_QWORD *)&v50[6] = v9;
      _os_log_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_DEFAULT, "Is this a HomePod media system? %{BOOL}d Updating audio analysis notification settings for accessories: %@", buf, 0x12u);
    }
    v39 = v7;

    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    obj = v9;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v45;
      v16 = &protocolRef_HUActionSetAccessoryPickerViewControllerDelegate;
      do
      {
        v17 = 0;
        v42 = v14;
        do
        {
          if (*(_QWORD *)v45 != v15)
            objc_enumerationMutation(obj);
          v18 = v16[117];
          v19 = *(id *)(*((_QWORD *)&v44 + 1) + 8 * v17);
          v20 = v18;
          if (objc_msgSend(v19, "conformsToProtocol:", v20))
            v21 = v19;
          else
            v21 = 0;
          v22 = v21;

          objc_msgSend(v22, "hf_userNotificationSettings");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = (void *)objc_msgSend(v23, "mutableCopy");

          if (objc_msgSend(v24, "areNotificationsEnabled"))
          {
            v25 = v15;
            objc_msgSend(MEMORY[0x1E0D31308], "conditionCollectionForPredicate:", v11);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = self;
            -[HUStatusAndNotificationsItemManager _updateConditionCollectionForAudioAnalysisNotification:](self, "_updateConditionCollectionForAudioAnalysisNotification:", v26);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "predicate");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "setNotificationCondition:", v29);

            HFLogForCategory();
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v24, "notificationCondition");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)v50 = v19;
              *(_WORD *)&v50[8] = 2112;
              *(_QWORD *)&v50[10] = v31;
              _os_log_impl(&dword_1B8E1E000, v30, OS_LOG_TYPE_DEFAULT, "Updating audio analysis notification settings for accessory: %@ with condition %@", buf, 0x16u);

              v11 = v40;
            }

            -[HUStatusAndNotificationsItemManager _updateNotificationSettings:notificationSettingsProvider:](v27, "_updateNotificationSettings:notificationSettingsProvider:", v24, v22);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "na_safeAddObject:", v32);

            self = v27;
            v15 = v25;
            v16 = &protocolRef_HUActionSetAccessoryPickerViewControllerDelegate;
            v14 = v42;
          }

          ++v17;
        }
        while (v14 != v17);
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
      }
      while (v14);
    }

    v33 = v41;
    objc_msgSend(MEMORY[0x1E0D519C0], "chainFutures:", v41);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[HUStatusAndNotificationsItemManager notificationSettings](self, "notificationSettings");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend(v35, "mutableCopy");

    objc_msgSend(v33, "setNotificationCondition:", v40);
    -[HUStatusAndNotificationsItemManager notificationSettings](self, "notificationSettings");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "smartCameraNotificationCondition");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setSmartCameraNotificationCondition:", v37);

    v11 = v40;
    -[HUStatusAndNotificationsItemManager _updateNotificationSettings:](self, "_updateNotificationSettings:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v34;
}

- (id)updateCameraSmartNotificationCondition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[HUStatusAndNotificationsItemManager notificationSettings](self, "notificationSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  -[HUStatusAndNotificationsItemManager notificationSettings](self, "notificationSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "notificationCondition");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNotificationCondition:", v8);

  objc_msgSend(v6, "setSmartCameraNotificationCondition:", v4);
  -[HUStatusAndNotificationsItemManager _updateNotificationSettings:](self, "_updateNotificationSettings:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_sourceItemAsMediaAccessoryItem
{
  void *v3;
  void *v4;
  id v5;

  objc_opt_class();
  -[HUStatusAndNotificationsItemManager serviceItem](self, "serviceItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (BOOL)_isAudioAnalysisSupportedDevice
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D31530];
  -[HUStatusAndNotificationsItemManager _sourceItemAsMediaAccessoryItem](self, "_sourceItemAsMediaAccessoryItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mediaProfileContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v2, "isAudioAnalysisSupportedDevice:", v4);

  return (char)v2;
}

- (id)_updateConditionCollectionForAudioAnalysisNotification:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t v11[16];

  v3 = a3;
  if (!v3)
  {
    HFLogForCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "Condition collection is nil. Cannot update.", v11, 2u);
    }

  }
  objc_msgSend(v3, "conditions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_filter:", &__block_literal_global_155);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31308]), "initWithConditions:", v6);
  objc_msgSend(MEMORY[0x1E0CBA360], "predicateForAudioAnalysisOptions:", 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D311A8]), "initWithPredicate:", v8);
  objc_msgSend(v7, "addCondition:", v9);

  return v7;
}

BOOL __94__HUStatusAndNotificationsItemManager__updateConditionCollectionForAudioAnalysisNotification___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

- (id)_updateNotificationSettings:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HUStatusAndNotificationsItemManager notificationSettingsProvider](self, "notificationSettingsProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUStatusAndNotificationsItemManager _updateNotificationSettings:notificationSettingsProvider:](self, "_updateNotificationSettings:notificationSettingsProvider:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_updateNotificationSettings:(id)a3 notificationSettingsProvider:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18[2];
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  HFLogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v20 = v7;
    v21 = 2112;
    v22 = v8;
    _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "Updating notification settings to: %@ for object: %@", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  objc_msgSend(v8, "hf_updateUserNotificationSettings:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __96__HUStatusAndNotificationsItemManager__updateNotificationSettings_notificationSettingsProvider___block_invoke;
  v17 = &unk_1E6F519F8;
  objc_copyWeak(v18, (id *)buf);
  v18[1] = (id)a2;
  objc_msgSend(v10, "addCompletionBlock:", &v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addFailureBlock:", &__block_literal_global_159_0, v14, v15, v16, v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(v18);
  objc_destroyWeak((id *)buf);

  return v12;
}

void __96__HUStatusAndNotificationsItemManager__updateNotificationSettings_notificationSettingsProvider___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
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
  id v17;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(WeakRetained, "allowNotificationsItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "allowDoorbellNotificationsItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "allowActivityNotificationsItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "allowCameraSnapshotsItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "conditionModule");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(WeakRetained, "conditionModule");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "unionSet:", v10);

  }
  objc_msgSend(WeakRetained, "cameraSmartDetectionSettingsModule");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(WeakRetained, "cameraSmartDetectionSettingsModule");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "allItems");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "unionSet:", v13);

  }
  objc_msgSend(WeakRetained, "audioAnalysisDetectionSettingsModule");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(WeakRetained, "audioAnalysisDetectionSettingsModule");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "allItems");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "unionSet:", v16);

  }
  v17 = (id)objc_msgSend(WeakRetained, "updateResultsForItems:senderSelector:", v7, *(_QWORD *)(a1 + 40));

}

void __96__HUStatusAndNotificationsItemManager__updateNotificationSettings_notificationSettingsProvider___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0D313A0];
  v3 = a2;
  objc_msgSend(v2, "sharedHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logError:operationDescription:", v3, *MEMORY[0x1E0D309B8]);

}

- (HFUserNotificationServiceSettingsProviding)notificationSettingsProvider
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  -[HUStatusAndNotificationsItemManager _sourceItemAsMediaAccessoryItem](self, "_sourceItemAsMediaAccessoryItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "accessories");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "anyObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v6;
    if (objc_msgSend(v7, "conformsToProtocol:", &unk_1EF347C70))
      v8 = v7;
    else
      v8 = 0;
    v9 = v7;
  }
  else
  {
    -[HUStatusAndNotificationsItemManager serviceItem](self, "serviceItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "homeKitObject");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "conformsToProtocol:", &unk_1EF347C70))
      v8 = v7;
    else
      v8 = 0;
  }
  v10 = v8;

  return (HFUserNotificationServiceSettingsProviding *)v10;
}

- (HFUserNotificationServiceSettings)notificationSettings
{
  void *v2;
  void *v3;

  -[HUStatusAndNotificationsItemManager notificationSettingsProvider](self, "notificationSettingsProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_userNotificationSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HFUserNotificationServiceSettings *)v3;
}

- (id)homeStatusVisibleObject
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  -[HUStatusAndNotificationsItemManager serviceItem](self, "serviceItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeKitObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EF329C38))
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (id)_homeFuture
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D519C0];
  -[HUStatusAndNotificationsItemManager overrideHome](self, "overrideHome");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)showStatusSection
{
  return self->_showStatusSection;
}

- (BOOL)showsForServiceDetails
{
  return self->_showsForServiceDetails;
}

- (void)setShowsForServiceDetails:(BOOL)a3
{
  self->_showsForServiceDetails = a3;
}

- (HFStaticItem)includeInStatusItem
{
  return self->_includeInStatusItem;
}

- (void)setIncludeInStatusItem:(id)a3
{
  objc_storeStrong((id *)&self->_includeInStatusItem, a3);
}

- (HFStaticItem)allowNotificationsItem
{
  return self->_allowNotificationsItem;
}

- (void)setAllowNotificationsItem:(id)a3
{
  objc_storeStrong((id *)&self->_allowNotificationsItem, a3);
}

- (HFStaticItem)allowMotionNotificationsItem
{
  return self->_allowMotionNotificationsItem;
}

- (void)setAllowMotionNotificationsItem:(id)a3
{
  objc_storeStrong((id *)&self->_allowMotionNotificationsItem, a3);
}

- (HUServiceDetailsCameraAllowSnapshotsItem)allowCameraSnapshotsItem
{
  return self->_allowCameraSnapshotsItem;
}

- (void)setAllowCameraSnapshotsItem:(id)a3
{
  objc_storeStrong((id *)&self->_allowCameraSnapshotsItem, a3);
}

- (HUChimeOnHomePodSingleItem)chimeOnHomePodSingleItem
{
  return self->_chimeOnHomePodSingleItem;
}

- (HUChimeOnAccessoriesListItem)chimeOnAccessoriesListItem
{
  return self->_chimeOnAccessoriesListItem;
}

- (void)setChimeOnAccessoriesListItem:(id)a3
{
  objc_storeStrong((id *)&self->_chimeOnAccessoriesListItem, a3);
}

- (HFStaticItem)allowDoorbellNotificationsItem
{
  return self->_allowDoorbellNotificationsItem;
}

- (void)setAllowDoorbellNotificationsItem:(id)a3
{
  objc_storeStrong((id *)&self->_allowDoorbellNotificationsItem, a3);
}

- (HFStaticItem)allowAnalogChimeNotificationItem
{
  return self->_allowAnalogChimeNotificationItem;
}

- (void)setAllowAnalogChimeNotificationItem:(id)a3
{
  objc_storeStrong((id *)&self->_allowAnalogChimeNotificationItem, a3);
}

- (HFStaticItem)allowActivityNotificationsItem
{
  return self->_allowActivityNotificationsItem;
}

- (void)setAllowActivityNotificationsItem:(id)a3
{
  objc_storeStrong((id *)&self->_allowActivityNotificationsItem, a3);
}

- (HFStaticItem)allowAudioNotificationsItem
{
  return self->_allowAudioNotificationsItem;
}

- (void)setAllowAudioNotificationsItem:(id)a3
{
  objc_storeStrong((id *)&self->_allowAudioNotificationsItem, a3);
}

- (HFStaticItem)allowCameraStatusChangesItem
{
  return self->_allowCameraStatusChangesItem;
}

- (void)setAllowCameraStatusChangesItem:(id)a3
{
  objc_storeStrong((id *)&self->_allowCameraStatusChangesItem, a3);
}

- (HFStaticItem)allowCameraReachabilityChangeNotificationsItem
{
  return self->_allowCameraReachabilityChangeNotificationsItem;
}

- (void)setAllowCameraReachabilityChangeNotificationsItem:(id)a3
{
  objc_storeStrong((id *)&self->_allowCameraReachabilityChangeNotificationsItem, a3);
}

- (HFServiceLikeItem)serviceItem
{
  return self->_serviceItem;
}

- (HUTriggerConditionEditorItemModule)conditionModule
{
  return self->_conditionModule;
}

- (HUCameraSmartDetectionSettingsModule)cameraSmartDetectionSettingsModule
{
  return self->_cameraSmartDetectionSettingsModule;
}

- (void)setServiceItemBelongsToCamera:(BOOL)a3
{
  self->_serviceItemBelongsToCamera = a3;
}

- (HUAudioAnalysisDetectionSettingsModule)audioAnalysisDetectionSettingsModule
{
  return self->_audioAnalysisDetectionSettingsModule;
}

- (void)setShowsChimeOnHomePodSection:(BOOL)a3
{
  self->_showsChimeOnHomePodSection = a3;
}

- (void)setShowsCameraSnapshotSection:(BOOL)a3
{
  self->_showsCameraSnapshotSection = a3;
}

- (void)setShowsCameraSmartNotificationSection:(BOOL)a3
{
  self->_showsCameraSmartNotificationSection = a3;
}

- (void)setShowsTriggerConditionSection:(BOOL)a3
{
  self->_showsTriggerConditionSection = a3;
}

- (void)setHasDoorbellCamera:(BOOL)a3
{
  self->_hasDoorbellCamera = a3;
}

- (void)setShowsSmartActivitySection:(BOOL)a3
{
  self->_showsSmartActivitySection = a3;
}

- (void)setShowsCameraStatusChangeSection:(BOOL)a3
{
  self->_showsCameraStatusChangeSection = a3;
}

- (void)setShowsAudioNotificationSection:(BOOL)a3
{
  self->_showsAudioNotificationSection = a3;
}

- (HMHome)overrideHome
{
  return self->_overrideHome;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideHome, 0);
  objc_storeStrong((id *)&self->_audioAnalysisDetectionSettingsModule, 0);
  objc_storeStrong((id *)&self->_cameraSmartDetectionSettingsModule, 0);
  objc_storeStrong((id *)&self->_conditionModule, 0);
  objc_storeStrong((id *)&self->_serviceItem, 0);
  objc_storeStrong((id *)&self->_allowCameraReachabilityChangeNotificationsItem, 0);
  objc_storeStrong((id *)&self->_allowCameraStatusChangesItem, 0);
  objc_storeStrong((id *)&self->_allowAudioNotificationsItem, 0);
  objc_storeStrong((id *)&self->_allowActivityNotificationsItem, 0);
  objc_storeStrong((id *)&self->_allowAnalogChimeNotificationItem, 0);
  objc_storeStrong((id *)&self->_allowDoorbellNotificationsItem, 0);
  objc_storeStrong((id *)&self->_chimeOnAccessoriesListItem, 0);
  objc_storeStrong((id *)&self->_chimeOnHomePodSingleItem, 0);
  objc_storeStrong((id *)&self->_allowCameraSnapshotsItem, 0);
  objc_storeStrong((id *)&self->_allowMotionNotificationsItem, 0);
  objc_storeStrong((id *)&self->_allowNotificationsItem, 0);
  objc_storeStrong((id *)&self->_includeInStatusItem, 0);
}

@end

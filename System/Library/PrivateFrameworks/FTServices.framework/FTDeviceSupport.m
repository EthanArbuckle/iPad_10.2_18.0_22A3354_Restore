@implementation FTDeviceSupport

- (BOOL)isInMultiUserMode
{
  void *v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  char isMultiUser;

  v2 = (void *)MEMORY[0x1A85A5DE0](CFSTR("UMUserManager"), CFSTR("UserManagement"));
  qword_1ECF9D7F0 = (uint64_t)v2;
  if (v2)
  {
    objc_msgSend_sharedManager(v2, v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isMultiUser = objc_msgSend_isMultiUser(v5, v6, v7);

    LOBYTE(v2) = isMultiUser;
  }
  return (char)v2;
}

- (void)_registerForManagedConfigurationNotifications
{
  void *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  id v7;

  v3 = (void *)MEMORY[0x1A85A5DE0](CFSTR("MCProfileConnection"), CFSTR("ManagedConfiguration"));
  objc_msgSend_sharedConnection(v3, v4, v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_registerObserver_(v7, v6, (uint64_t)self);

}

- (void)_registerForCarrierNotifications
{
  uint64_t v2;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  int v9;
  FTDeviceSupport *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], a2, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = self;
    _os_log_impl(&dword_1A4C7F000, v4, OS_LOG_TYPE_DEFAULT, "Registering %@ for carrier changes", (uint8_t *)&v9, 0xCu);
  }

  if (self->_supportsSMS)
  {
    objc_msgSend__unregisterForCommCenterReadyNotifications(self, v5, v6);
    objc_msgSend__registerForCommCenterReadyNotifications(self, v7, v8);
  }
}

- (void)_registerForLockdownNotifications
{
  uint64_t v2;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  int v9;
  FTDeviceSupport *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], a2, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = self;
    _os_log_impl(&dword_1A4C7F000, v4, OS_LOG_TYPE_DEFAULT, "Registering %@ for lockdown changes", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObserver_selector_name_object_(v7, v8, (uint64_t)self, sel__lockdownStateChanged_, *MEMORY[0x1E0D36608], 0);

}

- (void)_registerForCommCenterReadyNotifications
{
  uint64_t v2;
  NSObject *v4;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint8_t v6[16];

  if (self->_supportsSMS)
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], a2, v2);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1A4C7F000, v4, OS_LOG_TYPE_DEFAULT, "Registering for comm center launch", v6, 2u);
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_1A4C8B458, (CFStringRef)*MEMORY[0x1E0CA7360], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
}

- (void)_unregisterForCommCenterReadyNotifications
{
  uint64_t v2;
  NSObject *v4;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint8_t v6[16];

  if (self->_supportsSMS)
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], a2, v2);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1A4C7F000, v4, OS_LOG_TYPE_DEFAULT, "Unregistering for comm center launch", v6, 2u);
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x1E0CA7360], 0);
  }
}

- (FTDeviceSupport)init
{
  FTDeviceSupport *v2;
  FTDeviceSupport *v3;
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  CoreTelephonyClient *coreTelephonyClient;
  const char *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  FTSelectedPNRSubscription *selectedPNRSubscription;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  FTDeviceSupport *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)FTDeviceSupport;
  v2 = -[FTDeviceSupport init](&v20, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_blockPost = 1;
    v2->_simBecameNotReady = 0;
    v4 = objc_alloc(MEMORY[0x1E0CA6E38]);
    im_primary_queue();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend_initWithQueue_(v4, v6, (uint64_t)v5);
    coreTelephonyClient = v3->_coreTelephonyClient;
    v3->_coreTelephonyClient = (CoreTelephonyClient *)v7;

    if (!v3->_coreTelephonyClient)
    {
      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v9, v10);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        sub_1A4CBA300();

    }
    objc_msgSend_sharedInstance(FTSelectedPNRSubscription, v9, v10);
    v12 = objc_claimAutoreleasedReturnValue();
    selectedPNRSubscription = v3->_selectedPNRSubscription;
    v3->_selectedPNRSubscription = (FTSelectedPNRSubscription *)v12;

    v3->_simInserted = -1;
    objc_msgSend__updateCapabilities(v3, v14, v15);
    objc_msgSend__updateManagedConfigurationSettings(v3, v16, v17);
    v3->_blockPost = 0;
    v3->_isPNRSupportedCachedValue = -1;
    v3->_performanceClass = -1;
    v19 = v3;
    im_dispatch_after_primary_queue();

  }
  return v3;
}

- (void)_updateManagedConfigurationSettings
{
  void *v3;
  void **v4;
  void *v5;
  void **v6;
  void *v7;
  void **v8;
  void *v9;
  void **v10;
  void *v11;
  int iMessageBlocked;
  int faceTimeBlocked;
  int accountModificationRestricted;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;
  BOOL v20;
  BOOL v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  int v32;
  int v33;
  int v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;

  v3 = (void *)MEMORY[0x1A85A61F4](self, a2);
  if (!qword_1ECF9D7A0)
  {
    v4 = (void **)MEMORY[0x1A85A5DEC]("MCFeatureVideoConferencingAllowed", CFSTR("ManagedConfiguration"));
    if (v4)
      v5 = *v4;
    else
      v5 = 0;
    objc_storeStrong((id *)&qword_1ECF9D7A0, v5);
  }
  if (!qword_1ECF9D7A8)
  {
    v6 = (void **)MEMORY[0x1A85A5DEC]("MCFeatureAudioConferencingAllowed", CFSTR("ManagedConfiguration"));
    if (v6)
      v7 = *v6;
    else
      v7 = 0;
    objc_storeStrong((id *)&qword_1ECF9D7A8, v7);
  }
  if (!qword_1ECF9D7B0)
  {
    v8 = (void **)MEMORY[0x1A85A5DEC]("MCFeatureChatAllowed", CFSTR("ManagedConfiguration"));
    if (v8)
      v9 = *v8;
    else
      v9 = 0;
    objc_storeStrong((id *)&qword_1ECF9D7B0, v9);
  }
  if (!qword_1ECF9D7B8)
  {
    v10 = (void **)MEMORY[0x1A85A5DEC]("MCFeatureAccountModificationAllowed", CFSTR("ManagedConfiguration"));
    if (v10)
      v11 = *v10;
    else
      v11 = 0;
    objc_storeStrong((id *)&qword_1ECF9D7B8, v11);
  }
  if (qword_1ECF9D7D8 != -1)
    dispatch_once(&qword_1ECF9D7D8, &unk_1E4DD9788);
  pthread_mutex_lock(&stru_1ECF9D628);
  iMessageBlocked = self->_iMessageBlocked;
  faceTimeBlocked = self->_faceTimeBlocked;
  accountModificationRestricted = self->_accountModificationRestricted;
  objc_msgSend_sharedConnection((void *)qword_1ECF9D7C0, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v17;
  if (qword_1ECF9D7B0)
    v20 = objc_msgSend_effectiveBoolValueForSetting_(v17, v18, qword_1ECF9D7B0) == 2;
  else
    v20 = 0;
  self->_iMessageBlocked = v20;
  if (qword_1ECF9D7A0)
    v21 = objc_msgSend_effectiveBoolValueForSetting_(v19, v18, qword_1ECF9D7A0) == 2;
  else
    v21 = 0;
  self->_faceTimeBlocked = v21;
  self->_accountModificationRestricted = objc_msgSend_effectiveBoolValueForSetting_(v19, v18, qword_1ECF9D7B8) == 2;
  objc_msgSend_sharedManager((void *)qword_1ECF9D7D0, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_invalidateRestrictions(v24, v25, v26);

  objc_msgSend_sharedManager((void *)qword_1ECF9D7D0, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_invalidateSettings(v29, v30, v31);

  v32 = self->_iMessageBlocked;
  v33 = self->_faceTimeBlocked;
  v34 = self->_accountModificationRestricted;
  pthread_mutex_unlock(&stru_1ECF9D628);
  if ((iMessageBlocked != v32 || faceTimeBlocked != v33 || accountModificationRestricted != v34) && !self->_blockPost)
  {
    objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___mainThreadPostNotificationName_object_(v37, v38, (uint64_t)CFSTR("__kFaceTimeDeviceRestictionsChangedNotification"), 0);

  }
  objc_autoreleasePoolPop(v3);
}

- (void)_updateCapabilities
{
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  int v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  int v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  _BOOL4 v33;
  int v34;
  const char *v35;
  uint64_t v36;
  int v37;
  const char *v38;
  uint64_t v39;
  NSObject *v40;
  _BOOL4 v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  NSObject *v47;
  const __CFString *v48;
  const char *v49;
  uint64_t v50;
  NSObject *v51;
  const __CFString *v52;
  const char *v53;
  uint64_t v54;
  NSObject *v55;
  const __CFString *v56;
  const char *v57;
  uint64_t v58;
  NSObject *v59;
  const __CFString *v60;
  const char *v61;
  uint64_t v62;
  NSObject *v63;
  const __CFString *v64;
  const char *v65;
  uint64_t v66;
  NSObject *v67;
  const __CFString *v68;
  const char *v69;
  uint64_t v70;
  NSObject *v71;
  const __CFString *v72;
  const char *v73;
  uint64_t v74;
  NSObject *v75;
  const __CFString *v76;
  const char *v77;
  uint64_t v78;
  NSObject *v79;
  const char *v80;
  uint64_t v81;
  NSObject *v82;
  const __CFString *v83;
  const char *v84;
  uint64_t v85;
  NSObject *v86;
  const __CFString *v87;
  const char *v88;
  uint64_t v89;
  NSObject *v90;
  const __CFString *v91;
  const char *v92;
  uint64_t v93;
  NSObject *v94;
  const __CFString *v95;
  const char *v96;
  uint64_t v97;
  NSObject *v98;
  const __CFString *v99;
  const char *v100;
  uint64_t v101;
  NSObject *v102;
  const __CFString *v103;
  const char *v104;
  uint64_t v105;
  NSObject *v106;
  const __CFString *v107;
  const char *v108;
  uint64_t v109;
  NSObject *v110;
  unint64_t v111;
  const __CFString *v112;
  const char *v113;
  uint64_t v114;
  NSObject *v115;
  unint64_t v116;
  const __CFString *v117;
  int isGreenTea;
  int supportsHandoff;
  int supportsTethering;
  int supportsFT;
  int supportsFTA;
  int supportsFTMW;
  int supportsSMS;
  __int128 v125;
  const char *v126;
  uint64_t v127;
  void *v128;
  const char *v129;
  int supportsBackCamera;
  int supportsFrontCamera;
  int supportsCellularData;
  int supportsiMessage;
  int supportsNonWiFiFaceTime;
  _BOOL4 supportsWiFi;
  int supportsWLAN;
  int mmsConfigured;
  int supportsMMS;
  int v139;
  int v140;
  void *context;
  int v142;
  int v143;
  int v144;
  int v145;
  int v146;
  int v147;
  int isMmsConfigured;
  int v149;
  int v150;
  int v151;
  int v152;
  int v153;
  int v154;
  uint8_t buf[4];
  const __CFString *v156;
  uint64_t v157;

  v157 = *MEMORY[0x1E0C80C00];
  v3 = pthread_mutex_lock(&stru_1ECF9D668);
  context = (void *)MEMORY[0x1A85A61F4](v3);
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v4, v5);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4C7F000, v6, OS_LOG_TYPE_DEFAULT, "Updating GS Capabilities", buf, 2u);
  }

  objc_msgSend__serviceStatus(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v145 = objc_msgSend_iMessageSupported(v9, v10, v11);

  objc_msgSend__serviceStatus(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v152 = objc_msgSend_faceTimeAudioSupported(v14, v15, v16);

  objc_msgSend__serviceStatus(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v151 = objc_msgSend_faceTimeMultiwaySupported(v19, v20, v21);

  v153 = MGGetBoolAnswer();
  v22 = MGGetBoolAnswer();
  if (MGGetBoolAnswer())
    v150 = objc_msgSend_deviceType(self, v23, v24) == 2;
  else
    v150 = 0;
  if (MGGetBoolAnswer())
    v149 = objc_msgSend_deviceType(self, v25, v26) == 2;
  else
    v149 = 0;
  v27 = MGGetBoolAnswer();
  v146 = MGGetBoolAnswer();
  v142 = MGGetBoolAnswer();
  v143 = MGGetBoolAnswer();
  v147 = MGGetBoolAnswer();
  v144 = v27;
  if (v27)
    v27 = objc_msgSend_deviceType(self, v28, v29) == 2 || objc_msgSend_deviceType(self, v28, v29) == 4;
  v30 = objc_msgSend_performanceClass(self, v28, v29);
  v33 = v30 != -1;
  if (v30 == -1)
    v34 = 0;
  else
    v34 = v27;
  v154 = v34;
  if (objc_msgSend_isInMultiUserMode(self, v31, v32))
  {
    v37 = _os_feature_enabled_impl();
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v38, v39);
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT);
    if (v37)
    {
      if (v41)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4C7F000, v40, OS_LOG_TYPE_DEFAULT, "In multi user mode, however not disabling handoff due to Feature Flag", buf, 2u);
      }
    }
    else
    {
      if (v41)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4C7F000, v40, OS_LOG_TYPE_DEFAULT, "In multi user mode, disabling handoff", buf, 2u);
      }
      v33 = 0;
      v154 = 0;
    }

  }
  objc_msgSend_sharedMessageCenter(MEMORY[0x1E0CA6DB0], v35, v36);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  isMmsConfigured = objc_msgSend_isMmsConfigured(v42, v43, v44);

  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v45, v46);
  v47 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    if (v150)
      v48 = CFSTR("YES");
    else
      v48 = CFSTR("NO");
    *(_DWORD *)buf = 138412290;
    v156 = v48;
    _os_log_impl(&dword_1A4C7F000, v47, OS_LOG_TYPE_DEFAULT, "               Supports SMS: %@", buf, 0xCu);
  }

  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v49, v50);
  v51 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
  {
    if (v149)
      v52 = CFSTR("YES");
    else
      v52 = CFSTR("NO");
    *(_DWORD *)buf = 138412290;
    v156 = v52;
    _os_log_impl(&dword_1A4C7F000, v51, OS_LOG_TYPE_DEFAULT, "               Supports MMS: %@", buf, 0xCu);
  }

  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v53, v54);
  v55 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
  {
    if (isMmsConfigured)
      v56 = CFSTR("YES");
    else
      v56 = CFSTR("NO");
    *(_DWORD *)buf = 138412290;
    v156 = v56;
    _os_log_impl(&dword_1A4C7F000, v55, OS_LOG_TYPE_DEFAULT, "             MMS Configured: %@", buf, 0xCu);
  }

  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v57, v58);
  v59 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
  {
    if (v22)
      v60 = CFSTR("YES");
    else
      v60 = CFSTR("NO");
    *(_DWORD *)buf = 138412290;
    v156 = v60;
    _os_log_impl(&dword_1A4C7F000, v59, OS_LOG_TYPE_DEFAULT, "                         GT: %@", buf, 0xCu);
  }

  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v61, v62);
  v63 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
  {
    if (v153)
      v64 = CFSTR("YES");
    else
      v64 = CFSTR("NO");
    *(_DWORD *)buf = 138412290;
    v156 = v64;
    _os_log_impl(&dword_1A4C7F000, v63, OS_LOG_TYPE_DEFAULT, "                Supports FT: %@", buf, 0xCu);
  }

  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v65, v66);
  v67 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
  {
    if (v152)
      v68 = CFSTR("YES");
    else
      v68 = CFSTR("NO");
    *(_DWORD *)buf = 138412290;
    v156 = v68;
    _os_log_impl(&dword_1A4C7F000, v67, OS_LOG_TYPE_DEFAULT, "               Supports FTA: %@", buf, 0xCu);
  }

  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v69, v70);
  v71 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
  {
    if (v151)
      v72 = CFSTR("YES");
    else
      v72 = CFSTR("NO");
    *(_DWORD *)buf = 138412290;
    v156 = v72;
    _os_log_impl(&dword_1A4C7F000, v71, OS_LOG_TYPE_DEFAULT, "              Supports FTMW: %@", buf, 0xCu);
  }

  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v73, v74);
  v75 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
  {
    if (v145)
      v76 = CFSTR("YES");
    else
      v76 = CFSTR("NO");
    *(_DWORD *)buf = 138412290;
    v156 = v76;
    _os_log_impl(&dword_1A4C7F000, v75, OS_LOG_TYPE_DEFAULT, "          Supports iMessage: %@", buf, 0xCu);
  }

  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v77, v78);
  v79 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v156 = CFSTR("YES");
    _os_log_impl(&dword_1A4C7F000, v79, OS_LOG_TYPE_DEFAULT, "              Supports WiFi: %@", buf, 0xCu);
  }

  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v80, v81);
  v82 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
  {
    if (v146)
      v83 = CFSTR("YES");
    else
      v83 = CFSTR("NO");
    *(_DWORD *)buf = 138412290;
    v156 = v83;
    _os_log_impl(&dword_1A4C7F000, v82, OS_LOG_TYPE_DEFAULT, "             Supports 3G FT: %@", buf, 0xCu);
  }

  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v84, v85);
  v86 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
  {
    if (v147)
      v87 = CFSTR("YES");
    else
      v87 = CFSTR("NO");
    *(_DWORD *)buf = 138412290;
    v156 = v87;
    _os_log_impl(&dword_1A4C7F000, v86, OS_LOG_TYPE_DEFAULT, "              Supports WLAN: %@", buf, 0xCu);
  }

  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v88, v89);
  v90 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
  {
    if (v144)
      v91 = CFSTR("YES");
    else
      v91 = CFSTR("NO");
    *(_DWORD *)buf = 138412290;
    v156 = v91;
    _os_log_impl(&dword_1A4C7F000, v90, OS_LOG_TYPE_DEFAULT, "         Supports Cell Data: %@", buf, 0xCu);
  }

  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v92, v93);
  v94 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
  {
    if (v143)
      v95 = CFSTR("YES");
    else
      v95 = CFSTR("NO");
    *(_DWORD *)buf = 138412290;
    v156 = v95;
    _os_log_impl(&dword_1A4C7F000, v94, OS_LOG_TYPE_DEFAULT, "      Supports Front Camera: %@", buf, 0xCu);
  }

  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v96, v97);
  v98 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
  {
    if (v142)
      v99 = CFSTR("YES");
    else
      v99 = CFSTR("NO");
    *(_DWORD *)buf = 138412290;
    v156 = v99;
    _os_log_impl(&dword_1A4C7F000, v98, OS_LOG_TYPE_DEFAULT, "       Supports Back Camera: %@", buf, 0xCu);
  }

  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v100, v101);
  v102 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
  {
    if (v33)
      v103 = CFSTR("YES");
    else
      v103 = CFSTR("NO");
    *(_DWORD *)buf = 138412290;
    v156 = v103;
    _os_log_impl(&dword_1A4C7F000, v102, OS_LOG_TYPE_DEFAULT, "           Supports Handoff: %@", buf, 0xCu);
  }

  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v104, v105);
  v106 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
  {
    if (v154)
      v107 = CFSTR("YES");
    else
      v107 = CFSTR("NO");
    *(_DWORD *)buf = 138412290;
    v156 = v107;
    _os_log_impl(&dword_1A4C7F000, v106, OS_LOG_TYPE_DEFAULT, "         Supports Tethering: %@", buf, 0xCu);
  }

  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v108, v109);
  v110 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT))
  {
    v111 = self->_simInserted + 1;
    if (v111 > 2)
      v112 = CFSTR("Invalid");
    else
      v112 = off_1E4DD99F0[v111];
    *(_DWORD *)buf = 138412290;
    v156 = v112;
    _os_log_impl(&dword_1A4C7F000, v110, OS_LOG_TYPE_DEFAULT, "         SIM Inserted State: %@", buf, 0xCu);
  }
  v139 = v33;
  v140 = v22;

  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v113, v114);
  v115 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
  {
    v116 = self->_isPNRSupportedCachedValue + 1;
    if (v116 > 2)
      v117 = CFSTR("Invalid");
    else
      v117 = off_1E4DD99F0[v116];
    *(_DWORD *)buf = 138412290;
    v156 = v117;
    _os_log_impl(&dword_1A4C7F000, v115, OS_LOG_TYPE_DEFAULT, "        PNR Supported State: %@", buf, 0xCu);
  }

  isGreenTea = self->_isGreenTea;
  supportsHandoff = self->_supportsHandoff;
  supportsTethering = self->_supportsTethering;
  supportsFT = self->_supportsFT;
  supportsFTA = self->_supportsFTA;
  supportsFTMW = self->_supportsFTMW;
  supportsSMS = self->_supportsSMS;
  mmsConfigured = self->_mmsConfigured;
  supportsMMS = self->_supportsMMS;
  supportsWiFi = self->_supportsWiFi;
  supportsWLAN = self->_supportsWLAN;
  supportsiMessage = self->_supportsiMessage;
  supportsNonWiFiFaceTime = self->_supportsNonWiFiFaceTime;
  supportsFrontCamera = self->_supportsFrontCamera;
  supportsCellularData = self->_supportsCellularData;
  self->_supportsWiFi = 1;
  self->_supportsStewieState = -1;
  supportsBackCamera = self->_supportsBackCamera;
  self->_isGreenTea = v140;
  self->_supportsHandoff = v139;
  self->_supportsTethering = v154;
  self->_supportsBackCamera = v142;
  self->_supportsFrontCamera = v143;
  self->_supportsMMS = v149;
  self->_mmsConfigured = isMmsConfigured;
  self->_supportsSMS = v150;
  self->_supportsFT = v153;
  self->_supportsFTA = v152;
  self->_supportsFTMW = v151;
  self->_supportsWLAN = v147;
  self->_supportsNonWiFiFaceTime = v146;
  self->_supportsiMessage = v145;
  self->_supportsCellularData = v144;
  *(_QWORD *)&v125 = -1;
  *((_QWORD *)&v125 + 1) = -1;
  *(_OWORD *)&self->_supportsZelkovaState = v125;
  *(_OWORD *)&self->_supportsKeySharingState = v125;
  *(_OWORD *)&self->_supportsFMDV2State = v125;
  *(_OWORD *)&self->_supportsManateeForAppleCash = v125;
  *(_OWORD *)&self->_supportsApplePayState = v125;
  objc_autoreleasePoolPop(context);
  pthread_mutex_unlock(&stru_1ECF9D668);
  if ((isGreenTea != v140
     || supportsHandoff != v139
     || supportsTethering != v154
     || supportsFT != v153
     || supportsFTA != v152
     || supportsFTMW != v151
     || supportsSMS != v150
     || supportsMMS != v149
     || mmsConfigured != isMmsConfigured
     || supportsWLAN != v147
     || !supportsWiFi
     || supportsNonWiFiFaceTime != v146
     || supportsiMessage != v145
     || supportsCellularData != v144
     || supportsFrontCamera != v143
     || supportsBackCamera != v142)
    && !self->_blockPost)
  {
    objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v126, v127);
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___mainThreadPostNotificationName_object_(v128, v129, (uint64_t)CFSTR("__kFaceTimeDeviceCapabilityChangedNotification"), 0);

  }
}

- (int64_t)deviceType
{
  int64_t result;
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  result = qword_1ECF9D7E8;
  if (qword_1ECF9D7E8 <= 0)
  {
    v3 = (void *)MGCopyAnswer();
    objc_msgSend_rangeOfString_(v3, v4, (uint64_t)CFSTR("iPhone"));
    if (v5)
    {
      v6 = 2;
    }
    else
    {
      objc_msgSend_rangeOfString_(v3, 0, (uint64_t)CFSTR("iPod"));
      if (v7)
      {
        v6 = 3;
      }
      else
      {
        objc_msgSend_rangeOfString_(v3, 0, (uint64_t)CFSTR("iPad"));
        if (v8)
        {
          v6 = 4;
        }
        else
        {
          objc_msgSend_rangeOfString_(v3, 0, (uint64_t)CFSTR("Watch"));
          if (v9)
          {
            v6 = 6;
          }
          else
          {
            objc_msgSend_rangeOfString_(v3, 0, (uint64_t)CFSTR("Vision"));
            if (!v10)
            {
              if (qword_1EE788AF0 != -1)
                dispatch_once(&qword_1EE788AF0, &unk_1E4DD98B0);
              goto LABEL_13;
            }
            v6 = 9;
          }
        }
      }
    }
    qword_1ECF9D7E8 = v6;
LABEL_13:

    return qword_1ECF9D7E8;
  }
  return result;
}

- (id)_serviceStatus
{
  uint64_t v2;

  return (id)objc_msgSend_sharedInstance(FTServiceStatus, a2, v2);
}

- (BOOL)supportsSMS
{
  return self->_supportsSMS;
}

- (int64_t)performanceClass
{
  int64_t result;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  id v13;
  const char *v14;
  void *v15;
  id v16;
  const char *v17;
  void *v18;
  id v19;
  const char *v20;
  void *v21;
  id v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  id v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  int64_t v41;
  uint64_t k;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  result = self->_performanceClass;
  if (result < 0)
  {
    v4 = (void *)MGCopyAnswer();
    if ((unint64_t)objc_msgSend_length(v4, v5, v6) < 4)
    {
      v12 = (void *)objc_msgSend_copy(v4, v7, v8);
      if (v12)
        goto LABEL_4;
    }
    else
    {
      objc_msgSend_substringWithRange_(v4, v7, 0, 4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend_copy(v9, v10, v11);

      if (v12)
      {
LABEL_4:
        v13 = objc_alloc(MEMORY[0x1E0C99D20]);
        v15 = (void *)objc_msgSend_initWithObjects_(v13, v14, (uint64_t)CFSTR("N94"), CFSTR("K94"), CFSTR("K93"), CFSTR("K95"), CFSTR("J2A"), CFSTR("J2a"), CFSTR("J1A"), CFSTR("J1a"), 0);
        v16 = objc_alloc(MEMORY[0x1E0C99D20]);
        v18 = (void *)objc_msgSend_initWithObjects_(v16, v17, (uint64_t)CFSTR("P105"), CFSTR("P106"), CFSTR("P107"), 0);
        v19 = objc_alloc(MEMORY[0x1E0C99D20]);
        v21 = (void *)objc_msgSend_initWithObjects_(v19, v20, (uint64_t)CFSTR("N41"), CFSTR("N42"), 0);
        v52 = 0u;
        v53 = 0u;
        v54 = 0u;
        v55 = 0u;
        v22 = v15;
        v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v23, (uint64_t)&v52, v58, 16);
        if (v24)
        {
          v26 = v24;
          v27 = *(_QWORD *)v53;
          while (2)
          {
            for (i = 0; i != v26; ++i)
            {
              if (*(_QWORD *)v53 != v27)
                objc_enumerationMutation(v22);
              if ((objc_msgSend_hasPrefix_(v12, v25, *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i)) & 1) != 0)
              {
                v41 = -1;
                v29 = v22;
                goto LABEL_36;
              }
            }
            v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v25, (uint64_t)&v52, v58, 16);
            if (v26)
              continue;
            break;
          }
        }

        v50 = 0u;
        v51 = 0u;
        v48 = 0u;
        v49 = 0u;
        v29 = v18;
        v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v30, (uint64_t)&v48, v57, 16);
        if (v31)
        {
          v33 = v31;
          v34 = *(_QWORD *)v49;
          while (2)
          {
            for (j = 0; j != v33; ++j)
            {
              if (*(_QWORD *)v49 != v34)
                objc_enumerationMutation(v29);
              if ((objc_msgSend_hasPrefix_(v12, v32, *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * j)) & 1) != 0)
              {
                v41 = 0;
                goto LABEL_36;
              }
            }
            v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v32, (uint64_t)&v48, v57, 16);
            if (v33)
              continue;
            break;
          }
        }

        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        v29 = v21;
        v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v36, (uint64_t)&v44, v56, 16);
        if (v37)
        {
          v39 = v37;
          v43 = v21;
          v40 = *(_QWORD *)v45;
          v41 = 2;
          while (2)
          {
            for (k = 0; k != v39; ++k)
            {
              if (*(_QWORD *)v45 != v40)
                objc_enumerationMutation(v29);
              if ((objc_msgSend_hasPrefix_(v12, v38, *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * k)) & 1) != 0)
              {
                v41 = 1;
                goto LABEL_34;
              }
            }
            v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v38, (uint64_t)&v44, v56, 16);
            if (v39)
              continue;
            break;
          }
LABEL_34:
          v21 = v43;
        }
        else
        {
          v41 = 2;
        }
LABEL_36:

        goto LABEL_37;
      }
    }
    v41 = 2;
LABEL_37:
    self->_performanceClass = v41;

    return self->_performanceClass;
  }
  return result;
}

- (BOOL)madridSupported
{
  return self->_supportsiMessage;
}

- (void)_registerForServiceStatusNotifications
{
  uint64_t v2;
  const char *v4;
  id v5;

  objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], a2, v2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObserver_selector_name_object_(v5, v4, (uint64_t)self, sel__updateCapabilities, CFSTR("FTServiceStatusDidChangeNotification"), 0);

}

- (void)_registerForCapabilityNotifications
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1A4C8076C;
  block[3] = &unk_1E4DD96C0;
  block[4] = self;
  if (qword_1ECF9D7C8 != -1)
    dispatch_once(&qword_1ECF9D7C8, block);
}

+ (id)sharedInstance
{
  if (qword_1ECF9D818 != -1)
    dispatch_once(&qword_1ECF9D818, &unk_1E4DD9390);
  return (id)qword_1ECF9D860;
}

- (void)dealloc
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  objc_super v8;

  objc_msgSend__unregisterForManagedConfigurationNotifications(self, a2, v2);
  objc_msgSend__unregisterForCommCenterReadyNotifications(self, v4, v5);
  objc_msgSend__unregisterForServiceStatusNotifications(self, v6, v7);
  v8.receiver = self;
  v8.super_class = (Class)FTDeviceSupport;
  -[FTDeviceSupport dealloc](&v8, sel_dealloc);
}

- (void)_unregisterForManagedConfigurationNotifications
{
  void *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  id v7;

  v3 = (void *)MEMORY[0x1A85A5DE0](CFSTR("MCProfileConnection"), CFSTR("ManagedConfiguration"));
  objc_msgSend_sharedConnection(v3, v4, v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unregisterObserver_(v7, v6, (uint64_t)self);

}

- (void)_unregisterForServiceStatusNotifications
{
  uint64_t v2;
  const char *v4;
  id v5;

  objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], a2, v2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObserver_name_object_(v5, v4, (uint64_t)self, CFSTR("FTServiceStatusDidChangeNotification"), 0);

}

- (void)_commCenterAlive
{
  uint64_t v2;
  const char *v3;
  id v4;

  if (self->_supportsSMS)
  {
    self->_isPNRSupportedCachedValue = -1;
    objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], a2, v2);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend___mainThreadPostNotificationName_object_(v4, v3, (uint64_t)CFSTR("__kFaceTimeDeviceRegistrationCapabilityChangedNotification"), 0);

  }
}

- (void)_registerForInternalCoreTelephonyNotifications
{
  uint64_t v2;
  NSObject *v4;
  CoreTelephonyClient *coreTelephonyClient;
  const char *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  int v11;
  FTDeviceSupport *v12;
  __int16 v13;
  CoreTelephonyClient *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], a2, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    coreTelephonyClient = self->_coreTelephonyClient;
    v11 = 138412546;
    v12 = self;
    v13 = 2112;
    v14 = coreTelephonyClient;
    _os_log_impl(&dword_1A4C7F000, v4, OS_LOG_TYPE_DEFAULT, "Setting CoreTelephonyClient delegate to start receiving notifications { self: %@, coreTelephonyClient: %@ }", (uint8_t *)&v11, 0x16u);
  }

  objc_msgSend_setDelegate_(self->_coreTelephonyClient, v6, (uint64_t)self);
  if (self->_supportsSMS && !self->_isPNRSupportedCachedValue)
  {
    self->_isPNRSupportedCachedValue = -1;
    objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___mainThreadPostNotificationName_object_(v9, v10, (uint64_t)CFSTR("__kFaceTimeDeviceRegistrationCapabilityChangedNotification"), 0);

  }
}

- (BOOL)madridAvailable
{
  uint64_t v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v4 = objc_msgSend_madridSupported(self, a2, v2);
  if (v4)
    LOBYTE(v4) = objc_msgSend_madridBlocked(self, v5, v6) ^ 1;
  return v4;
}

- (BOOL)madridBlocked
{
  return self->_iMessageBlocked;
}

- (BOOL)callingAvailable
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  __int16 v12;
  uint8_t buf[2];

  if ((objc_msgSend_callingSupported(self, a2, v2) & 1) == 0)
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v4, v5);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v9 = "FTA isn't allowed, disabled";
      v10 = buf;
      goto LABEL_7;
    }
LABEL_8:

    return 0;
  }
  if (objc_msgSend_callingBlocked(self, v4, v5))
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 0;
      v9 = "FTA isn't allowed, managed profile doesn't allow it";
      v10 = (uint8_t *)&v12;
LABEL_7:
      _os_log_impl(&dword_1A4C7F000, v8, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  return 1;
}

- (BOOL)multiwayAvailable
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  __int16 v12;
  uint8_t buf[2];

  if ((objc_msgSend_multiwaySupported(self, a2, v2) & 1) == 0)
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v4, v5);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v9 = "FTMW isn't allowed, disabled";
      v10 = buf;
      goto LABEL_7;
    }
LABEL_8:

    return 0;
  }
  if (objc_msgSend_multiwayBlocked(self, v4, v5))
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 0;
      v9 = "FTMW isn't allowed, managed profile doesn't allow it";
      v10 = (uint8_t *)&v12;
LABEL_7:
      _os_log_impl(&dword_1A4C7F000, v8, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  return 1;
}

- (BOOL)multiwayBlocked
{
  return ((uint64_t (*)(FTDeviceSupport *, char *))MEMORY[0x1E0DE7D20])(self, sel_faceTimeBlocked);
}

- (BOOL)multiwaySupported
{
  return self->_supportsFTMW;
}

- (BOOL)callingBlocked
{
  return ((uint64_t (*)(FTDeviceSupport *, char *))MEMORY[0x1E0DE7D20])(self, sel_faceTimeBlocked);
}

- (BOOL)callingSupported
{
  return self->_supportsFTA;
}

- (BOOL)inProcess_isCallingSupported
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  const char *v5;
  void *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t i;
  const char *v16;
  uint64_t v17;
  int v18;
  int v19;
  const char *v20;
  uint64_t v21;
  int v22;
  char v23;
  NSObject *v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  const __CFString *v34;
  __int16 v35;
  const __CFString *v36;
  __int16 v37;
  const __CFString *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  objc_msgSend_sharedInstance(MEMORY[0x1E0D34CC8], a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  objc_msgSend_carrierBundleValueFromAllSIMsForKey_ofType_withFallback_(v3, v5, (uint64_t)CFSTR("AllowsFaceTimeAudio"), v4, MEMORY[0x1E0C9AAA0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v7 = v6;
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v29, v39, 16);
  if (v9)
  {
    v12 = v9;
    v13 = *(_QWORD *)v30;
    LOBYTE(v14) = 1;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v30 != v13)
          objc_enumerationMutation(v7);
        if ((v14 & 1) != 0)
          v14 = objc_msgSend_BOOLValue(*(void **)(*((_QWORD *)&v29 + 1) + 8 * i), v10, v11, (_QWORD)v29);
        else
          v14 = 0;
      }
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v29, v39, 16);
    }
    while (v12);
  }
  else
  {
    v14 = 1;
  }

  if (objc_msgSend_count(v7, v16, v17))
    v18 = v14;
  else
    v18 = 0;
  v19 = MGGetBoolAnswer();
  v22 = MGGetBoolAnswer();
  if (v22)
    v23 = v18 | v19 ^ 1;
  else
    v23 = 0;
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v20, v21, (_QWORD)v29);
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = CFSTR("NO");
    if (v22)
      v26 = CFSTR("YES");
    else
      v26 = CFSTR("NO");
    if (v18)
      v27 = CFSTR("YES");
    else
      v27 = CFSTR("NO");
    *(_DWORD *)buf = 138412802;
    v34 = v26;
    v35 = 2112;
    v36 = v27;
    if (v19)
      v25 = CFSTR("YES");
    v37 = 2112;
    v38 = v25;
    _os_log_impl(&dword_1A4C7F000, v24, OS_LOG_TYPE_DEFAULT, "Checked FTA support in process {supportsFT: %@, carrierOverrideFTA: %@, GT: %@}", buf, 0x20u);
  }

  return v23;
}

- (BOOL)iMessageAvailable
{
  return ((uint64_t (*)(FTDeviceSupport *, char *))MEMORY[0x1E0DE7D20])(self, sel_madridAvailable);
}

- (BOOL)faceTimeAvailable
{
  return ((uint64_t (*)(FTDeviceSupport *, char *))MEMORY[0x1E0DE7D20])(self, sel_conferencingEnabled);
}

- (BOOL)identityServicesSupported
{
  return 1;
}

- (BOOL)supportsNonWiFiFaceTime
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  char v7;

  if (self->_supportsNonWiFiFaceTime)
    return 1;
  objc_msgSend_sharedInstance(FTUserConfiguration, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend__nonWifiFaceTimeEntitled(v4, v5, v6);

  return v7;
}

- (BOOL)conferencingBlocked
{
  return self->_faceTimeBlocked;
}

- (BOOL)conferencingEnabled
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  __int16 v12;
  uint8_t buf[2];

  if ((objc_msgSend_conferencingAllowed(self, a2, v2) & 1) == 0)
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v4, v5);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v9 = "Conferencing isn't allowed, disabled";
      v10 = buf;
      goto LABEL_7;
    }
LABEL_8:

    return 0;
  }
  if (objc_msgSend_conferencingBlocked(self, v4, v5))
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 0;
      v9 = "Conferencing isn't allowed, managed profile doesn't allow it";
      v10 = (uint8_t *)&v12;
LABEL_7:
      _os_log_impl(&dword_1A4C7F000, v8, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  return 1;
}

- (BOOL)conferencingAllowed
{
  return self->_supportsFT;
}

- (BOOL)registrationSupported
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  int v6;

  if ((objc_msgSend_faceTimeSupported(self, a2, v2) & 1) != 0
    || (v6 = objc_msgSend_iMessageSupported(self, v4, v5)) != 0)
  {
    LOBYTE(v6) = MEMORY[0x1E0DE7D20](self, sel_supportsAppleIDIdentification, v5);
  }
  return v6;
}

- (BOOL)accountModificationRestricted
{
  return self->_accountModificationRestricted;
}

- (BOOL)supportsAnimojiV2
{
  return MGGetBoolAnswer();
}

- (BOOL)supportsEmojiImages
{
  uint64_t v2;

  objc_msgSend_deviceType(self, a2, v2);
  return _os_feature_enabled_impl();
}

- (BOOL)supportsHomeKitResident
{
  uint64_t v2;

  return (objc_msgSend_deviceType(self, a2, v2) & 0xFFFFFFFFFFFFFFFDLL) == 5;
}

- (BOOL)supportsCinematicFraming
{
  return MGIsDeviceOneOfType();
}

- (BOOL)supportsHEIFEncoding
{
  return MGGetBoolAnswer();
}

- (NSString)model
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_sharedInstance(MEMORY[0x1E0D36A10], a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_model(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)deviceIDPrefix
{
  return (NSString *)CFSTR("U");
}

- (NSString)deviceTypeIDPrefix
{
  uint64_t v2;

  if (!self->_supportsSMS)
    return (NSString *)CFSTR("U");
  if (objc_msgSend_isC2KEquipment(self, a2, v2))
    return (NSString *)CFSTR("m");
  return (NSString *)CFSTR("i");
}

- (NSDictionary)telephonyCapabilities
{
  const void *v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!self->_supportsSMS)
    return (NSDictionary *)0;
  v2 = (const void *)_CTServerConnectionCreate();
  if (!v2)
    return (NSDictionary *)0;
  v3 = _CTServerConnectionCopySystemCapabilities();
  CFRelease(v2);
  if ((_DWORD)v3 == 2)
    return (NSDictionary *)0;
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v4, v5);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    v11 = 0;
    v12 = 2048;
    v13 = (int)v3;
    v14 = 2048;
    v15 = v3 >> 32;
    _os_log_impl(&dword_1A4C7F000, v7, OS_LOG_TYPE_INFO, "CT returned system capabilities: %@  error: (%ld:%ld)", buf, 0x20u);
  }

  if ((_DWORD)v3)
  {
    OSLogHandleForIDSCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v11 = (int)v3;
      v12 = 2048;
      v13 = v3 >> 32;
      _os_log_impl(&dword_1A4C7F000, v8, OS_LOG_TYPE_ERROR, "Error querying system capabilities: (%ld:%ld)", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
  }
  OSLogHandleForIDSCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4C7F000, v9, OS_LOG_TYPE_ERROR, "Empty system capabilities returned", buf, 2u);
  }

  if ((os_log_shim_legacy_logging_enabled() & 1) != 0)
  {
    _IDSWarnV();
    _IDSLogV();
    _IDSLogTransport();
  }
  return (NSDictionary *)0;
}

- (BOOL)isC2KEquipment
{
  uint64_t v2;
  void *v3;
  const char *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  BOOL v8;

  if (!self->_supportsSMS)
    return 0;
  objc_msgSend_telephonyCapabilities(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v3, v4, *MEMORY[0x1E0CA7920]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_intValue(v5, v6, v7) == 0;

  return v8;
}

- (BOOL)supportsHDRdecoding
{
  const __CFDictionary *v2;
  const __CFDictionary *v3;
  BOOL v4;

  v2 = (const __CFDictionary *)VTCopyHEVCDecoderCapabilitiesDictionary();
  if (!v2)
    return 0;
  v3 = v2;
  v4 = CFDictionaryGetValue(v2, (const void *)*MEMORY[0x1E0CED2C8]) == (const void *)*MEMORY[0x1E0C9AE50];
  CFRelease(v3);
  return v4;
}

- (BOOL)supportsSimultaneousVoiceAndDataRightNow
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  char doesAnySIMSupportsSimultaneousVoiceAndDataRightNow;

  if (!self->_supportsSMS)
    return 1;
  objc_msgSend_sharedInstance(MEMORY[0x1E0D34CC8], a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  doesAnySIMSupportsSimultaneousVoiceAndDataRightNow = objc_msgSend_doesAnySIMSupportsSimultaneousVoiceAndDataRightNow(v3, v4, v5);

  return doesAnySIMSupportsSimultaneousVoiceAndDataRightNow;
}

- (BOOL)SIMInserted
{
  uint64_t v2;
  int64_t simInserted;

  simInserted = self->_simInserted;
  if (simInserted == -1)
  {
    objc_msgSend__initializeSIMInsertedCachedValue(self, a2, v2);
    simInserted = self->_simInserted;
  }
  return simInserted == 1;
}

- (void)_initializeSIMInsertedCachedValue
{
  FTSelectedPNRSubscription *selectedPNRSubscription;
  void *v4;
  const char *v5;
  uint64_t v6;
  id v7;
  CoreTelephonyClient *coreTelephonyClient;
  void *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  const char *v15;
  int64_t v16;
  NSObject *v17;
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  selectedPNRSubscription = self->_selectedPNRSubscription;
  v19 = 0;
  objc_msgSend_selectedPhoneNumberRegistrationSubscriptionWithError_(selectedPNRSubscription, a2, (uint64_t)&v19);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v19;
  if (v4)
  {
    coreTelephonyClient = self->_coreTelephonyClient;
    v18 = 0;
    objc_msgSend_getSIMStatus_error_(coreTelephonyClient, v5, (uint64_t)v4, &v18);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v18;
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v11, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v9)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v21 = v9;
        _os_log_impl(&dword_1A4C7F000, v14, OS_LOG_TYPE_DEFAULT, "Loaded initial SIM status { simStatus: %@ }", buf, 0xCu);
      }

      if ((objc_msgSend_isEqualToString_(v9, v15, *MEMORY[0x1E0CA77F8]) & 1) != 0)
      {
        v16 = 0;
        goto LABEL_14;
      }
    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_1A4CBA380();

    }
    v16 = 1;
    goto LABEL_14;
  }
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v5, v6);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v7;
    _os_log_impl(&dword_1A4C7F000, v17, OS_LOG_TYPE_DEFAULT, "Unable to find selected context to load SIM status { subscriptionError: %@ }", buf, 0xCu);
  }

  v16 = 0;
  v9 = 0;
LABEL_14:
  self->_simInserted = v16;

}

- (BOOL)supportsStewie
{
  uint64_t v2;
  NSObject *v4;
  int64_t supportsStewieState;
  CoreTelephonyClient *coreTelephonyClient;
  void *v8;
  __CFString *v9;
  const char *v10;
  uint64_t v11;
  unsigned int v12;
  const char *v13;
  uint64_t v14;
  NSObject *v15;
  _BOOL4 v16;
  const char *v17;
  const __CFString *v18;
  id v19;
  uint8_t buf[4];
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (qword_1ECF9D708 != -1)
    dispatch_once(&qword_1ECF9D708, &unk_1E4DD99D0);
  if (!byte_1EE788B18)
  {
    supportsStewieState = self->_supportsStewieState;
    if (supportsStewieState != -1)
      return supportsStewieState == 1;
    coreTelephonyClient = self->_coreTelephonyClient;
    v19 = 0;
    objc_msgSend_getStewieSupport_(coreTelephonyClient, a2, (uint64_t)&v19);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (__CFString *)v19;
    v12 = objc_msgSend_hwSupport(v8, v10, v11);
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v13, v14);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v16)
      {
        *(_DWORD *)buf = 138412290;
        v21 = v9;
        v17 = "Failed to get stewie hw support { error: %@ }";
LABEL_15:
        _os_log_impl(&dword_1A4C7F000, v15, OS_LOG_TYPE_DEFAULT, v17, buf, 0xCu);
      }
    }
    else if (v16)
    {
      v18 = CFSTR("NO");
      if (v12)
        v18 = CFSTR("YES");
      *(_DWORD *)buf = 138412290;
      v21 = v18;
      v17 = "Got stewie hw support { stewieHWSupport: %@ }";
      goto LABEL_15;
    }

    self->_supportsStewieState = v12;
    supportsStewieState = self->_supportsStewieState;
    return supportsStewieState == 1;
  }
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], a2, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4C7F000, v4, OS_LOG_TYPE_DEFAULT, "Device is Dev Board, Returning YES for supporting Stewie", buf, 2u);
  }

  return 1;
}

- (void)supportsStewieWithCompletion:(id)a3
{
  const char *v4;
  uint64_t v5;
  void (**v6)(id, uint64_t, _QWORD);
  NSObject *v7;
  int64_t supportsStewieState;
  CoreTelephonyClient *coreTelephonyClient;
  const char *v10;
  _QWORD v11[5];
  void (**v12)(id, uint64_t, _QWORD);
  uint8_t buf[16];

  v6 = (void (**)(id, uint64_t, _QWORD))a3;
  if (qword_1ECF9D708 != -1)
    dispatch_once(&qword_1ECF9D708, &unk_1E4DD99D0);
  if (byte_1EE788B18)
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v4, v5);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4C7F000, v7, OS_LOG_TYPE_DEFAULT, "Device is Dev Board, Returning YES for supporting Stewie", buf, 2u);
    }

    v6[2](v6, 1, 0);
  }
  else
  {
    supportsStewieState = self->_supportsStewieState;
    if (supportsStewieState == -1)
    {
      coreTelephonyClient = self->_coreTelephonyClient;
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = sub_1A4C8C928;
      v11[3] = &unk_1E4DD97D8;
      v11[4] = self;
      v12 = v6;
      objc_msgSend_getStewieSupportWithCompletion_(coreTelephonyClient, v10, (uint64_t)v11);

    }
    else
    {
      v6[2](v6, supportsStewieState == 1, 0);
    }
  }

}

- (BOOL)supportsFriendingViaPush
{
  uint64_t v2;
  NSObject *v3;
  uint8_t v5[16];

  if (qword_1ECF9D708 != -1)
    dispatch_once(&qword_1ECF9D708, &unk_1E4DD99D0);
  if (!byte_1EE788B18)
    return _os_feature_enabled_impl();
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], a2, v2);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1A4C7F000, v3, OS_LOG_TYPE_DEFAULT, "Device is Dev Board, Returning YES for supporting Game Center Friending", v5, 2u);
  }

  return 1;
}

- (BOOL)wantsBreakBeforeMake
{
  const char *v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  char v11;

  if ((IMGetCachedDomainBoolForKey() & 1) != 0)
    return 1;
  if (!self->_supportsSMS || (objc_msgSend_supportsSimultaneousVoiceAndDataRightNow(self, v3, v4) & 1) != 0)
    return 0;
  objc_msgSend_sharedInstance(FTEntitlementSupport, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_faceTimeNonWiFiEntitled(v8, v9, v10);

  return v11;
}

- (NSString)deviceRegionInfo
{
  return (NSString *)(id)MGCopyAnswer();
}

- (NSString)deviceName
{
  FTDeviceSupport *v2;
  __CFString *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  __CFString *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (__CFString *)SCDynamicStoreCopyComputerName(0, 0);
  objc_sync_exit(v2);

  if (objc_msgSend_length(v3, v4, v5))
  {
    objc_msgSend___stringByStrippingControlCharacters(v3, v6, v7);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend_model(v2, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_length(v9, v10, v11))
    {
      objc_msgSend___stringByStrippingControlCharacters(v9, v12, v13);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = CFSTR("Unnamed Device");
    }

  }
  return (NSString *)v8;
}

+ (id)marketingNameForDeviceType:(int64_t)a3
{
  id *v4;
  id v5;
  id v7;

  switch(a3)
  {
    case 0:
      v4 = (id *)MEMORY[0x1E0D37040];
      goto LABEL_11;
    case 1:
      v4 = (id *)MEMORY[0x1E0D37030];
      goto LABEL_11;
    case 2:
      v4 = (id *)MEMORY[0x1E0D37058];
      goto LABEL_11;
    case 3:
      v4 = (id *)MEMORY[0x1E0D37060];
      goto LABEL_11;
    case 4:
      v4 = (id *)MEMORY[0x1E0D37050];
      goto LABEL_11;
    case 5:
      v4 = (id *)MEMORY[0x1E0D37018];
      goto LABEL_11;
    case 6:
      v4 = (id *)MEMORY[0x1E0D37048];
      goto LABEL_11;
    case 7:
      v4 = (id *)MEMORY[0x1E0D37020];
      goto LABEL_11;
    case 8:
      v4 = (id *)MEMORY[0x1E0D37028];
LABEL_11:
      v5 = *v4;
      break;
    default:
      v5 = (id)*MEMORY[0x1E0D37040];
      if (a3 == 9)
      {
        v7 = (id)*MEMORY[0x1E0D37038];

        v5 = v7;
      }
      break;
  }
  return v5;
}

- (NSString)deviceColor
{
  return (NSString *)(id)MGCopyAnswer();
}

- (NSString)enclosureColor
{
  return (NSString *)(id)MGCopyAnswer();
}

- (BOOL)isInDualPhoneIdentityMode
{
  uint64_t v2;

  return objc_msgSend_isDeviceInDualPhoneIdentityMode(self->_selectedPNRSubscription, a2, v2);
}

- (id)registrationState
{
  FTSelectedPNRSubscription *selectedPNRSubscription;
  void *v4;
  const char *v5;
  uint64_t v6;
  id v7;
  CoreTelephonyClient *coreTelephonyClient;
  void *v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const __CFString *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  __CFDictionary *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t isReady;
  const char *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  id v43;
  id v44;
  uint8_t buf[4];
  id v46;
  __int16 v47;
  const __CFString *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  selectedPNRSubscription = self->_selectedPNRSubscription;
  v44 = 0;
  objc_msgSend_selectedPhoneNumberRegistrationSubscriptionWithError_(selectedPNRSubscription, a2, (uint64_t)&v44);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v44;
  if (v4)
  {
    coreTelephonyClient = self->_coreTelephonyClient;
    v43 = 0;
    objc_msgSend_getPNRContext_outError_(coreTelephonyClient, v5, (uint64_t)v4, &v43);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v43;
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v11, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v9)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        if (objc_msgSend_isReady(v9, v15, v16))
          v19 = CFSTR("YES");
        else
          v19 = CFSTR("NO");
        objc_msgSend_phoneNumber(v9, v17, v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_imsi(v9, v21, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_plmn(v9, v24, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413570;
        v46 = v9;
        v47 = 2112;
        v48 = v19;
        v49 = 2112;
        v50 = v20;
        v51 = 2112;
        v52 = v23;
        v53 = 2112;
        v54 = v26;
        v55 = 2112;
        v56 = v4;
        _os_log_impl(&dword_1A4C7F000, v14, OS_LOG_TYPE_DEFAULT, "Read telephony phone number registration context { PNRContext: %@, isReady: %@, phoneNumber: %@, IMSI: %@, PLMN: %@, subscriptionContext: %@ }", buf, 0x3Eu);

      }
      v27 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v28 = (void *)MEMORY[0x1E0CB37E8];
      isReady = objc_msgSend_isReady(v9, v29, v30);
      objc_msgSend_numberWithBool_(v28, v32, isReady);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (v33)
        CFDictionarySetValue(v27, CFSTR("__kFTCTRegistrationStatusCanRegisterKey"), v33);

      objc_msgSend_phoneNumber(v9, v34, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (v36)
        CFDictionarySetValue(v27, CFSTR("__kFTCTRegistrationStatusPhoneNumberKey"), v36);

      objc_msgSend_imsi(v9, v37, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (v39)
        CFDictionarySetValue(v27, CFSTR("__kFTCTRegistrationStatusIMSIKey"), v39);

      objc_msgSend_plmn(v9, v40, v41);
      v14 = objc_claimAutoreleasedReturnValue();
      if (v14)
        CFDictionarySetValue(v27, CFSTR("__kFTCTRegistrationStatusPLMNKey"), v14);
    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_1A4CBA3EC();
      v27 = 0;
    }

  }
  else
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v5, v6);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v46 = v7;
      _os_log_impl(&dword_1A4C7F000, v10, OS_LOG_TYPE_DEFAULT, "Could not find user-selected subscription to check phone number registration state -- returning nil { error: %@ }", buf, 0xCu);
    }
    v27 = 0;
  }

  return v27;
}

- (void)pnrReadyStateNotification:(id)a3 regState:(BOOL)a4
{
  id v4;
  id v5;

  v5 = a3;
  v4 = v5;
  im_dispatch_after_primary_queue();

}

- (void)phoneNumberChanged:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  im_dispatch_after_primary_queue();

}

- (void)carrierBundleChange:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  im_primary_queue();
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1A4C8D3D0;
  block[3] = &unk_1E4DD96C0;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)operatorBundleChange:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  im_primary_queue();
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1A4C8D444;
  block[3] = &unk_1E4DD96C0;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)simStatusDidChange:(id)a3 status:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;

  v5 = a3;
  v8 = a4;
  v6 = v5;
  v7 = v8;
  im_dispatch_after_primary_queue();

}

- (void)_handleSIMStatusChangedToStatus:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v4;
    _os_log_impl(&dword_1A4C7F000, v7, OS_LOG_TYPE_DEFAULT, "Handling relevant SIM status change { status: %@ }", buf, 0xCu);
  }

  if (self->_supportsSMS)
  {
    if (objc_msgSend_isEqualToString_(v4, v8, *MEMORY[0x1E0CA7818]))
    {
      self->_simInserted = 1;
      if (self->_simBecameNotReady)
      {
        objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v9, v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend___mainThreadPostNotificationName_object_(v11, v12, (uint64_t)CFSTR("__kFaceTimeDeviceSIMInsertedNotification"), 0);

      }
      self->_simBecameNotReady = 0;
    }
    else if (objc_msgSend_isEqualToString_(v4, v9, *MEMORY[0x1E0CA77F8]))
    {
      self->_simBecameNotReady = 1;
      self->_simInserted = 0;
      im_dispatch_after_primary_queue();
    }
  }

}

- (void)_handleCarrierSettingsChanged
{
  uint64_t v2;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint8_t buf[16];

  objc_msgSend_registration(MEMORY[0x1E0D36AA8], a2, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4C7F000, v4, OS_LOG_TYPE_DEFAULT, "Carrier bundle changed, processing in a bit...", buf, 2u);
  }

  im_dispatch_after_primary_queue();
  if (self->_supportsSMS)
  {
    self->_isPNRSupportedCachedValue = -1;
    objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___mainThreadPostNotificationName_object_(v7, v8, (uint64_t)CFSTR("__kFaceTimeDeviceRegistrationCapabilityChangedNotification"), 0);

  }
}

- (void)noteSelectedPhoneNumberRegistrationSubscriptionDidChange
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;

  objc_msgSend__invalidateValuesCachedForSelectedPhoneNumberRegistration(self, a2, v2);
  objc_msgSend__handlePotentialPhoneNumberRegistrationStateChanged(self, v4, v5);
}

- (void)_invalidateValuesCachedForSelectedPhoneNumberRegistration
{
  NSString *number;

  self->_simBecameNotReady = 0;
  self->_simInserted = -1;
  self->_isPNRSupportedCachedValue = -1;
  number = self->_number;
  self->_number = 0;

}

- (void)_handlePotentialPhoneNumberRegistrationStateChanged
{
  NSString *number;

  if ((byte_1EE788A40 & 1) == 0)
  {
    number = self->_number;
    self->_number = 0;

    byte_1EE788A40 = 1;
    im_dispatch_after_primary_queue();
  }
}

- (NSDictionary)CTNetworkInformation
{
  id v3;
  FTSelectedPNRSubscription *selectedPNRSubscription;
  const char *v5;
  void *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  id v10;
  CoreTelephonyClient *coreTelephonyClient;
  const char *v12;
  NSObject *v13;
  id v14;
  const char *v15;
  CoreTelephonyClient *v16;
  const char *v17;
  void *v18;
  id v19;
  const char *v20;
  CoreTelephonyClient *v21;
  const char *v22;
  void *v23;
  id v24;
  const char *v25;
  CoreTelephonyClient *v26;
  const char *v27;
  void *v28;
  const char *v29;
  const char *v31;
  uint64_t v32;
  NSObject *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  uint8_t buf[4];
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  if (!self->_supportsSMS)
    return (NSDictionary *)0;
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  selectedPNRSubscription = self->_selectedPNRSubscription;
  v39 = 0;
  objc_msgSend_selectedPhoneNumberRegistrationSubscriptionWithError_(selectedPNRSubscription, v5, (uint64_t)&v39);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v39;
  v10 = v7;
  if (v6)
  {

    coreTelephonyClient = self->_coreTelephonyClient;
    v38 = 0;
    v13 = objc_msgSend_copyLastKnownMobileSubscriberCountryCode_error_(coreTelephonyClient, v12, (uint64_t)v6, &v38);
    v14 = v38;
    objc_msgSend__updateCTNetworkDictionary_key_withTelephonyNetworkValue_telephonyError_(self, v15, (uint64_t)v3, CFSTR("sim-mcc"), v13, v14);

    v16 = self->_coreTelephonyClient;
    v37 = 0;
    v18 = (void *)objc_msgSend_copyMobileSubscriberNetworkCode_error_(v16, v17, (uint64_t)v6, &v37);
    v19 = v37;
    objc_msgSend__updateCTNetworkDictionary_key_withTelephonyNetworkValue_telephonyError_(self, v20, (uint64_t)v3, CFSTR("sim-mnc"), v18, v19);

    v21 = self->_coreTelephonyClient;
    v36 = 0;
    v23 = (void *)objc_msgSend_copyMobileCountryCode_error_(v21, v22, (uint64_t)v6, &v36);
    v24 = v36;
    objc_msgSend__updateCTNetworkDictionary_key_withTelephonyNetworkValue_telephonyError_(self, v25, (uint64_t)v3, CFSTR("network-mcc"), v23, v24);

    v26 = self->_coreTelephonyClient;
    v35 = 0;
    v28 = (void *)objc_msgSend_copyMobileNetworkCode_error_(v26, v27, (uint64_t)v6, &v35);
    v10 = v35;
    objc_msgSend__updateCTNetworkDictionary_key_withTelephonyNetworkValue_telephonyError_(self, v29, (uint64_t)v3, CFSTR("network-mnc"), v28, v10);

  }
  else
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v8, v9);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v41 = v10;
      _os_log_impl(&dword_1A4C7F000, v13, OS_LOG_TYPE_DEFAULT, "Unable to find selected context to load telephony network information { error: %@ }", buf, 0xCu);
    }
  }

  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v31, v32);
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v41 = v3;
    _os_log_impl(&dword_1A4C7F000, v33, OS_LOG_TYPE_DEFAULT, "Returning telephony network information { networkInformation: %@ }", buf, 0xCu);
  }

  v34 = v3;
  return (NSDictionary *)v34;
}

- (void)_updateCTNetworkDictionary:(id)a3 key:(id)a4 withTelephonyNetworkValue:(id)a5 telephonyError:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  int v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v15 = objc_msgSend_length(v11, v13, v14);
  if (v10 && v15)
  {
    objc_msgSend_setObject_forKey_(v9, v16, (uint64_t)v11, v10);
  }
  else
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v16, v17);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v12)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v20 = 138412802;
        v21 = v10;
        v22 = 2112;
        v23 = v11;
        v24 = 2112;
        v25 = v12;
        _os_log_impl(&dword_1A4C7F000, v19, OS_LOG_TYPE_DEFAULT, "Error reading telephony network information { key: %@, value: %@, error: %@ }", (uint8_t *)&v20, 0x20u);
      }
    }
    else if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      sub_1A4CBA44C();
    }

  }
}

- (BOOL)supportsSMSIdentification
{
  int64_t isPNRSupportedCachedValue;
  NSObject *v4;
  FTSelectedPNRSubscription *selectedPNRSubscription;
  void *v6;
  __CFString *v7;
  const char *v8;
  uint64_t v9;
  NSObject *v10;
  CoreTelephonyClient *coreTelephonyClient;
  const char *v12;
  id v13;
  const char *v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const __CFString *v22;
  id v24;
  id v25;
  uint8_t buf[4];
  const __CFString *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (self->_supportsSMS)
  {
    isPNRSupportedCachedValue = self->_isPNRSupportedCachedValue;
    if (isPNRSupportedCachedValue == -1)
    {
      selectedPNRSubscription = self->_selectedPNRSubscription;
      v25 = 0;
      objc_msgSend_selectedPhoneNumberRegistrationSubscriptionWithError_(selectedPNRSubscription, a2, (uint64_t)&v25);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (__CFString *)v25;
      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v8, v9);
      v10 = objc_claimAutoreleasedReturnValue();
      v4 = v10;
      if (v6)
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          sub_1A4CBA50C();

        coreTelephonyClient = self->_coreTelephonyClient;
        v24 = 0;
        LODWORD(v4) = objc_msgSend_isPNRSupported_outError_(coreTelephonyClient, v12, (uint64_t)v6, &v24);
        v13 = v24;
        objc_msgSend_registration(MEMORY[0x1E0D36AA8], v14, v15);
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v13)
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            sub_1A4CBA4AC();

          LOBYTE(v4) = objc_msgSend__legacy_supportsSMSIdentification(self, v18, v19);
        }
        else
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            v22 = CFSTR("NO");
            if ((_DWORD)v4)
              v22 = CFSTR("YES");
            *(_DWORD *)buf = 138412546;
            v27 = v22;
            v28 = 2112;
            v29 = v6;
            _os_log_impl(&dword_1A4C7F000, v17, OS_LOG_TYPE_DEFAULT, "Determined value for isPNRSupported { isPNRSupported: %@, subscription: %@ }", buf, 0x16u);
          }

          self->_isPNRSupportedCachedValue = v4;
        }

      }
      else
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v27 = v7;
          _os_log_impl(&dword_1A4C7F000, v4, OS_LOG_TYPE_DEFAULT, "Unable to locate user-selected subscription to check isPNRSupported -- falling back { error: %@ }", buf, 0xCu);
        }

        LOBYTE(v4) = objc_msgSend__legacy_supportsSMSIdentification(self, v20, v21);
      }

    }
    else
    {
      LOBYTE(v4) = isPNRSupportedCachedValue == 1;
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return (char)v4;
}

- (BOOL)_legacy_supportsSMSIdentification
{
  uint64_t v2;
  const char *v3;
  uint64_t v4;
  const void *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  unsigned __int8 v18;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  _WORD v22[11];

  *(_QWORD *)&v22[7] = *MEMORY[0x1E0C80C00];
  v17 = 0;
  v15 = 0u;
  v16 = 0u;
  if (qword_1EE788AD8 != -1)
    dispatch_once(&qword_1EE788AD8, &unk_1E4DD9870);
  if (qword_1EE788AE8 != -1)
    dispatch_once(&qword_1EE788AE8, &unk_1E4DD9890);
  v18 = -86;
  v2 = off_1EE788AD0(*MEMORY[0x1E0C9AE00], nullsub_1, &v15);
  if (!v2)
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v3, v4, v15, v16, v17);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4C7F000, v13, OS_LOG_TYPE_DEFAULT, "Could not create CT server connection to query _CTServerConnectionIsPhoneNumberRegistrationSupported", buf, 2u);
    }

    return 1;
  }
  v5 = (const void *)v2;
  v6 = off_1EE788AE0(v2, &v18);
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v7, v8, v15, v16, v17);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109632;
    v20 = v18;
    v21 = 1024;
    *(_DWORD *)v22 = v6;
    v22[2] = 2048;
    *(_QWORD *)&v22[3] = v6 >> 32;
    _os_log_impl(&dword_1A4C7F000, v9, OS_LOG_TYPE_DEFAULT, "_CTServerConnectionIsPhoneNumberRegistrationSupported returned value { registrationSupported: %d, error: (%d:%ld) }", buf, 0x18u);
  }

  CFRelease(v5);
  if ((_DWORD)v6)
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      v20 = v6;
      v21 = 2048;
      *(_QWORD *)v22 = v6 >> 32;
      _os_log_impl(&dword_1A4C7F000, v12, OS_LOG_TYPE_DEFAULT, "Failed to query _CTServerConnectionIsPhoneNumberRegistrationSupported from CT { error: (%d:%ld) }", buf, 0x12u);
    }

    return 1;
  }
  return v18 != 0;
}

- (BOOL)supportsAppleIDIdentification
{
  return 1;
}

- (BOOL)isTelephonyDevice
{
  return self->_supportsSMS;
}

- (NSString)telephoneNumber
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  const char *v6;
  NSString *number;
  NSString *v8;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  id v14;
  NSString *v15;
  id v16;

  if (objc_msgSend_isTelephonyDevice(self, a2, v2)
    && objc_msgSend_isTelephonyDevice(self, v4, v5))
  {
    number = self->_number;
    if (number)
    {
      v8 = number;
    }
    else
    {
      objc_msgSend_selectedRegistrationPhoneNumberWithError_(self->_selectedPNRSubscription, v6, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        IMInternationalForPhoneNumberWithOptions();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_length(v11, v12, v13))
        {
          v14 = v11;

          v10 = v14;
        }

      }
      v15 = self->_number;
      self->_number = (NSString *)v10;
      v16 = v10;

      v8 = self->_number;
    }
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (NSString)userAgentString
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_sharedInstance(MEMORY[0x1E0D36A10], a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_userAgentString(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)productName
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_sharedInstance(MEMORY[0x1E0D36A10], a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_productName(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)productVersion
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_sharedInstance(MEMORY[0x1E0D36A10], a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_productVersion(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)productBuildVersion
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_sharedInstance(MEMORY[0x1E0D36A10], a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_productBuildVersion(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)productOSVersion
{
  uint64_t v2;
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_productName(self, a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_productVersion(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_productBuildVersion(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v4, v12, (uint64_t)CFSTR("%@,%@,%@"), v5, v8, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v13;
}

- (NSString)deviceInformationString
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_sharedInstance(MEMORY[0x1E0D36A10], a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceInformationString(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)_lockdownStateChanged:(id)a3
{
  void *v3;
  const char *v4;
  uint64_t v5;
  int isActivated;
  const char *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint8_t v18[16];

  objc_msgSend_sharedInstance(MEMORY[0x1E0D36A50], a2, (uint64_t)a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  isActivated = objc_msgSend_isActivated(v3, v4, v5);

  if (isActivated)
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v7, v8);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_1A4C7F000, v9, OS_LOG_TYPE_DEFAULT, "Lockdown became activated, let's notify", v18, 2u);
    }

    objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___mainThreadPostNotificationName_object_(v12, v13, (uint64_t)CFSTR("__kFaceTimeDeviceRegistrationStateChangedNotification"), 0);

    objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___mainThreadPostNotificationName_object_(v16, v17, (uint64_t)CFSTR("__kFaceTimeDeviceRegistrationCapabilityChangedNotification"), 0);

  }
}

- (BOOL)nonWifiFaceTimeAvailable
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  char v8;

  objc_msgSend_sharedInstance(FTEntitlementSupport, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_faceTimeNonWiFiEntitled(v4, v5, v6))
    v8 = objc_msgSend_nonWifiAvailableForBundleId_(self, v7, (uint64_t)CFSTR("com.apple.facetime"));
  else
    v8 = 0;

  return v8;
}

- (BOOL)nonWifiAvailableForBundleId:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  char v8;
  const char *v9;
  uint64_t v10;
  char v11;
  void *v12;
  const char *v13;
  uint64_t v14;

  v3 = a3;
  objc_msgSend_sharedInstance(FTUserConfiguration, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_cellularDataEnabledForBundleId_(v6, v7, (uint64_t)v3);

  if ((v8 & 1) != 0)
  {
    v11 = 1;
  }
  else
  {
    objc_msgSend_sharedInstance(FTNetworkSupport, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend_allowAnyNetwork(v12, v13, v14);

  }
  return v11;
}

- (BOOL)wifiAllowedForBundleId:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  char v10;
  void *v11;
  const char *v12;
  uint64_t v13;

  v3 = a3;
  if (MGGetBoolAnswer())
  {
    objc_msgSend_sharedInstance(FTUserConfiguration, v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_wifiAllowedForBundleId_(v6, v7, (uint64_t)v3) & 1) != 0)
    {
      v10 = 1;
    }
    else
    {
      objc_msgSend_sharedInstance(FTNetworkSupport, v8, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend_allowAnyNetwork(v11, v12, v13);

    }
  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (BOOL)nonBluetoothAvailableForBundleId:(id)a3
{
  return 1;
}

- (BOOL)nonWifiCallingAvailable
{
  return ((uint64_t (*)(FTDeviceSupport *, char *))MEMORY[0x1E0DE7D20])(self, sel_nonWifiFaceTimeAvailable);
}

- (BOOL)supportsApplePay
{
  uint64_t v2;
  NSObject *v4;
  int64_t supportsApplePayState;
  uint8_t v7[16];

  if (qword_1ECF9D708 != -1)
    dispatch_once(&qword_1ECF9D708, &unk_1E4DD99D0);
  if (byte_1EE788B18)
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], a2, v2);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1A4C7F000, v4, OS_LOG_TYPE_DEFAULT, "Device is Dev Board, Returning YES for supporting Apple Pay", v7, 2u);
    }

    return 1;
  }
  else
  {
    supportsApplePayState = self->_supportsApplePayState;
    if (supportsApplePayState == -1)
    {
      if (qword_1EE788A00 != -1)
        dispatch_once(&qword_1EE788A00, &unk_1E4DD98D0);
      supportsApplePayState = (int64_t)off_1EE7889F8;
      if (off_1EE7889F8)
        supportsApplePayState = off_1EE7889F8();
      self->_supportsApplePayState = supportsApplePayState;
    }
    return supportsApplePayState == 1;
  }
}

- (BOOL)supportsManateeForAppleCash
{
  uint64_t v2;
  NSObject *v4;
  int64_t supportsManateeForAppleCash;
  uint8_t v7[16];

  if (qword_1ECF9D708 != -1)
    dispatch_once(&qword_1ECF9D708, &unk_1E4DD99D0);
  if (byte_1EE788B18)
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], a2, v2);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1A4C7F000, v4, OS_LOG_TYPE_DEFAULT, "Device is Dev Board, Returning YES for supporting Apple Cash", v7, 2u);
    }

    return 1;
  }
  else
  {
    supportsManateeForAppleCash = self->_supportsManateeForAppleCash;
    if (supportsManateeForAppleCash == -1)
    {
      if (qword_1EE788A20 != -1)
        dispatch_once(&qword_1EE788A20, &unk_1E4DD98F0);
      supportsManateeForAppleCash = (int64_t)off_1EE788A18;
      if (off_1EE788A18)
        supportsManateeForAppleCash = off_1EE788A18();
      self->_supportsManateeForAppleCash = supportsManateeForAppleCash;
    }
    return supportsManateeForAppleCash == 1;
  }
}

- (BOOL)supportsRegionForAppleCash
{
  uint64_t v2;
  NSObject *v4;
  int64_t supportsRegionForAppleCash;
  uint8_t v7[16];

  if (qword_1ECF9D708 != -1)
    dispatch_once(&qword_1ECF9D708, &unk_1E4DD99D0);
  if (byte_1EE788B18)
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], a2, v2);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1A4C7F000, v4, OS_LOG_TYPE_DEFAULT, "Device is Dev Board, Returning YES for supporting Apple Cash", v7, 2u);
    }

    return 1;
  }
  else
  {
    supportsRegionForAppleCash = self->_supportsRegionForAppleCash;
    if (supportsRegionForAppleCash == -1)
    {
      if (qword_1EE788A30 != -1)
        dispatch_once(&qword_1EE788A30, &unk_1E4DD9910);
      supportsRegionForAppleCash = (int64_t)off_1EE788A28;
      if (off_1EE788A28)
        supportsRegionForAppleCash = off_1EE788A28();
      self->_supportsRegionForAppleCash = supportsRegionForAppleCash;
    }
    return supportsRegionForAppleCash == 1;
  }
}

- (BOOL)supportsFMDV2
{
  int64_t supportsFMDV2State;

  supportsFMDV2State = self->_supportsFMDV2State;
  if (supportsFMDV2State == -1)
  {
    if (qword_1EE788A08 != -1)
      dispatch_once(&qword_1EE788A08, &unk_1E4DD9930);
    supportsFMDV2State = (int64_t)off_1EE788A10;
    if (off_1EE788A10)
      supportsFMDV2State = off_1EE788A10();
    self->_supportsFMDV2State = supportsFMDV2State;
  }
  return supportsFMDV2State == 1;
}

- (BOOL)supportsVenice
{
  int64_t supportsVeniceState;

  supportsVeniceState = self->_supportsVeniceState;
  if (supportsVeniceState == -1)
  {
    supportsVeniceState = MGGetBoolAnswer();
    self->_supportsVeniceState = supportsVeniceState;
  }
  return supportsVeniceState == 1;
}

- (BOOL)supportsKeySharing
{
  uint64_t v2;
  NSObject *v4;
  int64_t supportsKeySharingState;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint8_t v10[16];

  if (qword_1ECF9D708 != -1)
    dispatch_once(&qword_1ECF9D708, &unk_1E4DD99D0);
  if (byte_1EE788B18)
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], a2, v2);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1A4C7F000, v4, OS_LOG_TYPE_DEFAULT, "Device is Dev Board, Returning YES for supporting Key Sharing", v10, 2u);
    }

    return 1;
  }
  else
  {
    supportsKeySharingState = self->_supportsKeySharingState;
    if (supportsKeySharingState == -1)
    {
      v7 = (void *)MEMORY[0x1A85A5DE0](CFSTR("DAManager"), CFSTR("DigitalAccess"));
      supportsKeySharingState = objc_msgSend_isSupported(v7, v8, v9);
      self->_supportsKeySharingState = supportsKeySharingState;
    }
    return supportsKeySharingState == 1;
  }
}

- (BOOL)supportsHarmony
{
  uint64_t v2;
  NSObject *v4;
  int64_t supportsHarmonyState;
  uint8_t v7[16];

  if (qword_1ECF9D708 != -1)
    dispatch_once(&qword_1ECF9D708, &unk_1E4DD99D0);
  if (byte_1EE788B18)
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], a2, v2);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1A4C7F000, v4, OS_LOG_TYPE_DEFAULT, "Device is Dev Board, Returning YES for supporting Harmony", v7, 2u);
    }

    return 1;
  }
  else
  {
    supportsHarmonyState = self->_supportsHarmonyState;
    if (supportsHarmonyState == -1)
    {
      if (qword_1ECF9D700 != -1)
        dispatch_once(&qword_1ECF9D700, &unk_1E4DD9950);
      supportsHarmonyState = (int64_t)off_1ECF9D6F8;
      if (off_1ECF9D6F8)
        supportsHarmonyState = off_1ECF9D6F8();
      self->_supportsHarmonyState = supportsHarmonyState;
    }
    return supportsHarmonyState == 1;
  }
}

- (BOOL)supportsZelkova
{
  uint64_t v2;
  NSObject *v4;
  int64_t supportsZelkovaState;
  uint8_t v7[16];

  if (qword_1ECF9D708 != -1)
    dispatch_once(&qword_1ECF9D708, &unk_1E4DD99D0);
  if (byte_1EE788B18)
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], a2, v2);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1A4C7F000, v4, OS_LOG_TYPE_DEFAULT, "Device is Dev Board, Returning YES for supporting Zelkova", v7, 2u);
    }

    return 1;
  }
  else
  {
    supportsZelkovaState = self->_supportsZelkovaState;
    if (supportsZelkovaState == -1)
    {
      if (qword_1EE788A68 != -1)
        dispatch_once(&qword_1EE788A68, &unk_1E4DD9970);
      supportsZelkovaState = (int64_t)off_1EE788A60;
      if (off_1EE788A60)
        supportsZelkovaState = off_1EE788A60();
      self->_supportsZelkovaState = supportsZelkovaState;
    }
    return supportsZelkovaState == 1;
  }
}

- (BOOL)supportsManateeActivitySharing
{
  uint64_t v2;
  NSObject *v4;
  int64_t supportsManateeActivitySharing;
  uint8_t v7[16];

  if (qword_1ECF9D708 != -1)
    dispatch_once(&qword_1ECF9D708, &unk_1E4DD99D0);
  if (byte_1EE788B18)
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], a2, v2);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1A4C7F000, v4, OS_LOG_TYPE_DEFAULT, "Device is Dev Board, Returning YES for supporting Activity Sharing", v7, 2u);
    }

    return 1;
  }
  else
  {
    supportsManateeActivitySharing = self->_supportsManateeActivitySharing;
    if (supportsManateeActivitySharing == -1)
    {
      supportsManateeActivitySharing = _os_feature_enabled_impl();
      self->_supportsManateeActivitySharing = supportsManateeActivitySharing;
    }
    return supportsManateeActivitySharing == 1;
  }
}

- (BOOL)supportsUWB
{
  uint64_t v2;
  NSObject *v4;
  int64_t supportsUWBState;
  void *v7;
  const char *v8;
  uint64_t v9;
  unsigned int isSupported;
  const char *v11;
  uint64_t v12;
  NSObject *v13;
  const __CFString *v14;
  int v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (qword_1ECF9D708 != -1)
    dispatch_once(&qword_1ECF9D708, &unk_1E4DD99D0);
  if (byte_1EE788B18)
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], a2, v2);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_1A4C7F000, v4, OS_LOG_TYPE_DEFAULT, "Device is Dev Board, Returning YES for supporting UWB", (uint8_t *)&v15, 2u);
    }

    return 1;
  }
  else
  {
    supportsUWBState = self->_supportsUWBState;
    if (supportsUWBState == -1)
    {
      v7 = (void *)MEMORY[0x1A85A5DE0](CFSTR("NISession"), CFSTR("NearbyInteraction"));
      isSupported = objc_msgSend_isSupported(v7, v8, v9);
      self->_supportsUWBState = isSupported;
      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v11, v12);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = CFSTR("NO");
        if (isSupported)
          v14 = CFSTR("YES");
        v15 = 138412290;
        v16 = v14;
        _os_log_impl(&dword_1A4C7F000, v13, OS_LOG_TYPE_DEFAULT, "Supports UWB: %@", (uint8_t *)&v15, 0xCu);
      }

      supportsUWBState = self->_supportsUWBState;
    }
    return supportsUWBState == 1;
  }
}

- (BOOL)slowCPUDevice
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1A4C8F3AC;
  block[3] = &unk_1E4DD96C0;
  block[4] = self;
  if (qword_1EE788B00 != -1)
    dispatch_once(&qword_1EE788B00, block);
  return byte_1EE788AF8;
}

- (int)cpuFamily
{
  if (qword_1EE788B10 != -1)
    dispatch_once(&qword_1EE788B10, &unk_1E4DD9990);
  return dword_1EE788B08;
}

- (BOOL)lowRAMDevice
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1A4C8F63C;
  block[3] = &unk_1E4DD96C0;
  block[4] = self;
  if (qword_1ECF9D6E0 != -1)
    dispatch_once(&qword_1ECF9D6E0, block);
  return byte_1EE788A58;
}

- (int64_t)memorySize
{
  if (qword_1ECF9D6F0 != -1)
    dispatch_once(&qword_1ECF9D6F0, &unk_1E4DD99B0);
  return qword_1ECF9D6E8;
}

- (BOOL)_enoughPowerToSupportEffects
{
  BOOL result;
  uint64_t v3;
  uint64_t v4;
  size_t v5;

  v5 = 0;
  sysctlbyname("hw.cpufamily", 0, &v5, 0, 0);
  v4 = 0;
  sysctlbyname("hw.cpufamily", &v4, &v5, 0, 0);
  result = 0;
  if (v4 > 2465937351)
  {
    if (v4 > 2823887817)
    {
      if (v4 == 2823887818)
        return result;
      v3 = 3172666089;
    }
    else
    {
      if (v4 == 2465937352)
        return result;
      v3 = 2517073649;
    }
  }
  else if (v4 > 747742333)
  {
    if (v4 == 747742334)
      return result;
    v3 = 933271106;
  }
  else
  {
    if (v4 == 214503012)
      return result;
    v3 = 506291073;
  }
  if (v4 != v3)
    return 1;
  return result;
}

- (BOOL)supportsFunCam
{
  uint64_t v2;
  char v4;
  const char *v5;
  uint64_t v6;
  char v7;
  const char *v8;
  uint64_t v9;

  v4 = objc_msgSend__enoughPowerToSupportEffects(self, a2, v2);
  v7 = objc_msgSend_lowRAMDevice(self, v5, v6);
  if (objc_msgSend_deviceType(self, v8, v9) == 4)
    return v4 & (v7 ^ 1);
  else
    return v4;
}

- (BOOL)isGreenTea
{
  return self->_isGreenTea;
}

- (BOOL)supportsHandoff
{
  return self->_supportsHandoff;
}

- (BOOL)supportsTethering
{
  return self->_supportsTethering;
}

- (BOOL)supportsFrontFacingCamera
{
  return self->_supportsFrontCamera;
}

- (BOOL)supportsBackFacingCamera
{
  return self->_supportsBackCamera;
}

- (BOOL)supportsWLAN
{
  return self->_supportsWLAN;
}

- (BOOL)supportsWiFi
{
  return self->_supportsWiFi;
}

- (BOOL)supportsCellularData
{
  return self->_supportsCellularData;
}

- (BOOL)supportsMMS
{
  return self->_supportsMMS;
}

- (BOOL)mmsConfigured
{
  return self->_mmsConfigured;
}

- (BOOL)commCenterDead
{
  return self->_commCenterDead;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedPNRSubscription, 0);
  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
  objc_storeStrong((id *)&self->_number, 0);
}

@end

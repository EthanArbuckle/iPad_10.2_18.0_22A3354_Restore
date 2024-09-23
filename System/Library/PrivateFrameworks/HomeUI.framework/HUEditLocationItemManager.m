@implementation HUEditLocationItemManager

- (HUEditLocationItemManager)initWithHomeBuilder:(id)a3 delegate:(id)a4 context:(unint64_t)a5
{
  id v9;
  HUEditLocationItemManager *v10;
  HUEditLocationItemManager *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  objc_super v18;

  v9 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HUEditLocationItemManager;
  v10 = -[HFItemManager initWithDelegate:sourceItem:](&v18, sel_initWithDelegate_sourceItem_, a4, 0);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_homeBuilder, a3);
    v11->_context = a5;
    objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "home");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pinCodeManagerForHome:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUEditLocationItemManager setPinCodeManager:](v11, "setPinCodeManager:", v14);

    -[HUEditLocationItemManager pinCodeManager](v11, "pinCodeManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (id)objc_msgSend(v15, "fetchFromAccessoryCache");

  }
  return v11;
}

- (HUEditLocationItemManager)initWithHomeBuilder:(id)a3 delegate:(id)a4
{
  return -[HUEditLocationItemManager initWithHomeBuilder:delegate:context:](self, "initWithHomeBuilder:delegate:context:", a3, a4, 0);
}

- (HUEditLocationItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHomeBuilder_delegate_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUEditLocationItemManager.m"), 151, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUEditLocationItemManager initWithDelegate:sourceItem:]",
    v7);

  return 0;
}

- (id)updateLocationServicesEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v3 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0D519C0]);
  -[HFItemManager home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __59__HUEditLocationItemManager_updateLocationServicesEnabled___block_invoke;
  v9[3] = &unk_1E6F4E2D8;
  v7 = v5;
  v10 = v7;
  objc_msgSend(v6, "updateLocationServicesEnabled:completion:", v3, v9);

  return v7;
}

uint64_t __59__HUEditLocationItemManager_updateLocationServicesEnabled___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;

  v2 = *(void **)(a1 + 32);
  if (a2)
    v3 = MEMORY[0x1E0C9AAA0];
  else
    v3 = MEMORY[0x1E0C9AAB0];
  return objc_msgSend(v2, "finishWithResult:error:", v3, a2);
}

- (id)_buildItemModulesForHome:(id)a3
{
  id v4;
  void *v5;
  HUUserNotificationTopicListModule *v6;
  HUMatterConnectedServicesItemModule *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = -[HUUserNotificationTopicListModule initWithItemUpdater:home:]([HUUserNotificationTopicListModule alloc], "initWithItemUpdater:home:", self, v4);
  -[HUEditLocationItemManager setNotificationSettingsModule:](self, "setNotificationSettingsModule:", v6);

  v7 = -[HUMatterConnectedServicesItemModule initWithItemUpdater:home:]([HUMatterConnectedServicesItemModule alloc], "initWithItemUpdater:home:", self, v4);
  -[HUEditLocationItemManager setConnectedServicesItemModule:](self, "setConnectedServicesItemModule:", v7);

  if (!-[HUEditLocationItemManager _isCurrentUserRestrictedGuest](self, "_isCurrentUserRestrictedGuest"))
  {
    -[HUEditLocationItemManager notificationSettingsModule](self, "notificationSettingsModule");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v8);

  }
  if (!-[HUEditLocationItemManager _isCurrentUserRestrictedGuest](self, "_isCurrentUserRestrictedGuest"))
  {
    -[HUEditLocationItemManager connectedServicesItemModule](self, "connectedServicesItemModule");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v9);

  }
  return v5;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  void *v4;
  _BOOL4 v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HURestrictedGuestScheduleItem *v21;
  void *v22;
  void *v23;
  void *v24;
  HURestrictedGuestScheduleItem *v25;
  _BOOL8 v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  HUSoftwareUpdateSettingsItem *v56;
  void *v57;
  HUSoftwareUpdateSettingsItem *v58;
  id v59;
  void *v60;
  id v61;
  void *v62;
  HUSiriTriggerPhraseSettingItem *v63;
  void *v64;
  HUSiriTriggerPhraseSettingItem *v65;
  void *v66;
  void *v67;
  int v68;
  void *v69;
  int v70;
  uint64_t v71;
  NSObject *v72;
  void *v73;
  int v74;
  id v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  NSObject *v92;
  id v93;
  id v94;
  void *v95;
  void *v96;
  void *v97;
  uint64_t v98;
  BOOL v99;
  void *v100;
  void *v101;
  NSObject *v102;
  id v103;
  void *v104;
  void *v105;
  uint64_t v106;
  void *v107;
  void *v108;
  uint64_t v109;
  id v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  id v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  id v126;
  void *v127;
  void *v128;
  id v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  id v141;
  void *v142;
  uint64_t v143;
  void *v144;
  id *v145;
  id *v146;
  _QWORD v147[4];
  id v148;
  _QWORD v149[4];
  id v150;
  id v151;
  _QWORD v152[4];
  id v153;
  _QWORD v154[4];
  id v155;
  id location;
  uint8_t buf[4];
  HUEditLocationItemManager *v158;
  __int16 v159;
  _BYTE v160[10];
  uint64_t v161;
  __int16 v162;
  uint64_t v163;
  _QWORD v164[14];
  _QWORD v165[5];
  _QWORD v166[5];
  uint64_t v167;
  void *v168;
  _QWORD v169[2];
  _QWORD v170[2];
  _QWORD v171[2];
  _QWORD v172[2];
  _QWORD v173[3];
  _QWORD v174[3];
  _QWORD v175[4];
  _QWORD v176[4];
  _QWORD v177[3];
  id *v178;
  uint64_t v179;
  uint64_t v180;
  _QWORD v181[9];

  v181[6] = *MEMORY[0x1E0C80C00];
  v141 = a3;
  objc_msgSend(MEMORY[0x1E0D31840], "emptyItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUEditLocationItemManager setNameItem:](self, "setNameItem:", v4);

  v5 = -[HUEditLocationItemManager _inviteUsersItemAllowed](self, "_inviteUsersItemAllowed");
  objc_initWeak(&location, self);
  v6 = objc_alloc(MEMORY[0x1E0D31840]);
  v177[0] = *MEMORY[0x1E0D30D18];
  v143 = v177[0];
  _HULocalizedStringWithDefaultValue(CFSTR("HUEditLocationInvitePeopleTitle"), CFSTR("HUEditLocationInvitePeopleTitle"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0D30BA0];
  v181[0] = v7;
  v181[1] = CFSTR("Home.HomeSettings.InvitePeople");
  v9 = *MEMORY[0x1E0D30C80];
  v177[1] = v8;
  v177[2] = v9;
  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0D31528], "sharedDispatcher");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "numberWithInt:", objc_msgSend(v11, "isUsingiCloud") ^ 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v181[2] = v12;
  v178 = (id *)*MEMORY[0x1E0D30D70];
  v145 = v178;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", !v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x1E0D30C78];
  v181[3] = v13;
  v181[4] = CFSTR("plus");
  v15 = *MEMORY[0x1E0D30B80];
  v179 = v14;
  v180 = v15;
  v16 = (void *)MEMORY[0x1E0C99E60];
  -[HFItemManager home](self, "home");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "na_setWithSafeObject:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v181[5] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v181, v177, 6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v6, "initWithResults:", v19);
  -[HUEditLocationItemManager setInviteUsersItem:](self, "setInviteUsersItem:", v20);

  v21 = [HURestrictedGuestScheduleItem alloc];
  -[HFItemManager home](self, "home");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager home](self, "home");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "currentUser");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[HURestrictedGuestScheduleItem initWithHome:user:](v21, "initWithHome:user:", v22, v24);
  -[HUEditLocationItemManager setHomeScheduleItem:](self, "setHomeScheduleItem:", v25);

  v26 = +[HUWallpaperPickerInlineViewController useWallpaperPickerCell](HUWallpaperPickerInlineViewController, "useWallpaperPickerCell");
  v27 = (void *)MEMORY[0x1E0C99E08];
  _HULocalizedStringWithDefaultValue(CFSTR("HUEditLocationTakePhotoTitle"), CFSTR("HUEditLocationTakePhotoTitle"), 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "dictionaryWithObjectsAndKeys:", v28, v143, CFSTR("Home.HomeSettings.TakePhoto"), v8, 0);
  v142 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(MEMORY[0x1E0CEA648], "isSourceTypeAvailable:", 1) ^ 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v142, "setObject:forKeyedSubscript:", v29, v145);

  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31840]), "initWithResults:", v142);
  -[HUEditLocationItemManager setCameraItem:](self, "setCameraItem:", v30);

  v31 = objc_alloc(MEMORY[0x1E0D31840]);
  v175[0] = v143;
  _HULocalizedStringWithDefaultValue(CFSTR("HUEditLocationShowPredictedScenesButtonTitle"), CFSTR("HUEditLocationShowPredictedScenesButtonTitle"), 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = *MEMORY[0x1E0D30D20];
  v176[0] = v32;
  v176[1] = CFSTR("HUEditLocationShowPredictedScenesButtonTitle");
  v175[1] = v33;
  v175[2] = v8;
  v176[2] = CFSTR("Home.HomeSettings.ShowSuggestedScenes");
  v34 = *MEMORY[0x1E0D30E20];
  v175[3] = *MEMORY[0x1E0D30E20];
  v35 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v141, "hf_showPredictedScenesOnDashboard");
  objc_msgSend(v35, "numberWithInteger:", HFPrimaryStateFromBOOL());
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v176[3] = v36;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v176, v175, 4);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)objc_msgSend(v31, "initWithResults:", v37);
  -[HUEditLocationItemManager setShowPredictedScenes:](self, "setShowPredictedScenes:", v38);

  v39 = objc_alloc(MEMORY[0x1E0D31840]);
  v173[0] = v143;
  _HULocalizedStringWithDefaultValue(CFSTR("HUEditLocationChooseWallpaperTitle"), CFSTR("HUEditLocationChooseWallpaperTitle"), 1);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v174[0] = v40;
  v173[1] = v145;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v26);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v173[2] = v8;
  v174[1] = v41;
  v174[2] = CFSTR("Home.HomeSetting.ChooseWallpaper");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v174, v173, 3);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = (void *)objc_msgSend(v39, "initWithResults:", v42);
  -[HUEditLocationItemManager setChooseWallpaperItem:](self, "setChooseWallpaperItem:", v43);

  v44 = objc_alloc(MEMORY[0x1E0D31840]);
  v171[0] = v145;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v26);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v171[1] = v8;
  v172[0] = v45;
  v172[1] = CFSTR("Home.HomeSettings.WallpaperThumbnail");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v172, v171, 2);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = (void *)objc_msgSend(v44, "initWithResults:", v46);
  -[HUEditLocationItemManager setWallpaperThumbnailItem:](self, "setWallpaperThumbnailItem:", v47);

  v48 = objc_alloc(MEMORY[0x1E0D31840]);
  v169[0] = v145;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v26 ^ 1);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v169[1] = v8;
  v170[0] = v49;
  v170[1] = CFSTR("Home.HomeSettings.WallpaperPicker");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v170, v169, 2);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = (void *)objc_msgSend(v48, "initWithResults:", v50);
  -[HUEditLocationItemManager setWallpaperPickerItem:](self, "setWallpaperPickerItem:", v51);

  v52 = objc_alloc(MEMORY[0x1E0D31840]);
  v167 = *MEMORY[0x1E0D30D28];
  _HULocalizedStringWithDefaultValue(CFSTR("HUEditLocationDetailsNotesPlaceholder"), CFSTR("HUEditLocationDetailsNotesPlaceholder"), 1);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v168 = v53;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v168, &v167, 1);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = (void *)objc_msgSend(v52, "initWithResults:", v54);
  -[HUEditLocationItemManager setDetailNotesItem:](self, "setDetailNotesItem:", v55);

  v56 = [HUSoftwareUpdateSettingsItem alloc];
  -[HFItemManager home](self, "home");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = -[HUSoftwareUpdateSettingsItem initWithHome:](v56, "initWithHome:", v57);
  -[HUEditLocationItemManager setSoftwareUpdateItem:](self, "setSoftwareUpdateItem:", v58);

  v59 = objc_alloc(MEMORY[0x1E0D31840]);
  v154[0] = MEMORY[0x1E0C809B0];
  v154[1] = 3221225472;
  v154[2] = __56__HUEditLocationItemManager__buildItemProvidersForHome___block_invoke;
  v154[3] = &unk_1E6F4C4E8;
  objc_copyWeak(&v155, &location);
  v60 = (void *)objc_msgSend(v59, "initWithResultsBlock:", v154);
  -[HUEditLocationItemManager setRemoveItem:](self, "setRemoveItem:", v60);

  v61 = objc_alloc(MEMORY[0x1E0D31840]);
  v152[0] = MEMORY[0x1E0C809B0];
  v152[1] = 3221225472;
  v152[2] = __56__HUEditLocationItemManager__buildItemProvidersForHome___block_invoke_2;
  v152[3] = &unk_1E6F4C4E8;
  objc_copyWeak(&v153, &location);
  v62 = (void *)objc_msgSend(v61, "initWithResultsBlock:", v152);
  -[HUEditLocationItemManager setSoundCheckItem:](self, "setSoundCheckItem:", v62);

  v63 = [HUSiriTriggerPhraseSettingItem alloc];
  -[HFItemManager home](self, "home");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = -[HUSiriTriggerPhraseSettingItem initWithHome:](v63, "initWithHome:", v64);
  -[HUEditLocationItemManager setSiriTriggerPhraseSettingItem:](self, "setSiriTriggerPhraseSettingItem:", v65);

  -[HFItemManager home](self, "home");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "accessories");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = objc_msgSend(v67, "na_any:", &__block_literal_global_90_2);

  if (v68)
  {
    -[HFItemManager home](self, "home");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = objc_msgSend(v69, "hf_currentUserIsAdministrator");

    v71 = v70 ^ 1u;
  }
  else
  {
    v71 = 1;
  }
  HFLogForCategory();
  v72 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
  {
    -[HFItemManager home](self, "home");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = objc_msgSend(v73, "hf_currentUserIsAdministrator");
    *(_DWORD *)buf = 138412802;
    v158 = self;
    v159 = 1024;
    *(_DWORD *)v160 = v68;
    *(_WORD *)&v160[4] = 1024;
    *(_DWORD *)&v160[6] = v74;
    _os_log_impl(&dword_1B8E1E000, v72, OS_LOG_TYPE_DEFAULT, "%@:atLeastOneDeviceSupportsHomeLevelLocationServicesSetting = %{BOOL}d currentUserIsAdministrator = %{BOOL}d", buf, 0x18u);

  }
  v75 = objc_alloc(MEMORY[0x1E0D31840]);
  v165[0] = v143;
  _HULocalizedStringWithDefaultValue(CFSTR("HULocationServicesSetting_Title"), CFSTR("HULocationServicesSetting_Title"), 1);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v166[0] = v76;
  v166[1] = CFSTR("Home.HomeSettings.LocationServices");
  v165[1] = v8;
  v165[2] = v33;
  v166[2] = CFSTR("HULocationServicesSetting_Title");
  v165[3] = v145;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v71);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v166[3] = v77;
  v165[4] = v34;
  v78 = (void *)MEMORY[0x1E0CB37E8];
  -[HFItemManager home](self, "home");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "isLocationServicesEnabled");
  objc_msgSend(v78, "numberWithInteger:", HFPrimaryStateFromBOOL());
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v166[4] = v80;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v166, v165, 5);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = (void *)objc_msgSend(v75, "initWithResults:", v81);
  -[HUEditLocationItemManager setLocationServicesSettingItem:](self, "setLocationServicesSettingItem:", v82);

  -[HUEditLocationItemManager nameItem](self, "nameItem");
  v146 = (id *)objc_claimAutoreleasedReturnValue();
  v164[0] = v146;
  -[HUEditLocationItemManager inviteUsersItem](self, "inviteUsersItem");
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  v164[1] = v144;
  -[HUEditLocationItemManager wallpaperPickerItem](self, "wallpaperPickerItem");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  v164[2] = v140;
  -[HUEditLocationItemManager homeScheduleItem](self, "homeScheduleItem");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  v164[3] = v139;
  -[HUEditLocationItemManager showPredictedScenes](self, "showPredictedScenes");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  v164[4] = v138;
  -[HUEditLocationItemManager cameraItem](self, "cameraItem");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v164[5] = v83;
  -[HUEditLocationItemManager chooseWallpaperItem](self, "chooseWallpaperItem");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v164[6] = v84;
  -[HUEditLocationItemManager wallpaperThumbnailItem](self, "wallpaperThumbnailItem");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v164[7] = v85;
  -[HUEditLocationItemManager detailNotesItem](self, "detailNotesItem");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v164[8] = v86;
  -[HUEditLocationItemManager softwareUpdateItem](self, "softwareUpdateItem");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v164[9] = v87;
  -[HUEditLocationItemManager siriTriggerPhraseSettingItem](self, "siriTriggerPhraseSettingItem");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v164[10] = v88;
  -[HUEditLocationItemManager soundCheckItem](self, "soundCheckItem");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v164[11] = v89;
  -[HUEditLocationItemManager locationServicesSettingItem](self, "locationServicesSettingItem");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v164[12] = v90;
  -[HUEditLocationItemManager removeItem](self, "removeItem");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v164[13] = v91;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v164, 14);
  v137 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory();
  v92 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v158 = (HUEditLocationItemManager *)"-[HUEditLocationItemManager _buildItemProvidersForHome:]";
    _os_log_impl(&dword_1B8E1E000, v92, OS_LOG_TYPE_DEFAULT, "(%s) Creating 'guests'", buf, 0xCu);
  }

  v93 = objc_alloc(MEMORY[0x1E0D31840]);
  v149[0] = MEMORY[0x1E0C809B0];
  v149[1] = 3221225472;
  v149[2] = __56__HUEditLocationItemManager__buildItemProvidersForHome___block_invoke_96;
  v149[3] = &unk_1E6F518D0;
  objc_copyWeak(&v151, &location);
  v94 = v141;
  v150 = v94;
  v95 = (void *)objc_msgSend(v93, "initWithResultsBlock:", v149);
  -[HUEditLocationItemManager setGuestsItem:](self, "setGuestsItem:", v95);

  -[HFItemManager home](self, "home");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "hf_accessoriesSupportingAccessCodes");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = objc_msgSend(v97, "count");

  if (!_os_feature_enabled_impl())
  {
    if (!v98)
      goto LABEL_18;
    goto LABEL_17;
  }
  if (v98)
  {
    v99 = 1;
  }
  else
  {
    -[HFItemManager home](self, "home");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "restrictedGuests");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v99 = objc_msgSend(v101, "count") != 0;

  }
  HFLogForCategory();
  v102 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromBOOL();
    v103 = (id)objc_claimAutoreleasedReturnValue();
    -[HFItemManager home](self, "home");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "hf_accessoriesSupportingAccessCodes");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = objc_msgSend(v105, "count");
    -[HFItemManager home](self, "home");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "restrictedGuests");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = objc_msgSend(v108, "count");
    *(_DWORD *)buf = 136315906;
    v158 = (HUEditLocationItemManager *)"-[HUEditLocationItemManager _buildItemProvidersForHome:]";
    v159 = 2112;
    *(_QWORD *)v160 = v103;
    *(_WORD *)&v160[8] = 2048;
    v161 = v106;
    v162 = 2048;
    v163 = v109;
    _os_log_impl(&dword_1B8E1E000, v102, OS_LOG_TYPE_DEFAULT, "(%s) shouldIncludeNonBlockingItemProvider is %@ because hf_accessoriesSupportingAccessCodes.count = %ld. self.home.restrictedGuests.count = %ld.", buf, 0x2Au);

  }
  if (v99)
  {
LABEL_17:
    v110 = objc_alloc(MEMORY[0x1E0D31850]);
    v111 = (void *)MEMORY[0x1E0C99E60];
    -[HUEditLocationItemManager guestsItem](self, "guestsItem");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "setWithObject:", v112);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    v114 = (void *)objc_msgSend(v110, "initWithItems:", v113);
    -[HUEditLocationItemManager setNonBlockingItemProvider:](self, "setNonBlockingItemProvider:", v114);

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0D308F0]);
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUEditLocationItemManager nonBlockingItemProvider](self, "nonBlockingItemProvider");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "setClientInvalidationReasons:", v115);

  }
LABEL_18:
  v117 = objc_alloc(MEMORY[0x1E0D31848]);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v137);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v119 = (void *)objc_msgSend(v117, "initWithItems:", v118);

  -[HFItemManager home](self, "home");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager home](self, "home");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "currentUser");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "homeAccessControlForUser:", v122);
  v123 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v123, "restrictedGuestAccessSettings");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "accessAllowedToAccessories");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  v126 = objc_alloc(MEMORY[0x1E0D31050]);
  -[HFItemManager home](self, "home");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v128 = (void *)objc_msgSend(v126, "initWithHome:", v127);
  -[HUEditLocationItemManager setAllowedAccessoryCategoryItemProvider:](self, "setAllowedAccessoryCategoryItemProvider:", v128);

  v147[0] = MEMORY[0x1E0C809B0];
  v147[1] = 3221225472;
  v147[2] = __56__HUEditLocationItemManager__buildItemProvidersForHome___block_invoke_118;
  v147[3] = &unk_1E6F4E0D8;
  v129 = v125;
  v148 = v129;
  -[HUEditLocationItemManager allowedAccessoryCategoryItemProvider](self, "allowedAccessoryCategoryItemProvider");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v130, "setFilter:", v147);

  v131 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31990]), "initWithHome:", v94);
  objc_msgSend(v131, "setIncludeCurrentUser:", 1);
  -[HUEditLocationItemManager setUserItemProvider:](self, "setUserItemProvider:", v131);
  v132 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31610]), "initWithHome:", v94);
  objc_msgSend(v132, "setFilter:", &__block_literal_global_126);
  -[HUEditLocationItemManager setInviteItemProvider:](self, "setInviteItemProvider:", v132);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:", v119, v131, v132, 0);
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUEditLocationItemManager nonBlockingItemProvider](self, "nonBlockingItemProvider");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v133, "na_safeAddObject:", v134);

  -[HUEditLocationItemManager allowedAccessoryCategoryItemProvider](self, "allowedAccessoryCategoryItemProvider");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v133, "na_safeAddObject:", v135);

  objc_destroyWeak(&v151);
  objc_destroyWeak(&v153);
  objc_destroyWeak(&v155);

  objc_destroyWeak(&location);
  return v133;
}

id __56__HUEditLocationItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  int v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hf_currentUserIsOwner");
  v4 = CFSTR("HUEditLocationLeaveHomeButtonTitle");
  if (v3)
    v4 = CFSTR("HUEditLocationRemoveButtonTitle");
  v5 = v4;

  v6 = (void *)MEMORY[0x1E0D519C0];
  v11[0] = *MEMORY[0x1E0D30D18];
  _HULocalizedStringWithDefaultValue(v5, v5, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v11[1] = *MEMORY[0x1E0D30BA0];
  v12[0] = v7;
  v12[1] = CFSTR("Home.HomeSettings.RemoveLeaveHome");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "futureWithResult:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __56__HUEditLocationItemManager__buildItemProvidersForHome___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[6];
  _QWORD v21[7];

  v21[6] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "soundCheckEnabled");

  objc_msgSend(WeakRetained, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "na_any:", &__block_literal_global_297);

  v6 = 1;
  if (_os_feature_enabled_impl() && v5)
  {
    objc_msgSend(WeakRetained, "home");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "hf_currentUserIsAdministrator") ^ 1;

  }
  v8 = (void *)MEMORY[0x1E0D519C0];
  v20[0] = *MEMORY[0x1E0D30D18];
  _HULocalizedStringWithDefaultValue(CFSTR("HUSoundCheckSetting_Title"), CFSTR("HUSoundCheckSetting_Title"), 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0D30BA0];
  v21[0] = v9;
  v21[1] = CFSTR("Home.HomeSetting.SoundCheck");
  v11 = *MEMORY[0x1E0D30D20];
  v20[1] = v10;
  v20[2] = v11;
  v21[2] = CFSTR("HUSoundCheckSetting_Title");
  v20[3] = *MEMORY[0x1E0D30E20];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", HFPrimaryStateFromBOOL());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v12;
  v20[4] = *MEMORY[0x1E0D30D70];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[4] = v13;
  v20[5] = *MEMORY[0x1E0D30B80];
  v14 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(WeakRetained, "home");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "na_setWithSafeObject:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[5] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "futureWithResult:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

uint64_t __56__HUEditLocationItemManager__buildItemProvidersForHome___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "supportsUserMediaSettings");
}

uint64_t __56__HUEditLocationItemManager__buildItemProvidersForHome___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "supportsHomeLevelLocationServiceSetting");
}

id __56__HUEditLocationItemManager__buildItemProvidersForHome___block_invoke_96(uint64_t a1)
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
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(WeakRetained, "pinCodeManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "guestPinCodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v5;
  objc_msgSend(WeakRetained, "pinCodeManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "otherEcosystemGuestPinCodes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "combineAllFutures:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __56__HUEditLocationItemManager__buildItemProvidersForHome___block_invoke_2_97;
  v13[3] = &unk_1E6F51740;
  v14 = *(id *)(a1 + 32);
  v15 = WeakRetained;
  objc_msgSend(v9, "flatMap:", v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "recover:", &__block_literal_global_114_1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __56__HUEditLocationItemManager__buildItemProvidersForHome___block_invoke_2_97(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  _QWORD v37[2];
  _QWORD v38[5];
  _QWORD v39[5];
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v41 = "-[HUEditLocationItemManager _buildItemProvidersForHome:]_block_invoke_2";
    v42 = 2112;
    v43 = v3;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "(%s) Completed getting access codes from HK and other ecosystems with results %@", buf, 0x16u);
  }

  objc_msgSend(v3, "na_arrayByFlattening");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  v36 = v3;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "hf_accessoriesSupportingAccessCodes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
    {
      objc_msgSend(*(id *)(a1 + 40), "home");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "hf_currentUserIsAdministrator"))
      {
        objc_msgSend(*(id *)(a1 + 40), "home");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "hasOnboardedForAccessCode") ^ 1;

      }
      else
      {
        v10 = 1;
      }

    }
    else
    {
      v10 = 1;
    }

  }
  else
  {
    v10 = 1;
  }
  objc_msgSend(*(id *)(a1 + 40), "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "restrictedGuests");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  v20 = _os_feature_enabled_impl() ^ 1;
  if (!v13)
    v20 = 1;
  v21 = v10 & v20;
  HULocalizedStringWithFormat(CFSTR("HUEditLocationGuestsDescriptionFormat"), CFSTR("%lu"), v14, v15, v16, v17, v18, v19, v13 + v6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:", 26.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)MEMORY[0x1E0D519C0];
  v38[0] = *MEMORY[0x1E0D30D18];
  _HULocalizedStringWithDefaultValue(CFSTR("HUEditLocationGuestsTitle"), CFSTR("HUEditLocationGuestsTitle"), 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = *MEMORY[0x1E0D30BF8];
  v39[0] = v25;
  v39[1] = v22;
  v27 = *MEMORY[0x1E0D30C70];
  v38[1] = v26;
  v38[2] = v27;
  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:withConfiguration:", CFSTR("person.2.circle.fill"), v23);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v39[2] = v28;
  v38[3] = *MEMORY[0x1E0D30D70];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v21);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v39[3] = v29;
  v38[4] = *MEMORY[0x1E0D30B78];
  v30 = (void *)MEMORY[0x1E0C99E60];
  v37[0] = objc_opt_class();
  v37[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 2);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setWithArray:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v39[4] = v32;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 5);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "futureWithResult:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  return v34;
}

id __56__HUEditLocationItemManager__buildItemProvidersForHome___block_invoke_112(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[HUEditLocationItemManager _buildItemProvidersForHome:]_block_invoke";
    v12 = 2112;
    v13 = v2;
    _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEFAULT, "(%s) Failed to get access codes from HK and other ecosystems. Error = %@. Hiding 'guests' item.", buf, 0x16u);
  }

  v4 = (void *)MEMORY[0x1E0D519C0];
  v8 = *MEMORY[0x1E0D30D70];
  v9 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "futureWithResult:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __56__HUEditLocationItemManager__buildItemProvidersForHome___block_invoke_118(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__HUEditLocationItemManager__buildItemProvidersForHome___block_invoke_2_119;
  v8[3] = &unk_1E6F4E5D8;
  v9 = v3;
  v5 = v3;
  v6 = objc_msgSend(v4, "na_any:", v8);

  return v6;
}

uint64_t __56__HUEditLocationItemManager__buildItemProvidersForHome___block_invoke_2_119(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v2 = (void *)MEMORY[0x1E0CBA1D8];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v2, "hf_compatibleServiceTypesForCategoryType:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hf_primaryService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "serviceType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "na_safeContainsObject:", v7);

  return v8;
}

BOOL __56__HUEditLocationItemManager__buildItemProvidersForHome___block_invoke_3_124(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  _BOOL8 v6;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  v6 = objc_msgSend(v5, "invitationState") != 5;
  return v6;
}

- (BOOL)_inviteUsersItemAllowed
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  _BOOL4 v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasOptedToHH2");

  if (v5)
  {
    -[HFItemManager home](self, "home");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "residentDevices");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count") != 0;

  }
  else
  {
    v8 = 1;
  }
  HFLogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[HFItemManager home](self, "home");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "residentDevices");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 136315906;
    v14 = "-[HUEditLocationItemManager _inviteUsersItemAllowed]";
    v15 = 1024;
    v16 = v5;
    v17 = 1024;
    v18 = v8;
    v19 = 2048;
    v20 = objc_msgSend(v11, "count");
    _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "%s hasOptedToHH2 = %{BOOL}d, shouldShowInviteUsersItem = %{BOOL}d, residentDevices.count = %ld", (uint8_t *)&v13, 0x22u);

  }
  return v8;
}

- (id)_homeFuture
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0D519C0];
  -[HUEditLocationItemManager homeBuilder](self, "homeBuilder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithResult:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_itemsToHideInSet:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
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
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)HUEditLocationItemManager;
  -[HFItemManager _itemsToHideInSet:](&v28, sel__itemsToHideInSet_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  -[HFItemManager home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hf_currentUserIsAdministrator");

  if ((v7 & 1) == 0)
  {
    -[HUEditLocationItemManager inviteUsersItem](self, "inviteUsersItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v8);

    -[HUEditLocationItemManager homeBuilder](self, "homeBuilder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "userNotes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "length");

    if (!v11)
    {
      -[HUEditLocationItemManager detailNotesItem](self, "detailNotesItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v12);

    }
  }
  objc_msgSend(MEMORY[0x1E0D31528], "sharedDispatcher");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isUsingiCloud");

  if (!v14 || -[HUEditLocationItemManager _isCurrentUserRestrictedGuest](self, "_isCurrentUserRestrictedGuest"))
  {
    -[HUEditLocationItemManager userItemProvider](self, "userItemProvider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "items");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "unionSet:", v16);

    -[HUEditLocationItemManager guestsItem](self, "guestsItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v17);

    -[HUEditLocationItemManager inviteItemProvider](self, "inviteItemProvider");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "items");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "unionSet:", v19);

  }
  if (-[HUEditLocationItemManager _isCurrentUserRestrictedGuest](self, "_isCurrentUserRestrictedGuest"))
  {
    -[HUEditLocationItemManager showPredictedScenes](self, "showPredictedScenes");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v20);

  }
  if (-[HUEditLocationItemManager context](self, "context") == 1)
  {
    -[HUEditLocationItemManager wallpaperPickerItem](self, "wallpaperPickerItem");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v21);

    -[HUEditLocationItemManager showPredictedScenes](self, "showPredictedScenes");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "na_safeAddObject:", v22);

    -[HUEditLocationItemManager cameraItem](self, "cameraItem");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v23);

    -[HUEditLocationItemManager chooseWallpaperItem](self, "chooseWallpaperItem");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v24);

    -[HUEditLocationItemManager wallpaperThumbnailItem](self, "wallpaperThumbnailItem");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v25);

  }
  if (objc_msgSend(MEMORY[0x1E0D319D0], "isRunningInStoreDemoMode"))
  {
    -[HUEditLocationItemManager removeItem](self, "removeItem");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v26);

  }
  return v5;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
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
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  id v98;
  _QWORD v99[5];
  void *v100;
  void *v101;
  uint64_t v102;
  void *v103;
  void *v104;
  _QWORD v105[4];
  void *v106;
  void *v107;
  void *v108;
  _QWORD v109[2];
  _QWORD v110[2];
  void *v111;
  _QWORD v112[3];

  v112[1] = *MEMORY[0x1E0C80C00];
  v98 = a3;
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUEditLocationNameSectionIdentifier"));
  _HULocalizedStringWithDefaultValue(CFSTR("HUEditLocationNameSectionTitle"), CFSTR("HUEditLocationNameSectionTitle"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHeaderTitle:", v6);

  -[HUEditLocationItemManager nameItem](self, "nameItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v112[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v112, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setItems:", v8);

  v97 = v5;
  objc_msgSend(v4, "addObject:", v5);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUScheduleSectionIdentifier"));
  -[HUEditLocationItemManager homeScheduleItem](self, "homeScheduleItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v111 = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v111, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setItems:", v11);

  HFLocalizedString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHeaderTitle:", v12);

  _HULocalizedStringWithDefaultValue(CFSTR("HURestrictedGuestScheduleItem_HomeSettings_FooterTitle"), CFSTR("HURestrictedGuestScheduleItem_HomeSettings_FooterTitle"), 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFooterTitle:", v13);

  v96 = v9;
  objc_msgSend(v4, "addObject:", v9);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUAllowedAccessoriesSectionIdentifier"));
  -[HUEditLocationItemManager allowedAccessoryCategoryItemProvider](self, "allowedAccessoryCategoryItemProvider");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "items");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "allObjects");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D314B0], "defaultItemComparator");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sortedArrayUsingComparator:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setItems:", v19);

  _HULocalizedStringWithDefaultValue(CFSTR("HURestrictedGuest_AllowedAccessoriesSection_Header"), CFSTR("HURestrictedGuest_AllowedAccessoriesSection_Header"), 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setHeaderTitle:", v20);

  v95 = v14;
  objc_msgSend(v4, "addObject:", v14);
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUEditLocationPeopleSectionIdentifier"));
  _HULocalizedStringWithDefaultValue(CFSTR("HUEditLocationPeopleSectionTitle"), CFSTR("HUEditLocationPeopleSectionTitle"), 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setHeaderTitle:", v22);

  v99[0] = MEMORY[0x1E0C809B0];
  v99[1] = 3221225472;
  v99[2] = __62__HUEditLocationItemManager__buildSectionsWithDisplayedItems___block_invoke;
  v99[3] = &unk_1E6F504A0;
  v99[4] = self;
  __62__HUEditLocationItemManager__buildSectionsWithDisplayedItems___block_invoke((uint64_t)v99);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setFooterTitle:", v23);

  -[HUEditLocationItemManager userItemProvider](self, "userItemProvider");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "items");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUEditLocationItemManager inviteItemProvider](self, "inviteItemProvider");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "items");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setByAddingObjectsFromSet:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "allObjects");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D314B0], "defaultItemComparator");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = v29;
  objc_msgSend(v29, "sortedArrayUsingComparator:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v110[0] = v31;
  -[HUEditLocationItemManager guestsItem](self, "guestsItem");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v110[1] = v32;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v110, 2);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "na_arrayByFlattening");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setItems:", v34);

  if (-[HUEditLocationItemManager _inviteUsersItemAllowed](self, "_inviteUsersItemAllowed"))
  {
    objc_msgSend(v21, "items");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v109[0] = v35;
    -[HUEditLocationItemManager inviteUsersItem](self, "inviteUsersItem");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v109[1] = v36;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v109, 2);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "na_arrayByFlattening");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setItems:", v38);

  }
  v94 = v21;
  objc_msgSend(v4, "addObject:", v21);
  -[HUEditLocationItemManager notificationSettingsModule](self, "notificationSettingsModule");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "buildSectionsWithDisplayedItems:", v98);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v40);

  v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUEditLocationSiriTriggerPhraseSectionIdentifier"));
  -[HUEditLocationItemManager siriTriggerPhraseSettingItem](self, "siriTriggerPhraseSettingItem");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v108 = v42;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v108, 1);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setItems:", v43);

  v92 = v41;
  objc_msgSend(v4, "addObject:", v41);
  v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUEditLocationSoftwareUpdateSectionIdentifier"));
  -[HFItemManager home](self, "home");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUSoftwareUpdateSettingsItem footerTitleForHome:](HUSoftwareUpdateSettingsItem, "footerTitleForHome:", v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setFooterTitle:", v46);

  -[HUEditLocationItemManager softwareUpdateItem](self, "softwareUpdateItem");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = v47;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v107, 1);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setItems:", v48);

  v91 = v44;
  objc_msgSend(v4, "addObject:", v44);
  -[HUEditLocationItemManager connectedServicesItemModule](self, "connectedServicesItemModule");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "buildSectionsWithDisplayedItems:", v98);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v50);

  -[HUEditLocationItemManager soundCheckItem](self, "soundCheckItem");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v50) = objc_msgSend(v98, "containsObject:", v51);

  if ((_DWORD)v50)
  {
    v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUEditLocationSoundCheckSectionIdentifier"));
    _HULocalizedStringWithDefaultValue(CFSTR("HUHomeMediaSettingSection_Title"), CFSTR("HUHomeMediaSettingSection_Title"), 1);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setHeaderTitle:", v53);

    -[HUEditLocationItemManager soundCheckItem](self, "soundCheckItem");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = v54;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v106, 1);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setItems:", v55);

    objc_msgSend(v4, "addObject:", v52);
  }
  v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUEditLocationScenesSectionIdentifier"));
  v57 = (void *)MEMORY[0x1E0C99D20];
  -[HUEditLocationItemManager showPredictedScenes](self, "showPredictedScenes");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "na_arrayWithSafeObject:", v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setItems:", v59);

  _HULocalizedStringWithDefaultValue(CFSTR("HUEditLocationScenesSectionTitle"), CFSTR("HUEditLocationScenesSectionTitle"), 1);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = v56;
  objc_msgSend(v56, "setHeaderTitle:", v60);

  objc_msgSend(v4, "addObject:", v56);
  v61 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUEditLocationWallpaperSectionIdentifier"));
  _HULocalizedStringWithDefaultValue(CFSTR("HUEditLocationWallpaperSectionTitle"), CFSTR("HUEditLocationWallpaperSectionTitle"), 1);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setHeaderTitle:", v62);

  -[HUEditLocationItemManager cameraItem](self, "cameraItem");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v105[0] = v63;
  -[HUEditLocationItemManager chooseWallpaperItem](self, "chooseWallpaperItem");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v105[1] = v64;
  -[HUEditLocationItemManager wallpaperThumbnailItem](self, "wallpaperThumbnailItem");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v105[2] = v65;
  -[HUEditLocationItemManager wallpaperPickerItem](self, "wallpaperPickerItem");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v105[3] = v66;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v105, 4);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setItems:", v67);

  objc_msgSend(v4, "addObject:", v61);
  v68 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUEditLocationDetailsSectionIdentifier"));
  _HULocalizedStringWithDefaultValue(CFSTR("HUEditLocationDetailsSectionTitle"), CFSTR("HUEditLocationDetailsSectionTitle"), 1);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setHeaderTitle:", v69);

  _HULocalizedStringWithDefaultValue(CFSTR("HUEditLocationDetailsFooterTitle"), CFSTR("HUEditLocationDetailsFooterTitle"), 1);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setFooterTitle:", v70);

  -[HUEditLocationItemManager detailNotesItem](self, "detailNotesItem");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = v71;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v104, 1);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setItems:", v72);

  objc_msgSend(v4, "addObject:", v68);
  HFLocalizedWiFiString();
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  HFLocalizedString();
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = objc_alloc(MEMORY[0x1E0CB3778]);
  objc_msgSend(v89, "stringByAppendingString:", CFSTR(" "));
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = (void *)objc_msgSend(v74, "initWithString:", v75);

  v77 = objc_alloc(MEMORY[0x1E0CB3498]);
  v102 = *MEMORY[0x1E0CEA0C0];
  objc_msgSend(MEMORY[0x1E0D31970], "locationPrivacyURL");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = v78;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v103, &v102, 1);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = (void *)objc_msgSend(v77, "initWithString:attributes:", v73, v79);
  objc_msgSend(v76, "appendAttributedString:", v80);

  v81 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HULocationServicesSectionIdentifier"));
  objc_msgSend(v81, "setAttributedFooterTitle:", v76);
  -[HUEditLocationItemManager locationServicesSettingItem](self, "locationServicesSettingItem");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = v82;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v101, 1);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "setItems:", v83);

  objc_msgSend(v4, "addObject:", v81);
  v84 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUEditLocationRemoveSectionIdentifier"));
  -[HUEditLocationItemManager removeItem](self, "removeItem");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = v85;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v100, 1);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "setItems:", v86);

  objc_msgSend(v4, "addObject:", v84);
  objc_msgSend(MEMORY[0x1E0D314B0], "filterSections:toDisplayedItems:", v4, v98);
  v87 = (void *)objc_claimAutoreleasedReturnValue();

  return v87;
}

id __62__HUEditLocationItemManager__buildSectionsWithDisplayedItems___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  __CFString *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D31528], "sharedDispatcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isUsingiCloud");

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "home");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "hf_currentUserIsAdministrator"))
      v5 = CFSTR("HUEditLocationPeopleFooterTitle_AdminOrOwner");
    else
      v5 = CFSTR("HUEditLocationPeopleFooterTitle_NonAdmin");
    _HULocalizedStringWithDefaultValue(v5, v5, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUEditLocationPeopleICloudNotEnabledFooterTitle"), CFSTR("HUEditLocationPeopleICloudNotEnabledFooterTitle"), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (BOOL)_isCurrentUserRestrictedGuest
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[HFItemManager home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentUser");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "hf_userIsRestrictedGuest:", v5);

  return v6;
}

- (void)_registerForExternalUpdates
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUEditLocationItemManager;
  -[HFItemManager _registerForExternalUpdates](&v4, sel__registerForExternalUpdates);
  -[HUEditLocationItemManager pinCodeManager](self, "pinCodeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:", self);

}

- (void)_unregisterForExternalUpdates
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUEditLocationItemManager;
  -[HFItemManager _unregisterForExternalUpdates](&v4, sel__unregisterForExternalUpdates);
  -[HUEditLocationItemManager pinCodeManager](self, "pinCodeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

}

- (void)pinCodeManagerDidUpdate:(id)a3 pinCodes:(id)a4
{
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint8_t buf[4];
  HUEditLocationItemManager *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v14 = self;
    v15 = 2112;
    v16 = v7;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "%@: %@ Reloading PIN Code related items...", buf, 0x16u);

  }
  -[HUEditLocationItemManager nonBlockingItemProvider](self, "nonBlockingItemProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HUEditLocationItemManager nonBlockingItemProvider](self, "nonBlockingItemProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[HFItemManager reloadAndUpdateItemsForProviders:senderSelector:](self, "reloadAndUpdateItemsForProviders:senderSelector:", v10, a2);

  }
}

- (HUUserNotificationTopicListModule)notificationSettingsModule
{
  return self->_notificationSettingsModule;
}

- (void)setNotificationSettingsModule:(id)a3
{
  objc_storeStrong((id *)&self->_notificationSettingsModule, a3);
}

- (HUMatterConnectedServicesItemModule)connectedServicesItemModule
{
  return self->_connectedServicesItemModule;
}

- (void)setConnectedServicesItemModule:(id)a3
{
  objc_storeStrong((id *)&self->_connectedServicesItemModule, a3);
}

- (HFItem)nameItem
{
  return self->_nameItem;
}

- (void)setNameItem:(id)a3
{
  objc_storeStrong((id *)&self->_nameItem, a3);
}

- (HFItem)homeScheduleItem
{
  return self->_homeScheduleItem;
}

- (void)setHomeScheduleItem:(id)a3
{
  objc_storeStrong((id *)&self->_homeScheduleItem, a3);
}

- (HFAccessoryCategoryItemProvider)allowedAccessoryCategoryItemProvider
{
  return self->_allowedAccessoryCategoryItemProvider;
}

- (void)setAllowedAccessoryCategoryItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_allowedAccessoryCategoryItemProvider, a3);
}

- (HFItem)inviteUsersItem
{
  return self->_inviteUsersItem;
}

- (void)setInviteUsersItem:(id)a3
{
  objc_storeStrong((id *)&self->_inviteUsersItem, a3);
}

- (HFItem)wallpaperPickerItem
{
  return self->_wallpaperPickerItem;
}

- (void)setWallpaperPickerItem:(id)a3
{
  objc_storeStrong((id *)&self->_wallpaperPickerItem, a3);
}

- (HFItem)showPredictedScenes
{
  return self->_showPredictedScenes;
}

- (void)setShowPredictedScenes:(id)a3
{
  objc_storeStrong((id *)&self->_showPredictedScenes, a3);
}

- (HFItem)cameraItem
{
  return self->_cameraItem;
}

- (void)setCameraItem:(id)a3
{
  objc_storeStrong((id *)&self->_cameraItem, a3);
}

- (HFItem)chooseWallpaperItem
{
  return self->_chooseWallpaperItem;
}

- (void)setChooseWallpaperItem:(id)a3
{
  objc_storeStrong((id *)&self->_chooseWallpaperItem, a3);
}

- (HFItem)wallpaperThumbnailItem
{
  return self->_wallpaperThumbnailItem;
}

- (void)setWallpaperThumbnailItem:(id)a3
{
  objc_storeStrong((id *)&self->_wallpaperThumbnailItem, a3);
}

- (HFItem)detailNotesItem
{
  return self->_detailNotesItem;
}

- (void)setDetailNotesItem:(id)a3
{
  objc_storeStrong((id *)&self->_detailNotesItem, a3);
}

- (HFItem)softwareUpdateItem
{
  return self->_softwareUpdateItem;
}

- (void)setSoftwareUpdateItem:(id)a3
{
  objc_storeStrong((id *)&self->_softwareUpdateItem, a3);
}

- (HFItem)guestsItem
{
  return self->_guestsItem;
}

- (void)setGuestsItem:(id)a3
{
  objc_storeStrong((id *)&self->_guestsItem, a3);
}

- (HFPinCodeManager)pinCodeManager
{
  return self->_pinCodeManager;
}

- (void)setPinCodeManager:(id)a3
{
  objc_storeStrong((id *)&self->_pinCodeManager, a3);
}

- (HFItem)removeItem
{
  return self->_removeItem;
}

- (void)setRemoveItem:(id)a3
{
  objc_storeStrong((id *)&self->_removeItem, a3);
}

- (HFItem)soundCheckItem
{
  return self->_soundCheckItem;
}

- (void)setSoundCheckItem:(id)a3
{
  objc_storeStrong((id *)&self->_soundCheckItem, a3);
}

- (HFItemProvider)userItemProvider
{
  return self->_userItemProvider;
}

- (void)setUserItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_userItemProvider, a3);
}

- (HFItemProvider)inviteItemProvider
{
  return self->_inviteItemProvider;
}

- (void)setInviteItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_inviteItemProvider, a3);
}

- (unint64_t)context
{
  return self->_context;
}

- (HFItem)locationServicesSettingItem
{
  return self->_locationServicesSettingItem;
}

- (void)setLocationServicesSettingItem:(id)a3
{
  objc_storeStrong((id *)&self->_locationServicesSettingItem, a3);
}

- (HUSiriTriggerPhraseSettingItem)siriTriggerPhraseSettingItem
{
  return self->_siriTriggerPhraseSettingItem;
}

- (void)setSiriTriggerPhraseSettingItem:(id)a3
{
  objc_storeStrong((id *)&self->_siriTriggerPhraseSettingItem, a3);
}

- (HFHomeBuilder)homeBuilder
{
  return self->_homeBuilder;
}

- (void)setHomeBuilder:(id)a3
{
  objc_storeStrong((id *)&self->_homeBuilder, a3);
}

- (HFStaticNonBlockingItemProvider)nonBlockingItemProvider
{
  return self->_nonBlockingItemProvider;
}

- (void)setNonBlockingItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_nonBlockingItemProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonBlockingItemProvider, 0);
  objc_storeStrong((id *)&self->_homeBuilder, 0);
  objc_storeStrong((id *)&self->_siriTriggerPhraseSettingItem, 0);
  objc_storeStrong((id *)&self->_locationServicesSettingItem, 0);
  objc_storeStrong((id *)&self->_inviteItemProvider, 0);
  objc_storeStrong((id *)&self->_userItemProvider, 0);
  objc_storeStrong((id *)&self->_soundCheckItem, 0);
  objc_storeStrong((id *)&self->_removeItem, 0);
  objc_storeStrong((id *)&self->_pinCodeManager, 0);
  objc_storeStrong((id *)&self->_guestsItem, 0);
  objc_storeStrong((id *)&self->_softwareUpdateItem, 0);
  objc_storeStrong((id *)&self->_detailNotesItem, 0);
  objc_storeStrong((id *)&self->_wallpaperThumbnailItem, 0);
  objc_storeStrong((id *)&self->_chooseWallpaperItem, 0);
  objc_storeStrong((id *)&self->_cameraItem, 0);
  objc_storeStrong((id *)&self->_showPredictedScenes, 0);
  objc_storeStrong((id *)&self->_wallpaperPickerItem, 0);
  objc_storeStrong((id *)&self->_inviteUsersItem, 0);
  objc_storeStrong((id *)&self->_allowedAccessoryCategoryItemProvider, 0);
  objc_storeStrong((id *)&self->_homeScheduleItem, 0);
  objc_storeStrong((id *)&self->_nameItem, 0);
  objc_storeStrong((id *)&self->_connectedServicesItemModule, 0);
  objc_storeStrong((id *)&self->_notificationSettingsModule, 0);
}

@end

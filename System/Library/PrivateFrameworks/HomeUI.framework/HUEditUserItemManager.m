@implementation HUEditUserItemManager

- (HUEditUserItemManager)initWithHome:(id)a3 userItem:(id)a4 delegate:(id)a5
{
  id v8;
  HUEditUserItemManager *v9;
  uint64_t v10;
  HULocationDeviceManager *locationDeviceManager;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSArray *sectionOrderArrayWhenViewingSelf;
  uint64_t v16;
  NSArray *sectionOrderArrayWhenViewingOther;
  objc_super v19;
  _QWORD v20[12];
  _QWORD v21[14];

  v21[12] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v19.receiver = self;
  v19.super_class = (Class)HUEditUserItemManager;
  v9 = -[HFItemManager initWithDelegate:sourceItem:](&v19, sel_initWithDelegate_sourceItem_, a5, a4);
  if (v9)
  {
    +[HULocationDeviceManager sharedInstance](HULocationDeviceManager, "sharedInstance");
    v10 = objc_claimAutoreleasedReturnValue();
    locationDeviceManager = v9->_locationDeviceManager;
    v9->_locationDeviceManager = (HULocationDeviceManager *)v10;

    -[HUEditUserItemManager setHomeForUser:](v9, "setHomeForUser:", v8);
    v21[0] = *MEMORY[0x1E0D30780];
    v12 = v21[0];
    v21[1] = CFSTR("HUEditUserItemManager_PersonalRequestsSectionIdentifier");
    v21[2] = CFSTR("HUEditUserItemManager_TVViewingProfilesSectionIdentifier");
    v21[3] = CFSTR("HUMediaServiceSettingsItemModule_MediaServicesSectionIdentifier");
    v13 = *MEMORY[0x1E0D30728];
    v21[4] = CFSTR("HUMediaServiceSettingsItemModule_PrimaryServiceSectionIdentifier");
    v21[5] = v13;
    v21[6] = CFSTR("HUEditUserItemManager_UpdateListeningHistorySectionIdentifier");
    v21[7] = CFSTR("HUEditUserItemManager_EditingSectionIdentifier");
    v21[8] = CFSTR("HUEditUserItemManager_AccessSectionIdentifier");
    v21[9] = CFSTR("HUEditUserItemManager_AccessLevelSectionIdentifier");
    v21[10] = CFSTR("HUEditUserItemManager_AccessoriesSectionIdentifier");
    v21[11] = CFSTR("HUEditUserItemManager_ButtonSectionIdentifier");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 12);
    v14 = objc_claimAutoreleasedReturnValue();
    sectionOrderArrayWhenViewingSelf = v9->_sectionOrderArrayWhenViewingSelf;
    v9->_sectionOrderArrayWhenViewingSelf = (NSArray *)v14;

    v20[0] = CFSTR("HUEditUserItemManager_EditingSectionIdentifier");
    v20[1] = CFSTR("HUEditUserItemManager_AccessSectionIdentifier");
    v20[2] = CFSTR("HUEditUserItemManager_AccessLevelSectionIdentifier");
    v20[3] = CFSTR("HUEditUserItemManager_AccessoriesSectionIdentifier");
    v20[4] = v12;
    v20[5] = CFSTR("HUEditUserItemManager_PersonalRequestsSectionIdentifier");
    v20[6] = CFSTR("HUEditUserItemManager_TVViewingProfilesSectionIdentifier");
    v20[7] = CFSTR("HUMediaServiceSettingsItemModule_MediaServicesSectionIdentifier");
    v20[8] = CFSTR("HUMediaServiceSettingsItemModule_PrimaryServiceSectionIdentifier");
    v20[9] = v13;
    v20[10] = CFSTR("HUEditUserItemManager_UpdateListeningHistorySectionIdentifier");
    v20[11] = CFSTR("HUEditUserItemManager_ButtonSectionIdentifier");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 12);
    v16 = objc_claimAutoreleasedReturnValue();
    sectionOrderArrayWhenViewingOther = v9->_sectionOrderArrayWhenViewingOther;
    v9->_sectionOrderArrayWhenViewingOther = (NSArray *)v16;

  }
  return v9;
}

- (HUEditUserItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_userItem_delegate_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUEditUserItemManager.m"), 126, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUEditUserItemManager initWithDelegate:sourceItem:]",
    v7);

  return 0;
}

- (HMUser)userBeingEdited
{
  void *v2;
  void *v3;

  -[HFItemManager sourceItem](self, "sourceItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "user");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMUser *)v3;
}

- (id)reuseIdentifierForFooterViewInSection:(unint64_t)a3
{
  void *v4;
  __CFString *v5;
  __CFString *v6;

  -[HFItemManager displayedSectionIdentifierForSectionIndex:](self, "displayedSectionIdentifierForSectionIndex:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("HUEditUserItemManager_AccessSectionIdentifier"))
    && !-[HUEditUserItemManager _hasResidentDevice](self, "_hasResidentDevice"))
  {
    v5 = CFSTR("HUAboutResidentDeviceFooterViewReuseIdentifier");
    goto LABEL_6;
  }
  v5 = (__CFString *)*MEMORY[0x1E0D30728];
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D30728]))
  {
LABEL_6:
    v6 = v5;
    goto LABEL_7;
  }
  v6 = 0;
LABEL_7:

  return v6;
}

- (BOOL)isUserBeingEditedTheDeviceUser
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[HUEditUserItemManager userBeingEdited](self, "userBeingEdited");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentUser");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isEqual:", v5);

  return v6;
}

- (id)_homeFuture
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D519C0];
  -[HUEditUserItemManager homeForUser](self, "homeForUser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  HURestrictedGuestScheduleItem *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  HUInstructionsItem *v13;
  void *v14;
  HUInstructionsItem *v15;
  id v16;
  uint64_t v17;
  void *v18;
  _HUUserAccessItem *v19;
  void *v20;
  _HUUserAccessItem *v21;
  _HUUserAccessItem *v22;
  void *v23;
  _HUUserAccessItem *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  char v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  _HUUserAccessItem *v41;
  void *v42;
  _HUUserAccessItem *v43;
  void *v44;
  void *v45;
  _BOOL4 v46;
  void *v47;
  void *v48;
  _BOOL4 v49;
  NSObject *v50;
  _HUUserAccessItem *v51;
  void *v52;
  _HUUserAccessItem *v53;
  _HUUserAccessItem *v54;
  void *v55;
  _HUUserAccessItem *v56;
  _HUUserAccessItem *v57;
  void *v58;
  _HUUserAccessItem *v59;
  void *v60;
  void *v61;
  _BOOL4 v62;
  void *v63;
  int v64;
  HUAccessorySettingsItemModule *v65;
  NSObject *v66;
  void *v67;
  HUAccessorySettingsItemModule *v68;
  void *v69;
  HUMediaServiceSettingsItemModule *v70;
  void *v71;
  HUMediaServiceSettingsItemModule *v72;
  void *v73;
  void *v74;
  void *v75;
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
  objc_class *v92;
  __CFString *v93;
  void *v94;
  void *v95;
  void *v96;
  _BOOL4 v97;
  void *v98;
  _BOOL4 v99;
  _BOOL4 v100;
  uint64_t v101;
  void *v102;
  const __CFString *v103;
  const __CFString *v104;
  void *v105;
  id v106;
  id *v107;
  id *v108;
  id *v109;
  id v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  char *aSelectora;
  void *v119;
  HUEditUserItemManager *v120;
  _QWORD v121[5];
  _QWORD v122[4];
  id v123;
  _QWORD v124[4];
  id v125;
  _QWORD v126[4];
  id v127;
  BOOL v128;
  BOOL v129;
  _QWORD v130[4];
  id v131[2];
  _QWORD v132[4];
  id v133;
  _QWORD v134[4];
  id v135;
  id v136;
  _QWORD v137[4];
  id v138;
  _QWORD v139[4];
  id v140;
  char v141;
  _QWORD v142[5];
  char v143;
  id location;
  _QWORD v145[11];
  uint64_t v146;
  uint64_t v147;
  _QWORD v148[4];
  _QWORD v149[4];
  uint8_t buf[4];
  HUEditUserItemManager *v151;
  __int16 v152;
  uint64_t v153;
  __int16 v154;
  const __CFString *v155;
  __int16 v156;
  const __CFString *v157;
  __int16 v158;
  void *v159;
  __int16 v160;
  _BOOL4 v161;
  __int16 v162;
  _BOOL4 v163;
  __int16 v164;
  _BOOL4 v165;
  uint64_t v166;

  v166 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_initWeak(&location, self);
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v92 = (objc_class *)objc_opt_class();
    NSStringFromClass(v92);
    v120 = (HUEditUserItemManager *)(id)objc_claimAutoreleasedReturnValue();
    -[HFItemManager home](self, "home");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "currentUser");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "hf_prettyDescription");
    v108 = (id *)objc_claimAutoreleasedReturnValue();
    -[HFItemManager home](self, "home");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "currentUser");
    v109 = (id *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "name");
    v107 = (id *)objc_claimAutoreleasedReturnValue();
    -[HUEditUserItemManager userBeingEdited](self, "userBeingEdited");
    v93 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[HUEditUserItemManager userBeingEdited](self, "userBeingEdited");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "name");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUEditUserItemManager userBeingEdited](self, "userBeingEdited");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = -[HUEditUserItemManager _isUserOwner:](self, "_isUserOwner:", v96);
    -[HUEditUserItemManager userBeingEdited](self, "userBeingEdited");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v99 = -[HUEditUserItemManager _isEditingAllowedForUser:](self, "_isEditingAllowedForUser:", v98);
    v100 = -[HUEditUserItemManager _canModifyUserBeingEditedPermissions](self, "_canModifyUserBeingEditedPermissions");
    *(_DWORD *)buf = 138414082;
    v151 = v120;
    v152 = 2112;
    v153 = (uint64_t)v108;
    v154 = 2112;
    v155 = (const __CFString *)v107;
    v156 = 2112;
    v157 = v93;
    v158 = 2112;
    v159 = v95;
    v160 = 1024;
    v161 = v97;
    v162 = 1024;
    v163 = v99;
    v164 = 1024;
    v165 = v100;
    _os_log_debug_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEBUG, "%@ Info:\n\tCurrent User: %@/%@\n\tUser Being Edited: %@/%@\n\tUBE is Owner: %{BOOL}d\n\tUBE is Admin: %{BOOL}d\n\tCU Can Modify User Permissions for UBE: %{BOOL}d", buf, 0x46u);

  }
  -[HFItemManager home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUEditUserItemManager userBeingEdited](self, "userBeingEdited");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "hf_userIsRestrictedGuest:", v7);

  v9 = [HURestrictedGuestScheduleItem alloc];
  -[HUEditUserItemManager homeForUser](self, "homeForUser");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUEditUserItemManager userBeingEdited](self, "userBeingEdited");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HURestrictedGuestScheduleItem initWithHome:user:](v9, "initWithHome:user:", v10, v11);
  -[HUEditUserItemManager setHomeScheduleItem:](self, "setHomeScheduleItem:", v12);

  v13 = [HUInstructionsItem alloc];
  _HULocalizedStringWithDefaultValue(CFSTR("HUUsersAccessWithoutRemoteCapability"), CFSTR("HUUsersAccessWithoutRemoteCapability"), 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[HUInstructionsItem initWithStyle:title:description:](v13, "initWithStyle:title:description:", 5, 0, v14);
  -[HUEditUserItemManager setLocalAccessItem:](self, "setLocalAccessItem:", v15);

  v16 = objc_alloc(MEMORY[0x1E0D31840]);
  v17 = MEMORY[0x1E0C809B0];
  v142[0] = MEMORY[0x1E0C809B0];
  v142[1] = 3221225472;
  v142[2] = __52__HUEditUserItemManager__buildItemProvidersForHome___block_invoke;
  v142[3] = &unk_1E6F4DF80;
  v142[4] = self;
  v143 = v8;
  v18 = (void *)objc_msgSend(v16, "initWithResultsBlock:", v142);
  -[HUEditUserItemManager setRemoteAccessItem:](self, "setRemoteAccessItem:", v18);

  LOBYTE(v12) = -[HUEditUserItemManager _hasResidentDevice](self, "_hasResidentDevice");
  v19 = [_HUUserAccessItem alloc];
  -[HUEditUserItemManager userBeingEdited](self, "userBeingEdited");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v139[0] = v17;
  v139[1] = 3221225472;
  v139[2] = __52__HUEditUserItemManager__buildItemProvidersForHome___block_invoke_2;
  v139[3] = &unk_1E6F4E590;
  objc_copyWeak(&v140, &location);
  v141 = v12 ^ 1 | v8;
  v21 = -[_HUUserAccessItem initWithUser:resultsBlock:](v19, "initWithUser:resultsBlock:", v20, v139);
  -[HUEditUserItemManager setAllowEditingItem:](self, "setAllowEditingItem:", v21);

  v22 = [_HUUserAccessItem alloc];
  -[HUEditUserItemManager userBeingEdited](self, "userBeingEdited");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v137[0] = v17;
  v137[1] = 3221225472;
  v137[2] = __52__HUEditUserItemManager__buildItemProvidersForHome___block_invoke_3;
  v137[3] = &unk_1E6F4C4E8;
  objc_copyWeak(&v138, &location);
  v24 = -[_HUUserAccessItem initWithUser:resultsBlock:](v22, "initWithUser:resultsBlock:", v23, v137);
  -[HUEditUserItemManager setCamerasItem:](self, "setCamerasItem:", v24);

  -[HUEditUserItemManager homeForUser](self, "homeForUser");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "accessories");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "na_any:", &__block_literal_global_27);

  if (v27)
  {
    -[HFItemManager home](self, "home");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "hasOnboardedForAccessCode");
    if ((v29 & 1) != 0
      || (-[HFItemManager home](self, "home"),
          v26 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v26, "hasOnboardedForWalletKey")))
    {
      if (-[HUEditUserItemManager isUserBeingEditedTheDeviceUser](self, "isUserBeingEditedTheDeviceUser"))
      {
        v27 = 1;
      }
      else
      {
        -[HFItemManager home](self, "home");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v30, "hf_currentUserIsAdministrator");

      }
      if ((v29 & 1) != 0)
        goto LABEL_13;
    }
    else
    {
      v27 = 0;
    }

LABEL_13:
  }
  v31 = objc_alloc(MEMORY[0x1E0D31840]);
  v148[0] = *MEMORY[0x1E0D30D18];
  _HULocalizedStringWithDefaultValue(CFSTR("HUUsersLocksTitle"), CFSTR("HUUsersLocksTitle"), 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v149[0] = v32;
  v148[1] = *MEMORY[0x1E0D30C60];
  objc_msgSend(MEMORY[0x1E0D317C8], "iconDescriptorForAccessoryCategoryOrServiceType:", *MEMORY[0x1E0CB7A38]);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v149[1] = v33;
  v148[2] = *MEMORY[0x1E0D30D70];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v27 ^ 1 | v8);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v148[3] = *MEMORY[0x1E0D30CE8];
  v149[2] = v34;
  v149[3] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v149, v148, 4);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)objc_msgSend(v31, "initWithResults:", v35);
  -[HUEditUserItemManager setLocksItem:](self, "setLocksItem:", v36);

  v37 = objc_alloc(MEMORY[0x1E0D31050]);
  -[HFItemManager home](self, "home");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v119 = (void *)objc_msgSend(v37, "initWithHome:", v38);

  v134[0] = v17;
  v134[1] = 3221225472;
  v134[2] = __52__HUEditUserItemManager__buildItemProvidersForHome___block_invoke_5;
  v134[3] = &unk_1E6F4E600;
  objc_copyWeak(&v136, &location);
  v106 = v4;
  v135 = v106;
  objc_msgSend(v119, "setFilter:", v134);
  v39 = objc_alloc(MEMORY[0x1E0D31928]);
  v132[0] = v17;
  v132[1] = 3221225472;
  v132[2] = __52__HUEditUserItemManager__buildItemProvidersForHome___block_invoke_7;
  v132[3] = &unk_1E6F4E650;
  objc_copyWeak(&v133, &location);
  v40 = (void *)objc_msgSend(v39, "initWithSourceProvider:transformationBlock:", v119, v132);
  -[HUEditUserItemManager setAllowedAccessoryCategoryItemProvider:](self, "setAllowedAccessoryCategoryItemProvider:", v40);

  v41 = [_HUUserAccessItem alloc];
  -[HUEditUserItemManager userBeingEdited](self, "userBeingEdited");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v130[0] = v17;
  v130[1] = 3221225472;
  v130[2] = __52__HUEditUserItemManager__buildItemProvidersForHome___block_invoke_10;
  v130[3] = &unk_1E6F4E678;
  objc_copyWeak(v131, &location);
  v131[1] = (id)a2;
  v43 = -[_HUUserAccessItem initWithUser:resultsBlock:](v41, "initWithUser:resultsBlock:", v42, v130);
  -[HUEditUserItemManager setPersonalRequestsItem:](self, "setPersonalRequestsItem:", v43);

  if (-[HUEditUserItemManager _hasTVViewingProfilesDevice](self, "_hasTVViewingProfilesDevice"))
  {
    -[HFItemManager home](self, "home");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUEditUserItemManager userBeingEdited](self, "userBeingEdited");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v44, "hf_canShowTvViewingInfoForUser:", v45))
    {
      if (-[HUEditUserItemManager isUserBeingEditedTheDeviceUser](self, "isUserBeingEditedTheDeviceUser"))
      {
        v46 = 1;
      }
      else
      {
        -[HFItemManager home](self, "home");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "currentUser");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = -[HUEditUserItemManager _isUserOwner:](self, "_isUserOwner:", v48);

      }
    }
    else
    {
      v46 = 0;
    }

  }
  else
  {
    v46 = 0;
  }
  v49 = -[HUEditUserItemManager isUserBeingEditedTheDeviceUser](self, "isUserBeingEditedTheDeviceUser");
  HFLogForCategory();
  v50 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v101 = objc_claimAutoreleasedReturnValue();
    v102 = (void *)v101;
    v103 = CFSTR("HIDDEN");
    if (v46)
      v103 = CFSTR("not hidden");
    v104 = CFSTR("disabled");
    *(_DWORD *)buf = 138413058;
    v151 = self;
    v155 = v103;
    v152 = 2112;
    v153 = v101;
    v154 = 2112;
    if (v49)
      v104 = CFSTR("not disabled");
    v156 = 2112;
    v157 = v104;
    _os_log_debug_impl(&dword_1B8E1E000, v50, OS_LOG_TYPE_DEBUG, "%@:%@  TV Viewing Profiles is %@ / %@", buf, 0x2Au);

  }
  v51 = [_HUUserAccessItem alloc];
  -[HUEditUserItemManager userBeingEdited](self, "userBeingEdited");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v126[0] = v17;
  v126[1] = 3221225472;
  v126[2] = __52__HUEditUserItemManager__buildItemProvidersForHome___block_invoke_79;
  v126[3] = &unk_1E6F4E270;
  objc_copyWeak(&v127, &location);
  v128 = v46;
  v129 = !v49;
  v53 = -[_HUUserAccessItem initWithUser:resultsBlock:](v51, "initWithUser:resultsBlock:", v52, v126);
  -[HUEditUserItemManager setTvViewingProfilesItem:](self, "setTvViewingProfilesItem:", v53);

  v54 = [_HUUserAccessItem alloc];
  -[HUEditUserItemManager userBeingEdited](self, "userBeingEdited");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v124[0] = v17;
  v124[1] = 3221225472;
  v124[2] = __52__HUEditUserItemManager__buildItemProvidersForHome___block_invoke_2_82;
  v124[3] = &unk_1E6F4C4E8;
  objc_copyWeak(&v125, &location);
  v56 = -[_HUUserAccessItem initWithUser:resultsBlock:](v54, "initWithUser:resultsBlock:", v55, v124);
  -[HUEditUserItemManager setRemoveItem:](self, "setRemoveItem:", v56);

  v57 = [_HUUserAccessItem alloc];
  -[HUEditUserItemManager userBeingEdited](self, "userBeingEdited");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v122[0] = v17;
  v122[1] = 3221225472;
  v122[2] = __52__HUEditUserItemManager__buildItemProvidersForHome___block_invoke_3_87;
  v122[3] = &unk_1E6F4C4E8;
  objc_copyWeak(&v123, &location);
  v59 = -[_HUUserAccessItem initWithUser:resultsBlock:](v57, "initWithUser:resultsBlock:", v58, v122);
  -[HUEditUserItemManager setPendingAccessoriesItem:](self, "setPendingAccessoriesItem:", v59);

  if (-[HUEditUserItemManager isUserBeingEditedTheDeviceUser](self, "isUserBeingEditedTheDeviceUser")
    || (-[HFItemManager home](self, "home"),
        v60 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v60, "currentUser"),
        v61 = (void *)objc_claimAutoreleasedReturnValue(),
        v62 = -[HUEditUserItemManager _isUserOwner:](self, "_isUserOwner:", v61),
        v61,
        v60,
        v62))
  {
    -[HFItemManager sourceItem](self, "sourceItem");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = objc_msgSend(v63, "hasValidSettings");

    if (v64)
    {
      v65 = [HUAccessorySettingsItemModule alloc];
      -[HFItemManager sourceItem](self, "sourceItem");
      v66 = objc_claimAutoreleasedReturnValue();
      v146 = *MEMORY[0x1E0D31008];
      v147 = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v147, &v146, 1);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = -[HUAccessorySettingsItemModule initWithItemUpdater:homeKitSettingsVendor:usageOptions:](v65, "initWithItemUpdater:homeKitSettingsVendor:usageOptions:", self, v66, v67);
      -[HUEditUserItemManager setUserSettingsItemModule:](self, "setUserSettingsItemModule:", v68);

    }
    else
    {
      HFLogForCategory();
      v66 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v151 = (HUEditUserItemManager *)"-[HUEditUserItemManager _buildItemProvidersForHome:]";
        _os_log_error_impl(&dword_1B8E1E000, v66, OS_LOG_TYPE_ERROR, "(%s) CAN'T ACCESS USER BASED SETTINGS: The user's settings can't be accessed because hasValidSettings == NO", buf, 0xCu);
      }
    }
  }
  else
  {
    HFLogForCategory();
    v66 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v151 = self;
      v152 = 2112;
      v153 = (uint64_t)v105;
      _os_log_debug_impl(&dword_1B8E1E000, v66, OS_LOG_TYPE_DEBUG, "%@:%@  Not Displaying HMSettings based controls because current user is not permitted", buf, 0x16u);

    }
  }

  v121[0] = v17;
  v121[1] = 3221225472;
  v121[2] = __52__HUEditUserItemManager__buildItemProvidersForHome___block_invoke_89;
  v121[3] = &unk_1E6F4C518;
  v121[4] = self;
  v69 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31840]), "initWithResultsBlock:", v121);
  -[HUEditUserItemManager setUpdateListeningHistoryItem:](self, "setUpdateListeningHistoryItem:", v69);

  if (-[HUEditUserItemManager _shouldShowBoltUI](self, "_shouldShowBoltUI"))
  {
    v70 = [HUMediaServiceSettingsItemModule alloc];
    -[HFItemManager home](self, "home");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = -[HUMediaServiceSettingsItemModule initWithItemUpdater:home:](v70, "initWithItemUpdater:home:", self, v71);
    -[HUEditUserItemManager setMediaServiceItemModule:](self, "setMediaServiceItemModule:", v72);

  }
  v110 = objc_alloc(MEMORY[0x1E0C99E60]);
  -[HUEditUserItemManager homeScheduleItem](self, "homeScheduleItem");
  aSelectora = (char *)objc_claimAutoreleasedReturnValue();
  v145[0] = aSelectora;
  -[HUEditUserItemManager localAccessItem](self, "localAccessItem");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v145[1] = v115;
  -[HUEditUserItemManager remoteAccessItem](self, "remoteAccessItem");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v145[2] = v113;
  -[HUEditUserItemManager allowEditingItem](self, "allowEditingItem");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v145[3] = v73;
  -[HUEditUserItemManager camerasItem](self, "camerasItem");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v145[4] = v74;
  -[HUEditUserItemManager locksItem](self, "locksItem");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v145[5] = v75;
  -[HUEditUserItemManager personalRequestsItem](self, "personalRequestsItem");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v145[6] = v76;
  -[HUEditUserItemManager tvViewingProfilesItem](self, "tvViewingProfilesItem");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v145[7] = v77;
  -[HUEditUserItemManager updateListeningHistoryItem](self, "updateListeningHistoryItem");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v145[8] = v78;
  -[HUEditUserItemManager removeItem](self, "removeItem");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v145[9] = v79;
  -[HUEditUserItemManager pendingAccessoriesItem](self, "pendingAccessoriesItem");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v145[10] = v80;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v145, 11);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v111 = (void *)objc_msgSend(v110, "initWithArray:", v81);

  v82 = (void *)MEMORY[0x1E0C99E20];
  v83 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31848]), "initWithItems:", v111);
  objc_msgSend(v82, "setWithObject:", v83);
  v84 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUEditUserItemManager allowedAccessoryCategoryItemProvider](self, "allowedAccessoryCategoryItemProvider");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "na_safeAddObject:", v85);

  -[HUEditUserItemManager userSettingsItemModule](self, "userSettingsItemModule");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "itemProviders");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "unionSet:", v87);

  -[HUEditUserItemManager mediaServiceItemModule](self, "mediaServiceItemModule");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "itemProviders");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "unionSet:", v89);

  objc_msgSend(v84, "allObjects");
  v90 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v123);
  objc_destroyWeak(&v125);
  objc_destroyWeak(&v127);
  objc_destroyWeak(v131);
  objc_destroyWeak(&v133);

  objc_destroyWeak(&v136);
  objc_destroyWeak(&v138);
  objc_destroyWeak(&v140);
  objc_destroyWeak(&location);

  return v90;
}

id __52__HUEditUserItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  _QWORD v16[5];

  v16[4] = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "_canModifyUserBeingEditedPermissions");
  v3 = objc_msgSend(*(id *)(a1 + 32), "_hasResidentDevice");
  if (_os_feature_enabled_impl())
  {
    if (objc_msgSend(*(id *)(a1 + 32), "_hasResidentDevice"))
      v4 = *(_BYTE *)(a1 + 40) != 0;
    else
      v4 = 1;
  }
  else
  {
    v4 = v3 ^ 1u;
  }
  v5 = (void *)MEMORY[0x1E0D519C0];
  v15[0] = *MEMORY[0x1E0D30D70];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v6;
  v15[1] = *MEMORY[0x1E0D30D18];
  _HULocalizedStringWithDefaultValue(CFSTR("HUUsersCellControlAccessRemotely"), CFSTR("HUUsersCellControlAccessRemotely"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v7;
  v15[2] = *MEMORY[0x1E0D30BF8];
  v8 = *(void **)(a1 + 32);
  objc_msgSend(v8, "userBeingEdited");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_isRemoteAccessAllowedForUser:", v9);
  HFLocalizedString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v10;
  v15[3] = *MEMORY[0x1E0D30C80];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v2 ^ 1u);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "futureWithResult:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id __52__HUEditUserItemManager__buildItemProvidersForHome___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[5];
  _QWORD v18[6];

  v18[5] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_msgSend(WeakRetained, "_canModifyUserBeingEditedPermissions") ^ 1;
  v4 = (void *)MEMORY[0x1E0D519C0];
  v17[0] = *MEMORY[0x1E0D30D70];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v5;
  v17[1] = *MEMORY[0x1E0D30D18];
  _HULocalizedStringWithDefaultValue(CFSTR("HUUsersCellAllowEditing"), CFSTR("HUUsersCellAllowEditing"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0D30D20];
  v18[1] = v6;
  v18[2] = CFSTR("HUUsersCellAllowEditing");
  v8 = *MEMORY[0x1E0D30E20];
  v17[2] = v7;
  v17[3] = v8;
  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(WeakRetained, "userBeingEdited");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(WeakRetained, "_isEditingAllowedForUser:", v10))
    v11 = 2;
  else
    v11 = 1;
  objc_msgSend(v9, "numberWithInteger:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v12;
  v17[4] = *MEMORY[0x1E0D30C80];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[4] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "futureWithResult:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

id __52__HUEditUserItemManager__buildItemProvidersForHome___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  __CFString *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[4];
  _QWORD v22[5];

  v22[4] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "userBeingEdited");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeAccessControlForUser:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "camerasAccessLevel");
  HFLocalizedStringFromHMUserCameraAccessLevel();
  v5 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hf_allCameraProfiles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(WeakRetained, "home");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "hf_hasCameraRecordingResident") ^ 1;

  }
  else
  {
    v9 = 1;
  }
  if (v5)
    v10 = (__CFString *)v5;
  else
    v10 = &stru_1E6F60E80;

  objc_msgSend(WeakRetained, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "userBeingEdited");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "hf_userIsRestrictedGuest:", v12);

  v14 = (void *)MEMORY[0x1E0D519C0];
  v21[0] = *MEMORY[0x1E0D30D70];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v13 | v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v15;
  v21[1] = *MEMORY[0x1E0D30D18];
  _HULocalizedStringWithDefaultValue(CFSTR("HUUsersCamerasTitle"), CFSTR("HUUsersCamerasTitle"), 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v16;
  v21[2] = *MEMORY[0x1E0D30C60];
  objc_msgSend(MEMORY[0x1E0D317C8], "iconDescriptorForAccessoryCategoryOrServiceType:", *MEMORY[0x1E0CB7A60]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = *MEMORY[0x1E0D30BF8];
  v22[2] = v17;
  v22[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "futureWithResult:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

uint64_t __52__HUEditUserItemManager__buildItemProvidersForHome___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = a2;
  objc_msgSend(v2, "hf_categoryOrPrimaryServiceType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB7A38]) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(v2, "hf_categoryOrPrimaryServiceType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB9A80]);

  }
  return v4;
}

uint64_t __52__HUEditUserItemManager__buildItemProvidersForHome___block_invoke_5(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  char v10;
  void *v11;
  void *v12;
  id v13;
  int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "hf_currentUserIsAdministrator"))
  {
    objc_msgSend(WeakRetained, "home");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "userBeingEdited");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "hf_userIsRestrictedGuest:", v8);

    v10 = v9 ^ 1;
  }
  else
  {
    v10 = 1;
  }

  objc_msgSend(MEMORY[0x1E0CBA1D8], "hf_compatibleServiceTypesForCategoryType:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "accessories");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __52__HUEditUserItemManager__buildItemProvidersForHome___block_invoke_6;
  v19[3] = &unk_1E6F4E5D8;
  v13 = v11;
  v20 = v13;
  v14 = objc_msgSend(v12, "na_any:", v19);

  v15 = 0;
  if ((v10 & 1) == 0 && v14)
  {
    v16 = (void *)MEMORY[0x1E0CBA7D0];
    objc_msgSend(v13, "allObjects");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v16, "doesAccessoryHaveRestrictedGuestCapableServiceTypes:", v17);

  }
  return v15;
}

uint64_t __52__HUEditUserItemManager__buildItemProvidersForHome___block_invoke_6(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "hf_primaryService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serviceType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "na_safeContainsObject:", v4);

  return v5;
}

id __52__HUEditUserItemManager__buildItemProvidersForHome___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_opt_class();
  v5 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  v8 = objc_alloc(MEMORY[0x1E0D31920]);
  v9 = (void *)objc_msgSend(v7, "copy");
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __52__HUEditUserItemManager__buildItemProvidersForHome___block_invoke_8;
  v13[3] = &unk_1E6F4E628;
  v13[4] = WeakRetained;
  v14 = v7;
  v10 = v7;
  v11 = (void *)objc_msgSend(v8, "initWithSourceItem:transformationBlock:", v9, v13);

  return v11;
}

id __52__HUEditUserItemManager__buildItemProvidersForHome___block_invoke_8(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD v19[4];
  id v20;

  v3 = (void *)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(*(id *)(a1 + 32), "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "userBeingEdited");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "homeAccessControlForUser:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "restrictedGuestAccessSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accessAllowedToAccessories");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __52__HUEditUserItemManager__buildItemProvidersForHome___block_invoke_9;
  v19[3] = &unk_1E6F4E5D8;
  v20 = *(id *)(a1 + 40);
  objc_msgSend(v8, "na_filter:", v19);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
    HULocalizedStringWithFormat(CFSTR("HURestrictedGuestScheduleUserSettings_AccessoryCategory_AllowedCount_Description"), CFSTR("%lu"), v11, v12, v13, v14, v15, v16, v10);
  else
    _HULocalizedStringWithDefaultValue(CFSTR("HURestrictedGuestScheduleUserSettings_AccessoryCategory_AllowedNone_Description"), CFSTR("HURestrictedGuestScheduleUserSettings_AccessoryCategory_AllowedNone_Description"), 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0D30BF8]);

  return v3;
}

uint64_t __52__HUEditUserItemManager__buildItemProvidersForHome___block_invoke_9(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v2 = (void *)MEMORY[0x1E0CBA1D8];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "categoryType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_compatibleServiceTypesForCategoryType:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hf_primaryService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "serviceType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "na_safeContainsObject:", v8);

  return v9;
}

id __52__HUEditUserItemManager__buildItemProvidersForHome___block_invoke_10(uint64_t a1)
{
  id WeakRetained;
  int v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  const __CFString *v19;
  _QWORD v20[5];
  _QWORD v21[5];
  uint8_t buf[4];
  id v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  const __CFString *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "_hasPersonalRequestsDevice"))
  {
    if ((objc_msgSend(WeakRetained, "isUserBeingEditedTheDeviceUser") & 1) != 0)
    {
      v3 = 1;
    }
    else
    {
      objc_msgSend(WeakRetained, "home");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "currentUser");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(WeakRetained, "_isUserOwner:", v5);

    }
  }
  else
  {
    v3 = 0;
  }
  if (objc_msgSend(WeakRetained, "isUserBeingEditedTheDeviceUser"))
    v6 = objc_msgSend(MEMORY[0x1E0D319D0], "isAMac");
  else
    v6 = 1;
  HFLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    v18 = CFSTR("HIDDEN");
    if (v3)
      v18 = CFSTR("not hidden");
    v19 = CFSTR("not disabled");
    *(_DWORD *)buf = 138413058;
    v23 = WeakRetained;
    v27 = v18;
    v24 = 2112;
    v25 = v16;
    v26 = 2112;
    if ((_DWORD)v6)
      v19 = CFSTR("disabled");
    v28 = 2112;
    v29 = v19;
    _os_log_debug_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEBUG, "%@:%@  Personal Requests is %@ / %@", buf, 0x2Au);

  }
  v8 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3 ^ 1u, *MEMORY[0x1E0D30D70]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v9;
  v20[1] = *MEMORY[0x1E0D30D18];
  _HULocalizedStringWithDefaultValue(CFSTR("HUUsersPersonalRequests"), CFSTR("HUUsersPersonalRequests"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v10;
  v20[2] = *MEMORY[0x1E0D30BF8];
  objc_msgSend(WeakRetained, "_isPersonalRequestsEnabledForUser");
  HFLocalizedString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v11;
  v20[3] = *MEMORY[0x1E0D30C80];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[4] = *MEMORY[0x1E0D30CE8];
  v21[3] = v12;
  v21[4] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "futureWithResult:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

id __52__HUEditUserItemManager__buildItemProvidersForHome___block_invoke_79(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  _QWORD v12[6];

  v12[5] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = (void *)MEMORY[0x1E0D519C0];
  v11[0] = *MEMORY[0x1E0D30D70];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_BYTE *)(a1 + 40) == 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v4;
  v11[1] = *MEMORY[0x1E0D30D18];
  _HULocalizedStringWithDefaultValue(CFSTR("HUUsersShowTVViewingProfile"), CFSTR("HUUsersShowTVViewingProfile"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v5;
  v11[2] = *MEMORY[0x1E0D30BF8];
  objc_msgSend(WeakRetained, "_isTVViewingProfilesEnabledForUser");
  HFLocalizedString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v6;
  v11[3] = *MEMORY[0x1E0D30C80];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 41));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = *MEMORY[0x1E0D30CE8];
  v12[3] = v7;
  v12[4] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "futureWithResult:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __52__HUEditUserItemManager__buildItemProvidersForHome___block_invoke_2_82(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  uint64_t v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "userBeingEdited");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(WeakRetained, "_isUserOwner:", v2);

  v4 = (void *)MEMORY[0x1E0D519C0];
  v11[0] = *MEMORY[0x1E0D30D18];
  if (objc_msgSend(WeakRetained, "isUserBeingEditedTheDeviceUser"))
    v5 = CFSTR("HUEditLocationLeaveHomeButtonTitle");
  else
    v5 = CFSTR("HUUsersCellRemovePerson");
  _HULocalizedStringWithDefaultValue(v5, v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v11[1] = *MEMORY[0x1E0D30D70];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = *MEMORY[0x1E0D30CE8];
  v12[1] = v7;
  v12[2] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "futureWithResult:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __52__HUEditUserItemManager__buildItemProvidersForHome___block_invoke_3_87(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)MEMORY[0x1E0D519C0];
  v7 = *MEMORY[0x1E0D30D70];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(WeakRetained, "_hasPendingAccessories") ^ 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithResult:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __52__HUEditUserItemManager__buildItemProvidersForHome___block_invoke_89(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  _QWORD v23[5];

  v23[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_filter:", &__block_literal_global_91);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "count");
  v6 = 1;
  if (_os_feature_enabled_impl() && v5)
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "isUserBeingEditedTheDeviceUser") & 1) != 0)
    {
      v6 = 0;
    }
    else
    {
      v7 = *(void **)(a1 + 32);
      objc_msgSend(v7, "home");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "currentUser");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v7, "_isUserOwner:", v9) ^ 1;

    }
  }
  v10 = objc_alloc(MEMORY[0x1E0D31988]);
  objc_msgSend(*(id *)(a1 + 32), "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "userBeingEdited");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v10, "initWithHome:user:nameStyle:", v11, v12, 0);

  if ((objc_msgSend(MEMORY[0x1E0D319D0], "isAMac") & 1) != 0
    || !objc_msgSend(*(id *)(a1 + 32), "isUserBeingEditedTheDeviceUser"))
  {
    v14 = 1;
  }
  else
  {
    v14 = objc_msgSend(v13, "isIdentifyVoiceEnabled") ^ 1;
  }
  v15 = (void *)MEMORY[0x1E0D519C0];
  v22[0] = *MEMORY[0x1E0D30D70];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v16;
  v22[1] = *MEMORY[0x1E0D30D18];
  _HULocalizedStringWithDefaultValue(CFSTR("HUUpdateListeningHistorySettingTitle"), CFSTR("HUUpdateListeningHistorySettingTitle"), 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v17;
  v22[2] = *MEMORY[0x1E0D30C80];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = *MEMORY[0x1E0D30CE8];
  v23[2] = v18;
  v23[3] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "futureWithResult:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

uint64_t __52__HUEditUserItemManager__buildItemProvidersForHome___block_invoke_2_90(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_supportsUserLevelUpdateListeningHistorySetting");
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  id v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  int v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  int v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  char v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  int v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  int v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  int v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  _QWORD v96[5];
  _QWORD v97[5];
  char v98;
  _QWORD aBlock[5];
  id v100;
  SEL v101;
  char v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  _QWORD v109[3];
  void *v110;
  _QWORD v111[3];

  v111[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = objc_alloc(MEMORY[0x1E0C99E60]);
  -[HUEditUserItemManager localAccessItem](self, "localAccessItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v111[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v111, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithArray:", v8);
  v10 = objc_msgSend(v4, "intersectsSet:", v9);

  if (v10)
  {
    -[HUEditUserItemManager localAccessItem](self, "localAccessItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "containsObject:", v11))
    {
      v12 = -[HUEditUserItemManager _hasResidentDevice](self, "_hasResidentDevice");

      if (v12)
        goto LABEL_6;
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUEditUserItemManager_AccessSectionIdentifier"));
      -[HUEditUserItemManager localAccessItem](self, "localAccessItem");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v110 = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v110, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setItems:", v14);

      objc_msgSend(v5, "addObject:", v11);
    }

  }
LABEL_6:
  v15 = objc_alloc(MEMORY[0x1E0C99E60]);
  -[HUEditUserItemManager homeScheduleItem](self, "homeScheduleItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v109[0] = v16;
  -[HUEditUserItemManager remoteAccessItem](self, "remoteAccessItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v109[1] = v17;
  -[HUEditUserItemManager allowEditingItem](self, "allowEditingItem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v109[2] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v109, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v15, "initWithArray:", v19);
  v21 = objc_msgSend(v4, "intersectsSet:", v20);

  if (v21)
  {
    v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[HUEditUserItemManager remoteAccessItem](self, "remoteAccessItem");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v4, "containsObject:", v23);

    if (v24)
    {
      -[HUEditUserItemManager remoteAccessItem](self, "remoteAccessItem");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addObject:", v25);

    }
    -[HUEditUserItemManager homeScheduleItem](self, "homeScheduleItem");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v4, "containsObject:", v26);

    if (v27)
    {
      -[HUEditUserItemManager homeScheduleItem](self, "homeScheduleItem");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addObject:", v28);

    }
    -[HUEditUserItemManager allowEditingItem](self, "allowEditingItem");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v4, "containsObject:", v29);

    if (v30)
    {
      -[HUEditUserItemManager allowEditingItem](self, "allowEditingItem");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addObject:", v31);

    }
    if (objc_msgSend(v22, "count"))
    {
      v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUEditUserItemManager_EditingSectionIdentifier"));
      objc_msgSend(v32, "setItems:", v22);
      _HULocalizedStringWithDefaultValue(CFSTR("HUAllowAccessSectionTitle"), CFSTR("HUAllowAccessSectionTitle"), 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      _HULocalizedStringWithDefaultValue(CFSTR("HUUsersAllowEditingFooter"), CFSTR("HUUsersAllowEditingFooter"), 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUEditUserItemManager homeScheduleItem](self, "homeScheduleItem");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v4, "containsObject:", v35);

      if (v36)
      {
        HFLocalizedString();
        v37 = objc_claimAutoreleasedReturnValue();

        _HULocalizedStringWithDefaultValue(CFSTR("HURestrictedGuestScheduleUserSettings_SectionFooter_Title"), CFSTR("HURestrictedGuestScheduleUserSettings_SectionFooter_Title"), 1);
        v38 = objc_claimAutoreleasedReturnValue();

        v34 = (void *)v38;
        v33 = (void *)v37;
      }
      objc_msgSend(v32, "setHeaderTitle:", v33);
      objc_msgSend(v32, "setFooterTitle:", v34);
      objc_msgSend(v5, "addObject:", v32);

    }
  }
  v39 = objc_alloc(MEMORY[0x1E0C99E60]);
  -[HUEditUserItemManager camerasItem](self, "camerasItem");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v108 = v40;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v108, 1);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)objc_msgSend(v39, "initWithArray:", v41);
  v43 = objc_msgSend(v4, "intersectsSet:", v42);

  if (v43)
  {
    -[HUEditUserItemManager camerasItem](self, "camerasItem");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v4, "containsObject:", v44);

    if (v45)
    {
      v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUEditUserItemManager_AccessLevelSectionIdentifier"));
      -[HUEditUserItemManager camerasItem](self, "camerasItem");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v107 = v47;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v107, 1);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setItems:", v48);

      objc_msgSend(v5, "addObject:", v46);
    }
  }
  -[HUEditUserItemManager locksItem](self, "locksItem");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v4, "containsObject:", v49);

  if (v50)
  {
    v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUEditUserItemManager_AccessoriesSectionIdentifier"));
    -[HUEditUserItemManager locksItem](self, "locksItem");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = v52;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v106, 1);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setItems:", v53);

    objc_msgSend(v5, "addObject:", v51);
  }
  -[HUEditUserItemManager allowedAccessoryCategoryItemProvider](self, "allowedAccessoryCategoryItemProvider");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "items");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v4, "intersectsSet:", v55);

  if (v56)
  {
    v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUEditUserItemManager_AccessoriesSectionIdentifier"));
    -[HUEditUserItemManager allowedAccessoryCategoryItemProvider](self, "allowedAccessoryCategoryItemProvider");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "items");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "allObjects");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D314B0], "defaultItemComparator");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "sortedArrayUsingComparator:", v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setItems:", v62);

    objc_msgSend(v5, "addObject:", v57);
  }
  -[HUEditUserItemManager userSettingsItemModule](self, "userSettingsItemModule");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "buildSectionsWithDisplayedItems:", v4);
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v63) = -[HUEditUserItemManager _isVoiceIDEnabled:](self, "_isVoiceIDEnabled:", v64);
  v65 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__HUEditUserItemManager__buildSectionsWithDisplayedItems___block_invoke;
  aBlock[3] = &unk_1E6F4E6C0;
  aBlock[4] = self;
  v66 = v4;
  v102 = (char)v63;
  v100 = v66;
  v101 = a2;
  v67 = _Block_copy(aBlock);
  -[HUEditUserItemManager homeForUser](self, "homeForUser");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "accessories");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = objc_msgSend(v69, "na_any:", &__block_literal_global_132_0);

  v97[0] = v65;
  v97[1] = 3221225472;
  v97[2] = __58__HUEditUserItemManager__buildSectionsWithDisplayedItems___block_invoke_2_133;
  v97[3] = &unk_1E6F4E708;
  v97[4] = self;
  v98 = v70;
  objc_msgSend(v64, "na_filter:", v97);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "na_map:", v67);
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v72, "sortedArrayUsingComparator:", &__block_literal_global_137);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v73);

  if (-[HUEditUserItemManager _hasTVViewingProfilesDevice](self, "_hasTVViewingProfilesDevice"))
  {
    -[HUEditUserItemManager tvViewingProfilesItem](self, "tvViewingProfilesItem");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = objc_msgSend(v66, "containsObject:", v74);

    if (v75)
    {
      v76 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUEditUserItemManager_TVViewingProfilesSectionIdentifier"));
      -[HUEditUserItemManager tvViewingProfilesItem](self, "tvViewingProfilesItem");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v105 = v77;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v105, 1);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "setItems:", v78);

      objc_msgSend(v5, "addObject:", v76);
    }
  }
  -[HUEditUserItemManager mediaServiceItemModule](self, "mediaServiceItemModule");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "buildSectionsWithDisplayedItems:", v66);
  v80 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addObjectsFromArray:", v80);
  -[HUEditUserItemManager pendingAccessoriesItem](self, "pendingAccessoriesItem");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = objc_msgSend(v66, "containsObject:", v81);

  if (v82)
  {
    v83 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUEditUserItemManager_PendingAccessoriesSectionIdentifier"));
    _HULocalizedStringWithDefaultValue(CFSTR("HUUsersTableSectionPendingAccessories"), CFSTR("HUUsersTableSectionPendingAccessories"), 1);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "setHeaderTitle:", v84);

    _HULocalizedStringWithDefaultValue(CFSTR("HUUsersPendingAccessoriesFooter"), CFSTR("HUUsersPendingAccessoriesFooter"), 1);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "setFooterTitle:", v85);

    -[HUEditUserItemManager pendingAccessoriesItem](self, "pendingAccessoriesItem");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = v86;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v104, 1);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "setItems:", v87);

    objc_msgSend(v5, "addObject:", v83);
  }
  -[HUEditUserItemManager removeItem](self, "removeItem");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = objc_msgSend(v66, "containsObject:", v88);

  if (v89)
  {
    v90 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUEditUserItemManager_ButtonSectionIdentifier"));
    -[HUEditUserItemManager removeItem](self, "removeItem");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v103 = v91;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v103, 1);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "setItems:", v92);

    objc_msgSend(v5, "addObject:", v90);
  }
  v96[0] = MEMORY[0x1E0C809B0];
  v96[1] = 3221225472;
  v96[2] = __58__HUEditUserItemManager__buildSectionsWithDisplayedItems___block_invoke_4_142;
  v96[3] = &unk_1E6F4E770;
  v96[4] = self;
  objc_msgSend(v5, "sortedArrayUsingComparator:", v96);
  v93 = (void *)objc_claimAutoreleasedReturnValue();

  return v93;
}

id __58__HUEditUserItemManager__buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t i;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  int v64;
  void *v65;
  int v66;
  NSObject *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t j;
  void *v78;
  void *v79;
  id v80;
  void *v81;
  id v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _QWORD v91[4];
  id v92;
  _QWORD v93[5];
  _BYTE v94[128];
  _BYTE buf[12];
  __int16 v96;
  void *v97;
  __int16 v98;
  int v99;
  __int16 v100;
  int v101;
  _BYTE v102[128];
  _QWORD v103[4];

  v103[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "headerTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUSiriSectionTitle"), CFSTR("HUSiriSectionTitle"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", v5))
    v6 = (id)objc_msgSend(v3, "mutableCopy");
  else
    v6 = 0;

  objc_msgSend(*(id *)(a1 + 32), "_updateSiriSectionFooterForSection:", v6);
  if (!objc_msgSend(*(id *)(a1 + 32), "_hasPersonalRequestsDevice"))
    goto LABEL_27;
  v7 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "personalRequestsItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v7, "containsObject:", v8);

  if (!(_DWORD)v7)
    goto LABEL_27;
  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(v3, "headerTitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _HULocalizedStringWithDefaultValue(CFSTR("HUSiriSectionTitle"), CFSTR("HUSiriSectionTitle"), 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqualToString:", v10);

    if (v11)
    {
      v12 = objc_alloc(MEMORY[0x1E0D31570]);
      objc_msgSend(v3, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v12, "initWithIdentifier:", v13);

      v15 = (void *)MEMORY[0x1E0C99DE8];
      objc_msgSend(v3, "items");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "arrayWithArray:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "personalRequestsItem");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObject:", v18);

      _HULocalizedStringWithDefaultValue(CFSTR("HUSiriSectionTitle"), CFSTR("HUSiriSectionTitle"), 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setHeaderTitle:", v19);

      objc_msgSend(v14, "setFooterTitle:", 0);
      objc_msgSend(*(id *)(a1 + 32), "_updateSiriSectionFooterForSection:", v14);
      objc_msgSend(v14, "setItems:", v17);

      v6 = v14;
LABEL_16:
      if (v6)
      {
        objc_msgSend(v6, "headerTitle");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        _HULocalizedStringWithDefaultValue(CFSTR("HUSiriSectionTitle"), CFSTR("HUSiriSectionTitle"), 1);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = objc_msgSend(v49, "isEqualToString:", v50);

        if (v51)
        {
          v81 = v6;
          v82 = v3;
          v89 = 0u;
          v90 = 0u;
          v87 = 0u;
          v88 = 0u;
          objc_msgSend(v6, "items");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v87, v102, 16);
          if (v53)
          {
            v54 = v53;
            v55 = *(_QWORD *)v88;
            v56 = *MEMORY[0x1E0D30D50];
            v57 = MEMORY[0x1E0C9AAB0];
            do
            {
              for (i = 0; i != v54; ++i)
              {
                if (*(_QWORD *)v88 != v55)
                  objc_enumerationMutation(v52);
                v59 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * i);
                v60 = (void *)objc_opt_new();
                objc_msgSend(v60, "setObject:forKeyedSubscript:", v57, v56);
                v61 = (id)objc_msgSend(v59, "updateWithOptions:", v60);

              }
              v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v87, v102, 16);
            }
            while (v54);
          }

          objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "homeManager");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = objc_msgSend(v63, "hasOptedToHH2");

          if (v64)
          {
            objc_msgSend(*(id *)(a1 + 32), "homeForUser");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            v66 = objc_msgSend(v65, "hf_hasReachableResidents") ^ 1;

          }
          else
          {
            v66 = 0;
          }
          HFLogForCategory();
          v68 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
          {
            v69 = *(_QWORD *)(a1 + 32);
            NSStringFromSelector(*(SEL *)(a1 + 48));
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413058;
            *(_QWORD *)&buf[4] = v69;
            v96 = 2112;
            v97 = v70;
            v98 = 1024;
            v99 = v64;
            v100 = 1024;
            v101 = v66;
            _os_log_impl(&dword_1B8E1E000, v68, OS_LOG_TYPE_DEFAULT, "%@:%@: hasOptedToHH2 %{BOOL}d, shouldDisableVoiceIDSetting = %{BOOL}d", buf, 0x22u);

          }
          if ((objc_msgSend(*(id *)(a1 + 32), "isUserBeingEditedTheDeviceUser") ^ 1 | v66) == 1)
          {
            v85 = 0u;
            v86 = 0u;
            v83 = 0u;
            v84 = 0u;
            objc_msgSend(v81, "items");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            v72 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v83, v94, 16);
            if (v72)
            {
              v73 = v72;
              v74 = *(_QWORD *)v84;
              v75 = *MEMORY[0x1E0D30C80];
              v76 = MEMORY[0x1E0C9AAB0];
              do
              {
                for (j = 0; j != v73; ++j)
                {
                  if (*(_QWORD *)v84 != v74)
                    objc_enumerationMutation(v71);
                  v78 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * j);
                  v79 = (void *)objc_opt_new();
                  objc_msgSend(v79, "setObject:forKeyedSubscript:", v76, v75);
                  v80 = (id)objc_msgSend(v78, "updateWithOptions:", v79);

                }
                v73 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v83, v94, 16);
              }
              while (v73);
            }

          }
          v6 = v81;
          v25 = v6;
          v3 = v82;
          goto LABEL_28;
        }
      }
LABEL_27:
      v25 = v3;
      goto LABEL_28;
    }
  }
  objc_msgSend(v3, "headerTitle");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  HFLocalizedString();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v20, "isEqualToString:", v21);

  if (!v22)
    goto LABEL_16;
  v23 = objc_alloc(MEMORY[0x1E0D31570]);
  objc_msgSend(v3, "identifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (id)objc_msgSend(v23, "initWithIdentifier:", v24);

  objc_msgSend(v3, "items");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = MEMORY[0x1E0C809B0];
  v93[0] = MEMORY[0x1E0C809B0];
  v93[1] = 3221225472;
  v93[2] = __58__HUEditUserItemManager__buildSectionsWithDisplayedItems___block_invoke_2;
  v93[3] = &unk_1E6F4DAD8;
  v93[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v26, "na_filter:", v93);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setItems:", v28);

  objc_msgSend(*(id *)(a1 + 32), "updateListeningHistoryItem");
  v29 = objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    v30 = (void *)v29;
    v31 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "updateListeningHistoryItem");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v31) = objc_msgSend(v31, "containsObject:", v32);

    if ((_DWORD)v31)
    {
      v33 = (void *)MEMORY[0x1E0C99DE8];
      objc_msgSend(v25, "items");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "arrayWithArray:", v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "updateListeningHistoryItem");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "addObject:", v36);

      objc_msgSend(v25, "setItems:", v35);
    }
  }
  objc_msgSend(v3, "headerTitle");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setHeaderTitle:", v37);

  objc_msgSend(v25, "items");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v91[0] = v27;
  v91[1] = 3221225472;
  v91[2] = __58__HUEditUserItemManager__buildSectionsWithDisplayedItems___block_invoke_3;
  v91[3] = &unk_1E6F4DAD8;
  v92 = *(id *)(a1 + 40);
  v39 = objc_msgSend(v38, "na_any:", v91);

  if (v39)
  {
    HFLocalizedString();
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    HFLocalizedString();
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_alloc(MEMORY[0x1E0CB3778]);
    objc_msgSend(v40, "stringByAppendingString:", CFSTR(" "));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = (void *)objc_msgSend(v42, "initWithString:", v43);

    v45 = objc_alloc(MEMORY[0x1E0CB3498]);
    v103[0] = *MEMORY[0x1E0CEA0C0];
    objc_msgSend(MEMORY[0x1E0D31970], "musicPrivacyURL");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = v46;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v103, 1);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = (void *)objc_msgSend(v45, "initWithString:attributes:", v41, v47);
    objc_msgSend(v44, "appendAttributedString:", v48);

    objc_msgSend(v25, "setAttributedFooterTitle:", v44);
  }

LABEL_28:
  return v25;
}

uint64_t __58__HUEditUserItemManager__buildSectionsWithDisplayedItems___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  unsigned int v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  unsigned int v17;
  uint64_t v18;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (_os_feature_enabled_impl())
  {
    v7 = 1;
    if (objc_msgSend(*(id *)(a1 + 32), "_shouldShowBoltUI") && v6)
    {
      objc_msgSend(v6, "settingKeyPath");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D30730]);

      v7 = v9 ^ 1;
    }
  }
  else
  {
    v7 = 1;
  }
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    objc_msgSend(v6, "settingKeyPath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D30718]);

    v7 &= ~v11;
  }
  if (v6)
  {
    objc_msgSend(v6, "settingKeyPath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0D30720]);

    v7 &= ~v13;
  }
  objc_msgSend(v6, "settingKeyPath");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0D30768]))
  {

  }
  else
  {
    objc_msgSend(v6, "settingKeyPath");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0D30738]);

    v17 = v7;
    if (!v16)
      goto LABEL_17;
  }
  v17 = 0;
LABEL_17:
  if (v6)
    v18 = v17;
  else
    v18 = v7;

  return v18;
}

uint64_t __58__HUEditUserItemManager__buildSectionsWithDisplayedItems___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    objc_msgSend(v6, "settingKeyPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D30730]))
      v8 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v6);
    else
      v8 = 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __58__HUEditUserItemManager__buildSectionsWithDisplayedItems___block_invoke_131(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "supportsUserMediaSettings");
}

uint64_t __58__HUEditUserItemManager__buildSectionsWithDisplayedItems___block_invoke_2_133(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "userBeingEdited");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "hf_userIsRestrictedGuest:", v5);

  if ((v6 & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v3, "headerTitle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    HFLocalizedString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqualToString:", v9);

    if (_os_feature_enabled_impl() && *(_BYTE *)(a1 + 40))
      v7 = 1;
    else
      v7 = v10 ^ 1u;
  }

  return v7;
}

uint64_t __58__HUEditUserItemManager__buildSectionsWithDisplayedItems___block_invoke_3_135(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HUAccessorySettingsItemModuleSortKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("HUAccessorySettingsItemModuleSortKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "compare:", v8);

  return v9;
}

uint64_t __58__HUEditUserItemManager__buildSectionsWithDisplayedItems___block_invoke_4_142(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v5 = a3;
  objc_msgSend(a2, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(*(id *)(a1 + 32), "isUserBeingEditedTheDeviceUser");
  v9 = *(void **)(a1 + 32);
  if (v8)
    objc_msgSend(v9, "sectionOrderArrayWhenViewingSelf");
  else
    objc_msgSend(v9, "sectionOrderArrayWhenViewingOther");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "indexOfObject:", v6);
  v12 = objc_msgSend(v10, "indexOfObject:", v7);
  v13 = -1;
  v14 = 1;
  if (v11 < v12)
    v15 = -1;
  else
    v15 = 1;
  if (v12 != 0x7FFFFFFFFFFFFFFFLL)
    v14 = v15;
  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
    v13 = v14;
  if (v11 == v12)
    v16 = 0;
  else
    v16 = v13;

  return v16;
}

- (id)_itemsToHideInSet:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;
  SEL v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)HUEditUserItemManager;
  v5 = a3;
  -[HFItemManager _itemsToHideInSet:](&v15, sel__itemsToHideInSet_, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __43__HUEditUserItemManager__itemsToHideInSet___block_invoke;
  v12[3] = &unk_1E6F4E798;
  v12[4] = self;
  v14 = a2;
  v8 = v7;
  v13 = v8;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v12);

  v9 = v13;
  v10 = v8;

  return v10;
}

void __43__HUEditUserItemManager__itemsToHideInSet___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  NSObject *v10;
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
  char v21;
  uint64_t v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "latestResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0D30148];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D30148]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D30780]);

  if (!v7)
  {
    objc_msgSend(v3, "latestResults");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", v5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isEqualToString:", *MEMORY[0x1E0D30728]);

    if (!v19)
      goto LABEL_9;
    goto LABEL_7;
  }
  objc_msgSend(*(id *)(a1 + 32), "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hf_hasRMVCapableAppleTV");

  HFLogForCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v22 = *(_QWORD *)(a1 + 32);
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "home");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "home");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "currentUser");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "hf_prettyDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "homeForUser");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413570;
    v24 = v22;
    v25 = 2112;
    v26 = v11;
    v27 = 2112;
    v28 = v12;
    v29 = 2112;
    v30 = v15;
    v31 = 1024;
    v32 = v9;
    v33 = 1024;
    v34 = objc_msgSend(v16, "hf_hasHomePods");
    _os_log_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_DEFAULT, "%@:%@ Home = %@ currentUser = %@ shouldShowRMVSettingInHome = %{BOOL}d [self.homeForUser hf_hasHomePods] = %{BOOL}d", buf, 0x36u);

  }
  if ((v9 & 1) == 0)
  {
LABEL_7:
    objc_msgSend(*(id *)(a1 + 32), "homeForUser");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "hf_hasHomePods");

    if ((v21 & 1) == 0)
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
  }
LABEL_9:

}

- (void)_registerForExternalUpdates
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUEditUserItemManager;
  -[HFItemManager _registerForExternalUpdates](&v4, sel__registerForExternalUpdates);
  -[HUEditUserItemManager mediaServiceItemModule](self, "mediaServiceItemModule");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerForExternalUpdates");

}

- (void)_unregisterForExternalUpdates
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUEditUserItemManager;
  -[HFItemManager _unregisterForExternalUpdates](&v4, sel__unregisterForExternalUpdates);
  -[HUEditUserItemManager mediaServiceItemModule](self, "mediaServiceItemModule");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterForExternalUpdates");

}

- (BOOL)_isRemoteAccessAllowedForUser:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HFItemManager home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "homeAccessControlForUser:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v6, "isRemoteAccessAllowed");
  return (char)v4;
}

- (BOOL)_isEditingAllowedForUser:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HFItemManager home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "homeAccessControlForUser:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v6, "isAdministrator");
  return (char)v4;
}

- (BOOL)_isUserOwner:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HFItemManager home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "homeAccessControlForUser:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v6, "isOwner");
  return (char)v4;
}

- (BOOL)_hasResidentDevice
{
  void *v3;
  char v4;
  void *v5;

  -[HFItemManager home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "hf_supportsRemoteAccessRestrictions") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[HFItemManager home](self, "home");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "hf_supportsPerUserRemoteAccess");

  }
  return v4;
}

- (BOOL)_hasPersonalRequestsDevice
{
  void *v2;
  void *v3;
  char v4;

  -[HFItemManager home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_mediaAccessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "na_any:", &__block_literal_global_151);

  return v4;
}

uint64_t __51__HUEditUserItemManager__hasPersonalRequestsDevice__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CBA358], "isAccessorySupported:", a2);
}

- (BOOL)_hasTVViewingProfilesDevice
{
  void *v2;
  void *v3;
  BOOL v4;

  -[HFItemManager home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_tvViewingProfilesAccessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (BOOL)_hasPendingAccessories
{
  void *v2;
  void *v3;

  -[HUEditUserItemManager userBeingEdited](self, "userBeingEdited");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pendingAccessoryInvitations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "na_any:", &__block_literal_global_154);
  return (char)v2;
}

BOOL __47__HUEditUserItemManager__hasPendingAccessories__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "state") != 1;
}

- (BOOL)_canModifyUserBeingEditedPermissions
{
  void *v3;
  void *v4;
  BOOL v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;

  -[HFItemManager home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentUser");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HUEditUserItemManager _isUserOwner:](self, "_isUserOwner:", v4))
  {
    v5 = -[HUEditUserItemManager isUserBeingEditedTheDeviceUser](self, "isUserBeingEditedTheDeviceUser");

    if (!v5)
    {
      LOBYTE(v6) = 1;
      return v6;
    }
  }
  else
  {

  }
  -[HFItemManager home](self, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentUser");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HUEditUserItemManager _isEditingAllowedForUser:](self, "_isEditingAllowedForUser:", v8))
  {
    -[HUEditUserItemManager userBeingEdited](self, "userBeingEdited");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = !-[HUEditUserItemManager _isEditingAllowedForUser:](self, "_isEditingAllowedForUser:", v9);

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)_isPersonalRequestsEnabledForUser
{
  void *v3;
  void *v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[HFItemManager home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentUser");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HUEditUserItemManager _isUserOwner:](self, "_isUserOwner:", v4);

  -[HUEditUserItemManager userBeingEdited](self, "userBeingEdited");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager home](self, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assistantAccessControlForHome:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUEditUserItemManager supportedMULanguageCodes](self, "supportedMULanguageCodes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend(v8, "hf_effectivelyEnabledForSupportedVoiceRecognitionLanguages:currentUserIsOwner:", v9, v5);

  return (char)v6;
}

- (BOOL)_isTVViewingProfilesEnabledForUser
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HUEditUserItemManager userBeingEdited](self, "userBeingEdited");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mediaContentProfileAccessControlForHome:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "accessories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v6, "count") != 0;

  return (char)v3;
}

- (BOOL)_isVoiceIDEnabled:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = a3;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v32;
    v7 = *MEMORY[0x1E0D30780];
    v8 = *MEMORY[0x1E0D30750];
    v23 = *MEMORY[0x1E0D30780];
    v24 = *(_QWORD *)v32;
    do
    {
      v9 = 0;
      v25 = v4;
      do
      {
        if (*(_QWORD *)v32 != v6)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v9);
        objc_msgSend(v10, "identifier", v23, v24);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v7);

        if (v12)
        {
          v29 = 0u;
          v30 = 0u;
          v27 = 0u;
          v28 = 0u;
          objc_msgSend(v10, "items");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v28;
            do
            {
              for (i = 0; i != v15; ++i)
              {
                if (*(_QWORD *)v28 != v16)
                  objc_enumerationMutation(v13);
                v18 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
                objc_msgSend(v18, "settingKeyPath");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v20 = objc_msgSend(v19, "isEqualToString:", v8);

                if (v20)
                {
                  objc_msgSend(v18, "value");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  v5 = objc_msgSend(v21, "BOOLValue");

                }
              }
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
            }
            while (v15);
          }

          v7 = v23;
          v6 = v24;
          v4 = v25;
        }
        ++v9;
      }
      while (v9 != v4);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5 & 1;
}

- (BOOL)_shouldShowBoltUI
{
  void *v3;
  void *v4;
  char v5;

  if (!-[HUEditUserItemManager isUserBeingEditedTheDeviceUser](self, "isUserBeingEditedTheDeviceUser"))
    return 0;
  -[HUEditUserItemManager userSettingsItemModule](self, "userSettingsItemModule");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[HFItemManager home](self, "home");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "hf_hasHomePods");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_updateSiriSectionFooterForSection:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v4 = a3;
  _HULocalizedStringWithDefaultValue(CFSTR("HUSiriSectionFooter_RecognizeMyVoice"), CFSTR("HUSiriSectionFooter_RecognizeMyVoice"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0D31988]);
  -[HFItemManager home](self, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUEditUserItemManager userBeingEdited](self, "userBeingEdited");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithHome:user:nameStyle:", v7, v8, 0);

  if (objc_msgSend(v9, "isIdentifyVoiceEnabled"))
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__3;
    v22 = __Block_byref_object_dispose__3;
    _HULocalizedStringWithDefaultValue(CFSTR("HUSiriSectionFooter_PersonalRequests_UnknownDevice"), CFSTR("HUSiriSectionFooter_PersonalRequests_UnknownDevice"), 1);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    if (-[HUEditUserItemManager isUserBeingEditedTheDeviceUser](self, "isUserBeingEditedTheDeviceUser"))
    {
      -[HUEditUserItemManager locationDeviceManager](self, "locationDeviceManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "activeLocationDeviceFuture");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __60__HUEditUserItemManager__updateSiriSectionFooterForSection___block_invoke;
      v14[3] = &unk_1E6F4E820;
      v17 = &v18;
      v15 = v4;
      v16 = v5;
      v12 = (id)objc_msgSend(v11, "addCompletionBlock:", v14);

      v13 = v15;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v5, v19[5]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setFooterTitle:", v13);
    }

    _Block_object_dispose(&v18, 8);
  }
  else
  {
    objc_msgSend(v4, "setFooterTitle:", v5);
  }

}

void __60__HUEditUserItemManager__updateSiriSectionFooterForSection___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  if (!a3)
  {
    objc_msgSend(a2, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    HULocalizedStringWithFormat(CFSTR("HUSiriSectionFooter_PersonalRequests"), CFSTR("%@"), v5, v6, v7, v8, v9, v10, (uint64_t)v4);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setFooterTitle:", v14);

}

- (HFItem)homeScheduleItem
{
  return self->_homeScheduleItem;
}

- (void)setHomeScheduleItem:(id)a3
{
  objc_storeStrong((id *)&self->_homeScheduleItem, a3);
}

- (HFItem)localAccessItem
{
  return self->_localAccessItem;
}

- (void)setLocalAccessItem:(id)a3
{
  objc_storeStrong((id *)&self->_localAccessItem, a3);
}

- (HFItem)remoteAccessItem
{
  return self->_remoteAccessItem;
}

- (void)setRemoteAccessItem:(id)a3
{
  objc_storeStrong((id *)&self->_remoteAccessItem, a3);
}

- (HFItem)allowEditingItem
{
  return self->_allowEditingItem;
}

- (void)setAllowEditingItem:(id)a3
{
  objc_storeStrong((id *)&self->_allowEditingItem, a3);
}

- (HFItem)camerasItem
{
  return self->_camerasItem;
}

- (void)setCamerasItem:(id)a3
{
  objc_storeStrong((id *)&self->_camerasItem, a3);
}

- (HFItem)locksItem
{
  return self->_locksItem;
}

- (void)setLocksItem:(id)a3
{
  objc_storeStrong((id *)&self->_locksItem, a3);
}

- (HFItem)pendingAccessoriesItem
{
  return self->_pendingAccessoriesItem;
}

- (void)setPendingAccessoriesItem:(id)a3
{
  objc_storeStrong((id *)&self->_pendingAccessoriesItem, a3);
}

- (HFItem)personalRequestsItem
{
  return self->_personalRequestsItem;
}

- (void)setPersonalRequestsItem:(id)a3
{
  objc_storeStrong((id *)&self->_personalRequestsItem, a3);
}

- (HFItem)personalRequestsFooterItem
{
  return self->_personalRequestsFooterItem;
}

- (HFItem)tvViewingProfilesItem
{
  return self->_tvViewingProfilesItem;
}

- (void)setTvViewingProfilesItem:(id)a3
{
  objc_storeStrong((id *)&self->_tvViewingProfilesItem, a3);
}

- (HUAccessorySettingsItemModule)userSettingsItemModule
{
  return self->_userSettingsItemModule;
}

- (void)setUserSettingsItemModule:(id)a3
{
  objc_storeStrong((id *)&self->_userSettingsItemModule, a3);
}

- (HFItem)updateListeningHistoryItem
{
  return self->_updateListeningHistoryItem;
}

- (void)setUpdateListeningHistoryItem:(id)a3
{
  objc_storeStrong((id *)&self->_updateListeningHistoryItem, a3);
}

- (HUMediaServiceSettingsItemModule)mediaServiceItemModule
{
  return self->_mediaServiceItemModule;
}

- (void)setMediaServiceItemModule:(id)a3
{
  objc_storeStrong((id *)&self->_mediaServiceItemModule, a3);
}

- (HFTransformItemProvider)allowedAccessoryCategoryItemProvider
{
  return self->_allowedAccessoryCategoryItemProvider;
}

- (void)setAllowedAccessoryCategoryItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_allowedAccessoryCategoryItemProvider, a3);
}

- (NSArray)supportedMULanguageCodes
{
  return self->_supportedMULanguageCodes;
}

- (void)setSupportedMULanguageCodes:(id)a3
{
  objc_storeStrong((id *)&self->_supportedMULanguageCodes, a3);
}

- (HMHome)homeForUser
{
  return self->_homeForUser;
}

- (void)setHomeForUser:(id)a3
{
  objc_storeStrong((id *)&self->_homeForUser, a3);
}

- (HFItem)removeItem
{
  return self->_removeItem;
}

- (void)setRemoveItem:(id)a3
{
  objc_storeStrong((id *)&self->_removeItem, a3);
}

- (NSArray)sectionOrderArrayWhenViewingSelf
{
  return self->_sectionOrderArrayWhenViewingSelf;
}

- (void)setSectionOrderArrayWhenViewingSelf:(id)a3
{
  objc_storeStrong((id *)&self->_sectionOrderArrayWhenViewingSelf, a3);
}

- (NSArray)sectionOrderArrayWhenViewingOther
{
  return self->_sectionOrderArrayWhenViewingOther;
}

- (void)setSectionOrderArrayWhenViewingOther:(id)a3
{
  objc_storeStrong((id *)&self->_sectionOrderArrayWhenViewingOther, a3);
}

- (HULocationDeviceManager)locationDeviceManager
{
  return self->_locationDeviceManager;
}

- (void)setLocationDeviceManager:(id)a3
{
  objc_storeStrong((id *)&self->_locationDeviceManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationDeviceManager, 0);
  objc_storeStrong((id *)&self->_sectionOrderArrayWhenViewingOther, 0);
  objc_storeStrong((id *)&self->_sectionOrderArrayWhenViewingSelf, 0);
  objc_storeStrong((id *)&self->_removeItem, 0);
  objc_storeStrong((id *)&self->_homeForUser, 0);
  objc_storeStrong((id *)&self->_supportedMULanguageCodes, 0);
  objc_storeStrong((id *)&self->_allowedAccessoryCategoryItemProvider, 0);
  objc_storeStrong((id *)&self->_mediaServiceItemModule, 0);
  objc_storeStrong((id *)&self->_updateListeningHistoryItem, 0);
  objc_storeStrong((id *)&self->_userSettingsItemModule, 0);
  objc_storeStrong((id *)&self->_tvViewingProfilesItem, 0);
  objc_storeStrong((id *)&self->_personalRequestsFooterItem, 0);
  objc_storeStrong((id *)&self->_personalRequestsItem, 0);
  objc_storeStrong((id *)&self->_pendingAccessoriesItem, 0);
  objc_storeStrong((id *)&self->_locksItem, 0);
  objc_storeStrong((id *)&self->_camerasItem, 0);
  objc_storeStrong((id *)&self->_allowEditingItem, 0);
  objc_storeStrong((id *)&self->_remoteAccessItem, 0);
  objc_storeStrong((id *)&self->_localAccessItem, 0);
  objc_storeStrong((id *)&self->_homeScheduleItem, 0);
}

@end

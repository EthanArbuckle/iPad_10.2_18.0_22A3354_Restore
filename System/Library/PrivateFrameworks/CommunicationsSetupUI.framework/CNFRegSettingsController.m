@implementation CNFRegSettingsController

- (CNFRegSettingsController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  id v7;
  CNFRegSettingsController *v8;
  CNFRegSettingsController *v9;
  id v10;
  id v11;
  void *v12;
  CFStringEncoding SystemEncoding;
  const char *CStringPtr;
  id v15;
  NSObject *v16;
  _QWORD handler[4];
  id v19;
  id location;
  objc_super v21;
  uint8_t buf[4];
  CNFRegSettingsController *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)CNFRegSettingsController;
  v8 = -[CNFRegSettingsController initWithNibName:bundle:](&v21, sel_initWithNibName_bundle_, v6, v7);
  v9 = v8;
  if (v8)
  {
    *(_BYTE *)&v8->_settingsFlags |= 8u;
    -[CNFRegListController _updateTitle](v8, "_updateTitle");
    v10 = (id)objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
    v11 = (id)objc_msgSend(MEMORY[0x24BE30340], "sharedInstance");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v9, sel_handleCallStatusChanged, *MEMORY[0x24BEB4AD0], 0);
    objc_msgSend(v12, "addObserver:selector:name:object:", v9, sel_handleCallStatusChanged, *MEMORY[0x24BEB4AB8], 0);
    objc_msgSend(v12, "addObserver:selector:name:object:", v9, sel__handleFaceTimeCTRegistrationStatusChanged, *MEMORY[0x24BE30300], 0);
    objc_msgSend(v12, "addObserver:selector:name:object:", v9, sel__handleFaceTimeEntitlementStatusChanged, *MEMORY[0x24BE30308], 0);
    objc_msgSend(v12, "addObserver:selector:name:object:", v9, sel__handleDeactivation_, *MEMORY[0x24BEBEA40], 0);
    objc_msgSend(v12, "addObserver:selector:name:object:", v9, sel__handleRelayCapabilitiesChanged, *MEMORY[0x24BEB4A88], 0);
    objc_msgSend(v12, "addObserver:selector:name:object:", v9, sel__handleThumperCapabilitiesChanged, *MEMORY[0x24BEB4A98], 0);
    objc_msgSend(v12, "addObserver:selector:name:object:", v9, sel__handleOutgoingRelayCallerIDChanged, *MEMORY[0x24BEB4A80], 0);
    objc_msgSend(v12, "addObserver:selector:name:object:", v9, sel__handleAccountRegistrarChanged, CFSTR("CNFAccountRegistarStateChangedNotification"), 0);
    SystemEncoding = CFStringGetSystemEncoding();
    CStringPtr = CFStringGetCStringPtr((CFStringRef)*MEMORY[0x24BED2678], SystemEncoding);
    objc_initWeak(&location, v9);
    v15 = MEMORY[0x24BDAC9B8];
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __51__CNFRegSettingsController_initWithNibName_bundle___block_invoke;
    handler[3] = &unk_24D075AA8;
    objc_copyWeak(&v19, &location);
    notify_register_dispatch(CStringPtr, &v9->_captionsSubscriptionToken, MEMORY[0x24BDAC9B8], handler);

    OSLogHandleForIDSCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v9;
      _os_log_impl(&dword_2138BA000, v16, OS_LOG_TYPE_DEFAULT, "Instantiated CNFRegSettingsController %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      IMLogString();
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);

  }
  return v9;
}

void __51__CNFRegSettingsController_initWithNibName_bundle___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "refreshFaceTimeCaptionsSettingsAnimated:", 1);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:", self);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  notify_cancel(self->_captionsSubscriptionToken);
  v4.receiver = self;
  v4.super_class = (Class)CNFRegSettingsController;
  -[CNFRegListController dealloc](&v4, sel_dealloc);
}

- (BOOL)_hasActiveFaceTimeCall
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "anyCallPassesTest:", &__block_literal_global_6);

  return v3;
}

uint64_t __50__CNFRegSettingsController__hasActiveFaceTimeCall__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "provider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFaceTimeProvider");

  return v3;
}

- (BOOL)_shouldDisableAccountConfigurationUI
{
  void *v3;
  char v4;

  if (-[CNFRegSettingsController _hasActiveFaceTimeCall](self, "_hasActiveFaceTimeCall"))
    return 1;
  objc_msgSend(MEMORY[0x24BE30338], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "faceTimeBlocked");

  return v4;
}

- (PSSystemPolicyForApp)systemPolicy
{
  PSSystemPolicyForApp *systemPolicy;
  id v4;
  PSSystemPolicyForApp *v5;
  PSSystemPolicyForApp *v6;

  systemPolicy = self->_systemPolicy;
  if (!systemPolicy)
  {
    v4 = objc_alloc(MEMORY[0x24BE755E0]);
    v5 = (PSSystemPolicyForApp *)objc_msgSend(v4, "initWithBundleIdentifier:", *MEMORY[0x24BEB4A68]);
    v6 = self->_systemPolicy;
    self->_systemPolicy = v5;

    -[PSSystemPolicyForApp setDelegate:](self->_systemPolicy, "setDelegate:", self);
    systemPolicy = self->_systemPolicy;
  }
  return systemPolicy;
}

- (id)loadSpecifiersFromPlistName:(id)a3 target:(id)a4 bundle:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id *v17;
  void *v18;
  uint64_t v19;
  const __CFString *v20;
  __CFString *v21;
  id *v23;
  id v24;
  id v25;
  __CFString *v26;

  v25 = 0;
  v26 = 0;
  v8 = a5;
  v9 = a4;
  objc_msgSend(v8, "pathForResource:ofType:", a3, CFSTR("plist"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithContentsOfFile:", v10);
  v12 = (void *)objc_opt_new();
  CNFRegStringTableName();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = &v24;
  v24 = v12;
  SpecifiersFromPlist();
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = v24;
  v16 = v24;

  v17 = (id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE756C8]);
  if (*v17)
    objc_msgSend(*v17, "addObjectsFromArray:", v16, &v24);
  else
    objc_storeStrong(v17, v15);
  if (!v26)
  {
    -[CNFRegListController regController](self, "regController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "serviceType");

    v20 = CFSTR("com.apple.preferences.imessage");
    v21 = v26;
    if (!v19)
      v20 = CFSTR("com.apple.preferences.facetime");
    v26 = (__CFString *)v20;

  }
  -[CNFRegSettingsController setSpecifierID:](self, "setSpecifierID:", v26, v23);
  -[CNFRegSettingsController setTitle:](self, "setTitle:", v25);

  return v14;
}

- (id)specifierList
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  objc_class *v8;
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
  uint64_t v20;
  uint64_t *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  char v53;
  void *v54;
  void *v55;
  void *v56;
  NSArray *v57;
  NSArray *accountGroupSpecifiers;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t i;
  void *v67;
  id v68;
  NSObject *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  NSObject *v86;
  void *v87;
  uint64_t v88;
  void *v89;
  void *v90;
  NSArray *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t j;
  void *v95;
  void *v96;
  void *v97;
  NSArray *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t k;
  void *v102;
  void *v103;
  void *v104;
  uint64_t v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  int v112;
  void *v113;
  NSArray *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t m;
  NSObject *v118;
  NSArray *v119;
  NSObject *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t n;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  NSArray *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t ii;
  NSArray *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t jj;
  objc_class *v140;
  void *v141;
  void *v143;
  void *v144;
  void *v145;
  uint64_t v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  _QWORD v183[5];
  id v184;
  uint64_t v185;
  _BYTE v186[128];
  _BYTE v187[128];
  _BYTE v188[128];
  _BYTE v189[128];
  _BYTE v190[128];
  uint8_t v191[128];
  uint8_t buf[4];
  void *v193;
  _BYTE v194[128];
  uint64_t v195;
  NSRange v196;

  v195 = *MEMORY[0x24BDAC8D0];
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]);
  if (v3)
    return v3;
  v146 = (int)*MEMORY[0x24BE756E0];
  -[CNFRegSettingsController bundle](self, "bundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFRegSettingsController loadSpecifiersFromPlistName:target:bundle:](self, "loadSpecifiersFromPlistName:target:bundle:", CFSTR("ConferenceRegistrationSettings"), self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "specifierForID:", CFSTR("INCOMING_CALL_STYLE"));
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "specifierForID:", CFSTR("ANNOUNCE_CALLS"));
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (*(_BYTE *)&self->_settingsFlags & 8) == 0;
  objc_msgSend(v5, "specifierForID:", CFSTR("FACETIME_ENABLED_GROUP_ID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "removeObject:", v7);

    objc_msgSend(v5, "specifierForID:", CFSTR("FACETIME_ENABLED_ID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObject:", v7);
  }
  else
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setProperty:forKey:", v9, *MEMORY[0x24BE75A30]);

    CommunicationsSetupUIBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    CNFRegStringTableName();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("LEARN_MORE"), &stru_24D077260, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNFRegSettingsController _switchFooterText](self, "_switchFooterText");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(" %@"), v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringByAppendingString:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v196.location = objc_msgSend(v15, "rangeOfString:", v12);
    NSStringFromRange(v196);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setProperty:forKey:", v16, *MEMORY[0x24BE75A40]);

    objc_msgSend(v7, "setProperty:forKey:", v15, *MEMORY[0x24BE75A58]);
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", self);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setProperty:forKey:", v17, *MEMORY[0x24BE75A50]);

    NSStringFromSelector(sel__showPrivacySheet_);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setProperty:forKey:", v18, *MEMORY[0x24BE75A38]);

  }
  -[CNFRegListController regController](self, "regController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "serviceType");

  v21 = (uint64_t *)MEMORY[0x24BE75D50];
  if (v20)
  {
    objc_msgSend(v5, "specifierForID:", CFSTR("FACETIME_BLOCKLIST_GROUP_ID"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v22)
    {
      objc_msgSend(v22, "removePropertyForKey:", *MEMORY[0x24BE75B50]);
      objc_msgSend(v23, "removePropertyForKey:", *v21);
      objc_msgSend(v23, "setName:", 0);
    }

  }
  if (-[CNFRegSettingsController shouldShowSiriSpecifiers](self, "shouldShowSiriSpecifiers"))
  {
    -[CNFRegSettingsController systemPolicy](self, "systemPolicy");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "specifiersForPolicyOptions:force:", 8388609, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      if (v147)
      {
        objc_msgSend(v5, "removeObject:", v147);
        objc_msgSend(v5, "insertObject:atIndex:", v147, 0);
      }
      if (v148)
      {
        objc_msgSend(v5, "removeObject:", v148);
        objc_msgSend(v5, "insertObject:atIndex:", v148, 0);
      }
      objc_msgSend(v25, "arrayByAddingObjectsFromArray:", v5);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "mutableCopy");

      v5 = (void *)v27;
    }

  }
  if (!-[CNFRegSettingsController shouldShowCallDirectorySettingsBundleSpecifiers](self, "shouldShowCallDirectorySettingsBundleSpecifiers"))
  {
    objc_msgSend(v5, "specifierForID:", CFSTR("CALL_DIRECTORIES"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
      objc_msgSend(v5, "removeObject:", v28);

  }
  if (!-[CNFRegSettingsController shouldShowIncomingCallSettingsBundleSpecifiers](self, "shouldShowIncomingCallSettingsBundleSpecifiers"))
  {
    if (v148)
      objc_msgSend(v5, "removeObject:");
    if (v147)
      objc_msgSend(v5, "removeObject:");
    objc_msgSend(v5, "specifierForID:", CFSTR("CALL_PROVIDERS"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
      objc_msgSend(v5, "removeObject:", v29);

  }
  objc_msgSend(v5, "specifierForID:", CFSTR("FACETIME_ALIAS_GROUP_ID"));
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  if (v154)
  {
    CommunicationsSetupUIBundle();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    CNFStringKeyForIdiom(CFSTR("FACETIME_SETTINGS_ALIAS_LABEL"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    CNFRegStringTableName();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "localizedStringForKey:value:table:", v31, &stru_24D077260, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v154, "setProperty:forKey:", v33, *v21);
    objc_msgSend(v154, "setName:", v33);
    if (objc_msgSend(v33, "_isNaturallyRTL"))
      v34 = 2;
    else
      v34 = 0;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v154, "setProperty:forKey:", v35, *MEMORY[0x24BE75860]);

    if (-[NSArray count](self->_aliasGroupSpecifiers, "count") >= 2)
    {
      v36 = objc_msgSend(v5, "indexOfObject:", v154);
      if (v36 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v37 = v36;
        if (-[NSArray count](self->_aliasGroupSpecifiers, "count") >= 2)
        {
          v38 = 1;
          do
          {
            -[NSArray objectAtIndexedSubscript:](self->_aliasGroupSpecifiers, "objectAtIndexedSubscript:", v38);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "insertObject:atIndex:", v39, v37 + v38);

            ++v38;
          }
          while (v38 < -[NSArray count](self->_aliasGroupSpecifiers, "count"));
        }
      }
    }

  }
  objc_msgSend(v5, "specifierForID:", CFSTR("FACETIME_ACCOUNT_GROUP_ID"));
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CNFRegSettingsController hideAppleIDLogin](self, "hideAppleIDLogin"))
  {
LABEL_40:
    objc_msgSend(v5, "removeObject:", v151);
    goto LABEL_45;
  }
  if (v151)
  {
    v40 = objc_msgSend(v5, "indexOfObject:", v151);
    if (v40 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v41 = v40;
      -[CNFRegSettingsController accountToShowInCallerIDFooter](self, "accountToShowInCallerIDFooter");
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v42)
      {
        -[CNFRegSettingsController createSpecifierForAccount:](self, "createSpecifierForAccount:", 0);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "insertObject:atIndex:", v43, v41 + 1);

        goto LABEL_45;
      }
      goto LABEL_40;
    }
  }
LABEL_45:
  objc_msgSend(v5, "specifierForID:", CFSTR("FACETIME_CALLERID_GROUP_ID"));
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  if (v149)
  {
    v44 = objc_msgSend(v5, "indexOfObject:", v149);
    if (v44 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v45 = v44;
      -[CNFRegSettingsController possibleCallerIdAliases](self, "possibleCallerIdAliases");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v183[0] = MEMORY[0x24BDAC760];
      v183[1] = 3221225472;
      v183[2] = __41__CNFRegSettingsController_specifierList__block_invoke;
      v183[3] = &unk_24D075B10;
      v183[4] = self;
      v184 = v5;
      v185 = v45 + 1;
      objc_msgSend(v46, "enumerateObjectsWithOptions:usingBlock:", 2, v183);

    }
  }
  -[CNFRegSettingsController _buildSpecifierCache:](self, "_buildSpecifierCache:", v5);
  if (v154)
  {
    -[CNFRegListController regController](self, "regController");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFRegListController regController](self, "regController");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "accounts");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "aliasesForAccounts:", v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNFRegListController regController](self, "regController");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "usableDeviceAliases");
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[CNFRegSettingsController showDeviceAliases](self, "showDeviceAliases"))
    {
      v53 = 1;
    }
    else
    {
      -[CNFRegListController regController](self, "regController");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v54, "serviceType"))
      {
        v53 = 1;
      }
      else
      {
        -[CNFRegListController regController](self, "regController");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = objc_msgSend(v55, "isServiceEnabled");

      }
    }
    -[CNFRegListController regController](self, "regController");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v56, "serviceSupportsDeviceAliasEnablement"))
    {
      if (!objc_msgSend(v52, "count"))
        v53 = 0;
    }
    else
    {
      v53 = 0;
    }

    if (!objc_msgSend(v50, "count") && (v53 & 1) == 0)
      objc_msgSend(v5, "removeObject:", v154);

  }
  if (!-[NSArray count](self->_accountGroupSpecifiers, "count"))
  {
    v57 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v151, 0);
    accountGroupSpecifiers = self->_accountGroupSpecifiers;
    self->_accountGroupSpecifiers = v57;

  }
  v181 = 0u;
  v182 = 0u;
  v179 = 0u;
  v180 = 0u;
  -[CNFRegListController regController](self, "regController");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFRegListController regController](self, "regController");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "accounts");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "allAvailableAliasesForAccounts:", v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  v63 = 0;
  v64 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v179, v194, 16);
  if (v64)
  {
    v65 = *(_QWORD *)v180;
    do
    {
      for (i = 0; i != v64; ++i)
      {
        if (*(_QWORD *)v180 != v65)
          objc_enumerationMutation(v62);
        v67 = *(void **)(*((_QWORD *)&v179 + 1) + 8 * i);
        if (objc_msgSend(v67, "isTemporaryPhoneNumberAlias"))
        {
          v68 = v67;

          v63 = v68;
        }
      }
      v64 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v179, v194, 16);
    }
    while (v64);
  }

  objc_msgSend(v5, "specifierForID:", CFSTR("FACETIME_TEMPORARY_PHONE_GROUP_ID"));
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "specifierForID:", CFSTR("FACETIME_TEMPORARY_PHONE_ID"));
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "specifierForID:", CFSTR("FACETIME_TEMPORARY_PHONE_REMOVE"));
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  if (v152 && v150 && v153)
  {
    if (v63)
    {
      OSLogHandleForIDSCategory();
      v69 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v193 = v63;
        _os_log_impl(&dword_2138BA000, v69, OS_LOG_TYPE_DEFAULT, "Initial load found temporary phone alias %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      {
        v143 = v63;
        IMLogString();
      }
      CommunicationsSetupUIBundle();
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      CNFRegStringTableName();
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "localizedStringForKey:value:table:", CFSTR("FACETIME_SETTINGS_TEMPORARY_PHONE_LABEL"), &stru_24D077260, v71);
      v145 = (void *)objc_claimAutoreleasedReturnValue();

      v72 = *v21;
      objc_msgSend(v152, "setProperty:forKey:", v145, *v21);
      objc_msgSend(v152, "setName:", v145);
      if (objc_msgSend(v145, "_isNaturallyRTL"))
        v73 = 2;
      else
        v73 = 0;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v73, v143);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = *MEMORY[0x24BE75860];
      objc_msgSend(v152, "setProperty:forKey:", v74, *MEMORY[0x24BE75860]);

      v76 = objc_opt_class();
      v77 = *MEMORY[0x24BE75948];
      objc_msgSend(v150, "setProperty:forKey:", v76, *MEMORY[0x24BE75948]);
      objc_msgSend(v150, "setProperty:forKey:", v63, CFSTR("cnfreg-temp-alias"));
      -[CNFRegSettingsController ftImServiceString](self, "ftImServiceString");
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = (void *)MEMORY[0x24BDD17C8];
      CommunicationsSetupUIBundle();
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      CNFRegStringTableName();
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "localizedStringForKey:value:table:", CFSTR("FACETIME_SETTINGS_TEMPORARY_PHONE_REMOVE"), &stru_24D077260, v80);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "stringWithFormat:", v81, v144);
      v82 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v153, "setName:", v82);
      objc_msgSend(v153, "setProperty:forKey:", v82, v72);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v153, "setProperty:forKey:", v83, v75);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v153, "setProperty:forKey:", v84, *MEMORY[0x24BE75A18]);

      objc_msgSend(v153, "setProperty:forKey:", objc_opt_class(), v77);
      objc_msgSend(v153, "setButtonAction:", sel_deleteTemporaryPhoneAliasSelected_);
      NSStringFromSelector(sel_deleteTemporaryPhoneAliasSelected_);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v153, "setProperty:forKey:", v85, *MEMORY[0x24BE75900]);

      objc_msgSend(v153, "setProperty:forKey:", v63, CFSTR("cnfreg-temp-alias"));
    }
    else
    {
      OSLogHandleForIDSCategory();
      v86 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2138BA000, v86, OS_LOG_TYPE_DEFAULT, "Initial load found no temporary phone alias. Deleting specifiers", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
        IMLogString();
      objc_msgSend(v5, "removeObject:", v152);
      objc_msgSend(v5, "removeObject:", v150);
      objc_msgSend(v5, "removeObject:", v153);
    }
  }
  -[CNFRegListController regController](self, "regController");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = objc_msgSend(v87, "serviceType");

  if ((v88 & 0xFFFFFFFFFFFFFFFDLL) != 0)
  {
    objc_msgSend(v5, "specifierForID:", CFSTR("FACETIME_ENABLED_GROUP_ID"));
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = v89;
    if (v89)
    {
      objc_msgSend(v89, "removePropertyForKey:", *MEMORY[0x24BE75A68]);
      objc_msgSend(v90, "removePropertyForKey:", *MEMORY[0x24BE75A30]);
    }

  }
  if (!-[CNFRegSettingsController shouldShowReplyWithMessage](self, "shouldShowReplyWithMessage"))
  {
    v177 = 0u;
    v178 = 0u;
    v175 = 0u;
    v176 = 0u;
    v91 = self->_replyWithMessageGroupSpecifiers;
    v92 = -[NSArray countByEnumeratingWithState:objects:count:](v91, "countByEnumeratingWithState:objects:count:", &v175, v191, 16);
    if (v92)
    {
      v93 = *(_QWORD *)v176;
      do
      {
        for (j = 0; j != v92; ++j)
        {
          if (*(_QWORD *)v176 != v93)
            objc_enumerationMutation(v91);
          objc_msgSend(v5, "removeObject:", *(_QWORD *)(*((_QWORD *)&v175 + 1) + 8 * j));
        }
        v92 = -[NSArray countByEnumeratingWithState:objects:count:](v91, "countByEnumeratingWithState:objects:count:", &v175, v191, 16);
      }
      while (v92);
    }

  }
  -[CNFRegListController regController](self, "regController");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFRegSettingsController _useableAccounts](self, "_useableAccounts");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "useableAliasesForAccounts:", v96);
  v97 = (void *)objc_claimAutoreleasedReturnValue();

  if (v97 && (unint64_t)objc_msgSend(v97, "count") > 1)
  {
    objc_msgSend(v5, "specifierForID:", CFSTR("FACETIME_CALLERID_GROUP_ID"));
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    v103 = v102;
    if (v102)
    {
      objc_msgSend(v102, "name");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v104, "_isNaturallyRTL"))
        v105 = 2;
      else
        v105 = 0;

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v105);
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "setProperty:forKey:", v106, *MEMORY[0x24BE75860]);

    }
    -[CNFRegSettingsController configureAccountFooterForGroupSpecifier:](self, "configureAccountFooterForGroupSpecifier:", v103);

  }
  else
  {
    v173 = 0u;
    v174 = 0u;
    v171 = 0u;
    v172 = 0u;
    v98 = self->_callerIdGroupSpecifiers;
    v99 = -[NSArray countByEnumeratingWithState:objects:count:](v98, "countByEnumeratingWithState:objects:count:", &v171, v190, 16);
    if (v99)
    {
      v100 = *(_QWORD *)v172;
      do
      {
        for (k = 0; k != v99; ++k)
        {
          if (*(_QWORD *)v172 != v100)
            objc_enumerationMutation(v98);
          objc_msgSend(v5, "removeObject:", *(_QWORD *)(*((_QWORD *)&v171 + 1) + 8 * k));
        }
        v99 = -[NSArray countByEnumeratingWithState:objects:count:](v98, "countByEnumeratingWithState:objects:count:", &v171, v190, 16);
      }
      while (v99);
    }

    -[CNFRegSettingsController configureAccountFooterForGroupSpecifier:](self, "configureAccountFooterForGroupSpecifier:", v154);
  }
  objc_msgSend(v5, "specifierForID:", CFSTR("MESSAGES_SIGN_OUT_GROUP_ID"));
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "specifierForID:", CFSTR("MESSAGES_SIGN_OUT_ID"));
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFRegListController regController](self, "regController");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFRegSettingsController primaryAppleAccount](self, "primaryAppleAccount");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "aa_personID");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = objc_msgSend(v109, "iMessageAccountMatchesiCloudAccount:", v111);

  if (v112)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "setProperty:forKey:", v113, *MEMORY[0x24BE75860]);

    -[CNFRegSettingsController configureSignOutForSpecifier:](self, "configureSignOutForSpecifier:", v108);
  }
  else
  {
    objc_msgSend(v5, "removeObject:", v107);
    objc_msgSend(v5, "removeObject:", v108);
  }
  if (!-[CNFRegSettingsController shouldShowBlocklistSettings](self, "shouldShowBlocklistSettings"))
  {
    v169 = 0u;
    v170 = 0u;
    v167 = 0u;
    v168 = 0u;
    v114 = self->_blocklistGroupSpecifiers;
    v115 = -[NSArray countByEnumeratingWithState:objects:count:](v114, "countByEnumeratingWithState:objects:count:", &v167, v189, 16);
    if (v115)
    {
      v116 = *(_QWORD *)v168;
      do
      {
        for (m = 0; m != v115; ++m)
        {
          if (*(_QWORD *)v168 != v116)
            objc_enumerationMutation(v114);
          objc_msgSend(v5, "removeObject:", *(_QWORD *)(*((_QWORD *)&v167 + 1) + 8 * m));
        }
        v115 = -[NSArray countByEnumeratingWithState:objects:count:](v114, "countByEnumeratingWithState:objects:count:", &v167, v189, 16);
      }
      while (v115);
    }

  }
  if (-[CNFRegSettingsController shouldShowReceiveThumperCalls](self, "shouldShowReceiveThumperCalls"))
  {
    OSLogHandleForIDSCategory();
    v118 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v118, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2138BA000, v118, OS_LOG_TYPE_DEFAULT, "Removing \"Calls from iPhone\" switch, adding \"Calls on Other Devices\" drill down", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      IMLogString();
    objc_msgSend(v5, "specifierForID:", CFSTR("RECEIVE_RELAYED_PHONE_CALLS_ID"));
    v119 = (NSArray *)objc_claimAutoreleasedReturnValue();
    if (v119)
      objc_msgSend(v5, "removeObject:", v119);
LABEL_156:

    goto LABEL_157;
  }
  if (!-[CNFRegSettingsController shouldShowReceiveRelayCalls](self, "shouldShowReceiveRelayCalls"))
  {
    OSLogHandleForIDSCategory();
    v120 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v120, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2138BA000, v120, OS_LOG_TYPE_DEFAULT, "Removing \"Calls from iPhone\" group entirely.  Neither Thumper nor Relay supported", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      IMLogString();
    v165 = 0u;
    v166 = 0u;
    v163 = 0u;
    v164 = 0u;
    v119 = self->_receiveRelayCallsGroupSpecifiers;
    v121 = -[NSArray countByEnumeratingWithState:objects:count:](v119, "countByEnumeratingWithState:objects:count:", &v163, v188, 16);
    if (v121)
    {
      v122 = *(_QWORD *)v164;
      do
      {
        for (n = 0; n != v121; ++n)
        {
          if (*(_QWORD *)v164 != v122)
            objc_enumerationMutation(v119);
          objc_msgSend(v5, "removeObject:", *(_QWORD *)(*((_QWORD *)&v163 + 1) + 8 * n));
        }
        v121 = -[NSArray countByEnumeratingWithState:objects:count:](v119, "countByEnumeratingWithState:objects:count:", &v163, v188, 16);
      }
      while (v121);
    }
    goto LABEL_156;
  }
LABEL_157:
  if (!-[CNFRegSettingsController shouldShowFaceTimeCaptionsSpecifiers](self, "shouldShowFaceTimeCaptionsSpecifiers"))
  {
    objc_msgSend(v5, "specifierForID:", CFSTR("FACETIME_CAPTIONS_ENABLED_GROUP_ID"));
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObject:", v124);

    objc_msgSend(v5, "specifierForID:", CFSTR("FACETIME_CAPTIONS_ENABLED_ID"));
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObject:", v125);

  }
  if (!-[CNFRegSettingsController shouldShowFaceTimePhotosSpecifiers](self, "shouldShowFaceTimePhotosSpecifiers"))
  {
    objc_msgSend(v5, "specifierForID:", CFSTR("FACETIME_PHOTOS_ENABLED_GROUP_ID"));
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObject:", v126);

    objc_msgSend(v5, "specifierForID:", CFSTR("FACETIME_PHOTOS_ENABLED_ID"));
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObject:", v127);

  }
  if (!-[CNFRegSettingsController shouldShowGFTProminenceSpecifiers](self, "shouldShowGFTProminenceSpecifiers"))
  {
    objc_msgSend(v5, "specifierForID:", CFSTR("GFT_PROMINENCE_GROUP_ID"));
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObject:", v128);

    objc_msgSend(v5, "specifierForID:", CFSTR("GFT_AUDIO_PROMINENCE_ENABLED_ID"));
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObject:", v129);

  }
  if (!-[CNFRegSettingsController shouldShowFaceTimeVPCSpecifiers](self, "shouldShowFaceTimeVPCSpecifiers"))
  {
    objc_msgSend(v5, "specifierForID:", CFSTR("FACETIME_VPC_GROUP_ID"));
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObject:", v130);

    objc_msgSend(v5, "specifierForID:", CFSTR("FACETIME_VPC_SWITCH_ID"));
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObject:", v131);

  }
  if (!-[CNFRegSettingsController shouldShowSharePlaySpecifiers](self, "shouldShowSharePlaySpecifiers"))
  {
    v161 = 0u;
    v162 = 0u;
    v159 = 0u;
    v160 = 0u;
    v132 = self->_sharePlaySpecifiers;
    v133 = -[NSArray countByEnumeratingWithState:objects:count:](v132, "countByEnumeratingWithState:objects:count:", &v159, v187, 16);
    if (v133)
    {
      v134 = *(_QWORD *)v160;
      do
      {
        for (ii = 0; ii != v133; ++ii)
        {
          if (*(_QWORD *)v160 != v134)
            objc_enumerationMutation(v132);
          objc_msgSend(v5, "removeObject:", *(_QWORD *)(*((_QWORD *)&v159 + 1) + 8 * ii));
        }
        v133 = -[NSArray countByEnumeratingWithState:objects:count:](v132, "countByEnumeratingWithState:objects:count:", &v159, v187, 16);
      }
      while (v133);
    }

  }
  if (!-[CNFRegSettingsController shouldShowSharedNameAndPhotoSpecifiers](self, "shouldShowSharedNameAndPhotoSpecifiers"))
  {
    v157 = 0u;
    v158 = 0u;
    v155 = 0u;
    v156 = 0u;
    v136 = self->_sharedNameAndPhotoSpecifiers;
    v137 = -[NSArray countByEnumeratingWithState:objects:count:](v136, "countByEnumeratingWithState:objects:count:", &v155, v186, 16);
    if (v137)
    {
      v138 = *(_QWORD *)v156;
      do
      {
        for (jj = 0; jj != v137; ++jj)
        {
          if (*(_QWORD *)v156 != v138)
            objc_enumerationMutation(v136);
          objc_msgSend(v5, "removeObject:", *(_QWORD *)(*((_QWORD *)&v155 + 1) + 8 * jj));
        }
        v137 = -[NSArray countByEnumeratingWithState:objects:count:](v136, "countByEnumeratingWithState:objects:count:", &v155, v186, 16);
      }
      while (v137);
    }

  }
  v140 = (objc_class *)objc_msgSend(v5, "copy");
  v141 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v146);
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + v146) = v140;

  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v146);
  return v3;
}

void __41__CNFRegSettingsController_specifierList__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "createSpecifierForCallerIdAlias:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "insertObject:atIndex:", v3, *(_QWORD *)(a1 + 48));

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  objc_super v18;

  v6 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CNFRegSettingsController;
  -[CNFRegSettingsController tableView:cellForRowAtIndexPath:](&v18, sel_tableView_cellForRowAtIndexPath_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v7, "setSelectionStyle:", 1);
  v8 = -[CNFRegSettingsController indexForIndexPath:](self, "indexForIndexPath:", v6);
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]), "objectAtIndex:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "propertyForKey:", CFSTR("cnfreg-alias-checked"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
      objc_msgSend(v7, "setChecked:", objc_msgSend(v10, "BOOLValue"));
    objc_msgSend(v9, "propertyForKey:", CFSTR("cnfreg-alias-spinning"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
      objc_msgSend(v7, "setHasSpinner:", objc_msgSend(v12, "BOOLValue"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "CNFRegAlias");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v14, "isTemporaryPhoneNumberAlias") & 1) != 0)
      {
        v15 = 1;
      }
      else
      {
        objc_msgSend(v9, "CNFRegCallerIdAlias");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v16, "isTemporaryPhoneNumberAlias");

      }
      objc_msgSend(v7, "setIsTemporaryPhone:", v15);
    }

  }
  return v7;
}

- (BOOL)shouldReloadSpecifiersOnResume
{
  return 0;
}

- (void)doneButtonTapped:(id)a3
{
  void *v3;
  id v4;

  -[CNFRegSettingsController navigationController](self, "navigationController", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)viewDidLoad
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CNFRegSettingsController;
  -[CNFRegSettingsController viewDidLoad](&v11, sel_viewDidLoad);
  -[CNFRegSettingsController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isBeingPresented");

  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_doneButtonTapped_);
    -[CNFRegSettingsController navigationItem](self, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRightBarButtonItem:", v5);

    CommunicationsSetupUIBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    CNFRegStringTableName();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("FACETIME_ALIAS_MODAL_TITLE"), &stru_24D077260, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFRegSettingsController navigationItem](self, "navigationItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTitle:", v9);

  }
}

- (void)emitNavigationEvent
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = *MEMORY[0x24BEB4A68];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("settings-navigation://com.apple.Settings.Apps/%@"), *MEMORY[0x24BEB4A68]);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x24BDD19B8]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v5, "initWithKey:table:locale:bundleURL:", CFSTR("FaceTime"), 0, v6, v8);

  -[CNFRegSettingsController pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:title:localizedNavigationComponents:deepLink:](self, "pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:title:localizedNavigationComponents:deepLink:", v3, v9, MEMORY[0x24BDBD1A8], v4);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[CNFRegListController _updateTitle](self, "_updateTitle");
  v5.receiver = self;
  v5.super_class = (Class)CNFRegSettingsController;
  -[CNFRegListController viewWillAppear:](&v5, sel_viewWillAppear_, v3);
}

- (void)viewIsAppearing:(BOOL)a3
{
  _QWORD v4[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNFRegSettingsController;
  -[CNFRegSettingsController viewIsAppearing:](&v5, sel_viewIsAppearing_, a3);
  if (*(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]))
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __44__CNFRegSettingsController_viewIsAppearing___block_invoke;
    v4[3] = &unk_24D075180;
    v4[4] = self;
    objc_msgSend(MEMORY[0x24BEBDB00], "performWithoutAnimation:", v4);
  }
  -[CNFRegListController showAuthKitSignInIfNecessary](self, "showAuthKitSignInIfNecessary");
}

uint64_t __44__CNFRegSettingsController_viewIsAppearing___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "refreshFaceTimeSettingsAnimated:", 0);
  objc_msgSend(*(id *)(a1 + 32), "refreshAllAliasSpecifiers");
  return objc_msgSend(*(id *)(a1 + 32), "refreshAllCallerIdAliasSpecifiers");
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNFRegSettingsController;
  -[CNFRegListController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  -[CNFRegSettingsController _setupAllListeners](self, "_setupAllListeners");
  *(_BYTE *)&self->_settingsFlags |= 2u;
  objc_msgSend(MEMORY[0x24BE502D0], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setBlocksConnectionAtResume:", 1);

  -[CNFRegSettingsController emitNavigationEvent](self, "emitNavigationEvent");
}

- (void)viewWillDisappear:(BOOL)a3
{
  NSObject *v4;
  uint8_t v5[16];
  objc_super v6;

  *(_BYTE *)&self->_settingsFlags &= ~2u;
  v6.receiver = self;
  v6.super_class = (Class)CNFRegSettingsController;
  -[CNFRegListController viewWillDisappear:](&v6, sel_viewWillDisappear_, a3);
  OSLogHandleForIDSCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2138BA000, v4, OS_LOG_TYPE_DEFAULT, "Removing all event handlers", v5, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    IMLogString();
  -[CNFRegListController removeAllHandlers](self, "removeAllHandlers");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNFRegSettingsController;
  -[CNFRegListController viewDidDisappear:](&v3, sel_viewDidDisappear_, a3);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  objc_super v8;
  _QWORD v9[5];

  height = a3.height;
  width = a3.width;
  *(_BYTE *)&self->_settingsFlags |= 4u;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __79__CNFRegSettingsController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v9[3] = &unk_24D075B78;
  v9[4] = self;
  v7 = a4;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", &__block_literal_global_207, v9);
  v8.receiver = self;
  v8.super_class = (Class)CNFRegSettingsController;
  -[CNFRegSettingsController viewWillTransitionToSize:withTransitionCoordinator:](&v8, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);

}

uint64_t __79__CNFRegSettingsController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 1552) &= ~4u;
  return result;
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (id)_useableAccounts
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[CNFRegListController regController](self, "regController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "phoneAccounts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v5);

  -[CNFRegSettingsController _appleIDAccounts](self, "_appleIDAccounts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v6);

  return v3;
}

- (id)_appleIDAccounts
{
  void *v2;
  void *v3;

  -[CNFRegListController regController](self, "regController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountsWithFilter:", 102405);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_operationalAccounts
{
  void *v2;
  void *v3;

  -[CNFRegListController regController](self, "regController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountsWithFilter:", 102400);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_operationalAccountsForService:(int64_t)a3
{
  void *v3;
  void *v4;

  +[CNFRegController controllerForServiceType:](CNFRegController, "controllerForServiceType:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accountsWithFilter:", 102400);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)formSheetViewWillDisappear
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CNFRegSettingsController;
  -[CNFRegSettingsController formSheetViewWillDisappear](&v2, sel_formSheetViewWillDisappear);
}

- (void)formSheetViewDidDisappear
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNFRegSettingsController;
  -[CNFRegSettingsController formSheetViewDidDisappear](&v3, sel_formSheetViewDidDisappear);
  -[CNFRegSettingsController _setupAllListeners](self, "_setupAllListeners");
}

- (void)systemApplicationWillEnterForeground
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNFRegSettingsController;
  -[CNFRegListController systemApplicationWillEnterForeground](&v3, sel_systemApplicationWillEnterForeground);
  -[CNFRegSettingsController refreshFaceTimeSettingsAnimated:](self, "refreshFaceTimeSettingsAnimated:", 0);
  -[CNFRegSettingsController _setupAccountHandlers](self, "_setupAccountHandlers");
}

- (void)systemApplicationDidEnterBackground
{
  NSObject *v3;
  uint8_t v4[16];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNFRegSettingsController;
  -[CNFRegListController systemApplicationDidEnterBackground](&v5, sel_systemApplicationDidEnterBackground);
  OSLogHandleForIDSCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2138BA000, v3, OS_LOG_TYPE_DEFAULT, "Removing all event handlers due to suspension", v4, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    IMLogString();
  -[CNFRegListController removeAllHandlers](self, "removeAllHandlers");
}

- (void)systemApplicationDidSuspend
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v8.receiver = self;
  v8.super_class = (Class)CNFRegSettingsController;
  -[CNFRegListController systemApplicationDidSuspend](&v8, sel_systemApplicationDidSuspend);
  -[CNFRegSettingsController presentedViewController](self, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    OSLogHandleForIDSCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      -[CNFRegSettingsController presentedViewController](self, "presentedViewController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v10 = v5;
      _os_log_impl(&dword_2138BA000, v4, OS_LOG_TYPE_DEFAULT, "Dismissing presented view controller (%@) due to suspension", buf, 0xCu);

    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (IMShouldLog())
      {
        -[CNFRegSettingsController presentedViewController](self, "presentedViewController");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        IMLogString();

      }
    }
    -[CNFRegSettingsController presentedViewController](self, "presentedViewController", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 0, 0);

  }
}

- (void)systemApplicationDidResume
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CNFRegSettingsController;
  -[CNFRegListController systemApplicationDidResume](&v2, sel_systemApplicationDidResume);
}

- (void)_handleDeactivation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BEBEA18]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "intValue") == 11)
  {
    -[CNFRegSettingsController presentedViewController](self, "presentedViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[CNFRegSettingsController presentedViewController](self, "presentedViewController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_16:
        OSLogHandleForIDSCategory();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          -[CNFRegSettingsController presentedViewController](self, "presentedViewController");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v22 = v14;
          _os_log_impl(&dword_2138BA000, v13, OS_LOG_TYPE_DEFAULT, "Dismissing presented view controller (%@) due to deactivation (suspension)", buf, 0xCu);

        }
        if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
        {
          -[CNFRegSettingsController presentedViewController](self, "presentedViewController");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          IMLogString();

        }
        -[CNFRegSettingsController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, 0, v15);
      }
      else
      {
        objc_opt_class();
        v8 = v16;
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_23:

          goto LABEL_24;
        }
        v19 = 0u;
        v20 = 0u;
        v17 = 0u;
        v18 = 0u;
        objc_msgSend(v16, "viewControllers");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
        if (v10)
        {
          v11 = *(_QWORD *)v18;
          while (2)
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v18 != v11)
                objc_enumerationMutation(v9);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                  continue;
              }

              goto LABEL_16;
            }
            v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
            if (v10)
              continue;
            break;
          }
        }

      }
      v8 = v16;
      goto LABEL_23;
    }
  }
LABEL_24:

}

- (id)logName
{
  return CFSTR("Settings");
}

- (id)customTitle
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  __CFString *v7;

  -[CNFRegListController regController](self, "regController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "serviceType");

  if (v3 != 2)
  {
    if (v3 == 1)
    {
      CommunicationsSetupUIBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      CNFRegStringTableName();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = CFSTR("IMESSAGE");
      goto LABEL_6;
    }
    if (v3)
    {
      v7 = &stru_24D077260;
      return v7;
    }
  }
  CommunicationsSetupUIBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CNFRegStringTableName();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = CFSTR("FACETIME");
LABEL_6:
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_24D077260, v5);
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_cacheSpecifierGroup:(id)a3 withSpecifiers:(id)a4
{
  void **p_accountGroupSpecifiers;
  id v7;
  id v8;

  if (a3)
  {
    if (a4)
    {
      p_accountGroupSpecifiers = (void **)&self->_accountGroupSpecifiers;
      v7 = a4;
      v8 = a3;
      _cacheSpecifierGroupMatchingID(CFSTR("FACETIME_ACCOUNT_GROUP_ID"), v8, v7, p_accountGroupSpecifiers);
      _cacheSpecifierGroupMatchingID(CFSTR("FACETIME_REPLY_WITH_MESSAGE_GROUP_ID"), v8, v7, (void **)&self->_replyWithMessageGroupSpecifiers);
      _cacheSpecifierGroupMatchingID(CFSTR("FACETIME_ALIAS_GROUP_ID"), v8, v7, (void **)&self->_aliasGroupSpecifiers);
      _cacheSpecifierGroupMatchingID(CFSTR("FACETIME_TEMPORARY_PHONE_GROUP_ID"), v8, v7, (void **)&self->_temporaryPhoneGroupSpecifiers);
      _cacheSpecifierGroupMatchingID(CFSTR("FACETIME_TEMPORARY_PHONE_ID"), v8, v7, (void **)&self->_temporaryPhoneDescriptionGroupSpecifiers);
      _cacheSpecifierGroupMatchingID(CFSTR("FACETIME_TEMPORARY_PHONE_REMOVE"), v8, v7, (void **)&self->_temporaryPhoneRemoveGroupSpecifiers);
      _cacheSpecifierGroupMatchingID(CFSTR("FACETIME_CALLERID_GROUP_ID"), v8, v7, (void **)&self->_callerIdGroupSpecifiers);
      _cacheSpecifierGroupMatchingID(CFSTR("FACETIME_BLOCKLIST_GROUP_ID"), v8, v7, (void **)&self->_blocklistGroupSpecifiers);
      _cacheSpecifierGroupMatchingID(CFSTR("RECEIVE_RELAYED_PHONE_CALLS_GROUP_ID"), v8, v7, (void **)&self->_receiveRelayCallsGroupSpecifiers);
      _cacheSpecifierGroupMatchingID(CFSTR("GFT_PROMINENCE_GROUP_ID"), v8, v7, (void **)&self->_GFTProminenceGroupSpecifiers);
      _cacheSpecifierGroupMatchingID(CFSTR("FACETIME_CAPTIONS_ENABLED_GROUP_ID"), v8, v7, (void **)&self->_faceTimeCaptionsGroupSpecifiers);
      _cacheSpecifierGroupMatchingID(CFSTR("FACETIME_PHOTOS_ENABLED_GROUP_ID"), v8, v7, (void **)&self->_faceTimePhotosGroupSpecifiers);
      _cacheSpecifierGroupMatchingID(CFSTR("SHAREPLAY_SETTINGS_GROUP"), v8, v7, (void **)&self->_sharePlaySpecifiers);
      _cacheSpecifierGroupMatchingID(CFSTR("FACETIME_VPC_GROUP_ID"), v8, v7, (void **)&self->_faceTimeVPCGroupSpecifiers);
      _cacheSpecifierGroupMatchingID(CFSTR("SHARED_NAME_AND_PHOTO_SETTINGS_GROUP"), v8, v7, (void **)&self->_sharedNameAndPhotoSpecifiers);

    }
  }
}

- (void)_buildSpecifierCache:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  char *v7;
  uint64_t v8;
  int *v9;
  uint64_t i;
  char *v11;
  char *v12;
  uint64_t v13;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = a3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = 0;
    v8 = *(_QWORD *)v16;
    v9 = (int *)MEMORY[0x24BE75738];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(obj);
        v11 = *(char **)(*((_QWORD *)&v15 + 1) + 8 * i);
        _cacheSpecifierMatchingID(CFSTR("FACETIME_ENABLED_GROUP_ID"), v11, (id *)&self->_faceTimeEnabledGroupSpecifier);
        _cacheSpecifierMatchingID(CFSTR("FACETIME_ENABLED_ID"), v11, (id *)&self->_faceTimeEnabledSpecifier);
        if (*(_QWORD *)&v11[*v9])
        {
          objc_msgSend(v6, "addObject:", v11);
        }
        else
        {
          -[CNFRegSettingsController _cacheSpecifierGroup:withSpecifiers:](self, "_cacheSpecifierGroup:withSpecifiers:", v7, v6);
          v12 = v11;

          v13 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v12, 0);
          v6 = (void *)v13;
          v7 = v12;
        }
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }
  -[CNFRegSettingsController _cacheSpecifierGroup:withSpecifiers:](self, "_cacheSpecifierGroup:withSpecifiers:", v7, v6);

}

- (id)_switchFooterText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  char v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  void *v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  void *v41;
  void *v43;
  id v44;
  uint64_t SIMStatus;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  CommunicationsSetupUIBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CNFRegStringTableName();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("FACETIME_SWITCH_STATUS_DEFAULT"), &stru_24D077260, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (MGGetBoolAnswer())
  {
    objc_msgSend(MEMORY[0x24BE30338], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "supportsSMSIdentification");

    if (v7)
    {
      CNFRegStringTableName();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      CommunicationsSetupUIBundle();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      CNFLocalizedStringFromTableInBundleWithFallback(CFSTR("FACETIME_SWITCH_STATUS_DEFAULT_WITH_WARNING"), v8, v9);
      v10 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v10;
    }
  }
  SIMStatus = CTSIMSupportGetSIMStatus();
  v11 = (uint64_t *)MEMORY[0x24BDC2CD0];
  v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[CNFRegListController regController](self, "regController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "accountsWithFilter:", 8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObjectsFromArray:", v14);

  -[CNFRegListController regController](self, "regController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "accountsWithFilter:", 8200);
  v16 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObjectsFromArray:", v16);

  objc_msgSend(MEMORY[0x24BE30338], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v16) = objc_msgSend(v17, "supportsSMSIdentification");

  if ((v16 & 1) == 0)
  {
    -[CNFRegListController regController](self, "regController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "accountsWithFilter:", 16389);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObjectsFromArray:", v19);

  }
  v43 = v5;
  v20 = *v11;
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v21 = v12;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
  if (v22)
  {
    v23 = v22;
    v24 = 0;
    v25 = 0;
    v26 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v51 != v26)
          objc_enumerationMutation(v21);
        v28 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
        v29 = objc_msgSend(v28, "registrationStatus", v43);
        if (v29 == -1)
        {
          v25 |= objc_msgSend(v28, "registrationFailureReason") != 14;
          objc_msgSend(v28, "isActive");
        }
        else
        {
          v30 = v29;
          v31 = objc_msgSend(v28, "isActive");
          if (v30 >= 2 && v31 != 0)
            v24 |= objc_msgSend(v28, "CNFRegSignInComplete") ^ 1;
        }
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
    }
    while (v23);
  }
  else
  {
    LOBYTE(v24) = 0;
    v25 = 0;
  }

  if (SIMStatus == v20)
  {
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    -[CNFRegListController regController](self, "regController");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "accountsWithFilter:", 4);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    if (v37)
    {
      v38 = v37;
      v39 = *(_QWORD *)v47;
      while (2)
      {
        for (j = 0; j != v38; ++j)
        {
          if (*(_QWORD *)v47 != v39)
            objc_enumerationMutation(v33);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * j), "registrationStatus", v43) == 5)
          {
            v41 = v43;
            goto LABEL_38;
          }
        }
        v38 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
        if (v38)
          continue;
        break;
      }
    }

    if ((v25 & 1) != 0)
      goto LABEL_24;
  }
  else if ((v25 & 1) != 0)
  {
LABEL_24:
    CommunicationsSetupUIBundle();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    CNFRegStringTableName();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = CFSTR("FACETIME_SWITCH_STATUS_FAILED");
    goto LABEL_36;
  }
  if ((v24 & 1) == 0)
  {
    v41 = v43;
    goto LABEL_39;
  }
  CommunicationsSetupUIBundle();
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  CNFRegStringTableName();
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = CFSTR("FACETIME_SWITCH_STATUS_IN_PROGRESS");
LABEL_36:
  objc_msgSend(v33, "localizedStringForKey:value:table:", v35, &stru_24D077260, v34, v43);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_38:
LABEL_39:

  return v41;
}

- (void)_updateSwitch
{
  PSSpecifier *v3;
  id v4;

  if (-[CNFRegSettingsController showEnableSwitch](self, "showEnableSwitch"))
  {
    v3 = self->_faceTimeEnabledGroupSpecifier;
    -[CNFRegSettingsController _switchFooterText](self, "_switchFooterText");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[CNFRegListController _setLabel:forSpecifier:header:](self, "_setLabel:forSpecifier:header:", v4, v3, 0);
    -[CNFRegSettingsController reloadSpecifier:animated:](self, "reloadSpecifier:animated:", self->_faceTimeEnabledGroupSpecifier, 0);
    -[CNFRegSettingsController reloadSpecifier:animated:](self, "reloadSpecifier:animated:", self->_faceTimeEnabledSpecifier, 0);

  }
}

- (void)_updateSwitchDelayed
{
  if (-[CNFRegSettingsController showEnableSwitch](self, "showEnableSwitch"))
  {
    objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__updateSwitch, 0);
    -[CNFRegSettingsController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__updateSwitch, 0, 0.75);
  }
}

- (void)setFaceTimeEnabled:(id)a3 specifier:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  const void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  unint64_t v17;
  NSObject *v18;
  void *v19;
  _BOOL4 v20;
  CNFRegController *v21;
  CNFRegSettingsController *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  unint64_t v30;
  unint64_t v31;
  uint8_t buf[4];
  int v33;
  __int16 v34;
  int v35;
  _QWORD v36[2];
  _QWORD v37[3];

  v5 = a5;
  v37[2] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  -[CNFRegListController regController](self, "regController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "BOOLValue"))
  {
    if (-[CNFRegSettingsController _shouldDisableAccountConfigurationUI](self, "_shouldDisableAccountConfigurationUI"))
    {
      -[CNFRegSettingsController reloadSpecifierID:](self, "reloadSpecifierID:", CFSTR("FACETIME_ENABLED_ID"));
    }
    else
    {
      -[CNFRegSettingsController _setupAccountHandlersForDisabling](self, "_setupAccountHandlersForDisabling");
      objc_msgSend(v10, "setServiceEnabled:", 0);
      -[CNFRegSettingsController refreshFaceTimeSettingsAnimated:](self, "refreshFaceTimeSettingsAnimated:", v5);
    }
    goto LABEL_25;
  }
  if (MGGetBoolAnswer())
  {
    if ((objc_msgSend(v10, "serviceType") | 2) == 2)
    {
      v11 = _CTServerConnectionCreateOnTargetQueue();
      if (v11)
      {
        v12 = (const void *)v11;
        OSLogHandleForIDSCategory();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2138BA000, v13, OS_LOG_TYPE_DEFAULT, "Enabling data usage for FaceTime", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
          IMLogString();
        v14 = *MEMORY[0x24BDC2A30];
        v15 = *MEMORY[0x24BDC2A28];
        v36[0] = *MEMORY[0x24BDC3138];
        v36[1] = v15;
        v37[0] = v14;
        v37[1] = v14;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v37, v36, 2);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = _CTServerConnectionSetCellularUsagePolicy();
        if (HIDWORD(v17))
        {
          OSLogHandleForIDSCategory();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109376;
            v33 = HIDWORD(v17);
            v34 = 1024;
            v35 = v17;
            _os_log_impl(&dword_2138BA000, v18, OS_LOG_TYPE_DEFAULT, "Could not enable data usage. error: %d domain: (%d)", buf, 0xEu);
          }

          if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
          {
            v30 = HIDWORD(v17);
            v31 = v17;
            IMLogString();
          }
        }
        CFRelease(v12);

      }
    }
  }
  if (!-[CNFRegListController _showWiFiAlertIfNecessary](self, "_showWiFiAlertIfNecessary", v30, v31))
  {
    -[CNFRegSettingsController _setupAccountHandlers](self, "_setupAccountHandlers");
    objc_msgSend(v10, "accounts");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19 == 0;

    if (v20)
    {
      -[CNFRegSettingsController popToFirstRunControllerAnimated:](self, "popToFirstRunControllerAnimated:", 1);
      v21 = -[CNFRegController initWithServiceType:]([CNFRegController alloc], "initWithServiceType:", 0);
      -[CNFRegController connect:](v21, "connect:", 1);
      v22 = -[CNFRegListController initWithRegController:]([CNFRegSettingsController alloc], "initWithRegController:", v21);
      -[CNFRegSettingsController rootController](self, "rootController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNFRegSettingsController setRootController:](v22, "setRootController:", v23);

      -[CNFRegSettingsController setParentController:](v22, "setParentController:", self);
      -[CNFRegSettingsController specifier](self, "specifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNFRegListController setSpecifier:](v22, "setSpecifier:", v24);

      -[CNFRegSettingsController setShowEnableSwitch:](v22, "setShowEnableSwitch:", 0);
      -[CNFRegSettingsController setShowDeviceAliases:](v22, "setShowDeviceAliases:", 1);
      -[CNFRegSettingsController setHideAppleIDLogin:](v22, "setHideAppleIDLogin:", 1);
      v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", v22);
      +[CNFRegAppearanceController globalAppearanceController](CNFRegAppearanceController, "globalAppearanceController");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "navigationBarStyle");
      objc_msgSend(v25, "navigationBar");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setBarStyle:", v27);

      -[CNFRegListController regController](self, "regController");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "connect:", 1);

      -[CNFRegSettingsController presentModalViewController:withTransition:](self, "presentModalViewController:withTransition:", v25, 3);
    }
    else
    {
      objc_msgSend(v10, "activateAccounts");
    }
LABEL_25:
    -[CNFRegSettingsController _updateSwitch](self, "_updateSwitch");
    goto LABEL_26;
  }
  -[CNFRegSettingsController reloadSpecifier:](self, "reloadSpecifier:", v9);
LABEL_26:

}

- (void)setFaceTimeEnabled:(id)a3 specifier:(id)a4
{
  -[CNFRegSettingsController setFaceTimeEnabled:specifier:animated:](self, "setFaceTimeEnabled:specifier:animated:", a3, a4, 1);
}

- (id)getFaceTimeEnabledForSpecifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD16E0];
  -[CNFRegListController regController](self, "regController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "isServiceEnabled"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setReceiveRelayedCallsEnabled:(id)a3 specifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[5];
  uint8_t buf[4];
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  OSLogHandleForIDSCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v25 = objc_msgSend(v6, "BOOLValue");
    _os_log_impl(&dword_2138BA000, v8, OS_LOG_TYPE_DEFAULT, "SetReceiveRelayedCallsEnabled %d", buf, 8u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    v22 = objc_msgSend(v6, "BOOLValue");
    IMLogString();
  }
  if (objc_msgSend(v6, "BOOLValue", v22)
    && (objc_msgSend(MEMORY[0x24BEB4930], "accountsSupportSecondaryCalling") & 1) == 0)
  {
    CommunicationsSetupUIBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    CNFRegStringTableName();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("RELAY_CALLS_ACCOUNT_ALERT_TITLE"), &stru_24D077260, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v9) = _os_feature_enabled_impl();
    CommunicationsSetupUIBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    CNFRegStringTableName();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_DWORD)v9)
      v14 = CFSTR("RELAY_CALLS_ACCOUNT_ALERT_MESSAGE_APPLEACCOUNT");
    else
      v14 = CFSTR("RELAY_CALLS_ACCOUNT_ALERT_MESSAGE");
    objc_msgSend(v12, "localizedStringForKey:value:table:", v14, &stru_24D077260, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v11, v15, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x24BEBD3A8];
    CommunicationsSetupUIBundle();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    CNFRegStringTableName();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("FACETIME_ALERT_OK"), &stru_24D077260, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __68__CNFRegSettingsController_setReceiveRelayedCallsEnabled_specifier___block_invoke;
    v23[3] = &unk_24D075A28;
    v23[4] = self;
    objc_msgSend(v17, "actionWithTitle:style:handler:", v20, 0, v23);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addAction:", v21);

    -[CNFRegSettingsController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v16, 1, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEB4930], "setRelayCallingEnabled:", objc_msgSend(v6, "BOOLValue"));
  }

}

uint64_t __68__CNFRegSettingsController_setReceiveRelayedCallsEnabled_specifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifierID:animated:", CFSTR("RECEIVE_RELAYED_PHONE_CALLS_ID"), 1);
}

- (id)getReceiveRelayedCallsEnabledForSpecifier:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(MEMORY[0x24BEB4930], "isRelayCallingEnabled", a3));
}

- (void)_showPrivacySheet:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BE6E438], "presenterForPrivacySplashWithIdentifier:", CFSTR("com.apple.onboarding.imessagefacetime"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPresentingViewController:", self);
  objc_msgSend(v4, "present");

}

- (void)_refreshFaceTimeSettingsDelayed:(id)a3
{
  NSNumber *delayedRefreshAnimatedFlag;

  -[CNFRegSettingsController refreshFaceTimeSettingsAnimated:](self, "refreshFaceTimeSettingsAnimated:", objc_msgSend(a3, "BOOLValue"));
  delayedRefreshAnimatedFlag = self->_delayedRefreshAnimatedFlag;
  self->_delayedRefreshAnimatedFlag = 0;

}

- (void)refreshFaceTimeSettingsWithDelayAnimated:(BOOL)a3
{
  NSNumber *v4;
  NSNumber *delayedRefreshAnimatedFlag;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__refreshFaceTimeSettingsDelayed_, self->_delayedRefreshAnimatedFlag);
  -[CNFRegSettingsController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__refreshFaceTimeSettingsDelayed_, v4, 0.75);
  delayedRefreshAnimatedFlag = self->_delayedRefreshAnimatedFlag;
  self->_delayedRefreshAnimatedFlag = v4;

}

- (void)refreshFaceTimeSettingsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  char v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v3 = a3;
  v27 = *MEMORY[0x24BDAC8D0];
  -[CNFRegSettingsController _operationalAccounts](self, "_operationalAccounts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    -[CNFRegSettingsController refreshAccountsAnimated:](self, "refreshAccountsAnimated:", v3);
    -[CNFRegSettingsController refreshAliasesAnimated:](self, "refreshAliasesAnimated:", v3);
    -[CNFRegSettingsController refreshCallerIdAliasesAnimated:](self, "refreshCallerIdAliasesAnimated:", v3);
    -[CNFRegSettingsController refreshTemporaryPhoneAnimated:](self, "refreshTemporaryPhoneAnimated:", v3);
    -[CNFRegSettingsController refreshGFTProminenceSettingsAnimated:](self, "refreshGFTProminenceSettingsAnimated:", v3);
    -[CNFRegSettingsController refreshSharedNameAndPhotoSettingsAnimated:](self, "refreshSharedNameAndPhotoSettingsAnimated:", v3);
    -[CNFRegSettingsController refreshSharePlaySettingsAnimated:](self, "refreshSharePlaySettingsAnimated:", v3);
    -[CNFRegSettingsController refreshFaceTimeCaptionsSettingsAnimated:](self, "refreshFaceTimeCaptionsSettingsAnimated:", v3);
    -[CNFRegSettingsController refreshFaceTimePhotosSettingsAnimated:](self, "refreshFaceTimePhotosSettingsAnimated:", v3);
    -[CNFRegSettingsController refreshFaceTimeVPCSettingsAnimated:](self, "refreshFaceTimeVPCSettingsAnimated:", v3);
    -[CNFRegSettingsController refreshBlocklistSettingsAnimated:](self, "refreshBlocklistSettingsAnimated:", v3);
    -[CNFRegSettingsController refreshReceiveRelayCallsSettingsAnimated:](self, "refreshReceiveRelayCallsSettingsAnimated:", v3);
    goto LABEL_27;
  }
  -[CNFRegListController regController](self, "regController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accountsWithFilter:", 49156);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v23;
      while (2)
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v23 != v11)
            objc_enumerationMutation(v8);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v12), "CNFRegSignInFailed", (_QWORD)v22) & 1) != 0)
          {

            goto LABEL_14;
          }
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v10)
          continue;
        break;
      }
    }

    -[CNFRegSettingsController showAccounts:animated:](self, "showAccounts:animated:", 0, v3);
  }
  else
  {
LABEL_14:
    -[CNFRegSettingsController refreshAccountsAnimated:](self, "refreshAccountsAnimated:", v3);
  }
  if (-[CNFRegSettingsController showDeviceAliases](self, "showDeviceAliases", (_QWORD)v22))
  {
    v13 = 1;
  }
  else
  {
    -[CNFRegListController regController](self, "regController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "serviceType"))
    {
      v13 = 1;
    }
    else
    {
      -[CNFRegListController regController](self, "regController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v15, "isServiceEnabled");

    }
  }
  -[CNFRegListController regController](self, "regController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "usableDeviceAliases");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v17, "count"))
  {

    goto LABEL_25;
  }
  -[CNFRegListController regController](self, "regController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "serviceSupportsDeviceAliasEnablement") & v13;

  if (v19 != 1)
  {
LABEL_25:
    -[CNFRegSettingsController showAliases:animated:](self, "showAliases:animated:", 0, v3);
    goto LABEL_26;
  }
  -[CNFRegSettingsController refreshAliasesAnimated:](self, "refreshAliasesAnimated:", v3);
LABEL_26:
  -[CNFRegSettingsController showCallerId:animated:](self, "showCallerId:animated:", 0, v3);
  -[CNFRegSettingsController showBlocklistSettings:animated:](self, "showBlocklistSettings:animated:", 0, v3);
  -[CNFRegSettingsController showReceiveRelayCallsSettings:animated:](self, "showReceiveRelayCallsSettings:animated:", 0, v3);
  -[CNFRegSettingsController showGFTProminenceSettings:animated:](self, "showGFTProminenceSettings:animated:", 0, v3);
  -[CNFRegSettingsController showSharedNameAndPhotoSettings:animated:](self, "showSharedNameAndPhotoSettings:animated:", 0, v3);
  -[CNFRegSettingsController showSharePlaySettings:animated:](self, "showSharePlaySettings:animated:", 0, v3);
  -[CNFRegSettingsController showFaceTimeCaptionsSettings:animated:](self, "showFaceTimeCaptionsSettings:animated:", 0, v3);
  -[CNFRegSettingsController showFaceTimePhotosSettings:animated:](self, "showFaceTimePhotosSettings:animated:", 0, v3);
  -[CNFRegSettingsController showFaceTimeVPCSpecifiers:animated:](self, "showFaceTimeVPCSpecifiers:animated:", 0, v3);

LABEL_27:
  -[CNFRegSettingsController _updateSwitch](self, "_updateSwitch");
  -[CNFRegSettingsController reloadSpecifier:animated:](self, "reloadSpecifier:animated:", self->_faceTimeEnabledSpecifier, v3);
  -[CNFRegSettingsController refreshEnabledStateAnimated:](self, "refreshEnabledStateAnimated:", v3);
  -[CNFRegListController regController](self, "regController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "isServiceSupported");

  if ((v21 & 1) == 0)
    -[CNFRegSettingsController _popFromSettingsAnimated:](self, "_popFromSettingsAnimated:", v3);

}

- (void)refreshEnabledStateAnimated:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL8 v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  NSArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  NSArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  void *v26;
  void *v27;
  _BOOL4 v28;
  NSArray *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t m;
  NSArray *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t n;
  _BOOL4 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
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
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v3 = a3;
  v65 = *MEMORY[0x24BDAC8D0];
  v39 = -[CNFRegSettingsController _shouldDisableAccountConfigurationUI](self, "_shouldDisableAccountConfigurationUI");
  v5 = !v39;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  -[CNFRegListController regController](self, "regController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accounts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
  v9 = v5;
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v57;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v57 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
        if (objc_msgSend(v13, "accountType") == 1 && objc_msgSend(v13, "registrationStatus") == 4)
        {
          v9 = 0;
          goto LABEL_12;
        }
      }
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
      if (v10)
        continue;
      break;
    }
    v9 = !v39;
  }
LABEL_12:

  -[CNFRegSettingsController specifierForID:](self, "specifierForID:", CFSTR("FACETIME_ENABLED_ID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFRegListController _setSpecifierEnabled:enabled:animated:](self, "_setSpecifierEnabled:enabled:animated:", v14, v5, v3);

  -[CNFRegSettingsController specifierForID:](self, "specifierForID:", CFSTR("FACETIME_ACCOUNT_ID"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFRegListController _setSpecifierEnabled:enabled:animated:](self, "_setSpecifierEnabled:enabled:animated:", v15, v9, v3);

  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v16 = self->_accountGroupSpecifiers;
  v17 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v52, v63, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v53;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v53 != v19)
          objc_enumerationMutation(v16);
        -[CNFRegListController _setSpecifierEnabled:enabled:animated:](self, "_setSpecifierEnabled:enabled:animated:", *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * j), v9, v3);
      }
      v18 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v52, v63, 16);
    }
    while (v18);
  }

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v21 = self->_aliasGroupSpecifiers;
  v22 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v48, v62, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v49;
    do
    {
      for (k = 0; k != v23; ++k)
      {
        if (*(_QWORD *)v49 != v24)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * k);
        objc_msgSend(v26, "CNFRegAlias");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = -[CNFRegSettingsController _canDeselectAlias:](self, "_canDeselectAlias:", v27);

        if (v28 || v39)
          -[CNFRegListController _setSpecifierEnabled:enabled:animated:](self, "_setSpecifierEnabled:enabled:animated:", v26, v28 & v5, v3);
      }
      v23 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v48, v62, 16);
    }
    while (v23);
  }

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v29 = self->_callerIdGroupSpecifiers;
  v30 = -[NSArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v44, v61, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v45;
    do
    {
      for (m = 0; m != v31; ++m)
      {
        if (*(_QWORD *)v45 != v32)
          objc_enumerationMutation(v29);
        -[CNFRegListController _setSpecifierEnabled:enabled:animated:](self, "_setSpecifierEnabled:enabled:animated:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * m), v5, v3);
      }
      v31 = -[NSArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v44, v61, 16);
    }
    while (v31);
  }

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v34 = self->_faceTimePhotosGroupSpecifiers;
  v35 = -[NSArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v40, v60, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v41;
    do
    {
      for (n = 0; n != v36; ++n)
      {
        if (*(_QWORD *)v41 != v37)
          objc_enumerationMutation(v34);
        -[CNFRegListController _setSpecifierEnabled:enabled:animated:](self, "_setSpecifierEnabled:enabled:animated:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * n), v5, v3);
      }
      v36 = -[NSArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v40, v60, 16);
    }
    while (v36);
  }

}

- (BOOL)showEnableSwitch
{
  return (*(_BYTE *)&self->_settingsFlags >> 3) & 1;
}

- (void)setShowEnableSwitch:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_settingsFlags = *(_BYTE *)&self->_settingsFlags & 0xF7 | v3;
}

- (BOOL)shouldShowCallDirectorySettingsBundleSpecifiers
{
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  BOOL result;

  -[CNFRegListController regController](self, "regController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "serviceType");

  -[CNFRegListController regController](self, "regController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isServiceEnabled");

  result = 0;
  if (!v4)
  {
    if (v6)
      return objc_msgSend(MEMORY[0x24BEB4930], "supportsPrimaryCalling") ^ 1;
  }
  return result;
}

- (BOOL)shouldShowIncomingCallSettingsBundleSpecifiers
{
  void *v3;
  uint64_t v4;
  void *v5;
  char v6;

  -[CNFRegListController regController](self, "regController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "serviceType");

  -[CNFRegListController regController](self, "regController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isServiceEnabled");

  if (v4)
    return 0;
  else
    return v6;
}

- (BOOL)shouldShowReceiveRelayCalls
{
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  int v7;

  -[CNFRegListController regController](self, "regController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "serviceType");

  -[CNFRegListController regController](self, "regController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isServiceEnabled");

  LOBYTE(v7) = 0;
  if (!v4)
  {
    if (v6)
    {
      v7 = objc_msgSend(MEMORY[0x24BEB4930], "supportsRelayCalling");
      if (v7)
        LOBYTE(v7) = objc_msgSend(MEMORY[0x24BEB4930], "supportsPrimaryCalling") ^ 1;
    }
  }
  return v7;
}

- (BOOL)shouldShowSiriSpecifiers
{
  void *v3;
  uint64_t v4;
  void *v5;
  char v6;

  -[CNFRegListController regController](self, "regController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "serviceType");

  -[CNFRegListController regController](self, "regController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isServiceEnabled");

  if (v4)
    return 0;
  else
    return v6;
}

- (BOOL)shouldShowReceiveThumperCalls
{
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  int v7;

  -[CNFRegListController regController](self, "regController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "serviceType");

  -[CNFRegListController regController](self, "regController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isServiceEnabled");

  LOBYTE(v7) = 0;
  if (!v4)
  {
    if (v6)
    {
      v7 = objc_msgSend(MEMORY[0x24BEB4930], "supportsThumperCalling");
      if (v7)
        LOBYTE(v7) = objc_msgSend(MEMORY[0x24BEB4930], "supportsPrimaryCalling") ^ 1;
    }
  }
  return v7;
}

- (id)accountToShowInCallerIDFooter
{
  void *v2;
  void *v3;

  -[CNFRegSettingsController _appleIDAccounts](self, "_appleIDAccounts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)refreshiMessageAccountFooterText:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  id v9;
  _QWORD block[4];
  id v12;
  CNFRegSettingsController *v13;
  id location;

  v4 = (int)*MEMORY[0x24BE756E0];
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + v4), "specifierForID:", CFSTR("FACETIME_CALLERID_GROUP_ID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + v4), "specifierForID:", CFSTR("FACETIME_ALIAS_GROUP_ID"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
  {
    -[CNFRegSettingsController configureAccountFooterForGroupSpecifier:](self, "configureAccountFooterForGroupSpecifier:", v5);
    -[CNFRegSettingsController clearFooterFromSpecifier:](self, "clearFooterFromSpecifier:", v7);
  }
  else
  {
    if (!v6)
    {
      v8 = 0;
      goto LABEL_6;
    }
    -[CNFRegSettingsController configureAccountFooterForGroupSpecifier:](self, "configureAccountFooterForGroupSpecifier:", v6);
  }
  v8 = 1;
LABEL_6:
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__CNFRegSettingsController_refreshiMessageAccountFooterText___block_invoke;
  block[3] = &unk_24D075680;
  v12 = v5;
  v13 = self;
  v9 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&location);
  return v8;
}

uint64_t __61__CNFRegSettingsController_refreshiMessageAccountFooterText___block_invoke(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 32))
    objc_msgSend(*(id *)(a1 + 40), "reloadSpecifierID:", CFSTR("FACETIME_CALLERID_GROUP_ID"));
  return objc_msgSend(*(id *)(a1 + 40), "reloadSpecifierID:", CFSTR("FACETIME_ALIAS_GROUP_ID"));
}

- (void)clearFooterFromSpecifier:(id)a3
{
  uint64_t v3;
  id v4;

  v3 = *MEMORY[0x24BE75A30];
  v4 = a3;
  objc_msgSend(v4, "removePropertyForKey:", v3);
  objc_msgSend(v4, "removePropertyForKey:", *MEMORY[0x24BE75A58]);

}

- (void)configureAccountFooterForGroupSpecifier:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSUInteger v18;
  NSUInteger v19;
  NSUInteger v20;
  void *v21;
  id v22;
  NSRange v23;

  v22 = a3;
  -[CNFRegSettingsController accountToShowInCallerIDFooter](self, "accountToShowInCallerIDFooter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = _os_feature_enabled_impl();
    CommunicationsSetupUIBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    CNFRegStringTableName();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      v8 = CFSTR("FACETIME_SETTINGS_ALIAS_LABEL_FOOTER_APPLEACCOUNT");
    else
      v8 = CFSTR("FACETIME_SETTINGS_ALIAS_LABEL_FOOTER");
    objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_24D077260, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setProperty:forKey:", v11, *MEMORY[0x24BE75A30]);

    objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", self);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setProperty:forKey:", v12, *MEMORY[0x24BE75A50]);

    NSStringFromSelector(sel_accountTappedWithSpecifier_);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setProperty:forKey:", v13, *MEMORY[0x24BE75A38]);

    v14 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v4, "loginDisplayString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", v9, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "setProperty:forKey:", v16, *MEMORY[0x24BE75A58]);
    objc_msgSend(v4, "loginDisplayString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "rangeOfString:", v17);
    v20 = v19;

    v23.location = v18;
    v23.length = v20;
    NSStringFromRange(v23);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setProperty:forKey:", v21, *MEMORY[0x24BE75A40]);

  }
  else
  {
    -[CNFRegSettingsController clearFooterFromSpecifier:](self, "clearFooterFromSpecifier:", v22);
  }

}

- (void)configureSignOutForSpecifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a3;
  CommunicationsSetupUIBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CNFRegStringTableName();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("FACETIME_ACCOUNT_POPUP_SIGN_OUT"), &stru_24D077260, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setName:", v6);

  CommunicationsSetupUIBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  CNFRegStringTableName();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("FACETIME_ACCOUNT_POPUP_SIGN_OUT"), &stru_24D077260, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProperty:forKey:", v9, *MEMORY[0x24BE75D50]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProperty:forKey:", v10, *MEMORY[0x24BE75A18]);

  objc_msgSend(v3, "setButtonAction:", sel_signoutAccount_);
  NSStringFromSelector(sel_signoutAccount_);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProperty:forKey:", v11, *MEMORY[0x24BE75900]);

}

- (void)showReceiveRelayCallsSettings:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  char v19;
  int v20;
  __CFString *v21;
  void *v22;
  char v23;
  uint64_t v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v4 = a4;
  v43 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    -[CNFRegSettingsController showSpecifiers:afterGroupId:animated:](self, "showSpecifiers:afterGroupId:animated:", self->_receiveRelayCallsGroupSpecifiers, CFSTR("FACETIME_ENABLED_GROUP_ID"), a4);
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]), "specifierForID:", CFSTR("RECEIVE_RELAYED_PHONE_CALLS_GROUP_ID"));
    v37 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE30338], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isTelephonyDevice");

    if (v7)
    {
      CommunicationsSetupUIBundle();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      CNFStringKeyForNetwork(CFSTR("RELAY_CALLS_HOST_FOOTER"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      CNFRegStringTableName();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringForKey:value:table:", v9, &stru_24D077260, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_30:

      -[CNFRegListController _setLabel:forSpecifier:header:](self, "_setLabel:forSpecifier:header:", v11, v37, 0);
      return;
    }
    objc_msgSend(MEMORY[0x24BEB4930], "outgoingRelayCallerID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFRegListController regController](self, "regController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "displayAlias");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(MEMORY[0x24BEB4930], "isThumperCallingEnabled"))
    {
      if (!v8
        || (objc_msgSend(v9, "alias"),
            v18 = (void *)objc_claimAutoreleasedReturnValue(),
            v19 = objc_msgSend(v18, "isEqualToString:", v8),
            v18,
            (v19 & 1) != 0))
      {
        v20 = objc_msgSend(MEMORY[0x24BEB4930], "supportsThumperCallingOverCellularData");
        CommunicationsSetupUIBundle();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
          v21 = CFSTR("RELAY_CALLS_CLIENT_FOOTER_THUMPER_CELLULAR");
        else
          v21 = CFSTR("RELAY_CALLS_CLIENT_FOOTER_THUMPER");
        CNFStringKeyForNetworkAndProduct(v21);
        v24 = objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      }
      v27 = objc_msgSend(MEMORY[0x24BEB4930], "supportsThumperCallingOverCellularData");
      CommunicationsSetupUIBundle();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27)
        v29 = CFSTR("RELAY_CALLS_CLIENT_FOOTER_WITH_CALLER_ID_THUMPER_CELLULAR_%@");
      else
        v29 = CFSTR("RELAY_CALLS_CLIENT_FOOTER_WITH_CALLER_ID_THUMPER_%@");
      CNFStringKeyForNetworkAndProduct(v29);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      CNFRegStringTableName();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "localizedStringForKey:value:table:", v33, &stru_24D077260, v34);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v30 = (void *)MEMORY[0x24BDD17C8];
      CommunicationsSetupUIBundle();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      CNFRegStringTableName();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v25;
      v32 = v10;
    }
    else
    {
      if (!v8
        || (objc_msgSend(v9, "alias"),
            v22 = (void *)objc_claimAutoreleasedReturnValue(),
            v23 = objc_msgSend(v22, "isEqualToString:", v8),
            v22,
            (v23 & 1) != 0))
      {
        CommunicationsSetupUIBundle();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        CNFStringKeyForNetwork(CFSTR("RELAY_CALLS_CLIENT_FOOTER"));
        v24 = objc_claimAutoreleasedReturnValue();
LABEL_22:
        v25 = (void *)v24;
        CNFRegStringTableName();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "localizedStringForKey:value:table:", v25, &stru_24D077260, v26);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_29:

        goto LABEL_30;
      }
      v30 = (void *)MEMORY[0x24BDD17C8];
      CommunicationsSetupUIBundle();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      CNFStringKeyForNetwork(CFSTR("RELAY_CALLS_CLIENT_FOOTER_WITH_CALLER_ID_%@"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      CNFRegStringTableName();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v10;
      v32 = v25;
    }
    objc_msgSend(v31, "localizedStringForKey:value:table:", v32, &stru_24D077260, v26);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    CNFRegFormattedPhoneNumberForString(v8);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "stringWithFormat:", v35, v36);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_29;
  }
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v12 = self->_receiveRelayCallsGroupSpecifiers;
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v39 != v15)
          objc_enumerationMutation(v12);
        -[CNFRegSettingsController removeSpecifier:animated:](self, "removeSpecifier:animated:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i), v4);
      }
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    }
    while (v14);
  }

}

- (void)refreshReceiveRelayCallsSettingsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  NSArray *v5;
  NSObject *v6;
  uint8_t v7[16];

  v3 = a3;
  v5 = self->_receiveRelayCallsGroupSpecifiers;
  if (v5)
  {
    OSLogHandleForIDSCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_2138BA000, v6, OS_LOG_TYPE_DEFAULT, "Refreshing receive relay calls settings", v7, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      IMLogString();
    if (-[CNFRegSettingsController shouldShowReceiveRelayCalls](self, "shouldShowReceiveRelayCalls"))
    {
      -[CNFRegSettingsController showReceiveRelayCallsSettings:animated:](self, "showReceiveRelayCallsSettings:animated:", 1, v3);
      if (-[CNFRegSettingsController shouldShowReceiveThumperCalls](self, "shouldShowReceiveThumperCalls"))
        -[CNFRegSettingsController removeSpecifierID:animated:](self, "removeSpecifierID:animated:", CFSTR("RECEIVE_RELAYED_PHONE_CALLS_ID"), v3);
      -[CNFRegSettingsController reloadSpecifierID:animated:](self, "reloadSpecifierID:animated:", CFSTR("RECEIVE_RELAYED_PHONE_CALLS_ID"), v3);
    }
    else
    {
      -[CNFRegSettingsController showReceiveRelayCallsSettings:animated:](self, "showReceiveRelayCallsSettings:animated:", 0, v3);
    }
  }

}

- (void)showAllSettings:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;

  v4 = a4;
  v5 = a3;
  -[CNFRegSettingsController showAccounts:animated:](self, "showAccounts:animated:");
  -[CNFRegSettingsController showAliases:animated:](self, "showAliases:animated:", v5, v4);
  -[CNFRegSettingsController showCallerId:animated:](self, "showCallerId:animated:", v5, v4);
}

- (id)getAccountNameForSpecifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  __CFString *v6;

  v3 = a3;
  objc_msgSend(v3, "CNFRegAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "CNFRegAccount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "loginDisplayString");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = &stru_24D077260;
  }

  return v6;
}

- (void)_showAccountAlertForAccount:(id)a3
{
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
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  _QWORD v28[5];
  id v29;

  v4 = a3;
  if (v4)
  {
    CommunicationsSetupUIBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    CNFRegStringTableName();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("FACETIME_ACCOUNT_POPUP_TITLE"), &stru_24D077260, v6);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "loginDisplayString");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    CommunicationsSetupUIBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    CNFRegStringTableName();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("FACETIME_ALERT_CANCEL"), &stru_24D077260, v8);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v25, v24, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD3A8], "actionWithTitle:style:handler:", v23, 1, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addAction:", v10);

    CommunicationsSetupUIBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    CNFRegStringTableName();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("FACETIME_ACCOUNT_POPUP_EDIT_LOCATION"), &stru_24D077260, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = MEMORY[0x24BDAC760];
    v15 = (void *)MEMORY[0x24BEBD3A8];
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __56__CNFRegSettingsController__showAccountAlertForAccount___block_invoke;
    v28[3] = &unk_24D075BA0;
    v28[4] = self;
    v16 = v4;
    v29 = v16;
    objc_msgSend(v15, "actionWithTitle:style:handler:", v13, 0, v28);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addAction:", v17);

    CommunicationsSetupUIBundle();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    CNFRegStringTableName();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("FACETIME_ACCOUNT_POPUP_SIGN_OUT"), &stru_24D077260, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = (void *)MEMORY[0x24BEBD3A8];
    v26[0] = v14;
    v26[1] = 3221225472;
    v26[2] = __56__CNFRegSettingsController__showAccountAlertForAccount___block_invoke_2;
    v26[3] = &unk_24D075BA0;
    v26[4] = self;
    v27 = v16;
    objc_msgSend(v21, "actionWithTitle:style:handler:", v20, 0, v26);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addAction:", v22);

    -[CNFRegSettingsController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);
  }

}

uint64_t __56__CNFRegSettingsController__showAccountAlertForAccount___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_showLocaleChooserWithAccount:", *(_QWORD *)(a1 + 40));
}

void __56__CNFRegSettingsController__showAccountAlertForAccount___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "regController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "signoutAccount:", *(_QWORD *)(a1 + 40));

}

- (void)accountTappedWithSpecifier:(id)a3
{
  void *v4;
  int v5;
  id v6;

  if (-[CNFRegSettingsController _shouldDisableAccountConfigurationUI](self, "_shouldDisableAccountConfigurationUI", a3))
  {
    -[CNFRegSettingsController refreshFaceTimeSettingsAnimated:](self, "refreshFaceTimeSettingsAnimated:", 0);
  }
  else
  {
    -[CNFRegSettingsController accountToShowInCallerIDFooter](self, "accountToShowInCallerIDFooter");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[CNFRegListController regController](self, "regController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "accountStateForAccount:", v6);

    if (v6 && (v5 & 0x40000000) != 0)
      -[CNFRegSettingsController _showAccountAlertForAccount:](self, "_showAccountAlertForAccount:", v6);
    else
      -[CNFRegSettingsController _showSignInController](self, "_showSignInController");

  }
}

- (void)signoutAccount:(id)a3
{
  void *v4;
  id v5;

  -[CNFRegSettingsController accountToShowInCallerIDFooter](self, "accountToShowInCallerIDFooter", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CNFRegListController regController](self, "regController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "signoutAccount:", v5);

}

- (id)accountSpecifiers
{
  return -[NSArray subarrayWithRange:](self->_accountGroupSpecifiers, "subarrayWithRange:", 1, -[NSArray count](self->_accountGroupSpecifiers, "count") - 1);
}

- (void)_reloadSpecifier:(id)a3 withBlock:(id)a4
{
  void (**v6)(id, id);
  id v7;

  v7 = a3;
  v6 = (void (**)(id, id))a4;
  if (v7)
  {
    if (v6)
      v6[2](v6, v7);
    -[CNFRegSettingsController reloadSpecifier:](self, "reloadSpecifier:", v7);
  }

}

- (id)_specifierIdentifierForAccount:(id)a3
{
  void *v3;
  __CFString *v4;
  void *v5;

  if (a3)
  {
    objc_msgSend(a3, "login");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(CFSTR("account:"), "stringByAppendingString:", v3);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(CFSTR("account:"), "stringByAppendingString:", v5);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v4 = CFSTR("empty-account");
  }
  return v4;
}

- (id)createSpecifierForAccount:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v4 = a3;
  v5 = _os_feature_enabled_impl();
  CommunicationsSetupUIBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  CNFRegStringTableName();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = CFSTR("FACETIME_SETTINGS_ACCOUNT_LABEL");
  if (v5)
    v8 = CFSTR("FACETIME_SETTINGS_ACCOUNT_LABEL_APPLEACCOUNT");
  v9 = CFSTR("FACETIME_ACCOUNT_INFO_UNAVAILABLE_APPLEACCOUNT");
  if (!v5)
    v9 = CFSTR("FACETIME_ACCOUNT_INFO_UNAVAILABLE");
  if (v4)
    v10 = v8;
  else
    v10 = v9;
  objc_msgSend(v6, "localizedStringForKey:value:table:", v10, &stru_24D077260, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_opt_class();
  -[CNFRegSettingsController _specifierIdentifierForAccount:](self, "_specifierIdentifierForAccount:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v11, self, 0, sel_getAccountNameForSpecifier_, 0, 2, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setButtonAction:", sel_accountTappedWithSpecifier_);
  NSStringFromSelector(sel_accountTappedWithSpecifier_);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setProperty:forKey:", v15, *MEMORY[0x24BE75900]);

  objc_msgSend(v14, "setProperty:forKey:", v12, *MEMORY[0x24BE75948]);
  objc_msgSend(v14, "setProperty:forKey:", v11, *MEMORY[0x24BE75D50]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setProperty:forKey:", v16, *MEMORY[0x24BE75860]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setProperty:forKey:", v17, *MEMORY[0x24BE75A18]);

  objc_msgSend(v14, "setProperty:forKey:", v4, CFSTR("cnfreg-account"));
  objc_msgSend(v14, "setProperty:forKey:", v13, *MEMORY[0x24BE75AC0]);

  return v14;
}

- (void)refreshAccountsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  __CFString *v26;
  __CFString *v27;
  NSObject *v28;
  id v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  _BOOL8 v45;
  id *location;
  void *v47;
  void *v48;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t v54[128];
  uint8_t buf[4];
  id v56;
  __int16 v57;
  id v58;
  __int16 v59;
  void *v60;
  uint64_t v61;

  v3 = a3;
  v61 = *MEMORY[0x24BDAC8D0];
  if (!-[CNFRegSettingsController hideAppleIDLogin](self, "hideAppleIDLogin"))
  {
    v5 = -[CNFRegSettingsController refreshiMessageAccountFooterText:](self, "refreshiMessageAccountFooterText:", v3);
    -[CNFRegSettingsController accountToShowInCallerIDFooter](self, "accountToShowInCallerIDFooter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFRegSettingsController accountSpecifiers](self, "accountSpecifiers");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v49, "mutableCopy");
    v8 = v7;
    if (v6)
      v9 = v5;
    else
      v9 = 1;
    v10 = objc_msgSend(v7, "count");
    v11 = v10;
    if (v9 == 1)
    {
      if (v10)
      {
        v12 = (void *)objc_msgSend(v8, "copy");
        objc_msgSend(v8, "removeAllObjects");
        if (v6)
          goto LABEL_13;
      }
      else
      {
        v12 = 0;
        if (v6)
          goto LABEL_13;
      }
      if (objc_msgSend(v8, "count"))
      {
LABEL_13:
        if (v11)
        {
          v48 = v12;
          v13 = 0;
LABEL_18:
          location = (id *)&self->_accountGroupSpecifiers;
          -[NSArray objectAtIndex:](self->_accountGroupSpecifiers, "objectAtIndex:", 0);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          OSLogHandleForIDSCategory();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            -[CNFRegListController specifiers](self, "specifiers");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[CNFRegSettingsController _makeRedactedIdentifiersFromSpecifiers:](self, "_makeRedactedIdentifiersFromSpecifiers:", v16);
            v17 = (id)objc_claimAutoreleasedReturnValue();
            -[CNFRegSettingsController _makeRedactedIdentifiersFromSpecifiers:](self, "_makeRedactedIdentifiersFromSpecifiers:", v48);
            v18 = (id)objc_claimAutoreleasedReturnValue();
            -[CNFRegSettingsController _makeRedactedIdentifiersFromSpecifiers:](self, "_makeRedactedIdentifiersFromSpecifiers:", v13);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v56 = v17;
            v57 = 2112;
            v58 = v18;
            v59 = 2112;
            v60 = v19;
            _os_log_impl(&dword_2138BA000, v15, OS_LOG_TYPE_DEFAULT, "CNFRegSettingsController: before batch updates: current: %@, removed: %@, added: %@", buf, 0x20u);

          }
          if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
          {
            -[CNFRegListController specifiers](self, "specifiers");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[CNFRegSettingsController _makeRedactedIdentifiersFromSpecifiers:](self, "_makeRedactedIdentifiersFromSpecifiers:", v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[CNFRegSettingsController _makeRedactedIdentifiersFromSpecifiers:](self, "_makeRedactedIdentifiersFromSpecifiers:", v48);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[CNFRegSettingsController _makeRedactedIdentifiersFromSpecifiers:](self, "_makeRedactedIdentifiersFromSpecifiers:", v13);
            v42 = v22;
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = v21;
            IMLogString();

          }
          -[CNFRegSettingsController beginUpdates](self, "beginUpdates", v40, v42, v44);
          if (v48)
          {
            OSLogHandleForIDSCategory();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              -[CNFRegSettingsController _makeRedactedIdentifiersFromSpecifiers:](self, "_makeRedactedIdentifiersFromSpecifiers:", *location);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v56 = v24;
              _os_log_impl(&dword_2138BA000, v23, OS_LOG_TYPE_DEFAULT, "CNFRegSettingsController: removing via removeContiguousSpecifiers %@", buf, 0xCu);

            }
            if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
            {
              -[CNFRegSettingsController _makeRedactedIdentifiersFromSpecifiers:](self, "_makeRedactedIdentifiersFromSpecifiers:", *location);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              IMLogString();

            }
            -[CNFRegSettingsController removeContiguousSpecifiers:animated:](self, "removeContiguousSpecifiers:animated:", *location, v3, v41);
          }
          if (v13)
          {
            -[CNFRegSettingsController specifierForID:](self, "specifierForID:", CFSTR("FACETIME_CALLERID_GROUP_ID"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = CFSTR("FACETIME_ALIAS_GROUP_ID");
            if (v25)
              v26 = CFSTR("FACETIME_CALLERID_GROUP_ID");
            v27 = v26;

            objc_msgSend(v13, "insertObject:atIndex:", v47, 0);
            OSLogHandleForIDSCategory();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              -[CNFRegSettingsController _makeRedactedIdentifiersFromSpecifiers:](self, "_makeRedactedIdentifiersFromSpecifiers:", v13);
              v29 = (id)objc_claimAutoreleasedReturnValue();
              -[CNFRegSettingsController _makeRedactedIdentifierFromSpecifierId:](self, "_makeRedactedIdentifierFromSpecifierId:", v27);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v56 = v29;
              v57 = 2112;
              v58 = v30;
              v59 = 1024;
              LODWORD(v60) = v3;
              _os_log_impl(&dword_2138BA000, v28, OS_LOG_TYPE_DEFAULT, "CNFRegSettingsController: adding via showSpecifiers %@ afterGroupId %@ animated %d", buf, 0x1Cu);

            }
            if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
            {
              -[CNFRegSettingsController _makeRedactedIdentifiersFromSpecifiers:](self, "_makeRedactedIdentifiersFromSpecifiers:", v13);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              -[CNFRegSettingsController _makeRedactedIdentifierFromSpecifierId:](self, "_makeRedactedIdentifierFromSpecifierId:", v27);
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              v45 = v3;
              v41 = v31;
              IMLogString();

            }
            -[CNFRegSettingsController showSpecifiers:afterGroupId:animated:](self, "showSpecifiers:afterGroupId:animated:", v13, v27, v3, v41, v43, v45);

          }
          -[CNFRegSettingsController endUpdates](self, "endUpdates");
          OSLogHandleForIDSCategory();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            -[CNFRegListController specifiers](self, "specifiers");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            -[CNFRegSettingsController _makeRedactedIdentifiersFromSpecifiers:](self, "_makeRedactedIdentifiersFromSpecifiers:", v33);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v56 = v34;
            _os_log_impl(&dword_2138BA000, v32, OS_LOG_TYPE_DEFAULT, "CNFRegSettingsController: after batch updates: current: %@", buf, 0xCu);

          }
          if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
          {
            -[CNFRegListController specifiers](self, "specifiers");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            -[CNFRegSettingsController _makeRedactedIdentifiersFromSpecifiers:](self, "_makeRedactedIdentifiersFromSpecifiers:", v35);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            IMLogString();

          }
          objc_msgSend(v8, "insertObject:atIndex:", v47, 0, v41);
          objc_storeStrong(location, v8);

          if (v13)
          {
            v52 = 0u;
            v53 = 0u;
            v50 = 0u;
            v51 = 0u;
            v36 = v13;
            v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
            if (v37)
            {
              v38 = *(_QWORD *)v51;
              do
              {
                for (i = 0; i != v37; ++i)
                {
                  if (*(_QWORD *)v51 != v38)
                    objc_enumerationMutation(v36);
                  -[CNFRegSettingsController reloadSpecifier:](self, "reloadSpecifier:", *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i));
                }
                v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
              }
              while (v37);
            }

          }
          v12 = v48;
        }
LABEL_54:

        return;
      }
      v48 = v12;
      -[CNFRegSettingsController createSpecifierForAccount:](self, "createSpecifierForAccount:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v14);
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v14);
    }
    else
    {
      if (v10)
      {
        v12 = 0;
        goto LABEL_54;
      }
      -[CNFRegSettingsController createSpecifierForAccount:](self, "createSpecifierForAccount:", v6);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v14);
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v14);
      v48 = 0;
    }

    goto LABEL_18;
  }
}

- (BOOL)showAccounts:(BOOL)a3 animated:(BOOL)a4
{
  uint64_t v5;
  void *v6;
  void *v7;

  if (a3)
  {
    -[CNFRegSettingsController refreshAccountsAnimated:](self, "refreshAccountsAnimated:", 1, a4);
  }
  else
  {
    -[CNFRegSettingsController removeContiguousSpecifiers:animated:](self, "removeContiguousSpecifiers:animated:", self->_accountGroupSpecifiers, a4);
    v5 = (int)*MEMORY[0x24BE756E0];
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + v5), "specifierForID:", CFSTR("FACETIME_CALLERID_GROUP_ID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + v5), "specifierForID:", CFSTR("FACETIME_ALIAS_GROUP_ID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFRegSettingsController clearFooterFromSpecifier:](self, "clearFooterFromSpecifier:", v6);
    -[CNFRegSettingsController clearFooterFromSpecifier:](self, "clearFooterFromSpecifier:", v7);
    -[CNFRegSettingsController reloadSpecifier:](self, "reloadSpecifier:", v6);
    -[CNFRegSettingsController reloadSpecifier:](self, "reloadSpecifier:", v7);

  }
  return 1;
}

- (void)firstRunControllerDidFinish:(id)a3 finished:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  CNFRegSettingsController *v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v4 = a4;
  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  OSLogHandleForIDSCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2138BA000, v7, OS_LOG_TYPE_DEFAULT, "First run controller finished", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    IMLogString();
  OSLogHandleForIDSCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[CNFRegSettingsController navigationController](self, "navigationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "visibleViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v21 = v10;
    _os_log_impl(&dword_2138BA000, v8, OS_LOG_TYPE_DEFAULT, "Visible controller: %@", buf, 0xCu);

  }
  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    -[CNFRegSettingsController navigationController](self, "navigationController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "visibleViewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    IMLogString();

  }
  OSLogHandleForIDSCategory();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    -[CNFRegSettingsController presentedViewController](self, "presentedViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v21 = v13;
    _os_log_impl(&dword_2138BA000, v12, OS_LOG_TYPE_DEFAULT, "Presented view controller: %@", buf, 0xCu);

  }
  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    -[CNFRegSettingsController presentedViewController](self, "presentedViewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    IMLogString();

  }
  -[CNFRegSettingsController navigationController](self, "navigationController", v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "visibleViewController");
  v15 = (CNFRegSettingsController *)objc_claimAutoreleasedReturnValue();
  v16 = v15 == self;

  if (!v16)
  {
    -[CNFRegSettingsController presentedViewController](self, "presentedViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dismiss");

  }
  objc_msgSend(v6, "setDelegate:", 0);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFRegSettingsController setFaceTimeEnabled:specifier:](self, "setFaceTimeEnabled:specifier:", v18, 0);

  }
}

- (BOOL)authenticationController:(id)a3 shouldContinueWithAuthenticationResults:(id)a4 error:(id)a5 forContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  BOOL v16;
  void *v17;
  uint64_t v18;
  void *v19;
  BOOL v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  CNFAccountRegistrar *v27;
  void *v28;
  CNFAccountRegistrar *v29;
  NSObject *v30;
  NSObject *v31;
  dispatch_semaphore_t v33;
  _QWORD v34[5];
  NSObject *v35;
  __int128 *p_buf;
  uint8_t v37[4];
  void *v38;
  __int128 buf;
  uint64_t v40;
  char v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v12)
  {
    objc_msgSend(v11, "objectForKey:", *MEMORY[0x24BE0ABF0]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", *MEMORY[0x24BE0ABD0]);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v18;
    v16 = 0;
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v40 = 0x2020000000;
    v41 = 0;
    if (v17)
      v20 = v18 == 0;
    else
      v20 = 1;
    if (v20)
      goto LABEL_40;
    OSLogHandleForIDSCategory();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v37 = 0;
      _os_log_impl(&dword_2138BA000, v21, OS_LOG_TYPE_DEFAULT, "Obtained user/pass from AuthKit.", v37, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      IMLogString();
    -[CNFRegListController regController](self, "regController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "serviceType");

    if (v23)
    {
      if (v23 == 1)
      {
        objc_msgSend(MEMORY[0x24BE50370], "iMessageService");
        v24 = objc_claimAutoreleasedReturnValue();
LABEL_27:
        v25 = (void *)v24;
        if (v24)
        {
          v33 = dispatch_semaphore_create(0);
          OSLogHandleForIDSCategory();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v37 = 138412290;
            v38 = v25;
            _os_log_impl(&dword_2138BA000, v26, OS_LOG_TYPE_DEFAULT, "Registering for service: %@", v37, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
            IMLogString();
          v27 = [CNFAccountRegistrar alloc];
          -[CNFRegListController regController](self, "regController");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = -[CNFAccountRegistrar initWithServiceType:presentationViewController:](v27, "initWithServiceType:presentationViewController:", objc_msgSend(v28, "serviceType"), self);

          v34[0] = MEMORY[0x24BDAC760];
          v34[1] = 3221225472;
          v34[2] = __110__CNFRegSettingsController_authenticationController_shouldContinueWithAuthenticationResults_error_forContext___block_invoke;
          v34[3] = &unk_24D075BC8;
          p_buf = &buf;
          v34[4] = self;
          v30 = v33;
          v35 = v30;
          -[CNFAccountRegistrar registerAccountWithUsername:password:service:completionBlock:](v29, "registerAccountWithUsername:password:service:completionBlock:", v17, v19, v25, v34);
          dispatch_semaphore_wait(v30, 0xFFFFFFFFFFFFFFFFLL);

LABEL_39:
          v16 = *(_BYTE *)(*((_QWORD *)&buf + 1) + 24) != 0;
LABEL_40:
          _Block_object_dispose(&buf, 8);

          goto LABEL_41;
        }
LABEL_34:
        OSLogHandleForIDSCategory();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v37 = 0;
          _os_log_impl(&dword_2138BA000, v31, OS_LOG_TYPE_DEFAULT, "Couldn't determine a service from the regController.", v37, 2u);
        }

        if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
          IMLogString();
        goto LABEL_39;
      }
      if (v23 != 2)
        goto LABEL_34;
    }
    objc_msgSend(MEMORY[0x24BE50370], "facetimeService");
    v24 = objc_claimAutoreleasedReturnValue();
    goto LABEL_27;
  }
  OSLogHandleForIDSCategory();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v12;
    _os_log_impl(&dword_2138BA000, v14, OS_LOG_TYPE_DEFAULT, "AuthKit had an error authenticating: %@", (uint8_t *)&buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    IMLogString();
  OSLogHandleForIDSCategory();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_2138BA000, v15, OS_LOG_TYPE_DEFAULT, "NOT registering.", (uint8_t *)&buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    IMLogString();
  v16 = 0;
LABEL_41:

  return v16;
}

void __110__CNFRegSettingsController_authenticationController_shouldContinueWithAuthenticationResults_error_forContext___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  uint8_t v9[16];
  uint8_t buf[16];

  v5 = a3;
  v6 = v5;
  if (a2)
  {
    OSLogHandleForIDSCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2138BA000, v7, OS_LOG_TYPE_DEFAULT, "Successfully registered.", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      IMLogString();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  else if (v5)
  {
    OSLogHandleForIDSCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_2138BA000, v8, OS_LOG_TYPE_DEFAULT, "Failed registration. Showing alert.", v9, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      IMLogString();
    objc_msgSend(*(id *)(a1 + 32), "dismissModalViewControllerWithTransition:", 0);
    objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v6, 1, 0);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

- (void)_showSignInController
{
  id v3;
  int v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int (*v12)(void);
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v3 = objc_alloc_init(MEMORY[0x24BE0AE28]);
  objc_msgSend(v3, "setPresentingViewController:", self);
  v4 = _os_feature_enabled_impl();
  CommunicationsSetupUIBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CNFRegStringTableName();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v7 = CFSTR("FACETIME_SIGNIN_SETTINGS_BLURB_APPLEACCOUNT");
  else
    v7 = CFSTR("FACETIME_SIGNIN_SETTINGS_BLURB");
  objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_24D077260, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setReason:", v8);

  objc_msgSend(v3, "setShouldForceInteractiveAuth:", 1);
  -[CNFRegListController regController](self, "regController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "serviceType");

  if (v10 == 1)
    v11 = 4;
  else
    v11 = 5;
  objc_msgSend(v3, "setServiceType:", v11);
  v12 = (unsigned int (*)(void))CUTWeakLinkSymbol();
  if (v12 && v12())
    objc_msgSend(v3, "setIsUsernameEditable:", 0);
  -[CNFRegSettingsController primaryAppleAccount](self, "primaryAppleAccount");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "username");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "length"))
  {
    objc_msgSend(v3, "setUsername:", v14);
    objc_msgSend(v3, "setReason:", v14);
    objc_msgSend(v3, "setShouldForceInteractiveAuth:", 0);
  }
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__0;
  v21 = __Block_byref_object_dispose__0;
  v22 = objc_alloc_init(MEMORY[0x24BE0ACC0]);
  objc_msgSend((id)v18[5], "setDelegate:", self);
  v15 = (void *)v18[5];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __49__CNFRegSettingsController__showSignInController__block_invoke;
  v16[3] = &unk_24D075BF0;
  v16[4] = &v17;
  objc_msgSend(v15, "authenticateWithContext:completion:", v3, v16);
  _Block_object_dispose(&v17, 8);

}

void __49__CNFRegSettingsController__showSignInController__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = a3;
  if (v5)
  {
    OSLogHandleForIDSCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v8 = v5;
      _os_log_impl(&dword_2138BA000, v6, OS_LOG_TYPE_DEFAULT, "Error getting credentials using AuthKit: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      IMLogString();
  }

}

- (id)primaryAppleAccount
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)MEMORY[0x2199B8CB8](self, a2);
  v3 = objc_alloc_init((Class)CUTWeakLinkClass());
  objc_msgSend(v3, "aa_primaryAppleAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v2);
  return v4;
}

- (void)_showViewAccountControllerForAccount:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  CNFRegViewAccountController *v7;
  void *v8;
  CNFRegViewAccountController *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  OSLogHandleForIDSCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v4;
    _os_log_impl(&dword_2138BA000, v5, OS_LOG_TYPE_DEFAULT, "_showViewAccountControllerForAccount: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    IMLogString();
  if (v4)
  {
    +[CNFRegAppearanceController globalAppearanceController](CNFRegAppearanceController, "globalAppearanceController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = [CNFRegViewAccountController alloc];
    -[CNFRegListController regController](self, "regController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[CNFRegSecureAccountWebViewController initWithRegController:account:](v7, "initWithRegController:account:", v8, v4);

    -[CNFRegViewAccountController setDelegate:](v9, "setDelegate:", self);
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", v9);
    objc_msgSend(v10, "setModalPresentationStyle:", objc_msgSend(v6, "modalPresentationStyle"));
    v11 = objc_msgSend(v6, "navigationBarStyle");
    objc_msgSend(v10, "navigationBar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBarStyle:", v11);

    v13 = objc_msgSend(v6, "navigationBarIsTranslucent");
    objc_msgSend(v10, "navigationBar");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTranslucent:", v13);

    -[CNFRegSettingsController _tearDownAllListeners](self, "_tearDownAllListeners");
    -[CNFRegSettingsController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, 0);

  }
}

- (void)_hideLocaleChooser
{
  void *v3;
  CNFRegSettingsController *v4;
  id v5;

  -[CNFRegSettingsController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visibleViewController");
  v4 = (CNFRegSettingsController *)objc_claimAutoreleasedReturnValue();

  if (v4 != self)
  {
    -[CNFRegSettingsController presentedViewController](self, "presentedViewController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dismiss");

  }
}

- (id)_localeChooserForAccount:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  CNFRegLocaleController *v8;
  void *v9;
  CNFRegLocaleController *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v4 = (objc_class *)MEMORY[0x24BE75588];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "setParentController:", self);
  -[CNFRegSettingsController rootController](self, "rootController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRootController:", v7);

  v8 = [CNFRegLocaleController alloc];
  -[CNFRegListController regController](self, "regController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CNFRegFirstRunController initWithRegController:account:](v8, "initWithRegController:account:", v9, v5);

  -[CNFRegSettingsController specifier](self, "specifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFRegFirstRunController setSpecifier:](v10, "setSpecifier:", v11);

  -[CNFRegFirstRunController setDelegate:](v10, "setDelegate:", self);
  -[CNFRegLocaleController setRootController:](v10, "setRootController:", v6);
  -[CNFRegLocaleController setParentController:](v10, "setParentController:", v6);
  -[CNFRegFirstRunController setCompletionControllerClass:](v10, "setCompletionControllerClass:", 0);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, v6, sel_dismiss);
  -[CNFRegFirstRunController setCustomLeftButton:](v10, "setCustomLeftButton:", v12);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 3, 0, 0);
  -[CNFRegFirstRunController setCustomRightButton:](v10, "setCustomRightButton:", v13);
  objc_msgSend(v6, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setClipsToBounds:", 1);

  v17[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setViewControllers:", v15);

  return v6;
}

- (void)_showLocaleChooserWithAccount:(id)a3
{
  BOOL v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = -[CNFRegListController _showWiFiAlertIfNecessary](self, "_showWiFiAlertIfNecessary");
  v5 = v7;
  if (!v4)
  {
    -[CNFRegSettingsController _localeChooserForAccount:](self, "_localeChooserForAccount:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      -[CNFRegSettingsController showController:animate:](self, "showController:animate:", v6, 1);

    v5 = v7;
  }

}

- (void)viewAccountControllerDidFinish:(id)a3 withAppleId:(id)a4
{
  _QWORD v5[5];

  objc_msgSend(a3, "setDelegate:", 0, a4);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __71__CNFRegSettingsController_viewAccountControllerDidFinish_withAppleId___block_invoke;
  v5[3] = &unk_24D075180;
  v5[4] = self;
  -[CNFRegSettingsController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v5);
}

uint64_t __71__CNFRegSettingsController_viewAccountControllerDidFinish_withAppleId___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setupAllListeners");
  return objc_msgSend(*(id *)(a1 + 32), "_updateControllerStateAnimated:", 1);
}

- (void)clearAccountCache
{
  NSMutableArray *addresses;

  addresses = self->_addresses;
  self->_addresses = 0;

}

- (id)aliasSpecifiers
{
  return -[NSArray subarrayWithRange:](self->_aliasGroupSpecifiers, "subarrayWithRange:", 1, -[NSArray count](self->_aliasGroupSpecifiers, "count") - 1);
}

- (BOOL)_shouldShowAliasInfo
{
  void *v3;
  uint64_t v4;
  char v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[CNFRegSettingsController _appleIDAccounts](self, "_appleIDAccounts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
    return 1;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[CNFRegListController regController](self, "regController", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "phoneAccounts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "CNFRegSignInComplete") & 1) != 0)
        {
          v5 = 1;
          goto LABEL_13;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v9)
        continue;
      break;
    }
  }

  -[CNFRegListController regController](self, "regController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v7, "serviceSupportsDeviceAliasEnablement");
LABEL_13:

  return v5;
}

- (void)refreshAliasesAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  unint64_t v26;
  BOOL v27;
  unint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t j;
  void *v45;
  void *v46;
  SEL v47;
  _BOOL4 v48;
  void *v49;
  void *v50;
  unint64_t v51;
  id obj;
  void *v53;
  CNFRegSettingsController *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  void *v64;
  void *v65;
  uint8_t buf[4];
  void *v67;
  _BYTE v68[128];
  uint64_t v69;

  v3 = a3;
  v69 = *MEMORY[0x24BDAC8D0];
  if (-[CNFRegSettingsController _shouldShowAliasInfo](self, "_shouldShowAliasInfo"))
  {
    v47 = a2;
    v48 = v3;
    -[CNFRegSettingsController showAliases:animated:](self, "showAliases:animated:", 1, v3);
    v54 = self;
    -[CNFRegSettingsController _useableAccounts](self, "_useableAccounts");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFRegListController regController](self, "regController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allAvailableAliasesForAccounts:", v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    v51 = objc_msgSend(v50, "count");
    if (_CNFRegShouldLog())
    {
      OSLogHandleForIDSCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2138BA000, v7, OS_LOG_TYPE_DEFAULT, "Refreshing alias specifiers for accounts:", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
        IMLogString();
      v61 = 0u;
      v62 = 0u;
      v59 = 0u;
      v60 = 0u;
      obj = v49;
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v60;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v60 != v9)
              objc_enumerationMutation(obj);
            v11 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
            OSLogHandleForIDSCategory();
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              CNFRegStringForAccount(v11);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v67 = v13;
              _os_log_impl(&dword_2138BA000, v12, OS_LOG_TYPE_DEFAULT, "  => Account: %@", buf, 0xCu);

            }
            if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
            {
              CNFRegStringForAccount(v11);
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              IMLogString();

            }
            OSLogHandleForIDSCategory();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              -[CNFRegListController regController](v54, "regController");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v65 = v11;
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v65, 1);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "allAvailableAliasesForAccounts:", v16);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v67 = v17;
              _os_log_impl(&dword_2138BA000, v14, OS_LOG_TYPE_DEFAULT, "    => Aliases: %@", buf, 0xCu);

            }
            if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
            {
              -[CNFRegListController regController](v54, "regController");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v64 = v11;
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v64, 1);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "allAvailableAliasesForAccounts:", v19);
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              IMLogString();

            }
          }
          v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
        }
        while (v8);
      }

      OSLogHandleForIDSCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        -[CNFRegListController regController](v54, "regController");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "usableDeviceAliases");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v67 = v22;
        _os_log_impl(&dword_2138BA000, v20, OS_LOG_TYPE_DEFAULT, "All device aliases: %@", buf, 0xCu);

      }
      if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      {
        -[CNFRegListController regController](v54, "regController");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "usableDeviceAliases");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        IMLogString();

      }
      OSLogHandleForIDSCategory();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v67 = v50;
        _os_log_impl(&dword_2138BA000, v24, OS_LOG_TYPE_DEFAULT, "All aliases: %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      {
        v46 = v50;
        IMLogString();
      }
    }
    -[CNFRegSettingsController aliasSpecifiers](v54, "aliasSpecifiers", v46);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v53, "mutableCopy");
    v26 = objc_msgSend(v25, "count");
    v27 = v26 > v51;
    if (v26 > v51)
    {
      v28 = objc_msgSend(v25, "count") - v51;
      objc_msgSend(v25, "subarrayWithRange:");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "removeObjectsInRange:", v51, v28);
      v29 = 1;
    }
    else
    {
      v29 = 0;
      v30 = 0;
    }
    if (objc_msgSend(v25, "count") > v51)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", v47, v54, CFSTR("CNFRegSettingsController.m"), 2176, CFSTR("More specifiers than aliases"));

    }
    v31 = objc_msgSend(v25, "count");
    if (v51)
    {
      v32 = v31;
      v33 = 0;
      v34 = 0;
      v35 = 0;
      do
      {
        objc_msgSend(v50, "objectAtIndex:", v33);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (v33 >= v32)
        {
          if (v30)
          {
            objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", v47, v54, CFSTR("CNFRegSettingsController.m"), 2188, CFSTR("Creating new specifiers when we just deleted some. Shameful."));

          }
          -[CNFRegSettingsController createSpecifierForAlias:](v54, "createSpecifierForAlias:", v36);
          v38 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "addObject:", v38);
          if (!v35)
          {
            objc_msgSend(MEMORY[0x24BDBCEB8], "array");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            ++v29;
          }
          objc_msgSend(v35, "addObject:", v38);
          v27 = 1;
        }
        else
        {
          objc_msgSend(v25, "objectAtIndex:", v33);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          -[CNFRegSettingsController updateSpecifier:withAlias:](v54, "updateSpecifier:withAlias:", v37, v36);
          v38 = v37;

          v34 = v38;
        }

        ++v33;
      }
      while (v51 != v33);
    }
    else
    {
      v35 = 0;
      v34 = 0;
    }
    if (v29)
    {
      -[NSArray objectAtIndex:](v54->_aliasGroupSpecifiers, "objectAtIndex:", 0);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (v29 != 1)
        -[CNFRegSettingsController beginUpdates](v54, "beginUpdates");
      if (v30)
        -[CNFRegSettingsController removeContiguousSpecifiers:animated:](v54, "removeContiguousSpecifiers:animated:", v30, v48);
      if (v35)
      {
        if (!v34)
          v34 = v40;
        -[CNFRegSettingsController insertContiguousSpecifiers:afterSpecifier:animated:](v54, "insertContiguousSpecifiers:afterSpecifier:animated:", v35, v34, v48);
      }
      if (v29 != 1)
        -[CNFRegSettingsController endUpdates](v54, "endUpdates");
      if (v27)
      {
        objc_msgSend(v25, "insertObject:atIndex:", v40, 0);
        objc_storeStrong((id *)&v54->_aliasGroupSpecifiers, v25);
      }

    }
    if (v35)
    {
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      v41 = v35;
      v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
      if (v42)
      {
        v43 = *(_QWORD *)v56;
        do
        {
          for (j = 0; j != v42; ++j)
          {
            if (*(_QWORD *)v56 != v43)
              objc_enumerationMutation(v41);
            -[CNFRegSettingsController reloadSpecifier:](v54, "reloadSpecifier:", *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * j));
          }
          v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
        }
        while (v42);
      }

    }
  }
  else
  {
    -[CNFRegSettingsController showAliases:animated:](self, "showAliases:animated:", 0, v3);
  }
}

- (void)refreshAliasSpecifier:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __50__CNFRegSettingsController_refreshAliasSpecifier___block_invoke;
  v3[3] = &unk_24D075C18;
  v3[4] = self;
  -[CNFRegSettingsController _reloadSpecifier:withBlock:](self, "_reloadSpecifier:withBlock:", a3, v3);
}

void __50__CNFRegSettingsController_refreshAliasSpecifier___block_invoke(uint64_t a1, void *a2)
{
  char *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  _BOOL4 v14;
  unsigned int v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  const char *v19;
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
  uint64_t v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "CNFRegAlias");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  if ((objc_msgSend(v4, "isPhoneNumberAliasOnPhoneNumberAccount") & 1) != 0
    || objc_msgSend(v4, "isDeviceAlias"))
  {
    objc_msgSend(v4, "account");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "registrationStatus");
    OSLogHandleForIDSCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v32 = (uint64_t)v7;
      v33 = 2048;
      v34 = v8;
      _os_log_impl(&dword_2138BA000, v9, OS_LOG_TYPE_DEFAULT, "refreshAliasSpecifier phone number account: [%@], registrationStatus: [%ld]", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      v29 = v7;
      v30 = v8;
      IMLogString();
    }
    if (v8 == -1)
    {
      v11 = 1;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "regController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v10, "serviceSupportsDeviceAliasEnablement") & 1) != 0)
        v11 = 1;
      else
        v11 = objc_msgSend(v4, "isTemporaryPhoneNumberAlias");

    }
    v14 = v8 >= 0 && v8 != 5 && v7 != 0;
    if (v7)
      v15 = 0;
    else
      v15 = objc_msgSend(v4, "isSelectedDeviceAlias");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v14 | v15, v29, v30);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setProperty:forKey:", v16, CFSTR("cnfreg-alias-spinning"));

  }
  else
  {
    v11 = objc_msgSend(*(id *)(a1 + 32), "_canDeselectAlias:", v4);
  }
  v17 = objc_msgSend(v4, "validationStatus");
  OSLogHandleForIDSCategory();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v32 = v17;
    _os_log_impl(&dword_2138BA000, v18, OS_LOG_TYPE_DEFAULT, "refreshAliasSpecifier account validationStatus is: [%ld]", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    v29 = (void *)v17;
    IMLogString();
  }
  v19 = 0;
  if ((unint64_t)(v17 + 1) <= 3 && v17 != 1)
    v19 = sel_statusForSpecifier_;
  objc_storeWeak((id *)&v3[*MEMORY[0x24BE75768]], *(id *)(a1 + 32));
  *(_QWORD *)&v3[*MEMORY[0x24BE75738]] = 2;
  objc_msgSend(v3, "setProperty:forKey:", v5, *MEMORY[0x24BE75D50]);
  objc_msgSend(v3, "setName:", v5);
  objc_msgSend(v3, "setProperty:forKey:", v6, *MEMORY[0x24BE75948]);
  objc_msgSend(v3, "setButtonAction:", sel_setAliasSelected_);
  NSStringFromSelector(sel_setAliasSelected_);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProperty:forKey:", v20, *MEMORY[0x24BE75900]);

  *(_QWORD *)&v3[*MEMORY[0x24BE75750]] = v19;
  NSStringFromSelector(v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProperty:forKey:", v21, *MEMORY[0x24BE75A90]);

  objc_msgSend(v4, "identifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProperty:forKey:", v22, *MEMORY[0x24BE75AC0]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProperty:forKey:", v23, *MEMORY[0x24BE75860]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v11);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProperty:forKey:", v24, *MEMORY[0x24BE75A18]);

  objc_msgSend(v4, "account");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v25)
    goto LABEL_41;
  objc_msgSend(v4, "account");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "CNFRegSignInComplete");

  if (!v27 || (unint64_t)(v17 - 1) < 2)
    goto LABEL_41;
  if (v17 == 3)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setProperty:forKey:", v28, CFSTR("cnfreg-alias-checked"));

    goto LABEL_42;
  }
  if (v17 == -1)
LABEL_41:
    objc_msgSend(v3, "removePropertyForKey:", CFSTR("cnfreg-alias-checked"), v29);
LABEL_42:
  objc_msgSend(*(id *)(a1 + 32), "_setSpecifierEnabled:enabled:animated:", v3, v11, 1, v29);

}

- (void)refreshAllAliasSpecifiers
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = *(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(v8, "CNFRegAlias", (_QWORD)v10);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
          -[CNFRegSettingsController refreshAliasSpecifier:](self, "refreshAliasSpecifier:", v8);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (void)updateSpecifier:(id)a3 withAlias:(id)a4
{
  id v6;
  id v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (v6)
  {
    objc_msgSend(v8, "CNFRegAlias");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7 != v6)
    {
      objc_msgSend(v8, "setCNFRegAlias:", v6);
      objc_msgSend(v8, "removePropertyForKey:", CFSTR("cnfreg-alias-checked"));
    }
    -[CNFRegSettingsController refreshAliasSpecifier:](self, "refreshAliasSpecifier:", v8);
  }

}

- (void)refreshTemporaryPhoneAnimated:(BOOL)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  _BOOL4 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  void *v48;
  _QWORD v49[3];
  _QWORD v50[3];
  _BYTE v51[128];
  uint64_t v52;

  v42 = a3;
  v52 = *MEMORY[0x24BDAC8D0];
  OSLogHandleForIDSCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2138BA000, v4, OS_LOG_TYPE_DEFAULT, "Refreshing temporary phone settings", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    IMLogString();
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  -[CNFRegListController regController](self, "regController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFRegListController regController](self, "regController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accounts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allAvailableAliasesForAccounts:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 0;
  v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v44 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        if (objc_msgSend(v13, "isTemporaryPhoneNumberAlias"))
        {
          v14 = v13;

          v9 = v14;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
    }
    while (v10);
  }

  -[NSArray firstObject](self->_temporaryPhoneGroupSpecifiers, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray firstObject](self->_temporaryPhoneDescriptionGroupSpecifiers, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray firstObject](self->_temporaryPhoneRemoveGroupSpecifiers, "firstObject");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (v15 && v16 && v17)
  {
    v50[0] = v17;
    v50[1] = v16;
    v50[2] = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v50, 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFRegSettingsController removeContiguousSpecifiers:animated:](self, "removeContiguousSpecifiers:animated:", v19, v42);

    if (v9)
    {
      CommunicationsSetupUIBundle();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      CNFRegStringTableName();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("FACETIME_SETTINGS_TEMPORARY_PHONE_LABEL"), &stru_24D077260, v21);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      v39 = *MEMORY[0x24BE75D50];
      objc_msgSend(v15, "setProperty:forKey:", v41);
      objc_msgSend(v15, "setName:", v41);
      if (objc_msgSend(v41, "_isNaturallyRTL"))
        v22 = 2;
      else
        v22 = 0;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = *MEMORY[0x24BE75860];
      objc_msgSend(v15, "setProperty:forKey:", v23, *MEMORY[0x24BE75860]);

      v25 = objc_opt_class();
      v38 = *MEMORY[0x24BE75948];
      objc_msgSend(v16, "setProperty:forKey:", v25);
      objc_msgSend(v16, "setProperty:forKey:", v9, CFSTR("cnfreg-temp-alias"));
      -[CNFRegSettingsController ftImServiceString](self, "ftImServiceString");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)MEMORY[0x24BDD17C8];
      CommunicationsSetupUIBundle();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      CNFRegStringTableName();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("FACETIME_SETTINGS_TEMPORARY_PHONE_REMOVE"), &stru_24D077260, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "stringWithFormat:", v29, v40);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "setName:", v30);
      objc_msgSend(v18, "setProperty:forKey:", v30, v39);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setProperty:forKey:", v31, v24);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setProperty:forKey:", v32, *MEMORY[0x24BE75A18]);

      objc_msgSend(v18, "setProperty:forKey:", objc_opt_class(), v38);
      objc_msgSend(v18, "setButtonAction:", sel_deleteTemporaryPhoneAliasSelected_);
      NSStringFromSelector(sel_deleteTemporaryPhoneAliasSelected_);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setProperty:forKey:", v33, *MEMORY[0x24BE75900]);

      objc_msgSend(v18, "setProperty:forKey:", v9, CFSTR("cnfreg-temp-alias"));
      v49[0] = v15;
      v49[1] = v16;
      v49[2] = v18;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v49, 3);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNFRegSettingsController insertContiguousSpecifiers:atIndex:animated:](self, "insertContiguousSpecifiers:atIndex:animated:", v34, 0, v42);

      OSLogHandleForIDSCategory();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v48 = v9;
        _os_log_impl(&dword_2138BA000, v35, OS_LOG_TYPE_DEFAULT, "Inserted temporary phone specifiers for %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
        IMLogString();

      goto LABEL_38;
    }
    OSLogHandleForIDSCategory();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2138BA000, v37, OS_LOG_TYPE_DEFAULT, "Removed temporary phone specifiers", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
LABEL_37:
      IMLogString();
  }
  else
  {
    OSLogHandleForIDSCategory();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2138BA000, v36, OS_LOG_TYPE_DEFAULT, "No temporary phone specifiers in cache", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      goto LABEL_37;
  }
LABEL_38:

}

- (BOOL)showAliases:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;

  v4 = a4;
  if (a3)
  {
    -[CNFRegSettingsController showSpecifiers:afterGroupId:animated:](self, "showSpecifiers:afterGroupId:animated:", self->_aliasGroupSpecifiers, CFSTR("FACETIME_ACCOUNT_GROUP_ID"), a4);
  }
  else
  {
    -[CNFRegSettingsController resignFirstResponder](self, "resignFirstResponder");
    -[CNFRegSettingsController removeContiguousSpecifiers:animated:](self, "removeContiguousSpecifiers:animated:", self->_aliasGroupSpecifiers, v4);
  }
  return 1;
}

- (BOOL)additionalAliasesAvailable
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[CNFRegListController regController](self, "regController", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFRegSettingsController _useableAccounts](self, "_useableAccounts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vettedAliasesForAccounts:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "validationStatus") != 3)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)aliasForSpecifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "CNFRegAlias");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "displayName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    CommunicationsSetupUIBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    CNFRegStringTableName();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("FACETIME_ALIAS_INFO_UNAVAILABLE"), &stru_24D077260, v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)statusForSpecifier:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "CNFRegAlias");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[CNFRegSettingsController statusForAlias:](self, "statusForAlias:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)statusForAlias:(id)a3
{
  id v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_msgSend(v3, "validationStatus");
  if (v4 <= 2)
    v5 = 2;
  else
    v5 = v4;
  if (objc_msgSend(v3, "validationStatus") == 3)
  {
    objc_msgSend(v3, "account");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "CNFRegSignInFailed") & 1) != 0)
    {
      v5 = -1;
    }
    else if (!objc_msgSend(v6, "CNFRegSignInComplete"))
    {
      v5 = 2;
    }

  }
  objc_msgSend(v3, "type");
  CNFRegStringForAliasValidationStatus(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OSLogHandleForIDSCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v11 = v3;
    v12 = 2048;
    v13 = v5;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_2138BA000, v8, OS_LOG_TYPE_DEFAULT, "Verification status for {%@} : <%ld>%@", buf, 0x20u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    IMLogString();

  return v7;
}

- (id)aliasWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  int v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[CNFRegListController regController](self, "regController", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "aliases");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v4);

        if (v12)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (BOOL)_canDeselectAlias:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = a3;
  if (objc_msgSend(v4, "isPhoneNumberAliasOnPhoneNumberAccount")
    && (-[CNFRegListController regController](self, "regController"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "serviceSupportsDeviceAliasEnablement"),
        v5,
        !v6))
  {
    v12 = 0;
  }
  else if (objc_msgSend(v4, "validationStatus") == 3)
  {
    -[CNFRegListController regController](self, "regController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x24BDBCE30];
    objc_msgSend(v4, "account");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "arrayWithObject:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "aliasesForAccounts:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)objc_msgSend(v11, "count") <= 1)
      v12 = CNFRegSupportsLocalPhoneNumberSentinelAlias();
    else
      v12 = 1;

  }
  else
  {
    v12 = 1;
  }

  return v12;
}

- (id)createSpecifierForAlias:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;

  v4 = (objc_class *)MEMORY[0x24BE75590];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  -[CNFRegSettingsController updateSpecifier:withAlias:](self, "updateSpecifier:withAlias:", v6, v5);

  return v6;
}

- (void)deleteTemporaryPhoneAliasSelected:(id)a3
{
  id v4;

  objc_msgSend(a3, "propertyForKey:", CFSTR("cnfreg-temp-alias"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CNFRegSettingsController _showRemoveTemporaryPhoneAlertForAlias:](self, "_showRemoveTemporaryPhoneAlertForAlias:", v4);

}

- (void)setAliasSelected:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  char v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  v28 = a3;
  objc_msgSend(v28, "CNFRegAlias");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    goto LABEL_22;
  v6 = objc_msgSend(v4, "validationStatus");
  if (objc_msgSend(v5, "isPhoneNumberAliasOnPhoneNumberAccount"))
  {
    objc_msgSend(v5, "account");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "registrationStatus");

    if (v8 == -1)
    {
      objc_msgSend(MEMORY[0x24BE50288], "sharedInstance");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "account");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "activateAccount:", v26);

      objc_msgSend(v5, "account");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "registerAccount");

      -[CNFRegSettingsController refreshAliasSpecifier:](self, "refreshAliasSpecifier:", v28);
      goto LABEL_22;
    }
  }
  if ((objc_msgSend(v5, "isDeviceAlias") & 1) == 0
    && !objc_msgSend(v5, "isPhoneNumberAliasOnPhoneNumberAccount"))
  {
    goto LABEL_12;
  }
  -[CNFRegListController regController](self, "regController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "serviceSupportsDeviceAliasEnablement"))
  {
    v10 = objc_msgSend(v5, "isTemporaryPhoneNumberAlias");

    if (v10)
      goto LABEL_9;
LABEL_12:
    if (v6 == -1 || v6 == 2)
      goto LABEL_22;
    objc_msgSend(v28, "propertyForKey:", CFSTR("cnfreg-alias-checked"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "BOOLValue");

    objc_msgSend(v5, "account");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v19 & 1) != 0)
    {
      if (!-[CNFRegSettingsController _canDeselectAlias:](self, "_canDeselectAlias:", v5))
      {
LABEL_21:
        -[CNFRegSettingsController refreshAliasSpecifier:](self, "refreshAliasSpecifier:", v28);

        goto LABEL_22;
      }
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setProperty:forKey:", v21, CFSTR("cnfreg-alias-checked"));

      -[CNFRegSettingsController cachedCellForSpecifier:](self, "cachedCellForSpecifier:", v28);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setChecked:", 0);

      -[CNFRegListController regController](self, "regController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "alias");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "removeAlias:fromAccount:", v24, v20);
    }
    else
    {
      -[CNFRegListController regController](self, "regController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "alias");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addAlias:toAccount:", v24, v20);
    }

    goto LABEL_21;
  }

LABEL_9:
  objc_msgSend(v28, "propertyForKey:", CFSTR("cnfreg-alias-checked"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  objc_msgSend(v28, "propertyForKey:", CFSTR("cnfreg-alias-spinning"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "BOOLValue");

  if ((v12 & 1) != 0 || v14)
  {
    -[CNFRegSettingsController _showRemoveAlertForAlias:specifier:](self, "_showRemoveAlertForAlias:specifier:", v5, v28);
  }
  else
  {
    -[CNFRegListController regController](self, "regController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addDeviceAlias:", v5);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setProperty:forKey:", v16, CFSTR("cnfreg-alias-spinning"));

    -[CNFRegSettingsController cachedCellForSpecifier:](self, "cachedCellForSpecifier:", v28);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setHasSpinner:", 1);

  }
LABEL_22:

}

- (BOOL)oppositeServiceTypeEnabled
{
  void *v2;
  _BOOL8 v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[CNFRegListController regController](self, "regController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "serviceType") != 1;

  +[CNFRegController controllerForServiceType:](CNFRegController, "controllerForServiceType:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountsWithFilter:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count") != 0;

  return v6;
}

- (id)ftImServiceString
{
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
  uint64_t v15;
  const __CFString *v16;

  if (-[CNFRegSettingsController oppositeServiceTypeEnabled](self, "oppositeServiceTypeEnabled"))
  {
    v3 = (void *)MEMORY[0x24BDD17C8];
    CommunicationsSetupUIBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    CNFRegStringTableName();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("JOINT_SERVICE_NAME"), &stru_24D077260, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    CommunicationsSetupUIBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    CNFRegStringTableName();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("IM_SERVICE_NAME"), &stru_24D077260, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    CommunicationsSetupUIBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    CNFRegStringTableName();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("FT_SERVICE_NAME"), &stru_24D077260, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", v6, v9, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[CNFRegListController regController](self, "regController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "serviceType");

    CommunicationsSetupUIBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    CNFRegStringTableName();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15 == 1)
      v16 = CFSTR("IM_SERVICE_NAME");
    else
      v16 = CFSTR("FT_SERVICE_NAME");
    objc_msgSend(v4, "localizedStringForKey:value:table:", v16, &stru_24D077260, v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (void)_showRemoveAlertForAlias:(id)a3 specifier:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v36[4];
  id v37;
  CNFRegSettingsController *v38;
  id v39;
  id v40;
  char v41;
  uint8_t buf[4];
  id v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  OSLogHandleForIDSCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v43 = v5;
    v44 = 2112;
    v45 = v6;
    _os_log_impl(&dword_2138BA000, v7, OS_LOG_TYPE_DEFAULT, "Showing alias remove alert {alias: %@, specifier: %@}", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    v29 = v5;
    v30 = v6;
    IMLogString();
  }
  -[CNFRegSettingsController ftImServiceString](self, "ftImServiceString", v29, v30);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isTemporaryPhoneNumberAlias");
  CommunicationsSetupUIBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  CNFRegStringTableName();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v11 = CFSTR("FACETIME_DISABLE_ALERT_TITLE_TEMP");
  else
    v11 = CFSTR("FACETIME_REMOVE_ALERT_TITLE");
  objc_msgSend(v9, "localizedStringForKey:value:table:", v11, &stru_24D077260, v10);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v33, v34);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  CommunicationsSetupUIBundle();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  CNFRegStringTableName();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v14 = CFSTR("FACETIME_DISABLE_ALERT_MESSAGE_TEMP");
  else
    v14 = CFSTR("FACETIME_REMOVE_ALERT_MESSAGE");
  objc_msgSend(v12, "localizedStringForKey:value:table:", v14, &stru_24D077260, v13);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v32, v34);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  CommunicationsSetupUIBundle();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  CNFRegStringTableName();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v18 = CFSTR("FACETIME_ALERT_OK");
  else
    v18 = CFSTR("FACETIME_REMOVE_ALERT_REMOVE_BUTTON");
  objc_msgSend(v16, "localizedStringForKey:value:table:", v18, &stru_24D077260, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  CommunicationsSetupUIBundle();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  CNFRegStringTableName();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("FACETIME_REMOVE_ALERT_CANCEL_BUTTON"), &stru_24D077260, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak((id *)buf, v6);
  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v31, v15, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)MEMORY[0x24BEBD3A8];
  v36[0] = MEMORY[0x24BDAC760];
  v36[1] = 3221225472;
  v36[2] = __63__CNFRegSettingsController__showRemoveAlertForAlias_specifier___block_invoke;
  v36[3] = &unk_24D075C40;
  objc_copyWeak(&v40, (id *)buf);
  v25 = v5;
  v41 = v8;
  v37 = v25;
  v38 = self;
  v26 = v6;
  v39 = v26;
  objc_msgSend(v24, "actionWithTitle:style:handler:", v19, 0, v36);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addAction:", v27);

  if ((v8 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BEBD3A8], "actionWithTitle:style:handler:", v22, 1, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addAction:", v28);

  }
  -[CNFRegSettingsController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v23, 1, 0);

  objc_destroyWeak(&v40);
  objc_destroyWeak((id *)buf);

}

void __63__CNFRegSettingsController__showRemoveAlertForAlias_specifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  BOOL v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  CNFRegAlias *v16;
  void *v17;
  void *v18;
  CNFRegAlias *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint8_t buf[4];
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  OSLogHandleForIDSCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v25 = v6;
    _os_log_impl(&dword_2138BA000, v5, OS_LOG_TYPE_DEFAULT, "Selected remove! Removing %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    v23 = *(_QWORD *)(a1 + 32);
    IMLogString();
  }
  if (!WeakRetained)
    goto LABEL_10;
  objc_msgSend(WeakRetained, "CNFRegAlias");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "alias");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "alias");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if ((v10 & 1) != 0)
  {
    v11 = *(_BYTE *)(a1 + 64) == 0;
    objc_msgSend(*(id *)(a1 + 40), "regController", v23);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = *(_QWORD *)(a1 + 32);
    if (v11)
      objc_msgSend(v12, "removeDeviceAlias:", v14);
    else
      objc_msgSend(v12, "disableDeviceAlias:", v14);

    v16 = [CNFRegAlias alloc];
    objc_msgSend(*(id *)(a1 + 32), "alias");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "deviceAliasIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[CNFRegAlias initWithAlias:type:selected:deviceAliasIdentifier:](v16, "initWithAlias:type:selected:deviceAliasIdentifier:", v17, 2, 0, v18);
    objc_msgSend(*(id *)(a1 + 48), "setCNFRegAlias:", v19);

    v20 = *(void **)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setProperty:forKey:", v21, CFSTR("cnfreg-alias-checked"));

    objc_msgSend(*(id *)(a1 + 40), "cachedCellForSpecifier:", *(_QWORD *)(a1 + 48));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setChecked:", 0);

    objc_msgSend(*(id *)(a1 + 40), "refreshAliasSpecifier:", *(_QWORD *)(a1 + 48));
  }
  else
  {
LABEL_10:
    OSLogHandleForIDSCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2138BA000, v15, OS_LOG_TYPE_DEFAULT, "This specifier is no longer applicable -- ignoring", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      IMLogString();
  }

}

- (void)_showRemoveTemporaryPhoneAlertForAlias:(id)a3
{
  id v3;
  NSObject *v4;
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
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  _QWORD v27[4];
  id v28;
  CNFRegSettingsController *v29;
  uint8_t buf[4];
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  OSLogHandleForIDSCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v31 = v3;
    _os_log_impl(&dword_2138BA000, v4, OS_LOG_TYPE_DEFAULT, "Showing alias remove temporary phone alert {alias: %@}", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    v23 = v3;
    IMLogString();
  }
  -[CNFRegSettingsController ftImServiceString](self, "ftImServiceString", v23);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CommunicationsSetupUIBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  CNFRegStringTableName();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("FACETIME_REMOVE_ALERT_TITLE"), &stru_24D077260, v7);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v25, v5);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  CommunicationsSetupUIBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  CNFRegStringTableName();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("FACETIME_REMOVE_ALERT_MESSAGE_TEMP"), &stru_24D077260, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v10, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  CommunicationsSetupUIBundle();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  CNFRegStringTableName();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("FACETIME_REMOVE_ALERT_REMOVE_BUTTON"), &stru_24D077260, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  CommunicationsSetupUIBundle();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  CNFRegStringTableName();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("FACETIME_REMOVE_ALERT_CANCEL_BUTTON"), &stru_24D077260, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v24, v11, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x24BEBD3A8];
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __67__CNFRegSettingsController__showRemoveTemporaryPhoneAlertForAlias___block_invoke;
  v27[3] = &unk_24D075BA0;
  v28 = v3;
  v29 = self;
  v20 = v3;
  objc_msgSend(v19, "actionWithTitle:style:handler:", v14, 0, v27);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addAction:", v21);

  objc_msgSend(MEMORY[0x24BEBD3A8], "actionWithTitle:style:handler:", v17, 1, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addAction:", v22);

  -[CNFRegSettingsController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v18, 1, 0);
}

void __67__CNFRegSettingsController__showRemoveTemporaryPhoneAlertForAlias___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
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
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  uint8_t buf[4];
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v23 = a2;
  OSLogHandleForIDSCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v26 = v4;
    _os_log_impl(&dword_2138BA000, v3, OS_LOG_TYPE_DEFAULT, "Selected remove! Removing %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    v22 = *(_QWORD *)(a1 + 32);
    IMLogString();
  }
  objc_msgSend(*(id *)(a1 + 40), "specifiers", v22);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(*(id *)(a1 + 40), "specifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "specifierForID:", CFSTR("FACETIME_TEMPORARY_PHONE_GROUP_ID"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "specifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "specifierForID:", CFSTR("FACETIME_TEMPORARY_PHONE_ID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "specifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "specifierForID:", CFSTR("FACETIME_TEMPORARY_PHONE_REMOVE"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
    objc_msgSend(v6, "removeObject:", v24);
  if (v9)
    objc_msgSend(v6, "removeObject:", v9);
  if (v11)
    objc_msgSend(v6, "removeObject:", v11);
  objc_msgSend(*(id *)(a1 + 40), "_useableAccounts");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "regController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "allAvailableAliasesForAccounts:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v14, "count"))
  {
    v15 = 0;
    do
    {
      objc_msgSend(v14, "objectAtIndex:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "isEqual:", *(_QWORD *)(a1 + 32)))
      {
        objc_msgSend(*(id *)(a1 + 40), "aliasSpecifiers");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectAtIndex:", v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "removeObject:", v18);
      }

      ++v15;
    }
    while (v15 < objc_msgSend(v14, "count"));
  }
  v19 = *(void **)(a1 + 40);
  objc_msgSend(v19, "specifiers");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "updateSpecifiers:withSpecifiers:", v20, v6);

  objc_msgSend(*(id *)(a1 + 40), "regController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "removeDeviceAlias:", *(_QWORD *)(a1 + 32));

}

- (void)_showAliasValidationError:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
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
  id v29;
  _QWORD v30[4];
  id v31;
  CNFRegSettingsController *v32;
  uint8_t buf[4];
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  OSLogHandleForIDSCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v34 = v4;
    _os_log_impl(&dword_2138BA000, v5, OS_LOG_TYPE_DEFAULT, "Showing alias validation error: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    v29 = v4;
    IMLogString();
  }
  objc_msgSend(v4, "userInfo", v29);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("cnf-customTitle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    CommunicationsSetupUIBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    CNFRegStringTableName();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("FACETIME_ACTIVATION_ERROR_TITLE"), &stru_24D077260, v11);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v4, "localizedDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    CommunicationsSetupUIBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    CNFRegStringTableName();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("FACETIME_SIGNIN_ERROR_GENERIC"), &stru_24D077260, v16);
    v14 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v4, "userInfo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKey:", CFSTR("cnf-customButton"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    v20 = v18;
  }
  else
  {
    CommunicationsSetupUIBundle();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    CNFRegStringTableName();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("FACETIME_ALERT_OK"), &stru_24D077260, v22);
    v20 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v9, v14, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD3A8], "actionWithTitle:style:handler:", v20, 0, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addAction:", v24);

  objc_msgSend(v4, "userInfo");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectForKey:", CFSTR("cnf-customActionTitle"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    v27 = (void *)MEMORY[0x24BEBD3A8];
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __54__CNFRegSettingsController__showAliasValidationError___block_invoke;
    v30[3] = &unk_24D075BA0;
    v31 = v4;
    v32 = self;
    objc_msgSend(v27, "actionWithTitle:style:handler:", v26, 0, v30);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addAction:", v28);

  }
  -[CNFRegSettingsController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v23, 1, 0);

}

void __54__CNFRegSettingsController__showAliasValidationError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("cnf-customActionURLString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      OSLogHandleForIDSCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v11 = v6;
        _os_log_impl(&dword_2138BA000, v7, OS_LOG_TYPE_DEFAULT, "Launching URL : %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      {
        v9 = v6;
        IMLogString();
      }
      objc_msgSend(*(id *)(a1 + 40), "regController", v9);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "openURL:", v6);

    }
  }

}

- (void)showFaceTimeCaptionsSettings:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  NSArray *faceTimeCaptionsGroupSpecifiers;

  v4 = a3;
  faceTimeCaptionsGroupSpecifiers = self->_faceTimeCaptionsGroupSpecifiers;
  if (v4)
    -[CNFRegSettingsController showFaceTimeSpecifiers:afterGroupId:animated:](self, "showFaceTimeSpecifiers:afterGroupId:animated:", faceTimeCaptionsGroupSpecifiers, CFSTR("GFT_PROMINENCE_GROUP_ID"), a4);
  else
    -[CNFRegSettingsController removeContiguousSpecifiers:animated:](self, "removeContiguousSpecifiers:animated:", faceTimeCaptionsGroupSpecifiers, a4);
}

- (void)refreshFaceTimeCaptionsSettingsAnimated:(BOOL)a3
{
  if (self->_faceTimeCaptionsGroupSpecifiers)
    -[CNFRegSettingsController showFaceTimeCaptionsSettings:animated:](self, "showFaceTimeCaptionsSettings:animated:", -[CNFRegSettingsController shouldShowFaceTimeCaptionsSpecifiers](self, "shouldShowFaceTimeCaptionsSpecifiers"), a3);
}

- (BOOL)shouldShowFaceTimeCaptionsSpecifiers
{
  void *v3;
  uint64_t v4;
  void *v5;
  char v6;
  BOOL v7;
  char v8;

  -[CNFRegListController regController](self, "regController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "serviceType");

  -[CNFRegListController regController](self, "regController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isServiceEnabled");

  v7 = -[CNFRegSettingsController captioningSupported](self, "captioningSupported");
  if (v4)
    v8 = 0;
  else
    v8 = v6;
  return v8 & v7;
}

- (id)getFaceTimeCaptionsEnabledForSpecifier:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  uint8_t buf[4];
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", _AXSFaceTimeCaptionsEnabled());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OSLogHandleForIDSCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v8 = objc_msgSend(v4, "BOOLValue");
    _os_log_impl(&dword_2138BA000, v5, OS_LOG_TYPE_DEFAULT, "faceTimeCaptionsEnabled: %d", buf, 8u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    objc_msgSend(v4, "BOOLValue");
    IMLogString();
  }

  return v4;
}

- (void)setFaceTimeCaptionsEnabled:(id)a3 specifier:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint8_t buf[4];
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  OSLogHandleForIDSCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v10 = objc_msgSend(v5, "BOOLValue");
    _os_log_impl(&dword_2138BA000, v7, OS_LOG_TYPE_DEFAULT, "faceTimeCaptionsEnabled: %d", buf, 8u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    v8 = objc_msgSend(v5, "BOOLValue");
    IMLogString();
  }
  objc_msgSend(v5, "BOOLValue", v8);
  _AXSSetFaceTimeCaptionsEnabled();

}

- (BOOL)captioningSupported
{
  int v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  char v9;
  int v10;
  NSObject *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(MEMORY[0x24BDFD9E0], "isCaptioningSupported");
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24D094118);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(MEMORY[0x24BEBDA70], "activeInputModes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v23, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "primaryLanguage");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v3, "containsObject:", v8);

        if ((v9 & 1) != 0)
        {
          v10 = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v23, 16);
      if (v5)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  OSLogHandleForIDSCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109632;
    v18 = v2 & v10;
    v19 = 1024;
    v20 = v2;
    v21 = 1024;
    v22 = v10;
    _os_log_impl(&dword_2138BA000, v11, OS_LOG_TYPE_DEFAULT, "captioningSupported: %d, hardwareSupported: %d, localeSupported: %d", buf, 0x14u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    IMLogString();

  return v2 & v10;
}

- (void)showFaceTimePhotosSettings:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  NSArray *faceTimePhotosGroupSpecifiers;

  v4 = a3;
  faceTimePhotosGroupSpecifiers = self->_faceTimePhotosGroupSpecifiers;
  if (v4)
    -[CNFRegSettingsController showFaceTimeSpecifiers:afterGroupId:animated:](self, "showFaceTimeSpecifiers:afterGroupId:animated:", faceTimePhotosGroupSpecifiers, CFSTR("FACETIME_CAPTIONS_ENABLED_GROUP_ID"), a4);
  else
    -[CNFRegSettingsController removeContiguousSpecifiers:animated:](self, "removeContiguousSpecifiers:animated:", faceTimePhotosGroupSpecifiers, a4);
}

- (void)refreshFaceTimePhotosSettingsAnimated:(BOOL)a3
{
  if (self->_faceTimePhotosGroupSpecifiers)
    -[CNFRegSettingsController showFaceTimePhotosSettings:animated:](self, "showFaceTimePhotosSettings:animated:", -[CNFRegSettingsController shouldShowFaceTimePhotosSpecifiers](self, "shouldShowFaceTimePhotosSpecifiers"), a3);
}

- (BOOL)shouldShowFaceTimePhotosSpecifiers
{
  void *v3;
  uint64_t v4;
  void *v5;
  char v6;
  char v7;

  -[CNFRegListController regController](self, "regController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "serviceType");

  -[CNFRegListController regController](self, "regController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isServiceEnabled");

  v7 = objc_msgSend(MEMORY[0x24BEB4A10], "isFaceTimePhotosRestricted");
  if (v4)
    return 0;
  else
    return v6 & (v7 ^ 1);
}

- (id)getFaceTimePhotosEnabledForSpecifier:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  uint8_t buf[4];
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(MEMORY[0x24BEB4A10], "isFaceTimePhotosEnabled"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OSLogHandleForIDSCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v8 = objc_msgSend(v4, "BOOLValue");
    _os_log_impl(&dword_2138BA000, v5, OS_LOG_TYPE_DEFAULT, "faceTimePhotosEnabled: %d", buf, 8u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    objc_msgSend(v4, "BOOLValue");
    IMLogString();
  }

  return v4;
}

- (void)setFaceTimePhotosEnabled:(id)a3 specifier:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t buf[4];
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  OSLogHandleForIDSCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v11 = objc_msgSend(v5, "BOOLValue");
    _os_log_impl(&dword_2138BA000, v7, OS_LOG_TYPE_DEFAULT, "faceTimePhotosEnabled: %d", buf, 8u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    v9 = objc_msgSend(v5, "BOOLValue");
    IMLogString();
  }
  v8 = objc_msgSend(v5, "BOOLValue", v9);
  objc_msgSend(MEMORY[0x24BEB4A10], "setFaceTimePhotosEnabled:", v8);

}

- (void)showFaceTimeVPCSpecifiers:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  NSArray *faceTimeVPCGroupSpecifiers;

  v4 = a3;
  faceTimeVPCGroupSpecifiers = self->_faceTimeVPCGroupSpecifiers;
  if (v4)
    -[CNFRegSettingsController showFaceTimeSpecifiers:afterGroupId:animated:](self, "showFaceTimeSpecifiers:afterGroupId:animated:", faceTimeVPCGroupSpecifiers, CFSTR("FACETIME_PHOTOS_ENABLED_GROUP_ID"), a4);
  else
    -[CNFRegSettingsController removeContiguousSpecifiers:animated:](self, "removeContiguousSpecifiers:animated:", faceTimeVPCGroupSpecifiers, a4);
}

- (void)refreshFaceTimeVPCSettingsAnimated:(BOOL)a3
{
  if (self->_faceTimeVPCGroupSpecifiers)
    -[CNFRegSettingsController showFaceTimeVPCSpecifiers:animated:](self, "showFaceTimeVPCSpecifiers:animated:", -[CNFRegSettingsController shouldShowFaceTimeVPCSpecifiers](self, "shouldShowFaceTimeVPCSpecifiers"), a3);
}

- (BOOL)shouldShowFaceTimeVPCSpecifiers
{
  void *v2;
  uint64_t v3;
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  -[CNFRegListController regController](self, "regController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "serviceType");

  if (v3)
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE30378], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("vc-viewpoint-correction-enabled"));
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = (void *)v6;
    else
      v7 = (void *)MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "userInterfaceIdiom") == 1)
      v4 = objc_msgSend(MEMORY[0x24BDFDA50], "isEyeContactSupported");
    else
      v4 = 0;

    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "userInterfaceIdiom");

    if (!v10 || v4)
    {
      if (MGGetBoolAnswer() && _os_feature_enabled_impl())
        LOBYTE(v4) = objc_msgSend(v7, "BOOLValue");
      else
        LOBYTE(v4) = 0;
    }

  }
  return v4;
}

- (id)getFaceTimeVPCEnabledForSpecifier:(id)a3
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint64_t v8;
  uint8_t buf[4];
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = CNFGetDomainBooleanValueForKeyDefaultValue(CFSTR("com.apple.VideoConference"), CFSTR("VPCEnabled"), 1u);
  OSLogHandleForIDSCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v10 = v4;
    _os_log_impl(&dword_2138BA000, v5, OS_LOG_TYPE_DEFAULT, "Viewpoint correction enabled: %d", buf, 8u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    v8 = v4;
    IMLogString();
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setFaceTimeVPCEnabled:(id)a3 specifier:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint8_t buf[4];
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  OSLogHandleForIDSCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v10 = objc_msgSend(v5, "BOOLValue");
    _os_log_impl(&dword_2138BA000, v7, OS_LOG_TYPE_DEFAULT, "Setting viewpoint correction enabled: %d", buf, 8u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    v8 = objc_msgSend(v5, "BOOLValue");
    IMLogString();
  }
  CNFSetDomainIntegerForKey(CFSTR("com.apple.VideoConference"), CFSTR("VPCEnabled"), objc_msgSend(v5, "integerValue", v8));

}

- (void)showGFTProminenceSettings:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  NSArray *GFTProminenceGroupSpecifiers;

  v4 = a3;
  GFTProminenceGroupSpecifiers = self->_GFTProminenceGroupSpecifiers;
  if (v4)
    -[CNFRegSettingsController showFaceTimeSpecifiers:afterGroupId:animated:](self, "showFaceTimeSpecifiers:afterGroupId:animated:", GFTProminenceGroupSpecifiers, CFSTR("SHAREPLAY_SETTINGS_GROUP"), a4);
  else
    -[CNFRegSettingsController removeContiguousSpecifiers:animated:](self, "removeContiguousSpecifiers:animated:", GFTProminenceGroupSpecifiers, a4);
}

- (void)refreshGFTProminenceSettingsAnimated:(BOOL)a3
{
  if (self->_GFTProminenceGroupSpecifiers)
    -[CNFRegSettingsController showGFTProminenceSettings:animated:](self, "showGFTProminenceSettings:animated:", -[CNFRegSettingsController shouldShowGFTProminenceSpecifiers](self, "shouldShowGFTProminenceSpecifiers"), a3);
}

- (BOOL)shouldShowGFTProminenceSpecifiers
{
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  char v8;

  -[CNFRegListController regController](self, "regController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "serviceType");

  -[CNFRegListController regController](self, "regController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isServiceEnabled");

  if (v4 || !v6)
    return 0;
  objc_msgSend(MEMORY[0x24BE30338], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "multiwaySupported");

  return v8;
}

- (id)getGFTAudioProminenceEnabledForSpecifier:(id)a3
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint64_t v8;
  uint8_t buf[4];
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = CNFGetDomainBooleanValueForKeyDefaultValue((CFStringRef)*MEMORY[0x24BEB4A70], CFSTR("allowAudioProminence"), 1u);
  OSLogHandleForIDSCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v10 = v4;
    _os_log_impl(&dword_2138BA000, v5, OS_LOG_TYPE_DEFAULT, "GFT audio prominence enabled: %d", buf, 8u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    v8 = v4;
    IMLogString();
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setGFTAudioProminenceEnabled:(id)a3 specifier:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t buf[4];
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  OSLogHandleForIDSCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v11 = objc_msgSend(v5, "BOOLValue");
    _os_log_impl(&dword_2138BA000, v7, OS_LOG_TYPE_DEFAULT, "Setting GFT audio prominence enabled: %d", buf, 8u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    v9 = objc_msgSend(v5, "BOOLValue");
    IMLogString();
  }
  v8 = objc_msgSend(v5, "BOOLValue", v9);
  CNFSetDomainBooleanForKey((void *)*MEMORY[0x24BEB4A70], CFSTR("allowAudioProminence"), v8);

}

- (void)showSharePlaySettings:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  NSArray *sharePlaySpecifiers;

  v4 = a3;
  sharePlaySpecifiers = self->_sharePlaySpecifiers;
  if (v4)
    -[CNFRegSettingsController showFaceTimeSpecifiers:afterGroupId:animated:](self, "showFaceTimeSpecifiers:afterGroupId:animated:", sharePlaySpecifiers, CFSTR("SHARED_NAME_AND_PHOTO_SETTINGS_GROUP"), a4);
  else
    -[CNFRegSettingsController removeContiguousSpecifiers:animated:](self, "removeContiguousSpecifiers:animated:", sharePlaySpecifiers, a4);
}

- (void)refreshSharePlaySettingsAnimated:(BOOL)a3
{
  if (self->_sharePlaySpecifiers)
    -[CNFRegSettingsController showSharePlaySettings:animated:](self, "showSharePlaySettings:animated:", -[CNFRegSettingsController shouldShowSharePlaySpecifiers](self, "shouldShowSharePlaySpecifiers"), a3);
}

- (BOOL)shouldShowSharePlaySpecifiers
{
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  char v8;

  -[CNFRegListController regController](self, "regController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "serviceType");

  -[CNFRegListController regController](self, "regController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isServiceEnabled");

  if (v4 || !v6)
    return 0;
  objc_msgSend(MEMORY[0x24BE30338], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "multiwaySupported");

  return v8;
}

- (void)showSharedNameAndPhotoSettings:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  NSArray *sharedNameAndPhotoSpecifiers;

  v4 = a3;
  sharedNameAndPhotoSpecifiers = self->_sharedNameAndPhotoSpecifiers;
  if (v4)
    -[CNFRegSettingsController showFaceTimeSpecifiers:afterGroupId:animated:](self, "showFaceTimeSpecifiers:afterGroupId:animated:", sharedNameAndPhotoSpecifiers, CFSTR("FACETIME_CALLERID_GROUP_ID"), a4);
  else
    -[CNFRegSettingsController removeContiguousSpecifiers:animated:](self, "removeContiguousSpecifiers:animated:", sharedNameAndPhotoSpecifiers, a4);
}

- (void)refreshSharedNameAndPhotoSettingsAnimated:(BOOL)a3
{
  if (self->_sharedNameAndPhotoSpecifiers)
    -[CNFRegSettingsController showSharedNameAndPhotoSettings:animated:](self, "showSharedNameAndPhotoSettings:animated:", -[CNFRegSettingsController shouldShowSharedNameAndPhotoSpecifiers](self, "shouldShowSharedNameAndPhotoSpecifiers"), a3);
}

- (BOOL)shouldShowSharedNameAndPhotoSpecifiers
{
  void *v3;
  uint64_t v4;
  void *v5;
  char v6;

  -[CNFRegListController regController](self, "regController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "serviceType");

  -[CNFRegListController regController](self, "regController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isServiceEnabled");

  if (v4)
    return 0;
  else
    return v6;
}

- (BOOL)showCallerId:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  NSArray *callerIdGroupSpecifiers;

  v4 = a4;
  v5 = a3;
  callerIdGroupSpecifiers = self->_callerIdGroupSpecifiers;
  if (v5)
    -[CNFRegSettingsController showSpecifiers:afterGroupId:animated:](self, "showSpecifiers:afterGroupId:animated:", callerIdGroupSpecifiers, CFSTR("FACETIME_ALIAS_GROUP_ID"), a4);
  else
    -[CNFRegSettingsController removeContiguousSpecifiers:animated:](self, "removeContiguousSpecifiers:animated:", callerIdGroupSpecifiers, a4);
  -[CNFRegSettingsController refreshiMessageAccountFooterText:](self, "refreshiMessageAccountFooterText:", v4);
  return 1;
}

- (id)possibleCallerIdAliases
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[CNFRegListController regController](self, "regController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFRegSettingsController _useableAccounts](self, "_useableAccounts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "useableAliasesForAccounts:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "sortedArrayUsingSelector:", sel_localizedCaseInsensitiveCompare_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(v7, "addObject:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v12++), (_QWORD)v14);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  return v7;
}

- (id)callerIdAliasSpecifiers
{
  return -[NSArray subarrayWithRange:](self->_callerIdGroupSpecifiers, "subarrayWithRange:", 1, -[NSArray count](self->_callerIdGroupSpecifiers, "count") - 1);
}

- (void)refreshCallerIdAliasesAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  SEL v31;
  void *v32;
  _BOOL4 v33;
  uint64_t v34;
  BOOL v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  if ((*(_BYTE *)&self->_settingsFlags & 0x10) == 0)
  {
    v3 = a3;
    *(_BYTE *)&self->_settingsFlags |= 0x10u;
    -[CNFRegSettingsController possibleCallerIdAliases](self, "possibleCallerIdAliases");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");
    if (!v6 || (v8 = v7, v7 <= 1))
    {
      -[CNFRegSettingsController showCallerId:animated:](self, "showCallerId:animated:", 0, v3);
LABEL_44:
      *(_BYTE *)&self->_settingsFlags &= ~0x10u;

      return;
    }
    -[CNFRegSettingsController showCallerId:animated:](self, "showCallerId:animated:", 1, v3);
    -[CNFRegSettingsController callerIdAliasSpecifiers](self, "callerIdAliasSpecifiers");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v32, "mutableCopy");
    v10 = objc_msgSend(v9, "count");
    v35 = v10 > v8;
    if (v10 > v8)
    {
      v11 = objc_msgSend(v9, "count");
      v12 = v11 - v8;
      objc_msgSend(v9, "subarrayWithRange:", v8, v11 - v8);
      v13 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeObjectsInRange:", v8, v12);
      v34 = 1;
    }
    else
    {
      v13 = 0;
      v34 = 0;
    }
    v33 = v3;
    v36 = (void *)v13;
    if (objc_msgSend(v9, "count") > v8)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CNFRegSettingsController.m"), 3083, CFSTR("More specifiers than Caller Id aliases"));

    }
    v31 = a2;
    v14 = objc_msgSend(v9, "count");
    v15 = 0;
    v16 = 0;
    v17 = 0;
    do
    {
      objc_msgSend(v6, "objectAtIndex:", v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15 >= v14)
      {
        if (v36)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", v31, self, CFSTR("CNFRegSettingsController.m"), 3095, CFSTR("Creating new specifiers when we just deleted some. Shameful."));

        }
        -[CNFRegSettingsController createSpecifierForCallerIdAlias:](self, "createSpecifierForCallerIdAlias:", v18);
        v20 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v20);
        if (!v17)
        {
          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          ++v34;
        }
        objc_msgSend(v17, "addObject:", v20);
        v35 = 1;
      }
      else
      {
        objc_msgSend(v9, "objectAtIndex:", v15);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNFRegSettingsController updateSpecifier:withCallerIdAlias:](self, "updateSpecifier:withCallerIdAlias:", v19, v18);
        v20 = v19;

        v16 = v20;
      }

      ++v15;
    }
    while (v8 != v15);
    if (v34)
    {
      -[NSArray objectAtIndex:](self->_callerIdGroupSpecifiers, "objectAtIndex:", 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v32;
      v24 = v36;
      if (v34 != 1)
        -[CNFRegSettingsController beginUpdates](self, "beginUpdates");
      if (v36)
        -[CNFRegSettingsController removeContiguousSpecifiers:animated:](self, "removeContiguousSpecifiers:animated:", v36, v33);
      if (v17)
      {
        if (!v16)
          v16 = v22;
        -[CNFRegSettingsController insertContiguousSpecifiers:afterSpecifier:animated:](self, "insertContiguousSpecifiers:afterSpecifier:animated:", v17, v16, v33);
      }
      if (v34 != 1)
        -[CNFRegSettingsController endUpdates](self, "endUpdates");
      if (v35)
      {
        objc_msgSend(v9, "insertObject:atIndex:", v22, 0);
        objc_storeStrong((id *)&self->_callerIdGroupSpecifiers, v9);
      }

      if (!v17)
        goto LABEL_43;
    }
    else
    {
      v23 = v32;
      v24 = v36;
      if (!v17)
      {
LABEL_43:

        goto LABEL_44;
      }
    }
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v25 = v17;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v38 != v28)
            objc_enumerationMutation(v25);
          -[CNFRegSettingsController reloadSpecifier:](self, "reloadSpecifier:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i));
        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      }
      while (v27);
    }

    v24 = v36;
    goto LABEL_43;
  }
}

- (void)setCallerId:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "CNFRegCallerIdAlias");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if (objc_msgSend(v5, "validationStatus") == 3)
    {
      -[CNFRegListController regController](self, "regController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setDisplayAlias:", v6);

      -[CNFRegSettingsController refreshAllCallerIdAliasSpecifiers](self, "refreshAllCallerIdAliasSpecifiers");
      -[CNFRegSettingsController refreshReceiveRelayCallsSettingsAnimated:](self, "refreshReceiveRelayCallsSettingsAnimated:", 1);
      goto LABEL_14;
    }
    OSLogHandleForIDSCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v6;
      _os_log_impl(&dword_2138BA000, v9, OS_LOG_TYPE_DEFAULT, "Can't set caller ID with alias %@ because it is not validated", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
LABEL_13:
      IMLogString();
  }
  else
  {
    OSLogHandleForIDSCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v4;
      _os_log_impl(&dword_2138BA000, v8, OS_LOG_TYPE_DEFAULT, "No alias found for specifier: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      goto LABEL_13;
  }
LABEL_14:

}

- (void)refreshCallerIdSpecifier:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __53__CNFRegSettingsController_refreshCallerIdSpecifier___block_invoke;
  v3[3] = &unk_24D075C18;
  v3[4] = self;
  -[CNFRegSettingsController _reloadSpecifier:withBlock:](self, "_reloadSpecifier:withBlock:", a3, v3);
}

void __53__CNFRegSettingsController_refreshCallerIdSpecifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  char *v15;

  v15 = a2;
  objc_msgSend(v15, "CNFRegCallerIdAlias");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  objc_storeWeak((id *)&v15[*MEMORY[0x24BE75768]], *(id *)(a1 + 32));
  *(_QWORD *)&v15[*MEMORY[0x24BE75738]] = 2;
  objc_msgSend(v15, "setProperty:forKey:", v4, *MEMORY[0x24BE75D50]);
  objc_msgSend(v15, "setName:", v4);
  objc_msgSend(v15, "setProperty:forKey:", v5, *MEMORY[0x24BE75948]);
  objc_msgSend(v15, "setButtonAction:", sel_setCallerId_);
  NSStringFromSelector(sel_setCallerId_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setProperty:forKey:", v6, *MEMORY[0x24BE75900]);

  *(_QWORD *)&v15[*MEMORY[0x24BE75740]] = 0;
  objc_msgSend(v15, "setDetailControllerClass:", 0);
  objc_msgSend(v3, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setProperty:forKey:", v7, *MEMORY[0x24BE75AC0]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setProperty:forKey:", v8, *MEMORY[0x24BE75860]);

  objc_msgSend(v3, "account");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v3, "account");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "CNFRegSignInComplete");

  }
  else
  {
    v11 = 0;
  }

  objc_msgSend(*(id *)(a1 + 32), "regController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "displayAlias");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11
    && (objc_msgSend(v13, "isEqual:", v3)
     || objc_msgSend(v13, "isLocalPhoneNumberAlias")
     && objc_msgSend(v3, "isLocalPhoneNumberAlias")))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setProperty:forKey:", v14, CFSTR("cnfreg-alias-checked"));

  }
  else
  {
    objc_msgSend(v15, "removePropertyForKey:", CFSTR("cnfreg-alias-checked"));
  }
  objc_msgSend(*(id *)(a1 + 32), "_setSpecifierEnabled:enabled:animated:", v15, 1, 1);

}

- (void)refreshAllCallerIdAliasSpecifiers
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if ((*(_BYTE *)&self->_settingsFlags & 0x10) == 0)
  {
    *(_BYTE *)&self->_settingsFlags |= 0x10u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v3 = *(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v11 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
          objc_msgSend(v8, "CNFRegCallerIdAlias", (_QWORD)v10);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          if (v9)
            -[CNFRegSettingsController refreshCallerIdSpecifier:](self, "refreshCallerIdSpecifier:", v8);
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v5);
    }

    *(_BYTE *)&self->_settingsFlags &= ~0x10u;
  }
}

- (void)updateSpecifier:(id)a3 withCallerIdAlias:(id)a4
{
  id v6;
  void *v7;
  char v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (v6)
  {
    objc_msgSend(v9, "CNFRegCallerIdAlias");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqual:", v6);

    if ((v8 & 1) == 0)
    {
      objc_msgSend(v9, "setCNFRegCallerIdAlias:", v6);
      objc_msgSend(v9, "removePropertyForKey:", CFSTR("cnfreg-alias-checked"));
    }
    -[CNFRegSettingsController refreshCallerIdSpecifier:](self, "refreshCallerIdSpecifier:", v9);
  }

}

- (id)createSpecifierForCallerIdAlias:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;

  v4 = (objc_class *)MEMORY[0x24BE75590];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  -[CNFRegSettingsController updateSpecifier:withCallerIdAlias:](self, "updateSpecifier:withCallerIdAlias:", v6, v5);

  return v6;
}

- (BOOL)shouldShowReplyWithMessage
{
  void *v3;
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;
  char v8;
  void *v9;
  BOOL v10;
  void *v11;
  char v12;
  BOOL v13;

  -[CNFRegListController regController](self, "regController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "serviceType");

  -[CNFRegListController regController](self, "regController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isServiceEnabled");

  objc_msgSend(MEMORY[0x24BE30338], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isTelephonyDevice");

  objc_msgSend(MEMORY[0x24BE30338], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "supportsSMS") & 1) != 0)
  {
    v10 = 1;
  }
  else
  {
    -[CNFRegSettingsController _operationalAccountsForService:](self, "_operationalAccountsForService:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v11, "count") != 0;

  }
  if (v4)
    v12 = 0;
  else
    v12 = v6;
  v13 = v12 & ~v8 & v10;

  return v13;
}

- (void)showReplyWithMessage:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  NSArray *replyWithMessageGroupSpecifiers;

  v4 = a3;
  replyWithMessageGroupSpecifiers = self->_replyWithMessageGroupSpecifiers;
  if (v4)
    -[CNFRegSettingsController showSpecifiers:afterGroupId:animated:](self, "showSpecifiers:afterGroupId:animated:", replyWithMessageGroupSpecifiers, CFSTR("FACETIME_ACCOUNT_GROUP_ID"), a4);
  else
    -[CNFRegSettingsController removeContiguousSpecifiers:animated:](self, "removeContiguousSpecifiers:animated:", replyWithMessageGroupSpecifiers, a4);
}

- (BOOL)shouldShowBlocklistSettings
{
  void *v3;
  uint64_t v4;
  void *v5;
  char v6;
  BOOL v7;

  -[CNFRegListController regController](self, "regController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "serviceType");

  -[CNFRegListController regController](self, "regController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isServiceEnabled");
  if (v4)
    v7 = 0;
  else
    v7 = v6;

  return v7;
}

- (void)showBlocklistSettings:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  NSArray *blocklistGroupSpecifiers;

  v4 = a3;
  blocklistGroupSpecifiers = self->_blocklistGroupSpecifiers;
  if (v4)
    -[CNFRegSettingsController showFaceTimeSpecifiers:afterGroupId:animated:](self, "showFaceTimeSpecifiers:afterGroupId:animated:", blocklistGroupSpecifiers, CFSTR("FACETIME_VPC_GROUP_ID"), a4);
  else
    -[CNFRegSettingsController removeContiguousSpecifiers:animated:](self, "removeContiguousSpecifiers:animated:", blocklistGroupSpecifiers, a4);
}

- (void)refreshBlocklistSettingsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  NSArray *v5;
  NSObject *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[8];
  _BYTE v16[128];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x24BDAC8D0];
  v5 = self->_blocklistGroupSpecifiers;
  if (v5)
  {
    OSLogHandleForIDSCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2138BA000, v6, OS_LOG_TYPE_DEFAULT, "Refreshing blocklist settings", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      IMLogString();
    if (-[CNFRegSettingsController shouldShowBlocklistSettings](self, "shouldShowBlocklistSettings"))
    {
      -[CNFRegSettingsController showBlocklistSettings:animated:](self, "showBlocklistSettings:animated:", 1, v3);
      v13 = 0u;
      v14 = 0u;
      v11 = 0u;
      v12 = 0u;
      v7 = self->_blocklistGroupSpecifiers;
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v12;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v12 != v9)
              objc_enumerationMutation(v7);
            -[CNFRegSettingsController reloadSpecifier:](self, "reloadSpecifier:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++), (_QWORD)v11);
          }
          while (v8 != v10);
          v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
        }
        while (v8);
      }

    }
    else
    {
      -[CNFRegSettingsController showBlocklistSettings:animated:](self, "showBlocklistSettings:animated:", 0, v3);
    }
  }

}

- (int64_t)indexOfLastSpecifierInGroup:(id)a3
{
  int64_t v4;
  uint64_t v5;
  uint64_t v7;

  v4 = 0x7FFFFFFFFFFFFFFFLL;
  v7 = 0x7FFFFFFFFFFFFFFFLL;
  if (-[CNFRegSettingsController getGroup:row:ofSpecifier:](self, "getGroup:row:ofSpecifier:", &v7, 0, a3))
  {
    v5 = -[CNFRegSettingsController indexOfGroup:](self, "indexOfGroup:", v7);
    return -[CNFRegSettingsController rowsForGroup:](self, "rowsForGroup:", v7) + v5;
  }
  return v4;
}

- (int64_t)groupIdForSpecifier:(id)a3
{
  int64_t v4;

  v4 = 0x7FFFFFFFFFFFFFFFLL;
  if (-[CNFRegSettingsController getGroup:row:ofSpecifier:](self, "getGroup:row:ofSpecifier:", &v4, 0, a3))return v4;
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (int64_t)groupIdForSpecifierId:(id)a3
{
  void *v4;
  int64_t v5;

  -[CNFRegSettingsController specifierForID:](self, "specifierForID:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CNFRegSettingsController groupIdForSpecifier:](self, "groupIdForSpecifier:", v4);

  return v5;
}

- (id)_makeRedactedIdentifierFromSpecifier:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFRegSettingsController _makeRedactedIdentifierFromSpecifierId:](self, "_makeRedactedIdentifierFromSpecifierId:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_makeRedactedIdentifierFromSpecifierId:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("account:")))
  {
    objc_msgSend(CFSTR("account:"), "stringByAppendingString:", CFSTR("<redacted>"));
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = v3;
  }
  v5 = v4;

  return v5;
}

- (id)_makeRedactedIdentifiersFromSpecifiers:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __67__CNFRegSettingsController__makeRedactedIdentifiersFromSpecifiers___block_invoke;
  v4[3] = &unk_24D075C68;
  v4[4] = self;
  objc_msgSend(a3, "tu_mapObjectsUsingBlock:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __67__CNFRegSettingsController__makeRedactedIdentifiersFromSpecifiers___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_makeRedactedIdentifierFromSpecifier:", a2);
}

- (void)showSpecifiers:(id)a3 afterGroupId:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v5 = a5;
  v18 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  if (v8 && objc_msgSend(v8, "count"))
  {
    objc_msgSend(v8, "objectAtIndex:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((-[CNFRegSettingsController containsSpecifier:](self, "containsSpecifier:", v10) & 1) == 0)
    {
      -[CNFRegSettingsController specifierForID:](self, "specifierForID:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[CNFRegSettingsController indexOfLastSpecifierInGroup:](self, "indexOfLastSpecifierInGroup:", v11);
      if (v12 == 0x7FFFFFFFFFFFFFFFLL)
        v12 = objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]), "count")- 1;
      -[CNFRegSettingsController _makeRedactedIdentifiersFromSpecifiers:](self, "_makeRedactedIdentifiersFromSpecifiers:", v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      OSLogHandleForIDSCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v13;
        _os_log_impl(&dword_2138BA000, v14, OS_LOG_TYPE_DEFAULT, "CNFRegSettingsController: insertContiguousSpecifiers %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      {
        v15 = v13;
        IMLogString();
      }
      -[CNFRegSettingsController insertContiguousSpecifiers:atIndex:animated:](self, "insertContiguousSpecifiers:atIndex:animated:", v8, v12 + 1, v5, v15);

    }
  }

}

- (void)showFaceTimeSpecifiers:(id)a3 afterGroupId:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  unint64_t v11;
  int *v12;
  NSObject *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  _QWORD v23[10];

  v5 = a5;
  v23[9] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v23[0] = CFSTR("FACETIME_BLOCKLIST_GROUP_ID");
  v23[1] = CFSTR("FACETIME_VPC_GROUP_ID");
  v23[2] = CFSTR("FACETIME_PHOTOS_ENABLED_GROUP_ID");
  v23[3] = CFSTR("FACETIME_CAPTIONS_ENABLED_GROUP_ID");
  v23[4] = CFSTR("GFT_PROMINENCE_GROUP_ID");
  v23[5] = CFSTR("SHAREPLAY_SETTINGS_GROUP");
  v23[6] = CFSTR("SHARED_NAME_AND_PHOTO_SETTINGS_GROUP");
  v23[7] = CFSTR("FACETIME_CALLERID_GROUP_ID");
  v23[8] = CFSTR("FACETIME_ALIAS_GROUP_ID");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "indexOfObject:", v9);
  v12 = (int *)MEMORY[0x24BE756E0];
  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = objc_msgSend(v10, "count");
    while (v11 < v14)
    {
      objc_msgSend(v10, "objectAtIndexedSubscript:", v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + *v12), "specifierForID:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        -[CNFRegSettingsController showSpecifiers:afterGroupId:animated:](self, "showSpecifiers:afterGroupId:animated:", v8, v15, v5);

        goto LABEL_8;
      }

      v14 = objc_msgSend(v10, "count");
      ++v11;
    }
  }
  OSLogHandleForIDSCategory();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v20 = v9;
    v21 = 2112;
    v22 = v8;
    _os_log_impl(&dword_2138BA000, v13, OS_LOG_TYPE_DEFAULT, "Unable to insert FaceTime specifiers after %@. Inserting at end. %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    v17 = v9;
    v18 = v8;
    IMLogString();
  }
  -[CNFRegSettingsController insertContiguousSpecifiers:atIndex:animated:](self, "insertContiguousSpecifiers:atIndex:animated:", v8, objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + *v12), "count", v17, v18), v5);
LABEL_8:

}

- (void)_updateControllerStateAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = a3;
  -[CNFRegSettingsController _operationalAccounts](self, "_operationalAccounts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6
    || (*(_BYTE *)&self->_settingsFlags & 8) != 0
    && (-[CNFRegListController regController](self, "regController"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "accountsWithFilter:", 16386),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v9 = objc_msgSend(v8, "count"),
        v8,
        v9))
  {
    -[CNFRegSettingsController refreshFaceTimeSettingsAnimated:](self, "refreshFaceTimeSettingsAnimated:", v3);
  }
  else
  {
    -[CNFRegSettingsController _popFromSettingsAnimated:](self, "_popFromSettingsAnimated:", v3);
  }
}

- (BOOL)_popFromSettingsAnimated:(BOOL)a3
{
  -[CNFRegListController showAuthKitSignInIfNecessary](self, "showAuthKitSignInIfNecessary", a3);
  return 1;
}

- (BOOL)popToFirstRunControllerAnimated:(BOOL)a3
{
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  id *v8;
  id WeakRetained;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  id v18;
  id v19;
  uint8_t v20[16];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  -[CNFRegListController regController](self, "regController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "accountState");

  if ((v5 & 0x40000000) != 0)
    return 0;
  -[CNFRegListController regController](self, "regController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "serviceType");

  if (v7 == 1)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v8 = (id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE757A0]);
    WeakRetained = objc_loadWeakRetained(v8);
    objc_msgSend(WeakRetained, "viewControllers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v22;
      while (2)
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(v10);
          v14 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v13);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v18 = objc_loadWeakRetained(v8);
            v19 = (id)objc_msgSend(v18, "popToViewController:animated:", v14, 0);

            return 1;
          }
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v11)
          continue;
        break;
      }
    }

    OSLogHandleForIDSCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_2138BA000, v15, OS_LOG_TYPE_DEFAULT, "Trying to pop to first run controller but couldn't find CKSettingsMessagesController. Popping to root instead", v20, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (IMShouldLog())
        IMLogString();
    }
    v16 = objc_loadWeakRetained(v8);
    objc_msgSend(v16, "popRecursivelyToRootController");

    return 0;
  }
  -[CNFRegListController showAuthKitSignInIfNecessary](self, "showAuthKitSignInIfNecessary");
  return 1;
}

- (BOOL)_shouldUseDisabledHandlers
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[CNFRegListController regController](self, "regController", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accounts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v3);
        v6 |= objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "isActive") ^ 1;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6 & 1;
}

- (void)_setupAccountHandlers
{
  if (-[CNFRegSettingsController _shouldUseDisabledHandlers](self, "_shouldUseDisabledHandlers"))
    -[CNFRegSettingsController _setupAccountHandlersForDisabledOperation](self, "_setupAccountHandlersForDisabledOperation");
  else
    -[CNFRegSettingsController _setupAccountHandlersForNormalOperation](self, "_setupAccountHandlersForNormalOperation");
}

- (void)_handleFailedAccountReactivation:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
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
  id v24;
  void *v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[CNFRegListController regController](self, "regController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setServiceEnabled:", 1);

  OSLogHandleForIDSCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "localizedDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v27 = v6;
    v28 = 2112;
    v29 = v10;
    _os_log_impl(&dword_2138BA000, v9, OS_LOG_TYPE_DEFAULT, "Failed to re-register account {%@} : %@", buf, 0x16u);

  }
  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    objc_msgSend(v7, "localizedDescription");
    v24 = v6;
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    IMLogString();

  }
  objc_msgSend(MEMORY[0x24BE30338], "sharedInstance", v24, v25);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "supportsSMSIdentification");

  if (v12)
    -[CNFRegSettingsController refreshFaceTimeSettingsAnimated:](self, "refreshFaceTimeSettingsAnimated:", 1);
  else
    -[CNFRegSettingsController popToFirstRunControllerAnimated:](self, "popToFirstRunControllerAnimated:", 1);
  if (v7)
  {
    -[CNFRegListController regController](self, "regController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "shouldShowAlertForError:", v7);

    if (v14)
    {
      CommunicationsSetupUIBundle();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      CNFRegStringTableName();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("FACETIME_ACTIVATION_ERROR_TITLE"), &stru_24D077260, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "localizedDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      CommunicationsSetupUIBundle();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      CNFRegStringTableName();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("FACETIME_ALERT_OK"), &stru_24D077260, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v17, v18, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBD3A8], "actionWithTitle:style:handler:", v21, 0, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addAction:", v23);

      -[CNFRegSettingsController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v22, 1, 0);
    }
  }

}

- (void)_handleSuccessfulAccountReactivation:(id)a3
{
  void *v4;
  void *v5;
  int v6;

  -[CNFRegListController regController](self, "regController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setServiceEnabled:", 1);

  -[CNFRegListController regController](self, "regController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "accountState");

  if ((v6 & 0x40000000) != 0)
  {
    -[CNFRegSettingsController _setupAccountHandlersForNormalOperation](self, "_setupAccountHandlersForNormalOperation");
    -[CNFRegSettingsController refreshFaceTimeSettingsAnimated:](self, "refreshFaceTimeSettingsAnimated:", 1);
  }
  else
  {
    -[CNFRegSettingsController popToFirstRunControllerAnimated:](self, "popToFirstRunControllerAnimated:", 1);
  }
}

- (BOOL)_allAccountsAreDeactivated
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[CNFRegListController regController](self, "regController", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accounts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if ((objc_msgSend(v8, "isActive") & 1) != 0 || objc_msgSend(v8, "registrationStatus") > 1)
        {
          v9 = 0;
          goto LABEL_13;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v9 = 1;
      if (v5)
        continue;
      break;
    }
  }
  else
  {
    v9 = 1;
  }
LABEL_13:

  return v9;
}

- (void)_setupAccountHandlersForDisabling
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];
  uint8_t buf[16];
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CNFRegSettingsController;
  -[CNFRegListController _setupEventHandlers](&v11, sel__setupEventHandlers);
  OSLogHandleForIDSCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2138BA000, v3, OS_LOG_TYPE_DEFAULT, "Setting up account handlers for disabling accounts", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    IMLogString();
  -[CNFRegListController regController](self, "regController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CNFRegSettingsController _allAccountsAreDeactivated](self, "_allAccountsAreDeactivated"))
  {
    -[CNFRegSettingsController _setupAccountHandlers](self, "_setupAccountHandlers");
  }
  else
  {
    -[CNFRegListController removeAllHandlers](self, "removeAllHandlers");
    v5 = MEMORY[0x24BDAC760];
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __61__CNFRegSettingsController__setupAccountHandlersForDisabling__block_invoke;
    v9[3] = &unk_24D075180;
    v9[4] = self;
    objc_msgSend(v4, "setResetBlock:", v9);
    v8[0] = v5;
    v8[1] = 3221225472;
    v8[2] = __61__CNFRegSettingsController__setupAccountHandlersForDisabling__block_invoke_2;
    v8[3] = &unk_24D075180;
    v8[4] = self;
    objc_msgSend(v4, "setServiceDidBecomeUnsupportedBlock:", v8);
    v7[0] = v5;
    v7[1] = 3221225472;
    v7[2] = __61__CNFRegSettingsController__setupAccountHandlersForDisabling__block_invoke_3;
    v7[3] = &unk_24D075C90;
    v7[4] = self;
    objc_msgSend(v4, "setAccountActivationChangedBlock:", v7);
    v6[0] = v5;
    v6[1] = 3221225472;
    v6[2] = __61__CNFRegSettingsController__setupAccountHandlersForDisabling__block_invoke_4;
    v6[3] = &unk_24D075CB8;
    v6[4] = self;
    objc_msgSend(v4, "setAccountRegistrationBlock:", v6);
  }

}

uint64_t __61__CNFRegSettingsController__setupAccountHandlersForDisabling__block_invoke(uint64_t a1)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "_shouldUseDisabledHandlers") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "_setupAccountHandlers");
  return objc_msgSend(*(id *)(a1 + 32), "refreshFaceTimeSettingsAnimated:", 0);
}

void __61__CNFRegSettingsController__setupAccountHandlersForDisabling__block_invoke_2(uint64_t a1)
{
  void *v2;
  char v3;

  objc_msgSend(*(id *)(a1 + 32), "regController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isServiceSupported");

  if ((v3 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "popRecursivelyToRootController");
}

uint64_t __61__CNFRegSettingsController__setupAccountHandlersForDisabling__block_invoke_3(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_updateSwitchDelayed");
  result = objc_msgSend(*(id *)(a1 + 32), "_allAccountsAreDeactivated");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "_setupAccountHandlersForDisabledOperation");
  return result;
}

uint64_t __61__CNFRegSettingsController__setupAccountHandlersForDisabling__block_invoke_4(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_updateSwitchDelayed");
  result = objc_msgSend(*(id *)(a1 + 32), "_allAccountsAreDeactivated");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "_setupAccountHandlersForDisabledOperation");
  return result;
}

- (void)_setupAccountHandlersForDisabledOperation
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];
  uint8_t buf[16];
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CNFRegSettingsController;
  -[CNFRegListController _setupEventHandlers](&v11, sel__setupEventHandlers);
  OSLogHandleForIDSCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2138BA000, v3, OS_LOG_TYPE_DEFAULT, "Setting up disabled account handlers", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    IMLogString();
  -[CNFRegListController regController](self, "regController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __69__CNFRegSettingsController__setupAccountHandlersForDisabledOperation__block_invoke;
  v9[3] = &unk_24D075180;
  v9[4] = self;
  objc_msgSend(v4, "setResetBlock:", v9);
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __69__CNFRegSettingsController__setupAccountHandlersForDisabledOperation__block_invoke_2;
  v8[3] = &unk_24D075180;
  v8[4] = self;
  objc_msgSend(v4, "setServiceDidBecomeUnsupportedBlock:", v8);
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __69__CNFRegSettingsController__setupAccountHandlersForDisabledOperation__block_invoke_3;
  v7[3] = &unk_24D075C90;
  v7[4] = self;
  objc_msgSend(v4, "setAccountActivationChangedBlock:", v7);
  v6[0] = v5;
  v6[1] = 3221225472;
  v6[2] = __69__CNFRegSettingsController__setupAccountHandlersForDisabledOperation__block_invoke_527;
  v6[3] = &unk_24D075CB8;
  v6[4] = self;
  objc_msgSend(v4, "setAccountRegistrationBlock:", v6);

}

uint64_t __69__CNFRegSettingsController__setupAccountHandlersForDisabledOperation__block_invoke(uint64_t a1)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "_shouldUseDisabledHandlers") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "_setupAccountHandlers");
  return objc_msgSend(*(id *)(a1 + 32), "refreshFaceTimeSettingsAnimated:", 0);
}

void __69__CNFRegSettingsController__setupAccountHandlersForDisabledOperation__block_invoke_2(uint64_t a1)
{
  void *v2;
  char v3;

  objc_msgSend(*(id *)(a1 + 32), "regController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isServiceSupported");

  if ((v3 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "popRecursivelyToRootController");
}

void __69__CNFRegSettingsController__setupAccountHandlersForDisabledOperation__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  OSLogHandleForIDSCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    CNFRegStringForAccount(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v9 = v5;
    _os_log_impl(&dword_2138BA000, v4, OS_LOG_TYPE_DEFAULT, "Handling activation state change on account: %@", buf, 0xCu);

  }
  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    CNFRegStringForAccount(v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    IMLogString();

  }
  objc_msgSend(*(id *)(a1 + 32), "_updateSwitchDelayed", v7);
  if (objc_msgSend(v3, "isActive") && objc_msgSend(v3, "CNFRegSignInComplete"))
  {
    OSLogHandleForIDSCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2138BA000, v6, OS_LOG_TYPE_DEFAULT, "Activated an account that was registered, running success path", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      IMLogString();
    objc_msgSend(*(id *)(a1 + 32), "_handleSuccessfulAccountReactivation:", v3);
  }

}

void __69__CNFRegSettingsController__setupAccountHandlersForDisabledOperation__block_invoke_527(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_updateSwitchDelayed");
  if (objc_msgSend(v6, "CNFRegSignInComplete"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_handleSuccessfulAccountReactivation:", v6);
  }
  else if (objc_msgSend(v6, "CNFRegSignInFailed"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_handleFailedAccountReactivation:error:", v6, v5);
  }

}

- (void)_setupAccountHandlersForNormalOperation
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[5];
  uint8_t buf[16];
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CNFRegSettingsController;
  -[CNFRegListController _setupEventHandlers](&v17, sel__setupEventHandlers);
  OSLogHandleForIDSCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2138BA000, v3, OS_LOG_TYPE_DEFAULT, "Setting up normal account handlers", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    IMLogString();
  -[CNFRegListController regController](self, "regController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __67__CNFRegSettingsController__setupAccountHandlersForNormalOperation__block_invoke;
  v15[3] = &unk_24D075180;
  v15[4] = self;
  objc_msgSend(v4, "setResetBlock:", v15);
  v14[0] = v5;
  v14[1] = 3221225472;
  v14[2] = __67__CNFRegSettingsController__setupAccountHandlersForNormalOperation__block_invoke_2;
  v14[3] = &unk_24D075180;
  v14[4] = self;
  objc_msgSend(v4, "setServiceDidBecomeUnsupportedBlock:", v14);
  v13[0] = v5;
  v13[1] = 3221225472;
  v13[2] = __67__CNFRegSettingsController__setupAccountHandlersForNormalOperation__block_invoke_3;
  v13[3] = &unk_24D075180;
  v13[4] = self;
  objc_msgSend(v4, "setCallerIdChangedBlock:", v13);
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __67__CNFRegSettingsController__setupAccountHandlersForNormalOperation__block_invoke_532;
  v12[3] = &unk_24D075C90;
  v12[4] = self;
  objc_msgSend(v4, "setAccountRemovedBlock:", v12);
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __67__CNFRegSettingsController__setupAccountHandlersForNormalOperation__block_invoke_535;
  v11[3] = &unk_24D075C90;
  v11[4] = self;
  objc_msgSend(v4, "setAccountActivationChangedBlock:", v11);
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __67__CNFRegSettingsController__setupAccountHandlersForNormalOperation__block_invoke_536;
  v10[3] = &unk_24D075CB8;
  v10[4] = self;
  objc_msgSend(v4, "setAccountRegistrationBlock:", v10);
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __67__CNFRegSettingsController__setupAccountHandlersForNormalOperation__block_invoke_549;
  v9[3] = &unk_24D075CE0;
  v9[4] = self;
  objc_msgSend(v4, "setAliasRemovedBlock:", v9);
  objc_msgSend(v4, "aliasRemovedBlock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAliasAddedBlock:", v6);

  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __67__CNFRegSettingsController__setupAccountHandlersForNormalOperation__block_invoke_2_551;
  v8[3] = &unk_24D075D08;
  v8[4] = self;
  objc_msgSend(v4, "setAliasStatusChangedBlock:", v8);
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __67__CNFRegSettingsController__setupAccountHandlersForNormalOperation__block_invoke_3_553;
  v7[3] = &unk_24D075C90;
  v7[4] = self;
  objc_msgSend(v4, "setVettedAliasesChangedBlock:", v7);

}

uint64_t __67__CNFRegSettingsController__setupAccountHandlersForNormalOperation__block_invoke(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "_shouldUseDisabledHandlers"))
    objc_msgSend(*(id *)(a1 + 32), "_setupAccountHandlers");
  return objc_msgSend(*(id *)(a1 + 32), "refreshFaceTimeSettingsAnimated:", 0);
}

void __67__CNFRegSettingsController__setupAccountHandlersForNormalOperation__block_invoke_2(uint64_t a1)
{
  void *v2;
  char v3;

  objc_msgSend(*(id *)(a1 + 32), "regController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isServiceSupported");

  if ((v3 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "popRecursivelyToRootController");
}

uint64_t __67__CNFRegSettingsController__setupAccountHandlersForNormalOperation__block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  OSLogHandleForIDSCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2138BA000, v2, OS_LOG_TYPE_DEFAULT, "Refreshing caller id", v4, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    IMLogString();
  objc_msgSend(*(id *)(a1 + 32), "refreshCallerIdAliasesAnimated:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "refreshReceiveRelayCallsSettingsAnimated:", 1);
}

void __67__CNFRegSettingsController__setupAccountHandlersForNormalOperation__block_invoke_532(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  BOOL v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  uint8_t v15[16];

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "regController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "serviceType");

  objc_msgSend(*(id *)(a1 + 32), "regController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "serviceSupportsDeviceAliasEnablement"))
  {
    objc_msgSend(*(id *)(a1 + 32), "regController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "usableDeviceAliases");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count") != 0;

  }
  else
  {
    v9 = 0;
  }

  if (v5)
    v10 = 0;
  else
    v10 = v9;
  objc_msgSend(*(id *)(a1 + 32), "regController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "accountsWithFilter:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13 || v10)
  {
    objc_msgSend(*(id *)(a1 + 32), "refreshFaceTimeSettingsAnimated:", 1);
  }
  else
  {
    OSLogHandleForIDSCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_2138BA000, v14, OS_LOG_TYPE_DEFAULT, "Account used for settings was removed, popping", v15, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      IMLogString();
    objc_msgSend(*(id *)(a1 + 32), "_popFromSettingsAnimated:", 1);
  }

}

void __67__CNFRegSettingsController__setupAccountHandlersForNormalOperation__block_invoke_535(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint8_t v8[16];

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "regController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountsWithFilter:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "refreshFaceTimeSettingsAnimated:", 1);
  }
  else
  {
    OSLogHandleForIDSCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_2138BA000, v7, OS_LOG_TYPE_DEFAULT, "Account used for settings was removed, popping", v8, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      IMLogString();
    objc_msgSend(*(id *)(a1 + 32), "_popFromSettingsAnimated:", 1);
  }

}

void __67__CNFRegSettingsController__setupAccountHandlersForNormalOperation__block_invoke_536(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;
  int v14;
  NSObject *v15;
  int v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  const __CFString *v20;
  void *v21;
  _BOOL4 v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  const __CFString *v33;
  const __CFString *v34;
  void *v35;
  void *v36;
  uint8_t buf[4];
  const __CFString *v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  OSLogHandleForIDSCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_msgSend(v5, "isActive");
    CNFRegStringForAccount(v5);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    v11 = CFSTR("NO");
    if (v8)
      v11 = CFSTR("YES");
    *(_DWORD *)buf = 138412546;
    v38 = v11;
    v39 = 2112;
    v40 = v9;
    _os_log_impl(&dword_2138BA000, v7, OS_LOG_TYPE_DEFAULT, "Account status changed (isActive=%@): %@", buf, 0x16u);

  }
  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    if (objc_msgSend(v5, "isActive"))
      v12 = CFSTR("YES");
    else
      v12 = CFSTR("NO");
    CNFRegStringForAccount(v5);
    v33 = v12;
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    IMLogString();

  }
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "regController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "shouldShowAlertForError:", v6);

  }
  else
  {
    v14 = 0;
  }
  if ((objc_msgSend(v5, "CNFRegSignInComplete", v33, v35) & 1) != 0)
    goto LABEL_34;
  OSLogHandleForIDSCategory();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = objc_msgSend(v5, "isActive");
    CNFRegStringForAccount(v5);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    v19 = CFSTR("NO");
    if (v16)
      v19 = CFSTR("YES");
    *(_DWORD *)buf = 138412546;
    v38 = v19;
    v39 = 2112;
    v40 = v17;
    _os_log_impl(&dword_2138BA000, v15, OS_LOG_TYPE_DEFAULT, "Account no longer signed in (isActive=%@): %@", buf, 0x16u);

  }
  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    if (objc_msgSend(v5, "isActive"))
      v20 = CFSTR("YES");
    else
      v20 = CFSTR("NO");
    CNFRegStringForAccount(v5);
    v34 = v20;
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    IMLogString();

  }
  CNFRegLogIndent();
  CNFRegLogBacktrace();
  CNFRegLogOutdent();
  objc_msgSend(*(id *)(a1 + 32), "_operationalAccounts");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count") == 0;

  if (!v22)
    goto LABEL_34;
  OSLogHandleForIDSCategory();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2138BA000, v23, OS_LOG_TYPE_DEFAULT, "No more useable accounts, popping", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    IMLogString();
  if (objc_msgSend(*(id *)(a1 + 32), "_popFromSettingsAnimated:", 1, v34, v36))
  {
    if ((v14 & 1) == 0)
      goto LABEL_37;
  }
  else
  {
LABEL_34:
    objc_msgSend(*(id *)(a1 + 32), "_updateSwitchDelayed", v34, v36);
    if (!v14)
    {
      objc_msgSend(*(id *)(a1 + 32), "refreshFaceTimeSettingsWithDelayAnimated:", 1);
      goto LABEL_37;
    }
  }
  CommunicationsSetupUIBundle();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  CNFRegStringTableName();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("FACETIME_ACTIVATION_ERROR_TITLE"), &stru_24D077260, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "localizedDescription");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  CommunicationsSetupUIBundle();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  CNFRegStringTableName();
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("FACETIME_ALERT_OK"), &stru_24D077260, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v26, v27, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD3A8], "actionWithTitle:style:handler:", v30, 0, 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addAction:", v32);

  objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v31, 1, 0);
LABEL_37:

}

uint64_t __67__CNFRegSettingsController__setupAccountHandlersForNormalOperation__block_invoke_549(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "refreshAliasesAnimated:", 0);
  objc_msgSend(*(id *)(a1 + 32), "refreshCallerIdAliasesAnimated:", 1);
  objc_msgSend(*(id *)(a1 + 32), "refreshTemporaryPhoneAnimated:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "refreshReceiveRelayCallsSettingsAnimated:", 1);
}

void __67__CNFRegSettingsController__setupAccountHandlersForNormalOperation__block_invoke_2_551(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "refreshAllAliasSpecifiers");
  objc_msgSend(*(id *)(a1 + 32), "refreshCallerIdAliasesAnimated:", 1);
  v7 = objc_msgSend(v6, "validationStatus");

  if (v7 == -1)
    objc_msgSend(*(id *)(a1 + 32), "_showAliasValidationError:", v8);

}

uint64_t __67__CNFRegSettingsController__setupAccountHandlersForNormalOperation__block_invoke_3_553(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "refreshAliasesAnimated:", 0);
  objc_msgSend(*(id *)(a1 + 32), "refreshCallerIdAliasesAnimated:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "refreshTemporaryPhoneAnimated:", 1);
}

- (void)handleCallStatusChanged
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__CNFRegSettingsController_handleCallStatusChanged__block_invoke;
  block[3] = &unk_24D075180;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __51__CNFRegSettingsController_handleCallStatusChanged__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "refreshFaceTimeSettingsAnimated:", 0);
}

- (void)_handleFaceTimeCTRegistrationStatusChanged
{
  -[CNFRegSettingsController refreshFaceTimeSettingsAnimated:](self, "refreshFaceTimeSettingsAnimated:", 0);
}

- (void)_handleFaceTimeEntitlementStatusChanged
{
  -[CNFRegSettingsController refreshFaceTimeSettingsAnimated:](self, "refreshFaceTimeSettingsAnimated:", 0);
}

- (void)_handleRelayCapabilitiesChanged
{
  -[CNFRegSettingsController refreshFaceTimeSettingsAnimated:](self, "refreshFaceTimeSettingsAnimated:", 0);
}

- (void)_handleOutgoingRelayCallerIDChanged
{
  -[CNFRegSettingsController refreshFaceTimeSettingsAnimated:](self, "refreshFaceTimeSettingsAnimated:", 0);
}

- (void)_handleAccountRegistrarChanged
{
  -[CNFRegSettingsController refreshEnabledStateAnimated:](self, "refreshEnabledStateAnimated:", 0);
}

- (BOOL)showDeviceAliases
{
  return self->_showDeviceAliases;
}

- (void)setShowDeviceAliases:(BOOL)a3
{
  self->_showDeviceAliases = a3;
}

- (BOOL)hideAppleIDLogin
{
  return self->_hideAppleIDLogin;
}

- (void)setHideAppleIDLogin:(BOOL)a3
{
  self->_hideAppleIDLogin = a3;
}

- (BOOL)showReceiveRelayCalls
{
  return self->_showReceiveRelayCalls;
}

- (void)setSystemPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_systemPolicy, a3);
}

- (int)captionsSubscriptionToken
{
  return self->_captionsSubscriptionToken;
}

- (void)setCaptionsSubscriptionToken:(int)a3
{
  self->_captionsSubscriptionToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemPolicy, 0);
  objc_storeStrong((id *)&self->_delayedRefreshAnimatedFlag, 0);
  objc_storeStrong((id *)&self->_addresses, 0);
  objc_storeStrong((id *)&self->_temporaryPhoneRemoveGroupSpecifiers, 0);
  objc_storeStrong((id *)&self->_temporaryPhoneDescriptionGroupSpecifiers, 0);
  objc_storeStrong((id *)&self->_temporaryPhoneGroupSpecifiers, 0);
  objc_storeStrong((id *)&self->_sharedNameAndPhotoSpecifiers, 0);
  objc_storeStrong((id *)&self->_sharePlaySpecifiers, 0);
  objc_storeStrong((id *)&self->_faceTimeVPCGroupSpecifiers, 0);
  objc_storeStrong((id *)&self->_faceTimePhotosGroupSpecifiers, 0);
  objc_storeStrong((id *)&self->_faceTimeCaptionsGroupSpecifiers, 0);
  objc_storeStrong((id *)&self->_GFTProminenceGroupSpecifiers, 0);
  objc_storeStrong((id *)&self->_receiveRelayCallsGroupSpecifiers, 0);
  objc_storeStrong((id *)&self->_blocklistGroupSpecifiers, 0);
  objc_storeStrong((id *)&self->_replyWithMessageGroupSpecifiers, 0);
  objc_storeStrong((id *)&self->_callerIdGroupSpecifiers, 0);
  objc_storeStrong((id *)&self->_aliasGroupSpecifiers, 0);
  objc_storeStrong((id *)&self->_accountGroupSpecifiers, 0);
  objc_storeStrong((id *)&self->_faceTimeEnabledSpecifier, 0);
  objc_storeStrong((id *)&self->_faceTimeEnabledGroupSpecifier, 0);
}

@end

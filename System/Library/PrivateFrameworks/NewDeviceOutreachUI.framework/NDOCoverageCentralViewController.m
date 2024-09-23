@implementation NDOCoverageCentralViewController

- (NDOCoverageCentralViewController)init
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NDOCoverageCentralViewController *v14;

  _NDOLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[NDOCoverageCentralViewController init].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);

  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "aida_accountForPrimaryiCloudAccount");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_opt_new();
  v14 = -[NDOCoverageCentralViewController initWithIsSignedIn:deviceManager:](self, "initWithIsSignedIn:deviceManager:", v12 != 0, v13);

  return v14;
}

- (NDOCoverageCentralViewController)initWithIsSignedIn:(BOOL)a3 deviceManager:(id)a4
{
  _BOOL8 v4;
  id v6;
  NDOCoverageCentralViewController *v7;
  NDOCoverageCentralViewController *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *policyLookupQueue;
  dispatch_group_t v18;
  OS_dispatch_group *group;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  objc_super v30;

  v4 = a3;
  v6 = a4;
  v30.receiver = self;
  v30.super_class = (Class)NDOCoverageCentralViewController;
  v7 = -[NDOCoverageCentralViewController init](&v30, sel_init);
  v8 = v7;
  if (v7)
  {
    -[NDOCoverageCentralViewController setIsSignedIn:](v7, "setIsSignedIn:", v4);
    if (-[NDOCoverageCentralViewController isSignedIn](v8, "isSignedIn"))
    {
      -[NDOCoverageCentralViewController setNdoManager:](v8, "setNdoManager:", v6);
      -[NDOCoverageCentralViewController ndoManager](v8, "ndoManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "defaultDevice");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NDOCoverageCentralViewController setDefaultDevice:](v8, "setDefaultDevice:", v10);

      v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      -[NDOCoverageCentralViewController setPairedDevices:](v8, "setPairedDevices:", v11);

      v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      -[NDOCoverageCentralViewController setAllLocalDevices:](v8, "setAllLocalDevices:", v12);

      v13 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      -[NDOCoverageCentralViewController setDeviceInfoDict:](v8, "setDeviceInfoDict:", v13);

      v14 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      -[NDOCoverageCentralViewController setDeviceSequenceDict:](v8, "setDeviceSequenceDict:", v14);

      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = dispatch_queue_create("com.apple.newdeviceoutreach.ndoccvc.policyqueue", v15);
      policyLookupQueue = v8->_policyLookupQueue;
      v8->_policyLookupQueue = (OS_dispatch_queue *)v16;

      v18 = dispatch_group_create();
      group = v8->_group;
      v8->_group = (OS_dispatch_group *)v18;

      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v20 = objc_claimAutoreleasedReturnValue();
      -[NSObject UUIDString](v20, "UUIDString");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[NDOCoverageCentralViewController setSessionID:](v8, "setSessionID:", v21);

    }
    else
    {
      _NDOLogSystem();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[NDOCoverageCentralViewController initWithIsSignedIn:deviceManager:].cold.1(v20, v22, v23, v24, v25, v26, v27, v28);
    }

  }
  return v8;
}

- (void)loadView
{
  OUTLINED_FUNCTION_0_2(&dword_229EC7000, a1, a3, "%{public}s: Not signed in to icloud. Leaving...", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __44__NDOCoverageCentralViewController_loadView__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "setOnViewIsAppearing:", 0);
    _NDOLogSystem();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __44__NDOCoverageCentralViewController_loadView__block_invoke_cold_1(v2, v3);

    if ((objc_msgSend(v2, "launchedWithUrl") & 1) == 0)
    {
      objc_msgSend(v2, "specifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "propertyForKey:", CFSTR("NDODeviceInfo"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "warranty");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        _NDOLogSystem();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v5, "warranty");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = 136446466;
          v10 = "-[NDOCoverageCentralViewController loadView]_block_invoke";
          v11 = 2112;
          v12 = v8;
          _os_log_impl(&dword_229EC7000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s: Updating default device info with warranty:%@: ", (uint8_t *)&v9, 0x16u);

        }
        objc_msgSend(v2, "updateDefaultDeviceWithDeviceInfo:", v5);
      }
      objc_msgSend(v2, "fetchAllDeviceInfoUsingPolicy:sessionID:params:isSales:withReply:", 0, v2[179], 0, 0, 0);

    }
  }

}

- (id)_localizedResourceWithString:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (objc_class *)MEMORY[0x24BDD19B8];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v5, "initWithKey:table:locale:bundleURL:", v4, 0, v6, v8);

  return v9;
}

- (void)_donateNavLinks
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("settings-navigation://com.apple.Settings.General/COVERAGE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NDOCoverageCentralViewController _localizedResourceWithString:](self, "_localizedResourceWithString:", CFSTR("AppleCare & Warranty"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NDOCoverageCentralViewController _localizedResourceWithString:](self, "_localizedResourceWithString:", CFSTR("General"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  -[NDOCoverageCentralViewController _localizedResourceWithString:](self, "_localizedResourceWithString:", CFSTR("AppleCare & Warranty"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NDOCoverageCentralViewController pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:](self, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:", CFSTR("com.apple.graphic-icon.gear"), v4, v7, v3);

}

- (void)viewIsAppearing:(BOOL)a3
{
  void *v4;
  void (**v5)(void);
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NDOCoverageCentralViewController;
  -[NDOCoverageCentralViewController viewIsAppearing:](&v6, sel_viewIsAppearing_, a3);
  -[NDOCoverageCentralViewController _donateNavLinks](self, "_donateNavLinks");
  -[NDOCoverageCentralViewController onViewIsAppearing](self, "onViewIsAppearing");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[NDOCoverageCentralViewController onViewIsAppearing](self, "onViewIsAppearing");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v5[2]();

  }
}

- (id)specifiers
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  objc_class *v13;
  void *v14;

  _NDOLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[NDOCoverageCentralViewController specifiers].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);

  v11 = (int)*MEMORY[0x24BE756E0];
  v12 = *(Class *)((char *)&self->super.super.super.super.super.isa + v11);
  if (!v12)
  {
    -[NDOCoverageCentralViewController updateCells](self, "updateCells");
    v13 = (objc_class *)objc_claimAutoreleasedReturnValue();
    v14 = *(Class *)((char *)&self->super.super.super.super.super.isa + v11);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v11) = v13;

    v12 = *(Class *)((char *)&self->super.super.super.super.super.isa + v11);
  }
  return v12;
}

- (id)offerTextForDeviceInfo:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BE6C4B8];
  objc_msgSend(a3, "warranty");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ctaTextWithWarranty:forDate:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)offerTextForDevice:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BE6C4B8], "ctaTextWithDevice:", a3);
}

- (id)updateCells
{
  _BOOL4 v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  _QWORD *v50;
  _QWORD *v51;
  uint64_t *v52;
  NSObject *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  NSObject *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  NSObject *v77;
  const __CFString *v78;
  uint64_t v79;
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
  void *v92;
  void *v93;
  id v94;
  uint64_t v95;
  uint64_t v96;
  char v97;
  uint64_t v98;
  double v99;
  uint64_t i;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  uint64_t v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  uint64_t v113;
  void *v114;
  const __CFString *v115;
  uint64_t v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  id obj;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  uint64_t v132;
  void *v133;
  void *v134;
  id v135;
  id v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  id v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  _QWORD v148[5];
  id v149;
  id v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  const __CFString *v159;
  _QWORD v160[2];
  _QWORD v161[2];
  _BYTE v162[128];
  _QWORD v163[2];
  _QWORD v164[2];
  _QWORD v165[2];
  _QWORD v166[2];
  _BYTE v167[128];
  _BYTE v168[128];
  uint64_t v169;

  v169 = *MEMORY[0x24BDAC8D0];
  v143 = (id)objc_opt_new();
  v3 = -[NDOCoverageCentralViewController shouldShowDeviceListUI](self, "shouldShowDeviceListUI");
  _NDOLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (!v3)
  {
    if (v5)
      -[NDOCoverageCentralViewController updateCells].cold.5(v4, v6, v7, v8, v9, v10, v11, v12);

    -[NDOCoverageCentralViewController defaultDevice](self, "defaultDevice");
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    v50 = (_QWORD *)MEMORY[0x24BE75948];
    v51 = (_QWORD *)MEMORY[0x24BE75D10];
    v52 = (uint64_t *)MEMORY[0x24BE75AC0];
    if (v49)
    {
      _NDOLogSystem();
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
        -[NDOCoverageCentralViewController updateCells].cold.4(v53, v54, v55, v56, v57, v58, v59, v60);

      -[NDOCoverageCentralViewController deviceInfoDict](self, "deviceInfoDict");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      -[NDOCoverageCentralViewController defaultDevice](self, "defaultDevice");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "serialNumber");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "objectForKeyedSubscript:", v63);
      v64 = (void *)objc_claimAutoreleasedReturnValue();

      _NDOLogSystem();
      v65 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
        -[NDOCoverageCentralViewController updateCells].cold.3((uint64_t)v64, self);

      objc_msgSend(v64, "warranty");
      v66 = (void *)objc_claimAutoreleasedReturnValue();

      if (v66)
      {
        v67 = (void *)MEMORY[0x24BE75590];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/NewDeviceOutreachUI.framework"));
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "localizedStringForKey:value:table:", CFSTR("CC_DEFAULT_TITLE"), &stru_24F3352F8, CFSTR("Localizable"));
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v69, self, 0, 0, 0, 0, 0);
        v70 = objc_claimAutoreleasedReturnValue();

        v134 = (void *)v70;
        objc_msgSend(v143, "addObject:", v70);
        v163[0] = *v50;
        v164[0] = objc_opt_class();
        v163[1] = *v51;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BEBE770]);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v164[1] = v71;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v164, v163, 2);
        v72 = (void *)objc_claimAutoreleasedReturnValue();

        v73 = (void *)MEMORY[0x24BE75590];
        objc_msgSend(v64, "device");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "name");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v75, self, 0, 0, objc_opt_class(), 2, 0);
        v76 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v76, "setProperties:", v72);
        objc_msgSend(v76, "setProperty:forKey:", CFSTR("DEFAULT_COVERAGE"), *v52);
        _NDOLogSystem();
        v77 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG))
        {
          -[NDOCoverageCentralViewController updateCells].cold.2(self, v77, &v159);
          v78 = v159;
        }
        else
        {
          v78 = CFSTR("NDOHostingController");
        }

        objc_msgSend(v76, "setProperty:forKey:", self, v78);
        v79 = MEMORY[0x24BDBD1C8];
        objc_msgSend(v76, "setProperty:forKey:", MEMORY[0x24BDBD1C8], CFSTR("isCoverageCentralContainer"));
        objc_msgSend(v64, "warranty");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "setProperty:forKey:", v80, CFSTR("NDOWarranty"));

        objc_msgSend(v76, "setProperty:forKey:", v64, CFSTR("NDODeviceInfo"));
        objc_msgSend(v76, "setProperty:forKey:", v79, CFSTR("isSettingsContainer"));
        objc_msgSend(v64, "warranty");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "coverageLocalizedLabel");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "setObject:forKeyedSubscript:", v82, CFSTR("NDOCoverageItemCellCoverageLabelKey"));

        -[NDOCoverageCentralViewController offerTextForDeviceInfo:](self, "offerTextForDeviceInfo:", v64);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "setObject:forKeyedSubscript:", v83, CFSTR("NDOCoverageItemCellOfferLabelKey"));

        objc_msgSend(v64, "warranty");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "deviceImageUrl");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "setObject:forKeyedSubscript:", v85, CFSTR("NDOCoverageItemCellImageURLKey"));

        objc_msgSend(v64, "device");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "productPlaceholderImage");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "setObject:forKeyedSubscript:", v87, CFSTR("NDOCoverageItemCellFallbackImageKey"));

        -[NDOCoverageCentralViewController deeplinkParams](self, "deeplinkParams");
        v88 = (void *)objc_claimAutoreleasedReturnValue();

        if (v88)
        {
          -[NDOCoverageCentralViewController deeplinkParams](self, "deeplinkParams");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "setProperty:forKey:", v89, CFSTR("NDODeeplinkParams"));

        }
        objc_msgSend(v143, "addObject:", v76);

      }
      else
      {
        v134 = 0;
      }

    }
    else
    {
      v134 = 0;
    }
    -[NDOCoverageCentralViewController pairedDevices](self, "pairedDevices");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/NewDeviceOutreachUI.framework"));
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "localizedStringForKey:value:table:", CFSTR("CC_OTHER_TITLE"), &stru_24F3352F8, CFSTR("Localizable"));
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v93, self, 0, 0, 0, 0, 0);
    v131 = (void *)objc_claimAutoreleasedReturnValue();

    v146 = 0u;
    v147 = 0u;
    v144 = 0u;
    v145 = 0u;
    v94 = v90;
    v95 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v144, v162, 16);
    if (v95)
    {
      v96 = v95;
      v97 = 0;
      v98 = *(_QWORD *)v145;
      v140 = *v51;
      v142 = *v50;
      v99 = *MEMORY[0x24BEBE770];
      v138 = *v52;
      v136 = v94;
      do
      {
        for (i = 0; i != v96; ++i)
        {
          if (*(_QWORD *)v145 != v98)
            objc_enumerationMutation(v136);
          v101 = *(void **)(*((_QWORD *)&v144 + 1) + 8 * i);
          -[NDOCoverageCentralViewController deviceInfoDict](self, "deviceInfoDict");
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v101, "serialNumber");
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v102, "objectForKeyedSubscript:", v103);
          v104 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v104, "warranty");
          v105 = (void *)objc_claimAutoreleasedReturnValue();

          if (v105)
          {
            if ((v97 & 1) == 0)
              objc_msgSend(v143, "addObject:", v131);
            v160[0] = v142;
            v106 = objc_opt_class();
            v160[1] = v140;
            v161[0] = v106;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v99);
            v107 = (void *)objc_claimAutoreleasedReturnValue();
            v161[1] = v107;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v161, v160, 2);
            v108 = (void *)objc_claimAutoreleasedReturnValue();

            v109 = (void *)MEMORY[0x24BE75590];
            objc_msgSend(v104, "device");
            v110 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v110, "name");
            v111 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v109, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v111, self, 0, 0, objc_opt_class(), 2, 0);
            v112 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v112, "setProperties:", v108);
            objc_msgSend(v101, "name");
            v113 = objc_claimAutoreleasedReturnValue();
            v114 = (void *)v113;
            if (v113)
              v115 = (const __CFString *)v113;
            else
              v115 = CFSTR("COVERAGE_ITEM1");
            objc_msgSend(v112, "setProperty:forKey:", v115, v138);

            objc_msgSend(v112, "setProperty:forKey:", self, CFSTR("NDOHostingController"));
            v116 = MEMORY[0x24BDBD1C8];
            objc_msgSend(v112, "setProperty:forKey:", MEMORY[0x24BDBD1C8], CFSTR("isCoverageCentralContainer"));
            objc_msgSend(v112, "setProperty:forKey:", v116, CFSTR("isSettingsContainer"));
            objc_msgSend(v104, "warranty");
            v117 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v112, "setProperty:forKey:", v117, CFSTR("NDOWarranty"));

            objc_msgSend(v112, "setProperty:forKey:", v104, CFSTR("NDODeviceInfo"));
            objc_msgSend(v104, "warranty");
            v118 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v118, "coverageLocalizedLabel");
            v119 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v112, "setObject:forKeyedSubscript:", v119, CFSTR("NDOCoverageItemCellCoverageLabelKey"));

            -[NDOCoverageCentralViewController offerTextForDeviceInfo:](self, "offerTextForDeviceInfo:", v104);
            v120 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v112, "setObject:forKeyedSubscript:", v120, CFSTR("NDOCoverageItemCellOfferLabelKey"));

            objc_msgSend(v104, "warranty");
            v121 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v121, "deviceImageUrl");
            v122 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v112, "setObject:forKeyedSubscript:", v122, CFSTR("NDOCoverageItemCellImageURLKey"));

            objc_msgSend(v104, "device");
            v123 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v123, "productPlaceholderImage");
            v124 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v112, "setObject:forKeyedSubscript:", v124, CFSTR("NDOCoverageItemCellFallbackImageKey"));

            -[NDOCoverageCentralViewController deeplinkParams](self, "deeplinkParams");
            v125 = (void *)objc_claimAutoreleasedReturnValue();

            if (v125)
            {
              -[NDOCoverageCentralViewController deeplinkParams](self, "deeplinkParams");
              v126 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v112, "setProperty:forKey:", v126, CFSTR("NDODeeplinkParams"));

            }
            objc_msgSend(v143, "addObject:", v112);

            v97 = 1;
          }

        }
        v94 = v136;
        v96 = objc_msgSend(v136, "countByEnumeratingWithState:objects:count:", &v144, v162, 16);
      }
      while (v96);

      if ((v97 & 1) != 0)
      {
        -[NDOCoverageCentralViewController addFooterLabelToSpecifier:](self, "addFooterLabelToSpecifier:", v131);
        v13 = v134;
LABEL_64:

        goto LABEL_65;
      }
    }
    else
    {

    }
    v13 = v134;
    if (v134)
      -[NDOCoverageCentralViewController addFooterLabelToSpecifier:](self, "addFooterLabelToSpecifier:", v134);
    goto LABEL_64;
  }
  if (v5)
    -[NDOCoverageCentralViewController updateCells].cold.1(v4, v6, v7, v8, v9, v10, v11, v12);

  v157 = 0u;
  v158 = 0u;
  v155 = 0u;
  v156 = 0u;
  -[NDOCoverageCentralViewController deviceListAPISections](self, "deviceListAPISections");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v130 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v155, v168, 16);
  v13 = 0;
  if (v130)
  {
    v129 = *(_QWORD *)v156;
    v141 = *MEMORY[0x24BE75948];
    v139 = *MEMORY[0x24BE75D10];
    v14 = *MEMORY[0x24BEBE770];
    v137 = *MEMORY[0x24BE75AC0];
    v15 = MEMORY[0x24BDBD1C8];
    do
    {
      v16 = 0;
      v17 = v13;
      do
      {
        if (*(_QWORD *)v156 != v129)
          objc_enumerationMutation(obj);
        v132 = v16;
        v18 = *(void **)(*((_QWORD *)&v155 + 1) + 8 * v16);
        v19 = (void *)MEMORY[0x24BE75590];
        objc_msgSend(v18, "identifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "label");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "groupSpecifierWithID:name:", v20, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        v23 = v22;
        v133 = v23;
        objc_msgSend(v143, "addObject:", v23);
        v153 = 0u;
        v154 = 0u;
        v151 = 0u;
        v152 = 0u;
        objc_msgSend(v18, "deviceList");
        v135 = (id)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v135, "countByEnumeratingWithState:objects:count:", &v151, v167, 16);
        if (v24)
        {
          v25 = v24;
          v26 = *(_QWORD *)v152;
          do
          {
            for (j = 0; j != v25; ++j)
            {
              if (*(_QWORD *)v152 != v26)
                objc_enumerationMutation(v135);
              v28 = *(void **)(*((_QWORD *)&v151 + 1) + 8 * j);
              -[NDOCoverageCentralViewController deviceInfoDict](self, "deviceInfoDict");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "serialNumber");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "objectForKeyedSubscript:", v30);
              v31 = (void *)objc_claimAutoreleasedReturnValue();

              v165[0] = v141;
              v166[0] = objc_opt_class();
              v165[1] = v139;
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v14);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v166[1] = v32;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v166, v165, 2);
              v33 = (void *)objc_claimAutoreleasedReturnValue();

              v34 = (void *)MEMORY[0x24BE75590];
              objc_msgSend(v28, "name");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v35, self, 0, 0, objc_opt_class(), 2, 0);
              v36 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v36, "setProperties:", v33);
              objc_msgSend(v28, "name");
              v37 = objc_claimAutoreleasedReturnValue();
              v38 = (void *)v37;
              if (v37)
                v39 = (const __CFString *)v37;
              else
                v39 = CFSTR("COVERAGE_ITEM");
              objc_msgSend(v36, "setProperty:forKey:", v39, v137);

              objc_msgSend(v36, "setProperty:forKey:", self, CFSTR("NDOHostingController"));
              objc_msgSend(v36, "setProperty:forKey:", v15, CFSTR("isCoverageCentralContainer"));
              objc_msgSend(v36, "setProperty:forKey:", v15, CFSTR("isSettingsContainer"));
              objc_msgSend(v28, "coverageLocalizedLabel");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "setObject:forKeyedSubscript:", v40, CFSTR("NDOCoverageItemCellCoverageLabelKey"));

              if (v31)
                -[NDOCoverageCentralViewController offerTextForDeviceInfo:](self, "offerTextForDeviceInfo:", v31);
              else
                -[NDOCoverageCentralViewController offerTextForDevice:](self, "offerTextForDevice:", v28);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "setObject:forKeyedSubscript:", v41, CFSTR("NDOCoverageItemCellOfferLabelKey"));

              objc_msgSend(v28, "deviceImageUrl");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "setObject:forKeyedSubscript:", v42, CFSTR("NDOCoverageItemCellImageURLKey"));

              objc_msgSend(v28, "productPlaceholderImage");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "setObject:forKeyedSubscript:", v43, CFSTR("NDOCoverageItemCellFallbackImageKey"));

              objc_msgSend(v36, "setObject:forKeyedSubscript:", v28, CFSTR("NDODevice"));
              -[NDOCoverageCentralViewController allLocalDevices](self, "allLocalDevices");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              v148[0] = MEMORY[0x24BDAC760];
              v148[1] = 3221225472;
              v148[2] = __47__NDOCoverageCentralViewController_updateCells__block_invoke;
              v148[3] = &unk_24F334DA0;
              v148[4] = v28;
              v45 = v36;
              v149 = v45;
              v150 = v31;
              v46 = v31;
              objc_msgSend(v44, "enumerateObjectsUsingBlock:", v148);

              -[NDOCoverageCentralViewController deeplinkParams](self, "deeplinkParams");
              v47 = (void *)objc_claimAutoreleasedReturnValue();

              if (v47)
              {
                -[NDOCoverageCentralViewController deeplinkParams](self, "deeplinkParams");
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v45, "setProperty:forKey:", v48, CFSTR("NDODeeplinkParams"));

              }
              objc_msgSend(v143, "addObject:", v45);

            }
            v25 = objc_msgSend(v135, "countByEnumeratingWithState:objects:count:", &v151, v167, 16);
          }
          while (v25);
        }

        v13 = v133;
        v16 = v132 + 1;
        v17 = v133;
      }
      while (v132 + 1 != v130);
      v130 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v155, v168, 16);
    }
    while (v130);
  }

  -[NDOCoverageCentralViewController addFooterLabelToSpecifier:](self, "addFooterLabelToSpecifier:", v13);
LABEL_65:

  return v143;
}

void __47__NDOCoverageCentralViewController_updateCells__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "serialNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serialNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v5, "isEqualToString:", v6);
  if ((_DWORD)v4)
  {
    objc_msgSend(*(id *)(a1 + 48), "warranty");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v7, CFSTR("NDOWarranty"));

    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), CFSTR("NDODeviceInfo"));
  }
}

- (void)addFooterLabelToSpecifier:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x24BDD1488];
  v4 = a3;
  objc_msgSend(v3, "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/NewDeviceOutreachUI.framework"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("CC_FOOTER_APPLEID"), &stru_24F3352F8, CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BE75A68]);

}

- (void)openURL:(id)a3
{
  id v3;
  NSObject *v4;

  v3 = a3;
  _NDOLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[NDOCoverageCentralViewController openURL:].cold.1();

  objc_msgSend((id)*MEMORY[0x24BEBDF78], "openURL:options:completionHandler:", v3, MEMORY[0x24BDBD1B8], 0);
}

- (void)fetchAllLocalDevices
{
  OUTLINED_FUNCTION_0(&dword_229EC7000, a1, a3, "%{public}s:", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

uint64_t __56__NDOCoverageCentralViewController_fetchAllLocalDevices__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isVisibleInCC");
}

- (void)fetchAllDeviceInfoUsingPolicy:(unint64_t)a3 sessionID:(id)a4 params:(id)a5 isSales:(BOOL)a6 withReply:(id)a7
{
  _BOOL4 v8;
  id v11;
  id v12;
  NSObject *v13;
  BOOL v14;
  NSObject *v15;
  _BOOL4 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  unint64_t v31;
  _QWORD v32[5];
  id v33;
  _QWORD v34[5];
  id v35;

  v8 = a6;
  v11 = a5;
  v12 = a7;
  _NDOLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[NDOCoverageCentralViewController fetchAllDeviceInfoUsingPolicy:sessionID:params:isSales:withReply:].cold.3(v11, v8, v13);

  -[NDOCoverageCentralViewController fetchAllLocalDevices](self, "fetchAllLocalDevices");
  v14 = -[NDOCoverageCentralViewController isSignedIn](self, "isSignedIn");
  _NDOLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);
  if (v14)
  {
    v31 = a3;
    if (v16)
      -[NDOCoverageCentralViewController fetchAllDeviceInfoUsingPolicy:sessionID:params:isSales:withReply:].cold.1(v15, v17, v18, v19, v20, v21, v22, v23);

    v34[0] = MEMORY[0x24BDAC760];
    v34[1] = 3221225472;
    v34[2] = __101__NDOCoverageCentralViewController_fetchAllDeviceInfoUsingPolicy_sessionID_params_isSales_withReply___block_invoke;
    v34[3] = &unk_24F334E30;
    v34[4] = self;
    v24 = v11;
    v35 = v24;
    v25 = (void *)MEMORY[0x22E2D8D84](v34);
    -[NDOCoverageCentralViewController ndoManager](self, "ndoManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDOCoverageCentralViewController allLocalDevices](self, "allLocalDevices");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "UUIDString");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      v30 = v25;
    else
      v30 = 0;
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __101__NDOCoverageCentralViewController_fetchAllDeviceInfoUsingPolicy_sessionID_params_isSales_withReply___block_invoke_60;
    v32[3] = &unk_24F334E80;
    v32[4] = self;
    v33 = v12;
    objc_msgSend(v26, "getDeviceListForLocalDevices:sessionID:policy:params:salesReplyOnly:salesInfoReply:deviceInfoReply:completionBlock:", v27, v29, v31, v24, 0, v30, 0, v32);

  }
  else
  {
    if (v16)
      -[NDOCoverageCentralViewController fetchAllDeviceInfoUsingPolicy:sessionID:params:isSales:withReply:].cold.2(v15, v17, v18, v19, v20, v21, v22, v23);

    if (v12)
      (*((void (**)(id, _QWORD))v12 + 2))(v12, 0);
  }

}

void __101__NDOCoverageCentralViewController_fetchAllDeviceInfoUsingPolicy_sessionID_params_isSales_withReply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;
  id v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_getParamsDictFromPath:", *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __101__NDOCoverageCentralViewController_fetchAllDeviceInfoUsingPolicy_sessionID_params_isSales_withReply___block_invoke_2;
  v11[3] = &unk_24F334E08;
  v12 = v6;
  v13 = v7;
  v14 = *(_QWORD *)(a1 + 32);
  v15 = v5;
  v8 = v5;
  v9 = v7;
  v10 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], v11);

}

void __101__NDOCoverageCentralViewController_fetchAllDeviceInfoUsingPolicy_sessionID_params_isSales_withReply___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_opt_new();
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
    objc_msgSend(v2, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), CFSTR("devices"));
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("additionalInfo"));
  _NDOLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136446466;
    v6 = "-[NDOCoverageCentralViewController fetchAllDeviceInfoUsingPolicy:sessionID:params:isSales:withReply:]_block_invoke_2";
    v7 = 2112;
    v8 = v2;
    _os_log_impl(&dword_229EC7000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s: amsui payload: %@", (uint8_t *)&v5, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 48), "openAMSUIWithURL:httpBody:", *(_QWORD *)(a1 + 56), v2);
}

void __101__NDOCoverageCentralViewController_fetchAllDeviceInfoUsingPolicy_sessionID_params_isSales_withReply___block_invoke_60(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __101__NDOCoverageCentralViewController_fetchAllDeviceInfoUsingPolicy_sessionID_params_isSales_withReply___block_invoke_2_61;
  block[3] = &unk_24F334E58;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v8 = v3;
  v9 = v4;
  v10 = v5;
  v6 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __101__NDOCoverageCentralViewController_fetchAllDeviceInfoUsingPolicy_sessionID_params_isSales_withReply___block_invoke_2_61(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t result;

  _NDOLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __101__NDOCoverageCentralViewController_fetchAllDeviceInfoUsingPolicy_sessionID_params_isSales_withReply___block_invoke_2_61_cold_1(a1, v2, v3);

  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    objc_msgSend(*(id *)(a1 + 40), "setDeviceLoadCompleted:", 1);
    objc_msgSend(*(id *)(a1 + 40), "setDeviceListAPISections:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 40), "showUI");
  }
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (void)getAllDeviceInfoUsingPolicy:(unint64_t)a3 sessionID:(id)a4 params:(id)a5 isSales:(BOOL)a6 andForcePostFollowup:(BOOL)a7 withReply:(id)a8
{
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  NSObject *group;
  NSObject *policyLookupQueue;
  id v23;
  _QWORD block[5];
  id v25;
  __int128 *v26;
  _QWORD *v27;
  _QWORD v28[5];
  id v29;
  id v30;
  _QWORD *v31;
  __int128 *p_buf;
  unint64_t v33;
  BOOL v34;
  _QWORD v35[5];
  id v36;
  __int128 buf;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v13 = a4;
  v14 = a5;
  v15 = a8;
  _NDOLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136446210;
    *(_QWORD *)((char *)&buf + 4) = "-[NDOCoverageCentralViewController getAllDeviceInfoUsingPolicy:sessionID:params:isSa"
                                    "les:andForcePostFollowup:withReply:]";
    _os_log_impl(&dword_229EC7000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s:", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__2;
  v40 = __Block_byref_object_dispose__2;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v41 = (id)objc_claimAutoreleasedReturnValue();
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = __Block_byref_object_copy__2;
  v35[4] = __Block_byref_object_dispose__2;
  v36 = 0;
  -[NDOCoverageCentralViewController allLocalDevices](self, "allLocalDevices");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x24BDAC760];
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __120__NDOCoverageCentralViewController_getAllDeviceInfoUsingPolicy_sessionID_params_isSales_andForcePostFollowup_withReply___block_invoke;
  v28[3] = &unk_24F334ED0;
  v28[4] = self;
  v33 = a3;
  v19 = v13;
  v29 = v19;
  v20 = v14;
  v34 = a7;
  v30 = v20;
  v31 = v35;
  p_buf = &buf;
  objc_msgSend(v17, "enumerateObjectsUsingBlock:", v28);
  group = self->_group;
  policyLookupQueue = self->_policyLookupQueue;
  block[0] = v18;
  block[1] = 3221225472;
  block[2] = __120__NDOCoverageCentralViewController_getAllDeviceInfoUsingPolicy_sessionID_params_isSales_andForcePostFollowup_withReply___block_invoke_66;
  block[3] = &unk_24F334F20;
  v26 = &buf;
  v27 = v35;
  block[4] = self;
  v25 = v15;
  v23 = v15;
  dispatch_group_notify(group, policyLookupQueue, block);

  _Block_object_dispose(v35, 8);
  _Block_object_dispose(&buf, 8);

}

void __120__NDOCoverageCentralViewController_getAllDeviceInfoUsingPolicy_sessionID_params_isSales_andForcePostFollowup_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  __int128 v15;

  v3 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 1384));
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "serialNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 72);
  v8 = *(_QWORD *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  v9 = *(unsigned __int8 *)(a1 + 80);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __120__NDOCoverageCentralViewController_getAllDeviceInfoUsingPolicy_sessionID_params_isSales_andForcePostFollowup_withReply___block_invoke_2;
  v12[3] = &unk_24F334EA8;
  v10 = *(_QWORD *)(a1 + 32);
  v13 = v3;
  v14 = v10;
  v15 = *(_OWORD *)(a1 + 56);
  v11 = v3;
  objc_msgSend(v4, "getDeviceInfoForSerialNumber:usingPolicy:sessionID:params:andForcePostFollowup:withReply:", v5, v6, v8, v7, v9, v12);

}

void __120__NDOCoverageCentralViewController_getAllDeviceInfoUsingPolicy_sessionID_params_isSales_andForcePostFollowup_withReply___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
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

  v3 = a2;
  _NDOLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __120__NDOCoverageCentralViewController_getAllDeviceInfoUsingPolicy_sessionID_params_isSales_andForcePostFollowup_withReply___block_invoke_2_cold_4((uint64_t)v3, a1);

  objc_msgSend(v3, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serialNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v3, "device");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = *(id *)(a1 + 32);
  }
  v8 = v7;

  if (v3)
  {
    _NDOLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __120__NDOCoverageCentralViewController_getAllDeviceInfoUsingPolicy_sessionID_params_isSales_andForcePostFollowup_withReply___block_invoke_2_cold_3(v8, v3);

    objc_msgSend(v3, "warranty");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = v10;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "deviceInfoDict");
      v11 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "serialNumber");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", v22);
      v23 = objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        v24 = (void *)v23;
        objc_msgSend(*(id *)(a1 + 40), "deviceInfoDict");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "serialNumber");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectForKeyedSubscript:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "warranty");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v28)
        {
LABEL_13:
          objc_msgSend(v3, "warranty");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "agsULURL");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);

            if (v15)
            {
LABEL_17:
              _NDOLogSystem();
              v19 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
                __120__NDOCoverageCentralViewController_getAllDeviceInfoUsingPolicy_sessionID_params_isSales_andForcePostFollowup_withReply___block_invoke_2_cold_1(v8, v3);

              objc_msgSend(*(id *)(a1 + 40), "deviceInfoDict");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "serialNumber");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "setObject:forKeyedSubscript:", v3, v21);

              objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", v3);
              goto LABEL_20;
            }
            objc_msgSend(v3, "warranty");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "agsULURL");
            v16 = objc_claimAutoreleasedReturnValue();
            v17 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
            v18 = *(void **)(v17 + 40);
            *(_QWORD *)(v17 + 40) = v16;

          }
          goto LABEL_17;
        }
        v29 = (void *)MEMORY[0x24BE6C498];
        objc_msgSend(*(id *)(a1 + 40), "deviceInfoDict");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "serialNumber");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "objectForKeyedSubscript:", v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "warranty");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "deviceInfoWithDevice:warranty:", v8, v33);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        _NDOLogSystem();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          __120__NDOCoverageCentralViewController_getAllDeviceInfoUsingPolicy_sessionID_params_isSales_andForcePostFollowup_withReply___block_invoke_2_cold_2(v12, v8, v11);
LABEL_12:

        v3 = v12;
        goto LABEL_13;
      }

    }
    v12 = v3;
    goto LABEL_12;
  }
LABEL_20:
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 40) + 1384));

}

void __120__NDOCoverageCentralViewController_getAllDeviceInfoUsingPolicy_sessionID_params_isSales_andForcePostFollowup_withReply___block_invoke_66(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  _NDOLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
    *(_DWORD *)buf = 136446466;
    v13 = "-[NDOCoverageCentralViewController getAllDeviceInfoUsingPolicy:sessionID:params:isSales:andForcePostFollowup:w"
          "ithReply:]_block_invoke";
    v14 = 2112;
    v15 = v3;
    _os_log_impl(&dword_229EC7000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s: finishing with device infos: %@", buf, 0x16u);
  }

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __120__NDOCoverageCentralViewController_getAllDeviceInfoUsingPolicy_sessionID_params_isSales_andForcePostFollowup_withReply___block_invoke_67;
  v8[3] = &unk_24F334EF8;
  v4 = a1[7];
  v5 = (void *)a1[5];
  v8[4] = a1[4];
  v10 = v4;
  v6 = v5;
  v7 = a1[6];
  v9 = v6;
  v11 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], v8);

}

uint64_t __120__NDOCoverageCentralViewController_getAllDeviceInfoUsingPolicy_sessionID_params_isSales_andForcePostFollowup_withReply___block_invoke_67(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  _NDOLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __120__NDOCoverageCentralViewController_getAllDeviceInfoUsingPolicy_sessionID_params_isSales_andForcePostFollowup_withReply___block_invoke_67_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  objc_msgSend(*(id *)(a1 + 32), "setUlSalesURL:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
    (*(void (**)(uint64_t, _QWORD))(v10 + 16))(v10, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  objc_msgSend(*(id *)(a1 + 32), "setDeviceLoadCompleted:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "showUI");
}

- (void)getDeviceInfoForSerialNumber:(id)a3 usingPolicy:(unint64_t)a4 sessionID:(id)a5 params:(id)a6 andForcePostFollowup:(BOOL)a7 withReply:(id)a8
{
  _BOOL8 v9;
  id v14;
  id v15;
  id v16;
  void (**v17)(id, _QWORD);
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v9 = a7;
  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = (void (**)(id, _QWORD))a8;
  if (-[NDOCoverageCentralViewController isSignedIn](self, "isSignedIn"))
  {
    -[NDOCoverageCentralViewController ndoManager](self, "ndoManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "getDeviceInfoForSerialNumber:usingPolicy:sessionID:params:andForcePostFollowup:withReply:", v14, a4, v15, v16, v9, v17);

  }
  else
  {
    _NDOLogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      -[NDOCoverageCentralViewController getDeviceInfoForSerialNumber:usingPolicy:sessionID:params:andForcePostFollowup:withReply:].cold.1(v19, v20, v21, v22, v23, v24, v25, v26);

    if (v17)
      v17[2](v17, 0);
  }

}

- (void)updateDefaultDeviceWithDeviceInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  if (a3)
  {
    v4 = a3;
    -[NDOCoverageCentralViewController deviceInfoDict](self, "deviceInfoDict");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[NDOCoverageCentralViewController defaultDevice](self, "defaultDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "serialNumber");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v4, v6);

  }
}

- (void)updateDeviceInfoForDevice:(id)a3 usingPolicy:(unint64_t)a4 params:(id)a5 forceUpdateFollowup:(BOOL)a6 withReply:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;

  v8 = a6;
  v12 = a3;
  v13 = a7;
  v14 = a5;
  _NDOLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[NDOCoverageCentralViewController updateDeviceInfoForDevice:usingPolicy:params:forceUpdateFollowup:withReply:].cold.1();

  v16 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __111__NDOCoverageCentralViewController_updateDeviceInfoForDevice_usingPolicy_params_forceUpdateFollowup_withReply___block_invoke;
  v25[3] = &unk_24F334F70;
  v25[4] = self;
  v26 = v12;
  v27 = v13;
  v17 = v13;
  v18 = v12;
  v19 = (void *)MEMORY[0x22E2D8D84](v25);
  objc_msgSend(v18, "serialNumber");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NDOCoverageCentralViewController sessionID](self, "sessionID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v16;
  v23[1] = 3221225472;
  v23[2] = __111__NDOCoverageCentralViewController_updateDeviceInfoForDevice_usingPolicy_params_forceUpdateFollowup_withReply___block_invoke_68;
  v23[3] = &unk_24F334BD8;
  v24 = v19;
  v22 = v19;
  -[NDOCoverageCentralViewController getDeviceInfoForSerialNumber:usingPolicy:sessionID:params:andForcePostFollowup:withReply:](self, "getDeviceInfoForSerialNumber:usingPolicy:sessionID:params:andForcePostFollowup:withReply:", v20, a4, v21, v14, v8, v23);

}

void __111__NDOCoverageCentralViewController_updateDeviceInfoForDevice_usingPolicy_params_forceUpdateFollowup_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;
  id v11;

  v3 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __111__NDOCoverageCentralViewController_updateDeviceInfoForDevice_usingPolicy_params_forceUpdateFollowup_withReply___block_invoke_2;
  v7[3] = &unk_24F334F48;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v8 = v3;
  v9 = v4;
  v10 = v5;
  v11 = *(id *)(a1 + 48);
  v6 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

uint64_t __111__NDOCoverageCentralViewController_updateDeviceInfoForDevice_usingPolicy_params_forceUpdateFollowup_withReply___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  id obj;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v1 = a1;
  v35 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "warranty");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = *(_QWORD *)(v1 + 32);
    objc_msgSend(*(id *)(v1 + 40), "deviceInfoDict");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v1 + 32), "device");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "serialNumber");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, v6);

    _NDOLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(void **)(v1 + 32);
      objc_msgSend(v8, "device");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "serialNumber");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446722;
      v30 = "-[NDOCoverageCentralViewController updateDeviceInfoForDevice:usingPolicy:params:forceUpdateFollowup:withRepl"
            "y:]_block_invoke_2";
      v31 = 2112;
      v32 = v8;
      v33 = 2112;
      v34 = v10;
      _os_log_impl(&dword_229EC7000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s: updating deviceInfo: %@ for sn: %@", buf, 0x20u);

    }
  }
  if (objc_msgSend(*(id *)(v1 + 40), "shouldShowDeviceListUI"))
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(*(id *)(v1 + 40), "specifiers");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v11)
    {
      v12 = v11;
      v23 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v25 != v23)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("NDODevice"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "serialNumber");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v1 + 32), "device");
          v17 = v1;
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "serialNumber");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v16, "isEqualToString:", v19);

          v1 = v17;
          if (v20)
          {
            objc_msgSend(v14, "setObject:forKeyedSubscript:", *(_QWORD *)(v17 + 48), CFSTR("NDODevice"));
            objc_msgSend(v14, "setObject:forKeyedSubscript:", *(_QWORD *)(v17 + 32), CFSTR("NDODeviceInfo"));
          }

        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v12);
    }

  }
  objc_msgSend(*(id *)(v1 + 40), "reloadSpecifiers");
  return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 56) + 16))();
}

void __111__NDOCoverageCentralViewController_updateDeviceInfoForDevice_usingPolicy_params_forceUpdateFollowup_withReply___block_invoke_68(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __111__NDOCoverageCentralViewController_updateDeviceInfoForDevice_usingPolicy_params_forceUpdateFollowup_withReply___block_invoke_2_69;
  v5[3] = &unk_24F334B88;
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);

}

uint64_t __111__NDOCoverageCentralViewController_updateDeviceInfoForDevice_usingPolicy_params_forceUpdateFollowup_withReply___block_invoke_2_69(uint64_t a1)
{
  NSObject *v2;

  _NDOLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __111__NDOCoverageCentralViewController_updateDeviceInfoForDevice_usingPolicy_params_forceUpdateFollowup_withReply___block_invoke_2_69_cold_1(a1);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)handleURL:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NDOWarrantyInfoController *v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[4];
  void (**v16)(_QWORD);
  id v17;
  objc_super v18;
  objc_super v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  _NDOLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v21 = "-[NDOCoverageCentralViewController handleURL:withCompletion:]";
    v22 = 2112;
    v23 = v6;
    _os_log_impl(&dword_229EC7000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s: Handle url with dict: %@", buf, 0x16u);
  }

  if (-[NDOCoverageCentralViewController isSignedIn](self, "isSignedIn"))
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("path"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(MEMORY[0x24BE6C4A8], "isNotEmptyString:", v9) & 1) != 0)
    {
      -[NDOCoverageCentralViewController setLaunchedWithUrl:](self, "setLaunchedWithUrl:", 1);
      if (objc_msgSend(v9, "hasPrefix:", CFSTR("DEFAULT_COVERAGE")))
      {
        -[NDOCoverageCentralViewController specifiers](self, "specifiers");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "specifierForID:", CFSTR("DEFAULT_COVERAGE"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = -[NDOWarrantyInfoController initWithSpecifier:]([NDOWarrantyInfoController alloc], "initWithSpecifier:", v11);
        -[NDOCoverageCentralViewController navigationController](self, "navigationController");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "pushViewController:animated:", v12, 1);

        v7[2](v7);
      }
      else
      {
        objc_initWeak((id *)buf, self);
        v15[0] = MEMORY[0x24BDAC760];
        v15[1] = 3221225472;
        v15[2] = __61__NDOCoverageCentralViewController_handleURL_withCompletion___block_invoke;
        v15[3] = &unk_24F334FC0;
        objc_copyWeak(&v17, (id *)buf);
        v16 = v7;
        -[NDOCoverageCentralViewController _getUpdatedParamsFromPath:withCompletion:](self, "_getUpdatedParamsFromPath:withCompletion:", v9, v15);

        objc_destroyWeak(&v17);
        objc_destroyWeak((id *)buf);
      }
    }
    else
    {
      v18.receiver = self;
      v18.super_class = (Class)NDOCoverageCentralViewController;
      -[NDOCoverageCentralViewController handleURL:withCompletion:](&v18, sel_handleURL_withCompletion_, v6, v7);
    }

  }
  else
  {
    _NDOLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      v21 = "-[NDOCoverageCentralViewController handleURL:withCompletion:]";
      _os_log_impl(&dword_229EC7000, v14, OS_LOG_TYPE_DEFAULT, "%{public}s: Ignoring handle as the user is not signed in to icloud.", buf, 0xCu);
    }

    v19.receiver = self;
    v19.super_class = (Class)NDOCoverageCentralViewController;
    -[NDOCoverageCentralViewController handleURL:withCompletion:](&v19, sel_handleURL_withCompletion_, v6, v7);
  }

}

void __61__NDOCoverageCentralViewController_handleURL_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setDeeplinkParams:", v3);
  objc_msgSend(WeakRetained, "_getParamsDictFromPath:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _NDOLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v15 = "-[NDOCoverageCentralViewController handleURL:withCompletion:]_block_invoke";
    v16 = 2112;
    v17 = v5;
    _os_log_impl(&dword_229EC7000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s: fetching devices with params dict: %@", buf, 0x16u);
  }

  objc_msgSend(v5, "objectForKey:", CFSTR("type"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && objc_msgSend(v7, "length"))
  {
    objc_msgSend(v8, "lowercaseString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("sales"));

  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(WeakRetained, "sessionID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __61__NDOCoverageCentralViewController_handleURL_withCompletion___block_invoke_79;
  v12[3] = &unk_24F334F98;
  v13 = *(id *)(a1 + 32);
  objc_msgSend(WeakRetained, "fetchAllDeviceInfoUsingPolicy:sessionID:params:isSales:withReply:", 2, v11, v3, v10, v12);

}

uint64_t __61__NDOCoverageCentralViewController_handleURL_withCompletion___block_invoke_79(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)shouldDeferPushForSpecifierID:(id)a3
{
  id v3;
  NSObject *v4;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  _NDOLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136446466;
    v7 = "-[NDOCoverageCentralViewController shouldDeferPushForSpecifierID:]";
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_229EC7000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s specifierId:%@", (uint8_t *)&v6, 0x16u);
  }

  return 0;
}

- (void)handlePurchaseCompleted
{
  OUTLINED_FUNCTION_0(&dword_229EC7000, a1, a3, "%{public}s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_refreshAndForcePostFollowUp:(BOOL)a3 refreshControlToStop:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id location;

  v4 = a3;
  v6 = a4;
  _NDOLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[NDOCoverageCentralViewController _refreshAndForcePostFollowUp:refreshControlToStop:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);

  -[NDOCoverageCentralViewController table](self, "table");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isHidden");

  if (v16)
    -[NDOCoverageCentralViewController _setContentUnavailableConfiguration:](self, "_setContentUnavailableConfiguration:", self->_loadingConfig);
  objc_initWeak(&location, self);
  v17 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __86__NDOCoverageCentralViewController__refreshAndForcePostFollowUp_refreshControlToStop___block_invoke;
  v24[3] = &unk_24F335010;
  objc_copyWeak(&v26, &location);
  v24[4] = self;
  v18 = v6;
  v25 = v18;
  v19 = MEMORY[0x22E2D8D84](v24);
  v20 = (void *)v19;
  if (v4)
  {
    -[NDOCoverageCentralViewController ndoManager](self, "ndoManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v17;
    v22[1] = 3221225472;
    v22[2] = __86__NDOCoverageCentralViewController__refreshAndForcePostFollowUp_refreshControlToStop___block_invoke_3;
    v22[3] = &unk_24F334C00;
    v23 = v20;
    objc_msgSend(v21, "clearAllUserInitiatedFollowUpDismissalsWithReply:", v22);

  }
  else
  {
    (*(void (**)(uint64_t))(v19 + 16))(v19);
  }

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);

}

void __86__NDOCoverageCentralViewController__refreshAndForcePostFollowUp_refreshControlToStop___block_invoke(id *a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(a1[4], "sessionID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "deeplinkParams");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __86__NDOCoverageCentralViewController__refreshAndForcePostFollowUp_refreshControlToStop___block_invoke_2;
  v5[3] = &unk_24F334FE8;
  v6 = a1[5];
  objc_msgSend(WeakRetained, "fetchAllDeviceInfoUsingPolicy:sessionID:params:isSales:withReply:", 2, v3, v4, 0, v5);

}

uint64_t __86__NDOCoverageCentralViewController__refreshAndForcePostFollowUp_refreshControlToStop___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "endRefreshing");
}

uint64_t __86__NDOCoverageCentralViewController__refreshAndForcePostFollowUp_refreshControlToStop___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_refresh:(id)a3
{
  -[NDOCoverageCentralViewController _refreshAndForcePostFollowUp:refreshControlToStop:](self, "_refreshAndForcePostFollowUp:refreshControlToStop:", a3 != 0, a3);
}

- (void)resetAll
{
  void *v2;
  id v3;

  -[NDOCoverageCentralViewController deviceInfoDict](self, "deviceInfoDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

  +[NDOImageManager sharedManager](NDOImageManager, "sharedManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resetCache");

}

- (BOOL)shouldShowDeviceListUI
{
  void *v2;
  BOOL v3;

  -[NDOCoverageCentralViewController deviceListAPISections](self, "deviceListAPISections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (void)showUI
{
  OUTLINED_FUNCTION_0_2(&dword_229EC7000, a1, a3, "%{public}s: No warranties found", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_getUpdatedParamsFromPath:(id)a3 withCompletion:(id)a4
{
  id v6;
  NDOCoverageCentralVCManager *ndoManager;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  ndoManager = self->_ndoManager;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __77__NDOCoverageCentralViewController__getUpdatedParamsFromPath_withCompletion___block_invoke;
  v9[3] = &unk_24F335038;
  v10 = v6;
  v8 = v6;
  -[NDOCoverageCentralVCManager getDecodedParamsForPath:withReply:](ndoManager, "getDecodedParamsForPath:withReply:", a3, v9);

}

void __77__NDOCoverageCentralViewController__getUpdatedParamsFromPath_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  const __CFString *v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;

  v3 = a2;
  v14 = (__CFString *)v3;
  if (v3)
    v4 = v3;
  else
    v4 = &stru_24F3352F8;
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  if (v7 == 6)
  {
    v8 = CFSTR("VisionPro");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "userInterfaceIdiom");

    v8 = CFSTR("iPhone");
    if (v10 == 1)
      v8 = CFSTR("iPad");
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("lobType=%@"), v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14 && (-[__CFString isEqualToString:](v14, "isEqualToString:", &stru_24F3352F8) & 1) == 0)
    objc_msgSend(v5, "appendString:", CFSTR("&"));
  objc_msgSend(v5, "appendString:", v11);
  v12 = *(_QWORD *)(a1 + 32);
  v13 = (void *)objc_msgSend(v5, "copy");
  (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v13);

}

- (id)_getParamsDictFromPath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v3;
  objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("&"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v9), "componentsSeparatedByString:", CFSTR("="));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "count") == 2)
        {
          objc_msgSend(v10, "firstObject");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "stringByRemovingPercentEncoding");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v10, "lastObject");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "stringByRemovingPercentEncoding");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v4, "setObject:forKey:", v14, v12);
        }

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)openAMSUIWithURL:(id)a3 httpBody:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NDOAppleCareAMSUIViewController *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NDOAppleCareAMSUIViewController *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _NDOLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    -[NDOCoverageCentralViewController deeplinkParams](self, "deeplinkParams");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446978;
    v36 = "-[NDOCoverageCentralViewController openAMSUIWithURL:httpBody:]";
    v37 = 2112;
    v38 = v6;
    v39 = 2112;
    v40 = v7;
    v41 = 2112;
    v42 = v34;
    _os_log_debug_impl(&dword_229EC7000, v8, OS_LOG_TYPE_DEBUG, "%{public}s: url: %@, httpBody: %@, deeplinkParams: %@", buf, 0x2Au);

  }
  -[NDOCoverageCentralViewController deviceInfoDict](self, "deviceInfoDict");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NDOCoverageCentralViewController defaultDevice](self, "defaultDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "serialNumber");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = [NDOAppleCareAMSUIViewController alloc];
  objc_msgSend(v12, "warranty");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NDOCoverageCentralViewController defaultDevice](self, "defaultDevice");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "serialNumber");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), CFSTR("LINK"), CFSTR("_COVERAGE_CENTRAL"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NDOCoverageCentralViewController deeplinkParams](self, "deeplinkParams");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[NDOAppleCareAMSUIViewController initWithWarranty:serialNumber:source:url:purchaseBody:deeplinkParams:](v13, "initWithWarranty:serialNumber:source:url:purchaseBody:deeplinkParams:", v14, v16, v17, v6, v7, v18);
  -[NDOCoverageCentralViewController setAmsUIVC:](self, "setAmsUIVC:", v19);

  -[NDOCoverageCentralViewController amsUIVC](self, "amsUIVC");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setPresenter:", self);

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v21, "userInterfaceIdiom") == 6)
  {

LABEL_6:
    -[NDOCoverageCentralViewController amsUIVC](self, "amsUIVC");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    v26 = 2;
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "userInterfaceIdiom");

  if (v23 == 1)
    goto LABEL_6;
  -[NDOCoverageCentralViewController amsUIVC](self, "amsUIVC");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  v26 = 0;
LABEL_8:
  objc_msgSend(v24, "setModalPresentationStyle:", v26);

  -[NDOCoverageCentralViewController amsUIVC](self, "amsUIVC");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setModalInPresentation:", 1);

  v28 = objc_alloc(MEMORY[0x24BEBD7A0]);
  -[NDOCoverageCentralViewController amsUIVC](self, "amsUIVC");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v28, "initWithRootViewController:", v29);

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v31, "userInterfaceIdiom") == 6)
  {

LABEL_11:
    objc_msgSend(v30, "setModalPresentationStyle:", 2);
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "userInterfaceIdiom");

  if (v33 == 1)
    goto LABEL_11;
LABEL_12:
  objc_msgSend(v30, "setModalInPresentation:", 1);
  -[NDOCoverageCentralViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v30, 1, 0);

}

- (id)_noAccountConfig
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BEBD4E8], "emptyProminentConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/NewDeviceOutreachUI.framework"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("CC_NO_ACCOUNT_ERROR_TITLE"), &stru_24F3352F8, CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setText:", v4);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/NewDeviceOutreachUI.framework"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("CC_NO_ACCOUNT_ERROR_SUBTITLE"), &stru_24F3352F8, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSecondaryText:", v6);

  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("person.crop.circle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setImage:", v7);

  return v2;
}

- (id)_errorStateConfig
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
  void *v15;
  void *v16;
  _QWORD v18[5];

  objc_msgSend(MEMORY[0x24BEBD4E8], "emptyProminentConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/NewDeviceOutreachUI.framework"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("CC_ISSUE_ERROR_TITLE"), &stru_24F3352F8, CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", v5);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/NewDeviceOutreachUI.framework"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("CC_ISSUE_ERROR_SUBTITLE"), &stru_24F3352F8, CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSecondaryText:", v7);

  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("exclamationmark.triangle.fill"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", v8);

  objc_msgSend(MEMORY[0x24BEBD438], "plainButtonConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "buttonProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setConfiguration:", v9);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/NewDeviceOutreachUI.framework"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("CC_RETRY"), &stru_24F3352F8, CFSTR("Localizable"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "buttonProperties");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "configuration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTitle:", v12);

  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __53__NDOCoverageCentralViewController__errorStateConfig__block_invoke;
  v18[3] = &unk_24F334D78;
  v18[4] = self;
  objc_msgSend(MEMORY[0x24BEBD388], "actionWithHandler:", v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "buttonProperties");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setPrimaryAction:", v15);

  return v3;
}

uint64_t __53__NDOCoverageCentralViewController__errorStateConfig__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_refresh:", 0);
}

- (void)completeWithStatus:(unint64_t)a3
{
  -[NDOCoverageCentralViewController completeWithStatus:params:](self, "completeWithStatus:params:", a3, 0);
}

- (void)dismissAMSUI
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __48__NDOCoverageCentralViewController_dismissAMSUI__block_invoke;
  v2[3] = &unk_24F3349C8;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x24BDAC9B8], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __48__NDOCoverageCentralViewController_dismissAMSUI__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  void *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  _NDOLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136446210;
    v5 = "-[NDOCoverageCentralViewController dismissAMSUI]_block_invoke";
    _os_log_impl(&dword_229EC7000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v4, 0xCu);
  }

  objc_msgSend(WeakRetained, "amsUIVC");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

  objc_msgSend(WeakRetained, "setAmsUIVC:", 0);
}

- (void)completeWithStatus:(unint64_t)a3 params:(id)a4
{
  id v6;
  NSObject *v7;
  char v8;
  NSObject *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  NDOCoverageCentralVCManager *ndoManager;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  unint64_t v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  _NDOLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v28 = "-[NDOCoverageCentralViewController completeWithStatus:params:]";
    v29 = 2048;
    v30 = a3;
    v31 = 2112;
    v32 = v6;
    _os_log_impl(&dword_229EC7000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s: status: %lu, params: %@", buf, 0x20u);
  }

  v8 = 0;
  if (a3 <= 5 && ((1 << a3) & 0x2C) != 0)
  {
    _NDOLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v28 = "-[NDOCoverageCentralViewController completeWithStatus:params:]";
      _os_log_impl(&dword_229EC7000, v9, OS_LOG_TYPE_DEFAULT, "%s: refreshing summary api", buf, 0xCu);
    }

    objc_msgSend(v6, "objectForKey:", CFSTR("deviceSeq"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && (v11 = objc_msgSend(v10, "intValue"), (v11 & 0x80000000) == 0)
      && (-[NDOCoverageCentralViewController allLocalDevices](self, "allLocalDevices"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v13 = objc_msgSend(v12, "count") > (unint64_t)v11,
          v12,
          v13))
    {
      -[NDOCoverageCentralViewController allLocalDevices](self, "allLocalDevices");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectAtIndexedSubscript:", v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      ndoManager = self->_ndoManager;
      objc_msgSend(v15, "serialNumber");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = MEMORY[0x24BDAC760];
      v25[0] = MEMORY[0x24BDAC760];
      v25[1] = 3221225472;
      v25[2] = __62__NDOCoverageCentralViewController_completeWithStatus_params___block_invoke;
      v25[3] = &unk_24F334910;
      v19 = v15;
      v26 = v19;
      -[NDOCoverageCentralVCManager dismissFollowUpForSerialNumber:completion:](ndoManager, "dismissFollowUpForSerialNumber:completion:", v17, v25);

      objc_initWeak((id *)buf, self);
      -[NDOCoverageCentralViewController deeplinkParams](self, "deeplinkParams");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v18;
      v23[1] = 3221225472;
      v23[2] = __62__NDOCoverageCentralViewController_completeWithStatus_params___block_invoke_130;
      v23[3] = &unk_24F335060;
      objc_copyWeak(&v24, (id *)buf);
      -[NDOCoverageCentralViewController updateDeviceInfoForDevice:usingPolicy:params:forceUpdateFollowup:withReply:](self, "updateDeviceInfoForDevice:usingPolicy:params:forceUpdateFollowup:withReply:", v19, 2, v20, 1, v23);

      objc_destroyWeak(&v24);
      objc_destroyWeak((id *)buf);

      v8 = 1;
    }
    else
    {
      v8 = 0;
    }

  }
  if (a3 != 5 || (v8 & 1) != 0)
  {
    if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 0)
    {
      -[NDOCoverageCentralViewController dismissAMSUI](self, "dismissAMSUI");
      _NDOLogSystem();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v28 = "-[NDOCoverageCentralViewController completeWithStatus:params:]";
        _os_log_impl(&dword_229EC7000, v22, OS_LOG_TYPE_DEFAULT, "%s: dismissing amsui", buf, 0xCu);
      }

    }
  }
  else
  {
    _NDOLogSystem();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v28 = "-[NDOCoverageCentralViewController completeWithStatus:params:]";
      _os_log_impl(&dword_229EC7000, v21, OS_LOG_TYPE_DEFAULT, "%s: refreshing device list", buf, 0xCu);
    }

    -[NDOCoverageCentralViewController _refreshAndForcePostFollowUp:refreshControlToStop:](self, "_refreshAndForcePostFollowUp:refreshControlToStop:", 0, 0);
  }

}

void __62__NDOCoverageCentralViewController_completeWithStatus_params___block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  const __CFString *v5;
  void *v6;
  int v7;
  const __CFString *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  _NDOLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (a2)
      v5 = CFSTR("Dismissed");
    else
      v5 = CFSTR("Failed to dismiss");
    objc_msgSend(*(id *)(a1 + 32), "serialNumber");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543618;
    v8 = v5;
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_229EC7000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ followup up for %@", (uint8_t *)&v7, 0x16u);

  }
}

void __62__NDOCoverageCentralViewController_completeWithStatus_params___block_invoke_130(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "reloadSpecifiers");

}

- (NDOACController)acController
{
  return (NDOACController *)objc_loadWeakRetained((id *)&self->_acController);
}

- (void)setAcController:(id)a3
{
  objc_storeWeak((id *)&self->_acController, a3);
}

- (BOOL)openDefaultDeviceDetails
{
  return self->_openDefaultDeviceDetails;
}

- (void)setOpenDefaultDeviceDetails:(BOOL)a3
{
  self->_openDefaultDeviceDetails = a3;
}

- (BOOL)isFromDeeplink
{
  return self->_isFromDeeplink;
}

- (void)setIsFromDeeplink:(BOOL)a3
{
  self->_isFromDeeplink = a3;
}

- (BOOL)expectingLink
{
  return self->_expectingLink;
}

- (void)setExpectingLink:(BOOL)a3
{
  self->_expectingLink = a3;
}

- (NSString)deeplinkParams
{
  return (NSString *)objc_getProperty(self, a2, 1416, 1);
}

- (void)setDeeplinkParams:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1416);
}

- (NSString)ulSalesURL
{
  return (NSString *)objc_getProperty(self, a2, 1424, 1);
}

- (void)setUlSalesURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1424);
}

- (NSString)sessionID
{
  return (NSString *)objc_getProperty(self, a2, 1432, 1);
}

- (void)setSessionID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1432);
}

- (NDOCoverageCentralVCManager)ndoManager
{
  return self->_ndoManager;
}

- (void)setNdoManager:(id)a3
{
  objc_storeStrong((id *)&self->_ndoManager, a3);
}

- (NDODevice)defaultDevice
{
  return self->_defaultDevice;
}

- (void)setDefaultDevice:(id)a3
{
  objc_storeStrong((id *)&self->_defaultDevice, a3);
}

- (NSMutableArray)pairedDevices
{
  return self->_pairedDevices;
}

- (void)setPairedDevices:(id)a3
{
  objc_storeStrong((id *)&self->_pairedDevices, a3);
}

- (NSMutableArray)allLocalDevices
{
  return self->_allLocalDevices;
}

- (void)setAllLocalDevices:(id)a3
{
  objc_storeStrong((id *)&self->_allLocalDevices, a3);
}

- (NSArray)deviceListAPISections
{
  return self->_deviceListAPISections;
}

- (void)setDeviceListAPISections:(id)a3
{
  objc_storeStrong((id *)&self->_deviceListAPISections, a3);
}

- (BOOL)deviceLoadCompleted
{
  return self->_deviceLoadCompleted;
}

- (void)setDeviceLoadCompleted:(BOOL)a3
{
  self->_deviceLoadCompleted = a3;
}

- (NSMutableDictionary)deviceInfoDict
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 1480, 1);
}

- (void)setDeviceInfoDict:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1480);
}

- (NSMutableDictionary)deviceSequenceDict
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 1488, 1);
}

- (void)setDeviceSequenceDict:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1488);
}

- (NDOAppleCareAMSUIViewController)amsUIVC
{
  return self->_amsUIVC;
}

- (void)setAmsUIVC:(id)a3
{
  objc_storeStrong((id *)&self->_amsUIVC, a3);
}

- (BOOL)isSignedIn
{
  return self->_isSignedIn;
}

- (void)setIsSignedIn:(BOOL)a3
{
  self->_isSignedIn = a3;
}

- (id)onViewIsAppearing
{
  return self->_onViewIsAppearing;
}

- (void)setOnViewIsAppearing:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1504);
}

- (BOOL)launchedWithUrl
{
  return self->_launchedWithUrl;
}

- (void)setLaunchedWithUrl:(BOOL)a3
{
  self->_launchedWithUrl = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_onViewIsAppearing, 0);
  objc_storeStrong((id *)&self->_amsUIVC, 0);
  objc_storeStrong((id *)&self->_deviceSequenceDict, 0);
  objc_storeStrong((id *)&self->_deviceInfoDict, 0);
  objc_storeStrong((id *)&self->_deviceListAPISections, 0);
  objc_storeStrong((id *)&self->_allLocalDevices, 0);
  objc_storeStrong((id *)&self->_pairedDevices, 0);
  objc_storeStrong((id *)&self->_defaultDevice, 0);
  objc_storeStrong((id *)&self->_ndoManager, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_ulSalesURL, 0);
  objc_storeStrong((id *)&self->_deeplinkParams, 0);
  objc_destroyWeak((id *)&self->_acController);
  objc_storeStrong((id *)&self->_loadingConfig, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_policyLookupQueue, 0);
}

- (void)init
{
  OUTLINED_FUNCTION_0(&dword_229EC7000, a1, a3, "%{public}s:", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithIsSignedIn:(uint64_t)a3 deviceManager:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_229EC7000, a1, a3, "%{public}s: Not signed in to icloud. Leaving...", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __44__NDOCoverageCentralViewController_loadView__block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5[6];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(a1, "launchedWithUrl"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 136446466;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_229EC7000, a2, v4, "%{public}s: On appear block. Launch url:%@ ", (uint8_t *)v5);

  OUTLINED_FUNCTION_9();
}

- (void)specifiers
{
  OUTLINED_FUNCTION_0(&dword_229EC7000, a1, a3, "%{public}s:", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)updateCells
{
  OUTLINED_FUNCTION_0(&dword_229EC7000, a1, a3, "%{public}s: generating specifiers from local cache", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)openURL:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136446466;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_229EC7000, v0, v1, "%{public}s: Opening url: %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_1();
}

- (void)fetchAllDeviceInfoUsingPolicy:(uint64_t)a3 sessionID:(uint64_t)a4 params:(uint64_t)a5 isSales:(uint64_t)a6 withReply:(uint64_t)a7 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_229EC7000, a1, a3, "%{public}s: starting fetch", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)fetchAllDeviceInfoUsingPolicy:(uint64_t)a3 sessionID:(uint64_t)a4 params:(uint64_t)a5 isSales:(uint64_t)a6 withReply:(uint64_t)a7 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_229EC7000, a1, a3, "%{public}s: skipping fetch: not logged in", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)fetchAllDeviceInfoUsingPolicy:(NSObject *)a3 sessionID:params:isSales:withReply:.cold.3(void *a1, char a2, NSObject *a3)
{
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = 136446722;
  v6 = "-[NDOCoverageCentralViewController fetchAllDeviceInfoUsingPolicy:sessionID:params:isSales:withReply:]";
  v7 = 2082;
  v8 = objc_msgSend(objc_retainAutorelease(a1), "UTF8String");
  v9 = 1026;
  v10 = a2 & 1;
  _os_log_debug_impl(&dword_229EC7000, a3, OS_LOG_TYPE_DEBUG, "%{public}s: params:%{public}s isSales:%{public}d", (uint8_t *)&v5, 0x1Cu);
}

void __101__NDOCoverageCentralViewController_fetchAllDeviceInfoUsingPolicy_sessionID_params_isSales_withReply___block_invoke_2_61_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 136446466;
  v5 = "-[NDOCoverageCentralViewController fetchAllDeviceInfoUsingPolicy:sessionID:params:isSales:withReply:]_block_invoke_2";
  v6 = 2112;
  v7 = v3;
  OUTLINED_FUNCTION_3(&dword_229EC7000, a2, a3, "%{public}s: getDeviceListForLocalDevices reply: %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

void __120__NDOCoverageCentralViewController_getAllDeviceInfoUsingPolicy_sessionID_params_isSales_andForcePostFollowup_withReply___block_invoke_2_cold_1(void *a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  objc_msgSend(a1, "serialNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "warranty");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_3(&dword_229EC7000, v5, v6, "%{public}s: updated sn: %@ with warranty: %@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_3_0();
}

void __120__NDOCoverageCentralViewController_getAllDeviceInfoUsingPolicy_sessionID_params_isSales_andForcePostFollowup_withReply___block_invoke_2_cold_2(void *a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "serialNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "warranty");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 136446978;
  v8 = "-[NDOCoverageCentralViewController getAllDeviceInfoUsingPolicy:sessionID:params:isSales:andForcePostFollowup:with"
       "Reply:]_block_invoke";
  v9 = 2112;
  v10 = a1;
  v11 = 2112;
  v12 = v5;
  v13 = 2112;
  v14 = v6;
  _os_log_debug_impl(&dword_229EC7000, a3, OS_LOG_TYPE_DEBUG, "%{public}s: updated: %@ for sn: %@ with warranty: %@", (uint8_t *)&v7, 0x2Au);

}

void __120__NDOCoverageCentralViewController_getAllDeviceInfoUsingPolicy_sessionID_params_isSales_andForcePostFollowup_withReply___block_invoke_2_cold_3(void *a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  objc_msgSend(a1, "serialNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "warranty");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_3(&dword_229EC7000, v5, v6, "%{public}s: sn: %@ with warranty: %@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_3_0();
}

void __120__NDOCoverageCentralViewController_getAllDeviceInfoUsingPolicy_sessionID_params_isSales_andForcePostFollowup_withReply___block_invoke_2_cold_4(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a2 + 32), "serialNumber");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_3(&dword_229EC7000, v3, v4, "%{public}s: updating deviceInfo: %@ for sn: %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_3_0();
}

void __120__NDOCoverageCentralViewController_getAllDeviceInfoUsingPolicy_sessionID_params_isSales_andForcePostFollowup_withReply___block_invoke_67_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_229EC7000, a1, a3, "%{public}s: refreshing", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)getDeviceInfoForSerialNumber:(uint64_t)a3 usingPolicy:(uint64_t)a4 sessionID:(uint64_t)a5 params:(uint64_t)a6 andForcePostFollowup:(uint64_t)a7 withReply:(uint64_t)a8 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_229EC7000, a1, a3, "%{public}s: skipping fetch: not logged in", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)updateDeviceInfoForDevice:usingPolicy:params:forceUpdateFollowup:withReply:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136446466;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_229EC7000, v0, v1, "%{public}s: for device: %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_1();
}

void __111__NDOCoverageCentralViewController_updateDeviceInfoForDevice_usingPolicy_params_forceUpdateFollowup_withReply___block_invoke_2_69_cold_1(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1 + 32), "device");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "serialNumber");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_3(&dword_229EC7000, v3, v4, "%{public}s: updating deviceInfo: %@ for sn: %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_3_0();
}

- (void)_refreshAndForcePostFollowUp:(uint64_t)a3 refreshControlToStop:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_229EC7000, a1, a3, "%{public}s:", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end

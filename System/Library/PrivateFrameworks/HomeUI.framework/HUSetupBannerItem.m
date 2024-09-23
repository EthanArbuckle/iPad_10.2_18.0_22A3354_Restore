@implementation HUSetupBannerItem

- (id)_determineRequiredAccessorySetupReminders:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  HUSetupBannerItem *v16;
  SEL v17;

  v5 = a3;
  if ((objc_msgSend(MEMORY[0x1E0D319D0], "supportsAccessorySetup") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSetupBannerItem _determineRequiredLockAccessorySetupReminders:](self, "_determineRequiredLockAccessorySetupReminders:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __63__HUSetupBannerItem__determineRequiredAccessorySetupReminders___block_invoke;
    v13[3] = &unk_1E6F590C8;
    v14 = v6;
    v15 = v5;
    v16 = self;
    v17 = a2;
    v8 = v6;
    objc_msgSend(v7, "flatMap:", v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = (void *)MEMORY[0x1E0D519C0];
    v11 = (void *)objc_opt_new();
    objc_msgSend(v10, "futureWithResult:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[5];
  id v20;
  SEL v21;
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D30910]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0D519C0];
    v8 = (void *)MEMORY[0x1E0D314B8];
    v9 = *MEMORY[0x1E0D30F08];
    v22[0] = *MEMORY[0x1E0D30D70];
    v22[1] = v9;
    v23[0] = MEMORY[0x1E0C9AAB0];
    v23[1] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "outcomeWithResults:", v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "futureWithResult:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = objc_alloc(MEMORY[0x1E0D31988]);
    -[HUBannerItem home](self, "home");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUBannerItem home](self, "home");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "currentUser");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v13, "initWithHome:user:nameStyle:", v14, v16, 0);

    -[HUSetupBannerItem _determineRequiredAccessorySetupReminders:](self, "_determineRequiredAccessorySetupReminders:", v17);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __49__HUSetupBannerItem__subclass_updateWithOptions___block_invoke;
    v19[3] = &unk_1E6F57AB8;
    v19[4] = self;
    v20 = v17;
    v21 = a2;
    v11 = v17;
    objc_msgSend(v10, "flatMap:", v19);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

id __49__HUSetupBannerItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  _QWORD *v34;
  _QWORD *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  _QWORD *v43;
  _QWORD *v44;
  void *v45;
  int v46;
  int v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  _QWORD *v63;
  unint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  int v69;
  void *v70;
  void *v71;
  void *v72;
  int v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
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
  void *v92;
  void *v93;
  void *v95;
  int v96;
  void *v97;
  __CFString *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  int v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  id v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  void *v121;
  void *v122;
  int v123;
  void *v124;
  __CFString *v125;
  void *v126;
  int v127;
  void *v128;
  void *v129;
  int v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  int v135;
  void *v136;
  void *v137;
  void *v138;
  id v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  int v144;
  void *v145;
  void *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  void *v154;
  __CFString *v155;
  void *v156;
  void *v157;
  void *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  void *v165;
  void *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  void *v173;
  void *v174;
  id v175;
  uint64_t v176;
  uint64_t v177;
  void *v178;
  void *v179;
  void *v180;
  _QWORD v181[4];
  id v182;
  _QWORD v183[2];
  _QWORD v184[2];
  _QWORD v185[2];
  _QWORD v186[2];
  _QWORD v187[2];
  _QWORD v188[2];
  _QWORD v189[2];
  _QWORD v190[2];
  _QWORD v191[2];
  _QWORD v192[2];
  _QWORD v193[2];
  _QWORD v194[2];
  _QWORD v195[2];
  uint8_t buf[4];
  uint64_t v197;
  __int16 v198;
  void *v199;
  __int16 v200;
  uint64_t v201;
  __int16 v202;
  id v203;
  _QWORD v204[5];

  v204[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_opt_new();
  if (objc_msgSend(*(id *)(a1 + 32), "forceShowBanner")
    && !objc_msgSend(*(id *)(a1 + 40), "count")
    && !objc_msgSend(v3, "count"))
  {
    v5 = *MEMORY[0x1E0D306A8];
    v204[0] = *MEMORY[0x1E0D30688];
    v204[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v204, 2);
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v6;
  }
  v180 = v3;
  if (!objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    if (!objc_msgSend(v3, "count"))
    {
      v55 = 0;
      v47 = 0;
      v56 = 1;
      goto LABEL_41;
    }
    HFLogForCategory();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = *(_QWORD *)(a1 + 32);
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v197 = v25;
      v198 = 2112;
      v199 = v26;
      v200 = 2048;
      v201 = objc_msgSend(v3, "count");
      v202 = 2112;
      v203 = v3;
      _os_log_impl(&dword_1B8E1E000, v24, OS_LOG_TYPE_DEFAULT, "%@:%@ Showing reminder banner for %lu onboarding features (%@)", buf, 0x2Au);

    }
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E70413B0, CFSTR("HFResultSetupBannerType"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, CFSTR("HFResultKeyPathsForUnfinishedOnboardingFlows"));
    if (objc_msgSend(v3, "count") == 1)
    {
      objc_msgSend(v3, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0D30688]))
      {
        _HULocalizedStringWithDefaultValue(CFSTR("HUSetupCellFinishVoiceProfileSetup_Title"), CFSTR("HUSetupCellFinishVoiceProfileSetup_Title"), 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v27, *MEMORY[0x1E0D30D18]);

        objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("Home.Banners.SetUp.FinishVoiceProfile"), *MEMORY[0x1E0D30BA0]);
        objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("HUSetupCellFinishVoiceProfileSetup_Title"), *MEMORY[0x1E0D30D20]);
        _HULocalizedStringWithDefaultValue(CFSTR("HUSetupCellFinishVoiceProfileSetup_Details"), CFSTR("HUSetupCellFinishVoiceProfileSetup_Details"), 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v28, *MEMORY[0x1E0D30BF8]);

        _HULocalizedStringWithDefaultValue(CFSTR("HUSetupCellContinue"), CFSTR("HUSetupCellContinue"), 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v29, *MEMORY[0x1E0D30BC0]);

        v30 = objc_alloc(MEMORY[0x1E0D31558]);
        v31 = *MEMORY[0x1E0D30850];
        v190[0] = *MEMORY[0x1E0D30858];
        v190[1] = v31;
        v32 = *MEMORY[0x1E0D30840];
        v191[0] = *MEMORY[0x1E0D30848];
        v191[1] = v32;
        v33 = (void *)MEMORY[0x1E0C99D80];
        v34 = v191;
        v35 = v190;
      }
      else
      {
        if (!objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0D306A8]))
        {
          if (!objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0D306B8]))
          {
            if (!objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0D306A0]))
              goto LABEL_39;
            _HULocalizedStringWithDefaultValue(CFSTR("HUSetupCellFinishNaturalLightingSetup_Title"), CFSTR("HUSetupCellFinishNaturalLightingSetup_Title"), 1);
            v107 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v107, *MEMORY[0x1E0D30D18]);

            objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("Home.Banners.SetUp.FinishNaturalLighting"), *MEMORY[0x1E0D30BA0]);
            objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("HUSetupCellFinishNaturalLightingSetup_Title"), *MEMORY[0x1E0D30D20]);
            _HULocalizedStringWithDefaultValue(CFSTR("HUSetupCellFinishNaturalLightingSetup_Details"), CFSTR("HUSetupCellFinishNaturalLightingSetup_Details"), 1);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 32), "_namesOfAccessoriesNeedingNaturalLightingOnboarding");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v19, "count") == 1)
            {
              objc_msgSend(v19, "firstObject");
              v108 = (void *)objc_claimAutoreleasedReturnValue();
              HULocalizedStringWithFormat(CFSTR("HUSetupCellFinishNaturalLightingSetup_Details_SingleAccessory"), CFSTR("%@"), v109, v110, v111, v112, v113, v114, (uint64_t)v108);
              v115 = objc_claimAutoreleasedReturnValue();

              v18 = (void *)v115;
            }
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, *MEMORY[0x1E0D30BF8]);
            _HULocalizedStringWithDefaultValue(CFSTR("HUSetupCellFinishNaturalLightingSetup_Continue"), CFSTR("HUSetupCellFinishNaturalLightingSetup_Continue"), 1);
            v116 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v116, *MEMORY[0x1E0D30BC0]);

            v117 = objc_alloc(MEMORY[0x1E0D31558]);
            v118 = *MEMORY[0x1E0D30850];
            v186[0] = *MEMORY[0x1E0D30858];
            v186[1] = v118;
            v119 = *MEMORY[0x1E0D307C8];
            v187[0] = *MEMORY[0x1E0D307D0];
            v187[1] = v119;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v187, v186, 2);
            v120 = (void *)objc_claimAutoreleasedReturnValue();
            v121 = (void *)objc_msgSend(v117, "initWithImageIdentifiersKeyedBySize:", v120);
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v121, *MEMORY[0x1E0D30C60]);

            goto LABEL_37;
          }
          _HULocalizedStringWithDefaultValue(CFSTR("HUEnergySettingsConnectUtilityTitle"), CFSTR("HUEnergySettingsConnectUtilityTitle"), 1);
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v99, *MEMORY[0x1E0D30D18]);

          objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("Home.Banners.SetUp.FinishUtility"), *MEMORY[0x1E0D30BA0]);
          objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("HUEnergySettingsConnectUtilityTitle"), *MEMORY[0x1E0D30D20]);
          _HULocalizedStringWithDefaultValue(CFSTR("HUEnergySettingsConnectUtilityDetail"), CFSTR("HUEnergySettingsConnectUtilityDetail"), 1);
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v100, *MEMORY[0x1E0D30BF8]);

          _HULocalizedStringWithDefaultValue(CFSTR("HUEnergySettingsConnectUtility"), CFSTR("HUEnergySettingsConnectUtility"), 1);
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v101, *MEMORY[0x1E0D30BC0]);

          HUImageNamed(CFSTR("Onboarding-HomeUtilityLogo"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = (_QWORD *)MEMORY[0x1E0D30C70];
LABEL_28:
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, *v63);
LABEL_38:

          goto LABEL_39;
        }
        _HULocalizedStringWithDefaultValue(CFSTR("HUSetupCellFinishTVViewingProfileSetup_Title"), CFSTR("HUSetupCellFinishTVViewingProfileSetup_Title"), 1);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v74, *MEMORY[0x1E0D30D18]);

        objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("Home.Banners.SetUp.FinishTVViewingProfile"), *MEMORY[0x1E0D30BA0]);
        objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("HUSetupCellFinishTVViewingProfileSetup_Title"), *MEMORY[0x1E0D30D20]);
        _HULocalizedStringWithDefaultValue(CFSTR("HUSetupCellFinishTVViewingProfileSetup_Details"), CFSTR("HUSetupCellFinishTVViewingProfileSetup_Details"), 1);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v75, *MEMORY[0x1E0D30BF8]);

        _HULocalizedStringWithDefaultValue(CFSTR("HUSetupCellContinue"), CFSTR("HUSetupCellContinue"), 1);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v76, *MEMORY[0x1E0D30BC0]);

        v30 = objc_alloc(MEMORY[0x1E0D31558]);
        v77 = *MEMORY[0x1E0D30850];
        v188[0] = *MEMORY[0x1E0D30858];
        v188[1] = v77;
        v78 = *MEMORY[0x1E0D307A0];
        v189[0] = *MEMORY[0x1E0D307A8];
        v189[1] = v78;
        v33 = (void *)MEMORY[0x1E0C99D80];
        v34 = v189;
        v35 = v188;
      }
      objc_msgSend(v33, "dictionaryWithObjects:forKeys:count:", v34, v35, 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v30, "initWithImageIdentifiersKeyedBySize:", v18);
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, *MEMORY[0x1E0D30C60]);
      goto LABEL_37;
    }
    _HULocalizedStringWithDefaultValue(CFSTR("HUSetupCellFinishHomeSetup_Title"), CFSTR("HUSetupCellFinishHomeSetup_Title"), 1);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v57, *MEMORY[0x1E0D30D18]);

    objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("Home.Banners.SetUp.FinishSettingUpHome"), *MEMORY[0x1E0D30BA0]);
    objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("HUSetupCellFinishHomeSetup_Title"), *MEMORY[0x1E0D30D20]);
    _HULocalizedStringWithDefaultValue(CFSTR("HUSetupCellFinishHomeSetup_Details"), CFSTR("HUSetupCellFinishHomeSetup_Details"), 1);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v58, *MEMORY[0x1E0D30BF8]);

    _HULocalizedStringWithDefaultValue(CFSTR("HUSetupCellContinue"), CFSTR("HUSetupCellContinue"), 1);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v59, *MEMORY[0x1E0D30BC0]);

    v39 = objc_alloc(MEMORY[0x1E0D31558]);
    v60 = *MEMORY[0x1E0D30850];
    v184[0] = *MEMORY[0x1E0D30858];
    v184[1] = v60;
    v61 = *MEMORY[0x1E0D307B8];
    v185[0] = *MEMORY[0x1E0D307C0];
    v185[1] = v61;
    v42 = (void *)MEMORY[0x1E0C99D80];
    v43 = v185;
    v44 = v184;
    goto LABEL_26;
  }
  HFLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(*(id *)(a1 + 40), "count");
    v11 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138413058;
    v197 = v8;
    v198 = 2112;
    v199 = v9;
    v200 = 2048;
    v201 = v10;
    v202 = 2112;
    v203 = v11;
    _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@ Showing reminder banner for %lu accessory setup features (%@)", buf, 0x2Au);

  }
  objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E7041398, CFSTR("HFResultSetupBannerType"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), CFSTR("HFResultSetupBannerAccessorySetupFlowsKey"));
  if (objc_msgSend(*(id *)(a1 + 40), "count") != 1)
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUSetupCellFinishHomeSetup_Title"), CFSTR("HUSetupCellFinishHomeSetup_Title"), 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v36, *MEMORY[0x1E0D30D18]);

    objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("Home.Banners.SetUp.FinishSettingUpHome"), *MEMORY[0x1E0D30BA0]);
    objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("HUSetupCellFinishHomeSetup_Title"), *MEMORY[0x1E0D30D20]);
    _HULocalizedStringWithDefaultValue(CFSTR("HUSetupCellFinishHomeSetup_Details"), CFSTR("HUSetupCellFinishHomeSetup_Details"), 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v37, *MEMORY[0x1E0D30BF8]);

    _HULocalizedStringWithDefaultValue(CFSTR("HUSetupCellContinue"), CFSTR("HUSetupCellContinue"), 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v38, *MEMORY[0x1E0D30BC0]);

    v39 = objc_alloc(MEMORY[0x1E0D31558]);
    v40 = *MEMORY[0x1E0D30850];
    v192[0] = *MEMORY[0x1E0D30858];
    v192[1] = v40;
    v41 = *MEMORY[0x1E0D307B8];
    v193[0] = *MEMORY[0x1E0D307C0];
    v193[1] = v41;
    v42 = (void *)MEMORY[0x1E0C99D80];
    v43 = v193;
    v44 = v192;
LABEL_26:
    objc_msgSend(v42, "dictionaryWithObjects:forKeys:count:", v43, v44, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v39, "initWithImageIdentifiersKeyedBySize:", v12);
LABEL_27:
    v18 = (void *)v62;
    v63 = (_QWORD *)MEMORY[0x1E0D30C60];
    goto LABEL_28;
  }
  objc_msgSend(*(id *)(a1 + 40), "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "type");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", HFAccessorySetupFlowTypeResume);

  if (v14)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E7041398, CFSTR("HFResultSetupBannerType"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, CFSTR("HFResultKeyPathsForUnfinishedOnboardingFlows"));
    objc_opt_class();
    objc_msgSend(v12, "homeKitObjects");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;
    v17 = v16;

    if (objc_msgSend(v17, "count") == 1)
    {
      objc_msgSend(v17, "firstObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "hf_categoryOrPrimaryServiceType");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      HFLocalizedCategoryOrPrimaryServiceTypeString();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0D30D18]);

      objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("Home.Banners.SetUp.ResumeAccessoryConfiguration"), *MEMORY[0x1E0D30BA0]);
      objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("HUSetupBannerResumeAccessoryConfigurationTitle"), *MEMORY[0x1E0D30D20]);
      _HULocalizedStringWithDefaultValue(CFSTR("HUSetupBannerResumeAccessoryConfigurationSubtitle"), CFSTR("HUSetupBannerResumeAccessoryConfigurationSubtitle"), 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0D30BF8]);

      HFLocalizedCategoryOrPrimaryServiceTypeString();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v22, *MEMORY[0x1E0D30BC0]);

      objc_msgSend(MEMORY[0x1E0D317C8], "iconDescriptorForAccessory:", v18);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v23, *MEMORY[0x1E0D30C60]);

LABEL_37:
      goto LABEL_38;
    }
    v64 = objc_msgSend(v17, "count");

    if (v64 < 2)
    {
LABEL_39:
      v55 = 0;
      v47 = 0;
      goto LABEL_40;
    }
    _HULocalizedStringWithDefaultValue(CFSTR("HUSetupBannerResumeMultipleAccessoriesConfigurationTitle"), CFSTR("HUSetupBannerResumeMultipleAccessoriesConfigurationTitle"), 1);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v65, *MEMORY[0x1E0D30D18]);

    objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("Home.Banners.SetUp.ResumeMultipleAccessoryConfiguration"), *MEMORY[0x1E0D30BA0]);
    objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("HUSetupBannerResumeMultipleAccessoriesConfigurationTitle"), *MEMORY[0x1E0D30D20]);
    _HULocalizedStringWithDefaultValue(CFSTR("HUSetupBannerResumeMultipleAccessoriesConfigurationSubtitle"), CFSTR("HUSetupBannerResumeMultipleAccessoriesConfigurationSubtitle"), 1);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v66, *MEMORY[0x1E0D30BF8]);

    _HULocalizedStringWithDefaultValue(CFSTR("HUSetupBannerResumeMultipleAccessoriesConfigurationButton"), CFSTR("HUSetupBannerResumeMultipleAccessoriesConfigurationButton"), 1);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v67, *MEMORY[0x1E0D30BC0]);

    v62 = objc_msgSend(objc_alloc(MEMORY[0x1E0D31460]), "initWithSystemImageNamed:", CFSTR("house.circle.fill"));
    goto LABEL_27;
  }
  objc_msgSend(v12, "type");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v45, "isEqualToString:", HFAccessorySetupFlowTypeLockAccessFirmwareUpdateAll);

  if (!v46)
  {
    objc_msgSend(v12, "type");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = objc_msgSend(v68, "isEqualToString:", HFAccessorySetupFlowTypeLockAccessAll);

    if (v69)
    {
      v47 = 1;
      _HULocalizedStringWithDefaultValue(CFSTR("HUSetupBannerLocksUserOnboarding_Title_WalletKeyExpressMode"), CFSTR("HUSetupBannerLocksUserOnboarding_Title_WalletKeyExpressMode"), 1);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v70, *MEMORY[0x1E0D30D18]);

      objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("Home.Banners.SetUp.Lock.HomeKeyAndExpressMode"), *MEMORY[0x1E0D30BA0]);
      objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("HUSetupBannerLocksUserOnboarding_Title_WalletKeyExpressMode"), *MEMORY[0x1E0D30D20]);
      _HULocalizedStringWithDefaultValue(CFSTR("HUSetupBannerLocksUserOnboarding_Details_All"), CFSTR("HUSetupBannerLocksUserOnboarding_Details_All"), 1);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v71, *MEMORY[0x1E0D30BF8]);

      _HULocalizedStringWithDefaultValue(CFSTR("HUSetupCellSetUp"), CFSTR("HUSetupCellSetUp"), 1);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v72, *MEMORY[0x1E0D30BC0]);

      objc_msgSend(*(id *)(a1 + 48), "home");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "hf_walletKeyAccessories");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = v52;
      v54 = &__block_literal_global_48_0;
      goto LABEL_33;
    }
    objc_msgSend(v12, "type");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = objc_msgSend(v95, "isEqualToString:", HFAccessorySetupFlowTypeLockAccessFirmwareUpdatePinCode);

    if (v96)
    {
      v47 = 1;
      _HULocalizedStringWithDefaultValue(CFSTR("HUSetupCellLockFeatures_Title"), CFSTR("HUSetupCellLockFeatures_Title"), 1);
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v97, *MEMORY[0x1E0D30D18]);

      objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("Home.Banners.SetUp.Lock.FirmwareUpdatePinCode"), *MEMORY[0x1E0D30BA0]);
      objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("HUSetupCellLockFeatures_Title"), *MEMORY[0x1E0D30D20]);
      v98 = CFSTR("HUSetupCellLockFeatures_Details_AccessCode");
LABEL_51:
      _HULocalizedStringWithDefaultValue(v98, v98, 1);
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v105, *MEMORY[0x1E0D30BF8]);

      _HULocalizedStringWithDefaultValue(CFSTR("HUSetupCellSetUp"), CFSTR("HUSetupCellSetUp"), 1);
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v106, *MEMORY[0x1E0D30BC0]);

      v55 = 0;
      goto LABEL_40;
    }
    objc_msgSend(v12, "type");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    v103 = objc_msgSend(v102, "isEqualToString:", HFAccessorySetupFlowTypeLockAccessPinCode);

    if (v103)
    {
      v47 = 1;
      _HULocalizedStringWithDefaultValue(CFSTR("HUSetupBannerLocksUserOnboarding_Title_AccessCode"), CFSTR("HUSetupBannerLocksUserOnboarding_Title_AccessCode"), 1);
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v104, *MEMORY[0x1E0D30D18]);

      objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("Home.Banners.SetUp.Lock.PersonalAccessCodeAvailable"), *MEMORY[0x1E0D30BA0]);
      objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("HUSetupBannerLocksUserOnboarding_Title_AccessCode"), *MEMORY[0x1E0D30D20]);
      v98 = CFSTR("HUSetupBannerLocksUserOnboarding_Details_AccessCode");
      goto LABEL_51;
    }
    objc_msgSend(v12, "type");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    v123 = objc_msgSend(v122, "isEqualToString:", HFAccessorySetupFlowTypeLockAccessFirmwareUpdateWalletKey);

    if (v123)
    {
      v55 = 1;
      _HULocalizedStringWithDefaultValue(CFSTR("HUSetupCellLockFeatures_Title"), CFSTR("HUSetupCellLockFeatures_Title"), 1);
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v124, *MEMORY[0x1E0D30D18]);

      objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("Home.Banners.SetUp.Lock.Features"), *MEMORY[0x1E0D30BA0]);
      objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("HUSetupCellLockFeatures_Title"), *MEMORY[0x1E0D30D20]);
      v125 = CFSTR("HUSetupCellLockFeatures_Details_WalletKey");
LABEL_64:
      _HULocalizedStringWithDefaultValue(v125, v125, 1);
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v132, *MEMORY[0x1E0D30BF8]);

      _HULocalizedStringWithDefaultValue(CFSTR("HUSetupCellSetUp"), CFSTR("HUSetupCellSetUp"), 1);
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v133, *MEMORY[0x1E0D30BC0]);

      v47 = 1;
      goto LABEL_40;
    }
    objc_msgSend(v12, "type");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v126, "isEqualToString:", HFAccessorySetupFlowTypeLockAccessWalletKeyUWB))
    {
      v127 = _os_feature_enabled_impl();

      if (v127)
      {
        v55 = 1;
        _HULocalizedStringWithDefaultValue(CFSTR("HUSetupCellLocksUserOnboarding_Title_WalletKeyUWB"), CFSTR("HUSetupCellLocksUserOnboarding_Title_WalletKeyUWB"), 1);
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v128, *MEMORY[0x1E0D30D18]);

        objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("HUSetupCellLocksUserOnboarding_Title_WalletKeyUWB"), *MEMORY[0x1E0D30D20]);
        v125 = CFSTR("HUSetupCellLocksUserOnboarding_Details_WalletKeyUWB");
        goto LABEL_64;
      }
    }
    else
    {

    }
    objc_msgSend(v12, "type");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    v130 = objc_msgSend(v129, "isEqualToString:", HFAccessorySetupFlowTypeLockAccessWalletKey);

    if (v130)
    {
      v55 = 1;
      _HULocalizedStringWithDefaultValue(CFSTR("HUSetupBannerLocksUserOnboarding_Title_WalletKeyExpressMode"), CFSTR("HUSetupBannerLocksUserOnboarding_Title_WalletKeyExpressMode"), 1);
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v131, *MEMORY[0x1E0D30D18]);

      objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("Home.Banners.SetUp.Lock.WalletKeyAndExpressMode"), *MEMORY[0x1E0D30BA0]);
      objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("HUSetupBannerLocksUserOnboarding_Title_WalletKeyExpressMode"), *MEMORY[0x1E0D30D20]);
      v125 = CFSTR("HUSetupBannerLocksUserOnboarding_Details_WalletKey");
      goto LABEL_64;
    }
    objc_msgSend(v12, "type");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    v135 = objc_msgSend(v134, "isEqualToString:", HFAccessorySetupFlowTypeSafetyAndSecurity);

    if (v135)
    {
      _HULocalizedStringWithDefaultValue(CFSTR("HUSafetyAndSecurityBanner_Title"), CFSTR("HUSafetyAndSecurityBanner_Title"), 1);
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v136, *MEMORY[0x1E0D30D18]);

      objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("HUSafetyAndSecurityBanner_Title"), *MEMORY[0x1E0D30D20]);
      _HULocalizedStringWithDefaultValue(CFSTR("HUSafetyAndSecurityBanner_Description"), CFSTR("HUSafetyAndSecurityBanner_Description"), 1);
      v137 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v137, *MEMORY[0x1E0D30BF8]);

      _HULocalizedStringWithDefaultValue(CFSTR("HUContinueTitle"), CFSTR("HUContinueTitle"), 1);
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v138, *MEMORY[0x1E0D30BC0]);

      v139 = objc_alloc(MEMORY[0x1E0D31460]);
      objc_msgSend(MEMORY[0x1E0CEA638], "hf_safetyAndSecurityImage");
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v140, "configuration");
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      v142 = (void *)objc_msgSend(v139, "initWithSystemImageNamed:configuration:", CFSTR("house.badge.shield.half.filled.fill"), v141);
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v142, *MEMORY[0x1E0D30C60]);

      goto LABEL_39;
    }
    objc_msgSend(v12, "type");
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    v144 = objc_msgSend(v143, "isEqualToString:", HFAccessorySetupFlowTypeSiriEndpoint);

    if (!v144)
      goto LABEL_39;
    objc_msgSend(*(id *)(a1 + 32), "home");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v145, "hf_siriEndpointCapableAccessoriesToOnboard");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)objc_msgSend(v18, "count") < 2)
    {
      if (objc_msgSend(v18, "count") != 1)
      {
LABEL_73:
        v175 = objc_alloc(MEMORY[0x1E0D31558]);
        v176 = *MEMORY[0x1E0D30850];
        v194[0] = *MEMORY[0x1E0D30858];
        v194[1] = v176;
        v177 = *MEMORY[0x1E0D30840];
        v195[0] = *MEMORY[0x1E0D30848];
        v195[1] = v177;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v195, v194, 2);
        v178 = (void *)objc_claimAutoreleasedReturnValue();
        v179 = (void *)objc_msgSend(v175, "initWithImageIdentifiersKeyedBySize:", v178);
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v179, *MEMORY[0x1E0D30C60]);

        goto LABEL_38;
      }
      objc_msgSend(v18, "firstObject");
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v156, "hf_serviceNameComponents");
      v157 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v157, "serviceName");
      v158 = (void *)objc_claimAutoreleasedReturnValue();
      HULocalizedStringWithFormat(CFSTR("HUSetupCellSiriEndpointSetup_Title_Single"), CFSTR("%@"), v159, v160, v161, v162, v163, v164, (uint64_t)v158);
      v165 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v165, *MEMORY[0x1E0D30D18]);

      objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("Home.Banners.SetUp.Endpoint.SiriIsNowAvailable"), *MEMORY[0x1E0D30BA0]);
      objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("HUSetupCellSiriEndpointSetup_Title_Single"), *MEMORY[0x1E0D30D20]);
      objc_msgSend(v18, "firstObject");
      v154 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v154, "hf_userFriendlyLocalizedLowercaseDescription");
      v166 = (void *)objc_claimAutoreleasedReturnValue();
      HULocalizedStringWithFormat(CFSTR("HUSetupCellSiriEndpointSetup_Details_Single"), CFSTR("%@"), v167, v168, v169, v170, v171, v172, (uint64_t)v166);
      v173 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v173, *MEMORY[0x1E0D30BF8]);

      v155 = CFSTR("HUSetupCellSiriEndpointSetup_ActionButtonTitle_Single");
    }
    else
    {
      _HULocalizedStringWithDefaultValue(CFSTR("HUSetupCellSiriEndpointSetup_Title_Multiple"), CFSTR("HUSetupCellSiriEndpointSetup_Title_Multiple"), 1);
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v146, *MEMORY[0x1E0D30D18]);

      objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("Home.Banners.SetUp.Endpoint.AddSiriToAccesories"), *MEMORY[0x1E0D30BA0]);
      objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("HUSetupCellSiriEndpointSetup_Title_Multiple"), *MEMORY[0x1E0D30D20]);
      v147 = objc_msgSend(v18, "count");
      HULocalizedStringWithFormat(CFSTR("HUSetupCellSiriEndpointSetup_Details_Multiple"), CFSTR("%lu"), v148, v149, v150, v151, v152, v153, v147);
      v154 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v154, *MEMORY[0x1E0D30BF8]);
      v155 = CFSTR("HUSetupCellSiriEndpointSetup_ActionButtonTitle_Multiple");
    }

    _HULocalizedStringWithDefaultValue(v155, v155, 1);
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v174, *MEMORY[0x1E0D30BC0]);

    goto LABEL_73;
  }
  v47 = 1;
  _HULocalizedStringWithDefaultValue(CFSTR("HUSetupCellLockFeatures_Title"), CFSTR("HUSetupCellLockFeatures_Title"), 1);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v48, *MEMORY[0x1E0D30D18]);

  objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("Home.Banners.SetUp.Lock.NewFeatures"), *MEMORY[0x1E0D30BA0]);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("HUSetupCellLockFeatures_Title"), *MEMORY[0x1E0D30D20]);
  _HULocalizedStringWithDefaultValue(CFSTR("HUSetupCellLockFeatures_Details_All"), CFSTR("HUSetupCellLockFeatures_Details_All"), 1);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v49, *MEMORY[0x1E0D30BF8]);

  _HULocalizedStringWithDefaultValue(CFSTR("HUSetupCellSetUp"), CFSTR("HUSetupCellSetUp"), 1);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v50, *MEMORY[0x1E0D30BC0]);

  objc_msgSend(*(id *)(a1 + 48), "home");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "hf_walletKeyAccessories");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v52;
  v54 = &__block_literal_global_175;
LABEL_33:
  v73 = objc_msgSend(v52, "na_any:", v54);

  v55 = v73 ^ 1u;
LABEL_40:

  v56 = 0;
LABEL_41:
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "home");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "hf_homePods");
  v82 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v79, "addObjectsFromArray:", v82);
  objc_msgSend(*(id *)(a1 + 32), "home");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "addObject:", v83);

  objc_msgSend(*(id *)(a1 + 32), "home");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "currentUser");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "addObject:", v85);

  v183[0] = objc_opt_class();
  v183[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v183, 2);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "addObjectsFromArray:", v86);

  objc_msgSend(v80, "addObject:", objc_opt_class());
  objc_msgSend(v80, "addObject:", objc_opt_class());
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v79, *MEMORY[0x1E0D30B80]);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v80, *MEMORY[0x1E0D30B78]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v56);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v87, *MEMORY[0x1E0D30D70]);

  objc_msgSend(*(id *)(a1 + 32), "_possibleDependentKeyPaths");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v88, *MEMORY[0x1E0D30E50]);

  objc_msgSend(*(id *)(a1 + 48), "homekitObjectIdentifiers");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v89, *MEMORY[0x1E0D30E58]);

  objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E70413C8, CFSTR("bannerItemCategory"));
  if (v47)
  {
    v90 = (void *)MEMORY[0x1E0D319E8];
    objc_msgSend(*(id *)(a1 + 48), "home");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "walletKeyIconDescriptorForHome:shouldUseKeyholeAsset:foriPhoneDevice:", v91, v55, 1);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v181[0] = MEMORY[0x1E0C809B0];
    v181[1] = 3221225472;
    v181[2] = __49__HUSetupBannerItem__subclass_updateWithOptions___block_invoke_152;
    v181[3] = &unk_1E6F590A0;
    v182 = v4;
    objc_msgSend(v92, "flatMap:", v181);
    v93 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v4);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v93;
}

- (id)_possibleDependentKeyPaths
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0D30668], *MEMORY[0x1E0D30670], *MEMORY[0x1E0D30688], *MEMORY[0x1E0D30690], *MEMORY[0x1E0D306A0], *MEMORY[0x1E0D306A8], *MEMORY[0x1E0D306B0], *MEMORY[0x1E0D306B8], 0);
}

- (id)_determineRequiredLockAccessorySetupReminders:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  char v28;
  uint8_t buf[4];
  HUSetupBannerItem *v30;
  __int16 v31;
  const char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D31160], "sharedHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isAccessorySetupActive");

  if (v6)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", MEMORY[0x1E0C9AA60]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  if (objc_msgSend(MEMORY[0x1E0D319D0], "isAVisionPro"))
  {
    HFLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v30 = self;
      v31 = 2080;
      v32 = "-[HUSetupBannerItem _determineRequiredLockAccessorySetupReminders:]";
      _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "(%@:%s) Not showing any lock related banners because the device is vision.", buf, 0x16u);
    }

    goto LABEL_6;
  }
  objc_msgSend(v4, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(MEMORY[0x1E0D319D0], "isAnIPhone");
  objc_msgSend(v9, "hf_fetchWalletKeyDeviceStateForCurrentDeviceIfNecessary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hf_walletKeyAccessories");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13 && v10 && (objc_msgSend(v11, "isFinished") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", MEMORY[0x1E0C9AA60]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = (void *)objc_opt_new();
    objc_msgSend(v4, "hasDismissedWalletKeyExpressModeOnboardingOnThisDevice");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "na_safeAddObject:", v15);
    objc_msgSend(v14, "na_safeAddObject:", v11);
    v16 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "combineAllFutures:ignoringErrors:scheduler:", v14, 1, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __67__HUSetupBannerItem__determineRequiredLockAccessorySetupReminders___block_invoke;
    v22[3] = &unk_1E6F591B0;
    v23 = v9;
    v24 = v14;
    v25 = v15;
    v26 = v11;
    v27 = v4;
    v28 = v10;
    v19 = v15;
    v20 = v14;
    objc_msgSend(v18, "flatMap:", v22);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_13:

  return v8;
}

id __67__HUSetupBannerItem__determineRequiredLockAccessorySetupReminders___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  const __CFString *v16;
  NSObject *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  uint64_t v31;
  int v32;
  NSObject *v33;
  _BOOL4 v34;
  void *v35;
  char v36;
  int v37;
  char v38;
  int v39;
  uint64_t v40;
  void *v41;
  void *v42;
  _BOOL4 v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  char v56;
  char v57;
  char v58;
  char v59;
  void *v60;
  void *v61;
  int v62;
  _BOOL4 v63;
  _QWORD v64[4];
  id v65;
  _QWORD aBlock[4];
  id v67;
  id v68;
  char v69;
  char v70;
  char v71;
  char v72;
  char v73;
  char v74;
  char v75;
  char v76;
  char v77;
  uint8_t buf[4];
  const char *v79;
  __int16 v80;
  _BYTE v81[10];
  _BYTE v82[10];
  _BYTE v83[10];
  void *v84;
  int v85;
  __int16 v86;
  int v87;
  __int16 v88;
  int v89;
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v59 = objc_msgSend(v3, "dismissedWalletKeyUWBUnlockOnboarding");
  v5 = objc_msgSend(*(id *)(a1 + 40), "indexOfObject:", *(_QWORD *)(a1 + 48));
  objc_opt_class();
  objc_msgSend(v4, "objectAtIndex:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  v61 = v8;
  v58 = objc_msgSend(v8, "BOOLValue");
  v9 = objc_msgSend(*(id *)(a1 + 40), "indexOfObject:", *(_QWORD *)(a1 + 56));
  objc_opt_class();
  objc_msgSend(v4, "objectAtIndex:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  objc_msgSend(v12, "walletKey");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v12, "walletKey");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v14, "isUWBUnlockEnabled") & 1) != 0)
      v15 = 1;
    else
      v15 = objc_msgSend(*(id *)(a1 + 32), "hf_containsWalletKeyUWBAccessory") ^ 1;

  }
  else
  {
    v15 = 1;
  }

  LODWORD(v16) = _os_feature_enabled_impl() ^ 1 | v15;
  HFLogForCategory();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = (char)v16;
    if ((_DWORD)v16)
      v16 = CFSTR("YES");
    else
      v16 = CFSTR("NO");
    objc_msgSend(*(id *)(a1 + 32), "name");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "hf_accessoriesSupportingUWBUnlock");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316162;
    v79 = "-[HUSetupBannerItem _determineRequiredLockAccessorySetupReminders:]_block_invoke";
    v80 = 2112;
    *(_QWORD *)v81 = v16;
    LOBYTE(v16) = v18;
    *(_WORD *)&v81[8] = 2112;
    *(_QWORD *)v82 = v12;
    *(_WORD *)&v82[8] = 2112;
    *(_QWORD *)v83 = v19;
    *(_WORD *)&v83[8] = 2112;
    v84 = v20;
    _os_log_impl(&dword_1B8E1E000, v17, OS_LOG_TYPE_DEFAULT, "(%s) shouldHideWalletKeyUWBBanner = %@. walletKeyDeviceState = %@. HMHome %@ has UWB supported accessories %@.", buf, 0x34u);

  }
  objc_msgSend(v12, "walletKey");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    objc_msgSend(v12, "walletKey");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "isExpressEnabled");

  }
  else
  {
    v23 = 1;
  }

  objc_msgSend(*(id *)(a1 + 32), "hf_accessoriesSupportingAccessCodes");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "count");

  v26 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 64), "user");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v26, "hf_userIsAdministrator:", v27);

  v29 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 64), "user");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v31) = objc_msgSend(v29, "hf_userIsOwner:", v30);

  v60 = v12;
  if (!v25)
  {
    v62 = 0;
LABEL_31:
    v32 = 0;
    goto LABEL_32;
  }
  if (v28)
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "hf_hasHomeHubSupportingAccessCodes") & 1) == 0 && (v31 & 1) == 0)
      goto LABEL_25;
LABEL_28:
    v62 = objc_msgSend(*(id *)(a1 + 32), "hasOnboardedForAccessCode") ^ 1;
    goto LABEL_29;
  }
  if ((_DWORD)v31)
    goto LABEL_28;
LABEL_25:
  v62 = 0;
LABEL_29:
  if (!objc_msgSend(*(id *)(a1 + 32), "hasOnboardedForAccessCode")
    || (objc_msgSend(*(id *)(a1 + 64), "hasDismissedAccessCodeOnboarding") & 1) != 0)
  {
    goto LABEL_31;
  }
  v32 = objc_msgSend(*(id *)(a1 + 32), "hf_hasHomeHubSupportingAccessCodes");
LABEL_32:
  HFLogForCategory();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    v56 = v23;
    v57 = v28;
    v34 = v25 != 0;
    v35 = *(void **)(a1 + 32);
    v36 = v31;
    v31 = *(_QWORD *)(a1 + 64);
    v37 = objc_msgSend(v35, "hasOnboardedForAccessCode");
    v38 = (char)v16;
    LODWORD(v16) = objc_msgSend(*(id *)(a1 + 64), "hasDismissedAccessCodeOnboarding");
    v39 = objc_msgSend(*(id *)(a1 + 32), "hf_hasHomeHubSupportingAccessCodes");
    *(_DWORD *)buf = 136317186;
    v79 = "-[HUSetupBannerItem _determineRequiredLockAccessorySetupReminders:]_block_invoke";
    v80 = 1024;
    *(_DWORD *)v81 = v62;
    *(_WORD *)&v81[4] = 1024;
    *(_DWORD *)&v81[6] = v32;
    *(_WORD *)v82 = 2112;
    *(_QWORD *)&v82[2] = v35;
    *(_WORD *)v83 = 2112;
    *(_QWORD *)&v83[2] = v31;
    LOBYTE(v31) = v36;
    LOWORD(v84) = 1024;
    *(_DWORD *)((char *)&v84 + 2) = v34;
    v23 = v56;
    LOBYTE(v28) = v57;
    HIWORD(v84) = 1024;
    v85 = v37;
    v86 = 1024;
    v87 = (int)v16;
    LOBYTE(v16) = v38;
    v88 = 1024;
    v89 = v39;
    _os_log_impl(&dword_1B8E1E000, v33, OS_LOG_TYPE_DEFAULT, "(%s) needsPinCodeFirmwareUpgradeSetup=%{BOOL}d | needsPinCodeUserOnboardingSetup=%{BOOL}d                for home %@ user %@ | eligibleForPinCodeSetup=%{BOOL}d | homeHasOnboarded=%{BOOL}d | userHasPreviouslyDismissed=%{BOOL}d | hasHomeHubSupportingAccessCodes=%{BOOL}d", buf, 0x44u);
  }

  v40 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__HUSetupBannerItem__determineRequiredLockAccessorySetupReminders___block_invoke_176;
  aBlock[3] = &unk_1E6F59160;
  v69 = v28;
  v67 = *(id *)(a1 + 32);
  v70 = v31;
  v71 = v59;
  v72 = (char)v16;
  v73 = v58;
  v74 = v23;
  v75 = v62;
  v76 = v32;
  v68 = *(id *)(a1 + 64);
  v77 = *(_BYTE *)(a1 + 72);
  v41 = _Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 32), "hf_walletKeyAccessories");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v42, "count"))
    v43 = *(_BYTE *)(a1 + 72) != 0;
  else
    v43 = 0;

  HFLogForCategory();
  v44 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    v63 = v43;
    v45 = *(void **)(a1 + 32);
    objc_msgSend(v45, "currentUser");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "hf_prettyDescription");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "hf_walletKeyAccessories");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v48, "count");
    v50 = (void *)MEMORY[0x1E0CBA1A8];
    objc_msgSend(*(id *)(a1 + 32), "hf_walletKeyAccessories");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "hf_minimumDescriptionsOfAccessories:", v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316162;
    v79 = "-[HUSetupBannerItem _determineRequiredLockAccessorySetupReminders:]_block_invoke";
    v80 = 2112;
    *(_QWORD *)v81 = v45;
    v43 = v63;
    *(_WORD *)&v81[8] = 2112;
    *(_QWORD *)v82 = v47;
    *(_WORD *)&v82[8] = 2048;
    *(_QWORD *)v83 = v49;
    *(_WORD *)&v83[8] = 2112;
    v84 = v52;
    _os_log_impl(&dword_1B8E1E000, v44, OS_LOG_TYPE_DEFAULT, "(%s) home %@ | user %@ | hf_walletKeyAccessories.count = %ld | walletKeyAccessories = %@", buf, 0x34u);

    v40 = MEMORY[0x1E0C809B0];
  }

  if (v43)
  {
    objc_msgSend(*(id *)(a1 + 32), "hf_hasWalletKeyCompatibleDevice");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v64[0] = v40;
    v64[1] = 3221225472;
    v64[2] = __67__HUSetupBannerItem__determineRequiredLockAccessorySetupReminders___block_invoke_182;
    v64[3] = &unk_1E6F59188;
    v65 = v41;
    objc_msgSend(v53, "flatMap:", v64);
    v54 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    (*((void (**)(void *, _QWORD, _QWORD))v41 + 2))(v41, 0, 0);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v54;
}

id __63__HUSetupBannerItem__determineRequiredAccessorySetupReminders___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HUAccessorySetupFlow *v12;
  uint64_t v13;
  HUAccessorySetupFlow *v14;
  void *v15;
  int v16;
  NSObject *v17;
  const char *v18;
  void *v19;
  void *v20;
  HUAccessorySetupFlow *v21;
  HUAccessorySetupFlow *v22;
  void *v23;
  void *v24;
  int v25;
  HUAccessorySetupFlow *v26;
  HUAccessorySetupFlow *v27;
  void *v28;
  void *v29;
  int v31;
  const char *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  int v38;
  __int16 v39;
  int v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", a2);
  objc_msgSend(*(id *)(a1 + 40), "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hf_currentUserIsRestrictedGuest");

  if (v4)
  {
    HFLogForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(void **)(a1 + 32);
      v31 = 136315394;
      v32 = "-[HUSetupBannerItem _determineRequiredAccessorySetupReminders:]_block_invoke";
      v33 = 2112;
      v34 = v6;
      _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "(%s) Current user is restricted guest. Only lock related banners should be displayed. accessorySetupFlows = %@", (uint8_t *)&v31, 0x16u);
    }

    v7 = (void *)MEMORY[0x1E0D519C0];
    v8 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
    objc_msgSend(v7, "futureWithResult:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  objc_msgSend(*(id *)(a1 + 40), "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "accessories");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "na_filter:", &__block_literal_global_168);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "home");
  v12 = (HUAccessorySetupFlow *)objc_claimAutoreleasedReturnValue();
  if (!-[HUAccessorySetupFlow hf_currentUserIsAdministrator](v12, "hf_currentUserIsAdministrator"))
    goto LABEL_8;
  v13 = objc_msgSend(v8, "count");

  if (v13)
  {
    v14 = [HUAccessorySetupFlow alloc];
    v12 = -[HUAccessorySetupFlow initWithType:homeKitObjects:](v14, "initWithType:homeKitObjects:", HFAccessorySetupFlowTypeResume, v8);
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v12);
LABEL_8:

  }
  objc_msgSend(*(id *)(a1 + 40), "home");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(*(id *)(a1 + 40), "hasDismissedAudioAnalysisOnboardingOnThisDevice");
  HFLogForCategory();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = *(const char **)(a1 + 48);
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 138413314;
    v32 = v18;
    v33 = 2112;
    v34 = v19;
    v35 = 1024;
    v36 = objc_msgSend(v15, "hf_hasAtleastOneSafetyAndSecuritySupportedAccessory");
    v37 = 1024;
    v38 = objc_msgSend(v15, "didOnboardAudioAnalysis");
    v39 = 1024;
    v40 = v16;
    _os_log_impl(&dword_1B8E1E000, v17, OS_LOG_TYPE_DEFAULT, "%@:%@ Determing whether to show safety and security banner... hasAtleastOneSafetyAndSecuritySupportedAccessory=%{BOOL}d | didOnboardAudioAnalysis=%{BOOL}d | hasDismissedAudioAnalysisOnboardingOnThisDevice=%{BOOL}d", (uint8_t *)&v31, 0x28u);

  }
  if (objc_msgSend(v15, "hf_hasAtleastOneSafetyAndSecuritySupportedAccessory")
    && objc_msgSend(v15, "hf_currentUserIsAdministrator")
    && (objc_msgSend(v15, "didOnboardAudioAnalysis") | v16) != 1
    || HFForceSafetyAndSecurityOnboarding())
  {
    objc_msgSend(v15, "hf_safetyAndSecuritySupportedAccessories");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = [HUAccessorySetupFlow alloc];
    v22 = -[HUAccessorySetupFlow initWithType:homeKitObjects:](v21, "initWithType:homeKitObjects:", HFAccessorySetupFlowTypeSafetyAndSecurity, v20);
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v22);

  }
  objc_msgSend(v15, "hf_siriEndpointCapableAccessoriesToOnboard");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D31160], "sharedHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "isAccessorySetupActive");

  if ((objc_msgSend(MEMORY[0x1E0D319D0], "isAMac") & 1) == 0
    && ((objc_msgSend(v15, "hf_currentUserIsAdministrator") ^ 1 | v25) & 1) == 0
    && objc_msgSend(v23, "count"))
  {
    v26 = [HUAccessorySetupFlow alloc];
    v27 = -[HUAccessorySetupFlow initWithType:homeKitObjects:](v26, "initWithType:homeKitObjects:", HFAccessorySetupFlowTypeSiriEndpoint, v23);
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v27);

  }
  v28 = (void *)MEMORY[0x1E0D519C0];
  v29 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
  objc_msgSend(v28, "futureWithResult:", v29);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_21:
  return v9;
}

id __49__HUSetupBannerItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  __int128 v9;
  _QWORD v10[5];
  id v11;
  __int128 v12;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_determineRequiredOnboardingReminders:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __49__HUSetupBannerItem__subclass_updateWithOptions___block_invoke_2;
  v10[3] = &unk_1E6F590C8;
  v10[4] = *(_QWORD *)(a1 + 32);
  v11 = v3;
  v9 = *(_OWORD *)(a1 + 40);
  v5 = (id)v9;
  v12 = v9;
  v6 = v3;
  objc_msgSend(v4, "flatMap:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_determineRequiredOnboardingReminders:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  HUSetupBannerItem *v13;
  SEL v14;

  v5 = a3;
  -[HUBannerItem home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUHomeFeatureOnboardingUtilities atLeastOneHomePodHasLanguageSettingsForHomeFuture:](HUHomeFeatureOnboardingUtilities, "atLeastOneHomePodHasLanguageSettingsForHomeFuture:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __59__HUSetupBannerItem__determineRequiredOnboardingReminders___block_invoke;
  v11[3] = &unk_1E6F59118;
  v12 = v5;
  v13 = self;
  v14 = a2;
  v8 = v5;
  objc_msgSend(v7, "flatMap:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __59__HUSetupBannerItem__determineRequiredOnboardingReminders___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  BOOL v24;
  NSObject *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  id v29;
  void *v30;
  int v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "hf_hasHomePods"))
  {

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "home");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "hf_hasRMVCapableAppleTV");

    if (!v7)
      goto LABEL_37;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "hasDismissedVoiceProfileOnboarding")
    && (objc_msgSend(*(id *)(a1 + 32), "hasDismissedIdentifyVoiceReminderBanner") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "home");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v8, "hf_hasRMVCapableAppleTV"))
    {
      objc_msgSend(*(id *)(a1 + 32), "home");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v9, "hf_hasHomePods") & 1) != 0)
      {
        v10 = *(_QWORD *)(a1 + 40);

        if (!v10)
        {
          HFLogForCategory();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            v12 = *(void **)(a1 + 48);
            NSStringFromSelector(*(SEL *)(a1 + 56));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = 138412546;
            v37 = v12;
            v38 = 2112;
            v39 = v13;
            _os_log_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_DEFAULT, "%@:%@ Supressing reminder banner for Voice ID until language settings sync", (uint8_t *)&v36, 0x16u);

          }
          v14 = 0;
LABEL_15:
          +[HUHomeFeatureOnboardingUtilities fetchSupportedVoiceRecognitionLanguages](HUHomeFeatureOnboardingUtilities, "fetchSupportedVoiceRecognitionLanguages");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          HFLogForCategory();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            v17 = *(void **)(a1 + 48);
            NSStringFromSelector(*(SEL *)(a1 + 56));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v15, "count");
            v36 = 138413058;
            v37 = v17;
            v38 = 2112;
            v39 = v18;
            v40 = 2048;
            v41 = v19;
            v42 = 2112;
            v43 = v15;
            _os_log_impl(&dword_1B8E1E000, v16, OS_LOG_TYPE_DEFAULT, "%@:%@ (%lu) supported voice recognition languages %@", (uint8_t *)&v36, 0x2Au);

          }
          if (!v15)
          {
            HFLogForCategory();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              NSStringFromSelector(*(SEL *)(a1 + 56));
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v36 = 138412290;
              v37 = v35;
              _os_log_error_impl(&dword_1B8E1E000, v20, OS_LOG_TYPE_ERROR, "%@ Error fetching voice recognition languages", (uint8_t *)&v36, 0xCu);

            }
            v14 = 0;
          }
          objc_msgSend(*(id *)(a1 + 32), "home");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v21, "hf_hasRMVCapableAppleTV") & 1) == 0)
          {
            objc_msgSend(*(id *)(a1 + 32), "home");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v22, "hf_hasHomePods") & 1) != 0)
            {
              objc_msgSend(*(id *)(a1 + 32), "home");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = +[HUHomeFeatureOnboardingUtilities home:hasSomeHomePodsOnSupportedVoiceRecognitionLanguages:](HUHomeFeatureOnboardingUtilities, "home:hasSomeHomePodsOnSupportedVoiceRecognitionLanguages:", v23, v15);

              if (!v24)
              {
                HFLogForCategory();
                v25 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
                {
                  v26 = *(void **)(a1 + 48);
                  NSStringFromSelector(*(SEL *)(a1 + 56));
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  v36 = 138412546;
                  v37 = v26;
                  v38 = 2112;
                  v39 = v27;
                  _os_log_impl(&dword_1B8E1E000, v25, OS_LOG_TYPE_DEFAULT, "%@:%@ Supressing reminder banner for Voice ID because no HomePods in this home are on a supported language.", (uint8_t *)&v36, 0x16u);

                }
                if (!objc_msgSend(*(id *)(a1 + 32), "isIdentifyVoiceEnabled"))
                  goto LABEL_36;
                goto LABEL_31;
              }
LABEL_30:
              if ((objc_msgSend(*(id *)(a1 + 32), "isIdentifyVoiceEnabled") & 1) == 0)
              {
                if (v14)
                  objc_msgSend(v4, "addObject:", *MEMORY[0x1E0D30688]);
                goto LABEL_36;
              }
LABEL_31:
              HFLogForCategory();
              v28 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              {
                NSStringFromSelector(*(SEL *)(a1 + 56));
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                v36 = 138412290;
                v37 = v34;
                _os_log_error_impl(&dword_1B8E1E000, v28, OS_LOG_TYPE_ERROR, "%@ Voice Rec is on but Reminder Banner has not been marked dismissed (This shouldn't happen, likey radar://58773131). Fixing.", (uint8_t *)&v36, 0xCu);

              }
              v29 = (id)objc_msgSend(*(id *)(a1 + 32), "setDismissIdentifyVoiceReminderBanner:", 1);
LABEL_36:

              goto LABEL_37;
            }

          }
          goto LABEL_30;
        }
LABEL_14:
        v14 = 1;
        goto LABEL_15;
      }

    }
    goto LABEL_14;
  }
LABEL_37:
  objc_msgSend(*(id *)(a1 + 32), "home");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "hf_hasAppleTVs");

  if (v31
    && objc_msgSend(*(id *)(a1 + 32), "hasDismissedTVViewingProfilesOnboarding")
    && (objc_msgSend(*(id *)(a1 + 32), "hasDismissedTVViewingProfilesReminderBanner") & 1) == 0)
  {
    objc_msgSend(v4, "addObject:", *MEMORY[0x1E0D306A8]);
  }
  objc_msgSend(*(id *)(a1 + 32), "home");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "hf_hasSecureRecordingCameras");

  if (v33
    && objc_msgSend(*(id *)(a1 + 32), "hasDismissedCameraRecordingOnboarding")
    && (objc_msgSend(*(id *)(a1 + 32), "hasDismissedCameraRecordingReminderBanner") & 1) == 0)
  {
    objc_msgSend(v4, "addObject:", *MEMORY[0x1E0D30668]);
  }
  objc_msgSend(v3, "finishWithResult:", v4);

}

id __59__HUSetupBannerItem__determineRequiredOnboardingReminders___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  __int128 v18;

  v3 = a2;
  v4 = MEMORY[0x1E0C809B0];
  v5 = (void *)MEMORY[0x1E0D519C0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __59__HUSetupBannerItem__determineRequiredOnboardingReminders___block_invoke_2;
  v15[3] = &unk_1E6F57AE0;
  v16 = *(id *)(a1 + 32);
  v17 = v3;
  v18 = *(_OWORD *)(a1 + 40);
  v6 = v3;
  objc_msgSend(v5, "futureWithBlock:", v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v4;
  v13[1] = 3221225472;
  v13[2] = __59__HUSetupBannerItem__determineRequiredOnboardingReminders___block_invoke_158;
  v13[3] = &unk_1E6F590F0;
  v14 = *(id *)(a1 + 32);
  objc_msgSend(v7, "flatMap:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __59__HUSetupBannerItem__determineRequiredOnboardingReminders___block_invoke_3;
  v11[3] = &unk_1E6F590F0;
  v12 = *(id *)(a1 + 32);
  objc_msgSend(v8, "flatMap:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __49__HUSetupBannerItem__subclass_updateWithOptions___block_invoke_39(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "supportsAccessCodes");
}

uint64_t __49__HUSetupBannerItem__subclass_updateWithOptions___block_invoke_2_47(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "supportsAccessCodes");
}

uint64_t __49__HUSetupBannerItem__subclass_updateWithOptions___block_invoke_152(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "safeSetObject:forKey:", a2, *MEMORY[0x1E0D30C60]);
  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", *(_QWORD *)(a1 + 32));
}

id __59__HUSetupBannerItem__determineRequiredOnboardingReminders___block_invoke_158(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v12 = CFSTR("OnboardingDisplayOption_OnboardingFromUserInput");
  v13[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUNaturalLightingOnboardingFlow needsOnboardingForHome:options:](HUNaturalLightingOnboardingFlow, "needsOnboardingForHome:options:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __59__HUSetupBannerItem__determineRequiredOnboardingReminders___block_invoke_2_160;
  v10[3] = &unk_1E6F4CD58;
  v11 = v3;
  v7 = v3;
  objc_msgSend(v6, "flatMap:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __59__HUSetupBannerItem__determineRequiredOnboardingReminders___block_invoke_2_160(uint64_t a1, void *a2)
{
  if (objc_msgSend(a2, "BOOLValue"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", *MEMORY[0x1E0D306A0]);
  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", *(_QWORD *)(a1 + 32));
}

id __59__HUSetupBannerItem__determineRequiredOnboardingReminders___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUUtilityOnboardingFlow needsOnboardingForHome:options:](HUUtilityOnboardingFlow, "needsOnboardingForHome:options:", v4, MEMORY[0x1E0C9AA70]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __59__HUSetupBannerItem__determineRequiredOnboardingReminders___block_invoke_4;
  v9[3] = &unk_1E6F4CD58;
  v10 = v3;
  v6 = v3;
  objc_msgSend(v5, "flatMap:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __59__HUSetupBannerItem__determineRequiredOnboardingReminders___block_invoke_4(uint64_t a1, void *a2)
{
  if (objc_msgSend(a2, "BOOLValue"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", *MEMORY[0x1E0D306B8]);
  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", *(_QWORD *)(a1 + 32));
}

BOOL __63__HUSetupBannerItem__determineRequiredAccessorySetupReminders___block_invoke_167(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "pendingConfigurationIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

id __67__HUSetupBannerItem__determineRequiredLockAccessorySetupReminders___block_invoke_176(uint64_t a1, int a2, void *a3)
{
  int v5;
  int v6;
  int v7;
  int v8;
  NSObject *v9;
  int v10;
  int v11;
  int v12;
  _BOOL4 v13;
  char v14;
  __CFString **v15;
  _BOOL4 v16;
  char v17;
  char v18;
  __CFString *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  int v25;
  int v26;
  int v27;
  const __CFString *v28;
  void *v29;
  HUAccessorySetupFlow *v30;
  HUAccessorySetupFlow *v31;
  void *v32;
  void *v33;
  int v35;
  int v36;
  void *v37;
  void *v38;
  void *v39;
  __CFString *v40;
  __CFString *v41;
  HUAccessorySetupFlow *v42;
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  _BYTE v46[10];
  void *v47;
  _BYTE v48[10];
  __int16 v49;
  void *v50;
  __int16 v51;
  int v52;
  __int16 v53;
  _BOOL4 v54;
  __int16 v55;
  int v56;
  __int16 v57;
  int v58;
  __int16 v59;
  int v60;
  __int16 v61;
  int v62;
  __int16 v63;
  int v64;
  __int16 v65;
  int v66;
  __int16 v67;
  const __CFString *v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v41 = a3;
  if (a2)
  {
    if (*(_BYTE *)(a1 + 48) && (objc_msgSend(*(id *)(a1 + 32), "hf_hasHomeHubSupportingWalletKey") & 1) != 0
      || *(_BYTE *)(a1 + 49))
    {
      v5 = objc_msgSend(*(id *)(a1 + 32), "hasOnboardedForWalletKey") ^ 1;
    }
    else
    {
      v5 = 0;
    }
    v6 = MGGetBoolAnswer();
    if (objc_msgSend(*(id *)(a1 + 32), "hasOnboardedForWalletKey") && !*(_BYTE *)(a1 + 50))
    {
      v7 = *(_BYTE *)(a1 + 51) ? 0 : v6;
      if (v7 == 1)
      {
        v8 = _os_feature_enabled_impl();
        v6 = 1;
        goto LABEL_16;
      }
    }
  }
  else
  {
    v6 = MGGetBoolAnswer();
    v5 = 0;
  }
  v8 = 0;
LABEL_16:
  HFLogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_msgSend(*(id *)(a1 + 32), "hasOnboardedForWalletKey");
    v11 = *(unsigned __int8 *)(a1 + 50);
    v12 = *(unsigned __int8 *)(a1 + 51);
    *(_DWORD *)buf = 136316674;
    v44 = "-[HUSetupBannerItem _determineRequiredLockAccessorySetupReminders:]_block_invoke";
    v45 = 1024;
    *(_DWORD *)v46 = v8;
    *(_WORD *)&v46[4] = 1024;
    *(_DWORD *)&v46[6] = a2;
    LOWORD(v47) = 1024;
    *(_DWORD *)((char *)&v47 + 2) = v10;
    HIWORD(v47) = 1024;
    *(_DWORD *)v48 = v11;
    *(_WORD *)&v48[4] = 1024;
    *(_DWORD *)&v48[6] = v12;
    v49 = 1024;
    LODWORD(v50) = v6;
    _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "(%s) needsWalletKeyUWBUnlockUserOnboardingSetup = %{BOOL}d because isEligibleForWalletKeySetup = %{BOOL}d. home.hasOnboardedForWalletKey = %{BOOL}d. userHasDismissedWalletKeyUWBUnlockOnboarding = %{BOOL}d. shouldHideWalletKeyUWBBanner = %{BOOL}d. deviceSupportsUWB = %{BOOL}d", buf, 0x30u);
  }

  v13 = a2
     && objc_msgSend(*(id *)(a1 + 32), "hasOnboardedForWalletKey")
     && !*(_BYTE *)(a1 + 52)
     && *(_BYTE *)(a1 + 53) == 0;
  if (*(_BYTE *)(a1 + 54))
    v14 = v5;
  else
    v14 = 0;
  if ((v14 & 1) != 0)
  {
    v15 = &HFAccessorySetupFlowTypeLockAccessFirmwareUpdateAll;
LABEL_38:
    v19 = *v15;
    goto LABEL_39;
  }
  v16 = *(_BYTE *)(a1 + 55) != 0;
  v17 = v16 & (v8 | v13);
  if ((v16 & (v8 | v13)) != 0)
    v15 = &HFAccessorySetupFlowTypeLockAccessAll;
  else
    v15 = &HFAccessorySetupFlowTypeLockAccessFirmwareUpdatePinCode;
  if (*(_BYTE *)(a1 + 54) || (v17 & 1) != 0)
    goto LABEL_38;
  if (*(_BYTE *)(a1 + 55))
    v18 = 1;
  else
    v18 = v5;
  v15 = &HFAccessorySetupFlowTypeLockAccessFirmwareUpdateWalletKey;
  if (*(_BYTE *)(a1 + 55))
    v15 = &HFAccessorySetupFlowTypeLockAccessPinCode;
  if ((v18 & 1) != 0)
    goto LABEL_38;
  if (v8)
  {
    v35 = _os_feature_enabled_impl();
    v15 = &HFAccessorySetupFlowTypeLockAccessWalletKey;
    if (v35)
      v15 = &HFAccessorySetupFlowTypeLockAccessWalletKeyUWB;
    if (((v13 | v35) & 1) != 0)
      goto LABEL_38;
  }
  else if (v13)
  {
    v15 = &HFAccessorySetupFlowTypeLockAccessWalletKey;
    goto LABEL_38;
  }
  v19 = 0;
LABEL_39:
  HFLogForCategory();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "name");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
    v40 = v19;
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "user");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "name");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "user");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "uniqueIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(*(id *)(a1 + 32), "hasOnboardedForWalletKey");
    v25 = *(unsigned __int8 *)(a1 + 52);
    v36 = *(unsigned __int8 *)(a1 + 56);
    v26 = objc_msgSend(*(id *)(a1 + 32), "hf_hasHomeHubSupportingWalletKey");
    v27 = *(unsigned __int8 *)(a1 + 53);
    v28 = &stru_1E6F60E80;
    *(_DWORD *)buf = 136318466;
    if (v41)
      v28 = v41;
    v44 = "-[HUSetupBannerItem _determineRequiredLockAccessorySetupReminders:]_block_invoke";
    v45 = 2112;
    *(_QWORD *)v46 = v37;
    *(_WORD *)&v46[8] = 2112;
    v47 = v21;
    *(_WORD *)v48 = 2112;
    *(_QWORD *)&v48[2] = v22;
    v49 = 2112;
    v50 = v23;
    v51 = 1024;
    v52 = v5;
    v53 = 1024;
    v54 = v13;
    v55 = 1024;
    v56 = a2;
    v57 = 1024;
    v58 = v24;
    v59 = 1024;
    v60 = v25;
    v61 = 1024;
    v62 = v36;
    v63 = 1024;
    v64 = v26;
    v65 = 1024;
    v66 = v27;
    v67 = 2112;
    v68 = v28;
    _os_log_impl(&dword_1B8E1E000, v20, OS_LOG_TYPE_DEFAULT, "(%s) home <Name:%@, uniqueIdentifier:%@> | user <Name:%@, uniqueIdentifier:%@> |                     needsWalletKeyFirmwareUpgradeSetup=%{BOOL}d | needsWalletKeyExpressModeUserOnboardingSetup=%{BOOL}d |                     eligibleForWalletKeySetup=%{BOOL}d | homeHasOnboarded=%{BOOL}d | userHasDismissedWalletKeyExpressModeOnboarding=%{BOOL}d                     is_iPhone=%{BOOL}d | hasHomeHubSupportingWalletKey=%{BOOL}d | shouldHideWalletKeyExpressModeBanner=%{BOOL}d %@", buf, 0x6Eu);

    v19 = v40;
  }

  v29 = (void *)MEMORY[0x1E0D519C0];
  if (v19)
  {
    v30 = [HUAccessorySetupFlow alloc];
    v31 = -[HUAccessorySetupFlow initWithType:homeKitObjects:](v30, "initWithType:homeKitObjects:", v19, MEMORY[0x1E0C9AA60]);
    v42 = v31;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v42, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "futureWithResult:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", MEMORY[0x1E0C9AA60]);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v33;
}

id __67__HUSetupBannerItem__determineRequiredLockAccessorySetupReminders___block_invoke_182(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a2;
  objc_msgSend(v3, "stringWithFormat:", CFSTR(" | hasWalletKeyCompatible iPhone or paired watch = %{BOOL}d"), objc_msgSend(v4, "BOOLValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = objc_msgSend(v4, "BOOLValue");

  (*(void (**)(uint64_t, uint64_t, void *))(v6 + 16))(v6, v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_namesOfAccessoriesNeedingNaturalLightingOnboarding
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];

  -[HUBannerItem home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hf_allLightProfilesSupportingNaturalLighting");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_flatMap:", &__block_literal_global_187);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __72__HUSetupBannerItem__namesOfAccessoriesNeedingNaturalLightingOnboarding__block_invoke_2;
  v11[3] = &unk_1E6F517A8;
  v11[4] = self;
  objc_msgSend(v6, "na_map:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "na_map:", &__block_literal_global_190);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __72__HUSetupBannerItem__namesOfAccessoriesNeedingNaturalLightingOnboarding__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "services");
}

id __72__HUSetupBannerItem__namesOfAccessoriesNeedingNaturalLightingOnboarding__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a2;
  objc_msgSend(v3, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hf_showAsAccessoryTile");

  if (v5)
  {
    objc_msgSend(v3, "accessory");
    v6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:
    v9 = v6;
    goto LABEL_7;
  }
  if (!objc_msgSend(v3, "hf_isInGroup"))
  {
    v6 = v3;
    goto LABEL_6;
  }
  objc_msgSend(*(id *)(a1 + 32), "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hf_serviceGroupsForService:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v9;
}

uint64_t __72__HUSetupBannerItem__namesOfAccessoriesNeedingNaturalLightingOnboarding__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_displayName");
}

@end

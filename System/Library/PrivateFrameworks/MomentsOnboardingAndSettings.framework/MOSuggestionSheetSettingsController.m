@implementation MOSuggestionSheetSettingsController

+ (id)onboardingSettingsBundle
{
  return (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
}

+ (BOOL)fetchSiginificantLocationEnablementStatus
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  dispatch_time_t v5;
  _QWORD v7[4];
  NSObject *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v2 = dispatch_group_create();
  dispatch_group_enter(v2);
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  objc_msgSend(MEMORY[0x24BE27ED0], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __80__MOSuggestionSheetSettingsController_fetchSiginificantLocationEnablementStatus__block_invoke;
  v7[3] = &unk_25133FA78;
  v9 = &v10;
  v4 = v2;
  v8 = v4;
  objc_msgSend(v3, "fetchRoutineStateWithHandler:", v7);

  v5 = dispatch_time(0, 3000000000);
  dispatch_group_wait(v4, v5);
  LOBYTE(v3) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)v3;
}

void __80__MOSuggestionSheetSettingsController_fetchSiginificantLocationEnablementStatus__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2 && !a3)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

+ (int)runCommand:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  const char **v6;
  size_t v7;
  unint64_t v8;
  void *v9;
  id v10;
  int v11;
  int v13;
  pid_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_msgSend(v3, "count");
  v5 = v4;
  v6 = (const char **)((char *)&v13 - ((8 * v4 + 23) & 0xFFFFFFFFFFFFFFF0));
  if ((unint64_t)(8 * v4 + 8) >= 0x200)
    v7 = 512;
  else
    v7 = 8 * v4 + 8;
  bzero((char *)&v13 - ((8 * v4 + 23) & 0xFFFFFFFFFFFFFFF0), v7);
  v6[v5] = 0;
  if (objc_msgSend(v3, "count"))
  {
    v8 = 0;
    do
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        +[MOSuggestionSheetSettingsController runCommand:].cold.1();
      v10 = objc_retainAutorelease(v9);
      v6[v8] = (const char *)objc_msgSend(v10, "cStringUsingEncoding:", 4);

      ++v8;
    }
    while (v8 < objc_msgSend(v3, "count"));
  }
  v14 = 0;
  v11 = posix_spawn(&v14, *v6, 0, 0, (char *const *)v6, 0);
  v13 = v11;
  if (!v11)
  {
    waitpid(v14, &v13, 0);
    v11 = v13;
  }

  return v11;
}

- (MOSuggestionSheetSettingsController)init
{
  MOSuggestionSheetSettingsController *v2;
  MOSuggestionSheetSettingsController *v3;
  NSMutableArray *supportedApplications;
  NSMutableArray *supportedApplicationsWithDataAccess;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MOSuggestionSheetSettingsController;
  v2 = -[MOSuggestionSheetSettingsController init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    supportedApplications = v2->supportedApplications;
    v2->supportedApplications = 0;

    supportedApplicationsWithDataAccess = v3->supportedApplicationsWithDataAccess;
    v3->supportedApplicationsWithDataAccess = 0;

    v3->supportedApplicationsLoading = 0;
  }
  return v3;
}

- (id)specifiers
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _BOOL4 v17;
  char **v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_class *v23;
  void *v24;
  NSUInteger v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  Class v31;
  uint64_t v32;
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
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  objc_class *v77;
  void *v78;
  NSUInteger v79;
  void *v80;
  void *v81;
  void *v82;
  NSObject *v83;
  NSMutableArray *v84;
  NSMutableArray *supportedApplications;
  NSMutableArray *v86;
  NSMutableArray *supportedApplicationsWithDataAccess;
  NSObject *v88;
  NSObject *v89;
  void *v90;
  void *v91;
  void *v92;
  NSMutableArray *v93;
  NSMutableArray *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t i;
  NSMutableArray *v99;
  void *v100;
  void *v101;
  uint64_t v102;
  void *v103;
  id v104;
  id v105;
  void *v107;
  void *v108;
  void *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  unint64_t v115;
  void *v116;
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
  void *v127;
  void *v128;
  _BOOL4 v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  uint64_t v137;
  void *v138;
  uint64_t v139;
  void *v140;
  uint64_t v141;
  void *v142;
  uint64_t v143;
  void *v144;
  uint64_t v145;
  void *v146;
  void *v147;
  uint64_t v148;
  void *v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  _QWORD block[4];
  id v155;
  id buf[2];
  _BYTE v157[128];
  uint64_t v158;
  NSRange v159;
  NSRange v160;

  v158 = *MEMORY[0x24BDAC8D0];
  +[MOOnboardingManager sharedInstance](MOOnboardingManager, "sharedInstance");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v115 = objc_msgSend(v123, "onboardingFlowCompletionStatus") & 0xFFFFFFFFFFFFFFFELL;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MOSuggestionSheetSettingsController onboardingSettingsBundle](MOSuggestionSheetSettingsController, "onboardingSettingsBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:name:", CFSTR("PRE_ONBOARDING_NO_APP_WARMUP"), &stru_2513404F8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x24BE75B28];
  v7 = MEMORY[0x24BDBD1C8];
  v139 = *MEMORY[0x24BE75B28];
  objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75B28]);
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Journaling Suggestions are only available when there is a journaling App on iPhone"), &stru_2513404F8, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v124 = v5;
  v137 = *MEMORY[0x24BE75A68];
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, *MEMORY[0x24BE75A68]);

  v9 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Turn On Journaling Suggestions"), &stru_2513404F8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v10, self, 0, 0, 0, 13, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v148 = *MEMORY[0x24BE75868];
  objc_msgSend(v11, "setProperty:forKey:", v7);
  v125 = v11;
  objc_msgSend(v11, "setButtonAction:", sel_didTapTurnOnJournalingSuggestion_);
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Turn Off All"), &stru_2513404F8, 0);
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Turn On All"), &stru_2513404F8, 0);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x24BE75590];
  v121 = (void *)v13;
  v122 = (void *)v12;
  if (-[MOSuggestionSheetSettingsController _isAnySettingEnabled](self, "_isAnySettingEnabled"))
    v15 = v12;
  else
    v15 = v13;
  objc_msgSend(v14, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v15, self, 0, 0, 0, 13, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[MOSuggestionSheetSettingsController _isAnySettingEnabled](self, "_isAnySettingEnabled");
  v18 = &selRef_didTapTurnOffAllWarmup_;
  if (!v17)
    v18 = &selRef_didTapTurnOnAll_;
  v126 = v16;
  objc_msgSend(v16, "setButtonAction:", *v18);
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("INCLUDE SUGGESTIONS FROM"), &stru_2513404F8, 0);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:name:", CFSTR("INCLUDE_SUGGESTIONS_FROM_GROUP"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], v6);
  objc_msgSend(MEMORY[0x24BE6E3F8], "bundleWithIdentifier:", CFSTR("com.apple.onboarding.journal"));
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "privacyFlow");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "localizedButtonTitle");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Suggestions use data from apps and services you turn on, but can appear in any app using suggestions. Data used for suggestions is private and stored on-device."), &stru_2513404F8, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), v22, v21);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:");
  v23 = (objc_class *)objc_opt_class();
  NSStringFromClass(v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v113 = *MEMORY[0x24BE75A30];
  objc_msgSend(v19, "setProperty:forKey:", v24);

  v117 = v22;
  v25 = objc_msgSend(v22, "length") + 1;
  v118 = v21;
  v159.length = objc_msgSend(v21, "length");
  v159.location = v25;
  NSStringFromRange(v159);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = *MEMORY[0x24BE75A40];
  objc_msgSend(v19, "setProperty:forKey:", v26);

  objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", self);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v111 = *MEMORY[0x24BE75A50];
  objc_msgSend(v19, "setProperty:forKey:", v27);

  v110 = *MEMORY[0x24BE75A38];
  v135 = v19;
  objc_msgSend(v19, "setProperty:forKey:", CFSTR("showPrivacyExplanationSheet:"));
  v28 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Activity"), &stru_2513404F8, 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v29, self, sel__setStreamToggleWarmup_withSpecifier_, 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v143 = *MEMORY[0x24BE75AC0];
  objc_msgSend(v30, "setObject:forKeyedSubscript:", CFSTR("Activity"));
  v31 = NSClassFromString(CFSTR("PSSubtitleSwitchTableCell"));
  v32 = *MEMORY[0x24BE75948];
  v145 = *MEMORY[0x24BE75948];
  objc_msgSend(v30, "setObject:forKeyedSubscript:", v31, *MEMORY[0x24BE75948]);
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Your workouts and exercise"), &stru_2513404F8, 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v141 = *MEMORY[0x24BE75D28];
  objc_msgSend(v30, "setObject:forKeyedSubscript:", v33);

  v134 = v30;
  objc_msgSend(v30, "setProperty:forKey:", MEMORY[0x24BDBD1C8], v148);
  v34 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Media"), &stru_2513404F8, 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v35, self, sel__setStreamToggleWarmup_withSpecifier_, sel__getStreamToggle_, 0, 6, 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v36, "setObject:forKeyedSubscript:", CFSTR("Media"), v143);
  objc_msgSend(v36, "setObject:forKeyedSubscript:", NSClassFromString(CFSTR("PSSubtitleSwitchTableCell")), v32);
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Podcasts, music, videos, and more"), &stru_2513404F8, 0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setObject:forKeyedSubscript:", v37, v141);

  v133 = v36;
  objc_msgSend(v36, "setProperty:forKey:", MEMORY[0x24BDBD1C8], v148);
  v38 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Contacts"), &stru_2513404F8, 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v39, self, sel__setStreamToggleWarmup_withSpecifier_, sel__getStreamToggle_, 0, 6, 0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v40, "setObject:forKeyedSubscript:", CFSTR("Contacts"), v143);
  objc_msgSend(v40, "setObject:forKeyedSubscript:", NSClassFromString(CFSTR("PSSubtitleSwitchTableCell")), v145);
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("People you message and call"), &stru_2513404F8, 0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setObject:forKeyedSubscript:", v41, v141);

  v132 = v40;
  objc_msgSend(v40, "setProperty:forKey:", MEMORY[0x24BDBD1C8], v148);
  v42 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Photos"), &stru_2513404F8, 0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v43, self, sel__setStreamToggleWarmup_withSpecifier_, sel__getStreamToggle_, 0, 6, 0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v44, "setObject:forKeyedSubscript:", CFSTR("Photos"), v143);
  objc_msgSend(v44, "setObject:forKeyedSubscript:", NSClassFromString(CFSTR("PSSubtitleSwitchTableCell")), v145);
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Library, memories and people"), &stru_2513404F8, 0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setObject:forKeyedSubscript:", v45, v141);

  v131 = v44;
  objc_msgSend(v44, "setProperty:forKey:", MEMORY[0x24BDBD1C8], v148);
  v129 = +[MOSuggestionSheetSettingsController fetchSiginificantLocationEnablementStatus](MOSuggestionSheetSettingsController, "fetchSiginificantLocationEnablementStatus");
  v46 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Significant Locations"), &stru_2513404F8, 0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v47, self, sel__setStreamToggleWarmup_withSpecifier_, sel__getStreamToggle_, 0, 6, 0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v48, "setObject:forKeyedSubscript:", CFSTR("Significant Locations"), v143);
  objc_msgSend(v48, "setObject:forKeyedSubscript:", NSClassFromString(CFSTR("PSSubtitleSwitchTableCell")), v145);
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Places where you spend time"), &stru_2513404F8, 0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setObject:forKeyedSubscript:", v49, v141);

  v50 = MEMORY[0x24BDBD1C8];
  objc_msgSend(v48, "setProperty:forKey:", MEMORY[0x24BDBD1C8], v148);
  if (v129)
    v51 = v50;
  else
    v51 = MEMORY[0x24BDBD1C0];
  v114 = v48;
  objc_msgSend(v48, "setProperty:forKey:", v51, *MEMORY[0x24BE75A18]);
  v52 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("State of Mind"), &stru_2513404F8, 0);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v53, self, sel__setStreamToggleWarmup_withSpecifier_, sel__getStreamToggle_, 0, 6, 0);
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v54, "setObject:forKeyedSubscript:", CFSTR("State of Mind"), v143);
  objc_msgSend(v54, "setObject:forKeyedSubscript:", NSClassFromString(CFSTR("PSSubtitleSwitchTableCell")), v145);
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Moods and emotions you log"), &stru_2513404F8, 0);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setObject:forKeyedSubscript:", v55, v141);

  v142 = v54;
  v56 = MEMORY[0x24BDBD1C8];
  objc_msgSend(v54, "setProperty:forKey:", MEMORY[0x24BDBD1C8], v148);
  objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setObject:forKeyedSubscript:", v56, v139);
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("General prompts to reflect on gratitude, kindness, purpose, and more"), &stru_2513404F8, 0);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v136 = v57;
  objc_msgSend(v57, "setObject:forKeyedSubscript:", v58, v137);

  v59 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Reflection Prompts"), &stru_2513404F8, 0);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v60, self, 0);
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v61, "setObject:forKeyedSubscript:", CFSTR("Reflection"), v143);
  objc_msgSend(v61, "setObject:forKeyedSubscript:", NSClassFromString(CFSTR("PSSubtitleSwitchTableCell")), v145);
  v130 = v61;
  objc_msgSend(v61, "setProperty:forKey:", MEMORY[0x24BDBD1C8], v148);
  objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Clear History"), &stru_2513404F8, 0);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "deleteButtonSpecifierWithName:target:action:", v63, self, sel__clearHistoryWarmup_);
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  v127 = v64;
  objc_msgSend(v64, "setObject:forKeyedSubscript:", &unk_2513445D8, *MEMORY[0x24BE75860]);
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("iPhone will discover nearby contacts to show moments spent with contacts higher up in your list of suggestions. This may also allow your contacts to discover when you’re nearby. Your name and location will not be shared."), &stru_2513404F8, 0);
  v65 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("NEARBY PEOPLE"), &stru_2513404F8, 0);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:name:", CFSTR("NEARBY_PEOPLE_GROUP"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = MEMORY[0x24BDBD1C8];
  objc_msgSend(v66, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], v139);
  v140 = v66;
  v109 = (void *)v65;
  objc_msgSend(v66, "setObject:forKeyedSubscript:", v65, v137);
  v68 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Prioritize Moments with Contacts"), &stru_2513404F8, 0);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v69, self, sel__setStreamToggle_withSpecifier_, sel__getStreamToggle_, 0, 6, 0);
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v70, "setObject:forKeyedSubscript:", CFSTR("Prioritize Moments with Contacts"), v143);
  objc_msgSend(v70, "setObject:forKeyedSubscript:", NSClassFromString(CFSTR("PSSubtitleSwitchTableCell")), v145);
  v147 = v70;
  objc_msgSend(v70, "setProperty:forKey:", v67, v148);
  objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Suggestion Notification Settings"), &stru_2513404F8, 0);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v72, self, 0, 0, 0, 13, 0);
  v73 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v73, "setProperty:forKey:", v67, v148);
  objc_msgSend(v73, "setButtonAction:", sel_didTapSuggestionNotificationSettings_);
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("APPS USING PRIVATE ACCESS"), &stru_2513404F8, 0);
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:name:", CFSTR("APPS_USING_PRIVATE_ACCESS_GROUP"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Learn More"), &stru_2513404F8, 0);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Apps using Private Access for suggestions data will appear here."), &stru_2513404F8, 0);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), v76, v75);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "setObject:forKeyedSubscript:");
  v77 = (objc_class *)objc_opt_class();
  NSStringFromClass(v77);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "setProperty:forKey:", v78, v113);

  v138 = v76;
  v79 = objc_msgSend(v76, "length") + 1;
  v144 = v75;
  v160.length = objc_msgSend(v75, "length");
  v160.location = v79;
  NSStringFromRange(v160);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "setProperty:forKey:", v80, v112);

  objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", self);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "setProperty:forKey:", v81, v111);

  objc_msgSend(v74, "setProperty:forKey:", CFSTR("showDataAccessExplanationSheet:"), v110);
  if (!self->supportedApplicationsLoading && !self->supportedApplications && !self->supportedApplicationsWithDataAccess)
  {
    v82 = v73;
    _mo_log_facility_get_os_log(MOLogFacilitySettings);
    v83 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_2422B0000, v83, OS_LOG_TYPE_DEFAULT, "Triggering loading of supported applications specifiers", (uint8_t *)buf, 2u);
    }

    self->supportedApplicationsLoading = 1;
    v84 = (NSMutableArray *)objc_opt_new();
    supportedApplications = self->supportedApplications;
    self->supportedApplications = v84;

    v86 = (NSMutableArray *)objc_opt_new();
    supportedApplicationsWithDataAccess = self->supportedApplicationsWithDataAccess;
    self->supportedApplicationsWithDataAccess = v86;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v88 = objc_claimAutoreleasedReturnValue();
    v89 = dispatch_queue_create("MOSuggestionSheetSettingsController", v88);

    objc_initWeak(buf, self);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __49__MOSuggestionSheetSettingsController_specifiers__block_invoke;
    block[3] = &unk_25133F4E0;
    objc_copyWeak(&v155, buf);
    dispatch_async(v89, block);
    objc_destroyWeak(&v155);
    objc_destroyWeak(buf);

    v73 = v82;
  }
  if (v115 == 2)
  {
    objc_msgSend(v3, "addObject:", v135);
    v90 = v126;
    objc_msgSend(v3, "addObject:", v126);
    objc_msgSend(v3, "addObject:", v134);
    objc_msgSend(v3, "addObject:", v133);
    objc_msgSend(v3, "addObject:", v132);
    objc_msgSend(v3, "addObject:", v131);
    v91 = v114;
    objc_msgSend(v3, "addObject:", v114);
    objc_msgSend(v3, "addObject:", v142);
    objc_msgSend(v3, "addObject:", v128);
    objc_msgSend(v3, "addObject:", v127);
    objc_msgSend(v3, "addObject:", v136);
    objc_msgSend(v3, "addObject:", v130);
    objc_msgSend(v3, "addObject:", v140);
    objc_msgSend(v3, "addObject:", v147);
    objc_msgSend(v3, "addObject:", v146);
    v92 = v73;
    objc_msgSend(v3, "addObject:", v73);
    objc_msgSend(v3, "addObject:", v74);
    if (!self->supportedApplicationsLoading)
    {
      v93 = self->supportedApplicationsWithDataAccess;
      if (v93)
      {
        v152 = 0u;
        v153 = 0u;
        v150 = 0u;
        v151 = 0u;
        v94 = v93;
        v95 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v94, "countByEnumeratingWithState:objects:count:", &v150, v157, 16);
        if (v95)
        {
          v96 = v95;
          v97 = *(_QWORD *)v151;
          do
          {
            for (i = 0; i != v96; ++i)
            {
              if (*(_QWORD *)v151 != v97)
                objc_enumerationMutation(v94);
              objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v150 + 1) + 8 * i));
            }
            v96 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v94, "countByEnumeratingWithState:objects:count:", &v150, v157, 16);
          }
          while (v96);
        }

        v90 = v126;
      }
    }
  }
  else
  {
    v92 = v73;
    v90 = v126;
    v91 = v114;
    if (!self->supportedApplicationsLoading)
    {
      v99 = self->supportedApplications;
      if (v99)
      {
        if (-[NSMutableArray count](v99, "count"))
        {
          v100 = v3;
          v101 = v125;
        }
        else
        {
          v100 = v3;
          v101 = v124;
        }
        objc_msgSend(v100, "addObject:", v101);
      }
    }
  }
  v102 = (int)*MEMORY[0x24BE756E0];
  v103 = *(Class *)((char *)&self->super.super.super.super.super.isa + v102);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v102) = (Class)v3;
  v104 = v3;

  v105 = *(id *)((char *)&self->super.super.super.super.super.isa + v102);
  return v105;
}

void __49__MOSuggestionSheetSettingsController_specifiers__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id *v3;
  _QWORD *WeakRetained;
  _QWORD block[4];
  id v6;
  uint8_t buf[16];

  _mo_log_facility_get_os_log(MOLogFacilitySettings);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2422B0000, v2, OS_LOG_TYPE_DEFAULT, "Loading of supported applications specifiers started", buf, 2u);
  }

  v3 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "fillSupportedApplicationsArray:andSupportedApplicationsWithDataAccess:", WeakRetained[172], WeakRetained[173]);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__MOSuggestionSheetSettingsController_specifiers__block_invoke_107;
  block[3] = &unk_25133F4E0;
  objc_copyWeak(&v6, v3);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(&v6);

}

void __49__MOSuggestionSheetSettingsController_specifiers__block_invoke_107(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  _BYTE *WeakRetained;
  uint8_t v5[16];
  uint8_t buf[16];

  _mo_log_facility_get_os_log(MOLogFacilitySettings);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2422B0000, v2, OS_LOG_TYPE_DEFAULT, "Loading of supported applications specifiers complete", buf, 2u);
  }

  _mo_log_facility_get_os_log(MOLogFacilitySettings);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2422B0000, v3, OS_LOG_TYPE_DEFAULT, "Triggering specifiers reload", v5, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  WeakRetained[1392] = 0;
  objc_msgSend(WeakRetained, "reloadSpecifiers");

}

- (void)fillSupportedApplicationsArray:(id)a3 andSupportedApplicationsWithDataAccess:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
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
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;

  v5 = a3;
  v28 = a4;
  +[MOApprovedApplicationsManager sharedInstance](MOApprovedApplicationsManager, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDC1540], "enumeratorWithOptions:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __109__MOSuggestionSheetSettingsController_fillSupportedApplicationsArray_andSupportedApplicationsWithDataAccess___block_invoke;
  v29[3] = &unk_25133FAA0;
  v25 = v6;
  v30 = v25;
  v26 = v5;
  v31 = v26;
  objc_msgSend(v7, "setFilter:", v29);
  v27 = v7;
  objc_msgSend(v7, "nextObject");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    v10 = *MEMORY[0x24BE75AC8];
    v11 = *MEMORY[0x24BE75DA0];
    do
    {
      objc_msgSend(v9, "URL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithURL:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "bundleIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x24BEBD640];
      objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "scale");
      objc_msgSend(v15, "_applicationIconImageForBundleIdentifier:format:scale:", v14, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "objectForInfoDictionaryKey:", CFSTR("CFBundleDisplayName"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (isValidString(v18))
      {
        v19 = v18;

        v14 = v19;
      }
      objc_msgSend(v13, "objectForInfoDictionaryKey:", CFSTR("CFBundleName"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (isValidString(v20))
      {
        v21 = v20;

        v14 = v21;
      }
      objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v14, 0, 0, 0, 0, 3, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "bundleIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setUserInfo:", v23);

      objc_msgSend(v22, "setObject:forKeyedSubscript:", v17, v10);
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v14, v11);
      objc_msgSend(v28, "addObject:", v22);

      objc_msgSend(v27, "nextObject");
      v24 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v24;
    }
    while (v24);
  }

}

BOOL __109__MOSuggestionSheetSettingsController_fillSupportedApplicationsArray_andSupportedApplicationsWithDataAccess___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "isJournalingSuggestionsAvailableForBundleIdentifier:", v5);

  if ((_DWORD)v4)
  {
    objc_msgSend(v3, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 40);
    v8 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v7, "addObject:", v8);

  }
  v9 = *(void **)(a1 + 32);
  objc_msgSend(v3, "bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "getJournalingSuggestionsApprovedApplicationRecordForBundleIdentifier:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11 != 0;
}

- (BOOL)_isAnySettingEnabled
{
  void *v2;
  char v3;
  char v4;
  char v5;
  char v6;
  char v7;
  char v8;
  char v9;

  +[MOSettingsManager sharedInstance](MOSettingsManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "getStateForSetting:", 1);
  v4 = v3 | objc_msgSend(v2, "getStateForSetting:", 2);
  v5 = objc_msgSend(v2, "getStateForSetting:", 3);
  v6 = v4 | v5 | objc_msgSend(v2, "getStateForSetting:", 4);
  v7 = objc_msgSend(v2, "getStateForSetting:", 5);
  v8 = v7 | objc_msgSend(v2, "getStateForSetting:", 6);
  v9 = v6 | v8 | objc_msgSend(v2, "getStateForSetting:", 9);

  return v9 & 1;
}

- (void)_clearHistoryWarmup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  +[MOSuggestionSheetSettingsController onboardingSettingsBundle](MOSuggestionSheetSettingsController, "onboardingSettingsBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BEBD3B0];
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Do you want to clear the history of Journaling Suggestions?"), &stru_2513404F8, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "alertControllerWithTitle:message:preferredStyle:", v7, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Clear History"), &stru_2513404F8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __59__MOSuggestionSheetSettingsController__clearHistoryWarmup___block_invoke;
  v16[3] = &unk_25133FAC8;
  objc_copyWeak(&v18, &location);
  v11 = v4;
  v17 = v11;
  objc_msgSend(v9, "actionWithTitle:style:handler:", v10, 2, v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v12);

  v13 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Cancel"), &stru_2513404F8, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "actionWithTitle:style:handler:", v14, 1, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v15);

  -[MOSuggestionSheetSettingsController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);
  objc_destroyWeak(&v18);

  objc_destroyWeak(&location);
}

void __59__MOSuggestionSheetSettingsController__clearHistoryWarmup___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_clearHistory:", *(_QWORD *)(a1 + 32));

}

- (void)_clearHistory:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  +[MOSettingsManager sharedInstance](MOSettingsManager, "sharedInstance", a3);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v12, "getStateForSetting:", 1);
  v5 = objc_msgSend(v12, "getStateForSetting:", 2);
  v6 = objc_msgSend(v12, "getStateForSetting:", 3);
  v7 = objc_msgSend(v12, "getStateForSetting:", 4);
  v8 = objc_msgSend(v12, "getStateForSetting:", 5);
  v9 = objc_msgSend(v12, "getStateForSetting:", 6);
  v10 = objc_msgSend(v12, "getStateForSetting:", 9);
  v11 = objc_msgSend(v12, "getStateForSetting:", 10);
  objc_msgSend(v12, "setState:forSetting:", 1, 1);
  objc_msgSend(v12, "setState:forSetting:", 1, 2);
  objc_msgSend(v12, "setState:forSetting:", 1, 3);
  objc_msgSend(v12, "setState:forSetting:", 1, 4);
  objc_msgSend(v12, "setState:forSetting:", 1, 5);
  objc_msgSend(v12, "setState:forSetting:", 1, 6);
  objc_msgSend(v12, "setState:forSetting:", 1, 9);
  objc_msgSend(v12, "setState:forSetting:", 1, 10);
  objc_msgSend(v12, "setState:forSetting:", 0, 1);
  objc_msgSend(v12, "setState:forSetting:", 0, 2);
  objc_msgSend(v12, "setState:forSetting:", 0, 3);
  objc_msgSend(v12, "setState:forSetting:", 0, 4);
  objc_msgSend(v12, "setState:forSetting:", 0, 5);
  objc_msgSend(v12, "setState:forSetting:", 0, 6);
  objc_msgSend(v12, "setState:forSetting:", 0, 9);
  objc_msgSend(v12, "setState:forSetting:", 0, 10);
  objc_msgSend(v12, "setState:forSetting:", v4, 1);
  objc_msgSend(v12, "setState:forSetting:", v5, 2);
  objc_msgSend(v12, "setState:forSetting:", v6, 3);
  objc_msgSend(v12, "setState:forSetting:", v7, 4);
  objc_msgSend(v12, "setState:forSetting:", v8, 5);
  objc_msgSend(v12, "setState:forSetting:", v9, 6);
  objc_msgSend(v12, "setState:forSetting:", v10, 9);
  objc_msgSend(v12, "setState:forSetting:", v11, 10);
  -[MOSuggestionSheetSettingsController reloadSpecifiers](self, "reloadSpecifiers");
  +[MOSuggestionSheetSettingsController runCommand:](MOSuggestionSheetSettingsController, "runCommand:", &unk_251344578);

}

- (void)didTapTurnOnJournalingSuggestion:(id)a3
{
  MOSuggestionSheetSettingsController *v3;
  void *v4;
  id v5;

  v3 = self;
  +[MOOnboardingManager sharedInstance](MOOnboardingManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getSheetOnboardingViewControllerWithDelegate:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setModalInPresentation:", 1);
  objc_msgSend(v5, "setModalPresentationStyle:", 2);
  -[MOSuggestionSheetSettingsController presentViewController:animated:completion:](v3, "presentViewController:animated:completion:", v5, 1, 0);

}

- (void)shouldDismissOnboarding
{
  -[MOSuggestionSheetSettingsController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  -[MOSuggestionSheetSettingsController reloadSpecifiers](self, "reloadSpecifiers");
}

- (void)didTapSuggestionNotificationSettings:(id)a3
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("app-prefs:com.apple.momentsd.MOUserNotifications&target=com.apple.settings.notifications"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "openSensitiveURL:withOptions:", v4, 0);

}

- (void)didTapTurnOffAllWarmup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  +[MOSuggestionSheetSettingsController onboardingSettingsBundle](MOSuggestionSheetSettingsController, "onboardingSettingsBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BEBD3B0];
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Do you want to turn off Journaling Suggestions?"), &stru_2513404F8, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "alertControllerWithTitle:message:preferredStyle:", v7, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Turn Off All"), &stru_2513404F8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __62__MOSuggestionSheetSettingsController_didTapTurnOffAllWarmup___block_invoke;
  v16[3] = &unk_25133FAC8;
  objc_copyWeak(&v18, &location);
  v11 = v4;
  v17 = v11;
  objc_msgSend(v9, "actionWithTitle:style:handler:", v10, 2, v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v12);

  v13 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Cancel"), &stru_2513404F8, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "actionWithTitle:style:handler:", v14, 1, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v15);

  -[MOSuggestionSheetSettingsController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);
  objc_destroyWeak(&v18);

  objc_destroyWeak(&location);
}

void __62__MOSuggestionSheetSettingsController_didTapTurnOffAllWarmup___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "didTapTurnOffAll:", *(_QWORD *)(a1 + 32));

}

- (void)didTapTurnOffAll:(id)a3
{
  id v4;

  +[MOSettingsManager sharedInstance](MOSettingsManager, "sharedInstance", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setState:forSetting:", 0, 1);
  objc_msgSend(v4, "setState:forSetting:", 0, 2);
  objc_msgSend(v4, "setState:forSetting:", 0, 3);
  objc_msgSend(v4, "setState:forSetting:", 0, 4);
  objc_msgSend(v4, "setState:forSetting:", 0, 5);
  objc_msgSend(v4, "setState:forSetting:", 0, 6);
  objc_msgSend(v4, "setState:forSetting:", 0, 9);
  -[MOSuggestionSheetSettingsController reloadSpecifiers](self, "reloadSpecifiers");
  +[MOSuggestionSheetSettingsController runCommand:](MOSuggestionSheetSettingsController, "runCommand:", &unk_251344590);

}

- (void)didTapTurnOnAll:(id)a3
{
  id v4;

  +[MOSettingsManager sharedInstance](MOSettingsManager, "sharedInstance", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setState:forSetting:", 1, 1);
  objc_msgSend(v4, "setState:forSetting:", 1, 2);
  objc_msgSend(v4, "setState:forSetting:", 1, 3);
  objc_msgSend(v4, "setState:forSetting:", 1, 4);
  objc_msgSend(v4, "setState:forSetting:", 1, 5);
  objc_msgSend(v4, "setState:forSetting:", 1, 6);
  objc_msgSend(v4, "setState:forSetting:", 1, 9);
  -[MOSuggestionSheetSettingsController reloadSpecifiers](self, "reloadSpecifiers");
  +[MOSuggestionSheetSettingsController runCommand:](MOSuggestionSheetSettingsController, "runCommand:", &unk_2513445A8);

}

- (void)_setStreamToggleWarmup:(id)a3 withSpecifier:(id)a4
{
  id v6;
  id v7;
  char v8;
  void *v9;
  id WeakRetained;
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
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  MOSuggestionSheetSettingsController *v31;
  id v32;
  _QWORD v33[4];
  id v34;
  MOSuggestionSheetSettingsController *v35;
  id v36;
  id location[2];

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "BOOLValue");
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BE75AC0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(location, self);
  if ((v8 & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained(location);
    objc_msgSend(WeakRetained, "_setStreamToggle:withSpecifier:", MEMORY[0x24BDBD1C8], v7);

    -[MOSuggestionSheetSettingsController reloadSpecifiers](self, "reloadSpecifiers");
  }
  else
  {
    +[MOSuggestionSheetSettingsController onboardingSettingsBundle](MOSuggestionSheetSettingsController, "onboardingSettingsBundle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MOSuggestionSheetSettingsController _getLocalizedSpecifier:](self, "_getLocalizedSpecifier:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Turning off \"%@\" will clear history of selected data of Journaling Suggestions. Continue?"), &stru_2513404F8, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringWithFormat:", v14, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Clear \"%@\" history"), &stru_2513404F8, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringWithFormat:", v17, v12);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Cancel"), &stru_2513404F8, 0);
    v26 = v6;
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v9;
    objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v15, 0, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x24BEBD3A8];
    v20 = MEMORY[0x24BDAC760];
    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = __76__MOSuggestionSheetSettingsController__setStreamToggleWarmup_withSpecifier___block_invoke;
    v33[3] = &unk_25133FAF0;
    objc_copyWeak(&v36, location);
    v21 = v7;
    v34 = v21;
    v35 = self;
    objc_msgSend(v19, "actionWithTitle:style:handler:", v28, 2, v33);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addAction:", v22);

    v23 = (void *)MEMORY[0x24BEBD3A8];
    v29[0] = v20;
    v29[1] = 3221225472;
    v29[2] = __76__MOSuggestionSheetSettingsController__setStreamToggleWarmup_withSpecifier___block_invoke_2;
    v29[3] = &unk_25133FAF0;
    objc_copyWeak(&v32, location);
    v30 = v21;
    v31 = self;
    objc_msgSend(v23, "actionWithTitle:style:handler:", v27, 1, v29);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addAction:", v24);

    -[MOSuggestionSheetSettingsController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v18, 1, 0);
    objc_destroyWeak(&v32);

    objc_destroyWeak(&v36);
    v9 = v25;
    v6 = v26;
  }
  objc_destroyWeak(location);

}

uint64_t __76__MOSuggestionSheetSettingsController__setStreamToggleWarmup_withSpecifier___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_setStreamToggle:withSpecifier:", MEMORY[0x24BDBD1C0], *(_QWORD *)(a1 + 32));

  return objc_msgSend(*(id *)(a1 + 40), "reloadSpecifiers");
}

uint64_t __76__MOSuggestionSheetSettingsController__setStreamToggleWarmup_withSpecifier___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_setStreamToggle:withSpecifier:", MEMORY[0x24BDBD1C8], *(_QWORD *)(a1 + 32));

  return objc_msgSend(*(id *)(a1 + 40), "reloadSpecifiers");
}

- (void)_setStreamToggle:(id)a3 withSpecifier:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  v7 = a4;
  v8 = a3;
  +[MOSettingsManager sharedInstance](MOSettingsManager, "sharedInstance");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BE75AC0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "isEqual:", CFSTR("Activity")))
  {
    v11 = v15;
    v12 = v9;
    v13 = 1;
  }
  else if (objc_msgSend(v10, "isEqual:", CFSTR("Media")))
  {
    v11 = v15;
    v12 = v9;
    v13 = 2;
  }
  else if (objc_msgSend(v10, "isEqual:", CFSTR("Contacts")))
  {
    v11 = v15;
    v12 = v9;
    v13 = 3;
  }
  else if (objc_msgSend(v10, "isEqual:", CFSTR("Photos")))
  {
    v11 = v15;
    v12 = v9;
    v13 = 4;
  }
  else if (objc_msgSend(v10, "isEqual:", CFSTR("Significant Locations")))
  {
    v11 = v15;
    v12 = v9;
    v13 = 5;
  }
  else if (objc_msgSend(v10, "isEqual:", CFSTR("Prioritize Moments with Contacts")))
  {
    v11 = v15;
    v12 = v9;
    v13 = 6;
  }
  else if (objc_msgSend(v10, "isEqual:", CFSTR("State of Mind")))
  {
    v11 = v15;
    v12 = v9;
    v13 = 9;
  }
  else
  {
    if (!objc_msgSend(v10, "isEqual:", CFSTR("Reflection")))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOSuggestionSheetSettingsController.m"), 630, CFSTR("Specifier identifier is unknown"));

      goto LABEL_18;
    }
    v11 = v15;
    v12 = v9;
    v13 = 10;
  }
  objc_msgSend(v11, "setState:forSetting:", v12, v13);
LABEL_18:
  +[MOSuggestionSheetSettingsController runCommand:](MOSuggestionSheetSettingsController, "runCommand:", &unk_2513445C0);

}

- (id)_getStreamToggle:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v13;

  v5 = a3;
  +[MOSettingsManager sharedInstance](MOSettingsManager, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE75AC0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "isEqual:", CFSTR("Activity")))
  {
    v8 = (void *)MEMORY[0x24BDD16E0];
    v9 = v6;
    v10 = 1;
  }
  else if (objc_msgSend(v7, "isEqual:", CFSTR("Media")))
  {
    v8 = (void *)MEMORY[0x24BDD16E0];
    v9 = v6;
    v10 = 2;
  }
  else if (objc_msgSend(v7, "isEqual:", CFSTR("Contacts")))
  {
    v8 = (void *)MEMORY[0x24BDD16E0];
    v9 = v6;
    v10 = 3;
  }
  else if (objc_msgSend(v7, "isEqual:", CFSTR("Photos")))
  {
    v8 = (void *)MEMORY[0x24BDD16E0];
    v9 = v6;
    v10 = 4;
  }
  else if (objc_msgSend(v7, "isEqual:", CFSTR("Significant Locations")))
  {
    v8 = (void *)MEMORY[0x24BDD16E0];
    v9 = v6;
    v10 = 5;
  }
  else if (objc_msgSend(v7, "isEqual:", CFSTR("Prioritize Moments with Contacts")))
  {
    v8 = (void *)MEMORY[0x24BDD16E0];
    v9 = v6;
    v10 = 6;
  }
  else if (objc_msgSend(v7, "isEqual:", CFSTR("State of Mind")))
  {
    v8 = (void *)MEMORY[0x24BDD16E0];
    v9 = v6;
    v10 = 9;
  }
  else
  {
    if (!objc_msgSend(v7, "isEqual:", CFSTR("Reflection")))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOSuggestionSheetSettingsController.m"), 658, CFSTR("Specifier identifier is unknown"));

      v11 = 0;
      goto LABEL_18;
    }
    v8 = (void *)MEMORY[0x24BDD16E0];
    v9 = v6;
    v10 = 10;
  }
  objc_msgSend(v8, "numberWithBool:", objc_msgSend(v9, "getStateForSetting:", v10));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:

  return v11;
}

- (id)_getLocalizedSpecifier:(id)a3
{
  id v5;
  void *v6;
  const __CFString *v7;
  __CFString *v8;
  void *v10;

  v5 = a3;
  +[MOSuggestionSheetSettingsController onboardingSettingsBundle](MOSuggestionSheetSettingsController, "onboardingSettingsBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqual:", CFSTR("Activity")))
  {
    v7 = CFSTR("Activity");
  }
  else if (objc_msgSend(v5, "isEqual:", CFSTR("Media")))
  {
    v7 = CFSTR("Media");
  }
  else if (objc_msgSend(v5, "isEqual:", CFSTR("Contacts")))
  {
    v7 = CFSTR("Contacts");
  }
  else if (objc_msgSend(v5, "isEqual:", CFSTR("Photos")))
  {
    v7 = CFSTR("Photos");
  }
  else if (objc_msgSend(v5, "isEqual:", CFSTR("Significant Locations")))
  {
    v7 = CFSTR("Significant Locations");
  }
  else if (objc_msgSend(v5, "isEqual:", CFSTR("Prioritize Moments with Contacts")))
  {
    v7 = CFSTR("Prioritize Moments with Contacts");
  }
  else if (objc_msgSend(v5, "isEqual:", CFSTR("State of Mind")))
  {
    v7 = CFSTR("State of Mind");
  }
  else
  {
    if (!objc_msgSend(v5, "isEqual:", CFSTR("Reflection")))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOSuggestionSheetSettingsController.m"), 684, CFSTR("Specifier identifier is unknown"));

      v8 = &stru_2513404F8;
      goto LABEL_18;
    }
    v7 = CFSTR("Reflection Prompts");
  }
  objc_msgSend(v6, "localizedStringForKey:value:table:", v7, &stru_2513404F8, 0);
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_18:

  return v8;
}

- (void)showPrivacyExplanationSheet:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BE6E438], "presenterForPrivacySplashWithIdentifier:", CFSTR("com.apple.onboarding.journal"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPresentingViewController:", self);
  objc_msgSend(v4, "present");

}

- (void)showDataAccessExplanationSheet:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  OBWelcomeController *v9;
  void *v10;
  OBWelcomeController *dataAccessPresenter;
  id v12;

  +[MOSuggestionSheetSettingsController onboardingSettingsBundle](MOSuggestionSheetSettingsController, "onboardingSettingsBundle", a3);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Private Access & Suggestions"), &stru_2513404F8, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Your journal only has access to suggestions when you start writing about them or save them.\n\nThe information used to create a suggestion, such as a photo or workout, is also shared with your journal at that time.\n\nApps that use Private Access to offer suggestions will appear in Journaling Suggestions settings."), &stru_2513404F8, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "imageNamed:inBundle:", CFSTR("momentsPrivacy-80-masked"), v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE6E3E8], "boldButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Done"), &stru_2513404F8, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:forState:", v8, 0);

  objc_msgSend(v7, "addTarget:action:forControlEvents:", self, sel_dismissDataAccessExplanationSheet_, 0x2000);
  v9 = (OBWelcomeController *)objc_msgSend(objc_alloc(MEMORY[0x24BE6E458]), "initWithTitle:detailText:icon:contentLayout:", v4, v5, v6, 2);
  -[OBWelcomeController buttonTray](v9, "buttonTray");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addButton:", v7);

  -[OBWelcomeController setModalInPresentation:](v9, "setModalInPresentation:", 1);
  -[MOSuggestionSheetSettingsController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);
  dataAccessPresenter = self->dataAccessPresenter;
  self->dataAccessPresenter = v9;

}

- (void)dismissDataAccessExplanationSheet:(id)a3
{
  OBWelcomeController *dataAccessPresenter;

  -[OBWelcomeController dismissViewControllerAnimated:completion:](self->dataAccessPresenter, "dismissViewControllerAnimated:completion:", 1, 0);
  dataAccessPresenter = self->dataAccessPresenter;
  self->dataAccessPresenter = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->dataAccessPresenter, 0);
  objc_storeStrong((id *)&self->supportedApplicationsWithDataAccess, 0);
  objc_storeStrong((id *)&self->supportedApplications, 0);
}

+ (void)runCommand:.cold.1()
{
  __assert_rtn("+[MOSuggestionSheetSettingsController runCommand:]", "MOSuggestionSheetSettingsController.m", 69, "[arg isKindOfClass:NSString.class]");
}

@end

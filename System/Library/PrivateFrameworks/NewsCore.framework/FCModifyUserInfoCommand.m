@implementation FCModifyUserInfoCommand

- (FCModifyUserInfoCommand)initWithUserInfoRecord:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  FCModifyUserInfoCommand *v7;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[FCModifyRecordsCommand initWithLocalRecords:merge:](self, "initWithLocalRecords:merge:", v6, 1, v9, v10);
  return v7;
}

- (BOOL)mergeLocalRecord:(id)a3 withRemoteRecord:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  void *v78;
  int v79;
  void *v80;
  int v81;
  BOOL v82;
  void *v83;
  int v84;
  void *v85;
  uint64_t v86;
  void *v87;
  void *v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  void *v92;
  void *v93;
  uint64_t v94;
  void *v95;
  _BOOL4 v96;
  void *v97;
  uint64_t v98;
  void *v99;
  int v100;
  void *v101;
  uint64_t v102;
  void *v103;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
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
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  id v176;
  BOOL v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  uint8_t buf[4];
  void *v183;
  __int16 v184;
  void *v185;
  __int16 v186;
  void *v187;
  __int16 v188;
  void *v189;
  uint64_t v190;

  v190 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("finishFirstLaunchVersion"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("finishFirstLaunchVersion"));
  v8 = objc_claimAutoreleasedReturnValue();
  v132 = (void *)v8;
  v133 = v7;
  if (v8 && objc_msgSend(v7, "compare:", v8) != 1)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("finishFirstLaunchVersion"));
    v9 = 1;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("sportsOnboardingState"));
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sportsOnboardingState"));
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("sportsOnboardingCompletedDate"));
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sportsOnboardingCompletedDate"));
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)FCUserInfoLog;
  v160 = (void *)v10;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v180, "description");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v181, "description");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v183 = v160;
    v184 = 2112;
    v185 = v174;
    v186 = 2112;
    v187 = v12;
    v188 = 2112;
    v189 = v13;
    _os_log_impl(&dword_1A1B90000, v11, OS_LOG_TYPE_DEFAULT, "Will check to merge sports onboarding state local record to remote: remoteSportsState=%@, localSportsState=%@, remoteDate=%@, localDate=%@", buf, 0x2Au);

    v10 = (uint64_t)v160;
  }

  if (!v10 || !v180 || objc_msgSend(v181, "fc_isLaterThan:withPrecision:", v180, 0))
  {
    v14 = (id)FCUserInfoLog;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1B90000, v14, OS_LOG_TYPE_DEFAULT, "Merging sports onboarding local record to remote", buf, 2u);
    }

    objc_msgSend(v6, "setObject:forKeyedSubscript:", v174, CFSTR("sportsOnboardingState"));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v181, CFSTR("sportsOnboardingCompletedDate"));
    v9 = 1;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("shortcutsOnboardingState"));
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("shortcutsOnboardingState"));
  v15 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("shortcutsOnboardingCompletedDate"));
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("shortcutsOnboardingCompletedDate"));
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)FCUserInfoLog;
  v159 = (void *)v15;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v179, "description");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v181, "description");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v183 = v159;
    v184 = 2112;
    v185 = v173;
    v186 = 2112;
    v187 = v17;
    v188 = 2112;
    v189 = v18;
    _os_log_impl(&dword_1A1B90000, v16, OS_LOG_TYPE_DEFAULT, "Will check to merge shortcuts onboarding state local record to remote: remoteShortcutsOnboardingState=%@, localShortcutsOnboardingState=%@, remoteDate=%@, localDate=%@", buf, 0x2Au);

    v15 = (uint64_t)v159;
  }

  if (!v15 || !v179 || objc_msgSend(v172, "fc_isLaterThan:withPrecision:", v179, 0))
  {
    v19 = (id)FCUserInfoLog;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1B90000, v19, OS_LOG_TYPE_DEFAULT, "Merging shortcuts onboarding state local record to remote", buf, 2u);
    }

    objc_msgSend(v6, "setObject:forKeyedSubscript:", v173, CFSTR("shortcutsOnboardingState"));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v172, CFSTR("shortcutsOnboardingCompletedDate"));
    v9 = 1;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("sportsSyncState"));
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sportsSyncState"));
  v20 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("sportsSyncStateLastSavedDate"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sportsSyncStateLastSavedDate"));
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (id)FCUserInfoLog;
  v158 = (void *)v20;
  v148 = v21;
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v178, "description");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "description");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v183 = v158;
    v184 = 2112;
    v185 = v171;
    v186 = 2112;
    v187 = v23;
    v188 = 2112;
    v189 = v24;
    _os_log_impl(&dword_1A1B90000, v22, OS_LOG_TYPE_DEFAULT, "Will check to merge sports sync state local record to remote: remoteSportsSyncState=%@, localSportsSyncState=%@, remoteDate=%@, localDate=%@", buf, 0x2Au);

    v21 = v148;
    v20 = (uint64_t)v158;
  }

  if (!v20 || !v178 || objc_msgSend(v21, "fc_isLaterThan:withPrecision:", v178, 0))
  {
    v25 = (id)FCUserInfoLog;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1B90000, v25, OS_LOG_TYPE_DEFAULT, "Merging sports sync state local record to remote", buf, 2u);
    }

    objc_msgSend(v6, "setObject:forKeyedSubscript:", v171, CFSTR("sportsSyncState"));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v21, CFSTR("sportsSyncStateLastSavedDate"));
    v9 = 1;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("feldsparID"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("feldsparID"));
  v27 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("notificationsUserID"));
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("notificationsUserID"));
  v28 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("lastOpenedDate"));
  v29 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("lastOpenedDate"));
  v30 = objc_claimAutoreleasedReturnValue();
  v175 = (void *)v29;
  v31 = (void *)v29;
  v32 = v30;
  if (!objc_msgSend(v31, "compare:", v30) && v26 && (objc_msgSend(v26, "isEqualToString:", v27) & 1) == 0)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v26, CFSTR("feldsparID"));
    v9 = 1;
  }
  v131 = v26;
  if (!v28 && v170)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v170, CFSTR("notificationsUserID"));
    v9 = 1;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("adsUserID"));
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("adsUserID"));
  v33 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("adsUserIDCreatedDate"));
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("adsUserIDCreatedDate"));
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  v127 = (void *)v33;
  if (!v33 || !v168 || objc_msgSend(v169, "fc_isLaterThan:", v168))
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v150, CFSTR("adsUserID"));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v169, CFSTR("adsUserIDCreatedDate"));
    v9 = 1;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("sportsUserID"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sportsUserID"));
  v35 = objc_claimAutoreleasedReturnValue();
  v125 = (void *)v35;
  if (v34 && (objc_msgSend(v34, "isEqualToString:", v35) & 1) == 0)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v34, CFSTR("sportsUserID"));
    v9 = 1;
  }
  if (!v32 || objc_msgSend(v175, "compare:", v32) == 1)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v175, CFSTR("lastOpenedDate"));
    v9 = 1;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("userStartDate"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("userStartDate"));
  v37 = objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    objc_msgSend(v36, "earlierDate:", v37);
    v176 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v176 = v36;
  }
  v129 = (void *)v28;
  if (!v37 || objc_msgSend(v176, "compare:", v37))
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v176, CFSTR("userStartDate"));
    v9 = 1;
  }
  v130 = (void *)v27;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("lastViewedSavedDate"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("lastViewedSavedDate"));
  v39 = objc_claimAutoreleasedReturnValue();
  v121 = (void *)v39;
  v122 = v38;
  if (v39)
  {
    v40 = v39;
    objc_msgSend(v38, "laterDate:", v39);
    v41 = (id)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v41, "compare:", v40))
      goto LABEL_57;
  }
  else
  {
    v41 = v38;
  }
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v41, CFSTR("lastViewedSavedDate"));
  v9 = 1;
LABEL_57:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("lastViewedSharedWithYouDate"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("lastViewedSharedWithYouDate"));
  v43 = objc_claimAutoreleasedReturnValue();
  v120 = v41;
  v147 = (void *)v43;
  if (v42 && (!v43 || objc_msgSend(v42, "fc_isLaterThan:", v43)))
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v42, CFSTR("lastViewedSharedWithYouDate"));
    v9 = 1;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("monthlyMeteredCount"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("monthlyMeteredCount"));
  v45 = objc_claimAutoreleasedReturnValue();
  v167 = v44;
  v118 = (void *)v45;
  if (v44 && !v45 || objc_msgSend(v44, "compare:", v45) == 1)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v44, CFSTR("monthlyMeteredCount"));
    v9 = 1;
  }
  v119 = v42;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("totalMeteredCount"));
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v117)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", &unk_1E470A520, CFSTR("totalMeteredCount"));
    v9 = 1;
  }
  v46 = (void *)v37;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("meteredCountLastResetDate"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("meteredCountLastResetDate"));
  v48 = objc_claimAutoreleasedReturnValue();
  v146 = (void *)v48;
  v49 = v34;
  if (v47 && (!v48 || objc_msgSend(v47, "fc_isLaterThan:", v48)))
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v47, CFSTR("meteredCountLastResetDate"));
    v9 = 1;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("monthlyPaidBundleMeteredCount"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("monthlyPaidBundleMeteredCount"));
  v51 = objc_claimAutoreleasedReturnValue();
  v166 = v50;
  v115 = (void *)v51;
  if (v50 && !v51 || objc_msgSend(v50, "compare:", v51) == 1)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v50, CFSTR("monthlyPaidBundleMeteredCount"));
    v9 = 1;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("paidBundleMeteredCountLastResetDate"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("paidBundleMeteredCountLastResetDate"));
  v53 = objc_claimAutoreleasedReturnValue();
  v126 = v49;
  v157 = v52;
  v123 = v46;
  v145 = (void *)v53;
  if (v52 && (!v53 || objc_msgSend(v52, "fc_isLaterThan:", v53)))
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v52, CFSTR("paidBundleMeteredCountLastResetDate"));
    v9 = 1;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("upsellAppLaunchCount"));
  v54 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("upsellAppLaunchCount"));
  v55 = objc_claimAutoreleasedReturnValue();
  v124 = v36;
  v113 = (void *)v55;
  v56 = (void *)v32;
  if (v54 && !v55)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v54, CFSTR("upsellAppLaunchCount"));
    v9 = 1;
  }
  v114 = (void *)v54;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("lastAppLaunchUpsellInstanceID"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("lastAppLaunchUpsellInstanceID"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "fc_numberFollowingString:", CFSTR("v"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v111 = v58;
  objc_msgSend(v58, "fc_numberFollowingString:", CFSTR("v"));
  v60 = objc_claimAutoreleasedReturnValue();
  v61 = (void *)v60;
  v144 = v59;
  if (v59 && (!v60 || objc_msgSend(v59, "compare:", v60) == 1))
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v57, CFSTR("lastAppLaunchUpsellInstanceID"));
    v9 = 1;
  }
  v110 = v61;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("upsellAppLaunchLastSeenDate"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("upsellAppLaunchLastSeenDate"));
  v63 = objc_claimAutoreleasedReturnValue();
  v128 = v56;
  v156 = v62;
  v143 = (void *)v63;
  if (v62 && (!v63 || objc_msgSend(v62, "compare:", v63) == 1))
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v62, CFSTR("upsellAppLaunchLastSeenDate"));
    v9 = 1;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("upsellAppLaunchLastShownCampaignID"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("upsellAppLaunchLastShownCampaignID"));
  v65 = objc_claimAutoreleasedReturnValue();
  v142 = (void *)v65;
  if (v64 && (!v65 || objc_msgSend(v64, "compare:", v65) == 1))
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v64, CFSTR("upsellAppLaunchLastShownCampaignID"));
    v9 = 1;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("upsellAppLaunchLastPresenterBundleID"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("upsellAppLaunchLastPresenterBundleID"));
  v67 = objc_claimAutoreleasedReturnValue();
  v155 = v66;
  v141 = (void *)v67;
  if (v66 && (!v67 || objc_msgSend(v66, "compare:", v67) == 1))
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v66, CFSTR("upsellAppLaunchLastPresenterBundleID"));
    v9 = 1;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("newsletterSignupLastSeenDate"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("newsletterSignupLastSeenDate"));
  v69 = objc_claimAutoreleasedReturnValue();
  v154 = v68;
  v140 = (void *)v69;
  if (v68 && (!v69 || objc_msgSend(v68, "compare:", v69) == 1))
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v68, CFSTR("newsletterSignupLastSeenDate"));
    v9 = 1;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("personalizedNewsletterSignupLastSeenDate"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("personalizedNewsletterSignupLastSeenDate"));
  v71 = objc_claimAutoreleasedReturnValue();
  v153 = v70;
  v139 = (void *)v71;
  if (v70 && (!v71 || objc_msgSend(v70, "compare:", v71) == 1))
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v70, CFSTR("personalizedNewsletterSignupLastSeenDate"));
    v9 = 1;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("issuesNewsletterOptinLastSeenDate"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("issuesNewsletterOptinLastSeenDate"));
  v73 = objc_claimAutoreleasedReturnValue();
  v152 = v72;
  v138 = (void *)v73;
  if (v72 && (!v73 || objc_msgSend(v72, "compare:", v73) == 1))
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v72, CFSTR("issuesNewsletterOptinLastSeenDate"));
    v9 = 1;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("editorialArticleVersion"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("editorialArticleVersion"));
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  if (v74 && !v165 || v74 && (objc_msgSend(v74, "isEqualToString:", v165) & 1) == 0)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v74, CFSTR("editorialArticleVersion"));
    v9 = 1;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("marketingNotificationsEnabled"));
  v75 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("marketingNotificationsEnabled"));
  v76 = objc_claimAutoreleasedReturnValue();
  v77 = (void *)v75;
  v78 = (void *)v76;
  v108 = v74;
  v149 = v77;
  if (v77 && !v76 || v77 && (v79 = objc_msgSend(v77, "BOOLValue"), v79 != objc_msgSend(v78, "BOOLValue")))
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v149, CFSTR("marketingNotificationsEnabled"));
    v9 = 1;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("newIssueNotificationsEnabled"));
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("newIssueNotificationsEnabled"));
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  v136 = v80;
  if (v80 && !v164
    || v80
    && (v81 = objc_msgSend(v80, "BOOLValue"),
        v82 = v81 == objc_msgSend(v164, "BOOLValue"),
        v80 = v136,
        !v82))
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v80, CFSTR("newIssueNotificationsEnabled"));
    v9 = 1;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("endOfAudioNotificationsEnabled"));
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("endOfAudioNotificationsEnabled"));
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  v135 = v83;
  if (v83 && !v163
    || v83
    && (v84 = objc_msgSend(v83, "BOOLValue"),
        v82 = v84 == objc_msgSend(v163, "BOOLValue"),
        v83 = v135,
        !v82))
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v83, CFSTR("endOfAudioNotificationsEnabled"));
    v9 = 1;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("sportsTopicNotificationsEnabledState2"));
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sportsTopicNotificationsEnabledState2"));
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  v134 = v85;
  if (v85 && !v162
    || v85
    && (v86 = objc_msgSend(v85, "integerValue"), v82 = v86 == objc_msgSend(v162, "integerValue"), v85 = v134, !v82))
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v85, CFSTR("sportsTopicNotificationsEnabledState2"));
    v9 = 1;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("canonicalLanguage"));
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("canonicalLanguage"));
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  if (v87 && !v161 || v87 && (objc_msgSend(v87, "isEqualToString:", v161) & 1) == 0)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v87, CFSTR("canonicalLanguage"));
    v9 = 1;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("postPurchaseOnboardingLastSeenDate"));
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("postPurchaseOnboardingLastSeenDate"));
  v89 = objc_claimAutoreleasedReturnValue();
  v151 = v88;
  v116 = v47;
  v137 = (void *)v89;
  if (v88 && (!v89 || objc_msgSend(v88, "compare:", v89) == 1))
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v88, CFSTR("postPurchaseOnboardingLastSeenDate"));
    v9 = 1;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("appReviewRequestLastSeenDate"));
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("appReviewRequestLastSeenDate"));
  v91 = objc_claimAutoreleasedReturnValue();
  v92 = (void *)v91;
  v112 = v57;
  v106 = v87;
  if (v90 && (!v91 || objc_msgSend(v90, "compare:", v91) == 1))
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v90, CFSTR("appReviewRequestLastSeenDate"));
    v9 = 1;
  }
  v177 = v9;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("puzzleNotificationsLastChangedDate"));
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("puzzleNotificationsLastChangedDate"));
  v94 = objc_claimAutoreleasedReturnValue();
  v95 = (void *)v94;
  v96 = v94 == 0;
  v109 = v64;
  v107 = v78;
  v105 = v92;
  if (v93)
  {
    if (v94 && !objc_msgSend(v93, "fc_isLaterThan:", v94))
    {
      v96 = 0;
    }
    else
    {
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v93, CFSTR("puzzleNotificationsLastChangedDate"));
      v96 = 1;
      v177 = 1;
    }
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("puzzleNotificationsEnabled2"));
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("puzzleNotificationsEnabled2"));
  v98 = objc_claimAutoreleasedReturnValue();
  v99 = (void *)v98;
  if (v97 && !v98
    || v97
    && (v100 = objc_msgSend(v97, "BOOLValue"), ((v100 ^ objc_msgSend(v99, "BOOLValue")) & v96) == 1))
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v97, CFSTR("puzzleNotificationsEnabled2"));
    v177 = 1;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("puzzleStatsStartDate"));
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("puzzleStatsStartDate"));
  v102 = objc_claimAutoreleasedReturnValue();
  v103 = (void *)v102;
  if (v101 && (!v102 || objc_msgSend(v101, "compare:", v102) == -1))
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v101, CFSTR("puzzleStatsStartDate"));
    v177 = 1;
  }

  return v177;
}

@end

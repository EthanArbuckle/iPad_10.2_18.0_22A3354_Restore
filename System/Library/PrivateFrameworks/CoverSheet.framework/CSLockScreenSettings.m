@implementation CSLockScreenSettings

- (void)setDefaultValues
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  double v11;
  void *v12;
  uint64_t v13;
  double v14;

  -[CSLockScreenPasscodeSettings setDefaultValues](self->_passcodeSettings, "setDefaultValues");
  -[CSLockScreenChargingSettings setDefaultValues](self->_chargingSettings, "setDefaultValues");
  -[CSFocusSettings setDefaultValues](self->_focusSettings, "setDefaultValues");
  -[CSLookSettings setDefaultValues](self->_lookSettings, "setDefaultValues");
  -[CSVibrancySettings setDefaultValues](self->_vibrancySettings, "setDefaultValues");
  self->_showRawErrorCodes = 0;
  self->_showNowPlaying = 0;
  self->_autoDismissUnlockedLockScreen = 0;
  self->_alwaysEnableUserRequestedErase = 0;
  -[CSBounceSettings setDefaultValues](self->_horizontalBounceSettings, "setDefaultValues");
  -[CSBounceSettings setMultiplier:](self->_horizontalBounceSettings, "setMultiplier:", 0.5);
  -[CSBounceSettings setDefaultValues](self->_verticalBounceSettings, "setDefaultValues");
  -[CSLockScreenMesaSettings setDefaultValues](self->_mesaSettings, "setDefaultValues");
  -[CSLockScreenPearlSettings setDefaultValues](self->_pearlSettings, "setDefaultValues");
  -[CSCoverSheetTransitionsSettings setDefaultValues](self->_coverSheetTransitionsSettings, "setDefaultValues");
  -[CSHorizontalScrollFailureRecognizerSettings setDefaultValues](self->_horizontalScrollFailureRecognizerSettings, "setDefaultValues");
  -[CSDashBoardScrollModifierSettings setDefaultValues](self->_dashBoardScrollModifierSettings, "setDefaultValues");
  -[CSCoverSheetDismissGestureSettings setDefaultValues](self->_coverSheetDismissGestureSettings, "setDefaultValues");
  -[CSDashBoardNotificationVersusPagingScrollSettings setDefaultValues](self->_dashBoardNotificationScrollSettings, "setDefaultValues");
  -[CSLockScreenIdleTimerSettings setDefaultValues](self->_idleTimerSettings, "setDefaultValues");
  -[CSCameraExtensionSettings setDefaultValues](self->_cameraExtensionSettings, "setDefaultValues");
  -[SBFAnimationSettings setDefaultValues](self->_unlockToPhoneWallpaperOutSettings, "setDefaultValues");
  -[SBFAnimationSettings setDuration:](self->_unlockToPhoneWallpaperOutSettings, "setDuration:", 0.35);
  -[SBFAnimationSettings setCurve:](self->_unlockToPhoneWallpaperOutSettings, "setCurve:", 393216);
  -[SBFAnimationSettings controlPoint1Settings](self->_unlockToPhoneWallpaperOutSettings, "controlPoint1Settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPointValue:", 0.6, 0.0);

  -[SBFAnimationSettings controlPoint2Settings](self->_unlockToPhoneWallpaperOutSettings, "controlPoint2Settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPointValue:", 1.0, 0.4);

  -[SBFAnimationSettings setDefaultValues](self->_unlockToPhoneWallpaperInSettings, "setDefaultValues");
  -[SBFAnimationSettings setDuration:](self->_unlockToPhoneWallpaperInSettings, "setDuration:", 0.35);
  -[SBFAnimationSettings setCurve:](self->_unlockToPhoneWallpaperInSettings, "setCurve:", 393216);
  -[SBFAnimationSettings controlPoint1Settings](self->_unlockToPhoneWallpaperOutSettings, "controlPoint1Settings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPointValue:", 0.0, 0.6);

  -[SBFAnimationSettings controlPoint2Settings](self->_unlockToPhoneWallpaperOutSettings, "controlPoint2Settings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPointValue:", 0.4, 1.0);

  -[SBFAnimationSettings setDefaultValues](self->_unlockWallpaperOutSettings, "setDefaultValues");
  -[SBFAnimationSettings setDuration:](self->_unlockWallpaperOutSettings, "setDuration:", 0.25);
  -[SBFAnimationSettings setCurve:](self->_unlockWallpaperOutSettings, "setCurve:", 393216);
  -[SBFAnimationSettings controlPoint1Settings](self->_unlockWallpaperOutSettings, "controlPoint1Settings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPointValue:", 0.0, 1.0);

  -[SBFAnimationSettings controlPoint2Settings](self->_unlockWallpaperOutSettings, "controlPoint2Settings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPointValue:", 0.0, 1.0);

  -[SBFAnimationSettings setDefaultValues](self->_unlockWallpaperInSettings, "setDefaultValues");
  -[SBFAnimationSettings setAnimationType:](self->_unlockWallpaperInSettings, "setAnimationType:", 1);
  -[SBFAnimationSettings setMass:](self->_unlockWallpaperInSettings, "setMass:", 15.0);
  -[SBFAnimationSettings setStiffness:](self->_unlockWallpaperInSettings, "setStiffness:", 600.0);
  -[SBFAnimationSettings setDamping:](self->_unlockWallpaperInSettings, "setDamping:", 700.0);
  self->_appGrabberSlideUpVelocityThreshold = 450.0;
  self->_nowPlayingHeightCompact = 282.0;
  self->_nowPlayingHeightExpanded = 336.0;
  if (__sb__runningInSpringBoard())
  {
    *(_QWORD *)&self->_mainToCameraViewSlideCompletionPercentage = qword_1D048F810[SBFEffectiveDeviceClass() == 2];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&self->_mainToCameraViewSlideCompletionPercentage = qword_1D048F810[objc_msgSend(v9, "userInterfaceIdiom") == 1];

  }
  if (__sb__runningInSpringBoard())
  {
    v10 = SBFEffectiveDeviceClass();
    v11 = 0.333;
    if (v10 == 2)
      v11 = 0.25;
    self->_mainToTodayViewSlideCompletionPercentage = v11;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "userInterfaceIdiom");
    v14 = 0.333;
    if (v13 == 1)
      v14 = 0.25;
    self->_mainToTodayViewSlideCompletionPercentage = v14;

  }
  self->_unlockSwipeWallpaperAlpha = 0.5;
  self->_alwaysPutPluginsBelowScrollView = 0;
  self->_killsInsecureDrawingApps = 1;
  self->_unlockPasscodeThreshold = 93.0;
  self->_unlockPasscodeThresholdForExternalDisplay = 93.0;
  self->_unlockRubberBandThreshold = 93.0;
  self->_unlockRubberBandFeedbackInterval = 0.1;
  self->_unlockRubberBandFeedbackIntensity = 2;
  self->_prewarmsCameraHardwareOnSwipe = 1;
  self->_prewarmsCameraHardwareOnTap = 1;
  self->_prelaunchesCameraAppOnSwipe = 1;
  self->_prelaunchesCameraAppOnTap = 1;
  self->_cameraPrewarmThresholdOnSwipe = 0.05;
  self->_cameraPrelaunchThresholdOnSwipe = 0.05;
  self->_cameraPrewarmDebounceTimeInterval = 1.5;
  self->_cameraPrewarmAutoCancelTimeInterval = 2.0;
  self->_lockJiggleHapticDelay = 0.0;
  self->_lockJiggleAnimationDelay = 0.0;
}

+ (id)settingsControllerModule
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
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  uint64_t v103;
  void *v104;
  void *v105;
  id v107;
  id v108;
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
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  _QWORD v183[30];
  _QWORD v184[2];
  void *v185;
  void *v186;
  _QWORD v187[2];
  void *v188;
  _QWORD v189[5];
  void *v190;
  void *v191;
  void *v192;
  _QWORD v193[7];
  void *v194;
  _QWORD v195[2];
  void *v196;
  void *v197;
  _QWORD v198[2];
  _QWORD v199[3];
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  _QWORD v206[2];
  _QWORD v207[6];
  _QWORD v208[13];
  _QWORD v209[3];

  v209[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show Raw Error Codes"), CFSTR("showRawErrorCodes"));
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0D83078];
  v209[0] = v153;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v209, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:title:", v3, CFSTR("Phone Unlock with Watch"));
  v179 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Auto Dismiss Unlocked LockScreen"), CFSTR("autoDismissUnlockedLockScreen"));
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show Now Playing"), CFSTR("showNowPlaying"));
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D830F8], "row");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueKeyPath:", CFSTR("nowPlayingHeightCompact"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "minValue:maxValue:", 110.0, 520.0);
  v180 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F8], "row");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueKeyPath:", CFSTR("nowPlayingHeightExpanded"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "minValue:maxValue:", 110.0, 520.0);
  v152 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show User Picture"), CFSTR("showUserPicture"));
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show Logout Button"), CFSTR("showLogoutButton"));
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show Thermal Trap"), CFSTR("showThermalTrap"));
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show Blocked UI"), CFSTR("showBlockedUI"));
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show Reset/Restore"), CFSTR("showResetRestore"));
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show Emergency Dialer"), CFSTR("showEmergencyDialer"));
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show Regions Debug"), CFSTR("showRegionsDebugView"));
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Always Enable User Requested Erase"), CFSTR("alwaysEnableUserRequestedErase"));
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83010], "rowWithTitle:outletKeyPath:", CFSTR("Add Notification"), CFSTR("addNotificationOutlet"));
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0D83078];
  v208[0] = v182;
  v208[1] = v181;
  v208[2] = v180;
  v208[3] = v152;
  v208[4] = v151;
  v208[5] = v150;
  v208[6] = v149;
  v208[7] = v148;
  v208[8] = v147;
  v208[9] = v146;
  v208[10] = v145;
  v208[11] = v144;
  v208[12] = v143;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v208, 13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sectionWithRows:title:", v9, CFSTR("Modern Lockscreen"));
  v178 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Prewarms on Swipe"), CFSTR("prewarmsCameraHardwareOnSwipe"));
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Prewarms on Button"), CFSTR("prewarmsCameraHardwareOnTap"));
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Prelaunches on Swipe"), CFSTR("prelaunchesCameraAppOnSwipe"));
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Prelaunches on Button"), CFSTR("prelaunchesCameraAppOnTap"));
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Camera Prewarm Backoff"), CFSTR("cameraPrewarmDebounceTimeInterval"));
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Camera Prewarm Backoff"), CFSTR("cameraPrewarmAutoCancelTimeInterval"));
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0D83078];
  v207[0] = v142;
  v207[1] = v141;
  v207[2] = v140;
  v207[3] = v139;
  v207[4] = v138;
  v207[5] = v137;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v207, 6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sectionWithRows:title:", v11, CFSTR("Prewarm/Prelaunch"));
  v177 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Prewarm Threshold"), CFSTR("cameraPrewarmThresholdOnSwipe"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "minValue:maxValue:", 0.0, 1.0);
  v136 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Prelaunch Threshold"), CFSTR("cameraPrelaunchThresholdOnSwipe"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "minValue:maxValue:", 0.0, 1.0);
  v135 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0D83078];
  v206[0] = v136;
  v206[1] = v135;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v206, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sectionWithRows:title:", v15, CFSTR("Prewarm/Prelaunch Thresholds"));
  v175 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("CoverSheet Transitions"), CFSTR("coverSheetTransitionsSettings"));
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1E0D83078];
  v205 = v134;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v205, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sectionWithRows:", v17);
  v176 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Custom Time Looks"), CFSTR("lookSettings"));
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x1E0D83078];
  v204 = v133;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v204, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sectionWithRows:", v19);
  v174 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Passcode Settings"), CFSTR("passcodeSettings"));
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)MEMORY[0x1E0D83078];
  v203 = v132;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v203, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "sectionWithRows:", v21);
  v173 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Charging Settings"), CFSTR("chargingSettings"));
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)MEMORY[0x1E0D83078];
  v202 = v131;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v202, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "sectionWithRows:", v23);
  v172 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Focus Settings"), CFSTR("focusSettings"));
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)MEMORY[0x1E0D83078];
  v201 = v130;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v201, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "sectionWithRows:", v25);
  v171 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Vibrancy Settings"), CFSTR("vibrancySettings"));
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)MEMORY[0x1E0D83078];
  v200 = v129;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v200, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "sectionWithRows:", v27);
  v170 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Slide To Unlock Failure Recognizer"), CFSTR("horizontalScrollFailureRecognizerSettings"));
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("DashBoard Scroll Modifier"), CFSTR("dashBoardScrollModifierSettings"));
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Notification Paging"), CFSTR("dashBoardNotificationScrollSettings"));
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)MEMORY[0x1E0D83078];
  v199[0] = v128;
  v199[1] = v127;
  v199[2] = v126;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v199, 3);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "sectionWithRows:", v29);
  v169 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Quick Actions"), CFSTR("dashBoardQuickActionButtonSettings"));
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Remote Content"), CFSTR("dashBoardRemoteContentSettings"));
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)MEMORY[0x1E0D83078];
  v198[0] = v125;
  v198[1] = v124;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v198, 2);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "sectionWithRows:", v31);
  v168 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Idle Timer"), CFSTR("idleTimerSettings"));
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)MEMORY[0x1E0D83078];
  v197 = v123;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v197, 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "sectionWithRows:", v33);
  v167 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Camera Extension Settings"), CFSTR("cameraExtensionSettings"));
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)MEMORY[0x1E0D83078];
  v196 = v122;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v196, 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "sectionWithRows:", v35);
  v166 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Mesa Settings"), CFSTR("mesaSettings"));
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Pearl Settings"), CFSTR("pearlSettings"));
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)MEMORY[0x1E0D83078];
  v195[0] = v121;
  v195[1] = v120;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v195, 2);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "sectionWithRows:", v37);
  v165 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Dismiss Gesture"), CFSTR("coverSheetDismissGestureSettings"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v194 = v39;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v194, 1);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "sectionWithRows:", v40);
  v164 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Gravity"), CFSTR("verticalBounceSettings.gravity"));
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v162, "minValue:maxValue:", 0.0, 6.0);
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  v193[0] = v160;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Elasticity"), CFSTR("verticalBounceSettings.elasticity"));
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v158, "minValue:maxValue:", 0.0, 1.0);
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  v193[1] = v156;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Friction"), CFSTR("verticalBounceSettings.friction"));
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v154, "minValue:maxValue:", 0.0, 1.0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v193[2] = v41;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Velocity"), CFSTR("verticalBounceSettings.velocity"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "minValue:maxValue:", 0.0, 1000.0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v193[3] = v43;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Minimum Velocity To Assist"), CFSTR("verticalBounceSettings.minVelocityToAssist"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "minValue:maxValue:", 500.0, 3000.0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v193[4] = v45;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Maximum Velocity To Assist"), CFSTR("verticalBounceSettings.maxVelocityToAssist"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "minValue:maxValue:", 500.0, 3000.0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v193[5] = v47;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Velocity Assistance Amount"), CFSTR("verticalBounceSettings.maxVelocityAssistance"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "minValue:maxValue:", 0.0, 1500.0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v193[6] = v49;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v193, 7);
  v116 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83078], "sectionWithRows:title:", v116, CFSTR("Camera Bounce Settings"));
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0DA9D80], "_moduleWithSectionTitle:delay:frameRate:", CFSTR("Unlock To Phone Wallpaper Out"), 0, 0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "submoduleWithModule:childSettingsKeyPath:", v51, CFSTR("unlockToPhoneWallpaperOutSettings"));
  v161 = (void *)objc_claimAutoreleasedReturnValue();

  v52 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0DA9D80], "_moduleWithSectionTitle:delay:frameRate:", CFSTR("Unlock To Phone Wallpaper In"), 1, 0);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "submoduleWithModule:childSettingsKeyPath:", v53, CFSTR("unlockToPhoneWallpaperInSettings"));
  v159 = (void *)objc_claimAutoreleasedReturnValue();

  v54 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0DA9D80], "_moduleWithSectionTitle:delay:frameRate:", CFSTR("Unlock Wallpaper Out"), 0, 0);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "submoduleWithModule:childSettingsKeyPath:", v55, CFSTR("unlockWallpaperOutSettings"));
  v157 = (void *)objc_claimAutoreleasedReturnValue();

  v56 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0DA9D80], "_moduleWithSectionTitle:delay:frameRate:", CFSTR("Unlock Wallpaper In"), 1, 0);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "submoduleWithModule:childSettingsKeyPath:", v57, CFSTR("unlockWallpaperInSettings"));
  v155 = (void *)objc_claimAutoreleasedReturnValue();

  v58 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D830F8], "row");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "valueKeyPath:", CFSTR("mainToCameraViewSlideCompletionPercentage"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "minValue:maxValue:", 0.0, 1.0);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v192 = v61;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v192, 1);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "sectionWithRows:title:", v62, CFSTR("Main page to Camera Slide Completion Percentage"));
  v119 = (void *)objc_claimAutoreleasedReturnValue();

  v63 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D830F8], "row");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "valueKeyPath:", CFSTR("mainToTodayViewSlideCompletionPercentage"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "minValue:maxValue:", 0.0, 1.0);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v191 = v66;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v191, 1);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "sectionWithRows:title:", v67, CFSTR("Main page to Today view slide Completion Percentage"));
  v118 = (void *)objc_claimAutoreleasedReturnValue();

  v68 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D830F8], "row");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "valueKeyPath:", CFSTR("unlockSwipeWallpaperAlpha"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "minValue:maxValue:", 0.0, 1.0);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v190 = v71;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v190, 1);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "sectionWithRows:title:", v72, CFSTR("Unlock Swipe Wallpaper Alpha"));
  v115 = (void *)objc_claimAutoreleasedReturnValue();

  v113 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Passcode Threshold"), CFSTR("unlockPasscodeThreshold"));
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "minValue:maxValue:", 0.0, 300.0);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v189[0] = v73;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Passcode ThresholdForExternalDisplay"), CFSTR("unlockPasscodeThresholdForExternalDisplay"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "minValue:maxValue:", 0.0, 300.0);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v189[1] = v75;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Rubber Band Range"), CFSTR("unlockRubberBandThreshold"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "minValue:maxValue:", 0.0, 300.0);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v189[2] = v77;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Haptic Interval"), CFSTR("unlockRubberBandFeedbackInterval"));
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "minValue:maxValue:", 0.0, 0.3);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v189[3] = v79;
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Haptic Intensity"), CFSTR("unlockRubberBandFeedbackIntensity"));
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "possibleValues:titles:", &unk_1E8E89F10, &unk_1E8E89F28);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v189[4] = v81;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v189, 5);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "sectionWithRows:title:", v82, CFSTR("Unlock Swipe Thresholds"));
  v114 = (void *)objc_claimAutoreleasedReturnValue();

  v83 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D830F8], "row");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "valueKeyPath:", CFSTR("appGrabberSlideUpVelocityThreshold"));
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "minValue:maxValue:", 300.0, 2000.0);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v188 = v86;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v188, 1);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "sectionWithRows:title:", v87, CFSTR("App Grabber Slide Up Velocity Threshold"));
  v112 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Always put plugins below scroll view"), CFSTR("alwaysPutPluginsBelowScrollView"));
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v187[0] = v88;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Test Plugin"), CFSTR("testPluginSettings"));
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v187[1] = v89;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v187, 2);
  v90 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83078], "sectionWithRows:title:", v90, CFSTR("Plugins"));
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Kill Insecure Drawing Apps"), CFSTR("killsInsecureDrawingApps"));
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v186 = v91;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v186, 1);
  v92 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83078], "sectionWithRows:title:", v92, CFSTR("Security"));
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "action");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "rowWithTitle:action:", CFSTR("Restore Defaults"), v95);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v185 = v96;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v185, 1);
  v117 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83078], "sectionWithRows:", v117);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Haptic Delay"), CFSTR("lockJiggleHapticDelay"));
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "minValue:maxValue:", 0.0, 0.3);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v184[0] = v99;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Animation Delay"), CFSTR("lockJiggleAnimationDelay"));
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "minValue:maxValue:", 0.0, 0.3);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v184[1] = v101;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v184, 2);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "sectionWithRows:title:", v102, CFSTR("Lock Jiggle Timings"));
  v103 = objc_claimAutoreleasedReturnValue();

  v107 = (id)MEMORY[0x1E0D83078];
  v183[0] = v179;
  v183[1] = v178;
  v183[2] = v176;
  v183[3] = v174;
  v183[4] = v173;
  v183[5] = v170;
  v183[6] = v172;
  v183[7] = v166;
  v183[8] = v171;
  v183[9] = v177;
  v183[10] = v175;
  v183[11] = v169;
  v183[12] = v168;
  v183[13] = v167;
  v183[14] = v165;
  v183[15] = v164;
  v183[16] = v163;
  v183[17] = v161;
  v183[18] = v159;
  v183[19] = v157;
  v183[20] = v155;
  v183[21] = v119;
  v183[22] = v118;
  v183[23] = v115;
  v183[24] = v114;
  v183[25] = v112;
  v183[26] = v103;
  v104 = (void *)v103;
  v183[27] = v110;
  v183[28] = v93;
  v183[29] = v109;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v183, 30);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "moduleWithTitle:contents:", CFSTR("LockScreen Settings"), v105);
  v108 = (id)objc_claimAutoreleasedReturnValue();

  return v108;
}

- (BOOL)showRawErrorCodes
{
  return self->_showRawErrorCodes;
}

- (void)setShowRawErrorCodes:(BOOL)a3
{
  self->_showRawErrorCodes = a3;
}

- (BOOL)autoDismissUnlockedLockScreen
{
  return self->_autoDismissUnlockedLockScreen;
}

- (void)setAutoDismissUnlockedLockScreen:(BOOL)a3
{
  self->_autoDismissUnlockedLockScreen = a3;
}

- (BOOL)showNowPlaying
{
  return self->_showNowPlaying;
}

- (void)setShowNowPlaying:(BOOL)a3
{
  self->_showNowPlaying = a3;
}

- (BOOL)showUserPicture
{
  return self->_showUserPicture;
}

- (void)setShowUserPicture:(BOOL)a3
{
  self->_showUserPicture = a3;
}

- (BOOL)showLogoutButton
{
  return self->_showLogoutButton;
}

- (void)setShowLogoutButton:(BOOL)a3
{
  self->_showLogoutButton = a3;
}

- (BOOL)showThermalTrap
{
  return self->_showThermalTrap;
}

- (void)setShowThermalTrap:(BOOL)a3
{
  self->_showThermalTrap = a3;
}

- (BOOL)showBlockedUI
{
  return self->_showBlockedUI;
}

- (void)setShowBlockedUI:(BOOL)a3
{
  self->_showBlockedUI = a3;
}

- (BOOL)showResetRestore
{
  return self->_showResetRestore;
}

- (void)setShowResetRestore:(BOOL)a3
{
  self->_showResetRestore = a3;
}

- (BOOL)showEmergencyDialer
{
  return self->_showEmergencyDialer;
}

- (void)setShowEmergencyDialer:(BOOL)a3
{
  self->_showEmergencyDialer = a3;
}

- (BOOL)showRegionsDebugView
{
  return self->_showRegionsDebugView;
}

- (void)setShowRegionsDebugView:(BOOL)a3
{
  self->_showRegionsDebugView = a3;
}

- (BOOL)alwaysEnableUserRequestedErase
{
  return self->_alwaysEnableUserRequestedErase;
}

- (void)setAlwaysEnableUserRequestedErase:(BOOL)a3
{
  self->_alwaysEnableUserRequestedErase = a3;
}

- (PTOutlet)addNotificationOutlet
{
  return (PTOutlet *)objc_getProperty(self, a2, 72, 1);
}

- (void)setAddNotificationOutlet:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (CSBounceSettings)verticalBounceSettings
{
  return (CSBounceSettings *)objc_getProperty(self, a2, 80, 1);
}

- (void)setVerticalBounceSettings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (CSBounceSettings)horizontalBounceSettings
{
  return (CSBounceSettings *)objc_getProperty(self, a2, 88, 1);
}

- (void)setHorizontalBounceSettings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (CSLockScreenPasscodeSettings)passcodeSettings
{
  return (CSLockScreenPasscodeSettings *)objc_getProperty(self, a2, 96, 1);
}

- (void)setPasscodeSettings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (CSLockScreenChargingSettings)chargingSettings
{
  return (CSLockScreenChargingSettings *)objc_getProperty(self, a2, 104, 1);
}

- (void)setChargingSettings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (CSFocusSettings)focusSettings
{
  return (CSFocusSettings *)objc_getProperty(self, a2, 112, 1);
}

- (void)setFocusSettings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (CSLockScreenMesaSettings)mesaSettings
{
  return (CSLockScreenMesaSettings *)objc_getProperty(self, a2, 120, 1);
}

- (void)setMesaSettings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (CSLockScreenPearlSettings)pearlSettings
{
  return (CSLockScreenPearlSettings *)objc_getProperty(self, a2, 128, 1);
}

- (void)setPearlSettings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (CSLookSettings)lookSettings
{
  return (CSLookSettings *)objc_getProperty(self, a2, 136, 1);
}

- (void)setLookSettings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (CSCoverSheetTransitionsSettings)coverSheetTransitionsSettings
{
  return (CSCoverSheetTransitionsSettings *)objc_getProperty(self, a2, 144, 1);
}

- (void)setCoverSheetTransitionsSettings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (CSHorizontalScrollFailureRecognizerSettings)horizontalScrollFailureRecognizerSettings
{
  return (CSHorizontalScrollFailureRecognizerSettings *)objc_getProperty(self, a2, 152, 1);
}

- (void)setHorizontalScrollFailureRecognizerSettings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (CSDashBoardScrollModifierSettings)dashBoardScrollModifierSettings
{
  return (CSDashBoardScrollModifierSettings *)objc_getProperty(self, a2, 160, 1);
}

- (void)setDashBoardScrollModifierSettings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (CSDashBoardNotificationVersusPagingScrollSettings)dashBoardNotificationScrollSettings
{
  return (CSDashBoardNotificationVersusPagingScrollSettings *)objc_getProperty(self, a2, 168, 1);
}

- (void)setDashBoardNotificationScrollSettings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (CSDashBoardQuickActionsButtonSettings)dashBoardQuickActionButtonSettings
{
  return (CSDashBoardQuickActionsButtonSettings *)objc_getProperty(self, a2, 176, 1);
}

- (void)setDashBoardQuickActionButtonSettings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (CSDashBoardRemoteContentSettings)dashBoardRemoteContentSettings
{
  return (CSDashBoardRemoteContentSettings *)objc_getProperty(self, a2, 184, 1);
}

- (void)setDashBoardRemoteContentSettings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (CSCoverSheetDismissGestureSettings)coverSheetDismissGestureSettings
{
  return (CSCoverSheetDismissGestureSettings *)objc_getProperty(self, a2, 192, 1);
}

- (void)setCoverSheetDismissGestureSettings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (CSLockScreenIdleTimerSettings)idleTimerSettings
{
  return (CSLockScreenIdleTimerSettings *)objc_getProperty(self, a2, 200, 1);
}

- (void)setIdleTimerSettings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (CSVibrancySettings)vibrancySettings
{
  return (CSVibrancySettings *)objc_getProperty(self, a2, 208, 1);
}

- (void)setVibrancySettings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (CSCameraExtensionSettings)cameraExtensionSettings
{
  return (CSCameraExtensionSettings *)objc_getProperty(self, a2, 216, 1);
}

- (void)setCameraExtensionSettings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 216);
}

- (SBFAnimationSettings)unlockToPhoneWallpaperOutSettings
{
  return (SBFAnimationSettings *)objc_getProperty(self, a2, 224, 1);
}

- (void)setUnlockToPhoneWallpaperOutSettings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 224);
}

- (SBFAnimationSettings)unlockToPhoneWallpaperInSettings
{
  return (SBFAnimationSettings *)objc_getProperty(self, a2, 232, 1);
}

- (void)setUnlockToPhoneWallpaperInSettings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 232);
}

- (SBFAnimationSettings)unlockWallpaperOutSettings
{
  return (SBFAnimationSettings *)objc_getProperty(self, a2, 240, 1);
}

- (void)setUnlockWallpaperOutSettings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 240);
}

- (SBFAnimationSettings)unlockWallpaperInSettings
{
  return (SBFAnimationSettings *)objc_getProperty(self, a2, 248, 1);
}

- (void)setUnlockWallpaperInSettings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 248);
}

- (CSLockScreenTestPluginSettings)testPluginSettings
{
  return (CSLockScreenTestPluginSettings *)objc_getProperty(self, a2, 256, 1);
}

- (void)setTestPluginSettings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 256);
}

- (double)nowPlayingHeightCompact
{
  return self->_nowPlayingHeightCompact;
}

- (void)setNowPlayingHeightCompact:(double)a3
{
  self->_nowPlayingHeightCompact = a3;
}

- (double)nowPlayingHeightExpanded
{
  return self->_nowPlayingHeightExpanded;
}

- (void)setNowPlayingHeightExpanded:(double)a3
{
  self->_nowPlayingHeightExpanded = a3;
}

- (double)mainToCameraViewSlideCompletionPercentage
{
  return self->_mainToCameraViewSlideCompletionPercentage;
}

- (void)setMainToCameraViewSlideCompletionPercentage:(double)a3
{
  self->_mainToCameraViewSlideCompletionPercentage = a3;
}

- (double)mainToTodayViewSlideCompletionPercentage
{
  return self->_mainToTodayViewSlideCompletionPercentage;
}

- (void)setMainToTodayViewSlideCompletionPercentage:(double)a3
{
  self->_mainToTodayViewSlideCompletionPercentage = a3;
}

- (double)appGrabberSlideUpVelocityThreshold
{
  return self->_appGrabberSlideUpVelocityThreshold;
}

- (void)setAppGrabberSlideUpVelocityThreshold:(double)a3
{
  self->_appGrabberSlideUpVelocityThreshold = a3;
}

- (double)unlockPasscodeThreshold
{
  return self->_unlockPasscodeThreshold;
}

- (void)setUnlockPasscodeThreshold:(double)a3
{
  self->_unlockPasscodeThreshold = a3;
}

- (double)unlockPasscodeThresholdForExternalDisplay
{
  return self->_unlockPasscodeThresholdForExternalDisplay;
}

- (void)setUnlockPasscodeThresholdForExternalDisplay:(double)a3
{
  self->_unlockPasscodeThresholdForExternalDisplay = a3;
}

- (double)unlockRubberBandThreshold
{
  return self->_unlockRubberBandThreshold;
}

- (void)setUnlockRubberBandThreshold:(double)a3
{
  self->_unlockRubberBandThreshold = a3;
}

- (double)unlockRubberBandFeedbackInterval
{
  return self->_unlockRubberBandFeedbackInterval;
}

- (void)setUnlockRubberBandFeedbackInterval:(double)a3
{
  self->_unlockRubberBandFeedbackInterval = a3;
}

- (int64_t)unlockRubberBandFeedbackIntensity
{
  return self->_unlockRubberBandFeedbackIntensity;
}

- (void)setUnlockRubberBandFeedbackIntensity:(int64_t)a3
{
  self->_unlockRubberBandFeedbackIntensity = a3;
}

- (double)lockJiggleHapticDelay
{
  return self->_lockJiggleHapticDelay;
}

- (void)setLockJiggleHapticDelay:(double)a3
{
  self->_lockJiggleHapticDelay = a3;
}

- (double)lockJiggleAnimationDelay
{
  return self->_lockJiggleAnimationDelay;
}

- (void)setLockJiggleAnimationDelay:(double)a3
{
  self->_lockJiggleAnimationDelay = a3;
}

- (double)unlockSwipeWallpaperAlpha
{
  return self->_unlockSwipeWallpaperAlpha;
}

- (void)setUnlockSwipeWallpaperAlpha:(double)a3
{
  self->_unlockSwipeWallpaperAlpha = a3;
}

- (BOOL)alwaysPutPluginsBelowScrollView
{
  return self->_alwaysPutPluginsBelowScrollView;
}

- (void)setAlwaysPutPluginsBelowScrollView:(BOOL)a3
{
  self->_alwaysPutPluginsBelowScrollView = a3;
}

- (BOOL)killsInsecureDrawingApps
{
  return self->_killsInsecureDrawingApps;
}

- (void)setKillsInsecureDrawingApps:(BOOL)a3
{
  self->_killsInsecureDrawingApps = a3;
}

- (BOOL)prewarmsCameraHardwareOnSwipe
{
  return self->_prewarmsCameraHardwareOnSwipe;
}

- (void)setPrewarmsCameraHardwareOnSwipe:(BOOL)a3
{
  self->_prewarmsCameraHardwareOnSwipe = a3;
}

- (BOOL)prewarmsCameraHardwareOnTap
{
  return self->_prewarmsCameraHardwareOnTap;
}

- (void)setPrewarmsCameraHardwareOnTap:(BOOL)a3
{
  self->_prewarmsCameraHardwareOnTap = a3;
}

- (BOOL)prelaunchesCameraAppOnSwipe
{
  return self->_prelaunchesCameraAppOnSwipe;
}

- (void)setPrelaunchesCameraAppOnSwipe:(BOOL)a3
{
  self->_prelaunchesCameraAppOnSwipe = a3;
}

- (BOOL)prelaunchesCameraAppOnTap
{
  return self->_prelaunchesCameraAppOnTap;
}

- (void)setPrelaunchesCameraAppOnTap:(BOOL)a3
{
  self->_prelaunchesCameraAppOnTap = a3;
}

- (double)cameraPrewarmThresholdOnSwipe
{
  return self->_cameraPrewarmThresholdOnSwipe;
}

- (void)setCameraPrewarmThresholdOnSwipe:(double)a3
{
  self->_cameraPrewarmThresholdOnSwipe = a3;
}

- (double)cameraPrelaunchThresholdOnSwipe
{
  return self->_cameraPrelaunchThresholdOnSwipe;
}

- (void)setCameraPrelaunchThresholdOnSwipe:(double)a3
{
  self->_cameraPrelaunchThresholdOnSwipe = a3;
}

- (double)cameraPrewarmDebounceTimeInterval
{
  return self->_cameraPrewarmDebounceTimeInterval;
}

- (void)setCameraPrewarmDebounceTimeInterval:(double)a3
{
  self->_cameraPrewarmDebounceTimeInterval = a3;
}

- (double)cameraPrewarmAutoCancelTimeInterval
{
  return self->_cameraPrewarmAutoCancelTimeInterval;
}

- (void)setCameraPrewarmAutoCancelTimeInterval:(double)a3
{
  self->_cameraPrewarmAutoCancelTimeInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testPluginSettings, 0);
  objc_storeStrong((id *)&self->_unlockWallpaperInSettings, 0);
  objc_storeStrong((id *)&self->_unlockWallpaperOutSettings, 0);
  objc_storeStrong((id *)&self->_unlockToPhoneWallpaperInSettings, 0);
  objc_storeStrong((id *)&self->_unlockToPhoneWallpaperOutSettings, 0);
  objc_storeStrong((id *)&self->_cameraExtensionSettings, 0);
  objc_storeStrong((id *)&self->_vibrancySettings, 0);
  objc_storeStrong((id *)&self->_idleTimerSettings, 0);
  objc_storeStrong((id *)&self->_coverSheetDismissGestureSettings, 0);
  objc_storeStrong((id *)&self->_dashBoardRemoteContentSettings, 0);
  objc_storeStrong((id *)&self->_dashBoardQuickActionButtonSettings, 0);
  objc_storeStrong((id *)&self->_dashBoardNotificationScrollSettings, 0);
  objc_storeStrong((id *)&self->_dashBoardScrollModifierSettings, 0);
  objc_storeStrong((id *)&self->_horizontalScrollFailureRecognizerSettings, 0);
  objc_storeStrong((id *)&self->_coverSheetTransitionsSettings, 0);
  objc_storeStrong((id *)&self->_lookSettings, 0);
  objc_storeStrong((id *)&self->_pearlSettings, 0);
  objc_storeStrong((id *)&self->_mesaSettings, 0);
  objc_storeStrong((id *)&self->_focusSettings, 0);
  objc_storeStrong((id *)&self->_chargingSettings, 0);
  objc_storeStrong((id *)&self->_passcodeSettings, 0);
  objc_storeStrong((id *)&self->_horizontalBounceSettings, 0);
  objc_storeStrong((id *)&self->_verticalBounceSettings, 0);
  objc_storeStrong((id *)&self->_addNotificationOutlet, 0);
}

@end

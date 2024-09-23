@implementation ASVSettings

- (ASVSettings)init
{
  ASVSettings *v2;
  void *v3;
  double v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  double v26;
  void *v27;
  double v28;
  void *v29;
  double v30;
  void *v31;
  double v32;
  void *v33;
  double v34;
  void *v35;
  double v36;
  void *v37;
  double v38;
  void *v39;
  double v40;
  void *v41;
  double v42;
  void *v43;
  double v44;
  void *v45;
  double v46;
  void *v47;
  double v48;
  void *v49;
  double v50;
  void *v51;
  double v52;
  void *v53;
  double v54;
  void *v55;
  double v56;
  void *v57;
  double v58;
  void *v59;
  double v60;
  void *v61;
  double v62;
  void *v63;
  double v64;
  void *v65;
  double v66;
  void *v67;
  double v68;
  void *v69;
  double v70;
  void *v71;
  double v72;
  void *v73;
  double v74;
  void *v75;
  double v76;
  void *v77;
  double v78;
  void *v79;
  double v80;
  void *v81;
  double v82;
  void *v83;
  double v84;
  void *v85;
  double v86;
  void *v87;
  double v88;
  void *v89;
  double v90;
  void *v91;
  double v92;
  void *v93;
  void *v94;
  double v95;
  void *v96;
  double v97;
  void *v98;
  double v99;
  void *v100;
  double v101;
  void *v102;
  void *v103;
  double v104;
  void *v105;
  double v106;
  void *v107;
  void *v108;
  double v109;
  void *v110;
  double v111;
  void *v112;
  double v113;
  void *v114;
  void *v115;
  double v116;
  void *v117;
  double v118;
  void *v119;
  void *v120;
  void *v121;
  double v122;
  void *v123;
  double v124;
  void *v125;
  double v126;
  void *v127;
  double v128;
  void *v129;
  double v130;
  void *v131;
  double v132;
  void *v133;
  double v134;
  void *v135;
  void *v136;
  double v137;
  void *v138;
  double v139;
  void *v140;
  double v141;
  void *v142;
  double v143;
  void *v144;
  double v145;
  void *v146;
  double v147;
  void *v148;
  double v149;
  void *v150;
  double v151;
  void *v152;
  double v153;
  void *v154;
  double v155;
  void *v156;
  double v157;
  void *v158;
  double v159;
  void *v160;
  double v161;
  void *v162;
  double v163;
  void *v164;
  double v165;
  void *v166;
  double v167;
  void *v168;
  double v169;
  void *v170;
  double v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  double v176;
  void *v177;
  double v178;
  void *v179;
  double v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  uint64_t v187;
  NSDictionary *settings;
  uint8_t v190[16];
  objc_super v191;

  v191.receiver = self;
  v191.super_class = (Class)ASVSettings;
  v2 = -[ASVSettings init](&v191, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v190 = 0;
      _os_log_impl(&dword_1D93A7000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "ASVSettingsVersion: 1", v190, 2u);
    }
    LODWORD(v4) = 2.75;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("ASVSettingObjectInitialDistanceFromCamera"));

    LODWORD(v6) = 1051900098;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("ASVSettingObjectInitialPitch"));

    LODWORD(v8) = 0.75;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("ASVSettingTapTimeThreshold"));

    LODWORD(v10) = 1110704128;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("ASVSettingTapMovementThreshold"));

    LODWORD(v12) = 1051931443;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("ASVSettingTapDoubleTimeThreshold"));

    LODWORD(v14) = 1110704128;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("ASVSettingTapDoubleMovementThreshold"));

    LODWORD(v16) = 1045854032;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("ASVSettingRotationThreshold"));

    LODWORD(v18) = 1050728828;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("ASVSettingRotationThresholdHarder"));

    LODWORD(v20) = 5.0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("ASVSettingScaleOvershoot"));

    LODWORD(v22) = 1050253722;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("ASVSettingScaleRubberBandFactor"));

    LODWORD(v24) = 1112014848;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("ASVSettingScaleThreshold"));

    LODWORD(v26) = 1119092736;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("ASVSettingScaleThresholdHarder"));

    LODWORD(v28) = 1036831949;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("ASVSettingScaleSnapThreshold"));

    LODWORD(v30) = 0.5;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("ASVSettingScaleSnapFeedbackTimeThreshold"));

    LODWORD(v32) = 1118830592;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("ASVSettingMinimumAssetBoundingRectSizeForTouchDetection"));

    LODWORD(v34) = 30.0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("ASVSettingSingleFingerTranslationThreshold"));

    LODWORD(v36) = 1109393408;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, CFSTR("ASVSettingTwoFingerTranslationThreshold"));

    LODWORD(v38) = 1116471296;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v39, CFSTR("ASVSettingTwoFingerTranslationThresholdHarder"));

    LODWORD(v40) = 1008981770;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v41, CFSTR("ASVSettingMinimumAssetWorldScale"));

    LODWORD(v42) = 10.0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v43, CFSTR("ASVSettingMaximumAssetWorldScale"));

    LODWORD(v44) = 1002740646;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v45, CFSTR("ASVSettingLevitationSnapLowerThreshold"));

    LODWORD(v46) = 1007908028;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v47, CFSTR("ASVSettingLevitationSnapUpperThreshold"));

    LODWORD(v48) = 1028443341;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v49, CFSTR("ASVSettingMinimumVelocityToBeginTranslationDeceleration"));

    LODWORD(v50) = 1065101558;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v51, CFSTR("ASVSettingWorldTranslationDecelerationRate"));

    LODWORD(v52) = 973279855;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v53, CFSTR("ASVSettingMinimumDeltaToEndTranslationDeceleration"));

    LODWORD(v54) = 1050728828;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v55, CFSTR("ASVSettingTurntableSafeZoneAngle"));

    LODWORD(v56) = 10.0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v57, CFSTR("ASVSettingTurntableSingleFingerPanThreshold"));

    LODWORD(v58) = 10.0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v59, CFSTR("ASVSettingTurntableTwoFingerPanThreshold"));

    LODWORD(v60) = 10.0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v61, CFSTR("ASVSettingTurntableMinimumPanMoveDistance"));

    LODWORD(v62) = 20.0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v63, CFSTR("ASVSettingTurntablePitchYawRotationThreshold"));

    LODWORD(v64) = 1112014848;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v65, CFSTR("ASVSettingTurntablePitchYawRotationThresholdHarder"));

    LODWORD(v66) = 1008981770;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v67, CFSTR("ASVSettingTurntableYawRadiansPerPoint"));

    LODWORD(v68) = 2.0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v69, CFSTR("ASVSettingMinimumVelocityToBeginYawSpinDeceleration"));

    LODWORD(v70) = 0.5;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v70);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v71, CFSTR("ASVSettingMinimumVelocityToBeginPitchSpinDeceleration"));

    LODWORD(v72) = 1065151889;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v72);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v73, CFSTR("ASVSettingTurntablePitchSpinDecelerationRate"));

    LODWORD(v74) = 981668463;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v74);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v75, CFSTR("ASVSettingMinimumDeltaToEndSpinDeceleration"));

    LODWORD(v76) = 1065319662;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v76);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v77, CFSTR("ASVSettingTurntableYawSpinDecelerationRate"));

    LODWORD(v78) = 1008981770;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v78);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v79, CFSTR("ASVSettingTurntablePitchRadiansPerPoint"));

    LODWORD(v80) = 1061752795;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v80);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v81, CFSTR("ASVSettingTurntablePitchLimit"));

    LODWORD(v82) = 1061752795;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v82);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v83, CFSTR("ASVSettingTurntablePitchOvershoot"));

    LODWORD(v84) = 1050253722;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v84);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v85, CFSTR("ASVSettingTurntablePitchRubberBandFactor"));

    LODWORD(v86) = 1037465424;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v86);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v87, CFSTR("ASVSettingTurntablePitchDecelerationRubberBandUndershoot"));

    LODWORD(v88) = 981668463;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v88);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v89, CFSTR("ASVSettingMinimumDeltaToEndSnapDeceleration"));

    LODWORD(v90) = 1045220557;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v90);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v91, CFSTR("ASVSettingMinimumAssetTurntableScale"));

    LODWORD(v92) = 5.0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v92);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v93, CFSTR("ASVSettingMaximumAssetTurntableScale"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v94, CFSTR("ASVSettingTurntableDoubleTapResetsAll"));

    LODWORD(v95) = 1050253722;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v95);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v96, CFSTR("ASVSettingTurntableDoubleTapResetAnimationTime"));

    LODWORD(v97) = 6.0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v97);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v98, CFSTR("ASVSettingPercentLozengeSafeZonePadding"));

    LODWORD(v99) = 1060320051;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v99);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v100, CFSTR("ASVSettingPercentLozengeFadeOutDelay"));

    LODWORD(v101) = 1050253722;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v101);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v102, CFSTR("ASVSettingPercentLozengeFadeOutDuration"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v103, CFSTR("ASVSettingEnableEnvmap"));

    LODWORD(v104) = 1.0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v104);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v105, CFSTR("ASVSettingEnvironmentMapUpdateFrequency"));

    LODWORD(v106) = 1.0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v106);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v107, CFSTR("ASVSettingEnvironmentMapExtentScaleFactor"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v108, CFSTR("ASVSettingUseStudioLight"));

    LODWORD(v109) = 1.0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v109);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v110, CFSTR("ASVSettingEnvmapIntensity"));

    LODWORD(v111) = 0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v111);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v112, CFSTR("ASVSettingStudioLightIntensity"));

    LODWORD(v113) = 1.0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v113);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v114, CFSTR("ASVSetting3DAmbientIntensity"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v115, CFSTR("ASVSettingEnableEnvmapDebug"));

    LODWORD(v116) = 0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v116);
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v117, CFSTR("ASVSettingEnvmapDebugRoughness"));

    LODWORD(v118) = 1.0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v118);
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v119, CFSTR("ASVSettingEnvmapDebugMetallic"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v120, CFSTR("ASVSettingEnableMSAA4x"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v121, CFSTR("ASVSettingShowGraphicsStats"));

    LODWORD(v122) = 1050253722;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v122);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v123, CFSTR("ASVSettingShadowFadeInTime"));

    LODWORD(v124) = 1061997773;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v124);
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v125, CFSTR("ASVSettingProjectionShadowScale"));

    LODWORD(v126) = 1.0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v126);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v127, CFSTR("ASVSettingRaytracedShadowPower"));

    LODWORD(v128) = 1.0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v128);
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v129, CFSTR("ASVSettingRaytracedShadowScale"));

    LODWORD(v130) = 1131413504;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v130);
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v131, CFSTR("ASVSettingStatusLabelContainerWidth"));

    LODWORD(v132) = 1114636288;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v132);
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v133, CFSTR("ASVSettingStatusLabelContainerHeight"));

    LODWORD(v134) = 8.0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v134);
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v135, CFSTR("ASVSettingStatusLabelContainerPaddingFromTopControls"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v136, CFSTR("ASVSettingCreateDebugPlaneManager"));

    LODWORD(v137) = 1114636288;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v137);
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v138, CFSTR("ASVSettingHitTestClusterSizeForPlacement"));

    LODWORD(v139) = 1036831949;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v139);
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v140, CFSTR("ASVSettingPlacementClusterCylinderHeight"));

    LODWORD(v141) = 1050253722;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v141);
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v142, CFSTR("ASVSettingPlacementClusterCylinderDiameter"));

    LODWORD(v143) = 5.0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v143);
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v144, CFSTR("ASVSettingDelayBeforePlacingObjectInWorldWithoutClustering"));

    LODWORD(v145) = 30.0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v145);
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v146, CFSTR("ASVSettingHitTestClusterSizeForMovement"));

    LODWORD(v147) = 1045220557;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v147);
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v148, CFSTR("ASVSettingMovementClusterChainHeight"));

    LODWORD(v149) = 1045220557;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v149);
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v150, CFSTR("ASVSettingMovementClusterChainLinkDistance"));

    LODWORD(v151) = 10.0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v151);
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v152, CFSTR("ASVSettingInterpolationPlaneChangeDecisionCount"));

    LODWORD(v153) = 1028443341;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v153);
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v154, CFSTR("ASVSettingInterpolationPlaneChangeMinimumSeparationDistance"));

    LODWORD(v155) = 1050253722;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v155);
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v156, CFSTR("ASVSettingMinimumEstimatedHitPointDistanceFromCamera"));

    LODWORD(v157) = 2.0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v157);
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v158, CFSTR("ASVSettingMaximumDistanceFromCameraForAssetPlacement"));

    LODWORD(v159) = 10.0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v159);
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v160, CFSTR("ASVSettingMaximumDistanceFromCameraForAssetTranslation"));

    LODWORD(v161) = 1036831949;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v161);
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v162, CFSTR("ASVSettingMoveOnToPlaneExtentTolerance"));

    LODWORD(v163) = 981668463;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v163);
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v164, CFSTR("ASVSettingMoveOnToPlaneMinimumDistanceToBeginMove"));

    LODWORD(v165) = 1028443341;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v165);
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v166, CFSTR("ASVSettingMoveOnToPlaneMaximumDistanceToBeginMove"));

    LODWORD(v167) = 990057071;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v167);
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v168, CFSTR("ASVSettingMoveOnToPlaneTranslationSpeed"));

    LODWORD(v169) = 3.0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v169);
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v170, CFSTR("ASVSetting2DControlsFadeOutDelay"));

    LODWORD(v171) = 1045220557;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v171);
    v172 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v172, CFSTR("ASVSetting2DControlsFadeAnimationDuration"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v173, CFSTR("ASVSettingEnableCoachingUI"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v174, CFSTR("ASVSettingCoachingUIShowAllAnimationStatesBeforeHiding"));

    v175 = (void *)MEMORY[0x1E0CB37E8];
    if (ARDeviceSupportsJasper())
      *(float *)&v176 = 10.0;
    else
      *(float *)&v176 = 3.0;
    objc_msgSend(v175, "numberWithFloat:", v176);
    v177 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v177, CFSTR("ASVSettingCoachingUIInactiveTimeBeforeShowingUI"));

    LODWORD(v178) = 1022739087;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v178);
    v179 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v179, CFSTR("ASVSettingCoachingUIMoveDistanceThreshold"));

    LODWORD(v180) = 1.5;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v180);
    v181 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v181, CFSTR("ASVSettingCoachingUIMinDisplayTime"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
    v182 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v182, CFSTR("ASVSettingCoachingUIForceActivation"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
    v183 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v183, CFSTR("ASVSettingCoachingUIEnableRelocalization"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v184 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v184, CFSTR("ASVSettingCoachingUIDisableStatusWhenActive"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v185, CFSTR("ASVSettingCoachingUIShowAnimatedUI"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v186 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v186, CFSTR("ASVSettingCoachingUIInterceptARKitSensorData"));

    v187 = objc_msgSend(v3, "copy");
    settings = v2->_settings;
    v2->_settings = (NSDictionary *)v187;

  }
  return v2;
}

- (float)floatForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  float v7;
  float v8;

  v4 = a3;
  -[ASVSettings settings](self, "settings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "floatValue");
  v8 = v7;

  return v8;
}

- (float)BOOLForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  float v7;

  v4 = a3;
  -[ASVSettings settings](self, "settings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (float)objc_msgSend(v6, "BOOLValue");
  return v7;
}

+ (float)floatForKey:(id)a3
{
  id v3;
  void *v4;
  float v5;
  float v6;

  v3 = a3;
  +[ASVSettings sharedSettings](ASVSettings, "sharedSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatForKey:", v3);
  v6 = v5;

  return v6;
}

+ (float)BOOLForKey:(id)a3
{
  id v3;
  void *v4;
  float v5;
  float v6;

  v3 = a3;
  +[ASVSettings sharedSettings](ASVSettings, "sharedSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "BOOLForKey:", v3);
  v6 = v5;

  return v6;
}

- (NSDictionary)settings
{
  return self->_settings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
}

+ (ASVSettingsProvider)sharedSettings
{
  if (sharedSettings_onceToken != -1)
    dispatch_once(&sharedSettings_onceToken, &__block_literal_global_12);
  return (ASVSettingsProvider *)(id)sharedSettings_sharedSettings;
}

void __57__ASVSettings_ASVSettings_SharedSettings__sharedSettings__block_invoke()
{
  ASVSettings *v0;
  void *v1;

  v0 = objc_alloc_init(ASVSettings);
  v1 = (void *)sharedSettings_sharedSettings;
  sharedSettings_sharedSettings = (uint64_t)v0;

}

@end

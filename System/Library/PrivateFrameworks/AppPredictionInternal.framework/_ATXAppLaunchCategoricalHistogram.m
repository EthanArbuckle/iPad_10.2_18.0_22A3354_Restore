@implementation _ATXAppLaunchCategoricalHistogram

- (void)encodeWithCoder:(id)a3
{
  _ATXAppLaunchCategoricalHistogram *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend(v5, "encodeObject:forKey:", v4->_histogramData, CFSTR("histogramData"));
  objc_msgSend(v5, "encodeObject:forKey:", v4->_categoryToCategoryId, CFSTR("categoryToCategoryId"));
  objc_msgSend(v5, "encodeInt32:forKey:", v4->_maxCategoryId, CFSTR("maxCategoryId"));
  objc_msgSend(v5, "encodeObject:forKey:", v4->_lastDates, CFSTR("lastDates"));
  objc_msgSend(v5, "encodeInt32:forKey:", v4->_maxCategoryCount, CFSTR("maxCategoryCount"));
  objc_msgSend(v5, "encodeInteger:forKey:", v4->_pruningMethod, CFSTR("pruningMethod"));
  objc_sync_exit(v4);

}

+ (id)stringForPruningMethod:(int64_t)a3
{
  NSObject *v5;
  void *v8;

  if ((unint64_t)a3 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_ATXAppLaunchCategoricalHistogram.m"), 62, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pruningMethod >= 0 && pruningMethod < _ATXAppLaunchCategoricalHistogramPruningMethodMax"));

  }
  if ((unint64_t)a3 < 4)
    return off_1E82E92E8[a3];
  __atxlog_handle_default();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    +[_ATXAppLaunchCategoricalHistogram stringForPruningMethod:].cold.1();

  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("stringForPruningMethod called with invalid _ATXAppLaunchCategoricalHistogramPruningMethod value of %lu"), a3);
  return CFSTR("Error");
}

- (_ATXAppLaunchCategoricalHistogram)initWithHistogram:(id)a3 categoryToCategoryId:(id)a4 maxCategoryId:(unsigned __int16)a5 maxCategoryCount:(unsigned __int16)a6 lastDates:(id)a7 pruningMethod:(int64_t)a8
{
  uint64_t v10;
  id v15;
  id v16;
  id v17;
  _ATXAppLaunchCategoricalHistogram *v18;
  ATXHistogramData *v19;
  ATXHistogramData *histogramData;
  void *v21;
  void *v22;
  NSMutableDictionary *v23;
  NSMutableDictionary *categoryToCategoryId;
  void *v25;
  void *v26;
  NSMutableDictionary *v27;
  NSMutableDictionary *lastDates;
  uint64_t v29;
  _ATXInternalUninstallNotification *uninstallNotificationListener;
  _ATXInternalUninstallNotification *v31;
  uint64_t v32;
  _QWORD v34[4];
  _ATXAppLaunchCategoricalHistogram *v35;
  SEL v36;
  _QWORD v37[4];
  id v38;
  id location;
  objc_super v40;

  v10 = a6;
  v15 = a3;
  v16 = a4;
  v17 = a7;
  v40.receiver = self;
  v40.super_class = (Class)_ATXAppLaunchCategoricalHistogram;
  v18 = -[_ATXAppLaunchCategoricalHistogram init](&v40, sel_init);
  if (v18)
  {
    if (v15)
      v19 = (ATXHistogramData *)v15;
    else
      v19 = (ATXHistogramData *)objc_opt_new();
    histogramData = v18->_histogramData;
    v18->_histogramData = v19;

    v18->_maxCategoryId = a5;
    v21 = (void *)objc_msgSend(v16, "mutableCopy");
    v22 = v21;
    if (v21)
      v23 = v21;
    else
      v23 = (NSMutableDictionary *)objc_opt_new();
    categoryToCategoryId = v18->_categoryToCategoryId;
    v18->_categoryToCategoryId = v23;

    -[_ATXAppLaunchCategoricalHistogram _setMaxCategoryCount:pruningMethod:](v18, "_setMaxCategoryCount:pruningMethod:", v10, a8);
    v25 = (void *)objc_msgSend(v17, "mutableCopy");
    v26 = v25;
    if (v25)
      v27 = v25;
    else
      v27 = (NSMutableDictionary *)objc_opt_new();
    lastDates = v18->_lastDates;
    v18->_lastDates = v27;

    objc_initWeak(&location, v18);
    v29 = objc_opt_new();
    uninstallNotificationListener = v18->_uninstallNotificationListener;
    v18->_uninstallNotificationListener = (_ATXInternalUninstallNotification *)v29;

    v31 = v18->_uninstallNotificationListener;
    v32 = MEMORY[0x1E0C809B0];
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __131___ATXAppLaunchCategoricalHistogram_initWithHistogram_categoryToCategoryId_maxCategoryId_maxCategoryCount_lastDates_pruningMethod___block_invoke;
    v37[3] = &unk_1E82DAE98;
    objc_copyWeak(&v38, &location);
    -[_ATXInternalUninstallNotification registerForNotificationsWithUninstallBlock:](v31, "registerForNotificationsWithUninstallBlock:", v37);
    v34[0] = v32;
    v34[1] = 3221225472;
    v34[2] = __131___ATXAppLaunchCategoricalHistogram_initWithHistogram_categoryToCategoryId_maxCategoryId_maxCategoryCount_lastDates_pruningMethod___block_invoke_2;
    v34[3] = &unk_1E82DC688;
    v36 = a2;
    v35 = v18;
    if (initWithHistogram_categoryToCategoryId_maxCategoryId_maxCategoryCount_lastDates_pruningMethod__onceToken != -1)
      dispatch_once(&initWithHistogram_categoryToCategoryId_maxCategoryId_maxCategoryCount_lastDates_pruningMethod__onceToken, v34);

    objc_destroyWeak(&v38);
    objc_destroyWeak(&location);
  }

  return v18;
}

- (void)_setMaxCategoryCount:(unsigned __int16)a3 pruningMethod:(int64_t)a4
{
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  int64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    __atxlog_handle_default();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v11 = 134218240;
      v12 = 0;
      v13 = 2048;
      v14 = 30;
      _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_INFO, "maxCategoryCount of %lu -- using default of %lu", (uint8_t *)&v11, 0x16u);
    }

    a3 = 30;
  }
  self->_maxCategoryCount = a3;
  __atxlog_handle_default();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[_ATXAppLaunchCategoricalHistogram _setMaxCategoryCount:pruningMethod:].cold.3(&self->_maxCategoryCount, v7);

  if ((unint64_t)(a4 - 1) >= 2)
  {
    __atxlog_handle_default();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (a4 < 1)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v11 = 134218240;
        v12 = a4;
        v13 = 2048;
        v14 = 1;
        _os_log_impl(&dword_1C9A3B000, v9, OS_LOG_TYPE_INFO, "_pruningMethod of %lu -- using default of %lu", (uint8_t *)&v11, 0x16u);
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      -[_ATXAppLaunchCategoricalHistogram _setMaxCategoryCount:pruningMethod:].cold.2();
    }

    a4 = 1;
  }
  self->_pruningMethod = a4;
  __atxlog_handle_default();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[_ATXAppLaunchCategoricalHistogram _setMaxCategoryCount:pruningMethod:].cold.1(&self->_pruningMethod, (uint64_t)self, v10);

}

- (_ATXAppLaunchCategoricalHistogram)initWithType:(int64_t)a3 maxCategoryCount:(unsigned __int16)a4 pruningMethod:(int64_t)a5
{
  uint64_t v8;
  void *v9;
  _ATXAppLaunchCategoricalHistogram *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  const __CFString *v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  NSObject *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  NSObject *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  NSObject *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  NSObject *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  const __CFString *v88;
  NSObject *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  NSObject *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  NSObject *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  NSObject *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  NSObject *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  NSObject *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  NSObject *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  NSObject *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  NSObject *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  NSObject *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  NSObject *v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  NSObject *v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  NSObject *v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  NSObject *v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  NSObject *v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  NSObject *v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  NSObject *v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  NSObject *v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  NSObject *v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  NSObject *v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  void *v249;
  NSObject *v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;

  switch(a3)
  {
    case 0:
      __atxlog_handle_default();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchCategoricalHistogram initWithType:maxCategoryCount:pruningMethod:].cold.3(v19, v20, v21, v22, v23, v24, v25, v26);

      v27 = (void *)MEMORY[0x1E0C99DA0];
      v28 = *MEMORY[0x1E0C99768];
      v29 = CFSTR("_ATXHistogramTypeAnyLaunch");
      goto LABEL_91;
    case 1:
      __atxlog_handle_default();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchCategoricalHistogram initWithType:maxCategoryCount:pruningMethod:].cold.4(v30, v31, v32, v33, v34, v35, v36, v37);

      v27 = (void *)MEMORY[0x1E0C99DA0];
      v28 = *MEMORY[0x1E0C99768];
      v29 = CFSTR("_ATXHistogramTypeSpotlightLaunch");
      goto LABEL_91;
    case 2:
      __atxlog_handle_default();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchCategoricalHistogram initWithType:maxCategoryCount:pruningMethod:].cold.2(v38, v39, v40, v41, v42, v43, v44, v45);

      v27 = (void *)MEMORY[0x1E0C99DA0];
      v28 = *MEMORY[0x1E0C99768];
      v29 = CFSTR("_ATXHistogramTypeDayOfWeek");
      goto LABEL_91;
    case 3:
      __atxlog_handle_default();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchCategoricalHistogram initWithType:maxCategoryCount:pruningMethod:].cold.7(v46, v47, v48, v49, v50, v51, v52, v53);

      v27 = (void *)MEMORY[0x1E0C99DA0];
      v28 = *MEMORY[0x1E0C99768];
      v29 = CFSTR("_ATXHistogramTypeAirplaneModeLaunch");
      goto LABEL_91;
    case 4:
    case 29:
    case 31:
    case 32:
    case 33:
    case 34:
    case 37:
    case 38:
    case 39:
    case 40:
    case 41:
    case 42:
    case 43:
    case 44:
    case 45:
    case 46:
    case 47:
    case 48:
    case 49:
    case 50:
    case 51:
    case 52:
    case 53:
    case 54:
    case 55:
    case 56:
    case 57:
    case 58:
    case 59:
    case 60:
    case 61:
    case 62:
    case 63:
    case 64:
    case 65:
    case 66:
    case 67:
    case 68:
    case 69:
    case 70:
    case 71:
    case 72:
    case 73:
    case 74:
    case 75:
    case 76:
    case 77:
    case 78:
    case 79:
    case 80:
    case 81:
    case 82:
    case 83:
    case 84:
    case 85:
    case 86:
    case 87:
    case 88:
    case 89:
    case 94:
    case 95:
    case 96:
    case 97:
    case 98:
      v8 = a4;
      v9 = (void *)objc_opt_new();
      self = -[_ATXAppLaunchCategoricalHistogram initWithHistogram:categoryToCategoryId:maxCategoryId:maxCategoryCount:lastDates:pruningMethod:](self, "initWithHistogram:categoryToCategoryId:maxCategoryId:maxCategoryCount:lastDates:pruningMethod:", v9, 0, 0, v8, 0, a5);

      v10 = self;
      goto LABEL_94;
    case 5:
      __atxlog_handle_default();
      v54 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchCategoricalHistogram initWithType:maxCategoryCount:pruningMethod:].cold.8(v54, v55, v56, v57, v58, v59, v60, v61);

      v27 = (void *)MEMORY[0x1E0C99DA0];
      v28 = *MEMORY[0x1E0C99768];
      v29 = CFSTR("_ATXHistogramTypeTrendingLaunch");
      goto LABEL_91;
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 12:
    case 13:
      __atxlog_handle_default();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchCategoricalHistogram initWithType:maxCategoryCount:pruningMethod:].cold.23(v11, v12, v13, v14, v15, v16, v17, v18);

      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("%@ is deprecated."), CFSTR("Histogram type is deprecated."));
      goto LABEL_92;
    case 11:
      __atxlog_handle_default();
      v62 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchCategoricalHistogram initWithType:maxCategoryCount:pruningMethod:].cold.1(v62, v63, v64, v65, v66, v67, v68, v69);

      v27 = (void *)MEMORY[0x1E0C99DA0];
      v28 = *MEMORY[0x1E0C99768];
      v29 = CFSTR("_ATXHistogramTypeUnlockTime");
      goto LABEL_91;
    case 14:
      __atxlog_handle_default();
      v70 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchCategoricalHistogram initWithType:maxCategoryCount:pruningMethod:].cold.9(v70, v71, v72, v73, v74, v75, v76, v77);

      v27 = (void *)MEMORY[0x1E0C99DA0];
      v28 = *MEMORY[0x1E0C99768];
      v29 = CFSTR("_ATXHistogramTypeAppIntentLaunch");
      goto LABEL_91;
    case 15:
      __atxlog_handle_default();
      v78 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchCategoricalHistogram initWithType:maxCategoryCount:pruningMethod:].cold.24(v78, v79, v80, v81, v82, v83, v84, v85);

      v86 = (void *)MEMORY[0x1E0C99DA0];
      v87 = *MEMORY[0x1E0C99768];
      v88 = CFSTR("_ATXHistogramTypeIntentForAllAppsLaunch");
      goto LABEL_72;
    case 16:
      __atxlog_handle_default();
      v89 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchCategoricalHistogram initWithType:maxCategoryCount:pruningMethod:].cold.10(v89, v90, v91, v92, v93, v94, v95, v96);

      v27 = (void *)MEMORY[0x1E0C99DA0];
      v28 = *MEMORY[0x1E0C99768];
      v29 = CFSTR("_ATXHistogramTypeAppForAllIntentsLaunch");
      goto LABEL_91;
    case 17:
      __atxlog_handle_default();
      v97 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchCategoricalHistogram initWithType:maxCategoryCount:pruningMethod:].cold.11(v97, v98, v99, v100, v101, v102, v103, v104);

      v27 = (void *)MEMORY[0x1E0C99DA0];
      v28 = *MEMORY[0x1E0C99768];
      v29 = CFSTR("_ATXHistogramTypeAppIntentDayOfWeek");
      goto LABEL_91;
    case 18:
      __atxlog_handle_default();
      v105 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchCategoricalHistogram initWithType:maxCategoryCount:pruningMethod:].cold.25(v105, v106, v107, v108, v109, v110, v111, v112);

      v86 = (void *)MEMORY[0x1E0C99DA0];
      v87 = *MEMORY[0x1E0C99768];
      v88 = CFSTR("_ATXHistogramTypeIntentForAllAppsDayOfWeek");
      goto LABEL_72;
    case 19:
      __atxlog_handle_default();
      v113 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchCategoricalHistogram initWithType:maxCategoryCount:pruningMethod:].cold.12(v113, v114, v115, v116, v117, v118, v119, v120);

      v27 = (void *)MEMORY[0x1E0C99DA0];
      v28 = *MEMORY[0x1E0C99768];
      v29 = CFSTR("_ATXHistogramTypeAppForAllIntentsDayOfWeek");
      goto LABEL_91;
    case 20:
      __atxlog_handle_default();
      v121 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v121, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchCategoricalHistogram initWithType:maxCategoryCount:pruningMethod:].cold.15(v121, v122, v123, v124, v125, v126, v127, v128);

      v27 = (void *)MEMORY[0x1E0C99DA0];
      v28 = *MEMORY[0x1E0C99768];
      v29 = CFSTR("_ATXHistogramTypeAppIntentTrendingLaunch");
      goto LABEL_91;
    case 21:
      __atxlog_handle_default();
      v129 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v129, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchCategoricalHistogram initWithType:maxCategoryCount:pruningMethod:].cold.26(v129, v130, v131, v132, v133, v134, v135, v136);

      v86 = (void *)MEMORY[0x1E0C99DA0];
      v87 = *MEMORY[0x1E0C99768];
      v88 = CFSTR("_ATXHistogramTypeIntentForAllAppsTrendingLaunch");
      goto LABEL_72;
    case 22:
      __atxlog_handle_default();
      v137 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v137, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchCategoricalHistogram initWithType:maxCategoryCount:pruningMethod:].cold.16(v137, v138, v139, v140, v141, v142, v143, v144);

      v27 = (void *)MEMORY[0x1E0C99DA0];
      v28 = *MEMORY[0x1E0C99768];
      v29 = CFSTR("_ATXHistogramTypeAppForAllIntentsTrendingLaunch");
      goto LABEL_91;
    case 23:
      __atxlog_handle_default();
      v145 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v145, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchCategoricalHistogram initWithType:maxCategoryCount:pruningMethod:].cold.17(v145, v146, v147, v148, v149, v150, v151, v152);

      v27 = (void *)MEMORY[0x1E0C99DA0];
      v28 = *MEMORY[0x1E0C99768];
      v29 = CFSTR("_ATXHistogramTypeAppIntentUnlockTime");
      goto LABEL_91;
    case 24:
      __atxlog_handle_default();
      v153 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v153, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchCategoricalHistogram initWithType:maxCategoryCount:pruningMethod:].cold.27(v153, v154, v155, v156, v157, v158, v159, v160);

      v86 = (void *)MEMORY[0x1E0C99DA0];
      v87 = *MEMORY[0x1E0C99768];
      v88 = CFSTR("_ATXHistogramTypeIntentForAllAppsUnlockTime");
      goto LABEL_72;
    case 25:
      __atxlog_handle_default();
      v161 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v161, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchCategoricalHistogram initWithType:maxCategoryCount:pruningMethod:].cold.18(v161, v162, v163, v164, v165, v166, v167, v168);

      v27 = (void *)MEMORY[0x1E0C99DA0];
      v28 = *MEMORY[0x1E0C99768];
      v29 = CFSTR("_ATXHistogramTypeAppForAllIntentsUnlockTime");
      goto LABEL_91;
    case 26:
      __atxlog_handle_default();
      v169 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v169, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchCategoricalHistogram initWithType:maxCategoryCount:pruningMethod:].cold.13(v169, v170, v171, v172, v173, v174, v175, v176);

      v27 = (void *)MEMORY[0x1E0C99DA0];
      v28 = *MEMORY[0x1E0C99768];
      v29 = CFSTR("_ATXHistogramTypeAppIntentAirplaneModeLaunch");
      goto LABEL_91;
    case 27:
      __atxlog_handle_default();
      v177 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v177, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchCategoricalHistogram initWithType:maxCategoryCount:pruningMethod:].cold.28(v177, v178, v179, v180, v181, v182, v183, v184);

      v86 = (void *)MEMORY[0x1E0C99DA0];
      v87 = *MEMORY[0x1E0C99768];
      v88 = CFSTR("_ATXHistogramTypeIntentForAllAppsAirplaneModeLaunch");
      goto LABEL_72;
    case 28:
      __atxlog_handle_default();
      v185 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v185, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchCategoricalHistogram initWithType:maxCategoryCount:pruningMethod:].cold.14(v185, v186, v187, v188, v189, v190, v191, v192);

      v27 = (void *)MEMORY[0x1E0C99DA0];
      v28 = *MEMORY[0x1E0C99768];
      v29 = CFSTR("_ATXHistogramTypeAppForAllIntentsAirplaneModeLaunch");
      goto LABEL_91;
    case 30:
      __atxlog_handle_default();
      v193 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v193, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchCategoricalHistogram initWithType:maxCategoryCount:pruningMethod:].cold.29(v193, v194, v195, v196, v197, v198, v199, v200);

      v86 = (void *)MEMORY[0x1E0C99DA0];
      v87 = *MEMORY[0x1E0C99768];
      v88 = CFSTR("_ATXHistogramTypeIntentForAllAppsWifiLaunch");
LABEL_72:
      objc_msgSend(v86, "raise:format:", v87, CFSTR("%@ is deprecated."), v88);
      goto LABEL_93;
    case 35:
      __atxlog_handle_default();
      v201 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v201, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchCategoricalHistogram initWithType:maxCategoryCount:pruningMethod:].cold.19(v201, v202, v203, v204, v205, v206, v207, v208);

      v27 = (void *)MEMORY[0x1E0C99DA0];
      v28 = *MEMORY[0x1E0C99768];
      v29 = CFSTR("_ATXHistogramTypeActionsHeuristicConfirms");
      goto LABEL_91;
    case 36:
      __atxlog_handle_default();
      v209 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v209, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchCategoricalHistogram initWithType:maxCategoryCount:pruningMethod:].cold.20(v209, v210, v211, v212, v213, v214, v215, v216);

      v27 = (void *)MEMORY[0x1E0C99DA0];
      v28 = *MEMORY[0x1E0C99768];
      v29 = CFSTR("_ATXHistogramTypeActionsHeuristicRejects");
      goto LABEL_91;
    case 90:
      __atxlog_handle_default();
      v217 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v217, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchCategoricalHistogram initWithType:maxCategoryCount:pruningMethod:].cold.21(v217, v218, v219, v220, v221, v222, v223, v224);

      v27 = (void *)MEMORY[0x1E0C99DA0];
      v28 = *MEMORY[0x1E0C99768];
      v29 = CFSTR("_ATXHistogramTypeFallbackActionsConfirms");
      goto LABEL_91;
    case 91:
      __atxlog_handle_default();
      v225 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v225, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchCategoricalHistogram initWithType:maxCategoryCount:pruningMethod:].cold.22(v225, v226, v227, v228, v229, v230, v231, v232);

      v27 = (void *)MEMORY[0x1E0C99DA0];
      v28 = *MEMORY[0x1E0C99768];
      v29 = CFSTR("_ATXHistogramTypeFallbackActionsRejects");
      goto LABEL_91;
    case 92:
      __atxlog_handle_default();
      v233 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v233, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchCategoricalHistogram initWithType:maxCategoryCount:pruningMethod:].cold.5(v233, v234, v235, v236, v237, v238, v239, v240);

      v27 = (void *)MEMORY[0x1E0C99DA0];
      v28 = *MEMORY[0x1E0C99768];
      v29 = CFSTR("_ATXHistogramTypeHomescreenAppLaunch");
      goto LABEL_91;
    case 93:
      __atxlog_handle_default();
      v241 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v241, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchCategoricalHistogram initWithType:maxCategoryCount:pruningMethod:].cold.6(v241, v242, v243, v244, v245, v246, v247, v248);

      v27 = (void *)MEMORY[0x1E0C99DA0];
      v28 = *MEMORY[0x1E0C99768];
      v29 = CFSTR("_ATXHistogramTypeAppDirectoryAppLaunch");
LABEL_91:
      objc_msgSend(v27, "raise:format:", v28, CFSTR("%@ is not a valid type for _ATXAppLaunchCategoricalHistogram.  Use _ATXAppLaunchHistogram."), v29);
      goto LABEL_92;
    case 99:
      __atxlog_handle_default();
      v251 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v251, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchCategoricalHistogram initWithType:maxCategoryCount:pruningMethod:].cold.30(v251, v252, v253, v254, v255, v256, v257, v258);

      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("%@ is not a valid type for _ATXAppLaunchCategoricalHistogram.  Use _ATXAppLaunchHistogram."), CFSTR("_ATXHistogramTypeMax"));
      goto LABEL_93;
    default:
LABEL_92:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v249 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v249, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ATXAppLaunchCategoricalHistogram.m"), 324, CFSTR("Failed to initialize _ATXCategoricalHistogram due to invalid histogram type being specified"));

LABEL_93:
      v10 = 0;
LABEL_94:

      return v10;
  }
}

- (_ATXAppLaunchCategoricalHistogram)initWithType:(int64_t)a3
{
  return -[_ATXAppLaunchCategoricalHistogram initWithType:maxCategoryCount:pruningMethod:](self, "initWithType:maxCategoryCount:pruningMethod:", a3, 0, 0);
}

- (BOOL)_tryGetEventIdforBundleId:(id)a3 createIfMissing:(BOOL)a4 eventIdOut:(unsigned __int16 *)a5
{
  _BOOL4 v6;
  id v9;
  void *v10;
  void *v11;
  int v12;
  BOOL v13;
  void *v15;

  v6 = a4;
  v9 = a3;
  if (!a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ATXAppLaunchCategoricalHistogram.m"), 342, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("eventId"));

  }
  +[ATXHistogramBundleIdTable sharedInstance](ATXHistogramBundleIdTable, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v6)
  {
    *a5 = objc_msgSend(v10, "intern:", v9);

  }
  else
  {
    v12 = objc_msgSend(v10, "lookup:into:", v9, a5);

    if ((v12 & 1) == 0)
    {
      v13 = 0;
      *a5 = -1;
      goto LABEL_8;
    }
  }
  v13 = 1;
LABEL_8:

  return v13;
}

- (BOOL)_tryGetCategoryIdforCategory:(id)a3 createIfMissing:(BOOL)a4 categoryIdOut:(unsigned __int16 *)a5
{
  _BOOL4 v6;
  NSString *v9;
  _ATXAppLaunchCategoricalHistogram *v10;
  NSString *prevCategory;
  void *v12;
  void *v13;
  unsigned __int16 v14;
  uint64_t maxCategoryId;
  void *v16;
  void *v18;

  v6 = a4;
  v9 = (NSString *)a3;
  if (!a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ATXAppLaunchCategoricalHistogram.m"), 356, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("categoryId"));

  }
  v10 = self;
  objc_sync_enter(v10);
  prevCategory = v10->_prevCategory;
  if (prevCategory == v9 || -[NSString isEqualToString:](prevCategory, "isEqualToString:", v9))
  {
    *a5 = v10->_prevCategoryId;
  }
  else
  {
    -[NSMutableDictionary objectForKeyedSubscript:](v10->_categoryToCategoryId, "objectForKeyedSubscript:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](v10->_categoryToCategoryId, "objectForKeyedSubscript:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "unsignedIntegerValue");
      v10->_prevCategoryId = v14;
      *a5 = v14;

    }
    else
    {
      if (!v6)
      {
        *a5 = -1;
        goto LABEL_11;
      }
      maxCategoryId = v10->_maxCategoryId;
      v10->_maxCategoryId = maxCategoryId + 1;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", maxCategoryId);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v10->_categoryToCategoryId, "setObject:forKeyedSubscript:", v16, v9);

      v10->_prevCategoryId = maxCategoryId;
      *a5 = maxCategoryId;
    }
  }
  LOBYTE(v6) = 1;
LABEL_11:
  objc_sync_exit(v10);

  return v6;
}

- (void)addLaunchWithBundleId:(id)a3 date:(id)a4 category:(id)a5
{
  double v5;

  LODWORD(v5) = 1.0;
  -[_ATXAppLaunchCategoricalHistogram addLaunchWithBundleId:date:category:weight:](self, "addLaunchWithBundleId:date:category:weight:", a3, a4, a5, v5);
}

- (void)addLaunchWithBundleId:(id)a3 date:(id)a4 category:(id)a5 weight:(float)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  _ATXAppLaunchCategoricalHistogram *v15;
  double v16;
  NSMutableDictionary *lastDates;
  void *v18;
  unsigned __int16 v19;
  unsigned __int16 v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = v13;
  if (v11)
  {
    if (v13)
    {
      v15 = self;
      objc_sync_enter(v15);
      v20 = 0;
      -[_ATXAppLaunchCategoricalHistogram _tryGetEventIdforBundleId:createIfMissing:eventIdOut:](v15, "_tryGetEventIdforBundleId:createIfMissing:eventIdOut:", v11, 1, &v20);
      v19 = 0;
      -[_ATXAppLaunchCategoricalHistogram _tryGetCategoryIdforCategory:createIfMissing:categoryIdOut:](v15, "_tryGetCategoryIdforCategory:createIfMissing:categoryIdOut:", v14, 1, &v19);
      *(float *)&v16 = a6;
      -[ATXHistogramData add:a:b:](v15->_histogramData, "add:a:b:", v20, v19, v16);
      lastDates = v15->_lastDates;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v19);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](lastDates, "setObject:forKeyedSubscript:", v12, v18);

      -[_ATXAppLaunchCategoricalHistogram _reduceCategoryCountTo:](v15, "_reduceCategoryCountTo:", v15->_maxCategoryCount);
      objc_sync_exit(v15);
    }
    else
    {
      __atxlog_handle_default();
      v15 = (_ATXAppLaunchCategoricalHistogram *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v15->super, OS_LOG_TYPE_DEBUG))
        -[_ATXAppLaunchCategoricalHistogram addLaunchWithBundleId:date:category:weight:].cold.2(a2);
    }
  }
  else
  {
    __atxlog_handle_default();
    v15 = (_ATXAppLaunchCategoricalHistogram *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v15->super, OS_LOG_TYPE_DEBUG))
      -[_ATXAppLaunchHistogram _addLaunchWithBundleId:date:timeZone:arbitraryWeight:].cold.1(a2);
  }

}

- (void)resetHistogram:(id)a3
{
  ATXHistogramData *v4;
  ATXHistogramData *histogramData;
  _ATXAppLaunchCategoricalHistogram *obj;

  v4 = (ATXHistogramData *)a3;
  obj = self;
  objc_sync_enter(obj);
  histogramData = obj->_histogramData;
  obj->_histogramData = v4;

  objc_sync_exit(obj);
}

- (void)_garbageCollectCategoryIds
{
  void *v3;
  void *v4;
  NSMutableDictionary *categoryToCategoryId;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[ATXHistogramData bSet](self->_histogramData, "bSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  categoryToCategoryId = self->_categoryToCategoryId;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __63___ATXAppLaunchCategoricalHistogram__garbageCollectCategoryIds__block_invoke;
  v17[3] = &unk_1E82E92A0;
  v6 = v3;
  v18 = v6;
  v7 = v4;
  v19 = v7;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](categoryToCategoryId, "enumerateKeysAndObjectsUsingBlock:", v17);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        -[_ATXAppLaunchCategoricalHistogram _removeMappingForCategory:](self, "_removeMappingForCategory:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++), (_QWORD)v13);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v20, 16);
    }
    while (v10);
  }

}

- (BOOL)removeHistoryForBundleId:(id)a3
{
  id v5;
  _ATXAppLaunchCategoricalHistogram *v6;
  BOOL v7;
  unsigned __int16 v9;

  v5 = a3;
  if (v5)
  {
    v6 = self;
    objc_sync_enter(v6);
    v9 = 0;
    v7 = -[_ATXAppLaunchCategoricalHistogram _tryGetEventIdforBundleId:createIfMissing:eventIdOut:](v6, "_tryGetEventIdforBundleId:createIfMissing:eventIdOut:", v5, 0, &v9);
    if (v7)
    {
      -[ATXHistogramData deleteWhereA:b:](v6->_histogramData, "deleteWhereA:b:", v9, 0xFFFFLL);
      -[_ATXAppLaunchCategoricalHistogram _garbageCollectCategoryIds](v6, "_garbageCollectCategoryIds");
    }
    objc_sync_exit(v6);
  }
  else
  {
    __atxlog_handle_default();
    v6 = (_ATXAppLaunchCategoricalHistogram *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v6->super, OS_LOG_TYPE_DEBUG))
      -[_ATXAppLaunchHistogram _addLaunchWithBundleId:date:timeZone:arbitraryWeight:].cold.1(a2);
    v7 = 0;
  }

  return v7;
}

- (BOOL)removeHistoryForCategory:(id)a3
{
  id v5;
  _ATXAppLaunchCategoricalHistogram *v6;
  BOOL v7;
  unsigned __int16 v9;

  v5 = a3;
  if (v5)
  {
    v6 = self;
    objc_sync_enter(v6);
    v9 = 0;
    v7 = -[_ATXAppLaunchCategoricalHistogram _tryGetCategoryIdforCategory:createIfMissing:categoryIdOut:](v6, "_tryGetCategoryIdforCategory:createIfMissing:categoryIdOut:", v5, 0, &v9);
    if (v7)
    {
      -[ATXHistogramData deleteWhereA:b:](v6->_histogramData, "deleteWhereA:b:", 0xFFFFLL, v9);
      -[_ATXAppLaunchCategoricalHistogram _removeMappingForCategory:](v6, "_removeMappingForCategory:", v5);
    }
    objc_sync_exit(v6);
  }
  else
  {
    __atxlog_handle_default();
    v6 = (_ATXAppLaunchCategoricalHistogram *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v6->super, OS_LOG_TYPE_DEBUG))
      -[_ATXAppLaunchCategoricalHistogram addLaunchWithBundleId:date:category:weight:].cold.2(a2);
    v7 = 0;
  }

  return v7;
}

- (int)removeHistoryForBundleIds:(id)a3
{
  id v4;
  _ATXAppLaunchCategoricalHistogram *v5;
  id v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  unsigned __int16 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = 0;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        v13 = 0;
        if (-[_ATXAppLaunchCategoricalHistogram _tryGetEventIdforBundleId:createIfMissing:eventIdOut:](v5, "_tryGetEventIdforBundleId:createIfMissing:eventIdOut:", v11, 0, &v13))
        {
          -[ATXHistogramData deleteWhereA:b:](v5->_histogramData, "deleteWhereA:b:", v13, 0xFFFFLL);
          ++v7;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  -[_ATXAppLaunchCategoricalHistogram _garbageCollectCategoryIds](v5, "_garbageCollectCategoryIds");
  objc_sync_exit(v5);

  return v7;
}

- (void)_removeMappingForCategory:(id)a3
{
  id v5;
  _ATXAppLaunchCategoricalHistogram *v6;
  void *v7;
  uint64_t v8;
  int maxCategoryId;
  NSMutableDictionary *lastDates;
  void *v11;
  NSString *prevCategory;
  NSObject *v13;

  v5 = a3;
  if (v5)
  {
    v6 = self;
    objc_sync_enter(v6);
    -[NSMutableDictionary objectForKeyedSubscript:](v6->_categoryToCategoryId, "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "unsignedShortValue");

    maxCategoryId = v6->_maxCategoryId;
    if ((_DWORD)v8 + 1 == maxCategoryId)
      v6->_maxCategoryId = maxCategoryId - 1;
    -[NSMutableDictionary removeObjectForKey:](v6->_categoryToCategoryId, "removeObjectForKey:", v5);
    lastDates = v6->_lastDates;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](lastDates, "removeObjectForKey:", v11);

    if ((_DWORD)v8 == v6->_prevCategoryId)
    {
      prevCategory = v6->_prevCategory;
      v6->_prevCategory = 0;

    }
    objc_sync_exit(v6);

  }
  else
  {
    __atxlog_handle_default();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[_ATXAppLaunchCategoricalHistogram addLaunchWithBundleId:date:category:weight:].cold.2(a2);

  }
}

- (void)_reduceCategoryCountTo:(unsigned __int16)a3
{
  unint64_t v3;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  NSMutableDictionary *lastDates;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t *v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  _QWORD *v28;
  SEL v29;
  void *v30;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  LODWORD(v3) = a3;
  v39 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableDictionary count](self->_categoryToCategoryId, "count") > (unint64_t)a3)
  {
    -[NSMutableDictionary allKeys](self->_categoryToCategoryId, "allKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_opt_new();
    if ((unint64_t)(self->_pruningMethod - 1) > 1)
    {
      __atxlog_handle_default();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchCategoricalHistogram _reduceCategoryCountTo:].cold.1(v26);

      objc_msgSend(MEMORY[0x1E0D81568], "simulateCrashWithDescription:", CFSTR("Invalid value for _ATXAppLaunchCategoricalHistogramPruningMethod"));
    }
    else
    {
      v34 = 0u;
      v35 = 0u;
      v29 = a2;
      v32 = 0u;
      v33 = 0u;
      v30 = v6;
      obj = v6;
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v33;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v33 != v10)
              objc_enumerationMutation(obj);
            v12 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
            -[NSMutableDictionary objectForKeyedSubscript:](self->_categoryToCategoryId, "objectForKeyedSubscript:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v13)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", v29, self, CFSTR("_ATXAppLaunchCategoricalHistogram.m"), 536, CFSTR("Trying to remove a category '%@' that has no categoryId -- inconsistent dictionary state"), v12);

            }
            v14 = objc_opt_new();
            objc_storeStrong((id *)(v14 + 8), v12);
            lastDates = self->_lastDates;
            -[NSMutableDictionary objectForKeyedSubscript:](self->_categoryToCategoryId, "objectForKeyedSubscript:", v12);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary objectForKeyedSubscript:](lastDates, "objectForKeyedSubscript:", v16);
            v17 = objc_claimAutoreleasedReturnValue();
            v18 = *(void **)(v14 + 16);
            *(_QWORD *)(v14 + 16) = v17;

            -[_ATXAppLaunchCategoricalHistogram totalLaunchesForCategory:](self, "totalLaunchesForCategory:", v12);
            *(_QWORD *)(v14 + 24) = v19;
            objc_msgSend(v7, "addObject:", v14);

          }
          v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
        }
        while (v9);
      }

      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("lastDate"), 0);
      v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("launchCount"), 0);
      v23 = (void *)v22;
      if (self->_pruningMethod == 1)
      {
        v37 = v21;
        v24 = (uint64_t *)&v37;
        v25 = v22;
      }
      else
      {
        v36 = v22;
        v24 = &v36;
        v25 = (uint64_t)v21;
      }
      v3 = v3;
      v24[1] = v25;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "sortUsingDescriptors:", v27);

      while (objc_msgSend(v7, "count") > v3)
      {
        objc_msgSend(v7, "objectAtIndexedSubscript:", v3);
        v28 = (_QWORD *)objc_claimAutoreleasedReturnValue();
        -[_ATXAppLaunchCategoricalHistogram removeHistoryForCategory:](self, "removeHistoryForCategory:", v28[1]);

        ++v3;
      }

      v6 = v30;
    }

  }
}

- (double)totalLaunchesForBundleId:(id)a3 category:(id)a4
{
  id v7;
  id v8;
  void *v9;
  _ATXAppLaunchCategoricalHistogram *v10;
  double v11;
  float v12;
  int v14;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
    {
      v10 = self;
      objc_sync_enter(v10);
      v14 = 0;
      v11 = 0.0;
      if (-[_ATXAppLaunchCategoricalHistogram _tryGetEventIdforBundleId:createIfMissing:eventIdOut:](v10, "_tryGetEventIdforBundleId:createIfMissing:eventIdOut:", v7, 0, (char *)&v14 + 2)&& -[_ATXAppLaunchCategoricalHistogram _tryGetCategoryIdforCategory:createIfMissing:categoryIdOut:](v10, "_tryGetCategoryIdforCategory:createIfMissing:categoryIdOut:", v9, 0, &v14))
      {
        -[ATXHistogramData lookupUnsmoothedA:b:](v10->_histogramData, "lookupUnsmoothedA:b:", HIWORD(v14), (unsigned __int16)v14);
        v11 = v12;
      }
      objc_sync_exit(v10);
    }
    else
    {
      __atxlog_handle_default();
      v10 = (_ATXAppLaunchCategoricalHistogram *)objc_claimAutoreleasedReturnValue();
      v11 = 0.0;
      if (os_log_type_enabled(&v10->super, OS_LOG_TYPE_DEBUG))
        -[_ATXAppLaunchCategoricalHistogram addLaunchWithBundleId:date:category:weight:].cold.2(a2);
    }
  }
  else
  {
    __atxlog_handle_default();
    v10 = (_ATXAppLaunchCategoricalHistogram *)objc_claimAutoreleasedReturnValue();
    v11 = 0.0;
    if (os_log_type_enabled(&v10->super, OS_LOG_TYPE_DEBUG))
      -[_ATXAppLaunchHistogram _addLaunchWithBundleId:date:timeZone:arbitraryWeight:].cold.1(a2);
  }

  return v11;
}

- (double)ratio:(double)a3 over:(double)a4
{
  return a3 * a4 / ((*(double *)&kLaunchThreshold_0 + a4) * (*(double *)&kLaunchThreshold_0 + a4));
}

- (double)launchPopularityWithBundleId:(id)a3 category:(id)a4
{
  id v7;
  id v8;
  void *v9;
  _ATXAppLaunchCategoricalHistogram *v10;
  double v11;
  float v12;
  float v13;
  float v14;
  double v15;
  int v17;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
    {
      v10 = self;
      objc_sync_enter(v10);
      v17 = 0;
      v11 = 0.0;
      if (-[_ATXAppLaunchCategoricalHistogram _tryGetEventIdforBundleId:createIfMissing:eventIdOut:](v10, "_tryGetEventIdforBundleId:createIfMissing:eventIdOut:", v7, 0, (char *)&v17 + 2)&& -[_ATXAppLaunchCategoricalHistogram _tryGetCategoryIdforCategory:createIfMissing:categoryIdOut:](v10, "_tryGetCategoryIdforCategory:createIfMissing:categoryIdOut:", v9, 0, &v17))
      {
        -[ATXHistogramData lookupUnsmoothedA:b:](v10->_histogramData, "lookupUnsmoothedA:b:", HIWORD(v17), (unsigned __int16)v17);
        v13 = v12;
        -[ATXHistogramData lookupUnsmoothedA:b:](v10->_histogramData, "lookupUnsmoothedA:b:", HIWORD(v17), 0xFFFFLL);
        -[_ATXAppLaunchCategoricalHistogram ratio:over:](v10, "ratio:over:", v13, v14);
        v11 = v15;
      }
      objc_sync_exit(v10);
    }
    else
    {
      __atxlog_handle_default();
      v10 = (_ATXAppLaunchCategoricalHistogram *)objc_claimAutoreleasedReturnValue();
      v11 = 0.0;
      if (os_log_type_enabled(&v10->super, OS_LOG_TYPE_DEBUG))
        -[_ATXAppLaunchCategoricalHistogram addLaunchWithBundleId:date:category:weight:].cold.2(a2);
    }
  }
  else
  {
    __atxlog_handle_default();
    v10 = (_ATXAppLaunchCategoricalHistogram *)objc_claimAutoreleasedReturnValue();
    v11 = 0.0;
    if (os_log_type_enabled(&v10->super, OS_LOG_TYPE_DEBUG))
      -[_ATXAppLaunchHistogram _addLaunchWithBundleId:date:timeZone:arbitraryWeight:].cold.1(a2);
  }

  return v11;
}

- (double)relativeLaunchPopularityWithBundleId:(id)a3 category:(id)a4
{
  id v7;
  id v8;
  void *v9;
  _ATXAppLaunchCategoricalHistogram *v10;
  double v11;
  float v12;
  float v13;
  float v14;
  double v15;
  int v17;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
    {
      v10 = self;
      objc_sync_enter(v10);
      v17 = 0;
      v11 = 0.0;
      if (-[_ATXAppLaunchCategoricalHistogram _tryGetEventIdforBundleId:createIfMissing:eventIdOut:](v10, "_tryGetEventIdforBundleId:createIfMissing:eventIdOut:", v7, 0, (char *)&v17 + 2)&& -[_ATXAppLaunchCategoricalHistogram _tryGetCategoryIdforCategory:createIfMissing:categoryIdOut:](v10, "_tryGetCategoryIdforCategory:createIfMissing:categoryIdOut:", v9, 0, &v17))
      {
        -[ATXHistogramData lookupUnsmoothedA:b:](v10->_histogramData, "lookupUnsmoothedA:b:", HIWORD(v17), (unsigned __int16)v17);
        v13 = v12;
        -[ATXHistogramData lookupUnsmoothedA:b:](v10->_histogramData, "lookupUnsmoothedA:b:", 0xFFFFLL, (unsigned __int16)v17);
        -[_ATXAppLaunchCategoricalHistogram ratio:over:](v10, "ratio:over:", v13, v14);
        v11 = v15;
      }
      objc_sync_exit(v10);
    }
    else
    {
      __atxlog_handle_default();
      v10 = (_ATXAppLaunchCategoricalHistogram *)objc_claimAutoreleasedReturnValue();
      v11 = 0.0;
      if (os_log_type_enabled(&v10->super, OS_LOG_TYPE_DEBUG))
        -[_ATXAppLaunchCategoricalHistogram addLaunchWithBundleId:date:category:weight:].cold.2(a2);
    }
  }
  else
  {
    __atxlog_handle_default();
    v10 = (_ATXAppLaunchCategoricalHistogram *)objc_claimAutoreleasedReturnValue();
    v11 = 0.0;
    if (os_log_type_enabled(&v10->super, OS_LOG_TYPE_DEBUG))
      -[_ATXAppLaunchHistogram _addLaunchWithBundleId:date:timeZone:arbitraryWeight:].cold.1(a2);
  }

  return v11;
}

- (double)totalLaunchesForCategory:(id)a3
{
  id v5;
  _ATXAppLaunchCategoricalHistogram *v6;
  double v7;
  float v8;
  unsigned __int16 v10;

  v5 = a3;
  if (v5)
  {
    v6 = self;
    objc_sync_enter(v6);
    v10 = 0;
    v7 = 0.0;
    if (-[_ATXAppLaunchCategoricalHistogram _tryGetCategoryIdforCategory:createIfMissing:categoryIdOut:](v6, "_tryGetCategoryIdforCategory:createIfMissing:categoryIdOut:", v5, 0, &v10))
    {
      -[ATXHistogramData lookupUnsmoothedA:b:](v6->_histogramData, "lookupUnsmoothedA:b:", 0xFFFFLL, v10);
      v7 = v8;
    }
    objc_sync_exit(v6);
  }
  else
  {
    __atxlog_handle_default();
    v6 = (_ATXAppLaunchCategoricalHistogram *)objc_claimAutoreleasedReturnValue();
    v7 = 0.0;
    if (os_log_type_enabled(&v6->super, OS_LOG_TYPE_DEBUG))
      -[_ATXAppLaunchCategoricalHistogram addLaunchWithBundleId:date:category:weight:].cold.2(a2);
  }

  return v7;
}

- (double)totalLaunchesForBundleId:(id)a3
{
  id v5;
  _ATXAppLaunchCategoricalHistogram *v6;
  double v7;
  float v8;
  unsigned __int16 v10;

  v5 = a3;
  if (v5)
  {
    v6 = self;
    objc_sync_enter(v6);
    v10 = 0;
    v7 = 0.0;
    if (-[_ATXAppLaunchCategoricalHistogram _tryGetEventIdforBundleId:createIfMissing:eventIdOut:](v6, "_tryGetEventIdforBundleId:createIfMissing:eventIdOut:", v5, 0, &v10))
    {
      -[ATXHistogramData lookupUnsmoothedA:b:](v6->_histogramData, "lookupUnsmoothedA:b:", v10, 0xFFFFLL);
      v7 = v8;
    }
    objc_sync_exit(v6);
  }
  else
  {
    __atxlog_handle_default();
    v6 = (_ATXAppLaunchCategoricalHistogram *)objc_claimAutoreleasedReturnValue();
    v7 = 0.0;
    if (os_log_type_enabled(&v6->super, OS_LOG_TYPE_DEBUG))
      -[_ATXAppLaunchHistogram _addLaunchWithBundleId:date:timeZone:arbitraryWeight:].cold.1(a2);
  }

  return v7;
}

- (double)overallLaunchPopularityForBundleId:(id)a3
{
  id v5;
  _ATXAppLaunchCategoricalHistogram *v6;
  double v7;
  float v8;
  float v9;
  float v10;
  double v11;
  unsigned __int16 v13;

  v5 = a3;
  if (v5)
  {
    v6 = self;
    objc_sync_enter(v6);
    v13 = 0;
    v7 = 0.0;
    if (-[_ATXAppLaunchCategoricalHistogram _tryGetEventIdforBundleId:createIfMissing:eventIdOut:](v6, "_tryGetEventIdforBundleId:createIfMissing:eventIdOut:", v5, 0, &v13))
    {
      -[ATXHistogramData lookupUnsmoothedA:b:](v6->_histogramData, "lookupUnsmoothedA:b:", v13, 0xFFFFLL);
      v9 = v8;
      -[ATXHistogramData lookupUnsmoothedA:b:](v6->_histogramData, "lookupUnsmoothedA:b:", 0xFFFFLL, 0xFFFFLL);
      -[_ATXAppLaunchCategoricalHistogram ratio:over:](v6, "ratio:over:", v9, v10);
      v7 = v11;
    }
    objc_sync_exit(v6);
  }
  else
  {
    __atxlog_handle_default();
    v6 = (_ATXAppLaunchCategoricalHistogram *)objc_claimAutoreleasedReturnValue();
    v7 = 0.0;
    if (os_log_type_enabled(&v6->super, OS_LOG_TYPE_DEBUG))
      -[_ATXAppLaunchHistogram _addLaunchWithBundleId:date:timeZone:arbitraryWeight:].cold.1(a2);
  }

  return v7;
}

- (double)overallLaunchPopularityForCategory:(id)a3
{
  id v5;
  _ATXAppLaunchCategoricalHistogram *v6;
  double v7;
  float v8;
  float v9;
  float v10;
  double v11;
  unsigned __int16 v13;

  v5 = a3;
  if (v5)
  {
    v6 = self;
    objc_sync_enter(v6);
    v13 = 0;
    v7 = 0.0;
    if (-[_ATXAppLaunchCategoricalHistogram _tryGetCategoryIdforCategory:createIfMissing:categoryIdOut:](v6, "_tryGetCategoryIdforCategory:createIfMissing:categoryIdOut:", v5, 0, &v13))
    {
      -[ATXHistogramData lookupUnsmoothedA:b:](v6->_histogramData, "lookupUnsmoothedA:b:", 0xFFFFLL, v13);
      v9 = v8;
      -[ATXHistogramData lookupUnsmoothedA:b:](v6->_histogramData, "lookupUnsmoothedA:b:", 0xFFFFLL, 0xFFFFLL);
      -[_ATXAppLaunchCategoricalHistogram ratio:over:](v6, "ratio:over:", v9, v10);
      v7 = v11;
    }
    objc_sync_exit(v6);
  }
  else
  {
    __atxlog_handle_default();
    v6 = (_ATXAppLaunchCategoricalHistogram *)objc_claimAutoreleasedReturnValue();
    v7 = 0.0;
    if (os_log_type_enabled(&v6->super, OS_LOG_TYPE_DEBUG))
      -[_ATXAppLaunchCategoricalHistogram addLaunchWithBundleId:date:category:weight:].cold.2(a2);
  }

  return v7;
}

- (double)overallLaunchPopularityForBundleId:(id)a3 category:(id)a4
{
  id v7;
  id v8;
  void *v9;
  _ATXAppLaunchCategoricalHistogram *v10;
  double v11;
  float v12;
  float v13;
  float v14;
  double v15;
  int v17;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
    {
      v10 = self;
      objc_sync_enter(v10);
      v17 = 0;
      v11 = 0.0;
      if (-[_ATXAppLaunchCategoricalHistogram _tryGetEventIdforBundleId:createIfMissing:eventIdOut:](v10, "_tryGetEventIdforBundleId:createIfMissing:eventIdOut:", v7, 0, (char *)&v17 + 2)&& -[_ATXAppLaunchCategoricalHistogram _tryGetCategoryIdforCategory:createIfMissing:categoryIdOut:](v10, "_tryGetCategoryIdforCategory:createIfMissing:categoryIdOut:", v9, 0, &v17))
      {
        -[ATXHistogramData lookupUnsmoothedA:b:](v10->_histogramData, "lookupUnsmoothedA:b:", HIWORD(v17), (unsigned __int16)v17);
        v13 = v12;
        -[ATXHistogramData lookupUnsmoothedA:b:](v10->_histogramData, "lookupUnsmoothedA:b:", 0xFFFFLL, 0xFFFFLL);
        -[_ATXAppLaunchCategoricalHistogram ratio:over:](v10, "ratio:over:", v13, v14);
        v11 = v15;
      }
      objc_sync_exit(v10);
    }
    else
    {
      __atxlog_handle_default();
      v10 = (_ATXAppLaunchCategoricalHistogram *)objc_claimAutoreleasedReturnValue();
      v11 = 0.0;
      if (os_log_type_enabled(&v10->super, OS_LOG_TYPE_DEBUG))
        -[_ATXAppLaunchCategoricalHistogram addLaunchWithBundleId:date:category:weight:].cold.2(a2);
    }
  }
  else
  {
    __atxlog_handle_default();
    v10 = (_ATXAppLaunchCategoricalHistogram *)objc_claimAutoreleasedReturnValue();
    v11 = 0.0;
    if (os_log_type_enabled(&v10->super, OS_LOG_TYPE_DEBUG))
      -[_ATXAppLaunchHistogram _addLaunchWithBundleId:date:timeZone:arbitraryWeight:].cold.1(a2);
  }

  return v11;
}

- (double)totalLaunches
{
  _ATXAppLaunchCategoricalHistogram *v2;
  float v3;
  double v4;

  v2 = self;
  objc_sync_enter(v2);
  -[ATXHistogramData lookupUnsmoothedA:b:](v2->_histogramData, "lookupUnsmoothedA:b:", 0xFFFFLL, 0xFFFFLL);
  v4 = v3;
  objc_sync_exit(v2);

  return v4;
}

- (double)entropyForBundleId:(id)a3
{
  id v5;
  _ATXAppLaunchCategoricalHistogram *v6;
  double v7;
  float v8;
  unsigned __int16 v10;

  v5 = a3;
  if (v5)
  {
    v6 = self;
    objc_sync_enter(v6);
    v10 = 0;
    v7 = 0.0;
    if (-[_ATXAppLaunchCategoricalHistogram _tryGetEventIdforBundleId:createIfMissing:eventIdOut:](v6, "_tryGetEventIdforBundleId:createIfMissing:eventIdOut:", v5, 0, &v10))
    {
      -[ATXHistogramData entropyWhereA:b:](v6->_histogramData, "entropyWhereA:b:", v10, 0xFFFFLL);
      v7 = v8;
    }
    objc_sync_exit(v6);
  }
  else
  {
    __atxlog_handle_default();
    v6 = (_ATXAppLaunchCategoricalHistogram *)objc_claimAutoreleasedReturnValue();
    v7 = 0.0;
    if (os_log_type_enabled(&v6->super, OS_LOG_TYPE_DEBUG))
      -[_ATXAppLaunchHistogram _addLaunchWithBundleId:date:timeZone:arbitraryWeight:].cold.1(a2);
  }

  return v7;
}

- (double)entropyForCategory:(id)a3
{
  id v5;
  _ATXAppLaunchCategoricalHistogram *v6;
  double v7;
  float v8;
  unsigned __int16 v10;

  v5 = a3;
  if (v5)
  {
    v6 = self;
    objc_sync_enter(v6);
    v10 = 0;
    v7 = 0.0;
    if (-[_ATXAppLaunchCategoricalHistogram _tryGetCategoryIdforCategory:createIfMissing:categoryIdOut:](v6, "_tryGetCategoryIdforCategory:createIfMissing:categoryIdOut:", v5, 0, &v10))
    {
      -[ATXHistogramData entropyWhereA:b:](v6->_histogramData, "entropyWhereA:b:", 0xFFFFLL, v10);
      v7 = v8;
    }
    objc_sync_exit(v6);
  }
  else
  {
    __atxlog_handle_default();
    v6 = (_ATXAppLaunchCategoricalHistogram *)objc_claimAutoreleasedReturnValue();
    v7 = 0.0;
    if (os_log_type_enabled(&v6->super, OS_LOG_TYPE_DEBUG))
      -[_ATXAppLaunchCategoricalHistogram addLaunchWithBundleId:date:category:weight:].cold.2(a2);
  }

  return v7;
}

- (double)entropy
{
  _ATXAppLaunchCategoricalHistogram *v2;
  float v3;
  double v4;

  v2 = self;
  objc_sync_enter(v2);
  -[ATXHistogramData entropyWhereA:b:](v2->_histogramData, "entropyWhereA:b:", 0xFFFFLL, 0xFFFFLL);
  v4 = v3;
  objc_sync_exit(v2);

  return v4;
}

- (id)launchCountsForEachCategoryForBundleId:(id)a3
{
  id v4;
  _ATXAppLaunchCategoricalHistogram *v5;
  void *v6;
  ATXHistogramData *histogramData;
  NSObject *v8;
  _QWORD v10[4];
  NSObject *v11;
  __int16 v12;
  __int16 v13;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v13 = 0;
  v6 = (void *)objc_opt_new();
  if (-[_ATXAppLaunchCategoricalHistogram _tryGetEventIdforBundleId:createIfMissing:eventIdOut:](v5, "_tryGetEventIdforBundleId:createIfMissing:eventIdOut:", v4, 0, &v13))
  {
    histogramData = v5->_histogramData;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __76___ATXAppLaunchCategoricalHistogram_launchCountsForEachCategoryForBundleId___block_invoke;
    v10[3] = &unk_1E82E92C8;
    v12 = v13;
    v11 = v6;
    -[ATXHistogramData enumerate:](histogramData, "enumerate:", v10);
    v8 = v11;
  }
  else
  {
    __atxlog_handle_default();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[_ATXAppLaunchCategoricalHistogram launchCountsForEachCategoryForBundleId:].cold.1();
  }

  objc_sync_exit(v5);
  return v6;
}

- (id)lastDate
{
  _ATXAppLaunchCategoricalHistogram *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NSMutableDictionary objectEnumerator](v2->_lastDates, "objectEnumerator", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0;
  v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v7);
        if (!v4 || objc_msgSend(v4, "compare:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v7)) == -1)
        {
          v9 = v8;

          v4 = v9;
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  v10 = (void *)objc_msgSend(v4, "copy");
  objc_sync_exit(v2);

  return v10;
}

- (BOOL)bundleHasBeenLaunched:(id)a3
{
  id v5;
  _ATXAppLaunchCategoricalHistogram *v6;
  float v7;
  BOOL v8;
  unsigned __int16 v10;

  v5 = a3;
  if (v5)
  {
    v6 = self;
    objc_sync_enter(v6);
    v10 = 0;
    if (-[_ATXAppLaunchCategoricalHistogram _tryGetEventIdforBundleId:createIfMissing:eventIdOut:](v6, "_tryGetEventIdforBundleId:createIfMissing:eventIdOut:", v5, 0, &v10))
    {
      -[ATXHistogramData lookupUnsmoothedA:b:](v6->_histogramData, "lookupUnsmoothedA:b:", v10, 0xFFFFLL);
      v8 = v7 > 0.0;
    }
    else
    {
      v8 = 0;
    }
    objc_sync_exit(v6);
  }
  else
  {
    __atxlog_handle_default();
    v6 = (_ATXAppLaunchCategoricalHistogram *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v6->super, OS_LOG_TYPE_DEBUG))
      -[_ATXAppLaunchHistogram _addLaunchWithBundleId:date:timeZone:arbitraryWeight:].cold.1(a2);
    v8 = 0;
  }

  return v8;
}

- (void)decayByFactor:(double)a3
{
  double v4;
  _ATXAppLaunchCategoricalHistogram *obj;

  obj = self;
  objc_sync_enter(obj);
  *(float *)&v4 = a3;
  -[ATXHistogramData decayByFactor:](obj->_histogramData, "decayByFactor:", v4);
  objc_sync_exit(obj);

}

- (void)decayWithHalfLifeInDays:(double)a3
{
  double v4;
  _ATXAppLaunchCategoricalHistogram *obj;

  obj = self;
  objc_sync_enter(obj);
  *(float *)&v4 = a3;
  -[ATXHistogramData decayWithHalfLifeInDays:](obj->_histogramData, "decayWithHalfLifeInDays:", v4);
  objc_sync_exit(obj);

}

- (void)resetData
{
  uint64_t v2;
  NSMutableDictionary *categoryToCategoryId;
  NSString *prevCategory;
  _ATXAppLaunchCategoricalHistogram *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_maxCategoryId = 0;
  v2 = objc_opt_new();
  categoryToCategoryId = obj->_categoryToCategoryId;
  obj->_categoryToCategoryId = (NSMutableDictionary *)v2;

  prevCategory = obj->_prevCategory;
  obj->_prevCategory = 0;

  -[ATXHistogramData clear](obj->_histogramData, "clear");
  objc_sync_exit(obj);

}

- (void)verifyDataIntegrity
{
  void *v2;
  unint64_t v3;
  void *v4;
  unint64_t v5;
  _ATXAppLaunchCategoricalHistogram *obj;

  obj = self;
  objc_sync_enter(obj);
  -[NSMutableDictionary allValues](obj->_categoryToCategoryId, "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v3 > v5)
    -[_ATXAppLaunchCategoricalHistogram resetData](obj, "resetData");

  objc_sync_exit(obj);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_ATXAppLaunchCategoricalHistogram)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  ATXHistogramData *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  unsigned __int16 v18;
  unsigned __int16 v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _ATXAppLaunchCategoricalHistogram *v24;
  ATXHistogramData *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  unsigned __int16 v30;
  unsigned __int16 v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  _ATXAppLaunchCategoricalHistogram *v35;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("histogram"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = -[ATXHistogramData initWithCategoricalHistogram:]([ATXHistogramData alloc], "initWithCategoricalHistogram:", v4);
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v9, CFSTR("bundleIdToEventId"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    +[ATXHistogramBundleIdTable sharedInstance](ATXHistogramBundleIdTable, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "permutationFrom:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXHistogramData applyPermutationToA:](v5, "applyPermutationToA:", v12);

    v13 = (void *)MEMORY[0x1E0C99E60];
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v16, CFSTR("categoryToCategoryId"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v3, "decodeInt32ForKey:", CFSTR("maxCategoryId"));
    v19 = objc_msgSend(v3, "decodeInt32ForKey:", CFSTR("maxCategoryCount"));
    objc_msgSend(v4, "getLastDatesByCategoryId");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("pruningMethod"));
    v22 = v18;
    v23 = v19;
    v24 = self;
    v25 = v5;
    v26 = v17;
  }
  else
  {
    objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("histogramData"));
    v5 = (ATXHistogramData *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)MEMORY[0x1E0C99E60];
    v28 = objc_opt_class();
    v29 = objc_opt_class();
    objc_msgSend(v27, "setWithObjects:", v28, v29, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v10, CFSTR("categoryToCategoryId"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v3, "decodeInt32ForKey:", CFSTR("maxCategoryId"));
    v31 = objc_msgSend(v3, "decodeInt32ForKey:", CFSTR("maxCategoryCount"));
    v32 = (void *)MEMORY[0x1E0C99E60];
    v33 = objc_opt_class();
    v34 = objc_opt_class();
    objc_msgSend(v32, "setWithObjects:", v33, v34, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v17, CFSTR("lastDates"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("pruningMethod"));
    v22 = v30;
    v23 = v31;
    v24 = self;
    v25 = v5;
    v26 = v16;
  }
  v35 = -[_ATXAppLaunchCategoricalHistogram initWithHistogram:categoryToCategoryId:maxCategoryId:maxCategoryCount:lastDates:pruningMethod:](v24, "initWithHistogram:categoryToCategoryId:maxCategoryId:maxCategoryCount:lastDates:pruningMethod:", v25, v26, v22, v23, v20, v21);

  return v35;
}

- (id)description
{
  void *v3;
  _ATXAppLaunchCategoricalHistogram *v4;
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

  v3 = (void *)objc_opt_new();
  v4 = self;
  objc_sync_enter(v4);
  v5 = (void *)MEMORY[0x1E0CB3940];
  -[NSMutableDictionary description](v4->_categoryToCategoryId, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("categoryToCategoryId=%@\n"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v7);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("maxCategorycount=%u\n"), v4->_maxCategoryCount);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v8);

  v9 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "stringForPruningMethod:", v4->_pruningMethod);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("pruningMethod=%@\n"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v11);

  v12 = (void *)MEMORY[0x1E0CB3940];
  -[ATXHistogramData description](v4->_histogramData, "description");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("categoricalHistogram=%@\n"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v14);

  objc_sync_exit(v4);
  return v3;
}

- (unsigned)categoryCount
{
  _ATXAppLaunchCategoricalHistogram *v2;
  unsigned __int16 v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[NSMutableDictionary count](v2->_categoryToCategoryId, "count");
  objc_sync_exit(v2);

  return v3;
}

- (unsigned)_eventIdforBundleId:(id)a3
{
  id v4;
  _ATXAppLaunchCategoricalHistogram *v5;
  unsigned __int16 v6;
  unsigned __int16 v8;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v8 = 0;
  -[_ATXAppLaunchCategoricalHistogram _tryGetEventIdforBundleId:createIfMissing:eventIdOut:](v5, "_tryGetEventIdforBundleId:createIfMissing:eventIdOut:", v4, 0, &v8);
  v6 = v8;
  objc_sync_exit(v5);

  return v6;
}

- (unsigned)_categoryIdforCategory:(id)a3
{
  id v4;
  _ATXAppLaunchCategoricalHistogram *v5;
  unsigned __int16 v6;
  unsigned __int16 v8;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v8 = 0;
  -[_ATXAppLaunchCategoricalHistogram _tryGetCategoryIdforCategory:createIfMissing:categoryIdOut:](v5, "_tryGetCategoryIdforCategory:createIfMissing:categoryIdOut:", v4, 0, &v8);
  v6 = v8;
  objc_sync_exit(v5);

  return v6;
}

- (int64_t)pruningMethod
{
  return self->_pruningMethod;
}

- (unsigned)maxCategoryCount
{
  return self->_maxCategoryCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prevCategory, 0);
  objc_storeStrong((id *)&self->_lastDates, 0);
  objc_storeStrong((id *)&self->_categoryToCategoryId, 0);
  objc_storeStrong((id *)&self->_uninstallNotificationListener, 0);
  objc_storeStrong((id *)&self->_histogramData, 0);
}

+ (void)stringForPruningMethod:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "stringForPruningMethod called with invalid _ATXAppLaunchCategoricalHistogramPruningMethod value of %lu", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_setMaxCategoryCount:(NSObject *)a3 pruningMethod:.cold.1(_QWORD *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = *a1;
  objc_msgSend((id)objc_opt_class(), "stringForPruningMethod:", *a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 134218242;
  v7 = v4;
  v8 = 2112;
  v9 = v5;
  _os_log_debug_impl(&dword_1C9A3B000, a3, OS_LOG_TYPE_DEBUG, "set _pruningMethod to %lu (%@)", (uint8_t *)&v6, 0x16u);

}

- (void)_setMaxCategoryCount:pruningMethod:.cold.2()
{
  os_log_t v0;
  uint8_t v1[12];
  __int16 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  v2 = 2048;
  v3 = 1;
  _os_log_error_impl(&dword_1C9A3B000, v0, OS_LOG_TYPE_ERROR, "invalid _pruningMethod of %lu -- using default of %lu", v1, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_setMaxCategoryCount:(unsigned __int16 *)a1 pruningMethod:(NSObject *)a2 .cold.3(unsigned __int16 *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 134217984;
  v4 = v2;
  _os_log_debug_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_DEBUG, "set _maxCategoryCount to %lu", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 maxCategoryCount:(uint64_t)a4 pruningMethod:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchCategoricalHistogram.  Use _ATXAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 maxCategoryCount:(uint64_t)a4 pruningMethod:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchCategoricalHistogram.  Use _ATXAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 maxCategoryCount:(uint64_t)a4 pruningMethod:(uint64_t)a5 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchCategoricalHistogram.  Use _ATXAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 maxCategoryCount:(uint64_t)a4 pruningMethod:(uint64_t)a5 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchCategoricalHistogram.  Use _ATXAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 maxCategoryCount:(uint64_t)a4 pruningMethod:(uint64_t)a5 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchCategoricalHistogram.  Use _ATXAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 maxCategoryCount:(uint64_t)a4 pruningMethod:(uint64_t)a5 .cold.6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchCategoricalHistogram.  Use _ATXAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 maxCategoryCount:(uint64_t)a4 pruningMethod:(uint64_t)a5 .cold.7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchCategoricalHistogram.  Use _ATXAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 maxCategoryCount:(uint64_t)a4 pruningMethod:(uint64_t)a5 .cold.8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchCategoricalHistogram.  Use _ATXAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 maxCategoryCount:(uint64_t)a4 pruningMethod:(uint64_t)a5 .cold.9(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchCategoricalHistogram.  Use _ATXAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 maxCategoryCount:(uint64_t)a4 pruningMethod:(uint64_t)a5 .cold.10(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchCategoricalHistogram.  Use _ATXAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 maxCategoryCount:(uint64_t)a4 pruningMethod:(uint64_t)a5 .cold.11(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchCategoricalHistogram.  Use _ATXAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 maxCategoryCount:(uint64_t)a4 pruningMethod:(uint64_t)a5 .cold.12(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchCategoricalHistogram.  Use _ATXAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 maxCategoryCount:(uint64_t)a4 pruningMethod:(uint64_t)a5 .cold.13(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchCategoricalHistogram.  Use _ATXAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 maxCategoryCount:(uint64_t)a4 pruningMethod:(uint64_t)a5 .cold.14(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchCategoricalHistogram.  Use _ATXAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 maxCategoryCount:(uint64_t)a4 pruningMethod:(uint64_t)a5 .cold.15(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchCategoricalHistogram.  Use _ATXAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 maxCategoryCount:(uint64_t)a4 pruningMethod:(uint64_t)a5 .cold.16(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchCategoricalHistogram.  Use _ATXAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 maxCategoryCount:(uint64_t)a4 pruningMethod:(uint64_t)a5 .cold.17(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchCategoricalHistogram.  Use _ATXAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 maxCategoryCount:(uint64_t)a4 pruningMethod:(uint64_t)a5 .cold.18(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchCategoricalHistogram.  Use _ATXAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 maxCategoryCount:(uint64_t)a4 pruningMethod:(uint64_t)a5 .cold.19(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchCategoricalHistogram.  Use _ATXAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 maxCategoryCount:(uint64_t)a4 pruningMethod:(uint64_t)a5 .cold.20(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchCategoricalHistogram.  Use _ATXAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 maxCategoryCount:(uint64_t)a4 pruningMethod:(uint64_t)a5 .cold.21(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchCategoricalHistogram.  Use _ATXAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 maxCategoryCount:(uint64_t)a4 pruningMethod:(uint64_t)a5 .cold.22(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchCategoricalHistogram.  Use _ATXAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 maxCategoryCount:(uint64_t)a4 pruningMethod:(uint64_t)a5 .cold.23(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is deprecated.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 maxCategoryCount:(uint64_t)a4 pruningMethod:(uint64_t)a5 .cold.24(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is deprecated.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 maxCategoryCount:(uint64_t)a4 pruningMethod:(uint64_t)a5 .cold.25(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is deprecated.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 maxCategoryCount:(uint64_t)a4 pruningMethod:(uint64_t)a5 .cold.26(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is deprecated.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 maxCategoryCount:(uint64_t)a4 pruningMethod:(uint64_t)a5 .cold.27(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is deprecated.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 maxCategoryCount:(uint64_t)a4 pruningMethod:(uint64_t)a5 .cold.28(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is deprecated.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 maxCategoryCount:(uint64_t)a4 pruningMethod:(uint64_t)a5 .cold.29(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is deprecated.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 maxCategoryCount:(uint64_t)a4 pruningMethod:(uint64_t)a5 .cold.30(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchCategoricalHistogram.  Use _ATXAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)addLaunchWithBundleId:(const char *)a1 date:category:weight:.cold.2(const char *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_9_2(a1);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6_0(&dword_1C9A3B000, v1, v2, "Category can not be nil in %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1();
}

- (void)_reduceCategoryCountTo:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_ERROR, "Invalid value for _ATXAppLaunchCategoricalHistogramPruningMethod", v1, 2u);
}

- (void)launchCountsForEachCategoryForBundleId:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "Unable to get EventId for BundleId for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end

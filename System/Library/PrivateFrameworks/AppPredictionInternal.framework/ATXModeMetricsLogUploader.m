@implementation ATXModeMetricsLogUploader

- (void)uploadFocusLogsToCoreAnalyticsWithActivity:(id)a3 contactStore:(id)a4
{
  id v5;
  id v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  objc_class *v10;
  id v11;
  os_signpost_id_t v12;
  NSObject *v13;
  objc_class *v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  int v23;
  _BOOL4 v24;
  objc_class *v25;
  id v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  int v33;
  _BOOL4 v34;
  objc_class *v35;
  id v36;
  NSObject *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  NSObject *v42;
  int v43;
  _BOOL4 v44;
  objc_class *v45;
  id v46;
  NSObject *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  NSObject *v52;
  int v53;
  _BOOL4 v54;
  objc_class *v55;
  id v56;
  NSObject *v57;
  NSObject *v58;
  void *v59;
  void *v60;
  NSObject *v61;
  NSObject *v62;
  NSObject *v63;
  NSObject *v64;
  void *v65;
  void *v66;
  NSObject *v67;
  NSObject *v68;
  NSObject *v69;
  NSObject *v70;
  void *v71;
  void *v72;
  NSObject *v73;
  NSObject *v74;
  NSObject *v75;
  NSObject *v76;
  void *v77;
  void *v78;
  NSObject *v79;
  NSObject *v80;
  int v81;
  _BOOL4 v82;
  objc_class *v83;
  objc_class *v84;
  id v85;
  NSObject *v86;
  NSObject *v87;
  void *v88;
  void *v89;
  NSObject *v90;
  NSObject *v91;
  int v92;
  _BOOL4 v93;
  objc_class *v94;
  id v95;
  NSObject *v96;
  NSObject *v97;
  void *v98;
  ATXNotificationTelemetryLogger *v99;
  NSObject *v100;
  NSObject *v101;
  int v102;
  _BOOL4 v103;
  objc_class *v104;
  id v105;
  NSObject *v106;
  NSObject *v107;
  void *v108;
  void *v109;
  NSObject *v110;
  NSObject *v111;
  NSObject *v112;
  objc_class *v113;
  id v114;
  NSObject *v115;
  NSObject *v116;
  void *v117;
  void *v118;
  NSObject *v119;
  NSObject *v120;
  NSObject *v121;
  objc_class *v122;
  id v123;
  NSObject *v124;
  NSObject *v125;
  void *v126;
  void *v127;
  NSObject *v128;
  NSObject *v129;
  NSObject *v130;
  objc_class *v131;
  id v132;
  NSObject *v133;
  NSObject *v134;
  void *v135;
  void *v136;
  NSObject *v137;
  NSObject *v138;
  NSObject *v139;
  objc_class *v140;
  id v141;
  NSObject *v142;
  NSObject *v143;
  void *v144;
  void *v145;
  NSObject *v146;
  NSObject *v147;
  int v148;
  _BOOL4 v149;
  objc_class *v150;
  objc_class *v151;
  id v152;
  NSObject *v153;
  NSObject *v154;
  void *v155;
  ATXModeConfigurationUIFlowMetricLogger *v156;
  NSObject *v157;
  NSObject *v158;
  int v159;
  NSObject *v160;
  _BOOL4 v161;
  objc_class *v162;
  id v163;
  NSObject *v164;
  NSObject *v165;
  void *v166;
  NSObject *v167;
  NSObject *v168;
  objc_class *v169;
  id v170;
  int v171;
  id v172;
  uint64_t v173;

  v173 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "didDefer");
  __atxlog_handle_metrics();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v7)
  {
    v12 = os_signpost_id_generate(v8);

    __atxlog_handle_metrics();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      v171 = 138412290;
      v172 = v15;
      _os_log_impl(&dword_1C9A3B000, v13, OS_LOG_TYPE_INFO, "%@ - Logging app session metrics", (uint8_t *)&v171, 0xCu);

    }
    __atxlog_handle_metrics();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    v18 = v12 - 1;
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      LOWORD(v171) = 0;
      _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v12, "FocusMetricsLogging.SessionMetrics", " enableTelemetry=YES ", (uint8_t *)&v171, 2u);
    }

    v19 = (void *)MEMORY[0x1CAA48B6C]();
    v20 = (void *)objc_opt_new();
    objc_msgSend(v20, "logAppSessionMetricsWithXPCActivity:", v5);

    objc_autoreleasePoolPop(v19);
    __atxlog_handle_metrics();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      LOWORD(v171) = 0;
      _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v22, OS_SIGNPOST_INTERVAL_END, v12, "FocusMetricsLogging.SessionMetrics", " enableTelemetry=YES ", (uint8_t *)&v171, 2u);
    }

    v23 = objc_msgSend(v5, "didDefer");
    __atxlog_handle_metrics();
    v9 = objc_claimAutoreleasedReturnValue();
    v24 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
    if (v23)
    {
      if (!v24)
        goto LABEL_79;
LABEL_76:
      v83 = (objc_class *)objc_opt_class();
      NSStringFromClass(v83);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      v171 = 138412290;
      v172 = v11;
      goto LABEL_77;
    }
    if (v24)
    {
      v25 = (objc_class *)objc_opt_class();
      NSStringFromClass(v25);
      v26 = (id)objc_claimAutoreleasedReturnValue();
      v171 = 138412290;
      v172 = v26;
      _os_log_impl(&dword_1C9A3B000, v9, OS_LOG_TYPE_INFO, "%@ - Logging mode transition metrics", (uint8_t *)&v171, 0xCu);

    }
    __atxlog_handle_metrics();
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
    {
      LOWORD(v171) = 0;
      _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v28, OS_SIGNPOST_INTERVAL_BEGIN, v12, "FocusMetricsLogging.TransitionMetrics", " enableTelemetry=YES ", (uint8_t *)&v171, 2u);
    }

    v29 = (void *)MEMORY[0x1CAA48B6C]();
    v30 = (void *)objc_opt_new();
    objc_msgSend(v30, "uploadLogsToCoreAnalyticsWithXPCActivity:", v5);

    objc_autoreleasePoolPop(v29);
    __atxlog_handle_metrics();
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = v31;
    if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
    {
      LOWORD(v171) = 0;
      _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v32, OS_SIGNPOST_INTERVAL_END, v12, "FocusMetricsLogging.TransitionMetrics", " enableTelemetry=YES ", (uint8_t *)&v171, 2u);
    }

    v33 = objc_msgSend(v5, "didDefer");
    __atxlog_handle_metrics();
    v9 = objc_claimAutoreleasedReturnValue();
    v34 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
    if (v33)
    {
      if (!v34)
        goto LABEL_79;
      goto LABEL_76;
    }
    if (v34)
    {
      v35 = (objc_class *)objc_opt_class();
      NSStringFromClass(v35);
      v36 = (id)objc_claimAutoreleasedReturnValue();
      v171 = 138412290;
      v172 = v36;
      _os_log_impl(&dword_1C9A3B000, v9, OS_LOG_TYPE_INFO, "%@ - Logging mode configuration metrics", (uint8_t *)&v171, 0xCu);

    }
    __atxlog_handle_metrics();
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = v37;
    if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
    {
      LOWORD(v171) = 0;
      _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v38, OS_SIGNPOST_INTERVAL_BEGIN, v12, "FocusMetricsLogging.ModeConfigurations", " enableTelemetry=YES ", (uint8_t *)&v171, 2u);
    }

    v39 = (void *)MEMORY[0x1CAA48B6C]();
    v40 = (void *)objc_opt_new();
    objc_msgSend(v40, "logModeConfigurationsWithXPCActivity:", v5);

    objc_autoreleasePoolPop(v39);
    __atxlog_handle_metrics();
    v41 = objc_claimAutoreleasedReturnValue();
    v42 = v41;
    if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
    {
      LOWORD(v171) = 0;
      _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v42, OS_SIGNPOST_INTERVAL_END, v12, "FocusMetricsLogging.ModeConfigurations", " enableTelemetry=YES ", (uint8_t *)&v171, 2u);
    }

    v43 = objc_msgSend(v5, "didDefer");
    __atxlog_handle_metrics();
    v9 = objc_claimAutoreleasedReturnValue();
    v44 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
    if (v43)
    {
      if (!v44)
        goto LABEL_79;
      goto LABEL_76;
    }
    if (v44)
    {
      v45 = (objc_class *)objc_opt_class();
      NSStringFromClass(v45);
      v46 = (id)objc_claimAutoreleasedReturnValue();
      v171 = 138412290;
      v172 = v46;
      _os_log_impl(&dword_1C9A3B000, v9, OS_LOG_TYPE_INFO, "%@ - Logging notification setting metrics", (uint8_t *)&v171, 0xCu);

    }
    __atxlog_handle_metrics();
    v47 = objc_claimAutoreleasedReturnValue();
    v48 = v47;
    if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v47))
    {
      LOWORD(v171) = 0;
      _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v48, OS_SIGNPOST_INTERVAL_BEGIN, v12, "FocusMetricsLogging.NotificationSettings", " enableTelemetry=YES ", (uint8_t *)&v171, 2u);
    }

    v49 = (void *)MEMORY[0x1CAA48B6C]();
    v50 = (void *)objc_opt_new();
    objc_msgSend(v50, "logNotificationSettingsMetricsWithXPCActivity:", v5);

    objc_autoreleasePoolPop(v49);
    __atxlog_handle_metrics();
    v51 = objc_claimAutoreleasedReturnValue();
    v52 = v51;
    if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v51))
    {
      LOWORD(v171) = 0;
      _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v52, OS_SIGNPOST_INTERVAL_END, v12, "FocusMetricsLogging.NotificationSettings", " enableTelemetry=YES ", (uint8_t *)&v171, 2u);
    }

    v53 = objc_msgSend(v5, "didDefer");
    __atxlog_handle_metrics();
    v9 = objc_claimAutoreleasedReturnValue();
    v54 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
    if (v53)
    {
      if (!v54)
        goto LABEL_79;
      goto LABEL_76;
    }
    if (v54)
    {
      v55 = (objc_class *)objc_opt_class();
      NSStringFromClass(v55);
      v56 = (id)objc_claimAutoreleasedReturnValue();
      v171 = 138412290;
      v172 = v56;
      _os_log_impl(&dword_1C9A3B000, v9, OS_LOG_TYPE_INFO, "%@ - Logging notification adjacent suggestion metrics", (uint8_t *)&v171, 0xCu);

    }
    __atxlog_handle_metrics();
    v57 = objc_claimAutoreleasedReturnValue();
    v58 = v57;
    if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v57))
    {
      LOWORD(v171) = 0;
      _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v58, OS_SIGNPOST_INTERVAL_BEGIN, v12, "FocusMetricsLogging.NotificationAdjacentSuggestions", " enableTelemetry=YES ", (uint8_t *)&v171, 2u);
    }

    v59 = (void *)MEMORY[0x1CAA48B6C]();
    v60 = (void *)objc_opt_new();
    objc_msgSend(v60, "logNotificationAdjacentSuggestionMetricsWithXPCActivity:", v5);

    objc_autoreleasePoolPop(v59);
    __atxlog_handle_metrics();
    v61 = objc_claimAutoreleasedReturnValue();
    v62 = v61;
    if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v61))
    {
      LOWORD(v171) = 0;
      _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v62, OS_SIGNPOST_INTERVAL_END, v12, "FocusMetricsLogging.NotificationAdjacentSuggestions", " enableTelemetry=YES ", (uint8_t *)&v171, 2u);
    }

    __atxlog_handle_metrics();
    v63 = objc_claimAutoreleasedReturnValue();
    v64 = v63;
    if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v63))
    {
      LOWORD(v171) = 0;
      _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v64, OS_SIGNPOST_INTERVAL_BEGIN, v12, "FocusMetricsLogging.OnboardingSuggestions", " enableTelemetry=YES ", (uint8_t *)&v171, 2u);
    }

    v65 = (void *)MEMORY[0x1CAA48B6C]();
    v66 = (void *)objc_opt_new();
    objc_msgSend(v66, "logDigestOnboardingSuggestionMetricsWithXPCActivity:", v5);

    objc_autoreleasePoolPop(v65);
    __atxlog_handle_metrics();
    v67 = objc_claimAutoreleasedReturnValue();
    v68 = v67;
    if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v67))
    {
      LOWORD(v171) = 0;
      _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v68, OS_SIGNPOST_INTERVAL_END, v12, "FocusMetricsLogging.OnboardingSuggestions", " enableTelemetry=YES ", (uint8_t *)&v171, 2u);
    }

    __atxlog_handle_metrics();
    v69 = objc_claimAutoreleasedReturnValue();
    v70 = v69;
    if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v69))
    {
      LOWORD(v171) = 0;
      _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v70, OS_SIGNPOST_INTERVAL_BEGIN, v12, "FocusMetricsLogging.OnboardingMetrics", " enableTelemetry=YES ", (uint8_t *)&v171, 2u);
    }

    v71 = (void *)MEMORY[0x1CAA48B6C]();
    v72 = (void *)objc_opt_new();
    objc_msgSend(v72, "logDigestOnboardingMetricsWithXPCActivity:", v5);

    objc_autoreleasePoolPop(v71);
    __atxlog_handle_metrics();
    v73 = objc_claimAutoreleasedReturnValue();
    v74 = v73;
    if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v73))
    {
      LOWORD(v171) = 0;
      _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v74, OS_SIGNPOST_INTERVAL_END, v12, "FocusMetricsLogging.OnboardingMetrics", " enableTelemetry=YES ", (uint8_t *)&v171, 2u);
    }

    __atxlog_handle_metrics();
    v75 = objc_claimAutoreleasedReturnValue();
    v76 = v75;
    if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v75))
    {
      LOWORD(v171) = 0;
      _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v76, OS_SIGNPOST_INTERVAL_BEGIN, v12, "FocusMetricsLogging.OnboardingAppSelectionMetrics", " enableTelemetry=YES ", (uint8_t *)&v171, 2u);
    }

    v77 = (void *)MEMORY[0x1CAA48B6C]();
    v78 = (void *)objc_opt_new();
    objc_msgSend(v78, "logDigestOnboardingAppSelectionMetricsWithXPCActivity:", v5);

    objc_autoreleasePoolPop(v77);
    __atxlog_handle_metrics();
    v79 = objc_claimAutoreleasedReturnValue();
    v80 = v79;
    if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v79))
    {
      LOWORD(v171) = 0;
      _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v80, OS_SIGNPOST_INTERVAL_END, v12, "FocusMetricsLogging.OnboardingAppSelectionMetrics", " enableTelemetry=YES ", (uint8_t *)&v171, 2u);
    }

    v81 = objc_msgSend(v5, "didDefer");
    __atxlog_handle_metrics();
    v9 = objc_claimAutoreleasedReturnValue();
    v82 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
    if (v81)
    {
      if (!v82)
        goto LABEL_79;
      goto LABEL_76;
    }
    if (v82)
    {
      v84 = (objc_class *)objc_opt_class();
      NSStringFromClass(v84);
      v85 = (id)objc_claimAutoreleasedReturnValue();
      v171 = 138412290;
      v172 = v85;
      _os_log_impl(&dword_1C9A3B000, v9, OS_LOG_TYPE_INFO, "%@ - Logging device usage metrics", (uint8_t *)&v171, 0xCu);

    }
    __atxlog_handle_metrics();
    v86 = objc_claimAutoreleasedReturnValue();
    v87 = v86;
    if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v86))
    {
      LOWORD(v171) = 0;
      _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v87, OS_SIGNPOST_INTERVAL_BEGIN, v12, "FocusMetricsLogging.DeviceUsage", " enableTelemetry=YES ", (uint8_t *)&v171, 2u);
    }

    v88 = (void *)MEMORY[0x1CAA48B6C]();
    v89 = (void *)objc_opt_new();
    objc_msgSend(v89, "logDeviceUsageWithXPCActivity:", v5);

    objc_autoreleasePoolPop(v88);
    __atxlog_handle_metrics();
    v90 = objc_claimAutoreleasedReturnValue();
    v91 = v90;
    if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v90))
    {
      LOWORD(v171) = 0;
      _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v91, OS_SIGNPOST_INTERVAL_END, v12, "FocusMetricsLogging.DeviceUsage", " enableTelemetry=YES ", (uint8_t *)&v171, 2u);
    }

    v92 = objc_msgSend(v5, "didDefer");
    __atxlog_handle_metrics();
    v9 = objc_claimAutoreleasedReturnValue();
    v93 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
    if (v92)
    {
      if (!v93)
        goto LABEL_79;
      goto LABEL_144;
    }
    if (v93)
    {
      v94 = (objc_class *)objc_opt_class();
      NSStringFromClass(v94);
      v95 = (id)objc_claimAutoreleasedReturnValue();
      v171 = 138412290;
      v172 = v95;
      _os_log_impl(&dword_1C9A3B000, v9, OS_LOG_TYPE_INFO, "%@ - Logging notification metrics", (uint8_t *)&v171, 0xCu);

    }
    __atxlog_handle_metrics();
    v96 = objc_claimAutoreleasedReturnValue();
    v97 = v96;
    if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v96))
    {
      LOWORD(v171) = 0;
      _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v97, OS_SIGNPOST_INTERVAL_BEGIN, v12, "FocusMetricsLogging.NotificationTelemetry", " enableTelemetry=YES ", (uint8_t *)&v171, 2u);
    }

    v98 = (void *)MEMORY[0x1CAA48B6C]();
    v99 = -[ATXNotificationTelemetryLogger initWithContactStore:]([ATXNotificationTelemetryLogger alloc], "initWithContactStore:", v6);
    -[ATXNotificationTelemetryLogger logNotificationMetricsWithXPCActivity:](v99, "logNotificationMetricsWithXPCActivity:", v5);

    objc_autoreleasePoolPop(v98);
    __atxlog_handle_metrics();
    v100 = objc_claimAutoreleasedReturnValue();
    v101 = v100;
    if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v100))
    {
      LOWORD(v171) = 0;
      _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v101, OS_SIGNPOST_INTERVAL_END, v12, "FocusMetricsLogging.NotificationTelemetry", " enableTelemetry=YES ", (uint8_t *)&v171, 2u);
    }

    v102 = objc_msgSend(v5, "didDefer");
    __atxlog_handle_metrics();
    v9 = objc_claimAutoreleasedReturnValue();
    v103 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
    if (v102)
    {
      if (!v103)
        goto LABEL_79;
      goto LABEL_144;
    }
    if (v103)
    {
      v104 = (objc_class *)objc_opt_class();
      NSStringFromClass(v104);
      v105 = (id)objc_claimAutoreleasedReturnValue();
      v171 = 138412290;
      v172 = v105;
      _os_log_impl(&dword_1C9A3B000, v9, OS_LOG_TYPE_INFO, "%@ - Logging missed notification ranking metrics", (uint8_t *)&v171, 0xCu);

    }
    __atxlog_handle_metrics();
    v106 = objc_claimAutoreleasedReturnValue();
    v107 = v106;
    if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v106))
    {
      LOWORD(v171) = 0;
      _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v107, OS_SIGNPOST_INTERVAL_BEGIN, v12, "FocusMetricsLogging.MissedNotificationRanking", " enableTelemetry=YES ", (uint8_t *)&v171, 2u);
    }

    v108 = (void *)MEMORY[0x1CAA48B6C]();
    v109 = (void *)objc_opt_new();
    objc_msgSend(v109, "logMetricsWithXPCActivity:", v5);

    objc_autoreleasePoolPop(v108);
    __atxlog_handle_metrics();
    v110 = objc_claimAutoreleasedReturnValue();
    v111 = v110;
    if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v110))
    {
      LOWORD(v171) = 0;
      _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v111, OS_SIGNPOST_INTERVAL_END, v12, "FocusMetricsLogging.MissedNotificationRanking", " enableTelemetry=YES ", (uint8_t *)&v171, 2u);
    }

    __atxlog_handle_metrics();
    v112 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v112, OS_LOG_TYPE_INFO))
    {
      v113 = (objc_class *)objc_opt_class();
      NSStringFromClass(v113);
      v114 = (id)objc_claimAutoreleasedReturnValue();
      v171 = 138412290;
      v172 = v114;
      _os_log_impl(&dword_1C9A3B000, v112, OS_LOG_TYPE_INFO, "%@ - Logging AppConfiguration metrics", (uint8_t *)&v171, 0xCu);

    }
    __atxlog_handle_metrics();
    v115 = objc_claimAutoreleasedReturnValue();
    v116 = v115;
    if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v115))
    {
      LOWORD(v171) = 0;
      _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v116, OS_SIGNPOST_INTERVAL_BEGIN, v12, "FocusMetricsLogging.AppConfigurationMetrics", " enableTelemetry=YES ", (uint8_t *)&v171, 2u);
    }

    v117 = (void *)MEMORY[0x1CAA48B6C]();
    v118 = (void *)objc_opt_new();
    objc_msgSend(v118, "logMetricsWithXPCActivity:", v5);

    objc_autoreleasePoolPop(v117);
    __atxlog_handle_metrics();
    v119 = objc_claimAutoreleasedReturnValue();
    v120 = v119;
    if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v119))
    {
      LOWORD(v171) = 0;
      _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v120, OS_SIGNPOST_INTERVAL_END, v12, "FocusMetricsLogging.AppConfigurationMetrics", " enableTelemetry=YES ", (uint8_t *)&v171, 2u);
    }

    __atxlog_handle_metrics();
    v121 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v121, OS_LOG_TYPE_INFO))
    {
      v122 = (objc_class *)objc_opt_class();
      NSStringFromClass(v122);
      v123 = (id)objc_claimAutoreleasedReturnValue();
      v171 = 138412290;
      v172 = v123;
      _os_log_impl(&dword_1C9A3B000, v121, OS_LOG_TYPE_INFO, "%@ - Logging Home Screen Focus Suggestion metrics", (uint8_t *)&v171, 0xCu);

    }
    __atxlog_handle_metrics();
    v124 = objc_claimAutoreleasedReturnValue();
    v125 = v124;
    if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v124))
    {
      LOWORD(v171) = 0;
      _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v125, OS_SIGNPOST_INTERVAL_BEGIN, v12, "FocusMetricsLogging.HomeScreenFocusSuggestionMetrics", " enableTelemetry=YES ", (uint8_t *)&v171, 2u);
    }

    v126 = (void *)MEMORY[0x1CAA48B6C]();
    v127 = (void *)objc_opt_new();
    objc_msgSend(v127, "logHomeScreenFocusSuggestionMetrics");

    objc_autoreleasePoolPop(v126);
    __atxlog_handle_metrics();
    v128 = objc_claimAutoreleasedReturnValue();
    v129 = v128;
    if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v128))
    {
      LOWORD(v171) = 0;
      _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v129, OS_SIGNPOST_INTERVAL_END, v12, "FocusMetricsLogging.HomeScreenFocusSuggestionMetrics", " enableTelemetry=YES ", (uint8_t *)&v171, 2u);
    }

    __atxlog_handle_metrics();
    v130 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v130, OS_LOG_TYPE_INFO))
    {
      v131 = (objc_class *)objc_opt_class();
      NSStringFromClass(v131);
      v132 = (id)objc_claimAutoreleasedReturnValue();
      v171 = 138412290;
      v172 = v132;
      _os_log_impl(&dword_1C9A3B000, v130, OS_LOG_TYPE_INFO, "%@ - Logging Mode Setup Experience metrics", (uint8_t *)&v171, 0xCu);

    }
    __atxlog_handle_metrics();
    v133 = objc_claimAutoreleasedReturnValue();
    v134 = v133;
    if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v133))
    {
      LOWORD(v171) = 0;
      _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v134, OS_SIGNPOST_INTERVAL_BEGIN, v12, "FocusMetricsLogging.ModeSetupExperienceMetrics", " enableTelemetry=YES ", (uint8_t *)&v171, 2u);
    }

    v135 = (void *)MEMORY[0x1CAA48B6C]();
    v136 = (void *)objc_opt_new();
    objc_msgSend(v136, "logMetrics");

    objc_autoreleasePoolPop(v135);
    __atxlog_handle_metrics();
    v137 = objc_claimAutoreleasedReturnValue();
    v138 = v137;
    if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v137))
    {
      LOWORD(v171) = 0;
      _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v138, OS_SIGNPOST_INTERVAL_END, v12, "FocusMetricsLogging.ModeSetupExperienceMetrics", " enableTelemetry=YES ", (uint8_t *)&v171, 2u);
    }

    __atxlog_handle_metrics();
    v139 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v139, OS_LOG_TYPE_INFO))
    {
      v140 = (objc_class *)objc_opt_class();
      NSStringFromClass(v140);
      v141 = (id)objc_claimAutoreleasedReturnValue();
      v171 = 138412290;
      v172 = v141;
      _os_log_impl(&dword_1C9A3B000, v139, OS_LOG_TYPE_INFO, "%@ - Logging Focus Mode Setup Prediction metrics", (uint8_t *)&v171, 0xCu);

    }
    __atxlog_handle_metrics();
    v142 = objc_claimAutoreleasedReturnValue();
    v143 = v142;
    if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v142))
    {
      LOWORD(v171) = 0;
      _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v143, OS_SIGNPOST_INTERVAL_BEGIN, v12, "FocusMetricsLogging.ModeSetupPredictionMetrics", " enableTelemetry=YES ", (uint8_t *)&v171, 2u);
    }

    v144 = (void *)MEMORY[0x1CAA48B6C]();
    v145 = (void *)objc_opt_new();
    objc_msgSend(v145, "logMetrics");

    objc_autoreleasePoolPop(v144);
    __atxlog_handle_metrics();
    v146 = objc_claimAutoreleasedReturnValue();
    v147 = v146;
    if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v146))
    {
      LOWORD(v171) = 0;
      _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v147, OS_SIGNPOST_INTERVAL_END, v12, "FocusMetricsLogging.ModeSetupPredictionMetrics", " enableTelemetry=YES ", (uint8_t *)&v171, 2u);
    }

    v148 = objc_msgSend(v5, "didDefer");
    __atxlog_handle_metrics();
    v9 = objc_claimAutoreleasedReturnValue();
    v149 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
    if (v148)
    {
      if (!v149)
        goto LABEL_79;
LABEL_144:
      v150 = (objc_class *)objc_opt_class();
      NSStringFromClass(v150);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      v171 = 138412290;
      v172 = v11;
      _os_log_impl(&dword_1C9A3B000, v9, OS_LOG_TYPE_INFO, "%@ - Terminating due to XPC deferral", (uint8_t *)&v171, 0xCu);

      goto LABEL_78;
    }
    if (v149)
    {
      v151 = (objc_class *)objc_opt_class();
      NSStringFromClass(v151);
      v152 = (id)objc_claimAutoreleasedReturnValue();
      v171 = 138412290;
      v172 = v152;
      _os_log_impl(&dword_1C9A3B000, v9, OS_LOG_TYPE_INFO, "%@ - Logging mode configuration UI flow metrics and signals for apps and contacts", (uint8_t *)&v171, 0xCu);

    }
    __atxlog_handle_metrics();
    v153 = objc_claimAutoreleasedReturnValue();
    v154 = v153;
    if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v153))
    {
      LOWORD(v171) = 0;
      _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v154, OS_SIGNPOST_INTERVAL_BEGIN, v12, "FocusMetricsLogging.UIFlow", " enableTelemetry=YES ", (uint8_t *)&v171, 2u);
    }

    v9 = objc_opt_new();
    v155 = (void *)MEMORY[0x1CAA48B6C]();
    v156 = -[ATXModeConfigurationUIFlowMetricLogger initWithFocusModeSignalsLogger:contactStore:]([ATXModeConfigurationUIFlowMetricLogger alloc], "initWithFocusModeSignalsLogger:contactStore:", v9, v6);
    -[ATXModeConfigurationUIFlowMetricLogger logModeConfigurationUIFlowMetricWithXPCActivity:](v156, "logModeConfigurationUIFlowMetricWithXPCActivity:", v5);

    objc_autoreleasePoolPop(v155);
    __atxlog_handle_metrics();
    v157 = objc_claimAutoreleasedReturnValue();
    v158 = v157;
    if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v157))
    {
      LOWORD(v171) = 0;
      _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v158, OS_SIGNPOST_INTERVAL_END, v12, "FocusMetricsLogging.UIFlow", " enableTelemetry=YES ", (uint8_t *)&v171, 2u);
    }

    v159 = objc_msgSend(v5, "didDefer");
    __atxlog_handle_metrics();
    v160 = objc_claimAutoreleasedReturnValue();
    v161 = os_log_type_enabled(v160, OS_LOG_TYPE_INFO);
    if (v159)
    {
      if (v161)
      {
LABEL_166:
        v169 = (objc_class *)objc_opt_class();
        NSStringFromClass(v169);
        v170 = (id)objc_claimAutoreleasedReturnValue();
        v171 = 138412290;
        v172 = v170;
        _os_log_impl(&dword_1C9A3B000, v160, OS_LOG_TYPE_INFO, "%@ - Terminating due to XPC deferral", (uint8_t *)&v171, 0xCu);

      }
    }
    else
    {
      if (v161)
      {
        v162 = (objc_class *)objc_opt_class();
        NSStringFromClass(v162);
        v163 = (id)objc_claimAutoreleasedReturnValue();
        v171 = 138412290;
        v172 = v163;
        _os_log_impl(&dword_1C9A3B000, v160, OS_LOG_TYPE_INFO, "%@ - Logging focus mode signals for Wigets", (uint8_t *)&v171, 0xCu);

      }
      __atxlog_handle_metrics();
      v164 = objc_claimAutoreleasedReturnValue();
      v165 = v164;
      if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v164))
      {
        LOWORD(v171) = 0;
        _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v165, OS_SIGNPOST_INTERVAL_BEGIN, v12, "FocusMetricsLogging.WidgetSignals", " enableTelemetry=YES ", (uint8_t *)&v171, 2u);
      }

      v166 = (void *)MEMORY[0x1CAA48B6C]();
      -[NSObject logFocusModeWidgetSignalsWithXPCActivity:](v9, "logFocusModeWidgetSignalsWithXPCActivity:", v5);
      objc_autoreleasePoolPop(v166);
      __atxlog_handle_metrics();
      v167 = objc_claimAutoreleasedReturnValue();
      v168 = v167;
      if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v167))
      {
        LOWORD(v171) = 0;
        _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v168, OS_SIGNPOST_INTERVAL_END, v12, "FocusMetricsLogging.WidgetSignals", " enableTelemetry=YES ", (uint8_t *)&v171, 2u);
      }

      if (!objc_msgSend(v5, "didDefer"))
        goto LABEL_79;
      __atxlog_handle_metrics();
      v160 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v160, OS_LOG_TYPE_INFO))
        goto LABEL_166;
    }

    goto LABEL_79;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v171 = 138412290;
    v172 = v11;
LABEL_77:
    _os_log_impl(&dword_1C9A3B000, v9, OS_LOG_TYPE_INFO, "%@ - Terminating due to XPC deferral", (uint8_t *)&v171, 0xCu);
LABEL_78:

  }
LABEL_79:

}

@end

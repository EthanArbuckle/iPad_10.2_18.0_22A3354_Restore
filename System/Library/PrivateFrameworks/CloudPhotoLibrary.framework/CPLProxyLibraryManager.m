@implementation CPLProxyLibraryManager

+ (id)daemonProtocolInterface
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  id v25;
  id v26;
  void *v27;
  NSObject *v28;
  id v29;
  id v30;
  void *v31;
  NSObject *v32;
  id v33;
  id v34;
  void *v35;
  NSObject *v36;
  id v37;
  id v38;
  void *v39;
  NSObject *v40;
  id v41;
  id v42;
  void *v43;
  NSObject *v44;
  id v45;
  id v46;
  void *v47;
  uint64_t v48;
  void *v49;
  NSObject *v50;
  id v51;
  id v52;
  void *v53;
  uint64_t v54;
  void *v55;
  NSObject *v56;
  id v57;
  id v58;
  void *v59;
  uint64_t v60;
  void *v61;
  NSObject *v62;
  id v63;
  id v64;
  void *v65;
  uint64_t v66;
  void *v67;
  NSObject *v68;
  id v69;
  id v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  NSObject *v75;
  id v76;
  id v77;
  void *v78;
  uint64_t v79;
  void *v80;
  NSObject *v81;
  id v82;
  id v83;
  void *v84;
  uint64_t v85;
  void *v86;
  NSObject *v87;
  id v88;
  id v89;
  void *v90;
  uint64_t v91;
  void *v92;
  NSObject *v93;
  id v94;
  id v95;
  void *v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  NSObject *v100;
  id v101;
  id v102;
  void *v103;
  uint64_t v104;
  void *v105;
  NSObject *v106;
  id v107;
  id v108;
  void *v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  NSObject *v113;
  id v114;
  id v115;
  void *v116;
  uint64_t v117;
  void *v118;
  NSObject *v119;
  id v120;
  id v121;
  void *v122;
  uint64_t v123;
  void *v124;
  NSObject *v125;
  id v126;
  id v127;
  void *v128;
  uint64_t v129;
  void *v130;
  NSObject *v131;
  id v132;
  id v133;
  void *v134;
  uint64_t v135;
  void *v136;
  NSObject *v137;
  id v138;
  id v139;
  void *v140;
  uint64_t v141;
  void *v142;
  NSObject *v143;
  id v144;
  id v145;
  void *v146;
  uint64_t v147;
  void *v148;
  NSObject *v149;
  id v150;
  id v151;
  void *v152;
  uint64_t v153;
  uint64_t v154;
  void *v155;
  NSObject *v156;
  id v157;
  id v158;
  void *v159;
  uint64_t v160;
  void *v161;
  NSObject *v162;
  id v163;
  id v164;
  void *v165;
  uint64_t v166;
  uint64_t v167;
  void *v168;
  NSObject *v169;
  id v170;
  id v171;
  void *v172;
  uint64_t v173;
  uint64_t v174;
  void *v175;
  NSObject *v176;
  id v177;
  id v178;
  void *v179;
  uint64_t v180;
  void *v181;
  NSObject *v182;
  id v183;
  id v184;
  id v185;
  uint8_t buf[4];
  id v188;
  __int16 v189;
  id v190;
  __int16 v191;
  uint64_t v192;
  uint64_t v193;

  v193 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEEE3218);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_resolveLocalScopedIdentifiersForCloudScopedIdentifiers_completionHandler_, 0, 0);

  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v2, "classesForSelector:argumentIndex:ofReply:", sel_resolveLocalScopedIdentifiersForCloudScopedIdentifiers_completionHandler_, 0, 0);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel_resolveLocalScopedIdentifiersForCloudScopedIdentifiers_completionHandler_);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v188 = v7;
      v189 = 2112;
      v190 = v8;
      v191 = 2048;
      v192 = 0;
      _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_DEBUG, "Registering %@ for %@ argument #%lu", buf, 0x20u);

    }
  }
  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_resolveLocalScopedIdentifiersForCloudScopedIdentifiers_completionHandler_, 0, 1);

  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v2, "classesForSelector:argumentIndex:ofReply:", sel_resolveLocalScopedIdentifiersForCloudScopedIdentifiers_completionHandler_, 0, 1);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel_resolveLocalScopedIdentifiersForCloudScopedIdentifiers_completionHandler_);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v188 = v13;
      v189 = 2112;
      v190 = v14;
      v191 = 2048;
      v192 = 0;
      _os_log_impl(&dword_1B03C2000, v12, OS_LOG_TYPE_DEBUG, "Registering %@ for %@ argument #%lu of reply", buf, 0x20u);

    }
  }
  v15 = (void *)MEMORY[0x1E0C99E60];
  v16 = objc_opt_class();
  objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_getMappedScopedIdentifiersForScopedIdentifiers_inAreLocalIdentifiers_completionHandler_, 0, 0);

  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v2, "classesForSelector:argumentIndex:ofReply:", sel_getMappedScopedIdentifiersForScopedIdentifiers_inAreLocalIdentifiers_completionHandler_, 0, 0);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel_getMappedScopedIdentifiersForScopedIdentifiers_inAreLocalIdentifiers_completionHandler_);
      v20 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v188 = v19;
      v189 = 2112;
      v190 = v20;
      v191 = 2048;
      v192 = 0;
      _os_log_impl(&dword_1B03C2000, v18, OS_LOG_TYPE_DEBUG, "Registering %@ for %@ argument #%lu", buf, 0x20u);

    }
  }
  v21 = (void *)MEMORY[0x1E0C99E60];
  v22 = objc_opt_class();
  objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_getMappedScopedIdentifiersForScopedIdentifiers_inAreLocalIdentifiers_completionHandler_, 0, 1);

  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v2, "classesForSelector:argumentIndex:ofReply:", sel_getMappedScopedIdentifiersForScopedIdentifiers_inAreLocalIdentifiers_completionHandler_, 0, 1);
      v25 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel_getMappedScopedIdentifiersForScopedIdentifiers_inAreLocalIdentifiers_completionHandler_);
      v26 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v188 = v25;
      v189 = 2112;
      v190 = v26;
      v191 = 2048;
      v192 = 0;
      _os_log_impl(&dword_1B03C2000, v24, OS_LOG_TYPE_DEBUG, "Registering %@ for %@ argument #%lu of reply", buf, 0x20u);

    }
  }
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v27, sel_beginDownloadForResource_clientBundleID_options_proposedTaskIdentifier_reply_, 0, 0);

  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v2, "classesForSelector:argumentIndex:ofReply:", sel_beginDownloadForResource_clientBundleID_options_proposedTaskIdentifier_reply_, 0, 0);
      v29 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel_beginDownloadForResource_clientBundleID_options_proposedTaskIdentifier_reply_);
      v30 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v188 = v29;
      v189 = 2112;
      v190 = v30;
      v191 = 2048;
      v192 = 0;
      _os_log_impl(&dword_1B03C2000, v28, OS_LOG_TYPE_DEBUG, "Registering %@ for %@ argument #%lu", buf, 0x20u);

    }
  }
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v31, sel_beginDownloadForResource_clientBundleID_options_proposedTaskIdentifier_reply_, 2, 0);

  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v2, "classesForSelector:argumentIndex:ofReply:", sel_beginDownloadForResource_clientBundleID_options_proposedTaskIdentifier_reply_, 2, 0);
      v33 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel_beginDownloadForResource_clientBundleID_options_proposedTaskIdentifier_reply_);
      v34 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v188 = v33;
      v189 = 2112;
      v190 = v34;
      v191 = 2048;
      v192 = 2;
      _os_log_impl(&dword_1B03C2000, v32, OS_LOG_TYPE_DEBUG, "Registering %@ for %@ argument #%lu", buf, 0x20u);

    }
  }
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v35, sel_getChangeBatchWithCompletionHandler_, 1, 1);

  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v2, "classesForSelector:argumentIndex:ofReply:", sel_getChangeBatchWithCompletionHandler_, 1, 1);
      v37 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel_getChangeBatchWithCompletionHandler_);
      v38 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v188 = v37;
      v189 = 2112;
      v190 = v38;
      v191 = 2048;
      v192 = 1;
      _os_log_impl(&dword_1B03C2000, v36, OS_LOG_TYPE_DEBUG, "Registering %@ for %@ argument #%lu of reply", buf, 0x20u);

    }
  }
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v39, sel_acknowledgeChangeBatch_withCompletionHandler_, 0, 0);

  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v2, "classesForSelector:argumentIndex:ofReply:", sel_acknowledgeChangeBatch_withCompletionHandler_, 0, 0);
      v41 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel_acknowledgeChangeBatch_withCompletionHandler_);
      v42 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v188 = v41;
      v189 = 2112;
      v190 = v42;
      v191 = 2048;
      v192 = 0;
      _os_log_impl(&dword_1B03C2000, v40, OS_LOG_TYPE_DEBUG, "Registering %@ for %@ argument #%lu", buf, 0x20u);

    }
  }
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v43, sel_commitChangeBatch_withCompletionHandler_, 0, 0);

  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v2, "classesForSelector:argumentIndex:ofReply:", sel_commitChangeBatch_withCompletionHandler_, 0, 0);
      v45 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel_commitChangeBatch_withCompletionHandler_);
      v46 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v188 = v45;
      v189 = 2112;
      v190 = v46;
      v191 = 2048;
      v192 = 0;
      _os_log_impl(&dword_1B03C2000, v44, OS_LOG_TYPE_DEBUG, "Registering %@ for %@ argument #%lu", buf, 0x20u);

    }
  }
  v47 = (void *)MEMORY[0x1E0C99E60];
  v48 = objc_opt_class();
  objc_msgSend(v47, "setWithObjects:", v48, objc_opt_class(), 0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v49, sel_deleteResources_checkServerIfNecessary_completionHandler_, 0, 0);

  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v2, "classesForSelector:argumentIndex:ofReply:", sel_deleteResources_checkServerIfNecessary_completionHandler_, 0, 0);
      v51 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel_deleteResources_checkServerIfNecessary_completionHandler_);
      v52 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v188 = v51;
      v189 = 2112;
      v190 = v52;
      v191 = 2048;
      v192 = 0;
      _os_log_impl(&dword_1B03C2000, v50, OS_LOG_TYPE_DEBUG, "Registering %@ for %@ argument #%lu", buf, 0x20u);

    }
  }
  v53 = (void *)MEMORY[0x1E0C99E60];
  v54 = objc_opt_class();
  objc_msgSend(v53, "setWithObjects:", v54, objc_opt_class(), 0);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v55, sel_checkResourcesAreSafeToPrune_checkServerIfNecessary_completionHandler_, 0, 0);

  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v56 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v2, "classesForSelector:argumentIndex:ofReply:", sel_checkResourcesAreSafeToPrune_checkServerIfNecessary_completionHandler_, 0, 0);
      v57 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel_checkResourcesAreSafeToPrune_checkServerIfNecessary_completionHandler_);
      v58 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v188 = v57;
      v189 = 2112;
      v190 = v58;
      v191 = 2048;
      v192 = 0;
      _os_log_impl(&dword_1B03C2000, v56, OS_LOG_TYPE_DEBUG, "Registering %@ for %@ argument #%lu", buf, 0x20u);

    }
  }
  v59 = (void *)MEMORY[0x1E0C99E60];
  v60 = objc_opt_class();
  objc_msgSend(v59, "setWithObjects:", v60, objc_opt_class(), 0);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v61, sel_acknowledgeChangedStatuses_, 0, 0);

  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v62 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v2, "classesForSelector:argumentIndex:ofReply:", sel_acknowledgeChangedStatuses_, 0, 0);
      v63 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel_acknowledgeChangedStatuses_);
      v64 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v188 = v63;
      v189 = 2112;
      v190 = v64;
      v191 = 2048;
      v192 = 0;
      _os_log_impl(&dword_1B03C2000, v62, OS_LOG_TYPE_DEBUG, "Registering %@ for %@ argument #%lu", buf, 0x20u);

    }
  }
  v65 = (void *)MEMORY[0x1E0C99E60];
  v66 = objc_opt_class();
  objc_msgSend(v65, "setWithObjects:", v66, objc_opt_class(), 0);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v67, sel_getStatusForRecordsWithScopedIdentifiers_completionHandler_, 0, 0);

  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v68 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v2, "classesForSelector:argumentIndex:ofReply:", sel_getStatusForRecordsWithScopedIdentifiers_completionHandler_, 0, 0);
      v69 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel_getStatusForRecordsWithScopedIdentifiers_completionHandler_);
      v70 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v188 = v69;
      v189 = 2112;
      v190 = v70;
      v191 = 2048;
      v192 = 0;
      _os_log_impl(&dword_1B03C2000, v68, OS_LOG_TYPE_DEBUG, "Registering %@ for %@ argument #%lu", buf, 0x20u);

    }
  }
  v71 = (void *)MEMORY[0x1E0C99E60];
  v72 = objc_opt_class();
  v73 = objc_opt_class();
  objc_msgSend(v71, "setWithObjects:", v72, v73, objc_opt_class(), 0);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v74, sel_getStatusForRecordsWithScopedIdentifiers_completionHandler_, 0, 1);

  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v75 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v2, "classesForSelector:argumentIndex:ofReply:", sel_getStatusForRecordsWithScopedIdentifiers_completionHandler_, 0, 1);
      v76 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel_getStatusForRecordsWithScopedIdentifiers_completionHandler_);
      v77 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v188 = v76;
      v189 = 2112;
      v190 = v77;
      v191 = 2048;
      v192 = 0;
      _os_log_impl(&dword_1B03C2000, v75, OS_LOG_TYPE_DEBUG, "Registering %@ for %@ argument #%lu of reply", buf, 0x20u);

    }
  }
  v78 = (void *)MEMORY[0x1E0C99E60];
  v79 = objc_opt_class();
  objc_msgSend(v78, "setWithObjects:", v79, objc_opt_class(), 0);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v80, sel_getChangedStatusesWithCompletionHandler_, 0, 1);

  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v81 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v2, "classesForSelector:argumentIndex:ofReply:", sel_getChangedStatusesWithCompletionHandler_, 0, 1);
      v82 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel_getChangedStatusesWithCompletionHandler_);
      v83 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v188 = v82;
      v189 = 2112;
      v190 = v83;
      v191 = 2048;
      v192 = 0;
      _os_log_impl(&dword_1B03C2000, v81, OS_LOG_TYPE_DEBUG, "Registering %@ for %@ argument #%lu of reply", buf, 0x20u);

    }
  }
  v84 = (void *)MEMORY[0x1E0C99E60];
  v85 = objc_opt_class();
  objc_msgSend(v84, "setWithObjects:", v85, objc_opt_class(), 0);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v86, sel_addStatusChangesForRecordsWithScopedIdentifiers_persist_, 0, 0);

  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v87 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v87, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v2, "classesForSelector:argumentIndex:ofReply:", sel_addStatusChangesForRecordsWithScopedIdentifiers_persist_, 0, 0);
      v88 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel_addStatusChangesForRecordsWithScopedIdentifiers_persist_);
      v89 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v188 = v88;
      v189 = 2112;
      v190 = v89;
      v191 = 2048;
      v192 = 0;
      _os_log_impl(&dword_1B03C2000, v87, OS_LOG_TYPE_DEBUG, "Registering %@ for %@ argument #%lu", buf, 0x20u);

    }
  }
  v90 = (void *)MEMORY[0x1E0C99E60];
  v91 = objc_opt_class();
  objc_msgSend(v90, "setWithObjects:", v91, objc_opt_class(), 0);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v92, sel_deleteResources_checkServerIfNecessary_completionHandler_, 0, 1);

  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v93 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v93, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v2, "classesForSelector:argumentIndex:ofReply:", sel_deleteResources_checkServerIfNecessary_completionHandler_, 0, 1);
      v94 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel_deleteResources_checkServerIfNecessary_completionHandler_);
      v95 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v188 = v94;
      v189 = 2112;
      v190 = v95;
      v191 = 2048;
      v192 = 0;
      _os_log_impl(&dword_1B03C2000, v93, OS_LOG_TYPE_DEBUG, "Registering %@ for %@ argument #%lu of reply", buf, 0x20u);

    }
  }
  v96 = (void *)MEMORY[0x1E0C99E60];
  v97 = objc_opt_class();
  v98 = objc_opt_class();
  objc_msgSend(v96, "setWithObjects:", v97, v98, objc_opt_class(), 0);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v99, sel_deleteResources_checkServerIfNecessary_completionHandler_, 1, 1);

  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v100 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v100, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v2, "classesForSelector:argumentIndex:ofReply:", sel_deleteResources_checkServerIfNecessary_completionHandler_, 1, 1);
      v101 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel_deleteResources_checkServerIfNecessary_completionHandler_);
      v102 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v188 = v101;
      v189 = 2112;
      v190 = v102;
      v191 = 2048;
      v192 = 1;
      _os_log_impl(&dword_1B03C2000, v100, OS_LOG_TYPE_DEBUG, "Registering %@ for %@ argument #%lu of reply", buf, 0x20u);

    }
  }
  v103 = (void *)MEMORY[0x1E0C99E60];
  v104 = objc_opt_class();
  objc_msgSend(v103, "setWithObjects:", v104, objc_opt_class(), 0);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v105, sel_checkResourcesAreSafeToPrune_checkServerIfNecessary_completionHandler_, 0, 1);

  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v106 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v106, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v2, "classesForSelector:argumentIndex:ofReply:", sel_checkResourcesAreSafeToPrune_checkServerIfNecessary_completionHandler_, 0, 1);
      v107 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel_checkResourcesAreSafeToPrune_checkServerIfNecessary_completionHandler_);
      v108 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v188 = v107;
      v189 = 2112;
      v190 = v108;
      v191 = 2048;
      v192 = 0;
      _os_log_impl(&dword_1B03C2000, v106, OS_LOG_TYPE_DEBUG, "Registering %@ for %@ argument #%lu of reply", buf, 0x20u);

    }
  }
  v109 = (void *)MEMORY[0x1E0C99E60];
  v110 = objc_opt_class();
  v111 = objc_opt_class();
  objc_msgSend(v109, "setWithObjects:", v110, v111, objc_opt_class(), 0);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v112, sel_checkResourcesAreSafeToPrune_checkServerIfNecessary_completionHandler_, 1, 1);

  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v113 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v113, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v2, "classesForSelector:argumentIndex:ofReply:", sel_checkResourcesAreSafeToPrune_checkServerIfNecessary_completionHandler_, 1, 1);
      v114 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel_checkResourcesAreSafeToPrune_checkServerIfNecessary_completionHandler_);
      v115 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v188 = v114;
      v189 = 2112;
      v190 = v115;
      v191 = 2048;
      v192 = 1;
      _os_log_impl(&dword_1B03C2000, v113, OS_LOG_TYPE_DEBUG, "Registering %@ for %@ argument #%lu of reply", buf, 0x20u);

    }
  }
  v116 = (void *)MEMORY[0x1E0C99E60];
  v117 = objc_opt_class();
  objc_msgSend(v116, "setWithObjects:", v117, objc_opt_class(), 0);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v118, sel_getResourcesForItemWithScopedIdentifier_completionHandler_, 1, 1);

  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v119 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v119, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v2, "classesForSelector:argumentIndex:ofReply:", sel_getResourcesForItemWithScopedIdentifier_completionHandler_, 1, 1);
      v120 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel_getResourcesForItemWithScopedIdentifier_completionHandler_);
      v121 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v188 = v120;
      v189 = 2112;
      v190 = v121;
      v191 = 2048;
      v192 = 1;
      _os_log_impl(&dword_1B03C2000, v119, OS_LOG_TYPE_DEBUG, "Registering %@ for %@ argument #%lu of reply", buf, 0x20u);

    }
  }
  v122 = (void *)MEMORY[0x1E0C99E60];
  v123 = objc_opt_class();
  objc_msgSend(v122, "setWithObjects:", v123, objc_opt_class(), 0);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v124, sel_queryUserDetailsForShareParticipants_completionHandler_, 0, 0);

  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v125 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v125, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v2, "classesForSelector:argumentIndex:ofReply:", sel_queryUserDetailsForShareParticipants_completionHandler_, 0, 0);
      v126 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel_queryUserDetailsForShareParticipants_completionHandler_);
      v127 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v188 = v126;
      v189 = 2112;
      v190 = v127;
      v191 = 2048;
      v192 = 0;
      _os_log_impl(&dword_1B03C2000, v125, OS_LOG_TYPE_DEBUG, "Registering %@ for %@ argument #%lu", buf, 0x20u);

    }
  }
  v128 = (void *)MEMORY[0x1E0C99E60];
  v129 = objc_opt_class();
  objc_msgSend(v128, "setWithObjects:", v129, objc_opt_class(), 0);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v130, sel_queryUserDetailsForShareParticipants_completionHandler_, 0, 1);

  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v131 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v131, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v2, "classesForSelector:argumentIndex:ofReply:", sel_queryUserDetailsForShareParticipants_completionHandler_, 0, 1);
      v132 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel_queryUserDetailsForShareParticipants_completionHandler_);
      v133 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v188 = v132;
      v189 = 2112;
      v190 = v133;
      v191 = 2048;
      v192 = 0;
      _os_log_impl(&dword_1B03C2000, v131, OS_LOG_TYPE_DEBUG, "Registering %@ for %@ argument #%lu of reply", buf, 0x20u);

    }
  }
  v134 = (void *)MEMORY[0x1E0C99E60];
  v135 = objc_opt_class();
  objc_msgSend(v134, "setWithObjects:", v135, objc_opt_class(), 0);
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v136, sel_removeParticipants_fromSharedScopeWithIdentifier_retentionPolicy_exitSource_completionHandler_, 0, 0);

  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v137 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v137, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v2, "classesForSelector:argumentIndex:ofReply:", sel_removeParticipants_fromSharedScopeWithIdentifier_retentionPolicy_exitSource_completionHandler_, 0, 0);
      v138 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel_removeParticipants_fromSharedScopeWithIdentifier_retentionPolicy_exitSource_completionHandler_);
      v139 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v188 = v138;
      v189 = 2112;
      v190 = v139;
      v191 = 2048;
      v192 = 0;
      _os_log_impl(&dword_1B03C2000, v137, OS_LOG_TYPE_DEBUG, "Registering %@ for %@ argument #%lu", buf, 0x20u);

    }
  }
  v140 = (void *)MEMORY[0x1E0C99E60];
  v141 = objc_opt_class();
  objc_msgSend(v140, "setWithObjects:", v141, objc_opt_class(), 0);
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v142, sel_getStatusForPendingRecordsSharedToScopeWithIdentifier_maximumCount_completionHandler_, 0, 1);

  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v143 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v143, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v2, "classesForSelector:argumentIndex:ofReply:", sel_getStatusForPendingRecordsSharedToScopeWithIdentifier_maximumCount_completionHandler_, 0, 1);
      v144 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel_getStatusForPendingRecordsSharedToScopeWithIdentifier_maximumCount_completionHandler_);
      v145 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v188 = v144;
      v189 = 2112;
      v190 = v145;
      v191 = 2048;
      v192 = 0;
      _os_log_impl(&dword_1B03C2000, v143, OS_LOG_TYPE_DEBUG, "Registering %@ for %@ argument #%lu of reply", buf, 0x20u);

    }
  }
  v146 = (void *)MEMORY[0x1E0C99E60];
  v147 = objc_opt_class();
  objc_msgSend(v146, "setWithObjects:", v147, objc_opt_class(), 0);
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v148, sel_getTargetsForRecordsWithScopedIdentifiers_completionHandler_, 0, 0);

  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v149 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v149, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v2, "classesForSelector:argumentIndex:ofReply:", sel_getTargetsForRecordsWithScopedIdentifiers_completionHandler_, 0, 0);
      v150 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel_getTargetsForRecordsWithScopedIdentifiers_completionHandler_);
      v151 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v188 = v150;
      v189 = 2112;
      v190 = v151;
      v191 = 2048;
      v192 = 0;
      _os_log_impl(&dword_1B03C2000, v149, OS_LOG_TYPE_DEBUG, "Registering %@ for %@ argument #%lu", buf, 0x20u);

    }
  }
  v152 = (void *)MEMORY[0x1E0C99E60];
  v153 = objc_opt_class();
  v154 = objc_opt_class();
  objc_msgSend(v152, "setWithObjects:", v153, v154, objc_opt_class(), 0);
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v155, sel_getTargetsForRecordsWithScopedIdentifiers_completionHandler_, 0, 1);

  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v156 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v156, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v2, "classesForSelector:argumentIndex:ofReply:", sel_getTargetsForRecordsWithScopedIdentifiers_completionHandler_, 0, 1);
      v157 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel_getTargetsForRecordsWithScopedIdentifiers_completionHandler_);
      v158 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v188 = v157;
      v189 = 2112;
      v190 = v158;
      v191 = 2048;
      v192 = 0;
      _os_log_impl(&dword_1B03C2000, v156, OS_LOG_TYPE_DEBUG, "Registering %@ for %@ argument #%lu of reply", buf, 0x20u);

    }
  }
  v159 = (void *)MEMORY[0x1E0C99E60];
  v160 = objc_opt_class();
  objc_msgSend(v159, "setWithObjects:", v160, objc_opt_class(), 0);
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v161, sel_attachComputeStates_completionHandler_, 0, 0);

  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v162 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v162, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v2, "classesForSelector:argumentIndex:ofReply:", sel_attachComputeStates_completionHandler_, 0, 0);
      v163 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel_attachComputeStates_completionHandler_);
      v164 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v188 = v163;
      v189 = 2112;
      v190 = v164;
      v191 = 2048;
      v192 = 0;
      _os_log_impl(&dword_1B03C2000, v162, OS_LOG_TYPE_DEBUG, "Registering %@ for %@ argument #%lu", buf, 0x20u);

    }
  }
  v165 = (void *)MEMORY[0x1E0C99E60];
  v166 = objc_opt_class();
  v167 = objc_opt_class();
  objc_msgSend(v165, "setWithObjects:", v166, v167, objc_opt_class(), 0);
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v168, sel_fetchComputeStatesForRecordsWithScopedIdentifiers_validator_shouldDecrypt_onDemand_completionHandler_, 0, 0);

  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v169 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v169, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v2, "classesForSelector:argumentIndex:ofReply:", sel_fetchComputeStatesForRecordsWithScopedIdentifiers_validator_shouldDecrypt_onDemand_completionHandler_, 0, 0);
      v170 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel_fetchComputeStatesForRecordsWithScopedIdentifiers_validator_shouldDecrypt_onDemand_completionHandler_);
      v171 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v188 = v170;
      v189 = 2112;
      v190 = v171;
      v191 = 2048;
      v192 = 0;
      _os_log_impl(&dword_1B03C2000, v169, OS_LOG_TYPE_DEBUG, "Registering %@ for %@ argument #%lu", buf, 0x20u);

    }
  }
  v172 = (void *)MEMORY[0x1E0C99E60];
  v173 = objc_opt_class();
  v174 = objc_opt_class();
  objc_msgSend(v172, "setWithObjects:", v173, v174, objc_opt_class(), 0);
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v175, sel_fetchComputeStatesForRecordsWithScopedIdentifiers_validator_shouldDecrypt_onDemand_completionHandler_, 0, 1);

  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v176 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v176, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v2, "classesForSelector:argumentIndex:ofReply:", sel_fetchComputeStatesForRecordsWithScopedIdentifiers_validator_shouldDecrypt_onDemand_completionHandler_, 0, 1);
      v177 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel_fetchComputeStatesForRecordsWithScopedIdentifiers_validator_shouldDecrypt_onDemand_completionHandler_);
      v178 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v188 = v177;
      v189 = 2112;
      v190 = v178;
      v191 = 2048;
      v192 = 0;
      _os_log_impl(&dword_1B03C2000, v176, OS_LOG_TYPE_DEBUG, "Registering %@ for %@ argument #%lu of reply", buf, 0x20u);

    }
  }
  v179 = (void *)MEMORY[0x1E0C99E60];
  v180 = objc_opt_class();
  objc_msgSend(v179, "setWithObjects:", v180, objc_opt_class(), 0);
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v181, sel_requestClientToPullAllChangesInScopeIdentifier_completionHandler_, 0, 0);

  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v182 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v182, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v2, "classesForSelector:argumentIndex:ofReply:", sel_requestClientToPullAllChangesInScopeIdentifier_completionHandler_, 0, 0);
      v183 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel_requestClientToPullAllChangesInScopeIdentifier_completionHandler_);
      v184 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v188 = v183;
      v189 = 2112;
      v190 = v184;
      v191 = 2048;
      v192 = 0;
      _os_log_impl(&dword_1B03C2000, v182, OS_LOG_TYPE_DEBUG, "Registering %@ for %@ argument #%lu", buf, 0x20u);

    }
  }
  v185 = v2;

  return v185;
}

+ (id)clientProtocolInterface
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEEB6EC0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, v5, objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_forceSyncDidFinishForTask_withErrors_, 1, 0);

  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v2, "classesForSelector:argumentIndex:ofReply:", sel_forceSyncDidFinishForTask_withErrors_, 1, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel_forceSyncDidFinishForTask_withErrors_);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v24 = v8;
      v25 = 2112;
      v26 = v9;
      v27 = 2048;
      v28 = 1;
      _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_DEBUG, "Registering %@ for %@ argument #%lu", buf, 0x20u);

    }
  }
  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_providePayloadForComputeStates_inFolderWithURL_completionHandler_, 0, 0);

  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v2, "classesForSelector:argumentIndex:ofReply:", sel_providePayloadForComputeStates_inFolderWithURL_completionHandler_, 0, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel_providePayloadForComputeStates_inFolderWithURL_completionHandler_);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v24 = v14;
      v25 = 2112;
      v26 = v15;
      v27 = 2048;
      v28 = 0;
      _os_log_impl(&dword_1B03C2000, v13, OS_LOG_TYPE_DEBUG, "Registering %@ for %@ argument #%lu", buf, 0x20u);

    }
  }
  v16 = (void *)MEMORY[0x1E0C99E60];
  v17 = objc_opt_class();
  objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_providePayloadForComputeStates_inFolderWithURL_completionHandler_, 0, 1);

  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v2, "classesForSelector:argumentIndex:ofReply:", sel_providePayloadForComputeStates_inFolderWithURL_completionHandler_, 0, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel_providePayloadForComputeStates_inFolderWithURL_completionHandler_);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v24 = v20;
      v25 = 2112;
      v26 = v21;
      v27 = 2048;
      v28 = 0;
      _os_log_impl(&dword_1B03C2000, v19, OS_LOG_TYPE_DEBUG, "Registering %@ for %@ argument #%lu of reply", buf, 0x20u);

    }
  }
  return v2;
}

- (CPLProxyLibraryManager)initWithAbstractObject:(id)a3
{
  CPLProxyLibraryManager *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  NSMutableDictionary *v6;
  NSMutableDictionary *downloadTasks;
  NSMutableDictionary *v8;
  NSMutableDictionary *inMemoryDownloadTasks;
  NSMutableDictionary *v10;
  NSMutableDictionary *uploadTasks;
  NSMutableDictionary *v12;
  NSMutableDictionary *forceSyncTasks;
  NSMutableDictionary *v14;
  NSMutableDictionary *vouchersPerTaskIdentifier;
  NSCountedSet *v16;
  NSCountedSet *disablingReasons;
  NSMutableArray *v18;
  NSMutableArray *pendingBlocksAfterOpening;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)CPLProxyLibraryManager;
  v3 = -[CPLPlatformObject initWithAbstractObject:](&v21, sel_initWithAbstractObject_, a3);
  if (v3)
  {
    v4 = dispatch_queue_create("com.apple.cpl.librarymanager.proxy", 0);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    downloadTasks = v3->_downloadTasks;
    v3->_downloadTasks = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    inMemoryDownloadTasks = v3->_inMemoryDownloadTasks;
    v3->_inMemoryDownloadTasks = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    uploadTasks = v3->_uploadTasks;
    v3->_uploadTasks = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    forceSyncTasks = v3->_forceSyncTasks;
    v3->_forceSyncTasks = v12;

    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    vouchersPerTaskIdentifier = v3->_vouchersPerTaskIdentifier;
    v3->_vouchersPerTaskIdentifier = v14;

    v16 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E0CB3550]);
    disablingReasons = v3->_disablingReasons;
    v3->_disablingReasons = v16;

    v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    pendingBlocksAfterOpening = v3->_pendingBlocksAfterOpening;
    v3->_pendingBlocksAfterOpening = v18;

    v3->_realConnectionLock._os_unfair_lock_opaque = 0;
  }
  return v3;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  CPLProxyLibraryManager *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v6 = self;
      _os_log_impl(&dword_1B03C2000, v3, OS_LOG_TYPE_DEBUG, "%@ has been deallocated", buf, 0xCu);
    }

  }
  v4.receiver = self;
  v4.super_class = (Class)CPLProxyLibraryManager;
  -[CPLProxyLibraryManager dealloc](&v4, sel_dealloc);
}

- (id)_connection
{
  os_unfair_lock_s *p_realConnectionLock;
  _QWORD *v3;
  id v4;
  _QWORD v6[2];
  void (*v7)(uint64_t);
  void *v8;
  CPLProxyLibraryManager *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  p_realConnectionLock = &self->_realConnectionLock;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v7 = __37__CPLProxyLibraryManager__connection__block_invoke;
  v8 = &unk_1E60D64C8;
  v9 = self;
  v10 = &v11;
  v3 = v6;
  os_unfair_lock_lock(p_realConnectionLock);
  v7((uint64_t)v3);
  os_unfair_lock_unlock(p_realConnectionLock);

  v4 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v4;
}

void __37__CPLProxyLibraryManager__connection__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 24));
}

- (id)proxyWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;

  v4 = a3;
  -[CPLProxyLibraryManager _connection](self, "_connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __48__CPLProxyLibraryManager_proxyWithErrorHandler___block_invoke;
  v10[3] = &unk_1E60D64F0;
  v11 = v5;
  v12 = v4;
  v6 = v5;
  v7 = v4;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __48__CPLProxyLibraryManager_proxyWithErrorHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  +[CPLErrors invalidDaemonErrorWithConnectionError:](CPLErrors, "invalidDaemonErrorWithConnectionError:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_setupConnection
{
  os_unfair_lock_s *p_realConnectionLock;
  _QWORD *v3;
  _QWORD v4[2];
  void (*v5)(uint64_t);
  void *v6;
  CPLProxyLibraryManager *v7;

  p_realConnectionLock = &self->_realConnectionLock;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v5 = __42__CPLProxyLibraryManager__setupConnection__block_invoke;
  v6 = &unk_1E60D65B8;
  v7 = self;
  v3 = v4;
  os_unfair_lock_lock(p_realConnectionLock);
  v5((uint64_t)v3);
  os_unfair_lock_unlock(p_realConnectionLock);

}

void __42__CPLProxyLibraryManager__setupConnection__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id WeakRetained;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  id v24;
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;
  id location;
  uint8_t buf[4];
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD **)(a1 + 32);
  if (v2[3])
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
        *(_DWORD *)buf = 138412290;
        v31 = v4;
        _os_log_impl(&dword_1B03C2000, v3, OS_LOG_TYPE_DEFAULT, "Dropping former connection %@ for good and recreating a new one", buf, 0xCu);
      }

      v2 = *(_QWORD **)(a1 + 32);
    }
    objc_msgSend(v2, "_dropConnectionCompletlyLocked");
  }
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.cloudphotod"), 0);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v5;

  objc_initWeak((id *)buf, *(id *)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend((id)objc_opt_class(), "daemonProtocolInterface");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)buf);
  objc_msgSend(WeakRetained, "setRemoteObjectInterface:", v8);

  objc_msgSend((id)objc_opt_class(), "clientProtocolInterface");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_loadWeakRetained((id *)buf);
  objc_msgSend(v11, "setExportedInterface:", v10);

  v12 = *(_QWORD *)(a1 + 32);
  v13 = objc_loadWeakRetained((id *)buf);
  objc_msgSend(v13, "setExportedObject:", v12);

  objc_initWeak(&location, *(id *)(a1 + 32));
  v14 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __42__CPLProxyLibraryManager__setupConnection__block_invoke_268;
  v26[3] = &unk_1E60D6568;
  objc_copyWeak(&v27, &location);
  objc_copyWeak(&v28, (id *)buf);
  v26[4] = *(_QWORD *)(a1 + 32);
  v15 = objc_loadWeakRetained((id *)buf);
  objc_msgSend(v15, "setInterruptionHandler:", v26);

  v20 = v14;
  v21 = 3221225472;
  v22 = __42__CPLProxyLibraryManager__setupConnection__block_invoke_2;
  v23 = &unk_1E60D6590;
  objc_copyWeak(&v24, &location);
  objc_copyWeak(&v25, (id *)buf);
  v16 = objc_loadWeakRetained((id *)buf);
  objc_msgSend(v16, "setInvalidationHandler:", &v20);

  v17 = objc_loadWeakRetained((id *)buf);
  objc_msgSend(v17, "_setQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176), v20, v21, v22, v23);

  v18 = objc_loadWeakRetained((id *)buf);
  objc_msgSend(v18, "setDelegate:", *(_QWORD *)(a1 + 32));

  v19 = objc_loadWeakRetained((id *)buf);
  objc_msgSend(v19, "resume");

  objc_destroyWeak(&v25);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);

  objc_destroyWeak((id *)buf);
}

void __42__CPLProxyLibraryManager__setupConnection__block_invoke_268(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  id *v4;
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  NSObject *v22;
  uint64_t v23;
  id v24;
  NSObject *v25;
  uint64_t v26;
  id v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(_QWORD *, uint64_t, void *);
  void *v36;
  id v37;
  NSObject *v38;
  id v39;
  _QWORD v40[4];
  id v41;
  NSObject *v42;
  id v43;
  _QWORD v44[4];
  id v45;
  NSObject *v46;
  id v47;
  _QWORD v48[4];
  NSObject *v49;
  id v50;
  id v51;
  uint8_t buf[4];
  uint64_t v53;
  __int16 v54;
  const __CFString *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_connection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (id *)(a1 + 48);
  v5 = objc_loadWeakRetained((id *)(a1 + 48));

  if (v3 == v5)
  {
    if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 173))
    {
      if (WeakRetained && *((_BYTE *)WeakRetained + 172))
      {
        if (!_CPLSilentLogging)
        {
          __CPLManagerOSLogDomain();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(WeakRetained, "abstractObject");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v53 = (uint64_t)v13;
            v54 = 2114;
            v55 = CFSTR("com.apple.cloudphotod");
            _os_log_impl(&dword_1B03C2000, v12, OS_LOG_TYPE_DEFAULT, "%@: connection with %{public}@ was interrupted because it has been replaced with an other library manager", buf, 0x16u);

          }
        }
      }
      else
      {
        if (!_CPLSilentLogging)
        {
          __CPLManagerOSLogDomain();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(WeakRetained, "abstractObject");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v53 = (uint64_t)v15;
            v54 = 2114;
            v55 = CFSTR("com.apple.cloudphotod");
            _os_log_impl(&dword_1B03C2000, v14, OS_LOG_TYPE_ERROR, "%@: connection with %{public}@ was interrupted", buf, 0x16u);

          }
        }
        if (!WeakRetained)
          goto LABEL_56;
      }
      objc_msgSend(WeakRetained, "abstractObject");
      v7 = objc_claimAutoreleasedReturnValue();
      -[NSObject resourceProgressDelegate](v7, "resourceProgressDelegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[CPLErrors unknownError](CPLErrors, "unknownError");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!_CPLSilentLogging)
      {
        __CPLManagerOSLogDomain();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          v18 = objc_msgSend(WeakRetained[4], "count");
          *(_DWORD *)buf = 134217984;
          v53 = v18;
          _os_log_impl(&dword_1B03C2000, v17, OS_LOG_TYPE_DEBUG, "Failing %lu download tasks", buf, 0xCu);
        }

      }
      v19 = objc_msgSend(WeakRetained[4], "count");
      objc_msgSend(WeakRetained[8], "removeAllObjects");
      v20 = MEMORY[0x1E0C809B0];
      if (v8)
      {
        v21 = WeakRetained[4];
        v48[0] = MEMORY[0x1E0C809B0];
        v48[1] = 3221225472;
        v48[2] = __42__CPLProxyLibraryManager__setupConnection__block_invoke_269;
        v48[3] = &unk_1E60D6518;
        v49 = v7;
        v50 = v8;
        v51 = v16;
        objc_msgSend(v21, "enumerateKeysAndObjectsUsingBlock:", v48);

      }
      objc_msgSend(WeakRetained[4], "removeAllObjects");
      if (v19)
        +[CPLTransaction endTransactionWithIdentifier:](CPLTransaction, "endTransactionWithIdentifier:", CFSTR("cpl.activeresourcedownloads"));
      if (!_CPLSilentLogging)
      {
        __CPLManagerOSLogDomain();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          v23 = objc_msgSend(WeakRetained[5], "count");
          *(_DWORD *)buf = 134217984;
          v53 = v23;
          _os_log_impl(&dword_1B03C2000, v22, OS_LOG_TYPE_DEBUG, "Failing %lu in-memory download tasks", buf, 0xCu);
        }

      }
      if (v8)
      {
        v24 = WeakRetained[5];
        v44[0] = v20;
        v44[1] = 3221225472;
        v44[2] = __42__CPLProxyLibraryManager__setupConnection__block_invoke_274;
        v44[3] = &unk_1E60D6518;
        v45 = v8;
        v46 = v7;
        v47 = v16;
        objc_msgSend(v24, "enumerateKeysAndObjectsUsingBlock:", v44);

      }
      objc_msgSend(WeakRetained[5], "removeAllObjects");
      if (!_CPLSilentLogging)
      {
        __CPLManagerOSLogDomain();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          v26 = objc_msgSend(WeakRetained[6], "count");
          *(_DWORD *)buf = 134217984;
          v53 = v26;
          _os_log_impl(&dword_1B03C2000, v25, OS_LOG_TYPE_DEFAULT, "Failing %lu upload tasks", buf, 0xCu);
        }

      }
      if (v8)
      {
        v27 = WeakRetained[6];
        v40[0] = v20;
        v40[1] = 3221225472;
        v40[2] = __42__CPLProxyLibraryManager__setupConnection__block_invoke_275;
        v40[3] = &unk_1E60D6518;
        v41 = v8;
        v42 = v7;
        v43 = v16;
        objc_msgSend(v27, "enumerateKeysAndObjectsUsingBlock:", v40);

      }
      objc_msgSend(WeakRetained[6], "removeAllObjects");
      if (!_CPLSilentLogging)
      {
        __CPLManagerOSLogDomain();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          v29 = objc_msgSend(WeakRetained[7], "count");
          *(_DWORD *)buf = 134217984;
          v53 = v29;
          _os_log_impl(&dword_1B03C2000, v28, OS_LOG_TYPE_DEFAULT, "Failing %lu force sync tasks", buf, 0xCu);
        }

      }
      -[NSObject forceSyncDelegate](v7, "forceSyncDelegate");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v30;
      if (v30)
      {
        v32 = WeakRetained[7];
        v33 = v20;
        v34 = 3221225472;
        v35 = __42__CPLProxyLibraryManager__setupConnection__block_invoke_276;
        v36 = &unk_1E60D6540;
        v37 = v30;
        v38 = v7;
        v39 = v16;
        objc_msgSend(v32, "enumerateKeysAndObjectsUsingBlock:", &v33);

      }
      objc_msgSend(WeakRetained[7], "removeAllObjects", v33, v34, v35, v36);
      if (*((_DWORD *)WeakRetained + 38) != 2)
        *((_DWORD *)WeakRetained + 38) = 1;

      goto LABEL_54;
    }
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(WeakRetained, "abstractObject");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v53 = (uint64_t)v8;
        v54 = 2114;
        v55 = CFSTR("com.apple.cloudphotod");
        v9 = "%@: connection with %{public}@ was interrupted during first try open";
        v10 = v7;
        v11 = 22;
        goto LABEL_10;
      }
LABEL_55:

    }
  }
  else
  {
    v6 = objc_loadWeakRetained((id *)(a1 + 48));

    if (v6)
    {
      if (!_CPLSilentLogging)
      {
        __CPLManagerOSLogDomain();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          v8 = objc_loadWeakRetained(v4);
          *(_DWORD *)buf = 138412290;
          v53 = (uint64_t)v8;
          v9 = "Ignoring stale interruption handler for old %@";
          v10 = v7;
          v11 = 12;
LABEL_10:
          _os_log_impl(&dword_1B03C2000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
LABEL_54:

          goto LABEL_55;
        }
        goto LABEL_55;
      }
    }
    else if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_DEFAULT, "Ignoring stale interruption handler for old connection", buf, 2u);
      }
      goto LABEL_55;
    }
  }
LABEL_56:

}

void __42__CPLProxyLibraryManager__setupConnection__block_invoke_269(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  id v6;

  v4 = *(void **)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(id *)(a1 + 32);
  objc_msgSend(v4, "libraryManager:downloadDidFinishForResourceTransferTask:finalResource:withError:", v6, a3, 0, v5);

}

uint64_t __42__CPLProxyLibraryManager__setupConnection__block_invoke_274(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "libraryManager:inMemoryDownloadDidFinishForResourceTransferTask:data:withError:", *(_QWORD *)(a1 + 40), a3, 0, *(_QWORD *)(a1 + 48));
}

uint64_t __42__CPLProxyLibraryManager__setupConnection__block_invoke_275(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "libraryManager:uploadDidFinishForResourceTransferTask:withError:", *(_QWORD *)(a1 + 40), a3, *(_QWORD *)(a1 + 48));
}

void __42__CPLProxyLibraryManager__setupConnection__block_invoke_276(_QWORD *a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "scopeIdentifiers");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)a1[4];
  v6 = a1[5];
  +[CPLErrors errorsForIdentifiers:error:](CPLErrors, "errorsForIdentifiers:error:", v8, a1[6]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "libraryManager:didFinishForceSyncTask:withErrors:", v6, v4, v7);

}

void __42__CPLProxyLibraryManager__setupConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  id *v5;
  id v6;
  id v7;
  NSObject *v8;
  __CFString *v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_connection");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v5 = (id *)(a1 + 40);
    v6 = objc_loadWeakRetained(v5);

    if (v4 == v6)
    {
      if (!_CPLSilentLogging)
      {
        __CPLManagerOSLogDomain();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v12 = 138412290;
          v13 = CFSTR("com.apple.cloudphotod");
          _os_log_impl(&dword_1B03C2000, v10, OS_LOG_TYPE_DEFAULT, "Connection with %@ was invalidated", (uint8_t *)&v12, 0xCu);
        }

      }
      objc_msgSend(v3, "_markConnectionAsInvalid");
    }
    else
    {
      v7 = objc_loadWeakRetained(v5);

      if (v7)
      {
        if (!_CPLSilentLogging)
        {
          __CPLManagerOSLogDomain();
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            v9 = (__CFString *)objc_loadWeakRetained(v5);
            v12 = 138412290;
            v13 = v9;
            _os_log_impl(&dword_1B03C2000, v8, OS_LOG_TYPE_DEFAULT, "Ignoring stale invalidation handler for old %@", (uint8_t *)&v12, 0xCu);

          }
        }
      }
      else if (!_CPLSilentLogging)
      {
        __CPLManagerOSLogDomain();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v12) = 0;
          _os_log_impl(&dword_1B03C2000, v11, OS_LOG_TYPE_DEFAULT, "Ignoring stale invalidation handler for old connection", (uint8_t *)&v12, 2u);
        }

      }
    }
  }

}

- (void)_markConnectionAsInvalid
{
  NSDate *backoffRetryingConnectionDate;
  double v4;
  NSDate *v5;
  NSDate *v6;
  NSDate *v7;
  NSDate *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_openingStatus != 4)
  {
    backoffRetryingConnectionDate = self->_backoffRetryingConnectionDate;
    if (!backoffRetryingConnectionDate
      || ((-[NSDate timeIntervalSinceNow](backoffRetryingConnectionDate, "timeIntervalSinceNow"), v4 >= -1800.0)
        ? (objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 1800.0),
           v5 = (NSDate *)objc_claimAutoreleasedReturnValue())
        : (v5 = 0),
          v6 = self->_backoffRetryingConnectionDate,
          self->_backoffRetryingConnectionDate = v5,
          v6,
          !self->_backoffRetryingConnectionDate))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 30.0);
      v7 = (NSDate *)objc_claimAutoreleasedReturnValue();
      v8 = self->_backoffRetryingConnectionDate;
      self->_backoffRetryingConnectionDate = v7;

    }
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        +[CPLDateFormatter stringFromDate:](CPLDateFormatter, "stringFromDate:", self->_backoffRetryingConnectionDate);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138412290;
        v12 = v10;
        _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_ERROR, "Marking connection as invalid until %@", (uint8_t *)&v11, 0xCu);

      }
    }
    self->_openingStatus = 4;
  }
}

- (void)_dropConnectionCompletlyLocked
{
  NSXPCConnection *realConnection;

  -[NSXPCConnection setDelegate:](self->_realConnection, "setDelegate:", 0);
  -[NSXPCConnection setInterruptionHandler:](self->_realConnection, "setInterruptionHandler:", 0);
  -[NSXPCConnection setInvalidationHandler:](self->_realConnection, "setInvalidationHandler:", 0);
  -[NSXPCConnection invalidate](self->_realConnection, "invalidate");
  realConnection = self->_realConnection;
  self->_realConnection = 0;

}

- (void)_dropConnectionCompletly
{
  os_unfair_lock_s *p_realConnectionLock;
  _QWORD *v3;
  _QWORD v4[2];
  uint64_t (*v5)(uint64_t);
  void *v6;
  CPLProxyLibraryManager *v7;

  p_realConnectionLock = &self->_realConnectionLock;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v5 = __50__CPLProxyLibraryManager__dropConnectionCompletly__block_invoke;
  v6 = &unk_1E60D65B8;
  v7 = self;
  v3 = v4;
  os_unfair_lock_lock(p_realConnectionLock);
  v5((uint64_t)v3);
  os_unfair_lock_unlock(p_realConnectionLock);

}

uint64_t __50__CPLProxyLibraryManager__dropConnectionCompletly__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dropConnectionCompletlyLocked");
}

- (void)_reallyOpenWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  BOOL firstTryOpeningLibrary;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  CPLProxyLibraryManager *v26;
  id v27;
  id v28;
  uint64_t v29;
  BOOL v30;
  _QWORD v31[5];
  id v32;
  BOOL v33;

  v4 = a3;
  -[CPLProxyLibraryManager _connection](self, "_connection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  self->_openingStatus = 2;
  -[CPLPlatformObject abstractObject](self, "abstractObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clientLibraryBaseURL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cloudLibraryStateStorageURL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cloudLibraryResourceStorageURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "libraryIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mainScopeIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "libraryOptions");
  firstTryOpeningLibrary = self->_firstTryOpeningLibrary;
  v11 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __59__CPLProxyLibraryManager__reallyOpenWithCompletionHandler___block_invoke;
  v31[3] = &unk_1E60D65E0;
  v31[4] = self;
  v33 = firstTryOpeningLibrary;
  v12 = v4;
  v32 = v12;
  -[CPLProxyLibraryManager proxyWithErrorHandler:](self, "proxyWithErrorHandler:", v31);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    v19[0] = v11;
    v19[1] = 3221225472;
    v19[2] = __59__CPLProxyLibraryManager__reallyOpenWithCompletionHandler___block_invoke_2;
    v19[3] = &unk_1E60D6630;
    v20 = v13;
    v21 = v18;
    v22 = v17;
    v23 = v6;
    v24 = v7;
    v29 = v9;
    v25 = v8;
    v26 = self;
    v27 = v16;
    v30 = firstTryOpeningLibrary;
    v28 = v12;
    objc_msgSend(v20, "connectWithCompletionHandler:", v19);

    v15 = v20;
  }
  else
  {
    -[CPLProxyLibraryManager _markConnectionAsInvalid](self, "_markConnectionAsInvalid");
    +[CPLErrors libraryClosedError](CPLErrors, "libraryClosedError");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id, _QWORD, _QWORD, _QWORD, _QWORD))v12 + 2))(v12, v15, 0, 0, 0, 0);
  }

}

void __59__CPLProxyLibraryManager__reallyOpenWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  id v8;

  v8 = a3;
  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "_connection");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v6)
  {
    if (!*(_BYTE *)(a1 + 48))
      objc_msgSend(*(id *)(a1 + 32), "_markConnectionAsInvalid");
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __59__CPLProxyLibraryManager__reallyOpenWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[5];
  id v11;
  id v12;
  char v13;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 64);
  v7 = *(_QWORD *)(a1 + 72);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[2] = __59__CPLProxyLibraryManager__reallyOpenWithCompletionHandler___block_invoke_3;
  v10[3] = &unk_1E60D6608;
  v8 = *(void **)(a1 + 88);
  v10[4] = *(_QWORD *)(a1 + 80);
  v9 = *(_QWORD *)(a1 + 104);
  v10[1] = 3221225472;
  v11 = v8;
  v13 = *(_BYTE *)(a1 + 112);
  v12 = *(id *)(a1 + 96);
  objc_msgSend(v2, "openLibraryWithClientLibraryBaseURL:cloudLibraryStateStorageURL:cloudLibraryResourceStorageURL:libraryIdentifier:mainScopeIdentifier:options:completionHandler:", v3, v4, v5, v6, v7, v9, v10);

}

void __59__CPLProxyLibraryManager__reallyOpenWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12)
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  uint8_t buf[4];
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v15 = a2;
  v16 = a3;
  v17 = a9;
  v18 = a10;
  v19 = a11;
  v20 = a12;
  objc_msgSend(*(id *)(a1 + 32), "_connection");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = *(void **)(a1 + 40);

  if (v21 == v22)
  {
    if (v15)
    {
      v23 = v16;
      if (!*(_BYTE *)(a1 + 56))
        objc_msgSend(*(id *)(a1 + 32), "_markConnectionAsInvalid");
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
    else
    {
      v23 = v16;
      objc_msgSend(*(id *)(a1 + 32), "_setStatusFromDictionary:", v16);
      objc_msgSend(*(id *)(a1 + 32), "abstractObject");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "_setSizeOfResourcesToUpload:sizeOfOriginalResourcesToUpload:numberOfImages:numberOfVideos:numberOfOtherItems:", a4, a5, a6, a7, a8);

      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 152) = 3;
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
  }
  else
  {
    v23 = v16;
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        v32 = v25;
        _os_log_impl(&dword_1B03C2000, v24, OS_LOG_TYPE_ERROR, "Received completion for opening for %@ too late", buf, 0xCu);
      }

    }
  }

}

- (void)_dispatchBlockWhenOpen:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  int openingStatus;
  NSDate *backoffRetryingConnectionDate;
  double v8;
  NSObject *v9;
  __CFString *v10;
  void *v11;
  id v12;
  NSMutableArray *pendingBlocksAfterOpening;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  __CFString *v21;
  _QWORD v22[4];
  id v23;
  CPLProxyLibraryManager *v24;
  uint8_t buf[4];
  const __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(_QWORD))a3;
  -[CPLProxyLibraryManager _connection](self, "_connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v26 = CFSTR("com.apple.cloudphotod");
        _os_log_impl(&dword_1B03C2000, v19, OS_LOG_TYPE_ERROR, "Trying to send messages to %@ but we have no connection ready", buf, 0xCu);
      }

    }
    goto LABEL_20;
  }
  openingStatus = self->_openingStatus;
  if (openingStatus <= 0)
    -[CPLProxyLibraryManager _dispatchBlockWhenOpen:].cold.1();
  if (openingStatus != 1)
  {
    if (openingStatus != 4)
      goto LABEL_14;
    backoffRetryingConnectionDate = self->_backoffRetryingConnectionDate;
    if (backoffRetryingConnectionDate)
    {
      -[NSDate timeIntervalSinceNow](backoffRetryingConnectionDate, "timeIntervalSinceNow");
      if (v8 >= 0.0)
      {
        if (!_CPLSilentLogging)
        {
          __CPLManagerOSLogDomain();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            -[CPLProxyLibraryManager _connection](self, "_connection");
            v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v26 = v21;
            _os_log_impl(&dword_1B03C2000, v20, OS_LOG_TYPE_DEBUG, "%@ has been invalidated recently, will not try to re-open one yet", buf, 0xCu);

          }
        }
        goto LABEL_20;
      }
    }
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        -[CPLProxyLibraryManager _connection](self, "_connection");
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v26 = v10;
        _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_DEFAULT, "%@ has been invalidated a long time, will try re-opening one", buf, 0xCu);

      }
    }
    -[CPLProxyLibraryManager _setupConnection](self, "_setupConnection");
    self->_openingStatus = 1;
  }
  if (self->_killed)
  {
LABEL_20:
    v4[2](v4);
    goto LABEL_21;
  }
  -[CPLPlatformObject abstractObject](self, "abstractObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __49__CPLProxyLibraryManager__dispatchBlockWhenOpen___block_invoke;
  v22[3] = &unk_1E60D66E0;
  v23 = v11;
  v24 = self;
  v12 = v11;
  -[CPLProxyLibraryManager _reallyOpenWithCompletionHandler:](self, "_reallyOpenWithCompletionHandler:", v22);

  openingStatus = self->_openingStatus;
LABEL_14:
  if (openingStatus > 2)
    goto LABEL_20;
  pendingBlocksAfterOpening = self->_pendingBlocksAfterOpening;
  v14 = (void *)objc_msgSend(v4, "copy");
  v18 = (void *)MEMORY[0x1B5E08DC4](v14, v15, v16, v17);
  -[NSMutableArray addObject:](pendingBlocksAfterOpening, "addObject:", v18);

LABEL_21:
}

void __49__CPLProxyLibraryManager__dispatchBlockWhenOpen___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  void *v30;
  void *v31;
  _QWORD *v32;
  unint64_t v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  id v40;
  id v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[5];
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint8_t v53[128];
  uint8_t buf[4];
  const __CFString *v55;
  __int16 v56;
  id v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v42 = v12;
  if (v11)
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v55 = CFSTR("com.apple.cloudphotod");
        v56 = 2112;
        v57 = v11;
        _os_log_impl(&dword_1B03C2000, v16, OS_LOG_TYPE_ERROR, "Unable to reopen connection with %@: %@", buf, 0x16u);
      }

    }
    v17 = *(void **)(a1 + 32);
    +[CPLErrors libraryClosedError](CPLErrors, "libraryClosedError");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_setStatus:andError:", 1, v18);

    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "libraryManagerStatusDidChange:", *(_QWORD *)(a1 + 32));
    goto LABEL_23;
  }
  objc_msgSend(*(id *)(a1 + 32), "_setLibraryVersion:", v12);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "libraryManagerStatusDidChange:", *(_QWORD *)(a1 + 32));

  v21 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(v21 + 72))
  {
    objc_msgSend((id)v21, "proxyWithErrorHandler:", &__block_literal_global);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "noteClientIsInForegroundQuietly:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 80));

    v21 = *(_QWORD *)(a1 + 40);
  }
  if (objc_msgSend(*(id *)(v21 + 88), "count"))
  {
    v40 = v14;
    v41 = v13;
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v23 = *(id *)(*(_QWORD *)(a1 + 40) + 88);
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v49;
      v27 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v49 != v26)
            objc_enumerationMutation(v23);
          v29 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i);
          v30 = *(void **)(a1 + 40);
          v47[0] = v27;
          v47[1] = 3221225472;
          v47[2] = __49__CPLProxyLibraryManager__dispatchBlockWhenOpen___block_invoke_287;
          v47[3] = &unk_1E60D6678;
          v47[4] = v29;
          objc_msgSend(v30, "proxyWithErrorHandler:", v47);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "disableSynchronizationWithReason:", v29);

        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
      }
      while (v25);
    }

    v13 = v41;
    v11 = 0;
    v14 = v40;
  }
  v32 = *(_QWORD **)(a1 + 40);
  if (v32[12])
  {
    v33 = 0;
    do
    {
      objc_msgSend(v32, "proxyWithErrorHandler:", &__block_literal_global_289);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "disableMingling");

      ++v33;
      v32 = *(_QWORD **)(a1 + 40);
    }
    while (v33 < v32[12]);
  }
  if (v32[13])
  {
    objc_msgSend(v32, "proxyWithErrorHandler:", &__block_literal_global_291);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "noteClientIsBeginningSignificantWork");
LABEL_23:

  }
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v35 = *(id *)(*(_QWORD *)(a1 + 40) + 144);
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v44;
    do
    {
      for (j = 0; j != v37; ++j)
      {
        if (*(_QWORD *)v44 != v38)
          objc_enumerationMutation(v35);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * j) + 16))();
      }
      v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
    }
    while (v37);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 144), "removeAllObjects");
}

void __49__CPLProxyLibraryManager__dispatchBlockWhenOpen___block_invoke_286(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 138412290;
      v6 = v3;
      _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_ERROR, "Unable to re-establish foreground after automatic re-opening: %@", (uint8_t *)&v5, 0xCu);
    }

  }
}

void __49__CPLProxyLibraryManager__dispatchBlockWhenOpen___block_invoke_287(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 138412546;
      v8 = v6;
      v9 = 2112;
      v10 = v4;
      _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_ERROR, "Unable to disable sync for reason '%@' after automatic re-opening: %@", (uint8_t *)&v7, 0x16u);
    }

  }
}

void __49__CPLProxyLibraryManager__dispatchBlockWhenOpen___block_invoke_288(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 138412290;
      v6 = v3;
      _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_ERROR, "Unable to disable mingling after automatic re-opening: %@", (uint8_t *)&v5, 0xCu);
    }

  }
}

void __49__CPLProxyLibraryManager__dispatchBlockWhenOpen___block_invoke_290(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 138412290;
      v6 = v3;
      _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_ERROR, "Unable to re-establish significant work after automatic re-opening: %@", (uint8_t *)&v5, 0xCu);
    }

  }
}

- (void)dispatchBlockWhenLibraryIsOpen:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  uint64_t v6;
  _QWORD *v7;
  NSObject *v8;
  id v9;
  dispatch_block_t v10;
  _QWORD v11[5];
  id v12;
  _QWORD block[4];
  id v14;

  v4 = a3;
  queue = self->_queue;
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __57__CPLProxyLibraryManager_dispatchBlockWhenLibraryIsOpen___block_invoke;
  v11[3] = &unk_1E60D6708;
  v11[4] = self;
  v12 = v4;
  v7 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60D71F8;
  v14 = v7;
  v8 = queue;
  v9 = v4;
  v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);

}

uint64_t __57__CPLProxyLibraryManager_dispatchBlockWhenLibraryIsOpen___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dispatchBlockWhenOpen:", *(_QWORD *)(a1 + 40));
}

- (void)openWithCompletionHandler:(id)a3
{
  id v5;
  OS_dispatch_queue *queue;
  uint64_t v7;
  _QWORD *v8;
  NSObject *v9;
  id v10;
  dispatch_block_t v11;
  _QWORD v12[5];
  id v13;
  SEL v14;
  _QWORD block[4];
  id v16;

  v5 = a3;
  queue = self->_queue;
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __52__CPLProxyLibraryManager_openWithCompletionHandler___block_invoke;
  v12[3] = &unk_1E60D6780;
  v13 = v5;
  v14 = a2;
  v12[4] = self;
  v8 = v12;
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60D71F8;
  v16 = v8;
  v9 = queue;
  v10 = v5;
  v11 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v9, v11);

}

void __52__CPLProxyLibraryManager_openWithCompletionHandler___block_invoke(uint64_t a1)
{
  _DWORD *v2;
  id *v3;
  NSObject *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD handler[5];
  __int128 buf;
  uint64_t (*v18)(uint64_t);
  void *v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = (id *)(a1 + 32);
  v2 = *(_DWORD **)(a1 + 32);
  if (v2[38])
    __52__CPLProxyLibraryManager_openWithCompletionHandler___block_invoke_cold_1(_CPLSilentLogging == 0, v3, a1);
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*v3, "abstractObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v5;
      _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_DEFAULT, "%@ opening connection with daemon", (uint8_t *)&buf, 0xCu);

    }
    v2 = *v3;
  }
  objc_msgSend(v2, "abstractObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  _connectedLibraryManagerRegisterQueue();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
  *((_QWORD *)&buf + 1) = 3221225472;
  v18 = ___registerConnectedLibraryManager_block_invoke;
  v19 = &unk_1E60D65B8;
  v20 = v6;
  v9 = v6;
  dispatch_sync(v7, &buf);

  objc_msgSend(*(id *)(a1 + 32), "_setupConnection");
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(NSObject **)(v10 + 176);
  handler[0] = v8;
  handler[1] = 3221225472;
  handler[2] = __52__CPLProxyLibraryManager_openWithCompletionHandler___block_invoke_296;
  handler[3] = &unk_1E60D6730;
  handler[4] = v10;
  notify_register_dispatch("com.apple.cpl.cloudphotoddidlaunch", (int *)(v10 + 168), v11, handler);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 173) = 1;
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __52__CPLProxyLibraryManager_openWithCompletionHandler___block_invoke_298;
  v13[3] = &unk_1E60D6758;
  v12 = *(void **)(a1 + 40);
  v14 = *(id *)(a1 + 32);
  v15 = v12;
  objc_msgSend(v14, "_reallyOpenWithCompletionHandler:", v13);

}

void __52__CPLProxyLibraryManager_openWithCompletionHandler___block_invoke_296(uint64_t a1, int a2)
{
  uint64_t v2;
  int v3;
  NSObject *v4;
  uint8_t v5[8];
  _QWORD v6[5];

  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v2 + 172) && *(_DWORD *)(v2 + 168) == a2)
  {
    v3 = *(_DWORD *)(v2 + 152);
    if (v3 == 4)
    {
      if (!_CPLSilentLogging)
      {
        __CPLManagerOSLogDomain();
        v4 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v5 = 0;
          _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_DEFAULT, "cloudphotod has been relaunched but our current connection is invalid - will reconnect only when necessary", v5, 2u);
        }

      }
    }
    else if (v3 == 1)
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __52__CPLProxyLibraryManager_openWithCompletionHandler___block_invoke_2;
      v6[3] = &unk_1E60D65B8;
      v6[4] = v2;
      objc_msgSend((id)v2, "_dispatchBlockWhenOpen:", v6);
    }
  }
}

void __52__CPLProxyLibraryManager_openWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v1;
  const char *v2;
  uint8_t *v3;
  __int16 v4;
  uint8_t buf[2];

  if (*(_DWORD *)(*(_QWORD *)(a1 + 32) + 152) == 1)
  {
    if (_CPLSilentLogging)
      return;
    __CPLManagerOSLogDomain();
    v1 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    v4 = 0;
    v2 = "Failed to reconnect to cloudphotod";
    v3 = (uint8_t *)&v4;
    goto LABEL_8;
  }
  if (_CPLSilentLogging)
    return;
  __CPLManagerOSLogDomain();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v2 = "Automatically reconnected to cloudphotod";
    v3 = buf;
LABEL_8:
    _os_log_impl(&dword_1B03C2000, v1, OS_LOG_TYPE_DEFAULT, v2, v3, 2u);
  }
LABEL_9:

}

void __52__CPLProxyLibraryManager_openWithCompletionHandler___block_invoke_298(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 173) = 0;
  if (v11)
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 32), "abstractObject");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "libraryIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v24 = v18;
        v25 = 2112;
        v26 = v11;
        _os_log_impl(&dword_1B03C2000, v16, OS_LOG_TYPE_ERROR, "First try opening library manager for %{public}@ failed, will retry once - error: %@", buf, 0x16u);

      }
    }
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __52__CPLProxyLibraryManager_openWithCompletionHandler___block_invoke_299;
    v20[3] = &unk_1E60D6758;
    v19 = *(void **)(a1 + 40);
    v21 = *(id *)(a1 + 32);
    v22 = v19;
    objc_msgSend(v21, "_reallyOpenWithCompletionHandler:", v20);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __52__CPLProxyLibraryManager_openWithCompletionHandler___block_invoke_299(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  const char *v19;
  NSObject *v20;
  os_log_type_t v21;
  uint32_t v22;
  int v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (v11)
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 32), "abstractObject");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "libraryIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138543618;
        v24 = v18;
        v25 = 2112;
        v26 = v11;
        v19 = "Second try opening library manager for %{public}@ failed: %@";
        v20 = v16;
        v21 = OS_LOG_TYPE_ERROR;
        v22 = 22;
LABEL_8:
        _os_log_impl(&dword_1B03C2000, v20, v21, v19, (uint8_t *)&v23, v22);

        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  else if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "abstractObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "libraryIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543362;
      v24 = v18;
      v19 = "Second try opening library manager for %{public}@ succeeded";
      v20 = v16;
      v21 = OS_LOG_TYPE_DEFAULT;
      v22 = 12;
      goto LABEL_8;
    }
LABEL_9:

  }
  (*(void (**)(_QWORD, id, id, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v11, v12, v13);

}

- (void)closeWithCompletionHandler:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  uint64_t v6;
  _QWORD *v7;
  NSObject *v8;
  id v9;
  dispatch_block_t v10;
  _QWORD v11[5];
  id v12;
  _QWORD block[4];
  id v14;

  v4 = a3;
  queue = self->_queue;
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53__CPLProxyLibraryManager_closeWithCompletionHandler___block_invoke;
  v11[3] = &unk_1E60D6708;
  v11[4] = self;
  v12 = v4;
  v7 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60D71F8;
  v14 = v7;
  v8 = queue;
  v9 = v4;
  v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);

}

void __53__CPLProxyLibraryManager_closeWithCompletionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  int *v5;
  int v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "abstractObject");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v10 = v3;
      _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEFAULT, "%@ closing connection to daemon", buf, 0xCu);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "abstractObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _unregisterConnectedLibraryManager(v4);

  v5 = *(int **)(a1 + 32);
  v6 = v5[42];
  if (v6)
  {
    notify_cancel(v6);
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 168) = 0;
    v5 = *(int **)(a1 + 32);
  }
  if (v5[38] > 1)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __53__CPLProxyLibraryManager_closeWithCompletionHandler___block_invoke_300;
    v7[3] = &unk_1E60D6708;
    v7[4] = v5;
    v8 = *(id *)(a1 + 40);
    objc_msgSend(v5, "_dispatchBlockWhenOpen:", v7);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void __53__CPLProxyLibraryManager_closeWithCompletionHandler___block_invoke_300(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[5];
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;

  objc_msgSend(*(id *)(a1 + 32), "_connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __53__CPLProxyLibraryManager_closeWithCompletionHandler___block_invoke_2;
  v13[3] = &unk_1E60D67A8;
  v4 = *(void **)(a1 + 32);
  v14 = *(id *)(a1 + 40);
  objc_msgSend(v4, "proxyWithErrorHandler:", v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v10[0] = v3;
    v10[1] = 3221225472;
    v10[2] = __53__CPLProxyLibraryManager_closeWithCompletionHandler___block_invoke_3;
    v10[3] = &unk_1E60D67D0;
    v6 = *(id *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 32);
    v12 = v6;
    v10[4] = v7;
    v11 = v2;
    objc_msgSend(v5, "closeLibraryWithCompletionHandler:", v10);

    v8 = v12;
  }
  else
  {
    v9 = *(_QWORD *)(a1 + 40);
    +[CPLErrors libraryClosedError](CPLErrors, "libraryClosedError");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v8);
  }

}

uint64_t __53__CPLProxyLibraryManager_closeWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __53__CPLProxyLibraryManager_closeWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "_connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);

  if (v3 == v4)
    objc_msgSend(*(id *)(a1 + 32), "_dropConnectionCompletly");

}

- (void)deactivateWithCompletionHandler:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  uint64_t v6;
  _QWORD *v7;
  NSObject *v8;
  id v9;
  dispatch_block_t v10;
  _QWORD v11[5];
  id v12;
  _QWORD block[4];
  id v14;

  v4 = a3;
  queue = self->_queue;
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __58__CPLProxyLibraryManager_deactivateWithCompletionHandler___block_invoke;
  v11[3] = &unk_1E60D6708;
  v11[4] = self;
  v12 = v4;
  v7 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60D71F8;
  v14 = v7;
  v8 = queue;
  v9 = v4;
  v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);

}

void __58__CPLProxyLibraryManager_deactivateWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __58__CPLProxyLibraryManager_deactivateWithCompletionHandler___block_invoke_2;
  v2[3] = &unk_1E60D6708;
  v1 = *(void **)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = v1;
  objc_msgSend(v3, "_dispatchBlockWhenOpen:", v2);

}

void __58__CPLProxyLibraryManager_deactivateWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  uint8_t v16[16];
  _QWORD v17[5];
  id v18;
  id v19;
  __int128 *v20;
  _QWORD v21[5];
  id v22;
  __int128 *v23;
  _QWORD v24[5];
  id v25;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "abstractObject");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v3;
      _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEFAULT, "%@ deactivating then closing connection to daemon", (uint8_t *)&buf, 0xCu);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "abstractObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _unregisterConnectedLibraryManager(v4);

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_DWORD *)(v5 + 168);
  if (v6)
  {
    notify_cancel(v6);
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 168) = 0;
    v5 = *(_QWORD *)(a1 + 32);
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy_;
  v30 = __Block_byref_object_dispose_;
  v31 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __58__CPLProxyLibraryManager_deactivateWithCompletionHandler___block_invoke_301;
  v24[3] = &unk_1E60D67F8;
  v24[4] = v5;
  v25 = *(id *)(a1 + 40);
  p_buf = &buf;
  v8 = (void *)MEMORY[0x1B5E08DC4](v24);
  objc_msgSend(*(id *)(a1 + 32), "_connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(void **)(a1 + 32);
  v21[0] = v7;
  v21[1] = 3221225472;
  v21[2] = __58__CPLProxyLibraryManager_deactivateWithCompletionHandler___block_invoke_302;
  v21[3] = &unk_1E60D6848;
  v21[4] = v10;
  v23 = &buf;
  v11 = v8;
  v22 = v11;
  objc_msgSend(v10, "proxyWithErrorHandler:", v21);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v17[0] = v7;
    v17[1] = 3221225472;
    v17[2] = __58__CPLProxyLibraryManager_deactivateWithCompletionHandler___block_invoke_304;
    v17[3] = &unk_1E60D6870;
    v17[4] = *(_QWORD *)(a1 + 32);
    v18 = v9;
    v20 = &buf;
    v19 = v11;
    objc_msgSend(v12, "deactivateLibraryWithCompletionHandler:", v17);

  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_1B03C2000, v13, OS_LOG_TYPE_DEFAULT, "Proxy has disappeared before deactivation", v16, 2u);
      }

    }
    v14 = *(_QWORD *)(a1 + 40);
    +[CPLErrors libraryClosedError](CPLErrors, "libraryClosedError");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);

  }
  _Block_object_dispose(&buf, 8);

}

uint64_t __58__CPLProxyLibraryManager_deactivateWithCompletionHandler___block_invoke_301(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "abstractObject");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 138412290;
      v6 = v3;
      _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEFAULT, "Daemon library for %@ has been fully deactivated", (uint8_t *)&v5, 0xCu);

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "_dropConnectionCompletly");
}

void __58__CPLProxyLibraryManager_deactivateWithCompletionHandler___block_invoke_302(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD *v10;
  NSObject *v11;
  id v12;
  id v13;
  dispatch_block_t v14;
  __int128 v15;
  _QWORD v16[4];
  id v17;
  id v18;
  __int128 v19;
  _QWORD block[4];
  id v21;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 176);
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __58__CPLProxyLibraryManager_deactivateWithCompletionHandler___block_invoke_2_303;
  v16[3] = &unk_1E60D6820;
  v17 = v5;
  v18 = v6;
  v15 = *(_OWORD *)(a1 + 40);
  v9 = (id)v15;
  v19 = v15;
  v10 = v16;
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60D71F8;
  v21 = v10;
  v11 = v7;
  v12 = v6;
  v13 = v5;
  v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v11, v14);

}

uint64_t __58__CPLProxyLibraryManager_deactivateWithCompletionHandler___block_invoke_2_303(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v3 = *(_QWORD *)(a1 + 32);
      v4 = *(_QWORD *)(a1 + 40);
      v6 = 138412546;
      v7 = v3;
      v8 = 2112;
      v9 = v4;
      _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_ERROR, "%@ failed to deactivate library manager: %@", (uint8_t *)&v6, 0x16u);
    }

  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(id *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __58__CPLProxyLibraryManager_deactivateWithCompletionHandler___block_invoke_304(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD *v8;
  NSObject *v9;
  id v10;
  dispatch_block_t v11;
  __int128 v12;
  _QWORD v13[4];
  id v14;
  id v15;
  __int128 v16;
  _QWORD block[4];
  id v18;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 176);
  v13[2] = __58__CPLProxyLibraryManager_deactivateWithCompletionHandler___block_invoke_2_305;
  v13[3] = &unk_1E60D6820;
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v14 = v3;
  v15 = v4;
  v12 = *(_OWORD *)(a1 + 48);
  v7 = (id)v12;
  v16 = v12;
  v8 = v13;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60D71F8;
  v18 = v8;
  v9 = v5;
  v10 = v3;
  v11 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v9, v11);

}

uint64_t __58__CPLProxyLibraryManager_deactivateWithCompletionHandler___block_invoke_2_305(_QWORD *a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = (void *)a1[4];
  if (v2)
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        v5 = a1[4];
        v4 = a1[5];
        v11 = 138412546;
        v12 = v4;
        v13 = 2112;
        v14 = v5;
        _os_log_impl(&dword_1B03C2000, v3, OS_LOG_TYPE_ERROR, "%@ failed to deactivate library manager: %@", (uint8_t *)&v11, 0x16u);
      }

      v2 = (void *)a1[4];
    }
    v6 = *(_QWORD *)(a1[7] + 8);
    v7 = v2;
    v8 = *(NSObject **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v7;
LABEL_10:

    return (*(uint64_t (**)(void))(a1[6] + 16))();
  }
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = a1[5];
      v11 = 138412290;
      v12 = v9;
      _os_log_impl(&dword_1B03C2000, v8, OS_LOG_TYPE_DEFAULT, "%@ deactivated library manager", (uint8_t *)&v11, 0xCu);
    }
    goto LABEL_10;
  }
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

- (void)activateScopeWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *queue;
  uint64_t v9;
  _QWORD *v10;
  NSObject *v11;
  id v12;
  id v13;
  dispatch_block_t v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD block[4];
  id v19;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __72__CPLProxyLibraryManager_activateScopeWithIdentifier_completionHandler___block_invoke;
  v15[3] = &unk_1E60D6898;
  v16 = v6;
  v17 = v7;
  v15[4] = self;
  v10 = v15;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60D71F8;
  v19 = v10;
  v11 = queue;
  v12 = v6;
  v13 = v7;
  v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v11, v14);

}

void __72__CPLProxyLibraryManager_activateScopeWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __72__CPLProxyLibraryManager_activateScopeWithIdentifier_completionHandler___block_invoke_2;
  v3[3] = &unk_1E60D6898;
  v3[4] = v2;
  v5 = *(id *)(a1 + 48);
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "_dispatchBlockWhenOpen:", v3);

}

void __72__CPLProxyLibraryManager_activateScopeWithIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v2 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__CPLProxyLibraryManager_activateScopeWithIdentifier_completionHandler___block_invoke_3;
  v7[3] = &unk_1E60D67A8;
  v8 = *(id *)(a1 + 48);
  objc_msgSend(v2, "proxyWithErrorHandler:", v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "activateScopeWithIdentifier:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    v5 = *(_QWORD *)(a1 + 48);
    if (v5)
    {
      +[CPLErrors unknownError](CPLErrors, "unknownError");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

    }
  }

}

uint64_t __72__CPLProxyLibraryManager_activateScopeWithIdentifier_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  return result;
}

- (void)deactivateScopeWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *queue;
  uint64_t v9;
  _QWORD *v10;
  NSObject *v11;
  id v12;
  id v13;
  dispatch_block_t v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD block[4];
  id v19;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __74__CPLProxyLibraryManager_deactivateScopeWithIdentifier_completionHandler___block_invoke;
  v15[3] = &unk_1E60D6898;
  v16 = v6;
  v17 = v7;
  v15[4] = self;
  v10 = v15;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60D71F8;
  v19 = v10;
  v11 = queue;
  v12 = v6;
  v13 = v7;
  v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v11, v14);

}

void __74__CPLProxyLibraryManager_deactivateScopeWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __74__CPLProxyLibraryManager_deactivateScopeWithIdentifier_completionHandler___block_invoke_2;
  v3[3] = &unk_1E60D6898;
  v3[4] = v2;
  v5 = *(id *)(a1 + 48);
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "_dispatchBlockWhenOpen:", v3);

}

void __74__CPLProxyLibraryManager_deactivateScopeWithIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v2 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __74__CPLProxyLibraryManager_deactivateScopeWithIdentifier_completionHandler___block_invoke_3;
  v7[3] = &unk_1E60D67A8;
  v8 = *(id *)(a1 + 48);
  objc_msgSend(v2, "proxyWithErrorHandler:", v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "deactivateScopeWithIdentifier:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    v5 = *(_QWORD *)(a1 + 48);
    if (v5)
    {
      +[CPLErrors unknownError](CPLErrors, "unknownError");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

    }
  }

}

uint64_t __74__CPLProxyLibraryManager_deactivateScopeWithIdentifier_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  return result;
}

- (void)boostPriorityForScopeWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *queue;
  uint64_t v9;
  _QWORD *v10;
  NSObject *v11;
  id v12;
  id v13;
  dispatch_block_t v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD block[4];
  id v19;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __80__CPLProxyLibraryManager_boostPriorityForScopeWithIdentifier_completionHandler___block_invoke;
  v15[3] = &unk_1E60D6898;
  v16 = v6;
  v17 = v7;
  v15[4] = self;
  v10 = v15;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60D71F8;
  v19 = v10;
  v11 = queue;
  v12 = v6;
  v13 = v7;
  v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v11, v14);

}

void __80__CPLProxyLibraryManager_boostPriorityForScopeWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __80__CPLProxyLibraryManager_boostPriorityForScopeWithIdentifier_completionHandler___block_invoke_2;
  v3[3] = &unk_1E60D6898;
  v3[4] = v2;
  v5 = *(id *)(a1 + 48);
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "_dispatchBlockWhenOpen:", v3);

}

void __80__CPLProxyLibraryManager_boostPriorityForScopeWithIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v2 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __80__CPLProxyLibraryManager_boostPriorityForScopeWithIdentifier_completionHandler___block_invoke_3;
  v7[3] = &unk_1E60D67A8;
  v8 = *(id *)(a1 + 48);
  objc_msgSend(v2, "proxyWithErrorHandler:", v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "boostPriorityForScopeWithIdentifier:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    v5 = *(_QWORD *)(a1 + 48);
    if (v5)
    {
      +[CPLErrors unknownError](CPLErrors, "unknownError");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

    }
  }

}

uint64_t __80__CPLProxyLibraryManager_boostPriorityForScopeWithIdentifier_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  return result;
}

- (void)_invokeOutstandingInvocationsWithTaskIdentifier:(id)a3
{
  id v4;
  unint64_t outstandingInvocationsCount;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  float v11;
  unint64_t v12;
  BOOL v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSMutableDictionary *outstandingInvocations;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  outstandingInvocationsCount = self->_outstandingInvocationsCount;
  if (!outstandingInvocationsCount)
    -[CPLProxyLibraryManager _invokeOutstandingInvocationsWithTaskIdentifier:].cold.1();
  v6 = v4;
  if (v4)
  {
    -[NSMutableDictionary objectForKey:](self->_outstandingInvocations, "objectForKey:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[NSMutableDictionary removeObjectForKey:](self->_outstandingInvocations, "removeObjectForKey:", v6);
      if (!_CPLSilentLogging)
      {
        __CPLManagerOSLogDomain();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          v18 = 138412546;
          v19 = v6;
          v20 = 2112;
          v21 = v7;
          _os_log_impl(&dword_1B03C2000, v8, OS_LOG_TYPE_DEBUG, "Got some callbacks for task with identifier %@ before we actually knew about it, redispatching: %@", (uint8_t *)&v18, 0x16u);
        }

      }
      if ((objc_msgSend(v7, "isInMemoryRequest") & 1) == 0)
      {
        if (objc_msgSend(v7, "didStart"))
          -[CPLProxyLibraryManager downloadDidStartForResourceTransferTask:](self, "downloadDidStartForResourceTransferTask:", v6);
        objc_msgSend(v7, "progress");
        if (v11 > 0.0)
        {
          objc_msgSend(v7, "progress");
          -[CPLProxyLibraryManager downloadDidProgress:forResourceTransferTask:](self, "downloadDidProgress:forResourceTransferTask:", v6);
        }
        if (!objc_msgSend(v7, "didFinish"))
          goto LABEL_18;
        objc_msgSend(v7, "finalResource");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "finalError");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[CPLProxyLibraryManager downloadDidFinishForResourceTransferTask:finalResource:withError:](self, "downloadDidFinishForResourceTransferTask:finalResource:withError:", v6, v9, v10);
        goto LABEL_17;
      }
      if (objc_msgSend(v7, "didFinish"))
      {
        objc_msgSend(v7, "finalData");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "finalError");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[CPLProxyLibraryManager inMemoryDownloadDidFinishForResourceTransferTask:data:withError:](self, "inMemoryDownloadDidFinishForResourceTransferTask:data:withError:", v6, v9, v10);
LABEL_17:

      }
    }
LABEL_18:

    outstandingInvocationsCount = self->_outstandingInvocationsCount;
  }
  v12 = outstandingInvocationsCount - 1;
  self->_outstandingInvocationsCount = v12;
  if (!v12)
  {
    if (-[NSMutableDictionary count](self->_outstandingInvocations, "count"))
      v13 = _CPLSilentLogging == 0;
    else
      v13 = 0;
    if (v13)
    {
      __CPLManagerOSLogDomain();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        -[NSMutableDictionary allKeys](self->_outstandingInvocations, "allKeys");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "componentsJoinedByString:", CFSTR(", "));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138412290;
        v19 = v16;
        _os_log_impl(&dword_1B03C2000, v14, OS_LOG_TYPE_ERROR, "Dropping outstanding invocations for tasks with identifiers %@", (uint8_t *)&v18, 0xCu);

      }
    }
    outstandingInvocations = self->_outstandingInvocations;
    self->_outstandingInvocations = 0;

  }
}

- (void)_dispatchFailedDownloadTaskForResource:(id)a3 options:(id)a4 proposedTaskIdentifier:(id)a5 withError:(id)a6 withCompletionHandler:(id)a7
{
  id v12;
  id v13;
  void (**v14)(id, void *);
  id v15;
  CPLResourceTransferTask *v16;
  CPLResourceTransferTask *v17;
  CPLResourceTransferTask *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a3;
  v12 = a5;
  v13 = a6;
  v14 = (void (**)(id, void *))a7;
  v15 = a4;
  v16 = [CPLResourceTransferTask alloc];
  v17 = v16;
  if (v12)
  {
    v18 = -[CPLResourceTransferTask initWithResource:taskIdentifier:](v16, "initWithResource:taskIdentifier:", v23, v12);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "UUIDString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[CPLResourceTransferTask initWithResource:taskIdentifier:](v17, "initWithResource:taskIdentifier:", v23, v20);

  }
  -[CPLResourceTransferTask setOptions:](v18, "setOptions:", v15);

  v14[2](v14, v18);
  -[CPLPlatformObject abstractObject](self, "abstractObject");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "resourceProgressDelegate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "libraryManager:downloadDidFinishForResourceTransferTask:finalResource:withError:", v21, v18, v23, v13);

}

- (void)beginDownloadForResource:(id)a3 clientBundleID:(id)a4 options:(id)a5 proposedTaskIdentifier:(id)a6 completionHandler:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  OS_dispatch_queue *queue;
  uint64_t v20;
  _QWORD *v21;
  NSObject *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  dispatch_block_t v29;
  _QWORD v30[5];
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  SEL v37;
  _QWORD block[4];
  id v39;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = (void *)voucher_copy();
  queue = self->_queue;
  v20 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __115__CPLProxyLibraryManager_beginDownloadForResource_clientBundleID_options_proposedTaskIdentifier_completionHandler___block_invoke;
  v30[3] = &unk_1E60D6910;
  v30[4] = self;
  v31 = v13;
  v32 = v15;
  v33 = v16;
  v36 = v17;
  v37 = a2;
  v34 = v14;
  v35 = v18;
  v21 = v30;
  block[0] = v20;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60D71F8;
  v39 = v21;
  v22 = queue;
  v23 = v18;
  v24 = v14;
  v25 = v17;
  v26 = v16;
  v27 = v15;
  v28 = v13;
  v29 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v22, v29);

}

void __115__CPLProxyLibraryManager_beginDownloadForResource_clientBundleID_options_proposedTaskIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __115__CPLProxyLibraryManager_beginDownloadForResource_clientBundleID_options_proposedTaskIdentifier_completionHandler___block_invoke_2;
  v5[3] = &unk_1E60D6910;
  v2 = *(void **)(a1 + 40);
  v6 = *(id *)(a1 + 32);
  v7 = v2;
  v8 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 56);
  v3 = *(id *)(a1 + 80);
  v4 = *(_QWORD *)(a1 + 88);
  v12 = v3;
  v13 = v4;
  v10 = *(id *)(a1 + 64);
  v11 = *(id *)(a1 + 72);
  objc_msgSend(v6, "_dispatchBlockWhenOpen:", v5);

}

void __115__CPLProxyLibraryManager_beginDownloadForResource_clientBundleID_options_proposedTaskIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  id *v3;
  uint64_t v4;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  id v31;

  v3 = (id *)(a1 + 32);
  v2 = *(void **)(a1 + 32);
  v4 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __115__CPLProxyLibraryManager_beginDownloadForResource_clientBundleID_options_proposedTaskIdentifier_completionHandler___block_invoke_3;
  v27[3] = &unk_1E60D68C0;
  v27[4] = v2;
  v28 = *(id *)(a1 + 40);
  v29 = v3[2];
  v30 = v3[3];
  v31 = v3[6];
  objc_msgSend(v2, "proxyWithErrorHandler:", v27);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *v3;
  if (v5)
  {
    v7 = v6[15];
    if (v6[14])
    {
      v6[15] = v7 + 1;
    }
    else
    {
      if (v7)
        __115__CPLProxyLibraryManager_beginDownloadForResource_clientBundleID_options_proposedTaskIdentifier_completionHandler___block_invoke_2_cold_1();
      v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v13 = (void *)*((_QWORD *)*v3 + 14);
      *((_QWORD *)*v3 + 14) = v12;

      *((_QWORD *)*v3 + 15) = 1;
    }
    v14 = *(void **)(a1 + 40);
    v15 = *(_QWORD *)(a1 + 48);
    v17 = *(_QWORD *)(a1 + 56);
    v16 = *(_QWORD *)(a1 + 64);
    v20[0] = v4;
    v20[1] = 3221225472;
    v20[2] = __115__CPLProxyLibraryManager_beginDownloadForResource_clientBundleID_options_proposedTaskIdentifier_completionHandler___block_invoke_314;
    v20[3] = &unk_1E60D68E8;
    v18 = v14;
    v19 = *(_QWORD *)(a1 + 32);
    v21 = v18;
    v22 = v19;
    v23 = *(id *)(a1 + 48);
    v24 = *(id *)(a1 + 72);
    v26 = *(id *)(a1 + 80);
    v25 = *(id *)(a1 + 56);
    objc_msgSend(v5, "beginDownloadForResource:clientBundleID:options:proposedTaskIdentifier:reply:", v18, v16, v15, v17, v20);

    v11 = v21;
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 48);
    v10 = *(_QWORD *)(a1 + 56);
    +[CPLErrors unknownError](CPLErrors, "unknownError");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_dispatchFailedDownloadTaskForResource:options:proposedTaskIdentifier:withError:withCompletionHandler:", v8, v9, v10, v11, *(_QWORD *)(a1 + 80));
  }

}

uint64_t __115__CPLProxyLibraryManager_beginDownloadForResource_clientBundleID_options_proposedTaskIdentifier_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_msgSend(*(id *)(a1 + 32), "_dispatchFailedDownloadTaskForResource:options:proposedTaskIdentifier:withError:withCompletionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), a3, *(_QWORD *)(a1 + 64));
  return objc_msgSend(*(id *)(a1 + 32), "_invokeOutstandingInvocationsWithTaskIdentifier:", 0);
}

void __115__CPLProxyLibraryManager_beginDownloadForResource_clientBundleID_options_proposedTaskIdentifier_completionHandler___block_invoke_314(uint64_t a1, void *a2)
{
  CPLProxyResourceTransferTask *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  if (v8)
  {
    v3 = -[CPLResourceTransferTask initWithResource:taskIdentifier:]([CPLProxyResourceTransferTask alloc], "initWithResource:taskIdentifier:", *(_QWORD *)(a1 + 32), v8);
    -[CPLProxyResourceTransferTask setProxyLibraryManager:](v3, "setProxyLibraryManager:", *(_QWORD *)(a1 + 40));
    -[CPLResourceTransferTask setOptions:](v3, "setOptions:", *(_QWORD *)(a1 + 48));
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "count"))
      +[CPLTransaction beginTransactionWithIdentifier:description:keepPower:](CPLTransaction, "beginTransactionWithIdentifier:description:keepPower:", CFSTR("cpl.activeresourcedownloads"), CFSTR("resource downloads are active"), 1);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "setObject:forKey:", v3, v8);
    objc_msgSend(*(id *)(a1 + 40), "_storeVoucher:forTaskWithIdentifier:", *(_QWORD *)(a1 + 56), v8);
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }
  else
  {
    v5 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 48);
    v7 = *(_QWORD *)(a1 + 64);
    +[CPLErrors unknownError](CPLErrors, "unknownError");
    v3 = (CPLProxyResourceTransferTask *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_dispatchFailedDownloadTaskForResource:options:proposedTaskIdentifier:withError:withCompletionHandler:", v5, v6, v7, v3, *(_QWORD *)(a1 + 72));
  }

  objc_msgSend(*(id *)(a1 + 40), "_invokeOutstandingInvocationsWithTaskIdentifier:", v8);
}

- (void)getStreamingURLForResource:(id)a3 intent:(unint64_t)a4 hints:(id)a5 timeRange:(id *)a6 clientBundleID:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  __int128 v21;
  OS_dispatch_queue *queue;
  _QWORD *v23;
  NSObject *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  dispatch_block_t v30;
  _QWORD v32[5];
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  unint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t block;
  uint64_t v43;
  void (*v44)(uint64_t);
  void *v45;
  id v46;
  SEL v47;

  v14 = a3;
  v15 = a5;
  v16 = a7;
  v17 = a8;
  v18 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x1E0C809B0];
  block = MEMORY[0x1E0C809B0];
  v43 = 3221225472;
  v44 = ___CPLProgressForAsyncCall_block_invoke;
  v45 = &__block_descriptor_48_e5_v8__0lu32l8;
  v46 = v18;
  v47 = a2;
  objc_msgSend(v19, "setCancellationHandler:", &block);
  v21 = *(_OWORD *)&a6->var0.var3;
  v39 = *(_OWORD *)&a6->var0.var0;
  queue = self->_queue;
  v32[0] = v20;
  v32[1] = 3221225472;
  v32[2] = __109__CPLProxyLibraryManager_getStreamingURLForResource_intent_hints_timeRange_clientBundleID_completionHandler___block_invoke;
  v32[3] = &unk_1E60D69B0;
  v32[4] = self;
  v33 = v19;
  v37 = v17;
  v38 = a4;
  v34 = v14;
  v35 = v15;
  v40 = v21;
  v41 = *(_OWORD *)&a6->var1.var1;
  v36 = v16;
  v23 = v32;
  block = v20;
  v43 = 3221225472;
  v44 = __cpl_dispatch_async_block_invoke;
  v45 = &unk_1E60D71F8;
  v46 = v23;
  v24 = queue;
  v25 = v16;
  v26 = v15;
  v27 = v14;
  v28 = v19;
  v29 = v17;
  v30 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
  dispatch_async(v24, v30);

}

void __109__CPLProxyLibraryManager_getStreamingURLForResource_intent_hints_timeRange_clientBundleID_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  __int128 v5;
  _QWORD v6[5];
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;

  v2 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __109__CPLProxyLibraryManager_getStreamingURLForResource_intent_hints_timeRange_clientBundleID_completionHandler___block_invoke_2;
  v6[3] = &unk_1E60D69B0;
  v6[4] = v2;
  v11 = *(id *)(a1 + 72);
  v7 = *(id *)(a1 + 40);
  v3 = *(id *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 80);
  v8 = v3;
  v12 = v4;
  v9 = *(id *)(a1 + 56);
  v5 = *(_OWORD *)(a1 + 104);
  v13 = *(_OWORD *)(a1 + 88);
  v14 = v5;
  v15 = *(_OWORD *)(a1 + 120);
  v10 = *(id *)(a1 + 64);
  objc_msgSend(v2, "_dispatchBlockWhenOpen:", v6);

}

void __109__CPLProxyLibraryManager_getStreamingURLForResource_intent_hints_timeRange_clientBundleID_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[4];
  id v24;
  id v25;

  v2 = MEMORY[0x1E0C809B0];
  v3 = *(void **)(a1 + 32);
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __109__CPLProxyLibraryManager_getStreamingURLForResource_intent_hints_timeRange_clientBundleID_completionHandler___block_invoke_3;
  v23[3] = &unk_1E60D6938;
  v25 = *(id *)(a1 + 72);
  v24 = *(id *)(a1 + 40);
  objc_msgSend(v3, "proxyWithErrorHandler:", v23);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = *(void **)(a1 + 40);
    v12[0] = v2;
    v12[1] = 3221225472;
    v12[2] = __109__CPLProxyLibraryManager_getStreamingURLForResource_intent_hints_timeRange_clientBundleID_completionHandler___block_invoke_4;
    v12[3] = &unk_1E60D6988;
    v13 = v4;
    v7 = *(id *)(a1 + 48);
    v8 = *(_QWORD *)(a1 + 80);
    v14 = v7;
    v19 = v8;
    v15 = *(id *)(a1 + 56);
    v9 = *(_OWORD *)(a1 + 104);
    v20 = *(_OWORD *)(a1 + 88);
    v21 = v9;
    v22 = *(_OWORD *)(a1 + 120);
    v16 = *(id *)(a1 + 64);
    v18 = *(id *)(a1 + 72);
    v17 = *(id *)(a1 + 40);
    objc_msgSend(v6, "performAsCurrentWithPendingUnitCount:usingBlock:", 1, v12);

  }
  else
  {
    v10 = *(_QWORD *)(a1 + 72);
    if (v10)
    {
      +[CPLErrors unknownError](CPLErrors, "unknownError");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, void *))(v10 + 16))(v10, 0, 0, 0, 0, v11);

    }
    objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount"));
  }

}

uint64_t __109__CPLProxyLibraryManager_getStreamingURLForResource_intent_hints_timeRange_clientBundleID_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t))(v4 + 16))(v4, 0, 0, 0, 0, a3);
  return objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
}

void __109__CPLProxyLibraryManager_getStreamingURLForResource_intent_hints_timeRange_clientBundleID_completionHandler___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  _OWORD v8[3];
  _QWORD v9[4];
  id v10;
  id v11;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __109__CPLProxyLibraryManager_getStreamingURLForResource_intent_hints_timeRange_clientBundleID_completionHandler___block_invoke_5;
  v9[3] = &unk_1E60D6960;
  v6 = *(_QWORD *)(a1 + 80);
  v11 = *(id *)(a1 + 72);
  v10 = *(id *)(a1 + 64);
  v7 = *(_OWORD *)(a1 + 104);
  v8[0] = *(_OWORD *)(a1 + 88);
  v8[1] = v7;
  v8[2] = *(_OWORD *)(a1 + 120);
  objc_msgSend(v2, "getStreamingURLForResource:intent:hints:timeRange:clientBundleID:completionHandler:", v3, v6, v4, v8, v5, v9);

}

uint64_t __109__CPLProxyLibraryManager_getStreamingURLForResource_intent_hints_timeRange_clientBundleID_completionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
}

- (void)rampingRequestForResourceType:(unint64_t)a3 numRequested:(unint64_t)a4 completionHandler:(id)a5
{
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  OS_dispatch_queue *queue;
  _QWORD *v14;
  NSObject *v15;
  id v16;
  id v17;
  dispatch_block_t v18;
  _QWORD v19[5];
  id v20;
  id v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t block;
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  id v28;
  SEL v29;

  v9 = a5;
  v10 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  block = MEMORY[0x1E0C809B0];
  v25 = 3221225472;
  v26 = ___CPLProgressForAsyncCall_block_invoke;
  v27 = &__block_descriptor_48_e5_v8__0lu32l8;
  v28 = v10;
  v29 = a2;
  objc_msgSend(v11, "setCancellationHandler:", &block);
  queue = self->_queue;
  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = __87__CPLProxyLibraryManager_rampingRequestForResourceType_numRequested_completionHandler___block_invoke;
  v19[3] = &unk_1E60D6A00;
  v19[4] = self;
  v20 = v11;
  v21 = v9;
  v22 = a3;
  v23 = a4;
  v14 = v19;
  block = v12;
  v25 = 3221225472;
  v26 = __cpl_dispatch_async_block_invoke;
  v27 = &unk_1E60D71F8;
  v28 = v14;
  v15 = queue;
  v16 = v11;
  v17 = v9;
  v18 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
  dispatch_async(v15, v18);

}

void __87__CPLProxyLibraryManager_rampingRequestForResourceType_numRequested_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;
  id v5;
  __int128 v6;

  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __87__CPLProxyLibraryManager_rampingRequestForResourceType_numRequested_completionHandler___block_invoke_2;
  v3[3] = &unk_1E60D6A00;
  v3[4] = v2;
  v5 = *(id *)(a1 + 48);
  v4 = *(id *)(a1 + 40);
  v6 = *(_OWORD *)(a1 + 56);
  objc_msgSend(v2, "_dispatchBlockWhenOpen:", v3);

}

void __87__CPLProxyLibraryManager_rampingRequestForResourceType_numRequested_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  __int128 v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v2 = MEMORY[0x1E0C809B0];
  v3 = *(void **)(a1 + 32);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __87__CPLProxyLibraryManager_rampingRequestForResourceType_numRequested_completionHandler___block_invoke_3;
  v14[3] = &unk_1E60D6938;
  v16 = *(id *)(a1 + 48);
  v15 = *(id *)(a1 + 40);
  objc_msgSend(v3, "proxyWithErrorHandler:", v14);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = *(void **)(a1 + 40);
    v9[0] = v2;
    v9[1] = 3221225472;
    v9[2] = __87__CPLProxyLibraryManager_rampingRequestForResourceType_numRequested_completionHandler___block_invoke_4;
    v9[3] = &unk_1E60D6A00;
    v10 = v4;
    v13 = *(_OWORD *)(a1 + 56);
    v12 = *(id *)(a1 + 48);
    v11 = *(id *)(a1 + 40);
    objc_msgSend(v6, "performAsCurrentWithPendingUnitCount:usingBlock:", 1, v9);

  }
  else
  {
    v7 = *(_QWORD *)(a1 + 48);
    if (v7)
    {
      +[CPLErrors unknownError](CPLErrors, "unknownError");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v7 + 16))(v7, 0, 0, v8);

    }
    objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount"));
  }

}

uint64_t __87__CPLProxyLibraryManager_rampingRequestForResourceType_numRequested_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(uint64_t, _QWORD, _QWORD, uint64_t))(v4 + 16))(v4, 0, 0, a3);
  return objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
}

void __87__CPLProxyLibraryManager_rampingRequestForResourceType_numRequested_completionHandler___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 56);
  v3 = *(_QWORD *)(a1 + 64);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __87__CPLProxyLibraryManager_rampingRequestForResourceType_numRequested_completionHandler___block_invoke_5;
  v5[3] = &unk_1E60D69D8;
  v7 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v2, "rampingRequestForResourceType:numRequested:completionHandler:", v4, v3, v5);

}

uint64_t __87__CPLProxyLibraryManager_rampingRequestForResourceType_numRequested_completionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
}

- (void)_dispatchFailedInMemoryDownloadTaskForResource:(id)a3 withError:(id)a4 withCompletionHandler:(id)a5
{
  void (**v8)(id, id);
  id v9;
  id v10;
  CPLResourceTransferTask *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  CPLResourceTransferTask *v16;

  v8 = (void (**)(id, id))a5;
  v9 = a4;
  v10 = a3;
  v11 = [CPLResourceTransferTask alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[CPLResourceTransferTask initWithResource:taskIdentifier:](v11, "initWithResource:taskIdentifier:", v10, v13);

  -[CPLResourceTransferTask setHighPriority:](v16, "setHighPriority:", 0);
  v8[2](v8, v16);

  -[CPLPlatformObject abstractObject](self, "abstractObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "resourceProgressDelegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "libraryManager:inMemoryDownloadDidFinishForResourceTransferTask:data:withError:", v14, v16, 0, v9);

}

- (void)beginInMemoryDownloadOfResource:(id)a3 clientBundleID:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  OS_dispatch_queue *queue;
  uint64_t v14;
  _QWORD *v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  dispatch_block_t v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  id v26;
  SEL v27;
  _QWORD block[4];
  id v29;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void *)voucher_copy();
  queue = self->_queue;
  v14 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __91__CPLProxyLibraryManager_beginInMemoryDownloadOfResource_clientBundleID_completionHandler___block_invoke;
  v22[3] = &unk_1E60D6A78;
  v22[4] = self;
  v23 = v9;
  v26 = v11;
  v27 = a2;
  v24 = v10;
  v25 = v12;
  v15 = v22;
  block[0] = v14;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60D71F8;
  v29 = v15;
  v16 = queue;
  v17 = v12;
  v18 = v10;
  v19 = v11;
  v20 = v9;
  v21 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v16, v21);

}

void __91__CPLProxyLibraryManager_beginInMemoryDownloadOfResource_clientBundleID_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __91__CPLProxyLibraryManager_beginInMemoryDownloadOfResource_clientBundleID_completionHandler___block_invoke_2;
  v5[3] = &unk_1E60D6A78;
  v2 = *(void **)(a1 + 40);
  v6 = *(id *)(a1 + 32);
  v7 = v2;
  v3 = *(id *)(a1 + 64);
  v4 = *(_QWORD *)(a1 + 72);
  v10 = v3;
  v11 = v4;
  v8 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 56);
  objc_msgSend(v6, "_dispatchBlockWhenOpen:", v5);

}

void __91__CPLProxyLibraryManager_beginInMemoryDownloadOfResource_clientBundleID_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  id *v3;
  uint64_t v4;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;

  v3 = (id *)(a1 + 32);
  v2 = *(void **)(a1 + 32);
  v4 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __91__CPLProxyLibraryManager_beginInMemoryDownloadOfResource_clientBundleID_completionHandler___block_invoke_3;
  v21[3] = &unk_1E60D6A28;
  v21[4] = v2;
  v22 = *(id *)(a1 + 40);
  v23 = v3[4];
  objc_msgSend(v2, "proxyWithErrorHandler:", v21);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *v3;
  if (v5)
  {
    v7 = v6[15];
    if (v6[14])
    {
      v6[15] = v7 + 1;
    }
    else
    {
      if (v7)
        __91__CPLProxyLibraryManager_beginInMemoryDownloadOfResource_clientBundleID_completionHandler___block_invoke_2_cold_1();
      v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v11 = (void *)*((_QWORD *)*v3 + 14);
      *((_QWORD *)*v3 + 14) = v10;

      *((_QWORD *)*v3 + 15) = 1;
    }
    v12 = *(void **)(a1 + 40);
    v13 = *(_QWORD *)(a1 + 48);
    v16[0] = v4;
    v16[1] = 3221225472;
    v16[2] = __91__CPLProxyLibraryManager_beginInMemoryDownloadOfResource_clientBundleID_completionHandler___block_invoke_321;
    v16[3] = &unk_1E60D6A50;
    v14 = v12;
    v15 = *(_QWORD *)(a1 + 32);
    v17 = v14;
    v18 = v15;
    v19 = *(id *)(a1 + 56);
    v20 = *(id *)(a1 + 64);
    objc_msgSend(v5, "beginInMemoryDownloadOfResource:clientBundleID:reply:", v14, v13, v16);

    v9 = v17;
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 40);
    +[CPLErrors unknownError](CPLErrors, "unknownError");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_dispatchFailedInMemoryDownloadTaskForResource:withError:withCompletionHandler:", v8, v9, *(_QWORD *)(a1 + 64));
  }

}

uint64_t __91__CPLProxyLibraryManager_beginInMemoryDownloadOfResource_clientBundleID_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_msgSend(*(id *)(a1 + 32), "_dispatchFailedInMemoryDownloadTaskForResource:withError:withCompletionHandler:", *(_QWORD *)(a1 + 40), a3, *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "_invokeOutstandingInvocationsWithTaskIdentifier:", 0);
}

void __91__CPLProxyLibraryManager_beginInMemoryDownloadOfResource_clientBundleID_completionHandler___block_invoke_321(uint64_t a1, void *a2)
{
  CPLProxyResourceTransferTask *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  if (v7)
  {
    v3 = -[CPLResourceTransferTask initWithResource:taskIdentifier:]([CPLProxyResourceTransferTask alloc], "initWithResource:taskIdentifier:", *(_QWORD *)(a1 + 32), v7);
    -[CPLProxyResourceTransferTask setProxyLibraryManager:](v3, "setProxyLibraryManager:", *(_QWORD *)(a1 + 40));
    -[CPLResourceTransferTask setHighPriority:](v3, "setHighPriority:", 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "setObject:forKey:", v3, v7);
    objc_msgSend(*(id *)(a1 + 40), "_storeVoucher:forTaskWithIdentifier:", *(_QWORD *)(a1 + 48), v7);
    v4 = *(_QWORD *)(a1 + 56);
    if (v4)
      (*(void (**)(uint64_t, CPLProxyResourceTransferTask *))(v4 + 16))(v4, v3);
  }
  else
  {
    v6 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(a1 + 40);
    +[CPLErrors unknownError](CPLErrors, "unknownError");
    v3 = (CPLProxyResourceTransferTask *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_dispatchFailedInMemoryDownloadTaskForResource:withError:withCompletionHandler:", v6, v3, *(_QWORD *)(a1 + 56));
  }

  objc_msgSend(*(id *)(a1 + 40), "_invokeOutstandingInvocationsWithTaskIdentifier:", v7);
}

- (void)resolveLocalScopedIdentifiersForCloudScopedIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *queue;
  uint64_t v9;
  _QWORD *v10;
  NSObject *v11;
  id v12;
  id v13;
  dispatch_block_t v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD block[4];
  id v19;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __99__CPLProxyLibraryManager_resolveLocalScopedIdentifiersForCloudScopedIdentifiers_completionHandler___block_invoke;
  v15[3] = &unk_1E60D6898;
  v16 = v6;
  v17 = v7;
  v15[4] = self;
  v10 = v15;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60D71F8;
  v19 = v10;
  v11 = queue;
  v12 = v6;
  v13 = v7;
  v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v11, v14);

}

void __99__CPLProxyLibraryManager_resolveLocalScopedIdentifiersForCloudScopedIdentifiers_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __99__CPLProxyLibraryManager_resolveLocalScopedIdentifiersForCloudScopedIdentifiers_completionHandler___block_invoke_2;
  v3[3] = &unk_1E60D6898;
  v3[4] = v2;
  v5 = *(id *)(a1 + 48);
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "_dispatchBlockWhenOpen:", v3);

}

void __99__CPLProxyLibraryManager_resolveLocalScopedIdentifiersForCloudScopedIdentifiers_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v2 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __99__CPLProxyLibraryManager_resolveLocalScopedIdentifiersForCloudScopedIdentifiers_completionHandler___block_invoke_3;
  v7[3] = &unk_1E60D67A8;
  v8 = *(id *)(a1 + 48);
  objc_msgSend(v2, "proxyWithErrorHandler:", v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "resolveLocalScopedIdentifiersForCloudScopedIdentifiers:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    v5 = *(_QWORD *)(a1 + 48);
    if (v5)
    {
      +[CPLErrors unknownError](CPLErrors, "unknownError");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v5 + 16))(v5, 0, v6);

    }
  }

}

uint64_t __99__CPLProxyLibraryManager_resolveLocalScopedIdentifiersForCloudScopedIdentifiers_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (void)getMappedScopedIdentifiersForScopedIdentifiers:(id)a3 inAreLocalIdentifiers:(BOOL)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  OS_dispatch_queue *queue;
  uint64_t v11;
  _QWORD *v12;
  NSObject *v13;
  id v14;
  id v15;
  dispatch_block_t v16;
  _QWORD v17[5];
  id v18;
  id v19;
  BOOL v20;
  _QWORD block[4];
  id v22;

  v8 = a3;
  v9 = a5;
  queue = self->_queue;
  v11 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __113__CPLProxyLibraryManager_getMappedScopedIdentifiersForScopedIdentifiers_inAreLocalIdentifiers_completionHandler___block_invoke;
  v17[3] = &unk_1E60D6AA0;
  v18 = v8;
  v19 = v9;
  v17[4] = self;
  v20 = a4;
  v12 = v17;
  block[0] = v11;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60D71F8;
  v22 = v12;
  v13 = queue;
  v14 = v8;
  v15 = v9;
  v16 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v13, v16);

}

void __113__CPLProxyLibraryManager_getMappedScopedIdentifiersForScopedIdentifiers_inAreLocalIdentifiers_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;
  id v5;
  char v6;

  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __113__CPLProxyLibraryManager_getMappedScopedIdentifiersForScopedIdentifiers_inAreLocalIdentifiers_completionHandler___block_invoke_2;
  v3[3] = &unk_1E60D6AA0;
  v3[4] = v2;
  v5 = *(id *)(a1 + 48);
  v4 = *(id *)(a1 + 40);
  v6 = *(_BYTE *)(a1 + 56);
  objc_msgSend(v2, "_dispatchBlockWhenOpen:", v3);

}

void __113__CPLProxyLibraryManager_getMappedScopedIdentifiersForScopedIdentifiers_inAreLocalIdentifiers_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v2 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __113__CPLProxyLibraryManager_getMappedScopedIdentifiersForScopedIdentifiers_inAreLocalIdentifiers_completionHandler___block_invoke_3;
  v7[3] = &unk_1E60D67A8;
  v8 = *(id *)(a1 + 48);
  objc_msgSend(v2, "proxyWithErrorHandler:", v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "getMappedScopedIdentifiersForScopedIdentifiers:inAreLocalIdentifiers:completionHandler:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
  }
  else
  {
    v5 = *(_QWORD *)(a1 + 48);
    if (v5)
    {
      +[CPLErrors unknownError](CPLErrors, "unknownError");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v5 + 16))(v5, 0, v6);

    }
  }

}

uint64_t __113__CPLProxyLibraryManager_getMappedScopedIdentifiersForScopedIdentifiers_inAreLocalIdentifiers_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (void)createScope:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  OS_dispatch_queue *queue;
  _QWORD *v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  dispatch_block_t v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  uint64_t block;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  id v27;
  SEL v28;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  block = MEMORY[0x1E0C809B0];
  v24 = 3221225472;
  v25 = ___CPLProgressForAsyncCall_block_invoke;
  v26 = &__block_descriptor_48_e5_v8__0lu32l8;
  v27 = v9;
  v28 = a2;
  objc_msgSend(v10, "setCancellationHandler:", &block);
  queue = self->_queue;
  v19[0] = v11;
  v19[1] = 3221225472;
  v19[2] = __56__CPLProxyLibraryManager_createScope_completionHandler___block_invoke;
  v19[3] = &unk_1E60D6B18;
  v19[4] = self;
  v20 = v10;
  v21 = v7;
  v22 = v8;
  v13 = v19;
  block = v11;
  v24 = 3221225472;
  v25 = __cpl_dispatch_async_block_invoke;
  v26 = &unk_1E60D71F8;
  v27 = v13;
  v14 = queue;
  v15 = v7;
  v16 = v10;
  v17 = v8;
  v18 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
  dispatch_async(v14, v18);

}

void __56__CPLProxyLibraryManager_createScope_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;
  id v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __56__CPLProxyLibraryManager_createScope_completionHandler___block_invoke_2;
  v3[3] = &unk_1E60D6B18;
  v3[4] = v2;
  v6 = *(id *)(a1 + 56);
  v4 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "_dispatchBlockWhenOpen:", v3);

}

void __56__CPLProxyLibraryManager_createScope_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v2 = MEMORY[0x1E0C809B0];
  v3 = *(void **)(a1 + 32);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __56__CPLProxyLibraryManager_createScope_completionHandler___block_invoke_3;
  v14[3] = &unk_1E60D6938;
  v16 = *(id *)(a1 + 56);
  v15 = *(id *)(a1 + 40);
  objc_msgSend(v3, "proxyWithErrorHandler:", v14);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = *(void **)(a1 + 40);
    v9[0] = v2;
    v9[1] = 3221225472;
    v9[2] = __56__CPLProxyLibraryManager_createScope_completionHandler___block_invoke_4;
    v9[3] = &unk_1E60D6AF0;
    v10 = v4;
    v11 = *(id *)(a1 + 48);
    v13 = *(id *)(a1 + 56);
    v12 = *(id *)(a1 + 40);
    objc_msgSend(v6, "performAsCurrentWithPendingUnitCount:usingBlock:", 1, v9);

  }
  else
  {
    v7 = *(_QWORD *)(a1 + 56);
    if (v7)
    {
      +[CPLErrors unknownError](CPLErrors, "unknownError");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v8);

    }
    objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount"));
  }

}

uint64_t __56__CPLProxyLibraryManager_createScope_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, 0);
  return objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
}

void __56__CPLProxyLibraryManager_createScope_completionHandler___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__CPLProxyLibraryManager_createScope_completionHandler___block_invoke_5;
  v4[3] = &unk_1E60D6AC8;
  v6 = *(id *)(a1 + 56);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "createScope:completionHandler:", v3, v4);

}

uint64_t __56__CPLProxyLibraryManager_createScope_completionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
}

- (void)updateShareForScope:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  OS_dispatch_queue *queue;
  _QWORD *v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  dispatch_block_t v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  uint64_t block;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  id v27;
  SEL v28;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  block = MEMORY[0x1E0C809B0];
  v24 = 3221225472;
  v25 = ___CPLProgressForAsyncCall_block_invoke;
  v26 = &__block_descriptor_48_e5_v8__0lu32l8;
  v27 = v9;
  v28 = a2;
  objc_msgSend(v10, "setCancellationHandler:", &block);
  queue = self->_queue;
  v19[0] = v11;
  v19[1] = 3221225472;
  v19[2] = __64__CPLProxyLibraryManager_updateShareForScope_completionHandler___block_invoke;
  v19[3] = &unk_1E60D6B18;
  v19[4] = self;
  v20 = v10;
  v21 = v7;
  v22 = v8;
  v13 = v19;
  block = v11;
  v24 = 3221225472;
  v25 = __cpl_dispatch_async_block_invoke;
  v26 = &unk_1E60D71F8;
  v27 = v13;
  v14 = queue;
  v15 = v7;
  v16 = v10;
  v17 = v8;
  v18 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
  dispatch_async(v14, v18);

}

void __64__CPLProxyLibraryManager_updateShareForScope_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;
  id v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __64__CPLProxyLibraryManager_updateShareForScope_completionHandler___block_invoke_2;
  v3[3] = &unk_1E60D6B18;
  v3[4] = v2;
  v6 = *(id *)(a1 + 56);
  v4 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "_dispatchBlockWhenOpen:", v3);

}

void __64__CPLProxyLibraryManager_updateShareForScope_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v2 = MEMORY[0x1E0C809B0];
  v3 = *(void **)(a1 + 32);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __64__CPLProxyLibraryManager_updateShareForScope_completionHandler___block_invoke_3;
  v14[3] = &unk_1E60D6938;
  v16 = *(id *)(a1 + 56);
  v15 = *(id *)(a1 + 40);
  objc_msgSend(v3, "proxyWithErrorHandler:", v14);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = *(void **)(a1 + 40);
    v9[0] = v2;
    v9[1] = 3221225472;
    v9[2] = __64__CPLProxyLibraryManager_updateShareForScope_completionHandler___block_invoke_4;
    v9[3] = &unk_1E60D6AF0;
    v10 = v4;
    v11 = *(id *)(a1 + 48);
    v13 = *(id *)(a1 + 56);
    v12 = *(id *)(a1 + 40);
    objc_msgSend(v6, "performAsCurrentWithPendingUnitCount:usingBlock:", 1, v9);

  }
  else
  {
    v7 = *(_QWORD *)(a1 + 56);
    if (v7)
    {
      +[CPLErrors unknownError](CPLErrors, "unknownError");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v8);

    }
    objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount"));
  }

}

uint64_t __64__CPLProxyLibraryManager_updateShareForScope_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, 0);
  return objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
}

void __64__CPLProxyLibraryManager_updateShareForScope_completionHandler___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __64__CPLProxyLibraryManager_updateShareForScope_completionHandler___block_invoke_5;
  v4[3] = &unk_1E60D6AC8;
  v6 = *(id *)(a1 + 56);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "updateShareForScope:completionHandler:", v3, v4);

}

uint64_t __64__CPLProxyLibraryManager_updateShareForScope_completionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
}

- (void)deleteScopeWithIdentifier:(id)a3 forced:(BOOL)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  OS_dispatch_queue *queue;
  uint64_t v12;
  _QWORD *v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  dispatch_block_t v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  BOOL v23;
  _QWORD block[4];
  id v25;

  v8 = a3;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v12 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __77__CPLProxyLibraryManager_deleteScopeWithIdentifier_forced_completionHandler___block_invoke;
  v19[3] = &unk_1E60D6B68;
  v19[4] = self;
  v20 = v10;
  v21 = v8;
  v22 = v9;
  v23 = a4;
  v13 = v19;
  block[0] = v12;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60D71F8;
  v25 = v13;
  v14 = queue;
  v15 = v8;
  v16 = v10;
  v17 = v9;
  v18 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v14, v18);

}

void __77__CPLProxyLibraryManager_deleteScopeWithIdentifier_forced_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;
  id v5;
  id v6;
  char v7;

  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __77__CPLProxyLibraryManager_deleteScopeWithIdentifier_forced_completionHandler___block_invoke_2;
  v3[3] = &unk_1E60D6B68;
  v3[4] = v2;
  v6 = *(id *)(a1 + 56);
  v4 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  v7 = *(_BYTE *)(a1 + 64);
  objc_msgSend(v2, "_dispatchBlockWhenOpen:", v3);

}

void __77__CPLProxyLibraryManager_deleteScopeWithIdentifier_forced_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;
  char v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v2 = MEMORY[0x1E0C809B0];
  v3 = *(void **)(a1 + 32);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __77__CPLProxyLibraryManager_deleteScopeWithIdentifier_forced_completionHandler___block_invoke_3;
  v15[3] = &unk_1E60D6938;
  v17 = *(id *)(a1 + 56);
  v16 = *(id *)(a1 + 40);
  objc_msgSend(v3, "proxyWithErrorHandler:", v15);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = *(void **)(a1 + 40);
    v9[0] = v2;
    v9[1] = 3221225472;
    v9[2] = __77__CPLProxyLibraryManager_deleteScopeWithIdentifier_forced_completionHandler___block_invoke_4;
    v9[3] = &unk_1E60D6B40;
    v10 = v4;
    v11 = *(id *)(a1 + 48);
    v14 = *(_BYTE *)(a1 + 64);
    v13 = *(id *)(a1 + 56);
    v12 = *(id *)(a1 + 40);
    objc_msgSend(v6, "performAsCurrentWithPendingUnitCount:usingBlock:", 1, v9);

  }
  else
  {
    v7 = *(_QWORD *)(a1 + 56);
    if (v7)
    {
      +[CPLErrors unknownError](CPLErrors, "unknownError");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

    }
    objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount"));
  }

}

uint64_t __77__CPLProxyLibraryManager_deleteScopeWithIdentifier_forced_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, a3);
  return objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
}

void __77__CPLProxyLibraryManager_deleteScopeWithIdentifier_forced_completionHandler___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(unsigned __int8 *)(a1 + 64);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __77__CPLProxyLibraryManager_deleteScopeWithIdentifier_forced_completionHandler___block_invoke_5;
  v5[3] = &unk_1E60D64F0;
  v7 = *(id *)(a1 + 56);
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "deleteScopeWithIdentifier:forced:completionHandler:", v3, v4, v5);

}

uint64_t __77__CPLProxyLibraryManager_deleteScopeWithIdentifier_forced_completionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
}

- (void)refreshScopeWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  OS_dispatch_queue *queue;
  _QWORD *v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  dispatch_block_t v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  uint64_t block;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  id v27;
  SEL v28;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  block = MEMORY[0x1E0C809B0];
  v24 = 3221225472;
  v25 = ___CPLProgressForAsyncCall_block_invoke;
  v26 = &__block_descriptor_48_e5_v8__0lu32l8;
  v27 = v9;
  v28 = a2;
  objc_msgSend(v10, "setCancellationHandler:", &block);
  queue = self->_queue;
  v19[0] = v11;
  v19[1] = 3221225472;
  v19[2] = __71__CPLProxyLibraryManager_refreshScopeWithIdentifier_completionHandler___block_invoke;
  v19[3] = &unk_1E60D6B18;
  v19[4] = self;
  v20 = v10;
  v21 = v7;
  v22 = v8;
  v13 = v19;
  block = v11;
  v24 = 3221225472;
  v25 = __cpl_dispatch_async_block_invoke;
  v26 = &unk_1E60D71F8;
  v27 = v13;
  v14 = queue;
  v15 = v7;
  v16 = v10;
  v17 = v8;
  v18 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
  dispatch_async(v14, v18);

}

void __71__CPLProxyLibraryManager_refreshScopeWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;
  id v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __71__CPLProxyLibraryManager_refreshScopeWithIdentifier_completionHandler___block_invoke_2;
  v3[3] = &unk_1E60D6B18;
  v3[4] = v2;
  v6 = *(id *)(a1 + 56);
  v4 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "_dispatchBlockWhenOpen:", v3);

}

void __71__CPLProxyLibraryManager_refreshScopeWithIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v2 = MEMORY[0x1E0C809B0];
  v3 = *(void **)(a1 + 32);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __71__CPLProxyLibraryManager_refreshScopeWithIdentifier_completionHandler___block_invoke_3;
  v14[3] = &unk_1E60D6938;
  v16 = *(id *)(a1 + 56);
  v15 = *(id *)(a1 + 40);
  objc_msgSend(v3, "proxyWithErrorHandler:", v14);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = *(void **)(a1 + 40);
    v9[0] = v2;
    v9[1] = 3221225472;
    v9[2] = __71__CPLProxyLibraryManager_refreshScopeWithIdentifier_completionHandler___block_invoke_4;
    v9[3] = &unk_1E60D6AF0;
    v10 = v4;
    v11 = *(id *)(a1 + 48);
    v13 = *(id *)(a1 + 56);
    v12 = *(id *)(a1 + 40);
    objc_msgSend(v6, "performAsCurrentWithPendingUnitCount:usingBlock:", 1, v9);

  }
  else
  {
    v7 = *(_QWORD *)(a1 + 56);
    if (v7)
    {
      +[CPLErrors unknownError](CPLErrors, "unknownError");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v8);

    }
    objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount"));
  }

}

uint64_t __71__CPLProxyLibraryManager_refreshScopeWithIdentifier_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, 0);
  return objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
}

void __71__CPLProxyLibraryManager_refreshScopeWithIdentifier_completionHandler___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __71__CPLProxyLibraryManager_refreshScopeWithIdentifier_completionHandler___block_invoke_5;
  v4[3] = &unk_1E60D6AC8;
  v6 = *(id *)(a1 + 56);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "refreshScopeWithIdentifier:completionHandler:", v3, v4);

}

uint64_t __71__CPLProxyLibraryManager_refreshScopeWithIdentifier_completionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
}

- (void)fetchSharedScopeFromShareURL:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  OS_dispatch_queue *queue;
  _QWORD *v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  dispatch_block_t v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  uint64_t block;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  id v27;
  SEL v28;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  block = MEMORY[0x1E0C809B0];
  v24 = 3221225472;
  v25 = ___CPLProgressForAsyncCall_block_invoke;
  v26 = &__block_descriptor_48_e5_v8__0lu32l8;
  v27 = v9;
  v28 = a2;
  objc_msgSend(v10, "setCancellationHandler:", &block);
  queue = self->_queue;
  v19[0] = v11;
  v19[1] = 3221225472;
  v19[2] = __73__CPLProxyLibraryManager_fetchSharedScopeFromShareURL_completionHandler___block_invoke;
  v19[3] = &unk_1E60D6B18;
  v19[4] = self;
  v20 = v10;
  v21 = v7;
  v22 = v8;
  v13 = v19;
  block = v11;
  v24 = 3221225472;
  v25 = __cpl_dispatch_async_block_invoke;
  v26 = &unk_1E60D71F8;
  v27 = v13;
  v14 = queue;
  v15 = v7;
  v16 = v10;
  v17 = v8;
  v18 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
  dispatch_async(v14, v18);

}

void __73__CPLProxyLibraryManager_fetchSharedScopeFromShareURL_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;
  id v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __73__CPLProxyLibraryManager_fetchSharedScopeFromShareURL_completionHandler___block_invoke_2;
  v3[3] = &unk_1E60D6B18;
  v3[4] = v2;
  v6 = *(id *)(a1 + 56);
  v4 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "_dispatchBlockWhenOpen:", v3);

}

void __73__CPLProxyLibraryManager_fetchSharedScopeFromShareURL_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v2 = MEMORY[0x1E0C809B0];
  v3 = *(void **)(a1 + 32);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __73__CPLProxyLibraryManager_fetchSharedScopeFromShareURL_completionHandler___block_invoke_3;
  v14[3] = &unk_1E60D6938;
  v16 = *(id *)(a1 + 56);
  v15 = *(id *)(a1 + 40);
  objc_msgSend(v3, "proxyWithErrorHandler:", v14);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = *(void **)(a1 + 40);
    v9[0] = v2;
    v9[1] = 3221225472;
    v9[2] = __73__CPLProxyLibraryManager_fetchSharedScopeFromShareURL_completionHandler___block_invoke_4;
    v9[3] = &unk_1E60D6AF0;
    v10 = v4;
    v11 = *(id *)(a1 + 48);
    v13 = *(id *)(a1 + 56);
    v12 = *(id *)(a1 + 40);
    objc_msgSend(v6, "performAsCurrentWithPendingUnitCount:usingBlock:", 1, v9);

  }
  else
  {
    v7 = *(_QWORD *)(a1 + 56);
    if (v7)
    {
      +[CPLErrors unknownError](CPLErrors, "unknownError");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v8);

    }
    objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount"));
  }

}

uint64_t __73__CPLProxyLibraryManager_fetchSharedScopeFromShareURL_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, 0);
  return objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
}

void __73__CPLProxyLibraryManager_fetchSharedScopeFromShareURL_completionHandler___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __73__CPLProxyLibraryManager_fetchSharedScopeFromShareURL_completionHandler___block_invoke_5;
  v4[3] = &unk_1E60D6AC8;
  v6 = *(id *)(a1 + 56);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "fetchSharedScopeFromShareURL:completionHandler:", v3, v4);

}

uint64_t __73__CPLProxyLibraryManager_fetchSharedScopeFromShareURL_completionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
}

- (void)acceptSharedScope:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  OS_dispatch_queue *queue;
  _QWORD *v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  dispatch_block_t v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  uint64_t block;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  id v27;
  SEL v28;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  block = MEMORY[0x1E0C809B0];
  v24 = 3221225472;
  v25 = ___CPLProgressForAsyncCall_block_invoke;
  v26 = &__block_descriptor_48_e5_v8__0lu32l8;
  v27 = v9;
  v28 = a2;
  objc_msgSend(v10, "setCancellationHandler:", &block);
  queue = self->_queue;
  v19[0] = v11;
  v19[1] = 3221225472;
  v19[2] = __62__CPLProxyLibraryManager_acceptSharedScope_completionHandler___block_invoke;
  v19[3] = &unk_1E60D6B18;
  v19[4] = self;
  v20 = v10;
  v21 = v7;
  v22 = v8;
  v13 = v19;
  block = v11;
  v24 = 3221225472;
  v25 = __cpl_dispatch_async_block_invoke;
  v26 = &unk_1E60D71F8;
  v27 = v13;
  v14 = queue;
  v15 = v7;
  v16 = v10;
  v17 = v8;
  v18 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
  dispatch_async(v14, v18);

}

void __62__CPLProxyLibraryManager_acceptSharedScope_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;
  id v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __62__CPLProxyLibraryManager_acceptSharedScope_completionHandler___block_invoke_2;
  v3[3] = &unk_1E60D6B18;
  v3[4] = v2;
  v6 = *(id *)(a1 + 56);
  v4 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "_dispatchBlockWhenOpen:", v3);

}

void __62__CPLProxyLibraryManager_acceptSharedScope_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v2 = MEMORY[0x1E0C809B0];
  v3 = *(void **)(a1 + 32);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __62__CPLProxyLibraryManager_acceptSharedScope_completionHandler___block_invoke_3;
  v14[3] = &unk_1E60D6938;
  v16 = *(id *)(a1 + 56);
  v15 = *(id *)(a1 + 40);
  objc_msgSend(v3, "proxyWithErrorHandler:", v14);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = *(void **)(a1 + 40);
    v9[0] = v2;
    v9[1] = 3221225472;
    v9[2] = __62__CPLProxyLibraryManager_acceptSharedScope_completionHandler___block_invoke_4;
    v9[3] = &unk_1E60D6AF0;
    v10 = v4;
    v11 = *(id *)(a1 + 48);
    v13 = *(id *)(a1 + 56);
    v12 = *(id *)(a1 + 40);
    objc_msgSend(v6, "performAsCurrentWithPendingUnitCount:usingBlock:", 1, v9);

  }
  else
  {
    v7 = *(_QWORD *)(a1 + 56);
    if (v7)
    {
      +[CPLErrors unknownError](CPLErrors, "unknownError");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

    }
    objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount"));
  }

}

uint64_t __62__CPLProxyLibraryManager_acceptSharedScope_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, a3);
  return objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
}

void __62__CPLProxyLibraryManager_acceptSharedScope_completionHandler___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __62__CPLProxyLibraryManager_acceptSharedScope_completionHandler___block_invoke_5;
  v4[3] = &unk_1E60D64F0;
  v6 = *(id *)(a1 + 56);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "acceptSharedScope:completionHandler:", v3, v4);

}

uint64_t __62__CPLProxyLibraryManager_acceptSharedScope_completionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
}

- (void)fetchExistingSharedLibraryScopeWithCompletionHandler:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  OS_dispatch_queue *queue;
  _QWORD *v10;
  NSObject *v11;
  id v12;
  id v13;
  dispatch_block_t v14;
  _QWORD v15[5];
  id v16;
  id v17;
  uint64_t block;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  SEL v23;

  v5 = a3;
  v6 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  block = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = ___CPLProgressForAsyncCall_block_invoke;
  v21 = &__block_descriptor_48_e5_v8__0lu32l8;
  v22 = v6;
  v23 = a2;
  objc_msgSend(v7, "setCancellationHandler:", &block);
  queue = self->_queue;
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __79__CPLProxyLibraryManager_fetchExistingSharedLibraryScopeWithCompletionHandler___block_invoke;
  v15[3] = &unk_1E60D6898;
  v16 = v7;
  v17 = v5;
  v15[4] = self;
  v10 = v15;
  block = v8;
  v19 = 3221225472;
  v20 = __cpl_dispatch_async_block_invoke;
  v21 = &unk_1E60D71F8;
  v22 = v10;
  v11 = queue;
  v12 = v7;
  v13 = v5;
  v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
  dispatch_async(v11, v14);

}

void __79__CPLProxyLibraryManager_fetchExistingSharedLibraryScopeWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __79__CPLProxyLibraryManager_fetchExistingSharedLibraryScopeWithCompletionHandler___block_invoke_2;
  v3[3] = &unk_1E60D6898;
  v3[4] = v2;
  v5 = *(id *)(a1 + 48);
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "_dispatchBlockWhenOpen:", v3);

}

void __79__CPLProxyLibraryManager_fetchExistingSharedLibraryScopeWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v2 = MEMORY[0x1E0C809B0];
  v3 = *(void **)(a1 + 32);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __79__CPLProxyLibraryManager_fetchExistingSharedLibraryScopeWithCompletionHandler___block_invoke_3;
  v13[3] = &unk_1E60D6938;
  v15 = *(id *)(a1 + 48);
  v14 = *(id *)(a1 + 40);
  objc_msgSend(v3, "proxyWithErrorHandler:", v13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = *(void **)(a1 + 40);
    v9[0] = v2;
    v9[1] = 3221225472;
    v9[2] = __79__CPLProxyLibraryManager_fetchExistingSharedLibraryScopeWithCompletionHandler___block_invoke_4;
    v9[3] = &unk_1E60D6898;
    v10 = v4;
    v12 = *(id *)(a1 + 48);
    v11 = *(id *)(a1 + 40);
    objc_msgSend(v6, "performAsCurrentWithPendingUnitCount:usingBlock:", 1, v9);

  }
  else
  {
    v7 = *(_QWORD *)(a1 + 48);
    if (v7)
    {
      +[CPLErrors unknownError](CPLErrors, "unknownError");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v8);

    }
    objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount"));
  }

}

uint64_t __79__CPLProxyLibraryManager_fetchExistingSharedLibraryScopeWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, 0);
  return objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
}

void __79__CPLProxyLibraryManager_fetchExistingSharedLibraryScopeWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __79__CPLProxyLibraryManager_fetchExistingSharedLibraryScopeWithCompletionHandler___block_invoke_5;
  v3[3] = &unk_1E60D6AC8;
  v5 = *(id *)(a1 + 48);
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "fetchExistingSharedLibraryScopeWithCompletionHandler:", v3);

}

uint64_t __79__CPLProxyLibraryManager_fetchExistingSharedLibraryScopeWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
}

- (void)startExitFromSharedScopeWithIdentifier:(id)a3 retentionPolicy:(int64_t)a4 exitSource:(int64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  void *v12;
  OS_dispatch_queue *queue;
  uint64_t v14;
  _QWORD *v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  dispatch_block_t v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  int64_t v25;
  int64_t v26;
  _QWORD block[4];
  id v28;

  v10 = a3;
  v11 = a6;
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v14 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __110__CPLProxyLibraryManager_startExitFromSharedScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke;
  v21[3] = &unk_1E60D6BB8;
  v21[4] = self;
  v22 = v12;
  v23 = v10;
  v24 = v11;
  v25 = a4;
  v26 = a5;
  v15 = v21;
  block[0] = v14;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60D71F8;
  v28 = v15;
  v16 = queue;
  v17 = v10;
  v18 = v12;
  v19 = v11;
  v20 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v16, v20);

}

void __110__CPLProxyLibraryManager_startExitFromSharedScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;
  id v5;
  id v6;
  __int128 v7;

  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __110__CPLProxyLibraryManager_startExitFromSharedScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke_2;
  v3[3] = &unk_1E60D6BB8;
  v3[4] = v2;
  v6 = *(id *)(a1 + 56);
  v4 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  v7 = *(_OWORD *)(a1 + 64);
  objc_msgSend(v2, "_dispatchBlockWhenOpen:", v3);

}

void __110__CPLProxyLibraryManager_startExitFromSharedScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  __int128 v13;
  _QWORD v14[4];
  id v15;

  v2 = MEMORY[0x1E0C809B0];
  v3 = *(void **)(a1 + 32);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __110__CPLProxyLibraryManager_startExitFromSharedScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke_3;
  v14[3] = &unk_1E60D67A8;
  v15 = *(id *)(a1 + 56);
  objc_msgSend(v3, "proxyWithErrorHandler:", v14);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = *(void **)(a1 + 40);
    v9[0] = v2;
    v9[1] = 3221225472;
    v9[2] = __110__CPLProxyLibraryManager_startExitFromSharedScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke_4;
    v9[3] = &unk_1E60D6B90;
    v10 = v4;
    v11 = *(id *)(a1 + 48);
    v13 = *(_OWORD *)(a1 + 64);
    v12 = *(id *)(a1 + 56);
    objc_msgSend(v6, "performAsCurrentWithPendingUnitCount:usingBlock:", 1, v9);

    v7 = v10;
LABEL_5:

    goto LABEL_6;
  }
  v8 = *(_QWORD *)(a1 + 56);
  if (v8)
  {
    +[CPLErrors unknownError](CPLErrors, "unknownError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v7);
    goto LABEL_5;
  }
LABEL_6:

}

uint64_t __110__CPLProxyLibraryManager_startExitFromSharedScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __110__CPLProxyLibraryManager_startExitFromSharedScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startExitFromSharedScopeWithIdentifier:retentionPolicy:exitSource:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48));
}

- (void)removeParticipants:(id)a3 fromSharedScopeWithIdentifier:(id)a4 retentionPolicy:(int64_t)a5 exitSource:(int64_t)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  OS_dispatch_queue *queue;
  uint64_t v17;
  _QWORD *v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  dispatch_block_t v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  id v29;
  int64_t v30;
  int64_t v31;
  _QWORD block[4];
  id v33;

  v12 = a3;
  v13 = a4;
  v14 = a7;
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v17 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __120__CPLProxyLibraryManager_removeParticipants_fromSharedScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke;
  v25[3] = &unk_1E60D6C08;
  v25[4] = self;
  v26 = v15;
  v27 = v12;
  v28 = v13;
  v29 = v14;
  v30 = a5;
  v31 = a6;
  v18 = v25;
  block[0] = v17;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60D71F8;
  v33 = v18;
  v19 = queue;
  v20 = v13;
  v21 = v12;
  v22 = v15;
  v23 = v14;
  v24 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v19, v24);

}

void __120__CPLProxyLibraryManager_removeParticipants_fromSharedScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;
  id v5;
  id v6;
  id v7;
  __int128 v8;

  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __120__CPLProxyLibraryManager_removeParticipants_fromSharedScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke_2;
  v3[3] = &unk_1E60D6C08;
  v3[4] = v2;
  v7 = *(id *)(a1 + 64);
  v4 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  v8 = *(_OWORD *)(a1 + 72);
  objc_msgSend(v2, "_dispatchBlockWhenOpen:", v3);

}

void __120__CPLProxyLibraryManager_removeParticipants_fromSharedScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;
  __int128 v14;
  _QWORD v15[4];
  id v16;

  v2 = MEMORY[0x1E0C809B0];
  v3 = *(void **)(a1 + 32);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __120__CPLProxyLibraryManager_removeParticipants_fromSharedScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke_3;
  v15[3] = &unk_1E60D67A8;
  v16 = *(id *)(a1 + 64);
  objc_msgSend(v3, "proxyWithErrorHandler:", v15);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = *(void **)(a1 + 40);
    v9[0] = v2;
    v9[1] = 3221225472;
    v9[2] = __120__CPLProxyLibraryManager_removeParticipants_fromSharedScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke_4;
    v9[3] = &unk_1E60D6BE0;
    v10 = v4;
    v11 = *(id *)(a1 + 48);
    v12 = *(id *)(a1 + 56);
    v14 = *(_OWORD *)(a1 + 72);
    v13 = *(id *)(a1 + 64);
    objc_msgSend(v6, "performAsCurrentWithPendingUnitCount:usingBlock:", 1, v9);

    v7 = v10;
LABEL_5:

    goto LABEL_6;
  }
  v8 = *(_QWORD *)(a1 + 64);
  if (v8)
  {
    +[CPLErrors unknownError](CPLErrors, "unknownError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v7);
    goto LABEL_5;
  }
LABEL_6:

}

uint64_t __120__CPLProxyLibraryManager_removeParticipants_fromSharedScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __120__CPLProxyLibraryManager_removeParticipants_fromSharedScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeParticipants:fromSharedScopeWithIdentifier:retentionPolicy:exitSource:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 56));
}

- (void)sharedLibraryRampCheckWithCompletionHandler:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  OS_dispatch_queue *queue;
  _QWORD *v10;
  NSObject *v11;
  id v12;
  id v13;
  dispatch_block_t v14;
  _QWORD v15[5];
  id v16;
  id v17;
  uint64_t block;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  SEL v23;

  v5 = a3;
  v6 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  block = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = ___CPLProgressForAsyncCall_block_invoke;
  v21 = &__block_descriptor_48_e5_v8__0lu32l8;
  v22 = v6;
  v23 = a2;
  objc_msgSend(v7, "setCancellationHandler:", &block);
  queue = self->_queue;
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __70__CPLProxyLibraryManager_sharedLibraryRampCheckWithCompletionHandler___block_invoke;
  v15[3] = &unk_1E60D6898;
  v16 = v7;
  v17 = v5;
  v15[4] = self;
  v10 = v15;
  block = v8;
  v19 = 3221225472;
  v20 = __cpl_dispatch_async_block_invoke;
  v21 = &unk_1E60D71F8;
  v22 = v10;
  v11 = queue;
  v12 = v7;
  v13 = v5;
  v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
  dispatch_async(v11, v14);

}

void __70__CPLProxyLibraryManager_sharedLibraryRampCheckWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __70__CPLProxyLibraryManager_sharedLibraryRampCheckWithCompletionHandler___block_invoke_2;
  v3[3] = &unk_1E60D6898;
  v3[4] = v2;
  v5 = *(id *)(a1 + 48);
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "_dispatchBlockWhenOpen:", v3);

}

void __70__CPLProxyLibraryManager_sharedLibraryRampCheckWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v2 = MEMORY[0x1E0C809B0];
  v3 = *(void **)(a1 + 32);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __70__CPLProxyLibraryManager_sharedLibraryRampCheckWithCompletionHandler___block_invoke_3;
  v13[3] = &unk_1E60D6938;
  v15 = *(id *)(a1 + 48);
  v14 = *(id *)(a1 + 40);
  objc_msgSend(v3, "proxyWithErrorHandler:", v13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = *(void **)(a1 + 40);
    v9[0] = v2;
    v9[1] = 3221225472;
    v9[2] = __70__CPLProxyLibraryManager_sharedLibraryRampCheckWithCompletionHandler___block_invoke_4;
    v9[3] = &unk_1E60D6898;
    v10 = v4;
    v12 = *(id *)(a1 + 48);
    v11 = *(id *)(a1 + 40);
    objc_msgSend(v6, "performAsCurrentWithPendingUnitCount:usingBlock:", 1, v9);

  }
  else
  {
    v7 = *(_QWORD *)(a1 + 48);
    if (v7)
    {
      +[CPLErrors unknownError](CPLErrors, "unknownError");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v8);

    }
    objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount"));
  }

}

uint64_t __70__CPLProxyLibraryManager_sharedLibraryRampCheckWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, 0);
  return objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
}

void __70__CPLProxyLibraryManager_sharedLibraryRampCheckWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __70__CPLProxyLibraryManager_sharedLibraryRampCheckWithCompletionHandler___block_invoke_5;
  v3[3] = &unk_1E60D6C30;
  v5 = *(id *)(a1 + 48);
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "sharedLibraryRampCheckWithCompletionHandler:", v3);

}

uint64_t __70__CPLProxyLibraryManager_sharedLibraryRampCheckWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
}

- (void)getStatusForPendingRecordsSharedToScopeWithIdentifier:(id)a3 maximumCount:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  OS_dispatch_queue *queue;
  uint64_t v11;
  _QWORD *v12;
  NSObject *v13;
  id v14;
  id v15;
  dispatch_block_t v16;
  _QWORD v17[5];
  id v18;
  id v19;
  unint64_t v20;
  _QWORD block[4];
  id v22;

  v8 = a3;
  v9 = a5;
  queue = self->_queue;
  v11 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __111__CPLProxyLibraryManager_getStatusForPendingRecordsSharedToScopeWithIdentifier_maximumCount_completionHandler___block_invoke;
  v17[3] = &unk_1E60D6C58;
  v17[4] = self;
  v18 = v8;
  v19 = v9;
  v20 = a4;
  v12 = v17;
  block[0] = v11;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60D71F8;
  v22 = v12;
  v13 = queue;
  v14 = v8;
  v15 = v9;
  v16 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v13, v16);

}

void __111__CPLProxyLibraryManager_getStatusForPendingRecordsSharedToScopeWithIdentifier_maximumCount_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;
  id v7;
  uint64_t v8;

  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __111__CPLProxyLibraryManager_getStatusForPendingRecordsSharedToScopeWithIdentifier_maximumCount_completionHandler___block_invoke_2;
  v5[3] = &unk_1E60D6C58;
  v5[4] = v2;
  v7 = *(id *)(a1 + 48);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 56);
  v6 = v3;
  v8 = v4;
  objc_msgSend(v2, "_dispatchBlockWhenOpen:", v5);

}

void __111__CPLProxyLibraryManager_getStatusForPendingRecordsSharedToScopeWithIdentifier_maximumCount_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v2 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __111__CPLProxyLibraryManager_getStatusForPendingRecordsSharedToScopeWithIdentifier_maximumCount_completionHandler___block_invoke_3;
  v7[3] = &unk_1E60D67A8;
  v8 = *(id *)(a1 + 48);
  objc_msgSend(v2, "proxyWithErrorHandler:", v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "getStatusForPendingRecordsSharedToScopeWithIdentifier:maximumCount:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
  }
  else
  {
    v5 = *(_QWORD *)(a1 + 48);
    if (v5)
    {
      +[CPLErrors unknownError](CPLErrors, "unknownError");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v5 + 16))(v5, 0, v6);

    }
  }

}

uint64_t __111__CPLProxyLibraryManager_getStatusForPendingRecordsSharedToScopeWithIdentifier_maximumCount_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (void)queryUserDetailsForShareParticipants:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  OS_dispatch_queue *queue;
  _QWORD *v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  dispatch_block_t v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  uint64_t block;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  id v27;
  SEL v28;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  block = MEMORY[0x1E0C809B0];
  v24 = 3221225472;
  v25 = ___CPLProgressForAsyncCall_block_invoke;
  v26 = &__block_descriptor_48_e5_v8__0lu32l8;
  v27 = v9;
  v28 = a2;
  objc_msgSend(v10, "setCancellationHandler:", &block);
  queue = self->_queue;
  v19[0] = v11;
  v19[1] = 3221225472;
  v19[2] = __81__CPLProxyLibraryManager_queryUserDetailsForShareParticipants_completionHandler___block_invoke;
  v19[3] = &unk_1E60D6B18;
  v19[4] = self;
  v20 = v10;
  v21 = v7;
  v22 = v8;
  v13 = v19;
  block = v11;
  v24 = 3221225472;
  v25 = __cpl_dispatch_async_block_invoke;
  v26 = &unk_1E60D71F8;
  v27 = v13;
  v14 = queue;
  v15 = v7;
  v16 = v10;
  v17 = v8;
  v18 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
  dispatch_async(v14, v18);

}

void __81__CPLProxyLibraryManager_queryUserDetailsForShareParticipants_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;
  id v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __81__CPLProxyLibraryManager_queryUserDetailsForShareParticipants_completionHandler___block_invoke_2;
  v3[3] = &unk_1E60D6B18;
  v3[4] = v2;
  v6 = *(id *)(a1 + 56);
  v4 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "_dispatchBlockWhenOpen:", v3);

}

void __81__CPLProxyLibraryManager_queryUserDetailsForShareParticipants_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v2 = MEMORY[0x1E0C809B0];
  v3 = *(void **)(a1 + 32);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __81__CPLProxyLibraryManager_queryUserDetailsForShareParticipants_completionHandler___block_invoke_3;
  v14[3] = &unk_1E60D6938;
  v16 = *(id *)(a1 + 56);
  v15 = *(id *)(a1 + 40);
  objc_msgSend(v3, "proxyWithErrorHandler:", v14);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = *(void **)(a1 + 40);
    v9[0] = v2;
    v9[1] = 3221225472;
    v9[2] = __81__CPLProxyLibraryManager_queryUserDetailsForShareParticipants_completionHandler___block_invoke_4;
    v9[3] = &unk_1E60D6AF0;
    v10 = v4;
    v11 = *(id *)(a1 + 48);
    v13 = *(id *)(a1 + 56);
    v12 = *(id *)(a1 + 40);
    objc_msgSend(v6, "performAsCurrentWithPendingUnitCount:usingBlock:", 1, v9);

  }
  else
  {
    v7 = *(_QWORD *)(a1 + 56);
    if (v7)
    {
      +[CPLErrors unknownError](CPLErrors, "unknownError");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v8);

    }
    objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount"));
  }

}

uint64_t __81__CPLProxyLibraryManager_queryUserDetailsForShareParticipants_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, 0);
  return objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
}

void __81__CPLProxyLibraryManager_queryUserDetailsForShareParticipants_completionHandler___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __81__CPLProxyLibraryManager_queryUserDetailsForShareParticipants_completionHandler___block_invoke_5;
  v4[3] = &unk_1E60D6C80;
  v6 = *(id *)(a1 + 56);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "queryUserDetailsForShareParticipants:completionHandler:", v3, v4);

}

uint64_t __81__CPLProxyLibraryManager_queryUserDetailsForShareParticipants_completionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
}

- (void)testKey:(id)a3 value:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  OS_dispatch_queue *queue;
  uint64_t v12;
  _QWORD *v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  dispatch_block_t v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  _QWORD block[4];
  id v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v12 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __58__CPLProxyLibraryManager_testKey_value_completionHandler___block_invoke;
  v19[3] = &unk_1E60D6CD0;
  v19[4] = self;
  v20 = v8;
  v21 = v9;
  v22 = v10;
  v13 = v19;
  block[0] = v12;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60D71F8;
  v24 = v13;
  v14 = queue;
  v15 = v10;
  v16 = v9;
  v17 = v8;
  v18 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v14, v18);

}

void __58__CPLProxyLibraryManager_testKey_value_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  id v7;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __58__CPLProxyLibraryManager_testKey_value_completionHandler___block_invoke_2;
  v3[3] = &unk_1E60D6CD0;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v4, "_dispatchBlockWhenOpen:", v3);

}

void __58__CPLProxyLibraryManager_testKey_value_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, void *, void *);
  void *v7;
  id v8;
  id v9;

  v4 = MEMORY[0x1E0C809B0];
  v5 = 3221225472;
  v6 = __58__CPLProxyLibraryManager_testKey_value_completionHandler___block_invoke_3;
  v7 = &unk_1E60D6CA8;
  v2 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v2, "proxyWithErrorHandler:", &v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "testKey:value:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v4, v5, v6, v7);

}

void __58__CPLProxyLibraryManager_testKey_value_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  id v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(_QWORD *)(a1 + 40);
      v10 = 138413058;
      v11 = v5;
      v12 = 2112;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_ERROR, "%@ failed to execute test function %@(%@): %@", (uint8_t *)&v10, 0x2Au);
    }

  }
}

- (void)getTargetsForRecordsWithScopedIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  OS_dispatch_queue *queue;
  uint64_t v10;
  _QWORD *v11;
  NSObject *v12;
  id v13;
  id v14;
  dispatch_block_t v15;
  _QWORD v16[5];
  id v17;
  id v18;
  SEL v19;
  _QWORD block[4];
  id v21;

  v7 = a3;
  v8 = a4;
  queue = self->_queue;
  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __86__CPLProxyLibraryManager_getTargetsForRecordsWithScopedIdentifiers_completionHandler___block_invoke;
  v16[3] = &unk_1E60D6C58;
  v18 = v8;
  v19 = a2;
  v16[4] = self;
  v17 = v7;
  v11 = v16;
  block[0] = v10;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60D71F8;
  v21 = v11;
  v12 = queue;
  v13 = v7;
  v14 = v8;
  v15 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v12, v15);

}

void __86__CPLProxyLibraryManager_getTargetsForRecordsWithScopedIdentifiers_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  __int128 v4;
  _QWORD v5[5];
  id v6;
  __int128 v7;

  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __86__CPLProxyLibraryManager_getTargetsForRecordsWithScopedIdentifiers_completionHandler___block_invoke_2;
  v5[3] = &unk_1E60D6C58;
  v5[4] = v2;
  v4 = *(_OWORD *)(a1 + 48);
  v3 = (id)v4;
  v7 = v4;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v2, "_dispatchBlockWhenOpen:", v5);

}

void __86__CPLProxyLibraryManager_getTargetsForRecordsWithScopedIdentifiers_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  __int128 v5;
  _QWORD v6[4];
  __int128 v7;

  v2 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __86__CPLProxyLibraryManager_getTargetsForRecordsWithScopedIdentifiers_completionHandler___block_invoke_3;
  v6[3] = &unk_1E60D6CF8;
  v5 = *(_OWORD *)(a1 + 48);
  v3 = (id)v5;
  v7 = v5;
  objc_msgSend(v2, "proxyWithErrorHandler:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getTargetsForRecordsWithScopedIdentifiers:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __86__CPLProxyLibraryManager_getTargetsForRecordsWithScopedIdentifiers_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412802;
      v10 = v5;
      v11 = 2112;
      v12 = v8;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_ERROR, "%@ failed to execute %@: %@", (uint8_t *)&v9, 0x20u);

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)deleteResources:(id)a3 checkServerIfNecessary:(BOOL)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  OS_dispatch_queue *queue;
  uint64_t v11;
  _QWORD *v12;
  NSObject *v13;
  id v14;
  id v15;
  dispatch_block_t v16;
  _QWORD v17[5];
  id v18;
  id v19;
  BOOL v20;
  _QWORD block[4];
  id v22;

  v8 = a3;
  v9 = a5;
  queue = self->_queue;
  v11 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __83__CPLProxyLibraryManager_deleteResources_checkServerIfNecessary_completionHandler___block_invoke;
  v17[3] = &unk_1E60D6D48;
  v17[4] = self;
  v18 = v8;
  v19 = v9;
  v20 = a4;
  v12 = v17;
  block[0] = v11;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60D71F8;
  v22 = v12;
  v13 = queue;
  v14 = v9;
  v15 = v8;
  v16 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v13, v16);

}

void __83__CPLProxyLibraryManager_deleteResources_checkServerIfNecessary_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  char v7;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __83__CPLProxyLibraryManager_deleteResources_checkServerIfNecessary_completionHandler___block_invoke_2;
  v3[3] = &unk_1E60D6D48;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  v7 = *(_BYTE *)(a1 + 56);
  objc_msgSend(v4, "_dispatchBlockWhenOpen:", v3);

}

void __83__CPLProxyLibraryManager_deleteResources_checkServerIfNecessary_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[8];
  _QWORD v18[4];
  id v19;
  id v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __83__CPLProxyLibraryManager_deleteResources_checkServerIfNecessary_completionHandler___block_invoke_3;
  v18[3] = &unk_1E60D6D20;
  v2 = *(void **)(a1 + 32);
  v19 = *(id *)(a1 + 40);
  v20 = *(id *)(a1 + 48);
  objc_msgSend(v2, "proxyWithErrorHandler:", v18);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "deleteResources:checkServerIfNecessary:completionHandler:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_ERROR, "Proxy has disappeared", buf, 2u);
      }

    }
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    +[CPLErrors unknownError](CPLErrors, "unknownError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v8 = *(id *)(a1 + 40);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
      }
      while (v10);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __83__CPLProxyLibraryManager_deleteResources_checkServerIfNecessary_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  id v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = objc_msgSend(*(id *)(a1 + 32), "count");
      *(_DWORD *)buf = 138412802;
      v21 = v5;
      v22 = 2048;
      v23 = v8;
      v24 = 2112;
      v25 = v6;
      _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_ERROR, "%@ failed to delete %lu resources: %@", buf, 0x20u);
    }

  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = *(id *)(a1 + 32);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v14++), (_QWORD)v15);
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)checkResourcesAreSafeToPrune:(id)a3 checkServerIfNecessary:(BOOL)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  OS_dispatch_queue *queue;
  uint64_t v11;
  _QWORD *v12;
  NSObject *v13;
  id v14;
  id v15;
  dispatch_block_t v16;
  _QWORD v17[5];
  id v18;
  id v19;
  BOOL v20;
  _QWORD block[4];
  id v22;

  v8 = a3;
  v9 = a5;
  queue = self->_queue;
  v11 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __96__CPLProxyLibraryManager_checkResourcesAreSafeToPrune_checkServerIfNecessary_completionHandler___block_invoke;
  v17[3] = &unk_1E60D6D48;
  v17[4] = self;
  v18 = v8;
  v19 = v9;
  v20 = a4;
  v12 = v17;
  block[0] = v11;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60D71F8;
  v22 = v12;
  v13 = queue;
  v14 = v9;
  v15 = v8;
  v16 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v13, v16);

}

void __96__CPLProxyLibraryManager_checkResourcesAreSafeToPrune_checkServerIfNecessary_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  char v7;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __96__CPLProxyLibraryManager_checkResourcesAreSafeToPrune_checkServerIfNecessary_completionHandler___block_invoke_2;
  v3[3] = &unk_1E60D6D48;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  v7 = *(_BYTE *)(a1 + 56);
  objc_msgSend(v4, "_dispatchBlockWhenOpen:", v3);

}

void __96__CPLProxyLibraryManager_checkResourcesAreSafeToPrune_checkServerIfNecessary_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[8];
  _QWORD v18[4];
  id v19;
  id v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __96__CPLProxyLibraryManager_checkResourcesAreSafeToPrune_checkServerIfNecessary_completionHandler___block_invoke_3;
  v18[3] = &unk_1E60D6D20;
  v2 = *(void **)(a1 + 32);
  v19 = *(id *)(a1 + 40);
  v20 = *(id *)(a1 + 48);
  objc_msgSend(v2, "proxyWithErrorHandler:", v18);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "checkResourcesAreSafeToPrune:checkServerIfNecessary:completionHandler:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_ERROR, "Proxy has disappeared", buf, 2u);
      }

    }
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    +[CPLErrors unknownError](CPLErrors, "unknownError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v8 = *(id *)(a1 + 40);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
      }
      while (v10);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __96__CPLProxyLibraryManager_checkResourcesAreSafeToPrune_checkServerIfNecessary_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  id v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = objc_msgSend(*(id *)(a1 + 32), "count");
      *(_DWORD *)buf = 138412802;
      v21 = v5;
      v22 = 2048;
      v23 = v8;
      v24 = 2112;
      v25 = v6;
      _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_ERROR, "%@ failed to check purgeable %lu resources: %@", buf, 0x20u);
    }

  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = *(id *)(a1 + 32);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v14++), (_QWORD)v15);
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)resetStatus
{
  OS_dispatch_queue *queue;
  uint64_t v3;
  _QWORD *v4;
  NSObject *v5;
  dispatch_block_t v6;
  _QWORD v7[5];
  _QWORD block[4];
  id v9;

  queue = self->_queue;
  v3 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__CPLProxyLibraryManager_resetStatus__block_invoke;
  v7[3] = &unk_1E60D65B8;
  v7[4] = self;
  v4 = v7;
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60D71F8;
  v9 = v4;
  v5 = queue;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);

}

uint64_t __37__CPLProxyLibraryManager_resetStatus__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __37__CPLProxyLibraryManager_resetStatus__block_invoke_2;
  v3[3] = &unk_1E60D65B8;
  v3[4] = v1;
  return objc_msgSend(v1, "_dispatchBlockWhenOpen:", v3);
}

void __37__CPLProxyLibraryManager_resetStatus__block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  NSObject *v3;
  uint8_t v4[16];

  objc_msgSend(*(id *)(a1 + 32), "proxyWithErrorHandler:", &__block_literal_global_326);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "resetStatus");
  }
  else if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1B03C2000, v3, OS_LOG_TYPE_ERROR, "Proxy has disappeared", v4, 2u);
    }

  }
}

void __37__CPLProxyLibraryManager_resetStatus__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412546;
      v8 = v4;
      v9 = 2112;
      v10 = v5;
      _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_ERROR, "%@ failed to reset status: %@", (uint8_t *)&v7, 0x16u);
    }

  }
}

- (void)startSyncSession
{
  OS_dispatch_queue *queue;
  uint64_t v3;
  _QWORD *v4;
  NSObject *v5;
  dispatch_block_t v6;
  _QWORD v7[5];
  _QWORD block[4];
  id v9;

  queue = self->_queue;
  v3 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__CPLProxyLibraryManager_startSyncSession__block_invoke;
  v7[3] = &unk_1E60D65B8;
  v7[4] = self;
  v4 = v7;
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60D71F8;
  v9 = v4;
  v5 = queue;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);

}

uint64_t __42__CPLProxyLibraryManager_startSyncSession__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __42__CPLProxyLibraryManager_startSyncSession__block_invoke_2;
  v3[3] = &unk_1E60D65B8;
  v3[4] = v1;
  return objc_msgSend(v1, "_dispatchBlockWhenOpen:", v3);
}

void __42__CPLProxyLibraryManager_startSyncSession__block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  NSObject *v3;
  uint8_t v4[16];

  objc_msgSend(*(id *)(a1 + 32), "proxyWithErrorHandler:", &__block_literal_global_327);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "startSyncSession");
  }
  else if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1B03C2000, v3, OS_LOG_TYPE_ERROR, "Proxy has disappeared", v4, 2u);
    }

  }
}

void __42__CPLProxyLibraryManager_startSyncSession__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412546;
      v8 = v4;
      v9 = 2112;
      v10 = v5;
      _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_ERROR, "%@ failed to start a sync session: %@", (uint8_t *)&v7, 0x16u);
    }

  }
}

- (void)noteClientReceivedNotificationOfServerChanges
{
  NSObject *v2;
  uint8_t v3[16];

  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_ERROR, "-[CPLLibraryManager noteClientReceivedNotificationOfServerChanges] should not be called in this configuration", v3, 2u);
    }

  }
}

- (void)noteClientIsInForegroundQuietly:(BOOL)a3
{
  OS_dispatch_queue *queue;
  uint64_t v4;
  _QWORD *v5;
  NSObject *v6;
  dispatch_block_t v7;
  _QWORD v8[6];
  BOOL v9;
  _QWORD block[4];
  id v11;

  queue = self->_queue;
  v4 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__CPLProxyLibraryManager_noteClientIsInForegroundQuietly___block_invoke;
  v8[3] = &unk_1E60D6DD0;
  v8[4] = self;
  v8[5] = a2;
  v9 = a3;
  v5 = v8;
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60D71F8;
  v11 = v5;
  v6 = queue;
  v7 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v6, v7);

}

uint64_t __58__CPLProxyLibraryManager_noteClientIsInForegroundQuietly___block_invoke(uint64_t a1)
{
  _QWORD v2[4];
  __int128 v3;
  char v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __58__CPLProxyLibraryManager_noteClientIsInForegroundQuietly___block_invoke_2;
  v2[3] = &unk_1E60D6DD0;
  v3 = *(_OWORD *)(a1 + 32);
  v4 = *(_BYTE *)(a1 + 48);
  return objc_msgSend((id)v3, "_dispatchBlockWhenOpen:", v2);
}

void __58__CPLProxyLibraryManager_noteClientIsInForegroundQuietly___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  uint8_t buf[8];
  _QWORD v9[5];

  ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 72) == 1)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __58__CPLProxyLibraryManager_noteClientIsInForegroundQuietly___block_invoke_3;
    v9[3] = &__block_descriptor_40_e37_v24__0__NSXPCConnection_8__NSError_16l;
    v9[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend((id)v2, "proxyWithErrorHandler:", v9);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "noteClientIsInForegroundQuietly:", *(unsigned __int8 *)(a1 + 48));
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 80) = *(_BYTE *)(a1 + 48);
LABEL_16:

      return;
    }
    if (_CPLSilentLogging)
      goto LABEL_16;
    __CPLManagerOSLogDomain();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
LABEL_14:
      _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_ERROR, "Proxy has disappeared", buf, 2u);
      goto LABEL_15;
    }
    goto LABEL_15;
  }
  if (*(_BYTE *)(v2 + 80) && !*(_BYTE *)(a1 + 48))
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __58__CPLProxyLibraryManager_noteClientIsInForegroundQuietly___block_invoke_329;
    v7[3] = &__block_descriptor_40_e37_v24__0__NSXPCConnection_8__NSError_16l;
    v7[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend((id)v2, "proxyWithErrorHandler:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5;
    if (v5)
    {
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 80) = 0;
      objc_msgSend(v5, "noteClientIsInForegroundQuietly:", 0);
      objc_msgSend(v4, "noteClientIsInBackground");
      goto LABEL_16;
    }
    if (_CPLSilentLogging)
      goto LABEL_16;
    __CPLManagerOSLogDomain();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      goto LABEL_14;
    }
LABEL_15:

    goto LABEL_16;
  }
}

void __58__CPLProxyLibraryManager_noteClientIsInForegroundQuietly___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 32));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412802;
      v10 = v5;
      v11 = 2112;
      v12 = v8;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_ERROR, "%@ failed to send %@: %@", (uint8_t *)&v9, 0x20u);

    }
  }

}

void __58__CPLProxyLibraryManager_noteClientIsInForegroundQuietly___block_invoke_329(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 32));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412802;
      v10 = v5;
      v11 = 2112;
      v12 = v8;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_ERROR, "%@ failed to send %@: %@", (uint8_t *)&v9, 0x20u);

    }
  }

}

- (void)noteClientIsInBackground
{
  OS_dispatch_queue *queue;
  uint64_t v3;
  _QWORD *v4;
  NSObject *v5;
  dispatch_block_t v6;
  _QWORD v7[6];
  _QWORD block[4];
  id v9;

  queue = self->_queue;
  v3 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__CPLProxyLibraryManager_noteClientIsInBackground__block_invoke;
  v7[3] = &unk_1E60D6DF8;
  v7[4] = self;
  v7[5] = a2;
  v4 = v7;
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60D71F8;
  v9 = v4;
  v5 = queue;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);

}

uint64_t __50__CPLProxyLibraryManager_noteClientIsInBackground__block_invoke(uint64_t a1)
{
  _QWORD v2[4];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __50__CPLProxyLibraryManager_noteClientIsInBackground__block_invoke_2;
  v2[3] = &unk_1E60D6DF8;
  return objc_msgSend(*(id *)(a1 + 32), "_dispatchBlockWhenOpen:", v2);
}

void __50__CPLProxyLibraryManager_noteClientIsInBackground__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  _QWORD v11[5];
  uint8_t buf[4];
  NSObject *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 72);
  if (v3)
  {
    *(_QWORD *)(v2 + 72) = v3 - 1;
    v4 = *(_QWORD **)(a1 + 32);
    if (v4[9])
      return;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __50__CPLProxyLibraryManager_noteClientIsInBackground__block_invoke_3;
    v11[3] = &__block_descriptor_40_e37_v24__0__NSXPCConnection_8__NSError_16l;
    v11[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(v4, "proxyWithErrorHandler:", v11);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      -[NSObject noteClientIsInBackground](v5, "noteClientIsInBackground");
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 80) = 0;
      goto LABEL_10;
    }
    if (_CPLSilentLogging)
      goto LABEL_10;
    __CPLManagerOSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    v8 = "Proxy has disappeared";
    v9 = v7;
    v10 = 2;
LABEL_8:
    _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_ERROR, v8, buf, v10);
    goto LABEL_9;
  }
  if (_CPLSilentLogging)
    return;
  __CPLManagerOSLogDomain();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v7 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v13 = v7;
    v8 = "%@ has been called too many times";
    v9 = v6;
    v10 = 12;
    goto LABEL_8;
  }
LABEL_10:

}

void __50__CPLProxyLibraryManager_noteClientIsInBackground__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 32));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412802;
      v10 = v5;
      v11 = 2112;
      v12 = v8;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_ERROR, "%@ failed to send %@: %@", (uint8_t *)&v9, 0x20u);

    }
  }

}

- (void)disableSynchronizationWithReason:(id)a3
{
  id v5;
  OS_dispatch_queue *queue;
  uint64_t v7;
  _QWORD *v8;
  NSObject *v9;
  id v10;
  dispatch_block_t v11;
  _QWORD v12[5];
  id v13;
  SEL v14;
  _QWORD block[4];
  id v16;

  v5 = a3;
  queue = self->_queue;
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __59__CPLProxyLibraryManager_disableSynchronizationWithReason___block_invoke;
  v12[3] = &unk_1E60D6E20;
  v12[4] = self;
  v13 = v5;
  v14 = a2;
  v8 = v12;
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60D71F8;
  v16 = v8;
  v9 = queue;
  v10 = v5;
  v11 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v9, v11);

}

void __59__CPLProxyLibraryManager_disableSynchronizationWithReason___block_invoke(_QWORD *a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  uint64_t v8;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__CPLProxyLibraryManager_disableSynchronizationWithReason___block_invoke_2;
  v5[3] = &unk_1E60D6E20;
  v2 = (void *)a1[5];
  v6 = (id)a1[4];
  v3 = v2;
  v4 = a1[6];
  v7 = v3;
  v8 = v4;
  objc_msgSend(v6, "_dispatchBlockWhenOpen:", v5);

}

void __59__CPLProxyLibraryManager_disableSynchronizationWithReason___block_invoke_2(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[8];
  _QWORD v7[5];

  objc_msgSend(*(id *)(a1[4] + 88), "addObject:", a1[5]);
  if (objc_msgSend(*(id *)(a1[4] + 88), "countForObject:", a1[5]) == 1)
  {
    v2 = (void *)a1[4];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __59__CPLProxyLibraryManager_disableSynchronizationWithReason___block_invoke_3;
    v7[3] = &__block_descriptor_40_e37_v24__0__NSXPCConnection_8__NSError_16l;
    v7[4] = a1[6];
    objc_msgSend(v2, "proxyWithErrorHandler:", v7);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "disableSynchronizationWithReason:", a1[5]);
    }
    else if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_ERROR, "Proxy has disappeared", v6, 2u);
      }

    }
  }
}

void __59__CPLProxyLibraryManager_disableSynchronizationWithReason___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 32));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412802;
      v10 = v5;
      v11 = 2112;
      v12 = v8;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_ERROR, "%@ failed to send %@: %@", (uint8_t *)&v9, 0x20u);

    }
  }

}

- (void)enableSynchronizationWithReason:(id)a3
{
  id v5;
  OS_dispatch_queue *queue;
  uint64_t v7;
  _QWORD *v8;
  NSObject *v9;
  id v10;
  dispatch_block_t v11;
  _QWORD v12[5];
  id v13;
  SEL v14;
  _QWORD block[4];
  id v16;

  v5 = a3;
  queue = self->_queue;
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __58__CPLProxyLibraryManager_enableSynchronizationWithReason___block_invoke;
  v12[3] = &unk_1E60D6E20;
  v12[4] = self;
  v13 = v5;
  v14 = a2;
  v8 = v12;
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60D71F8;
  v16 = v8;
  v9 = queue;
  v10 = v5;
  v11 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v9, v11);

}

void __58__CPLProxyLibraryManager_enableSynchronizationWithReason___block_invoke(_QWORD *a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  uint64_t v8;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__CPLProxyLibraryManager_enableSynchronizationWithReason___block_invoke_2;
  v5[3] = &unk_1E60D6E20;
  v2 = (void *)a1[5];
  v6 = (id)a1[4];
  v3 = v2;
  v4 = a1[6];
  v7 = v3;
  v8 = v4;
  objc_msgSend(v6, "_dispatchBlockWhenOpen:", v5);

}

void __58__CPLProxyLibraryManager_enableSynchronizationWithReason___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD v8[5];
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "countForObject:", *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "removeObject:", *(_QWORD *)(a1 + 40));
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "countForObject:", *(_QWORD *)(a1 + 40)))
      return;
    v2 = *(void **)(a1 + 32);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __58__CPLProxyLibraryManager_enableSynchronizationWithReason___block_invoke_3;
    v8[3] = &__block_descriptor_40_e37_v24__0__NSXPCConnection_8__NSError_16l;
    v8[4] = *(_QWORD *)(a1 + 48);
    objc_msgSend(v2, "proxyWithErrorHandler:", v8);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      -[NSObject enableSynchronizationWithReason:](v3, "enableSynchronizationWithReason:", *(_QWORD *)(a1 + 40));
    }
    else if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_ERROR, "Proxy has disappeared", buf, 2u);
      }

    }
  }
  else
  {
    if (_CPLSilentLogging)
      return;
    __CPLManagerOSLogDomain();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v10 = v5;
      v11 = 2112;
      v12 = v6;
      _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_ERROR, "%@ has been called too many times with reason '%@'", buf, 0x16u);

    }
  }

}

void __58__CPLProxyLibraryManager_enableSynchronizationWithReason___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 32));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412802;
      v10 = v5;
      v11 = 2112;
      v12 = v8;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_ERROR, "%@ failed to send %@: %@", (uint8_t *)&v9, 0x20u);

    }
  }

}

- (void)disableMingling
{
  OS_dispatch_queue *queue;
  uint64_t v3;
  _QWORD *v4;
  NSObject *v5;
  dispatch_block_t v6;
  _QWORD v7[6];
  _QWORD block[4];
  id v9;

  queue = self->_queue;
  v3 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__CPLProxyLibraryManager_disableMingling__block_invoke;
  v7[3] = &unk_1E60D6DF8;
  v7[4] = self;
  v7[5] = a2;
  v4 = v7;
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60D71F8;
  v9 = v4;
  v5 = queue;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);

}

uint64_t __41__CPLProxyLibraryManager_disableMingling__block_invoke(uint64_t a1)
{
  _QWORD v2[4];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __41__CPLProxyLibraryManager_disableMingling__block_invoke_2;
  v2[3] = &unk_1E60D6DF8;
  return objc_msgSend(*(id *)(a1 + 32), "_dispatchBlockWhenOpen:", v2);
}

void __41__CPLProxyLibraryManager_disableMingling__block_invoke_2(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  void *v3;
  NSObject *v4;
  uint8_t v5[8];
  _QWORD v6[5];

  ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
  v1 = *(_QWORD **)(a1 + 32);
  if (v1[12] == 1)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __41__CPLProxyLibraryManager_disableMingling__block_invoke_3;
    v6[3] = &__block_descriptor_40_e37_v24__0__NSXPCConnection_8__NSError_16l;
    v6[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(v1, "proxyWithErrorHandler:", v6);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if (v2)
    {
      objc_msgSend(v2, "disableMingling");
    }
    else if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_ERROR, "Proxy has disappeared", v5, 2u);
      }

    }
  }
}

void __41__CPLProxyLibraryManager_disableMingling__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 32));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412802;
      v10 = v5;
      v11 = 2112;
      v12 = v8;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_ERROR, "%@ failed to send %@: %@", (uint8_t *)&v9, 0x20u);

    }
  }

}

- (void)enableMingling
{
  OS_dispatch_queue *queue;
  uint64_t v3;
  _QWORD *v4;
  NSObject *v5;
  dispatch_block_t v6;
  _QWORD v7[6];
  _QWORD block[4];
  id v9;

  queue = self->_queue;
  v3 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__CPLProxyLibraryManager_enableMingling__block_invoke;
  v7[3] = &unk_1E60D6DF8;
  v7[4] = self;
  v7[5] = a2;
  v4 = v7;
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60D71F8;
  v9 = v4;
  v5 = queue;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);

}

uint64_t __40__CPLProxyLibraryManager_enableMingling__block_invoke(uint64_t a1)
{
  _QWORD v2[4];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __40__CPLProxyLibraryManager_enableMingling__block_invoke_2;
  v2[3] = &unk_1E60D6DF8;
  return objc_msgSend(*(id *)(a1 + 32), "_dispatchBlockWhenOpen:", v2);
}

void __40__CPLProxyLibraryManager_enableMingling__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  _QWORD v11[5];
  uint8_t buf[4];
  NSObject *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 96);
  if (v3)
  {
    *(_QWORD *)(v2 + 96) = v3 - 1;
    v4 = *(_QWORD **)(a1 + 32);
    if (v4[12])
      return;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __40__CPLProxyLibraryManager_enableMingling__block_invoke_3;
    v11[3] = &__block_descriptor_40_e37_v24__0__NSXPCConnection_8__NSError_16l;
    v11[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(v4, "proxyWithErrorHandler:", v11);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      -[NSObject enableMingling](v5, "enableMingling");
      goto LABEL_10;
    }
    if (_CPLSilentLogging)
      goto LABEL_10;
    __CPLManagerOSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    v8 = "Proxy has disappeared";
    v9 = v7;
    v10 = 2;
LABEL_8:
    _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_ERROR, v8, buf, v10);
    goto LABEL_9;
  }
  if (_CPLSilentLogging)
    return;
  __CPLManagerOSLogDomain();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v7 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v13 = v7;
    v8 = "%@ has been called too many times";
    v9 = v6;
    v10 = 12;
    goto LABEL_8;
  }
LABEL_10:

}

void __40__CPLProxyLibraryManager_enableMingling__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 32));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412802;
      v10 = v5;
      v11 = 2112;
      v12 = v8;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_ERROR, "%@ failed to send %@: %@", (uint8_t *)&v9, 0x20u);

    }
  }

}

- (void)noteClientIsBeginningSignificantWork
{
  OS_dispatch_queue *queue;
  uint64_t v3;
  _QWORD *v4;
  NSObject *v5;
  dispatch_block_t v6;
  _QWORD v7[6];
  _QWORD block[4];
  id v9;

  queue = self->_queue;
  v3 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__CPLProxyLibraryManager_noteClientIsBeginningSignificantWork__block_invoke;
  v7[3] = &unk_1E60D6DF8;
  v7[4] = self;
  v7[5] = a2;
  v4 = v7;
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60D71F8;
  v9 = v4;
  v5 = queue;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);

}

uint64_t __62__CPLProxyLibraryManager_noteClientIsBeginningSignificantWork__block_invoke(uint64_t a1)
{
  _QWORD v2[4];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __62__CPLProxyLibraryManager_noteClientIsBeginningSignificantWork__block_invoke_2;
  v2[3] = &unk_1E60D6DF8;
  return objc_msgSend(*(id *)(a1 + 32), "_dispatchBlockWhenOpen:", v2);
}

void __62__CPLProxyLibraryManager_noteClientIsBeginningSignificantWork__block_invoke_2(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  void *v3;
  NSObject *v4;
  uint8_t v5[8];
  _QWORD v6[5];

  ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 104);
  v1 = *(_QWORD **)(a1 + 32);
  if (v1[13] == 1)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __62__CPLProxyLibraryManager_noteClientIsBeginningSignificantWork__block_invoke_3;
    v6[3] = &__block_descriptor_40_e37_v24__0__NSXPCConnection_8__NSError_16l;
    v6[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(v1, "proxyWithErrorHandler:", v6);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if (v2)
    {
      objc_msgSend(v2, "noteClientIsBeginningSignificantWork");
    }
    else if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_ERROR, "Proxy has disappeared", v5, 2u);
      }

    }
  }
}

void __62__CPLProxyLibraryManager_noteClientIsBeginningSignificantWork__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 32));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412802;
      v10 = v5;
      v11 = 2112;
      v12 = v8;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_ERROR, "%@ failed to send %@: %@", (uint8_t *)&v9, 0x20u);

    }
  }

}

- (void)getSystemBudgetsWithCompletionHandler:(id)a3
{
  id v5;
  OS_dispatch_queue *queue;
  uint64_t v7;
  _QWORD *v8;
  NSObject *v9;
  id v10;
  dispatch_block_t v11;
  _QWORD v12[5];
  id v13;
  SEL v14;
  _QWORD block[4];
  id v16;

  v5 = a3;
  queue = self->_queue;
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __64__CPLProxyLibraryManager_getSystemBudgetsWithCompletionHandler___block_invoke;
  v12[3] = &unk_1E60D6780;
  v13 = v5;
  v14 = a2;
  v12[4] = self;
  v8 = v12;
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60D71F8;
  v16 = v8;
  v9 = queue;
  v10 = v5;
  v11 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v9, v11);

}

void __64__CPLProxyLibraryManager_getSystemBudgetsWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  __int128 v3;
  _QWORD v4[5];
  __int128 v5;

  v1 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __64__CPLProxyLibraryManager_getSystemBudgetsWithCompletionHandler___block_invoke_2;
  v4[3] = &unk_1E60D6780;
  v4[4] = v1;
  v3 = *(_OWORD *)(a1 + 40);
  v2 = (id)v3;
  v5 = v3;
  objc_msgSend(v1, "_dispatchBlockWhenOpen:", v4);

}

void __64__CPLProxyLibraryManager_getSystemBudgetsWithCompletionHandler___block_invoke_2(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[8];
  _QWORD v7[5];

  v2 = (void *)a1[4];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__CPLProxyLibraryManager_getSystemBudgetsWithCompletionHandler___block_invoke_3;
  v7[3] = &__block_descriptor_40_e37_v24__0__NSXPCConnection_8__NSError_16l;
  v7[4] = a1[6];
  objc_msgSend(v2, "proxyWithErrorHandler:", v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "getSystemBudgetsWithCompletionHandler:", a1[5]);
  }
  else if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_ERROR, "Proxy has disappeared", v6, 2u);
    }

  }
}

void __64__CPLProxyLibraryManager_getSystemBudgetsWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 32));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412802;
      v10 = v5;
      v11 = 2112;
      v12 = v8;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_ERROR, "%@ failed to send %@: %@", (uint8_t *)&v9, 0x20u);

    }
  }

}

- (void)setShouldOverride:(BOOL)a3 forSystemBudgets:(unint64_t)a4
{
  OS_dispatch_queue *queue;
  uint64_t v5;
  _QWORD *v6;
  NSObject *v7;
  dispatch_block_t v8;
  _QWORD v9[7];
  BOOL v10;
  _QWORD block[4];
  id v12;

  queue = self->_queue;
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__CPLProxyLibraryManager_setShouldOverride_forSystemBudgets___block_invoke;
  v9[3] = &unk_1E60D6E48;
  v9[4] = self;
  v9[5] = a2;
  v10 = a3;
  v9[6] = a4;
  v6 = v9;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60D71F8;
  v12 = v6;
  v7 = queue;
  v8 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v8);

}

uint64_t __61__CPLProxyLibraryManager_setShouldOverride_forSystemBudgets___block_invoke(uint64_t a1)
{
  _QWORD v2[4];
  __int128 v3;
  uint64_t v4;
  char v5;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __61__CPLProxyLibraryManager_setShouldOverride_forSystemBudgets___block_invoke_2;
  v2[3] = &unk_1E60D6E48;
  v3 = *(_OWORD *)(a1 + 32);
  v5 = *(_BYTE *)(a1 + 56);
  v4 = *(_QWORD *)(a1 + 48);
  return objc_msgSend((id)v3, "_dispatchBlockWhenOpen:", v2);
}

void __61__CPLProxyLibraryManager_setShouldOverride_forSystemBudgets___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[8];
  _QWORD v7[5];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__CPLProxyLibraryManager_setShouldOverride_forSystemBudgets___block_invoke_3;
  v7[3] = &__block_descriptor_40_e37_v24__0__NSXPCConnection_8__NSError_16l;
  v2 = *(void **)(a1 + 32);
  v7[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "proxyWithErrorHandler:", v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "setShouldOverride:forSystemBudgets:", *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
  }
  else if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_ERROR, "Proxy has disappeared", v6, 2u);
    }

  }
}

void __61__CPLProxyLibraryManager_setShouldOverride_forSystemBudgets___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 32));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412802;
      v10 = v5;
      v11 = 2112;
      v12 = v8;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_ERROR, "%@ failed to send %@: %@", (uint8_t *)&v9, 0x20u);

    }
  }

}

- (void)noteClientIsEndingSignificantWork
{
  OS_dispatch_queue *queue;
  uint64_t v3;
  _QWORD *v4;
  NSObject *v5;
  dispatch_block_t v6;
  _QWORD v7[6];
  _QWORD block[4];
  id v9;

  queue = self->_queue;
  v3 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__CPLProxyLibraryManager_noteClientIsEndingSignificantWork__block_invoke;
  v7[3] = &unk_1E60D6DF8;
  v7[4] = self;
  v7[5] = a2;
  v4 = v7;
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60D71F8;
  v9 = v4;
  v5 = queue;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);

}

uint64_t __59__CPLProxyLibraryManager_noteClientIsEndingSignificantWork__block_invoke(uint64_t a1)
{
  _QWORD v2[4];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __59__CPLProxyLibraryManager_noteClientIsEndingSignificantWork__block_invoke_2;
  v2[3] = &unk_1E60D6DF8;
  return objc_msgSend(*(id *)(a1 + 32), "_dispatchBlockWhenOpen:", v2);
}

void __59__CPLProxyLibraryManager_noteClientIsEndingSignificantWork__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  _QWORD v11[5];
  uint8_t buf[4];
  NSObject *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 104);
  if (v3)
  {
    *(_QWORD *)(v2 + 104) = v3 - 1;
    v4 = *(_QWORD **)(a1 + 32);
    if (v4[13])
      return;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __59__CPLProxyLibraryManager_noteClientIsEndingSignificantWork__block_invoke_3;
    v11[3] = &__block_descriptor_40_e37_v24__0__NSXPCConnection_8__NSError_16l;
    v11[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(v4, "proxyWithErrorHandler:", v11);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      -[NSObject noteClientIsEndingSignificantWork](v5, "noteClientIsEndingSignificantWork");
      goto LABEL_10;
    }
    if (_CPLSilentLogging)
      goto LABEL_10;
    __CPLManagerOSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    v8 = "Proxy has disappeared";
    v9 = v7;
    v10 = 2;
LABEL_8:
    _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_ERROR, v8, buf, v10);
    goto LABEL_9;
  }
  if (_CPLSilentLogging)
    return;
  __CPLManagerOSLogDomain();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v7 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v13 = v7;
    v8 = "%@ has been called too many times";
    v9 = v6;
    v10 = 12;
    goto LABEL_8;
  }
LABEL_10:

}

void __59__CPLProxyLibraryManager_noteClientIsEndingSignificantWork__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 32));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412802;
      v10 = v5;
      v11 = 2112;
      v12 = v8;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_ERROR, "%@ failed to send %@: %@", (uint8_t *)&v9, 0x20u);

    }
  }

}

- (void)checkHasBackgroundDownloadOperationsWithCompletionHandler:(id)a3
{
  id v5;
  OS_dispatch_queue *queue;
  uint64_t v7;
  _QWORD *v8;
  NSObject *v9;
  id v10;
  dispatch_block_t v11;
  _QWORD v12[5];
  id v13;
  SEL v14;
  _QWORD block[4];
  id v16;

  v5 = a3;
  queue = self->_queue;
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __84__CPLProxyLibraryManager_checkHasBackgroundDownloadOperationsWithCompletionHandler___block_invoke;
  v12[3] = &unk_1E60D6780;
  v13 = v5;
  v14 = a2;
  v12[4] = self;
  v8 = v12;
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60D71F8;
  v16 = v8;
  v9 = queue;
  v10 = v5;
  v11 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v9, v11);

}

void __84__CPLProxyLibraryManager_checkHasBackgroundDownloadOperationsWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  __int128 v3;
  _QWORD v4[5];
  __int128 v5;

  v1 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __84__CPLProxyLibraryManager_checkHasBackgroundDownloadOperationsWithCompletionHandler___block_invoke_2;
  v4[3] = &unk_1E60D6780;
  v4[4] = v1;
  v3 = *(_OWORD *)(a1 + 40);
  v2 = (id)v3;
  v5 = v3;
  objc_msgSend(v1, "_dispatchBlockWhenOpen:", v4);

}

void __84__CPLProxyLibraryManager_checkHasBackgroundDownloadOperationsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  uint8_t buf[16];
  _QWORD v11[4];
  __int128 v12;

  v2 = *(void **)(a1 + 32);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __84__CPLProxyLibraryManager_checkHasBackgroundDownloadOperationsWithCompletionHandler___block_invoke_3;
  v11[3] = &unk_1E60D6CF8;
  v9 = *(_OWORD *)(a1 + 40);
  v3 = (id)v9;
  v12 = v9;
  objc_msgSend(v2, "proxyWithErrorHandler:", v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "checkHasBackgroundDownloadOperationsWithCompletionHandler:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_ERROR, "Proxy has disappeared", buf, 2u);
      }

    }
    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
    {
      +[CPLErrors unknownError](CPLErrors, "unknownError");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v8);

    }
  }

}

void __84__CPLProxyLibraryManager_checkHasBackgroundDownloadOperationsWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  int v10;
  id v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412802;
      v11 = v5;
      v12 = 2112;
      v13 = v8;
      v14 = 2112;
      v15 = v6;
      _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_ERROR, "%@ failed to check ongoing download operations %@: %@", (uint8_t *)&v10, 0x20u);

    }
  }
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(uint64_t, _QWORD, id))(v9 + 16))(v9, 0, v6);

}

- (void)getStatusForRecordsWithScopedIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  OS_dispatch_queue *queue;
  uint64_t v10;
  _QWORD *v11;
  NSObject *v12;
  id v13;
  id v14;
  dispatch_block_t v15;
  _QWORD v16[5];
  id v17;
  id v18;
  SEL v19;
  _QWORD block[4];
  id v21;

  v7 = a3;
  v8 = a4;
  queue = self->_queue;
  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __85__CPLProxyLibraryManager_getStatusForRecordsWithScopedIdentifiers_completionHandler___block_invoke;
  v16[3] = &unk_1E60D6C58;
  v18 = v8;
  v19 = a2;
  v16[4] = self;
  v17 = v7;
  v11 = v16;
  block[0] = v10;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60D71F8;
  v21 = v11;
  v12 = queue;
  v13 = v7;
  v14 = v8;
  v15 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v12, v15);

}

void __85__CPLProxyLibraryManager_getStatusForRecordsWithScopedIdentifiers_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  __int128 v4;
  _QWORD v5[5];
  id v6;
  __int128 v7;

  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __85__CPLProxyLibraryManager_getStatusForRecordsWithScopedIdentifiers_completionHandler___block_invoke_2;
  v5[3] = &unk_1E60D6C58;
  v5[4] = v2;
  v4 = *(_OWORD *)(a1 + 48);
  v3 = (id)v4;
  v7 = v4;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v2, "_dispatchBlockWhenOpen:", v5);

}

void __85__CPLProxyLibraryManager_getStatusForRecordsWithScopedIdentifiers_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  uint8_t buf[16];
  _QWORD v11[4];
  __int128 v12;

  v2 = *(void **)(a1 + 32);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __85__CPLProxyLibraryManager_getStatusForRecordsWithScopedIdentifiers_completionHandler___block_invoke_3;
  v11[3] = &unk_1E60D6CF8;
  v9 = *(_OWORD *)(a1 + 48);
  v3 = (id)v9;
  v12 = v9;
  objc_msgSend(v2, "proxyWithErrorHandler:", v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "getStatusForRecordsWithScopedIdentifiers:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_ERROR, "Proxy has disappeared", buf, 2u);
      }

    }
    v7 = *(_QWORD *)(a1 + 48);
    if (v7)
    {
      +[CPLErrors unknownError](CPLErrors, "unknownError");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v8);

    }
  }

}

void __85__CPLProxyLibraryManager_getStatusForRecordsWithScopedIdentifiers_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  int v10;
  id v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412802;
      v11 = v5;
      v12 = 2112;
      v13 = v8;
      v14 = 2112;
      v15 = v6;
      _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_ERROR, "%@ failed to check statuses %@: %@", (uint8_t *)&v10, 0x20u);

    }
  }
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(uint64_t, _QWORD, id))(v9 + 16))(v9, 0, v6);

}

- (void)getChangedStatusesWithCompletionHandler:(id)a3
{
  id v5;
  OS_dispatch_queue *queue;
  uint64_t v7;
  _QWORD *v8;
  NSObject *v9;
  id v10;
  dispatch_block_t v11;
  _QWORD v12[5];
  id v13;
  SEL v14;
  _QWORD block[4];
  id v16;

  v5 = a3;
  queue = self->_queue;
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __66__CPLProxyLibraryManager_getChangedStatusesWithCompletionHandler___block_invoke;
  v12[3] = &unk_1E60D6780;
  v13 = v5;
  v14 = a2;
  v12[4] = self;
  v8 = v12;
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60D71F8;
  v16 = v8;
  v9 = queue;
  v10 = v5;
  v11 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v9, v11);

}

void __66__CPLProxyLibraryManager_getChangedStatusesWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  __int128 v3;
  _QWORD v4[5];
  __int128 v5;

  v1 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __66__CPLProxyLibraryManager_getChangedStatusesWithCompletionHandler___block_invoke_2;
  v4[3] = &unk_1E60D6780;
  v4[4] = v1;
  v3 = *(_OWORD *)(a1 + 40);
  v2 = (id)v3;
  v5 = v3;
  objc_msgSend(v1, "_dispatchBlockWhenOpen:", v4);

}

void __66__CPLProxyLibraryManager_getChangedStatusesWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  uint8_t buf[16];
  _QWORD v11[4];
  __int128 v12;

  v2 = *(void **)(a1 + 32);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __66__CPLProxyLibraryManager_getChangedStatusesWithCompletionHandler___block_invoke_3;
  v11[3] = &unk_1E60D6CF8;
  v9 = *(_OWORD *)(a1 + 40);
  v3 = (id)v9;
  v12 = v9;
  objc_msgSend(v2, "proxyWithErrorHandler:", v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "getChangedStatusesWithCompletionHandler:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_ERROR, "Proxy has disappeared", buf, 2u);
      }

    }
    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
    {
      +[CPLErrors unknownError](CPLErrors, "unknownError");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v8);

    }
  }

}

void __66__CPLProxyLibraryManager_getChangedStatusesWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  int v10;
  id v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412802;
      v11 = v5;
      v12 = 2112;
      v13 = v8;
      v14 = 2112;
      v15 = v6;
      _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_ERROR, "%@ failed to check statuses %@: %@", (uint8_t *)&v10, 0x20u);

    }
  }
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(uint64_t, _QWORD, id))(v9 + 16))(v9, 0, v6);

}

- (void)acknowledgeChangedStatuses:(id)a3
{
  id v5;
  OS_dispatch_queue *queue;
  uint64_t v7;
  _QWORD *v8;
  NSObject *v9;
  id v10;
  dispatch_block_t v11;
  _QWORD v12[5];
  id v13;
  SEL v14;
  _QWORD block[4];
  id v16;

  v5 = a3;
  queue = self->_queue;
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __53__CPLProxyLibraryManager_acknowledgeChangedStatuses___block_invoke;
  v12[3] = &unk_1E60D6E20;
  v13 = v5;
  v14 = a2;
  v12[4] = self;
  v8 = v12;
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60D71F8;
  v16 = v8;
  v9 = queue;
  v10 = v5;
  v11 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v9, v11);

}

void __53__CPLProxyLibraryManager_acknowledgeChangedStatuses___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  __int128 v3;
  _QWORD v4[5];
  __int128 v5;

  v1 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__CPLProxyLibraryManager_acknowledgeChangedStatuses___block_invoke_2;
  v4[3] = &unk_1E60D6E20;
  v4[4] = v1;
  v3 = *(_OWORD *)(a1 + 40);
  v2 = (id)v3;
  v5 = v3;
  objc_msgSend(v1, "_dispatchBlockWhenOpen:", v4);

}

void __53__CPLProxyLibraryManager_acknowledgeChangedStatuses___block_invoke_2(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[8];
  _QWORD v7[5];

  v2 = (void *)a1[4];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__CPLProxyLibraryManager_acknowledgeChangedStatuses___block_invoke_3;
  v7[3] = &__block_descriptor_40_e37_v24__0__NSXPCConnection_8__NSError_16l;
  v7[4] = a1[6];
  objc_msgSend(v2, "proxyWithErrorHandler:", v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "acknowledgeChangedStatuses:", a1[5]);
  }
  else if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_ERROR, "Proxy has disappeared", v6, 2u);
    }

  }
}

void __53__CPLProxyLibraryManager_acknowledgeChangedStatuses___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 32));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412802;
      v10 = v5;
      v11 = 2112;
      v12 = v8;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_ERROR, "%@ failed to acknowledge changed statuses %@: %@", (uint8_t *)&v9, 0x20u);

    }
  }

}

- (void)addStatusChangesForRecordsWithScopedIdentifiers:(id)a3 persist:(BOOL)a4
{
  id v7;
  OS_dispatch_queue *queue;
  uint64_t v9;
  _QWORD *v10;
  NSObject *v11;
  id v12;
  dispatch_block_t v13;
  _QWORD v14[5];
  id v15;
  SEL v16;
  BOOL v17;
  _QWORD block[4];
  id v19;

  v7 = a3;
  queue = self->_queue;
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __82__CPLProxyLibraryManager_addStatusChangesForRecordsWithScopedIdentifiers_persist___block_invoke;
  v14[3] = &unk_1E60D6E70;
  v15 = v7;
  v16 = a2;
  v14[4] = self;
  v17 = a4;
  v10 = v14;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60D71F8;
  v19 = v10;
  v11 = queue;
  v12 = v7;
  v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v11, v13);

}

void __82__CPLProxyLibraryManager_addStatusChangesForRecordsWithScopedIdentifiers_persist___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  __int128 v4;
  _QWORD v5[5];
  __int128 v6;
  char v7;

  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __82__CPLProxyLibraryManager_addStatusChangesForRecordsWithScopedIdentifiers_persist___block_invoke_2;
  v5[3] = &unk_1E60D6E70;
  v5[4] = v2;
  v4 = *(_OWORD *)(a1 + 40);
  v3 = (id)v4;
  v6 = v4;
  v7 = *(_BYTE *)(a1 + 56);
  objc_msgSend(v2, "_dispatchBlockWhenOpen:", v5);

}

void __82__CPLProxyLibraryManager_addStatusChangesForRecordsWithScopedIdentifiers_persist___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[8];
  _QWORD v7[5];

  v2 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __82__CPLProxyLibraryManager_addStatusChangesForRecordsWithScopedIdentifiers_persist___block_invoke_3;
  v7[3] = &__block_descriptor_40_e37_v24__0__NSXPCConnection_8__NSError_16l;
  v7[4] = *(_QWORD *)(a1 + 48);
  objc_msgSend(v2, "proxyWithErrorHandler:", v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "addStatusChangesForRecordsWithScopedIdentifiers:persist:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
  }
  else if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_ERROR, "Proxy has disappeared", v6, 2u);
    }

  }
}

void __82__CPLProxyLibraryManager_addStatusChangesForRecordsWithScopedIdentifiers_persist___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 32));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412802;
      v10 = v5;
      v11 = 2112;
      v12 = v8;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_ERROR, "%@ failed to acknowledge changed statuses %@: %@", (uint8_t *)&v9, 0x20u);

    }
  }

}

- (BOOL)_setStatusFromDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("status"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("error"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v7 = objc_msgSend(v5, "unsignedIntegerValue");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 == v8)
    {

      v6 = 0;
    }
    -[CPLPlatformObject abstractObject](self, "abstractObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "_setStatus:andError:", v7, v6);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)getScopeStatusCountsForScopeWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  OS_dispatch_queue *queue;
  uint64_t v10;
  _QWORD *v11;
  NSObject *v12;
  id v13;
  id v14;
  dispatch_block_t v15;
  _QWORD v16[5];
  id v17;
  id v18;
  SEL v19;
  _QWORD block[4];
  id v21;

  v7 = a3;
  v8 = a4;
  queue = self->_queue;
  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __87__CPLProxyLibraryManager_getScopeStatusCountsForScopeWithIdentifier_completionHandler___block_invoke;
  v16[3] = &unk_1E60D6C58;
  v18 = v8;
  v19 = a2;
  v16[4] = self;
  v17 = v7;
  v11 = v16;
  block[0] = v10;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60D71F8;
  v21 = v11;
  v12 = queue;
  v13 = v7;
  v14 = v8;
  v15 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v12, v15);

}

void __87__CPLProxyLibraryManager_getScopeStatusCountsForScopeWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  __int128 v4;
  _QWORD v5[5];
  id v6;
  __int128 v7;

  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __87__CPLProxyLibraryManager_getScopeStatusCountsForScopeWithIdentifier_completionHandler___block_invoke_2;
  v5[3] = &unk_1E60D6C58;
  v5[4] = v2;
  v4 = *(_OWORD *)(a1 + 48);
  v3 = (id)v4;
  v7 = v4;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v2, "_dispatchBlockWhenOpen:", v5);

}

void __87__CPLProxyLibraryManager_getScopeStatusCountsForScopeWithIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  uint8_t buf[16];
  _QWORD v11[4];
  __int128 v12;

  v2 = *(void **)(a1 + 32);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __87__CPLProxyLibraryManager_getScopeStatusCountsForScopeWithIdentifier_completionHandler___block_invoke_3;
  v11[3] = &unk_1E60D6CF8;
  v9 = *(_OWORD *)(a1 + 48);
  v3 = (id)v9;
  v12 = v9;
  objc_msgSend(v2, "proxyWithErrorHandler:", v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "getScopeStatusCountsForScopeWithIdentifier:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_ERROR, "Proxy has disappeared", buf, 2u);
      }

    }
    v7 = *(_QWORD *)(a1 + 48);
    +[CPLErrors unknownError](CPLErrors, "unknownError", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v8);

  }
}

void __87__CPLProxyLibraryManager_getScopeStatusCountsForScopeWithIdentifier_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412802;
      v10 = v5;
      v11 = 2112;
      v12 = v8;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_ERROR, "%@ failed to get scope status counts %@: %@", (uint8_t *)&v9, 0x20u);

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)_invokeSyncOutstandingInvocationsWithTaskIdentifier:(id)a3
{
  id v4;
  unint64_t syncOutstandingInvocationsCount;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  unint64_t v10;
  BOOL v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSMutableDictionary *syncOutstandingInvocations;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  syncOutstandingInvocationsCount = self->_syncOutstandingInvocationsCount;
  if (!syncOutstandingInvocationsCount)
    -[CPLProxyLibraryManager _invokeSyncOutstandingInvocationsWithTaskIdentifier:].cold.1();
  v6 = v4;
  if (v4)
  {
    -[NSMutableDictionary objectForKey:](self->_syncOutstandingInvocations, "objectForKey:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[NSMutableDictionary removeObjectForKey:](self->_syncOutstandingInvocations, "removeObjectForKey:", v6);
      if (!_CPLSilentLogging)
      {
        __CPLManagerOSLogDomain();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          v16 = 138412546;
          v17 = v6;
          v18 = 2112;
          v19 = v7;
          _os_log_impl(&dword_1B03C2000, v8, OS_LOG_TYPE_DEBUG, "Got some callbacks for task with identifier %@ before we actually knew about it, redispatching: %@", (uint8_t *)&v16, 0x16u);
        }

      }
      if (objc_msgSend(v7, "didFinish"))
      {
        objc_msgSend(v7, "errors");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[CPLProxyLibraryManager forceSyncDidFinishForTask:withErrors:](self, "forceSyncDidFinishForTask:withErrors:", v6, v9);

      }
    }

    syncOutstandingInvocationsCount = self->_syncOutstandingInvocationsCount;
  }
  v10 = syncOutstandingInvocationsCount - 1;
  self->_syncOutstandingInvocationsCount = v10;
  if (!v10)
  {
    if (-[NSMutableDictionary count](self->_syncOutstandingInvocations, "count"))
      v11 = _CPLSilentLogging == 0;
    else
      v11 = 0;
    if (v11)
    {
      __CPLManagerOSLogDomain();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        -[NSMutableDictionary allKeys](self->_syncOutstandingInvocations, "allKeys");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "componentsJoinedByString:", CFSTR(", "));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138412290;
        v17 = v14;
        _os_log_impl(&dword_1B03C2000, v12, OS_LOG_TYPE_ERROR, "Dropping outstanding invocations for tasks with identifiers %@", (uint8_t *)&v16, 0xCu);

      }
    }
    syncOutstandingInvocations = self->_syncOutstandingInvocations;
    self->_syncOutstandingInvocations = 0;

  }
}

- (void)_dispatchFailedForceSyncTaskForScopeIdentifiers:(id)a3 withError:(id)a4 withCompletionHandler:(id)a5
{
  void (**v8)(id, CPLForceSyncTask *);
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  CPLForceSyncTask *v16;

  v8 = (void (**)(id, CPLForceSyncTask *))a5;
  v9 = a4;
  v10 = a3;
  v16 = -[CPLForceSyncTask initWithScopeIdentifiers:]([CPLForceSyncTask alloc], "initWithScopeIdentifiers:", v10);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLForceSyncTask setTaskIdentifier:](v16, "setTaskIdentifier:", v12);

  v8[2](v8, v16);
  -[CPLPlatformObject abstractObject](self, "abstractObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "forceSyncDelegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPLErrors errorsForIdentifiers:error:](CPLErrors, "errorsForIdentifiers:error:", v10, v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "libraryManager:didFinishForceSyncTask:withErrors:", v13, v16, v15);
}

- (void)forceSynchronizingScopeWithIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  OS_dispatch_queue *queue;
  uint64_t v11;
  _QWORD *v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  dispatch_block_t v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  SEL v22;
  _QWORD block[4];
  id v24;

  v7 = a3;
  v8 = a4;
  v9 = (void *)voucher_copy();
  queue = self->_queue;
  v11 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __83__CPLProxyLibraryManager_forceSynchronizingScopeWithIdentifiers_completionHandler___block_invoke;
  v18[3] = &unk_1E60D6E98;
  v18[4] = self;
  v19 = v7;
  v21 = v8;
  v22 = a2;
  v20 = v9;
  v12 = v18;
  block[0] = v11;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60D71F8;
  v24 = v12;
  v13 = queue;
  v14 = v9;
  v15 = v8;
  v16 = v7;
  v17 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v13, v17);

}

void __83__CPLProxyLibraryManager_forceSynchronizingScopeWithIdentifiers_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __83__CPLProxyLibraryManager_forceSynchronizingScopeWithIdentifiers_completionHandler___block_invoke_2;
  v5[3] = &unk_1E60D6E98;
  v2 = *(void **)(a1 + 40);
  v6 = *(id *)(a1 + 32);
  v7 = v2;
  v3 = *(id *)(a1 + 56);
  v4 = *(_QWORD *)(a1 + 64);
  v9 = v3;
  v10 = v4;
  v8 = *(id *)(a1 + 48);
  objc_msgSend(v6, "_dispatchBlockWhenOpen:", v5);

}

void __83__CPLProxyLibraryManager_forceSynchronizingScopeWithIdentifiers_completionHandler___block_invoke_2(id *a1)
{
  id v2;
  id *v3;
  uint64_t v4;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;

  v3 = a1 + 4;
  v2 = a1[4];
  v4 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __83__CPLProxyLibraryManager_forceSynchronizingScopeWithIdentifiers_completionHandler___block_invoke_3;
  v20[3] = &unk_1E60D6A28;
  v20[4] = v2;
  v21 = a1[5];
  v22 = v3[3];
  objc_msgSend(v2, "proxyWithErrorHandler:", v20);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *v3;
  if (v5)
  {
    v7 = v6[17];
    if (v6[16])
    {
      v6[17] = v7 + 1;
    }
    else
    {
      if (v7)
        __83__CPLProxyLibraryManager_forceSynchronizingScopeWithIdentifiers_completionHandler___block_invoke_2_cold_1();
      v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v11 = (void *)*((_QWORD *)*v3 + 16);
      *((_QWORD *)*v3 + 16) = v10;

      *((_QWORD *)*v3 + 17) = 1;
    }
    v12 = a1[5];
    v15[0] = v4;
    v15[1] = 3221225472;
    v15[2] = __83__CPLProxyLibraryManager_forceSynchronizingScopeWithIdentifiers_completionHandler___block_invoke_336;
    v15[3] = &unk_1E60D6A50;
    v13 = v12;
    v14 = a1[4];
    v16 = v13;
    v17 = v14;
    v18 = a1[6];
    v19 = a1[7];
    objc_msgSend(v5, "forceSyncForScopeIdentifiers:reply:", v13, v15);

    v9 = v16;
  }
  else
  {
    v8 = a1[5];
    +[CPLErrors unknownError](CPLErrors, "unknownError");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_dispatchFailedForceSyncTaskForScopeIdentifiers:withError:withCompletionHandler:", v8, v9, a1[7]);
  }

}

uint64_t __83__CPLProxyLibraryManager_forceSynchronizingScopeWithIdentifiers_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_msgSend(*(id *)(a1 + 32), "_dispatchFailedForceSyncTaskForScopeIdentifiers:withError:withCompletionHandler:", *(_QWORD *)(a1 + 40), a3, *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "_invokeSyncOutstandingInvocationsWithTaskIdentifier:", 0);
}

void __83__CPLProxyLibraryManager_forceSynchronizingScopeWithIdentifiers_completionHandler___block_invoke_336(uint64_t a1, void *a2)
{
  id v3;
  CPLProxyForceSyncTask *v4;
  void *v5;
  uint64_t v6;
  id v7;

  if (a2)
  {
    v3 = a2;
    v4 = -[CPLForceSyncTask initWithScopeIdentifiers:]([CPLProxyForceSyncTask alloc], "initWithScopeIdentifiers:", *(_QWORD *)(a1 + 32));
    -[CPLForceSyncTask setTaskIdentifier:](v4, "setTaskIdentifier:", v3);
    -[CPLProxyForceSyncTask setProxyLibraryManager:](v4, "setProxyLibraryManager:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "setObject:forKeyedSubscript:", v4, v3);
    objc_msgSend(*(id *)(a1 + 40), "_storeVoucher:forTaskWithIdentifier:", *(_QWORD *)(a1 + 48), v3);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v6 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(a1 + 40);
    v7 = 0;
    +[CPLErrors unknownError](CPLErrors, "unknownError");
    v4 = (CPLProxyForceSyncTask *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_dispatchFailedForceSyncTaskForScopeIdentifiers:withError:withCompletionHandler:", v6, v4, *(_QWORD *)(a1 + 56));
  }

  objc_msgSend(*(id *)(a1 + 40), "_invokeSyncOutstandingInvocationsWithTaskIdentifier:", a2);
}

- (void)downloadDidStartForResourceTransferTask:(id)a3
{
  id v5;
  OS_dispatch_queue *queue;
  uint64_t v7;
  _QWORD *v8;
  NSObject *v9;
  id v10;
  dispatch_block_t v11;
  _QWORD v12[5];
  id v13;
  SEL v14;
  _QWORD block[4];
  id v16;

  v5 = a3;
  queue = self->_queue;
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __66__CPLProxyLibraryManager_downloadDidStartForResourceTransferTask___block_invoke;
  v12[3] = &unk_1E60D6E20;
  v12[4] = self;
  v13 = v5;
  v14 = a2;
  v8 = v12;
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60D71F8;
  v16 = v8;
  v9 = queue;
  v10 = v5;
  v11 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v9, v11);

}

void __66__CPLProxyLibraryManager_downloadDidStartForResourceTransferTask___block_invoke(_QWORD *a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  uint64_t v8;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __66__CPLProxyLibraryManager_downloadDidStartForResourceTransferTask___block_invoke_2;
  v5[3] = &unk_1E60D6E20;
  v2 = (void *)a1[5];
  v6 = (id)a1[4];
  v3 = v2;
  v4 = a1[6];
  v7 = v3;
  v8 = v4;
  objc_msgSend(v6, "_dispatchBlockWhenOpen:", v5);

}

void __66__CPLProxyLibraryManager_downloadDidStartForResourceTransferTask___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  CPLProxyLibraryManagerOutstandingInvocation *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  CPLProxyLibraryManagerOutstandingInvocation *v14;
  id v15;
  uint64_t v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(_QWORD **)(a1 + 32);
  if (v2)
  {
    v5 = *(_QWORD *)(a1 + 40);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __66__CPLProxyLibraryManager_downloadDidStartForResourceTransferTask___block_invoke_3;
    v13[3] = &unk_1E60D6EC0;
    v14 = v2;
    v6 = *(id *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 32);
    v15 = v6;
    v16 = v7;
    objc_msgSend(v4, "_withVoucherForTaskWithIdentifier:do:", v5, v13);

    v8 = v14;
LABEL_12:

    goto LABEL_13;
  }
  if (v4[15])
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(*(SEL *)(a1 + 48));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412546;
        v18 = v10;
        v19 = 2112;
        v20 = v11;
        _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_DEBUG, "Keeping %@ invocation for %@", buf, 0x16u);

      }
    }
    v8 = objc_alloc_init(CPLProxyLibraryManagerOutstandingInvocation);
    -[CPLProxyLibraryManagerOutstandingInvocation setDidStart:](v8, "setDidStart:", 1);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "setObject:forKey:", v8, *(_QWORD *)(a1 + 40));
    goto LABEL_12;
  }
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v8 = (CPLProxyLibraryManagerOutstandingInvocation *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v8->super, OS_LOG_TYPE_ERROR))
    {
      v12 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v18 = v12;
      _os_log_impl(&dword_1B03C2000, &v8->super, OS_LOG_TYPE_ERROR, "Ignoring unknown task with identifier %@", buf, 0xCu);
    }
    goto LABEL_12;
  }
LABEL_13:

}

void __66__CPLProxyLibraryManager_downloadDidStartForResourceTransferTask___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      v3 = *(_QWORD *)(a1 + 32);
      v4 = *(_QWORD *)(a1 + 40);
      v7 = 138412546;
      v8 = v3;
      v9 = 2112;
      v10 = v4;
      _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEBUG, "Download did start for %@ with task identifier %@.", (uint8_t *)&v7, 0x16u);
    }

  }
  objc_msgSend(*(id *)(a1 + 48), "abstractObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resourceProgressDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "libraryManager:downloadDidStartForResourceTransferTask:", v5, *(_QWORD *)(a1 + 32));

}

- (void)downloadDidProgress:(float)a3 forResourceTransferTask:(id)a4
{
  id v7;
  OS_dispatch_queue *queue;
  uint64_t v9;
  _QWORD *v10;
  NSObject *v11;
  id v12;
  dispatch_block_t v13;
  _QWORD v14[5];
  id v15;
  SEL v16;
  float v17;
  _QWORD block[4];
  id v19;

  v7 = a4;
  queue = self->_queue;
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __70__CPLProxyLibraryManager_downloadDidProgress_forResourceTransferTask___block_invoke;
  v14[3] = &unk_1E60D6F10;
  v14[4] = self;
  v15 = v7;
  v17 = a3;
  v16 = a2;
  v10 = v14;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60D71F8;
  v19 = v10;
  v11 = queue;
  v12 = v7;
  v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v11, v13);

}

void __70__CPLProxyLibraryManager_downloadDidProgress_forResourceTransferTask___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  uint64_t v8;
  int v9;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __70__CPLProxyLibraryManager_downloadDidProgress_forResourceTransferTask___block_invoke_2;
  v5[3] = &unk_1E60D6F10;
  v2 = *(void **)(a1 + 40);
  v6 = *(id *)(a1 + 32);
  v3 = v2;
  v9 = *(_DWORD *)(a1 + 56);
  v4 = *(_QWORD *)(a1 + 48);
  v7 = v3;
  v8 = v4;
  objc_msgSend(v6, "_dispatchBlockWhenOpen:", v5);

}

void __70__CPLProxyLibraryManager_downloadDidProgress_forResourceTransferTask___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  CPLProxyLibraryManagerOutstandingInvocation *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  double v12;
  void *v13;
  _QWORD v14[4];
  CPLProxyLibraryManagerOutstandingInvocation *v15;
  id v16;
  uint64_t v17;
  int v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v5 = *(_QWORD *)(a1 + 40);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __70__CPLProxyLibraryManager_downloadDidProgress_forResourceTransferTask___block_invoke_3;
    v14[3] = &unk_1E60D6EE8;
    v18 = *(_DWORD *)(a1 + 56);
    v15 = v2;
    v6 = *(id *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 32);
    v16 = v6;
    v17 = v7;
    objc_msgSend((id)v4, "_withVoucherForTaskWithIdentifier:do:", v5, v14);

    v8 = v15;
LABEL_14:

    goto LABEL_15;
  }
  if (*(_QWORD *)(v4 + 120))
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(*(SEL *)(a1 + 48));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412546;
        v20 = v10;
        v21 = 2112;
        v22 = v11;
        _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_DEBUG, "Keeping %@ invocation for %@", buf, 0x16u);

      }
      v4 = *(_QWORD *)(a1 + 32);
    }
    objc_msgSend(*(id *)(v4 + 112), "objectForKey:", *(_QWORD *)(a1 + 40));
    v8 = (CPLProxyLibraryManagerOutstandingInvocation *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v8 = objc_alloc_init(CPLProxyLibraryManagerOutstandingInvocation);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "setObject:forKey:", v8, *(_QWORD *)(a1 + 40));
    }
    LODWORD(v12) = *(_DWORD *)(a1 + 56);
    -[CPLProxyLibraryManagerOutstandingInvocation setProgress:](v8, "setProgress:", v12);
    goto LABEL_14;
  }
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v8 = (CPLProxyLibraryManagerOutstandingInvocation *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v8->super, OS_LOG_TYPE_ERROR))
    {
      v13 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v20 = v13;
      _os_log_impl(&dword_1B03C2000, &v8->super, OS_LOG_TYPE_ERROR, "Ignoring unknown task with identifier %@", buf, 0xCu);
    }
    goto LABEL_14;
  }
LABEL_15:

}

void __70__CPLProxyLibraryManager_downloadDidProgress_forResourceTransferTask___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  double v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  int v9;
  double v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      v3 = (float)(*(float *)(a1 + 56) * 100.0);
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(_QWORD *)(a1 + 40);
      v9 = 134218498;
      v10 = v3;
      v11 = 2112;
      v12 = v4;
      v13 = 2112;
      v14 = v5;
      _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEBUG, "Download did progress to %.0f%% for %@ with task identifier %@.", (uint8_t *)&v9, 0x20u);
    }

  }
  objc_msgSend(*(id *)(a1 + 48), "abstractObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resourceProgressDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    LODWORD(v8) = *(_DWORD *)(a1 + 56);
    objc_msgSend(v7, "libraryManager:downloadDidProgress:forResourceTransferTask:", v6, *(_QWORD *)(a1 + 32), v8);
  }

}

- (void)downloadDidFinishForResourceTransferTask:(id)a3 finalResource:(id)a4 withError:(id)a5
{
  id v9;
  id v10;
  id v11;
  OS_dispatch_queue *queue;
  uint64_t v13;
  _QWORD *v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  dispatch_block_t v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  SEL v24;
  _QWORD block[4];
  id v26;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  queue = self->_queue;
  v13 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __91__CPLProxyLibraryManager_downloadDidFinishForResourceTransferTask_finalResource_withError___block_invoke;
  v20[3] = &unk_1E60D6F60;
  v20[4] = self;
  v21 = v11;
  v22 = v9;
  v23 = v10;
  v24 = a2;
  v14 = v20;
  block[0] = v13;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60D71F8;
  v26 = v14;
  v15 = queue;
  v16 = v10;
  v17 = v9;
  v18 = v11;
  v19 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v15, v19);

}

void __91__CPLProxyLibraryManager_downloadDidFinishForResourceTransferTask_finalResource_withError___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __91__CPLProxyLibraryManager_downloadDidFinishForResourceTransferTask_finalResource_withError___block_invoke_2;
  v7[3] = &unk_1E60D6F60;
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v9 = v4;
  v10 = *(id *)(a1 + 48);
  v5 = *(id *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 64);
  v11 = v5;
  v12 = v6;
  objc_msgSend(v2, "_dispatchBlockWhenOpen:", v7);

}

void __91__CPLProxyLibraryManager_downloadDidFinishForResourceTransferTask_finalResource_withError___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  CPLProxyLibraryManagerOutstandingInvocation *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  CPLProxyLibraryManagerOutstandingInvocation *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "cplReinflatedErrorForXPC");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "objectForKey:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 40);
  if (v3)
  {
    v6 = *(_QWORD *)(a1 + 48);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __91__CPLProxyLibraryManager_downloadDidFinishForResourceTransferTask_finalResource_withError___block_invoke_3;
    v14[3] = &unk_1E60D6F38;
    v15 = v3;
    v16 = *(id *)(a1 + 48);
    v17 = *(id *)(a1 + 56);
    v7 = v2;
    v8 = *(_QWORD *)(a1 + 40);
    v18 = v7;
    v19 = v8;
    objc_msgSend((id)v5, "_withVoucherForTaskWithIdentifier:do:", v6, v14);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "removeObjectForKey:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 40), "_dropVoucherForTaskWithIdentifier:", *(_QWORD *)(a1 + 48));
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "count"))
      +[CPLTransaction endTransactionWithIdentifier:](CPLTransaction, "endTransactionWithIdentifier:", CFSTR("cpl.activeresourcedownloads"));

    v9 = v15;
LABEL_16:

    goto LABEL_17;
  }
  if (*(_QWORD *)(v5 + 120))
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(*(SEL *)(a1 + 64));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 138412546;
        v21 = v11;
        v22 = 2112;
        v23 = v12;
        _os_log_impl(&dword_1B03C2000, v10, OS_LOG_TYPE_DEBUG, "Keeping %@ invocation for %@", buf, 0x16u);

      }
      v5 = *(_QWORD *)(a1 + 40);
    }
    objc_msgSend(*(id *)(v5 + 112), "objectForKey:", *(_QWORD *)(a1 + 48));
    v9 = (CPLProxyLibraryManagerOutstandingInvocation *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      v9 = objc_alloc_init(CPLProxyLibraryManagerOutstandingInvocation);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 112), "setObject:forKey:", v9, *(_QWORD *)(a1 + 48));
    }
    -[CPLProxyLibraryManagerOutstandingInvocation setDidFinish:](v9, "setDidFinish:", 1);
    -[CPLProxyLibraryManagerOutstandingInvocation setFinalError:](v9, "setFinalError:", v2);
    -[CPLProxyLibraryManagerOutstandingInvocation setFinalResource:](v9, "setFinalResource:", *(_QWORD *)(a1 + 56));
    goto LABEL_16;
  }
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v9 = (CPLProxyLibraryManagerOutstandingInvocation *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_ERROR))
    {
      v13 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 138412290;
      v21 = v13;
      _os_log_impl(&dword_1B03C2000, &v9->super, OS_LOG_TYPE_ERROR, "Ignoring unknown task with identifier %@", buf, 0xCu);
    }
    goto LABEL_16;
  }
LABEL_17:

}

void __91__CPLProxyLibraryManager_downloadDidFinishForResourceTransferTask_finalResource_withError___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      v3 = *(_QWORD *)(a1 + 32);
      v4 = *(_QWORD *)(a1 + 40);
      v5 = *(_QWORD *)(a1 + 48);
      v6 = *(_QWORD *)(a1 + 56);
      v14 = 138413058;
      v15 = v3;
      v16 = 2112;
      v17 = v4;
      v18 = 2112;
      v19 = v5;
      v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEBUG, "Download did finish for %@ with task identifier %@. Final resource: %@ / Error: %@", (uint8_t *)&v14, 0x2Au);
    }

  }
  objc_msgSend(*(id *)(a1 + 64), "abstractObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resourceProgressDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(void **)(a1 + 32);
  v10 = *(void **)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 56);
  v12 = v10;
  v13 = v9;
  objc_msgSend(v8, "libraryManager:downloadDidFinishForResourceTransferTask:finalResource:withError:", v7, v13, v12, v11);

}

- (void)inMemoryDownloadDidFinishForResourceTransferTask:(id)a3 data:(id)a4 withError:(id)a5
{
  id v9;
  id v10;
  id v11;
  OS_dispatch_queue *queue;
  uint64_t v13;
  _QWORD *v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  dispatch_block_t v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  SEL v24;
  _QWORD block[4];
  id v26;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  queue = self->_queue;
  v13 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __90__CPLProxyLibraryManager_inMemoryDownloadDidFinishForResourceTransferTask_data_withError___block_invoke;
  v20[3] = &unk_1E60D6F60;
  v20[4] = self;
  v21 = v11;
  v22 = v9;
  v23 = v10;
  v24 = a2;
  v14 = v20;
  block[0] = v13;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60D71F8;
  v26 = v14;
  v15 = queue;
  v16 = v10;
  v17 = v9;
  v18 = v11;
  v19 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v15, v19);

}

void __90__CPLProxyLibraryManager_inMemoryDownloadDidFinishForResourceTransferTask_data_withError___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __90__CPLProxyLibraryManager_inMemoryDownloadDidFinishForResourceTransferTask_data_withError___block_invoke_2;
  v7[3] = &unk_1E60D6F60;
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v9 = v4;
  v10 = *(id *)(a1 + 48);
  v5 = *(id *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 64);
  v11 = v5;
  v12 = v6;
  objc_msgSend(v2, "_dispatchBlockWhenOpen:", v7);

}

void __90__CPLProxyLibraryManager_inMemoryDownloadDidFinishForResourceTransferTask_data_withError___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  CPLProxyLibraryManagerOutstandingInvocation *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  CPLProxyLibraryManagerOutstandingInvocation *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "cplReinflatedErrorForXPC");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "objectForKey:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = *(_QWORD **)(a1 + 40);
  if (v3)
  {
    v6 = *(_QWORD *)(a1 + 48);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __90__CPLProxyLibraryManager_inMemoryDownloadDidFinishForResourceTransferTask_data_withError___block_invoke_3;
    v14[3] = &unk_1E60D6F38;
    v15 = v3;
    v16 = *(id *)(a1 + 48);
    v17 = *(id *)(a1 + 56);
    v7 = v2;
    v8 = *(_QWORD *)(a1 + 40);
    v18 = v7;
    v19 = v8;
    objc_msgSend(v5, "_withVoucherForTaskWithIdentifier:do:", v6, v14);
    objc_msgSend(*(id *)(a1 + 40), "_dropVoucherForTaskWithIdentifier:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "removeObjectForKey:", *(_QWORD *)(a1 + 48));

    v9 = v15;
LABEL_12:

    goto LABEL_13;
  }
  if (v5[15])
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(*(SEL *)(a1 + 64));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 138412546;
        v21 = v11;
        v22 = 2112;
        v23 = v12;
        _os_log_impl(&dword_1B03C2000, v10, OS_LOG_TYPE_DEBUG, "Keeping %@ invocation for %@", buf, 0x16u);

      }
    }
    v9 = objc_alloc_init(CPLProxyLibraryManagerOutstandingInvocation);
    -[CPLProxyLibraryManagerOutstandingInvocation setInMemoryRequest:](v9, "setInMemoryRequest:", 1);
    -[CPLProxyLibraryManagerOutstandingInvocation setDidFinish:](v9, "setDidFinish:", 1);
    -[CPLProxyLibraryManagerOutstandingInvocation setFinalError:](v9, "setFinalError:", v2);
    -[CPLProxyLibraryManagerOutstandingInvocation setFinalData:](v9, "setFinalData:", *(_QWORD *)(a1 + 56));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 112), "setObject:forKey:", v9, *(_QWORD *)(a1 + 48));
    goto LABEL_12;
  }
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v9 = (CPLProxyLibraryManagerOutstandingInvocation *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_ERROR))
    {
      v13 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 138412290;
      v21 = v13;
      _os_log_impl(&dword_1B03C2000, &v9->super, OS_LOG_TYPE_ERROR, "Ignoring unknown task with identifier %@", buf, 0xCu);
    }
    goto LABEL_12;
  }
LABEL_13:

}

void __90__CPLProxyLibraryManager_inMemoryDownloadDidFinishForResourceTransferTask_data_withError___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      v3 = *(_QWORD *)(a1 + 32);
      v4 = *(_QWORD *)(a1 + 40);
      v5 = objc_msgSend(*(id *)(a1 + 48), "length");
      v6 = *(_QWORD *)(a1 + 56);
      v9 = 138413058;
      v10 = v3;
      v11 = 2112;
      v12 = v4;
      v13 = 2048;
      v14 = v5;
      v15 = 2112;
      v16 = v6;
      _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEBUG, "In-memory download did finish for %@ with task identifier %@. %lu bytes / Error: %@", (uint8_t *)&v9, 0x2Au);
    }

  }
  objc_msgSend(*(id *)(a1 + 64), "abstractObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resourceProgressDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "libraryManager:inMemoryDownloadDidFinishForResourceTransferTask:data:withError:", v7, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (void)backgroundDownloadDidFinishForResource:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  uint64_t v6;
  _QWORD *v7;
  NSObject *v8;
  id v9;
  dispatch_block_t v10;
  _QWORD v11[5];
  id v12;
  _QWORD block[4];
  id v14;

  v4 = a3;
  queue = self->_queue;
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __65__CPLProxyLibraryManager_backgroundDownloadDidFinishForResource___block_invoke;
  v11[3] = &unk_1E60D6F88;
  v11[4] = self;
  v12 = v4;
  v7 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60D71F8;
  v14 = v7;
  v8 = queue;
  v9 = v4;
  v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);

}

void __65__CPLProxyLibraryManager_backgroundDownloadDidFinishForResource___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __65__CPLProxyLibraryManager_backgroundDownloadDidFinishForResource___block_invoke_2;
  v2[3] = &unk_1E60D6F88;
  v1 = *(void **)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = v1;
  objc_msgSend(v3, "_dispatchBlockWhenOpen:", v2);

}

void __65__CPLProxyLibraryManager_backgroundDownloadDidFinishForResource___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "abstractObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v4 = *(_QWORD *)(a1 + 40);
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_1B03C2000, v3, OS_LOG_TYPE_DEBUG, "Background download for %@ did finish", (uint8_t *)&v6, 0xCu);
    }

  }
  objc_msgSend(v2, "resourceProgressDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "libraryManager:backgroundDownloadDidFinishForResource:", v2, *(_QWORD *)(a1 + 40));

}

- (void)backgroundDownloadDidFailForResource:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  uint64_t v6;
  _QWORD *v7;
  NSObject *v8;
  id v9;
  dispatch_block_t v10;
  _QWORD v11[5];
  id v12;
  _QWORD block[4];
  id v14;

  v4 = a3;
  queue = self->_queue;
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __63__CPLProxyLibraryManager_backgroundDownloadDidFailForResource___block_invoke;
  v11[3] = &unk_1E60D6F88;
  v11[4] = self;
  v12 = v4;
  v7 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60D71F8;
  v14 = v7;
  v8 = queue;
  v9 = v4;
  v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);

}

void __63__CPLProxyLibraryManager_backgroundDownloadDidFailForResource___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __63__CPLProxyLibraryManager_backgroundDownloadDidFailForResource___block_invoke_2;
  v2[3] = &unk_1E60D6F88;
  v1 = *(void **)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = v1;
  objc_msgSend(v3, "_dispatchBlockWhenOpen:", v2);

}

void __63__CPLProxyLibraryManager_backgroundDownloadDidFailForResource___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "abstractObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v4 = *(_QWORD *)(a1 + 40);
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_1B03C2000, v3, OS_LOG_TYPE_DEBUG, "Background download for %@ did finish", (uint8_t *)&v6, 0xCu);
    }

  }
  objc_msgSend(v2, "resourceProgressDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "libraryManager:backgroundDownloadDidFailForResource:", v2, *(_QWORD *)(a1 + 40));

}

- (id)_uploadTaskDidStartForResource:(id)a3 withTaskIdentifier:(id)a4
{
  id v6;
  id v7;
  CPLProxyResourceTransferTask *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  -[NSMutableDictionary objectForKey:](self->_uploadTasks, "objectForKey:", v7);
  v8 = (CPLProxyResourceTransferTask *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v8 = -[CPLResourceTransferTask initWithResource:taskIdentifier:]([CPLProxyResourceTransferTask alloc], "initWithResource:taskIdentifier:", v6, v7);
    -[CPLProxyResourceTransferTask setProxyLibraryManager:](v8, "setProxyLibraryManager:", self);
    -[NSMutableDictionary setObject:forKey:](self->_uploadTasks, "setObject:forKey:", v8, v7);
    -[CPLPlatformObject abstractObject](self, "abstractObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "resourceProgressDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "libraryManager:uploadDidStartForResourceTransferTask:", v9, v8);

  }
  return v8;
}

- (void)uploadDidStartForResource:(id)a3 withResourceTransferTask:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *queue;
  uint64_t v9;
  _QWORD *v10;
  NSObject *v11;
  id v12;
  id v13;
  dispatch_block_t v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD block[4];
  id v19;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __77__CPLProxyLibraryManager_uploadDidStartForResource_withResourceTransferTask___block_invoke;
  v15[3] = &unk_1E60D6EC0;
  v15[4] = self;
  v16 = v6;
  v17 = v7;
  v10 = v15;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60D71F8;
  v19 = v10;
  v11 = queue;
  v12 = v7;
  v13 = v6;
  v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v11, v14);

}

void __77__CPLProxyLibraryManager_uploadDidStartForResource_withResourceTransferTask___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  uint64_t v8;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __77__CPLProxyLibraryManager_uploadDidStartForResource_withResourceTransferTask___block_invoke_2;
  v5[3] = &unk_1E60D6EC0;
  v2 = *(void **)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v3 = *(id *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  objc_msgSend(v2, "_dispatchBlockWhenOpen:", v5);

}

id __77__CPLProxyLibraryManager_uploadDidStartForResource_withResourceTransferTask___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      v3 = *(_QWORD *)(a1 + 32);
      v4 = *(_QWORD *)(a1 + 40);
      v6 = 138412546;
      v7 = v3;
      v8 = 2112;
      v9 = v4;
      _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEBUG, "Upload task for %@ did start with identifier %@", (uint8_t *)&v6, 0x16u);
    }

  }
  return (id)objc_msgSend(*(id *)(a1 + 48), "_uploadTaskDidStartForResource:withTaskIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)uploadOfResource:(id)a3 didProgress:(float)a4 forResourceTransferTask:(id)a5
{
  id v8;
  id v9;
  OS_dispatch_queue *queue;
  uint64_t v11;
  _QWORD *v12;
  NSObject *v13;
  id v14;
  id v15;
  dispatch_block_t v16;
  _QWORD v17[5];
  id v18;
  id v19;
  float v20;
  _QWORD block[4];
  id v22;

  v8 = a3;
  v9 = a5;
  queue = self->_queue;
  v11 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __79__CPLProxyLibraryManager_uploadOfResource_didProgress_forResourceTransferTask___block_invoke;
  v17[3] = &unk_1E60D6EE8;
  v17[4] = self;
  v18 = v8;
  v19 = v9;
  v20 = a4;
  v12 = v17;
  block[0] = v11;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60D71F8;
  v22 = v12;
  v13 = queue;
  v14 = v9;
  v15 = v8;
  v16 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v13, v16);

}

void __79__CPLProxyLibraryManager_uploadOfResource_didProgress_forResourceTransferTask___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  uint64_t v8;
  int v9;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __79__CPLProxyLibraryManager_uploadOfResource_didProgress_forResourceTransferTask___block_invoke_2;
  v5[3] = &unk_1E60D6EE8;
  v2 = *(void **)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v3 = *(id *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v9 = *(_DWORD *)(a1 + 56);
  objc_msgSend(v2, "_dispatchBlockWhenOpen:", v5);

}

void __79__CPLProxyLibraryManager_uploadOfResource_didProgress_forResourceTransferTask___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      v3 = *(_QWORD *)(a1 + 32);
      v4 = *(_QWORD *)(a1 + 40);
      v9 = 138412546;
      v10 = v3;
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEBUG, "Upload task for %@ with identifier %@ did progress", (uint8_t *)&v9, 0x16u);
    }

  }
  objc_msgSend(*(id *)(a1 + 48), "_uploadTaskDidStartForResource:withTaskIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "abstractObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resourceProgressDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    LODWORD(v8) = *(_DWORD *)(a1 + 56);
    objc_msgSend(v7, "libraryManager:uploadDidProgress:forResourceTransferTask:", v6, v5, v8);
  }

}

- (void)uploadOfResource:(id)a3 didFinishForResourceTransferTask:(id)a4 withError:(id)a5
{
  id v8;
  id v9;
  id v10;
  OS_dispatch_queue *queue;
  uint64_t v12;
  _QWORD *v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  dispatch_block_t v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  _QWORD block[4];
  id v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v12 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __86__CPLProxyLibraryManager_uploadOfResource_didFinishForResourceTransferTask_withError___block_invoke;
  v19[3] = &unk_1E60D6FB0;
  v19[4] = self;
  v20 = v10;
  v21 = v8;
  v22 = v9;
  v13 = v19;
  block[0] = v12;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60D71F8;
  v24 = v13;
  v14 = queue;
  v15 = v9;
  v16 = v8;
  v17 = v10;
  v18 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v14, v18);

}

void __86__CPLProxyLibraryManager_uploadOfResource_didFinishForResourceTransferTask_withError___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  uint64_t v9;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __86__CPLProxyLibraryManager_uploadOfResource_didFinishForResourceTransferTask_withError___block_invoke_2;
  v5[3] = &unk_1E60D6FB0;
  v2 = *(void **)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  v3 = *(id *)(a1 + 56);
  v4 = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v9 = v4;
  objc_msgSend(v2, "_dispatchBlockWhenOpen:", v5);

}

void __86__CPLProxyLibraryManager_uploadOfResource_didFinishForResourceTransferTask_withError___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "cplReinflatedErrorForXPC");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v4 = *(_QWORD *)(a1 + 40);
      v5 = *(_QWORD *)(a1 + 48);
      v9 = 138412802;
      v10 = v4;
      v11 = 2112;
      v12 = v5;
      v13 = 2112;
      v14 = v2;
      _os_log_impl(&dword_1B03C2000, v3, OS_LOG_TYPE_DEBUG, "Upload task for %@ with identifier %@ did finish with error %@", (uint8_t *)&v9, 0x20u);
    }

  }
  objc_msgSend(*(id *)(a1 + 56), "_uploadTaskDidStartForResource:withTaskIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "abstractObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resourceProgressDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "libraryManager:uploadDidFinishForResourceTransferTask:withError:", v7, v6, v2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 48), "removeObjectForKey:", *(_QWORD *)(a1 + 48));

}

- (void)libraryManagerHasChangesToPull
{
  OS_dispatch_queue *queue;
  uint64_t v3;
  _QWORD *v4;
  NSObject *v5;
  dispatch_block_t v6;
  _QWORD v7[5];
  _QWORD block[4];
  id v9;

  queue = self->_queue;
  v3 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__CPLProxyLibraryManager_libraryManagerHasChangesToPull__block_invoke;
  v7[3] = &unk_1E60D65B8;
  v7[4] = self;
  v4 = v7;
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60D71F8;
  v9 = v4;
  v5 = queue;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);

}

uint64_t __56__CPLProxyLibraryManager_libraryManagerHasChangesToPull__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __56__CPLProxyLibraryManager_libraryManagerHasChangesToPull__block_invoke_2;
  v3[3] = &unk_1E60D65B8;
  v3[4] = v1;
  return objc_msgSend(v1, "_dispatchBlockWhenOpen:", v3);
}

void __56__CPLProxyLibraryManager_libraryManagerHasChangesToPull__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint8_t v5[16];

  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEBUG, "Notified that library manager has changes to pull", v5, 2u);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "abstractObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "libraryManagerHasChangesToPull:", v3);

}

- (void)libraryManagerDidUpdateStatusWithProperties:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  uint64_t v6;
  _QWORD *v7;
  NSObject *v8;
  id v9;
  dispatch_block_t v10;
  _QWORD v11[5];
  id v12;
  _QWORD block[4];
  id v14;

  v4 = a3;
  queue = self->_queue;
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __70__CPLProxyLibraryManager_libraryManagerDidUpdateStatusWithProperties___block_invoke;
  v11[3] = &unk_1E60D6F88;
  v11[4] = self;
  v12 = v4;
  v7 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60D71F8;
  v14 = v7;
  v8 = queue;
  v9 = v4;
  v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);

}

void __70__CPLProxyLibraryManager_libraryManagerDidUpdateStatusWithProperties___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __70__CPLProxyLibraryManager_libraryManagerDidUpdateStatusWithProperties___block_invoke_2;
  v5[3] = &unk_1E60D6F88;
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v7 = v4;
  objc_msgSend(v2, "_dispatchBlockWhenOpen:", v5);

}

void __70__CPLProxyLibraryManager_libraryManagerDidUpdateStatusWithProperties___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      v3 = *(_QWORD *)(a1 + 32);
      v6 = 138412290;
      v7 = v3;
      _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEBUG, "Notified that library manager has changes status: %@", (uint8_t *)&v6, 0xCu);
    }

  }
  if (objc_msgSend(*(id *)(a1 + 40), "_setStatusFromDictionary:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(*(id *)(a1 + 40), "abstractObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "libraryManagerStatusDidChange:", v4);

  }
}

- (void)libraryManagerDidUpdateSizeOfResourcesToUploadToSize:(unint64_t)a3 sizeOfOriginalResourcesToUpload:(unint64_t)a4 numberOfImages:(unint64_t)a5 numberOfVideos:(unint64_t)a6 numberOfOtherItems:(unint64_t)a7
{
  OS_dispatch_queue *queue;
  uint64_t v8;
  _QWORD *v9;
  NSObject *v10;
  dispatch_block_t v11;
  _QWORD v12[10];
  _QWORD block[4];
  id v14;

  queue = self->_queue;
  v8 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __160__CPLProxyLibraryManager_libraryManagerDidUpdateSizeOfResourcesToUploadToSize_sizeOfOriginalResourcesToUpload_numberOfImages_numberOfVideos_numberOfOtherItems___block_invoke;
  v12[3] = &unk_1E60D6FD8;
  v12[4] = self;
  v12[5] = a3;
  v12[6] = a4;
  v12[7] = a5;
  v12[8] = a6;
  v12[9] = a7;
  v9 = v12;
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60D71F8;
  v14 = v9;
  v10 = queue;
  v11 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v10, v11);

}

uint64_t __160__CPLProxyLibraryManager_libraryManagerDidUpdateSizeOfResourcesToUploadToSize_sizeOfOriginalResourcesToUpload_numberOfImages_numberOfVideos_numberOfOtherItems___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];
  __int128 v4;
  __int128 v5;
  uint64_t v6;

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __160__CPLProxyLibraryManager_libraryManagerDidUpdateSizeOfResourcesToUploadToSize_sizeOfOriginalResourcesToUpload_numberOfImages_numberOfVideos_numberOfOtherItems___block_invoke_2;
  v3[3] = &unk_1E60D6FD8;
  v3[4] = v1;
  v4 = *(_OWORD *)(a1 + 40);
  v5 = *(_OWORD *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 72);
  return objc_msgSend(v1, "_dispatchBlockWhenOpen:", v3);
}

void __160__CPLProxyLibraryManager_libraryManagerDidUpdateSizeOfResourcesToUploadToSize_sizeOfOriginalResourcesToUpload_numberOfImages_numberOfVideos_numberOfOtherItems___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      v3 = *(_QWORD *)(a1 + 40);
      v5 = 134217984;
      v6 = v3;
      _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEBUG, "Notified that library manager has changed size of resources to upload to %llu", (uint8_t *)&v5, 0xCu);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "abstractObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setSizeOfResourcesToUpload:sizeOfOriginalResourcesToUpload:numberOfImages:numberOfVideos:numberOfOtherItems:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));

}

- (void)libraryManagerHasStatusChanges
{
  OS_dispatch_queue *queue;
  uint64_t v3;
  _QWORD *v4;
  NSObject *v5;
  dispatch_block_t v6;
  _QWORD v7[5];
  _QWORD block[4];
  id v9;

  queue = self->_queue;
  v3 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__CPLProxyLibraryManager_libraryManagerHasStatusChanges__block_invoke;
  v7[3] = &unk_1E60D65B8;
  v7[4] = self;
  v4 = v7;
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60D71F8;
  v9 = v4;
  v5 = queue;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);

}

uint64_t __56__CPLProxyLibraryManager_libraryManagerHasStatusChanges__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __56__CPLProxyLibraryManager_libraryManagerHasStatusChanges__block_invoke_2;
  v3[3] = &unk_1E60D65B8;
  v3[4] = v1;
  return objc_msgSend(v1, "_dispatchBlockWhenOpen:", v3);
}

void __56__CPLProxyLibraryManager_libraryManagerHasStatusChanges__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint8_t v5[16];

  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEBUG, "Notified that library manager has status changes", v5, 2u);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "abstractObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "libraryManagerHasStatusChanges:", v3);

}

- (void)forceSyncDidFinishForTask:(id)a3 withErrors:(id)a4
{
  id v7;
  id v8;
  OS_dispatch_queue *queue;
  uint64_t v10;
  _QWORD *v11;
  NSObject *v12;
  id v13;
  id v14;
  dispatch_block_t v15;
  _QWORD v16[5];
  id v17;
  id v18;
  SEL v19;
  _QWORD block[4];
  id v21;

  v7 = a3;
  v8 = a4;
  queue = self->_queue;
  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __63__CPLProxyLibraryManager_forceSyncDidFinishForTask_withErrors___block_invoke;
  v16[3] = &unk_1E60D7028;
  v16[4] = self;
  v17 = v8;
  v18 = v7;
  v19 = a2;
  v11 = v16;
  block[0] = v10;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60D71F8;
  v21 = v11;
  v12 = queue;
  v13 = v7;
  v14 = v8;
  v15 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v12, v15);

}

void __63__CPLProxyLibraryManager_forceSyncDidFinishForTask_withErrors___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__CPLProxyLibraryManager_forceSyncDidFinishForTask_withErrors___block_invoke_2;
  v7[3] = &unk_1E60D7028;
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v9 = v4;
  v5 = *(id *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 56);
  v10 = v5;
  v11 = v6;
  objc_msgSend(v2, "_dispatchBlockWhenOpen:", v7);

}

void __63__CPLProxyLibraryManager_forceSyncDidFinishForTask_withErrors___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  CPLProxyLibraryManagerSyncOutstandingInvocation *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[4];
  CPLProxyLibraryManagerSyncOutstandingInvocation *v18;
  id v19;
  id v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = *(void **)(a1 + 32);
  v4 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __63__CPLProxyLibraryManager_forceSyncDidFinishForTask_withErrors___block_invoke_3;
  v22[3] = &unk_1E60D7000;
  v5 = v2;
  v23 = v5;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v22);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    v9 = *(_QWORD *)(a1 + 48);
    v17[0] = v4;
    v17[1] = 3221225472;
    v17[2] = __63__CPLProxyLibraryManager_forceSyncDidFinishForTask_withErrors___block_invoke_4;
    v17[3] = &unk_1E60D6FB0;
    v18 = v6;
    v19 = *(id *)(a1 + 48);
    v10 = v5;
    v11 = *(_QWORD *)(a1 + 40);
    v20 = v10;
    v21 = v11;
    objc_msgSend((id)v8, "_withVoucherForTaskWithIdentifier:do:", v9, v17);
    objc_msgSend(*(id *)(a1 + 40), "_dropVoucherForTaskWithIdentifier:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "removeObjectForKey:", *(_QWORD *)(a1 + 48));

    v12 = v18;
LABEL_14:

    goto LABEL_15;
  }
  if (*(_QWORD *)(v8 + 136))
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(*(SEL *)(a1 + 56));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 138412546;
        v25 = v14;
        v26 = 2112;
        v27 = v15;
        _os_log_impl(&dword_1B03C2000, v13, OS_LOG_TYPE_DEBUG, "Keeping %@ invocation for %@", buf, 0x16u);

      }
      v8 = *(_QWORD *)(a1 + 40);
    }
    objc_msgSend(*(id *)(v8 + 128), "objectForKey:", *(_QWORD *)(a1 + 48));
    v12 = (CPLProxyLibraryManagerSyncOutstandingInvocation *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      v12 = objc_alloc_init(CPLProxyLibraryManagerSyncOutstandingInvocation);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 128), "setObject:forKey:", v12, *(_QWORD *)(a1 + 48));
    }
    -[CPLProxyLibraryManagerSyncOutstandingInvocation setDidFinish:](v12, "setDidFinish:", 1);
    -[CPLProxyLibraryManagerSyncOutstandingInvocation setErrors:](v12, "setErrors:", v5);
    goto LABEL_14;
  }
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v12 = (CPLProxyLibraryManagerSyncOutstandingInvocation *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v12->super, OS_LOG_TYPE_ERROR))
    {
      v16 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 138412290;
      v25 = v16;
      _os_log_impl(&dword_1B03C2000, &v12->super, OS_LOG_TYPE_ERROR, "Ignoring unknown task with identifier %@", buf, 0xCu);
    }
    goto LABEL_14;
  }
LABEL_15:

}

void __63__CPLProxyLibraryManager_forceSyncDidFinishForTask_withErrors___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  objc_msgSend(a3, "cplReinflatedErrorForXPC");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);

}

void __63__CPLProxyLibraryManager_forceSyncDidFinishForTask_withErrors___block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      v3 = *(_QWORD *)(a1 + 32);
      v4 = *(_QWORD *)(a1 + 40);
      v5 = *(_QWORD *)(a1 + 48);
      v8 = 138412802;
      v9 = v3;
      v10 = 2112;
      v11 = v4;
      v12 = 2112;
      v13 = v5;
      _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEBUG, "Sync task did finish for %@ with task identifier %@. Errors: %@", (uint8_t *)&v8, 0x20u);
    }

  }
  objc_msgSend(*(id *)(a1 + 56), "abstractObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "forceSyncDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "libraryManager:didFinishForceSyncTask:withErrors:", v6, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

}

- (void)provideLocalResource:(id)a3 recordClassString:(id)a4 completionHandler:(id)a5
{
  id v8;
  NSString *v9;
  id v10;
  Class v11;
  Class v12;
  OS_dispatch_queue *queue;
  uint64_t v14;
  _QWORD *v15;
  NSObject *v16;
  dispatch_block_t v17;
  NSObject *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  Class v22;
  _BYTE block[24];
  void *v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (NSString *)a4;
  v10 = a5;
  v11 = NSClassFromString(v9);
  if (v11 && (v12 = v11, (-[objc_class isSubclassOfClass:](v11, "isSubclassOfClass:", objc_opt_class()) & 1) != 0))
  {
    queue = self->_queue;
    v14 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __83__CPLProxyLibraryManager_provideLocalResource_recordClassString_completionHandler___block_invoke;
    v19[3] = &unk_1E60D7050;
    v19[4] = self;
    v20 = v8;
    v22 = v12;
    v21 = v10;
    v15 = v19;
    *(_QWORD *)block = v14;
    *(_QWORD *)&block[8] = 3221225472;
    *(_QWORD *)&block[16] = __cpl_dispatch_async_block_invoke;
    v24 = &unk_1E60D71F8;
    v25 = v15;
    v16 = queue;
    v17 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    dispatch_async(v16, v17);

  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)block = 138412546;
        *(_QWORD *)&block[4] = v8;
        *(_WORD *)&block[12] = 2112;
        *(_QWORD *)&block[14] = v9;
        _os_log_impl(&dword_1B03C2000, v18, OS_LOG_TYPE_ERROR, "Received a request for (local) %@ with an invalid class name %@", block, 0x16u);
      }

    }
    (*((void (**)(id, _QWORD, uint64_t))v10 + 2))(v10, 0, 2);
  }

}

void __83__CPLProxyLibraryManager_provideLocalResource_recordClassString_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  __int128 v4;
  _QWORD v5[4];
  id v6;
  id v7;
  __int128 v8;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __83__CPLProxyLibraryManager_provideLocalResource_recordClassString_completionHandler___block_invoke_2;
  v5[3] = &unk_1E60D7050;
  v2 = *(void **)(a1 + 40);
  v6 = *(id *)(a1 + 32);
  v7 = v2;
  v4 = *(_OWORD *)(a1 + 48);
  v3 = (id)v4;
  v8 = v4;
  objc_msgSend(v6, "_dispatchBlockWhenOpen:", v5);

}

void __83__CPLProxyLibraryManager_provideLocalResource_recordClassString_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "abstractObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v8) = 0;
        v7 = "Library manager has no delegate and so can't help recovering resources yet";
LABEL_14:
        _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_ERROR, v7, (uint8_t *)&v8, 2u);
      }
LABEL_15:

    }
LABEL_16:
    (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48));
    goto LABEL_17;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v8) = 0;
        v7 = "Delegate does not support recovering resources yet";
        goto LABEL_14;
      }
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 40);
      v8 = 138412290;
      v9 = v5;
      _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_DEFAULT, "Asking delegate to provide (local) %@", (uint8_t *)&v8, 0xCu);
    }

  }
  objc_msgSend(v3, "libraryManager:provideLocalResource:recordClass:completionHandler:", v2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
LABEL_17:

}

- (void)pushAllChangesWithCompletionHandler:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  uint64_t v6;
  _QWORD *v7;
  NSObject *v8;
  id v9;
  dispatch_block_t v10;
  _QWORD v11[5];
  id v12;
  _QWORD block[4];
  id v14;

  v4 = a3;
  queue = self->_queue;
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62__CPLProxyLibraryManager_pushAllChangesWithCompletionHandler___block_invoke;
  v11[3] = &unk_1E60D6708;
  v11[4] = self;
  v12 = v4;
  v7 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60D71F8;
  v14 = v7;
  v8 = queue;
  v9 = v4;
  v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);

}

void __62__CPLProxyLibraryManager_pushAllChangesWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __62__CPLProxyLibraryManager_pushAllChangesWithCompletionHandler___block_invoke_2;
  v2[3] = &unk_1E60D6708;
  v1 = *(void **)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = v1;
  objc_msgSend(v3, "_dispatchBlockWhenOpen:", v2);

}

void __62__CPLProxyLibraryManager_pushAllChangesWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint8_t v11[2];
  uint8_t buf[16];

  objc_msgSend(*(id *)(a1 + 32), "abstractObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v10) = 0;
        v6 = "Library manager has no delegate and so can't help pushing all changes yet";
        v7 = (uint8_t *)&v10;
LABEL_14:
        _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_ERROR, v6, v7, 2u);
      }
LABEL_15:

    }
LABEL_16:
    v8 = *(_QWORD *)(a1 + 40);
    +[CPLErrors notImplementedError](CPLErrors, "notImplementedError", v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);

    goto LABEL_17;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v11 = 0;
        v6 = "Delegate does not support pushing all changes yet";
        v7 = v11;
        goto LABEL_14;
      }
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_DEFAULT, "Asking delegate to push all changes", buf, 2u);
    }

  }
  objc_msgSend(v3, "libraryManager:pushAllChangesWithCompletionHandler:", v2, *(_QWORD *)(a1 + 40));
LABEL_17:

}

- (void)providePayloadForComputeStates:(id)a3 inFolderWithURL:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  OS_dispatch_queue *queue;
  _QWORD *v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  dispatch_block_t v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  _QWORD block[4];
  id v33;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __91__CPLProxyLibraryManager_providePayloadForComputeStates_inFolderWithURL_completionHandler___block_invoke;
  v29[3] = &unk_1E60D7078;
  v13 = v11;
  v30 = v13;
  v31 = v10;
  v14 = v10;
  v15 = (void *)MEMORY[0x1B5E08DC4](v29);
  queue = self->_queue;
  v24[0] = v12;
  v24[1] = 3221225472;
  v24[2] = __91__CPLProxyLibraryManager_providePayloadForComputeStates_inFolderWithURL_completionHandler___block_invoke_2;
  v24[3] = &unk_1E60D70A0;
  v24[4] = self;
  v25 = v13;
  v26 = v8;
  v27 = v9;
  v28 = v15;
  v17 = v24;
  block[0] = v12;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60D71F8;
  v33 = v17;
  v18 = queue;
  v19 = v15;
  v20 = v9;
  v21 = v8;
  v22 = v13;
  v23 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v18, v23);

}

void __91__CPLProxyLibraryManager_providePayloadForComputeStates_inFolderWithURL_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  int v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
  objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
  v7 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, void *))(v7 + 16))(v7, v9, v8);

  }
  else
  {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v9, v5);
  }

}

void __91__CPLProxyLibraryManager_providePayloadForComputeStates_inFolderWithURL_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __91__CPLProxyLibraryManager_providePayloadForComputeStates_inFolderWithURL_completionHandler___block_invoke_3;
  v3[3] = &unk_1E60D70A0;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  v8 = *(id *)(a1 + 64);
  objc_msgSend(v4, "_dispatchBlockWhenOpen:", v3);

}

void __91__CPLProxyLibraryManager_providePayloadForComputeStates_inFolderWithURL_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint8_t v9[8];
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  objc_msgSend(*(id *)(a1 + 32), "abstractObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recordComputeStateDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = *(void **)(a1 + 40);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __91__CPLProxyLibraryManager_providePayloadForComputeStates_inFolderWithURL_completionHandler___block_invoke_4;
    v10[3] = &unk_1E60D70A0;
    v11 = v3;
    v12 = v2;
    v13 = *(id *)(a1 + 48);
    v14 = *(id *)(a1 + 56);
    v15 = *(id *)(a1 + 64);
    objc_msgSend(v5, "performAsCurrentWithPendingUnitCount:usingBlock:", 1, v10);

  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_ERROR, "Library manager has no delegate and so can't help providing compute state payloads", v9, 2u);
      }

    }
    v7 = *(_QWORD *)(a1 + 64);
    +[CPLErrors notImplementedError](CPLErrors, "notImplementedError");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v8);

  }
}

uint64_t __91__CPLProxyLibraryManager_providePayloadForComputeStates_inFolderWithURL_completionHandler___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "libraryManager:providePayloadForComputeStates:inFolderWithURL:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (void)libraryManagerHasBeenReplaced
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  __int128 buf;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1B03C2000, v3, OS_LOG_TYPE_FAULT, "2 different library managers tried to connect to the daemon at the same time", (uint8_t *)&buf, 2u);
    }

    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        -[CPLPlatformObject abstractObject](self, "abstractObject");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v5;
        _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_ERROR, "%@ should have been disconnected (close or deactivate) from the daemon before an other connection could connect", (uint8_t *)&buf, 0xCu);

      }
      if (!_CPLSilentLogging)
      {
        __CPLManagerOSLogDomain();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_QWORD *)&buf = 0;
          *((_QWORD *)&buf + 1) = &buf;
          v11 = 0x3032000000;
          v12 = __Block_byref_object_copy_;
          v13 = __Block_byref_object_dispose_;
          v14 = 0;
          _connectedLibraryManagerRegisterQueue();
          v7 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = ___connectedLibraryManagers_block_invoke;
          block[3] = &unk_1E60D7240;
          block[4] = &buf;
          dispatch_sync(v7, block);

          v8 = *(id *)(*((_QWORD *)&buf + 1) + 40);
          _Block_object_dispose(&buf, 8);

          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v8;
          _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_ERROR, "All connected library managers from this process: %@", (uint8_t *)&buf, 0xCu);

        }
      }
    }
  }
  self->_killed = 1;
}

- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v5 = a5;
  v17 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v5)
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v8, "userInfo");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0CB3C70]);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138412290;
        v14 = v11;
        _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_DEBUG, "Connection is replying to %@", (uint8_t *)&v13, 0xCu);

      }
LABEL_8:

    }
  }
  else if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector((SEL)objc_msgSend(v8, "selector"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412546;
      v14 = v12;
      v15 = 2080;
      v16 = "";
      _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_DEBUG, "Connection will invoke %@%s", (uint8_t *)&v13, 0x16u);

    }
    goto LABEL_8;
  }
  objc_msgSend(v8, "invoke");

}

- (void)cancelTask:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  uint64_t v6;
  _QWORD *v7;
  NSObject *v8;
  id v9;
  dispatch_block_t v10;
  _QWORD v11[4];
  id v12;
  CPLProxyLibraryManager *v13;
  _QWORD block[4];
  id v15;

  v4 = a3;
  queue = self->_queue;
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __37__CPLProxyLibraryManager_cancelTask___block_invoke;
  v11[3] = &unk_1E60D6F88;
  v12 = v4;
  v13 = self;
  v7 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60D71F8;
  v15 = v7;
  v8 = queue;
  v9 = v4;
  v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);

}

void __37__CPLProxyLibraryManager_cancelTask___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[8];
  _QWORD v8[4];
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "taskIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __37__CPLProxyLibraryManager_cancelTask___block_invoke_2;
  v8[3] = &unk_1E60D6678;
  v3 = *(void **)(a1 + 40);
  v9 = *(id *)(a1 + 32);
  objc_msgSend(v3, "proxyWithErrorHandler:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "cancelTaskWithIdentifier:", v2);
  }
  else if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_ERROR, "Proxy has disappeared", v7, 2u);
    }

  }
}

void __37__CPLProxyLibraryManager_cancelTask___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  id v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = 138412802;
      v10 = v5;
      v11 = 2112;
      v12 = v8;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_ERROR, "%@ failed to cancel %@: %@", (uint8_t *)&v9, 0x20u);
    }

  }
}

- (void)cancelSyncTask:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  uint64_t v6;
  _QWORD *v7;
  NSObject *v8;
  id v9;
  dispatch_block_t v10;
  _QWORD v11[4];
  id v12;
  CPLProxyLibraryManager *v13;
  _QWORD block[4];
  id v15;

  v4 = a3;
  queue = self->_queue;
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __41__CPLProxyLibraryManager_cancelSyncTask___block_invoke;
  v11[3] = &unk_1E60D6F88;
  v12 = v4;
  v13 = self;
  v7 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60D71F8;
  v15 = v7;
  v8 = queue;
  v9 = v4;
  v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);

}

void __41__CPLProxyLibraryManager_cancelSyncTask___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[8];
  _QWORD v8[4];
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "taskIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __41__CPLProxyLibraryManager_cancelSyncTask___block_invoke_2;
  v8[3] = &unk_1E60D6678;
  v3 = *(void **)(a1 + 40);
  v9 = *(id *)(a1 + 32);
  objc_msgSend(v3, "proxyWithErrorHandler:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "cancelSyncTaskWithIdentifier:", v2);
  }
  else if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_ERROR, "Proxy has disappeared", v7, 2u);
    }

  }
}

void __41__CPLProxyLibraryManager_cancelSyncTask___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  id v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = 138412802;
      v10 = v5;
      v11 = 2112;
      v12 = v8;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_ERROR, "%@ failed to cancel %@: %@", (uint8_t *)&v9, 0x20u);
    }

  }
}

- (void)barrier
{
  dispatch_semaphore_t v3;
  OS_dispatch_queue *queue;
  uint64_t v5;
  _QWORD *v6;
  NSObject *v7;
  NSObject *v8;
  dispatch_block_t v9;
  _QWORD v10[5];
  dispatch_semaphore_t v11;
  _QWORD block[4];
  id v13;

  v3 = dispatch_semaphore_create(0);
  queue = self->_queue;
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __33__CPLProxyLibraryManager_barrier__block_invoke;
  v10[3] = &unk_1E60D6F88;
  v10[4] = self;
  v11 = v3;
  v6 = v10;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60D71F8;
  v13 = v6;
  v7 = queue;
  v8 = v3;
  v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);

  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
}

void __33__CPLProxyLibraryManager_barrier__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __33__CPLProxyLibraryManager_barrier__block_invoke_2;
    v3[3] = &unk_1E60D65B8;
    v4 = *(id *)(a1 + 40);
    objc_msgSend(v2, "addBarrierBlock:", v3);

  }
  else
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }

}

intptr_t __33__CPLProxyLibraryManager_barrier__block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)getResourcesForItemWithScopedIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *queue;
  uint64_t v9;
  _QWORD *v10;
  NSObject *v11;
  id v12;
  id v13;
  dispatch_block_t v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD block[4];
  id v19;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __84__CPLProxyLibraryManager_getResourcesForItemWithScopedIdentifier_completionHandler___block_invoke;
  v15[3] = &unk_1E60D70C8;
  v15[4] = self;
  v16 = v6;
  v17 = v7;
  v10 = v15;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60D71F8;
  v19 = v10;
  v11 = queue;
  v12 = v7;
  v13 = v6;
  v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v11, v14);

}

void __84__CPLProxyLibraryManager_getResourcesForItemWithScopedIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __84__CPLProxyLibraryManager_getResourcesForItemWithScopedIdentifier_completionHandler___block_invoke_2;
  v3[3] = &unk_1E60D70C8;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v4, "_dispatchBlockWhenOpen:", v3);

}

void __84__CPLProxyLibraryManager_getResourcesForItemWithScopedIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint8_t v8[16];
  _QWORD v9[4];
  id v10;
  id v11;

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __84__CPLProxyLibraryManager_getResourcesForItemWithScopedIdentifier_completionHandler___block_invoke_3;
  v9[3] = &unk_1E60D6D20;
  v2 = *(void **)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v11 = *(id *)(a1 + 48);
  objc_msgSend(v2, "proxyWithErrorHandler:", v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "getResourcesForItemWithScopedIdentifier:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_ERROR, "Proxy has disappeared", v8, 2u);
      }

    }
    v6 = *(_QWORD *)(a1 + 48);
    +[CPLErrors unknownError](CPLErrors, "unknownError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v6 + 16))(v6, v7, 0);

  }
}

void __84__CPLProxyLibraryManager_getResourcesForItemWithScopedIdentifier_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  id v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = 138412802;
      v10 = v5;
      v11 = 2112;
      v12 = v8;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_ERROR, "%@ failed to get resources for %@: %@", (uint8_t *)&v9, 0x20u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)compactFileCacheWithCompletionHandler:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  uint64_t v6;
  _QWORD *v7;
  NSObject *v8;
  id v9;
  dispatch_block_t v10;
  _QWORD v11[5];
  id v12;
  _QWORD block[4];
  id v14;

  v4 = a3;
  queue = self->_queue;
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __64__CPLProxyLibraryManager_compactFileCacheWithCompletionHandler___block_invoke;
  v11[3] = &unk_1E60D6708;
  v11[4] = self;
  v12 = v4;
  v7 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60D71F8;
  v14 = v7;
  v8 = queue;
  v9 = v4;
  v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);

}

void __64__CPLProxyLibraryManager_compactFileCacheWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __64__CPLProxyLibraryManager_compactFileCacheWithCompletionHandler___block_invoke_2;
  v2[3] = &unk_1E60D6708;
  v1 = *(void **)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = v1;
  objc_msgSend(v3, "_dispatchBlockWhenOpen:", v2);

}

void __64__CPLProxyLibraryManager_compactFileCacheWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint8_t v8[8];
  _QWORD v9[4];
  id v10;

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__CPLProxyLibraryManager_compactFileCacheWithCompletionHandler___block_invoke_3;
  v9[3] = &unk_1E60D67A8;
  v2 = *(void **)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  objc_msgSend(v2, "proxyWithErrorHandler:", v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "compactFileCacheWithCompletionHandler:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_ERROR, "Proxy has disappeared", v8, 2u);
      }

    }
    v6 = *(_QWORD *)(a1 + 40);
    +[CPLErrors unknownError](CPLErrors, "unknownError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

  }
}

void __64__CPLProxyLibraryManager_compactFileCacheWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412546;
      v9 = v5;
      v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_ERROR, "%@ failed to compact file cache: %@", (uint8_t *)&v8, 0x16u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)resetCacheWithOption:(unint64_t)a3 reason:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  OS_dispatch_queue *queue;
  uint64_t v11;
  _QWORD *v12;
  NSObject *v13;
  id v14;
  id v15;
  dispatch_block_t v16;
  _QWORD v17[5];
  id v18;
  id v19;
  unint64_t v20;
  _QWORD block[4];
  id v22;

  v8 = a4;
  v9 = a5;
  queue = self->_queue;
  v11 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __72__CPLProxyLibraryManager_resetCacheWithOption_reason_completionHandler___block_invoke;
  v17[3] = &unk_1E60D6C58;
  v19 = v9;
  v20 = a3;
  v17[4] = self;
  v18 = v8;
  v12 = v17;
  block[0] = v11;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60D71F8;
  v22 = v12;
  v13 = queue;
  v14 = v8;
  v15 = v9;
  v16 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v13, v16);

}

void __72__CPLProxyLibraryManager_resetCacheWithOption_reason_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;
  id v7;
  uint64_t v8;

  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __72__CPLProxyLibraryManager_resetCacheWithOption_reason_completionHandler___block_invoke_2;
  v5[3] = &unk_1E60D6C58;
  v5[4] = v2;
  v3 = *(id *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 56);
  v7 = v3;
  v8 = v4;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v2, "_dispatchBlockWhenOpen:", v5);

}

void __72__CPLProxyLibraryManager_resetCacheWithOption_reason_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint8_t v8[8];
  _QWORD v9[4];
  id v10;

  v2 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72__CPLProxyLibraryManager_resetCacheWithOption_reason_completionHandler___block_invoke_3;
  v9[3] = &unk_1E60D67A8;
  v10 = *(id *)(a1 + 48);
  objc_msgSend(v2, "proxyWithErrorHandler:", v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "resetCacheWithOption:reason:completionHandler:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_ERROR, "Proxy has disappeared", v8, 2u);
      }

    }
    v6 = *(_QWORD *)(a1 + 48);
    +[CPLErrors unknownError](CPLErrors, "unknownError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

  }
}

void __72__CPLProxyLibraryManager_resetCacheWithOption_reason_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412546;
      v9 = v5;
      v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_ERROR, "%@ failed to reset caches: %@", (uint8_t *)&v8, 0x16u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)getListOfComponentsWithCompletionHandler:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  uint64_t v6;
  _QWORD *v7;
  NSObject *v8;
  id v9;
  dispatch_block_t v10;
  _QWORD v11[5];
  id v12;
  _QWORD block[4];
  id v14;

  v4 = a3;
  queue = self->_queue;
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __67__CPLProxyLibraryManager_getListOfComponentsWithCompletionHandler___block_invoke;
  v11[3] = &unk_1E60D6708;
  v11[4] = self;
  v12 = v4;
  v7 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60D71F8;
  v14 = v7;
  v8 = queue;
  v9 = v4;
  v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);

}

void __67__CPLProxyLibraryManager_getListOfComponentsWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __67__CPLProxyLibraryManager_getListOfComponentsWithCompletionHandler___block_invoke_2;
  v2[3] = &unk_1E60D6708;
  v1 = *(void **)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = v1;
  objc_msgSend(v3, "_dispatchBlockWhenOpen:", v2);

}

void __67__CPLProxyLibraryManager_getListOfComponentsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint8_t v8[8];
  _QWORD v9[4];
  id v10;

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67__CPLProxyLibraryManager_getListOfComponentsWithCompletionHandler___block_invoke_3;
  v9[3] = &unk_1E60D67A8;
  v2 = *(void **)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  objc_msgSend(v2, "proxyWithErrorHandler:", v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "getListOfComponentsWithCompletionHandler:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_ERROR, "Proxy has disappeared", v8, 2u);
      }

    }
    v6 = *(_QWORD *)(a1 + 40);
    +[CPLErrors unknownError](CPLErrors, "unknownError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v7);

  }
}

void __67__CPLProxyLibraryManager_getListOfComponentsWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412546;
      v9 = v5;
      v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_ERROR, "%@ failed to get the list of components: %@", (uint8_t *)&v8, 0x16u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)getStatusForComponents:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *queue;
  uint64_t v9;
  _QWORD *v10;
  NSObject *v11;
  id v12;
  id v13;
  dispatch_block_t v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD block[4];
  id v19;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __67__CPLProxyLibraryManager_getStatusForComponents_completionHandler___block_invoke;
  v15[3] = &unk_1E60D6898;
  v16 = v6;
  v17 = v7;
  v15[4] = self;
  v10 = v15;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60D71F8;
  v19 = v10;
  v11 = queue;
  v12 = v6;
  v13 = v7;
  v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v11, v14);

}

void __67__CPLProxyLibraryManager_getStatusForComponents_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __67__CPLProxyLibraryManager_getStatusForComponents_completionHandler___block_invoke_2;
  v3[3] = &unk_1E60D6898;
  v3[4] = v2;
  v5 = *(id *)(a1 + 48);
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "_dispatchBlockWhenOpen:", v3);

}

void __67__CPLProxyLibraryManager_getStatusForComponents_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint8_t v8[8];
  _QWORD v9[4];
  id v10;

  v2 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67__CPLProxyLibraryManager_getStatusForComponents_completionHandler___block_invoke_3;
  v9[3] = &unk_1E60D67A8;
  v10 = *(id *)(a1 + 48);
  objc_msgSend(v2, "proxyWithErrorHandler:", v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "getStatusForComponents:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_ERROR, "Proxy has disappeared", v8, 2u);
      }

    }
    v6 = *(_QWORD *)(a1 + 48);
    +[CPLErrors unknownError](CPLErrors, "unknownError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v7);

  }
}

void __67__CPLProxyLibraryManager_getStatusForComponents_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412546;
      v9 = v5;
      v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_ERROR, "%@ failed to get status: %@", (uint8_t *)&v8, 0x16u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)getStatusArrayForComponents:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *queue;
  uint64_t v9;
  _QWORD *v10;
  NSObject *v11;
  id v12;
  id v13;
  dispatch_block_t v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD block[4];
  id v19;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __72__CPLProxyLibraryManager_getStatusArrayForComponents_completionHandler___block_invoke;
  v15[3] = &unk_1E60D6898;
  v16 = v6;
  v17 = v7;
  v15[4] = self;
  v10 = v15;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60D71F8;
  v19 = v10;
  v11 = queue;
  v12 = v6;
  v13 = v7;
  v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v11, v14);

}

void __72__CPLProxyLibraryManager_getStatusArrayForComponents_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __72__CPLProxyLibraryManager_getStatusArrayForComponents_completionHandler___block_invoke_2;
  v3[3] = &unk_1E60D6898;
  v3[4] = v2;
  v5 = *(id *)(a1 + 48);
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "_dispatchBlockWhenOpen:", v3);

}

void __72__CPLProxyLibraryManager_getStatusArrayForComponents_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint8_t v8[8];
  _QWORD v9[4];
  id v10;

  v2 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72__CPLProxyLibraryManager_getStatusArrayForComponents_completionHandler___block_invoke_3;
  v9[3] = &unk_1E60D67A8;
  v10 = *(id *)(a1 + 48);
  objc_msgSend(v2, "proxyWithErrorHandler:", v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "getStatusArrayForComponents:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_ERROR, "Proxy has disappeared", v8, 2u);
      }

    }
    v6 = *(_QWORD *)(a1 + 48);
    +[CPLErrors unknownError](CPLErrors, "unknownError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v7);

  }
}

void __72__CPLProxyLibraryManager_getStatusArrayForComponents_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412546;
      v9 = v5;
      v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_ERROR, "%@ failed to get status: %@", (uint8_t *)&v8, 0x16u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)getStatusesForScopesWithIdentifiers:(id)a3 includeStorages:(BOOL)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  OS_dispatch_queue *queue;
  uint64_t v11;
  _QWORD *v12;
  NSObject *v13;
  id v14;
  id v15;
  dispatch_block_t v16;
  _QWORD v17[5];
  id v18;
  id v19;
  BOOL v20;
  _QWORD block[4];
  id v22;

  v8 = a3;
  v9 = a5;
  queue = self->_queue;
  v11 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __96__CPLProxyLibraryManager_getStatusesForScopesWithIdentifiers_includeStorages_completionHandler___block_invoke;
  v17[3] = &unk_1E60D6AA0;
  v18 = v8;
  v19 = v9;
  v17[4] = self;
  v20 = a4;
  v12 = v17;
  block[0] = v11;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60D71F8;
  v22 = v12;
  v13 = queue;
  v14 = v8;
  v15 = v9;
  v16 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v13, v16);

}

void __96__CPLProxyLibraryManager_getStatusesForScopesWithIdentifiers_includeStorages_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;
  id v5;
  char v6;

  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __96__CPLProxyLibraryManager_getStatusesForScopesWithIdentifiers_includeStorages_completionHandler___block_invoke_2;
  v3[3] = &unk_1E60D6AA0;
  v3[4] = v2;
  v5 = *(id *)(a1 + 48);
  v4 = *(id *)(a1 + 40);
  v6 = *(_BYTE *)(a1 + 56);
  objc_msgSend(v2, "_dispatchBlockWhenOpen:", v3);

}

void __96__CPLProxyLibraryManager_getStatusesForScopesWithIdentifiers_includeStorages_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint8_t v8[8];
  _QWORD v9[4];
  id v10;

  v2 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __96__CPLProxyLibraryManager_getStatusesForScopesWithIdentifiers_includeStorages_completionHandler___block_invoke_3;
  v9[3] = &unk_1E60D67A8;
  v10 = *(id *)(a1 + 48);
  objc_msgSend(v2, "proxyWithErrorHandler:", v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "getStatusesForScopesWithIdentifiers:includeStorages:completionHandler:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_ERROR, "Proxy has disappeared", v8, 2u);
      }

    }
    v6 = *(_QWORD *)(a1 + 48);
    +[CPLErrors unknownError](CPLErrors, "unknownError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v7);

  }
}

void __96__CPLProxyLibraryManager_getStatusesForScopesWithIdentifiers_includeStorages_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412546;
      v9 = v5;
      v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_ERROR, "%@ failed to get status: %@", (uint8_t *)&v8, 0x16u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)getCloudCacheForRecordWithScopedIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *queue;
  uint64_t v9;
  _QWORD *v10;
  NSObject *v11;
  id v12;
  id v13;
  dispatch_block_t v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD block[4];
  id v19;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __87__CPLProxyLibraryManager_getCloudCacheForRecordWithScopedIdentifier_completionHandler___block_invoke;
  v15[3] = &unk_1E60D6898;
  v16 = v6;
  v17 = v7;
  v15[4] = self;
  v10 = v15;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60D71F8;
  v19 = v10;
  v11 = queue;
  v12 = v6;
  v13 = v7;
  v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v11, v14);

}

void __87__CPLProxyLibraryManager_getCloudCacheForRecordWithScopedIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __87__CPLProxyLibraryManager_getCloudCacheForRecordWithScopedIdentifier_completionHandler___block_invoke_2;
  v3[3] = &unk_1E60D6898;
  v3[4] = v2;
  v5 = *(id *)(a1 + 48);
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "_dispatchBlockWhenOpen:", v3);

}

void __87__CPLProxyLibraryManager_getCloudCacheForRecordWithScopedIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint8_t v8[8];
  _QWORD v9[4];
  id v10;

  v2 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __87__CPLProxyLibraryManager_getCloudCacheForRecordWithScopedIdentifier_completionHandler___block_invoke_3;
  v9[3] = &unk_1E60D67A8;
  v10 = *(id *)(a1 + 48);
  objc_msgSend(v2, "proxyWithErrorHandler:", v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "getCloudCacheForRecordWithScopedIdentifier:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_ERROR, "Proxy has disappeared", v8, 2u);
      }

    }
    v6 = *(_QWORD *)(a1 + 48);
    +[CPLErrors unknownError](CPLErrors, "unknownError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v7);

  }
}

void __87__CPLProxyLibraryManager_getCloudCacheForRecordWithScopedIdentifier_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412546;
      v9 = v5;
      v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_ERROR, "%@ failed to get record: %@", (uint8_t *)&v8, 0x16u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)cloudCacheGetDescriptionForRecordWithScopedIdentifier:(id)a3 related:(BOOL)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  OS_dispatch_queue *queue;
  uint64_t v11;
  _QWORD *v12;
  NSObject *v13;
  id v14;
  id v15;
  dispatch_block_t v16;
  _QWORD v17[5];
  id v18;
  id v19;
  BOOL v20;
  _QWORD block[4];
  id v22;

  v8 = a3;
  v9 = a5;
  queue = self->_queue;
  v11 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __106__CPLProxyLibraryManager_cloudCacheGetDescriptionForRecordWithScopedIdentifier_related_completionHandler___block_invoke;
  v17[3] = &unk_1E60D6AA0;
  v18 = v8;
  v19 = v9;
  v17[4] = self;
  v20 = a4;
  v12 = v17;
  block[0] = v11;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60D71F8;
  v22 = v12;
  v13 = queue;
  v14 = v8;
  v15 = v9;
  v16 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v13, v16);

}

void __106__CPLProxyLibraryManager_cloudCacheGetDescriptionForRecordWithScopedIdentifier_related_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;
  id v5;
  char v6;

  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __106__CPLProxyLibraryManager_cloudCacheGetDescriptionForRecordWithScopedIdentifier_related_completionHandler___block_invoke_2;
  v3[3] = &unk_1E60D6AA0;
  v3[4] = v2;
  v5 = *(id *)(a1 + 48);
  v4 = *(id *)(a1 + 40);
  v6 = *(_BYTE *)(a1 + 56);
  objc_msgSend(v2, "_dispatchBlockWhenOpen:", v3);

}

void __106__CPLProxyLibraryManager_cloudCacheGetDescriptionForRecordWithScopedIdentifier_related_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint8_t v8[8];
  _QWORD v9[4];
  id v10;

  v2 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __106__CPLProxyLibraryManager_cloudCacheGetDescriptionForRecordWithScopedIdentifier_related_completionHandler___block_invoke_3;
  v9[3] = &unk_1E60D67A8;
  v10 = *(id *)(a1 + 48);
  objc_msgSend(v2, "proxyWithErrorHandler:", v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "cloudCacheGetDescriptionForRecordWithScopedIdentifier:related:completionHandler:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_ERROR, "Proxy has disappeared", v8, 2u);
      }

    }
    v6 = *(_QWORD *)(a1 + 48);
    +[CPLErrors unknownError](CPLErrors, "unknownError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v6 + 16))(v6, 0, 0, v7);

  }
}

void __106__CPLProxyLibraryManager_cloudCacheGetDescriptionForRecordWithScopedIdentifier_related_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412546;
      v9 = v5;
      v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_ERROR, "%@ failed to get record: %@", (uint8_t *)&v8, 0x16u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)addInfoToLog:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  uint64_t v6;
  _QWORD *v7;
  NSObject *v8;
  id v9;
  dispatch_block_t v10;
  _QWORD v11[5];
  id v12;
  _QWORD block[4];
  id v14;

  v4 = a3;
  queue = self->_queue;
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __39__CPLProxyLibraryManager_addInfoToLog___block_invoke;
  v11[3] = &unk_1E60D6F88;
  v11[4] = self;
  v12 = v4;
  v7 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60D71F8;
  v14 = v7;
  v8 = queue;
  v9 = v4;
  v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);

}

void __39__CPLProxyLibraryManager_addInfoToLog___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __39__CPLProxyLibraryManager_addInfoToLog___block_invoke_2;
  v2[3] = &unk_1E60D6F88;
  v1 = *(void **)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = v1;
  objc_msgSend(v3, "_dispatchBlockWhenOpen:", v2);

}

void __39__CPLProxyLibraryManager_addInfoToLog___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__CPLProxyLibraryManager_addInfoToLog___block_invoke_3;
  v7[3] = &unk_1E60D6678;
  v2 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  objc_msgSend(v2, "proxyWithErrorHandler:", v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "addInfoToLog:", *(_QWORD *)(a1 + 40));
  }
  else if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v10 = v6;
      _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_ERROR, "Proxy has disappeared. Client wanted to say '%@'", buf, 0xCu);
    }

  }
}

void __39__CPLProxyLibraryManager_addInfoToLog___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  id v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = 138412802;
      v10 = v5;
      v11 = 2112;
      v12 = v8;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_ERROR, "%@ failed to say '%@': %@", (uint8_t *)&v9, 0x20u);
    }

  }
}

- (void)forceBackupWithCompletionHandler:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  OS_dispatch_queue *queue;
  _QWORD *v10;
  NSObject *v11;
  id v12;
  id v13;
  dispatch_block_t v14;
  _QWORD v15[5];
  id v16;
  id v17;
  uint64_t block;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  SEL v23;

  v5 = a3;
  v6 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  block = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = ___CPLProgressForAsyncCall_block_invoke;
  v21 = &__block_descriptor_48_e5_v8__0lu32l8;
  v22 = v6;
  v23 = a2;
  objc_msgSend(v7, "setCancellationHandler:", &block);
  queue = self->_queue;
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __59__CPLProxyLibraryManager_forceBackupWithCompletionHandler___block_invoke;
  v15[3] = &unk_1E60D6898;
  v16 = v7;
  v17 = v5;
  v15[4] = self;
  v10 = v15;
  block = v8;
  v19 = 3221225472;
  v20 = __cpl_dispatch_async_block_invoke;
  v21 = &unk_1E60D71F8;
  v22 = v10;
  v11 = queue;
  v12 = v7;
  v13 = v5;
  v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
  dispatch_async(v11, v14);

}

void __59__CPLProxyLibraryManager_forceBackupWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __59__CPLProxyLibraryManager_forceBackupWithCompletionHandler___block_invoke_2;
  v3[3] = &unk_1E60D6898;
  v3[4] = v2;
  v5 = *(id *)(a1 + 48);
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "_dispatchBlockWhenOpen:", v3);

}

void __59__CPLProxyLibraryManager_forceBackupWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v2 = MEMORY[0x1E0C809B0];
  v3 = *(void **)(a1 + 32);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __59__CPLProxyLibraryManager_forceBackupWithCompletionHandler___block_invoke_3;
  v13[3] = &unk_1E60D6938;
  v15 = *(id *)(a1 + 48);
  v14 = *(id *)(a1 + 40);
  objc_msgSend(v3, "proxyWithErrorHandler:", v13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = *(void **)(a1 + 40);
    v9[0] = v2;
    v9[1] = 3221225472;
    v9[2] = __59__CPLProxyLibraryManager_forceBackupWithCompletionHandler___block_invoke_4;
    v9[3] = &unk_1E60D6898;
    v10 = v4;
    v12 = *(id *)(a1 + 48);
    v11 = *(id *)(a1 + 40);
    objc_msgSend(v6, "performAsCurrentWithPendingUnitCount:usingBlock:", 1, v9);

  }
  else
  {
    v7 = *(_QWORD *)(a1 + 48);
    if (v7)
    {
      +[CPLErrors unknownError](CPLErrors, "unknownError");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

    }
    objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount"));
  }

}

uint64_t __59__CPLProxyLibraryManager_forceBackupWithCompletionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, a3);
  return objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
}

void __59__CPLProxyLibraryManager_forceBackupWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __59__CPLProxyLibraryManager_forceBackupWithCompletionHandler___block_invoke_5;
  v3[3] = &unk_1E60D64F0;
  v5 = *(id *)(a1 + 48);
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "forceBackupWithCompletionHandler:", v3);

}

uint64_t __59__CPLProxyLibraryManager_forceBackupWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
}

- (void)requestClientToPushAllChangesWithCompletionHandler:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  OS_dispatch_queue *queue;
  _QWORD *v10;
  NSObject *v11;
  id v12;
  id v13;
  dispatch_block_t v14;
  _QWORD v15[5];
  id v16;
  id v17;
  uint64_t block;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  SEL v23;

  v5 = a3;
  v6 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  block = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = ___CPLProgressForAsyncCall_block_invoke;
  v21 = &__block_descriptor_48_e5_v8__0lu32l8;
  v22 = v6;
  v23 = a2;
  objc_msgSend(v7, "setCancellationHandler:", &block);
  queue = self->_queue;
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __77__CPLProxyLibraryManager_requestClientToPushAllChangesWithCompletionHandler___block_invoke;
  v15[3] = &unk_1E60D6898;
  v16 = v7;
  v17 = v5;
  v15[4] = self;
  v10 = v15;
  block = v8;
  v19 = 3221225472;
  v20 = __cpl_dispatch_async_block_invoke;
  v21 = &unk_1E60D71F8;
  v22 = v10;
  v11 = queue;
  v12 = v7;
  v13 = v5;
  v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
  dispatch_async(v11, v14);

}

void __77__CPLProxyLibraryManager_requestClientToPushAllChangesWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __77__CPLProxyLibraryManager_requestClientToPushAllChangesWithCompletionHandler___block_invoke_2;
  v3[3] = &unk_1E60D6898;
  v3[4] = v2;
  v5 = *(id *)(a1 + 48);
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "_dispatchBlockWhenOpen:", v3);

}

void __77__CPLProxyLibraryManager_requestClientToPushAllChangesWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v2 = MEMORY[0x1E0C809B0];
  v3 = *(void **)(a1 + 32);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __77__CPLProxyLibraryManager_requestClientToPushAllChangesWithCompletionHandler___block_invoke_3;
  v13[3] = &unk_1E60D6938;
  v15 = *(id *)(a1 + 48);
  v14 = *(id *)(a1 + 40);
  objc_msgSend(v3, "proxyWithErrorHandler:", v13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = *(void **)(a1 + 40);
    v9[0] = v2;
    v9[1] = 3221225472;
    v9[2] = __77__CPLProxyLibraryManager_requestClientToPushAllChangesWithCompletionHandler___block_invoke_4;
    v9[3] = &unk_1E60D6898;
    v10 = v4;
    v12 = *(id *)(a1 + 48);
    v11 = *(id *)(a1 + 40);
    objc_msgSend(v6, "performAsCurrentWithPendingUnitCount:usingBlock:", 1, v9);

  }
  else
  {
    v7 = *(_QWORD *)(a1 + 48);
    if (v7)
    {
      +[CPLErrors unknownError](CPLErrors, "unknownError");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

    }
    objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount"));
  }

}

uint64_t __77__CPLProxyLibraryManager_requestClientToPushAllChangesWithCompletionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, a3);
  return objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
}

void __77__CPLProxyLibraryManager_requestClientToPushAllChangesWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __77__CPLProxyLibraryManager_requestClientToPushAllChangesWithCompletionHandler___block_invoke_5;
  v3[3] = &unk_1E60D64F0;
  v5 = *(id *)(a1 + 48);
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "requestClientToPushAllChangesWithCompletionHandler:", v3);

}

uint64_t __77__CPLProxyLibraryManager_requestClientToPushAllChangesWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
}

- (void)requestClientToPullAllChangesInScopeIdentifier:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  OS_dispatch_queue *queue;
  _QWORD *v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  dispatch_block_t v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  uint64_t block;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  id v27;
  SEL v28;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  block = MEMORY[0x1E0C809B0];
  v24 = 3221225472;
  v25 = ___CPLProgressForAsyncCall_block_invoke;
  v26 = &__block_descriptor_48_e5_v8__0lu32l8;
  v27 = v9;
  v28 = a2;
  objc_msgSend(v10, "setCancellationHandler:", &block);
  queue = self->_queue;
  v19[0] = v11;
  v19[1] = 3221225472;
  v19[2] = __91__CPLProxyLibraryManager_requestClientToPullAllChangesInScopeIdentifier_completionHandler___block_invoke;
  v19[3] = &unk_1E60D6B18;
  v19[4] = self;
  v20 = v10;
  v21 = v7;
  v22 = v8;
  v13 = v19;
  block = v11;
  v24 = 3221225472;
  v25 = __cpl_dispatch_async_block_invoke;
  v26 = &unk_1E60D71F8;
  v27 = v13;
  v14 = queue;
  v15 = v7;
  v16 = v10;
  v17 = v8;
  v18 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
  dispatch_async(v14, v18);

}

void __91__CPLProxyLibraryManager_requestClientToPullAllChangesInScopeIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;
  id v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __91__CPLProxyLibraryManager_requestClientToPullAllChangesInScopeIdentifier_completionHandler___block_invoke_2;
  v3[3] = &unk_1E60D6B18;
  v3[4] = v2;
  v6 = *(id *)(a1 + 56);
  v4 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "_dispatchBlockWhenOpen:", v3);

}

void __91__CPLProxyLibraryManager_requestClientToPullAllChangesInScopeIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v2 = MEMORY[0x1E0C809B0];
  v3 = *(void **)(a1 + 32);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __91__CPLProxyLibraryManager_requestClientToPullAllChangesInScopeIdentifier_completionHandler___block_invoke_3;
  v14[3] = &unk_1E60D6938;
  v16 = *(id *)(a1 + 56);
  v15 = *(id *)(a1 + 40);
  objc_msgSend(v3, "proxyWithErrorHandler:", v14);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = *(void **)(a1 + 40);
    v9[0] = v2;
    v9[1] = 3221225472;
    v9[2] = __91__CPLProxyLibraryManager_requestClientToPullAllChangesInScopeIdentifier_completionHandler___block_invoke_4;
    v9[3] = &unk_1E60D6AF0;
    v10 = v4;
    v11 = *(id *)(a1 + 48);
    v13 = *(id *)(a1 + 56);
    v12 = *(id *)(a1 + 40);
    objc_msgSend(v6, "performAsCurrentWithPendingUnitCount:usingBlock:", 1, v9);

  }
  else
  {
    v7 = *(_QWORD *)(a1 + 56);
    if (v7)
    {
      +[CPLErrors unknownError](CPLErrors, "unknownError");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

    }
    objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount"));
  }

}

uint64_t __91__CPLProxyLibraryManager_requestClientToPullAllChangesInScopeIdentifier_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, a3);
  return objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
}

void __91__CPLProxyLibraryManager_requestClientToPullAllChangesInScopeIdentifier_completionHandler___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __91__CPLProxyLibraryManager_requestClientToPullAllChangesInScopeIdentifier_completionHandler___block_invoke_5;
  v4[3] = &unk_1E60D64F0;
  v6 = *(id *)(a1 + 56);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "requestClientToPullAllChangesInScopeIdentifier:completionHandler:", v3, v4);

}

uint64_t __91__CPLProxyLibraryManager_requestClientToPullAllChangesInScopeIdentifier_completionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
}

- (void)reportSetting:(id)a3 hasBeenSetToValue:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *queue;
  uint64_t v9;
  _QWORD *v10;
  NSObject *v11;
  id v12;
  id v13;
  dispatch_block_t v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD block[4];
  id v19;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __58__CPLProxyLibraryManager_reportSetting_hasBeenSetToValue___block_invoke;
  v15[3] = &unk_1E60D6EC0;
  v15[4] = self;
  v16 = v6;
  v17 = v7;
  v10 = v15;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60D71F8;
  v19 = v10;
  v11 = queue;
  v12 = v7;
  v13 = v6;
  v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v11, v14);

}

void __58__CPLProxyLibraryManager_reportSetting_hasBeenSetToValue___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __58__CPLProxyLibraryManager_reportSetting_hasBeenSetToValue___block_invoke_2;
  v3[3] = &unk_1E60D6EC0;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v4, "_dispatchBlockWhenOpen:", v3);

}

void __58__CPLProxyLibraryManager_reportSetting_hasBeenSetToValue___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *, void *);
  void *v11;
  id v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __58__CPLProxyLibraryManager_reportSetting_hasBeenSetToValue___block_invoke_3;
  v11 = &unk_1E60D6CA8;
  v2 = *(void **)(a1 + 32);
  v12 = *(id *)(a1 + 40);
  v13 = *(id *)(a1 + 48);
  objc_msgSend(v2, "proxyWithErrorHandler:", &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "reportSetting:hasBeenSetToValue:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v8, v9, v10, v11, v12);
  }
  else if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 40);
      v7 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138412546;
      v15 = v6;
      v16 = 2112;
      v17 = v7;
      _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_ERROR, "Proxy has disappeared. Client wanted to report setting '%@' has been set to '%@'", buf, 0x16u);
    }

  }
}

void __58__CPLProxyLibraryManager_reportSetting_hasBeenSetToValue___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  id v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(_QWORD *)(a1 + 40);
      v10 = 138413058;
      v11 = v5;
      v12 = 2112;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_ERROR, "%@ failed to report setting '%@' has been set to '%@': %@", (uint8_t *)&v10, 0x2Au);
    }

  }
}

- (void)reportMiscInformation:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  uint64_t v6;
  _QWORD *v7;
  NSObject *v8;
  id v9;
  dispatch_block_t v10;
  _QWORD v11[5];
  id v12;
  _QWORD block[4];
  id v14;

  v4 = a3;
  queue = self->_queue;
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __48__CPLProxyLibraryManager_reportMiscInformation___block_invoke;
  v11[3] = &unk_1E60D6F88;
  v11[4] = self;
  v12 = v4;
  v7 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60D71F8;
  v14 = v7;
  v8 = queue;
  v9 = v4;
  v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);

}

void __48__CPLProxyLibraryManager_reportMiscInformation___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __48__CPLProxyLibraryManager_reportMiscInformation___block_invoke_2;
  v2[3] = &unk_1E60D6F88;
  v1 = *(void **)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = v1;
  objc_msgSend(v3, "_dispatchBlockWhenOpen:", v2);

}

void __48__CPLProxyLibraryManager_reportMiscInformation___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__CPLProxyLibraryManager_reportMiscInformation___block_invoke_3;
  v7[3] = &unk_1E60D6678;
  v2 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  objc_msgSend(v2, "proxyWithErrorHandler:", v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "reportMiscInformation:", *(_QWORD *)(a1 + 40));
  }
  else if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v10 = v6;
      _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_ERROR, "Proxy has disappeared. Client wanted to report misc information '%@'", buf, 0xCu);
    }

  }
}

void __48__CPLProxyLibraryManager_reportMiscInformation___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  id v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = 138412802;
      v10 = v5;
      v11 = 2112;
      v12 = v8;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_ERROR, "%@ failed to report misc information '%@': %@", (uint8_t *)&v9, 0x20u);
    }

  }
}

- (void)blockEngineElement:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  uint64_t v6;
  _QWORD *v7;
  NSObject *v8;
  id v9;
  dispatch_block_t v10;
  _QWORD v11[5];
  id v12;
  _QWORD block[4];
  id v14;

  v4 = a3;
  queue = self->_queue;
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __45__CPLProxyLibraryManager_blockEngineElement___block_invoke;
  v11[3] = &unk_1E60D6F88;
  v11[4] = self;
  v12 = v4;
  v7 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60D71F8;
  v14 = v7;
  v8 = queue;
  v9 = v4;
  v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);

}

void __45__CPLProxyLibraryManager_blockEngineElement___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __45__CPLProxyLibraryManager_blockEngineElement___block_invoke_2;
  v2[3] = &unk_1E60D6F88;
  v1 = *(void **)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = v1;
  objc_msgSend(v3, "_dispatchBlockWhenOpen:", v2);

}

void __45__CPLProxyLibraryManager_blockEngineElement___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__CPLProxyLibraryManager_blockEngineElement___block_invoke_3;
  v7[3] = &unk_1E60D6678;
  v2 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  objc_msgSend(v2, "proxyWithErrorHandler:", v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "blockEngineElement:", *(_QWORD *)(a1 + 40));
  }
  else if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v10 = v6;
      _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_ERROR, "Proxy has disappeared. Client wanted to block '%@'", buf, 0xCu);
    }

  }
}

void __45__CPLProxyLibraryManager_blockEngineElement___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  id v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = 138412802;
      v10 = v5;
      v11 = 2112;
      v12 = v8;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_ERROR, "%@ failed to block '%@': %@", (uint8_t *)&v9, 0x20u);
    }

  }
}

- (void)unblockEngineElement:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  uint64_t v6;
  _QWORD *v7;
  NSObject *v8;
  id v9;
  dispatch_block_t v10;
  _QWORD v11[5];
  id v12;
  _QWORD block[4];
  id v14;

  v4 = a3;
  queue = self->_queue;
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __47__CPLProxyLibraryManager_unblockEngineElement___block_invoke;
  v11[3] = &unk_1E60D6F88;
  v11[4] = self;
  v12 = v4;
  v7 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60D71F8;
  v14 = v7;
  v8 = queue;
  v9 = v4;
  v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);

}

void __47__CPLProxyLibraryManager_unblockEngineElement___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __47__CPLProxyLibraryManager_unblockEngineElement___block_invoke_2;
  v2[3] = &unk_1E60D6F88;
  v1 = *(void **)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = v1;
  objc_msgSend(v3, "_dispatchBlockWhenOpen:", v2);

}

void __47__CPLProxyLibraryManager_unblockEngineElement___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__CPLProxyLibraryManager_unblockEngineElement___block_invoke_3;
  v7[3] = &unk_1E60D6678;
  v2 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  objc_msgSend(v2, "proxyWithErrorHandler:", v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "unblockEngineElement:", *(_QWORD *)(a1 + 40));
  }
  else if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v10 = v6;
      _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_ERROR, "Proxy has disappeared. Client wanted to unblock '%@'", buf, 0xCu);
    }

  }
}

void __47__CPLProxyLibraryManager_unblockEngineElement___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  id v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = 138412802;
      v10 = v5;
      v11 = 2112;
      v12 = v8;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_ERROR, "%@ failed to unblock '%@': %@", (uint8_t *)&v9, 0x20u);
    }

  }
}

- (void)unblockEngineElementOnce:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  uint64_t v6;
  _QWORD *v7;
  NSObject *v8;
  id v9;
  dispatch_block_t v10;
  _QWORD v11[5];
  id v12;
  _QWORD block[4];
  id v14;

  v4 = a3;
  queue = self->_queue;
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __51__CPLProxyLibraryManager_unblockEngineElementOnce___block_invoke;
  v11[3] = &unk_1E60D6F88;
  v11[4] = self;
  v12 = v4;
  v7 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60D71F8;
  v14 = v7;
  v8 = queue;
  v9 = v4;
  v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);

}

void __51__CPLProxyLibraryManager_unblockEngineElementOnce___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __51__CPLProxyLibraryManager_unblockEngineElementOnce___block_invoke_2;
  v2[3] = &unk_1E60D6F88;
  v1 = *(void **)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = v1;
  objc_msgSend(v3, "_dispatchBlockWhenOpen:", v2);

}

void __51__CPLProxyLibraryManager_unblockEngineElementOnce___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__CPLProxyLibraryManager_unblockEngineElementOnce___block_invoke_3;
  v7[3] = &unk_1E60D6678;
  v2 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  objc_msgSend(v2, "proxyWithErrorHandler:", v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "unblockEngineElementOnce:", *(_QWORD *)(a1 + 40));
  }
  else if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v10 = v6;
      _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_ERROR, "Proxy has disappeared. Client wanted to unblock '%@' once", buf, 0xCu);
    }

  }
}

void __51__CPLProxyLibraryManager_unblockEngineElementOnce___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  id v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = 138412802;
      v10 = v5;
      v11 = 2112;
      v12 = v8;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_ERROR, "%@ failed to unblock '%@' once: %@", (uint8_t *)&v9, 0x20u);
    }

  }
}

- (void)provideScopeChangeForScopeWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  OS_dispatch_queue *queue;
  uint64_t v10;
  _QWORD *v11;
  NSObject *v12;
  id v13;
  id v14;
  dispatch_block_t v15;
  _QWORD v16[5];
  id v17;
  id v18;
  SEL v19;
  _QWORD block[4];
  id v21;

  v7 = a3;
  v8 = a4;
  queue = self->_queue;
  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __85__CPLProxyLibraryManager_provideScopeChangeForScopeWithIdentifier_completionHandler___block_invoke;
  v16[3] = &unk_1E60D6C58;
  v18 = v8;
  v19 = a2;
  v16[4] = self;
  v17 = v7;
  v11 = v16;
  block[0] = v10;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60D71F8;
  v21 = v11;
  v12 = queue;
  v13 = v7;
  v14 = v8;
  v15 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v12, v15);

}

void __85__CPLProxyLibraryManager_provideScopeChangeForScopeWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  __int128 v4;
  _QWORD v5[5];
  id v6;
  __int128 v7;

  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __85__CPLProxyLibraryManager_provideScopeChangeForScopeWithIdentifier_completionHandler___block_invoke_2;
  v5[3] = &unk_1E60D6C58;
  v5[4] = v2;
  v4 = *(_OWORD *)(a1 + 48);
  v3 = (id)v4;
  v7 = v4;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v2, "_dispatchBlockWhenOpen:", v5);

}

void __85__CPLProxyLibraryManager_provideScopeChangeForScopeWithIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  __int128 v8;
  _QWORD v9[4];
  __int128 v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __85__CPLProxyLibraryManager_provideScopeChangeForScopeWithIdentifier_completionHandler___block_invoke_3;
  v9[3] = &unk_1E60D6CF8;
  v8 = *(_OWORD *)(a1 + 48);
  v3 = (id)v8;
  v10 = v8;
  objc_msgSend(v2, "proxyWithErrorHandler:", v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "provideScopeChangeForScopeWithIdentifier:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(*(SEL *)(a1 + 56));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v12 = v7;
        _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_ERROR, "Proxy has disappeared. Client wanted to call '%@'", buf, 0xCu);

      }
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __85__CPLProxyLibraryManager_provideScopeChangeForScopeWithIdentifier_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412802;
      v10 = v5;
      v11 = 2112;
      v12 = v8;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_ERROR, "%@ failed to call '%@': %@", (uint8_t *)&v9, 0x20u);

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)provideRecordWithCloudScopeIdentifier:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  OS_dispatch_queue *queue;
  uint64_t v10;
  _QWORD *v11;
  NSObject *v12;
  id v13;
  id v14;
  dispatch_block_t v15;
  _QWORD v16[5];
  id v17;
  id v18;
  SEL v19;
  _QWORD block[4];
  id v21;

  v7 = a3;
  v8 = a4;
  queue = self->_queue;
  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __82__CPLProxyLibraryManager_provideRecordWithCloudScopeIdentifier_completionHandler___block_invoke;
  v16[3] = &unk_1E60D6C58;
  v18 = v8;
  v19 = a2;
  v16[4] = self;
  v17 = v7;
  v11 = v16;
  block[0] = v10;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60D71F8;
  v21 = v11;
  v12 = queue;
  v13 = v7;
  v14 = v8;
  v15 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v12, v15);

}

void __82__CPLProxyLibraryManager_provideRecordWithCloudScopeIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  __int128 v4;
  _QWORD v5[5];
  id v6;
  __int128 v7;

  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __82__CPLProxyLibraryManager_provideRecordWithCloudScopeIdentifier_completionHandler___block_invoke_2;
  v5[3] = &unk_1E60D6C58;
  v5[4] = v2;
  v4 = *(_OWORD *)(a1 + 48);
  v3 = (id)v4;
  v7 = v4;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v2, "_dispatchBlockWhenOpen:", v5);

}

void __82__CPLProxyLibraryManager_provideRecordWithCloudScopeIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  __int128 v8;
  _QWORD v9[4];
  __int128 v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __82__CPLProxyLibraryManager_provideRecordWithCloudScopeIdentifier_completionHandler___block_invoke_3;
  v9[3] = &unk_1E60D6CF8;
  v8 = *(_OWORD *)(a1 + 48);
  v3 = (id)v8;
  v10 = v8;
  objc_msgSend(v2, "proxyWithErrorHandler:", v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "provideRecordWithCloudScopeIdentifier:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(*(SEL *)(a1 + 56));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v12 = v7;
        _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_ERROR, "Proxy has disappeared. Client wanted to call '%@'", buf, 0xCu);

      }
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __82__CPLProxyLibraryManager_provideRecordWithCloudScopeIdentifier_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412802;
      v10 = v5;
      v11 = 2112;
      v12 = v8;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_ERROR, "%@ failed to call '%@': %@", (uint8_t *)&v9, 0x20u);

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)provideCloudResource:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  OS_dispatch_queue *queue;
  uint64_t v10;
  _QWORD *v11;
  NSObject *v12;
  id v13;
  id v14;
  dispatch_block_t v15;
  _QWORD v16[5];
  id v17;
  id v18;
  SEL v19;
  _QWORD block[4];
  id v21;

  v7 = a3;
  v8 = a4;
  queue = self->_queue;
  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __65__CPLProxyLibraryManager_provideCloudResource_completionHandler___block_invoke;
  v16[3] = &unk_1E60D6C58;
  v18 = v8;
  v19 = a2;
  v16[4] = self;
  v17 = v7;
  v11 = v16;
  block[0] = v10;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60D71F8;
  v21 = v11;
  v12 = queue;
  v13 = v7;
  v14 = v8;
  v15 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v12, v15);

}

void __65__CPLProxyLibraryManager_provideCloudResource_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  __int128 v4;
  _QWORD v5[5];
  id v6;
  __int128 v7;

  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65__CPLProxyLibraryManager_provideCloudResource_completionHandler___block_invoke_2;
  v5[3] = &unk_1E60D6C58;
  v5[4] = v2;
  v4 = *(_OWORD *)(a1 + 48);
  v3 = (id)v4;
  v7 = v4;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v2, "_dispatchBlockWhenOpen:", v5);

}

void __65__CPLProxyLibraryManager_provideCloudResource_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  __int128 v8;
  _QWORD v9[4];
  __int128 v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__CPLProxyLibraryManager_provideCloudResource_completionHandler___block_invoke_3;
  v9[3] = &unk_1E60D6CF8;
  v8 = *(_OWORD *)(a1 + 48);
  v3 = (id)v8;
  v10 = v8;
  objc_msgSend(v2, "proxyWithErrorHandler:", v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "provideCloudResource:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(*(SEL *)(a1 + 56));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v12 = v7;
        _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_ERROR, "Proxy has disappeared. Client wanted to call '%@'", buf, 0xCu);

      }
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __65__CPLProxyLibraryManager_provideCloudResource_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412802;
      v10 = v5;
      v11 = 2112;
      v12 = v8;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_ERROR, "%@ failed to call '%@': %@", (uint8_t *)&v9, 0x20u);

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)addDropDerivativesRecipe:(id)a3 writeToUserDefaults:(BOOL)a4 withCompletionHandler:(id)a5
{
  id v9;
  id v10;
  OS_dispatch_queue *queue;
  uint64_t v12;
  _QWORD *v13;
  NSObject *v14;
  id v15;
  id v16;
  dispatch_block_t v17;
  _QWORD v18[5];
  id v19;
  id v20;
  SEL v21;
  BOOL v22;
  _QWORD block[4];
  id v24;

  v9 = a3;
  v10 = a5;
  queue = self->_queue;
  v12 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __93__CPLProxyLibraryManager_addDropDerivativesRecipe_writeToUserDefaults_withCompletionHandler___block_invoke;
  v18[3] = &unk_1E60D70F0;
  v20 = v10;
  v21 = a2;
  v18[4] = self;
  v19 = v9;
  v22 = a4;
  v13 = v18;
  block[0] = v12;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60D71F8;
  v24 = v13;
  v14 = queue;
  v15 = v9;
  v16 = v10;
  v17 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v14, v17);

}

void __93__CPLProxyLibraryManager_addDropDerivativesRecipe_writeToUserDefaults_withCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  __int128 v4;
  _QWORD v5[5];
  id v6;
  __int128 v7;
  char v8;

  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __93__CPLProxyLibraryManager_addDropDerivativesRecipe_writeToUserDefaults_withCompletionHandler___block_invoke_2;
  v5[3] = &unk_1E60D70F0;
  v5[4] = v2;
  v4 = *(_OWORD *)(a1 + 48);
  v3 = (id)v4;
  v7 = v4;
  v6 = *(id *)(a1 + 40);
  v8 = *(_BYTE *)(a1 + 64);
  objc_msgSend(v2, "_dispatchBlockWhenOpen:", v5);

}

void __93__CPLProxyLibraryManager_addDropDerivativesRecipe_writeToUserDefaults_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  __int128 v8;
  _QWORD v9[4];
  __int128 v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __93__CPLProxyLibraryManager_addDropDerivativesRecipe_writeToUserDefaults_withCompletionHandler___block_invoke_3;
  v9[3] = &unk_1E60D6CF8;
  v8 = *(_OWORD *)(a1 + 48);
  v3 = (id)v8;
  v10 = v8;
  objc_msgSend(v2, "proxyWithErrorHandler:", v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "addDropDerivativesRecipe:writeToUserDefaults:withCompletionHandler:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 48));
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(*(SEL *)(a1 + 56));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v12 = v7;
        _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_ERROR, "Proxy has disappeared. Client wanted to call '%@'", buf, 0xCu);

      }
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __93__CPLProxyLibraryManager_addDropDerivativesRecipe_writeToUserDefaults_withCompletionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412802;
      v10 = v5;
      v11 = 2112;
      v12 = v8;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_ERROR, "%@ failed to call '%@': %@", (uint8_t *)&v9, 0x20u);

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)attachComputeStates:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  OS_dispatch_queue *queue;
  uint64_t v10;
  _QWORD *v11;
  NSObject *v12;
  id v13;
  id v14;
  dispatch_block_t v15;
  _QWORD v16[5];
  id v17;
  id v18;
  SEL v19;
  _QWORD block[4];
  id v21;

  v7 = a3;
  v8 = a4;
  queue = self->_queue;
  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __64__CPLProxyLibraryManager_attachComputeStates_completionHandler___block_invoke;
  v16[3] = &unk_1E60D6C58;
  v18 = v8;
  v19 = a2;
  v16[4] = self;
  v17 = v7;
  v11 = v16;
  block[0] = v10;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke;
  block[3] = &unk_1E60D71F8;
  v21 = v11;
  v12 = queue;
  v13 = v7;
  v14 = v8;
  v15 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v12, v15);

}

void __64__CPLProxyLibraryManager_attachComputeStates_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  __int128 v4;
  _QWORD v5[5];
  id v6;
  __int128 v7;

  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__CPLProxyLibraryManager_attachComputeStates_completionHandler___block_invoke_2;
  v5[3] = &unk_1E60D6C58;
  v5[4] = v2;
  v4 = *(_OWORD *)(a1 + 48);
  v3 = (id)v4;
  v7 = v4;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v2, "_dispatchBlockWhenOpen:", v5);

}

void __64__CPLProxyLibraryManager_attachComputeStates_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  __int128 v8;
  _QWORD v9[4];
  __int128 v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__CPLProxyLibraryManager_attachComputeStates_completionHandler___block_invoke_3;
  v9[3] = &unk_1E60D6CF8;
  v8 = *(_OWORD *)(a1 + 48);
  v3 = (id)v8;
  v10 = v8;
  objc_msgSend(v2, "proxyWithErrorHandler:", v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "attachComputeStates:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(*(SEL *)(a1 + 56));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v12 = v7;
        _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_ERROR, "Proxy has disappeared. Client wanted to call '%@'", buf, 0xCu);

      }
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __64__CPLProxyLibraryManager_attachComputeStates_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412802;
      v10 = v5;
      v11 = 2112;
      v12 = v8;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_ERROR, "%@ failed to call '%@': %@", (uint8_t *)&v9, 0x20u);

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)fetchComputeStatesForRecordsWithScopedIdentifiers:(id)a3 validator:(id)a4 shouldDecrypt:(BOOL)a5 onDemand:(BOOL)a6 completionHandler:(id)a7
{
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  OS_dispatch_queue *queue;
  _QWORD *v20;
  NSObject *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  dispatch_block_t v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  id v31;
  SEL v32;
  BOOL v33;
  BOOL v34;
  uint64_t block;
  uint64_t v36;
  void (*v37)(uint64_t);
  void *v38;
  id v39;
  SEL v40;

  v13 = a3;
  v14 = a4;
  v15 = a7;
  v16 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  block = MEMORY[0x1E0C809B0];
  v36 = 3221225472;
  v37 = ___CPLProgressForAsyncCall_block_invoke;
  v38 = &__block_descriptor_48_e5_v8__0lu32l8;
  v39 = v16;
  v40 = a2;
  objc_msgSend(v17, "setCancellationHandler:", &block);
  queue = self->_queue;
  v27[0] = v18;
  v27[1] = 3221225472;
  v27[2] = __127__CPLProxyLibraryManager_fetchComputeStatesForRecordsWithScopedIdentifiers_validator_shouldDecrypt_onDemand_completionHandler___block_invoke;
  v27[3] = &unk_1E60D7190;
  v31 = v15;
  v32 = a2;
  v27[4] = self;
  v28 = v17;
  v29 = v13;
  v30 = v14;
  v33 = a5;
  v34 = a6;
  v20 = v27;
  block = v18;
  v36 = 3221225472;
  v37 = __cpl_dispatch_async_block_invoke;
  v38 = &unk_1E60D71F8;
  v39 = v20;
  v21 = queue;
  v22 = v14;
  v23 = v13;
  v24 = v17;
  v25 = v15;
  v26 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
  dispatch_async(v21, v26);

}

void __127__CPLProxyLibraryManager_fetchComputeStatesForRecordsWithScopedIdentifiers_validator_shouldDecrypt_onDemand_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  __int128 v4;
  _QWORD v5[5];
  id v6;
  id v7;
  id v8;
  __int128 v9;
  __int16 v10;

  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __127__CPLProxyLibraryManager_fetchComputeStatesForRecordsWithScopedIdentifiers_validator_shouldDecrypt_onDemand_completionHandler___block_invoke_2;
  v5[3] = &unk_1E60D7190;
  v5[4] = v2;
  v4 = *(_OWORD *)(a1 + 64);
  v3 = (id)v4;
  v9 = v4;
  v6 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  v10 = *(_WORD *)(a1 + 80);
  objc_msgSend(v2, "_dispatchBlockWhenOpen:", v5);

}

void __127__CPLProxyLibraryManager_fetchComputeStatesForRecordsWithScopedIdentifiers_validator_shouldDecrypt_onDemand_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  __int16 v19;
  _QWORD v20[4];
  id v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __127__CPLProxyLibraryManager_fetchComputeStatesForRecordsWithScopedIdentifiers_validator_shouldDecrypt_onDemand_completionHandler___block_invoke_3;
  v20[3] = &unk_1E60D7118;
  v12 = *(_OWORD *)(a1 + 64);
  v4 = (id)v12;
  v22 = v12;
  v21 = *(id *)(a1 + 40);
  objc_msgSend(v2, "proxyWithErrorHandler:", v20);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = *(void **)(a1 + 40);
    v13[0] = v3;
    v13[1] = 3221225472;
    v13[2] = __127__CPLProxyLibraryManager_fetchComputeStatesForRecordsWithScopedIdentifiers_validator_shouldDecrypt_onDemand_completionHandler___block_invoke_357;
    v13[3] = &unk_1E60D7168;
    v14 = v5;
    v15 = *(id *)(a1 + 48);
    v16 = *(id *)(a1 + 56);
    v19 = *(_WORD *)(a1 + 80);
    v18 = *(id *)(a1 + 64);
    v17 = *(id *)(a1 + 40);
    objc_msgSend(v7, "performAsCurrentWithPendingUnitCount:usingBlock:", 1, v13);

  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLManagerOSLogDomain();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(*(SEL *)(a1 + 72));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v24 = v9;
        _os_log_impl(&dword_1B03C2000, v8, OS_LOG_TYPE_ERROR, "Proxy has disappeared. Client wanted to call '%@'", buf, 0xCu);

      }
    }
    v10 = *(_QWORD *)(a1 + 64);
    +[CPLErrors unknownError](CPLErrors, "unknownError", v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v10 + 16))(v10, 0, v11);

    objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount"));
  }

}

void __127__CPLProxyLibraryManager_fetchComputeStatesForRecordsWithScopedIdentifiers_validator_shouldDecrypt_onDemand_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLManagerOSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412802;
      v10 = v5;
      v11 = 2112;
      v12 = v8;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_ERROR, "%@ failed to call '%@': %@", (uint8_t *)&v9, 0x20u);

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));

}

void __127__CPLProxyLibraryManager_fetchComputeStatesForRecordsWithScopedIdentifiers_validator_shouldDecrypt_onDemand_completionHandler___block_invoke_357(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(unsigned __int8 *)(a1 + 72);
  v6 = *(unsigned __int8 *)(a1 + 73);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __127__CPLProxyLibraryManager_fetchComputeStatesForRecordsWithScopedIdentifiers_validator_shouldDecrypt_onDemand_completionHandler___block_invoke_2_358;
  v7[3] = &unk_1E60D7140;
  v9 = *(id *)(a1 + 64);
  v8 = *(id *)(a1 + 56);
  objc_msgSend(v2, "fetchComputeStatesForRecordsWithScopedIdentifiers:validator:shouldDecrypt:onDemand:completionHandler:", v3, v4, v5, v6, v7);

}

uint64_t __127__CPLProxyLibraryManager_fetchComputeStatesForRecordsWithScopedIdentifiers_validator_shouldDecrypt_onDemand_completionHandler___block_invoke_2_358(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
}

- (void)_withVoucherForTaskWithIdentifier:(id)a3 do:(id)a4
{
  void *v6;
  void *v7;
  id v8;
  void (**v9)(void);

  v9 = (void (**)(void))a4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_vouchersPerTaskIdentifier, "objectForKeyedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
    voucher_adopt();
    v9[2]();

  }
  else
  {
    v9[2]();
  }

}

- (void)_storeVoucher:(id)a3 forTaskWithIdentifier:(id)a4
{
  if (a3)
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_vouchersPerTaskIdentifier, "setObject:forKeyedSubscript:", a3, a4);
}

- (void)_dropVoucherForTaskWithIdentifier:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_vouchersPerTaskIdentifier, "removeObjectForKey:", a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_backoffRetryingConnectionDate, 0);
  objc_storeStrong((id *)&self->_pendingBlocksAfterOpening, 0);
  objc_storeStrong((id *)&self->_syncOutstandingInvocations, 0);
  objc_storeStrong((id *)&self->_outstandingInvocations, 0);
  objc_storeStrong((id *)&self->_disablingReasons, 0);
  objc_storeStrong((id *)&self->_vouchersPerTaskIdentifier, 0);
  objc_storeStrong((id *)&self->_forceSyncTasks, 0);
  objc_storeStrong((id *)&self->_uploadTasks, 0);
  objc_storeStrong((id *)&self->_inMemoryDownloadTasks, 0);
  objc_storeStrong((id *)&self->_downloadTasks, 0);
  objc_storeStrong((id *)&self->_realConnection, 0);
}

- (void)_dispatchBlockWhenOpen:.cold.1()
{
  void *v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  if (!_CPLSilentLogging)
  {
    __CPLGenericOSLogDomain();
    v1 = objc_claimAutoreleasedReturnValue();
    if (OUTLINED_FUNCTION_1(v1))
      OUTLINED_FUNCTION_0(&dword_1B03C2000, v2, v3, "Trying to talk to library manager before opening it", v4, v5, v6, v7, 0);

  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Implementations/Daemon/CPLProxyLibraryManager.m");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_2(), "handleFailureInMethod:object:file:lineNumber:description:");

  abort();
}

void __52__CPLProxyLibraryManager_openWithCompletionHandler___block_invoke_cold_1(char a1, id *a2, uint64_t a3)
{
  NSObject *v3;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((a1 & 1) != 0)
  {
    __CPLGenericOSLogDomain();
    v6 = objc_claimAutoreleasedReturnValue();
    if (OUTLINED_FUNCTION_1(v6))
    {
      objc_msgSend(*a2, "abstractObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v14 = v7;
      _os_log_impl(&dword_1B03C2000, v3, OS_LOG_TYPE_ERROR, "Trying to open %@ twice", buf, 0xCu);

    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a3 + 48);
  v10 = *a2;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Implementations/Daemon/CPLProxyLibraryManager.m");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*a2, "abstractObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", v9, v10, v11, 570, CFSTR("Trying to open %@ twice"), v12);

  abort();
}

- (void)_invokeOutstandingInvocationsWithTaskIdentifier:.cold.1()
{
  void *v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  if (!_CPLSilentLogging)
  {
    __CPLGenericOSLogDomain();
    v1 = objc_claimAutoreleasedReturnValue();
    if (OUTLINED_FUNCTION_1(v1))
      OUTLINED_FUNCTION_0(&dword_1B03C2000, v2, v3, "Inconsistency in outstanding invocations", v4, v5, v6, v7, 0);

  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Implementations/Daemon/CPLProxyLibraryManager.m");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_2(), "handleFailureInMethod:object:file:lineNumber:description:");

  abort();
}

void __115__CPLProxyLibraryManager_beginDownloadForResource_clientBundleID_options_proposedTaskIdentifier_completionHandler___block_invoke_2_cold_1()
{
  void *v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  if (!_CPLSilentLogging)
  {
    __CPLGenericOSLogDomain();
    v1 = objc_claimAutoreleasedReturnValue();
    if (OUTLINED_FUNCTION_1(v1))
      OUTLINED_FUNCTION_0(&dword_1B03C2000, v2, v3, "Inconistency in outstanding invocations", v4, v5, v6, v7, 0);

  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Implementations/Daemon/CPLProxyLibraryManager.m");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_2(), "handleFailureInMethod:object:file:lineNumber:description:");

  abort();
}

void __91__CPLProxyLibraryManager_beginInMemoryDownloadOfResource_clientBundleID_completionHandler___block_invoke_2_cold_1()
{
  void *v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  if (!_CPLSilentLogging)
  {
    __CPLGenericOSLogDomain();
    v1 = objc_claimAutoreleasedReturnValue();
    if (OUTLINED_FUNCTION_1(v1))
      OUTLINED_FUNCTION_0(&dword_1B03C2000, v2, v3, "Inconistency in outstanding invocations", v4, v5, v6, v7, 0);

  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Implementations/Daemon/CPLProxyLibraryManager.m");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_2(), "handleFailureInMethod:object:file:lineNumber:description:");

  abort();
}

- (void)_invokeSyncOutstandingInvocationsWithTaskIdentifier:.cold.1()
{
  void *v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  if (!_CPLSilentLogging)
  {
    __CPLGenericOSLogDomain();
    v1 = objc_claimAutoreleasedReturnValue();
    if (OUTLINED_FUNCTION_1(v1))
      OUTLINED_FUNCTION_0(&dword_1B03C2000, v2, v3, "Inconsistency in outstanding invocations", v4, v5, v6, v7, 0);

  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Implementations/Daemon/CPLProxyLibraryManager.m");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_2(), "handleFailureInMethod:object:file:lineNumber:description:");

  abort();
}

void __83__CPLProxyLibraryManager_forceSynchronizingScopeWithIdentifiers_completionHandler___block_invoke_2_cold_1()
{
  void *v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  if (!_CPLSilentLogging)
  {
    __CPLGenericOSLogDomain();
    v1 = objc_claimAutoreleasedReturnValue();
    if (OUTLINED_FUNCTION_1(v1))
      OUTLINED_FUNCTION_0(&dword_1B03C2000, v2, v3, "Inconistency in outstanding invocations", v4, v5, v6, v7, 0);

  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Implementations/Daemon/CPLProxyLibraryManager.m");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_2(), "handleFailureInMethod:object:file:lineNumber:description:");

  abort();
}

@end

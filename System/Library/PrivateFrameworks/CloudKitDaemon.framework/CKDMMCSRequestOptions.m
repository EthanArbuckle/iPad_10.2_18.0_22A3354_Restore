@implementation CKDMMCSRequestOptions

- (CKDMMCSRequestOptions)initWithOperation:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  CKDMMCSRequestOptions *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  CKContainerID *containerID;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  NSString *topmostParentOperationGroupID;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  NSString *topmostParentOperationGroupName;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  NSString *topmostParentOperationID;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  NSString *applicationBundleIdentifierForContainerAccess;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  NSString *applicationBundleIdentifierForNetworkAttribution;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  NSString *applicationSecondaryID;
  const char *v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  C2MetricOptions *metricOptions;
  const char *v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  C2NetworkingDelegate *networkingDelegate;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  NSNumber *cacheDeleteAvailableSpaceClass;
  const char *v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  NSString *deviceHardwareID;
  uint64_t v96;
  CKOperationMMCSRequestOptions *MMCSRequestOptions;
  objc_super v99;

  v4 = a3;
  v99.receiver = self;
  v99.super_class = (Class)CKDMMCSRequestOptions;
  v7 = -[CKDMMCSRequestOptions init](&v99, sel_init);
  if (v7)
  {
    objc_msgSend_container(v4, v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_databaseScope = objc_msgSend_databaseScope(v4, v9, v10);
    objc_msgSend_containerID(v8, v11, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    containerID = v7->_containerID;
    v7->_containerID = (CKContainerID *)v13;

    objc_msgSend_topmostParentOperation(v4, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_operationInfo(v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_group(v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_operationGroupID(v23, v24, v25);
    v26 = objc_claimAutoreleasedReturnValue();
    topmostParentOperationGroupID = v7->_topmostParentOperationGroupID;
    v7->_topmostParentOperationGroupID = (NSString *)v26;

    objc_msgSend_operationInfo(v17, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_group(v30, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v33, v34, v35);
    v36 = objc_claimAutoreleasedReturnValue();
    topmostParentOperationGroupName = v7->_topmostParentOperationGroupName;
    v7->_topmostParentOperationGroupName = (NSString *)v36;

    objc_msgSend_operationID(v17, v38, v39);
    v40 = objc_claimAutoreleasedReturnValue();
    topmostParentOperationID = v7->_topmostParentOperationID;
    v7->_topmostParentOperationID = (NSString *)v40;

    objc_msgSend_applicationBundleIdentifierForContainerAccess(v4, v42, v43);
    v44 = objc_claimAutoreleasedReturnValue();
    applicationBundleIdentifierForContainerAccess = v7->_applicationBundleIdentifierForContainerAccess;
    v7->_applicationBundleIdentifierForContainerAccess = (NSString *)v44;

    objc_msgSend_applicationBundleIdentifierForNetworkAttribution(v4, v46, v47);
    v48 = objc_claimAutoreleasedReturnValue();
    applicationBundleIdentifierForNetworkAttribution = v7->_applicationBundleIdentifierForNetworkAttribution;
    v7->_applicationBundleIdentifierForNetworkAttribution = (NSString *)v48;

    objc_msgSend_sourceApplicationSecondaryIdentifier(v4, v50, v51);
    v52 = objc_claimAutoreleasedReturnValue();
    applicationSecondaryID = v7->_applicationSecondaryID;
    v7->_applicationSecondaryID = (NSString *)v52;

    v7->_allowsCellularAccess = objc_msgSend_allowsCellularAccess(v4, v54, v55);
    v7->_allowsExpensiveNetworkAccess = objc_msgSend_allowsExpensiveNetworkAccess(v4, v56, v57);
    objc_msgSend_entitlements(v8, v58, v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_allowsPowerNapScheduling = objc_msgSend_hasDarkWakeNetworkReachabilityEnabledEntitlement(v60, v61, v62);

    v7->_qualityOfService = objc_msgSend_qualityOfService(v4, v63, v64);
    v7->_clientQueuePriority = objc_msgSend_clientQueuePriority(v4, v65, v66);
    v7->_resolvedAutomaticallyRetryNetworkFailures = objc_msgSend_resolvedAutomaticallyRetryNetworkFailures(v4, v67, v68);
    v7->_resolvedDiscretionaryNetworkBehavior = objc_msgSend_resolvedDiscretionaryNetworkBehavior(v4, v69, v70);
    v7->_duetPreClearedMode = objc_msgSend_duetPreClearedMode(v4, v71, v72);
    objc_msgSend_metricOptionsForNetworkOperation_(MEMORY[0x1E0D03760], v73, (uint64_t)v4);
    v74 = objc_claimAutoreleasedReturnValue();
    metricOptions = v7->_metricOptions;
    v7->_metricOptions = (C2MetricOptions *)v74;

    objc_msgSend_deviceContext(v4, v76, v77);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_testServer(v78, v79, v80);
    v81 = (void *)objc_claimAutoreleasedReturnValue();

    if (v81 && (objc_msgSend_useLiveServer(v81, v82, v83) & 1) == 0)
    {
      objc_msgSend_networkingDelegate(v81, v82, v83);
      v84 = objc_claimAutoreleasedReturnValue();
      networkingDelegate = v7->_networkingDelegate;
      v7->_networkingDelegate = (C2NetworkingDelegate *)v84;

    }
    v7->_networkServiceType = objc_msgSend_networkServiceType(v4, v82, v83);
    objc_msgSend_cacheDeleteAvailableSpaceClass(v4, v86, v87);
    v88 = objc_claimAutoreleasedReturnValue();
    cacheDeleteAvailableSpaceClass = v7->_cacheDeleteAvailableSpaceClass;
    v7->_cacheDeleteAvailableSpaceClass = (NSNumber *)v88;

    if ((objc_msgSend_preferAnonymousRequests(v4, v90, v91) & 1) == 0)
    {
      objc_msgSend_hardwareID(v8, v92, v93);
      v94 = objc_claimAutoreleasedReturnValue();
      deviceHardwareID = v7->_deviceHardwareID;
      v7->_deviceHardwareID = (NSString *)v94;

    }
    objc_msgSend_MMCSRequestOptions(v4, v92, v93);
    v96 = objc_claimAutoreleasedReturnValue();
    MMCSRequestOptions = v7->_MMCSRequestOptions;
    v7->_MMCSRequestOptions = (CKOperationMMCSRequestOptions *)v96;

  }
  return v7;
}

- (id)CKPropertiesDescription
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  const char *v24;
  void *v25;
  const char *v26;
  void *v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  void *v37;
  const char *v38;
  const char *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  int v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  int v60;
  const char *v61;
  uint64_t v62;
  const char *v63;
  void *v64;
  void *v65;
  const char *v66;
  void *v67;
  const char *v68;
  void *v69;

  objc_msgSend_arrayWithCapacity_(MEMORY[0x1E0C99DE8], a2, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_containerID(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ckShortDescription(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_applicationBundleIdentifierForNetworkAttribution(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v4, v14, (uint64_t)CFSTR("containerID=%@, applicationBundleIdentifierForNetworkAttribution=\"%@\"), v10, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v16, (uint64_t)v15);

  objc_msgSend_applicationSecondaryID(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v22 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_applicationSecondaryID(self, v20, v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v22, v24, (uint64_t)CFSTR("applicationSecondaryID=\"%@\"), v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v3, v26, (uint64_t)v25);

  }
  v27 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_resolvedDiscretionaryNetworkBehavior(self, v20, v21);
  CKStringForDiscretionaryNetworkBehavior();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v27, v29, (uint64_t)CFSTR("discretionary=\"%@\"), v28);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v31, (uint64_t)v30);

  v32 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_duetPreClearedMode(self, v33, v34);
  CKStringForDuetPreClearedMode();
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v32, v36, (uint64_t)CFSTR("duetPreClearedMode=\"%@\"), v35);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v38, (uint64_t)v37);

  objc_msgSend_arrayWithCapacity_(MEMORY[0x1E0C99DE8], v39, 4);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_resolvedAutomaticallyRetryNetworkFailures(self, v41, v42))
    objc_msgSend_addObject_(v40, v43, (uint64_t)CFSTR("automatically-retry-network-failures"));
  if (objc_msgSend_allowsCellularAccess(self, v43, v44))
    objc_msgSend_addObject_(v40, v45, (uint64_t)CFSTR("allows-cellular"));
  if (objc_msgSend_allowsExpensiveNetworkAccess(self, v45, v46))
    objc_msgSend_addObject_(v40, v47, (uint64_t)CFSTR("allows-expensive"));
  if (objc_msgSend_allowsPowerNapScheduling(self, v47, v48))
    objc_msgSend_addObject_(v40, v49, (uint64_t)CFSTR("allows-power-nap-scheduling"));
  objc_msgSend_MMCSRequestOptions(self, v49, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend_resumableContainerLimpMode(v51, v52, v53);

  if (v54)
    objc_msgSend_addObject_(v40, v55, (uint64_t)CFSTR("resumable-container-limp-mode"));
  objc_msgSend_MMCSRequestOptions(self, v55, v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = objc_msgSend_chunkingLibraryCorruptionMode(v57, v58, v59);

  if (v60)
    objc_msgSend_addObject_(v40, v61, (uint64_t)CFSTR("chunking-library-corruption-mode"));
  if (objc_msgSend_count(v40, v61, v62))
  {
    v64 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_componentsJoinedByString_(v40, v63, (uint64_t)CFSTR("|"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v64, v66, (uint64_t)CFSTR("flags=%@"), v65);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v3, v68, (uint64_t)v67);

  }
  objc_msgSend_componentsJoinedByString_(v3, v63, (uint64_t)CFSTR(", "));
  v69 = (void *)objc_claimAutoreleasedReturnValue();

  return v69;
}

- (id)description
{
  return (id)((uint64_t (*)(CKDMMCSRequestOptions *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
}

- (BOOL)usesBackgroundSession
{
  uint64_t v2;
  char v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;

  v4 = objc_msgSend_resolvedAutomaticallyRetryNetworkFailures(self, a2, v2);
  v7 = objc_msgSend_resolvedDiscretionaryNetworkBehavior(self, v5, v6);
  if (objc_msgSend_duetPreClearedMode(self, v8, v9) | v7)
    return 1;
  else
    return v4;
}

- (id)MMCSOptions
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  __CFString *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  void *v107;
  const char *v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  const char *v112;
  uint64_t v113;
  void *v114;
  void *v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  const char *v121;
  void *v122;
  const char *v123;
  uint64_t v124;
  void *v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  const char *v129;
  void *v130;
  const char *v131;
  const char *v132;
  uint64_t v133;
  int v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  const char *v138;
  uint64_t v139;
  const char *v140;
  const char *v141;
  uint64_t v142;
  const char *v143;
  const char *v144;
  uint64_t v145;
  void *v146;
  const char *v147;
  uint64_t v148;
  void *v149;
  const char *v150;
  const char *v151;
  uint64_t v152;
  void *v153;
  const char *v154;
  void *v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  const char *v159;
  void *v160;
  const char *v161;
  const char *v162;
  uint64_t v163;
  uint64_t v164;
  const char *v165;
  void *v166;
  const char *v167;
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  const char *v171;
  void *v172;
  const char *v173;
  const char *v174;
  uint64_t v175;
  const char *v176;
  const char *v177;
  C2MetricOptions *metricOptions;
  const char *v179;
  uint64_t v180;
  void *v181;
  const char *v182;
  uint64_t v183;
  uint64_t v184;
  void *v185;
  const char *v186;
  const char *v187;
  uint64_t v188;
  void *v189;
  const char *v190;
  const char *v191;
  uint64_t v192;
  uint64_t v193;
  const char *v194;
  uint64_t v195;
  void *v196;
  void *v197;
  const char *v198;
  uint64_t v199;
  uint64_t v200;
  void *v201;
  const char *v202;
  void *v203;
  const char *v204;
  uint64_t v205;
  void *v206;
  const char *v207;
  void *v208;
  const char *v209;
  void *v210;
  const char *v211;
  uint64_t v212;
  void *v213;
  const char *v214;
  const char *v215;
  void *v216;
  const char *v217;
  uint64_t v218;
  int v219;
  const char *v220;
  uint64_t v221;
  void *v222;
  const char *v223;
  uint64_t v224;
  int v225;
  const char *v226;
  uint64_t v227;
  void *v228;
  const char *v229;
  uint64_t v230;
  int v231;
  const char *v232;
  void *v233;
  const char *v234;
  const char *v235;
  uint64_t v236;
  const char *v237;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  objc_msgSend_applicationBundleIdentifierForNetworkAttribution(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_length(v7, v8, v9);

  if (v10)
  {
    objc_msgSend_applicationBundleIdentifierForNetworkAttribution(self, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v4, v14, (uint64_t)v13, *MEMORY[0x1E0D468E0]);

  }
  objc_msgSend_applicationSecondaryID(self, v11, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend_length(v15, v16, v17);

  if (v18)
  {
    objc_msgSend_applicationSecondaryID(self, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v4, v22, (uint64_t)v21, *MEMORY[0x1E0D468E8]);

  }
  v23 = (void *)objc_opt_new();
  objc_msgSend_containerID(self, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerIdentifier(v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend_length(v29, v30, v31);

  if (v32)
  {
    objc_msgSend_containerID(self, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_containerIdentifier(v35, v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v23, v39, (uint64_t)v38, CFSTR("X-CloudKit-Container"));

  }
  objc_msgSend_containerID(self, v33, v34);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_environment(v40, v41, v42) == 1)
  {
    v44 = CFSTR("production");
    objc_msgSend_setObject_forKeyedSubscript_(v23, v43, (uint64_t)CFSTR("production"), 0x1E7840E68);
  }
  else
  {
    v44 = CFSTR("sandbox");
    objc_msgSend_setObject_forKeyedSubscript_(v23, v43, (uint64_t)CFSTR("sandbox"), 0x1E7840E68);
  }

  objc_msgSend_databaseScope(self, v45, v46);
  CKDatabaseScopeString();
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v23, v48, (uint64_t)v47, 0x1E7840E88);

  objc_msgSend_duetPreClearedMode(self, v49, v50);
  CKStringForDuetPreClearedMode();
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v23, v52, (uint64_t)v51, 0x1E7840EA8);

  objc_msgSend_topmostParentOperationID(self, v53, v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = objc_msgSend_length(v55, v56, v57);

  if (v58)
  {
    objc_msgSend_topmostParentOperationID(self, v59, v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v23, v62, (uint64_t)v61, 0x1E7840CC8);

  }
  objc_msgSend_topmostParentOperationGroupID(self, v59, v60);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = objc_msgSend_length(v63, v64, v65);

  if (v66)
  {
    objc_msgSend_topmostParentOperationGroupID(self, v67, v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v23, v70, (uint64_t)v69, 0x1E7840CE8);

  }
  objc_msgSend_applicationBundleIdentifierForContainerAccess(self, v67, v68);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = objc_msgSend_length(v71, v72, v73);

  if (v74)
  {
    objc_msgSend_applicationBundleIdentifierForContainerAccess(self, v75, v76);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v23, v78, (uint64_t)v77, CFSTR("X-CloudKit-App-BundleID"));

  }
  objc_msgSend_topmostParentOperationGroupName(self, v75, v76);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = objc_msgSend_length(v79, v80, v81);

  if (v82)
  {
    objc_msgSend_containerID(self, v83, v84);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = objc_msgSend_specialContainerType(v85, v86, v87);

    if (v88 == 5)
    {
      objc_msgSend_topmostParentOperationGroupName(self, v89, v90);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKProbablySafeHeaderValue(v91, v92, v93);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v23, v95, (uint64_t)v94, 0x1E7840D08);

    }
    objc_msgSend_topmostParentOperationGroupName(self, v89, v90);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKBase64EncodedStructuredHeaderValueByteSequence(v96, v97, v98);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v23, v100, (uint64_t)v99, 0x1E7840D28);

  }
  objc_msgSend_zoneNames(self, v83, v84);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = objc_msgSend_count(v101, v102, v103);

  if (v104)
  {
    objc_msgSend_zoneNames(self, v105, v106);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_componentsJoinedByString_(v107, v108, (uint64_t)CFSTR(","));
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v23, v110, (uint64_t)v109, CFSTR("X-CloudKit-Zones"));

  }
  objc_msgSend_deviceHardwareID(self, v105, v106);
  v111 = objc_claimAutoreleasedReturnValue();
  if (v111)
  {
    v114 = (void *)v111;
    objc_msgSend_deviceHardwareID(self, v112, v113);
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    v118 = objc_msgSend_length(v115, v116, v117);

    if (v118)
    {
      objc_msgSend_deviceHardwareID(self, v112, v119);
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v23, v121, (uint64_t)v120, CFSTR("X-CloudKit-DeviceID"));

    }
  }
  objc_msgSend_setObject_forKeyedSubscript_(v4, v112, (uint64_t)v23, *MEMORY[0x1E0D46868]);
  v122 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_containerID(self, v123, v124);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  v128 = objc_msgSend_c2ContainerType(v125, v126, v127);
  objc_msgSend_numberWithLong_(v122, v129, v128);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v4, v131, (uint64_t)v130, *MEMORY[0x1E0D46848]);

  v134 = objc_msgSend_allowsCellularAccess(self, v132, v133);
  v136 = *MEMORY[0x1E0C9AE50];
  v137 = *MEMORY[0x1E0C9AE40];
  if (v134)
    objc_msgSend_setObject_forKeyedSubscript_(v4, v135, *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0D467F8]);
  else
    objc_msgSend_setObject_forKeyedSubscript_(v4, v135, *MEMORY[0x1E0C9AE40], *MEMORY[0x1E0D467F8]);
  if (objc_msgSend_allowsExpensiveNetworkAccess(self, v138, v139))
    objc_msgSend_setObject_forKeyedSubscript_(v4, v140, v136, *MEMORY[0x1E0D46800]);
  else
    objc_msgSend_setObject_forKeyedSubscript_(v4, v140, v137, *MEMORY[0x1E0D46800]);
  if (objc_msgSend_allowsPowerNapScheduling(self, v141, v142))
    objc_msgSend_setObject_forKeyedSubscript_(v4, v143, v136, *MEMORY[0x1E0D46808]);
  else
    objc_msgSend_setObject_forKeyedSubscript_(v4, v143, v137, *MEMORY[0x1E0D46808]);
  objc_msgSend_networkingDelegate(self, v144, v145);
  v146 = (void *)objc_claimAutoreleasedReturnValue();

  if (v146)
  {
    objc_msgSend_networkingDelegate(self, v147, v148);
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v4, v150, (uint64_t)v149, *MEMORY[0x1E0D46890]);

  }
  v152 = objc_msgSend_networkServiceType(self, v147, v148);
  if (!v152)
  {
    if (!objc_msgSend_resolvedDiscretionaryNetworkBehavior(self, v151, 0))
    {
      objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v151, 0);
      goto LABEL_41;
    }
    v152 = 3;
  }
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v151, v152);
LABEL_41:
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v4, v154, (uint64_t)v153, *MEMORY[0x1E0D46888]);

  v155 = (void *)MEMORY[0x1E0CB37E8];
  v158 = objc_msgSend_qualityOfService(self, v156, v157);
  objc_msgSend_numberWithInteger_(v155, v159, v158);
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v4, v161, (uint64_t)v160, *MEMORY[0x1E0D468A8]);

  v164 = objc_msgSend_resolvedDiscretionaryNetworkBehavior(self, v162, v163);
  if (v164 == 2)
    objc_msgSend_numberWithLong_(MEMORY[0x1E0CB37E8], v165, 2);
  else
    objc_msgSend_numberWithLong_(MEMORY[0x1E0CB37E8], v165, v164 == 1);
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v4, v167, (uint64_t)v166, *MEMORY[0x1E0D46850]);

  v170 = objc_msgSend_duetPreClearedMode(self, v168, v169);
  if (v170 == 2)
    objc_msgSend_numberWithLong_(MEMORY[0x1E0CB37E8], v171, 2);
  else
    objc_msgSend_numberWithLong_(MEMORY[0x1E0CB37E8], v171, v170 == 1);
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v4, v173, (uint64_t)v172, *MEMORY[0x1E0D46858]);

  if (objc_msgSend_resolvedAutomaticallyRetryNetworkFailures(self, v174, v175))
    objc_msgSend_setObject_forKeyedSubscript_(v4, v176, v136, *MEMORY[0x1E0D46810]);
  else
    objc_msgSend_setObject_forKeyedSubscript_(v4, v176, v137, *MEMORY[0x1E0D46810]);
  metricOptions = self->_metricOptions;
  if (metricOptions)
    objc_msgSend_setObject_forKeyedSubscript_(v4, v177, (uint64_t)metricOptions, *MEMORY[0x1E0D46880]);
  if (objc_msgSend_usesBackgroundSession(self, v177, (uint64_t)metricOptions))
  {
    objc_msgSend_sharedURLSessionPool(CKDURLSessionPool, v179, v180);
    v181 = (void *)objc_claimAutoreleasedReturnValue();
    v184 = objc_msgSend_backgroundSessionConnectionPoolLimit(v181, v182, v183);

    if ((_DWORD)v184)
    {
      objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v179, v184);
      v185 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v4, v186, (uint64_t)v185, *MEMORY[0x1E0D46828]);

      objc_msgSend_backgroundSessionConnectionPoolName(CKDURLSessionPool, v187, v188);
      v189 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v4, v190, (uint64_t)v189, *MEMORY[0x1E0D46820]);

    }
  }
  objc_msgSend_setObject_forKeyedSubscript_(v3, v179, (uint64_t)v4, *MEMORY[0x1E0D468F0]);
  objc_msgSend_authPutResponse(self, v191, v192);
  v193 = objc_claimAutoreleasedReturnValue();
  if (v193)
  {
    v196 = (void *)v193;
    objc_msgSend_authPutResponse(self, v194, v195);
    v197 = (void *)objc_claimAutoreleasedReturnValue();
    v200 = objc_msgSend_length(v197, v198, v199);

    if (v200)
    {
      objc_msgSend_authPutResponse(self, v194, v195);
      v201 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v3, v202, (uint64_t)v201, *MEMORY[0x1E0D46898]);

    }
  }
  objc_msgSend_authPutResponseHeaders(self, v194, v195);
  v203 = (void *)objc_claimAutoreleasedReturnValue();

  if (v203)
  {
    objc_msgSend_authPutResponseHeaders(self, v204, v205);
    v206 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKObjectForKeyCaseInsensitive_(v206, v207, (uint64_t)CFSTR("x-apple-mmcs-proto-version"));
    v208 = (void *)objc_claimAutoreleasedReturnValue();

    if (v208)
      objc_msgSend_setObject_forKeyedSubscript_(v3, v209, (uint64_t)v208, *MEMORY[0x1E0D468D8]);

  }
  objc_msgSend_cacheDeleteAvailableSpaceClass(self, v204, v205);
  v210 = (void *)objc_claimAutoreleasedReturnValue();

  if (v210)
  {
    objc_msgSend_cacheDeleteAvailableSpaceClass(self, v211, v212);
    v213 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v3, v214, (uint64_t)v213, *MEMORY[0x1E0D46830]);

    objc_msgSend_setObject_forKeyedSubscript_(v3, v215, MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D46860]);
  }
  objc_msgSend_MMCSRequestOptions(self, v211, v212);
  v216 = (void *)objc_claimAutoreleasedReturnValue();
  v219 = objc_msgSend_resumableContainerLimpMode(v216, v217, v218);

  if (v219)
    objc_msgSend_setObject_forKeyedSubscript_(v3, v220, MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D468B8]);
  objc_msgSend_MMCSRequestOptions(self, v220, v221);
  v222 = (void *)objc_claimAutoreleasedReturnValue();
  v225 = objc_msgSend_chunkingLibraryCorruptionMode(v222, v223, v224);

  if (v225)
    objc_msgSend_setObject_forKeyedSubscript_(v3, v226, MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D46838]);
  objc_msgSend_MMCSRequestOptions(self, v226, v227);
  v228 = (void *)objc_claimAutoreleasedReturnValue();
  v231 = objc_msgSend_insufficientDiskSpaceMode(v228, v229, v230);

  if (v231)
    objc_msgSend_setObject_forKeyedSubscript_(v3, v232, MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D46870]);
  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v232, self->_clientQueuePriority);
  v233 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v234, (uint64_t)v233, *MEMORY[0x1E0D468A0]);

  if (objc_msgSend_useFORD(self, v235, v236))
    objc_msgSend_setObject_forKeyedSubscript_(v3, v237, MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D468F8]);

  return v3;
}

- (int64_t)databaseScope
{
  return self->_databaseScope;
}

- (void)setDatabaseScope:(int64_t)a3
{
  self->_databaseScope = a3;
}

- (CKContainerID)containerID
{
  return self->_containerID;
}

- (void)setContainerID:(id)a3
{
  objc_storeStrong((id *)&self->_containerID, a3);
}

- (NSString)topmostParentOperationID
{
  return self->_topmostParentOperationID;
}

- (void)setTopmostParentOperationID:(id)a3
{
  objc_storeStrong((id *)&self->_topmostParentOperationID, a3);
}

- (NSString)topmostParentOperationGroupID
{
  return self->_topmostParentOperationGroupID;
}

- (void)setTopmostParentOperationGroupID:(id)a3
{
  objc_storeStrong((id *)&self->_topmostParentOperationGroupID, a3);
}

- (NSString)topmostParentOperationGroupName
{
  return self->_topmostParentOperationGroupName;
}

- (void)setTopmostParentOperationGroupName:(id)a3
{
  objc_storeStrong((id *)&self->_topmostParentOperationGroupName, a3);
}

- (NSString)applicationBundleIdentifierForContainerAccess
{
  return self->_applicationBundleIdentifierForContainerAccess;
}

- (void)setApplicationBundleIdentifierForContainerAccess:(id)a3
{
  objc_storeStrong((id *)&self->_applicationBundleIdentifierForContainerAccess, a3);
}

- (NSString)applicationBundleIdentifierForNetworkAttribution
{
  return self->_applicationBundleIdentifierForNetworkAttribution;
}

- (void)setApplicationBundleIdentifierForNetworkAttribution:(id)a3
{
  objc_storeStrong((id *)&self->_applicationBundleIdentifierForNetworkAttribution, a3);
}

- (NSString)applicationSecondaryID
{
  return self->_applicationSecondaryID;
}

- (void)setApplicationSecondaryID:(id)a3
{
  objc_storeStrong((id *)&self->_applicationSecondaryID, a3);
}

- (NSArray)zoneNames
{
  return self->_zoneNames;
}

- (void)setZoneNames:(id)a3
{
  objc_storeStrong((id *)&self->_zoneNames, a3);
}

- (NSString)deviceHardwareID
{
  return self->_deviceHardwareID;
}

- (void)setDeviceHardwareID:(id)a3
{
  objc_storeStrong((id *)&self->_deviceHardwareID, a3);
}

- (NSData)authPutResponse
{
  return self->_authPutResponse;
}

- (void)setAuthPutResponse:(id)a3
{
  objc_storeStrong((id *)&self->_authPutResponse, a3);
}

- (NSDictionary)authPutResponseHeaders
{
  return self->_authPutResponseHeaders;
}

- (void)setAuthPutResponseHeaders:(id)a3
{
  objc_storeStrong((id *)&self->_authPutResponseHeaders, a3);
}

- (BOOL)allowsCellularAccess
{
  return self->_allowsCellularAccess;
}

- (void)setAllowsCellularAccess:(BOOL)a3
{
  self->_allowsCellularAccess = a3;
}

- (BOOL)allowsExpensiveNetworkAccess
{
  return self->_allowsExpensiveNetworkAccess;
}

- (void)setAllowsExpensiveNetworkAccess:(BOOL)a3
{
  self->_allowsExpensiveNetworkAccess = a3;
}

- (BOOL)allowsPowerNapScheduling
{
  return self->_allowsPowerNapScheduling;
}

- (void)setAllowsPowerNapScheduling:(BOOL)a3
{
  self->_allowsPowerNapScheduling = a3;
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (void)setQualityOfService:(int64_t)a3
{
  self->_qualityOfService = a3;
}

- (int64_t)clientQueuePriority
{
  return self->_clientQueuePriority;
}

- (void)setClientQueuePriority:(int64_t)a3
{
  self->_clientQueuePriority = a3;
}

- (BOOL)resolvedAutomaticallyRetryNetworkFailures
{
  return self->_resolvedAutomaticallyRetryNetworkFailures;
}

- (void)setResolvedAutomaticallyRetryNetworkFailures:(BOOL)a3
{
  self->_resolvedAutomaticallyRetryNetworkFailures = a3;
}

- (unint64_t)resolvedDiscretionaryNetworkBehavior
{
  return self->_resolvedDiscretionaryNetworkBehavior;
}

- (void)setResolvedDiscretionaryNetworkBehavior:(unint64_t)a3
{
  self->_resolvedDiscretionaryNetworkBehavior = a3;
}

- (unint64_t)duetPreClearedMode
{
  return self->_duetPreClearedMode;
}

- (void)setDuetPreClearedMode:(unint64_t)a3
{
  self->_duetPreClearedMode = a3;
}

- (C2MetricOptions)metricOptions
{
  return self->_metricOptions;
}

- (void)setMetricOptions:(id)a3
{
  objc_storeStrong((id *)&self->_metricOptions, a3);
}

- (BOOL)isCrossOwner
{
  return self->_isCrossOwner;
}

- (void)setIsCrossOwner:(BOOL)a3
{
  self->_isCrossOwner = a3;
}

- (NSNumber)cacheDeleteAvailableSpaceClass
{
  return self->_cacheDeleteAvailableSpaceClass;
}

- (void)setCacheDeleteAvailableSpaceClass:(id)a3
{
  objc_storeStrong((id *)&self->_cacheDeleteAvailableSpaceClass, a3);
}

- (BOOL)shouldCloneFileInAssetCache
{
  return self->_shouldCloneFileInAssetCache;
}

- (void)setShouldCloneFileInAssetCache:(BOOL)a3
{
  self->_shouldCloneFileInAssetCache = a3;
}

- (BOOL)useFORD
{
  return self->_useFORD;
}

- (void)setUseFORD:(BOOL)a3
{
  self->_useFORD = a3;
}

- (C2NetworkingDelegate)networkingDelegate
{
  return self->_networkingDelegate;
}

- (void)setNetworkingDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_networkingDelegate, a3);
}

- (unint64_t)networkServiceType
{
  return self->_networkServiceType;
}

- (void)setNetworkServiceType:(unint64_t)a3
{
  self->_networkServiceType = a3;
}

- (CKOperationMMCSRequestOptions)MMCSRequestOptions
{
  return self->_MMCSRequestOptions;
}

- (void)setMMCSRequestOptions:(id)a3
{
  objc_storeStrong((id *)&self->_MMCSRequestOptions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_MMCSRequestOptions, 0);
  objc_storeStrong((id *)&self->_networkingDelegate, 0);
  objc_storeStrong((id *)&self->_cacheDeleteAvailableSpaceClass, 0);
  objc_storeStrong((id *)&self->_metricOptions, 0);
  objc_storeStrong((id *)&self->_authPutResponseHeaders, 0);
  objc_storeStrong((id *)&self->_authPutResponse, 0);
  objc_storeStrong((id *)&self->_deviceHardwareID, 0);
  objc_storeStrong((id *)&self->_zoneNames, 0);
  objc_storeStrong((id *)&self->_applicationSecondaryID, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifierForNetworkAttribution, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifierForContainerAccess, 0);
  objc_storeStrong((id *)&self->_topmostParentOperationGroupName, 0);
  objc_storeStrong((id *)&self->_topmostParentOperationGroupID, 0);
  objc_storeStrong((id *)&self->_topmostParentOperationID, 0);
  objc_storeStrong((id *)&self->_containerID, 0);
}

@end

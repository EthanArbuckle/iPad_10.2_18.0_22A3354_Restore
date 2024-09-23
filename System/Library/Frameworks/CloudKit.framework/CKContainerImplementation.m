@implementation CKContainerImplementation

- (CKRecordID)containerScopedUserID
{
  dispatch_assert_queue_V2((dispatch_queue_t)qword_1ECD96A88);
  return self->_containerScopedUserID_locked;
}

- (void)setOrgAdminUserID:(id)a3
{
  NSObject *v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  CKRecordID *v9;
  CKRecordID *orgAdminUserID_locked;

  v4 = qword_1ECD96A88;
  v5 = a3;
  dispatch_assert_queue_V2(v4);
  v9 = (CKRecordID *)objc_msgSend_copy(v5, v6, v7, v8);

  orgAdminUserID_locked = self->_orgAdminUserID_locked;
  self->_orgAdminUserID_locked = v9;

}

- (void)setContainerScopedUserID:(id)a3
{
  NSObject *v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  CKRecordID *v9;
  CKRecordID *containerScopedUserID_locked;

  v4 = qword_1ECD96A88;
  v5 = a3;
  dispatch_assert_queue_V2(v4);
  v9 = (CKRecordID *)objc_msgSend_copy(v5, v6, v7, v8);

  containerScopedUserID_locked = self->_containerScopedUserID_locked;
  self->_containerScopedUserID_locked = v9;

}

- (void)setSourceApplicationBundleIdentifier:(id)a3
{
  id v5;
  NSObject *v6;
  CKContainerImplementation *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v6 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    v16 = 138543362;
    v17 = v5;
    _os_log_debug_impl(&dword_18A5C5000, v6, OS_LOG_TYPE_DEBUG, "setSourceApplicationBundleIdentifier:%{public}@", (uint8_t *)&v16, 0xCu);
  }
  v7 = self;
  objc_sync_enter(v7);
  objc_storeStrong((id *)&v7->_sourceApplicationBundleIdentifier_locked, a3);
  objc_msgSend_setApplicationBundleIdentifierOverrideForContainerAccess_(v7->_options, v8, (uint64_t)v5, v9);
  objc_msgSend_setApplicationBundleIdentifierOverrideForNetworkAttribution_(v7->_options, v10, (uint64_t)v5, v11);
  objc_msgSend_setApplicationBundleIdentifierOverrideForPushTopicGeneration_(v7->_options, v12, (uint64_t)v5, v13);
  objc_msgSend_setHasCachedSetupInfo_(v7, v14, 0, v15);
  objc_sync_exit(v7);

}

- (id)description
{
  return (id)((uint64_t (*)(CKContainerImplementation *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
}

- (CKContainerImplementation)initWithContainerID:(id)a3 options:(id)a4 unconfiguredWrappingContainer:(id)a5
{
  const __CFString *v5;
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  CKContainerImplementation *v15;
  CKContainerImplementation *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  CKContainerOptions *options;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  CKEntitlements *resolvedEntitlements;
  CKEntitlements *v46;
  CKEntitlements *v47;
  uint64_t v48;
  const char *v49;
  id v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  int hasMasqueradingEntitlement;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  uint64_t hasTemporaryDeviceCapabilitiesEntitlement;
  const char *v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  int v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  void *v81;
  BOOL v82;
  NSObject *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  CKContainerID *containerID;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  id v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  const char *v100;
  NSObject *v101;
  dispatch_queue_t v102;
  OS_dispatch_queue *underlyingDispatchQueue;
  uint64_t v104;
  NSOperationQueue *convenienceOperationQueue;
  const char *v106;
  uint64_t v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  NSOperationQueue *throttlingOperationQueue;
  const char *v112;
  uint64_t v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  NSOperationQueue *backgroundThrottlingOperationQueue;
  const char *v118;
  uint64_t v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  NSOperationQueue *discretionaryThrottlingOperationQueue;
  const char *v124;
  uint64_t v125;
  const char *v126;
  uint64_t v127;
  NSMutableArray *v128;
  NSMutableArray *sandboxExtensionHandles;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  NSHashTable *sharingUIObservers;
  NSObject *v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  void *v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  void *v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  void *v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  void *v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  void *v155;
  const char *v156;
  uint64_t v157;
  void *v158;
  const char *v159;
  uint64_t v160;
  void *v161;
  const char *v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  NSString *personaIdentifier;
  void *v167;
  NSString *v168;
  NSObject *v169;
  const char *v170;
  uint64_t v171;
  uint64_t v172;
  void *v173;
  const char *v174;
  uint64_t v175;
  uint64_t v176;
  __CFString *v177;
  void *v178;
  const char *v179;
  uint64_t v180;
  uint64_t v181;
  void *v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  void *v186;
  const char *v187;
  uint64_t v188;
  uint64_t v189;
  void *v190;
  const char *v191;
  uint64_t v192;
  uint64_t v193;
  void *v194;
  const char *v195;
  uint64_t v196;
  const char *v197;
  uint64_t v198;
  void *v199;
  const char *v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  NSString *v204;
  void *v205;
  NSString *v206;
  NSObject *v207;
  const char *v208;
  uint64_t v209;
  uint64_t v210;
  void *v211;
  const char *v212;
  uint64_t v213;
  uint64_t v214;
  __CFString *v215;
  const char *v216;
  uint64_t v217;
  void *v218;
  NSObject *v219;
  void *v220;
  void *v221;
  const char *v222;
  uint64_t v223;
  void *v224;
  const char *v225;
  uint64_t v226;
  uint64_t v227;
  const char *v228;
  NSObject *v229;
  int v230;
  uint64_t v231;
  NSLock *daemonConnectionLock;
  void *v234;
  const char *v235;
  uint64_t v236;
  uint64_t v237;
  const char *v238;
  uint64_t v239;
  uint64_t v240;
  void *v241;
  void *v242;
  const char *v243;
  uint64_t v244;
  uint64_t v245;
  void *v246;
  uint64_t v247;
  const char *v248;
  uint64_t v249;
  void *v250;
  BOOL v251;
  void *v252;
  const char *v253;
  uint64_t v254;
  uint64_t v255;
  void *v256;
  const char *v257;
  uint64_t v258;
  void *v259;
  const char *v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  NSString *v264;
  NSObject *v265;
  NSString *v266;
  void *v267;
  const char *v268;
  uint64_t v269;
  uint64_t v270;
  void *v271;
  const char *v272;
  uint64_t v273;
  uint64_t v274;
  const char *v275;
  uint64_t v276;
  uint64_t v277;
  void *v278;
  void *v279;
  const char *v280;
  uint64_t v281;
  uint64_t v282;
  NSObject *v283;
  const char *v284;
  uint64_t v285;
  uint64_t v286;
  void *v287;
  void *v288;
  const char *v289;
  uint64_t v290;
  char isEqualToString;
  const char *v292;
  uint64_t v293;
  uint64_t v294;
  void *v295;
  NSObject *v296;
  const char *v297;
  uint64_t v298;
  uint64_t v299;
  void *v300;
  void *v301;
  const char *v302;
  uint64_t v303;
  uint64_t v304;
  uint64_t v305;
  NSString *v306;
  NSObject *v307;
  const char *v308;
  uint64_t v309;
  void *v310;
  const char *v311;
  CKException *v312;
  const char *v313;
  uint64_t v314;
  uint64_t v315;
  uint64_t v316;
  const char *v317;
  uint64_t v318;
  uint64_t v319;
  void *v320;
  const char *v321;
  id v322;
  NSObject *v323;
  const char *v324;
  uint64_t v325;
  void *v326;
  const char *v327;
  uint64_t v328;
  uint64_t v329;
  NSObject *v330;
  const char *v331;
  uint64_t v332;
  void *v333;
  const char *v334;
  uint64_t v335;
  uint64_t v336;
  id obj;
  _QWORD handler[4];
  id v339;
  int out_token;
  id location[2];
  objc_super v342;
  _BYTE buf[12];
  __int16 v344;
  uint64_t v345;
  __int16 v346;
  const __CFString *v347;
  uint64_t v348;

  v348 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  obj = a5;
  if (!v10)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v12, v13, v14);
    v310 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v310, v311, (uint64_t)a2, (uint64_t)self, CFSTR("CKContainer.m"), 358, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("containerID != nil"));

  }
  v342.receiver = self;
  v342.super_class = (Class)CKContainerImplementation;
  v15 = -[CKContainerImplementation init](&v342, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeWeak((id *)&v15->_unconfiguredWrappingContainer, obj);
    if (!v11)
      v11 = (id)objc_opt_new();
    v20 = objc_msgSend_copy(v11, v17, v18, v19);
    options = v16->_options;
    v16->_options = (CKContainerOptions *)v20;

    objc_msgSend_sharedManager(CKProcessScopedStateManager, v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_untrustedEntitlements(v25, v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_fakeEntitlements(v16->_options, v30, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend_count(v33, v34, v35, v36);

    if (v37)
    {
      objc_msgSend_fakeEntitlements(v16->_options, v38, v39, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_entitlementsByAddingOverlay_(v29, v42, (uint64_t)v41, v43);
      v44 = objc_claimAutoreleasedReturnValue();
      resolvedEntitlements = v16->_resolvedEntitlements;
      v16->_resolvedEntitlements = (CKEntitlements *)v44;

    }
    else
    {
      v46 = v29;
      v41 = v16->_resolvedEntitlements;
      v16->_resolvedEntitlements = v46;
    }

    v47 = v16->_resolvedEntitlements;
    v48 = CKSDKVersion();
    *(_QWORD *)buf = 0;
    LOBYTE(v47) = objc_msgSend_validateEntitlementsWithSDKVersion_error_(v47, v49, v48, (uint64_t)buf);
    v50 = *(id *)buf;
    v51 = v50;
    if ((v47 & 1) == 0)
    {
      v312 = [CKException alloc];
      v316 = objc_msgSend_code(v51, v313, v314, v315);
      objc_msgSend_localizedDescription(v51, v317, v318, v319);
      v320 = (void *)objc_claimAutoreleasedReturnValue();
      v322 = (id)objc_msgSend_initWithCode_format_(v312, v321, v316, (uint64_t)CFSTR("%@"), v320);

      objc_exception_throw(v322);
    }

    objc_msgSend_untrustedEntitlements(v16, v52, v53, v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    hasMasqueradingEntitlement = objc_msgSend_hasMasqueradingEntitlement(v55, v56, v57, v58);
    objc_msgSend_cloudServices(v55, v60, v61, v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    hasTemporaryDeviceCapabilitiesEntitlement = (uint64_t)CFSTR("CloudKit");
    if (objc_msgSend_containsObject_(v63, v65, (uint64_t)CFSTR("CloudKit"), v66))
    {

    }
    else
    {
      objc_msgSend_cloudServices(v55, v67, v68, v69);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = CFSTR("CloudKit-Anonymous");
      v76 = objc_msgSend_containsObject_(v73, v74, (uint64_t)CFSTR("CloudKit-Anonymous"), v75);

      if (((v76 | hasMasqueradingEntitlement) & 1) == 0)
      {
        if (ck_log_initialization_predicate == -1)
          goto LABEL_72;
        goto LABEL_80;
      }
    }
    objc_msgSend_supportedDeviceCapabilities(v16->_options, v70, v71, v72);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    if (v80)
    {
      hasTemporaryDeviceCapabilitiesEntitlement = objc_msgSend_hasTemporaryDeviceCapabilitiesEntitlement(v55, v77, v78, v79);

      if ((hasTemporaryDeviceCapabilitiesEntitlement & 1) == 0)
      {
        v81 = ck_log_initialization_block;
        v82 = ck_log_initialization_predicate == -1;
        if ((hasMasqueradingEntitlement & 1) == 0)
        {
          while (1)
          {
            if (!v82)
              dispatch_once(&ck_log_initialization_predicate, v81);
            v330 = ck_log_facility_ck;
            if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = CFSTR("com.apple.private.cloudkit.temporary.deviceCapabilities");
              _os_log_error_impl(&dword_18A5C5000, v330, OS_LOG_TYPE_ERROR, "Early adopters of device capabilities must have the %@ entitlement.", buf, 0xCu);
            }
            objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v331, (uint64_t)CFSTR("Early adopters of device capabilities must have the %@ entitlement."), v332, CFSTR("com.apple.private.cloudkit.temporary.deviceCapabilities"));
            v333 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_UTF8String(v333, v334, v335, v336);
            _os_crash();
            __break(1u);
LABEL_80:
            dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
LABEL_72:
            v323 = ck_log_facility_ck;
            if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412802;
              *(_QWORD *)&buf[4] = CFSTR("com.apple.developer.icloud-services");
              v344 = 2112;
              v345 = hasTemporaryDeviceCapabilitiesEntitlement;
              v346 = 2112;
              v347 = v5;
              _os_log_error_impl(&dword_18A5C5000, v323, OS_LOG_TYPE_ERROR, "In order to use CloudKit, your process must have a %@ entitlement. The value of this entitlement must be an array that includes the string \"%@\" or \"%@\".", buf, 0x20u);
            }
            objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v324, (uint64_t)CFSTR("In order to use CloudKit, your process must have a %@ entitlement. The value of this entitlement must be an array that includes the string \"%@\" or \"%@\"."), v325, CFSTR("com.apple.developer.icloud-services"), hasTemporaryDeviceCapabilitiesEntitlement, v5);
            v326 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_UTF8String(v326, v327, v328, v329);
            _os_crash();
            __break(1u);
          }
        }
        if (ck_log_initialization_predicate != -1)
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        v83 = ck_log_facility_ck;
        if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = CFSTR("com.apple.private.cloudkit.temporary.deviceCapabilities");
          _os_log_error_impl(&dword_18A5C5000, v83, OS_LOG_TYPE_ERROR, "Use of CKContainerOptions.supportedDeviceCapabilities currently requires the %@ entitlement.", buf, 0xCu);
        }
      }
    }

    v87 = objc_msgSend_copy(v10, v84, v85, v86);
    containerID = v16->_containerID;
    v16->_containerID = (CKContainerID *)v87;

    v89 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_containerIdentifier(v16->_containerID, v90, v91, v92);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v89, v94, (uint64_t)CFSTR("%@.%@"), v95, CFSTR("com.apple.cloudkit.container-queue"), v93);
    v96 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v100 = (const char *)objc_msgSend_UTF8String(v96, v97, v98, v99);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v101 = objc_claimAutoreleasedReturnValue();
    v102 = dispatch_queue_create(v100, v101);
    underlyingDispatchQueue = v16->_underlyingDispatchQueue;
    v16->_underlyingDispatchQueue = (OS_dispatch_queue *)v102;

    v104 = objc_opt_new();
    convenienceOperationQueue = v16->_convenienceOperationQueue;
    v16->_convenienceOperationQueue = (NSOperationQueue *)v104;

    objc_msgSend_setMaxConcurrentOperationCount_(v16->_convenienceOperationQueue, v106, 6, v107);
    objc_msgSend_setUnderlyingQueue_(v16->_convenienceOperationQueue, v108, (uint64_t)v16->_underlyingDispatchQueue, v109);
    v110 = objc_opt_new();
    throttlingOperationQueue = v16->_throttlingOperationQueue;
    v16->_throttlingOperationQueue = (NSOperationQueue *)v110;

    objc_msgSend_setMaxConcurrentOperationCount_(v16->_throttlingOperationQueue, v112, 6, v113);
    objc_msgSend_setUnderlyingQueue_(v16->_throttlingOperationQueue, v114, (uint64_t)v16->_underlyingDispatchQueue, v115);
    v116 = objc_opt_new();
    backgroundThrottlingOperationQueue = v16->_backgroundThrottlingOperationQueue;
    v16->_backgroundThrottlingOperationQueue = (NSOperationQueue *)v116;

    objc_msgSend_setMaxConcurrentOperationCount_(v16->_backgroundThrottlingOperationQueue, v118, 4, v119);
    objc_msgSend_setUnderlyingQueue_(v16->_backgroundThrottlingOperationQueue, v120, (uint64_t)v16->_underlyingDispatchQueue, v121);
    v122 = objc_opt_new();
    discretionaryThrottlingOperationQueue = v16->_discretionaryThrottlingOperationQueue;
    v16->_discretionaryThrottlingOperationQueue = (NSOperationQueue *)v122;

    objc_msgSend_setMaxConcurrentOperationCount_(v16->_discretionaryThrottlingOperationQueue, v124, 4, v125);
    objc_msgSend_setUnderlyingQueue_(v16->_discretionaryThrottlingOperationQueue, v126, (uint64_t)v16->_underlyingDispatchQueue, v127);
    v128 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    sandboxExtensionHandles = v16->_sandboxExtensionHandles;
    v16->_sandboxExtensionHandles = v128;

    v16->_uploadRequestManagerLock._os_unfair_lock_opaque = 0;
    objc_msgSend_weakObjectsHashTable(MEMORY[0x1E0CB3690], v130, v131, v132);
    v133 = objc_claimAutoreleasedReturnValue();
    sharingUIObservers = v16->_sharingUIObservers;
    v16->_sharingUIObservers = (NSHashTable *)v133;

    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v135 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v16;
      _os_log_impl(&dword_18A5C5000, v135, OS_LOG_TYPE_INFO, "Determining the persona identifier for CKContainer %{public}@", buf, 0xCu);
    }
    objc_msgSend_accountOverrideInfo(v11, v136, v137, v138);
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_accountID(v139, v140, v141, v142);
    v143 = (void *)objc_claimAutoreleasedReturnValue();

    if (v143)
    {
      sub_18A6D400C();
      v147 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_accountOverrideInfo(v11, v148, v149, v150);
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_accountID(v151, v152, v153, v154);
      v155 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_accountWithIdentifier_(v147, v156, (uint64_t)v155, v157);
      v158 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_accountPropertyForKey_(v158, v159, *MEMORY[0x1E0C8EFC8], v160);
      v161 = (void *)objc_claimAutoreleasedReturnValue();
      v165 = objc_msgSend_copy(v161, v162, v163, v164);
      personaIdentifier = v16->_personaIdentifier;
      v16->_personaIdentifier = (NSString *)v165;

      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v167 = (void *)ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
      {
        v168 = v16->_personaIdentifier;
        v169 = v167;
        objc_msgSend_accountOverrideInfo(v11, v170, v171, v172);
        v173 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_accountID(v173, v174, v175, v176);
        v177 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v168;
        v344 = 2112;
        v345 = (uint64_t)v158;
        v346 = 2112;
        v347 = v177;
        _os_log_impl(&dword_18A5C5000, v169, OS_LOG_TYPE_INFO, "Found persona identifier %@ on account %@ using accountID %@", buf, 0x20u);

      }
    }
    else
    {
      objc_msgSend_accountOverrideInfo(v11, v144, v145, v146);
      v178 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_altDSID(v178, v179, v180, v181);
      v182 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v182)
      {
        if (__sTestOverridesAvailable)
        {
          objc_msgSend_accountOverrideInfo(v11, v183, v184, v185);
          v234 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_email(v234, v235, v236, v237);
          v241 = (void *)objc_claimAutoreleasedReturnValue();
          if (v241)
          {
            objc_msgSend_accountOverrideInfo(v11, v238, v239, v240);
            v242 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_accountPropertyOverrides(v242, v243, v244, v245);
            v246 = (void *)objc_claimAutoreleasedReturnValue();
            v247 = *MEMORY[0x1E0C8EFC8];
            objc_msgSend_objectForKeyedSubscript_(v246, v248, *MEMORY[0x1E0C8EFC8], v249);
            v250 = (void *)objc_claimAutoreleasedReturnValue();
            v251 = v250 == 0;

            if (!v251)
            {
              objc_msgSend_accountOverrideInfo(v11, v183, v184, v185);
              v252 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_accountPropertyOverrides(v252, v253, v254, v255);
              v256 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectForKeyedSubscript_(v256, v257, v247, v258);
              v259 = (void *)objc_claimAutoreleasedReturnValue();
              v263 = objc_msgSend_copy(v259, v260, v261, v262);
              v264 = v16->_personaIdentifier;
              v16->_personaIdentifier = (NSString *)v263;

              if (ck_log_initialization_predicate != -1)
                dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
              v265 = ck_log_facility_ck;
              if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
              {
                v266 = v16->_personaIdentifier;
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)&buf[4] = v266;
                _os_log_impl(&dword_18A5C5000, v265, OS_LOG_TYPE_INFO, "Found persona identifier %@ from account info for unit-tests", buf, 0xCu);
              }
              goto LABEL_36;
            }
          }
          else
          {

          }
        }
        objc_msgSend_sharedManager(MEMORY[0x1E0DC5EE8], v183, v184, v185);
        v267 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_currentPersona(v267, v268, v269, v270);
        v271 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_userPersonaUniqueString(v271, v272, v273, v274);
        v218 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_personaIdentifier(v11, v275, v276, v277);
        v278 = (void *)objc_claimAutoreleasedReturnValue();

        if (v278)
        {
          if (ck_log_initialization_predicate != -1)
            dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
          v279 = (void *)ck_log_facility_ck;
          if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
          {
            v283 = v279;
            objc_msgSend_personaIdentifier(v11, v284, v285, v286);
            v287 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v287;
            _os_log_impl(&dword_18A5C5000, v283, OS_LOG_TYPE_INFO, "Found persona identifier %@ on container options", buf, 0xCu);

          }
          objc_msgSend_personaIdentifier(v11, v280, v281, v282);
          v288 = (void *)objc_claimAutoreleasedReturnValue();
          isEqualToString = objc_msgSend_isEqualToString_(v288, v289, (uint64_t)v218, v290);

          if ((isEqualToString & 1) == 0)
          {
            if (ck_log_initialization_predicate != -1)
              dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
            v295 = (void *)ck_log_facility_ck;
            if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
            {
              v296 = v295;
              objc_msgSend_personaIdentifier(v11, v297, v298, v299);
              v300 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)&buf[4] = v300;
              v344 = 2112;
              v345 = (uint64_t)v218;
              _os_log_impl(&dword_18A5C5000, v296, OS_LOG_TYPE_INFO, "Requested persona identifier %@ does not match current persona %@. Will adopt requested persona when calling daemon.", buf, 0x16u);

            }
          }
          objc_msgSend_personaIdentifier(v11, v292, v293, v294);
          v301 = (void *)objc_claimAutoreleasedReturnValue();
          v305 = objc_msgSend_copy(v301, v302, v303, v304);
          v306 = v16->_personaIdentifier;
          v16->_personaIdentifier = (NSString *)v305;

        }
        else
        {
          if (ck_log_initialization_predicate != -1)
            dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
          v307 = ck_log_facility_ck;
          if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v218;
            _os_log_impl(&dword_18A5C5000, v307, OS_LOG_TYPE_INFO, "Writing down current persona %@ in container options", buf, 0xCu);
          }
          objc_msgSend_setPersonaIdentifier_(v16->_options, v308, (uint64_t)v218, v309);
        }
        goto LABEL_37;
      }
      sub_18A6D400C();
      v186 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_accountOverrideInfo(v11, v187, v188, v189);
      v190 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_altDSID(v190, v191, v192, v193);
      v194 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_aa_appleAccountWithAltDSID_(v186, v195, (uint64_t)v194, v196);
      v158 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_accountPropertyForKey_(v158, v197, *MEMORY[0x1E0C8EFC8], v198);
      v199 = (void *)objc_claimAutoreleasedReturnValue();
      v203 = objc_msgSend_copy(v199, v200, v201, v202);
      v204 = v16->_personaIdentifier;
      v16->_personaIdentifier = (NSString *)v203;

      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v205 = (void *)ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
      {
        v206 = v16->_personaIdentifier;
        v207 = v205;
        objc_msgSend_accountOverrideInfo(v11, v208, v209, v210);
        v211 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_altDSID(v211, v212, v213, v214);
        v215 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v206;
        v344 = 2112;
        v345 = (uint64_t)v158;
        v346 = 2112;
        v347 = v215;
        _os_log_impl(&dword_18A5C5000, v207, OS_LOG_TYPE_INFO, "Found persona identifier %@ on account %@ using altDSID %@", buf, 0x20u);

      }
    }

LABEL_36:
    v218 = 0;
LABEL_37:
    *(_QWORD *)buf = -1;
    if ((objc_msgSend___preflightAccountAccessAuthorization_(v16, v216, (uint64_t)buf, v217) & 1) == 0)
    {
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v219 = ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(location[0]) = 0;
        _os_log_debug_impl(&dword_18A5C5000, v219, OS_LOG_TYPE_DEBUG, "Deferring initial account access authorization, unable to preflight", (uint8_t *)location, 2u);
      }
    }
    v16->_accountAccessAuthorization = *(_QWORD *)buf;
    objc_initWeak(location, v16);
    out_token = -1;
    v220 = (void *)MEMORY[0x1E0CB3940];
    CKTestNotificationPrefix();
    v221 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v220, v222, (uint64_t)CFSTR("%@%@"), v223, v221, CFSTR("CKStatusReport"));
    v224 = (void *)objc_claimAutoreleasedReturnValue();

    v228 = (const char *)objc_msgSend_UTF8String(v224, v225, v226, v227);
    CKGetGlobalQueue(17);
    v229 = objc_claimAutoreleasedReturnValue();
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = sub_18A6D4050;
    handler[3] = &unk_1E1F607E0;
    objc_copyWeak(&v339, location);
    LODWORD(v220) = notify_register_dispatch(v228, &out_token, v229, handler);

    v230 = out_token;
    if ((_DWORD)v220)
      v230 = -1;
    v16->_statusReportToken = v230;
    v231 = objc_opt_new();
    daemonConnectionLock = v16->_daemonConnectionLock;
    v16->_daemonConnectionLock = (NSLock *)v231;

    objc_destroyWeak(&v339);
    objc_destroyWeak(location);

  }
  return v16;
}

- (NSString)containerIdentifier
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_containerID(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerIdentifier(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (void)consumeSandboxExtensions:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  NSMutableArray *sandboxExtensionHandles;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  id v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  NSMutableArray *v31;
  NSMutableArray *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  NSMutableArray *v37;
  NSMutableArray *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  NSMutableArray *v42;
  NSMutableArray *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  NSObject *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  NSMutableArray *obj;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t buf[4];
  uint64_t v62;
  __int16 v63;
  void *v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  if (objc_msgSend_count(v6, v8, v9, v10))
  {
    if (self)
      sandboxExtensionHandles = self->_sandboxExtensionHandles;
    else
      sandboxExtensionHandles = 0;
    obj = sandboxExtensionHandles;
    objc_sync_enter(obj);
    v12 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v16 = objc_msgSend_count(v6, v13, v14, v15);
    v19 = (void *)objc_msgSend_initWithCapacity_(v12, v17, v16, v18);
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v20 = v6;
    v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v57, (uint64_t)v65, 16);
    if (v24)
    {
      v25 = *(_QWORD *)v58;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v58 != v25)
            objc_enumerationMutation(v20);
          objc_msgSend_cStringUsingEncoding_(*(void **)(*((_QWORD *)&v57 + 1) + 8 * i), v22, 4, v23);
          v27 = sandbox_extension_consume();
          if ((v27 & 0x8000000000000000) == 0)
          {
            objc_msgSend_numberWithLongLong_(MEMORY[0x1E0CB37E8], v22, v27, v23);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObject_(v19, v29, (uint64_t)v28, v30);

          }
        }
        v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v22, (uint64_t)&v57, (uint64_t)v65, 16);
      }
      while (v24);
    }

    if (self)
      v31 = self->_sandboxExtensionHandles;
    else
      v31 = 0;
    v32 = v31;
    v36 = (void *)objc_msgSend_copy(v32, v33, v34, v35);

    if (self)
      v37 = self->_sandboxExtensionHandles;
    else
      v37 = 0;
    v38 = v37;
    objc_msgSend_removeAllObjects(v38, v39, v40, v41);

    if (self)
      v42 = self->_sandboxExtensionHandles;
    else
      v42 = 0;
    v43 = v42;
    objc_msgSend_addObjectsFromArray_(v43, v44, (uint64_t)v19, v45);

    objc_sync_exit(obj);
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v46 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      v47 = v46;
      v51 = objc_msgSend_count(v20, v48, v49, v50);
      objc_msgSend_containerID(self, v52, v53, v54);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v62 = v51;
      v63 = 2112;
      v64 = v55;
      _os_log_debug_impl(&dword_18A5C5000, v47, OS_LOG_TYPE_DEBUG, "Consumed %lu sandbox extensions for container %@", buf, 0x16u);

    }
    sub_18A5D3C68(self, v36);
    v7[2](v7, 0);

  }
  else
  {
    v7[2](v7, 0);
  }

}

- (void)fetchUserRecordIDWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  os_activity_scope_state_s v6;

  v4 = a3;
  v5 = _os_activity_create(&dword_18A5C5000, "client/fetch-user-record-id", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v6.opaque[0] = 0;
  v6.opaque[1] = 0;
  os_activity_scope_enter(v5, &v6);
  sub_18A5E0330(self, 0, v4);
  os_activity_scope_leave(&v6);

}

- (void)accountInfoWithCompletionHandler:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  os_signpost_id_t v18;
  NSObject *v19;
  NSObject *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  id v28;
  id v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  _QWORD block[5];
  id v40;
  id v41;
  _BYTE *v42;
  _QWORD *v43;
  _QWORD v44[5];
  char v45;
  os_activity_scope_state_s state;
  _BYTE buf[24];
  uint64_t (*v48)(uint64_t, uint64_t);
  __int128 v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_signpost(CKSignpost, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v8;
  if (v8)
  {
    objc_msgSend_log(v8, v9, v10, v11);
    v13 = objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend_identifier(v12, v14, v15, v16);
    if ((unint64_t)(v17 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v18 = v17;
      if (os_signpost_enabled(v13))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_18A5C5000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v18, "accountStatus", ", buf, 2u);
      }
    }

  }
  v19 = _os_activity_create(&dword_18A5C5000, "client/account-info", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v19, &state);
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v20 = (id)ck_log_facility_ck;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend_containerID(self, v21, v22, v23);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_accountInfoFetchQueue(self, v31, v32, v33);
    v34 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    objc_msgSend_options(self, v35, v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v30;
    *(_WORD *)&buf[22] = 2112;
    v48 = v34;
    LOWORD(v49) = 2112;
    *(_QWORD *)((char *)&v49 + 2) = v38;
    _os_log_debug_impl(&dword_18A5C5000, v20, OS_LOG_TYPE_DEBUG, "Fetching full account info for CKContainerImplementation %p, containerID %@ on queue %@. Container options: %@", buf, 0x2Au);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v48 = sub_18A6D6E80;
  *(_QWORD *)&v49 = sub_18A6D6E90;
  *((_QWORD *)&v49 + 1) = objc_opt_new();
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x3020000000;
  v45 = 0;
  objc_msgSend_accountInfoFetchQueue(self, v24, v25, v26);
  v27 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18A5E0DEC;
  block[3] = &unk_1E1F61080;
  v42 = buf;
  v43 = v44;
  v40 = v12;
  v41 = v4;
  block[4] = self;
  v28 = v12;
  v29 = v4;
  dispatch_async(v27, block);

  _Block_object_dispose(v44, 8);
  _Block_object_dispose(buf, 8);

  os_activity_scope_leave(&state);
}

- (id)setupInfo
{
  CKContainerImplementation *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  CKContainerSetupInfo *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  CKContainerSetupInfo *cachedSetupInfo;
  const char *v16;
  uint64_t v17;
  CKContainerSetupInfo *v18;
  CKContainerID *containerID;
  int v21;
  CKContainerID *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  if (!objc_msgSend_hasCachedSetupInfo(v2, v3, v4, v5))
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v6 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      containerID = v2->_containerID;
      v21 = 138412290;
      v22 = containerID;
      _os_log_debug_impl(&dword_18A5C5000, v6, OS_LOG_TYPE_DEBUG, "Creating cached setup info for %@", (uint8_t *)&v21, 0xCu);
    }
    v7 = [CKContainerSetupInfo alloc];
    v8 = (uint64_t)v2->_containerID;
    objc_msgSend_options(v2, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend_initWithContainerID_options_(v7, v13, v8, (uint64_t)v12);
    cachedSetupInfo = v2->_cachedSetupInfo;
    v2->_cachedSetupInfo = (CKContainerSetupInfo *)v14;

    objc_msgSend_setHasCachedSetupInfo_(v2, v16, 1, v17);
  }
  v18 = v2->_cachedSetupInfo;
  objc_sync_exit(v2);

  return v18;
}

- (BOOL)hasCachedSetupInfo
{
  return self->_hasCachedSetupInfo;
}

- (NSNumber)fakeDeviceToDeviceEncryptionAvailability
{
  return (NSNumber *)objc_getProperty(self, a2, 192, 1);
}

- (id)deviceContext
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_defaultContext(CKLogicalDeviceContext, a2, v2, v3);
}

- (id)CKPropertiesDescription
{
  uint64_t v2;
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  void *v114;
  const char *v115;
  uint64_t v116;
  void *v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  int v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  const char *v126;
  uint64_t v127;
  void *v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  const char *v132;
  uint64_t v133;
  void *v134;
  void *v135;
  const char *v136;
  uint64_t v137;
  void *v138;
  const char *v139;
  uint64_t v140;
  void *v141;

  objc_msgSend_arrayWithCapacity_(MEMORY[0x1E0C99DE8], a2, 3, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_containerID(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v5, v10, (uint64_t)CFSTR("containerID=%@"), v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v4, v13, (uint64_t)v12, v14);

  objc_msgSend_options(self, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_testDeviceReferenceProtocol(v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    v26 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_options(self, v23, v24, v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_testDeviceReferenceProtocol(v27, v28, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_deviceID(v31, v32, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v26, v36, (uint64_t)CFSTR("testDeviceID=%@"), v37, v35);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v4, v39, (uint64_t)v38, v40);

  }
  objc_msgSend_options(self, v23, v24, v25);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_applicationBundleIdentifierOverrideForContainerAccess(v41, v42, v43, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (v45)
  {
    v49 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_options(self, v46, v47, v48);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_applicationBundleIdentifierOverrideForContainerAccess(v50, v51, v52, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v49, v55, (uint64_t)CFSTR("applicationBundleIdentifierOverrideForContainerAccess=\"%@\"), v56, v54);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v4, v58, (uint64_t)v57, v59);

  }
  objc_msgSend_options(self, v46, v47, v48);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_applicationBundleIdentifierOverrideForNetworkAttribution(v60, v61, v62, v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  if (v64)
  {
    v68 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_options(self, v65, v66, v67);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_applicationBundleIdentifierOverrideForNetworkAttribution(v69, v70, v71, v72);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v68, v74, (uint64_t)CFSTR("applicationBundleIdentifierOverrideForNetworkAttribution=\"%@\"), v75, v73);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v4, v77, (uint64_t)v76, v78);

  }
  objc_msgSend_options(self, v65, v66, v67);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_applicationBundleIdentifierOverrideForPushTopicGeneration(v79, v80, v81, v82);
  v83 = (void *)objc_claimAutoreleasedReturnValue();

  if (v83)
  {
    v87 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_options(self, v84, v85, v86);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_applicationBundleIdentifierOverrideForPushTopicGeneration(v88, v89, v90, v91);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v87, v93, (uint64_t)CFSTR("applicationBundleIdentifierOverrideForPushTopicGeneration=\"%@\"), v94, v92);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v4, v96, (uint64_t)v95, v97);

  }
  objc_msgSend_options(self, v84, v85, v86);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_applicationBundleIdentifierOverrideForTCC(v98, v99, v100, v101);
  v102 = (void *)objc_claimAutoreleasedReturnValue();

  if (v102)
  {
    v106 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_options(self, v103, v104, v105);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_applicationBundleIdentifierOverrideForTCC(v107, v108, v109, v110);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v106, v112, (uint64_t)CFSTR("applicationBundleIdentifierOverrideForTCC=\"%@\"), v113, v111);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v4, v115, (uint64_t)v114, v116);

  }
  objc_msgSend_options(self, v103, v104, v105);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v121 = objc_msgSend_bypassPCSEncryption(v117, v118, v119, v120);

  if (v121)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v122, (uint64_t)CFSTR("bypassPCS"), v124);
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v4, v126, (uint64_t)v125, v127);

  }
  objc_msgSend_sourceApplicationBundleIdentifier(self, v122, v123, v124);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sourceApplicationSecondaryIdentifier(self, v129, v130, v131);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  if (v128)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v132, (uint64_t)CFSTR("sourceApplicationBundleIdentifier=\"%@\"), v133, v128);
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v4, v136, (uint64_t)v135, v137);

  }
  if (v134)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v132, (uint64_t)CFSTR("applicationSecondaryID=\"%@\"), v133, v134);
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v4, v139, (uint64_t)v138, v140);

  }
  objc_msgSend_componentsJoinedByString_(v4, v132, (uint64_t)CFSTR(", "), v133);
  v141 = (void *)objc_claimAutoreleasedReturnValue();

  return v141;
}

- (CKContainerOptions)options
{
  return self->_options;
}

- (CKContainerID)containerID
{
  return self->_containerID;
}

- (id)sourceApplicationSecondaryIdentifier
{
  CKContainerImplementation *v2;
  NSString *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_sourceApplicationSecondaryIdentifier_locked;
  objc_sync_exit(v2);

  return v3;
}

- (id)sourceApplicationBundleIdentifier
{
  CKContainerImplementation *v2;
  NSString *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_sourceApplicationBundleIdentifier_locked;
  objc_sync_exit(v2);

  return v3;
}

- (NSString)personaIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (id)untrustedEntitlements
{
  return (id)((uint64_t (*)(CKContainerImplementation *, char *))MEMORY[0x1E0DE7D20])(self, sel_resolvedEntitlements);
}

- (void)submitEventMetric:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  os_activity_scope_state_s v8;

  v4 = a3;
  if (byte_1EDF75458)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v5 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v8.opaque[0]) = 0;
      _os_log_debug_impl(&dword_18A5C5000, v5, OS_LOG_TYPE_DEBUG, "Not submitting event metric for test host", (uint8_t *)&v8, 2u);
    }
  }
  else
  {
    v6 = _os_activity_create(&dword_18A5C5000, "client/submit-event-metric", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v8.opaque[0] = 0;
    v8.opaque[1] = 0;
    os_activity_scope_enter(v6, &v8);
    objc_msgSend__submitEventMetric_completionHandler_(self, v7, (uint64_t)v4, 0);
    os_activity_scope_leave(&v8);

  }
}

- (void)setHasCachedSetupInfo:(BOOL)a3
{
  self->_hasCachedSetupInfo = a3;
}

- (CKEntitlements)resolvedEntitlements
{
  return self->_resolvedEntitlements;
}

- (CKDatabaseImplementation)publicCloudDatabaseImplementation
{
  CKContainerImplementation *v2;
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  CKDatabaseImplementation *v7;
  const char *v8;
  uint64_t inited;
  CKDatabaseImplementation *publicCloudDatabaseImplementation;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_publicCloudDatabaseImplementation)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v3 = (id)ck_log_facility_ck;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend_containerID(v2, v4, v5, v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412290;
      v14 = v12;
      _os_log_debug_impl(&dword_18A5C5000, v3, OS_LOG_TYPE_DEBUG, "Creating public database implementation for container %@", (uint8_t *)&v13, 0xCu);

    }
    v7 = [CKDatabaseImplementation alloc];
    inited = objc_msgSend_initInternalWithContainerImplementation_scope_(v7, v8, (uint64_t)v2, 1);
    publicCloudDatabaseImplementation = v2->_publicCloudDatabaseImplementation;
    v2->_publicCloudDatabaseImplementation = (CKDatabaseImplementation *)inited;

  }
  objc_sync_exit(v2);

  return v2->_publicCloudDatabaseImplementation;
}

- (void)fetchCurrentDeviceIDWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_18A5C5000, "client/fetch-current-device-id", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18A6D89D8;
  v11[3] = &unk_1E1F60910;
  v12 = v4;
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = sub_18A5F1E58;
  v9[3] = &unk_1E1F609D8;
  v7 = v12;
  v10 = v7;
  v8 = v7;
  if (self)
  {
    sub_18A5ECA88(self, 0, (void *)1, 0, v11, v9);
    v8 = v10;
  }

  os_activity_scope_leave(&state);
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  int statusReportToken;
  objc_super v13;

  objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v5;
  if (self)
    objc_msgSend_removeObserver_(v5, v6, (uint64_t)self->_connectionInterruptedObserver, v7);
  else
    objc_msgSend_removeObserver_(v5, v6, 0, v7);

  objc_msgSend_invalidate(self->_discretionaryXPCConnection, v9, v10, v11);
  statusReportToken = self->_statusReportToken;
  if (statusReportToken != -1)
    notify_cancel(statusReportToken);
  sub_18A5D3C68(self, self->_sandboxExtensionHandles);
  v13.receiver = self;
  v13.super_class = (Class)CKContainerImplementation;
  -[CKContainerImplementation dealloc](&v13, sel_dealloc);
}

- (void)addPreparedOperationToBackgroundThrottlingOperationQueue:(id)a3
{
  uint64_t v3;

  objc_msgSend_addOperation_(self->_backgroundThrottlingOperationQueue, a2, (uint64_t)a3, v3);
}

- (void)accountStatusWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[16];
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_18A5C5000, "client/account-status", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v6 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_18A5C5000, v6, OS_LOG_TYPE_DEBUG, "Fetching account status", buf, 2u);
  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_18A5F1F9C;
  v10[3] = &unk_1E1F60FE0;
  v7 = v4;
  v11 = v7;
  objc_msgSend_accountInfoWithCompletionHandler_(self, v8, (uint64_t)v10, v9);

  os_activity_scope_leave(&state);
}

- (void)_submitEventMetric:(id)a3 completionHandler:(id)a4
{
  void (**v6)(_QWORD);
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  _QWORD v19[4];
  id v20;
  CKContainerImplementation *v21;
  void (**v22)(_QWORD);
  _QWORD v23[4];
  id v24;
  void (**v25)(_QWORD);
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(_QWORD))a4;
  objc_msgSend_generateEventMetricInfo(a3, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v18 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18A5C5000, v18, OS_LOG_TYPE_ERROR, "Failed to create CKEventMetricInfo", buf, 2u);
      if (!v6)
        goto LABEL_14;
    }
    else if (!v6)
    {
      goto LABEL_14;
    }
    v6[2](v6);
    goto LABEL_14;
  }
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v11 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
  {
    v12 = v11;
    objc_msgSend_metricUUID(v10, v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v27 = v16;
    _os_log_impl(&dword_18A5C5000, v12, OS_LOG_TYPE_INFO, "Client submitting CKEventMetric %{public}@.", buf, 0xCu);

  }
  v17 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = sub_18A6D907C;
  v23[3] = &unk_1E1F60C30;
  v24 = v10;
  v25 = v6;
  v19[0] = v17;
  v19[1] = 3221225472;
  v19[2] = sub_18A6D91A8;
  v19[3] = &unk_1E1F60C58;
  v20 = v24;
  v21 = self;
  v22 = v25;
  if (self)
    sub_18A5ECA88(self, 0, (void *)1, 0, v23, v19);

LABEL_14:
}

- (BOOL)__preflightAccountAccessAuthorization:(int64_t *)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v14;
  int64_t v15;

  if ((CKIsRunningInSyncBubble() & 1) != 0)
    return 0;
  objc_msgSend_options(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_applicationBundleIdentifierOverrideForTCC(v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    return 0;
  v14 = TCCAccessPreflight();
  if (a3)
  {
    if (v14 == 1)
      v15 = 0;
    else
      v15 = -1;
    if (!v14)
      v15 = 1;
    *a3 = v15;
  }
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharingUIObservers, 0);
  objc_storeStrong((id *)&self->_daemonConnectionLock, 0);
  objc_storeStrong((id *)&self->_sandboxExtensionHandles, 0);
  objc_storeStrong((id *)&self->_convenienceOperationQueue, 0);
  objc_storeStrong((id *)&self->_connectionInterruptedObserver, 0);
  objc_storeStrong((id *)&self->_containerScopedDaemonProxyCreator, 0);
  objc_storeStrong((id *)&self->_underlyingDispatchQueue, 0);
  objc_storeStrong((id *)&self->_fakeDeviceToDeviceEncryptionAvailability, 0);
  objc_storeStrong((id *)&self->_resolvedEntitlements, 0);
  objc_storeStrong((id *)&self->_cachedSetupInfo, 0);
  objc_storeStrong((id *)&self->_discretionaryThrottlingOperationQueue, 0);
  objc_storeStrong((id *)&self->_backgroundThrottlingOperationQueue, 0);
  objc_storeStrong((id *)&self->_throttlingOperationQueue, 0);
  objc_storeStrong((id *)&self->_codeServiceImplementations, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_containerID, 0);
  objc_destroyWeak((id *)&self->_unconfiguredWrappingContainer);
  objc_storeStrong((id *)&self->_personaIdentifier, 0);
  objc_storeStrong((id *)&self->_pushEnvironment, 0);
  objc_storeStrong((id *)&self->_discretionaryXPCConnection, 0);
  objc_storeStrong((id *)&self->_organizationCloudDatabaseImplementation, 0);
  objc_storeStrong((id *)&self->_sharedCloudDatabaseImplementation, 0);
  objc_storeStrong((id *)&self->_publicCloudDatabaseImplementation, 0);
  objc_storeStrong((id *)&self->_privateCloudDatabaseImplementation, 0);
  objc_storeStrong((id *)&self->_sourceApplicationSecondaryIdentifier_locked, 0);
  objc_storeStrong((id *)&self->_sourceApplicationBundleIdentifier_locked, 0);
  objc_storeStrong((id *)&self->_orgAdminUserID_locked, 0);
  objc_storeStrong((id *)&self->_containerScopedUserID_locked, 0);
  objc_storeStrong((id *)&self->_uploadRequestManager_locked, 0);
}

+ (void)initialize
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  int isAppleInternalInstall;
  NSObject *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  void *v12;
  NSObject *v13;
  dispatch_queue_t v14;
  void *v15;
  int v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend_sharedOptions(CKBehaviorOptions, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  isAppleInternalInstall = objc_msgSend_isAppleInternalInstall(v4, v5, v6, v7);

  if (isAppleInternalInstall)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v9 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
    {
      v16 = 136315138;
      v17 = "Wed Dec 31 16:00:00 1969";
      _os_log_impl(&dword_18A5C5000, v9, OS_LOG_TYPE_INFO, "CloudKit.framework was built at %s", (uint8_t *)&v16, 0xCu);
    }
  }
  if (!qword_1ECD96A88)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("com.apple.cloudkit.importantUserRecordAccess", v10);
    v12 = (void *)qword_1ECD96A88;
    qword_1ECD96A88 = (uint64_t)v11;

  }
  if (!qword_1ECD96A98)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = dispatch_queue_create("com.apple.cloudkit.accountInfoFetchQueue.usesPCS", v13);
    v15 = (void *)qword_1ECD96A98;
    qword_1ECD96A98 = (uint64_t)v14;

  }
  CKOncePerBoot(CFSTR("CKAccountInfoCacheReset"), &unk_1E1F58398);
}

- (CKDatabaseImplementation)privateCloudDatabaseImplementation
{
  CKContainerImplementation *v2;
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  CKDatabaseImplementation *v7;
  const char *v8;
  uint64_t inited;
  CKDatabaseImplementation *privateCloudDatabaseImplementation;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_privateCloudDatabaseImplementation)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v3 = (id)ck_log_facility_ck;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend_containerID(v2, v4, v5, v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412290;
      v14 = v12;
      _os_log_debug_impl(&dword_18A5C5000, v3, OS_LOG_TYPE_DEBUG, "Creating private database implementation for container %@", (uint8_t *)&v13, 0xCu);

    }
    v7 = [CKDatabaseImplementation alloc];
    inited = objc_msgSend_initInternalWithContainerImplementation_scope_(v7, v8, (uint64_t)v2, 2);
    privateCloudDatabaseImplementation = v2->_privateCloudDatabaseImplementation;
    v2->_privateCloudDatabaseImplementation = (CKDatabaseImplementation *)inited;

  }
  objc_sync_exit(v2);

  return v2->_privateCloudDatabaseImplementation;
}

- (CKDatabaseImplementation)sharedCloudDatabaseImplementation
{
  CKContainerImplementation *v2;
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  CKDatabaseImplementation *v7;
  const char *v8;
  uint64_t inited;
  CKDatabaseImplementation *sharedCloudDatabaseImplementation;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_sharedCloudDatabaseImplementation)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v3 = (id)ck_log_facility_ck;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend_containerID(v2, v4, v5, v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412290;
      v14 = v12;
      _os_log_debug_impl(&dword_18A5C5000, v3, OS_LOG_TYPE_DEBUG, "Creating shared database implementation for container %@", (uint8_t *)&v13, 0xCu);

    }
    v7 = [CKDatabaseImplementation alloc];
    inited = objc_msgSend_initInternalWithContainerImplementation_scope_(v7, v8, (uint64_t)v2, 3);
    sharedCloudDatabaseImplementation = v2->_sharedCloudDatabaseImplementation;
    v2->_sharedCloudDatabaseImplementation = (CKDatabaseImplementation *)inited;

  }
  objc_sync_exit(v2);

  return v2->_sharedCloudDatabaseImplementation;
}

- (CKDatabaseImplementation)organizationCloudDatabaseImplementation
{
  CKContainerImplementation *v2;
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  CKDatabaseImplementation *v7;
  const char *v8;
  uint64_t inited;
  CKDatabaseImplementation *organizationCloudDatabaseImplementation;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_organizationCloudDatabaseImplementation)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v3 = (id)ck_log_facility_ck;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend_containerID(v2, v4, v5, v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412290;
      v14 = v12;
      _os_log_debug_impl(&dword_18A5C5000, v3, OS_LOG_TYPE_DEBUG, "Creating organization database implementation for container %@", (uint8_t *)&v13, 0xCu);

    }
    v7 = [CKDatabaseImplementation alloc];
    inited = objc_msgSend_initInternalWithContainerImplementation_scope_(v7, v8, (uint64_t)v2, 4);
    organizationCloudDatabaseImplementation = v2->_organizationCloudDatabaseImplementation;
    v2->_organizationCloudDatabaseImplementation = (CKDatabaseImplementation *)inited;

  }
  objc_sync_exit(v2);

  return v2->_organizationCloudDatabaseImplementation;
}

- (id)codeServiceImplementationWithName:(id)a3
{
  return sub_18A6D47E0(self, a3, 0, 0);
}

- (id)codeServiceImplementationWithName:(id)a3 databaseScope:(int64_t)a4
{
  void *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a3;
  objc_msgSend_numberWithInteger_(v6, v8, a4, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18A6D47E0(self, v7, v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)codeServiceImplementationWithName:(id)a3 serviceInstanceURL:(id)a4
{
  return sub_18A6D47E0(self, a3, 0, a4);
}

- (id)codeServiceImplementationWithName:(id)a3 databaseScope:(int64_t)a4 serviceInstanceURL:(id)a5
{
  void *v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = a5;
  v10 = a3;
  objc_msgSend_numberWithInteger_(v8, v11, a4, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18A6D47E0(self, v10, v13, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (CKXPCConnection)connection
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_deviceContext(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_connection(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (CKXPCConnection *)v8;
}

- (id)_discretionaryDaemonMachServiceConnection
{
  const char *v2;
  uint64_t v3;
  __CFString *v4;
  id v5;
  const char *v6;
  void *v7;
  uint64_t v9;

  v4 = CFSTR("com.apple.ckdiscretionaryd");
  if (_sCKUseSystemInstalledBinariesPredicate != -1)
    dispatch_once(&_sCKUseSystemInstalledBinariesPredicate, &unk_1E1F60800);
  if (!_sCKUseSystemInstalledBinaries)
  {
    objc_msgSend_stringByAppendingString_(v4, v2, (uint64_t)CFSTR(".debug"), v3);
    v9 = objc_claimAutoreleasedReturnValue();

    v4 = (__CFString *)v9;
  }
  v5 = objc_alloc(MEMORY[0x1E0CB3B38]);
  v7 = (void *)objc_msgSend_initWithMachServiceName_options_(v5, v6, (uint64_t)v4, 0);

  return v7;
}

- (NSXPCConnection)discretionaryXPCConnection
{
  uint64_t v2;
  uint64_t v3;
  CKContainerImplementation *v4;
  NSXPCConnection *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  NSXPCConnection *v9;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  id v25;
  const char *v26;
  uint64_t v27;
  NSObject *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  id location;
  uint8_t buf[4];
  void *v43;
  uint64_t v44;

  v4 = self;
  v44 = *MEMORY[0x1E0C80C00];
  if (self)
    self = (CKContainerImplementation *)self->_daemonConnectionLock;
  objc_msgSend_lock(self, a2, v2, v3);
  v5 = v4->_discretionaryXPCConnection;
  v9 = v5;
  if (!v4->_hasValidDiscretionaryXPCConnection || v5 == 0)
  {
    objc_initWeak(&location, v4);
    objc_msgSend__discretionaryDaemonMachServiceConnection(v4, v11, v12, v13);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = MEMORY[0x1E0C809B0];
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = sub_18A6D58B0;
    v39[3] = &unk_1E1F608C8;
    objc_copyWeak(&v40, &location);
    objc_msgSend_setInterruptionHandler_(v35, v15, (uint64_t)v39, v16);
    v37[0] = v14;
    v37[1] = 3221225472;
    v37[2] = sub_18A6D598C;
    v37[3] = &unk_1E1F608C8;
    objc_copyWeak(&v38, &location);
    objc_msgSend_setInvalidationHandler_(v35, v17, (uint64_t)v37, v18);
    objc_msgSend__CKXPCClientToDiscretionaryDaemonInterface(CKContainer, v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setRemoteObjectInterface_(v35, v23, (uint64_t)v22, v24);

    v25 = sub_18A5E5880([CKContainerCallbackProxy alloc], (uint64_t)v4);
    objc_msgSend_setExportedObject_(v35, v26, (uint64_t)v25, v27);
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v28 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v43 = v35;
      _os_log_impl(&dword_18A5C5000, v28, OS_LOG_TYPE_INFO, "Created a new connection: %@", buf, 0xCu);
    }
    objc_msgSend_invalidate(v4->_discretionaryXPCConnection, v29, v30, v31);
    objc_storeStrong((id *)&v4->_discretionaryXPCConnection, v35);
    v4->_hasValidDiscretionaryXPCConnection = v35 != 0;
    objc_msgSend_resume(v35, v32, v33, v34);

    objc_destroyWeak(&v38);
    objc_destroyWeak(&v40);
    objc_destroyWeak(&location);
  }
  else
  {
    v35 = v5;
  }
  objc_msgSend_unlock(v4->_daemonConnectionLock, v6, v7, v8);
  return (NSXPCConnection *)v35;
}

- (void)handleSharingUIUpdatedShare:(id)a3 recordID:(id)a4 isDeleted:(BOOL)a5 error:(id)a6 reply:(id)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  void (**v15)(id, _QWORD);
  CKContainerImplementation *v16;
  NSHashTable *sharingUIObservers;
  NSHashTable *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  const char *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v9 = a5;
  v35 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = (void (**)(id, _QWORD))a7;
  v16 = self;
  objc_sync_enter(v16);
  if (v16)
    sharingUIObservers = v16->_sharingUIObservers;
  else
    sharingUIObservers = 0;
  v18 = sharingUIObservers;
  objc_msgSend_allObjects(v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v16);
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v23 = v22;
  v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v30, (uint64_t)v34, 16);
  if (v26)
  {
    v27 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v31 != v27)
          objc_enumerationMutation(v23);
        objc_msgSend_handleSharingUIUpdatedShare_recordID_isDeleted_error_(*(void **)(*((_QWORD *)&v30 + 1) + 8 * i), v25, (uint64_t)v12, (uint64_t)v13, v9, v14, (_QWORD)v30);
      }
      v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v25, (uint64_t)&v30, (uint64_t)v34, 16);
    }
    while (v26);
  }

  if (v9)
    objc_msgSend_handleRecordChanged_changeType_record_error_(v16, v29, (uint64_t)v13, 3, v12, v14, (_QWORD)v30);
  else
    objc_msgSend_handleRecordChanged_changeType_record_error_(v16, v29, (uint64_t)v13, 2, v12, v14, (_QWORD)v30);
  v15[2](v15, 0);

}

- (void)_addPreparedConvenienceOperation:(id)a3
{
  uint64_t v3;

  if (self)
    self = (CKContainerImplementation *)self->_convenienceOperationQueue;
  objc_msgSend_addOperation_(self, a2, (uint64_t)a3, v3);
}

- (void)addOperation:(id)a3 wrappingContainer:(id)a4 convenienceConfiguration:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  CKException *v20;
  const char *v21;
  id v22;
  id v23;

  v23 = a3;
  v8 = a4;
  v9 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v20 = [CKException alloc];
    v22 = (id)objc_msgSend_initWithCode_format_(v20, v21, 12, (uint64_t)CFSTR("CKDatabaseOperations must be submitted to a CKDatabase"));
    objc_exception_throw(v22);
  }
  objc_msgSend_configuration(v23, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setContainer_(v13, v14, (uint64_t)v8, v15);

  objc_msgSend_applyConvenienceConfiguration_(v23, v16, (uint64_t)v9, v17);
  objc_msgSend__addPreparedConvenienceOperation_(self, v18, (uint64_t)v23, v19);

}

- (void)_scheduleConvenienceOperation:(id)a3 wrappingContainer:(id)a4 convenienceConfiguration:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  id v13;

  v8 = a5;
  v9 = a4;
  v13 = a3;
  objc_msgSend_configureConvenience_(v13, v10, (uint64_t)v8, v11);
  objc_msgSend_addOperation_wrappingContainer_convenienceConfiguration_(self, v12, (uint64_t)v13, (uint64_t)v9, v8);

}

- (void)statusGroupsForApplicationPermission:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  unint64_t v13;
  _QWORD v14[4];
  id v15;
  os_activity_scope_state_s state;

  v6 = a4;
  v7 = _os_activity_create(&dword_18A5C5000, "client/status-groups-for-application-permission", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  v8 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_18A6D5EFC;
  v14[3] = &unk_1E1F60910;
  v15 = v6;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = sub_18A6D5F5C;
  v11[3] = &unk_1E1F60960;
  v13 = a3;
  v9 = v15;
  v12 = v9;
  v10 = v9;
  if (self)
  {
    sub_18A5ECA88(self, 0, (void *)1, 0, v14, v11);
    v10 = v12;
  }

  os_activity_scope_leave(&state);
}

- (void)setApplicationPermission:(unint64_t)a3 enabled:(BOOL)a4 completionHandler:(id)a5
{
  id v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  unint64_t v15;
  BOOL v16;
  _QWORD v17[4];
  id v18;
  os_activity_scope_state_s state;

  v8 = a5;
  v9 = _os_activity_create(&dword_18A5C5000, "client/set-application-permission-enabled", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  v10 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = sub_18A6D616C;
  v17[3] = &unk_1E1F60910;
  v18 = v8;
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = sub_18A6D61CC;
  v13[3] = &unk_1E1F609B0;
  v15 = a3;
  v16 = a4;
  v11 = v18;
  v14 = v11;
  v12 = v11;
  if (self)
  {
    sub_18A5ECA88(self, 0, (void *)1, 0, v17, v13);
    v12 = v14;
  }

  os_activity_scope_leave(&state);
}

- (void)resetAllApplicationPermissionsWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_18A5C5000, "client/reset-all-application-permissions", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18A6D63D4;
  v11[3] = &unk_1E1F60910;
  v12 = v4;
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = sub_18A6D6430;
  v9[3] = &unk_1E1F609D8;
  v7 = v12;
  v10 = v7;
  v8 = v7;
  if (self)
  {
    sub_18A5ECA88(self, 0, (void *)1, 0, v11, v9);
    v8 = v10;
  }

  os_activity_scope_leave(&state);
}

- (void)tossConfigWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_18A5C5000, "client/toss-config", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18A6D661C;
  v11[3] = &unk_1E1F60910;
  v12 = v4;
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = sub_18A6D6678;
  v9[3] = &unk_1E1F609D8;
  v7 = v12;
  v10 = v7;
  v8 = v7;
  if (self)
  {
    sub_18A5ECA88(self, 0, (void *)1, 0, v11, v9);
    v8 = v10;
  }

  os_activity_scope_leave(&state);
}

- (NSString)pushEnvironment
{
  NSString *v3;

  os_unfair_lock_lock((os_unfair_lock_t)&unk_1ECD96A50);
  v3 = self->_pushEnvironment;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECD96A50);
  return v3;
}

- (void)setPushEnvironment:(id)a3
{
  NSString *v4;
  NSString *pushEnvironment;

  v4 = (NSString *)a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1ECD96A50);
  pushEnvironment = self->_pushEnvironment;
  self->_pushEnvironment = v4;

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECD96A50);
}

- (void)pushEnvironmentWithCompletionHandler:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  NSObject *v25;
  const char *v26;
  uint64_t v27;
  _QWORD v28[4];
  void (**v29)(id, void *, _QWORD);
  id v30;
  id location[2];
  os_activity_scope_state_s state;

  v4 = (void (**)(id, void *, _QWORD))a3;
  v5 = _os_activity_create(&dword_18A5C5000, "client/push-environment", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  objc_msgSend_pushEnvironment(self, v6, v7, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v13 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(location[0]) = 0;
      _os_log_debug_impl(&dword_18A5C5000, v13, OS_LOG_TYPE_DEBUG, "Using cached server preferred push environment", (uint8_t *)location, 2u);
    }
    v4[2](v4, v12, 0);
  }
  else
  {
    objc_msgSend_sharedManager(CKProcessScopedStateManager, v9, v10, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_untrustedEntitlements(v14, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_apsEnvironmentEntitlement(v18, v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend_caseInsensitiveCompare_(v22, v23, (uint64_t)CFSTR("serverpreferred"), v24))
    {
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v25 = ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(location[0]) = 0;
        _os_log_debug_impl(&dword_18A5C5000, v25, OS_LOG_TYPE_DEBUG, "Using adopter override push environment", (uint8_t *)location, 2u);
      }
      v4[2](v4, v22, 0);
    }
    else
    {
      objc_initWeak(location, self);
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = sub_18A6D6A88;
      v28[3] = &unk_1E1F60A00;
      objc_copyWeak(&v30, location);
      v29 = v4;
      objc_msgSend_serverPreferredPushEnvironmentWithCompletionHandler_(self, v26, (uint64_t)v28, v27);

      objc_destroyWeak(&v30);
      objc_destroyWeak(location);
    }

  }
  os_activity_scope_leave(&state);

}

- (void)serverPreferredPushEnvironmentWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  uint8_t v7[16];

  v4 = a3;
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v5 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_debug_impl(&dword_18A5C5000, v5, OS_LOG_TYPE_DEBUG, "Fetching server preferred push environment asynchronously", v7, 2u);
  }
  objc_msgSend_serverPreferredPushEnvironmentSynchronous_withCompletionHandler_(self, v6, 0, (uint64_t)v4);

}

- (id)serverPreferredPushEnvironmentWithError:(id *)a3
{
  NSObject *v5;
  const char *v6;
  void *v7;
  id v8;
  _QWORD v10[6];
  uint8_t buf[16];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_18A6D6E80;
  v22 = sub_18A6D6E90;
  v23 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_18A6D6E80;
  v16 = sub_18A6D6E90;
  v17 = 0;
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v5 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_18A5C5000, v5, OS_LOG_TYPE_DEBUG, "Fetching server preferred push environment synchronously", buf, 2u);
  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_18A6D6E98;
  v10[3] = &unk_1E1F60A28;
  v10[4] = &v18;
  v10[5] = &v12;
  objc_msgSend_serverPreferredPushEnvironmentSynchronous_withCompletionHandler_(self, v6, 1, (uint64_t)v10);
  if (a3)
  {
    v7 = (void *)v13[5];
    if (v7)
      *a3 = objc_retainAutorelease(v7);
  }
  v8 = (id)v19[5];
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v8;
}

- (void)serverPreferredPushEnvironmentSynchronous:(BOOL)a3 withCompletionHandler:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  os_activity_scope_state_s state;

  v4 = a3;
  v6 = a4;
  v7 = _os_activity_create(&dword_18A5C5000, "client/server-preferred-push-environment", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_18A6D7038;
  v13[3] = &unk_1E1F60910;
  v14 = v6;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = sub_18A6D7098;
  v11[3] = &unk_1E1F609D8;
  v9 = v14;
  v12 = v9;
  v10 = v9;
  if (self)
  {
    sub_18A5ECA88(self, v4, (void *)1, 0, v13, v11);
    v10 = v12;
  }

  os_activity_scope_leave(&state);
}

- (void)setFakeError:(id)a3 forNextRequestOfClassName:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_18A5C5000, "client/set-fake-error", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  v9 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_18A6D72BC;
  v16[3] = &unk_1E1F5F958;
  v17 = v7;
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = sub_18A6D73A8;
  v13[3] = &unk_1E1F60A98;
  v10 = v6;
  v14 = v10;
  v11 = v17;
  v15 = v11;
  v12 = v11;
  if (self)
  {
    sub_18A5ECA88(self, 0, (void *)1, 0, v16, v13);
    v12 = v15;
  }

  os_activity_scope_leave(&state);
}

- (void)setFakeResponseOperationResult:(id)a3 forNextRequestOfClassName:(id)a4 forItemID:(id)a5 withLifetime:(int)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  int v23;
  _QWORD v24[4];
  id v25;
  os_activity_scope_state_s state;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = _os_activity_create(&dword_18A5C5000, "client/set-fake-response-operation-result", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v13, &state);
  v14 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = sub_18A6D7544;
  v24[3] = &unk_1E1F5F958;
  v25 = v11;
  v19[0] = v14;
  v19[1] = 3221225472;
  v19[2] = sub_18A6D7630;
  v19[3] = &unk_1E1F60AE0;
  v15 = v10;
  v20 = v15;
  v16 = v25;
  v21 = v16;
  v17 = v12;
  v22 = v17;
  v23 = a6;
  v18 = v17;
  if (self)
  {
    sub_18A5ECA88(self, 0, (void *)1, 0, v24, v19);
    v18 = v22;
  }

  os_activity_scope_leave(&state);
}

- (void)getOutstandingOperationCountWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_18A5C5000, "client/get-num-outstanding-operations", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18A6D7770;
  v11[3] = &unk_1E1F60910;
  v12 = v4;
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = sub_18A6D77D0;
  v9[3] = &unk_1E1F609D8;
  v7 = v12;
  v10 = v7;
  v8 = v7;
  if (self)
  {
    sub_18A5ECA88(self, 0, (void *)1, 0, v11, v9);
    v8 = v10;
  }

  os_activity_scope_leave(&state);
}

- (void)dropDetachedContainersWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_18A5C5000, "client/drop-detached-containers", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18A6D79B0;
  v11[3] = &unk_1E1F60910;
  v12 = v4;
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = sub_18A6D7A0C;
  v9[3] = &unk_1E1F609D8;
  v7 = v12;
  v10 = v7;
  v8 = v7;
  if (self)
  {
    sub_18A5ECA88(self, 0, (void *)1, 0, v11, v9);
    v8 = v10;
  }

  os_activity_scope_leave(&state);
}

- (void)fetchSignatureGeneratorForCurrentUserBoundaryKeyWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_18A6D7B3C;
  v8[3] = &unk_1E1F60B30;
  v9 = v4;
  v5 = v4;
  objc_msgSend_fetchGlobalPerUserBoundaryKeyWithCompletionHandler_(self, v6, (uint64_t)v8, v7);

}

- (void)fetchGlobalPerUserBoundaryKeyWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[16];
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_18A5C5000, "client/fetch-current-user-boundary-key", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v6 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_18A5C5000, v6, OS_LOG_TYPE_DEBUG, "Fetching boundary key", buf, 2u);
  }
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_18A6D7D54;
  v12[3] = &unk_1E1F60910;
  v13 = v4;
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = sub_18A6D7E6C;
  v10[3] = &unk_1E1F609D8;
  v8 = v13;
  v11 = v8;
  v9 = v8;
  if (self)
  {
    sub_18A5ECA88(self, 0, (void *)1, 0, v12, v10);
    v9 = v11;
  }

  os_activity_scope_leave(&state);
}

- (void)setSourceApplicationSecondaryIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  CKContainerImplementation *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSString *sourceApplicationSecondaryIdentifier_locked;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v5 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    v12 = 138543362;
    v13 = v4;
    _os_log_debug_impl(&dword_18A5C5000, v5, OS_LOG_TYPE_DEBUG, "setSourceApplicationSecondaryIdentifier:%{public}@", (uint8_t *)&v12, 0xCu);
  }
  v6 = self;
  objc_sync_enter(v6);
  v10 = objc_msgSend_copy(v4, v7, v8, v9);
  sourceApplicationSecondaryIdentifier_locked = v6->_sourceApplicationSecondaryIdentifier_locked;
  v6->_sourceApplicationSecondaryIdentifier_locked = (NSString *)v10;

  objc_sync_exit(v6);
}

- (void)wipeAllCachesAndDie
{
  uint64_t v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  objc_msgSend_connection(self, a2, v2, v3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_processScopedDaemonProxy(v11, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_wipeAllCachesAndDie(v7, v8, v9, v10);

}

- (void)clearContainerFromMetadataCache
{
  NSObject *v3;
  os_activity_scope_state_s v4;

  v3 = _os_activity_create(&dword_18A5C5000, "client/clear-container-from-metadata-cache", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v4.opaque[0] = 0;
  v4.opaque[1] = 0;
  os_activity_scope_enter(v3, &v4);
  if (self)
    sub_18A5ECA88(self, 0, (void *)1, 0, &unk_1E1F58CB8, &unk_1E1F60B70);
  os_activity_scope_leave(&v4);

}

- (void)clearPILSCacheForLookupInfos:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_18A5C5000, "client/clear-PILS-cache-for-lookup-infos", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_18A6D84CC;
  v8[3] = &unk_1E1F60BB8;
  v6 = v4;
  v9 = v6;
  v7 = v6;
  if (self)
  {
    sub_18A5ECA88(self, 0, (void *)1, 0, &unk_1E1F60B90, v8);
    v7 = v9;
  }

  os_activity_scope_leave(&state);
}

- (void)representativeDataclassEnabledWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_18A5C5000, "client/dataclass-enabled", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18A6D85F8;
  v11[3] = &unk_1E1F60910;
  v12 = v4;
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = sub_18A6D86D8;
  v9[3] = &unk_1E1F609D8;
  v7 = v12;
  v10 = v7;
  v8 = v7;
  if (self)
  {
    sub_18A5ECA88(self, 0, (void *)1, 0, v11, v9);
    v8 = v10;
  }

  os_activity_scope_leave(&state);
}

- (void)fetchServerEnvironment:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_18A5C5000, "client/fetch-server-environment", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18A6D88B8;
  v11[3] = &unk_1E1F60910;
  v12 = v4;
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = sub_18A6D8918;
  v9[3] = &unk_1E1F609D8;
  v7 = v12;
  v10 = v7;
  v8 = v7;
  if (self)
  {
    sub_18A5ECA88(self, 0, (void *)1, 0, v11, v9);
    v8 = v10;
  }

  os_activity_scope_leave(&state);
}

- (void)fetchFullNameAndPrimaryEmailOnAccountWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_18A5C5000, "client/fetch-full-name-and-primary-email-on-account", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18A6D8B58;
  v11[3] = &unk_1E1F60910;
  v12 = v4;
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = sub_18A6D8BBC;
  v9[3] = &unk_1E1F609D8;
  v7 = v12;
  v10 = v7;
  v8 = v7;
  if (self)
  {
    sub_18A5ECA88(self, 0, (void *)1, 0, v11, v9);
    v8 = v10;
  }

  os_activity_scope_leave(&state);
}

- (void)fetchFullNameAndFormattedUsernameOfAccountWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_18A5C5000, "client/fetch-full-name-and-formatted-username-on-account", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18A6D8DDC;
  v11[3] = &unk_1E1F60910;
  v12 = v4;
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = sub_18A6D8E40;
  v9[3] = &unk_1E1F609D8;
  v7 = v12;
  v10 = v7;
  v8 = v7;
  if (self)
  {
    sub_18A5ECA88(self, 0, (void *)1, 0, v11, v9);
    v8 = v10;
  }

  os_activity_scope_leave(&state);
}

- (void)submitEventMetric:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  NSObject *v8;
  NSObject *v9;
  const char *v10;
  os_activity_scope_state_s v11;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if (byte_1EDF75458)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v8 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v11.opaque[0]) = 0;
      _os_log_debug_impl(&dword_18A5C5000, v8, OS_LOG_TYPE_DEBUG, "Not submitting event metric for test host", (uint8_t *)&v11, 2u);
    }
    v7[2](v7);
  }
  else
  {
    v9 = _os_activity_create(&dword_18A5C5000, "client/submit-event-metric-with-completion-handler", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v11.opaque[0] = 0;
    v11.opaque[1] = 0;
    os_activity_scope_enter(v9, &v11);
    objc_msgSend__submitEventMetric_completionHandler_(self, v10, (uint64_t)v6, (uint64_t)v7);
    os_activity_scope_leave(&v11);

  }
}

- (int64_t)lastKnownDeviceCount
{
  NSObject *v3;
  _QWORD v5[5];
  __int128 buf;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v3 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = self;
    _os_log_debug_impl(&dword_18A5C5000, v3, OS_LOG_TYPE_DEBUG, "Retrieving device count for %@", (uint8_t *)&buf, 0xCu);
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v7 = 0x2020000000;
  v8 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_18A6D9484;
  v5[3] = &unk_1E1F60CC8;
  v5[4] = &buf;
  if (self)
  {
    sub_18A5ECA88(self, 1, (void *)1, 0, &unk_1E1F60C78, v5);
    self = *(CKContainerImplementation **)(*((_QWORD *)&buf + 1) + 24);
  }
  _Block_object_dispose(&buf, 8);
  return (int64_t)self;
}

- (id)networkTransferEndpointWithError:(id *)a3
{
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD v16[6];
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  __int128 buf;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v5 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = self;
    _os_log_debug_impl(&dword_18A5C5000, v5, OS_LOG_TYPE_DEBUG, "Getting network transfer endpoint for %@", (uint8_t *)&buf, 0xCu);
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v25 = 0x3032000000;
  v26 = sub_18A6D6E80;
  v27 = sub_18A6D6E90;
  v28 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_18A6D6E80;
  v22 = sub_18A6D6E90;
  v23 = 0;
  v16[5] = &v18;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = sub_18A6D983C;
  v17[3] = &unk_1E1F60CF0;
  v17[4] = &buf;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_18A6D9934;
  v16[3] = &unk_1E1F60D40;
  v16[4] = &buf;
  if (self)
  {
    sub_18A5ECA88(self, 1, (void *)1, 0, v17, v16);
    objc_msgSend_CKClientSuitableError(*(void **)(*((_QWORD *)&buf + 1) + 40), v9, v10, v11);
  }
  else
  {
    objc_msgSend_CKClientSuitableError(0, v6, v7, v8);
  }
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = *(void **)(*((_QWORD *)&buf + 1) + 40);
  *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v12;

  if (a3)
    *a3 = objc_retainAutorelease(*(id *)(*((_QWORD *)&buf + 1) + 40));
  v14 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&buf, 8);
  return v14;
}

- (id)recordChangeProvider
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_sharedManager(CKRecordObserverManager, a2, v2, v3);
}

- (void)handleRecordChanged:(id)a3 changeType:(int64_t)a4 record:(id)a5 error:(id)a6
{
  id v9;
  id v10;
  CKRecordChange *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  id v22;

  if (!a6)
  {
    v9 = a5;
    v10 = a3;
    v11 = [CKRecordChange alloc];
    v22 = (id)objc_msgSend_initWithChangeType_recordID_record_(v11, v12, a4, (uint64_t)v10, v9);

    objc_msgSend_sharedManager(CKRecordObserverManager, v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_unconfiguredWrappingContainer(self, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleRecordChange_container_completionHandler_(v16, v21, (uint64_t)v22, (uint64_t)v20, 0);

  }
}

- (void)fetchFrameworkCachesDirectoryWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  CKContainerImplementation *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v5 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v14 = self;
    _os_log_debug_impl(&dword_18A5C5000, v5, OS_LOG_TYPE_DEBUG, "Retrieving client-accessible caches directory for %@", buf, 0xCu);
  }
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18A6D9E10;
  v11[3] = &unk_1E1F60910;
  v12 = v4;
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = sub_18A6D9E70;
  v9[3] = &unk_1E1F609D8;
  v7 = v12;
  v10 = v7;
  v8 = v7;
  if (self)
  {
    sub_18A5ECA88(self, 0, (void *)1, 0, v11, v9);
    v8 = v10;
  }

}

- (id)CKStatusReportArray
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t i;
  void *v75;
  const char *v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t j;
  void *v97;
  const char *v98;
  uint64_t v99;
  const char *v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  _BYTE v115[128];
  _BYTE v116[128];
  uint64_t v117;

  v117 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_containerID(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ckShortDescription(v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_processInfo(MEMORY[0x1E0CB3898], v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_processName(v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v4, v21, (uint64_t)CFSTR("\n----- Client Status Report For %@ (client:\"%@\")"), v22, v12, v20);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v24, (uint64_t)v23, v25);

  v26 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_throttlingOperationQueue(self, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend_operationCount(v30, v31, v32, v33);
  objc_msgSend_throttlingOperationQueue(self, v35, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend_maxConcurrentOperationCount(v38, v39, v40, v41);
  objc_msgSend_stringWithFormat_(v26, v43, (uint64_t)CFSTR("%@, %lu/%ld operations"), v44, self, v34, v42);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v46, (uint64_t)v45, v47);

  objc_msgSend_addObject_(v3, v48, (uint64_t)CFSTR("\n%%%%% Operations %%%%%"), v49);
  objc_msgSend_throttlingOperationQueue(self, v50, v51, v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend_operationCount(v53, v54, v55, v56);

  if (v57)
  {
    objc_msgSend_addObject_(v3, v58, (uint64_t)CFSTR("\nOperations on throttling queue: {"), v59);
    v113 = 0u;
    v114 = 0u;
    v111 = 0u;
    v112 = 0u;
    objc_msgSend_throttlingOperationQueue(self, v60, v61, v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_operations(v63, v64, v65, v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();

    v69 = objc_msgSend_countByEnumeratingWithState_objects_count_(v67, v68, (uint64_t)&v111, (uint64_t)v116, 16);
    if (v69)
    {
      v72 = v69;
      v73 = *(_QWORD *)v112;
      do
      {
        for (i = 0; i != v72; ++i)
        {
          if (*(_QWORD *)v112 != v73)
            objc_enumerationMutation(v67);
          objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v70, (uint64_t)CFSTR("\t%@"), v71, *(_QWORD *)(*((_QWORD *)&v111 + 1) + 8 * i));
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v3, v76, (uint64_t)v75, v77);

        }
        v72 = objc_msgSend_countByEnumeratingWithState_objects_count_(v67, v70, (uint64_t)&v111, (uint64_t)v116, 16);
      }
      while (v72);
    }

    objc_msgSend_addObject_(v3, v78, (uint64_t)CFSTR("}"), v79);
  }
  else
  {
    objc_msgSend_addObject_(v3, v58, (uint64_t)CFSTR("No regular operations."), v59);
  }
  if (self)
    v83 = objc_msgSend_operationCount(self->_convenienceOperationQueue, v80, v81, v82);
  else
    v83 = objc_msgSend_operationCount(0, v80, v81, v82);
  if (v83)
  {
    objc_msgSend_addObject_(v3, v84, (uint64_t)CFSTR("\nOperations on convenience queue: {"), v85);
    v109 = 0u;
    v110 = 0u;
    v107 = 0u;
    v108 = 0u;
    if (self)
      objc_msgSend_operations(self->_convenienceOperationQueue, v86, v87, v88);
    else
      objc_msgSend_operations(0, v86, v87, v88);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = objc_msgSend_countByEnumeratingWithState_objects_count_(v89, v90, (uint64_t)&v107, (uint64_t)v115, 16);
    if (v91)
    {
      v94 = v91;
      v95 = *(_QWORD *)v108;
      do
      {
        for (j = 0; j != v94; ++j)
        {
          if (*(_QWORD *)v108 != v95)
            objc_enumerationMutation(v89);
          objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v92, (uint64_t)CFSTR("\t%@"), v93, *(_QWORD *)(*((_QWORD *)&v107 + 1) + 8 * j));
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v3, v98, (uint64_t)v97, v99);

        }
        v94 = objc_msgSend_countByEnumeratingWithState_objects_count_(v89, v92, (uint64_t)&v107, (uint64_t)v115, 16);
      }
      while (v94);
    }

    objc_msgSend_addObject_(v3, v100, (uint64_t)CFSTR("}"), v101);
  }
  else
  {
    objc_msgSend_addObject_(v3, v84, (uint64_t)CFSTR("No convenience operations."), v85);
  }
  objc_msgSend_addObject_(v3, v102, (uint64_t)CFSTR("%%%%%%%%%%%%%%%%%%%%%%%%"), v103);
  objc_msgSend_addObject_(v3, v104, (uint64_t)CFSTR("\n------------------------------"), v105);
  return v3;
}

- (void)dumpDaemonStatusReportToFileHandle:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_18A5C5000, "client/dump-daemon-status-report", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  v9 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_18A6DA470;
  v16[3] = &unk_1E1F60910;
  v17 = v7;
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = sub_18A6DA4B8;
  v13[3] = &unk_1E1F60D68;
  v10 = v6;
  v14 = v10;
  v11 = v17;
  v15 = v11;
  v12 = v11;
  if (self)
  {
    sub_18A5ECA88(self, 0, (void *)1, 0, v16, v13);
    v12 = v15;
  }

  os_activity_scope_leave(&state);
}

- (void)dumpDaemonStatusReport
{
  objc_msgSend_dumpDaemonStatusReportToFileHandle_completionHandler_(self, a2, 0, (uint64_t)&unk_1E1F60D88);
}

- (id)primaryIdentifier
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  objc_msgSend_options(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_applicationBundleIdentifierOverrideForContainerAccess(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    sub_18A6DA5EC();
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  return v11;
}

- (id)applicationBundleIdentifierForPush
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v45;

  objc_msgSend_bundleRecordForCurrentProcess(MEMORY[0x1E0CA5898], a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v45 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_containingBundleRecord(v5, v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_bundleIdentifier(v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }
  objc_msgSend_sharedManager(CKProcessScopedStateManager, v6, v7, v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_untrustedEntitlements(v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_applicationBundleID(v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sharedManager(CKProcessScopedStateManager, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_untrustedEntitlements(v26, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_associatedApplicationBundleID(v30, v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_options(self, v35, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_applicationBundleIdentifierOverrideForPushTopicGeneration(v38, v39, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  CKApplicationBundleIDForPush(v22, v34, v42, v13);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  return v43;
}

- (void)addPreparedOperationToThrottlingOperationQueue:(id)a3
{
  uint64_t v3;

  objc_msgSend_addOperation_(self->_throttlingOperationQueue, a2, (uint64_t)a3, v3);
}

- (void)addPreparedOperationToDiscretionaryThrottlingOperationQueue:(id)a3
{
  uint64_t v3;

  objc_msgSend_addOperation_(self->_discretionaryThrottlingOperationQueue, a2, (uint64_t)a3, v3);
}

- (CKRecordID)orgAdminUserID
{
  dispatch_assert_queue_V2((dispatch_queue_t)qword_1ECD96A88);
  return self->_orgAdminUserID_locked;
}

- (void)fetchOrgAdminUserRecordIDWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  os_activity_scope_state_s v6;

  v4 = a3;
  v5 = _os_activity_create(&dword_18A5C5000, "client/fetch-org-admin-user-record-id", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v6.opaque[0] = 0;
  v6.opaque[1] = 0;
  os_activity_scope_enter(v5, &v6);
  sub_18A5E0330(self, (void *)1, v4);
  os_activity_scope_leave(&v6);

}

- (void)discoverAllIdentitiesWithWrappingContainer:(id)a3 convenienceConfiguration:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  const char *v18;
  uint64_t v19;
  id v20;
  id v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_opt_new();
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = sub_18A6DAA68;
  v28[3] = &unk_1E1F60E50;
  v17 = v15;
  v29 = v17;
  objc_msgSend_setUserIdentityDiscoveredBlock_(v11, v18, (uint64_t)v28, v19);
  v25[0] = v16;
  v25[1] = 3221225472;
  v25[2] = sub_18A6DAA74;
  v25[3] = &unk_1E1F60E78;
  v26 = v17;
  v27 = v8;
  v20 = v17;
  v21 = v8;
  objc_msgSend_setDiscoverAllUserIdentitiesCompletionBlock_(v11, v22, (uint64_t)v25, v23);
  objc_msgSend__scheduleConvenienceOperation_wrappingContainer_convenienceConfiguration_(self, v24, (uint64_t)v11, (uint64_t)v10, v9);

}

- (void)discoverUserIdentityWithEmailAddress:(id)a3 wrappingContainer:(id)a4 convenienceConfiguration:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  CKUserIdentityLookupInfo *v14;
  const char *v15;
  uint64_t v16;
  id v17;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = [CKUserIdentityLookupInfo alloc];
  v17 = (id)objc_msgSend_initWithEmailAddress_(v14, v15, (uint64_t)v13, v16);

  sub_18A6DAA94(self, v17, v12, v11, v10);
}

- (void)discoverUserIdentityWithPhoneNumber:(id)a3 wrappingContainer:(id)a4 convenienceConfiguration:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  CKUserIdentityLookupInfo *v14;
  const char *v15;
  uint64_t v16;
  id v17;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = [CKUserIdentityLookupInfo alloc];
  v17 = (id)objc_msgSend_initWithPhoneNumber_(v14, v15, (uint64_t)v13, v16);

  sub_18A6DAA94(self, v17, v12, v11, v10);
}

- (void)discoverUserIdentityWithUserRecordID:(id)a3 wrappingContainer:(id)a4 convenienceConfiguration:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  CKUserIdentityLookupInfo *v14;
  const char *v15;
  uint64_t v16;
  id v17;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = [CKUserIdentityLookupInfo alloc];
  v17 = (id)objc_msgSend_initWithUserRecordID_(v14, v15, (uint64_t)v13, v16);

  sub_18A6DAA94(self, v17, v12, v11, v10);
}

- (void)fetchShareParticipantWithLookupInfo:(id)a3 wrappingContainer:(id)a4 convenienceConfiguration:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  CKFetchShareParticipantsOperation *v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  id v23;
  id v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t *, void *, uint64_t, uint64_t);
  void *v31;
  id v32;
  id v33;
  _QWORD *v34;
  _QWORD v35[5];
  _QWORD v36[5];
  id v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = [CKFetchShareParticipantsOperation alloc];
  v38[0] = v10;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v15, (uint64_t)v38, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend_initWithUserIdentityLookupInfos_(v14, v17, (uint64_t)v16, v18);

  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = sub_18A6D6E80;
  v36[4] = sub_18A6D6E90;
  v20 = MEMORY[0x1E0C809B0];
  v37 = 0;
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = sub_18A6DB130;
  v35[3] = &unk_1E1F60EF0;
  v35[4] = v36;
  objc_msgSend_setPerShareParticipantCompletionBlock_(v19, v21, (uint64_t)v35, v22);
  v28 = v20;
  v29 = 3221225472;
  v30 = sub_18A6DB144;
  v31 = &unk_1E1F60EC8;
  v23 = v13;
  v33 = v23;
  v34 = v36;
  v24 = v10;
  v32 = v24;
  objc_msgSend_setFetchShareParticipantsCompletionBlock_(v19, v25, (uint64_t)&v28, v26);
  objc_msgSend__scheduleConvenienceOperation_wrappingContainer_convenienceConfiguration_(self, v27, (uint64_t)v19, (uint64_t)v11, v12, v28, v29, v30, v31);

  _Block_object_dispose(v36, 8);
}

- (void)fetchShareParticipantWithEmailAddress:(id)a3 wrappingContainer:(id)a4 convenienceConfiguration:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  char v14;
  id v15;
  CKUserIdentityLookupInfo *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *v21;
  CKException *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  id v32;
  id v33;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v33 = 0;
  v14 = _CKCheckArgument((uint64_t)"emailAddress", v10, 0, 0, 0, &v33);
  v15 = v33;
  if ((v14 & 1) == 0)
  {
    v21 = v15;
    v22 = [CKException alloc];
    v26 = objc_msgSend_code(v21, v23, v24, v25);
    objc_msgSend_localizedDescription(v21, v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (id)objc_msgSend_initWithCode_format_(v22, v31, v26, (uint64_t)CFSTR("%@"), v30);

    objc_exception_throw(v32);
  }

  v16 = [CKUserIdentityLookupInfo alloc];
  v19 = (void *)objc_msgSend_initWithEmailAddress_(v16, v17, (uint64_t)v10, v18);
  objc_msgSend_fetchShareParticipantWithLookupInfo_wrappingContainer_convenienceConfiguration_completionHandler_(self, v20, (uint64_t)v19, (uint64_t)v11, v12, v13);

}

- (void)fetchShareParticipantWithPhoneNumber:(id)a3 wrappingContainer:(id)a4 convenienceConfiguration:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  char v14;
  id v15;
  CKUserIdentityLookupInfo *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *v21;
  CKException *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  id v32;
  id v33;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v33 = 0;
  v14 = _CKCheckArgument((uint64_t)"phoneNumber", v10, 0, 0, 0, &v33);
  v15 = v33;
  if ((v14 & 1) == 0)
  {
    v21 = v15;
    v22 = [CKException alloc];
    v26 = objc_msgSend_code(v21, v23, v24, v25);
    objc_msgSend_localizedDescription(v21, v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (id)objc_msgSend_initWithCode_format_(v22, v31, v26, (uint64_t)CFSTR("%@"), v30);

    objc_exception_throw(v32);
  }

  v16 = [CKUserIdentityLookupInfo alloc];
  v19 = (void *)objc_msgSend_initWithPhoneNumber_(v16, v17, (uint64_t)v10, v18);
  objc_msgSend_fetchShareParticipantWithLookupInfo_wrappingContainer_convenienceConfiguration_completionHandler_(self, v20, (uint64_t)v19, (uint64_t)v11, v12, v13);

}

- (void)fetchShareParticipantWithUserRecordID:(id)a3 wrappingContainer:(id)a4 convenienceConfiguration:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  char v14;
  id v15;
  CKUserIdentityLookupInfo *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *v21;
  CKException *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  id v32;
  id v33;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v33 = 0;
  v14 = _CKCheckArgument((uint64_t)"userRecordID", v10, 0, 1, 0, &v33);
  v15 = v33;
  if ((v14 & 1) == 0)
  {
    v21 = v15;
    v22 = [CKException alloc];
    v26 = objc_msgSend_code(v21, v23, v24, v25);
    objc_msgSend_localizedDescription(v21, v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (id)objc_msgSend_initWithCode_format_(v22, v31, v26, (uint64_t)CFSTR("%@"), v30);

    objc_exception_throw(v32);
  }

  v16 = [CKUserIdentityLookupInfo alloc];
  v19 = (void *)objc_msgSend_initWithUserRecordID_(v16, v17, (uint64_t)v10, v18);
  objc_msgSend_fetchShareParticipantWithLookupInfo_wrappingContainer_convenienceConfiguration_completionHandler_(self, v20, (uint64_t)v19, (uint64_t)v11, v12, v13);

}

- (void)fetchShareMetadataWithURL:(id)a3 wrappingContainer:(id)a4 convenienceConfiguration:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  char v14;
  id v15;
  void *v16;
  CKFetchShareMetadataOperation *v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  id v24;
  const char *v25;
  uint64_t v26;
  id v27;
  id v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  CKException *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  _QWORD *v46;
  _QWORD v47[4];
  id v48;
  _QWORD *v49;
  _QWORD v50[5];
  id v51;
  id v52;
  _QWORD v53[2];

  v53[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v52 = 0;
  v14 = _CKCheckArgument((uint64_t)"shareURL", v10, 0, 0, 0, &v52);
  v15 = v52;
  v16 = v15;
  if ((v14 & 1) == 0)
  {
    v32 = [CKException alloc];
    v36 = objc_msgSend_code(v16, v33, v34, v35);
    objc_msgSend_localizedDescription(v16, v37, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = (id)objc_msgSend_initWithCode_format_(v32, v41, v36, (uint64_t)CFSTR("%@"), v40);

    objc_exception_throw(v42);
  }

  v50[0] = 0;
  v50[1] = v50;
  v50[2] = 0x3032000000;
  v50[3] = sub_18A6D6E80;
  v50[4] = sub_18A6D6E90;
  v51 = 0;
  v17 = [CKFetchShareMetadataOperation alloc];
  v53[0] = v10;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v18, (uint64_t)v53, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend_initWithShareURLs_(v17, v20, (uint64_t)v19, v21);

  v23 = MEMORY[0x1E0C809B0];
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = sub_18A6DB810;
  v47[3] = &unk_1E1F60F18;
  v24 = v10;
  v48 = v24;
  v49 = v50;
  objc_msgSend_setPerShareMetadataBlock_(v22, v25, (uint64_t)v47, v26);
  v43[0] = v23;
  v43[1] = 3221225472;
  v43[2] = sub_18A6DB874;
  v43[3] = &unk_1E1F60EC8;
  v27 = v13;
  v45 = v27;
  v46 = v50;
  v28 = v24;
  v44 = v28;
  objc_msgSend_setFetchShareMetadataCompletionBlock_(v22, v29, (uint64_t)v43, v30);
  objc_msgSend__scheduleConvenienceOperation_wrappingContainer_convenienceConfiguration_(self, v31, (uint64_t)v22, (uint64_t)v11, v12);

  _Block_object_dispose(v50, 8);
}

- (void)acceptShareMetadata:(id)a3 wrappingContainer:(id)a4 convenienceConfiguration:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  char v14;
  id v15;
  void *v16;
  CKAcceptSharesOperation *v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  id v24;
  const char *v25;
  uint64_t v26;
  id v27;
  id v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  CKException *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  _QWORD *v46;
  _QWORD v47[4];
  id v48;
  _QWORD *v49;
  _QWORD v50[5];
  id v51;
  id v52;
  _QWORD v53[2];

  v53[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v52 = 0;
  v14 = _CKCheckArgument((uint64_t)"metadata", v10, 0, 0, 0, &v52);
  v15 = v52;
  v16 = v15;
  if ((v14 & 1) == 0)
  {
    v32 = [CKException alloc];
    v36 = objc_msgSend_code(v16, v33, v34, v35);
    objc_msgSend_localizedDescription(v16, v37, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = (id)objc_msgSend_initWithCode_format_(v32, v41, v36, (uint64_t)CFSTR("%@"), v40);

    objc_exception_throw(v42);
  }

  v50[0] = 0;
  v50[1] = v50;
  v50[2] = 0x3032000000;
  v50[3] = sub_18A6D6E80;
  v50[4] = sub_18A6D6E90;
  v51 = 0;
  v17 = [CKAcceptSharesOperation alloc];
  v53[0] = v10;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v18, (uint64_t)v53, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend_initWithShareMetadatas_(v17, v20, (uint64_t)v19, v21);

  v23 = MEMORY[0x1E0C809B0];
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = sub_18A6DBB8C;
  v47[3] = &unk_1E1F60F40;
  v24 = v10;
  v48 = v24;
  v49 = v50;
  objc_msgSend_setPerShareCompletionBlock_(v22, v25, (uint64_t)v47, v26);
  v43[0] = v23;
  v43[1] = 3221225472;
  v43[2] = sub_18A6DBBF0;
  v43[3] = &unk_1E1F60EC8;
  v27 = v13;
  v45 = v27;
  v46 = v50;
  v28 = v24;
  v44 = v28;
  objc_msgSend_setAcceptSharesCompletionBlock_(v22, v29, (uint64_t)v43, v30);
  objc_msgSend__scheduleConvenienceOperation_wrappingContainer_convenienceConfiguration_(self, v31, (uint64_t)v22, (uint64_t)v11, v12);

  _Block_object_dispose(v50, 8);
}

- (void)decryptPersonalInfoOnShare:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_18A5C5000, "client/decrypt-personal-info-on-share", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  v9 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_18A6DBDFC;
  v16[3] = &unk_1E1F60910;
  v17 = v7;
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = sub_18A6DBE5C;
  v13[3] = &unk_1E1F60D68;
  v10 = v6;
  v14 = v10;
  v11 = v17;
  v15 = v11;
  v12 = v11;
  if (self)
  {
    sub_18A5ECA88(self, 0, (void *)1, 0, v16, v13);
    v12 = v15;
  }

  os_activity_scope_leave(&state);
}

- (void)getNewWebSharingIdentityDataWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_18A5C5000, "client/get-new-web-sharing-identity-data", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18A6DC054;
  v11[3] = &unk_1E1F60910;
  v12 = v4;
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = sub_18A6DC0B4;
  v9[3] = &unk_1E1F609D8;
  v7 = v12;
  v10 = v7;
  v8 = v7;
  if (self)
  {
    sub_18A5ECA88(self, 0, (void *)1, 0, v11, v9);
    v8 = v10;
  }

  os_activity_scope_leave(&state);
}

- (id)accountInfoFetchQueue
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t *v9;

  objc_msgSend_options(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_bypassPCSEncryption(v4, v5, v6, v7);

  if (v8)
  {
    v9 = &qword_1ECD96A90;
    if (qword_1ECD96AB0 != -1)
      dispatch_once(&qword_1ECD96AB0, &unk_1E1F58D98);
  }
  else
  {
    v9 = &qword_1ECD96A98;
  }
  return (id)*v9;
}

- (void)_refreshAccountAccessAuthorizationWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_18A5C5000, "client/refresh-account-access-authorization", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  objc_msgSend_accountInfoFetchQueue(self, v6, v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18A6DC338;
  v11[3] = &unk_1E1F5F730;
  v11[4] = self;
  v12 = v4;
  v10 = v4;
  dispatch_async(v9, v11);

  os_activity_scope_leave(&state);
}

- (void)reloadAccountWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[16];
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_18A5C5000, "client/reload-account", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v6 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18A5C5000, v6, OS_LOG_TYPE_INFO, "Reloading account", buf, 2u);
  }
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_18A6DD4B4;
  v12[3] = &unk_1E1F60910;
  v13 = v4;
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = sub_18A6DD5C8;
  v10[3] = &unk_1E1F609D8;
  v8 = v13;
  v11 = v8;
  v9 = v8;
  if (self)
  {
    sub_18A5ECA88(self, 0, (void *)1, 0, v12, v10);
    v9 = v11;
  }

  os_activity_scope_leave(&state);
}

- (void)statusForApplicationPermission:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  os_signpost_id_t v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  id v24;
  id v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  unint64_t v30;
  _QWORD v31[4];
  id v32;
  id v33;
  os_activity_scope_state_s buf;
  uint8_t v35[4];
  unint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend_signpost(CKSignpost, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v10;
  if (v10)
  {
    objc_msgSend_log(v10, v11, v12, v13);
    v15 = objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend_identifier(v14, v16, v17, v18);
    if ((unint64_t)(v19 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v20 = v19;
      if (os_signpost_enabled(v15))
      {
        LOWORD(buf.opaque[0]) = 0;
        _os_signpost_emit_with_name_impl(&dword_18A5C5000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v20, "statusForApplicationPermission", ", (uint8_t *)&buf, 2u);
      }
    }

  }
  v21 = _os_activity_create(&dword_18A5C5000, "client/status-for-application-permission", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  buf.opaque[0] = 0;
  buf.opaque[1] = 0;
  os_activity_scope_enter(v21, &buf);
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v22 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v35 = 134217984;
    v36 = a3;
    _os_log_debug_impl(&dword_18A5C5000, v22, OS_LOG_TYPE_DEBUG, "Fetching application permissions for %lu", v35, 0xCu);
  }
  v23 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = sub_18A6DDA54;
  v31[3] = &unk_1E1F60E78;
  v33 = v6;
  v32 = v14;
  v27[0] = v23;
  v27[1] = 3221225472;
  v27[2] = sub_18A6DDBC0;
  v27[3] = &unk_1E1F610D0;
  v30 = a3;
  v24 = v33;
  v29 = v24;
  v25 = v32;
  v28 = v25;
  v26 = v25;
  if (self)
  {
    sub_18A5ECA88(self, 0, (void *)1, 0, v31, v27);
    v26 = v28;
  }

  os_activity_scope_leave(&buf);
}

- (void)requestApplicationPermission:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  os_signpost_id_t v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  id v24;
  id v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  unint64_t v30;
  _QWORD v31[4];
  id v32;
  id v33;
  os_activity_scope_state_s buf;
  uint8_t v35[4];
  unint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend_signpost(CKSignpost, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v10;
  if (v10)
  {
    objc_msgSend_log(v10, v11, v12, v13);
    v15 = objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend_identifier(v14, v16, v17, v18);
    if ((unint64_t)(v19 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v20 = v19;
      if (os_signpost_enabled(v15))
      {
        LOWORD(buf.opaque[0]) = 0;
        _os_signpost_emit_with_name_impl(&dword_18A5C5000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v20, "requestApplicationPermission", ", (uint8_t *)&buf, 2u);
      }
    }

  }
  v21 = _os_activity_create(&dword_18A5C5000, "client/request-application-permission", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  buf.opaque[0] = 0;
  buf.opaque[1] = 0;
  os_activity_scope_enter(v21, &buf);
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v22 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v35 = 134217984;
    v36 = a3;
    _os_log_debug_impl(&dword_18A5C5000, v22, OS_LOG_TYPE_DEBUG, "Requesting application permissions: %lu", v35, 0xCu);
  }
  v23 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = sub_18A6DE150;
  v31[3] = &unk_1E1F60E78;
  v33 = v6;
  v32 = v14;
  v27[0] = v23;
  v27[1] = 3221225472;
  v27[2] = sub_18A6DE2BC;
  v27[3] = &unk_1E1F610D0;
  v30 = a3;
  v24 = v33;
  v29 = v24;
  v25 = v32;
  v28 = v25;
  v26 = v25;
  if (self)
  {
    sub_18A5ECA88(self, 0, (void *)1, 0, v31, v27);
    v26 = v28;
  }

  os_activity_scope_leave(&buf);
}

- (void)fetchAllLongLivedOperationIDsWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_18A5C5000, "client/fetch-all-long-lived-operation-ids", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18A6DE8A0;
  v11[3] = &unk_1E1F60910;
  v12 = v4;
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = sub_18A6DE900;
  v9[3] = &unk_1E1F609D8;
  v7 = v12;
  v10 = v7;
  v8 = v7;
  if (self)
  {
    sub_18A5ECA88(self, 0, (void *)1, 0, v11, v9);
    v8 = v10;
  }

  os_activity_scope_leave(&state);
}

- (void)fetchLongLivedOperationWithID:(id)a3 wrappingContainer:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  const char *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  _QWORD *v17;
  void *v18;
  _QWORD *v19;
  _QWORD v20[4];
  id v21;
  os_activity_scope_state_s state;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD *v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[3];

  v29[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = _os_activity_create(&dword_18A5C5000, "client/fetch-long-lived-operation-with-id", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  if (v8)
  {
    v29[0] = v8;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v12, (uint64_t)v29, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = sub_18A6DEC2C;
    v20[3] = &unk_1E1F61148;
    v21 = v10;
    v15 = v13;
    v16 = v9;
    v17 = v20;
    v18 = v17;
    if (self)
    {
      v27[0] = v14;
      v27[1] = 3221225472;
      v27[2] = sub_18A6DE4C0;
      v27[3] = &unk_1E1F60910;
      v19 = v17;
      v28 = v19;
      v23[0] = v14;
      v23[1] = 3221225472;
      v23[2] = sub_18A6DE520;
      v23[3] = &unk_1E1F61120;
      v24 = v15;
      v25 = v16;
      v26 = v19;
      sub_18A5ECA88(self, 0, (void *)1, 0, v27, v23);

    }
  }
  else if (v10)
  {
    (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);
  }
  os_activity_scope_leave(&state);

}

- (void)registerForAssetUploadRequests:(id)a3
{
  objc_msgSend_registerForAssetUploadRequests_machServiceName_(self, a2, (uint64_t)a3, 0);
}

- (void)registerForAssetUploadRequests:(id)a3 machServiceName:(id)a4
{
  id v6;
  id v7;
  id v8;
  const char *v9;
  CKException *v10;
  const char *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    v10 = [CKException alloc];
    v12 = (id)objc_msgSend_initWithName_format_(v10, v11, *MEMORY[0x1E0C99778], (uint64_t)CFSTR("The asset request callback must not be null"));
    objc_exception_throw(v12);
  }
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_18A6DED94;
  v14[3] = &unk_1E1F61170;
  v15 = v7;
  v16 = v6;
  v8 = v7;
  v13 = v6;
  objc_msgSend_withUploadManager_performBlock_(self, v9, 0, (uint64_t)v14);

}

- (void)registerForPackageUploadRequests:(id)a3
{
  objc_msgSend_registerForPackageUploadRequests_machServiceName_(self, a2, (uint64_t)a3, 0);
}

- (void)registerForPackageUploadRequests:(id)a3 machServiceName:(id)a4
{
  id v6;
  id v7;
  id v8;
  const char *v9;
  CKException *v10;
  const char *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    v10 = [CKException alloc];
    v12 = (id)objc_msgSend_initWithName_format_(v10, v11, *MEMORY[0x1E0C99778], (uint64_t)CFSTR("The package request callback must not be null"));
    objc_exception_throw(v12);
  }
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_18A6DEEC4;
  v14[3] = &unk_1E1F61170;
  v15 = v7;
  v16 = v6;
  v8 = v7;
  v13 = v6;
  objc_msgSend_withUploadManager_performBlock_(self, v9, 0, (uint64_t)v14);

}

- (void)withUploadManager:(int)a3 performBlock:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  CKUploadRequestManager *uploadRequestManager_locked;
  void *v9;
  uint64_t v10;
  CKUploadRequestManager *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  CKUploadRequestManager *v25;
  CKUploadRequestManager *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  CKUploadRequestManager *v30;
  unsigned int (**v31)(void);

  v31 = (unsigned int (**)(void))a4;
  os_unfair_lock_lock(&self->_uploadRequestManagerLock);
  uploadRequestManager_locked = self->_uploadRequestManager_locked;
  if (!a3 && !uploadRequestManager_locked)
  {
    objc_msgSend_sharedOptions(CKBehaviorOptions, 0, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = sub_18A766C70((uint64_t)v9);

    v11 = [CKUploadRequestManager alloc];
    objc_msgSend_unconfiguredWrappingContainer(self, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_options(self, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_uploadRequestConfiguration(v19, v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (CKUploadRequestManager *)objc_msgSend_initWithContainer_repairContainerOverrides_ignoringSystemConditions_(v11, v24, (uint64_t)v15, (uint64_t)v23, v10);
    v26 = self->_uploadRequestManager_locked;
    self->_uploadRequestManager_locked = v25;

    uploadRequestManager_locked = self->_uploadRequestManager_locked;
  }
  if (uploadRequestManager_locked && v31[2]() == 1)
  {
    objc_msgSend_unregister(self->_uploadRequestManager_locked, v27, v28, v29);
    v30 = self->_uploadRequestManager_locked;
    self->_uploadRequestManager_locked = 0;

  }
  os_unfair_lock_unlock(&self->_uploadRequestManagerLock);

}

- (void)unregisterFromUploadRequests
{
  objc_msgSend_withUploadManager_performBlock_(self, a2, 1, (uint64_t)&unk_1E1F611B0);
}

- (void)unregisterFromUploadRequestsWithMachServiceName:(id)a3
{
  id v4;
  const char *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_18A6DF0E8;
  v7[3] = &unk_1E1F611D8;
  v8 = v4;
  v6 = v4;
  objc_msgSend_withUploadManager_performBlock_(self, v5, 1, (uint64_t)v7);

}

- (void)manuallyTriggerUploadRequests
{
  objc_msgSend_withUploadManager_performBlock_(self, a2, 1, (uint64_t)&unk_1E1F58E18);
}

- (void)cancelUploadRequests
{
  objc_msgSend_withUploadManager_performBlock_(self, a2, 1, (uint64_t)&unk_1E1F611F8);
}

- (void)registerForAssetRequests:(id)a3 packageRequests:(id)a4 machServiceName:(id)a5
{
  unint64_t v8;
  unint64_t v9;
  id v10;
  void *v11;
  NSObject *v12;
  const __CFString *v13;
  const __CFString *v14;
  BOOL v15;
  const __CFString *v16;
  id v17;
  id v18;
  id v19;
  const char *v20;
  CKException *v21;
  const char *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  const __CFString *v29;
  __int16 v30;
  const __CFString *v31;
  __int16 v32;
  const __CFString *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = (unint64_t)a3;
  v9 = (unint64_t)a4;
  v10 = a5;
  if (!(v8 | v9))
  {
    v21 = [CKException alloc];
    v23 = (id)objc_msgSend_initWithName_format_(v21, v22, *MEMORY[0x1E0C99778], (uint64_t)CFSTR("One of the callbacks must not be null"));
    objc_exception_throw(v23);
  }
  v11 = v10;
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v12 = ck_log_facility_data_repair;
  if (os_log_type_enabled((os_log_t)ck_log_facility_data_repair, OS_LOG_TYPE_INFO))
  {
    v13 = &stru_1E1F66ED0;
    v14 = CFSTR("package");
    if (v9)
    {
      v15 = v8 == 0;
    }
    else
    {
      v14 = &stru_1E1F66ED0;
      v15 = 1;
    }
    v16 = CFSTR(" and ");
    if (v15)
      v16 = &stru_1E1F66ED0;
    *(_DWORD *)buf = 138543874;
    if (v8)
      v13 = CFSTR("asset");
    v29 = v13;
    v30 = 2114;
    v31 = v16;
    v32 = 2114;
    v33 = v14;
    _os_log_impl(&dword_18A5C5000, v12, OS_LOG_TYPE_INFO, "Registering for %{public}@%{public}@%{public}@ upload requests", buf, 0x20u);
  }
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = sub_18A6DF360;
  v24[3] = &unk_1E1F61220;
  v26 = (id)v8;
  v27 = (id)v9;
  v25 = v11;
  v17 = v11;
  v18 = (id)v9;
  v19 = (id)v8;
  objc_msgSend_withUploadManager_performBlock_(self, v20, 0, (uint64_t)v24);

}

- (BOOL)beginContentAccess
{
  NSObject *v3;
  _QWORD v5[5];
  uint8_t buf[8];
  uint8_t *v7;
  uint64_t v8;
  char v9;

  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v3 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18A5C5000, v3, OS_LOG_TYPE_INFO, "Beginning content access", buf, 2u);
  }
  *(_QWORD *)buf = 0;
  v7 = buf;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_18A6DF628;
  v5[3] = &unk_1E1F60CC8;
  v5[4] = buf;
  if (self)
  {
    sub_18A5ECA88(self, 1, (void *)1, 0, &unk_1E1F61240, v5);
    LOBYTE(self) = v7[24] != 0;
  }
  _Block_object_dispose(buf, 8);
  return (char)self;
}

- (void)endContentAccess
{
  NSObject *v3;
  uint8_t v4[16];

  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v3 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_18A5C5000, v3, OS_LOG_TYPE_INFO, "Ending content access", v4, 2u);
  }
  if (self)
    sub_18A5ECA88(self, 0, (void *)1, 0, &unk_1E1F61288, &unk_1E1F612A8);
}

- (void)discardContentIfPossible
{
  NSObject *v3;
  uint8_t v4[16];

  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v3 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_18A5C5000, v3, OS_LOG_TYPE_INFO, "Discarding content if possible", v4, 2u);
  }
  if (self)
    sub_18A5ECA88(self, 0, (void *)1, 0, &unk_1E1F612C8, &unk_1E1F612E8);
}

- (BOOL)isContentDiscarded
{
  BOOL v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_18A6DFE68;
  v4[3] = &unk_1E1F60CC8;
  v4[4] = &v5;
  if (self)
  {
    sub_18A5ECA88(self, 1, (void *)1, 0, &unk_1E1F61308, v4);
    v2 = *((_BYTE *)v6 + 24) != 0;
  }
  else
  {
    v2 = 0;
  }
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)setPersonaIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 112);
}

- (CKContainer)unconfiguredWrappingContainer
{
  return (CKContainer *)objc_loadWeakRetained((id *)&self->_unconfiguredWrappingContainer);
}

- (NSMutableArray)codeServiceImplementations
{
  return self->_codeServiceImplementations;
}

- (NSOperationQueue)throttlingOperationQueue
{
  return self->_throttlingOperationQueue;
}

- (NSOperationQueue)backgroundThrottlingOperationQueue
{
  return self->_backgroundThrottlingOperationQueue;
}

- (NSOperationQueue)discretionaryThrottlingOperationQueue
{
  return self->_discretionaryThrottlingOperationQueue;
}

- (int)statusReportToken
{
  return self->_statusReportToken;
}

- (CKContainerSetupInfo)cachedSetupInfo
{
  return self->_cachedSetupInfo;
}

- (void)setFakeDeviceToDeviceEncryptionAvailability:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 192);
}

- (OS_dispatch_queue)underlyingDispatchQueue
{
  return self->_underlyingDispatchQueue;
}

@end

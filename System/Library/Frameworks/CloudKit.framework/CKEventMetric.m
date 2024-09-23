@implementation CKEventMetric

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  id v6;
  CKEventMetric *v7;
  const char *v8;
  uint64_t v9;
  BOOL hasBeenSubmitted;
  void *v11;
  const char *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  if (v7)
  {
    hasBeenSubmitted = v7->_hasBeenSubmitted;
    if (!v6)
      goto LABEL_5;
  }
  else
  {
    hasBeenSubmitted = 0;
    if (!v6)
      goto LABEL_5;
  }
  if (!hasBeenSubmitted)
  {
    v11 = (void *)objc_msgSend_copyWithZone_(v13, v8, 0, v9);
    objc_msgSend_setObject_forKeyedSubscript_(v7->_attributes, v12, (uint64_t)v11, (uint64_t)v6);

  }
LABEL_5:
  objc_sync_exit(v7);

}

- (BOOL)associateWithCompletedOperation:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  char isFinishingOnCallbackQueue;
  CKEventMetric *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  BOOL hasBeenSubmitted;
  char v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  BOOL v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  BOOL v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  char v41;
  NSMutableDictionary *associatedOperations;
  NSMutableDictionary *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
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
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  const char *v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  const char *v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  const char *v117;
  void *v118;
  CKEventOperationInfo *v119;
  const char *v120;
  uint64_t v121;
  void *v122;
  NSMutableDictionary *v123;
  NSMutableDictionary *v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  const char *v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  NSMutableDictionary *v134;
  NSMutableDictionary *v135;
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
  void *v146;
  CKEventOperationGroupInfo *v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  id v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  void *v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  NSString *operationGroupID;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  void *v164;
  const char *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  NSString *operationGroupName;
  NSMutableDictionary *associatedOperationGroups;
  NSMutableDictionary *v171;
  const char *v172;
  uint64_t v173;
  uint64_t v174;
  void *v175;
  const char *v176;
  uint64_t v177;
  uint64_t v178;
  void *v179;
  const char *v180;
  objc_super v182;

  v4 = a3;
  if ((objc_msgSend_isFinished(v4, v5, v6, v7) & 1) != 0)
    isFinishingOnCallbackQueue = 1;
  else
    isFinishingOnCallbackQueue = objc_msgSend_isFinishingOnCallbackQueue(v4, v8, v9, v10);
  v12 = self;
  objc_sync_enter(v12);
  if (v12)
    hasBeenSubmitted = v12->_hasBeenSubmitted;
  else
    hasBeenSubmitted = 0;
  if (!v4)
    hasBeenSubmitted = 1;
  v17 = hasBeenSubmitted | isFinishingOnCallbackQueue ^ 1;
  if ((v17 & 1) == 0)
  {
    objc_msgSend_resolvedConfiguration(v4, v13, v14, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend_allowsCellularAccess(v18, v19, v20, v21);
    if (v12)
    {
      if (v12->_inferredAllowsCellular)
        v23 = v22;
      else
        v23 = 0;
      v12->_inferredAllowsCellular = v23;
    }

    objc_msgSend_resolvedConfiguration(v4, v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend_allowsExpensiveNetworkAccess(v27, v28, v29, v30);
    if (v12)
    {
      if (v12->_inferredAllowsExpensive)
        v32 = v31;
      else
        v32 = 0;
      v12->_inferredAllowsExpensive = v32;
    }

    objc_msgSend_resolvedConfiguration(v4, v33, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend_preferAnonymousRequests(v36, v37, v38, v39);
    if (v12)
    {
      if (v12->_inferredPreferAnonymousRequests)
        v41 = 1;
      else
        v41 = v40;
      v12->_inferredPreferAnonymousRequests = v41;

      associatedOperations = v12->_associatedOperations;
    }
    else
    {

      associatedOperations = 0;
    }
    v43 = associatedOperations;
    v47 = objc_msgSend_count(v43, v44, v45, v46);

    if (!v47)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v51 = v4;
        v55 = objc_msgSend_databaseScope(v51, v52, v53, v54);
        if (v12)
          v12->_inferredDatabaseScope = v55;

      }
      objc_msgSend_resolvedConfiguration(v4, v48, v49, v50);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_container(v56, v57, v58, v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_options(v60, v61, v62, v63);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_testDeviceReferenceProtocol(v64, v65, v66, v67);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_deviceID(v68, v69, v70, v71);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
        objc_setProperty_nonatomic_copy(v12, v72, v73, 64);

      objc_msgSend_resolvedConfiguration(v4, v74, v75, v76);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_sourceApplicationBundleIdentifier(v77, v78, v79, v80);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
        objc_setProperty_nonatomic_copy(v12, v81, v82, 72);

      objc_msgSend_resolvedConfiguration(v4, v83, v84, v85);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_applicationBundleIdentifierOverrideForContainerAccess(v86, v87, v88, v89);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
        objc_setProperty_nonatomic_copy(v12, v90, v91, 80);

      objc_msgSend_resolvedConfiguration(v4, v92, v93, v94);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_applicationBundleIdentifierOverrideForNetworkAttribution(v95, v96, v97, v98);
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
        objc_setProperty_nonatomic_copy(v12, v99, v100, 88);

      objc_msgSend_resolvedConfiguration(v4, v101, v102, v103);
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__sourceApplicationSecondaryIdentifier(v104, v105, v106, v107);
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
        objc_setProperty_nonatomic_copy(v12, v108, v109, 104);

      objc_msgSend_resolvedConfiguration(v4, v110, v111, v112);
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_privacyProxyFailClosedOverride(v113, v114, v115, v116);
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
        objc_setProperty_nonatomic_copy(v12, v117, v118, 96);

    }
    v119 = [CKEventOperationInfo alloc];
    v122 = (void *)objc_msgSend_initWithOperation_(v119, v120, (uint64_t)v4, v121);
    if (v12)
      v123 = v12->_associatedOperations;
    else
      v123 = 0;
    v124 = v123;
    objc_msgSend_operationID(v4, v125, v126, v127);
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v124, v129, (uint64_t)v122, (uint64_t)v128);

    objc_msgSend_group(v4, v130, v131, v132);
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    if (v133)
    {
      v134 = v12 ? v12->_associatedOperationGroups : 0;
      v135 = v134;
      objc_msgSend_group(v4, v136, v137, v138);
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_operationGroupID(v139, v140, v141, v142);
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v135, v144, (uint64_t)v143, v145);
      v146 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v146)
      {
        v147 = [CKEventOperationGroupInfo alloc];
        objc_msgSend_group(v4, v148, v149, v150);
        v151 = (id)objc_claimAutoreleasedReturnValue();
        if (v147)
        {
          v182.receiver = v147;
          v182.super_class = (Class)CKEventOperationGroupInfo;
          v147 = -[CKEventMetric init](&v182, sel_init);
          if (v147)
          {
            objc_msgSend_operationGroupID(v151, v152, v153, v154);
            v155 = (void *)objc_claimAutoreleasedReturnValue();
            v159 = objc_msgSend_copy(v155, v156, v157, v158);
            operationGroupID = v147->_operationGroupID;
            v147->_operationGroupID = (NSString *)v159;

            objc_msgSend_name(v151, v161, v162, v163);
            v164 = (void *)objc_claimAutoreleasedReturnValue();
            v168 = objc_msgSend_copy(v164, v165, v166, v167);
            operationGroupName = v147->_operationGroupName;
            v147->_operationGroupName = (NSString *)v168;

          }
        }

        if (v12)
          associatedOperationGroups = v12->_associatedOperationGroups;
        else
          associatedOperationGroups = 0;
        v171 = associatedOperationGroups;
        objc_msgSend_group(v4, v172, v173, v174);
        v175 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_operationGroupID(v175, v176, v177, v178);
        v179 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v171, v180, (uint64_t)v147, (uint64_t)v179);

      }
    }
  }
  objc_sync_exit(v12);

  return v17 ^ 1;
}

- (NSDate)startTime
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setStartTime:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (void)setIsCKInternalMetric:(BOOL)a3
{
  self->_isCKInternalMetric = a3;
}

- (void)setEndTime:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (BOOL)isPushTriggerFired
{
  return self->_isPushTriggerFired;
}

- (BOOL)isCKInternalMetric
{
  return self->_isCKInternalMetric;
}

- (CKEventMetric)initWithEventName:(id)a3 atTime:(id)a4
{
  id v6;
  id v7;
  CKEventMetric *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  CKEventMetric *v12;
  uint64_t v13;
  NSUUID *metricUUID;
  NSString *inferredDeviceIdentifier;
  NSString *inferredApplicationBundleIdentifierOverrideForContainerAccess;
  NSString *inferredApplicationBundleIdentifierOverrideForNetworkAttribution;
  NSString *inferredSourceApplicationSecondaryIdentifier;
  NSNumber *inferredPrivacyProxyFailClosedOverride;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSString *eventName;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSDate *startTime;
  NSDate *endTime;
  NSMutableDictionary *v31;
  NSMutableDictionary *attributes;
  NSMutableDictionary *v33;
  NSMutableDictionary *associatedOperations;
  NSMutableDictionary *v35;
  NSMutableDictionary *associatedOperationGroups;
  objc_super v38;

  v6 = a3;
  v7 = a4;
  v38.receiver = self;
  v38.super_class = (Class)CKEventMetric;
  v8 = -[CKEventMetric init](&v38, sel_init);
  v12 = v8;
  if (v8)
  {
    v8->_hasBeenSubmitted = 0;
    objc_msgSend_UUID(MEMORY[0x1E0CB3A28], v9, v10, v11);
    v13 = objc_claimAutoreleasedReturnValue();
    metricUUID = v12->_metricUUID;
    v12->_metricUUID = (NSUUID *)v13;

    *(_DWORD *)&v12->_inferredAllowsCellular = 257;
    inferredDeviceIdentifier = v12->_inferredDeviceIdentifier;
    v12->_inferredDatabaseScope = 0;
    v12->_inferredDeviceIdentifier = 0;

    inferredApplicationBundleIdentifierOverrideForContainerAccess = v12->_inferredApplicationBundleIdentifierOverrideForContainerAccess;
    v12->_inferredApplicationBundleIdentifierOverrideForContainerAccess = 0;

    inferredApplicationBundleIdentifierOverrideForNetworkAttribution = v12->_inferredApplicationBundleIdentifierOverrideForNetworkAttribution;
    v12->_inferredApplicationBundleIdentifierOverrideForNetworkAttribution = 0;

    inferredSourceApplicationSecondaryIdentifier = v12->_inferredSourceApplicationSecondaryIdentifier;
    v12->_inferredSourceApplicationSecondaryIdentifier = 0;

    inferredPrivacyProxyFailClosedOverride = v12->_inferredPrivacyProxyFailClosedOverride;
    v12->_inferredPrivacyProxyFailClosedOverride = 0;

    v23 = objc_msgSend_copy(v6, v20, v21, v22);
    eventName = v12->_eventName;
    v12->_eventName = (NSString *)v23;

    v28 = objc_msgSend_copy(v7, v25, v26, v27);
    startTime = v12->_startTime;
    v12->_startTime = (NSDate *)v28;

    endTime = v12->_endTime;
    v12->_endTime = 0;

    v31 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    attributes = v12->_attributes;
    v12->_attributes = v31;

    v33 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    associatedOperations = v12->_associatedOperations;
    v12->_associatedOperations = v33;

    v35 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    associatedOperationGroups = v12->_associatedOperationGroups;
    v12->_associatedOperationGroups = v35;

  }
  return v12;
}

- (CKEventMetric)initWithEventName:(id)a3
{
  void *v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  CKEventMetric *v11;

  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend_date(v4, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (CKEventMetric *)objc_msgSend_initWithEventName_atTime_(self, v10, (uint64_t)v5, (uint64_t)v9);

  return v11;
}

- (id)generateEventMetricInfo
{
  CKEventMetric *v2;
  NSObject *v3;
  void *v4;
  NSMutableDictionary *associatedOperations;
  NSMutableDictionary *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CKEventMetricInfo *v11;
  const char *v12;
  uint64_t v13;
  __int16 v15[8];

  v2 = self;
  objc_sync_enter(v2);
  if (!v2)
  {
    associatedOperations = 0;
LABEL_9:
    v6 = associatedOperations;
    v10 = objc_msgSend_count(v6, v7, v8, v9);

    if (v10)
    {
      if (!v2)
        goto LABEL_15;
    }
    else
    {
      if (!v2)
      {
LABEL_15:
        v11 = [CKEventMetricInfo alloc];
        v4 = (void *)objc_msgSend_initWithEventMetric_(v11, v12, (uint64_t)v2, v13);
        goto LABEL_16;
      }
      *(_WORD *)&v2->_inferredAllowsCellular = 0;
      v2->_inferredPreferAnonymousRequests = 1;
    }
    v2->_hasBeenSubmitted = 1;
    goto LABEL_15;
  }
  if (!v2->_hasBeenSubmitted)
  {
    associatedOperations = v2->_associatedOperations;
    goto LABEL_9;
  }
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v3 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
  {
    v15[0] = 0;
    _os_log_impl(&dword_18A5C5000, v3, OS_LOG_TYPE_INFO, "Repeat event metric. Cancelling.", (uint8_t *)v15, 2u);
  }
  v4 = 0;
LABEL_16:
  objc_sync_exit(v2);

  return v4;
}

- (NSString)eventName
{
  return self->_eventName;
}

- (NSDate)endTime
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (NSMutableDictionary)attributes
{
  CKEventMetric *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  objc_sync_enter(v2);
  v6 = (void *)objc_msgSend_copy(v2->_attributes, v3, v4, v5);
  objc_sync_exit(v2);

  return (NSMutableDictionary *)v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedOperationGroups, 0);
  objc_storeStrong((id *)&self->_associatedOperations, 0);
  objc_storeStrong((id *)&self->_inferredSourceApplicationSecondaryIdentifier, 0);
  objc_storeStrong((id *)&self->_inferredPrivacyProxyFailClosedOverride, 0);
  objc_storeStrong((id *)&self->_inferredApplicationBundleIdentifierOverrideForNetworkAttribution, 0);
  objc_storeStrong((id *)&self->_inferredApplicationBundleIdentifierOverrideForContainerAccess, 0);
  objc_storeStrong((id *)&self->_inferredSourceApplicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_inferredDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_metricUUID, 0);
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_eventName, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
}

- (id)objectForKeyedSubscript:(id)a3
{
  id v4;
  CKEventMetric *v5;
  const char *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_msgSend_objectForKeyedSubscript_(v5->_attributes, v6, (uint64_t)v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  return v8;
}

- (void)setMetricValue:(id)a3 forKey:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  id v10;

  v6 = a4;
  v10 = (id)objc_msgSend_copyWithZone_(a3, v7, 0, v8);
  objc_msgSend_setObject_forKeyedSubscript_(self, v9, (uint64_t)v10, (uint64_t)v6);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  CKEventMetric *v4;
  uint64_t v5;
  const char *v6;
  void *v7;
  NSUUID *metricUUID;
  NSUUID *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t isCKInternalMetric;
  const char *v15;
  const char *v16;
  const char *v17;
  const char *v18;
  const char *v19;
  NSString *inferredDeviceIdentifier;
  NSString *v21;
  const char *v22;
  NSString *inferredSourceApplicationBundleIdentifier;
  NSString *v24;
  const char *v25;
  NSString *inferredApplicationBundleIdentifierOverrideForContainerAccess;
  NSString *v27;
  const char *v28;
  NSString *inferredApplicationBundleIdentifierOverrideForNetworkAttribution;
  NSString *v30;
  const char *v31;
  NSString *inferredSourceApplicationSecondaryIdentifier;
  NSString *v33;
  const char *v34;
  NSNumber *inferredPrivacyProxyFailClosedOverride;
  NSNumber *v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  NSMutableDictionary *associatedOperations;
  NSMutableDictionary *v59;
  const char *v60;
  NSMutableDictionary *associatedOperationGroups;
  NSMutableDictionary *v62;
  const char *v63;
  id v64;

  v64 = a3;
  v4 = self;
  v5 = objc_sync_enter(v4);
  v7 = (void *)MEMORY[0x18D76DE4C](v5);
  if (v4)
    objc_msgSend_encodeBool_forKey_(v64, v6, v4->_hasBeenSubmitted, (uint64_t)CFSTR("submitted"));
  else
    objc_msgSend_encodeBool_forKey_(v64, v6, 0, (uint64_t)CFSTR("submitted"));
  if (v4)
    metricUUID = v4->_metricUUID;
  else
    metricUUID = 0;
  v9 = metricUUID;
  objc_msgSend_encodeObject_forKey_(v64, v10, (uint64_t)v9, (uint64_t)CFSTR("uuid"));

  isCKInternalMetric = objc_msgSend_isCKInternalMetric(v4, v11, v12, v13);
  objc_msgSend_encodeBool_forKey_(v64, v15, isCKInternalMetric, (uint64_t)CFSTR("ckinternal"));
  if (v4)
    objc_msgSend_encodeBool_forKey_(v64, v16, v4->_inferredAllowsCellular, (uint64_t)CFSTR("allowsCellular"));
  else
    objc_msgSend_encodeBool_forKey_(v64, v16, 0, (uint64_t)CFSTR("allowsCellular"));
  if (v4)
    objc_msgSend_encodeBool_forKey_(v64, v17, v4->_inferredAllowsExpensive, (uint64_t)CFSTR("allowsExpensive"));
  else
    objc_msgSend_encodeBool_forKey_(v64, v17, 0, (uint64_t)CFSTR("allowsExpensive"));
  if (v4)
    objc_msgSend_encodeBool_forKey_(v64, v18, v4->_inferredPreferAnonymousRequests, (uint64_t)CFSTR("preferAnonymousRequests"));
  else
    objc_msgSend_encodeBool_forKey_(v64, v18, 0, (uint64_t)CFSTR("preferAnonymousRequests"));
  if (v4)
    objc_msgSend_encodeInteger_forKey_(v64, v19, v4->_inferredDatabaseScope, (uint64_t)CFSTR("databaseScope"));
  else
    objc_msgSend_encodeInteger_forKey_(v64, v19, 0, (uint64_t)CFSTR("databaseScope"));
  if (v4)
    inferredDeviceIdentifier = v4->_inferredDeviceIdentifier;
  else
    inferredDeviceIdentifier = 0;
  v21 = inferredDeviceIdentifier;
  objc_msgSend_encodeObject_forKey_(v64, v22, (uint64_t)v21, (uint64_t)CFSTR("deviceIdentifier"));

  if (v4)
    inferredSourceApplicationBundleIdentifier = v4->_inferredSourceApplicationBundleIdentifier;
  else
    inferredSourceApplicationBundleIdentifier = 0;
  v24 = inferredSourceApplicationBundleIdentifier;
  objc_msgSend_encodeObject_forKey_(v64, v25, (uint64_t)v24, (uint64_t)CFSTR("sourceApplicationBundleIdentifier"));

  if (v4)
    inferredApplicationBundleIdentifierOverrideForContainerAccess = v4->_inferredApplicationBundleIdentifierOverrideForContainerAccess;
  else
    inferredApplicationBundleIdentifierOverrideForContainerAccess = 0;
  v27 = inferredApplicationBundleIdentifierOverrideForContainerAccess;
  objc_msgSend_encodeObject_forKey_(v64, v28, (uint64_t)v27, (uint64_t)CFSTR("applicationBundleIdentifierOverrideForContainerAccess"));

  if (v4)
    inferredApplicationBundleIdentifierOverrideForNetworkAttribution = v4->_inferredApplicationBundleIdentifierOverrideForNetworkAttribution;
  else
    inferredApplicationBundleIdentifierOverrideForNetworkAttribution = 0;
  v30 = inferredApplicationBundleIdentifierOverrideForNetworkAttribution;
  objc_msgSend_encodeObject_forKey_(v64, v31, (uint64_t)v30, (uint64_t)CFSTR("applicationBundleIdentifierOverrideForNetworkAttribution"));

  if (v4)
    inferredSourceApplicationSecondaryIdentifier = v4->_inferredSourceApplicationSecondaryIdentifier;
  else
    inferredSourceApplicationSecondaryIdentifier = 0;
  v33 = inferredSourceApplicationSecondaryIdentifier;
  objc_msgSend_encodeObject_forKey_(v64, v34, (uint64_t)v33, (uint64_t)CFSTR("sourceApplicationSecondaryIdentifier"));

  if (v4)
    inferredPrivacyProxyFailClosedOverride = v4->_inferredPrivacyProxyFailClosedOverride;
  else
    inferredPrivacyProxyFailClosedOverride = 0;
  v36 = inferredPrivacyProxyFailClosedOverride;
  objc_msgSend_encodeObject_forKey_(v64, v37, (uint64_t)v36, (uint64_t)CFSTR("privacyProxyFailClosedOverride"));

  objc_msgSend_eventName(v4, v38, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v64, v42, (uint64_t)v41, (uint64_t)CFSTR("eventName"));

  objc_msgSend_startTime(v4, v43, v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v64, v47, (uint64_t)v46, (uint64_t)CFSTR("startTime"));

  objc_msgSend_endTime(v4, v48, v49, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v64, v52, (uint64_t)v51, (uint64_t)CFSTR("endTime"));

  objc_msgSend_attributes(v4, v53, v54, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v64, v57, (uint64_t)v56, (uint64_t)CFSTR("attributes"));

  if (v4)
    associatedOperations = v4->_associatedOperations;
  else
    associatedOperations = 0;
  v59 = associatedOperations;
  objc_msgSend_encodeObject_forKey_(v64, v60, (uint64_t)v59, (uint64_t)CFSTR("operations"));

  if (v4)
    associatedOperationGroups = v4->_associatedOperationGroups;
  else
    associatedOperationGroups = 0;
  v62 = associatedOperationGroups;
  objc_msgSend_encodeObject_forKey_(v64, v63, (uint64_t)v62, (uint64_t)CFSTR("operationGroups"));

  objc_autoreleasePoolPop(v7);
  objc_sync_exit(v4);

}

- (CKEventMetric)initWithCoder:(id)a3
{
  id v4;
  CKEventMetric *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  NSUUID *metricUUID;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  NSString *inferredDeviceIdentifier;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  NSString *inferredSourceApplicationBundleIdentifier;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  NSString *inferredApplicationBundleIdentifierOverrideForContainerAccess;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  NSString *inferredApplicationBundleIdentifierOverrideForNetworkAttribution;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  NSString *inferredSourceApplicationSecondaryIdentifier;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  NSNumber *inferredPrivacyProxyFailClosedOverride;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  NSString *eventName;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  NSDate *startTime;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  NSDate *endTime;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  NSMutableDictionary *attributes;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  NSMutableDictionary *associatedOperations;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  NSMutableDictionary *associatedOperationGroups;
  void *context;
  objc_super v91;

  v4 = a3;
  v91.receiver = self;
  v91.super_class = (Class)CKEventMetric;
  v5 = -[CKEventMetric init](&v91, sel_init);
  if (v5)
  {
    context = (void *)MEMORY[0x18D76DE4C]();
    v5->_hasBeenSubmitted = objc_msgSend_decodeBoolForKey_(v4, v6, (uint64_t)CFSTR("submitted"), v7);
    v8 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v9, v8, (uint64_t)CFSTR("uuid"));
    v10 = objc_claimAutoreleasedReturnValue();
    metricUUID = v5->_metricUUID;
    v5->_metricUUID = (NSUUID *)v10;

    v5->_isCKInternalMetric = objc_msgSend_decodeBoolForKey_(v4, v12, (uint64_t)CFSTR("ckinternal"), v13);
    v5->_inferredAllowsCellular = objc_msgSend_decodeBoolForKey_(v4, v14, (uint64_t)CFSTR("allowsCellular"), v15);
    v5->_inferredAllowsExpensive = objc_msgSend_decodeBoolForKey_(v4, v16, (uint64_t)CFSTR("allowsExpensive"), v17);
    v5->_inferredPreferAnonymousRequests = objc_msgSend_decodeBoolForKey_(v4, v18, (uint64_t)CFSTR("preferAnonymousRequests"), v19);
    v5->_inferredDatabaseScope = objc_msgSend_decodeIntegerForKey_(v4, v20, (uint64_t)CFSTR("databaseScope"), v21);
    v22 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v23, v22, (uint64_t)CFSTR("deviceIdentifier"));
    v24 = objc_claimAutoreleasedReturnValue();
    inferredDeviceIdentifier = v5->_inferredDeviceIdentifier;
    v5->_inferredDeviceIdentifier = (NSString *)v24;

    v26 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v27, v26, (uint64_t)CFSTR("sourceApplicationBundleIdentifier"));
    v28 = objc_claimAutoreleasedReturnValue();
    inferredSourceApplicationBundleIdentifier = v5->_inferredSourceApplicationBundleIdentifier;
    v5->_inferredSourceApplicationBundleIdentifier = (NSString *)v28;

    v30 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v31, v30, (uint64_t)CFSTR("applicationBundleIdentifierOverrideForContainerAccess"));
    v32 = objc_claimAutoreleasedReturnValue();
    inferredApplicationBundleIdentifierOverrideForContainerAccess = v5->_inferredApplicationBundleIdentifierOverrideForContainerAccess;
    v5->_inferredApplicationBundleIdentifierOverrideForContainerAccess = (NSString *)v32;

    v34 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v35, v34, (uint64_t)CFSTR("applicationBundleIdentifierOverrideForNetworkAttribution"));
    v36 = objc_claimAutoreleasedReturnValue();
    inferredApplicationBundleIdentifierOverrideForNetworkAttribution = v5->_inferredApplicationBundleIdentifierOverrideForNetworkAttribution;
    v5->_inferredApplicationBundleIdentifierOverrideForNetworkAttribution = (NSString *)v36;

    v38 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v39, v38, (uint64_t)CFSTR("sourceApplicationSecondaryIdentifier"));
    v40 = objc_claimAutoreleasedReturnValue();
    inferredSourceApplicationSecondaryIdentifier = v5->_inferredSourceApplicationSecondaryIdentifier;
    v5->_inferredSourceApplicationSecondaryIdentifier = (NSString *)v40;

    v42 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v43, v42, (uint64_t)CFSTR("privacyProxyFailClosedOverride"));
    v44 = objc_claimAutoreleasedReturnValue();
    inferredPrivacyProxyFailClosedOverride = v5->_inferredPrivacyProxyFailClosedOverride;
    v5->_inferredPrivacyProxyFailClosedOverride = (NSNumber *)v44;

    v46 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v47, v46, (uint64_t)CFSTR("eventName"));
    v48 = objc_claimAutoreleasedReturnValue();
    eventName = v5->_eventName;
    v5->_eventName = (NSString *)v48;

    v50 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v51, v50, (uint64_t)CFSTR("startTime"));
    v52 = objc_claimAutoreleasedReturnValue();
    startTime = v5->_startTime;
    v5->_startTime = (NSDate *)v52;

    v54 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v55, v54, (uint64_t)CFSTR("endTime"));
    v56 = objc_claimAutoreleasedReturnValue();
    endTime = v5->_endTime;
    v5->_endTime = (NSDate *)v56;

    v58 = (void *)MEMORY[0x1E0C99E60];
    v59 = objc_opt_class();
    v60 = objc_opt_class();
    v61 = objc_opt_class();
    v62 = objc_opt_class();
    objc_msgSend_setWithObjects_(v58, v63, v59, v64, v60, v61, v62, 0);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v66, (uint64_t)v65, (uint64_t)CFSTR("attributes"));
    v67 = objc_claimAutoreleasedReturnValue();
    attributes = v5->_attributes;
    v5->_attributes = (NSMutableDictionary *)v67;

    v69 = (void *)MEMORY[0x1E0C99E60];
    v70 = objc_opt_class();
    v71 = objc_opt_class();
    v72 = objc_opt_class();
    objc_msgSend_setWithObjects_(v69, v73, v70, v74, v71, v72, 0);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v76, (uint64_t)v75, (uint64_t)CFSTR("operations"));
    v77 = objc_claimAutoreleasedReturnValue();
    associatedOperations = v5->_associatedOperations;
    v5->_associatedOperations = (NSMutableDictionary *)v77;

    v79 = (void *)MEMORY[0x1E0C99E60];
    v80 = objc_opt_class();
    v81 = objc_opt_class();
    v82 = objc_opt_class();
    objc_msgSend_setWithObjects_(v79, v83, v80, v84, v81, v82, 0);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v86, (uint64_t)v85, (uint64_t)CFSTR("operationGroups"));
    v87 = objc_claimAutoreleasedReturnValue();
    associatedOperationGroups = v5->_associatedOperationGroups;
    v5->_associatedOperationGroups = (NSMutableDictionary *)v87;

    objc_autoreleasePoolPop(context);
  }

  return v5;
}

- (void)setIsPushTriggerFired:(BOOL)a3
{
  self->_isPushTriggerFired = a3;
}

@end

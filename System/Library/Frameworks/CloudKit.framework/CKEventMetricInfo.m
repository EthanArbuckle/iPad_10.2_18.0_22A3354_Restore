@implementation CKEventMetricInfo

- (CKEventMetricInfo)initWithCoder:(id)a3
{
  id v4;
  CKEventMetricInfo *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  NSUUID *metricUUID;
  const char *v10;
  uint64_t v11;
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
  NSString *deviceIdentifier;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  NSString *sourceApplicationBundleIdentifier;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  NSString *applicationBundleIdentifierOverrideForContainerAccess;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  NSString *applicationBundleIdentifierOverrideForNetworkAttribution;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  NSString *sourceApplicationSecondaryIdentifier;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  NSNumber *privacyProxyFailClosedOverride;
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
  NSDictionary *attributes;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  NSDictionary *associatedOperations;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  NSDictionary *associatedOperationGroups;
  void *context;
  objc_super v91;

  v4 = a3;
  v91.receiver = self;
  v91.super_class = (Class)CKEventMetricInfo;
  v5 = -[CKEventMetricInfo init](&v91, sel_init);
  if (v5)
  {
    context = (void *)MEMORY[0x18D76DE4C]();
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, (uint64_t)CFSTR("uuid"));
    v8 = objc_claimAutoreleasedReturnValue();
    metricUUID = v5->_metricUUID;
    v5->_metricUUID = (NSUUID *)v8;

    v5->_isCKInternalMetric = objc_msgSend_decodeBoolForKey_(v4, v10, (uint64_t)CFSTR("ckinternal"), v11);
    v5->_isPushTriggerFired = objc_msgSend_decodeBoolForKey_(v4, v12, (uint64_t)CFSTR("pushFired"), v13);
    v5->_allowsCellularAccess = objc_msgSend_decodeBoolForKey_(v4, v14, (uint64_t)CFSTR("allowsCellular"), v15);
    v5->_allowsExpensiveNetworkAccess = objc_msgSend_decodeBoolForKey_(v4, v16, (uint64_t)CFSTR("allowsExpensive"), v17);
    v5->_preferAnonymousRequests = objc_msgSend_decodeBoolForKey_(v4, v18, (uint64_t)CFSTR("preferAnonymousRequests"), v19);
    v5->_databaseScope = objc_msgSend_decodeIntegerForKey_(v4, v20, (uint64_t)CFSTR("databaseScope"), v21);
    v22 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v23, v22, (uint64_t)CFSTR("deviceIdentifier"));
    v24 = objc_claimAutoreleasedReturnValue();
    deviceIdentifier = v5->_deviceIdentifier;
    v5->_deviceIdentifier = (NSString *)v24;

    v26 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v27, v26, (uint64_t)CFSTR("sourceApplicationBundleIdentifier"));
    v28 = objc_claimAutoreleasedReturnValue();
    sourceApplicationBundleIdentifier = v5->_sourceApplicationBundleIdentifier;
    v5->_sourceApplicationBundleIdentifier = (NSString *)v28;

    v30 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v31, v30, (uint64_t)CFSTR("applicationBundleIdentifierOverrideForContainerAccess"));
    v32 = objc_claimAutoreleasedReturnValue();
    applicationBundleIdentifierOverrideForContainerAccess = v5->_applicationBundleIdentifierOverrideForContainerAccess;
    v5->_applicationBundleIdentifierOverrideForContainerAccess = (NSString *)v32;

    v34 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v35, v34, (uint64_t)CFSTR("applicationBundleIdentifierOverrideForNetworkAttribution"));
    v36 = objc_claimAutoreleasedReturnValue();
    applicationBundleIdentifierOverrideForNetworkAttribution = v5->_applicationBundleIdentifierOverrideForNetworkAttribution;
    v5->_applicationBundleIdentifierOverrideForNetworkAttribution = (NSString *)v36;

    v38 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v39, v38, (uint64_t)CFSTR("sourceApplicationSecondaryIdentifier"));
    v40 = objc_claimAutoreleasedReturnValue();
    sourceApplicationSecondaryIdentifier = v5->_sourceApplicationSecondaryIdentifier;
    v5->_sourceApplicationSecondaryIdentifier = (NSString *)v40;

    v42 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v43, v42, (uint64_t)CFSTR("privacyProxyFailClosedOverride"));
    v44 = objc_claimAutoreleasedReturnValue();
    privacyProxyFailClosedOverride = v5->_privacyProxyFailClosedOverride;
    v5->_privacyProxyFailClosedOverride = (NSNumber *)v44;

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
    v5->_attributes = (NSDictionary *)v67;

    v69 = (void *)MEMORY[0x1E0C99E60];
    v70 = objc_opt_class();
    v71 = objc_opt_class();
    v72 = objc_opt_class();
    objc_msgSend_setWithObjects_(v69, v73, v70, v74, v71, v72, 0);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v76, (uint64_t)v75, (uint64_t)CFSTR("operations"));
    v77 = objc_claimAutoreleasedReturnValue();
    associatedOperations = v5->_associatedOperations;
    v5->_associatedOperations = (NSDictionary *)v77;

    v79 = (void *)MEMORY[0x1E0C99E60];
    v80 = objc_opt_class();
    v81 = objc_opt_class();
    v82 = objc_opt_class();
    objc_msgSend_setWithObjects_(v79, v83, v80, v84, v81, v82, 0);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v86, (uint64_t)v85, (uint64_t)CFSTR("operationGroups"));
    v87 = objc_claimAutoreleasedReturnValue();
    associatedOperationGroups = v5->_associatedOperationGroups;
    v5->_associatedOperationGroups = (NSDictionary *)v87;

    objc_autoreleasePoolPop(context);
  }

  return v5;
}

- (NSUUID)metricUUID
{
  return self->_metricUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedOperationGroups, 0);
  objc_storeStrong((id *)&self->_associatedOperations, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_eventName, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifierOverrideForNetworkAttribution, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifierOverrideForContainerAccess, 0);
  objc_storeStrong((id *)&self->_privacyProxyFailClosedOverride, 0);
  objc_storeStrong((id *)&self->_sourceApplicationSecondaryIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceApplicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_metricUUID, 0);
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (NSString)sourceApplicationSecondaryIdentifier
{
  return self->_sourceApplicationSecondaryIdentifier;
}

- (NSString)sourceApplicationBundleIdentifier
{
  return self->_sourceApplicationBundleIdentifier;
}

- (BOOL)preferAnonymousRequests
{
  return self->_preferAnonymousRequests;
}

- (BOOL)isPushTriggerFired
{
  return self->_isPushTriggerFired;
}

- (BOOL)isCKInternalMetric
{
  return self->_isCKInternalMetric;
}

- (CKEventMetricInfo)initWithEventMetric:(id)a3
{
  id v4;
  CKEventMetricInfo *v5;
  CKEventMetricInfo *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  char isPushTriggerFired;
  char v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  int64_t v23;
  uint64_t v24;
  NSString *eventName;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSDate *startTime;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSDate *endTime;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSDictionary *attributes;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  NSDictionary *associatedOperations;
  void *v54;
  id v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  NSDictionary *associatedOperationGroups;
  NSString *sourceApplicationBundleIdentifier;
  NSString *applicationBundleIdentifierOverrideForNetworkAttribution;
  NSNumber *privacyProxyFailClosedOverride;
  uint64_t v65;
  NSDictionary *v66;
  objc_super v67;

  v4 = a3;
  v67.receiver = self;
  v67.super_class = (Class)CKEventMetricInfo;
  v5 = -[CKEventMetricInfo init](&v67, sel_init);
  v6 = v5;
  if (v5)
  {
    if (v4)
      v7 = (void *)*((_QWORD *)v4 + 6);
    else
      v7 = 0;
    objc_storeStrong((id *)&v5->_metricUUID, v7);
    v6->_isCKInternalMetric = objc_msgSend_isCKInternalMetric(v4, v8, v9, v10);
    isPushTriggerFired = objc_msgSend_isPushTriggerFired(v4, v11, v12, v13);
    v6->_isPushTriggerFired = isPushTriggerFired;
    if (v4)
    {
      if (*((_BYTE *)v4 + 10))
        v15 = 1;
      else
        v15 = isPushTriggerFired;
      v6->_allowsCellularAccess = v15;
      if (*((_BYTE *)v4 + 11))
        v16 = 1;
      else
        v16 = isPushTriggerFired;
      v6->_allowsExpensiveNetworkAccess = v16;
      v6->_preferAnonymousRequests = *((_BYTE *)v4 + 12);
      v17 = (void *)*((_QWORD *)v4 + 8);
    }
    else
    {
      v17 = 0;
      v6->_allowsCellularAccess = isPushTriggerFired;
      v6->_allowsExpensiveNetworkAccess = isPushTriggerFired;
      v6->_preferAnonymousRequests = 0;
    }
    objc_storeStrong((id *)&v6->_deviceIdentifier, v17);
    if (v4)
    {
      objc_storeStrong((id *)&v6->_sourceApplicationBundleIdentifier, *((id *)v4 + 9));
      v18 = (void *)*((_QWORD *)v4 + 10);
    }
    else
    {
      sourceApplicationBundleIdentifier = v6->_sourceApplicationBundleIdentifier;
      v6->_sourceApplicationBundleIdentifier = 0;

      v18 = 0;
    }
    objc_storeStrong((id *)&v6->_applicationBundleIdentifierOverrideForContainerAccess, v18);
    if (v4)
    {
      objc_storeStrong((id *)&v6->_applicationBundleIdentifierOverrideForNetworkAttribution, *((id *)v4 + 11));
      v19 = (void *)*((_QWORD *)v4 + 13);
    }
    else
    {
      applicationBundleIdentifierOverrideForNetworkAttribution = v6->_applicationBundleIdentifierOverrideForNetworkAttribution;
      v6->_applicationBundleIdentifierOverrideForNetworkAttribution = 0;

      v19 = 0;
    }
    objc_storeStrong((id *)&v6->_sourceApplicationSecondaryIdentifier, v19);
    if (v4)
    {
      objc_storeStrong((id *)&v6->_privacyProxyFailClosedOverride, *((id *)v4 + 12));
      v23 = *((_QWORD *)v4 + 7);
    }
    else
    {
      privacyProxyFailClosedOverride = v6->_privacyProxyFailClosedOverride;
      v6->_privacyProxyFailClosedOverride = 0;

      v23 = 0;
    }
    v6->_databaseScope = v23;
    objc_msgSend_eventName(v4, v20, v21, v22);
    v24 = objc_claimAutoreleasedReturnValue();
    eventName = v6->_eventName;
    v6->_eventName = (NSString *)v24;

    objc_msgSend_startTime(v4, v26, v27, v28);
    v29 = objc_claimAutoreleasedReturnValue();
    startTime = v6->_startTime;
    v6->_startTime = (NSDate *)v29;

    objc_msgSend_endTime(v4, v31, v32, v33);
    v34 = objc_claimAutoreleasedReturnValue();
    endTime = v6->_endTime;
    v6->_endTime = (NSDate *)v34;

    objc_msgSend_attributes(v4, v36, v37, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend_copy(v39, v40, v41, v42);
    attributes = v6->_attributes;
    v6->_attributes = (NSDictionary *)v43;

    if (v4)
    {
      v48 = *((id *)v4 + 14);
      v52 = objc_msgSend_copy(v48, v49, v50, v51);
      associatedOperations = v6->_associatedOperations;
      v6->_associatedOperations = (NSDictionary *)v52;

      v54 = (void *)*((_QWORD *)v4 + 15);
    }
    else
    {
      v65 = objc_msgSend_copy(0, v45, v46, v47);
      v66 = v6->_associatedOperations;
      v6->_associatedOperations = (NSDictionary *)v65;

      v54 = 0;
    }
    v55 = v54;
    v59 = objc_msgSend_copy(v55, v56, v57, v58);
    associatedOperationGroups = v6->_associatedOperationGroups;
    v6->_associatedOperationGroups = (NSDictionary *)v59;

  }
  return v6;
}

- (NSString)eventName
{
  return self->_eventName;
}

- (NSDate)endTime
{
  return self->_endTime;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t isCKInternalMetric;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t isPushTriggerFired;
  const char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  id v100;

  v100 = a3;
  v4 = (void *)MEMORY[0x18D76DE4C]();
  objc_msgSend_metricUUID(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v100, v9, (uint64_t)v8, (uint64_t)CFSTR("uuid"));

  isCKInternalMetric = objc_msgSend_isCKInternalMetric(self, v10, v11, v12);
  objc_msgSend_encodeBool_forKey_(v100, v14, isCKInternalMetric, (uint64_t)CFSTR("ckinternal"));
  isPushTriggerFired = objc_msgSend_isPushTriggerFired(self, v15, v16, v17);
  objc_msgSend_encodeBool_forKey_(v100, v19, isPushTriggerFired, (uint64_t)CFSTR("pushFired"));
  v23 = objc_msgSend_allowsCellularAccess(self, v20, v21, v22);
  objc_msgSend_encodeBool_forKey_(v100, v24, v23, (uint64_t)CFSTR("allowsCellular"));
  v28 = objc_msgSend_allowsExpensiveNetworkAccess(self, v25, v26, v27);
  objc_msgSend_encodeBool_forKey_(v100, v29, v28, (uint64_t)CFSTR("allowsExpensive"));
  v33 = objc_msgSend_preferAnonymousRequests(self, v30, v31, v32);
  objc_msgSend_encodeBool_forKey_(v100, v34, v33, (uint64_t)CFSTR("preferAnonymousRequests"));
  v38 = objc_msgSend_databaseScope(self, v35, v36, v37);
  objc_msgSend_encodeInteger_forKey_(v100, v39, v38, (uint64_t)CFSTR("databaseScope"));
  objc_msgSend_deviceIdentifier(self, v40, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v100, v44, (uint64_t)v43, (uint64_t)CFSTR("deviceIdentifier"));

  objc_msgSend_sourceApplicationBundleIdentifier(self, v45, v46, v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v100, v49, (uint64_t)v48, (uint64_t)CFSTR("sourceApplicationBundleIdentifier"));

  objc_msgSend_applicationBundleIdentifierOverrideForContainerAccess(self, v50, v51, v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v100, v54, (uint64_t)v53, (uint64_t)CFSTR("applicationBundleIdentifierOverrideForContainerAccess"));

  objc_msgSend_applicationBundleIdentifierOverrideForNetworkAttribution(self, v55, v56, v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v100, v59, (uint64_t)v58, (uint64_t)CFSTR("applicationBundleIdentifierOverrideForNetworkAttribution"));

  objc_msgSend_sourceApplicationSecondaryIdentifier(self, v60, v61, v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v100, v64, (uint64_t)v63, (uint64_t)CFSTR("sourceApplicationSecondaryIdentifier"));

  objc_msgSend_privacyProxyFailClosedOverride(self, v65, v66, v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v100, v69, (uint64_t)v68, (uint64_t)CFSTR("privacyProxyFailClosedOverride"));

  objc_msgSend_eventName(self, v70, v71, v72);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v100, v74, (uint64_t)v73, (uint64_t)CFSTR("eventName"));

  objc_msgSend_startTime(self, v75, v76, v77);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v100, v79, (uint64_t)v78, (uint64_t)CFSTR("startTime"));

  objc_msgSend_endTime(self, v80, v81, v82);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v100, v84, (uint64_t)v83, (uint64_t)CFSTR("endTime"));

  objc_msgSend_attributes(self, v85, v86, v87);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v100, v89, (uint64_t)v88, (uint64_t)CFSTR("attributes"));

  objc_msgSend_associatedOperations(self, v90, v91, v92);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v100, v94, (uint64_t)v93, (uint64_t)CFSTR("operations"));

  objc_msgSend_associatedOperationGroups(self, v95, v96, v97);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v100, v99, (uint64_t)v98, (uint64_t)CFSTR("operationGroups"));

  objc_autoreleasePoolPop(v4);
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (int64_t)databaseScope
{
  return self->_databaseScope;
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (NSDictionary)associatedOperations
{
  return self->_associatedOperations;
}

- (NSDictionary)associatedOperationGroups
{
  return self->_associatedOperationGroups;
}

- (NSString)applicationBundleIdentifierOverrideForNetworkAttribution
{
  return self->_applicationBundleIdentifierOverrideForNetworkAttribution;
}

- (NSString)applicationBundleIdentifierOverrideForContainerAccess
{
  return self->_applicationBundleIdentifierOverrideForContainerAccess;
}

- (BOOL)allowsExpensiveNetworkAccess
{
  return self->_allowsExpensiveNetworkAccess;
}

- (BOOL)allowsCellularAccess
{
  return self->_allowsCellularAccess;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSNumber)privacyProxyFailClosedOverride
{
  return self->_privacyProxyFailClosedOverride;
}

@end

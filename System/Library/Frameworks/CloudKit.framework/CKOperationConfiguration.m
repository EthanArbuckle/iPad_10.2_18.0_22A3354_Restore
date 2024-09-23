@implementation CKOperationConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemTask, 0);
  objc_storeStrong((id *)&self->_mTestResultOverlayBoxes, 0);
  objc_storeStrong((id *)&self->_mTestErrorInducerBoxes, 0);
  objc_storeStrong((id *)&self->_unitTestOverrides, 0);
  objc_storeStrong((id *)&self->_assetDownloadStagingManager, 0);
  objc_storeStrong((id *)&self->_cacheDeleteAvailableSpaceClass, 0);
  objc_storeStrong((id *)&self->_additionalRequestHTTPHeaders, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifierOverrideForNetworkAttribution, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifierOverrideForContainerAccess, 0);
  objc_storeStrong((id *)&self->_privacyProxyFailClosedOverride, 0);
  objc_storeStrong((id *)&self->_sourceApplicationSecondaryIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceApplicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_schedulerActivity, 0);
  objc_storeStrong((id *)&self->_ckXPCActivity, 0);
  objc_storeStrong((id *)&self->_container, 0);
}

- (CKOperationConfiguration)initWithCoder:(id)a3
{
  id v4;
  CKOperationConfiguration *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  CKOperationConfiguration *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  int v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  int v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  const char *v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  void *v115;
  const char *v116;
  uint64_t v117;
  int v118;
  void *v119;
  const char *v120;
  void *v121;
  const char *v122;
  uint64_t v123;
  void *v124;
  void *v125;
  const char *v126;
  uint64_t v127;
  NSDictionary *unitTestOverrides;
  objc_super v130;
  _QWORD v131[2];
  _QWORD v132[3];

  v132[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v130.receiver = self;
  v130.super_class = (Class)CKOperationConfiguration;
  v5 = -[CKOperationConfiguration init](&v130, sel_init);
  v9 = v5;
  if (v5)
  {
    v10 = objc_msgSend__commonInit(v5, v6, v7, v8);
    v11 = (void *)MEMORY[0x18D76DE4C](v10);
    if (objc_msgSend_containsValueForKey_(v4, v12, (uint64_t)CFSTR("QualityOfService"), v13))
    {
      v16 = objc_msgSend_decodeInt64ForKey_(v4, v14, (uint64_t)CFSTR("QualityOfService"), v15);
      objc_msgSend_setQualityOfService_(v9, v17, v16, v18);
    }
    if (objc_msgSend_containsValueForKey_(v4, v14, (uint64_t)CFSTR("AllowsCellularAccess"), v15))
    {
      v21 = objc_msgSend_decodeBoolForKey_(v4, v19, (uint64_t)CFSTR("AllowsCellularAccess"), v20);
      objc_msgSend_setAllowsCellularAccess_(v9, v22, v21, v23);
    }
    if (objc_msgSend_containsValueForKey_(v4, v19, (uint64_t)CFSTR("AllowsExpensiveAccess"), v20))
    {
      v26 = objc_msgSend_decodeBoolForKey_(v4, v24, (uint64_t)CFSTR("AllowsExpensiveAccess"), v25);
      objc_msgSend_setAllowsExpensiveNetworkAccess_(v9, v27, v26, v28);
    }
    if (objc_msgSend_containsValueForKey_(v4, v24, (uint64_t)CFSTR("IsLongLived"), v25))
    {
      v31 = objc_msgSend_decodeBoolForKey_(v4, v29, (uint64_t)CFSTR("IsLongLived"), v30);
      objc_msgSend_setLongLived_(v9, v32, v31, v33);
    }
    if (objc_msgSend_containsValueForKey_(v4, v29, (uint64_t)CFSTR("TimeoutIntervalForRequest"), v30))
    {
      objc_msgSend_decodeDoubleForKey_(v4, v34, (uint64_t)CFSTR("TimeoutIntervalForRequest"), v35);
      objc_msgSend_setTimeoutIntervalForRequest_(v9, v36, v37, v38);
    }
    if (objc_msgSend_containsValueForKey_(v4, v34, (uint64_t)CFSTR("TimeoutIntervalForResource"), v35))
    {
      objc_msgSend_decodeDoubleForKey_(v4, v39, (uint64_t)CFSTR("TimeoutIntervalForResource"), v40);
      objc_msgSend_setTimeoutIntervalForResource_(v9, v41, v42, v43);
    }
    if (objc_msgSend_containsValueForKey_(v4, v39, (uint64_t)CFSTR("AutomaticallyRetryNetworkFailures"), v40))
    {
      v46 = objc_msgSend_decodeBoolForKey_(v4, v44, (uint64_t)CFSTR("AutomaticallyRetryNetworkFailures"), v45);
      objc_msgSend_setAutomaticallyRetryNetworkFailures_(v9, v47, v46, v48);
    }
    if (objc_msgSend_containsValueForKey_(v4, v44, (uint64_t)CFSTR("DiscretionaryNetworkBehavior"), v45))
    {
      v51 = objc_msgSend_decodeInt64ForKey_(v4, v49, (uint64_t)CFSTR("DiscretionaryNetworkBehavior"), v50);
      objc_msgSend_setDiscretionaryNetworkBehavior_(v9, v52, v51, v53);
    }
    if (objc_msgSend_containsValueForKey_(v4, v49, (uint64_t)CFSTR("PrefersAnonymousRequests"), v50))
    {
      v56 = objc_msgSend_decodeBoolForKey_(v4, v54, (uint64_t)CFSTR("PrefersAnonymousRequests"), v55);
      objc_msgSend_setPreferAnonymousRequests_(v9, v57, v56, v58);
    }
    if (objc_msgSend_containsValueForKey_(v4, v54, (uint64_t)CFSTR("SourceApplicationSecondaryIdentifier"), v55))
    {
      v61 = objc_opt_class();
      objc_msgSend_decodeObjectOfClass_forKey_(v4, v62, v61, (uint64_t)CFSTR("SourceApplicationSecondaryIdentifier"));
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_set_sourceApplicationSecondaryIdentifier_(v9, v64, (uint64_t)v63, v65);

    }
    if (objc_msgSend_containsValueForKey_(v4, v59, (uint64_t)CFSTR("PrivacyProxyFailClosedOverride"), v60))
    {
      v66 = objc_opt_class();
      objc_msgSend_decodeObjectOfClass_forKey_(v4, v67, v66, (uint64_t)CFSTR("PrivacyProxyFailClosedOverride"));
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setPrivacyProxyFailClosedOverride_(v9, v69, (uint64_t)v68, v70);

    }
    NSStringFromSelector(sel_applicationBundleIdentifierOverrideForContainerAccess);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = objc_msgSend_containsValueForKey_(v4, v72, (uint64_t)v71, v73);

    if (v74)
    {
      v75 = objc_opt_class();
      NSStringFromSelector(sel_applicationBundleIdentifierOverrideForContainerAccess);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_decodeObjectOfClass_forKey_(v4, v77, v75, (uint64_t)v76);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setApplicationBundleIdentifierOverrideForContainerAccess_(v9, v79, (uint64_t)v78, v80);

    }
    NSStringFromSelector(sel_applicationBundleIdentifierOverrideForNetworkAttribution);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = objc_msgSend_containsValueForKey_(v4, v82, (uint64_t)v81, v83);

    if (v84)
    {
      v87 = objc_opt_class();
      NSStringFromSelector(sel_applicationBundleIdentifierOverrideForNetworkAttribution);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_decodeObjectOfClass_forKey_(v4, v89, v87, (uint64_t)v88);
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setApplicationBundleIdentifierOverrideForNetworkAttribution_(v9, v91, (uint64_t)v90, v92);

    }
    if (objc_msgSend_containsValueForKey_(v4, v85, (uint64_t)CFSTR("AdditionalRequestHTTPHeaders"), v86))
    {
      v95 = (void *)MEMORY[0x1E0C99E60];
      v132[0] = objc_opt_class();
      v132[1] = objc_opt_class();
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v96, (uint64_t)v132, 2);
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setWithArray_(v95, v98, (uint64_t)v97, v99);
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_decodeObjectOfClasses_forKey_(v4, v101, (uint64_t)v100, (uint64_t)CFSTR("AdditionalRequestHTTPHeaders"));
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setAdditionalRequestHTTPHeaders_(v9, v103, (uint64_t)v102, v104);

    }
    if (objc_msgSend_containsValueForKey_(v4, v93, (uint64_t)CFSTR("IsCloudKitSupportOperation"), v94))
    {
      v107 = objc_msgSend_decodeBoolForKey_(v4, v105, (uint64_t)CFSTR("IsCloudKitSupportOperation"), v106);
      objc_msgSend_setIsCloudKitSupportOperation_(v9, v108, v107, v109);
    }
    if (objc_msgSend_containsValueForKey_(v4, v105, (uint64_t)CFSTR("CacheDeleteAvailableSpaceClass"), v106))
    {
      v110 = objc_opt_class();
      objc_msgSend_decodeObjectOfClass_forKey_(v4, v111, v110, (uint64_t)CFSTR("CacheDeleteAvailableSpaceClass"));
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setCacheDeleteAvailableSpaceClass_(v9, v113, (uint64_t)v112, v114);

    }
    NSStringFromSelector(sel_unitTestOverrides);
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    v118 = objc_msgSend_containsValueForKey_(v4, v116, (uint64_t)v115, v117);

    if (v118)
    {
      CKAcceptableValueClasses();
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      v131[0] = objc_opt_class();
      v131[1] = objc_opt_class();
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v120, (uint64_t)v131, 2);
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setByAddingObjectsFromArray_(v119, v122, (uint64_t)v121, v123);
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel_unitTestOverrides);
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_decodeObjectOfClasses_forKey_(v4, v126, (uint64_t)v124, (uint64_t)v125);
      v127 = objc_claimAutoreleasedReturnValue();
      unitTestOverrides = v9->_unitTestOverrides;
      v9->_unitTestOverrides = (NSDictionary *)v127;

    }
    objc_autoreleasePoolPop(v11);
  }

  return v9;
}

- (NSString)_sourceApplicationSecondaryIdentifier
{
  CKOperationConfiguration *v2;
  NSString *v3;

  v2 = self;
  objc_sync_enter(v2);
  if (v2 && v2->_hasSourceApplicationSecondaryIdentifier)
    v3 = v2->_sourceApplicationSecondaryIdentifier;
  else
    v3 = 0;
  objc_sync_exit(v2);

  return v3;
}

- (NSString)applicationBundleIdentifierOverrideForNetworkAttribution
{
  CKOperationConfiguration *v2;
  NSString *v3;

  v2 = self;
  objc_sync_enter(v2);
  if (v2 && v2->_hasApplicationBundleIdentifierOverrideForNetworkAttribution)
    v3 = v2->_applicationBundleIdentifierOverrideForNetworkAttribution;
  else
    v3 = 0;
  objc_sync_exit(v2);

  return v3;
}

- (NSString)applicationBundleIdentifierOverrideForContainerAccess
{
  CKOperationConfiguration *v2;
  NSString *v3;

  v2 = self;
  objc_sync_enter(v2);
  if (v2 && v2->_hasApplicationBundleIdentifierOverrideForContainerAccess)
    v3 = v2->_applicationBundleIdentifierOverrideForContainerAccess;
  else
    v3 = 0;
  objc_sync_exit(v2);

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  CKOperationConfiguration *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t isLongLived;
  const char *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  void *v40;
  const char *v41;
  void *v42;
  const char *v43;
  void *v44;
  void *v45;
  const char *v46;
  void *v47;
  void *v48;
  const char *v49;
  void *v50;
  const char *v51;
  uint64_t isCloudKitSupportOperation;
  const char *v53;
  void *v54;
  const char *v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  const char *v66;
  id v67;

  v67 = a3;
  v4 = self;
  v5 = objc_sync_enter(v4);
  v6 = (void *)MEMORY[0x18D76DE4C](v5);
  if (objc_msgSend_hasQualityOfService(v4, v7, v8, v9))
  {
    v13 = objc_msgSend_qualityOfService(v4, v10, v11, v12);
    objc_msgSend_encodeInt64_forKey_(v67, v14, v13, (uint64_t)CFSTR("QualityOfService"));
  }
  if (v4 && v4->_hasAllowsCellularAccess)
  {
    v15 = objc_msgSend_allowsCellularAccess(v4, v10, v11, v12);
    objc_msgSend_encodeBool_forKey_(v67, v16, v15, (uint64_t)CFSTR("AllowsCellularAccess"));
  }
  if (objc_msgSend_hasAllowsExpensiveNetworkAccess(v4, v10, v11, v12))
  {
    v20 = objc_msgSend_allowsExpensiveNetworkAccess(v4, v17, v18, v19);
    objc_msgSend_encodeBool_forKey_(v67, v21, v20, (uint64_t)CFSTR("AllowsExpensiveAccess"));
  }
  if (v4)
  {
    if (v4->_hasLongLived)
    {
      isLongLived = objc_msgSend_isLongLived(v4, v17, v18, v19);
      objc_msgSend_encodeBool_forKey_(v67, v23, isLongLived, (uint64_t)CFSTR("IsLongLived"));
    }
    if (v4->_hasTimeoutIntervalForRequest)
    {
      objc_msgSend_timeoutIntervalForRequest(v4, v17, v18, v19);
      objc_msgSend_encodeDouble_forKey_(v67, v24, (uint64_t)CFSTR("TimeoutIntervalForRequest"), v25);
    }
    if (v4->_hasTimeoutIntervalForResource)
    {
      objc_msgSend_timeoutIntervalForResource(v4, v17, v18, v19);
      objc_msgSend_encodeDouble_forKey_(v67, v26, (uint64_t)CFSTR("TimeoutIntervalForResource"), v27);
    }
  }
  if (objc_msgSend_hasAutomaticallyRetryNetworkFailures(v4, v17, v18, v19))
  {
    v31 = objc_msgSend_automaticallyRetryNetworkFailures(v4, v28, v29, v30);
    objc_msgSend_encodeBool_forKey_(v67, v32, v31, (uint64_t)CFSTR("AutomaticallyRetryNetworkFailures"));
  }
  if (objc_msgSend_hasDiscretionaryNetworkBehavior(v4, v28, v29, v30))
  {
    v36 = objc_msgSend_discretionaryNetworkBehavior(v4, v33, v34, v35);
    objc_msgSend_encodeInt64_forKey_(v67, v37, v36, (uint64_t)CFSTR("DiscretionaryNetworkBehavior"));
  }
  if (v4)
  {
    if (v4->_hasPreferAnonymousRequests)
    {
      v38 = objc_msgSend_preferAnonymousRequests(v4, v33, v34, v35);
      objc_msgSend_encodeBool_forKey_(v67, v39, v38, (uint64_t)CFSTR("PrefersAnonymousRequests"));
    }
    if (v4->_hasSourceApplicationSecondaryIdentifier)
    {
      objc_msgSend__sourceApplicationSecondaryIdentifier(v4, v33, v34, v35);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_encodeObject_forKey_(v67, v41, (uint64_t)v40, (uint64_t)CFSTR("SourceApplicationSecondaryIdentifier"));

    }
    if (v4->_hasPrivacyProxyFailClosedOverride)
    {
      objc_msgSend_privacyProxyFailClosedOverride(v4, v33, v34, v35);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_encodeObject_forKey_(v67, v43, (uint64_t)v42, (uint64_t)CFSTR("PrivacyProxyFailClosedOverride"));

    }
    if (v4->_hasApplicationBundleIdentifierOverrideForContainerAccess)
    {
      objc_msgSend_applicationBundleIdentifierOverrideForContainerAccess(v4, v33, v34, v35);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel_applicationBundleIdentifierOverrideForContainerAccess);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_encodeObject_forKey_(v67, v46, (uint64_t)v44, (uint64_t)v45);

    }
    if (v4->_hasApplicationBundleIdentifierOverrideForNetworkAttribution)
    {
      objc_msgSend_applicationBundleIdentifierOverrideForNetworkAttribution(v4, v33, v34, v35);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel_applicationBundleIdentifierOverrideForNetworkAttribution);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_encodeObject_forKey_(v67, v49, (uint64_t)v47, (uint64_t)v48);

    }
    if (v4->_hasAdditionalRequestHTTPHeaders)
    {
      objc_msgSend_additionalRequestHTTPHeaders(v4, v33, v34, v35);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_encodeObject_forKey_(v67, v51, (uint64_t)v50, (uint64_t)CFSTR("AdditionalRequestHTTPHeaders"));

    }
    if (v4->_hasIsCloudKitSupportOperation)
    {
      isCloudKitSupportOperation = objc_msgSend_isCloudKitSupportOperation(v4, v33, v34, v35);
      objc_msgSend_encodeBool_forKey_(v67, v53, isCloudKitSupportOperation, (uint64_t)CFSTR("IsCloudKitSupportOperation"));
    }
    if (v4->_hasCacheDeleteAvailableSpaceClass)
    {
      objc_msgSend_cacheDeleteAvailableSpaceClass(v4, v33, v34, v35);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_encodeObject_forKey_(v67, v55, (uint64_t)v54, (uint64_t)CFSTR("CacheDeleteAvailableSpaceClass"));

    }
  }
  objc_msgSend_unitTestOverrides(v4, v33, v34, v35);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = objc_msgSend_count(v56, v57, v58, v59);

  if (v60)
  {
    objc_msgSend_unitTestOverrides(v4, v61, v62, v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_unitTestOverrides);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_encodeObject_forKey_(v67, v66, (uint64_t)v64, (uint64_t)v65);

  }
  objc_autoreleasePoolPop(v6);
  objc_sync_exit(v4);

}

- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  void *v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  const char *v60;

  v5 = a3;
  v7 = objc_alloc(MEMORY[0x1E0C99E08]);
  v13 = (void *)objc_msgSend_initWithCapacity_(v7, v8, 4, v9);
  if (v5)
  {
    v14 = objc_msgSend_discretionaryNetworkBehavior(self, v10, v11, v12);
    if (v14)
    {
      CKStringForDiscretionaryNetworkBehavior(v14);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKAddPropertySafelyForKey_value_(v13, v19, (uint64_t)CFSTR("discretionary"), (uint64_t)v18);

    }
    v20 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend_timeoutIntervalForRequest(self, v15, v16, v17);
    objc_msgSend_numberWithDouble_(v20, v21, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKAddPropertySafelyForKey_value_(v13, v25, (uint64_t)CFSTR("timeoutForRequest"), (uint64_t)v24);

    objc_msgSend_timeoutIntervalForResource(self, v26, v27, v28);
    if (v29 != -1.0)
    {
      objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v10, v11, v12);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKAddPropertySafelyForKey_value_(v13, v31, (uint64_t)CFSTR("timeoutForResource"), (uint64_t)v30);

    }
  }
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v10, v11, v12);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if ((objc_msgSend_allowsCellularAccess(self, v32, v33, v34) & 1) == 0)
      objc_msgSend_addObject_(v35, v36, (uint64_t)CFSTR("noCellAccess"), v38);
    if (objc_msgSend_hasAllowsExpensiveNetworkAccess(self, v36, v37, v38))
    {
      if (objc_msgSend_allowsExpensiveNetworkAccess(self, v39, v40, v41))
        objc_msgSend_addObject_(v35, v42, (uint64_t)CFSTR("expensiveAccess"), v43);
      else
        objc_msgSend_addObject_(v35, v42, (uint64_t)CFSTR("noExpensiveAccess"), v43);
    }
    if (objc_msgSend_isLongLived(self, v39, v40, v41))
      objc_msgSend_addObject_(v35, v44, (uint64_t)CFSTR("longLived"), v46);
    objc_msgSend_ckXPCActivity(self, v44, v45, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    if (v47)
      objc_msgSend_addObject_(v35, v48, (uint64_t)CFSTR("xpcActivity"), v50);
    if (objc_msgSend_automaticallyRetryNetworkFailures(self, v48, v49, v50))
      objc_msgSend_addObject_(v35, v51, (uint64_t)CFSTR("autoRetry"), v53);
    if (objc_msgSend_preferAnonymousRequests(self, v51, v52, v53))
      objc_msgSend_addObject_(v35, v54, (uint64_t)CFSTR("preferAnon"), v56);
    if (objc_msgSend_isCloudKitSupportOperation(self, v54, v55, v56))
      objc_msgSend_addObject_(v35, v32, (uint64_t)CFSTR("isCloudKitSupportOperation"), v34);
  }
  if (objc_msgSend_count(v35, v32, v33, v34))
  {
    objc_msgSend_componentsJoinedByString_(v35, v57, (uint64_t)CFSTR("|"), v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKAddPropertySafelyForKey_value_(v13, v60, (uint64_t)CFSTR("flags"), (uint64_t)v59);

  }
  return v13;
}

- (BOOL)preferAnonymousRequests
{
  CKOperationConfiguration *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2 && v2->_hasPreferAnonymousRequests && v2->_preferAnonymousRequests;
  objc_sync_exit(v2);

  return v3;
}

- (unint64_t)requestOriginator
{
  CKOperationConfiguration *v2;
  unint64_t requestOriginator;

  v2 = self;
  objc_sync_enter(v2);
  requestOriginator = v2->_requestOriginator;
  objc_sync_exit(v2);

  return requestOriginator;
}

- (BOOL)allowsExpensiveNetworkAccess
{
  CKOperationConfiguration *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  char allowsExpensiveNetworkAccess;

  v2 = self;
  objc_sync_enter(v2);
  if (objc_msgSend_hasAllowsExpensiveNetworkAccess(v2, v3, v4, v5))
    allowsExpensiveNetworkAccess = v2->_allowsExpensiveNetworkAccess;
  else
    allowsExpensiveNetworkAccess = objc_msgSend_allowsCellularAccess(v2, v6, v7, v8);
  objc_sync_exit(v2);

  return allowsExpensiveNetworkAccess;
}

- (BOOL)allowsCellularAccess
{
  CKOperationConfiguration *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = !v2 || !v2->_hasAllowsCellularAccess || v2->_allowsCellularAccess;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isLongLived
{
  CKOperationConfiguration *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2 && v2->_hasLongLived && v2->_longLived;
  objc_sync_exit(v2);

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CKOperationConfiguration *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t isLongLived;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t isCloudKitSupportOperation;
  const char *v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;

  v3 = self;
  objc_sync_enter(v3);
  v7 = objc_alloc_init((Class)objc_opt_class());
  if (v3 && v3->_hasContainer)
  {
    objc_msgSend_container(v3, v4, v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setContainer_(v7, v9, (uint64_t)v8, v10);

  }
  if (objc_msgSend_hasQualityOfService(v3, v4, v5, v6))
  {
    v14 = objc_msgSend_qualityOfService(v3, v11, v12, v13);
    objc_msgSend_setQualityOfService_(v7, v15, v14, v16);
  }
  if (v3 && v3->_hasAllowsCellularAccess)
  {
    v17 = objc_msgSend_allowsCellularAccess(v3, v11, v12, v13);
    objc_msgSend_setAllowsCellularAccess_(v7, v18, v17, v19);
  }
  if (objc_msgSend_hasAllowsExpensiveNetworkAccess(v3, v11, v12, v13))
  {
    v23 = objc_msgSend_allowsExpensiveNetworkAccess(v3, v20, v21, v22);
    objc_msgSend_setAllowsExpensiveNetworkAccess_(v7, v24, v23, v25);
  }
  if (v3)
  {
    if (v3->_hasLongLived)
    {
      isLongLived = objc_msgSend_isLongLived(v3, v20, v21, v22);
      objc_msgSend_setLongLived_(v7, v27, isLongLived, v28);
    }
    if (v3->_hasTimeoutIntervalForRequest)
    {
      objc_msgSend_timeoutIntervalForRequest(v3, v20, v21, v22);
      objc_msgSend_setTimeoutIntervalForRequest_(v7, v29, v30, v31);
    }
    if (v3->_hasTimeoutIntervalForResource)
    {
      objc_msgSend_timeoutIntervalForResource(v3, v20, v21, v22);
      objc_msgSend_setTimeoutIntervalForResource_(v7, v32, v33, v34);
    }
  }
  if (objc_msgSend_hasAutomaticallyRetryNetworkFailures(v3, v20, v21, v22))
  {
    v38 = objc_msgSend_automaticallyRetryNetworkFailures(v3, v35, v36, v37);
    objc_msgSend_setAutomaticallyRetryNetworkFailures_(v7, v39, v38, v40);
  }
  if (objc_msgSend_hasDiscretionaryNetworkBehavior(v3, v35, v36, v37))
  {
    v44 = objc_msgSend_discretionaryNetworkBehavior(v3, v41, v42, v43);
    objc_msgSend_setDiscretionaryNetworkBehavior_(v7, v45, v44, v46);
  }
  if (v3)
  {
    if (v3->_hasCKXPCActivity)
    {
      objc_msgSend_ckXPCActivity(v3, v41, v42, v43);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setCKXPCActivity_(v7, v48, (uint64_t)v47, v49);

    }
    if (v3->_hasXPCActivityAutomaticallyDefer)
    {
      v50 = objc_msgSend_xpcActivityAutomaticallyDefer(v3, v41, v42, v43);
      objc_msgSend_setXpcActivityAutomaticallyDefer_(v7, v51, v50, v52);
    }
    if (v3->_hasSchedulerActivity)
    {
      objc_msgSend_schedulerActivity(v3, v41, v42, v43);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setSchedulerActivity_(v7, v54, (uint64_t)v53, v55);

    }
    if (v3->_hasSystemTask)
    {
      objc_msgSend_systemTask(v3, v41, v42, v43);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setSystemTask_(v7, v57, (uint64_t)v56, v58);

    }
    if (v3->_hasDiscretionarySchedulingForEntireOperation)
    {
      v59 = objc_msgSend_discretionarySchedulingForEntireOperation(v3, v41, v42, v43);
      objc_msgSend_setDiscretionarySchedulingForEntireOperation_(v7, v60, v59, v61);
    }
    if (v3->_hasPreferAnonymousRequests)
    {
      v62 = objc_msgSend_preferAnonymousRequests(v3, v41, v42, v43);
      objc_msgSend_setPreferAnonymousRequests_(v7, v63, v62, v64);
    }
    if (v3->_hasSourceApplicationBundleIdentifier)
    {
      objc_msgSend_sourceApplicationBundleIdentifier(v3, v41, v42, v43);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setSourceApplicationBundleIdentifier_(v7, v66, (uint64_t)v65, v67);

    }
    if (v3->_hasSourceApplicationSecondaryIdentifier)
    {
      objc_msgSend__sourceApplicationSecondaryIdentifier(v3, v41, v42, v43);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_set_sourceApplicationSecondaryIdentifier_(v7, v69, (uint64_t)v68, v70);

    }
    if (v3->_hasPrivacyProxyFailClosedOverride)
    {
      objc_msgSend_privacyProxyFailClosedOverride(v3, v41, v42, v43);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setPrivacyProxyFailClosedOverride_(v7, v72, (uint64_t)v71, v73);

    }
    if (v3->_hasApplicationBundleIdentifierOverrideForContainerAccess)
    {
      objc_msgSend_applicationBundleIdentifierOverrideForContainerAccess(v3, v41, v42, v43);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setApplicationBundleIdentifierOverrideForContainerAccess_(v7, v75, (uint64_t)v74, v76);

    }
    if (v3->_hasApplicationBundleIdentifierOverrideForNetworkAttribution)
    {
      objc_msgSend_applicationBundleIdentifierOverrideForNetworkAttribution(v3, v41, v42, v43);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setApplicationBundleIdentifierOverrideForNetworkAttribution_(v7, v78, (uint64_t)v77, v79);

    }
    if (v3->_hasAdditionalRequestHTTPHeaders)
    {
      objc_msgSend_additionalRequestHTTPHeaders(v3, v41, v42, v43);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setAdditionalRequestHTTPHeaders_(v7, v81, (uint64_t)v80, v82);

    }
    if (v3->_hasIsCloudKitSupportOperation)
    {
      isCloudKitSupportOperation = objc_msgSend_isCloudKitSupportOperation(v3, v41, v42, v43);
      objc_msgSend_setIsCloudKitSupportOperation_(v7, v84, isCloudKitSupportOperation, v85);
    }
    if (v3->_hasCacheDeleteAvailableSpaceClass)
    {
      objc_msgSend_cacheDeleteAvailableSpaceClass(v3, v41, v42, v43);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setCacheDeleteAvailableSpaceClass_(v7, v87, (uint64_t)v86, v88);

    }
    if (v3->_hasAssetDownloadStagingManager)
    {
      objc_msgSend_assetDownloadStagingManager(v3, v41, v42, v43);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setAssetDownloadStagingManager_(v7, v90, (uint64_t)v89, v91);

    }
    if (v3->_hasRequestOriginator)
    {
      v92 = objc_msgSend_requestOriginator(v3, v41, v42, v43);
      objc_msgSend_setRequestOriginator_(v7, v93, v92, v94);
    }
  }
  objc_msgSend_mTestErrorInducerBoxes(v3, v41, v42, v43);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v99 = objc_msgSend_mutableCopy(v95, v96, v97, v98);
  v100 = (void *)v7[23];
  v7[23] = v99;

  objc_msgSend_mTestResultOverlayBoxes(v3, v101, v102, v103);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v108 = objc_msgSend_mutableCopy(v104, v105, v106, v107);
  v109 = (void *)v7[24];
  v7[24] = v108;

  objc_msgSend_unitTestOverrides(v3, v110, v111, v112);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v117 = objc_msgSend_copy(v113, v114, v115, v116);
  v118 = (void *)v7[21];
  v7[21] = v117;

  objc_sync_exit(v3);
  return v7;
}

- (unint64_t)discretionaryNetworkBehavior
{
  CKOperationConfiguration *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t discretionaryNetworkBehavior;
  uint64_t v10;
  _BOOL8 v11;

  v2 = self;
  objc_sync_enter(v2);
  if (objc_msgSend_hasDiscretionaryNetworkBehavior(v2, v3, v4, v5))
  {
    discretionaryNetworkBehavior = v2->_discretionaryNetworkBehavior;
  }
  else
  {
    v10 = objc_msgSend_qualityOfService(v2, v6, v7, v8);
    v11 = v10 != 33;
    if (v10 == 25)
      v11 = 0;
    if (v10 == 9)
      discretionaryNetworkBehavior = 2;
    else
      discretionaryNetworkBehavior = v11;
  }
  objc_sync_exit(v2);

  return discretionaryNetworkBehavior;
}

- (BOOL)hasDiscretionaryNetworkBehavior
{
  return self->_hasDiscretionaryNetworkBehavior;
}

- (BOOL)automaticallyRetryNetworkFailures
{
  CKOperationConfiguration *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v11;

  v2 = self;
  objc_sync_enter(v2);
  if (objc_msgSend_hasAutomaticallyRetryNetworkFailures(v2, v3, v4, v5))
  {
    LOBYTE(v9) = v2->_automaticallyRetryNetworkFailures;
  }
  else
  {
    v11 = objc_msgSend_qualityOfService(v2, v6, v7, v8);
    LOBYTE(v9) = 0;
    if (v11 != 33 && v11 != 25)
    {
      if (v11 == -1)
        v9 = CKCurrentProcessLinkCheck92e3e8f8ec1a906754afb22d87eb36301b4f6760() ^ 1;
      else
        LOBYTE(v9) = 1;
    }
  }
  objc_sync_exit(v2);

  return v9;
}

- (BOOL)hasAutomaticallyRetryNetworkFailures
{
  return self->_hasAutomaticallyRetryNetworkFailures;
}

- (BOOL)hasAllowsExpensiveNetworkAccess
{
  return self->_hasAllowsExpensiveNetworkAccess;
}

- (NSDictionary)unitTestOverrides
{
  CKOperationConfiguration *v2;
  NSDictionary *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_unitTestOverrides;
  objc_sync_exit(v2);

  return v3;
}

- (NSMutableArray)mTestResultOverlayBoxes
{
  return (NSMutableArray *)objc_getProperty(self, a2, 192, 1);
}

- (NSMutableArray)mTestErrorInducerBoxes
{
  return (NSMutableArray *)objc_getProperty(self, a2, 184, 1);
}

- (void)setRequestOriginator:(unint64_t)a3
{
  const char *v4;
  uint64_t v5;
  CKOperationConfiguration *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_requestOriginator = a3;
  obj->_hasRequestOriginator = 1;
  if (a3 == 2)
    objc_msgSend_setQualityOfService_(obj, v4, 25, v5);
  objc_sync_exit(obj);

}

- (void)setDiscretionaryNetworkBehavior:(unint64_t)a3
{
  const char *v4;
  uint64_t v5;
  CKOperationConfiguration *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_discretionaryNetworkBehavior = a3;
  objc_msgSend_setHasDiscretionaryNetworkBehavior_(obj, v4, 1, v5);
  objc_sync_exit(obj);

}

- (void)setHasDiscretionaryNetworkBehavior:(BOOL)a3
{
  self->_hasDiscretionaryNetworkBehavior = a3;
}

- (void)setAutomaticallyRetryNetworkFailures:(BOOL)a3
{
  const char *v4;
  uint64_t v5;
  CKOperationConfiguration *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_automaticallyRetryNetworkFailures = a3;
  objc_msgSend_setHasAutomaticallyRetryNetworkFailures_(obj, v4, 1, v5);
  objc_sync_exit(obj);

}

- (void)setHasAutomaticallyRetryNetworkFailures:(BOOL)a3
{
  self->_hasAutomaticallyRetryNetworkFailures = a3;
}

- (CKOperationConfiguration)init
{
  CKOperationConfiguration *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  CKOperationConfiguration *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKOperationConfiguration;
  v2 = -[CKOperationConfiguration init](&v8, sel_init);
  v6 = v2;
  if (v2)
    objc_msgSend__commonInit(v2, v3, v4, v5);
  return v6;
}

- (void)_commonInit
{
  NSDictionary *v3;
  NSDictionary *unitTestOverrides;
  NSMutableArray *v5;
  NSMutableArray *mTestErrorInducerBoxes;
  NSMutableArray *v7;
  NSMutableArray *mTestResultOverlayBoxes;

  v3 = (NSDictionary *)objc_opt_new();
  unitTestOverrides = self->_unitTestOverrides;
  self->_unitTestOverrides = v3;

  v5 = (NSMutableArray *)objc_opt_new();
  mTestErrorInducerBoxes = self->_mTestErrorInducerBoxes;
  self->_mTestErrorInducerBoxes = v5;

  v7 = (NSMutableArray *)objc_opt_new();
  mTestResultOverlayBoxes = self->_mTestResultOverlayBoxes;
  self->_mTestResultOverlayBoxes = v7;

  self->_requestOriginator = 4;
}

- (void)setQualityOfService:(NSQualityOfService)qualityOfService
{
  const char *v4;
  uint64_t v5;
  CKOperationConfiguration *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_qualityOfService = qualityOfService;
  objc_msgSend_setHasQualityOfService_(obj, v4, 1, v5);
  objc_sync_exit(obj);

}

- (void)setHasQualityOfService:(BOOL)a3
{
  self->_hasQualityOfService = a3;
}

- (CKXPCActivity)ckXPCActivity
{
  CKOperationConfiguration *v2;
  CKXPCActivity *v3;

  v2 = self;
  objc_sync_enter(v2);
  if (v2 && v2->_hasCKXPCActivity)
    v3 = v2->_ckXPCActivity;
  else
    v3 = 0;
  objc_sync_exit(v2);

  return v3;
}

- (NSQualityOfService)qualityOfService
{
  CKOperationConfiguration *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  NSQualityOfService qualityOfService;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;

  v2 = self;
  objc_sync_enter(v2);
  if (objc_msgSend_hasQualityOfService(v2, v3, v4, v5))
  {
    qualityOfService = v2->_qualityOfService;
  }
  else if (v2
         && v2->_hasContainer
         && (objc_msgSend_container(v2, v6, v7, v8),
             v10 = (void *)objc_claimAutoreleasedReturnValue(),
             (v14 = v10) != 0))
  {
    objc_msgSend_options(v10, v11, v12, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    qualityOfService = objc_msgSend_qualityOfService(v15, v16, v17, v18);

  }
  else
  {
    qualityOfService = NSQualityOfServiceDefault;
  }
  objc_sync_exit(v2);

  return qualityOfService;
}

- (BOOL)hasQualityOfService
{
  return self->_hasQualityOfService;
}

- (NSTimeInterval)timeoutIntervalForResource
{
  CKOperationConfiguration *v2;
  double timeoutIntervalForResource;

  v2 = self;
  objc_sync_enter(v2);
  timeoutIntervalForResource = -1.0;
  if (v2 && v2->_hasTimeoutIntervalForResource)
    timeoutIntervalForResource = v2->_timeoutIntervalForResource;
  objc_sync_exit(v2);

  return timeoutIntervalForResource;
}

- (NSTimeInterval)timeoutIntervalForRequest
{
  CKOperationConfiguration *v2;
  double timeoutIntervalForRequest;

  v2 = self;
  objc_sync_enter(v2);
  if (v2 && v2->_hasTimeoutIntervalForRequest)
    timeoutIntervalForRequest = v2->_timeoutIntervalForRequest;
  else
    timeoutIntervalForRequest = 60.0;
  objc_sync_exit(v2);

  return timeoutIntervalForRequest;
}

- (BOOL)isCloudKitSupportOperation
{
  CKOperationConfiguration *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2 && v2->_hasIsCloudKitSupportOperation && v2->_isCloudKitSupportOperation;
  objc_sync_exit(v2);

  return v3;
}

- (void)setContainer:(CKContainer *)container
{
  CKContainer *v4;
  CKContainer *v5;
  CKOperationConfiguration *obj;

  v4 = container;
  obj = self;
  objc_sync_enter(obj);
  v5 = obj->_container;
  obj->_container = v4;

  obj->_hasContainer = 1;
  objc_sync_exit(obj);

}

- (CKContainer)container
{
  CKOperationConfiguration *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  CKContainer *v6;
  CKContainer *v7;

  v2 = self;
  objc_sync_enter(v2);
  if (v2 && v2->_hasContainer)
  {
    v6 = v2->_container;
  }
  else
  {
    objc_msgSend_defaultContainer(CKContainer, v3, v4, v5);
    v6 = (CKContainer *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
  objc_sync_exit(v2);

  return v7;
}

- (id)resolveAgainstGenericConfiguration:(id)a3
{
  _BYTE *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t isLongLived;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  const char *v71;
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
  void *v82;
  const char *v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  uint64_t isCloudKitSupportOperation;
  const char *v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  const char *v123;
  uint64_t v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  _BYTE *v130;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  _BYTE v140[128];
  _BYTE v141[128];
  uint64_t v142;

  v142 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v8 = objc_msgSend_copy(self, v5, v6, v7);
  v12 = (_BYTE *)v8;
  if (v4)
  {
    if ((v4[17] & 1) != 0 && (!v8 || (*(_BYTE *)(v8 + 17) & 1) == 0))
    {
      objc_msgSend_container(v4, v9, v10, v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setContainer_(v12, v14, (uint64_t)v13, v15);

    }
    if (objc_msgSend_hasQualityOfService(v4, v9, v10, v11)
      && (objc_msgSend_hasQualityOfService(v12, v16, v17, v18) & 1) == 0)
    {
      v19 = objc_msgSend_qualityOfService(v4, v16, v17, v18);
      objc_msgSend_setQualityOfService_(v12, v20, v19, v21);
    }
    if ((v4[18] & 1) != 0 && (!v12 || (v12[18] & 1) == 0))
    {
      v22 = objc_msgSend_allowsCellularAccess(v4, v16, v17, v18);
      objc_msgSend_setAllowsCellularAccess_(v12, v23, v22, v24);
    }
    if (objc_msgSend_hasAllowsExpensiveNetworkAccess(v4, v16, v17, v18)
      && (objc_msgSend_hasAllowsExpensiveNetworkAccess(v12, v25, v26, v27) & 1) == 0)
    {
      v28 = objc_msgSend_allowsExpensiveNetworkAccess(v4, v25, v26, v27);
      objc_msgSend_setAllowsExpensiveNetworkAccess_(v12, v29, v28, v30);
    }
    if ((v4[20] & 1) != 0 && (!v12 || (v12[20] & 1) == 0))
    {
      isLongLived = objc_msgSend_isLongLived(v4, v25, v26, v27);
      objc_msgSend_setLongLived_(v12, v32, isLongLived, v33);
    }
    if ((v4[21] & 1) != 0 && (!v12 || (v12[21] & 1) == 0))
    {
      objc_msgSend_timeoutIntervalForRequest(v4, v25, v26, v27);
      objc_msgSend_setTimeoutIntervalForRequest_(v12, v34, v35, v36);
    }
    if ((v4[22] & 1) != 0 && (!v12 || (v12[22] & 1) == 0))
    {
      objc_msgSend_timeoutIntervalForResource(v4, v25, v26, v27);
      objc_msgSend_setTimeoutIntervalForResource_(v12, v37, v38, v39);
    }
    if (objc_msgSend_hasAutomaticallyRetryNetworkFailures(v4, v25, v26, v27)
      && (objc_msgSend_hasAutomaticallyRetryNetworkFailures(v12, v40, v41, v42) & 1) == 0)
    {
      v43 = objc_msgSend_automaticallyRetryNetworkFailures(v4, v40, v41, v42);
      objc_msgSend_setAutomaticallyRetryNetworkFailures_(v12, v44, v43, v45);
    }
    if (objc_msgSend_hasDiscretionaryNetworkBehavior(v4, v40, v41, v42)
      && (objc_msgSend_hasDiscretionaryNetworkBehavior(v12, v46, v47, v48) & 1) == 0)
    {
      v49 = objc_msgSend_discretionaryNetworkBehavior(v4, v46, v47, v48);
      objc_msgSend_setDiscretionaryNetworkBehavior_(v12, v50, v49, v51);
    }
    if ((v4[27] & 1) != 0 && (!v12 || (v12[27] & 1) == 0))
    {
      objc_msgSend_schedulerActivity(v4, v46, v47, v48);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setSchedulerActivity_(v12, v53, (uint64_t)v52, v54);

    }
    if ((v4[25] & 1) != 0 && (!v12 || (v12[25] & 1) == 0))
    {
      objc_msgSend_ckXPCActivity(v4, v46, v47, v48);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setCKXPCActivity_(v12, v56, (uint64_t)v55, v57);

    }
    if ((v4[28] & 1) != 0 && (!v12 || (v12[28] & 1) == 0))
    {
      objc_msgSend_systemTask(v4, v46, v47, v48);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setSystemTask_(v12, v59, (uint64_t)v58, v60);

    }
    if ((v4[26] & 1) != 0 && (!v12 || (v12[26] & 1) == 0))
    {
      v61 = objc_msgSend_xpcActivityAutomaticallyDefer(v4, v46, v47, v48);
      objc_msgSend_setXpcActivityAutomaticallyDefer_(v12, v62, v61, v63);
    }
    if ((v4[29] & 1) != 0 && (!v12 || (v12[29] & 1) == 0))
    {
      v64 = objc_msgSend_discretionarySchedulingForEntireOperation(v4, v46, v47, v48);
      objc_msgSend_setDiscretionarySchedulingForEntireOperation_(v12, v65, v64, v66);
    }
    if ((v4[30] & 1) != 0 && (!v12 || (v12[30] & 1) == 0))
    {
      v67 = objc_msgSend_preferAnonymousRequests(v4, v46, v47, v48);
      objc_msgSend_setPreferAnonymousRequests_(v12, v68, v67, v69);
    }
    if ((v4[31] & 1) != 0 && (!v12 || (v12[31] & 1) == 0))
    {
      objc_msgSend_sourceApplicationBundleIdentifier(v4, v46, v47, v48);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setSourceApplicationBundleIdentifier_(v12, v71, (uint64_t)v70, v72);

    }
    if ((v4[32] & 1) != 0 && (!v12 || (v12[32] & 1) == 0))
    {
      objc_msgSend__sourceApplicationSecondaryIdentifier(v4, v46, v47, v48);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_set_sourceApplicationSecondaryIdentifier_(v12, v74, (uint64_t)v73, v75);

    }
    if ((v4[33] & 1) != 0 && (!v12 || (v12[33] & 1) == 0))
    {
      objc_msgSend_privacyProxyFailClosedOverride(v4, v46, v47, v48);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setPrivacyProxyFailClosedOverride_(v12, v77, (uint64_t)v76, v78);

    }
    if ((v4[34] & 1) != 0 && (!v12 || (v12[34] & 1) == 0))
    {
      objc_msgSend_applicationBundleIdentifierOverrideForContainerAccess(v4, v46, v47, v48);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setApplicationBundleIdentifierOverrideForContainerAccess_(v12, v80, (uint64_t)v79, v81);

    }
    if ((v4[35] & 1) != 0 && (!v12 || (v12[35] & 1) == 0))
    {
      objc_msgSend_applicationBundleIdentifierOverrideForNetworkAttribution(v4, v46, v47, v48);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setApplicationBundleIdentifierOverrideForNetworkAttribution_(v12, v83, (uint64_t)v82, v84);

    }
    if ((v4[36] & 1) != 0 && (!v12 || (v12[36] & 1) == 0))
    {
      objc_msgSend_additionalRequestHTTPHeaders(v4, v46, v47, v48);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setAdditionalRequestHTTPHeaders_(v12, v86, (uint64_t)v85, v87);

    }
    if ((v4[37] & 1) != 0 && (!v12 || (v12[37] & 1) == 0))
    {
      isCloudKitSupportOperation = objc_msgSend_isCloudKitSupportOperation(v4, v46, v47, v48);
      objc_msgSend_setIsCloudKitSupportOperation_(v12, v89, isCloudKitSupportOperation, v90);
    }
    if ((v4[38] & 1) != 0 && (!v12 || (v12[38] & 1) == 0))
    {
      objc_msgSend_cacheDeleteAvailableSpaceClass(v4, v46, v47, v48);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setCacheDeleteAvailableSpaceClass_(v12, v92, (uint64_t)v91, v93);

    }
    if ((v4[39] & 1) != 0 && (!v12 || (v12[39] & 1) == 0))
    {
      objc_msgSend_assetDownloadStagingManager(v4, v46, v47, v48);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setAssetDownloadStagingManager_(v12, v95, (uint64_t)v94, v96);

    }
    if ((v4[40] & 1) != 0 && (!v12 || (v12[40] & 1) == 0))
    {
      v97 = objc_msgSend_requestOriginator(v4, v46, v47, v48);
      objc_msgSend_setRequestOriginator_(v12, v98, v97, v99);
    }
    objc_msgSend_unitTestOverrides(v4, v46, v47, v48);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = objc_msgSend_count(v100, v101, v102, v103);

    if (v104)
    {
      objc_msgSend_unitTestOverrides(v4, v105, v106, v107);
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addUnitTestOverrides_(v12, v109, (uint64_t)v108, v110);

    }
    v138 = 0u;
    v139 = 0u;
    v136 = 0u;
    v137 = 0u;
    objc_msgSend_testErrorInducerBoxes(v4, v105, v106, v107);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v113 = objc_msgSend_countByEnumeratingWithState_objects_count_(v111, v112, (uint64_t)&v136, (uint64_t)v141, 16);
    if (v113)
    {
      v116 = v113;
      v117 = *(_QWORD *)v137;
      do
      {
        v118 = 0;
        do
        {
          if (*(_QWORD *)v137 != v117)
            objc_enumerationMutation(v111);
          objc_msgSend_addTestErrorInducerBox_(v12, v114, *(_QWORD *)(*((_QWORD *)&v136 + 1) + 8 * v118++), v115);
        }
        while (v116 != v118);
        v116 = objc_msgSend_countByEnumeratingWithState_objects_count_(v111, v114, (uint64_t)&v136, (uint64_t)v141, 16);
      }
      while (v116);
    }

    v134 = 0u;
    v135 = 0u;
    v132 = 0u;
    v133 = 0u;
    objc_msgSend_testResultOverlayBoxes(v4, v119, v120, v121, 0);
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    v124 = objc_msgSend_countByEnumeratingWithState_objects_count_(v122, v123, (uint64_t)&v132, (uint64_t)v140, 16);
    if (v124)
    {
      v127 = v124;
      v128 = *(_QWORD *)v133;
      do
      {
        v129 = 0;
        do
        {
          if (*(_QWORD *)v133 != v128)
            objc_enumerationMutation(v122);
          objc_msgSend_addTestResultOverlayBox_(v12, v125, *(_QWORD *)(*((_QWORD *)&v132 + 1) + 8 * v129++), v126);
        }
        while (v127 != v129);
        v127 = objc_msgSend_countByEnumeratingWithState_objects_count_(v122, v125, (uint64_t)&v132, (uint64_t)v140, 16);
      }
      while (v127);
    }

  }
  v130 = v12;

  return v130;
}

- (id)testResultOverlayBoxes
{
  NSMutableArray *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  NSMutableArray *mTestResultOverlayBoxes;
  void *v11;
  const char *v12;
  uint64_t v13;

  v3 = self->_mTestResultOverlayBoxes;
  objc_sync_enter(v3);
  v9 = objc_msgSend_CKContains_(self->_mTestResultOverlayBoxes, v4, (uint64_t)&unk_1E1F58A18, v5);
  mTestResultOverlayBoxes = self->_mTestResultOverlayBoxes;
  if (v9)
  {
    objc_msgSend_CKFilter_(mTestResultOverlayBoxes, v6, (uint64_t)&unk_1E1F59178, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setArray_(self->_mTestResultOverlayBoxes, v12, (uint64_t)v11, v13);
  }
  else
  {
    v11 = (void *)objc_msgSend_copy(mTestResultOverlayBoxes, v6, v7, v8);
  }
  objc_sync_exit(v3);

  return v11;
}

- (id)testErrorInducerBoxes
{
  NSMutableArray *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = self->_mTestErrorInducerBoxes;
  objc_sync_enter(v3);
  v7 = (void *)objc_msgSend_copy(self->_mTestErrorInducerBoxes, v4, v5, v6);
  objc_sync_exit(v3);

  return v7;
}

- (void)setCKXPCActivity:(id)a3
{
  CKXPCActivity *v4;
  CKXPCActivity *ckXPCActivity;
  CKOperationConfiguration *obj;

  v4 = (CKXPCActivity *)a3;
  obj = self;
  objc_sync_enter(obj);
  ckXPCActivity = obj->_ckXPCActivity;
  obj->_ckXPCActivity = v4;

  obj->_hasCKXPCActivity = 1;
  objc_sync_exit(obj);

}

- (CKAssetDownloadStagingManager)assetDownloadStagingManager
{
  CKOperationConfiguration *v2;
  CKAssetDownloadStagingManager *v3;

  v2 = self;
  objc_sync_enter(v2);
  if (v2 && v2->_hasAssetDownloadStagingManager)
    v3 = v2->_assetDownloadStagingManager;
  else
    v3 = 0;
  objc_sync_exit(v2);

  return v3;
}

- (BGSystemTask)systemTask
{
  return self->_systemTask;
}

- (NSString)sourceApplicationBundleIdentifier
{
  CKOperationConfiguration *v2;
  NSString *v3;

  v2 = self;
  objc_sync_enter(v2);
  if (v2 && v2->_hasSourceApplicationBundleIdentifier)
    v3 = v2->_sourceApplicationBundleIdentifier;
  else
    v3 = 0;
  objc_sync_exit(v2);

  return v3;
}

- (void)set_sourceApplicationSecondaryIdentifier:(id)a3
{
  CKOperationConfiguration *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSString *sourceApplicationSecondaryIdentifier;
  id v10;

  v10 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v8 = objc_msgSend_copy(v10, v5, v6, v7);
  sourceApplicationSecondaryIdentifier = v4->_sourceApplicationSecondaryIdentifier;
  v4->_sourceApplicationSecondaryIdentifier = (NSString *)v8;

  v4->_hasSourceApplicationSecondaryIdentifier = 1;
  objc_sync_exit(v4);

}

- (void)setXpcActivity:(id)a3
{
  ((void (*)(CKOperationConfiguration *, char *, id))MEMORY[0x1E0DE7D20])(self, sel_setXPCActivity_, a3);
}

- (void)setXPCActivity:(id)a3
{
  const char *v4;
  uint64_t v5;
  CKXPCActivity *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  if (v12)
  {
    v6 = [CKXPCActivity alloc];
    v9 = (void *)objc_msgSend_initWithXPCActivity_(v6, v7, (uint64_t)v12, v8);
    objc_msgSend_setCKXPCActivity_(self, v10, (uint64_t)v9, v11);

  }
  else
  {
    objc_msgSend_setCKXPCActivity_(self, v4, 0, v5);
  }

}

- (void)setSourceApplicationBundleIdentifier:(id)a3
{
  CKOperationConfiguration *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSString *sourceApplicationBundleIdentifier;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  id v14;

  v14 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v8 = objc_msgSend_copy(v14, v5, v6, v7);
  sourceApplicationBundleIdentifier = v4->_sourceApplicationBundleIdentifier;
  v4->_sourceApplicationBundleIdentifier = (NSString *)v8;

  v4->_hasSourceApplicationBundleIdentifier = 1;
  objc_msgSend_setApplicationBundleIdentifierOverrideForContainerAccess_(v4, v10, (uint64_t)v14, v11);
  objc_msgSend_setApplicationBundleIdentifierOverrideForNetworkAttribution_(v4, v12, (uint64_t)v14, v13);
  objc_sync_exit(v4);

}

- (void)setPreferAnonymousRequests:(BOOL)a3
{
  CKOperationConfiguration *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_preferAnonymousRequests = a3;
  obj->_hasPreferAnonymousRequests = 1;
  objc_sync_exit(obj);

}

- (void)setHasAllowsExpensiveNetworkAccess:(BOOL)a3
{
  self->_hasAllowsExpensiveNetworkAccess = a3;
}

- (void)setApplicationBundleIdentifierOverrideForNetworkAttribution:(id)a3
{
  NSString *v4;
  NSString *applicationBundleIdentifierOverrideForNetworkAttribution;
  CKOperationConfiguration *obj;

  v4 = (NSString *)a3;
  obj = self;
  objc_sync_enter(obj);
  applicationBundleIdentifierOverrideForNetworkAttribution = obj->_applicationBundleIdentifierOverrideForNetworkAttribution;
  obj->_applicationBundleIdentifierOverrideForNetworkAttribution = v4;

  obj->_hasApplicationBundleIdentifierOverrideForNetworkAttribution = 1;
  objc_sync_exit(obj);

}

- (void)setApplicationBundleIdentifierOverrideForContainerAccess:(id)a3
{
  NSString *v4;
  NSString *applicationBundleIdentifierOverrideForContainerAccess;
  CKOperationConfiguration *obj;

  v4 = (NSString *)a3;
  obj = self;
  objc_sync_enter(obj);
  applicationBundleIdentifierOverrideForContainerAccess = obj->_applicationBundleIdentifierOverrideForContainerAccess;
  obj->_applicationBundleIdentifierOverrideForContainerAccess = v4;

  obj->_hasApplicationBundleIdentifierOverrideForContainerAccess = 1;
  objc_sync_exit(obj);

}

- (void)setAllowsExpensiveNetworkAccess:(BOOL)a3
{
  const char *v4;
  uint64_t v5;
  CKOperationConfiguration *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_allowsExpensiveNetworkAccess = a3;
  objc_msgSend_setHasAllowsExpensiveNetworkAccess_(obj, v4, 1, v5);
  objc_sync_exit(obj);

}

- (void)setAllowsCellularAccess:(BOOL)allowsCellularAccess
{
  CKOperationConfiguration *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_allowsCellularAccess = allowsCellularAccess;
  obj->_hasAllowsCellularAccess = 1;
  objc_sync_exit(obj);

}

- (BOOL)discretionarySchedulingForEntireOperation
{
  CKOperationConfiguration *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = !v2 || !v2->_hasDiscretionarySchedulingForEntireOperation || v2->_discretionarySchedulingForEntireOperation;
  objc_sync_exit(v2);

  return v3;
}

- (NSDictionary)additionalRequestHTTPHeaders
{
  CKOperationConfiguration *v2;
  NSDictionary *v3;

  v2 = self;
  objc_sync_enter(v2);
  if (v2 && v2->_hasAdditionalRequestHTTPHeaders)
    v3 = v2->_additionalRequestHTTPHeaders;
  else
    v3 = 0;
  objc_sync_exit(v2);

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)initialize
{
  objc_class *v2;
  uint64_t v3;

  v2 = (objc_class *)objc_opt_class();
  v3 = objc_opt_self();
  sub_18A5CEF4C(v3, v2, 0, 0, 0);
}

+ (CKOperationConfiguration)defaultConvenienceOperationConfiguration
{
  void *v2;
  const char *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;

  v2 = (void *)objc_opt_new();
  objc_msgSend_setDiscretionaryNetworkBehavior_(v2, v3, 0, v4);
  objc_msgSend_setAutomaticallyRetryNetworkFailures_(v2, v5, 0, v6);
  objc_msgSend_setAllowsCellularAccess_(v2, v7, 1, v8);
  v9 = CKCurrentThreadQualityOfService();
  objc_msgSend_setQualityOfService_(v2, v10, v9, v11);
  return (CKOperationConfiguration *)v2;
}

- (void)setLongLived:(BOOL)longLived
{
  CKOperationConfiguration *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_longLived = longLived;
  obj->_hasLongLived = 1;
  objc_sync_exit(obj);

}

- (void)setTimeoutIntervalForRequest:(NSTimeInterval)timeoutIntervalForRequest
{
  CKOperationConfiguration *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_timeoutIntervalForRequest = timeoutIntervalForRequest;
  obj->_hasTimeoutIntervalForRequest = 1;
  objc_sync_exit(obj);

}

- (void)setTimeoutIntervalForResource:(NSTimeInterval)timeoutIntervalForResource
{
  CKOperationConfiguration *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_timeoutIntervalForResource = timeoutIntervalForResource;
  obj->_hasTimeoutIntervalForResource = 1;
  objc_sync_exit(obj);

}

- (BOOL)hasXPCActivity
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  BOOL v5;

  objc_msgSend_ckXPCActivity(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (void)setXpcActivityAutomaticallyDefer:(BOOL)a3
{
  CKOperationConfiguration *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_xpcActivityAutomaticallyDefer = a3;
  obj->_hasXPCActivityAutomaticallyDefer = 1;
  objc_sync_exit(obj);

}

- (BOOL)xpcActivityAutomaticallyDefer
{
  CKOperationConfiguration *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = !v2 || !v2->_hasXPCActivityAutomaticallyDefer || v2->_xpcActivityAutomaticallyDefer;
  objc_sync_exit(v2);

  return v3;
}

- (CKSchedulerActivity)schedulerActivity
{
  CKOperationConfiguration *v2;
  CKSchedulerActivity *v3;

  v2 = self;
  objc_sync_enter(v2);
  if (v2 && v2->_hasSchedulerActivity)
    v3 = v2->_schedulerActivity;
  else
    v3 = 0;
  objc_sync_exit(v2);

  return v3;
}

- (void)setSchedulerActivity:(id)a3
{
  id v4;
  CKOperationConfiguration *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  CKXPCActivity *v22;
  const char *v23;
  uint64_t v24;
  NSObject *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  CKSchedulerActivity *schedulerActivity;
  void *v37;
  int v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (!v4)
  {
LABEL_14:
    v9 = 0;
    goto LABEL_15;
  }
  objc_msgSend_ckXPCActivity(v4, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v10 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v38) = 0;
      _os_log_debug_impl(&dword_18A5C5000, v10, OS_LOG_TYPE_DEBUG, "No xpc_activity on scheduler activity, so let's ask the scheduler for one", (uint8_t *)&v38, 2u);
    }
    objc_msgSend_sharedScheduler(CKScheduler, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_identifier(v4, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_xpcActivityForActivityWithIdentifier_(v14, v19, (uint64_t)v18, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v21
      || (v22 = [CKXPCActivity alloc],
          v9 = (void *)objc_msgSend_initWithXPCActivity_(v22, v23, (uint64_t)v21, v24),
          v21,
          !v9))
    {
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v25 = (id)ck_log_facility_ck;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend_identifier(v4, v26, v27, v28);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = 138543362;
        v39 = v37;
        _os_log_fault_impl(&dword_18A5C5000, v25, OS_LOG_TYPE_FAULT, "Setting invalid activity %{public}@ on operation configuration. Activity must have been submitted", (uint8_t *)&v38, 0xCu);

      }
      goto LABEL_14;
    }
  }
LABEL_15:
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v29 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
  {
    v38 = 138412290;
    v39 = v4;
    _os_log_impl(&dword_18A5C5000, v29, OS_LOG_TYPE_INFO, "Setting scheduler activity in operation configuration %@", (uint8_t *)&v38, 0xCu);
  }
  objc_msgSend_setCKXPCActivity_(v5, v30, (uint64_t)v9, v31);
  v35 = objc_msgSend_copy(v4, v32, v33, v34);
  schedulerActivity = v5->_schedulerActivity;
  v5->_schedulerActivity = (CKSchedulerActivity *)v35;

  v5->_hasSchedulerActivity = 1;
  objc_sync_exit(v5);

}

- (void)setSystemTask:(id)a3
{
  objc_storeStrong((id *)&self->_systemTask, a3);
  self->_hasSystemTask = 1;
}

- (void)setDiscretionarySchedulingForEntireOperation:(BOOL)a3
{
  CKOperationConfiguration *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_discretionarySchedulingForEntireOperation = a3;
  obj->_hasDiscretionarySchedulingForEntireOperation = 1;
  objc_sync_exit(obj);

}

- (void)setIsCloudKitSupportOperation:(BOOL)a3
{
  CKOperationConfiguration *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_isCloudKitSupportOperation = a3;
  obj->_hasIsCloudKitSupportOperation = 1;
  objc_sync_exit(obj);

}

- (void)setCacheDeleteAvailableSpaceClass:(id)a3
{
  NSNumber *v4;
  NSNumber *cacheDeleteAvailableSpaceClass;
  CKOperationConfiguration *obj;

  v4 = (NSNumber *)a3;
  obj = self;
  objc_sync_enter(obj);
  cacheDeleteAvailableSpaceClass = obj->_cacheDeleteAvailableSpaceClass;
  obj->_cacheDeleteAvailableSpaceClass = v4;

  obj->_hasCacheDeleteAvailableSpaceClass = 1;
  objc_sync_exit(obj);

}

- (NSNumber)cacheDeleteAvailableSpaceClass
{
  CKOperationConfiguration *v2;
  NSNumber *v3;

  v2 = self;
  objc_sync_enter(v2);
  if (v2 && v2->_hasCacheDeleteAvailableSpaceClass)
    v3 = v2->_cacheDeleteAvailableSpaceClass;
  else
    v3 = 0;
  objc_sync_exit(v2);

  return v3;
}

- (void)setAssetDownloadStagingManager:(id)a3
{
  CKAssetDownloadStagingManager *v4;
  CKAssetDownloadStagingManager *assetDownloadStagingManager;
  CKOperationConfiguration *obj;

  v4 = (CKAssetDownloadStagingManager *)a3;
  obj = self;
  objc_sync_enter(obj);
  assetDownloadStagingManager = obj->_assetDownloadStagingManager;
  obj->_assetDownloadStagingManager = v4;

  obj->_hasAssetDownloadStagingManager = 1;
  objc_sync_exit(obj);

}

- (NSNumber)privacyProxyFailClosedOverride
{
  CKOperationConfiguration *v2;
  NSNumber *v3;

  v2 = self;
  objc_sync_enter(v2);
  if (v2 && v2->_hasPrivacyProxyFailClosedOverride)
    v3 = v2->_privacyProxyFailClosedOverride;
  else
    v3 = 0;
  objc_sync_exit(v2);

  return v3;
}

- (void)setPrivacyProxyFailClosedOverride:(id)a3
{
  CKOperationConfiguration *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSNumber *privacyProxyFailClosedOverride;
  id v10;

  v10 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v8 = objc_msgSend_copy(v10, v5, v6, v7);
  privacyProxyFailClosedOverride = v4->_privacyProxyFailClosedOverride;
  v4->_privacyProxyFailClosedOverride = (NSNumber *)v8;

  v4->_hasPrivacyProxyFailClosedOverride = 1;
  objc_sync_exit(v4);

}

- (void)setApplicationBundleIdentifierOverride:(id)a3
{
  CKOperationConfiguration *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend_setApplicationBundleIdentifierOverrideForContainerAccess_(v4, v5, (uint64_t)v9, v6);
  objc_msgSend_setApplicationBundleIdentifierOverrideForNetworkAttribution_(v4, v7, (uint64_t)v9, v8);
  objc_sync_exit(v4);

}

- (void)setAdditionalRequestHTTPHeaders:(id)a3
{
  CKOperationConfiguration *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSDictionary *additionalRequestHTTPHeaders;
  id v10;

  v10 = a3;
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend_CKDeepCopy(v10, v5, v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  additionalRequestHTTPHeaders = v4->_additionalRequestHTTPHeaders;
  v4->_additionalRequestHTTPHeaders = (NSDictionary *)v8;

  v4->_hasAdditionalRequestHTTPHeaders = 1;
  objc_sync_exit(v4);

}

- (void)addUnitTestOverrides:(id)a3
{
  CKOperationConfiguration *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSDictionary *unitTestOverrides;
  id v23;

  v23 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v8 = (void *)objc_msgSend_mutableCopy(v4->_unitTestOverrides, v5, v6, v7);
  v9 = v8;
  if (v8)
    v10 = v8;
  else
    v10 = (id)objc_opt_new();
  v11 = v10;

  objc_msgSend_CKDeepCopy(v23, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addEntriesFromDictionary_(v11, v16, (uint64_t)v15, v17);

  v21 = objc_msgSend_copy(v11, v18, v19, v20);
  unitTestOverrides = v4->_unitTestOverrides;
  v4->_unitTestOverrides = (NSDictionary *)v21;

  objc_sync_exit(v4);
}

- (void)removeUnitTestOverride:(id)a3
{
  CKOperationConfiguration *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSDictionary *unitTestOverrides;
  id v18;

  v18 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v8 = (void *)objc_msgSend_mutableCopy(v4->_unitTestOverrides, v5, v6, v7);
  v9 = v8;
  if (v8)
    v10 = v8;
  else
    v10 = (id)objc_opt_new();
  v11 = v10;

  objc_msgSend_setObject_forKeyedSubscript_(v11, v12, 0, (uint64_t)v18);
  v16 = objc_msgSend_copy(v11, v13, v14, v15);
  unitTestOverrides = v4->_unitTestOverrides;
  v4->_unitTestOverrides = (NSDictionary *)v16;

  objc_sync_exit(v4);
}

- (void)addTestErrorInducerBox:(id)a3
{
  NSMutableArray *v4;
  const char *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  v4 = self->_mTestErrorInducerBoxes;
  objc_sync_enter(v4);
  objc_msgSend_addObject_(self->_mTestErrorInducerBoxes, v5, (uint64_t)v7, v6);
  objc_sync_exit(v4);

}

- (void)removeTestErrorInducerBoxWithID:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *mTestErrorInducerBoxes;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  NSMutableArray *v13;
  NSMutableArray *v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v4 = a3;
  v5 = self->_mTestErrorInducerBoxes;
  objc_sync_enter(v5);
  mTestErrorInducerBoxes = self->_mTestErrorInducerBoxes;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_18A7DB548;
  v16[3] = &unk_1E1F65820;
  v15 = v4;
  v17 = v15;
  objc_msgSend_CKFilter_(mTestErrorInducerBoxes, v7, (uint64_t)v16, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (NSMutableArray *)objc_msgSend_mutableCopy(v9, v10, v11, v12);
  v14 = self->_mTestErrorInducerBoxes;
  self->_mTestErrorInducerBoxes = v13;

  objc_sync_exit(v5);
}

- (void)addTestResultOverlayBox:(id)a3
{
  NSMutableArray *v4;
  const char *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  v4 = self->_mTestResultOverlayBoxes;
  objc_sync_enter(v4);
  objc_msgSend_addObject_(self->_mTestResultOverlayBoxes, v5, (uint64_t)v7, v6);
  objc_sync_exit(v4);

}

- (void)removeTestResultOverlayBoxWithID:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *mTestResultOverlayBoxes;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  NSMutableArray *v13;
  NSMutableArray *v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v4 = a3;
  v5 = self->_mTestResultOverlayBoxes;
  objc_sync_enter(v5);
  mTestResultOverlayBoxes = self->_mTestResultOverlayBoxes;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_18A7DB6EC;
  v16[3] = &unk_1E1F65868;
  v15 = v4;
  v17 = v15;
  objc_msgSend_CKFilter_(mTestResultOverlayBoxes, v7, (uint64_t)v16, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (NSMutableArray *)objc_msgSend_mutableCopy(v9, v10, v11, v12);
  v14 = self->_mTestResultOverlayBoxes;
  self->_mTestResultOverlayBoxes = v13;

  objc_sync_exit(v5);
}

- (id)description
{
  return (id)((uint64_t (*)(CKOperationConfiguration *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
}

@end

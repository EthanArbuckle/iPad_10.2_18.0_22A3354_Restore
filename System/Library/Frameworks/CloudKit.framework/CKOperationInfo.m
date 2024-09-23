@implementation CKOperationInfo

- (unint64_t)duetPreClearedMode
{
  return self->_duetPreClearedMode;
}

- (CKOperationGroup)group
{
  return self->_group;
}

- (NSString)operationID
{
  return self->_operationID;
}

- (unint64_t)systemScheduler
{
  return self->_systemScheduler;
}

- (unint64_t)discretionaryWhenBackgroundedState
{
  return self->_discretionaryWhenBackgroundedState;
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
  uint64_t v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
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
  void *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  const char *v46;
  uint64_t isOutstandingOperation;
  const char *v48;
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
  uint64_t HasValidatedEntitlements;
  void *v69;
  const char *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  id v99;

  v99 = a3;
  v4 = (void *)MEMORY[0x18D76DE4C]();
  objc_msgSend_operationID(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v99, v9, (uint64_t)v8, (uint64_t)CFSTR("OperationID"));

  v13 = objc_msgSend_clientQueuePriority(self, v10, v11, v12);
  objc_msgSend_encodeInt64_forKey_(v99, v14, v13, (uint64_t)CFSTR("QueuePriority"));
  v18 = objc_msgSend_duetPreClearedMode(self, v15, v16, v17);
  objc_msgSend_encodeInt64_forKey_(v99, v19, v18, (uint64_t)CFSTR("DuetPreClearedMode"));
  v23 = objc_msgSend_discretionaryWhenBackgroundedState(self, v20, v21, v22);
  objc_msgSend_encodeInt64_forKey_(v99, v24, v23, (uint64_t)CFSTR("DiscretionaryWhenBackgroundedState"));
  v28 = objc_msgSend_systemScheduler(self, v25, v26, v27);
  objc_msgSend_encodeInt64_forKey_(v99, v29, v28, (uint64_t)CFSTR("SystemScheduler"));
  objc_msgSend_xpcActivityIdentifier(self, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v99, v34, (uint64_t)v33, (uint64_t)CFSTR("XPCActivityIdentifier"));

  objc_msgSend_ckOperationClassName(self, v35, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_ckOperationClassName);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v99, v40, (uint64_t)v38, (uint64_t)v39);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_callbackProxyEndpoint(self, v41, v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_callbackProxyEndpoint);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_encodeObject_forKey_(v99, v46, (uint64_t)v44, (uint64_t)v45);

  }
  isOutstandingOperation = objc_msgSend_isOutstandingOperation(self, v41, v42, v43);
  objc_msgSend_encodeBool_forKey_(v99, v48, isOutstandingOperation, (uint64_t)CFSTR("IsOutstanding"));
  if (self)
    objc_msgSend_encodeObject_forKey_(v99, v49, (uint64_t)self->_name, (uint64_t)CFSTR("OperationName"));
  else
    objc_msgSend_encodeObject_forKey_(v99, v49, 0, (uint64_t)CFSTR("OperationName"));
  objc_msgSend_MMCSRequestOptions(self, v50, v51, v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v99, v54, (uint64_t)v53, (uint64_t)CFSTR("MMCSRequestOptions"));

  objc_msgSend_resolvedConfiguration(self, v55, v56, v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v99, v59, (uint64_t)v58, (uint64_t)CFSTR("ResolvedConfiguration"));

  objc_msgSend_group(self, v60, v61, v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v99, v64, (uint64_t)v63, (uint64_t)CFSTR("Group"));

  HasValidatedEntitlements = objc_msgSend_clientHasValidatedEntitlements(self, v65, v66, v67);
  NSStringFromSelector(sel_clientHasValidatedEntitlements);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeBool_forKey_(v99, v70, HasValidatedEntitlements, (uint64_t)v69);

  v74 = objc_msgSend_requestOriginator(self, v71, v72, v73);
  NSStringFromSelector(sel_requestOriginator);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeInteger_forKey_(v99, v76, v74, (uint64_t)v75);

  v80 = objc_msgSend_wantsRequestStatistics(self, v77, v78, v79);
  objc_msgSend_encodeBool_forKey_(v99, v81, v80, (uint64_t)CFSTR("WantsRequestStatistics"));
  v85 = objc_msgSend_usesAssetDownloadStagingManager(self, v82, v83, v84);
  objc_msgSend_encodeBool_forKey_(v99, v86, v85, (uint64_t)CFSTR("UsesAssetDownloadStagingManager"));
  v90 = objc_msgSend_wantsDaemonOperationCallbacks(self, v87, v88, v89);
  NSStringFromSelector(sel_wantsDaemonOperationCallbacks);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeBool_forKey_(v99, v92, v90, (uint64_t)v91);

  v96 = objc_msgSend_wantsDaemonRequestCallbacks(self, v93, v94, v95);
  NSStringFromSelector(sel_wantsDaemonRequestCallbacks);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeBool_forKey_(v99, v98, v96, (uint64_t)v97);

  objc_autoreleasePoolPop(v4);
}

- (CKOperationInfo)init
{
  CKOperationInfo *v2;
  uint64_t v3;
  NSString *operationID;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKOperationInfo;
  v2 = -[CKOperationInfo init](&v6, sel_init);
  if (v2)
  {
    CKShortRandomID();
    v3 = objc_claimAutoreleasedReturnValue();
    operationID = v2->_operationID;
    v2->_operationID = (NSString *)v3;

    if (!byte_1EDF6A0E0)
      v2->_clientHasValidatedEntitlements = 1;
  }
  return v2;
}

- (NSString)sourceApplicationSecondaryIdentifier
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_resolvedConfiguration(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__sourceApplicationSecondaryIdentifier(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (NSString)applicationBundleIdentifierOverrideForNetworkAttribution
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_resolvedConfiguration(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_applicationBundleIdentifierOverrideForNetworkAttribution(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (NSString)applicationBundleIdentifierOverrideForContainerAccess
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_resolvedConfiguration(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_applicationBundleIdentifierOverrideForContainerAccess(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (CKOperationInfo)initWithCoder:(id)a3
{
  id v4;
  CKOperationInfo *v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  NSString *operationID;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  NSString *xpcActivityIdentifier;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  NSString *ckOperationClassName;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  CKOperationCallbackProxyEndpoint *callbackProxyEndpoint;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  NSString *name;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  CKOperationMMCSRequestOptions *MMCSRequestOptions;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  CKOperationConfiguration *resolvedConfiguration;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  CKOperationGroup *group;
  void *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  objc_super v68;

  v4 = a3;
  v68.receiver = self;
  v68.super_class = (Class)CKOperationInfo;
  v5 = -[CKOperationInfo init](&v68, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x18D76DE4C]();
    v7 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, (uint64_t)CFSTR("OperationID"));
    v9 = objc_claimAutoreleasedReturnValue();
    operationID = v5->_operationID;
    v5->_operationID = (NSString *)v9;

    v5->_clientQueuePriority = objc_msgSend_decodeInt64ForKey_(v4, v11, (uint64_t)CFSTR("QueuePriority"), v12);
    v5->_duetPreClearedMode = objc_msgSend_decodeInt64ForKey_(v4, v13, (uint64_t)CFSTR("DuetPreClearedMode"), v14);
    v5->_discretionaryWhenBackgroundedState = objc_msgSend_decodeInt64ForKey_(v4, v15, (uint64_t)CFSTR("DiscretionaryWhenBackgroundedState"), v16);
    v5->_systemScheduler = objc_msgSend_decodeInt64ForKey_(v4, v17, (uint64_t)CFSTR("SystemScheduler"), v18);
    v19 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v20, v19, (uint64_t)CFSTR("XPCActivityIdentifier"));
    v21 = objc_claimAutoreleasedReturnValue();
    xpcActivityIdentifier = v5->_xpcActivityIdentifier;
    v5->_xpcActivityIdentifier = (NSString *)v21;

    v23 = objc_opt_class();
    NSStringFromSelector(sel_ckOperationClassName);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v25, v23, (uint64_t)v24);
    v26 = objc_claimAutoreleasedReturnValue();
    ckOperationClassName = v5->_ckOperationClassName;
    v5->_ckOperationClassName = (NSString *)v26;

    v28 = objc_opt_class();
    NSStringFromSelector(sel_callbackProxyEndpoint);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v30, v28, (uint64_t)v29);
    v31 = objc_claimAutoreleasedReturnValue();
    callbackProxyEndpoint = v5->_callbackProxyEndpoint;
    v5->_callbackProxyEndpoint = (CKOperationCallbackProxyEndpoint *)v31;

    v5->_isOutstandingOperation = objc_msgSend_decodeBoolForKey_(v4, v33, (uint64_t)CFSTR("IsOutstanding"), v34);
    v35 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v36, v35, (uint64_t)CFSTR("OperationName"));
    v37 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v37;

    v39 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v40, v39, (uint64_t)CFSTR("MMCSRequestOptions"));
    v41 = objc_claimAutoreleasedReturnValue();
    MMCSRequestOptions = v5->_MMCSRequestOptions;
    v5->_MMCSRequestOptions = (CKOperationMMCSRequestOptions *)v41;

    v43 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v44, v43, (uint64_t)CFSTR("ResolvedConfiguration"));
    v45 = objc_claimAutoreleasedReturnValue();
    resolvedConfiguration = v5->_resolvedConfiguration;
    v5->_resolvedConfiguration = (CKOperationConfiguration *)v45;

    v47 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v48, v47, (uint64_t)CFSTR("Group"));
    v49 = objc_claimAutoreleasedReturnValue();
    group = v5->_group;
    v5->_group = (CKOperationGroup *)v49;

    NSStringFromSelector(sel_clientHasValidatedEntitlements);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_clientHasValidatedEntitlements = objc_msgSend_decodeBoolForKey_(v4, v52, (uint64_t)v51, v53);

    NSStringFromSelector(sel_requestOriginator);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_requestOriginator = objc_msgSend_decodeIntegerForKey_(v4, v55, (uint64_t)v54, v56);

    v5->_wantsRequestStatistics = objc_msgSend_decodeBoolForKey_(v4, v57, (uint64_t)CFSTR("WantsRequestStatistics"), v58);
    v5->_usesAssetDownloadStagingManager = objc_msgSend_decodeBoolForKey_(v4, v59, (uint64_t)CFSTR("UsesAssetDownloadStagingManager"), v60);
    NSStringFromSelector(sel_wantsDaemonOperationCallbacks);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_wantsDaemonOperationCallbacks = objc_msgSend_decodeBoolForKey_(v4, v62, (uint64_t)v61, v63);

    NSStringFromSelector(sel_wantsDaemonRequestCallbacks);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_wantsDaemonRequestCallbacks = objc_msgSend_decodeBoolForKey_(v4, v65, (uint64_t)v64, v66);

    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (BOOL)allowsExpensiveNetworkAccess
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  objc_msgSend_resolvedConfiguration(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_allowsExpensiveNetworkAccess(v4, v5, v6, v7);

  return v8;
}

- (BOOL)preferAnonymousRequests
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  objc_msgSend_resolvedConfiguration(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_preferAnonymousRequests(v4, v5, v6, v7);

  return v8;
}

- (BOOL)allowsCellularAccess
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  objc_msgSend_resolvedConfiguration(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_allowsCellularAccess(v4, v5, v6, v7);

  return v8;
}

- (BOOL)isLongLived
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  char isLongLived;

  objc_msgSend_resolvedConfiguration(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  isLongLived = objc_msgSend_isLongLived(v4, v5, v6, v7);

  return isLongLived;
}

- (BOOL)automaticallyRetryNetworkFailures
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  objc_msgSend_resolvedConfiguration(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_automaticallyRetryNetworkFailures(v4, v5, v6, v7);

  return v8;
}

- (unint64_t)discretionaryNetworkBehavior
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  objc_msgSend_resolvedConfiguration(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_discretionaryNetworkBehavior(v4, v5, v6, v7);

  return v8;
}

- (CKOperationConfiguration)resolvedConfiguration
{
  return self->_resolvedConfiguration;
}

- (double)timeoutIntervalForResource
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;

  objc_msgSend_resolvedConfiguration(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timeoutIntervalForResource(v4, v5, v6, v7);
  v9 = v8;

  return v9;
}

- (double)timeoutIntervalForRequest
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;

  objc_msgSend_resolvedConfiguration(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timeoutIntervalForRequest(v4, v5, v6, v7);
  v9 = v8;

  return v9;
}

- (BOOL)isCloudKitSupportOperation
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  char isCloudKitSupportOperation;

  objc_msgSend_resolvedConfiguration(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  isCloudKitSupportOperation = objc_msgSend_isCloudKitSupportOperation(v4, v5, v6, v7);

  return isCloudKitSupportOperation;
}

- (int64_t)qualityOfService
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;

  objc_msgSend_resolvedConfiguration(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_qualityOfService(v4, v5, v6, v7);

  return v8;
}

- (void)setXpcActivityIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void)setSystemScheduler:(unint64_t)a3
{
  self->_systemScheduler = a3;
}

- (void)setResolvedConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_resolvedConfiguration, a3);
}

- (void)setRequestOriginator:(unint64_t)a3
{
  self->_requestOriginator = a3;
}

- (void)setOperationID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setMMCSRequestOptions:(id)a3
{
  objc_storeStrong((id *)&self->_MMCSRequestOptions, a3);
}

- (void)setGroup:(id)a3
{
  objc_storeStrong((id *)&self->_group, a3);
}

- (void)setDuetPreClearedMode:(unint64_t)a3
{
  self->_duetPreClearedMode = a3;
}

- (void)setDiscretionaryWhenBackgroundedState:(unint64_t)a3
{
  self->_discretionaryWhenBackgroundedState = a3;
}

- (void)setClientQueuePriority:(int64_t)a3
{
  self->_clientQueuePriority = a3;
}

- (void)setCkOperationClassName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_xpcActivityIdentifier, 0);
  objc_destroyWeak((id *)&self->_parentOperation);
  objc_storeStrong((id *)&self->_resolvedConfiguration, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_MMCSRequestOptions, 0);
  objc_storeStrong((id *)&self->_callbackProxyEndpoint, 0);
  objc_storeStrong((id *)&self->_ckOperationClassName, 0);
  objc_storeStrong((id *)&self->_operationID, 0);
}

- (unint64_t)requestOriginator
{
  return self->_requestOriginator;
}

- (CKDOperation)parentOperation
{
  return (CKDOperation *)objc_loadWeakRetained((id *)&self->_parentOperation);
}

- (NSString)xpcActivityIdentifier
{
  return self->_xpcActivityIdentifier;
}

- (BOOL)wantsRequestStatistics
{
  return self->_wantsRequestStatistics;
}

- (BOOL)wantsDaemonRequestCallbacks
{
  return self->_wantsDaemonRequestCallbacks;
}

- (BOOL)wantsDaemonOperationCallbacks
{
  return self->_wantsDaemonOperationCallbacks;
}

- (BOOL)usesAssetDownloadStagingManager
{
  return self->_usesAssetDownloadStagingManager;
}

- (void)takeValuesFromParentOperationInfo:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t HasValidatedEntitlements;
  const char *v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;

  v4 = a3;
  v8 = objc_msgSend_clientQueuePriority(v4, v5, v6, v7);
  objc_msgSend_setClientQueuePriority_(self, v9, v8, v10);
  v14 = objc_msgSend_duetPreClearedMode(v4, v11, v12, v13);
  objc_msgSend_setDuetPreClearedMode_(self, v15, v14, v16);
  v20 = objc_msgSend_discretionaryWhenBackgroundedState(v4, v17, v18, v19);
  objc_msgSend_setDiscretionaryWhenBackgroundedState_(self, v21, v20, v22);
  v26 = objc_msgSend_systemScheduler(v4, v23, v24, v25);
  objc_msgSend_setSystemScheduler_(self, v27, v26, v28);
  objc_msgSend_xpcActivityIdentifier(v4, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setXpcActivityIdentifier_(self, v33, (uint64_t)v32, v34);

  objc_msgSend_MMCSRequestOptions(v4, v35, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMMCSRequestOptions_(self, v39, (uint64_t)v38, v40);

  objc_msgSend_resolvedConfiguration(v4, v41, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setResolvedConfiguration_(self, v45, (uint64_t)v44, v46);

  objc_msgSend_group(v4, v47, v48, v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setGroup_(self, v51, (uint64_t)v50, v52);

  HasValidatedEntitlements = objc_msgSend_clientHasValidatedEntitlements(v4, v53, v54, v55);
  objc_msgSend_setClientHasValidatedEntitlements_(self, v57, HasValidatedEntitlements, v58);
  v62 = objc_msgSend_usesAssetDownloadStagingManager(v4, v59, v60, v61);
  objc_msgSend_setUsesAssetDownloadStagingManager_(self, v63, v62, v64);
  v68 = objc_msgSend_wantsDaemonOperationCallbacks(v4, v65, v66, v67);
  objc_msgSend_setWantsDaemonOperationCallbacks_(self, v69, v68, v70);
  v74 = objc_msgSend_wantsDaemonRequestCallbacks(v4, v71, v72, v73);

  MEMORY[0x1E0DE7D20](self, sel_setWantsDaemonRequestCallbacks_, v74, v75);
}

- (void)takeValuesFrom:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  char isOutstandingOperation;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  _QWORD *v40;

  v40 = a3;
  objc_msgSend_operationID(v40, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setOperationID_(self, v8, (uint64_t)v7, v9);

  objc_msgSend_ckOperationClassName(v40, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCkOperationClassName_(self, v14, (uint64_t)v13, v15);

  objc_msgSend_callbackProxyEndpoint(v40, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCallbackProxyEndpoint_(self, v20, (uint64_t)v19, v21);

  isOutstandingOperation = objc_msgSend_isOutstandingOperation(v40, v22, v23, v24);
  if (self)
    self->_isOutstandingOperation = isOutstandingOperation;
  if (!v40)
  {
    v28 = 0;
    if (self)
      goto LABEL_5;
LABEL_8:
    objc_msgSend_wantsRequestStatistics(v40, v26, (uint64_t)v28, v27);
    goto LABEL_6;
  }
  v28 = (void *)v40[16];
  if (!self)
    goto LABEL_8;
LABEL_5:
  objc_setProperty_nonatomic_copy(self, v26, v28, 128);
  self->_wantsRequestStatistics = objc_msgSend_wantsRequestStatistics(v40, v29, v30, v31);
LABEL_6:
  v35 = objc_msgSend_requestOriginator(v40, v32, v33, v34);
  objc_msgSend_setRequestOriginator_(self, v36, v35, v37);
  objc_msgSend_takeValuesFromParentOperationInfo_(self, v38, (uint64_t)v40, v39);

}

- (void)setWantsDaemonRequestCallbacks:(BOOL)a3
{
  self->_wantsDaemonRequestCallbacks = a3;
}

- (void)setWantsDaemonOperationCallbacks:(BOOL)a3
{
  self->_wantsDaemonOperationCallbacks = a3;
}

- (void)setUsesAssetDownloadStagingManager:(BOOL)a3
{
  self->_usesAssetDownloadStagingManager = a3;
}

- (void)setParentOperation:(id)a3
{
  objc_storeWeak((id *)&self->_parentOperation, a3);
}

- (void)setClientHasValidatedEntitlements:(BOOL)a3
{
  self->_clientHasValidatedEntitlements = a3;
}

- (BOOL)isOutstandingOperation
{
  return self->_isOutstandingOperation;
}

- (int64_t)clientQueuePriority
{
  return self->_clientQueuePriority;
}

- (BOOL)clientHasValidatedEntitlements
{
  return self->_clientHasValidatedEntitlements;
}

- (NSString)ckOperationClassName
{
  return self->_ckOperationClassName;
}

- (NSDictionary)additionalRequestHTTPHeaders
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_resolvedConfiguration(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_additionalRequestHTTPHeaders(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v8;
}

- (CKOperationMMCSRequestOptions)MMCSRequestOptions
{
  return self->_MMCSRequestOptions;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
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
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  NSString *name;
  NSString *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend_operationID(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_copy(v8, v9, v10, v11);
  v13 = (void *)*((_QWORD *)v4 + 3);
  *((_QWORD *)v4 + 3) = v12;

  *((_QWORD *)v4 + 11) = objc_msgSend_clientQueuePriority(self, v14, v15, v16);
  *((_QWORD *)v4 + 12) = objc_msgSend_duetPreClearedMode(self, v17, v18, v19);
  *((_QWORD *)v4 + 13) = objc_msgSend_discretionaryWhenBackgroundedState(self, v20, v21, v22);
  *((_QWORD *)v4 + 14) = objc_msgSend_systemScheduler(self, v23, v24, v25);
  objc_msgSend_xpcActivityIdentifier(self, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend_copy(v29, v30, v31, v32);
  v34 = (void *)*((_QWORD *)v4 + 15);
  *((_QWORD *)v4 + 15) = v33;

  objc_msgSend_ckOperationClassName(self, v35, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend_copy(v38, v39, v40, v41);
  v43 = (void *)*((_QWORD *)v4 + 4);
  *((_QWORD *)v4 + 4) = v42;

  objc_msgSend_callbackProxyEndpoint(self, v44, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend_copy(v47, v48, v49, v50);
  v52 = (void *)*((_QWORD *)v4 + 5);
  *((_QWORD *)v4 + 5) = v51;

  *((_BYTE *)v4 + 8) = objc_msgSend_isOutstandingOperation(self, v53, v54, v55);
  if (self)
    name = self->_name;
  else
    name = 0;
  v57 = name;
  v61 = objc_msgSend_copy(v57, v58, v59, v60);
  v62 = (void *)*((_QWORD *)v4 + 16);
  *((_QWORD *)v4 + 16) = v61;

  objc_msgSend_MMCSRequestOptions(self, v63, v64, v65);
  v66 = objc_claimAutoreleasedReturnValue();
  v67 = (void *)*((_QWORD *)v4 + 6);
  *((_QWORD *)v4 + 6) = v66;

  objc_msgSend_resolvedConfiguration(self, v68, v69, v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = objc_msgSend_copy(v71, v72, v73, v74);
  v76 = (void *)*((_QWORD *)v4 + 8);
  *((_QWORD *)v4 + 8) = v75;

  objc_msgSend_group(self, v77, v78, v79);
  v80 = objc_claimAutoreleasedReturnValue();
  v81 = (void *)*((_QWORD *)v4 + 7);
  *((_QWORD *)v4 + 7) = v80;

  *((_BYTE *)v4 + 9) = objc_msgSend_clientHasValidatedEntitlements(self, v82, v83, v84);
  objc_msgSend_parentOperation(self, v85, v86, v87);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)v4 + 9, v88);

  *((_BYTE *)v4 + 11) = objc_msgSend_wantsRequestStatistics(self, v89, v90, v91);
  *((_BYTE *)v4 + 10) = objc_msgSend_usesAssetDownloadStagingManager(self, v92, v93, v94);
  *((_BYTE *)v4 + 12) = objc_msgSend_wantsDaemonOperationCallbacks(self, v95, v96, v97);
  *((_BYTE *)v4 + 13) = objc_msgSend_wantsDaemonRequestCallbacks(self, v98, v99, v100);
  *((_QWORD *)v4 + 10) = objc_msgSend_requestOriginator(self, v101, v102, v103);
  return v4;
}

- (NSNumber)privacyProxyFailClosedOverride
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_resolvedConfiguration(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_privacyProxyFailClosedOverride(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v8;
}

- (NSNumber)cacheDeleteAvailableSpaceClass
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_resolvedConfiguration(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_cacheDeleteAvailableSpaceClass(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v8;
}

- (NSString)authPromptReason
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_group(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_authPromptReason(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKOperationCallbackProxyEndpoint)callbackProxyEndpoint
{
  return self->_callbackProxyEndpoint;
}

- (void)setCallbackProxyEndpoint:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

@end

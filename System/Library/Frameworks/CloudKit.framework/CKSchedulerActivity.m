@implementation CKSchedulerActivity

- (CKSchedulerActivity)initWithIdentifier:(id)a3 container:(id)a4 containerID:(id)a5 priority:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  char v13;
  id v14;
  char v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  CKSchedulerActivity *v19;
  uint64_t v20;
  NSString *identifier;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  CKContainerID *containerID;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  NSArray *relatedApplicationBundleIdentifiers;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v40;
  CKException *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  id v51;
  objc_super v52;
  id v53;
  id v54;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v54 = 0;
  v13 = _CKCheckArgument((uint64_t)"identifier", v10, 0, 0, 0, &v54);
  v14 = v54;
  if ((v13 & 1) == 0
    || (v14,
        v53 = 0,
        v15 = _CKCheckArgument((uint64_t)"containerID", v12, 0, 0, 0, &v53),
        v14 = v53,
        (v15 & 1) == 0))
  {
    v40 = v14;
    v41 = [CKException alloc];
    v45 = objc_msgSend_code(v40, v42, v43, v44);
    objc_msgSend_localizedDescription(v40, v46, v47, v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = (id)objc_msgSend_initWithCode_format_(v41, v50, v45, (uint64_t)CFSTR("%@"), v49);

    objc_exception_throw(v51);
  }

  v52.receiver = self;
  v52.super_class = (Class)CKSchedulerActivity;
  v19 = -[CKSchedulerActivity init](&v52, sel_init);
  if (v19)
  {
    v20 = objc_msgSend_copy(v10, v16, v17, v18);
    identifier = v19->_identifier;
    v19->_identifier = (NSString *)v20;

    v25 = objc_msgSend_copy(v12, v22, v23, v24);
    containerID = v19->_containerID;
    v19->_containerID = (CKContainerID *)v25;

    objc_storeStrong((id *)&v19->_nullableContainer, a4);
    v19->_priority = a6;
    v27 = (void *)objc_opt_class();
    objc_msgSend_defaultRelatedApplicationBundleIdentifiersForContainer_(v27, v28, (uint64_t)v11, v29);
    v30 = objc_claimAutoreleasedReturnValue();
    relatedApplicationBundleIdentifiers = v19->_relatedApplicationBundleIdentifiers;
    v19->_relatedApplicationBundleIdentifiers = (NSArray *)v30;

    objc_msgSend_sharedOptions(CKBehaviorOptions, v32, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v19->_overrideRateLimiting = objc_msgSend_isDASRateLimitingDisabled(v35, v36, v37, v38);

  }
  return v19;
}

+ (id)defaultRelatedApplicationBundleIdentifiersForContainer:(id)a3
{
  id v3;
  id v4;
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
  uint64_t v26;
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
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  objc_msgSend_options(v3, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_applicationBundleIdentifierOverrideForNetworkAttribution(v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend_options(v3, v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_applicationBundleIdentifierOverrideForNetworkAttribution(v16, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v4, v21, (uint64_t)v20, v22);

  }
  objc_msgSend_options(v3, v13, v14, v15);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_applicationBundleIdentifierOverrideForContainerAccess(v23, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    objc_msgSend_options(v3, v28, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_applicationBundleIdentifierOverrideForContainerAccess(v31, v32, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v4, v36, (uint64_t)v35, v37);

  }
  objc_msgSend_options(v3, v28, v29, v30);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_applicationBundleIdentifierOverrideForTCC(v38, v39, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    objc_msgSend_options(v3, v43, v44, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_applicationBundleIdentifierOverrideForTCC(v46, v47, v48, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v4, v51, (uint64_t)v50, v52);

  }
  objc_msgSend_options(v3, v43, v44, v45);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_applicationBundleIdentifierOverrideForPushTopicGeneration(v53, v54, v55, v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  if (v57)
  {
    objc_msgSend_options(v3, v58, v59, v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_applicationBundleIdentifierOverrideForPushTopicGeneration(v61, v62, v63, v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v4, v66, (uint64_t)v65, v67);

  }
  objc_msgSend_sharedManager(CKProcessScopedStateManager, v58, v59, v60);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_untrustedEntitlements(v68, v69, v70, v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_applicationBundleID(v72, v73, v74, v75);
  v76 = (void *)objc_claimAutoreleasedReturnValue();

  if (v76)
    objc_msgSend_addObject_(v4, v77, (uint64_t)v76, v79);
  objc_msgSend_mainBundle(MEMORY[0x1E0CB34D0], v77, v78, v79);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bundleIdentifier(v80, v81, v82, v83);
  v84 = (void *)objc_claimAutoreleasedReturnValue();

  if (v84)
    objc_msgSend_addObject_(v4, v85, (uint64_t)v84, v87);
  objc_msgSend_array(v4, v85, v86, v87);
  v88 = (void *)objc_claimAutoreleasedReturnValue();

  return v88;
}

- (CKSchedulerActivity)initWithIdentifier:(id)a3 containerID:(id)a4 priority:(int64_t)a5
{
  return (CKSchedulerActivity *)objc_msgSend_initWithIdentifier_container_containerID_priority_(self, a2, (uint64_t)a3, 0, a4, a5);
}

- (CKSchedulerActivity)initWithIdentifier:(id)a3 container:(id)a4 priority:(int64_t)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  CKSchedulerActivity *v15;

  v8 = a4;
  v9 = a3;
  objc_msgSend_containerID(v8, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (CKSchedulerActivity *)objc_msgSend_initWithIdentifier_container_containerID_priority_(self, v14, (uint64_t)v9, (uint64_t)v8, v13, a5);

  return v15;
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  id v51;
  const char *v52;
  id v53;
  _QWORD applier[4];
  id v55;

  v53 = a3;
  objc_msgSend_identifier(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addProperty_value_shouldRedact_(v53, v8, (uint64_t)CFSTR("identifier"), (uint64_t)v7, 0);

  v9 = (void *)MEMORY[0x1E0CB37E8];
  v13 = objc_msgSend_priority(self, v10, v11, v12);
  objc_msgSend_numberWithInteger_(v9, v14, v13, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addProperty_value_shouldRedact_(v53, v17, (uint64_t)CFSTR("priority"), (uint64_t)v16, 0);

  objc_msgSend_earliestStartDate(self, v18, v19, v20);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
    objc_msgSend_addProperty_value_shouldRedact_(v53, v21, (uint64_t)CFSTR("earliestStartDate"), (uint64_t)v24, 0);
  objc_msgSend_containerID(self, v21, v22, v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addProperty_value_shouldRedact_(v53, v26, (uint64_t)CFSTR("container"), (uint64_t)v25, 0);

  v30 = objc_msgSend_expectedTransferSizeBytes(self, v27, v28, v29);
  if (v30)
  {
    objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v31, v30, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addProperty_value_shouldRedact_(v53, v35, (uint64_t)CFSTR("expectedTransferSizeBytes"), (uint64_t)v34, 0);

  }
  if (objc_msgSend_userRequestedBackupTask(self, v31, v32, v33))
    objc_msgSend_addProperty_value_shouldRedact_(v53, v36, (uint64_t)CFSTR("userRequestedBackupTask"), MEMORY[0x1E0C9AAB0], 0);
  objc_msgSend_relatedApplicationBundleIdentifiers(self, v36, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v39, v40, v41, v42))
    objc_msgSend_addProperty_value_shouldRedact_(v53, v43, (uint64_t)CFSTR("relatedApplications"), (uint64_t)v39, 0);
  objc_msgSend_xpcActivityCriteriaOverrides(self, v43, v44, v45);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (v49)
  {
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v46, v47, v48);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    applier[0] = MEMORY[0x1E0C809B0];
    applier[1] = 3221225472;
    applier[2] = sub_18A752A28;
    applier[3] = &unk_1E1F63EC8;
    v55 = v50;
    v51 = v50;
    xpc_dictionary_apply(v49, applier);
    objc_msgSend_addProperty_value_shouldRedact_(v53, v52, (uint64_t)CFSTR("xpcActivityCriteriaOverrides"), (uint64_t)v51, 0);

  }
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKSchedulerActivity *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKUnredactedDescription);
}

- (id)redactedDescription
{
  return (id)((uint64_t (*)(CKSchedulerActivity *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKRedactedDescription);
}

- (CKContainer)container
{
  CKSchedulerActivity *v2;
  CKContainer *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  CKContainer *nullableContainer;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_nullableContainer)
  {
    v3 = [CKContainer alloc];
    objc_msgSend_containerID(v2, v4, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend_initWithContainerID_(v3, v8, (uint64_t)v7, v9);
    nullableContainer = v2->_nullableContainer;
    v2->_nullableContainer = (CKContainer *)v10;

  }
  objc_sync_exit(v2);

  return v2->_nullableContainer;
}

- (void)setContainer:(id)a3
{
  CKContainer *v4;
  CKContainer *nullableContainer;
  CKSchedulerActivity *obj;

  v4 = (CKContainer *)a3;
  obj = self;
  objc_sync_enter(obj);
  nullableContainer = obj->_nullableContainer;
  obj->_nullableContainer = v4;

  objc_sync_exit(obj);
}

- (BOOL)userRequestedBackupTask
{
  CKSchedulerActivity *v2;
  BOOL userRequestedBackupTask;

  v2 = self;
  objc_sync_enter(v2);
  userRequestedBackupTask = v2->_userRequestedBackupTask;
  objc_sync_exit(v2);

  return userRequestedBackupTask;
}

- (void)setUserRequestedBackupTask:(BOOL)a3
{
  CKSchedulerActivity *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_userRequestedBackupTask = a3;
  objc_sync_exit(obj);

}

- (NSArray)relatedApplicationBundleIdentifiers
{
  CKSchedulerActivity *v2;
  NSArray *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_relatedApplicationBundleIdentifiers;
  objc_sync_exit(v2);

  return v3;
}

- (void)setRelatedApplicationBundleIdentifiers:(id)a3
{
  CKSchedulerActivity *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSArray *relatedApplicationBundleIdentifiers;
  id v10;

  v10 = a3;
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend_CKDeepCopy(v10, v5, v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  relatedApplicationBundleIdentifiers = v4->_relatedApplicationBundleIdentifiers;
  v4->_relatedApplicationBundleIdentifiers = (NSArray *)v8;

  objc_sync_exit(v4);
}

- (void)setAdditionalXPCActivityCriteria:(id)a3
{
  uint64_t v3;
  id v5;
  xpc_object_t empty;
  const char *v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, id, void *);
  void *v14;
  id v15;

  if (a3)
  {
    v5 = a3;
    empty = xpc_dictionary_create_empty();
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = sub_18A752D70;
    v14 = &unk_1E1F63EF0;
    v9 = empty;
    v15 = v9;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v5, v7, (uint64_t)&v11, v8);

  }
  else
  {
    v9 = 0;
  }
  objc_msgSend_setXpcActivityCriteriaOverrides_(self, a2, (uint64_t)v9, v3, v9, v11, v12, v13, v14);

}

- (NSDictionary)additionalXPCActivityCriteria
{
  uint64_t v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD applier[4];
  id v12;

  objc_msgSend_xpcActivityCriteriaOverrides(self, a2, v2, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v4, v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    applier[0] = MEMORY[0x1E0C809B0];
    applier[1] = 3221225472;
    applier[2] = sub_18A752E6C;
    applier[3] = &unk_1E1F63EC8;
    v9 = v8;
    v12 = v9;
    xpc_dictionary_apply(v7, applier);

  }
  else
  {
    v9 = 0;
  }

  return (NSDictionary *)v9;
}

- (void)setXpcActivityCriteriaOverrides:(id)a3
{
  CKSchedulerActivity *v4;
  const _xpc_type_s *Class;
  OS_xpc_object *v6;
  OS_xpc_object *xpcActivityCriteriaOverrides;
  CKException *v8;
  const char *name;
  const char *v10;
  const char *v11;
  id v12;
  id object;

  object = a3;
  v4 = self;
  objc_sync_enter(v4);
  if (object)
  {
    Class = object_getClass(object);
    if (Class != (const _xpc_type_s *)MEMORY[0x1E0C812F8])
    {
      v8 = [CKException alloc];
      name = xpc_type_get_name(MEMORY[0x1E0C812F8]);
      v10 = xpc_type_get_name(Class);
      v12 = (id)objc_msgSend_initWithName_format_(v8, v11, *MEMORY[0x1E0C99778], (uint64_t)CFSTR("Tried to set invalid object for xpcActivityCriteriaOverrides. Expected %s, but received %s."), name, v10);
      objc_exception_throw(v12);
    }
    v6 = (OS_xpc_object *)xpc_copy(object);
    xpcActivityCriteriaOverrides = v4->_xpcActivityCriteriaOverrides;
    v4->_xpcActivityCriteriaOverrides = v6;
  }
  else
  {
    xpcActivityCriteriaOverrides = v4->_xpcActivityCriteriaOverrides;
    v4->_xpcActivityCriteriaOverrides = 0;
  }

  objc_sync_exit(v4);
}

- (OS_xpc_object)xpcActivityCriteriaOverrides
{
  CKSchedulerActivity *v2;
  OS_xpc_object *xpcActivityCriteriaOverrides;
  xpc_object_t v4;

  v2 = self;
  objc_sync_enter(v2);
  xpcActivityCriteriaOverrides = v2->_xpcActivityCriteriaOverrides;
  if (xpcActivityCriteriaOverrides)
    v4 = xpc_copy(xpcActivityCriteriaOverrides);
  else
    v4 = 0;
  objc_sync_exit(v2);

  return (OS_xpc_object *)v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CKSchedulerActivity *v4;
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
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
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
  xpc_object_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;

  v4 = [CKSchedulerActivity alloc];
  objc_msgSend_identifier(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerID(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend_priority(self, v13, v14, v15);
  v18 = objc_msgSend_initWithIdentifier_containerID_priority_(v4, v17, (uint64_t)v8, (uint64_t)v12, v16);

  *(_QWORD *)(v18 + 48) = objc_msgSend_expectedTransferSizeBytes(self, v19, v20, v21);
  objc_msgSend_earliestStartDate(self, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend_copy(v25, v26, v27, v28);
  v30 = *(void **)(v18 + 56);
  *(_QWORD *)(v18 + 56) = v29;

  objc_msgSend_xpcActivityCriteriaOverrides(self, v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v34;
  if (v34)
  {
    v39 = xpc_copy(v34);
    v40 = *(void **)(v18 + 16);
    *(_QWORD *)(v18 + 16) = v39;

  }
  *(_BYTE *)(v18 + 9) = objc_msgSend_shouldDefer(self, v35, v36, v37);
  objc_msgSend_ckXPCActivity(self, v41, v42, v43);
  v44 = objc_claimAutoreleasedReturnValue();
  v45 = *(void **)(v18 + 80);
  *(_QWORD *)(v18 + 80) = v44;

  *(_BYTE *)(v18 + 8) = objc_msgSend_userRequestedBackupTask(self, v46, v47, v48);
  objc_msgSend_relatedApplicationBundleIdentifiers(self, v49, v50, v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKDeepCopy(v52, v53, v54, v55);
  v56 = objc_claimAutoreleasedReturnValue();
  v57 = *(void **)(v18 + 24);
  *(_QWORD *)(v18 + 24) = v56;

  return (id)v18;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (BOOL)shouldDefer
{
  return self->_shouldDefer;
}

- (void)setShouldDefer:(BOOL)a3
{
  self->_shouldDefer = a3;
}

- (unint64_t)expectedTransferSizeBytes
{
  return self->_expectedTransferSizeBytes;
}

- (void)setExpectedTransferSizeBytes:(unint64_t)a3
{
  self->_expectedTransferSizeBytes = a3;
}

- (NSDate)earliestStartDate
{
  return (NSDate *)objc_getProperty(self, a2, 56, 1);
}

- (void)setEarliestStartDate:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (CKContainerID)containerID
{
  return self->_containerID;
}

- (void)setContainerID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (CKContainer)nullableContainer
{
  return self->_nullableContainer;
}

- (CKXPCActivity)ckXPCActivity
{
  return (CKXPCActivity *)objc_getProperty(self, a2, 80, 1);
}

- (void)setCkXPCActivity:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (BOOL)overrideRateLimiting
{
  return self->_overrideRateLimiting;
}

- (void)setOverrideRateLimiting:(BOOL)a3
{
  self->_overrideRateLimiting = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ckXPCActivity, 0);
  objc_storeStrong((id *)&self->_nullableContainer, 0);
  objc_storeStrong((id *)&self->_containerID, 0);
  objc_storeStrong((id *)&self->_earliestStartDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_relatedApplicationBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_xpcActivityCriteriaOverrides, 0);
}

@end

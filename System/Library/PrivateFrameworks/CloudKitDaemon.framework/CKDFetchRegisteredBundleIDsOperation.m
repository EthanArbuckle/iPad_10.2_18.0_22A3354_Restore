@implementation CKDFetchRegisteredBundleIDsOperation

- (id)_unitTestBundleIDsByContainerID:(id)a3
{
  uint64_t v3;
  const char *v4;
  id v5;
  void *v6;

  v3 = qword_1ED7026D0;
  v5 = a3;
  if (v3 != -1)
    dispatch_once(&qword_1ED7026D0, &unk_1E782E578);
  objc_msgSend_objectForKeyedSubscript_((void *)qword_1ED7026D8, v4, (uint64_t)v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CKDFetchRegisteredBundleIDsOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKDFetchRegisteredBundleIDsOperation;
  return -[CKDOperation initWithOperationInfo:container:](&v5, sel_initWithOperationInfo_container_, a3, a4);
}

- (id)activityCreate
{
  return _os_activity_create(&dword_1BE990000, "daemon/fetch-registered-bundle-ids", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (int)operationType
{
  return 244;
}

- (void)main
{
  void *v3;
  CKDFetchRegisteredBundleIDsURLRequest *v4;
  const char *v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t);
  void *v31;
  id v32;
  id v33;
  _QWORD v34[5];
  id v35;
  id v36;
  id from;
  _BYTE location[12];
  __int16 v39;
  CKDFetchRegisteredBundleIDsOperation *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v3 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v15 = v3;
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(self, v18, 1, 0, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKPropertiesStyleString(v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(self, v23, 0, 1, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKPropertiesStyleString(v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)location = 138544130;
    *(_QWORD *)&location[4] = v17;
    v39 = 2048;
    v40 = self;
    v41 = 2114;
    v42 = v22;
    v43 = 2112;
    v44 = v27;
    _os_log_debug_impl(&dword_1BE990000, v15, OS_LOG_TYPE_DEBUG, "Fetch registered bundleIDs operation <%{public}@: %p; %{public}@, %@> is starting",
      location,
      0x2Au);

  }
  v4 = [CKDFetchRegisteredBundleIDsURLRequest alloc];
  v6 = (void *)objc_msgSend_initWithOperation_(v4, v5, (uint64_t)self);
  objc_initWeak((id *)location, self);
  objc_initWeak(&from, v6);
  v7 = MEMORY[0x1E0C809B0];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = sub_1BEA09454;
  v34[3] = &unk_1E782E5A0;
  objc_copyWeak(&v35, (id *)location);
  objc_copyWeak(&v36, &from);
  v34[4] = self;
  objc_msgSend_setBundleIDsFetchedBlock_(v6, v8, (uint64_t)v34);
  v28 = v7;
  v29 = 3221225472;
  v30 = sub_1BEA096D0;
  v31 = &unk_1E782E468;
  objc_copyWeak(&v32, (id *)location);
  objc_copyWeak(&v33, &from);
  objc_msgSend_setCompletionBlock_(v6, v9, (uint64_t)&v28);
  objc_msgSend_setRequest_(self, v10, (uint64_t)v6, v28, v29, v30, v31);
  objc_msgSend_container(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_performRequest_(v13, v14, (uint64_t)v6);

  objc_destroyWeak(&v33);
  objc_destroyWeak(&v32);
  objc_destroyWeak(&v36);
  objc_destroyWeak(&v35);
  objc_destroyWeak(&from);
  objc_destroyWeak((id *)location);

}

- (NSArray)bundleIDs
{
  return self->_bundleIDs;
}

- (void)setBundleIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 448);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIDs, 0);
}

@end

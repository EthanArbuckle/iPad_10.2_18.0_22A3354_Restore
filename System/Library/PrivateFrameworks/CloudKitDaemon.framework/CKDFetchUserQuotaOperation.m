@implementation CKDFetchUserQuotaOperation

- (CKDFetchUserQuotaOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKDFetchUserQuotaOperation;
  return -[CKDDatabaseOperation initWithOperationInfo:container:](&v5, sel_initWithOperationInfo_container_, a3, a4);
}

- (id)activityCreate
{
  return _os_activity_create(&dword_1BE990000, "daemon/fetch-user-quota", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (int)operationType
{
  return 243;
}

- (void)main
{
  void *v3;
  CKDFetchUserQuotaURLRequest *v4;
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
  _QWORD v28[4];
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id from;
  _BYTE location[12];
  __int16 v36;
  CKDFetchUserQuotaOperation *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
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
    v36 = 2048;
    v37 = self;
    v38 = 2114;
    v39 = v22;
    v40 = 2112;
    v41 = v27;
    _os_log_debug_impl(&dword_1BE990000, v15, OS_LOG_TYPE_DEBUG, "Fetch user quota operation <%{public}@: %p; %{public}@, %@> is starting",
      location,
      0x2Au);

  }
  v4 = [CKDFetchUserQuotaURLRequest alloc];
  v6 = (void *)objc_msgSend_initWithOperation_(v4, v5, (uint64_t)self);
  objc_initWeak((id *)location, self);
  objc_initWeak(&from, v6);
  v7 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = sub_1BEAA1DC0;
  v31[3] = &unk_1E7832678;
  objc_copyWeak(&v32, (id *)location);
  objc_copyWeak(&v33, &from);
  objc_msgSend_setQuotaFetchedBlock_(v6, v8, (uint64_t)v31);
  v28[0] = v7;
  v28[1] = 3221225472;
  v28[2] = sub_1BEAA1FB4;
  v28[3] = &unk_1E782E468;
  objc_copyWeak(&v29, (id *)location);
  objc_copyWeak(&v30, &from);
  objc_msgSend_setCompletionBlock_(v6, v9, (uint64_t)v28);
  objc_msgSend_setRequest_(self, v10, (uint64_t)v6);
  objc_msgSend_container(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_performRequest_(v13, v14, (uint64_t)v6);

  objc_destroyWeak(&v30);
  objc_destroyWeak(&v29);
  objc_destroyWeak(&v33);
  objc_destroyWeak(&v32);
  objc_destroyWeak(&from);
  objc_destroyWeak((id *)location);

}

- (unint64_t)quotaAvailable
{
  return self->_quotaAvailable;
}

- (void)setQuotaAvailable:(unint64_t)a3
{
  self->_quotaAvailable = a3;
}

@end

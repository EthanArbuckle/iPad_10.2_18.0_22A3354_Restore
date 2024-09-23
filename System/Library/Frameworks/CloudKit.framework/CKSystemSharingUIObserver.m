@implementation CKSystemSharingUIObserver

+ (void)initialize
{
  objc_class *v2;
  uint64_t v3;

  v2 = (objc_class *)objc_opt_class();
  v3 = objc_opt_self();
  sub_18A5CEF4C(v3, v2, 0, 0, 0);
}

- (CKSystemSharingUIObserver)initWithContainer:(CKContainer *)container
{
  CKContainer *v5;
  id v6;
  id v7;
  objc_class *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  dispatch_queue_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  objc_super v25;

  v5 = container;
  v25.receiver = self;
  v25.super_class = (Class)CKSystemSharingUIObserver;
  v6 = -[CKSystemSharingUIObserver init](&v25, sel_init);
  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x1E0CB3940]);
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend_initWithFormat_(v7, v10, (uint64_t)CFSTR("com.apple.cloudkit.%@.%p"), v11, v9, v6);

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_initially_inactive(v13);
    v14 = objc_claimAutoreleasedReturnValue();

    dispatch_queue_attr_make_with_qos_class(v14, QOS_CLASS_UNSPECIFIED, 0);
    v15 = objc_claimAutoreleasedReturnValue();

    v19 = (const char *)objc_msgSend_UTF8String(v12, v16, v17, v18);
    v20 = dispatch_queue_create(v19, v15);
    v21 = (void *)*((_QWORD *)v6 + 3);
    *((_QWORD *)v6 + 3) = v20;

    dispatch_queue_set_specific(*((dispatch_queue_t *)v6 + 3), "com.apple.cloudkit.systemSharingUIObserver.callbackQueue", (void *)1, 0);
    dispatch_activate(*((dispatch_object_t *)v6 + 3));
    objc_storeStrong((id *)v6 + 4, container);
    objc_msgSend_registerSystemSharingUIObserver_(*((void **)v6 + 4), v22, (uint64_t)v6, v23);

  }
  return (CKSystemSharingUIObserver *)v6;
}

- (void)setSystemSharingUIDidSaveShareBlock:(void *)systemSharingUIDidSaveShareBlock
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  _QWORD block[5];
  id v12;

  v10 = systemSharingUIDidSaveShareBlock;
  if (!dispatch_get_specific("com.apple.cloudkit.systemSharingUIObserver.callbackQueue"))
  {
    objc_msgSend_callbackQueue(self, v4, v5, v6);
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_18A80E740;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v12 = v10;
    dispatch_sync(v9, block);

    v8 = v12;
    goto LABEL_5;
  }
  if (self->_systemSharingUIDidSaveShareBlock != v10)
  {
    v7 = (void *)objc_msgSend_copy(v10, v4, v5, v6);
    v8 = self->_systemSharingUIDidSaveShareBlock;
    self->_systemSharingUIDidSaveShareBlock = v7;
LABEL_5:

  }
}

- (void)systemSharingUIDidSaveShareBlock
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v7;
  void *v8;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void *(*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  if (dispatch_get_specific("com.apple.cloudkit.systemSharingUIObserver.callbackQueue"))
    return _Block_copy(self->_systemSharingUIDidSaveShareBlock);
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = sub_18A80E88C;
  v14 = sub_18A80E8B4;
  v15 = 0;
  objc_msgSend_callbackQueue(self, v3, v4, v5);
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_18A80E8BC;
  v9[3] = &unk_1E1F5F758;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(v7, v9);

  v8 = _Block_copy((const void *)v11[5]);
  _Block_object_dispose(&v10, 8);

  return v8;
}

- (void)setSystemSharingUIDidStopSharingBlock:(void *)systemSharingUIDidStopSharingBlock
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  _QWORD block[5];
  id v12;

  v10 = systemSharingUIDidStopSharingBlock;
  if (!dispatch_get_specific("com.apple.cloudkit.systemSharingUIObserver.callbackQueue"))
  {
    objc_msgSend_callbackQueue(self, v4, v5, v6);
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_18A80E9BC;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v12 = v10;
    dispatch_sync(v9, block);

    v8 = v12;
    goto LABEL_5;
  }
  if (self->_systemSharingUIDidStopSharingBlock != v10)
  {
    v7 = (void *)objc_msgSend_copy(v10, v4, v5, v6);
    v8 = self->_systemSharingUIDidStopSharingBlock;
    self->_systemSharingUIDidStopSharingBlock = v7;
LABEL_5:

  }
}

- (void)systemSharingUIDidStopSharingBlock
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v7;
  void *v8;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void *(*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  if (dispatch_get_specific("com.apple.cloudkit.systemSharingUIObserver.callbackQueue"))
    return _Block_copy(self->_systemSharingUIDidStopSharingBlock);
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = sub_18A80E88C;
  v14 = sub_18A80E8B4;
  v15 = 0;
  objc_msgSend_callbackQueue(self, v3, v4, v5);
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_18A80EB08;
  v9[3] = &unk_1E1F5F758;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(v7, v9);

  v8 = _Block_copy((const void *)v11[5]);
  _Block_object_dispose(&v10, 8);

  return v8;
}

- (void)handleSharingUIUpdatedShare:(id)a3 recordID:(id)a4 isDeleted:(BOOL)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  _QWORD block[5];
  id v21;
  id v22;
  id v23;
  BOOL v24;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_msgSend_callbackQueue(self, v13, v14, v15);
  v16 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18A80EC2C;
  block[3] = &unk_1E1F66788;
  block[4] = self;
  v21 = v10;
  v24 = a5;
  v22 = v11;
  v23 = v12;
  v17 = v12;
  v18 = v11;
  v19 = v10;
  dispatch_sync(v16, block);

}

- (void)_locked_handleSharingUIUpdatedShare:(id)a3 recordID:(id)a4 isDeleted:(BOOL)a5 error:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  __CFString *v15;
  __CFString *v16;
  __CFString *v17;
  NSObject *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void (**v26)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  const __CFString *v33;
  const __CFString *v34;
  const __CFString *v35;
  const __CFString *v36;
  const char *v37;
  const __CFString *v38;
  const __CFString *v39;
  const __CFString *v40;
  const __CFString *v41;
  const __CFString *v42;
  int v43;
  const __CFString *v44;
  __int16 v45;
  const __CFString *v46;
  __int16 v47;
  const __CFString *v48;
  __int16 v49;
  const __CFString *v50;
  uint64_t v51;

  v7 = a5;
  v51 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v15 = (__CFString *)a6;
  if (v11)
  {
    v16 = (__CFString *)v11;
  }
  else
  {
    objc_msgSend_recordID(v10, v12, v13, v14);
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v17 = v16;
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v18 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    v38 = CFSTR("NO");
    v43 = 138412802;
    v44 = v17;
    if (v7)
      v38 = CFSTR("YES");
    v45 = 2114;
    v46 = v38;
    v47 = 2112;
    v48 = v15;
    _os_log_debug_impl(&dword_18A5C5000, v18, OS_LOG_TYPE_DEBUG, "Handle sharing UI updated called with share: %@, deleted: %{public}@, error: %@", (uint8_t *)&v43, 0x20u);
  }
  if (!v7)
  {
    objc_msgSend_systemSharingUIDidSaveShareBlock(self, v19, v20, v21);
    v28 = objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      v26 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v28;
      objc_msgSend_CKClientSuitableError(v15, v29, v30, v31);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, __CFString *, id, void *))v26)[2](v26, v17, v10, v27);
      goto LABEL_12;
    }
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v32 = ck_log_facility_ck;
    if (!os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
LABEL_30:
      v26 = 0;
      goto LABEL_31;
    }
    v39 = CFSTR(" RecordID: ");
    if (!v17)
      v39 = &stru_1E1F66ED0;
    v43 = 138544130;
    v44 = v39;
    v40 = CFSTR(" Error: ");
    if (v17)
      v41 = v17;
    else
      v41 = &stru_1E1F66ED0;
    v45 = 2112;
    v46 = v41;
    if (!v15)
      v40 = &stru_1E1F66ED0;
    v47 = 2114;
    v48 = v40;
    if (v15)
      v42 = v15;
    else
      v42 = &stru_1E1F66ED0;
    v49 = 2112;
    v50 = v42;
    v37 = "Sharing UI observer received update but no systemSharingUIDidSaveShareBlock set.%{public}@%@%{public}@%@";
LABEL_46:
    _os_log_debug_impl(&dword_18A5C5000, v32, OS_LOG_TYPE_DEBUG, v37, (uint8_t *)&v43, 0x2Au);
    goto LABEL_30;
  }
  objc_msgSend_systemSharingUIDidStopSharingBlock(self, v19, v20, v21);
  v22 = objc_claimAutoreleasedReturnValue();
  if (!v22)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v32 = ck_log_facility_ck;
    if (!os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
      goto LABEL_30;
    v33 = CFSTR(" RecordID: ");
    if (!v17)
      v33 = &stru_1E1F66ED0;
    v43 = 138544130;
    v44 = v33;
    v34 = CFSTR(" Error: ");
    if (v17)
      v35 = v17;
    else
      v35 = &stru_1E1F66ED0;
    v45 = 2112;
    v46 = v35;
    if (!v15)
      v34 = &stru_1E1F66ED0;
    v47 = 2114;
    v48 = v34;
    if (v15)
      v36 = v15;
    else
      v36 = &stru_1E1F66ED0;
    v49 = 2112;
    v50 = v36;
    v37 = "Sharing UI observer received delete but no systemSharingUIDidStopSharingBlock set.%{public}@%@%{public}@%@";
    goto LABEL_46;
  }
  v26 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v22;
  objc_msgSend_CKClientSuitableError(v15, v23, v24, v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (*)(void (**)(_QWORD, _QWORD, _QWORD, _QWORD), __CFString *, void *))v26[2])(v26, v17, v27);
LABEL_12:

LABEL_31:
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (CKContainer)container
{
  return self->_container;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong(&self->_systemSharingUIDidStopSharingBlock, 0);
  objc_storeStrong(&self->_systemSharingUIDidSaveShareBlock, 0);
}

@end

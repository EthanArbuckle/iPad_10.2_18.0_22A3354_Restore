@implementation CKDProcessScopedClientProxy

- (BOOL)processIsAttached
{
  uint64_t v2;

  objc_msgSend_pid(self, a2, v2);
  return CKPIDIsStillAlive();
}

- (int)pid
{
  return self->_pid;
}

- (id)issueSandboxExtensionForItem:(id)a3 error:(id *)a4
{
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  char *v18;
  const char *v19;
  uint64_t v20;
  _QWORD *v21;
  os_log_t *v22;
  void *v23;
  id v24;
  size_t v25;
  const char *v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  int *v39;
  char *v40;
  const char *v41;
  void *v42;
  os_log_t v43;
  id v44;
  NSObject *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  NSObject *v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  NSObject *v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  uint8_t buf[4];
  void *v77;
  __int16 v78;
  void *v79;
  __int16 v80;
  id v81;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  objc_msgSend_path(a3, a2, (uint64_t)a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fileSystemRepresentation(v6, v7, v8);
  objc_msgSend_clientConnection(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_xpcConnection(v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v14;
  if (v14)
    objc_msgSend_auditToken(v14, v15, v16);
  v18 = (char *)sandbox_extension_issue_file_to_process();

  if (!v18)
  {
    v29 = (void *)MEMORY[0x1E0C94FF8];
    v30 = *MEMORY[0x1E0C94B20];
    objc_msgSend_clientEntitlements(self, v19, v20);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_applicationBundleID(v31, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKSanitizedPath(v6, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = *__error();
    v39 = __error();
    v40 = strerror(*v39);
    objc_msgSend_errorWithDomain_code_path_format_(v29, v41, v30, 1000, v6, CFSTR("Failed to issue sandbox extension for \"%@\" at %@: %d (%s)"), v34, v37, v38, v40);
    v28 = (id)objc_claimAutoreleasedReturnValue();

    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v42 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      v56 = v42;
      objc_msgSend_clientEntitlements(self, v57, v58);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_applicationBundleID(v59, v60, v61);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKSanitizedPath(v6, v63, v64);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v77 = v62;
      v78 = 2112;
      v79 = v65;
      v80 = 2112;
      v81 = v28;
      _os_log_error_impl(&dword_1BE990000, v56, OS_LOG_TYPE_ERROR, "Failed to issue sandbox extension for applicationBundleID=%@ and path=%@: %@", buf, 0x20u);

      if (a4)
        goto LABEL_14;
    }
    else if (a4)
    {
LABEL_14:
      v28 = objc_retainAutorelease(v28);
      v27 = 0;
      *a4 = v28;
      goto LABEL_21;
    }
LABEL_20:
    v27 = 0;
    goto LABEL_21;
  }
  v21 = (_QWORD *)MEMORY[0x1E0C95300];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v22 = (os_log_t *)MEMORY[0x1E0C952B0];
  v23 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v46 = v23;
    objc_msgSend_clientEntitlements(self, v47, v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_applicationBundleID(v49, v50, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKSanitizedPath(v6, v53, v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v77 = v52;
    v78 = 2112;
    v79 = v55;
    _os_log_debug_impl(&dword_1BE990000, v46, OS_LOG_TYPE_DEBUG, "Issued sandbox extension token for \"%{public}@\" at %@", buf, 0x16u);

  }
  v24 = objc_alloc(MEMORY[0x1E0CB3940]);
  v25 = strlen(v18);
  v27 = (void *)objc_msgSend_initWithBytesNoCopy_length_encoding_freeWhenDone_(v24, v26, (uint64_t)v18, v25, 4, 1);
  if (!v27)
  {
    if (*v21 != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v43 = *v22;
    if (os_log_type_enabled(*v22, OS_LOG_TYPE_ERROR))
    {
      v66 = v43;
      objc_msgSend_clientEntitlements(self, v67, v68);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_applicationBundleID(v69, v70, v71);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKSanitizedPath(v6, v73, v74);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v77 = v72;
      v78 = 2112;
      v79 = v75;
      _os_log_error_impl(&dword_1BE990000, v66, OS_LOG_TYPE_ERROR, "Failed to allocate string for sandbox extension for applicationBundleID=%{public}@ and path=%@", buf, 0x16u);

    }
    free(v18);
    v28 = 0;
    goto LABEL_20;
  }
  v28 = 0;
LABEL_21:
  v44 = v27;

  return v44;
}

- (CKDProcessScopedClientProxy)initWithClientConnection:(id)a3
{
  id v4;
  CKDProcessScopedClientProxy *v5;
  CKDProcessScopedClientProxy *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  id v18;
  uint64_t pid;
  const char *v20;
  uint64_t v21;
  CKEntitlements *clientEntitlements;
  id v23;
  const char *v24;
  uint64_t v25;
  NSString *processBinaryName;
  id v27;
  const char *v28;
  const __CFString *v29;
  uint64_t v30;
  NSString *procName;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  int hasVFSOpenByIDEntitlement;
  const char *v38;
  uint64_t v39;
  _QWORD *v40;
  os_log_t *v41;
  NSObject *v42;
  NSString *v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  int hasAllowAccessDuringBuddyEntitlement;
  const char *v48;
  uint64_t v49;
  NSObject *v50;
  NSString *v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  int hasAllowPackagesEntitlement;
  NSObject *v56;
  NSString *v57;
  __int128 v59;
  __int128 v60;
  objc_super v61;
  uint8_t buf[4];
  NSString *v63;
  __int128 buffer;
  __int128 v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v61.receiver = self;
  v61.super_class = (Class)CKDProcessScopedClientProxy;
  v5 = -[CKDProcessScopedClientProxy init](&v61, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_clientConnection, v4);
    v59 = 0u;
    v60 = 0u;
    objc_msgSend_xpcConnection(v4, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v9;
    if (v9)
    {
      objc_msgSend_auditToken(v9, v10, v11);
    }
    else
    {
      v59 = 0u;
      v60 = 0u;
    }

    objc_msgSend_xpcConnection(v4, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_pid = objc_msgSend_processIdentifier(v15, v16, v17);

    v18 = objc_alloc(MEMORY[0x1E0C94D80]);
    pid = v6->_pid;
    buffer = v59;
    v65 = v60;
    v21 = objc_msgSend_initWithAuditToken_pid_(v18, v20, (uint64_t)&buffer, pid);
    clientEntitlements = v6->_clientEntitlements;
    v6->_clientEntitlements = (CKEntitlements *)v21;

    buffer = v59;
    v65 = v60;
    v6->_sandboxed = sandbox_check_by_audit_token() != 0;
    v6->_hasValidatedEntitlementsTernary = -1;
    if (proc_name(v6->_pid, &buffer, 0x40u) >= 1)
    {
      v23 = objc_alloc(MEMORY[0x1E0CB3940]);
      v25 = objc_msgSend_initWithCString_encoding_(v23, v24, (uint64_t)&buffer, 4);
      processBinaryName = v6->_processBinaryName;
      v6->_processBinaryName = (NSString *)v25;

    }
    v27 = objc_alloc(MEMORY[0x1E0CB3940]);
    v29 = (const __CFString *)v6->_processBinaryName;
    if (!v29)
      v29 = CFSTR("???");
    v30 = objc_msgSend_initWithFormat_(v27, v28, (uint64_t)CFSTR("%@(%d)"), v29, v6->_pid);
    procName = v6->_procName;
    v6->_procName = (NSString *)v30;

    objc_msgSend_clientEntitlements(v6, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    hasVFSOpenByIDEntitlement = objc_msgSend_hasVFSOpenByIDEntitlement(v34, v35, v36);

    v40 = (_QWORD *)MEMORY[0x1E0C95300];
    v41 = (os_log_t *)MEMORY[0x1E0C952B0];
    if (hasVFSOpenByIDEntitlement)
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v42 = *v41;
      if (os_log_type_enabled(*v41, OS_LOG_TYPE_INFO))
      {
        v43 = v6->_procName;
        *(_DWORD *)buf = 138543362;
        v63 = v43;
        _os_log_impl(&dword_1BE990000, v42, OS_LOG_TYPE_INFO, "Client \"%{public}@\" has entitlement to use openByID", buf, 0xCu);
      }
    }
    objc_msgSend_clientEntitlements(v6, v38, v39);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    hasAllowAccessDuringBuddyEntitlement = objc_msgSend_hasAllowAccessDuringBuddyEntitlement(v44, v45, v46);

    if (hasAllowAccessDuringBuddyEntitlement)
    {
      if (*v40 != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v50 = *v41;
      if (os_log_type_enabled(*v41, OS_LOG_TYPE_INFO))
      {
        v51 = v6->_procName;
        *(_DWORD *)buf = 138543362;
        v63 = v51;
        _os_log_impl(&dword_1BE990000, v50, OS_LOG_TYPE_INFO, "Client \"%{public}@\" has entitlement to allow access during buddy.", buf, 0xCu);
      }
    }
    objc_msgSend_clientEntitlements(v6, v48, v49);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    hasAllowPackagesEntitlement = objc_msgSend_hasAllowPackagesEntitlement(v52, v53, v54);

    if (hasAllowPackagesEntitlement)
    {
      if (*v40 != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v56 = *v41;
      if (os_log_type_enabled(*v41, OS_LOG_TYPE_INFO))
      {
        v57 = v6->_procName;
        *(_DWORD *)buf = 138543362;
        v63 = v57;
        _os_log_impl(&dword_1BE990000, v56, OS_LOG_TYPE_INFO, "Client \"%{public}@\" has entitlement to use packages. Good luck!", buf, 0xCu);
      }
    }
  }

  return v6;
}

- (CKEntitlements)clientEntitlements
{
  return self->_clientEntitlements;
}

- (CKDXPCConnection)clientConnection
{
  return (CKDXPCConnection *)objc_loadWeakRetained((id *)&self->_clientConnection);
}

- (unsigned)clientSDKVersion
{
  return self->_clientSDKVersion;
}

- (NSString)procName
{
  return self->_procName;
}

- (void)setProcessScopedClientProxyCreator:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void)setIsClientMainBundleAppleExecutable:(BOOL)a3
{
  self->_isClientMainBundleAppleExecutable = a3;
}

- (void)setClientSDKVersion:(unsigned int)a3
{
  self->_clientSDKVersion = a3;
}

- (CKXPCProcessScopedClient)processScopedClientProxyCreator
{
  return (CKXPCProcessScopedClient *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)processBinaryName
{
  return self->_processBinaryName;
}

- (void)noteSystemIsAvailable
{
  objc_msgSend_getProcessScopedClientProxySynchronous_errorHandler_clientProxyHandler_(self, a2, 0, &unk_1E782F138, &unk_1E782F178);
}

- (BOOL)isClientMainBundleAppleExecutable
{
  return self->_isClientMainBundleAppleExecutable;
}

- (void)getProcessScopedClientProxySynchronous:(BOOL)a3 errorHandler:(id)a4 clientProxyHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  id v10;
  id v11;
  const char *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  BOOL v16;

  v6 = a3;
  v8 = a4;
  v9 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_1BE9C6B88;
  v13[3] = &unk_1E782F038;
  v16 = v6;
  v14 = v9;
  v15 = v8;
  v10 = v8;
  v11 = v9;
  objc_msgSend__getProcessScopedClientProxyCreatorSynchronous_completionHandler_(self, v12, v6, v13);

}

- (void)_getProcessScopedClientProxyCreatorSynchronous:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  void (**v6)(id, void *, _QWORD);
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  _QWORD v15[5];
  void (**v16)(id, void *, _QWORD);

  v4 = a3;
  v6 = (void (**)(id, void *, _QWORD))a4;
  objc_msgSend_processScopedClientProxyCreator(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend_processScopedClientProxyCreator(self, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v12, 0);

  }
  else
  {
    objc_msgSend_clientConnection(self, v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = sub_1BE9C0510;
    v15[3] = &unk_1E782F060;
    v15[4] = self;
    v16 = v6;
    objc_msgSend_getProcessScopedClientProxyCreatorSynchronous_completionHandler_(v13, v14, v4, v15);

  }
}

- (id)CKPropertiesDescription
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  const char *v15;
  void *v16;

  objc_msgSend_arrayWithCapacity_(MEMORY[0x1E0C99DE8], a2, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_procName(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v4, v8, (uint64_t)CFSTR("name=%@"), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v10, (uint64_t)v9);

  if (objc_msgSend_isSandboxed(self, v11, v12))
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v13, (uint64_t)CFSTR("flags=sandboxed"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v3, v15, (uint64_t)v14);

  }
  objc_msgSend_componentsJoinedByString_(v3, v13, (uint64_t)CFSTR(", "));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)description
{
  return (id)((uint64_t (*)(CKDProcessScopedClientProxy *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
}

- (id)getFileMetadataWithFileHandle:(id)a3 openInfo:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  NSObject *v15;
  const char *v16;
  dispatch_time_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  _QWORD v25[4];
  id v26;
  id v27;
  NSObject *v28;
  uint64_t *v29;
  uint64_t *v30;
  _QWORD v31[4];
  NSObject *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;

  v8 = a3;
  v9 = a4;
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = sub_1BE9BAF38;
  v44 = sub_1BE9BAD50;
  v45 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = sub_1BE9BAF38;
  v38 = sub_1BE9BAD50;
  v39 = 0;
  v10 = dispatch_group_create();
  dispatch_group_enter(v10);
  v11 = (void *)MEMORY[0x1C3B83E24]();
  voucher_copy_without_importance();
  voucher_adopt();
  v12 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = sub_1BEA1E5F8;
  v31[3] = &unk_1E782EB60;
  v33 = &v40;
  v32 = v10;
  v25[0] = v12;
  v25[1] = 3221225472;
  v25[2] = sub_1BEA1E644;
  v25[3] = &unk_1E782F0B0;
  v13 = v8;
  v26 = v13;
  v14 = v9;
  v27 = v14;
  v29 = &v34;
  v30 = &v40;
  v15 = v32;
  v28 = v15;
  objc_msgSend_getProcessScopedClientProxySynchronous_errorHandler_clientProxyHandler_(self, v16, 0, v31, v25);

  objc_autoreleasePoolPop(v11);
  v17 = dispatch_time(0, 150000000000);
  if (dispatch_group_wait(v15, v17))
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v18, *MEMORY[0x1E0C94B20], 1000, CFSTR("Daemon timed out waiting for adopter process to get metadata for %@"), v14);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v41[5];
    v41[5] = v19;

    v21 = 0;
    if (a5)
      *a5 = objc_retainAutorelease((id)v41[5]);
  }
  else
  {
    if (!v35[5])
    {
      if (!v41[5])
      {
        objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v18, *MEMORY[0x1E0C94B20], 1000, CFSTR("Adopter failed to fetch metadata for %@"), v14);
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = (void *)v41[5];
        v41[5] = v22;

      }
      if (a5)
        *a5 = objc_retainAutorelease((id)v41[5]);
    }
    v21 = (id)v35[5];
  }

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v40, 8);

  return v21;
}

- (void)handleSignificantIssueBehavior:(unint64_t)a3 reason:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  _QWORD v9[4];
  id v10;
  unint64_t v11;

  v6 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1BEA1E7F0;
  v9[3] = &unk_1E782F118;
  v10 = v6;
  v11 = a3;
  v7 = v6;
  objc_msgSend_getProcessScopedClientProxySynchronous_errorHandler_clientProxyHandler_(self, v8, 1, &unk_1E782F0F0, v9);

}

- (BOOL)hasValidatedEntitlements
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  __SecTask *v11;
  NSObject *v12;
  NSObject *v13;
  audit_token_t v15;
  uint8_t buf[4];
  CKDProcessScopedClientProxy *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (self->_hasValidatedEntitlementsTernary == -1)
  {
    objc_msgSend_clientConnection(self, a2, v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_xpcConnection(v4, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v7;
    if (v7)
      objc_msgSend_auditToken(v7, v8, v9);
    else
      memset(&v15, 0, sizeof(v15));
    v11 = SecTaskCreateWithAuditToken(0, &v15);

    if (v11)
    {
      self->_hasValidatedEntitlementsTernary = SecTaskEntitlementsValidated();
      if (!CKBoolFromCKTernary())
        self->_hasValidatedEntitlementsTernary = (~SecTaskGetCodeSignStatus(v11) & 0x24000001) == 0;
      if ((CKBoolFromCKTernary() & 1) == 0)
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v13 = *MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v17 = self;
          _os_log_impl(&dword_1BE990000, v13, OS_LOG_TYPE_INFO, "Binary has invalid entitlements for %@", buf, 0xCu);
        }
      }
      CFRelease(v11);
    }
    else
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v12 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1BE990000, v12, OS_LOG_TYPE_ERROR, "Unable to get SecTask for connection to determine entitlement validity", buf, 2u);
      }
    }
  }
  return CKBoolFromCKTernary();
}

- (BOOL)canOpenFileAtURL:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  id v23;
  const char *v24;
  uint64_t v25;
  BOOL v26;

  v4 = a3;
  objc_msgSend_clientConnection(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_xpcConnection(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10
    && objc_msgSend_isFileURL(v4, v11, v12)
    && (objc_msgSend_path(v4, v13, v14),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v18 = objc_msgSend_length(v15, v16, v17),
        v15,
        v18))
  {
    objc_msgSend_auditToken(v10, v19, v20);
    objc_msgSend_path(v4, v21, v22);
    v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend_fileSystemRepresentation(v23, v24, v25);
    v26 = sandbox_check_by_audit_token() == 0;

  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (BOOL)isSandboxed
{
  return self->_sandboxed;
}

- (void)setClientConnection:(id)a3
{
  objc_storeWeak((id *)&self->_clientConnection, a3);
}

- (NSDictionary)connectionEntitlements
{
  return self->_connectionEntitlements;
}

- (void)setConnectionEntitlements:(id)a3
{
  objc_storeStrong((id *)&self->_connectionEntitlements, a3);
}

- (int64_t)hasValidatedEntitlementsTernary
{
  return self->_hasValidatedEntitlementsTernary;
}

- (void)setHasValidatedEntitlementsTernary:(int64_t)a3
{
  self->_hasValidatedEntitlementsTernary = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionEntitlements, 0);
  objc_storeStrong((id *)&self->_processScopedClientProxyCreator, 0);
  objc_storeStrong((id *)&self->_clientEntitlements, 0);
  objc_destroyWeak((id *)&self->_clientConnection);
  objc_storeStrong((id *)&self->_procName, 0);
  objc_storeStrong((id *)&self->_processBinaryName, 0);
}

@end

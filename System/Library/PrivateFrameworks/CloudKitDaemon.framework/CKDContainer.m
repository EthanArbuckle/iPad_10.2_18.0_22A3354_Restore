@implementation CKDContainer

- (id)_TCCEventSubscriptionIdentifier
{
  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("com.apple.cloudkit.container.%p"), self);
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)_loadApplicationContainerPathAndType
{
  CKDDirectoryContext *v3;
  const char *v4;
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  __CFBundle *Unique;
  __CFBundle *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSString *v22;
  NSString *applicationVersion;
  __CFString *v24;
  const char *v25;
  uint64_t v26;
  __CFString *v27;
  __CFString *v28;
  const char *v29;
  uint64_t v30;
  __CFString *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  __CFString *v35;
  char v36;
  NSURL *v37;
  NSURL *applicationIcon;
  NSString *applicationDisplayName;
  NSString *v40;
  NSString *v41;
  NSObject *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  id v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v3 = [CKDDirectoryContext alloc];
  v5 = (void *)objc_msgSend_initWithContainer_(v3, v4, (uint64_t)self);
  objc_msgSend_setDirectoryContext_(self, v6, (uint64_t)v5);

  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v7 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v42 = v7;
    objc_msgSend_ckShortDescription(self, v43, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_directoryContext(self, v46, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v51 = v45;
    v52 = 2112;
    v53 = v48;
    _os_log_debug_impl(&dword_1BE990000, v42, OS_LOG_TYPE_DEBUG, "Container %{public}@ using directories %@", buf, 0x16u);

  }
  objc_msgSend_applicationBundleID(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0;
  v12 = (id)objc_msgSend_applicationDataContainerDirectoryForBundleID_outApplicationBinaryBundleURL_outAdopterProcessType_(CKDContainer, v11, (uint64_t)v10, &v49, &self->_adopterProcessType);
  v13 = v49;

  if (!v13)
  {
    v17 = 0;
    goto LABEL_15;
  }
  Unique = (__CFBundle *)_CFBundleCreateUnique();
  v17 = Unique;
  if (!Unique)
  {
LABEL_15:
    v36 = 1;
    goto LABEL_19;
  }
  CFBundleGetValueForInfoDictionaryKey(Unique, (CFStringRef)*MEMORY[0x1E0C9AAC8]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  CFBundleGetValueForInfoDictionaryKey(v17, (CFStringRef)*MEMORY[0x1E0C9AE88]);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  if (v18)
    v21 = v18;
  else
    v21 = (void *)v19;
  objc_storeStrong((id *)&self->_applicationDisplayName, v21);
  CFBundleGetValueForInfoDictionaryKey(v17, (CFStringRef)*MEMORY[0x1E0C9AE90]);
  v22 = (NSString *)objc_claimAutoreleasedReturnValue();
  applicationVersion = self->_applicationVersion;
  self->_applicationVersion = v22;

  CFBundleGetValueForInfoDictionaryKey(v17, (CFStringRef)*MEMORY[0x1E0C9AAD8]);
  v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v27 = v24;
    objc_msgSend_pathExtension(v24, v25, v26);
    v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v31 = v28;
    if (v28 && objc_msgSend_length(v28, v29, v30))
    {
      objc_msgSend_stringByDeletingPathExtension(v27, v32, v33);
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = v27;
      v27 = (__CFString *)v34;
    }
    else
    {
      v35 = v31;
      v31 = CFSTR("icns");
    }

    v37 = (NSURL *)CFBundleCopyResourceURL(v17, v27, v31, 0);
    applicationIcon = self->_applicationIcon;
    self->_applicationIcon = v37;

  }
  v36 = 0;
LABEL_19:
  applicationDisplayName = self->_applicationDisplayName;
  if (applicationDisplayName)
  {
    v40 = applicationDisplayName;
  }
  else
  {
    objc_msgSend_applicationBundleID(self, v14, v15);
    v40 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  v41 = self->_applicationDisplayName;
  self->_applicationDisplayName = v40;

  if ((v36 & 1) == 0)
    CFRelease(v17);

}

- (BOOL)_isContainerAuthorizedForOperation:(id)a3 error:(id *)a4
{
  const char *v7;
  uint64_t v8;
  id v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  int hasMasqueradingEntitlement;
  const char *v43;
  uint64_t v44;
  NSObject *v45;
  BOOL v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  id v51;
  void *v52;
  unsigned int (**v53)(_QWORD, _QWORD);
  NSObject *v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  void *v61;
  const char *v62;
  void *v63;
  const char *v64;
  _QWORD aBlock[5];
  id v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t (*v71)(uint64_t, uint64_t);
  void (*v72)(uint64_t);
  id v73;
  uint8_t buf[4];
  CKDContainer *v75;
  __int16 v76;
  void *v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (!v9)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v7, v8);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v61, v62, (uint64_t)a2, self, CFSTR("CKDContainer.m"), 1421, CFSTR("Expected non-nil operation for proxy %@"), self);

  }
  objc_msgSend_operationInfo(v9, v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_applicationBundleIdentifierOverrideForContainerAccess(v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v13;
  if (v13)
  {
    v17 = v13;
  }
  else
  {
    objc_msgSend_applicationID(self, v14, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_applicationBundleIdentifierOverrideForContainerAccess(v18, v19, v20);
    v17 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend_operationInfo(v9, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_applicationBundleIdentifierOverrideForNetworkAttribution(v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v26;
  if (v26)
  {
    v30 = v26;
  }
  else
  {
    objc_msgSend_applicationID(self, v27, v28);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_applicationBundleIdentifierOverrideForNetworkAttribution(v31, v32, v33);
    v30 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend_sourceApplicationSecondaryIdentifier(v9, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = 0;
  v69 = &v68;
  v70 = 0x3032000000;
  v71 = sub_1BE9BAF48;
  v72 = sub_1BE9BAD58;
  v73 = 0;
  objc_msgSend_entitlements(self, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  hasMasqueradingEntitlement = objc_msgSend_hasMasqueradingEntitlement(v39, v40, v41);

  if (hasMasqueradingEntitlement)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v45 = *MEMORY[0x1E0C952B0];
    v46 = 1;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v75 = self;
      _os_log_impl(&dword_1BE990000, v45, OS_LOG_TYPE_INFO, "Giving %@ blanket access to any container", buf, 0xCu);
    }
  }
  else
  {
    objc_msgSend_entitlements(self, v43, v44);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_clientPrefixEntitlement(v47, v48, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_1BEA21730;
    aBlock[3] = &unk_1E782F350;
    aBlock[4] = self;
    v51 = v50;
    v66 = v51;
    v67 = &v68;
    v52 = _Block_copy(aBlock);
    v53 = (unsigned int (**)(_QWORD, _QWORD))v52;
    if ((!v17 || ((*((uint64_t (**)(void *, id))v52 + 2))(v52, v17) & 1) != 0)
      && (!v30 || ((unsigned int (**)(_QWORD, id))v53)[2](v53, v30)))
    {
      if (!v36)
      {

        v46 = 1;
        goto LABEL_30;
      }
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v54 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v75 = self;
        v76 = 2112;
        v77 = v36;
        _os_log_error_impl(&dword_1BE990000, v54, OS_LOG_TYPE_ERROR, "Container %@ is not allowed to set an operation sourceApplicationSecondaryIdentifier to %@", buf, 0x16u);
      }
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v55, *MEMORY[0x1E0C947D8], 8, CFSTR("Container %@ is not allowed to set an operation sourceApplicationSecondaryIdentifier to %@ without an entitlement"), self, v36);
      v56 = objc_claimAutoreleasedReturnValue();
      v57 = (void *)v69[5];
      v69[5] = v56;

    }
    if (!v69[5])
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v58, v59);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v63, v64, (uint64_t)a2, self, CFSTR("CKDContainer.m"), 1475, CFSTR("Expected non-nil error for operation %@"), v9);

    }
    v46 = 0;
    if (a4)
      *a4 = objc_retainAutorelease((id)v69[5]);
  }
LABEL_30:
  _Block_object_dispose(&v68, 8);

  return v46;
}

- (NSString)applicationBundleIdentifierForNetworkAttribution
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;

  objc_msgSend_applicationID(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_applicationBundleIdentifierOverrideForNetworkAttribution(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend_associatedApplicationBundleID(self, v8, v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend_applicationBundleID(self, v10, v11);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return (NSString *)v7;
}

- (BOOL)hasValidatedEntitlements
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  __SecTask *v16;
  NSObject *v17;
  NSObject *v18;
  char v19;
  audit_token_t v21;
  uint8_t buf[4];
  CKDContainer *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend_processScopedClientProxy(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_processIsAttached(v4, v5, v6) && self->_hasValidatedEntitlementsTernary == -1)
  {
    objc_msgSend_clientConnection(v4, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_xpcConnection(v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v12;
    if (v12)
      objc_msgSend_auditToken(v12, v13, v14);
    else
      memset(&v21, 0, sizeof(v21));
    v16 = SecTaskCreateWithAuditToken(0, &v21);

    if (v16)
    {
      self->_hasValidatedEntitlementsTernary = SecTaskEntitlementsValidated();
      if (!CKBoolFromCKTernary())
        self->_hasValidatedEntitlementsTernary = (~SecTaskGetCodeSignStatus(v16) & 0x24000001) == 0;
      if ((CKBoolFromCKTernary() & 1) == 0)
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v18 = *MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v23 = self;
          _os_log_impl(&dword_1BE990000, v18, OS_LOG_TYPE_INFO, "Binary has invalid entitlements for %@", buf, 0xCu);
        }
      }
      CFRelease(v16);
    }
    else
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v17 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1BE990000, v17, OS_LOG_TYPE_ERROR, "Unable to get SecTask for connection to determine entitlement validity", buf, 2u);
      }
    }
  }
  v19 = CKBoolFromCKTernary();

  return v19;
}

- (NSString)applicationVersion
{
  return self->_applicationVersion;
}

- (NSString)applicationBundleIdentifierForContainerAccess
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;

  objc_msgSend_applicationID(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_applicationBundleIdentifierOverrideForContainerAccess(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend_associatedApplicationBundleID(self, v8, v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend_applicationBundleID(self, v10, v11);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return (NSString *)v7;
}

- (NSString)containerScopedUserID
{
  return (NSString *)objc_getProperty(self, a2, 440, 1);
}

- (NSString)orgAdminUserID
{
  return (NSString *)objc_getProperty(self, a2, 448, 1);
}

- (id)sandboxExtensions
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  BOOL v22;
  int v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  id v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t i;
  void *v58;
  void *v59;
  char v60;
  __CFString *v61;
  __CFString *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  int v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  NSObject *v75;
  const char *v76;
  const char *v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  void *v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  void *v97;
  const char *v98;
  NSObject *v99;
  const char *v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  __CFString *v105;
  NSObject *v106;
  const char *v107;
  uint64_t v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  const char *v112;
  uint64_t v113;
  const __CFString *v114;
  int hasDataContainer;
  const __CFString *v116;
  const char *v117;
  uint64_t v118;
  void *v119;
  int v120;
  void *v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  uint8_t buf[4];
  void *v127;
  __int16 v128;
  const __CFString *v129;
  __int16 v130;
  const __CFString *v131;
  _BYTE v132[128];
  _QWORD v133[5];

  v133[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend_lock(self->_sandboxExtensionsLock, a2, v2);
  objc_msgSend_cachedSandboxExtensions(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend_processScopedClientProxy(self, v7, v8);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_opt_new();
    objc_msgSend_directoryContext(self, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_containerDirectory(v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v121 = (void *)v12;
    if (v12)
      v22 = v19 == 0;
    else
      v22 = 0;
    v23 = v22;
    objc_msgSend_directoryContext(self, v20, v21);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_temporaryDirectory(v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v133[0] = v27;
    objc_msgSend_directoryContext(self, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_fileDownloadDirectory(v30, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v133[1] = v33;
    objc_msgSend_directoryContext(self, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_frameworkCachesDirectory(v36, v37, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v133[2] = v39;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v40, (uint64_t)v133, 3);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    v120 = v23;
    if (v23 == 1)
    {
      objc_msgSend_directoryContext(self, v42, v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_packageStagingDirectory(v44, v45, v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_arrayByAddingObject_(v41, v48, (uint64_t)v47);
      v49 = objc_claimAutoreleasedReturnValue();

      v41 = (void *)v49;
    }
    v124 = 0u;
    v125 = 0u;
    v122 = 0u;
    v123 = 0u;
    v50 = v41;
    v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(v50, v51, (uint64_t)&v122, v132, 16);
    if (v52)
    {
      v55 = v52;
      v56 = *(_QWORD *)v123;
      while (2)
      {
        for (i = 0; i != v55; ++i)
        {
          if (*(_QWORD *)v123 != v56)
            objc_enumerationMutation(v50);
          v58 = *(void **)(*((_QWORD *)&v122 + 1) + 8 * i);
          objc_msgSend_path(v58, v53, v54);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = CKCreateDirectoryAtPath();
          v61 = (__CFString *)0;
          v62 = v61;
          if ((v60 & 1) == 0)
          {
            if (*MEMORY[0x1E0C95300] != -1)
              dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
            v79 = (void *)*MEMORY[0x1E0C952B0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
            {
              v99 = v79;
              objc_msgSend_applicationBundleID(self, v100, v101);
              v102 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_CKSanitizedPath(v58, v103, v104);
              v105 = (__CFString *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v127 = v102;
              v128 = 2112;
              v129 = v105;
              v130 = 2112;
              v131 = v62;
              _os_log_error_impl(&dword_1BE990000, v99, OS_LOG_TYPE_ERROR, "Failed to create directory for \"%@\" at %@: %@", buf, 0x20u);

            }
            objc_msgSend_unlock(self->_sandboxExtensionsLock, v80, v81);

            v9 = 0;
            return v9;
          }

        }
        v55 = objc_msgSend_countByEnumeratingWithState_objects_count_(v50, v53, (uint64_t)&v122, v132, 16);
        if (v55)
          continue;
        break;
      }
    }

    v63 = (void *)*MEMORY[0x1E0C952F8];
    v64 = *MEMORY[0x1E0C95300];
    if (v121)
    {
      v65 = v13;
      if (v64 != -1)
        dispatch_once(MEMORY[0x1E0C95300], v63);
      v66 = v120;
      v67 = (void *)*MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
      {
        v106 = v67;
        objc_msgSend_ckShortDescription(self, v107, v108);
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_isSandboxed(v121, v110, v111))
          v114 = CFSTR("YES");
        else
          v114 = CFSTR("NO");
        hasDataContainer = objc_msgSend_hasDataContainer(self, v112, v113);
        *(_DWORD *)buf = 138412802;
        if (hasDataContainer)
          v116 = CFSTR("YES");
        else
          v116 = CFSTR("NO");
        v127 = v109;
        v128 = 2112;
        v129 = v114;
        v130 = 2112;
        v131 = v116;
        _os_log_debug_impl(&dword_1BE990000, v106, OS_LOG_TYPE_DEBUG, "Sandbox extensions needed for %@, proxy sandboxed: %@, hasDataContainer: %@", buf, 0x20u);

      }
      objc_msgSend_directoryContext(self, v68, v69);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_fileDownloadDirectory(v70, v71, v72);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_issueSandboxExtensionForItem_error_(v121, v74, (uint64_t)v73, 0);
      v75 = objc_claimAutoreleasedReturnValue();

      if (v75)
        objc_msgSend_addObject_(v65, v76, (uint64_t)v75);
    }
    else
    {
      v65 = v13;
      if (v64 != -1)
        dispatch_once(MEMORY[0x1E0C95300], v63);
      v66 = v120;
      v83 = (void *)*MEMORY[0x1E0C952B0];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
        goto LABEL_35;
      v75 = v83;
      objc_msgSend_ckShortDescription(self, v117, v118);
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v127 = v119;
      _os_log_debug_impl(&dword_1BE990000, v75, OS_LOG_TYPE_DEBUG, "Sandbox extensions not needed for %@", buf, 0xCu);

    }
LABEL_35:
    if (v66)
    {
      objc_msgSend_directoryContext(self, v77, v78);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_frameworkCachesDirectory(v84, v85, v86);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_issueSandboxExtensionForItem_error_(v121, v88, (uint64_t)v87, 0);
      v89 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_directoryContext(self, v90, v91);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_packageStagingDirectory(v92, v93, v94);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_issueSandboxExtensionForItem_error_(v121, v96, (uint64_t)v95, 0);
      v97 = (void *)objc_claimAutoreleasedReturnValue();

      if (v89)
        objc_msgSend_addObject_(v65, v98, (uint64_t)v89);
      if (v97)
        objc_msgSend_addObject_(v65, v98, (uint64_t)v97);

    }
    objc_msgSend_setCachedSandboxExtensions_(self, v77, (uint64_t)v65);

  }
  objc_msgSend_cachedSandboxExtensions(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unlock(self->_sandboxExtensionsLock, v10, v11);
  return v9;
}

- (CKDDirectoryContext)directoryContext
{
  return self->_directoryContext;
}

- (NSArray)cachedSandboxExtensions
{
  return self->_cachedSandboxExtensions;
}

- (void)fetchConfigurationForOperation:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  id v11;
  const char *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  objc_msgSend_sharedManager(CKDServerConfigurationManager, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_1BE9B8874;
  v13[3] = &unk_1E782F288;
  objc_copyWeak(&v15, &location);
  v11 = v7;
  v14 = v11;
  objc_msgSend_configurationForOperation_completionHandler_(v10, v12, (uint64_t)v6, v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

- (BOOL)preferAnonymousRequests
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  int v11;

  objc_msgSend_account(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_accountType(v4, v5, v6) == 1 || !objc_msgSend_canAuthWithCloudKit(self, v7, v8))
    LOBYTE(v11) = 1;
  else
    v11 = objc_msgSend_canAccessAccount(self, v9, v10) ^ 1;

  return v11;
}

- (id)baseURLForServerType:(int64_t)a3 partitionType:(int64_t)a4
{
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  int v52;
  void *v53;
  __int16 v54;
  CKDContainer *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 1:
      if (a4 == 2)
      {
        objc_msgSend_publicShareServiceURL(self, a2, a3);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend_account(self, a2, a3);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_privateShareServiceURL(v16, v17, v18);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v5, v6);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_customShareServiceBaseURL(v19, v20, v21);
      v22 = objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      if (a4 == 2)
      {
        objc_msgSend_publicDeviceServiceURL(self, a2, a3);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend_account(self, a2, a3);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_privateDeviceServiceURL(v29, v30, v31);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v10, v11);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_customDeviceServiceBaseURL(v19, v32, v33);
      v22 = objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      if (a4 == 2)
      {
        objc_msgSend_publicCodeServiceURL(self, a2, a3);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend_account(self, a2, a3);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_privateCodeServiceURL(v34, v35, v36);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v12, v13);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_customCodeServiceBaseURL(v19, v37, v38);
      v22 = objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      if (a4 == 2)
      {
        objc_msgSend_publicMetricsServiceURL(self, a2, a3);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend_account(self, a2, a3);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_privateMetricsServiceURL(v39, v40, v41);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v14, v15);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_customMetricsServiceBaseURL(v19, v42, v43);
      v22 = objc_claimAutoreleasedReturnValue();
      break;
    default:
      if (a4 == 2)
      {
        objc_msgSend_publicCloudDBURL(self, a2, a3);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend_account(self, a2, a3);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_privateCloudDBURL(v24, v25, v26);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v8, v9);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_customCloudDBBaseURL(v19, v27, v28);
      v22 = objc_claimAutoreleasedReturnValue();
      break;
  }
  v44 = (void *)v22;
  objc_msgSend__urlBySettingCustomBaseURL_onURL_(self, v23, v22, v7);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v45)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v46 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      v48 = v46;
      objc_msgSend_account(self, v49, v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = 138412546;
      v53 = v51;
      v54 = 2112;
      v55 = self;
      _os_log_error_impl(&dword_1BE990000, v48, OS_LOG_TYPE_ERROR, "Couldn't pull url from backing account %@ or container %@", (uint8_t *)&v52, 0x16u);

    }
  }
  return v45;
}

- (id)_urlBySettingCustomBaseURL:(id)a3 onURL:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  NSObject *v22;
  const char *v23;
  uint64_t v24;
  id v25;
  int v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v8 = v6;
  if (v5 && v6)
  {
    objc_msgSend_componentsWithURL_resolvingAgainstBaseURL_(MEMORY[0x1E0CB3998], v7, (uint64_t)v6, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_scheme(v5, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setScheme_(v9, v13, (uint64_t)v12);

    objc_msgSend_host(v5, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setHost_(v9, v17, (uint64_t)v16);

    objc_msgSend_port(v5, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setPort_(v9, v21, (uint64_t)v20);

    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v22 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      v27 = 138412290;
      v28 = v5;
      _os_log_debug_impl(&dword_1BE990000, v22, OS_LOG_TYPE_DEBUG, "Using custom url override of %@", (uint8_t *)&v27, 0xCu);
    }
    objc_msgSend_URL(v9, v23, v24);
    v25 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v25 = v6;
  }

  return v25;
}

- (NSURL)publicCloudDBURL
{
  return (NSURL *)objc_getProperty(self, a2, 400, 1);
}

- (NSURL)publicMetricsServiceURL
{
  return (NSURL *)objc_getProperty(self, a2, 432, 1);
}

- (id)applicationBundleIdentifierForTCC
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  const char *v13;
  uint64_t v14;

  objc_msgSend_applicationID(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_applicationBundleIdentifierOverrideForTCC(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v7;
  if (v7)
  {
    v11 = v7;
  }
  else
  {
    objc_msgSend_applicationID(self, v8, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_applicationBundleIdentifier(v12, v13, v14);
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (BOOL)allowsCellularAccess
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  char isDataclassEnabledForCellular;

  objc_msgSend_containerID(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_specialContainerType(v4, v5, v6);

  if (!v7)
    return 1;
  objc_msgSend_containerID(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_representativeDataclass(v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend_account(self, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    isDataclassEnabledForCellular = objc_msgSend_isDataclassEnabledForCellular_(v16, v17, (uint64_t)v13);

  }
  else
  {
    isDataclassEnabledForCellular = 1;
  }

  return isDataclassEnabledForCellular;
}

- (id)CKShortDescriptionRedact:(BOOL)a3
{
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_containerID(self, a2, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ckShortDescription(v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_applicationID(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v4, v12, (uint64_t)CFSTR("containerID=%@, applicationID=%@"), v8, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (NSString)applicationBundleID
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_applicationID(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_applicationBundleIdentifier(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (CKDApplicationID)applicationID
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_appContainerTuple(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_applicationID(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (CKDApplicationID *)v6;
}

- (CKContainerID)containerID
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_appContainerTuple(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerID(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (CKContainerID *)v6;
}

- (CKDAppContainerTuple)appContainerTuple
{
  return (CKDAppContainerTuple *)objc_getProperty(self, a2, 304, 1);
}

- (int64_t)_lockedHasTCCAuthorization:(BOOL)a3
{
  _BOOL4 v3;
  int64_t hasTCCAuthorizationTernary;
  void *v7;
  const char *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  const char *v25;
  const char *v26;
  void *v27;
  NSObject *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  NSObject *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  NSObject **v41;
  _QWORD *v42;
  void *v43;
  NSObject *v44;
  NSObject *v45;
  NSObject *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  NSObject *v50;
  NSObject *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  NSObject *v55;
  NSObject *v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint8_t v65[128];
  uint8_t buf[4];
  uint64_t v67;
  uint64_t v68;

  v3 = a3;
  v68 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_tccAuthQueue);
  if ((CKIsRunningInSyncBubble() & 1) != 0)
    return 1;
  hasTCCAuthorizationTernary = self->_hasTCCAuthorizationTernary;
  if (hasTCCAuthorizationTernary == 1)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v27 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEFAULT))
    {
      v28 = v27;
      objc_msgSend_ckShortDescription(self, v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v67 = (uint64_t)v31;
      _os_log_impl(&dword_1BE990000, v28, OS_LOG_TYPE_DEFAULT, "Found cached TCC approval for container %{public}@", buf, 0xCu);

    }
    return 1;
  }
  if (hasTCCAuthorizationTernary)
  {
    if (hasTCCAuthorizationTernary != -1)
      return hasTCCAuthorizationTernary;
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v7 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEFAULT))
    {
      v10 = v7;
      objc_msgSend_ckShortDescription(self, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v67 = (uint64_t)v13;
      _os_log_impl(&dword_1BE990000, v10, OS_LOG_TYPE_DEFAULT, "Consulting TCC for access for container %@...", buf, 0xCu);

    }
    objc_msgSend_applicationBundleIdentifierForTCC(self, v8, v9);
    v60 = objc_claimAutoreleasedReturnValue();
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v14 = (id)TCCAccessCopyInformationForBundleId();
    v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v61, v65, 16);
    if (v16)
    {
      v18 = v16;
      v19 = *(_QWORD *)v62;
      v20 = (uint64_t *)MEMORY[0x1E0DB10B8];
      v21 = (uint64_t *)MEMORY[0x1E0DB1148];
LABEL_13:
      v22 = 0;
      while (1)
      {
        if (*(_QWORD *)v62 != v19)
          objc_enumerationMutation(v14);
        v23 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v22);
        objc_msgSend_objectForKeyedSubscript_(v23, v17, *v20);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend_isEqualToString_(v24, v25, *v21) & 1) != 0)
          break;

        if (v18 == ++v22)
        {
          v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v61, v65, 16);
          if (v18)
            goto LABEL_13;
          goto LABEL_19;
        }
      }
      objc_msgSend_objectForKeyedSubscript_(v23, v26, *MEMORY[0x1E0DB10A8]);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v37)
        goto LABEL_34;
      objc_msgSend_BOOLValue(v37, v38, v39);
      v40 = CKTernaryFromBOOL();
      v41 = (NSObject **)MEMORY[0x1E0C952B0];
      v42 = (_QWORD *)MEMORY[0x1E0C95300];
      if (v40 == -1)
      {
        v43 = (void *)v60;
        goto LABEL_47;
      }
      hasTCCAuthorizationTernary = v40;
      v43 = (void *)v60;
      if (v40)
      {
        if (v40 == 1)
          goto LABEL_40;
      }
      else
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v55 = *v41;
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          v56 = v55;
          objc_msgSend_ckShortDescription(self, v57, v58);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v67 = (uint64_t)v59;
          _os_log_impl(&dword_1BE990000, v56, OS_LOG_TYPE_DEFAULT, "TCC REJECTED access for container %{public}@", buf, 0xCu);

        }
        hasTCCAuthorizationTernary = 0;
      }
      goto LABEL_52;
    }
LABEL_19:

LABEL_34:
    v42 = (_QWORD *)MEMORY[0x1E0C95300];
    if (v3)
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v43 = (void *)v60;
      v41 = (NSObject **)MEMORY[0x1E0C952B0];
      v44 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v67 = v60;
        _os_log_impl(&dword_1BE990000, v44, OS_LOG_TYPE_INFO, "Setting un-initialized TCC access for bundle identifier override '%{public}@'", buf, 0xCu);
      }
      v37 = 0;
      if (TCCAccessSetForBundleId())
      {
LABEL_40:
        if (*v42 != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v45 = *v41;
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          v46 = v45;
          objc_msgSend_ckShortDescription(self, v47, v48);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v67 = (uint64_t)v49;
          _os_log_impl(&dword_1BE990000, v46, OS_LOG_TYPE_DEFAULT, "TCC approved access for container %{public}@", buf, 0xCu);

        }
        hasTCCAuthorizationTernary = 1;
LABEL_52:
        self->_hasTCCAuthorizationTernary = hasTCCAuthorizationTernary;

        return hasTCCAuthorizationTernary;
      }
    }
    else
    {
      v37 = 0;
      v43 = (void *)v60;
      v41 = (NSObject **)MEMORY[0x1E0C952B0];
    }
LABEL_47:
    if (*v42 != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v50 = *v41;
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      v51 = v50;
      objc_msgSend_ckShortDescription(self, v52, v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v67 = (uint64_t)v54;
      _os_log_impl(&dword_1BE990000, v51, OS_LOG_TYPE_DEFAULT, "TCC has no entry for container %{public}@", buf, 0xCu);

    }
    hasTCCAuthorizationTernary = -1;
    goto LABEL_52;
  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v32 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEFAULT))
  {
    v33 = v32;
    objc_msgSend_ckShortDescription(self, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v67 = (uint64_t)v36;
    _os_log_impl(&dword_1BE990000, v33, OS_LOG_TYPE_DEFAULT, "Found cached TCC rejection for container %{public}@", buf, 0xCu);

  }
  return 0;
}

- (id)ckShortDescription
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_CKShortDescriptionRedact_, 0);
}

- (void)_reloadAccount:(BOOL)a3
{
  _BOOL4 v3;
  _opaque_pthread_rwlock_t *p_rwAccountLock;
  const char *v6;
  const char *v7;
  uint64_t v8;
  os_log_t *v9;
  NSObject *v10;
  CKDAccount *account;
  CKDAccount **p_account;
  CKDPCSCache *v13;
  CKDPCSCache *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  int isEqualToString;
  const char *v29;
  uint64_t v30;
  CKDAccount *v31;
  const char *v32;
  uint64_t v33;
  uint64_t inited;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  int v40;
  const char *v41;
  uint64_t v42;
  CKDAccount *v43;
  const char *v44;
  uint64_t v45;
  CKDContainer *v46;
  CKDAccount *v47;
  const char *v48;
  uint64_t v49;
  os_log_t v50;
  NSObject *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  CKDPCSCache *v57;
  CKDPCSCache *v58;
  os_log_t *v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  CKDPCSManager *pcsManager;
  const char *v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  CKDPCSCache *pcsCache;
  void *v69;
  CKDPCSCache *v70;
  os_log_t *v71;
  _opaque_pthread_rwlock_t *v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  const char *v77;
  char v78;
  CKDAccount *v79;
  const char *v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  CKDPCSCache *v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  const char *v97;
  uint64_t v98;
  os_log_t v99;
  const char *v100;
  uint64_t v101;
  CKDPCSCache *v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  id v106;
  const char *v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  NSObject *v111;
  const char *v112;
  uint64_t v113;
  void *v114;
  const char *v115;
  uint64_t v116;
  void *v117;
  const char *v118;
  void *v119;
  const char *v120;
  CKDAppContainerAccountTuple *v121;
  const char *v122;
  uint64_t v123;
  void *v124;
  const char *v125;
  uint64_t v126;
  void *v127;
  const char *v128;
  void *v129;
  const char *v130;
  void *v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  const char *v135;
  uint64_t v136;
  void *v137;
  void *v138;
  const char *v139;
  uint64_t v140;
  void *v141;
  const char *v142;
  uint64_t v143;
  CKDAccount *v144;
  const char *v145;
  uint64_t v146;
  void *v147;
  const char *v148;
  os_log_t *v149;
  void *v150;
  const char *v151;
  uint64_t v152;
  void *v153;
  const char *v154;
  uint64_t v155;
  CKDAccount *v156;
  const char *v157;
  uint64_t v158;
  void *v159;
  const char *v160;
  uint64_t v161;
  void *v162;
  const char *v163;
  void *v164;
  const char *v165;
  uint64_t v166;
  void *v167;
  CKDAccount *v168;
  const char *v169;
  uint64_t v170;
  CKDAccount *v171;
  void *v172;
  const char *v173;
  uint64_t v174;
  void *v175;
  const char *v176;
  NSObject *v177;
  const char *v178;
  uint64_t v179;
  CKDContainer *v180;
  CKDAccount **v181;
  _opaque_pthread_rwlock_t *v182;
  _BOOL4 v183;
  void *v184;
  _QWORD v185[4];
  CKDPCSCache *v186;
  uint8_t buf[4];
  CKDContainer *v188;
  __int16 v189;
  CKDContainer *v190;
  __int16 v191;
  void *v192;
  __int16 v193;
  void *v194;
  uint64_t v195;

  v3 = a3;
  v195 = *MEMORY[0x1E0C80C00];
  p_rwAccountLock = &self->rwAccountLock;
  pthread_rwlock_wrlock(&self->rwAccountLock);
  objc_msgSend_setCachedEnvironment_(self, v6, -1);
  v9 = (os_log_t *)MEMORY[0x1E0C952B0];
  v183 = v3;
  if (v3)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v10 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_INFO))
    {
      account = self->_account;
      *(_DWORD *)buf = 134218242;
      v188 = self;
      v189 = 2112;
      v190 = (CKDContainer *)account;
      _os_log_impl(&dword_1BE990000, v10, OS_LOG_TYPE_INFO, "Reloading the account for container %p - the previous account was %@", buf, 0x16u);
    }
  }
  p_account = &self->_account;
  objc_msgSend_accountID(self->_account, v7, v8);
  v13 = (CKDPCSCache *)objc_claimAutoreleasedReturnValue();
  v14 = self->_pcsCache;
  objc_msgSend_deviceContext(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_testServer(v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v184 = v20;
  if (v20)
    LODWORD(v20) = objc_msgSend_useLiveServer(v20, v21, v22) ^ 1;
  objc_msgSend_accountOverrideInfo(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_email(v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v26, v27, *MEMORY[0x1E0C95320]);

  if (isEqualToString)
  {
    v31 = [CKDAccount alloc];
    inited = objc_msgSend_initAnonymousAccount(v31, v32, v33);
    goto LABEL_12;
  }
  objc_msgSend_accountOverrideInfo(self, v29, v30);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_email(v35, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend_isEqualToString_(v38, v39, *MEMORY[0x1E0C953A0]);

  if (v40)
  {
    v43 = [CKDAccount alloc];
    inited = objc_msgSend_initPrimaryAccount(v43, v44, v45);
LABEL_12:
    v46 = (CKDContainer *)inited;
    if (inited)
      goto LABEL_14;
    goto LABEL_13;
  }
  if (!(_DWORD)v20)
  {
    objc_msgSend_accountOverrideInfo(self, v41, v42);
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_email(v131, v132, v133);
    v134 = objc_claimAutoreleasedReturnValue();
    if (v134)
    {
      v137 = (void *)v134;
      objc_msgSend_accountOverrideInfo(self, v135, v136);
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_password(v138, v139, v140);
      v141 = (void *)objc_claimAutoreleasedReturnValue();

      if (v141)
      {
        v144 = [CKDAccount alloc];
        objc_msgSend_accountOverrideInfo(self, v145, v146);
        v147 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = (CKDContainer *)objc_msgSend_initExplicitCredentialsAccountWithAccountOverrideInfo_(v144, v148, (uint64_t)v147);

        if (!v46)
          goto LABEL_13;
        goto LABEL_14;
      }
    }
    else
    {

    }
    v149 = v9;
    objc_msgSend_accountOverrideInfo(self, v142, v143);
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_accountID(v150, v151, v152);
    v153 = (void *)objc_claimAutoreleasedReturnValue();

    if (v153)
    {
      v156 = [CKDAccount alloc];
      objc_msgSend_accountOverrideInfo(self, v157, v158);
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_accountID(v159, v160, v161);
      v162 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = (CKDContainer *)objc_msgSend_initWithAccountID_(v156, v163, (uint64_t)v162);

    }
    else
    {
      objc_msgSend_accountOverrideInfo(self, v154, v155);
      v164 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_altDSID(v164, v165, v166);
      v167 = (void *)objc_claimAutoreleasedReturnValue();

      v168 = [CKDAccount alloc];
      v171 = v168;
      if (v167)
      {
        objc_msgSend_accountOverrideInfo(self, v169, v170);
        v172 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_altDSID(v172, v173, v174);
        v175 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = (CKDContainer *)objc_msgSend_initWithAltDSID_(v171, v176, (uint64_t)v175);

      }
      else
      {
        v46 = (CKDContainer *)objc_msgSend_initPrimaryAccount(v168, v169, v170);
      }
    }
    v9 = v149;
    if (!v46)
      goto LABEL_13;
    goto LABEL_14;
  }
  v79 = [CKDAccount alloc];
  objc_msgSend_deviceContext(self, v80, v81);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_testDevice(v82, v83, v84);
  v182 = p_rwAccountLock;
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_daemonAccount(v85, v86, v87);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceContext(self, v89, v90);
  v91 = v14;
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_testDevice(v92, v93, v94);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = (CKDContainer *)objc_msgSend_initMockAccountWithTestAccount_testDevice_(v79, v96, (uint64_t)v88, v95);

  v9 = (os_log_t *)MEMORY[0x1E0C952B0];
  v14 = v91;

  p_rwAccountLock = v182;
  if (!v46)
  {
LABEL_13:
    v47 = [CKDAccount alloc];
    v46 = (CKDContainer *)objc_msgSend_initAnonymousAccount(v47, v48, v49);
  }
LABEL_14:
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v50 = *v9;
  if (os_log_type_enabled(*v9, OS_LOG_TYPE_INFO))
  {
    v51 = v50;
    objc_msgSend_containerID(self, v52, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_accountOverrideInfo(self, v55, v56);
    v57 = v13;
    v58 = v14;
    v59 = v9;
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v188 = v46;
    v189 = 2048;
    v190 = self;
    v191 = 2112;
    v192 = v54;
    v193 = 2112;
    v194 = v60;
    _os_log_impl(&dword_1BE990000, v51, OS_LOG_TYPE_INFO, "Loaded account %@ for CKDContainer %p, containerID %@ with account override info:%@", buf, 0x2Au);

    v9 = v59;
    v14 = v58;
    v13 = v57;
    p_account = &self->_account;

  }
  objc_storeStrong((id *)p_account, v46);
  if (self->_pcsManager && objc_msgSend_shouldUsePCSEncryption(self, v61, v62))
  {
    pcsManager = self->_pcsManager;
    v185[0] = MEMORY[0x1E0C809B0];
    v185[1] = 3221225472;
    v185[2] = sub_1BEA20854;
    v185[3] = &unk_1E782EA40;
    v186 = v14;
    objc_msgSend_updateAccount_clearPCSCacheHandler_(pcsManager, v64, (uint64_t)v46, v185);

  }
  objc_msgSend_accountID(v46, v61, v62);
  v65 = objc_claimAutoreleasedReturnValue();
  pcsCache = v13;
  if (v13 == (CKDPCSCache *)v65)
    goto LABEL_38;
  v69 = (void *)v65;
  if (v13)
  {
    v181 = p_account;
    v70 = v14;
    v71 = v9;
    v72 = p_rwAccountLock;
    objc_msgSend_accountID(v46, v66, v67);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    if (v75)
    {
      objc_msgSend_accountID(v46, v73, v74);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = objc_msgSend_isEqualToString_(v13, v77, (uint64_t)v76);

    }
    else
    {
      v78 = 0;
    }

    p_rwAccountLock = v72;
    v9 = v71;
    v14 = v70;
    p_account = v181;
  }
  else
  {
    v78 = 0;
  }

  if ((v78 & 1) == 0 && v183)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v99 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEBUG))
    {
      v177 = v99;
      objc_msgSend_accountID(v46, v178, v179);
      v180 = (CKDContainer *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v188 = (CKDContainer *)v13;
      v189 = 2112;
      v190 = v180;
      _os_log_debug_impl(&dword_1BE990000, v177, OS_LOG_TYPE_DEBUG, "The account identifier changed from %@ to %@ - posting an account changed notification and cancelling all outstanding operations", buf, 0x16u);

    }
    objc_msgSend_cancelAllOperations(self, v100, v101);
    pcsCache = self->_pcsCache;
    self->_pcsCache = 0;
LABEL_38:

  }
  v102 = v14;
  objc_msgSend_entitlements(self, v97, v98);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_apsEnvironmentEntitlement(v103, v104, v105);
  v106 = (id)objc_claimAutoreleasedReturnValue();

  if (!v106
    || !objc_msgSend_compare_options_(v106, v107, *MEMORY[0x1E0C94968], 1)
    && (objc_msgSend_serverPreferredPushEnvironment(*p_account, v108, v109),
        v110 = objc_claimAutoreleasedReturnValue(),
        v106,
        (v106 = (id)v110) == 0))
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v111 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1BE990000, v111, OS_LOG_TYPE_DEBUG, "No APS environment set. Falling back to production.", buf, 2u);
    }
    v106 = (id)*MEMORY[0x1E0CFE130];
  }
  objc_msgSend_setResolvedAPSEnvironmentString_(self, v108, (uint64_t)v106);
  objc_msgSend_containerID(self, v112, v113);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_accountID(self->_account, v115, v116);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_gatekeeperForContainerID_accountID_(CKDZoneGatekeeper, v118, (uint64_t)v114, v117);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setGatekeeper_(self, v120, (uint64_t)v119);

  v121 = [CKDAppContainerAccountTuple alloc];
  objc_msgSend_appContainerTuple(self, v122, v123);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_accountID(self->_account, v125, v126);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v129 = (void *)objc_msgSend_initWithAppContainerTuple_accountID_(v121, v128, (uint64_t)v124, v127);

  objc_msgSend__writeAdopterMetadataToCache_(self, v130, (uint64_t)v129);
  pthread_rwlock_unlock(p_rwAccountLock);

}

- (CKAccountOverrideInfo)accountOverrideInfo
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;

  objc_msgSend_options(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_accountOverrideInfo(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v7;
  if (v7)
  {
    v11 = v7;
  }
  else
  {
    objc_msgSend_deviceContext(self, v8, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_testDevice(v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_accountOverrideInfo(v15, v16, v17);
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (CKAccountOverrideInfo *)v11;
}

- (CKContainerOptions)options
{
  return (CKContainerOptions *)objc_getProperty(self, a2, 320, 1);
}

- (int64_t)_accountStatus
{
  uint64_t v2;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  char v8;
  const char *v9;
  uint64_t v10;
  int64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  NSObject *v20;
  void *v21;
  int v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend_accountStatusWorkloop(self, a2, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  objc_msgSend_applicationBundleID(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = sub_1BE9B3540(v7, self);

  if ((v8 & 1) != 0)
  {
    v11 = 2;
  }
  else
  {
    objc_msgSend_account(self, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend_accountType(v12, v13, v14);

    if (v15 == 1)
    {
      v11 = 3;
    }
    else if (objc_msgSend_canAccessAccount(self, v16, v17))
    {
      v11 = 1;
    }
    else
    {
      v11 = 3;
    }
  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v18 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v20 = v18;
    CKStringFromAccountStatus();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138543362;
    v23 = v21;
    _os_log_debug_impl(&dword_1BE990000, v20, OS_LOG_TYPE_DEBUG, "Account status is %{public}@", (uint8_t *)&v22, 0xCu);

  }
  return v11;
}

- (OS_dispatch_workloop)accountStatusWorkloop
{
  return self->_accountStatusWorkloop;
}

- (CKEntitlements)entitlements
{
  return (CKEntitlements *)objc_getProperty(self, a2, 312, 1);
}

- (CKDAccount)account
{
  uint64_t v2;
  const char *v5;
  uint64_t v6;
  void *v7;
  void *v9;
  const char *v10;

  objc_msgSend_accountOrNil(self, a2, v2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v5, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v9, v10, (uint64_t)a2, self, CFSTR("CKDContainer.m"), 615, CFSTR("Container %@ had an unexpectedly-nil account ivar"), self);

  }
  return (CKDAccount *)v7;
}

- (CKDLogicalDeviceContext)deviceContext
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  CKDLogicalDeviceContext *deviceContext;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  CKDLogicalDeviceContext *v12;
  CKDLogicalDeviceContext *v13;
  CKDLogicalDeviceContext *v14;
  const char *v15;
  uint64_t v16;
  CKDTestServerProtocol *v17;
  CKDTestServerProtocol *testServer;
  CKDLogicalDeviceContext *v19;
  const char *v20;
  uint64_t v21;

  objc_msgSend_lock(self->_deviceContextLock, a2, v2);
  deviceContext = self->_deviceContext;
  if (!deviceContext)
  {
    if (*MEMORY[0x1E0C95280])
    {
      objc_msgSend_options(self, v4, v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_testDeviceReferenceProtocol(v7, v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_deviceContextForTestDeviceReference_(CKDLogicalDeviceContext, v11, (uint64_t)v10);
      v12 = (CKDLogicalDeviceContext *)objc_claimAutoreleasedReturnValue();
      v13 = self->_deviceContext;
      self->_deviceContext = v12;

    }
    else
    {
      objc_msgSend_defaultContext(CKDLogicalDeviceContext, v4, v5);
      v14 = (CKDLogicalDeviceContext *)objc_claimAutoreleasedReturnValue();
      v7 = self->_deviceContext;
      self->_deviceContext = v14;
    }

    objc_msgSend_testServer(self->_deviceContext, v15, v16);
    v17 = (CKDTestServerProtocol *)objc_claimAutoreleasedReturnValue();
    testServer = self->_testServer;
    self->_testServer = v17;

    deviceContext = self->_deviceContext;
  }
  v19 = deviceContext;
  objc_msgSend_unlock(self->_deviceContextLock, v20, v21);
  return v19;
}

- (id)accountOrNil
{
  _opaque_pthread_rwlock_t *p_rwAccountLock;
  CKDAccount *v4;

  p_rwAccountLock = &self->rwAccountLock;
  pthread_rwlock_rdlock(&self->rwAccountLock);
  v4 = self->_account;
  pthread_rwlock_unlock(p_rwAccountLock);
  return v4;
}

- (int64_t)hasTCCAuthorization:(BOOL)a3
{
  _BOOL8 v3;
  const char *v5;
  uint64_t v6;
  int64_t HasTCCAuthorization;
  NSObject *v8;
  _QWORD block[6];
  BOOL v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v3 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  if (dispatch_get_specific("com.apple.cloudkit.containerTCCQueue"))
  {
    HasTCCAuthorization = objc_msgSend__lockedHasTCCAuthorization_(self, v5, v3);
    v13[3] = HasTCCAuthorization;
  }
  else
  {
    objc_msgSend_tccAuthQueue(self, v5, v6);
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1BE99DFE8;
    block[3] = &unk_1E782F3C0;
    block[4] = self;
    block[5] = &v12;
    v11 = v3;
    dispatch_sync(v8, block);

    HasTCCAuthorization = v13[3];
  }
  _Block_object_dispose(&v12, 8);
  return HasTCCAuthorization;
}

- (OS_dispatch_queue)tccAuthQueue
{
  return self->_tccAuthQueue;
}

- (void)accountInfoWithCompletionHandler:(id)a3
{
  const char *v4;
  uint64_t v5;
  id v6;
  void *v7;
  const char *v8;
  _QWORD v9[5];
  id v10;

  v6 = a3;
  if (v6)
  {
    objc_msgSend_uncancellableOperationQueue(self, v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1BE99CDC0;
    v9[3] = &unk_1E782F4D0;
    v9[4] = self;
    v10 = v6;
    objc_msgSend_addOperationWithBlock_(v7, v8, (uint64_t)v9);

  }
}

- (void)importantUserIDsWithCompletionHandler:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  id v8;
  const char *v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  objc_msgSend_uncancellableOperationQueue(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1BE9B3320;
  v10[3] = &unk_1E782F4D0;
  v10[4] = self;
  v11 = v4;
  v8 = v4;
  objc_msgSend_addOperationWithBlock_(v7, v9, (uint64_t)v10);

}

- (NSOperationQueue)uncancellableOperationQueue
{
  return self->_uncancellableOperationQueue;
}

- (void)linkWithClientContainer:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  char v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  _QWORD v21[5];
  id v22;

  v4 = a3;
  objc_msgSend_clientContainers(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v7);
  objc_msgSend_clientContainers(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_containsObject_(v10, v11, (uint64_t)v4);

  if ((v12 & 1) != 0)
  {
    objc_sync_exit(v7);

  }
  else
  {
    objc_msgSend_clientContainers(self, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v15, v16, (uint64_t)v4);

    objc_sync_exit(v7);
    objc_msgSend_uncancellableOperationQueue(self, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = sub_1BE99ACB0;
    v21[3] = &unk_1E782EE20;
    v21[4] = self;
    v22 = v4;
    objc_msgSend_addOperationWithBlock_(v19, v20, (uint64_t)v21);

  }
}

- (NSHashTable)clientContainers
{
  return self->_clientContainers;
}

+ (CKDContainer)containerWithAppContainerTuple:(id)a3 processScopedClientProxy:(id)a4 logicalDeviceScopedClientProxy:(id)a5 containerEntitlements:(id)a6 containerOptions:(id)a7 sharedContainerTable:(id)a8
{
  id v14;
  id v15;
  id v16;
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
  void *v27;
  void *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  char isEqual;
  CKDContainer *v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  _BOOL4 v44;
  const char *v45;
  const char *v46;
  id v47;
  id v48;
  id v50;
  id v51;
  id v52;
  void *v53;
  id v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v51 = a4;
  v52 = a5;
  v55 = a6;
  v54 = a7;
  v15 = a8;
  v53 = v15;
  v50 = a1;
  if (v15)
  {
    v16 = v15;
    objc_sync_enter(v16);
    objc_msgSend_allObjects(v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_exit(v16);

  }
  else
  {
    v19 = 0;
  }
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v20 = v19;
  v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v56, v60, 16);
  if (v24)
  {
    v25 = *(_QWORD *)v57;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v57 != v25)
          objc_enumerationMutation(v20);
        v27 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
        objc_msgSend_appContainerTuple(v27, v22, v23, v50);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend_isEqual_(v28, v29, (uint64_t)v14))
          goto LABEL_14;
        objc_msgSend_entitlements(v27, v30, v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend_isEqual_(v32, v33, (uint64_t)v55) & 1) == 0)
        {

LABEL_14:
          continue;
        }
        objc_msgSend_options(v27, v34, v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        isEqual = objc_msgSend_isEqual_(v36, v37, (uint64_t)v54);

        if ((isEqual & 1) != 0)
        {
          v47 = v27;
          v48 = v20;
          goto LABEL_21;
        }
      }
      v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v22, (uint64_t)&v56, v60, 16);
    }
    while (v24);
  }

  v39 = [CKDContainer alloc];
  v47 = (id)objc_msgSend__initWithAppContainerTuple_processScopedClientProxy_logicalDeviceScopedClientProxy_containerEntitlements_containerOptions_(v39, v40, (uint64_t)v14, v51, v52, v55, v54);
  objc_msgSend_sharedInternalUseContainers(v50, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v43 == v53;

  if (v44)
    objc_msgSend_setIsForClouddInternalUse_(v47, v45, 1);
  if (v53)
  {
    v48 = v53;
    objc_sync_enter(v48);
    objc_msgSend_addObject_(v48, v46, (uint64_t)v47);
    objc_sync_exit(v48);
LABEL_21:

  }
  return (CKDContainer *)v47;
}

- (void)_setupOperationQueues
{
  NSOperationQueue *v3;
  NSOperationQueue *operationQueue;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  const char *v12;
  NSOperationQueue *v13;
  NSOperationQueue *cleanupOperationQueue;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  const char *v22;
  NSOperationQueue *v23;
  NSOperationQueue *uncancellableOperationQueue;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  const char *v32;
  const char *v33;
  NSOperationQueue *v34;
  NSOperationQueue *backgroundOperationThrottleQueue;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  void *v41;
  const char *v42;
  const char *v43;
  const char *v44;
  NSOperationQueue *v45;
  NSOperationQueue *cloudKitSupportOperationThrottleQueue;
  void *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  void *v52;
  const char *v53;
  const char *v54;

  v3 = (NSOperationQueue *)objc_opt_new();
  operationQueue = self->_operationQueue;
  self->_operationQueue = v3;

  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_processName(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v5, v9, (uint64_t)CFSTR("com.apple.cloudkit.operation.%@"), v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setName_(self->_operationQueue, v11, (uint64_t)v10);

  objc_msgSend_setSuspended_(self->_operationQueue, v12, 1);
  v13 = (NSOperationQueue *)objc_opt_new();
  cleanupOperationQueue = self->_cleanupOperationQueue;
  self->_cleanupOperationQueue = v13;

  v15 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_processName(self, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v15, v19, (uint64_t)CFSTR("com.apple.cloudkit.cleanup.%@"), v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setName_(self->_cleanupOperationQueue, v21, (uint64_t)v20);

  objc_msgSend_setSuspended_(self->_cleanupOperationQueue, v22, 1);
  v23 = (NSOperationQueue *)objc_opt_new();
  uncancellableOperationQueue = self->_uncancellableOperationQueue;
  self->_uncancellableOperationQueue = v23;

  v25 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_processName(self, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v25, v29, (uint64_t)CFSTR("com.apple.cloudkit.uncancellable.%@"), v28);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setName_(self->_uncancellableOperationQueue, v31, (uint64_t)v30);

  objc_msgSend_setMaxConcurrentOperationCount_(self->_uncancellableOperationQueue, v32, 4);
  objc_msgSend_setSuspended_(self->_uncancellableOperationQueue, v33, 1);
  v34 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
  backgroundOperationThrottleQueue = self->_backgroundOperationThrottleQueue;
  self->_backgroundOperationThrottleQueue = v34;

  v36 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_processName(self, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v36, v40, (uint64_t)CFSTR("com.apple.cloudkit.background.%@"), v39);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setName_(self->_backgroundOperationThrottleQueue, v42, (uint64_t)v41);

  objc_msgSend_setMaxConcurrentOperationCount_(self->_backgroundOperationThrottleQueue, v43, 4);
  objc_msgSend_setSuspended_(self->_backgroundOperationThrottleQueue, v44, 1);
  v45 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
  cloudKitSupportOperationThrottleQueue = self->_cloudKitSupportOperationThrottleQueue;
  self->_cloudKitSupportOperationThrottleQueue = v45;

  v47 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_processName(self, v48, v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v47, v51, (uint64_t)CFSTR("com.apple.cloudkit.support.%@"), v50);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setName_(self->_cloudKitSupportOperationThrottleQueue, v53, (uint64_t)v52);

  objc_msgSend_setSuspended_(self->_cloudKitSupportOperationThrottleQueue, v54, 1);
}

- (NSString)processName
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  __CFString *v6;
  __CFString *v7;
  NSString *v8;

  objc_msgSend_processScopedClientProxy(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_procName(v3, v4, v5);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
    v6 = CFSTR("(unknown)");
  v8 = v6;

  return v8;
}

- (CKDProcessScopedClientProxy)processScopedClientProxy
{
  return (CKDProcessScopedClientProxy *)objc_loadWeakRetained((id *)&self->_processScopedClientProxy);
}

- (void)setContainerAvailable:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[5];
  uint8_t v37[128];
  uint8_t buf[4];
  CKDContainer *v39;
  uint64_t v40;

  v3 = a3;
  v40 = *MEMORY[0x1E0C80C00];
  v5 = (void *)*MEMORY[0x1E0C952F8];
  if (a3)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], v5);
    v6 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v39 = self;
      v9 = "System is available. Starting work queue for %@";
LABEL_18:
      _os_log_debug_impl(&dword_1BE990000, v6, OS_LOG_TYPE_DEBUG, v9, buf, 0xCu);
    }
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], v5);
    v6 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v39 = self;
      v9 = "System is unavailable. Stopping work queue for %@";
      goto LABEL_18;
    }
  }
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  objc_msgSend_operationQueue(self, v7, v8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v10;
  objc_msgSend_cleanupOperationQueue(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v13;
  objc_msgSend_uncancellableOperationQueue(self, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v36[2] = v16;
  objc_msgSend_backgroundOperationThrottleQueue(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v36[3] = v19;
  objc_msgSend_cloudKitSupportOperationThrottleQueue(self, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v36[4] = v22;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v23, (uint64_t)v36, 5);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v32, v37, 16);
  if (v26)
  {
    v28 = v26;
    v29 = *(_QWORD *)v33;
    v30 = !v3;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v33 != v29)
          objc_enumerationMutation(v24);
        objc_msgSend_setSuspended_(*(void **)(*((_QWORD *)&v32 + 1) + 8 * i), v27, v30);
      }
      v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v27, (uint64_t)&v32, v37, 16);
    }
    while (v28);
  }

}

- (void)_registerForTCCAuthorizationEvents
{
  xpc_object_t empty;
  const char *v4;
  uint64_t v5;
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  xpc_object_t v10;
  xpc_object_t v11;
  id v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  id v19;
  const char *v20;
  uint64_t v21;
  id v22;
  id location;

  objc_initWeak(&location, self);
  empty = xpc_array_create_empty();
  objc_msgSend_applicationBundleIdentifierForTCC(self, v4, v5);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = (const char *)objc_msgSend_UTF8String(v6, v7, v8);
  v10 = xpc_string_create(v9);
  xpc_array_append_value(empty, v10);

  v11 = xpc_dictionary_create_empty();
  v12 = objc_retainAutorelease((id)*MEMORY[0x1E0DB1148]);
  v15 = (const char *)objc_msgSend_UTF8String(v12, v13, v14);
  xpc_dictionary_set_value(v11, v15, empty);
  v16 = (void *)tcc_events_filter_create_with_criteria();
  objc_msgSend__TCCEventSubscriptionIdentifier(self, v17, v18);
  v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend_UTF8String(v19, v20, v21);
  objc_copyWeak(&v22, &location);
  tcc_events_subscribe();

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

- (NSMutableSet)pendingOperationIDs
{
  return self->_pendingOperationIDs;
}

- (void)setServerConfig:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  CKDServerConfiguration *v9;

  v9 = (CKDServerConfiguration *)a3;
  objc_msgSend_lock(self->_serverConfigLock, v5, v6);
  v8 = (const char *)v9;
  if (self->_serverConfig != v9)
    objc_storeStrong((id *)&self->_serverConfig, a3);
  objc_msgSend_unlock(self->_serverConfigLock, v8, v7);

}

- (id)_initWithAppContainerTuple:(id)a3 processScopedClientProxy:(id)a4 logicalDeviceScopedClientProxy:(id)a5 containerEntitlements:(id)a6 containerOptions:(id)a7
{
  id v13;
  id v14;
  void *v15;
  CKDContainer *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  id v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  NSObject *v41;
  dispatch_queue_t v42;
  void *v43;
  const char *v44;
  id v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  NSObject *v49;
  NSObject *v50;
  dispatch_queue_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  id v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  dispatch_workloop_t v60;
  void *v61;
  id v62;
  const char *v63;
  id v64;
  const char *v65;
  uint64_t v66;
  const char *v67;
  NSObject *v68;
  dispatch_queue_t v69;
  void *v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  unint64_t v82;
  const char *v83;
  uint64_t v84;
  id v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  const char *v89;
  const char *v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  int IsAttached;
  const char *v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  NSObject *v100;
  int v101;
  const char *v102;
  const char *v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  id v110;
  const char *v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  void *v115;
  id v116;
  const char *v117;
  uint64_t v118;
  void *v119;
  NSObject *v120;
  const char *v121;
  uint64_t v122;
  CKDContainer *v123;
  void *v124;
  const char *v125;
  uint64_t v126;
  void *v127;
  const char *v128;
  uint64_t v129;
  const char *v130;
  const char *v131;
  uint64_t v132;
  uint64_t isClientMainBundleAppleExecutable;
  const char *v134;
  id v135;
  void *v136;
  const char *v137;
  uint64_t v138;
  void *v139;
  const char *v140;
  uint64_t v141;
  void *v142;
  const char *v143;
  NSObject *v144;
  void *v145;
  const char *v146;
  uint64_t v147;
  void *v148;
  const char *v149;
  uint64_t v150;
  void *v151;
  const char *v152;
  const char *v153;
  uint64_t v154;
  void *v155;
  const char *v156;
  uint64_t v157;
  void *v158;
  const char *v159;
  uint64_t v160;
  CKDContainer *v161;
  void *v162;
  const char *v163;
  uint64_t v164;
  NSObject *v165;
  const char *v166;
  uint64_t v167;
  void *v168;
  const char *v169;
  uint64_t v170;
  void *v171;
  const char *v172;
  uint64_t v173;
  void *v174;
  void *v175;
  void *v176;
  const char *v177;
  uint64_t v178;
  void *v179;
  const char *v180;
  NSObject *v181;
  const char *v182;
  uint64_t v183;
  void *v184;
  const char *v185;
  const char *v186;
  NSObject *v188;
  const char *v189;
  uint64_t v190;
  void *v191;
  const char *v192;
  uint64_t v193;
  void *v194;
  void *v195;
  const char *v196;
  uint64_t v197;
  NSObject *v198;
  const char *v199;
  uint64_t v200;
  CKDContainer *v201;
  void *v202;
  const char *v203;
  const char *v204;
  uint64_t v205;
  NSObject *v206;
  const char *v207;
  uint64_t v208;
  void *v209;
  const char *v210;
  uint64_t v211;
  void *v212;
  id v213;
  id v214;
  id obj;
  _QWORD v216[4];
  id v217;
  id location;
  id v219;
  objc_super v220;
  uint8_t buf[4];
  CKDContainer *v222;
  __int16 v223;
  id v224;
  __int16 v225;
  id v226;
  __int16 v227;
  void *v228;
  __int16 v229;
  void *v230;
  uint64_t v231;

  v231 = *MEMORY[0x1E0C80C00];
  v214 = a3;
  v13 = a4;
  obj = a5;
  v213 = a6;
  v14 = a7;
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v15 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v188 = v15;
    objc_msgSend_applicationID(v214, v189, v190);
    v191 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_containerID(v214, v192, v193);
    v194 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    v222 = self;
    v223 = 2112;
    v224 = v13;
    v225 = 2112;
    v226 = obj;
    v227 = 2114;
    v228 = v191;
    v229 = 2114;
    v230 = v194;
    _os_log_debug_impl(&dword_1BE990000, v188, OS_LOG_TYPE_DEBUG, "Setting up container %p for proxies %@ / %@, applicationID:%{public}@, containerID:%{public}@", buf, 0x34u);

  }
  v220.receiver = self;
  v220.super_class = (Class)CKDContainer;
  v16 = -[CKDContainer init](&v220, sel_init);
  v17 = (uint64_t)v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_appContainerTuple, a3);
    objc_storeStrong((id *)(v17 + 320), a7);
    objc_storeStrong((id *)(v17 + 312), a6);
    v18 = objc_opt_new();
    v19 = *(void **)(v17 + 552);
    *(_QWORD *)(v17 + 552) = v18;

    if (pthread_rwlock_init((pthread_rwlock_t *)(v17 + 8), 0))
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v195 = (void *)*MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
      {
        v198 = v195;
        objc_msgSend_containerID((void *)v17, v199, v200);
        v201 = (CKDContainer *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v222 = v201;
        _os_log_error_impl(&dword_1BE990000, v198, OS_LOG_TYPE_ERROR, "Failed to initialize account lock in container: %@", buf, 0xCu);

      }
      v202 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend_containerID((void *)v17, v196, v197);
      v100 = objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v202, v203, (uint64_t)CFSTR("Failed to initialize account lock in container: %@"), v100);
      v13 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend_UTF8String(v13, v204, v205);
      _os_crash();
      __break(1u);
    }
    else
    {
      v20 = objc_opt_new();
      v21 = *(void **)(v17 + 496);
      *(_QWORD *)(v17 + 496) = v20;

      v22 = objc_opt_new();
      v23 = *(void **)(v17 + 504);
      *(_QWORD *)(v17 + 504) = v22;

      v24 = objc_opt_new();
      v25 = *(void **)(v17 + 512);
      *(_QWORD *)(v17 + 512) = v24;

      v26 = objc_opt_new();
      v27 = *(void **)(v17 + 520);
      *(_QWORD *)(v17 + 520) = v26;

      v28 = objc_opt_new();
      v29 = *(void **)(v17 + 528);
      *(_QWORD *)(v17 + 528) = v28;

      v30 = objc_opt_new();
      v31 = *(void **)(v17 + 536);
      *(_QWORD *)(v17 + 536) = v30;

      v32 = objc_opt_new();
      v33 = *(void **)(v17 + 544);
      *(_QWORD *)(v17 + 544) = v32;

      objc_storeWeak((id *)(v17 + 248), v13);
      objc_storeWeak((id *)(v17 + 256), obj);
      objc_msgSend_processName((void *)v17, v34, v35);
      a6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v36, (uint64_t)CFSTR("%@.%@"), CFSTR("com.apple.cloudkit.cancellation"), a6, v213);
      v37 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v40 = (const char *)objc_msgSend_UTF8String(v37, v38, v39);
      dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E0C80D50], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v41 = objc_claimAutoreleasedReturnValue();
      v42 = dispatch_queue_create(v40, v41);
      v43 = *(void **)(v17 + 592);
      *(_QWORD *)(v17 + 592) = v42;

      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v44, (uint64_t)CFSTR("%@.%@"), CFSTR("com.apple.cloudkit.status"), a6);
      v45 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v48 = (const char *)objc_msgSend_UTF8String(v45, v46, v47);
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v49 = objc_claimAutoreleasedReturnValue();
      dispatch_queue_attr_make_with_qos_class(v49, QOS_CLASS_UTILITY, 0);
      v50 = objc_claimAutoreleasedReturnValue();
      v51 = dispatch_queue_create(v48, v50);
      v52 = *(void **)(v17 + 600);
      *(_QWORD *)(v17 + 600) = v51;

      if (objc_msgSend_bypassPCSEncryption(v14, v53, v54))
      {
        objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v55, (uint64_t)CFSTR("%@.%@"), CFSTR("com.apple.cloudkit.accountStatus"), a6);
        v56 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v59 = (const char *)objc_msgSend_UTF8String(v56, v57, v58);
        v60 = dispatch_workloop_create(v59);
        v61 = *(void **)(v17 + 680);
        *(_QWORD *)(v17 + 680) = v60;

      }
      else
      {
        if (qword_1ED702718 != -1)
          dispatch_once(&qword_1ED702718, &unk_1E782F1D8);
        v62 = (id)qword_1ED702710;
        v56 = *(id *)(v17 + 680);
        *(_QWORD *)(v17 + 680) = v62;
      }

      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v63, (uint64_t)CFSTR("%@.%@"), CFSTR("com.apple.cloudkit.tccauth"), a6);
      v64 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v67 = (const char *)objc_msgSend_UTF8String(v64, v65, v66);
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v68 = objc_claimAutoreleasedReturnValue();
      v69 = dispatch_queue_create(v67, v68);
      v70 = *(void **)(v17 + 672);
      *(_QWORD *)(v17 + 672) = v69;

      dispatch_queue_set_specific(*(dispatch_queue_t *)(v17 + 672), "com.apple.cloudkit.containerTCCQueue", (void *)1, 0);
      v71 = objc_opt_new();
      v72 = *(void **)(v17 + 688);
      *(_QWORD *)(v17 + 688) = v71;

      objc_msgSend_weakObjectsHashTable(MEMORY[0x1E0CB3690], v73, v74);
      v75 = objc_claimAutoreleasedReturnValue();
      v76 = *(void **)(v17 + 704);
      *(_QWORD *)(v17 + 704) = v75;

      objc_msgSend_currentProcess(CKDDaemonProcess, v77, v78);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = objc_msgSend_processType(v79, v80, v81);

      if (v82 <= 2)
        *(_QWORD *)(v17 + 640) = qword_1BECBB4B0[v82];
      objc_msgSend__setupOperationQueues((void *)v17, v83, v84);
      v85 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v86 = *(void **)(v17 + 632);
      *(_QWORD *)(v17 + 632) = v85;

      objc_msgSend__registerForTCCAuthorizationEvents((void *)v17, v87, v88);
      objc_msgSend_hasTCCAuthorization_((void *)v17, v89, 0);
      objc_msgSend_processScopedClientProxy((void *)v17, v90, v91);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      IsAttached = objc_msgSend_processIsAttached(v92, v93, v94);

      if (IsAttached)
        objc_msgSend_hasValidatedEntitlements((void *)v17, v96, v97);
      if (!objc_msgSend_holdAllOperations(v14, v96, v97))
        goto LABEL_20;
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v100 = *MEMORY[0x1E0C952B0];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
        goto LABEL_20;
    }
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1BE990000, v100, OS_LOG_TYPE_DEBUG, "This client requested that we hold all its operations.", buf, 2u);
LABEL_20:
    v101 = objc_msgSend_holdAllOperations(v14, v98, v99);
    objc_msgSend_setContainerAvailable_((void *)v17, v102, v101 ^ 1u);
    *(_QWORD *)(v17 + 264) = -1;
    if (objc_msgSend_forceEnableReadOnlyManatee(v14, v103, v104))
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v107 = (void *)*MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
      {
        v206 = v107;
        objc_msgSend_containerID(v214, v207, v208);
        v209 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_procName(v13, v210, v211);
        v212 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v222 = (CKDContainer *)v17;
        v223 = 2112;
        v224 = v209;
        v225 = 2112;
        v226 = v212;
        _os_log_debug_impl(&dword_1BE990000, v206, OS_LOG_TYPE_DEBUG, "CKDContainer (%p) for container %@ (%@) is forcing manatee to be enabled. Weird stuff might happen- you've been warned!", buf, 0x20u);

      }
    }
    objc_msgSend__loadApplicationContainerPathAndType((void *)v17, v105, v106);
    if (v13)
    {
      v110 = objc_alloc(MEMORY[0x1E0CA5848]);
      objc_msgSend_applicationBundleID((void *)v17, v111, v112);
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      v219 = 0;
      v115 = (void *)objc_msgSend_initWithBundleIdentifier_error_(v110, v114, (uint64_t)v113, &v219);
      v116 = v219;

      if (v116)
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v119 = (void *)*MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
        {
          v120 = v119;
          objc_msgSend_applicationBundleID((void *)v17, v121, v122);
          v123 = (CKDContainer *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v222 = v123;
          v223 = 2112;
          v224 = v116;
          _os_log_impl(&dword_1BE990000, v120, OS_LOG_TYPE_INFO, "Bundle ID %@ doesn't belong to an application: %@", buf, 0x16u);

        }
      }
      else if (v115)
      {
        objc_msgSend_containingBundleRecord(v115, v117, v118);
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_bundleIdentifier(v124, v125, v126);
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setContainingBundleID_((void *)v17, v128, (uint64_t)v127);

      }
      v129 = objc_msgSend_clientSDKVersion(v13, v117, v118);
      objc_msgSend_setClientSDKVersion_((void *)v17, v130, v129);
      isClientMainBundleAppleExecutable = objc_msgSend_isClientMainBundleAppleExecutable(v13, v131, v132);
      objc_msgSend_setIsClientMainBundleAppleExecutable_((void *)v17, v134, isClientMainBundleAppleExecutable);

    }
    objc_msgSend__determineHardwareInfo((void *)v17, v108, v109);
    if (qword_1ED702720 != -1)
      dispatch_once(&qword_1ED702720, &unk_1E782F1F8);
    v135 = (id)qword_1ED702728;
    objc_sync_enter(v135);
    v136 = (void *)qword_1ED702728;
    objc_msgSend_directoryContext((void *)v17, v137, v138);
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_temporaryDirectory(v139, v140, v141);
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v136, v143, (uint64_t)v142);
    v144 = objc_claimAutoreleasedReturnValue();

    if (v144)
    {
      objc_sync_exit(v135);

      dispatch_group_wait(v144, 0xFFFFFFFFFFFFFFFFLL);
    }
    else
    {
      v144 = dispatch_group_create();
      v145 = (void *)qword_1ED702728;
      objc_msgSend_directoryContext((void *)v17, v146, v147);
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_temporaryDirectory(v148, v149, v150);
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v145, v152, (uint64_t)v144, v151);

      dispatch_group_enter(v144);
      objc_sync_exit(v135);

      objc_msgSend_directoryContext((void *)v17, v153, v154);
      v155 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_temporaryDirectory(v155, v156, v157);
      v158 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_lastPathComponent(v158, v159, v160);
      v161 = (CKDContainer *)objc_claimAutoreleasedReturnValue();

      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v162 = (void *)*MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
      {
        v165 = v162;
        objc_msgSend_directoryContext((void *)v17, v166, v167);
        v168 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_temporaryDirectory(v168, v169, v170);
        v171 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_CKSanitizedPath(v171, v172, v173);
        v174 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v222 = v161;
        v223 = 2112;
        v224 = v174;
        _os_log_impl(&dword_1BE990000, v165, OS_LOG_TYPE_INFO, "Purging %@ directory at %@", buf, 0x16u);

      }
      v175 = (void *)MEMORY[0x1E0C94CE8];
      objc_msgSend_directoryContext((void *)v17, v163, v164);
      v176 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_temporaryDirectory(v176, v177, v178);
      v179 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_purgeDirectoryAtURL_(v175, v180, (uint64_t)v179);

      dispatch_group_leave(v144);
    }
    objc_initWeak(&location, (id)v17);
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v181 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v222 = (CKDContainer *)v17;
      _os_log_impl(&dword_1BE990000, v181, OS_LOG_TYPE_INFO, "Registering container %p for account-change-notification", buf, 0xCu);
    }
    objc_msgSend_sharedNotifier(CKDAccountNotifier, v182, v183);
    v184 = (void *)objc_claimAutoreleasedReturnValue();
    v216[0] = MEMORY[0x1E0C809B0];
    v216[1] = 3221225472;
    v216[2] = sub_1BEA1FDC8;
    v216[3] = &unk_1E782F220;
    objc_copyWeak(&v217, &location);
    objc_msgSend_registerObserver_forAccountChangeNotification_(v184, v185, v17, v216);

    objc_msgSend__reloadAccount_((void *)v17, v186, 0);
    objc_destroyWeak(&v217);
    objc_destroyWeak(&location);

  }
  return (id)v17;
}

- (void)submitClientEventMetric:(id)a3 completeWhenQueued:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL4 v6;
  id v8;
  void (**v9)(_QWORD);
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  id v24;
  const char *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD *v29;
  _QWORD v30[5];
  id v31;
  uint8_t buf[4];
  void *v33;
  uint64_t v34;

  v6 = a4;
  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(_QWORD))a5;
  objc_msgSend_currentProcess(CKDDaemonProcess, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_processType(v12, v13, v14);

  if (v15 == 2)
  {
    if (v9)
      v9[2](v9);
  }
  else
  {
    if (v6)
      v16 = 0;
    else
      v16 = v9;
    v17 = _Block_copy(v16);
    v30[0] = 0;
    v30[1] = v30;
    v30[2] = 0x3032000000;
    v30[3] = sub_1BE9BAF48;
    v30[4] = sub_1BE9BAD58;
    v31 = (id)os_transaction_create();
    objc_msgSend_metricUUID(v8, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v21 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v33 = v20;
      _os_log_impl(&dword_1BE990000, v21, OS_LOG_TYPE_INFO, "Daemon submitting CKEventMetric %@.", buf, 0xCu);
    }
    v22 = (void *)MEMORY[0x1E0D03778];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = sub_1BE9C2014;
    v26[3] = &unk_1E782FD98;
    v23 = v20;
    v27 = v23;
    v29 = v30;
    v24 = v17;
    v28 = v24;
    objc_msgSend_reportCKEventMetric_container_completionHandler_(v22, v25, (uint64_t)v8, self, v26);
    if (v9 && !v24)
      v9[2](v9);

    _Block_object_dispose(v30, 8);
  }

}

- (BOOL)shouldUsePCSEncryption
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  int v12;

  objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_useEncryption(v4, v5, v6))
  {
    objc_msgSend_options(self, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend_bypassPCSEncryption(v9, v10, v11) ^ 1;

  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (void)setResolvedAPSEnvironmentString:(id)a3
{
  objc_storeStrong((id *)&self->_resolvedAPSEnvironmentString, a3);
}

- (void)setPublicShareServiceURL:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 408);
}

- (void)setPublicMetricsServiceURL:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 432);
}

- (void)setPublicDeviceServiceURL:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 416);
}

- (void)setPublicCodeServiceURL:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 424);
}

- (void)setPublicCloudDBURL:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 400);
}

- (void)setIsClientMainBundleAppleExecutable:(BOOL)a3
{
  self->_isClientMainBundleAppleExecutable = a3;
}

- (void)setGatekeeper:(id)a3
{
  objc_storeStrong((id *)&self->_gatekeeper, a3);
}

- (void)setDirectoryContext:(id)a3
{
  objc_storeStrong((id *)&self->_directoryContext, a3);
}

- (void)setContainerScopedUserID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 440);
}

- (void)setClientSDKVersion:(unsigned int)a3
{
  self->_clientSDKVersion = a3;
}

- (void)setCachedSandboxExtensions:(id)a3
{
  objc_storeStrong((id *)&self->_cachedSandboxExtensions, a3);
}

- (void)setCachedEnvironment:(int64_t)a3
{
  self->_cachedEnvironment = a3;
}

- (CKDServerConfiguration)serverConfig
{
  uint64_t v2;
  CKDServerConfiguration *v4;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self->_serverConfigLock, a2, v2);
  v4 = self->_serverConfig;
  objc_msgSend_unlock(self->_serverConfigLock, v5, v6);
  return v4;
}

- (NSString)resolvedAPSEnvironmentString
{
  return self->_resolvedAPSEnvironmentString;
}

- (NSString)regionCode
{
  uint64_t v2;
  void *v3;
  const char *v4;
  void *v5;

  objc_msgSend_currentLocale(MEMORY[0x1E0C99DC8], a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v3, v4, *MEMORY[0x1E0C997B0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (id)possiblyWrappedAuthTokenErrorGivenError:(id)a3
{
  const char *v4;
  uint64_t v5;
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  id v12;
  void *v13;

  v6 = a3;
  if (v6)
  {
    if ((objc_msgSend__isAdopterAppleInternal(self, v4, v5) & 1) != 0
      || (objc_msgSend_clientSDKVersion(self, v7, v8),
          !CKLinkCheck32f5805a68adfc1b65f94a0de69aa32177c7cd24())
      || objc_msgSend_code(v6, v9, v10) == 1028)
    {
      v12 = v6;
    }
    else
    {
      objc_msgSend_errorWithDomain_code_userInfo_error_format_(MEMORY[0x1E0C94FF8], v11, *MEMORY[0x1E0C94B20], 1028, 0, v6, CFSTR("Account temporarily unavailable due to bad or missing auth token"));
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = v12;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (NSString)personaID
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_appContainerTuple(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_personaID(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)performRequest:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  id v8;
  const char *v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  objc_msgSend_uncancellableOperationQueue(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1BE994784;
  v10[3] = &unk_1E782EE20;
  v10[4] = self;
  v11 = v4;
  v8 = v4;
  objc_msgSend_addOperationWithBlock_(v7, v9, (uint64_t)v10);

}

- (CKDPCSManager)pcsManager
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  CKDPCSManager *pcsManager;
  CKDPCSManager *v7;
  const char *v8;
  CKDProxyPCSManager *v9;
  CKDPCSManager *v10;
  CKDPCSManager *v11;
  const char *v12;
  uint64_t v13;

  objc_msgSend_lock(self->_pcsManagerLock, a2, v2);
  pthread_rwlock_rdlock(&self->rwAccountLock);
  pcsManager = self->_pcsManager;
  if (!pcsManager)
  {
    if (objc_msgSend_shouldUsePCSEncryption(self, v4, v5))
    {
      v7 = [CKDPCSManager alloc];
      v9 = (CKDProxyPCSManager *)objc_msgSend_initWithContainer_account_(v7, v8, (uint64_t)self, self->_account);
    }
    else
    {
      v9 = objc_alloc_init(CKDProxyPCSManager);
    }
    v10 = self->_pcsManager;
    self->_pcsManager = (CKDPCSManager *)v9;

    pcsManager = self->_pcsManager;
  }
  v11 = pcsManager;
  pthread_rwlock_unlock(&self->rwAccountLock);
  objc_msgSend_unlock(self->_pcsManagerLock, v12, v13);
  return v11;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  objc_method_description MethodDescription;
  void *v6;
  objc_super v8;

  MethodDescription = protocol_getMethodDescription((Protocol *)&unk_1EF589F90, a3, 1, 1);
  if (MethodDescription.name)
  {
    objc_msgSend_signatureWithObjCTypes_(MEMORY[0x1E0C99DD8], MethodDescription.types, (uint64_t)MethodDescription.types);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CKDContainer;
    -[CKDContainer methodSignatureForSelector:](&v8, sel_methodSignatureForSelector_, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (NSString)languageCode
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  const char *v12;

  objc_msgSend_preferredLanguages(MEMORY[0x1E0C99DC8], a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstObject(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6;
  if (v6)
  {
    v10 = v6;
  }
  else
  {
    objc_msgSend_currentLocale(MEMORY[0x1E0C99DC8], v7, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v11, v12, *MEMORY[0x1E0C997E8]);
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v10;
}

- (BOOL)isForClouddInternalUse
{
  return self->_isForClouddInternalUse;
}

- (BOOL)hasTCCAuthorization
{
  return objc_msgSend_hasTCCAuthorization_(self, a2, 1) == 1;
}

- (NSString)hardwareID
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  NSString *v16;

  if (*MEMORY[0x1E0C95280]
    && (objc_msgSend_options(self, a2, v2),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend_testDeviceReferenceProtocol(v4, v5, v6),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v4,
        v7))
  {
    objc_msgSend_options(self, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_testDeviceReferenceProtocol(v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_deviceID(v13, v14, v15);
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = self->_hardwareID;
  }
  return v16;
}

- (CKDZoneGatekeeper)gatekeeper
{
  return self->_gatekeeper;
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  objc_method_description MethodDescription;
  void *v10;
  const char *v11;
  uint64_t v12;
  char hasSPIEntitlement;
  void *v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  objc_class *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  objc_super v23;

  v4 = a3;
  v7 = (const char *)objc_msgSend_selector(v4, v5, v6);
  MethodDescription = protocol_getMethodDescription((Protocol *)&unk_1EF589F90, v7, 1, 1);
  if (MethodDescription.name)
  {
    objc_msgSend_entitlements(self, MethodDescription.types, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    hasSPIEntitlement = objc_msgSend_hasSPIEntitlement(v10, v11, v12);

    if ((hasSPIEntitlement & 1) == 0)
    {
      v14 = (void *)MEMORY[0x1E0CB3940];
      NSStringFromSelector(MethodDescription.name);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v14, v16, (uint64_t)CFSTR("%@ is CloudKit SPI and requires an entitlement. Please add the com.apple.private.cloudkit.spi entitlement to this process. This will become a hard failure."), v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_handleSignificantIssueBehavior_reason_(self, v18, 1, v17);
    }
    v19 = (objc_class *)objc_opt_class();
    object_setClass(self, v19);
    objc_msgSend_setTarget_(v4, v20, (uint64_t)self);
    objc_msgSend_invoke(v4, v21, v22);
  }
  else
  {
    v23.receiver = self;
    v23.super_class = (Class)CKDContainer;
    -[CKDContainer forwardInvocation:](&v23, sel_forwardInvocation_, v4);
  }

}

- (void)fetchPublicURLForServerType:(int64_t)a3 operation:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  _QWORD v11[4];
  id v12;
  int64_t v13;

  v8 = a5;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1BE9C23D0;
  v11[3] = &unk_1E782F2D8;
  v12 = v8;
  v13 = a3;
  v9 = v8;
  objc_msgSend__fetchContainerServerInfoForOperation_requireUserIDs_completionHandler_(self, v10, (uint64_t)a4, 0, v11);

}

- (void)fetchPrivateURLForServerType:(int64_t)a3 operation:(id)a4 completionHandler:(id)a5
{
  id v8;
  void (**v9)(id, void *, _QWORD);
  const char *v10;
  void *v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  _QWORD v17[4];
  void (**v18)(id, void *, _QWORD);
  id v19[2];
  uint8_t buf[8];
  id location;

  v8 = a4;
  v9 = (void (**)(id, void *, _QWORD))a5;
  objc_msgSend_baseURLForServerType_partitionType_(self, v10, a3, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  if (v11)
  {
    v9[2](v9, v11, 0);
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v12 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE990000, v12, OS_LOG_TYPE_INFO, "Couldn't get a private URL. Fetching updated account properties", buf, 2u);
    }
    objc_msgSend_account(self, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = sub_1BEA2136C;
    v17[3] = &unk_1E782F328;
    objc_copyWeak(v19, &location);
    v18 = v9;
    v19[1] = (id)a3;
    objc_msgSend_updateAccountPropertiesAndSaveAccountWithCompletionHandler_(v15, v16, (uint64_t)v17);

    objc_destroyWeak(v19);
  }
  objc_destroyWeak(&location);

}

- (void)fetchImportantUserIDsForOperation:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  _QWORD v9[5];
  id v10;

  v6 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1BE9C24B8;
  v9[3] = &unk_1E782F2B0;
  v9[4] = self;
  v10 = v6;
  v7 = v6;
  objc_msgSend__fetchContainerServerInfoForOperation_requireUserIDs_completionHandler_(self, v8, (uint64_t)a3, 1, v9);

}

- (NSMutableDictionary)fakeResponseOperationResultByClassNameByItemID
{
  return self->_fakeResponseOperationResultByClassNameByItemID;
}

- (NSMutableDictionary)fakeErrorsByClassName
{
  return self->_fakeErrorsByClassName;
}

- (NSString)encryptionServiceName
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;

  objc_msgSend_options(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encryptionServiceName(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend_options(self, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_encryptionServiceName(v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend_entitlements(self, v8, v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_serviceNameForContainerIdentifierMapEntitlement(v14, v15, v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_containerID(self, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_containerIdentifier(v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v10, v23, (uint64_t)v22);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v13;
}

- (void)dropMMCS
{
  uint64_t v2;
  CKDMMCS *MMCS;

  objc_msgSend_drop(self->_MMCS, a2, v2);
  MMCS = self->_MMCS;
  self->_MMCS = 0;

}

- (NSString)deviceName
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_sharedClientInfo(CKDClientInfo, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_hostname(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)deviceID
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;

  if (*MEMORY[0x1E0C95280]
    && (objc_msgSend_options(self, a2, v2),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend_testDeviceReferenceProtocol(v4, v5, v6),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v4,
        v7))
  {
    objc_msgSend_options(self, a2, v2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_testDeviceReferenceProtocol(v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_deviceID(v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend_sharedManager(CKDDeviceIDManager, a2, v2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_deviceIdentifierForContainer_(v8, v15, (uint64_t)self);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v14;
}

- (void)dealloc
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  objc_super v12;
  uint8_t buf[4];
  CKDContainer *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v3 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v14 = self;
    _os_log_debug_impl(&dword_1BE990000, v3, OS_LOG_TYPE_DEBUG, "%@ in dealloc", buf, 0xCu);
  }
  objc_msgSend_dropMMCS(self, v4, v5);
  objc_msgSend_sharedNotifier(CKDAccountNotifier, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unregisterObserverForAccountChangeNotification_(v8, v9, (uint64_t)self);

  objc_msgSend__unregisterForTCCAuthorizationEvents(self, v10, v11);
  pthread_rwlock_destroy(&self->rwAccountLock);
  v12.receiver = self;
  v12.super_class = (Class)CKDContainer;
  -[CKDContainer dealloc](&v12, sel_dealloc);
}

- (NSString)containingBundleID
{
  return self->_containingBundleID;
}

- (id)containerForOperationInfo:(id)a3
{
  const char *v4;
  uint64_t v5;
  void *v6;
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
  CKDContainer *v17;

  if (objc_msgSend_isLongLived(a3, a2, (uint64_t)a3)
    && (objc_msgSend_processScopedClientProxy(self, v4, v5),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    objc_msgSend_appContainerAccountTuple(self, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_deviceContext(self, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sharedDetachedContainers(CKDContainer, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_containerWithAppContainerAccountTuple_deviceContext_sharedContainerTable_(CKDContainer, v16, (uint64_t)v9, v12, v15);
    v17 = (CKDContainer *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = self;
  }
  return v17;
}

- (NSOperationQueue)cloudKitSupportOperationThrottleQueue
{
  return self->_cloudKitSupportOperationThrottleQueue;
}

- (unsigned)clientSDKVersion
{
  return self->_clientSDKVersion;
}

- (NSOperationQueue)cleanupOperationQueue
{
  return self->_cleanupOperationQueue;
}

- (OS_dispatch_queue)cancellationQueue
{
  return self->_cancellationQueue;
}

- (BOOL)canAuthWithCloudKit
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  char isPrimaryEmailVerified;
  void *v10;
  const char *v11;
  uint64_t v12;

  objc_msgSend_entitlements(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_hasAllowUnverifiedAccountEntitlement(v4, v5, v6) & 1) != 0)
  {
    isPrimaryEmailVerified = 1;
  }
  else
  {
    objc_msgSend_account(self, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    isPrimaryEmailVerified = objc_msgSend_isPrimaryEmailVerified(v10, v11, v12);

  }
  return isPrimaryEmailVerified;
}

- (BOOL)canAccessAccount
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  int v6;
  void *v7;
  char v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend_isForClouddInternalUse(self, a2, v2) & 1) != 0)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    objc_msgSend_applicationBundleID(self, v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = sub_1BE9BFF50(v7, self);

    if ((v8 & 1) != 0)
    {
      LOBYTE(v6) = MEMORY[0x1E0DE7D20](self, sel__cloudKitEnabledForCurrentClient, v9);
    }
    else
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v10 = (void *)*MEMORY[0x1E0C952B0];
      v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO);
      if (v6)
      {
        v11 = v10;
        objc_msgSend_applicationBundleID(self, v12, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138412290;
        v17 = v14;
        _os_log_impl(&dword_1BE990000, v11, OS_LOG_TYPE_INFO, "Bundle %@ isn't authorized for CloudKit, denying access", (uint8_t *)&v16, 0xCu);

        LOBYTE(v6) = 0;
      }
    }
  }
  return v6;
}

- (NSOperationQueue)backgroundOperationThrottleQueue
{
  return self->_backgroundOperationThrottleQueue;
}

- (NSString)associatedApplicationBundleID
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_entitlements(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_associatedApplicationBundleID(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)apsEnvironmentString
{
  return (NSString *)((uint64_t (*)(CKDContainer *, char *))MEMORY[0x1E0DE7D20])(self, sel_resolvedAPSEnvironmentString);
}

- (NSString)applicationBundleIdentifierForPush
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  void *v26;
  NSObject *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  int v35;
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  objc_msgSend_applicationID(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_applicationBundleIdentifierOverrideForPushTopicGeneration(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_containingBundleID(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 && !v7)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v13 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      v28 = v13;
      objc_msgSend_containingBundleID(self, v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_applicationBundleID(self, v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 138543618;
      v36 = v31;
      v37 = 2114;
      v38 = v34;
      _os_log_debug_impl(&dword_1BE990000, v28, OS_LOG_TYPE_DEBUG, "Using wrapping app bundle id %{public}@ for extension %{public}@ when registering push tokens", (uint8_t *)&v35, 0x16u);

    }
  }
  objc_msgSend_applicationBundleID(self, v11, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_associatedApplicationBundleID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containingBundleID(self, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  CKApplicationBundleIDForPush();
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_deviceContext(self, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceScopedPushTopic_(v24, v25, (uint64_t)v21);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v26;
}

- (CKDAppContainerAccountTuple)appContainerAccountTuple
{
  CKDAppContainerAccountTuple *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;

  v3 = [CKDAppContainerAccountTuple alloc];
  objc_msgSend_appContainerTuple(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_account(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_accountID(v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend_initWithAppContainerTuple_accountID_(v3, v13, (uint64_t)v6, v12);

  return (CKDAppContainerAccountTuple *)v14;
}

- (int64_t)adopterProcessType
{
  return self->_adopterProcessType;
}

- (void)_unregisterForTCCAuthorizationEvents
{
  uint64_t v2;
  const char *v3;
  uint64_t v4;
  id v5;

  objc_msgSend__TCCEventSubscriptionIdentifier(self, a2, v2);
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend_UTF8String(v5, v3, v4);
  tcc_events_unsubscribe();

}

- (void)_handleCompletionForOperation:(id)a3 initialMessageReplyBlock:(id)a4 customCompletionBlock:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  _QWORD *v11;
  os_log_t *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const char *v23;
  void *v24;
  _BOOL4 v25;
  const char *v26;
  uint64_t v27;
  NSObject *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  const char *v41;
  void *v42;
  NSObject *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const __CFString *v50;
  uint64_t v51;
  uint64_t v52;
  void (*v53)(uint64_t, const char *, uint64_t);
  void *v54;
  id v55;
  CKDContainer *v56;
  id v57;
  id v58;
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  const __CFString *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD))a5;
  v11 = (_QWORD *)MEMORY[0x1E0C95300];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v12 = (os_log_t *)MEMORY[0x1E0C952B0];
  v13 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v43 = v13;
    objc_msgSend_operationID(v8, v44, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_error(v8, v47, v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = CFSTR(" with error");
    if (!v49)
      v50 = &stru_1E7838F48;
    *(_DWORD *)buf = 138543618;
    v60 = v46;
    v61 = 2112;
    v62 = v50;
    _os_log_debug_impl(&dword_1BE990000, v43, OS_LOG_TYPE_DEBUG, "Operation %{public}@ completed%@", buf, 0x16u);

  }
  v10[2](v10);
  objc_msgSend_processScopedClientProxy(self, v14, v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    objc_msgSend_operationID(v8, v16, v17);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (*MEMORY[0x1E0C95280])
    {
      objc_msgSend_unitTestOverrides(v8, v19, v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v22, v23, (uint64_t)CFSTR("PreserveCachedLongLivedOperationMetadata"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = v24 != 0;
    }
    else
    {
      v25 = 0;
    }
    if (objc_msgSend_isLongLived(v8, v19, v20)
      && ((v25 | objc_msgSend_processIsAttached(v18, v26, v27) ^ 1) & 1) == 0)
    {
      if (*v11 != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v28 = *v12;
      if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        v60 = v21;
        _os_log_debug_impl(&dword_1BE990000, v28, OS_LOG_TYPE_DEBUG, "Deleting all cached info for operation %{public}@", buf, 0xCu);
      }
      objc_msgSend_deviceContext(self, v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_operationInfoCache(v31, v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_deleteAllInfoForOperationWithID_(v34, v35, (uint64_t)v21);

    }
  }
  objc_msgSend_clientOperationCallbackProxy(v8, v16, v17);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = MEMORY[0x1E0C809B0];
  v52 = 3221225472;
  v53 = sub_1BEA24604;
  v54 = &unk_1E782F650;
  v58 = v9;
  v37 = v36;
  v55 = v37;
  v56 = self;
  v57 = v8;
  v38 = v8;
  v39 = v9;
  v40 = _Block_copy(&v51);
  v42 = v40;
  if (v37)
    objc_msgSend_addBarrierBlock_(v37, v41, (uint64_t)v40, v51, v52, v53, v54, v55, v56, v57, v58);
  else
    (*((void (**)(void *))v40 + 2))(v40);

}

- (void)_handleCompletionForOperation:(id)a3 initialMessageReplyBlock:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  _QWORD v9[4];
  id v10;

  v6 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1BE9C266C;
  v9[3] = &unk_1E782EA40;
  v10 = v6;
  v7 = v6;
  objc_msgSend__handleCompletionForOperation_initialMessageReplyBlock_customCompletionBlock_(self, v8, (uint64_t)v7, a4, v9);

}

- (void)_fetchContainerServerInfoForOperation:(id)a3 requireUserIDs:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  id v13;
  const char *v14;
  _QWORD v15[5];
  id v16;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  objc_msgSend_sharedManager(CKDServerConfigurationManager, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1BE998A38;
  v15[3] = &unk_1E782F2B0;
  v15[4] = self;
  v16 = v8;
  v13 = v8;
  objc_msgSend_containerServerInfoForOperation_requireUserIDs_completionHandler_(v12, v14, (uint64_t)v9, v5, v15);

}

- (void)_determineHardwareInfo
{
  uint64_t v2;
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const void *v16;
  const char *v17;
  CC_LONG v18;
  const char *v19;
  uint64_t v20;
  NSString *v21;
  NSString *hardwareID;
  unsigned __int8 md[16];
  __int128 v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_containerID(self, a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerIdentifier(v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  CKDeviceUDID();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v4, v10, (uint64_t)CFSTR("%@-%@"), v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  *(_OWORD *)md = 0u;
  v24 = 0u;
  objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x1E0C99D50], v12, (uint64_t)md, 32, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (const void *)objc_msgSend_UTF8String(v11, v14, v15);
  v18 = objc_msgSend_lengthOfBytesUsingEncoding_(v11, v17, 4);
  CC_SHA256(v16, v18, md);
  objc_msgSend_CKUppercaseHexStringWithoutSpaces(v13, v19, v20);
  v21 = (NSString *)objc_claimAutoreleasedReturnValue();
  hardwareID = self->_hardwareID;
  self->_hardwareID = v21;

}

- (BOOL)_cloudKitEnabledForCurrentClient
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  BOOL v15;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  char isDataclassEnabled;
  NSObject *v26;
  int v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend_entitlements(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_hasCloudKitSystemServiceEntitlement(v4, v5, v6))
  {

    return 1;
  }
  objc_msgSend_deviceContext(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_testDeviceReference(v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    return 1;
  objc_msgSend_containerID(self, v13, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_representativeDataclass(v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20
    && (objc_msgSend_account(self, v21, v22),
        v23 = (void *)objc_claimAutoreleasedReturnValue(),
        isDataclassEnabled = objc_msgSend_isDataclassEnabled_(v23, v24, (uint64_t)v20),
        v23,
        (isDataclassEnabled & 1) == 0))
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v26 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
    {
      v27 = 138412290;
      v28 = v20;
      _os_log_impl(&dword_1BE990000, v26, OS_LOG_TYPE_INFO, "%@ dataclass disabled, denying access", (uint8_t *)&v27, 0xCu);
    }
    v15 = 0;
  }
  else
  {
    v15 = 1;
  }

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientContainers, 0);
  objc_storeStrong((id *)&self->_cachedSandboxExtensions, 0);
  objc_storeStrong((id *)&self->_operationStatisticsByClassName, 0);
  objc_storeStrong((id *)&self->_accountStatusWorkloop, 0);
  objc_storeStrong((id *)&self->_tccAuthQueue, 0);
  objc_storeStrong((id *)&self->_tccAuthOpQueue, 0);
  objc_storeStrong((id *)&self->_testServer, 0);
  objc_storeStrong((id *)&self->_pendingOperationIDs, 0);
  objc_storeStrong((id *)&self->_cloudKitSupportOperationThrottleQueue, 0);
  objc_storeStrong((id *)&self->_backgroundOperationThrottleQueue, 0);
  objc_storeStrong((id *)&self->_uncancellableOperationQueue, 0);
  objc_storeStrong((id *)&self->_statusQueue, 0);
  objc_storeStrong((id *)&self->_cancellationQueue, 0);
  objc_storeStrong((id *)&self->_containingBundleID, 0);
  objc_storeStrong((id *)&self->_resolvedAPSEnvironmentString, 0);
  objc_storeStrong((id *)&self->_applicationDisplayName, 0);
  objc_storeStrong((id *)&self->_applicationIcon, 0);
  objc_storeStrong((id *)&self->_pcsManagerLock, 0);
  objc_storeStrong((id *)&self->_publicIdentityServiceLock, 0);
  objc_storeStrong((id *)&self->_fetchAggregatorLock, 0);
  objc_storeStrong((id *)&self->_sandboxExtensionsLock, 0);
  objc_storeStrong((id *)&self->_anonymousSharingManagerLock, 0);
  objc_storeStrong((id *)&self->_deviceContextLock, 0);
  objc_storeStrong((id *)&self->_mmcsLock, 0);
  objc_storeStrong((id *)&self->_serverConfigLock, 0);
  objc_storeStrong((id *)&self->_fakeResponseOperationResultByClassNameByItemID, 0);
  objc_storeStrong((id *)&self->_fakeResponseOperationLifetimeByClassName, 0);
  objc_storeStrong((id *)&self->_fakeErrorsByClassName, 0);
  objc_storeStrong((id *)&self->_cleanupOperationQueue, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_orgAdminUserID, 0);
  objc_storeStrong((id *)&self->_containerScopedUserID, 0);
  objc_storeStrong((id *)&self->_publicMetricsServiceURL, 0);
  objc_storeStrong((id *)&self->_publicCodeServiceURL, 0);
  objc_storeStrong((id *)&self->_publicDeviceServiceURL, 0);
  objc_storeStrong((id *)&self->_publicShareServiceURL, 0);
  objc_storeStrong((id *)&self->_publicCloudDBURL, 0);
  objc_storeStrong((id *)&self->_fetchAggregator, 0);
  objc_storeStrong((id *)&self->_gatekeeper, 0);
  objc_storeStrong((id *)&self->_backgroundPublicIdentityLookupService, 0);
  objc_storeStrong((id *)&self->_foregroundPublicIdentityLookupService, 0);
  objc_storeStrong((id *)&self->_publicIdentitiesDiskCache, 0);
  objc_storeStrong((id *)&self->_anonymousSharingManager, 0);
  objc_storeStrong((id *)&self->_pcsCache, 0);
  objc_storeStrong((id *)&self->_pcsManager, 0);
  objc_storeStrong((id *)&self->_MMCS, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_entitlements, 0);
  objc_storeStrong((id *)&self->_appContainerTuple, 0);
  objc_storeStrong((id *)&self->_directoryContext, 0);
  objc_storeStrong((id *)&self->_applicationVersion, 0);
  objc_storeStrong((id *)&self->_hardwareID, 0);
  objc_destroyWeak((id *)&self->_logicalDeviceScopedClientProxy);
  objc_destroyWeak((id *)&self->_processScopedClientProxy);
  objc_storeStrong((id *)&self->_serverConfig, 0);
  objc_storeStrong((id *)&self->_recordCache, 0);
  objc_storeStrong((id *)&self->_deviceContext, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

+ (id)sharedInternalUseContainers
{
  if (qword_1ED7026F8 != -1)
    dispatch_once(&qword_1ED7026F8, &unk_1E782F198);
  return (id)qword_1ED7026F0;
}

+ (id)sharedClientThrottlingOperationQueue
{
  if (qword_1ED702730 != -1)
    dispatch_once(&qword_1ED702730, &unk_1E782F370);
  return (id)qword_1ED702738;
}

+ (id)applicationDataContainerDirectoryForBundleID:(id)a3 outApplicationBinaryBundleURL:(id *)a4 outAdopterProcessType:(int64_t *)a5
{
  id v6;
  id v7;
  const char *v8;
  void *v9;
  const __CFString *v10;
  _QWORD *v11;
  os_log_t *v12;
  os_log_t v13;
  const char *v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  __CFString *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  const char *v28;
  void *v29;
  id v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  id v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  int isInstalled;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  int v56;
  uint64_t v57;
  uint64_t v58;
  const __CFString *v60;
  NSObject *v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  const __CFString *v71;
  void *v72;
  __CFString *v74;
  int64_t *v75;
  id v76;
  id v77;
  uint8_t buf[4];
  id v79;
  __int16 v80;
  const __CFString *v81;
  __int16 v82;
  id v83;
  __int16 v84;
  void *v85;
  __int16 v86;
  void *v87;
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_alloc(MEMORY[0x1E0CA5848]);
  v77 = 0;
  v9 = (void *)objc_msgSend_initWithBundleIdentifier_error_(v7, v8, (uint64_t)v6, &v77);
  v10 = (const __CFString *)v77;
  v11 = (_QWORD *)MEMORY[0x1E0C95300];
  v12 = (os_log_t *)MEMORY[0x1E0C952B0];
  v75 = a5;
  if (v9)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v13 = *v12;
    if (os_log_type_enabled(*v12, OS_LOG_TYPE_INFO))
    {
      v16 = v13;
      objc_msgSend_containingBundleRecord(v9, v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_bundleIdentifier(v19, v20, v21);
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v79 = v6;
      v80 = 2112;
      v81 = v22;
      _os_log_impl(&dword_1BE990000, v16, OS_LOG_TYPE_INFO, "Launch Services reports that bundle ID %@ belongs to an application extension with containing bundle id: %@", buf, 0x16u);

    }
    objc_msgSend_containingBundleRecord(v9, v14, v15);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_bundleIdentifier(v23, v24, v25);
    v26 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v26;
  }
  v27 = objc_alloc(MEMORY[0x1E0CA5870]);
  v76 = 0;
  v29 = (void *)objc_msgSend_initWithBundleIdentifier_allowPlaceholder_error_(v27, v28, (uint64_t)v6, 0, &v76);
  v30 = v76;
  if (v29)
  {
    if (*v11 != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v31 = *v12;
    if (os_log_type_enabled(*v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v79 = v6;
      _os_log_impl(&dword_1BE990000, v31, OS_LOG_TYPE_INFO, "Launch Services reports that bundle ID %@ belongs to an application.", buf, 0xCu);
    }
  }
  if (v10 && v30)
  {
    if (*v11 != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v32 = *v12;
    if (os_log_type_enabled(*v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      v79 = v6;
      v80 = 2112;
      v81 = v10;
      v82 = 2112;
      v83 = v30;
      _os_log_impl(&dword_1BE990000, v32, OS_LOG_TYPE_INFO, "Bundle ID %@ doesn't belong to an application or extension. extensionError=%@ applicationError=%@", buf, 0x20u);
    }
  }
  v72 = v30;
  v74 = (__CFString *)v10;
  if (v9)
    v33 = v9;
  else
    v33 = v29;
  v34 = v33;
  objc_msgSend_dataContainerURL(v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_applicationState(v29, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  isInstalled = objc_msgSend_isInstalled(v40, v41, v42);

  objc_msgSend_sharedManager(MEMORY[0x1E0DC5EE8], v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_currentPersona(v46, v47, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_userPersonaUniqueString(v49, v50, v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  if (*v11 != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v53 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v60 = CFSTR("NO");
    if (isInstalled)
      v60 = CFSTR("YES");
    v71 = v60;
    v61 = v53;
    objc_msgSend_CKSanitizedPath(v37, v62, v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_URL(v34, v65, v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKSanitizedPath(v67, v68, v69);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v79 = v6;
    v80 = 2112;
    v81 = v71;
    v82 = 2112;
    v83 = v64;
    v84 = 2112;
    v85 = v70;
    v86 = 2112;
    v87 = v52;
    _os_log_debug_impl(&dword_1BE990000, v61, OS_LOG_TYPE_DEBUG, "applicationBundleID:%@, installed:%@, containerPath:%@, callingBundlePath:%@, currentPersona:%@", buf, 0x34u);

  }
  if (a4)
  {
    objc_msgSend_URL(v34, v54, v55);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (v75)
  {
    v56 = objc_msgSend_developerType(v29, v54, v55);
    v57 = 3;
    if (v56 == 1)
      v57 = 1;
    v58 = 2 * (v56 != 1);
    if (!v29)
      v58 = 4;
    if (v9)
      v58 = v57;
    *v75 = v58;
  }

  return v37;
}

+ (id)sharedDetachedContainers
{
  if (qword_1ED702708 != -1)
    dispatch_once(&qword_1ED702708, &unk_1E782F1B8);
  return (id)qword_1ED702700;
}

+ (CKDContainer)containerWithAppContainerAccountTuple:(id)a3 deviceContext:(id)a4 sharedContainerTable:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  const char *v54;
  uint64_t v55;
  uint64_t isClientMainBundleAppleExecutable;
  const char *v57;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend_appContainerTuple(v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_metadataCache(v9, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_applicationID(v13, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_applicationMetadataForApplicationID_(v16, v20, (uint64_t)v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_metadataCache(v9, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_appContainerAccountMetadataForAppContainerAccountTuple_(v24, v25, (uint64_t)v10);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_entitlements(v21, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerOptions(v26, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_hasAllowFakeEntitlementsEntitlement(v29, v33, v34))
  {
    objc_msgSend_fakeEntitlements(v32, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend_count(v37, v38, v39);

    if (v40)
    {
      objc_msgSend_fakeEntitlements(v32, v35, v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_entitlementsByAddingOverlay_(v29, v43, (uint64_t)v42);
      v44 = objc_claimAutoreleasedReturnValue();

      v29 = (void *)v44;
    }
  }
  objc_msgSend_containerWithAppContainerTuple_processScopedClientProxy_logicalDeviceScopedClientProxy_containerEntitlements_containerOptions_sharedContainerTable_(a1, v35, (uint64_t)v13, 0, 0, v29, v32, v8);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containingBundleID(v21, v46, v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setContainingBundleID_(v45, v49, (uint64_t)v48);

  v52 = objc_msgSend_clientSDKVersion(v21, v50, v51);
  objc_msgSend_setClientSDKVersion_(v45, v53, v52);
  isClientMainBundleAppleExecutable = objc_msgSend_isClientMainBundleAppleExecutable(v21, v54, v55);
  objc_msgSend_setIsClientMainBundleAppleExecutable_(v45, v57, isClientMainBundleAppleExecutable);

  return (CKDContainer *)v45;
}

- (void)invalidate
{
  _QWORD *v3;
  os_log_t *v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  int isSuspended;
  const char *v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  CKDContainer *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  os_log_t v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  os_log_t v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  os_log_t v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  NSObject *v80;
  const char *v81;
  uint64_t v82;
  NSObject *v83;
  const char *v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  void *v89;
  NSObject *v90;
  const char *v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  void *v96;
  NSObject *v97;
  const char *v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  void *v106;
  const char *v107;
  uint64_t v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  void *v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  uint8_t buf[4];
  CKDContainer *v121;
  __int16 v122;
  void *v123;
  __int16 v124;
  void *v125;
  __int16 v126;
  void *v127;
  _BYTE v128[128];
  uint64_t v129;

  v129 = *MEMORY[0x1E0C80C00];
  v3 = (_QWORD *)MEMORY[0x1E0C95300];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v4 = (os_log_t *)MEMORY[0x1E0C952B0];
  v5 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v121 = self;
    _os_log_impl(&dword_1BE990000, v5, OS_LOG_TYPE_INFO, "Invalidating %@", buf, 0xCu);
  }
  objc_msgSend_operationQueue(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  isSuspended = objc_msgSend_isSuspended(v8, v9, v10);

  if (isSuspended)
  {
    objc_msgSend__setupOperationQueues(self, v12, v13);
  }
  else
  {
    if (*v3 != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v14 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v121 = self;
      _os_log_debug_impl(&dword_1BE990000, v14, OS_LOG_TYPE_DEBUG, "Cancelling all operations for %@", buf, 0xCu);
    }
    objc_msgSend_cloudKitSupportOperationThrottleQueue(self, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_cancelAllOperations(v17, v18, v19);

    objc_msgSend_backgroundOperationThrottleQueue(self, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_cancelAllOperations(v22, v23, v24);

    v118 = 0u;
    v119 = 0u;
    v116 = 0u;
    v117 = 0u;
    objc_msgSend_sharedClientThrottlingOperationQueue(CKDContainer, v25, v26, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_operations(v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v31, (uint64_t)&v116, v128, 16);
    if (v32)
    {
      v35 = v32;
      v36 = *(_QWORD *)v117;
      do
      {
        for (i = 0; i != v35; ++i)
        {
          if (*(_QWORD *)v117 != v36)
            objc_enumerationMutation(v30);
          v38 = *(void **)(*((_QWORD *)&v116 + 1) + 8 * i);
          objc_msgSend_container(v38, v33, v34);
          v39 = (CKDContainer *)objc_claimAutoreleasedReturnValue();

          if (v39 == self)
            objc_msgSend_cancel(v38, v33, v34);
        }
        v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v33, (uint64_t)&v116, v128, 16);
      }
      while (v35);
    }

    objc_msgSend_operationQueue(self, v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_cancelAllOperations(v42, v43, v44);

    objc_msgSend_cancelAllOperations(self->_fetchAggregator, v45, v46);
    if (*v3 != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v47 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEBUG))
    {
      v83 = v47;
      objc_msgSend_cloudKitSupportOperationThrottleQueue(self, v84, v85);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_operations(v86, v87, v88);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v121 = self;
      v122 = 2112;
      v123 = v89;
      _os_log_debug_impl(&dword_1BE990000, v83, OS_LOG_TYPE_DEBUG, "Waiting for all operations on the cloudkit service queue to finish for %@: %@", buf, 0x16u);

    }
    objc_msgSend_cloudKitSupportOperationThrottleQueue(self, v48, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_waitUntilAllOperationsAreFinished(v50, v51, v52);

    if (*v3 != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v53 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEBUG))
    {
      v90 = v53;
      objc_msgSend_backgroundOperationThrottleQueue(self, v91, v92);
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_operations(v93, v94, v95);
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v121 = self;
      v122 = 2112;
      v123 = v96;
      _os_log_debug_impl(&dword_1BE990000, v90, OS_LOG_TYPE_DEBUG, "Waiting for all operations on the background more operations queue to finish for %@: %@", buf, 0x16u);

    }
    objc_msgSend_backgroundOperationThrottleQueue(self, v54, v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_waitUntilAllOperationsAreFinished(v56, v57, v58);

    objc_msgSend_operationQueue(self, v59, v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_cancelAllOperations(v61, v62, v63);

    if (*v3 != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v64 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEBUG))
    {
      v97 = v64;
      objc_msgSend_operationQueue(self, v98, v99);
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_operations(v100, v101, v102);
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_cleanupOperationQueue(self, v104, v105);
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_operations(v106, v107, v108);
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_uncancellableOperationQueue(self, v110, v111);
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_operations(v112, v113, v114);
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v121 = self;
      v122 = 2112;
      v123 = v103;
      v124 = 2112;
      v125 = v109;
      v126 = 2112;
      v127 = v115;
      _os_log_debug_impl(&dword_1BE990000, v97, OS_LOG_TYPE_DEBUG, "Waiting for all operations to finish for %@. operationQueue=%@ cleanupOperationQueue=%@ uncancellableOperationQueue=%@", buf, 0x2Au);

    }
    objc_msgSend_operationQueue(self, v65, v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_waitUntilAllOperationsAreFinished(v67, v68, v69);

    objc_msgSend_cleanupOperationQueue(self, v70, v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_waitUntilAllOperationsAreFinished(v72, v73, v74);

    objc_msgSend_uncancellableOperationQueue(self, v75, v76);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_waitUntilAllOperationsAreFinished(v77, v78, v79);

  }
  if (*v3 != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v80 = *v4;
  if (os_log_type_enabled(*v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v121 = self;
    _os_log_impl(&dword_1BE990000, v80, OS_LOG_TYPE_INFO, "Finished flushing operation queue for %@", buf, 0xCu);
  }
  objc_msgSend_tearDownAssetTransfers(self, v81, v82);
}

- (void)_clearCaches
{
  _QWORD *v3;
  os_log_t *v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  int v28;
  CKDContainer *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = (_QWORD *)MEMORY[0x1E0C95300];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v4 = (os_log_t *)MEMORY[0x1E0C952B0];
  v5 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v28 = 134217984;
    v29 = self;
    _os_log_debug_impl(&dword_1BE990000, v5, OS_LOG_TYPE_DEBUG, "Clearing the asset cache for container %p", (uint8_t *)&v28, 0xCu);
  }
  objc_msgSend_clearAssetCache(self, v6, v7);
  if (*v3 != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v8 = *v4;
  if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEBUG))
  {
    v28 = 134217984;
    v29 = self;
    _os_log_debug_impl(&dword_1BE990000, v8, OS_LOG_TYPE_DEBUG, "Clearing the record cache for container %p", (uint8_t *)&v28, 0xCu);
  }
  objc_msgSend_clearRecordCache(self, v9, v10);
  if (*v3 != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v11 = *v4;
  if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEBUG))
  {
    v28 = 134217984;
    v29 = self;
    _os_log_debug_impl(&dword_1BE990000, v11, OS_LOG_TYPE_DEBUG, "Clearing the persisted PCS cache for container %p", (uint8_t *)&v28, 0xCu);
  }
  objc_msgSend_pcsCache(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_clearPCSCaches(v14, v15, v16);

  if (*v3 != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v17 = *v4;
  if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEBUG))
  {
    v28 = 134217984;
    v29 = self;
    _os_log_debug_impl(&dword_1BE990000, v17, OS_LOG_TYPE_DEBUG, "Clearing the in-memory PCS cache for container %p", (uint8_t *)&v28, 0xCu);
  }
  objc_msgSend_pcsCache(self, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_clearPCSMemoryCaches(v20, v21, v22);

  if (*v3 != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v23 = *v4;
  if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEBUG))
  {
    v28 = 134217984;
    v29 = self;
    _os_log_debug_impl(&dword_1BE990000, v23, OS_LOG_TYPE_DEBUG, "Clearing the container info cache for container %p", (uint8_t *)&v28, 0xCu);
  }
  objc_msgSend_sharedManager(CKDServerConfigurationManager, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_expireConfigurationForContainer_(v26, v27, (uint64_t)self);

}

- (void)_writeAdopterMetadataToCache:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  NSObject *v14;
  CKDApplicationMetadata *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t isClientMainBundleAppleExecutable;
  const char *v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  id v64;
  uint8_t buf[4];
  void *v66;
  __int16 v67;
  CKDContainer *v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_processScopedClientProxy(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_processIsAttached(v7, v8, v9))
  {
    objc_msgSend_hasTCCAuthorization(self, v10, v11);
    objc_msgSend_hasValidatedEntitlements(self, v12, v13);
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v64 = v4;
    v14 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v66 = v7;
      v67 = 2112;
      v68 = self;
      _os_log_debug_impl(&dword_1BE990000, v14, OS_LOG_TYPE_DEBUG, "Echoing proxy %@ info into metadata cache for container %@", buf, 0x16u);
    }
    v15 = [CKDApplicationMetadata alloc];
    v18 = objc_msgSend_adopterProcessType(self, v16, v17);
    objc_msgSend_containingBundleID(self, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_directoryContext(self, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_containerDirectory(v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_path(v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_clientEntitlements(v7, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend_clientSDKVersion(v7, v34, v35);
    isClientMainBundleAppleExecutable = objc_msgSend_isClientMainBundleAppleExecutable(v7, v37, v38);
    v41 = (void *)objc_msgSend_initWithAdopterProcessType_containingBundleID_applicationContainerPath_entitlements_clientSDKVersion_isClientMainBundleAppleExecutable_(v15, v40, v18, v21, v30, v33, v36, isClientMainBundleAppleExecutable);

    objc_msgSend_deviceContext(self, v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_metadataCache(v44, v45, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_applicationID(self, v48, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setApplicationMetadata_forApplicationID_(v47, v51, (uint64_t)v41, v50);

    v52 = (void *)objc_opt_new();
    objc_msgSend_options(self, v53, v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setContainerOptions_(v52, v56, (uint64_t)v55);

    objc_msgSend_deviceContext(self, v57, v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_metadataCache(v59, v60, v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v64;
    objc_msgSend_setAppContainerAccountMetadata_forAppContainerAccountTuple_(v62, v63, (uint64_t)v52, v64);

  }
}

- (BOOL)setupMMCSWrapper:(id *)a3
{
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  id v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  const char *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  int isNewEmptyCache;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  void *v54;
  const char *v55;
  void *v56;
  const char *v57;
  void *v58;
  BOOL v59;
  const char *v60;
  uint64_t v61;
  _QWORD v63[4];
  id v64;
  id v65;
  _QWORD v66[2];

  v66[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend_lock(self->_mmcsLock, a2, (uint64_t)a3);
  objc_msgSend_MMCS(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend_applicationBundleID(self, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_directoryContext(self, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_deviceContext(self, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_deviceScopedDatabase(v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = 0;
    objc_msgSend_MMCSWrapperForApplicationBundleID_directoryContext_database_error_(CKDMMCS, v21, (uint64_t)v11, v14, v20, &v65);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v65;

    if (v22)
    {
      objc_msgSend_setMMCS_(self, v24, (uint64_t)v22);
      objc_msgSend_MMCS(self, v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v28)
      {
        objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v24, v25);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v29, v30, (uint64_t)a2, self, CFSTR("CKDContainer.m"), 849, CFSTR("Expected non-nil MMCS wrapper for %@"), self);

      }
    }
    else if (a3)
    {
      *a3 = objc_retainAutorelease(v23);
    }
    objc_msgSend_MMCS(self, v24, v25);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_assetCache(v31, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    isNewEmptyCache = objc_msgSend_isNewEmptyCache(v34, v35, v36);

    if (isNewEmptyCache)
    {
      objc_msgSend_containerID(self, v38, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend_specialContainerType(v40, v41, v42);

      if (v43 == 4)
      {
        objc_msgSend_containerCloudKitDirectory(v14, v44, v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_URLByDeletingLastPathComponent(v46, v47, v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_defaultManager(MEMORY[0x1E0DA8BF8], v50, v51);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_pathInfoWithURL_(MEMORY[0x1E0DA8BF0], v53, (uint64_t)v49);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v66[0] = v54;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v55, (uint64_t)v66, 1);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v63[0] = MEMORY[0x1E0C809B0];
        v63[1] = 3221225472;
        v63[2] = sub_1BEA20DDC;
        v63[3] = &unk_1E782EDA8;
        v64 = v11;
        objc_msgSend_registerPaths_forBundleID_completionHandler_(v52, v57, (uint64_t)v56, v64, v63);

      }
    }

  }
  objc_msgSend_MMCS(self, v9, v10);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v58 != 0;

  objc_msgSend_unlock(self->_mmcsLock, v60, v61);
  return v59;
}

- (BOOL)setupAssetTransfers:(id *)a3
{
  return MEMORY[0x1E0DE7D20](self, sel_setupMMCSWrapper_, a3);
}

- (void)tearDownAssetTransfers
{
  uint64_t v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  id v7;
  id v8;

  objc_msgSend_MMCS(self, a2, v2);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_assetCache(v8, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend_evictAllFilesForced_(v5, v6, 0);

}

- (id)CKPropertiesDescription
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  int v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  int v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  int OnlyManatee;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  int v57;
  const char *v58;
  uint64_t v59;
  const char *v60;
  void *v61;
  void *v62;
  const char *v63;
  void *v64;
  const char *v65;
  void *v66;

  objc_msgSend_arrayWithCapacity_(MEMORY[0x1E0C99DE8], a2, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_containerID(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_applicationID(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_personaID(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v4, v14, (uint64_t)CFSTR("containerID=%@, applicationID=%@, personaID=%@"), v7, v10, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v16, (uint64_t)v15);

  objc_msgSend_arrayWithCapacity_(MEMORY[0x1E0C99DE8], v17, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_processScopedClientProxy(self, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = objc_msgSend_isSandboxed(v21, v22, v23);

  if ((_DWORD)v10)
    objc_msgSend_addObject_(v18, v24, (uint64_t)CFSTR("sandboxed"));
  if (objc_msgSend_isForClouddInternalUse(self, v24, v25))
    objc_msgSend_addObject_(v18, v26, (uint64_t)CFSTR("internal"));
  if (objc_msgSend_isClientMainBundleAppleExecutable(self, v26, v27))
    objc_msgSend_addObject_(v18, v28, (uint64_t)CFSTR("clientBundleIsAppleExecutable"));
  objc_msgSend_options(self, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend_useZoneWidePCS(v30, v31, v32);

  if (v33)
    objc_msgSend_addObject_(v18, v34, (uint64_t)CFSTR("zoneish"));
  objc_msgSend_options(self, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend_mmcsEncryptionSupport(v36, v37, v38);

  if (v39 == 3)
  {
    objc_msgSend_addObject_(v18, v40, (uint64_t)CFSTR("mmcsv1-v2"));
  }
  else if (v39 == 2)
  {
    objc_msgSend_addObject_(v18, v40, (uint64_t)CFSTR("mmcsv2"));
  }
  objc_msgSend_options(self, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend_bypassPCSEncryption(v42, v43, v44);

  if (v45)
    objc_msgSend_addObject_(v18, v46, (uint64_t)CFSTR("nopcs"));
  objc_msgSend_options(self, v46, v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  OnlyManatee = objc_msgSend_forceEnableReadOnlyManatee(v48, v49, v50);

  if (OnlyManatee)
    objc_msgSend_addObject_(v18, v52, (uint64_t)CFSTR("forceManatee"));
  objc_msgSend_options(self, v52, v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend_useAnonymousToServerShareParticipants(v54, v55, v56);

  if (v57)
    objc_msgSend_addObject_(v18, v58, (uint64_t)CFSTR("anonymousToServerShareParticipants"));
  if (objc_msgSend_count(v18, v58, v59))
  {
    v61 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_componentsJoinedByString_(v18, v60, (uint64_t)CFSTR("|"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v61, v63, (uint64_t)CFSTR("flags=%@"), v62);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v3, v65, (uint64_t)v64);

  }
  objc_msgSend_componentsJoinedByString_(v3, v60, (uint64_t)CFSTR(", "));
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  return v66;
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKDContainer *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
}

- (void)fetchServerEnvironmentForOperation:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1BEA21308;
  v9[3] = &unk_1E782F300;
  v10 = v6;
  v7 = v6;
  objc_msgSend__fetchContainerServerInfoForOperation_requireUserIDs_completionHandler_(self, v8, (uint64_t)a3, 0, v9);

}

- (id)pcsManagerIfExists
{
  uint64_t v2;
  CKDPCSManager *v4;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self->_pcsManagerLock, a2, v2);
  pthread_rwlock_rdlock(&self->rwAccountLock);
  v4 = self->_pcsManager;
  pthread_rwlock_unlock(&self->rwAccountLock);
  objc_msgSend_unlock(self->_pcsManagerLock, v5, v6);
  return v4;
}

- (CKDPCSCache)pcsCache
{
  _opaque_pthread_rwlock_t *p_rwAccountLock;
  CKDPCSCache *v5;
  const char *v6;
  uint64_t v7;
  CKDPCSCache *pcsCache;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  CKDPCSCache *v23;
  CKDPCSCache *v24;
  void *v26;
  const char *v27;

  p_rwAccountLock = &self->rwAccountLock;
  pthread_rwlock_rdlock(&self->rwAccountLock);
  v5 = self->_pcsCache;
  pthread_rwlock_unlock(p_rwAccountLock);
  if (!v5)
  {
    pthread_rwlock_wrlock(p_rwAccountLock);
    pcsCache = self->_pcsCache;
    if (!pcsCache)
    {
      if (!self->_account)
      {
        objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v6, v7);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v26, v27, (uint64_t)a2, self, CFSTR("CKDContainer.m"), 1294, CFSTR("Container %@ had an unexpectedly-nil account ivar when creating a pcs cache"), self);

      }
      objc_msgSend_deviceContext(self, v6, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_containerID(self, v10, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_accountOverrideInfo(self, v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_accountID(self->_account, v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_encryptionServiceName(self, v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_pcsCacheForContainerID_accountOverrideInfo_accountID_encryptionServiceName_(v9, v22, (uint64_t)v12, v15, v18, v21);
      v23 = (CKDPCSCache *)objc_claimAutoreleasedReturnValue();
      v24 = self->_pcsCache;
      self->_pcsCache = v23;

      pcsCache = self->_pcsCache;
    }
    v5 = pcsCache;
    pthread_rwlock_unlock(p_rwAccountLock);
  }
  return v5;
}

- (CKDRecordCache)recordCache
{
  const char *v3;
  CKDRecordCache *recordCache;
  CKDRecordCache *v5;
  CKDRecordCache *v6;
  CKDRecordCache *v7;

  os_unfair_lock_lock((os_unfair_lock_t)&unk_1ED700E20);
  recordCache = self->_recordCache;
  if (!recordCache)
  {
    objc_msgSend_recordCacheForContainer_(CKDRecordCache, v3, (uint64_t)self);
    v5 = (CKDRecordCache *)objc_claimAutoreleasedReturnValue();
    v6 = self->_recordCache;
    self->_recordCache = v5;

    recordCache = self->_recordCache;
  }
  v7 = recordCache;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ED700E20);
  return v7;
}

- (CKDAnonymousSharingManager)anonymousSharingManager
{
  uint64_t v2;
  CKDAnonymousSharingManager *anonymousSharingManager;
  CKDAnonymousSharingManager *v5;
  const char *v6;
  CKDAnonymousSharingManager *v7;
  CKDAnonymousSharingManager *v8;
  CKDAnonymousSharingManager *v9;
  const char *v10;
  uint64_t v11;

  objc_msgSend_lock(self->_anonymousSharingManagerLock, a2, v2);
  anonymousSharingManager = self->_anonymousSharingManager;
  if (!anonymousSharingManager)
  {
    v5 = [CKDAnonymousSharingManager alloc];
    v7 = (CKDAnonymousSharingManager *)objc_msgSend_initWithContainer_(v5, v6, (uint64_t)self);
    v8 = self->_anonymousSharingManager;
    self->_anonymousSharingManager = v7;

    anonymousSharingManager = self->_anonymousSharingManager;
  }
  v9 = anonymousSharingManager;
  objc_msgSend_unlock(self->_anonymousSharingManagerLock, v10, v11);
  return v9;
}

- (BOOL)_isAdopterAppleInternal
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  char hasSuffix;
  const char *v13;
  uint64_t v14;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  char isAppleInternal;

  objc_msgSend_deviceContext(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_testDeviceReference(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceID(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  hasSuffix = objc_msgSend_hasSuffix_(v10, v11, (uint64_t)CFSTR("MasqueradeAsNonAppleAdopter"));

  if ((hasSuffix & 1) != 0)
    return 0;
  if ((objc_msgSend_isClientMainBundleAppleExecutable(self, v13, v14) & 1) != 0)
    return 1;
  objc_msgSend_containerID(self, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  isAppleInternal = objc_msgSend_isAppleInternal(v18, v19, v20);

  return isAppleInternal;
}

- (CKDIdentityCache)publicIdentitiesDiskCache
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  CKDIdentityCache *publicIdentitiesDiskCache;
  void *v7;
  const char *v8;
  CKDIdentityCache *v9;
  CKDIdentityCache *v10;
  CKDIdentityCache *v11;
  const char *v12;
  uint64_t v13;

  objc_msgSend_lock(self->_publicIdentityServiceLock, a2, v2);
  publicIdentitiesDiskCache = self->_publicIdentitiesDiskCache;
  if (!publicIdentitiesDiskCache)
  {
    objc_msgSend_deviceContext(self, v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_cacheWithDeviceContext_(CKDIdentityCache, v8, (uint64_t)v7);
    v9 = (CKDIdentityCache *)objc_claimAutoreleasedReturnValue();
    v10 = self->_publicIdentitiesDiskCache;
    self->_publicIdentitiesDiskCache = v9;

    publicIdentitiesDiskCache = self->_publicIdentitiesDiskCache;
  }
  v11 = publicIdentitiesDiskCache;
  objc_msgSend_unlock(self->_publicIdentityServiceLock, v12, v13);
  return v11;
}

- (CKDPublicIdentityLookupService)foregroundPublicIdentityLookupService
{
  uint64_t v2;
  CKDPublicIdentityLookupService *foregroundPublicIdentityLookupService;
  CKDPublicIdentityLookupService *v5;
  const char *v6;
  CKDPublicIdentityLookupService *v7;
  CKDPublicIdentityLookupService *v8;
  CKDPublicIdentityLookupService *v9;
  const char *v10;
  uint64_t v11;

  objc_msgSend_lock(self->_publicIdentityServiceLock, a2, v2);
  foregroundPublicIdentityLookupService = self->_foregroundPublicIdentityLookupService;
  if (!foregroundPublicIdentityLookupService)
  {
    v5 = [CKDPublicIdentityLookupService alloc];
    v7 = (CKDPublicIdentityLookupService *)objc_msgSend_initWithContainer_(v5, v6, (uint64_t)self);
    v8 = self->_foregroundPublicIdentityLookupService;
    self->_foregroundPublicIdentityLookupService = v7;

    foregroundPublicIdentityLookupService = self->_foregroundPublicIdentityLookupService;
  }
  v9 = foregroundPublicIdentityLookupService;
  objc_msgSend_unlock(self->_publicIdentityServiceLock, v10, v11);
  return v9;
}

- (CKDPublicIdentityLookupService)backgroundPublicIdentityLookupService
{
  uint64_t v2;
  CKDPublicIdentityLookupService *backgroundPublicIdentityLookupService;
  CKDPublicIdentityLookupService *v5;
  const char *v6;
  CKDPublicIdentityLookupService *v7;
  CKDPublicIdentityLookupService *v8;
  CKDPublicIdentityLookupService *v9;
  const char *v10;
  uint64_t v11;

  objc_msgSend_lock(self->_publicIdentityServiceLock, a2, v2);
  backgroundPublicIdentityLookupService = self->_backgroundPublicIdentityLookupService;
  if (!backgroundPublicIdentityLookupService)
  {
    v5 = [CKDPublicIdentityLookupService alloc];
    v7 = (CKDPublicIdentityLookupService *)objc_msgSend_initWithContainer_(v5, v6, (uint64_t)self);
    v8 = self->_backgroundPublicIdentityLookupService;
    self->_backgroundPublicIdentityLookupService = v7;

    backgroundPublicIdentityLookupService = self->_backgroundPublicIdentityLookupService;
  }
  v9 = backgroundPublicIdentityLookupService;
  objc_msgSend_unlock(self->_publicIdentityServiceLock, v10, v11);
  return v9;
}

+ (void)initialize
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  int isAppleInternalInstall;
  NSObject *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  isAppleInternalInstall = objc_msgSend_isAppleInternalInstall(v3, v4, v5);

  if (isAppleInternalInstall)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v7 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
    {
      v8 = 136315138;
      v9 = "Wed Dec 31 16:00:00 1969";
      _os_log_impl(&dword_1BE990000, v7, OS_LOG_TYPE_INFO, "CloudKitDaemon.framework was built at %s", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)_lockedHandleTCCEvent:(unint64_t)a3 authorizationRecord:(id)a4
{
  id v5;
  uint64_t authorization_right;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  void *v11;
  int64_t hasTCCAuthorizationTernary;
  NSObject *v14;
  NSObject *v15;
  const char *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_tccAuthQueue);
  authorization_right = tcc_authorization_record_get_authorization_right();
  v9 = 1;
  if (authorization_right != 2)
    v9 = -1;
  if (authorization_right)
    v10 = v9;
  else
    v10 = 0;
  objc_msgSend_applicationBundleIdentifierForTCC(self, v7, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  hasTCCAuthorizationTernary = self->_hasTCCAuthorizationTernary;
  if (hasTCCAuthorizationTernary != -1 && v10 == -1)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v14 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
    {
      v17 = 138543362;
      v18 = v11;
      _os_log_impl(&dword_1BE990000, v14, OS_LOG_TYPE_INFO, "Received TCC access reset, resetting TCC access for bundle identifier '%{public}@'", (uint8_t *)&v17, 0xCu);
    }
    if (TCCAccessSetForBundleId())
      v10 = 1;
    else
      v10 = -1;
    hasTCCAuthorizationTernary = self->_hasTCCAuthorizationTernary;
  }
  if (hasTCCAuthorizationTernary != v10)
  {
    if (v10)
    {
      if (v10 == 1)
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v15 = *MEMORY[0x1E0C952B0];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEFAULT))
          goto LABEL_35;
        v17 = 138543362;
        v18 = v11;
        v16 = "Updated authorization on TCC event to: ALLOWED for bundle identifier '%{public}@'";
      }
      else
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v15 = *MEMORY[0x1E0C952B0];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEFAULT))
          goto LABEL_35;
        v17 = 138543362;
        v18 = v11;
        v16 = "Updated authorization on TCC event to: UNKNOWN for bundle identifier '%{public}@'";
      }
    }
    else
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v15 = *MEMORY[0x1E0C952B0];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEFAULT))
        goto LABEL_35;
      v17 = 138543362;
      v18 = v11;
      v16 = "Updated authorization on TCC event to: DENY for bundle identifier '%{public}@'";
    }
    _os_log_impl(&dword_1BE990000, v15, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v17, 0xCu);
LABEL_35:
    self->_hasTCCAuthorizationTernary = v10;
  }

}

- (void)accountAccessAuthorizationWithCompletionHandler:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  void *v5;
  void *v6;
  const char *v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  uint64_t hasTCCAuthorization;
  NSObject *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  v5 = (void *)*MEMORY[0x1E0C952F8];
  if (v4)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], v5);
    v6 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEFAULT))
    {
      v8 = v6;
      objc_msgSend_ckShortDescription(self, v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412290;
      v15 = v11;
      _os_log_impl(&dword_1BE990000, v8, OS_LOG_TYPE_DEFAULT, "Checking TCC authorization for container %@", (uint8_t *)&v14, 0xCu);

    }
    hasTCCAuthorization = objc_msgSend_hasTCCAuthorization_(self, v7, 0);
    v4[2](v4, hasTCCAuthorization, 0);
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], v5);
    v13 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v14) = 0;
      _os_log_debug_impl(&dword_1BE990000, v13, OS_LOG_TYPE_DEBUG, "No completion handler", (uint8_t *)&v14, 2u);
    }
  }

}

- (void)_lockedSetHasTCCAuthorizationTernary:(int64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_tccAuthQueue);
  self->_hasTCCAuthorizationTernary = a3;
}

- (void)performOperation:(id)a3 initialMessageReplyBlock:(id)a4
{
  objc_msgSend_performOperation_initialMessageReplyBlock_customCompletionBlock_(self, a2, (uint64_t)a3, a4, 0);
}

- (void)performOperation:(id)a3 initialMessageReplyBlock:(id)a4 customCompletionBlock:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  id v49;
  void *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  void *v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  NSString *v64;
  Class v65;
  const char *v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  void *v84;
  const char *v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  CKDLongLivedOperationPersistedCallbackProxy *v93;
  void *v94;
  void *v95;
  id v96;
  _QWORD v97[4];
  id v98;
  CKDContainer *v99;
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;

  v8 = a3;
  v9 = a4;
  v96 = a5;
  objc_msgSend_operationInfo(v8, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_processScopedClientProxy(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operationInfo(v8, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_callbackProxyEndpoint(v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interface(v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_protocol(v24, v25, v26);
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = (void *)v27;
  v29 = &unk_1EF5B1380;
  if (v27)
    v29 = (void *)v27;
  v30 = v29;

  objc_msgSend_operationInfo(v8, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend_requestOriginator(v33, v34, v35);

  if (!v36)
  {
    objc_msgSend_currentConnection(MEMORY[0x1E0CB3B38], v37, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_operationInfo(v8, v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v42;
    if (v39)
      objc_msgSend_setRequestOriginator_(v42, v43, 4);
    else
      objc_msgSend_setRequestOriginator_(v42, v43, 1);

  }
  if (objc_msgSend_processIsAttached(v15, v37, v38))
  {
    v104 = 0;
    objc_msgSend_validateAgainstLiveContainer_error_(v8, v45, (uint64_t)self, &v104);
    v49 = v104;
  }
  else
  {
    v50 = (void *)MEMORY[0x1E0C94FF8];
    v51 = *MEMORY[0x1E0C94B20];
    objc_msgSend_operationID(v8, v45, v46);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_format_(v50, v53, v51, 2005, CFSTR("Client went away before operation %@ could be validated; failing"),
      v52);
    v49 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (v49)
  {
    objc_msgSend_setError_(v8, v47, (uint64_t)v49);
    objc_msgSend_clientOperationCallbackProxy(v8, v54, v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_activate(v56, v57, v58);

    objc_msgSend__handleCompletionForOperation_initialMessageReplyBlock_(self, v59, (uint64_t)v8, v9);
    v60 = v96;
  }
  else
  {
    objc_msgSend_operationInfo(v8, v47, v48);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_ckOperationClassName(v61, v62, v63);
    v64 = (NSString *)objc_claimAutoreleasedReturnValue();
    v65 = NSClassFromString(v64);

    if (objc_msgSend_isLongLived(v8, v66, v67)
      && (objc_msgSend_isLongLivedCallbackRelayOperation(v8, v68, v69) & 1) == 0)
    {
      v93 = [CKDLongLivedOperationPersistedCallbackProxy alloc];
      objc_msgSend_operationInfo(v8, v70, v71);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_operationID(v95, v72, v73);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = objc_msgSend_daemonCallbackCompletionSelector(v65, v75, v76);
      objc_msgSend_deviceContext(self, v78, v79);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_operationInfoCache(v94, v80, v81);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = (void *)objc_msgSend_initWithOperationID_callbackProtocol_completionSelector_operationInfoCache_(v93, v83, (uint64_t)v74, v30, v77, v82);
      objc_msgSend_setClientOperationCallbackProxy_(v8, v85, (uint64_t)v84);

    }
    objc_msgSend_clientOperationCallbackProxy(v8, v68, v69);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_activate(v86, v87, v88);

    objc_msgSend_clientOperationCallbackProxy(v8, v89, v90);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v97[0] = MEMORY[0x1E0C809B0];
    v97[1] = 3221225472;
    v97[2] = sub_1BEA22550;
    v97[3] = &unk_1E782F458;
    v98 = v8;
    v102 = v96;
    v103 = v9;
    v99 = self;
    v100 = v12;
    v101 = v30;
    objc_msgSend_handleWillStart_(v91, v92, (uint64_t)v97);

    v60 = v96;
  }

}

- (void)addOperation:(id)a3
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
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  NSObject *v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  CKDContainer *v27;
  id v28;

  v4 = a3;
  objc_msgSend_operationID(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operationInfo(v4, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pendingOperationIDs(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v13);
  objc_msgSend_pendingOperationIDs(self, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v16, v17, (uint64_t)v7);

  objc_sync_exit(v13);
  objc_msgSend_cancellationQueue(self, v18, v19);
  v20 = objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = sub_1BEA22CFC;
  v24[3] = &unk_1E782F4A8;
  v25 = v4;
  v26 = v10;
  v27 = self;
  v28 = v7;
  v21 = v7;
  v22 = v10;
  v23 = v4;
  dispatch_async(v20, v24);

}

- (int64_t)_applicationPermissionStatusFromUserPrivacySetting:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
    return 1;
  else
    return qword_1BECBB4C8[a3];
}

- (void)reloadAccountWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  id v9;
  const char *v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  CKDContainer *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v5 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v14 = self;
    _os_log_impl(&dword_1BE990000, v5, OS_LOG_TYPE_INFO, "Will reload the account for %@", buf, 0xCu);
  }
  objc_msgSend_uncancellableOperationQueue(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1BEA23310;
  v11[3] = &unk_1E782F4D0;
  v11[4] = self;
  v12 = v4;
  v9 = v4;
  objc_msgSend_addOperationWithBlock_(v8, v10, (uint64_t)v11);

}

- (void)statusForApplicationPermission:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  CKDFetchUserPrivacySettingsOperation *v12;
  const char *v13;
  void *v14;
  const char *v15;
  void *v16;
  id v17;
  const char *v18;
  const char *v19;
  _QWORD v20[5];
  id v21;
  id v22[2];
  id location;

  v6 = a4;
  objc_msgSend_defaultConvenienceOperationConfiguration(MEMORY[0x1E0C94F80], v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_opt_new();
  objc_msgSend_setResolvedConfiguration_(v10, v11, (uint64_t)v9);
  v12 = [CKDFetchUserPrivacySettingsOperation alloc];
  objc_msgSend_containerForOperationInfo_(self, v13, (uint64_t)v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend_initWithOperationInfo_container_(v12, v15, (uint64_t)v10, v14);

  objc_initWeak(&location, v16);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = sub_1BEA23618;
  v20[3] = &unk_1E782F4F8;
  objc_copyWeak(v22, &location);
  v22[1] = (id)a3;
  v20[4] = self;
  v17 = v6;
  v21 = v17;
  objc_msgSend_setCompletionBlock_(v16, v18, (uint64_t)v20);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v19, (uint64_t)v16, 0);

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);

}

- (void)_globalStatusForApplicationPermission:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  CKDBatchFetchUserPrivacySettingsOperation *v12;
  const char *v13;
  void *v14;
  const char *v15;
  void *v16;
  id v17;
  const char *v18;
  const char *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23[2];
  id from;
  id location;

  v6 = a4;
  objc_msgSend_defaultConvenienceOperationConfiguration(MEMORY[0x1E0C94F80], v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_opt_new();
  objc_msgSend_setResolvedConfiguration_(v10, v11, (uint64_t)v9);
  v12 = [CKDBatchFetchUserPrivacySettingsOperation alloc];
  objc_msgSend_containerForOperationInfo_(self, v13, (uint64_t)v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend_initWithOperationInfo_container_(v12, v15, (uint64_t)v10, v14);

  objc_initWeak(&location, self);
  objc_initWeak(&from, v16);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = sub_1BEA2387C;
  v20[3] = &unk_1E782F520;
  objc_copyWeak(&v22, &from);
  v17 = v6;
  v21 = v17;
  objc_copyWeak(v23, &location);
  v23[1] = (id)a3;
  v20[4] = self;
  objc_msgSend_setCompletionBlock_(v16, v18, (uint64_t)v20);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v19, (uint64_t)v16, 0);
  objc_destroyWeak(v23);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

- (void)_setApplicationPermission:(unint64_t)a3 enabled:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL4 v5;
  char v6;
  id v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  const char *v14;
  CKDSaveUserPrivacySettingsOperation *v15;
  const char *v16;
  void *v17;
  const char *v18;
  void *v19;
  id v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  id v27;
  id v28;
  BOOL v29;
  id location;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  objc_msgSend_defaultConvenienceOperationConfiguration(MEMORY[0x1E0C94F80], v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_opt_new();
  objc_msgSend_setResolvedConfiguration_(v12, v13, (uint64_t)v11);
  if ((v6 & 1) != 0)
  {
    if (v5)
      objc_msgSend_setDiscoverable_(v12, v14, 1);
    else
      objc_msgSend_setDiscoverable_(v12, v14, 2);
  }
  v15 = [CKDSaveUserPrivacySettingsOperation alloc];
  objc_msgSend_containerForOperationInfo_(self, v16, (uint64_t)v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend_initWithOperationInfo_container_(v15, v18, (uint64_t)v12, v17);

  objc_initWeak(&location, v19);
  v23 = MEMORY[0x1E0C809B0];
  v24 = 3221225472;
  v25 = sub_1BEA23C28;
  v26 = &unk_1E782F548;
  objc_copyWeak(&v28, &location);
  v20 = v8;
  v27 = v20;
  v29 = v5;
  objc_msgSend_setCompletionBlock_(v19, v21, (uint64_t)&v23);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v22, (uint64_t)v19, 0, v23, v24, v25, v26);

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);

}

- (void)requestApplicationPermission:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  _QWORD v9[5];
  id v10;
  unint64_t v11;

  v6 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1BEA23D48;
  v9[3] = &unk_1E782F628;
  v10 = v6;
  v11 = a3;
  v9[4] = self;
  v7 = v6;
  objc_msgSend_statusForApplicationPermission_completionHandler_(self, v8, a3, v9);

}

- (id)openFileWithOpenInfo:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a3;
  objc_msgSend_logicalDeviceScopedClientProxy(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_processIsAttached(v9, v10, v11) & 1) != 0)
  {
    objc_msgSend_openFileWithOpenInfo_error_(v9, v12, (uint64_t)v6, a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v12, *MEMORY[0x1E0C94B20], 1000, CFSTR("nil connection"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (a4)
      *a4 = objc_retainAutorelease(v14);

    v13 = 0;
  }

  return v13;
}

- (id)getFileMetadataWithFileHandle:(id)a3 openInfo:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  void *v17;
  void *v18;

  v8 = a3;
  v9 = a4;
  objc_msgSend_processScopedClientProxy(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_processIsAttached(v12, v13, v14) & 1) != 0)
  {
    objc_msgSend_getFileMetadataWithFileHandle_openInfo_error_(v12, v15, (uint64_t)v8, v9, a5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v15, *MEMORY[0x1E0C94B20], 1000, CFSTR("nil connection"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (a5)
      *a5 = objc_retainAutorelease(v17);

    v16 = 0;
  }

  return v16;
}

- (id)readBytesOfInMemoryAssetContentWithUUID:(id)a3 offset:(unint64_t)a4 length:(unint64_t)a5 error:(id *)a6
{
  id v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  void *v17;
  void *v18;
  void *v19;

  v10 = a3;
  objc_msgSend_logicalDeviceScopedClientProxy(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_processIsAttached(v13, v14, v15) & 1) != 0)
  {
    objc_msgSend_readBytesOfInMemoryAssetContentWithUUID_offset_length_error_(v13, v16, (uint64_t)v10, a4, a5, a6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v16, *MEMORY[0x1E0C94B20], 1000, CFSTR("nil connection"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (a6)
      *a6 = objc_retainAutorelease(v18);

    v17 = 0;
  }

  return v17;
}

- (void)fetchLongLivedOperationsWithIDs:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  const char *v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  objc_msgSend_uncancellableOperationQueue(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1BEA24A40;
  v14[3] = &unk_1E782F678;
  v14[4] = self;
  v15 = v6;
  v16 = v7;
  v11 = v7;
  v12 = v6;
  objc_msgSend_addOperationWithBlock_(v10, v13, (uint64_t)v14);

}

- (void)fetchAllLongLivedOperationIDsWithCompletionHandler:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  id v8;
  const char *v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  objc_msgSend_uncancellableOperationQueue(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1BEA24B54;
  v10[3] = &unk_1E782F4D0;
  v10[4] = self;
  v11 = v4;
  v8 = v4;
  objc_msgSend_addOperationWithBlock_(v7, v9, (uint64_t)v10);

}

- (void)performDiscoverUserIdentitiesOperation:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  CKDDiscoverUserIdentitiesOperation *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  id v13;
  const char *v14;
  const char *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = [CKDDiscoverUserIdentitiesOperation alloc];
  objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(&location, v12);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1BEA24D24;
  v16[3] = &unk_1E782F6A0;
  v13 = v6;
  v17 = v13;
  objc_copyWeak(&v18, &location);
  objc_msgSend_setDiscoverUserIdentitiesProgressBlock_(v12, v14, (uint64_t)v16);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v15, (uint64_t)v12, v7);
  objc_destroyWeak(&v18);

  objc_destroyWeak(&location);
}

- (void)performDiscoverAllUserIdentitiesOperation:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  CKDDiscoverAllUserIdentitiesOperation *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  id v13;
  const char *v14;
  const char *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = [CKDDiscoverAllUserIdentitiesOperation alloc];
  objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(&location, v12);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1BEA24FBC;
  v16[3] = &unk_1E782F6A0;
  v13 = v6;
  v17 = v13;
  objc_copyWeak(&v18, &location);
  objc_msgSend_setDiscoverUserIdentitiesProgressBlock_(v12, v14, (uint64_t)v16);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v15, (uint64_t)v12, v7);
  objc_destroyWeak(&v18);

  objc_destroyWeak(&location);
}

- (void)performFetchShareParticipantsOperation:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  CKDFetchShareParticipantsOperation *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  id v13;
  const char *v14;
  const char *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = [CKDFetchShareParticipantsOperation alloc];
  objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(&location, v12);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1BEA25250;
  v16[3] = &unk_1E782F6C8;
  v13 = v6;
  v17 = v13;
  objc_copyWeak(&v18, &location);
  objc_msgSend_setShareParticipantFetchedBlock_(v12, v14, (uint64_t)v16);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v15, (uint64_t)v12, v7);
  objc_destroyWeak(&v18);

  objc_destroyWeak(&location);
}

- (void)performModifyRecordZonesOperation:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  CKDModifyRecordZonesOperation *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  uint64_t v13;
  id v14;
  const char *v15;
  id v16;
  const char *v17;
  const char *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = [CKDModifyRecordZonesOperation alloc];
  objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(&location, v12);
  v13 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = sub_1BEA2556C;
  v22[3] = &unk_1E782F6F0;
  objc_copyWeak(&v24, &location);
  v14 = v6;
  v23 = v14;
  objc_msgSend_setSaveCompletionBlock_(v12, v15, (uint64_t)v22);
  v19[0] = v13;
  v19[1] = 3221225472;
  v19[2] = sub_1BEA25738;
  v19[3] = &unk_1E782F718;
  v16 = v14;
  v20 = v16;
  objc_copyWeak(&v21, &location);
  objc_msgSend_setDeleteCompletionBlock_(v12, v17, (uint64_t)v19);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v18, (uint64_t)v12, v7);
  objc_destroyWeak(&v21);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

}

- (void)performFetchRecordZonesOperation:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  CKDFetchRecordZonesOperation *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  id v13;
  const char *v14;
  const char *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = [CKDFetchRecordZonesOperation alloc];
  objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(&location, v12);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1BEA259D0;
  v16[3] = &unk_1E782F740;
  objc_copyWeak(&v18, &location);
  v13 = v6;
  v17 = v13;
  objc_msgSend_setRecordZoneFetchedProgressBlock_(v12, v14, (uint64_t)v16);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v15, (uint64_t)v12, v7);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

- (void)performFetchDatabaseChangesOperation:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  CKDFetchDatabaseChangesOperation *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  uint64_t v13;
  id v14;
  const char *v15;
  id v16;
  const char *v17;
  id v18;
  const char *v19;
  id v20;
  const char *v21;
  id v22;
  const char *v23;
  const char *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = [CKDFetchDatabaseChangesOperation alloc];
  objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(&location, v12);
  v13 = MEMORY[0x1E0C809B0];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = sub_1BEA25E78;
  v37[3] = &unk_1E782F768;
  v14 = v6;
  v38 = v14;
  objc_copyWeak(&v39, &location);
  objc_msgSend_setRecordZoneWithIDChangedBlock_(v12, v15, (uint64_t)v37);
  v34[0] = v13;
  v34[1] = 3221225472;
  v34[2] = sub_1BEA25FB8;
  v34[3] = &unk_1E782F768;
  v16 = v14;
  v35 = v16;
  objc_copyWeak(&v36, &location);
  objc_msgSend_setRecordZoneWithIDWasDeletedBlock_(v12, v17, (uint64_t)v34);
  v31[0] = v13;
  v31[1] = 3221225472;
  v31[2] = sub_1BEA260F8;
  v31[3] = &unk_1E782F768;
  v18 = v16;
  v32 = v18;
  objc_copyWeak(&v33, &location);
  objc_msgSend_setRecordZoneWithIDWasPurgedBlock_(v12, v19, (uint64_t)v31);
  v28[0] = v13;
  v28[1] = 3221225472;
  v28[2] = sub_1BEA26238;
  v28[3] = &unk_1E782F768;
  v20 = v18;
  v29 = v20;
  objc_copyWeak(&v30, &location);
  objc_msgSend_setRecordZoneWithIDWasDeletedDueToEncryptedDataResetBlock_(v12, v21, (uint64_t)v28);
  v25[0] = v13;
  v25[1] = 3221225472;
  v25[2] = sub_1BEA26378;
  v25[3] = &unk_1E782F790;
  v22 = v20;
  v26 = v22;
  objc_copyWeak(&v27, &location);
  objc_msgSend_setServerChangeTokenUpdatedBlock_(v12, v23, (uint64_t)v25);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v24, (uint64_t)v12, v7);
  objc_destroyWeak(&v27);

  objc_destroyWeak(&v30);
  objc_destroyWeak(&v33);

  objc_destroyWeak(&v36);
  objc_destroyWeak(&v39);

  objc_destroyWeak(&location);
}

- (void)performCheckSupportedDeviceCapabilitiesOperation:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  CKDCheckSupportedDeviceCapabilitiesOperation *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  id v13;
  const char *v14;
  const char *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = [CKDCheckSupportedDeviceCapabilitiesOperation alloc];
  objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(&location, v12);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1BEA26634;
  v16[3] = &unk_1E782F7B8;
  objc_copyWeak(&v18, &location);
  v13 = v6;
  v17 = v13;
  objc_msgSend_setCheckSupportedDeviceCapabilitiesProgressBlock_(v12, v14, (uint64_t)v16);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v15, (uint64_t)v12, v7);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

- (void)enumerateClientContainers:(id)a3
{
  void (**v4)(id, _QWORD);
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  objc_msgSend_clientContainers(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v7);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend_clientContainers(self, v8, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allObjects(v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v19, v23, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v20;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v20 != v16)
          objc_enumerationMutation(v13);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v17++));
      }
      while (v15 != v17);
      v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v18, (uint64_t)&v19, v23, 16);
    }
    while (v15);
  }

  objc_sync_exit(v7);
}

- (BOOL)isEligibleForBroadcastingToContainer:(id)a3
{
  CKDContainer *v4;
  const char *v5;
  uint64_t v6;
  CKDContainer *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  char isEqual;
  void *v41;
  void *v42;

  v4 = (CKDContainer *)a3;
  v7 = v4;
  if (self == v4)
  {
    isEqual = 1;
  }
  else
  {
    objc_msgSend_containerID(v4, v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_containerID(self, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isEqual_(v8, v12, (uint64_t)v11))
    {
      objc_msgSend_account(v7, v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_accountID(v15, v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_account(self, v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_accountID(v21, v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_isEqualToString_(v18, v25, (uint64_t)v24))
      {
        objc_msgSend_personaID(v7, v26, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_personaID(self, v29, v30);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (v28 == v33)
        {
          isEqual = 1;
        }
        else
        {
          objc_msgSend_personaID(v7, v31, v32);
          v41 = v15;
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_personaID(self, v35, v36);
          v42 = v28;
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          isEqual = objc_msgSend_isEqual_(v34, v38, (uint64_t)v37);

          v28 = v42;
          v15 = v41;
        }

      }
      else
      {
        isEqual = 0;
      }

    }
    else
    {
      isEqual = 0;
    }

  }
  return isEqual;
}

- (void)_enumerateEligibleConnectedContainersForOOPUIContainer:(id)a3
{
  const char *v5;
  uint64_t v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  const char *v11;
  void *v12;
  const char *v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  CKDContainer *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v5, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v12, v13, (uint64_t)a2, self, CFSTR("CKDContainer.m"), 2660, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

  }
  objc_msgSend_sharedConnectionManager(CKDXPCConnectionManager, v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v9 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v17 = self;
    _os_log_debug_impl(&dword_1BE990000, v9, OS_LOG_TYPE_DEBUG, "Checking eligible containers for OOP-UI container %@", buf, 0xCu);
  }
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1BEA26C68;
  v14[3] = &unk_1E782F808;
  v14[4] = self;
  v15 = v7;
  v10 = v7;
  objc_msgSend_enumerateConnections_(v8, v11, (uint64_t)v14);

}

- (void)_broadcastUpdateIfNeededForRecord:(id)a3 recordXPCMetadata:(id)a4 recordID:(id)a5 isDeleted:(BOOL)a6 error:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  int hasOutOfProcessUIEntitlement;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  id v31;
  const char *v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  BOOL v37;
  uint8_t buf[4];
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  objc_msgSend_entitlements(self, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  hasOutOfProcessUIEntitlement = objc_msgSend_hasOutOfProcessUIEntitlement(v18, v19, v20);

  if (hasOutOfProcessUIEntitlement)
  {
    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v30 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v39 = v12;
        _os_log_debug_impl(&dword_1BE990000, v30, OS_LOG_TYPE_DEBUG, "Not informing Sharing UI observers about unknown update for record in OOP UI container: %@", buf, 0xCu);
      }
    }
    else
    {
      v24 = (void *)objc_msgSend_copy(v12, v22, v23);
      if (v24)
      {
        v26 = v24;
        objc_msgSend_updateWithSavedRecordXPCMetadata_shouldOnlySaveAssetContent_(v24, v25, (uint64_t)v13, 0);
        v29 = (void *)objc_msgSend__copyWithoutPersonalInfo(v26, v27, v28);

      }
      else
      {
        v29 = 0;
      }
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = sub_1BEA27000;
      v33[3] = &unk_1E782F858;
      v34 = v29;
      v35 = v14;
      v37 = a6;
      v36 = v15;
      v31 = v29;
      objc_msgSend__enumerateEligibleConnectedContainersForOOPUIContainer_(self, v32, (uint64_t)v33);

    }
  }

}

- (void)performModifyRecordsOperation:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  CKDModifyRecordsOperation *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  uint64_t v13;
  id v14;
  const char *v15;
  id v16;
  const char *v17;
  id v18;
  const char *v19;
  id v20;
  const char *v21;
  id v22;
  const char *v23;
  const char *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  CKDContainer *v30;
  id v31;
  _QWORD v32[4];
  id v33;
  CKDContainer *v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = [CKDModifyRecordsOperation alloc];
  objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(&location, v12);
  v13 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = sub_1BEA27614;
  v39[3] = &unk_1E782F880;
  v14 = v6;
  v40 = v14;
  objc_copyWeak(&v41, &location);
  objc_msgSend_setSaveProgressBlock_(v12, v15, (uint64_t)v39);
  v36[0] = v13;
  v36[1] = 3221225472;
  v36[2] = sub_1BEA27764;
  v36[3] = &unk_1E782F8A8;
  v16 = v14;
  v37 = v16;
  objc_copyWeak(&v38, &location);
  objc_msgSend_setRecordsInFlightBlock_(v12, v17, (uint64_t)v36);
  v32[0] = v13;
  v32[1] = 3221225472;
  v32[2] = sub_1BEA278C0;
  v32[3] = &unk_1E782F8D0;
  objc_copyWeak(&v35, &location);
  v18 = v16;
  v33 = v18;
  v34 = self;
  objc_msgSend_setSaveCompletionBlock_(v12, v19, (uint64_t)v32);
  v28[0] = v13;
  v28[1] = 3221225472;
  v28[2] = sub_1BEA27C68;
  v28[3] = &unk_1E782F8F8;
  v20 = v18;
  v29 = v20;
  objc_copyWeak(&v31, &location);
  v30 = self;
  objc_msgSend_setDeleteCompletionBlock_(v12, v21, (uint64_t)v28);
  v25[0] = v13;
  v25[1] = 3221225472;
  v25[2] = sub_1BEA27DE0;
  v25[3] = &unk_1E782F920;
  v22 = v20;
  v26 = v22;
  objc_copyWeak(&v27, &location);
  objc_msgSend_setUploadCompletionBlock_(v12, v23, (uint64_t)v25);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v24, (uint64_t)v12, v7);
  objc_destroyWeak(&v27);

  objc_destroyWeak(&v31);
  objc_destroyWeak(&v35);
  objc_destroyWeak(&v38);

  objc_destroyWeak(&v41);
  objc_destroyWeak(&location);

}

- (void)_performFetchCurrentUserRecordOperation:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  CKDFetchUserRecordOperation *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  id v13;
  const char *v14;
  const char *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = [CKDFetchUserRecordOperation alloc];
  objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(&location, v12);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1BEA28120;
  v16[3] = &unk_1E782E4E0;
  objc_copyWeak(&v18, &location);
  v13 = v6;
  v17 = v13;
  objc_msgSend_setCompletionBlock_(v12, v14, (uint64_t)v16);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v15, (uint64_t)v12, v7);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

- (void)_reallyPerformFetchRecordsOperation:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  CKDFetchRecordsOperation *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  id v15;
  const char *v16;
  id v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *, void *, void *);
  void *v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = [CKDFetchRecordsOperation alloc];
  objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(&location, v12);
  v13 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = sub_1BEA28504;
  v29[3] = &unk_1E782F948;
  objc_copyWeak(&v30, &location);
  objc_msgSend_setRecordFetchProgressBlock_(v12, v14, (uint64_t)v29);
  v26[0] = v13;
  v26[1] = 3221225472;
  v26[2] = sub_1BEA2856C;
  v26[3] = &unk_1E782F970;
  v15 = v6;
  v27 = v15;
  objc_copyWeak(&v28, &location);
  objc_msgSend_setRecordFetchCommandBlock_(v12, v16, (uint64_t)v26);
  v20 = v13;
  v21 = 3221225472;
  v22 = sub_1BEA28774;
  v23 = &unk_1E782F998;
  objc_copyWeak(&v25, &location);
  v17 = v15;
  v24 = v17;
  objc_msgSend_setRecordFetchCompletionBlock_(v12, v18, (uint64_t)&v20);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v19, (uint64_t)v12, v7, v20, v21, v22, v23);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&v28);

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);

}

- (void)performFetchRecordsOperation:(id)a3 withBlock:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  id v10;

  v6 = a4;
  v10 = a3;
  if (objc_msgSend_isFetchCurrentUserOperation(v10, v7, v8))
    objc_msgSend__performFetchCurrentUserRecordOperation_withBlock_(self, v9, (uint64_t)v10, v6);
  else
    objc_msgSend__reallyPerformFetchRecordsOperation_withBlock_(self, v9, (uint64_t)v10, v6);

}

- (void)performFetchRecordZoneChangesOperation:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  CKDFetchRecordZoneChangesOperation *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  uint64_t v13;
  id v14;
  const char *v15;
  id v16;
  const char *v17;
  id v18;
  const char *v19;
  id v20;
  const char *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = [CKDFetchRecordZoneChangesOperation alloc];
  objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(&location, v12);
  v13 = MEMORY[0x1E0C809B0];
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = sub_1BEA28C9C;
  v38[3] = &unk_1E782FA60;
  objc_copyWeak(&v40, &location);
  v14 = v6;
  v39 = v14;
  objc_msgSend_setRecordChangedBlock_(v12, v15, (uint64_t)v38);
  v35[0] = v13;
  v35[1] = 3221225472;
  v35[2] = sub_1BEA28E7C;
  v35[3] = &unk_1E782F9C0;
  v16 = v14;
  v36 = v16;
  objc_copyWeak(&v37, &location);
  objc_msgSend_setRecordDeletedBlock_(v12, v17, (uint64_t)v35);
  v32[0] = v13;
  v32[1] = 3221225472;
  v32[2] = sub_1BEA28FD8;
  v32[3] = &unk_1E782F9E8;
  v18 = v16;
  v33 = v18;
  objc_copyWeak(&v34, &location);
  objc_msgSend_setZoneAttributesChangedBlock_(v12, v19, (uint64_t)v32);
  v29[0] = v13;
  v29[1] = 3221225472;
  v29[2] = sub_1BEA29134;
  v29[3] = &unk_1E782FA10;
  v20 = v18;
  v30 = v20;
  objc_copyWeak(&v31, &location);
  objc_msgSend_setServerChangeTokenUpdatedBlock_(v12, v21, (uint64_t)v29);
  v24 = v13;
  v25 = 3221225472;
  v26 = sub_1BEA29304;
  v27 = &unk_1E782EF38;
  objc_copyWeak(&v28, &location);
  objc_msgSend_setCompletionBlock_(v12, v22, (uint64_t)&v24);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v23, (uint64_t)v12, v7, v24, v25, v26, v27);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&v31);

  objc_destroyWeak(&v34);
  objc_destroyWeak(&v37);

  objc_destroyWeak(&v40);
  objc_destroyWeak(&location);

}

- (void)performFetchRecordChangesOperation:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  CKDFetchRecordZoneChangesOperation *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  uint64_t v13;
  id v14;
  const char *v15;
  id v16;
  const char *v17;
  id v18;
  const char *v19;
  const char *v20;
  const char *v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id location[2];

  v6 = a3;
  v7 = a4;
  v8 = [CKDFetchRecordZoneChangesOperation alloc];
  objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(location, v12);
  v13 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = sub_1BEA29604;
  v32[3] = &unk_1E782FA60;
  objc_copyWeak(&v34, location);
  v14 = v6;
  v33 = v14;
  objc_msgSend_setRecordChangedBlock_(v12, v15, (uint64_t)v32);
  v29[0] = v13;
  v29[1] = 3221225472;
  v29[2] = sub_1BEA297E4;
  v29[3] = &unk_1E782F9C0;
  v16 = v14;
  v30 = v16;
  objc_copyWeak(&v31, location);
  objc_msgSend_setRecordDeletedBlock_(v12, v17, (uint64_t)v29);
  v26[0] = v13;
  v26[1] = 3221225472;
  v26[2] = sub_1BEA2993C;
  v26[3] = &unk_1E782FA10;
  v18 = v16;
  v27 = v18;
  objc_copyWeak(&v28, location);
  objc_msgSend_setServerChangeTokenUpdatedBlock_(v12, v19, (uint64_t)v26);
  v24[0] = v13;
  v24[1] = 3221225472;
  v24[2] = sub_1BEA29B0C;
  v24[3] = &unk_1E782EF38;
  objc_copyWeak(&v25, location);
  objc_msgSend_setCompletionBlock_(v12, v20, (uint64_t)v24);
  v22[0] = v13;
  v22[1] = 3221225472;
  v22[2] = sub_1BEA29B54;
  v22[3] = &unk_1E782EF38;
  objc_copyWeak(&v23, location);
  objc_msgSend_performOperation_initialMessageReplyBlock_customCompletionBlock_(self, v21, (uint64_t)v12, v7, v22);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&v28);

  objc_destroyWeak(&v31);
  objc_destroyWeak(&v34);
  objc_destroyWeak(location);

}

- (void)performMovePhotosOperation:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  CKDMovePhotosOperation *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  uint64_t v13;
  id v14;
  const char *v15;
  id v16;
  const char *v17;
  id v18;
  const char *v19;
  const char *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = [CKDMovePhotosOperation alloc];
  objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(&location, v12);
  v13 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = sub_1BEA29F64;
  v27[3] = &unk_1E782F880;
  v14 = v6;
  v28 = v14;
  objc_copyWeak(&v29, &location);
  objc_msgSend_setSaveProgressBlock_(v12, v15, (uint64_t)v27);
  v24[0] = v13;
  v24[1] = 3221225472;
  v24[2] = sub_1BEA2A0A8;
  v24[3] = &unk_1E782FA38;
  objc_copyWeak(&v26, &location);
  v16 = v14;
  v25 = v16;
  objc_msgSend_setMoveCompletionBlock_(v12, v17, (uint64_t)v24);
  v21[0] = v13;
  v21[1] = 3221225472;
  v21[2] = sub_1BEA2A4DC;
  v21[3] = &unk_1E782F920;
  v18 = v16;
  v22 = v18;
  objc_copyWeak(&v23, &location);
  objc_msgSend_setUploadCompletionBlock_(v12, v19, (uint64_t)v21);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v20, (uint64_t)v12, v7);
  objc_destroyWeak(&v23);

  objc_destroyWeak(&v26);
  objc_destroyWeak(&v29);

  objc_destroyWeak(&location);
}

- (void)performQueryOperation:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  CKDQueryOperation *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  uint64_t v13;
  id v14;
  const char *v15;
  id v16;
  const char *v17;
  const char *v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = [CKDQueryOperation alloc];
  objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(&location, v12);
  v13 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = sub_1BEA2A8DC;
  v24[3] = &unk_1E782FA60;
  v14 = v6;
  v25 = v14;
  objc_copyWeak(&v26, &location);
  objc_msgSend_setRecordFetchCompletionBlock_(v12, v15, (uint64_t)v24);
  v21[0] = v13;
  v21[1] = 3221225472;
  v21[2] = sub_1BEA2AA68;
  v21[3] = &unk_1E782FA88;
  v16 = v14;
  v22 = v16;
  objc_copyWeak(&v23, &location);
  objc_msgSend_setQueryCursorUpdatedBlock_(v12, v17, (uint64_t)v21);
  v19[0] = v13;
  v19[1] = 3221225472;
  v19[2] = sub_1BEA2ABC4;
  v19[3] = &unk_1E782EF38;
  objc_copyWeak(&v20, &location);
  objc_msgSend_performOperation_initialMessageReplyBlock_customCompletionBlock_(self, v18, (uint64_t)v12, v7, v19);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v23);

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);

}

- (void)performModifySubscriptionsOperation:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  CKDModifySubscriptionsOperation *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  uint64_t v13;
  id v14;
  const char *v15;
  id v16;
  const char *v17;
  const char *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = [CKDModifySubscriptionsOperation alloc];
  objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(&location, v12);
  v13 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = sub_1BEA2AF04;
  v22[3] = &unk_1E782FAB0;
  v14 = v6;
  v23 = v14;
  objc_copyWeak(&v24, &location);
  objc_msgSend_setSaveCompletionBlock_(v12, v15, (uint64_t)v22);
  v19[0] = v13;
  v19[1] = 3221225472;
  v19[2] = sub_1BEA2B060;
  v19[3] = &unk_1E782FAB0;
  v16 = v14;
  v20 = v16;
  objc_copyWeak(&v21, &location);
  objc_msgSend_setDeleteCompletionBlock_(v12, v17, (uint64_t)v19);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v18, (uint64_t)v12, v7);
  objc_destroyWeak(&v21);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

}

- (void)performFetchSubscriptionsOperation:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  CKDFetchSubscriptionsOperation *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  id v13;
  const char *v14;
  const char *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = [CKDFetchSubscriptionsOperation alloc];
  objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(&location, v12);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1BEA2B2F8;
  v16[3] = &unk_1E782FAD8;
  v13 = v6;
  v17 = v13;
  objc_copyWeak(&v18, &location);
  objc_msgSend_setSubscriptionFetchedProgressBlock_(v12, v14, (uint64_t)v16);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v15, (uint64_t)v12, v7);
  objc_destroyWeak(&v18);

  objc_destroyWeak(&location);
}

- (void)performAcceptSharesOperation:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  CKDAcceptSharesOperation *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  id v13;
  const char *v14;
  const char *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = [CKDAcceptSharesOperation alloc];
  objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(&location, v12);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1BEA2B5A4;
  v16[3] = &unk_1E782FB00;
  v13 = v6;
  v17 = v13;
  objc_copyWeak(&v18, &location);
  objc_msgSend_setAcceptCompletionBlock_(v12, v14, (uint64_t)v16);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v15, (uint64_t)v12, v7);
  objc_destroyWeak(&v18);

  objc_destroyWeak(&location);
}

- (void)performDeclineSharesOperation:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  CKDDeclineSharesOperation *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  id v13;
  const char *v14;
  const char *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = [CKDDeclineSharesOperation alloc];
  objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(&location, v12);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1BEA2B850;
  v16[3] = &unk_1E782FB28;
  v13 = v6;
  v17 = v13;
  objc_copyWeak(&v18, &location);
  objc_msgSend_setDeclineCompletionBlock_(v12, v14, (uint64_t)v16);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v15, (uint64_t)v12, v7);
  objc_destroyWeak(&v18);

  objc_destroyWeak(&location);
}

- (void)performShareAccessRequestOperation:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  CKDShareAccessRequestOperation *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  id v13;
  const char *v14;
  const char *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = [CKDShareAccessRequestOperation alloc];
  objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(&location, v12);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1BEA2BAE8;
  v16[3] = &unk_1E782FB28;
  v13 = v6;
  v17 = v13;
  objc_copyWeak(&v18, &location);
  objc_msgSend_setShareAccessRequestCompletionBlock_(v12, v14, (uint64_t)v16);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v15, (uint64_t)v12, v7);
  objc_destroyWeak(&v18);

  objc_destroyWeak(&location);
}

- (void)performFetchShareMetadataOperation:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  CKDFetchShareMetadataOperation *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  id v14;
  const char *v15;
  const char *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = [CKDFetchShareMetadataOperation alloc];
  objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_msgSend_setErrorOnOON_(v12, v13, 1);
  objc_initWeak(&location, v12);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = sub_1BEA2BD8C;
  v17[3] = &unk_1E782FB50;
  v14 = v6;
  v18 = v14;
  objc_copyWeak(&v19, &location);
  objc_msgSend_setShareMetadataFetchedBlock_(v12, v15, (uint64_t)v17);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v16, (uint64_t)v12, v7);
  objc_destroyWeak(&v19);

  objc_destroyWeak(&location);
}

- (void)performMapShareURLsToInstalledBundleIDsOperation:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  CKDMapShareURLsToInstalledBundleIDsOperation *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  id v13;
  const char *v14;
  const char *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = [CKDMapShareURLsToInstalledBundleIDsOperation alloc];
  objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(&location, v12);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1BEA2C038;
  v16[3] = &unk_1E782FB78;
  v13 = v6;
  v17 = v13;
  objc_copyWeak(&v18, &location);
  objc_msgSend_setBundleIDsFetchedBlock_(v12, v14, (uint64_t)v16);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v15, (uint64_t)v12, v7);
  objc_destroyWeak(&v18);

  objc_destroyWeak(&location);
}

- (void)performFetchWebAuthTokenOperation:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  CKDFetchWebAuthTokenOperation *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  _QWORD v14[4];
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = [CKDFetchWebAuthTokenOperation alloc];
  objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(&location, v12);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1BEA2C2E0;
  v14[3] = &unk_1E782EF38;
  objc_copyWeak(&v15, &location);
  objc_msgSend_performOperation_initialMessageReplyBlock_customCompletionBlock_(self, v13, (uint64_t)v12, v7, v14);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

- (void)displayInfoOnAccountWithCompletionHandler:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  id v8;
  const char *v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  objc_msgSend_uncancellableOperationQueue(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1BEA2C50C;
  v10[3] = &unk_1E782F4D0;
  v10[4] = self;
  v11 = v4;
  v8 = v4;
  objc_msgSend_addOperationWithBlock_(v7, v9, (uint64_t)v10);

}

- (void)cancelAllOperations
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD block[5];
  uint8_t buf[4];
  CKDContainer *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v3 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v9 = self;
    _os_log_debug_impl(&dword_1BE990000, v3, OS_LOG_TYPE_DEBUG, "Scheduling a cancel of all operations for %@", buf, 0xCu);
  }
  objc_msgSend_cancellationQueue(self, v4, v5);
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEA2C914;
  block[3] = &unk_1E782EA40;
  block[4] = self;
  dispatch_barrier_async(v6, block);

}

- (void)cancelOperationWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  objc_msgSend_cancellationQueue(self, v8, v9);
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEA2CCB0;
  block[3] = &unk_1E782F678;
  block[4] = self;
  v14 = v6;
  v15 = v7;
  v11 = v7;
  v12 = v6;
  dispatch_barrier_async(v10, block);

}

- (void)resetThrottles
{
  uint64_t v2;
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  _DWORD v10[2];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend_logicalDeviceScopedClientProxy(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v4 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
    {
      v7 = v4;
      v10[0] = 67109120;
      v10[1] = objc_msgSend_pid(v3, v8, v9);
      _os_log_impl(&dword_1BE990000, v7, OS_LOG_TYPE_INFO, "Resetting throttles in pid %d", (uint8_t *)v10, 8u);

    }
    objc_msgSend_resetThrottles(v3, v5, v6);
  }

}

- (void)addThrottle:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  id v8;

  v4 = a3;
  objc_msgSend_logicalDeviceScopedClientProxy(self, v5, v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addThrottle_(v8, v7, (uint64_t)v4);

}

- (CKDPCSFetchAggregator)fetchAggregator
{
  uint64_t v2;
  CKDPCSFetchAggregator *fetchAggregator;
  CKDPCSFetchAggregator *v5;
  const char *v6;
  CKDPCSFetchAggregator *v7;
  CKDPCSFetchAggregator *v8;
  CKDPCSFetchAggregator *v9;
  const char *v10;
  uint64_t v11;

  objc_msgSend_lock(self->_fetchAggregatorLock, a2, v2);
  fetchAggregator = self->_fetchAggregator;
  if (!fetchAggregator)
  {
    v5 = [CKDPCSFetchAggregator alloc];
    v7 = (CKDPCSFetchAggregator *)objc_msgSend_initWithContainer_(v5, v6, (uint64_t)self);
    v8 = self->_fetchAggregator;
    self->_fetchAggregator = v7;

    fetchAggregator = self->_fetchAggregator;
  }
  v9 = fetchAggregator;
  objc_msgSend_unlock(self->_fetchAggregatorLock, v10, v11);
  return v9;
}

+ (id)operationStatusReport:(id)a3
{
  id v3;
  const char *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const char *v11;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0
      && (objc_msgSend_parentOperation(v3, v5, v6),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v7,
          v7))
    {
      v8 = 0;
    }
    else
    {
      v9 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend_statusReportWithIndent_(v3, v5, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v9, v11, (uint64_t)CFSTR("%@"), v10);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v4, (uint64_t)CFSTR("%@"), v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)CKStatusReportArrayIncludingSharedOperations:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  void *v47;
  const char *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  void *v56;
  const char *v57;
  const char *v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  id v65;
  id v66;
  id v67;
  const char *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t i;
  void *v74;
  CKDContainer *v75;
  _BOOL4 v76;
  const char *v77;
  const char *v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  void *v94;
  const char *v95;
  const char *v96;
  void *v97;
  const char *v98;
  const char *v99;
  const char *v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  void *v104;
  uint64_t v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  const char *v115;
  void *v116;
  const char *v117;
  const char *v118;
  void *v119;
  const char *v120;
  const char *v121;
  void *v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  const char *v126;
  uint64_t v127;
  void *v128;
  void *v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  const char *v133;
  uint64_t v134;
  void *v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  const char *v139;
  void *v140;
  const char *v141;
  const char *v142;
  uint64_t v143;
  void *v144;
  const char *v145;
  uint64_t v146;
  void *v147;
  const char *v148;
  void *v149;
  const char *v150;
  const char *v151;
  void *v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  const char *v156;
  uint64_t v157;
  void *v158;
  void *v159;
  const char *v160;
  uint64_t v161;
  uint64_t v162;
  const char *v163;
  uint64_t v164;
  void *v165;
  const char *v166;
  uint64_t v167;
  uint64_t v168;
  const char *v169;
  void *v170;
  const char *v171;
  const char *v172;
  uint64_t v173;
  void *v174;
  const char *v175;
  uint64_t v176;
  void *v177;
  const char *v178;
  void *v179;
  const char *v180;
  const char *v181;
  const char *v182;
  uint64_t v183;
  void *v184;
  const char *v185;
  uint64_t v186;
  int hasStatusToReport;
  const char *v188;
  void *v189;
  const char *v190;
  const char *v191;
  uint64_t v192;
  void *v193;
  const char *v194;
  uint64_t v195;
  void *v196;
  const char *v197;
  const char *v198;
  const char *v199;
  uint64_t v200;
  void *v201;
  const char *v202;
  uint64_t v203;
  uint64_t v204;
  const char *v205;
  uint64_t v206;
  const char *v207;
  uint64_t v208;
  void *v209;
  const char *v210;
  uint64_t v211;
  void *v212;
  const char *v213;
  uint64_t v214;
  void *v215;
  const char *v216;
  void *v217;
  const char *v218;
  const char *v219;
  void *v220;
  const char *v221;
  uint64_t v222;
  const char *v223;
  uint64_t v224;
  const char *v225;
  uint64_t v226;
  void *v227;
  void *v228;
  const char *v229;
  uint64_t v230;
  void *v231;
  const char *v232;
  const char *v233;
  void *v234;
  const char *v235;
  uint64_t v236;
  int v237;
  const char *v238;
  const char *v239;
  uint64_t v240;
  const char *v241;
  uint64_t v242;
  void *v243;
  void *v244;
  const char *v245;
  uint64_t v246;
  void *v247;
  const char *v248;
  const char *v249;
  void *v251;
  _BOOL4 v252;
  __int128 v253;
  __int128 v254;
  __int128 v255;
  __int128 v256;
  _BYTE v257[128];
  uint64_t v258;

  v252 = a3;
  v258 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_opt_new();
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_applicationID(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_applicationBundleIdentifierOverrideForContainerAccess(v10, v11, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v15)
  {
    objc_msgSend_applicationID(self, v13, v14);
    v251 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_applicationBundleIdentifier(v251, v17, v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_containerID(self, v13, v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerIdentifier(v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v5, v23, (uint64_t)CFSTR("\n____ %@ Daemon Status Report: \"%@\" (\"%@\")"), v7, v16, v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v4, v25, (uint64_t)v24);

  if (!v15)
  {

  }
  objc_msgSend_addObject_(v4, v26, (uint64_t)CFSTR("\n%%%%% Operations %%%%%"));
  objc_msgSend_operationQueue(self, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend_operationCount(v29, v30, v31);

  if (v32)
  {
    v35 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_operationQueue(self, v33, v34);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend_operationCount(v36, v37, v38);
    objc_msgSend_operationQueue(self, v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend_maxConcurrentOperationCount(v42, v43, v44);
    objc_msgSend_stringWithFormat_(v35, v46, (uint64_t)CFSTR("Queued operations %lu/%ld {"), v39, v45);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v4, v48, (uint64_t)v47);

    objc_msgSend_operationQueue(self, v49, v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_operations(v51, v52, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKCompactMap_(v54, v55, (uint64_t)&unk_1E782FC00);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObjectsFromArray_(v4, v57, (uint64_t)v56);

    objc_msgSend_addObject_(v4, v58, (uint64_t)CFSTR("}"));
  }
  else
  {
    objc_msgSend_addObject_(v4, v33, (uint64_t)CFSTR("No queued operations."));
  }
  objc_msgSend_sharedClientThrottlingOperationQueue(CKDContainer, v59, v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operations(v61, v62, v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  v65 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v66 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v253 = 0u;
  v254 = 0u;
  v255 = 0u;
  v256 = 0u;
  v67 = v64;
  v71 = objc_msgSend_countByEnumeratingWithState_objects_count_(v67, v68, (uint64_t)&v253, v257, 16);
  if (v71)
  {
    v72 = *(_QWORD *)v254;
    do
    {
      for (i = 0; i != v71; ++i)
      {
        if (*(_QWORD *)v254 != v72)
          objc_enumerationMutation(v67);
        v74 = *(void **)(*((_QWORD *)&v253 + 1) + 8 * i);
        objc_msgSend_container(v74, v69, v70);
        v75 = (CKDContainer *)objc_claimAutoreleasedReturnValue();
        v76 = v75 == self;

        if (v76)
          objc_msgSend_addObject_(v65, v77, (uint64_t)v74);
        else
          objc_msgSend_addObject_(v66, v77, (uint64_t)v74);
      }
      v71 = objc_msgSend_countByEnumeratingWithState_objects_count_(v67, v69, (uint64_t)&v253, v257, 16);
    }
    while (v71);
  }

  if (objc_msgSend_count(v65, v78, v79))
  {
    v82 = (void *)MEMORY[0x1E0CB3940];
    v83 = objc_msgSend_count(v65, v80, v81);
    v86 = objc_msgSend_count(v67, v84, v85);
    objc_msgSend_sharedClientThrottlingOperationQueue(CKDContainer, v87, v88);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = objc_msgSend_maxConcurrentOperationCount(v89, v90, v91);
    objc_msgSend_stringWithFormat_(v82, v93, (uint64_t)CFSTR("More Operations %lu/%lu/%ld {"), v83, v86, v92);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v4, v95, (uint64_t)v94);

    objc_msgSend_CKCompactMap_(v65, v96, (uint64_t)&unk_1E782FC20);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObjectsFromArray_(v4, v98, (uint64_t)v97);

    objc_msgSend_addObject_(v4, v99, (uint64_t)CFSTR("}"));
  }
  else
  {
    objc_msgSend_addObject_(v4, v80, (uint64_t)CFSTR("No more operations."));
  }
  if (objc_msgSend_count(v66, v100, v101) && v252)
  {
    v104 = (void *)MEMORY[0x1E0CB3940];
    v105 = objc_msgSend_count(v66, v102, v103);
    v108 = objc_msgSend_count(v67, v106, v107);
    objc_msgSend_sharedClientThrottlingOperationQueue(CKDContainer, v109, v110);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v114 = objc_msgSend_maxConcurrentOperationCount(v111, v112, v113);
    objc_msgSend_stringWithFormat_(v104, v115, (uint64_t)CFSTR("Other Proxy Operations On Shared Throttling Queue %lu/%lu/%ld {"), v105, v108, v114);
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v4, v117, (uint64_t)v116);

    objc_msgSend_CKCompactMap_(v66, v118, (uint64_t)&unk_1E782FC40);
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObjectsFromArray_(v4, v120, (uint64_t)v119);

    objc_msgSend_addObject_(v4, v121, (uint64_t)CFSTR("}"));
  }
  objc_msgSend_cloudKitSupportOperationThrottleQueue(self, v102, v103);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v125 = objc_msgSend_operationCount(v122, v123, v124);

  if (v125)
  {
    v128 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_cloudKitSupportOperationThrottleQueue(self, v126, v127);
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    v132 = objc_msgSend_operationCount(v129, v130, v131);
    objc_msgSend_cloudKitSupportOperationThrottleQueue(self, v133, v134);
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    v138 = objc_msgSend_maxConcurrentOperationCount(v135, v136, v137);
    objc_msgSend_stringWithFormat_(v128, v139, (uint64_t)CFSTR("CloudKit Support Operations %lu/%ld {"), v132, v138);
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v4, v141, (uint64_t)v140);

    objc_msgSend_cloudKitSupportOperationThrottleQueue(self, v142, v143);
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_operations(v144, v145, v146);
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKCompactMap_(v147, v148, (uint64_t)&unk_1E782FC60);
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObjectsFromArray_(v4, v150, (uint64_t)v149);

    objc_msgSend_addObject_(v4, v151, (uint64_t)CFSTR("}"));
  }
  objc_msgSend_backgroundOperationThrottleQueue(self, v126, v127);
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  v155 = objc_msgSend_operationCount(v152, v153, v154);

  if (v155)
  {
    v158 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_backgroundOperationThrottleQueue(self, v156, v157);
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    v162 = objc_msgSend_operationCount(v159, v160, v161);
    objc_msgSend_backgroundOperationThrottleQueue(self, v163, v164);
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    v168 = objc_msgSend_maxConcurrentOperationCount(v165, v166, v167);
    objc_msgSend_stringWithFormat_(v158, v169, (uint64_t)CFSTR("More background operations %lu/%ld {"), v162, v168);
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v4, v171, (uint64_t)v170);

    objc_msgSend_backgroundOperationThrottleQueue(self, v172, v173);
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_operations(v174, v175, v176);
    v177 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKCompactMap_(v177, v178, (uint64_t)&unk_1E782FC80);
    v179 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObjectsFromArray_(v4, v180, (uint64_t)v179);

    objc_msgSend_addObject_(v4, v181, (uint64_t)CFSTR("}"));
  }
  else
  {
    objc_msgSend_addObject_(v4, v156, (uint64_t)CFSTR("No background operations."));
  }
  objc_msgSend_gatekeeper(self, v182, v183);
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  hasStatusToReport = objc_msgSend_hasStatusToReport(v184, v185, v186);

  if (hasStatusToReport)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v188, (uint64_t)CFSTR("gatekeeper {"));
    v189 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v4, v190, (uint64_t)v189);

    objc_msgSend_gatekeeper(self, v191, v192);
    v193 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKStatusReportArray(v193, v194, v195);
    v196 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v4, v197, (uint64_t)v196);

    objc_msgSend_addObject_(v4, v198, (uint64_t)CFSTR("}"));
  }
  objc_msgSend_addObject_(v4, v188, (uint64_t)CFSTR("%%%%%%%%%%%%%%%%%%%%%%%%"));
  objc_msgSend_operationStatisticsByClassName(self, v199, v200);
  v201 = (void *)objc_claimAutoreleasedReturnValue();
  v204 = objc_msgSend_count(v201, v202, v203);

  if (v204)
  {
    objc_msgSend_addObject_(v4, v205, (uint64_t)CFSTR("\n%%%% Operation Statistics %%%%"));
    objc_msgSend_operationStatisticsByClassName(self, v207, v208);
    v209 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v209);
    objc_msgSend_operationStatisticsByClassName(self, v210, v211);
    v212 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_allValues(v212, v213, v214);
    v215 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKStatusReportForStatistics_(CKDOperationStatistics, v216, (uint64_t)v215);
    v217 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_addObjectsFromArray_(v4, v218, (uint64_t)v217);
    objc_sync_exit(v209);

    objc_msgSend_addObject_(v4, v219, (uint64_t)CFSTR("%%%%%%%%%%%%%%%%%%%%%%%%"));
  }
  objc_msgSend_MMCS(self, v205, v206);
  v220 = (void *)objc_claimAutoreleasedReturnValue();

  if (v220)
  {
    objc_msgSend_addObject_(v4, v221, (uint64_t)CFSTR("\n----- MMCS Engine  -----"));
    objc_msgSend_MMCS(self, v223, v224);
    v227 = (void *)objc_claimAutoreleasedReturnValue();
    if (v227)
    {
      objc_msgSend_MMCS(self, v225, v226);
      v228 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKStatusReportArray(v228, v229, v230);
      v231 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v4, v232, (uint64_t)v231);

    }
    else
    {
      objc_msgSend_addObject_(v4, v225, (uint64_t)CFSTR("(No MMCS Engine)"));
    }

    objc_msgSend_addObject_(v4, v233, (uint64_t)CFSTR("\n------------------------"));
  }
  objc_msgSend_pcsCache(self, v221, v222);
  v234 = (void *)objc_claimAutoreleasedReturnValue();
  v237 = objc_msgSend_hasStatusToReport(v234, v235, v236);

  if (v237)
  {
    objc_msgSend_addObject_(v4, v238, (uint64_t)CFSTR("\n~~~~~ PCS Cache ~~~~~"));
    objc_msgSend_pcsCache(self, v239, v240);
    v243 = (void *)objc_claimAutoreleasedReturnValue();
    if (v243)
    {
      objc_msgSend_pcsCache(self, v241, v242);
      v244 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKStatusReportArray(v244, v245, v246);
      v247 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v4, v248, (uint64_t)v247);

    }
    else
    {
      objc_msgSend_addObject_(v4, v241, (uint64_t)CFSTR("\n(No PCS Cache)"));
    }

    objc_msgSend_addObject_(v4, v249, (uint64_t)CFSTR("~~~~~~~~~~~~~~~~~~~~~~~~"));
  }
  objc_msgSend_addObject_(v4, v238, (uint64_t)CFSTR("\n\n_____________________________\n\n"));

  return v4;
}

- (id)CKStatusReportArray
{
  return (id)objc_msgSend_CKStatusReportArrayIncludingSharedOperations_(self, a2, 0);
}

- (void)handleSignificantIssueBehavior:(unint64_t)a3 reason:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  id v10;

  v6 = a4;
  objc_msgSend_processScopedClientProxy(self, v7, v8);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleSignificantIssueBehavior_reason_(v10, v9, a3, v6);

}

- (BOOL)canOpenFileAtURL:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  char canOpenFileAtURL;

  v4 = a3;
  objc_msgSend_processScopedClientProxy(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  canOpenFileAtURL = objc_msgSend_canOpenFileAtURL_(v7, v8, (uint64_t)v4);

  return canOpenFileAtURL;
}

- (void)_performCodeFunctionInvokeOperation:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  CKDCodeFunctionInvokeOperation *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  const char *v15;
  const char *v16;
  const char *v17;
  const char *v18;
  id v19;
  const char *v20;
  const char *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  id location[2];

  v6 = a3;
  v7 = a4;
  v8 = [CKDCodeFunctionInvokeOperation alloc];
  objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(location, v12);
  v13 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = sub_1BEA2E410;
  v33[3] = &unk_1E782FCD0;
  objc_copyWeak(&v34, location);
  objc_msgSend_setReplaceLocalSerializationsBlobs_(v12, v14, (uint64_t)v33);
  v31[0] = v13;
  v31[1] = 3221225472;
  v31[2] = sub_1BEA2E638;
  v31[3] = &unk_1E782FD20;
  objc_copyWeak(&v32, location);
  objc_msgSend_setInitialResponseReceivedCallback_(v12, v15, (uint64_t)v31);
  v29[0] = v13;
  v29[1] = 3221225472;
  v29[2] = sub_1BEA2E8AC;
  v29[3] = &unk_1E782FD48;
  objc_copyWeak(&v30, location);
  objc_msgSend_setReplaceWireSerializations_(v12, v16, (uint64_t)v29);
  v27[0] = v13;
  v27[1] = 3221225472;
  v27[2] = sub_1BEA2E9C8;
  v27[3] = &unk_1E782F948;
  objc_copyWeak(&v28, location);
  objc_msgSend_setRecordFetchProgressBlock_(v12, v17, (uint64_t)v27);
  v25[0] = v13;
  v25[1] = 3221225472;
  v25[2] = sub_1BEA2EA30;
  v25[3] = &unk_1E782FD70;
  objc_copyWeak(&v26, location);
  objc_msgSend_setRecordFetchCommandBlock_(v12, v18, (uint64_t)v25);
  v22[0] = v13;
  v22[1] = 3221225472;
  v22[2] = sub_1BEA2EB54;
  v22[3] = &unk_1E782F998;
  objc_copyWeak(&v24, location);
  v19 = v6;
  v23 = v19;
  objc_msgSend_setRecordFetchCompletionBlock_(v12, v20, (uint64_t)v22);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v21, (uint64_t)v12, v7);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&v30);
  objc_destroyWeak(&v32);
  objc_destroyWeak(&v34);
  objc_destroyWeak(location);

}

- (void)performCodeOperation:(id)a3 withBlock:(id)a4
{
  MEMORY[0x1E0DE7D20](self, sel__performCodeFunctionInvokeOperation_block_, a3);
}

- (void)performCodeFunctionInvokeOperation:(id)a3 withBlock:(id)a4
{
  MEMORY[0x1E0DE7D20](self, sel__performCodeFunctionInvokeOperation_block_, a3);
}

- (void)_dumpStatusReportArrayToOsTrace:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  dispatch_once_t *v9;
  os_log_t *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  const char *v14;
  NSObject *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  uint64_t v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v16, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    v9 = (dispatch_once_t *)MEMORY[0x1E0C95300];
    v10 = (os_log_t *)MEMORY[0x1E0C952F0];
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v4);
        v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v11);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend__dumpStatusReportArrayToOsTrace_(self, v13, v12);
        }
        else
        {
          if (*v9 != -1)
            dispatch_once(v9, (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v15 = *v10;
          if (os_log_type_enabled(*v10, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v21 = v12;
            _os_log_impl(&dword_1BE990000, v15, OS_LOG_TYPE_INFO, "Proxy status report: %@", buf, 0xCu);
          }
        }
        ++v11;
      }
      while (v7 != v11);
      v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v14, (uint64_t)&v16, v22, 16);
    }
    while (v7);
  }

}

- (void)dumpDaemonStatusReportToFileHandle:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  CKDContainer *v15;
  id v16;

  v6 = a3;
  v7 = a4;
  objc_msgSend_statusQueue(self, v8, v9);
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEA2EF94;
  block[3] = &unk_1E782F678;
  v14 = v6;
  v15 = self;
  v16 = v7;
  v11 = v7;
  v12 = v6;
  dispatch_async(v10, block);

}

- (void)networkTransferEndpointWithCompletionHandler:(id)a3
{
  const char *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  id v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  id v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  nw_endpoint_t host;
  const char *v25;
  uint64_t v26;
  nw_endpoint_t v27;
  const char *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  void (**v38)(id, void *, void *);

  v38 = (void (**)(id, void *, void *))a3;
  objc_msgSend_baseURLForServerType_partitionType_(self, v4, 0, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7
    || (objc_msgSend_baseURLForServerType_partitionType_(self, v5, 0, 2),
        (v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend_host(v7, v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_port(v7, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringValue(v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 && v14)
    {
      v16 = objc_retainAutorelease(v8);
      v19 = (const char *)objc_msgSend_UTF8String(v16, v17, v18);
      v20 = objc_retainAutorelease(v14);
      v23 = (const char *)objc_msgSend_UTF8String(v20, v21, v22);
      host = nw_endpoint_create_host(v19, v23);
      v27 = host;
      if (host)
      {
        v29 = (void *)MEMORY[0x1C3B83DD0](host);
        if (v29)
        {
          v30 = 0;
        }
        else
        {
          objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v28, *MEMORY[0x1E0C94B20], 1000, CFSTR("Failed to copy nw_endpoint."));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        v31 = (void *)MEMORY[0x1E0C94FF8];
        v32 = *MEMORY[0x1E0C94B20];
        objc_msgSend_host(v7, v25, v26);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_port(v7, v34, v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_format_(v31, v37, v32, 1000, CFSTR("Failed to create nw_endpoint for host %@ with port %@."), v33, v36);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        v29 = 0;
      }

    }
    else
    {
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v15, *MEMORY[0x1E0C94B20], 1000, CFSTR("Failed to retrieve host and port from %@."), v7);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 0;
    }

  }
  else
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v5, *MEMORY[0x1E0C94B20], 1000, CFSTR("Failed to get base URL"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0;
  }
  if (v38)
    v38[2](v38, v29, v30);

}

- (void)suggestedMergeableDeltaSizeWithCompletionHandler:(id)a3
{
  void (**v4)(id, uint64_t);
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  int v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t))a3;
  objc_msgSend_sharedManager(CKDServerConfigurationManager, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lastKnownServerConfiguration(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend_containerID(self, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_suggestedMergeableDeltaSize_(v10, v14, (uint64_t)v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v16 = *MEMORY[0x1E0C952C0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952C0], OS_LOG_TYPE_DEBUG))
      {
        v21 = 134217984;
        v22 = 0x7FFFFFFFFFFFFFFFLL;
        _os_log_debug_impl(&dword_1BE990000, v16, OS_LOG_TYPE_DEBUG, "Found suggested mergeable delta size: %ld", (uint8_t *)&v21, 0xCu);
      }
      v19 = objc_msgSend_integerValue(v15, v17, v18);
    }
    else
    {
      v19 = 0x7FFFFFFFFFFFFFFFLL;
    }

  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v20 = *MEMORY[0x1E0C952C0];
    v19 = 0x7FFFFFFFFFFFFFFFLL;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952C0], OS_LOG_TYPE_DEBUG))
    {
      v21 = 134217984;
      v22 = 0x7FFFFFFFFFFFFFFFLL;
      _os_log_debug_impl(&dword_1BE990000, v20, OS_LOG_TYPE_DEBUG, "No cached configuration for suggested mergeable delta size, returning default: %ld", (uint8_t *)&v21, 0xCu);
    }
  }
  v4[2](v4, v19);

}

- (unint64_t)countAssetCacheItems
{
  char v3;
  const char *v4;
  uint64_t v5;
  id v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  unint64_t v17;
  NSObject *v19;
  id v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v20 = 0;
  v3 = objc_msgSend_setupAssetTransfers_(self, a2, (uint64_t)&v20);
  v6 = v20;
  if ((v3 & 1) == 0)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v19 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v6;
      _os_log_debug_impl(&dword_1BE990000, v19, OS_LOG_TYPE_DEBUG, "MMCS setup failed:%@", buf, 0xCu);
    }
    __assert_rtn("-[CKDContainer countAssetCacheItems]", "CKDContainer.m", 3665, "0 && \"no MMCS\");
  }
  objc_msgSend_MMCS(self, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend_MMCS(self, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
      __assert_rtn("-[CKDContainer countAssetCacheItems]", "CKDContainer.m", 3667, "self.MMCS && \"no MMCS\");

  }
  objc_msgSend_MMCS(self, v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_assetCache(v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend_countAssetCacheItems(v14, v15, v16);
  return v17;
}

- (void)clearAssetCache
{
  char v3;
  const char *v4;
  uint64_t v5;
  CKDContainer *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  const char *v21;
  uint64_t v22;
  NSObject *v23;
  const char *v24;
  NSObject *v25;
  NSObject *v26;
  id v27;
  uint8_t buf[4];
  CKDContainer *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v27 = 0;
  v3 = objc_msgSend_setupAssetTransfers_(self, a2, (uint64_t)&v27);
  v6 = (CKDContainer *)v27;
  if ((v3 & 1) != 0)
  {
    objc_msgSend_MMCS(self, v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend_MMCS(self, v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_assetCache(v10, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend_MMCS(self, v14, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_assetCache(v16, v17, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v20 = *MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v29 = self;
          _os_log_debug_impl(&dword_1BE990000, v20, OS_LOG_TYPE_DEBUG, "Clearing asset cache for %@", buf, 0xCu);
        }
        objc_msgSend_clearAssetCache(v19, v21, v22);

        goto LABEL_23;
      }
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v26 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v29 = self;
        v24 = "No assetCache MMCS for %@";
        goto LABEL_21;
      }
    }
    else
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v26 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v29 = self;
        v24 = "No MMCS for %@";
LABEL_21:
        v25 = v26;
        goto LABEL_22;
      }
    }
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v23 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v6;
      v24 = "MMCS setup failed:%@";
      v25 = v23;
LABEL_22:
      _os_log_error_impl(&dword_1BE990000, v25, OS_LOG_TYPE_ERROR, v24, buf, 0xCu);
    }
  }
LABEL_23:

}

- (void)showAssetCache
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
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
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  CKDContainer *v21;
  uint8_t buf[16];

  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v3 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE990000, v3, OS_LOG_TYPE_INFO, "Showing all known asset caches", buf, 2u);
  }
  objc_msgSend_deviceContext(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_metadataCache(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_account(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_accountID(v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_knownAppContainerAccountTuplesForAccountID_(v9, v16, (uint64_t)v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = sub_1BEA2FA84;
  v19[3] = &unk_1E782EE20;
  v20 = v17;
  v21 = self;
  v18 = v17;
  CKMuckingWithPersonas(v19);

}

- (void)clearRecordCache
{
  void *v3;
  const char *v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v3 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
  {
    v6 = v3;
    objc_msgSend_applicationBundleID(self, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412290;
    v14 = v9;
    _os_log_impl(&dword_1BE990000, v6, OS_LOG_TYPE_INFO, "Clearing record cache for %@", (uint8_t *)&v13, 0xCu);

  }
  objc_msgSend_recordCache(self, v4, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_clearAllRecords(v10, v11, v12);

}

- (void)setIsForClouddInternalUse:(BOOL)a3
{
  self->_isForClouddInternalUse = a3;
}

- (CKDLogicalDeviceScopedClientProxy)logicalDeviceScopedClientProxy
{
  return (CKDLogicalDeviceScopedClientProxy *)objc_loadWeakRetained((id *)&self->_logicalDeviceScopedClientProxy);
}

- (int64_t)cachedEnvironment
{
  return self->_cachedEnvironment;
}

- (void)setHardwareID:(id)a3
{
  objc_storeStrong((id *)&self->_hardwareID, a3);
}

- (BOOL)isClientMainBundleAppleExecutable
{
  return self->_isClientMainBundleAppleExecutable;
}

- (CKDMMCS)MMCS
{
  return self->_MMCS;
}

- (void)setMMCS:(id)a3
{
  objc_storeStrong((id *)&self->_MMCS, a3);
}

- (void)setPcsManager:(id)a3
{
  objc_storeStrong((id *)&self->_pcsManager, a3);
}

- (void)setPcsCache:(id)a3
{
  objc_storeStrong((id *)&self->_pcsCache, a3);
}

- (void)setAnonymousSharingManager:(id)a3
{
  objc_storeStrong((id *)&self->_anonymousSharingManager, a3);
}

- (void)setPublicIdentitiesDiskCache:(id)a3
{
  objc_storeStrong((id *)&self->_publicIdentitiesDiskCache, a3);
}

- (void)setForegroundPublicIdentityLookupService:(id)a3
{
  objc_storeStrong((id *)&self->_foregroundPublicIdentityLookupService, a3);
}

- (void)setBackgroundPublicIdentityLookupService:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundPublicIdentityLookupService, a3);
}

- (void)setFetchAggregator:(id)a3
{
  objc_storeStrong((id *)&self->_fetchAggregator, a3);
}

- (NSURL)publicShareServiceURL
{
  return (NSURL *)objc_getProperty(self, a2, 408, 1);
}

- (NSURL)publicDeviceServiceURL
{
  return (NSURL *)objc_getProperty(self, a2, 416, 1);
}

- (NSURL)publicCodeServiceURL
{
  return (NSURL *)objc_getProperty(self, a2, 424, 1);
}

- (void)setOrgAdminUserID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 448);
}

- (void)setOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_operationQueue, a3);
}

- (void)setCleanupOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_cleanupOperationQueue, a3);
}

- (void)setFakeErrorsByClassName:(id)a3
{
  objc_storeStrong((id *)&self->_fakeErrorsByClassName, a3);
}

- (NSMutableDictionary)fakeResponseOperationLifetimeByClassName
{
  return self->_fakeResponseOperationLifetimeByClassName;
}

- (void)setFakeResponseOperationLifetimeByClassName:(id)a3
{
  objc_storeStrong((id *)&self->_fakeResponseOperationLifetimeByClassName, a3);
}

- (void)setFakeResponseOperationResultByClassNameByItemID:(id)a3
{
  objc_storeStrong((id *)&self->_fakeResponseOperationResultByClassNameByItemID, a3);
}

- (NSRecursiveLock)serverConfigLock
{
  return self->_serverConfigLock;
}

- (void)setServerConfigLock:(id)a3
{
  objc_storeStrong((id *)&self->_serverConfigLock, a3);
}

- (NSRecursiveLock)mmcsLock
{
  return self->_mmcsLock;
}

- (void)setMmcsLock:(id)a3
{
  objc_storeStrong((id *)&self->_mmcsLock, a3);
}

- (NSRecursiveLock)deviceContextLock
{
  return self->_deviceContextLock;
}

- (NSRecursiveLock)anonymousSharingManagerLock
{
  return self->_anonymousSharingManagerLock;
}

- (void)setAnonymousSharingManagerLock:(id)a3
{
  objc_storeStrong((id *)&self->_anonymousSharingManagerLock, a3);
}

- (NSRecursiveLock)sandboxExtensionsLock
{
  return self->_sandboxExtensionsLock;
}

- (void)setSandboxExtensionsLock:(id)a3
{
  objc_storeStrong((id *)&self->_sandboxExtensionsLock, a3);
}

- (NSRecursiveLock)fetchAggregatorLock
{
  return self->_fetchAggregatorLock;
}

- (void)setFetchAggregatorLock:(id)a3
{
  objc_storeStrong((id *)&self->_fetchAggregatorLock, a3);
}

- (NSRecursiveLock)publicIdentityServiceLock
{
  return self->_publicIdentityServiceLock;
}

- (void)setPublicIdentityServiceLock:(id)a3
{
  objc_storeStrong((id *)&self->_publicIdentityServiceLock, a3);
}

- (NSRecursiveLock)pcsManagerLock
{
  return self->_pcsManagerLock;
}

- (void)setPcsManagerLock:(id)a3
{
  objc_storeStrong((id *)&self->_pcsManagerLock, a3);
}

- (NSURL)applicationIcon
{
  return self->_applicationIcon;
}

- (void)setApplicationIcon:(id)a3
{
  objc_storeStrong((id *)&self->_applicationIcon, a3);
}

- (NSString)applicationDisplayName
{
  return self->_applicationDisplayName;
}

- (void)setApplicationDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_applicationDisplayName, a3);
}

- (void)setContainingBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_containingBundleID, a3);
}

- (void)setCancellationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_cancellationQueue, a3);
}

- (OS_dispatch_queue)statusQueue
{
  return self->_statusQueue;
}

- (void)setStatusQueue:(id)a3
{
  objc_storeStrong((id *)&self->_statusQueue, a3);
}

- (void)setUncancellableOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_uncancellableOperationQueue, a3);
}

- (void)setBackgroundOperationThrottleQueue:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundOperationThrottleQueue, a3);
}

- (void)setCloudKitSupportOperationThrottleQueue:(id)a3
{
  objc_storeStrong((id *)&self->_cloudKitSupportOperationThrottleQueue, a3);
}

- (void)setPendingOperationIDs:(id)a3
{
  objc_storeStrong((id *)&self->_pendingOperationIDs, a3);
}

- (int64_t)hasTCCAuthorizationTernary
{
  return self->_hasTCCAuthorizationTernary;
}

- (void)setHasTCCAuthorizationTernary:(int64_t)a3
{
  self->_hasTCCAuthorizationTernary = a3;
}

- (int64_t)hasValidatedEntitlementsTernary
{
  return self->_hasValidatedEntitlementsTernary;
}

- (void)setHasValidatedEntitlementsTernary:(int64_t)a3
{
  self->_hasValidatedEntitlementsTernary = a3;
}

- (CKDTestServerProtocol)testServer
{
  return self->_testServer;
}

- (NSOperationQueue)tccAuthOpQueue
{
  return self->_tccAuthOpQueue;
}

- (void)setTccAuthOpQueue:(id)a3
{
  objc_storeStrong((id *)&self->_tccAuthOpQueue, a3);
}

- (void)setTccAuthQueue:(id)a3
{
  objc_storeStrong((id *)&self->_tccAuthQueue, a3);
}

- (NSMutableDictionary)operationStatisticsByClassName
{
  return self->_operationStatisticsByClassName;
}

- (void)setOperationStatisticsByClassName:(id)a3
{
  objc_storeStrong((id *)&self->_operationStatisticsByClassName, a3);
}

- (BOOL)hasDataContainer
{
  return self->_hasDataContainer;
}

- (void)setHasDataContainer:(BOOL)a3
{
  self->_hasDataContainer = a3;
}

- (void)setClientContainers:(id)a3
{
  objc_storeStrong((id *)&self->_clientContainers, a3);
}

@end

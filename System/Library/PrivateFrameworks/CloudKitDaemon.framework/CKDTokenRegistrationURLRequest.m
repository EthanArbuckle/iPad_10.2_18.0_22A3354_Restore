@implementation CKDTokenRegistrationURLRequest

- (CKDTokenRegistrationURLRequest)initWithOperation:(id)a3 apsToken:(id)a4 apsEnvironmentString:(id)a5 bundleID:(id)a6 skipBundleIDCheck:(BOOL)a7
{
  id v13;
  id v14;
  id v15;
  CKDTokenRegistrationURLRequest *v16;
  CKDTokenRegistrationURLRequest *v17;
  objc_super v19;

  v13 = a4;
  v14 = a5;
  v15 = a6;
  v19.receiver = self;
  v19.super_class = (Class)CKDTokenRegistrationURLRequest;
  v16 = -[CKDURLRequest initWithOperation:](&v19, sel_initWithOperation_, a3);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_apsToken, a4);
    objc_storeStrong((id *)&v17->_apsEnvironmentString, a5);
    objc_storeStrong((id *)&v17->_bundleID, a6);
    v17->_skipBundleIDCheck = a7;
  }

  return v17;
}

- (void)fillOutEquivalencyPropertiesBuilder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CKDTokenRegistrationURLRequest;
  v4 = a3;
  -[CKDURLRequest fillOutEquivalencyPropertiesBuilder:](&v13, sel_fillOutEquivalencyPropertiesBuilder_, v4);
  objc_msgSend_apsEnvironmentString(self, v5, v6, v13.receiver, v13.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v4, v8, (uint64_t)v7, CFSTR("apsEnvironmentString"));

  objc_msgSend_bundleID(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v4, v12, (uint64_t)v11, CFSTR("bundleID"));

}

- (BOOL)requiresTokenRegistration
{
  return 0;
}

- (id)requestOperationClasses
{
  const char *v2;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v4[0] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v2, (uint64_t)v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)generateRequestOperations
{
  void *v3;
  const char *v4;
  uint64_t v5;
  NSObject *v6;
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
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  const char *v29;
  void *v30;
  void *v31;
  const char *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  _BOOL8 v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  const char *v80;
  void *v81;
  void *v83;
  uint8_t buf[4];
  void *v85;
  __int16 v86;
  void *v87;
  __int16 v88;
  void *v89;
  __int16 v90;
  void *v91;
  __int16 v92;
  void *v93;
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v3 = (void *)*MEMORY[0x1E0C952E0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952E0], OS_LOG_TYPE_INFO))
  {
    v6 = v3;
    objc_msgSend_requestUUID(self, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_container(self, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_applicationBundleID(v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_apsToken(self, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_debugDescription(v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_apsEnvironmentString(self, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_bundleID(self, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544387;
    v85 = v9;
    v86 = 2114;
    v87 = v15;
    v88 = 2113;
    v89 = v21;
    v90 = 2114;
    v91 = v24;
    v92 = 2114;
    v93 = v27;
    _os_log_impl(&dword_1BE990000, v6, OS_LOG_TYPE_INFO, "req: %{public}@, \"Sending token registration for %{public}@ with token %{private}@ in aps environment %{public}@ with bundleID %{public}@\", buf, 0x34u);

  }
  v28 = objc_msgSend_operationType(self, v4, v5);
  objc_msgSend_operationRequestWithType_(self, v29, v28);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_opt_new();
  objc_msgSend_setTokenRegistrationRequest_(v30, v32, (uint64_t)v31);

  v33 = (void *)objc_opt_new();
  objc_msgSend_tokenRegistrationRequest(v30, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTokenRegistrationBody_(v36, v37, (uint64_t)v33);

  objc_msgSend_apsToken(self, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_tokenRegistrationRequest(v30, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_tokenRegistrationBody(v43, v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setToken_(v46, v47, (uint64_t)v40);

  objc_msgSend_apsEnvironmentString(self, v48, v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend_compare_options_(v50, v51, *MEMORY[0x1E0CFE128], 1) == 0;
  objc_msgSend_tokenRegistrationRequest(v30, v53, v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_tokenRegistrationBody(v55, v56, v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setApnsEnv_(v58, v59, v52);

  objc_msgSend_bundleID(self, v60, v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_tokenRegistrationRequest(v30, v63, v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_tokenRegistrationBody(v65, v66, v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setBundleIdentifier_(v68, v69, (uint64_t)v62);

  v72 = objc_msgSend_skipBundleIDCheck(self, v70, v71);
  objc_msgSend_tokenRegistrationRequest(v30, v73, v74);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_tokenRegistrationBody(v75, v76, v77);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSkipBundleIDCheck_(v78, v79, v72);

  v83 = v30;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v80, (uint64_t)&v83, 1);
  v81 = (void *)objc_claimAutoreleasedReturnValue();

  return v81;
}

- (id)applicationBundleIdentifierForContainerAccess
{
  return CFSTR("com.apple.cloudd");
}

- (id)applicationBundleIdentifierForNetworkAttribution
{
  return CFSTR("com.apple.cloudd");
}

- (id)sourceApplicationSecondaryIdentifier
{
  return 0;
}

- (id)requestDidParseProtobufObject:(id)a3
{
  return 0;
}

- (NSData)apsToken
{
  return self->_apsToken;
}

- (void)setApsToken:(id)a3
{
  objc_storeStrong((id *)&self->_apsToken, a3);
}

- (NSString)apsEnvironmentString
{
  return self->_apsEnvironmentString;
}

- (void)setApsEnvironmentString:(id)a3
{
  objc_storeStrong((id *)&self->_apsEnvironmentString, a3);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_bundleID, a3);
}

- (BOOL)skipBundleIDCheck
{
  return self->_skipBundleIDCheck;
}

- (void)setSkipBundleIDCheck:(BOOL)a3
{
  self->_skipBundleIDCheck = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_apsEnvironmentString, 0);
  objc_storeStrong((id *)&self->_apsToken, 0);
}

@end

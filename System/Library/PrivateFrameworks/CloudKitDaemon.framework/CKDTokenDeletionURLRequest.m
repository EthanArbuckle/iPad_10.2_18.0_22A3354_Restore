@implementation CKDTokenDeletionURLRequest

- (CKDTokenDeletionURLRequest)initWithOperation:(id)a3 apsToken:(id)a4 apsEnvironmentString:(id)a5 bundleID:(id)a6
{
  id v11;
  id v12;
  id v13;
  CKDTokenDeletionURLRequest *v14;
  CKDTokenDeletionURLRequest *v15;
  objc_super v17;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)CKDTokenDeletionURLRequest;
  v14 = -[CKDURLRequest initWithOperation:](&v17, sel_initWithOperation_, a3);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_apsToken, a4);
    objc_storeStrong((id *)&v15->_apsEnvironmentString, a5);
    objc_storeStrong((id *)&v15->_bundleID, a6);
  }

  return v15;
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
  v13.super_class = (Class)CKDTokenDeletionURLRequest;
  v4 = a3;
  -[CKDURLRequest fillOutEquivalencyPropertiesBuilder:](&v13, sel_fillOutEquivalencyPropertiesBuilder_, v4);
  objc_msgSend_apsEnvironmentString(self, v5, v6, v13.receiver, v13.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v4, v8, (uint64_t)v7, CFSTR("apsEnvironmentString"));

  objc_msgSend_bundleID(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v4, v12, (uint64_t)v11, CFSTR("bundleID"));

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

- (BOOL)requiresTokenRegistration
{
  return 0;
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
  uint64_t v19;
  const char *v20;
  void *v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  _BOOL8 v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  const char *v61;
  void *v62;
  void *v64;
  uint8_t buf[4];
  void *v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  void *v70;
  __int16 v71;
  void *v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v3 = (void *)*MEMORY[0x1E0C952E0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952E0], OS_LOG_TYPE_INFO))
  {
    v6 = v3;
    objc_msgSend_requestUUID(self, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_apsToken(self, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_apsEnvironmentString(self, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_bundleID(self, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544131;
    v66 = v9;
    v67 = 2113;
    v68 = v12;
    v69 = 2114;
    v70 = v15;
    v71 = 2114;
    v72 = v18;
    _os_log_impl(&dword_1BE990000, v6, OS_LOG_TYPE_INFO, "req: %{public}@, \"Unregistering token %{private}@ in aps environment %{public}@ for bundleID %{public}@\", buf, 0x2Au);

  }
  v19 = objc_msgSend_operationType(self, v4, v5);
  objc_msgSend_operationRequestWithType_(self, v20, v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_opt_new();
  objc_msgSend_setTokenUnregistrationRequest_(v21, v23, (uint64_t)v22);

  v24 = (void *)objc_opt_new();
  objc_msgSend_tokenUnregistrationRequest(v21, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTokenRegistrationBody_(v27, v28, (uint64_t)v24);

  objc_msgSend_apsToken(self, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_tokenUnregistrationRequest(v21, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_tokenRegistrationBody(v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setToken_(v37, v38, (uint64_t)v31);

  objc_msgSend_apsEnvironmentString(self, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend_compare_options_(v41, v42, *MEMORY[0x1E0CFE128], 1) == 0;
  objc_msgSend_tokenUnregistrationRequest(v21, v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_tokenRegistrationBody(v46, v47, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setApnsEnv_(v49, v50, v43);

  objc_msgSend_bundleID(self, v51, v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_tokenUnregistrationRequest(v21, v54, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_tokenRegistrationBody(v56, v57, v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setBundleIdentifier_(v59, v60, (uint64_t)v53);

  v64 = v21;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v61, (uint64_t)&v64, 1);
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  return v62;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_apsEnvironmentString, 0);
  objc_storeStrong((id *)&self->_apsToken, 0);
}

@end

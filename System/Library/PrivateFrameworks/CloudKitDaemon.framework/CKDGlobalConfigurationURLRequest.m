@implementation CKDGlobalConfigurationURLRequest

- (BOOL)requiresConfiguration
{
  return 0;
}

- (BOOL)requiresDeviceID
{
  return 0;
}

- (BOOL)allowsAnonymousAccount
{
  return 1;
}

- (void)fillOutEquivalencyPropertiesBuilder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKDGlobalConfigurationURLRequest;
  -[CKDURLRequest fillOutEquivalencyPropertiesBuilder:](&v3, sel_fillOutEquivalencyPropertiesBuilder_, a3);
}

- (id)additionalHeaderValues
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;
  __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v13 = CFSTR("X-Apple-CKAppId");
  objc_msgSend_container(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerID(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerIdentifier(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v10, (uint64_t)v14, &v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (int64_t)serverType
{
  return 5;
}

- (int64_t)partitionType
{
  return 3;
}

- (id)url
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  void *v26;

  objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_configBaseURL(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_componentsWithURL_resolvingAgainstBaseURL_(MEMORY[0x1E0CB3998], v7, (uint64_t)v6, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend_path(v8, v10, v11);
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v15 = (void *)v12;
    objc_msgSend_path(v8, v13, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend_length(v16, v17, v18);

    if (v19)
    {
      objc_msgSend_path(v8, v13, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_appendString_(v9, v22, (uint64_t)v21);

    }
  }
  objc_msgSend_appendString_(v9, v13, (uint64_t)CFSTR("/configurations/internetservices/cloudkit/cloudkit-1.0.plist"));
  objc_msgSend_setPath_(v8, v23, (uint64_t)v9);
  objc_msgSend_URL(v8, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (id)httpMethod
{
  return CFSTR("GET");
}

- (BOOL)hasRequestBody
{
  return 0;
}

- (void)requestDidParsePlistObject:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  CKDServerConfiguration *v10;
  const char *v11;
  CKDServerConfiguration *v12;
  CKDServerConfiguration *configuration;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v5 = (void *)*MEMORY[0x1E0C952E0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952E0], OS_LOG_TYPE_INFO))
  {
    v6 = v5;
    objc_msgSend_requestUUID(self, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v9;
    v16 = 2114;
    v17 = v4;
    _os_log_impl(&dword_1BE990000, v6, OS_LOG_TYPE_INFO, "req: %{public}@, \"Fetched configuration plist from server: %{public}@\", (uint8_t *)&v14, 0x16u);

  }
  v10 = [CKDServerConfiguration alloc];
  v12 = (CKDServerConfiguration *)objc_msgSend_initWithValues_(v10, v11, (uint64_t)v4);
  configuration = self->_configuration;
  self->_configuration = v12;

}

- (CKDServerConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end

@implementation FBSApplicationTrustFacade

- (unint64_t)trustStateForApplication:(id)a3
{
  id v5;
  FBSLegacySignatureValidationService *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  FBSApplicationTrustDataProvider *v12;
  FBSApplicationTrustDataProvider *legacyProvider;
  FBSSignatureValidationService *v14;
  FBSApplicationTrustDataProvider *modernProvider;
  FBSSignatureValidationService *v16;
  FBSSignatureValidationService *authoritativeProvider;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  BOOL v26;
  BOOL v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  const char *v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!self->_legacyProvider)
  {
    v6 = [FBSLegacySignatureValidationService alloc];
    +[FBSProfileManager sharedInstance](FBSProfileManager, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "signerIdentity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "profilesForSignerIdentity:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[FBSProfileManager sharedInstance](FBSProfileManager, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[FBSLegacySignatureValidationService initWithApplicationInfo:andProvisioningProfiles:isManaged:](v6, "initWithApplicationInfo:andProvisioningProfiles:isManaged:", v5, v9, objc_msgSend(v10, "isManaged:", v11));
    legacyProvider = self->_legacyProvider;
    self->_legacyProvider = v12;

  }
  if (!self->_modernProvider)
  {
    v14 = objc_alloc_init(FBSSignatureValidationService);
    modernProvider = self->_modernProvider;
    self->_modernProvider = (FBSApplicationTrustDataProvider *)v14;

  }
  if (!self->_authoritativeProvider)
  {
    v16 = objc_alloc_init(FBSSignatureValidationService);
    authoritativeProvider = self->_authoritativeProvider;
    self->_authoritativeProvider = v16;

    -[FBSSignatureValidationService setAuthoritative:](self->_authoritativeProvider, "setAuthoritative:", 1);
  }
  v18 = -[FBSApplicationTrustDataProvider trustStateForApplication:](self->_modernProvider, "trustStateForApplication:", v5);
  v19 = -[FBSApplicationTrustDataProvider trustStateForApplication:](self->_legacyProvider, "trustStateForApplication:", v5);
  v20 = -[FBSSignatureValidationService trustStateForApplication:](self->_authoritativeProvider, "trustStateForApplication:", v5);
  FBLogCommon();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "bundleIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromFBSApplicationTrustState(v19);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromFBSApplicationTrustState(v18);
    v37 = a2;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromFBSApplicationTrustState(v20);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v39 = v22;
    v40 = 2112;
    v41 = v23;
    v42 = 2112;
    v43 = v24;
    v44 = 2112;
    v45 = v25;
    _os_log_impl(&dword_19A6D4000, v21, OS_LOG_TYPE_DEFAULT, "trust states for %@ - legacy: %@, modern: %@, authoritative: %@", buf, 0x2Au);

    a2 = v37;
  }

  if (v20 != v18)
  {
    v29 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromFBSApplicationTrustState(v20);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromFBSApplicationTrustState(v18);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringWithFormat:", CFSTR("Authoritative and modern states were divergent - authoritative: %@, modern: %@"), v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSApplicationTrustFacade trustStateForApplication:].cold.2(a2);
    objc_msgSend(objc_retainAutorelease(v32), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A746644);
  }
  if (v19 != v18 && (v19 != 3 || v18 != 4))
  {
    v26 = v18 != 4 && v18 >= 2;
    v27 = !v26;
    if (v19 != 8 || !v27)
    {
      v33 = (void *)MEMORY[0x1E0CB3940];
      NSStringFromFBSApplicationTrustState(v19);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromFBSApplicationTrustState(v18);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "stringWithFormat:", CFSTR("Legacy and modern states were divergent - legacy: %@, modern: %@"), v34, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBSApplicationTrustFacade trustStateForApplication:].cold.1(a2);
      objc_msgSend(objc_retainAutorelease(v36), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7466CCLL);
    }
  }

  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authoritativeProvider, 0);
  objc_storeStrong((id *)&self->_modernProvider, 0);
  objc_storeStrong((id *)&self->_legacyProvider, 0);
}

- (void)trustStateForApplication:(const char *)a1 .cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)trustStateForApplication:(const char *)a1 .cold.2(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end

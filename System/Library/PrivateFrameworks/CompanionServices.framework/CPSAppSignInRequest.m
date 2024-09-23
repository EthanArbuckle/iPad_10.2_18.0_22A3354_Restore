@implementation CPSAppSignInRequest

- (CPSAppSignInRequest)initWithRequests:(id)a3
{
  id v4;
  CPSAppSignInRequest *v5;
  CPSAppSignInRequest *v6;
  _QWORD v8[4];
  CPSAppSignInRequest *v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CPSAppSignInRequest;
  v5 = -[CPSAppSignInRequest init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __40__CPSAppSignInRequest_initWithRequests___block_invoke;
    v8[3] = &unk_250A117E8;
    v9 = v5;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);

  }
  return v6;
}

void __40__CPSAppSignInRequest_initWithRequests___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  Class (*v24)(uint64_t);
  void *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v4 + 8))
  {
LABEL_8:
    if (*(_QWORD *)(v4 + 16))
      goto LABEL_14;
    v27 = 0;
    v28 = &v27;
    v29 = 0x2050000000;
    v17 = (void *)getASAuthorizationPasswordRequestClass_softClass;
    v30 = getASAuthorizationPasswordRequestClass_softClass;
    if (!getASAuthorizationPasswordRequestClass_softClass)
    {
      v22 = MEMORY[0x24BDAC760];
      v23 = 3221225472;
      v24 = __getASAuthorizationPasswordRequestClass_block_invoke;
      v25 = &unk_250A11810;
      v26 = &v27;
      __getASAuthorizationPasswordRequestClass_block_invoke((uint64_t)&v22);
      v17 = (void *)v28[3];
    }
    v18 = objc_retainAutorelease(v17);
    _Block_object_dispose(&v27, 8);
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_14;
    v19 = objc_alloc_init(MEMORY[0x24BE0ADB8]);
    v20 = *(_QWORD *)(a1 + 32);
    v16 = *(void **)(v20 + 16);
    *(_QWORD *)(v20 + 16) = v19;
LABEL_13:

LABEL_14:
    return;
  }
  v27 = 0;
  v28 = &v27;
  v29 = 0x2050000000;
  v5 = (void *)getASAuthorizationAppleIDRequestClass_softClass;
  v30 = getASAuthorizationAppleIDRequestClass_softClass;
  if (!getASAuthorizationAppleIDRequestClass_softClass)
  {
    v22 = MEMORY[0x24BDAC760];
    v23 = 3221225472;
    v24 = __getASAuthorizationAppleIDRequestClass_block_invoke;
    v25 = &unk_250A11810;
    v26 = &v27;
    __getASAuthorizationAppleIDRequestClass_block_invoke((uint64_t)&v22);
    v5 = (void *)v28[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v27, 8);
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v4 = *(_QWORD *)(a1 + 32);
    goto LABEL_8;
  }
  v7 = v3;
  if (v7)
  {
    v8 = v7;
    v9 = objc_alloc_init(MEMORY[0x24BE0AD18]);
    objc_msgSend(v8, "user");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setUserIdentifier:", v10);

    objc_msgSend(v8, "state");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setState:", v11);

    objc_msgSend(v8, "nonce");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setNonce:", v12);

    objc_msgSend(v8, "requestedScopes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bs_mapNoNulls:", &__block_literal_global_1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setRequestedScopes:", v14);

    v15 = *(_QWORD *)(a1 + 32);
    v16 = *(void **)(v15 + 8);
    *(_QWORD *)(v15 + 8) = v9;
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("inRequest"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __40__CPSAppSignInRequest_initWithRequests___block_invoke_cold_1((uint64_t)v21);
  objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

- (CPSAppSignInRequest)initWithWebRequest:(id)a3
{
  id v6;
  void *v7;
  CPSAppSignInRequest *v8;
  CPSAppSignInRequest *v9;
  CPSAppSignInRequest *result;
  void *v11;
  objc_super v12;

  v6 = a3;
  if (v6)
  {
    v7 = v6;
    v12.receiver = self;
    v12.super_class = (Class)CPSAppSignInRequest;
    v8 = -[CPSAppSignInRequest init](&v12, sel_init);
    v9 = v8;
    if (v8)
      objc_storeStrong((id *)&v8->_webRequest, a3);

    return v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("webRequest != ((void *)0)"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[CPSAppSignInRequest initWithWebRequest:].cold.1(a2, (uint64_t)self, (uint64_t)v11);
    objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    result = (CPSAppSignInRequest *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (CPSAppSignInRequest)initWithAppleIDRequest:(id)a3 passwordRequest:(id)a4 platformKeyCredentialAssertionOptions:(id)a5 platformKeyCredentialRegistrationOptions:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  CPSAppSignInRequest *v15;
  CPSAppSignInRequest *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CPSAppSignInRequest;
  v15 = -[CPSAppSignInRequest init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_appleIDRequest, a3);
    objc_storeStrong((id *)&v16->_passwordRequest, a4);
    objc_storeStrong((id *)&v16->_platformKeyCredentialAssertionOptions, a5);
    objc_storeStrong((id *)&v16->_platformKeyCredentialRegistrationOptions, a6);
  }

  return v16;
}

- (CPSAppSignInRequest)initWithAppleIDRequest:(id)a3 passwordReqeust:(id)a4 platformKeyCredentialAssertionOptions:(id)a5 platformKeyCredentialRegistrationOptions:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  CPSAppSignInRequest *v15;
  CPSAppSignInRequest *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CPSAppSignInRequest;
  v15 = -[CPSAppSignInRequest init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_appleIDRequest, a3);
    objc_storeStrong((id *)&v16->_passwordRequest, a4);
    objc_storeStrong((id *)&v16->_platformKeyCredentialAssertionOptions, a5);
    objc_storeStrong((id *)&v16->_platformKeyCredentialRegistrationOptions, a6);
  }

  return v16;
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_appleIDRequest, CFSTR("appleIDRequest"), 1);
  v5 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_passwordRequest, CFSTR("passwordRequest"), 1);
  v6 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_webRequest, CFSTR("webRequest"), 1);
  v7 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_platformKeyCredentialAssertionOptions, CFSTR("platformKeyCredentialAssertionOptions"), 1);
  v8 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_platformKeyCredentialRegistrationOptions, CFSTR("platformKeyCredentialRegistrationOptions"), 1);
  v9 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_customAuthenticationMethods, CFSTR("customAuthenticationMethods"), 1);
  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", self->_overrideBundleIdentifier, CFSTR("overrideBundleIdentifier"), 1);
  objc_msgSend(v3, "build");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (int64_t)authType
{
  if (self->_webRequest)
    return 5;
  if (-[CPSAppSignInRequest _isPlatformKeyOnlyRequest](self, "_isPlatformKeyOnlyRequest"))
    return 6;
  return 2;
}

- (BOOL)isAppleIDOnlyRequest
{
  return self->_appleIDRequest
      && !self->_passwordRequest
      && !self->_webRequest
      && !self->_platformKeyCredentialAssertionOptions
      && self->_platformKeyCredentialRegistrationOptions == 0;
}

- (BOOL)isEmpty
{
  return !self->_appleIDRequest
      && !self->_passwordRequest
      && !self->_webRequest
      && !self->_platformKeyCredentialAssertionOptions
      && self->_platformKeyCredentialRegistrationOptions == 0;
}

- (BOOL)isWebAuthRequest
{
  return self->_webRequest != 0;
}

- (BOOL)_isPlatformKeyOnlyRequest
{
  return (self->_platformKeyCredentialAssertionOptions || self->_platformKeyCredentialRegistrationOptions)
      && !self->_appleIDRequest
      && !self->_passwordRequest
      && self->_webRequest == 0;
}

- (BOOL)isPasskeyRequest
{
  return self->_platformKeyCredentialAssertionOptions || self->_platformKeyCredentialRegistrationOptions != 0;
}

- (BOOL)isPasskeyRegistrationRequest
{
  return self->_platformKeyCredentialRegistrationOptions != 0;
}

- (BOOL)hasAnyNonPasskeyRegistrationRequest
{
  return self->_platformKeyCredentialAssertionOptions
      || self->_appleIDRequest
      || self->_passwordRequest
      || self->_webRequest != 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPSAppSignInRequest)initWithCoder:(id)a3
{
  id v4;
  CPSAppSignInRequest *v5;
  void *v6;
  uint64_t v7;
  AKAuthorizationRequest *appleIDRequest;
  void *v9;
  uint64_t v10;
  AKPasswordRequest *passwordRequest;
  void *v12;
  uint64_t v13;
  CPSWebRequest *webRequest;
  void *v15;
  uint64_t v16;
  ASCPublicKeyCredentialAssertionOptions *platformKeyCredentialAssertionOptions;
  void *v18;
  uint64_t v19;
  ASCPublicKeyCredentialCreationOptions *platformKeyCredentialRegistrationOptions;
  void *v21;
  uint64_t v22;
  NSArray *customAuthenticationMethods;
  void *v24;
  uint64_t v25;
  NSString *overrideBundleIdentifier;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)CPSAppSignInRequest;
  v5 = -[CPSAppSignInRequest init](&v28, sel_init);
  if (v5)
  {
    objc_opt_self();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("appleIDRequest"));
    v7 = objc_claimAutoreleasedReturnValue();
    appleIDRequest = v5->_appleIDRequest;
    v5->_appleIDRequest = (AKAuthorizationRequest *)v7;

    objc_opt_self();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, CFSTR("passwordRequest"));
    v10 = objc_claimAutoreleasedReturnValue();
    passwordRequest = v5->_passwordRequest;
    v5->_passwordRequest = (AKPasswordRequest *)v10;

    objc_opt_self();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v12, CFSTR("webRequest"));
    v13 = objc_claimAutoreleasedReturnValue();
    webRequest = v5->_webRequest;
    v5->_webRequest = (CPSWebRequest *)v13;

    objc_opt_self();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v15, CFSTR("platformKeyCredentialAssertionOptions"));
    v16 = objc_claimAutoreleasedReturnValue();
    platformKeyCredentialAssertionOptions = v5->_platformKeyCredentialAssertionOptions;
    v5->_platformKeyCredentialAssertionOptions = (ASCPublicKeyCredentialAssertionOptions *)v16;

    objc_opt_self();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v18, CFSTR("platformKeyCredentialRegistrationOptions"));
    v19 = objc_claimAutoreleasedReturnValue();
    platformKeyCredentialRegistrationOptions = v5->_platformKeyCredentialRegistrationOptions;
    v5->_platformKeyCredentialRegistrationOptions = (ASCPublicKeyCredentialCreationOptions *)v19;

    objc_opt_self();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", v21, CFSTR("customAuthenticationMethods"));
    v22 = objc_claimAutoreleasedReturnValue();
    customAuthenticationMethods = v5->_customAuthenticationMethods;
    v5->_customAuthenticationMethods = (NSArray *)v22;

    objc_opt_self();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v24, CFSTR("overrideBundleIdentifier"));
    v25 = objc_claimAutoreleasedReturnValue();
    overrideBundleIdentifier = v5->_overrideBundleIdentifier;
    v5->_overrideBundleIdentifier = (NSString *)v25;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  AKAuthorizationRequest *appleIDRequest;
  id v5;

  appleIDRequest = self->_appleIDRequest;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", appleIDRequest, CFSTR("appleIDRequest"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_passwordRequest, CFSTR("passwordRequest"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_webRequest, CFSTR("webRequest"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_platformKeyCredentialAssertionOptions, CFSTR("platformKeyCredentialAssertionOptions"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_platformKeyCredentialRegistrationOptions, CFSTR("platformKeyCredentialRegistrationOptions"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_customAuthenticationMethods, CFSTR("customAuthenticationMethods"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_overrideBundleIdentifier, CFSTR("overrideBundleIdentifier"));

}

- (AKAuthorizationRequest)appleIDRequest
{
  return self->_appleIDRequest;
}

- (AKPasswordRequest)passwordRequest
{
  return self->_passwordRequest;
}

- (NSArray)customAuthenticationMethods
{
  return self->_customAuthenticationMethods;
}

- (void)setCustomAuthenticationMethods:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (CPSWebRequest)webRequest
{
  return self->_webRequest;
}

- (ASCPublicKeyCredentialAssertionOptions)platformKeyCredentialAssertionOptions
{
  return self->_platformKeyCredentialAssertionOptions;
}

- (ASCPublicKeyCredentialCreationOptions)platformKeyCredentialRegistrationOptions
{
  return self->_platformKeyCredentialRegistrationOptions;
}

- (NSString)overrideBundleIdentifier
{
  return self->_overrideBundleIdentifier;
}

- (void)setOverrideBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_platformKeyCredentialRegistrationOptions, 0);
  objc_storeStrong((id *)&self->_platformKeyCredentialAssertionOptions, 0);
  objc_storeStrong((id *)&self->_webRequest, 0);
  objc_storeStrong((id *)&self->_customAuthenticationMethods, 0);
  objc_storeStrong((id *)&self->_passwordRequest, 0);
  objc_storeStrong((id *)&self->_appleIDRequest, 0);
}

void __40__CPSAppSignInRequest_initWithRequests___block_invoke_cold_1(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  __int16 v5;
  const __CFString *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "AKAuthorizationRequest *_CPSAKAuthorizationRequestFromASAuthorizationAppleIDRequest(ASAuthorizationAppleIDRequest *__strong)");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 138544130;
  v4 = v2;
  v5 = 2114;
  v6 = CFSTR("CPSAppSignInRequest.m");
  v7 = 1024;
  v8 = 27;
  v9 = 2114;
  v10 = a1;
  _os_log_error_impl(&dword_2383E3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", (uint8_t *)&v3, 0x26u);

}

- (void)initWithWebRequest:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544642;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  v12 = 2048;
  v13 = a2;
  v14 = 2114;
  v15 = CFSTR("CPSAppSignInRequest.m");
  v16 = 1024;
  v17 = 75;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_2383E3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

@end

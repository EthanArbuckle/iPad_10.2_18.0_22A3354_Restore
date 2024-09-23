@implementation CPSAppSignInResponse

- (CPSAppSignInResponse)initWithAppleIDAuthorization:(id)a3
{
  id v5;
  void *v6;
  CPSAppSignInResponse *v7;
  CPSAppSignInResponse *v8;
  CPSAppSignInResponse *result;
  void *v10;
  objc_super v11;

  v5 = a3;
  if (v5)
  {
    v6 = v5;
    v11.receiver = self;
    v11.super_class = (Class)CPSAppSignInResponse;
    v7 = -[CPSAppSignInResponse init](&v11, sel_init);
    v8 = v7;
    if (v7)
      objc_storeStrong((id *)&v7->_appleIDAuthorization, a3);

    return v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("appleIDAuthorization != ((void *)0)"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[CPSAppSignInResponse initWithAppleIDAuthorization:].cold.1();
    objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    result = (CPSAppSignInResponse *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (CPSAppSignInResponse)initWithPasswordCredential:(id)a3
{
  id v5;
  void *v6;
  CPSAppSignInResponse *v7;
  CPSAppSignInResponse *v8;
  CPSAppSignInResponse *result;
  void *v10;
  objc_super v11;

  v5 = a3;
  if (v5)
  {
    v6 = v5;
    v11.receiver = self;
    v11.super_class = (Class)CPSAppSignInResponse;
    v7 = -[CPSAppSignInResponse init](&v11, sel_init);
    v8 = v7;
    if (v7)
      objc_storeStrong((id *)&v7->_passwordCredential, a3);

    return v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("passwordCredential != ((void *)0)"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[CPSAppSignInResponse initWithPasswordCredential:].cold.1();
    objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    result = (CPSAppSignInResponse *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (CPSAppSignInResponse)initWithWebCallbackURL:(id)a3
{
  id v5;
  void *v6;
  CPSAppSignInResponse *v7;
  CPSAppSignInResponse *v8;
  CPSAppSignInResponse *result;
  void *v10;
  objc_super v11;

  v5 = a3;
  if (v5)
  {
    v6 = v5;
    v11.receiver = self;
    v11.super_class = (Class)CPSAppSignInResponse;
    v7 = -[CPSAppSignInResponse init](&v11, sel_init);
    v8 = v7;
    if (v7)
      objc_storeStrong((id *)&v7->_webCallbackURL, a3);

    return v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("webCallbackURL != ((void *)0)"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[CPSAppSignInResponse initWithWebCallbackURL:].cold.1();
    objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    result = (CPSAppSignInResponse *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (CPSAppSignInResponse)initWithPlatformKeyCredentialAssertion:(id)a3
{
  id v5;
  void *v6;
  CPSAppSignInResponse *v7;
  CPSAppSignInResponse *v8;
  CPSAppSignInResponse *result;
  void *v10;
  objc_super v11;

  v5 = a3;
  if (v5)
  {
    v6 = v5;
    v11.receiver = self;
    v11.super_class = (Class)CPSAppSignInResponse;
    v7 = -[CPSAppSignInResponse init](&v11, sel_init);
    v8 = v7;
    if (v7)
      objc_storeStrong((id *)&v7->_platformKeyCredentialAssertion, a3);

    return v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("platformKeyCredentialAssertion != ((void *)0)"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[CPSAppSignInResponse initWithPlatformKeyCredentialAssertion:].cold.1();
    objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    result = (CPSAppSignInResponse *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (CPSAppSignInResponse)initWithPlatformKeyCredentialRegistration:(id)a3
{
  id v5;
  void *v6;
  CPSAppSignInResponse *v7;
  CPSAppSignInResponse *v8;
  CPSAppSignInResponse *result;
  void *v10;
  objc_super v11;

  v5 = a3;
  if (v5)
  {
    v6 = v5;
    v11.receiver = self;
    v11.super_class = (Class)CPSAppSignInResponse;
    v7 = -[CPSAppSignInResponse init](&v11, sel_init);
    v8 = v7;
    if (v7)
      objc_storeStrong((id *)&v7->_platformKeyCredentialRegistration, a3);

    return v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("platformKeyCredentialRegistration != ((void *)0)"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[CPSAppSignInResponse initWithPlatformKeyCredentialRegistration:].cold.1();
    objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    result = (CPSAppSignInResponse *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_appleIDAuthorization, CFSTR("appleIDAuthorization"), 1);
  v5 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_passwordCredential, CFSTR("passwordCredential"), 1);
  if (self->_webCallbackURL)
  {
    CUPrintNSObjectMasked();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:withName:", v6, CFSTR("webCallbackURL"));

  }
  v7 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_platformKeyCredentialAssertion, CFSTR("platformKeyCredentialAssertion"), 1);
  v8 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_platformKeyCredentialRegistration, CFSTR("platformKeyCredentialRegistration"), 1);
  objc_msgSend(v3, "build");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (AKAuthorization)authorization
{
  return self->_appleIDAuthorization;
}

- (ASAuthorizationCredential)credential
{
  id ASPasswordCredentialClass;
  void *v4;
  void *v5;
  void *v6;

  if (self->_passwordCredential)
  {
    ASPasswordCredentialClass = getASPasswordCredentialClass();
    -[CASPasswordCredential user](self->_passwordCredential, "user");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CASPasswordCredential password](self->_passwordCredential, "password");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(ASPasswordCredentialClass, "credentialWithUser:password:", v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return (ASAuthorizationCredential *)v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPSAppSignInResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CPSAppSignInResponse *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("appleIDAuthorization"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    self = -[CPSAppSignInResponse initWithAppleIDAuthorization:](self, "initWithAppleIDAuthorization:", v6);
    v7 = self;
  }
  else
  {
    objc_opt_self();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, CFSTR("passwordCredential"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      self = -[CPSAppSignInResponse initWithPasswordCredential:](self, "initWithPasswordCredential:", v9);
      v7 = self;
    }
    else
    {
      objc_opt_self();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v10, CFSTR("webCallbackURL"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        self = -[CPSAppSignInResponse initWithWebCallbackURL:](self, "initWithWebCallbackURL:", v11);
        v7 = self;
      }
      else
      {
        objc_opt_self();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v12, CFSTR("platformKeyCredentialAssertion"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          self = -[CPSAppSignInResponse initWithPlatformKeyCredentialAssertion:](self, "initWithPlatformKeyCredentialAssertion:", v13);
          v7 = self;
        }
        else
        {
          objc_opt_self();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "decodeObjectOfClass:forKey:", v14, CFSTR("platformKeyCredentialRegistration"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            self = -[CPSAppSignInResponse initWithPlatformKeyCredentialRegistration:](self, "initWithPlatformKeyCredentialRegistration:", v15);
            v7 = self;
          }
          else
          {
            v16 = (void *)MEMORY[0x24BDD1540];
            v17 = *MEMORY[0x24BDD0B88];
            v21 = *MEMORY[0x24BDD0FD8];
            v22[0] = CFSTR("Failed to decode CPSAppSignInResponse: missing credential values");
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, 4865, v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "failWithError:", v19);

            v7 = 0;
          }

        }
      }

    }
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  AKAuthorization *appleIDAuthorization;
  id v5;

  appleIDAuthorization = self->_appleIDAuthorization;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", appleIDAuthorization, CFSTR("appleIDAuthorization"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_passwordCredential, CFSTR("passwordCredential"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_webCallbackURL, CFSTR("webCallbackURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_platformKeyCredentialAssertion, CFSTR("platformKeyCredentialAssertion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_platformKeyCredentialRegistration, CFSTR("platformKeyCredentialRegistration"));

}

- (NSURL)webCallbackURL
{
  return self->_webCallbackURL;
}

- (ASCPlatformPublicKeyCredentialAssertion)platformKeyCredentialAssertion
{
  return self->_platformKeyCredentialAssertion;
}

- (ASCPlatformPublicKeyCredentialRegistration)platformKeyCredentialRegistration
{
  return self->_platformKeyCredentialRegistration;
}

- (AKAuthorization)appleIDAuthorization
{
  return self->_appleIDAuthorization;
}

- (CASPasswordCredential)passwordCredential
{
  return self->_passwordCredential;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passwordCredential, 0);
  objc_storeStrong((id *)&self->_appleIDAuthorization, 0);
  objc_storeStrong((id *)&self->_platformKeyCredentialRegistration, 0);
  objc_storeStrong((id *)&self->_platformKeyCredentialAssertion, 0);
  objc_storeStrong((id *)&self->_webCallbackURL, 0);
}

- (void)initWithAppleIDAuthorization:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2383E3000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithPasswordCredential:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2383E3000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithWebCallbackURL:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2383E3000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithPlatformKeyCredentialAssertion:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2383E3000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithPlatformKeyCredentialRegistration:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2383E3000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end

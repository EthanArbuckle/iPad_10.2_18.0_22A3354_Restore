@implementation CNAuthorization

- (BOOL)requestAccessForEntityType:(int64_t)a3 error:(id *)a4
{
  char v4;
  void *v6;
  id v7;
  void *v8;
  id v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (a3)
    return 0;
  -[CNAuthorization authorizationContext](self, "authorizationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v4 = objc_msgSend(v6, "requestAccessWithError:", &v10);
  v7 = v10;

  if ((v4 & 1) == 0)
  {
    if (v7)
    {
      v11 = *MEMORY[0x1E0CB3388];
      v12[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
    CNSetError(a4, 100, (uint64_t)v8);

  }
  return v4;
}

- (CNAuthorizationContext)authorizationContext
{
  return self->_authorizationContext;
}

- (CNAuthorization)initWithAssumedIdentity:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  CNAuthorization *v7;

  if (a3)
  {
    v4 = (objc_class *)MEMORY[0x1E0D139A0];
    v5 = a3;
    v6 = (void *)objc_msgSend([v4 alloc], "initWithAuditToken:assumedIdentity:", 0, v5);

  }
  else
  {
    v6 = 0;
  }
  v7 = -[CNAuthorization initWithAuthorizationContext:](self, "initWithAuthorizationContext:", v6);

  return v7;
}

- (CNAuthorization)initWithAuthorizationContext:(id)a3
{
  id v4;
  CNAuthorization *v5;
  CNAuthorizationContext *v6;
  CNAuthorizationContext *authorizationContext;
  CNAuthorization *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNAuthorization;
  v5 = -[CNAuthorization init](&v10, sel_init);
  if (v5)
  {
    if (v4)
    {
      v6 = (CNAuthorizationContext *)v4;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D139A0], "sharedInstance");
      v6 = (CNAuthorizationContext *)objc_claimAutoreleasedReturnValue();
    }
    authorizationContext = v5->_authorizationContext;
    v5->_authorizationContext = v6;

    v8 = v5;
  }

  return v5;
}

void __52__CNAuthorization_authorizationStatusForEntityType___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  _QWORD v7[5];

  v7[4] = *MEMORY[0x1E0C80C00];
  v6[0] = &unk_1E2A400E0;
  v6[1] = &unk_1E2A400F8;
  v7[0] = &unk_1E2A400E0;
  v7[1] = &unk_1E2A40110;
  v6[2] = &unk_1E2A40110;
  v0 = (void *)MEMORY[0x1E0CB37E8];
  if (dyld_program_sdk_at_least())
    v1 = 4;
  else
    v1 = 3;
  objc_msgSend(v0, "numberWithInteger:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[3] = &unk_1E2A40128;
  v7[2] = v2;
  v7[3] = &unk_1E2A40128;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "copy");
  v5 = (void *)authorizationStatusForEntityType__cn_once_object_1;
  authorizationStatusForEntityType__cn_once_object_1 = v4;

}

- (int64_t)authorizationStatusForEntityType:(int64_t)a3
{
  int64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  if (-[CNAuthorization isAccessRestrictedForEntityType:](self, "isAccessRestrictedForEntityType:", a3))
    return 1;
  if (authorizationStatusForEntityType__cn_once_token_1 != -1)
    dispatch_once(&authorizationStatusForEntityType__cn_once_token_1, &__block_literal_global_5_4);
  v5 = (id)authorizationStatusForEntityType__cn_once_object_1;
  -[CNAuthorization authorizationContext](self, "authorizationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "authorizationStatus");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v9, "integerValue");
  if (v4 == 2)
  {
    objc_msgSend((id)objc_opt_class(), "logger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "accessAuthorizationStatusWasDenied");

  }
  return v4;
}

- (BOOL)isAccessRestrictedForEntityType:(int64_t)a3
{
  void *v4;
  char v5;

  if (a3)
    return 0;
  -[CNAuthorization authorizationContext](self, "authorizationContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isAccessRestricted");

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authorizationContext, 0);
}

- (CNAuthorization)init
{
  return -[CNAuthorization initWithAuthorizationContext:](self, "initWithAuthorizationContext:", 0);
}

- (void)requestAccessForEntityType:(int64_t)a3 completionHandler:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  void *v7;
  void *v8;
  _QWORD v9[5];
  void (**v10)(id, _QWORD, void *);

  v6 = (void (**)(id, _QWORD, void *))a4;
  if (a3)
  {
    +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 100, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v7);

  }
  else
  {
    -[CNAuthorization authorizationContext](self, "authorizationContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __64__CNAuthorization_requestAccessForEntityType_completionHandler___block_invoke;
    v9[3] = &unk_1E29FD498;
    v9[4] = self;
    v10 = v6;
    objc_msgSend(v8, "requestAuthorization:completionHandler:", 1, v9);

  }
}

void __64__CNAuthorization_requestAccessForEntityType_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if ((a2 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    v7 = 0;
  }
  else
  {
    if (v5)
    {
      v11 = *MEMORY[0x1E0CB3388];
      v12[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
    v10 = 0;
    CNSetError(&v10, 100, (uint64_t)v8);
    v7 = v10;
    objc_msgSend((id)objc_opt_class(), "logger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "requestAuthorizationWasDenied");

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

+ (id)logger
{
  if (logger_cn_once_token_0 != -1)
    dispatch_once(&logger_cn_once_token_0, &__block_literal_global_108);
  return (id)logger_cn_once_object_0;
}

void __25__CNAuthorization_logger__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  +[CNContactsEnvironment currentEnvironment](CNContactsEnvironment, "currentEnvironment");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "loggerProvider");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "contactsLogger");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)logger_cn_once_object_0;
  logger_cn_once_object_0 = v1;

}

@end

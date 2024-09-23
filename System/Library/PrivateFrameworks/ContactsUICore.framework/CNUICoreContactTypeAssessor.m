@implementation CNUICoreContactTypeAssessor

+ (NSArray)keysToFetch
{
  void *v2;
  void *v3;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", +[CNUICoreFamilyMemberContactsModelRetriever contactFormatterStyle](CNUICoreFamilyMemberContactsModelRetriever, "contactFormatterStyle", *MEMORY[0x1E0C966D0], *MEMORY[0x1E0C966C0], *MEMORY[0x1E0C967C0], *MEMORY[0x1E0C966A0]));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[4] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (CNUICoreContactTypeAssessor)init
{
  CNUICoreContactTypeAssessor *v2;
  id v3;

  v2 = self;
  CNInitializerUnavailableException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (CNUICoreContactTypeAssessor)initWithFamilyInfo:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  CNUICoreContactTypeAssessor *v14;

  v4 = a3;
  if (!v4)
  {
    if (CNGuardOSLog_cn_once_token_0_17 != -1)
      dispatch_once(&CNGuardOSLog_cn_once_token_0_17, &__block_literal_global_57);
    v5 = CNGuardOSLog_cn_once_object_0_17;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_17, OS_LOG_TYPE_FAULT))
      -[CNUICoreContactTypeAssessor initWithFamilyInfo:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  objc_msgSend(MEMORY[0x1E0D13A68], "futureWithResult:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[CNUICoreContactTypeAssessor initWithFamilyInfoFuture:](self, "initWithFamilyInfoFuture:", v13);

  return v14;
}

- (CNUICoreContactTypeAssessor)initWithFamilyInfoFuture:(id)a3
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CNUICoreContactTypeAssessor *v14;
  CNUICoreContactTypeAssessor *v15;
  CNUICoreContactTypeAssessor *v16;
  objc_super v18;

  v5 = a3;
  if (!v5)
  {
    if (CNGuardOSLog_cn_once_token_0_17 != -1)
      dispatch_once(&CNGuardOSLog_cn_once_token_0_17, &__block_literal_global_57);
    v6 = CNGuardOSLog_cn_once_object_0_17;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_17, OS_LOG_TYPE_FAULT))
      -[CNUICoreContactTypeAssessor initWithFamilyInfoFuture:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
  }
  v18.receiver = self;
  v18.super_class = (Class)CNUICoreContactTypeAssessor;
  v14 = -[CNUICoreContactTypeAssessor init](&v18, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_familyInfoFuture, a3);
    v16 = v15;
  }

  return v15;
}

- (int64_t)estiamtedTypeOfContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  _BOOL4 v9;
  int64_t v10;

  v4 = a3;
  -[CNUICoreContactTypeAssessor familyInfoFuture](self, "familyInfoFuture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "result:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "meContact");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = +[CNUICoreContactMatcher doesContact:matchContact:](CNUICoreContactMatcher, "doesContact:matchContact:", v4, v7);

    v9 = +[CNUICoreContactMatcher doesContact:matchAnyParentOrGuardianInFamily:](CNUICoreContactMatcher, "doesContact:matchAnyParentOrGuardianInFamily:", v4, v6);
    if (v8)
      v10 = 2;
    else
      v10 = v9;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (CNFuture)familyInfoFuture
{
  return self->_familyInfoFuture;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_familyInfoFuture, 0);
}

- (void)initWithFamilyInfo:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DD140000, a1, a3, "parameter ‘initWithFamilyInfo’ must be nonnull", a5, a6, a7, a8, 0);
}

- (void)initWithFamilyInfoFuture:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DD140000, a1, a3, "parameter ‘familyInfoFuture’ must be nonnull", a5, a6, a7, a8, 0);
}

@end

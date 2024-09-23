@implementation FBSWorkspaceService

- (FBSWorkspaceService)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  FBSWorkspaceService *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  FBSWorkspaceService *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("init not supported"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138544642;
    v10 = v5;
    v11 = 2114;
    v12 = v7;
    v13 = 2048;
    v14 = self;
    v15 = 2114;
    v16 = CFSTR("FBSWorkspace.m");
    v17 = 1024;
    v18 = 569;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_19A6D4000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (FBSWorkspaceService *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (id)_initWithTarget:(id)a3 identifier:(id)a4
{
  id v7;
  id v8;
  void *v9;
  FBSWorkspaceService *v10;
  FBSWorkspaceService *v11;
  uint64_t v12;
  NSString *identifier;
  id result;
  void *v15;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  if (v7)
  {
    v9 = v8;
    v16.receiver = self;
    v16.super_class = (Class)FBSWorkspaceService;
    v10 = -[FBSWorkspaceService init](&v16, sel_init);
    v11 = v10;
    if (v10)
    {
      objc_storeStrong((id *)&v10->_target, a3);
      v12 = objc_msgSend(v9, "copy");
      identifier = v11->_identifier;
      v11->_identifier = (NSString *)v12;

    }
    return v11;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("target != ((void *)0)"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSWorkspaceService _initWithTarget:identifier:].cold.1();
    objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const __CFString *identifier;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_identifier)
    identifier = (const __CFString *)self->_identifier;
  else
    identifier = CFSTR("(default)");
  -[FBSWorkspaceServiceTarget identifier](self->_target, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; %@; %@>"), v5, self, identifier, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)sendActions:(id)a3
{
  -[FBSWorkspaceService sendActions:completion:](self, "sendActions:completion:", a3, 0);
}

- (void)sendActions:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  NSObject *v12;
  void *v13;
  const __CFString *identifier;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  SEL v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v7;
  if (v9)
  {
    NSClassFromString(CFSTR("NSSet"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSSetClass]"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBSWorkspaceService sendActions:completion:].cold.1();
      objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A710DFCLL);
    }
  }

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __46__FBSWorkspaceService_sendActions_completion___block_invoke;
  v17[3] = &unk_1E38EBE70;
  v17[4] = self;
  v10 = v8;
  v18 = v10;
  v19 = a2;
  v11 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x19AECA324](v17);
  if (objc_msgSend(v9, "count"))
  {
    FBLogCommon();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      -[FBSWorkspaceServiceTarget identifier](self->_target, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (self->_identifier)
        identifier = (const __CFString *)self->_identifier;
      else
        identifier = CFSTR("(default)");
      objc_msgSend(v9, "fbs_singleLineDescriptionOfBSActions");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v21 = v13;
      v22 = 2114;
      v23 = identifier;
      v24 = 2114;
      v25 = v15;
      _os_log_impl(&dword_19A6D4000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Sending action(s) to workspace %{public}@: %{public}@", buf, 0x20u);

    }
    -[FBSWorkspaceServiceTarget sendActions:toWorkspaceID:completion:](self->_target, "sendActions:toWorkspaceID:completion:", v9, self->_identifier, v11);
  }
  else
  {
    v11[2](v11, 1, 0);
  }

}

void __46__FBSWorkspaceService_sendActions_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  char v16;

  v5 = a3;
  if (v5)
  {
    FBLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __46__FBSWorkspaceService_sendActions_completion___block_invoke_cold_2(a1, v5, v6);

  }
  if (!*(_QWORD *)(a1 + 40))
    goto LABEL_8;
  +[FBSWorkspace _sharedWorkspaceIfExists](FBSWorkspace, "_sharedWorkspaceIfExists");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = v7;
    objc_msgSend(v7, "_callOutQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __46__FBSWorkspaceService_sendActions_completion___block_invoke_237;
    v13[3] = &unk_1E38EBE48;
    v15 = *(id *)(a1 + 40);
    v16 = a2;
    v14 = v5;
    objc_msgSend(v9, "performAsync:", v13);

LABEL_8:
    return;
  }
  v10 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("cannot call completion of sendActions to %@ without a reference to the workspace"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __46__FBSWorkspaceService_sendActions_completion___block_invoke_cold_1();
  objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

uint64_t __46__FBSWorkspaceService_sendActions_completion___block_invoke_237(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (id)createScene:(id)a3
{
  void (**v4)(id, FBSClientSceneFutureDefinition *);
  FBSClientSceneFutureDefinition *v5;
  void *v6;

  v4 = (void (**)(id, FBSClientSceneFutureDefinition *))a3;
  v5 = -[FBSClientSceneFutureDefinition initWithWorkspaceID:]([FBSClientSceneFutureDefinition alloc], "initWithWorkspaceID:", self->_identifier);
  if (v4)
    v4[2](v4, v5);
  -[FBSWorkspaceServiceTarget createSceneFutureWithDefinition:](self->_target, "createSceneFutureWithDefinition:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)createScene:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  -[FBSWorkspaceService createScene:](self, "createScene:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activateWithCompletion:", v6);

  return v7;
}

- (void)requestSceneWithOptions:(id)a3 completion:(id)a4
{
  NSString *identifier;
  id v7;
  id v8;

  identifier = self->_identifier;
  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "setWorkspaceIdentifier:", identifier);
  -[FBSWorkspaceServiceTarget requestSceneWithOptions:completion:](self->_target, "requestSceneWithOptions:completion:", v8, v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_target, 0);
}

- (void)_initWithTarget:identifier:.cold.1()
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

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)sendActions:completion:.cold.1()
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

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

void __46__FBSWorkspaceService_sendActions_completion___block_invoke_cold_1()
{
  uint64_t v0;
  void *v1;
  objc_class *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(*(SEL *)(v0 + 48));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v3, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2();
}

void __46__FBSWorkspaceService_sendActions_completion___block_invoke_cold_2(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "descriptionWithMultilinePrefix:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = v4;
  v8 = 2114;
  v9 = v5;
  _os_log_error_impl(&dword_19A6D4000, a3, OS_LOG_TYPE_ERROR, "%{public}@ Action(s) failed: %{public}@", (uint8_t *)&v6, 0x16u);

}

@end

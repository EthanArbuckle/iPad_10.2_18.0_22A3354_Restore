@implementation FBSProcessExecutionPolicy

+ (id)policyForStrategy:(id)a3 withProvisions:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v13;
  void *v14;

  v7 = a3;
  v8 = a4;
  v9 = v7;
  NSClassFromString(CFSTR("FBSProcessExecutionStrategy"));
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBSProcessExecutionPolicy policyForStrategy:withProvisions:].cold.1(a2);
LABEL_14:
    objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A724FB0);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:FBSProcessExecutionStrategyClass]"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBSProcessExecutionPolicy policyForStrategy:withProvisions:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A725014);
  }

  v10 = v8;
  if (v10)
  {
    NSClassFromString(CFSTR("NSArray"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSArrayClass]"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        +[FBSProcessExecutionPolicy policyForStrategy:withProvisions:].cold.2(a2);
      goto LABEL_14;
    }
  }

  v11 = objc_alloc_init((Class)a1);
  objc_msgSend(v11, "setStrategy:", v9);
  objc_msgSend(v11, "setProvisions:", v10);

  return v11;
}

- (void)setProvisions:(id)a3
{
  objc_class *v4;
  id v5;
  NSArray *v6;
  NSArray *provisions;

  if (self->_provisions != a3)
  {
    v4 = (objc_class *)MEMORY[0x1E0C99D20];
    v5 = a3;
    v6 = (NSArray *)objc_msgSend([v4 alloc], "initWithArray:copyItems:", v5, 1);

    provisions = self->_provisions;
    self->_provisions = v6;

  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  +[FBSProcessExecutionPolicy policyForStrategy:withProvisions:](FBSProcessExecutionPolicy, "policyForStrategy:withProvisions:", self->_strategy, self->_provisions);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)description
{
  return (NSString *)-[FBSProcessExecutionPolicy descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[FBSProcessExecutionPolicy succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(off_1E38E9DF0, "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[FBSProcessExecutionPolicy descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  FBSProcessExecutionPolicy *v11;

  v4 = a3;
  -[FBSProcessExecutionPolicy succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67__FBSProcessExecutionPolicy_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E38EAE08;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

void __67__FBSProcessExecutionPolicy_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "strategy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, CFSTR("strategy"));

  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "provisions");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendArraySection:withName:skipIfEmpty:", v6, CFSTR("provisions"), 1);

}

- (FBSProcessExecutionStrategy)strategy
{
  return self->_strategy;
}

- (void)setStrategy:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)provisions
{
  return self->_provisions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provisions, 0);
  objc_storeStrong((id *)&self->_strategy, 0);
}

+ (void)policyForStrategy:(const char *)a1 withProvisions:.cold.1(const char *a1)
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
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)policyForStrategy:(const char *)a1 withProvisions:.cold.2(const char *a1)
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

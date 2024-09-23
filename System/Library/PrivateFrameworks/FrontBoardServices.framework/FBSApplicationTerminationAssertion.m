@implementation FBSApplicationTerminationAssertion

- (int64_t)assertionState
{
  FBSApplicationTerminationAssertion *v2;
  int64_t assertionState;

  v2 = self;
  objc_sync_enter(v2);
  assertionState = v2->_assertionState;
  objc_sync_exit(v2);

  return assertionState;
}

- (FBSApplicationTerminationAssertion)initWithBundleID:(id)a3 reason:(id)a4 acquisitionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  FBSApplicationTerminationAssertion *v13;
  uint64_t v14;
  NSString *bundleID;
  uint64_t v16;
  NSString *reason;
  void *v18;
  uint64_t v19;
  id v20;
  FBSApplicationTerminationAssertion *v21;
  uint64_t v22;
  BKSTerminationAssertion *assertion;
  void *v25;
  _QWORD v26[4];
  FBSApplicationTerminationAssertion *v27;
  id v28;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("bundleID"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSApplicationTerminationAssertion initWithBundleID:reason:acquisitionHandler:].cold.1(a2);
LABEL_16:
    objc_msgSend(objc_retainAutorelease(v25), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A741D04);
  }
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("reason"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSApplicationTerminationAssertion initWithBundleID:reason:acquisitionHandler:].cold.2(a2);
    goto LABEL_16;
  }
  v12 = v11;
  v13 = -[FBSApplicationTerminationAssertion init](self, "init");
  if (v13)
  {
    v14 = objc_msgSend(v9, "copy");
    bundleID = v13->_bundleID;
    v13->_bundleID = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    reason = v13->_reason;
    v13->_reason = (NSString *)v16;

    objc_msgSend(MEMORY[0x1E0CFE318], "terminationAssertionContext");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setExceptionCode:", 4227595259);
    if ((objc_msgSend(v10, "isEqualToString:", CFSTR("critical")) & 1) != 0)
    {
      v19 = 3;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("installation")) & 1) != 0)
    {
      v19 = 2;
    }
    else
    {
      v19 = objc_msgSend(v10, "isEqualToString:", CFSTR("deletion"));
    }
    v20 = objc_alloc(MEMORY[0x1E0CFE310]);
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __81__FBSApplicationTerminationAssertion_initWithBundleID_reason_acquisitionHandler___block_invoke;
    v26[3] = &unk_1E38EDA10;
    v21 = v13;
    v27 = v21;
    v28 = v12;
    v22 = objc_msgSend(v20, "initWithBundleIdentifier:efficacy:name:context:withHandler:", v9, v19, CFSTR("FBSApplicationTerminationAssertion"), v18, v26);
    assertion = v21->_assertion;
    v21->_assertion = (BKSTerminationAssertion *)v22;

  }
  return v13;
}

void __81__FBSApplicationTerminationAssertion_initWithBundleID_reason_acquisitionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *(id *)(a1 + 32);
  objc_sync_enter(v6);
  v7 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v7 + 16))
  {
    v8 = (void *)MEMORY[0x1E0CB35C8];
    if (v5)
    {
      v16 = *MEMORY[0x1E0CB3388];
      v17 = v5;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("FBSApplicationTerminationAssertionErrorDomain"), -4, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)

  }
  else if (a2)
  {
    v10 = 0;
    *(_QWORD *)(v7 + 16) = 1;
  }
  else
  {
    *(_QWORD *)(v7 + 16) = 2;
    v11 = objc_msgSend(0, "code");
    if (v11 >= 3)
      v12 = -1;
    else
      v12 = qword_19A768028[v11];
    v13 = (void *)MEMORY[0x1E0CB35C8];
    if (v5)
    {
      v18 = *MEMORY[0x1E0CB3388];
      v19[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("FBSApplicationTerminationAssertionErrorDomain"), v12, v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)

  }
  objc_sync_exit(v6);

  v15 = *(_QWORD *)(a1 + 40);
  if (v15)
    (*(void (**)(uint64_t, _QWORD, void *))(v15 + 16))(v15, *(_QWORD *)(a1 + 32), v10);

}

- (void)dealloc
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
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;

  objc_msgSend(off_1E38E9DF0, "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_reason, CFSTR("reason"));
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", self->_bundleID, CFSTR("bundleID"));
  v6 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", self->_assertionState, CFSTR("state"));
  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)invalidate
{
  BKSTerminationAssertion *assertion;

  -[BKSTerminationAssertion invalidate](self->_assertion, "invalidate");
  assertion = self->_assertion;
  self->_assertion = 0;

  self->_assertionState = 3;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)reason
{
  return self->_reason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_assertion, 0);
}

- (void)initWithBundleID:(const char *)a1 reason:acquisitionHandler:.cold.1(const char *a1)
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
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithBundleID:(const char *)a1 reason:acquisitionHandler:.cold.2(const char *a1)
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
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end

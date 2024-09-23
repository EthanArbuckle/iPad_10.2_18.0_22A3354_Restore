@implementation FBSProcessTerminationRequest

+ (id)requestForProcess:(id)a3 withLabel:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v13;
  void *v14;

  v7 = a3;
  v8 = a4;
  NSClassFromString(CFSTR("NSString"));
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBSProcessTerminationRequest requestForProcess:withLabel:].cold.1(a2);
LABEL_16:
    objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A737BF4);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBSProcessTerminationRequest requestForProcess:withLabel:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A737C58);
  }

  v9 = v7;
  v10 = v9;
  if (!v9)
  {
    v11 = 0;
    goto LABEL_7;
  }
  if ((objc_msgSend(v9, "conformsToProtocol:", &unk_1EE3B9978) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object conformsToProtocol:@protocol(FBSProcess)]"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBSProcessTerminationRequest requestForProcess:withLabel:].cold.2(a2);
    goto LABEL_16;
  }

  v11 = objc_alloc_init((Class)a1);
  objc_msgSend(v11, "setLabel:", v8);
  objc_msgSend(v11, "setProcess:", v10);
LABEL_7:

  return v11;
}

- (void)execute
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_process);
  objc_msgSend(WeakRetained, "_terminateWithRequest:forWatchdog:", self, 0);

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  id WeakRetained;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setLabel:", self->_label);
  WeakRetained = objc_loadWeakRetained((id *)&self->_process);
  objc_msgSend(v4, "setProcess:", WeakRetained);

  objc_msgSend(v4, "setOptions:", self->_options);
  objc_msgSend(v4, "setReportType:", self->_reportType);
  objc_msgSend(v4, "setExceptionCode:", self->_exceptionCode);
  objc_msgSend(v4, "setExplanation:", self->_explanation);
  return v4;
}

- (NSString)description
{
  return (NSString *)-[FBSProcessTerminationRequest descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[FBSProcessTerminationRequest succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  int64_t exceptionCode;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  unint64_t reportType;
  __CFString *v10;
  id v11;

  objc_msgSend(off_1E38E9DF0, "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", self->_label, CFSTR("label"));
  exceptionCode = self->_exceptionCode;
  if (exceptionCode >= 1)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    FBSProcessExceptionCodeDescription(exceptionCode);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ (0x%08X)"), v6, self->_exceptionCode);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "appendString:withName:", v7, CFSTR("exceptionCode"));
  }
  v8 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", self->_options & 1, CFSTR("performGracefully"), 1);
  reportType = self->_reportType;
  if (reportType > 2)
    v10 = 0;
  else
    v10 = off_1E38ED500[reportType];
  v11 = (id)objc_msgSend(v3, "appendObject:withName:", v10, CFSTR("reportType"));
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[FBSProcessTerminationRequest descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;

  -[FBSProcessTerminationRequest succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", self->_explanation, CFSTR("explanation"));
  return v4;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (int64_t)reportType
{
  return self->_reportType;
}

- (void)setReportType:(int64_t)a3
{
  self->_reportType = a3;
}

- (int64_t)exceptionCode
{
  return self->_exceptionCode;
}

- (void)setExceptionCode:(int64_t)a3
{
  self->_exceptionCode = a3;
}

- (NSString)explanation
{
  return self->_explanation;
}

- (void)setExplanation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (FBSProcess)process
{
  return (FBSProcess *)objc_loadWeakRetained((id *)&self->_process);
}

- (void)setProcess:(id)a3
{
  objc_storeWeak((id *)&self->_process, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_explanation, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_destroyWeak((id *)&self->_process);
}

+ (void)requestForProcess:(const char *)a1 withLabel:.cold.1(const char *a1)
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
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)requestForProcess:(const char *)a1 withLabel:.cold.2(const char *a1)
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

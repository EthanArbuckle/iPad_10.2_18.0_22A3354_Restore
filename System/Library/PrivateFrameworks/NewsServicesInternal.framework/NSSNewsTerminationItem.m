@implementation NSSNewsTerminationItem

- (NSSNewsTerminationItem)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[NSSNewsTerminationItem init]";
    v9 = 2080;
    v10 = "NSSNewsTermination.m";
    v11 = 1024;
    v12 = 36;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1D7116000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[NSSNewsTerminationItem init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (NSSNewsTerminationItem)initWithProcessType:(unint64_t)a3 bundleID:(id)a4
{
  id v6;
  NSSNewsTerminationItem *v7;
  NSSNewsTerminationItem *v8;
  uint64_t v9;
  NSString *bundleID;
  objc_super v12;

  v6 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[NSSNewsTerminationItem initWithProcessType:bundleID:].cold.1();
  v12.receiver = self;
  v12.super_class = (Class)NSSNewsTerminationItem;
  v7 = -[NSSNewsTerminationItem init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_processType = a3;
    v9 = objc_msgSend(v6, "copy");
    bundleID = v8->_bundleID;
    v8->_bundleID = (NSString *)v9;

  }
  return v8;
}

- (unint64_t)processType
{
  return self->_processType;
}

- (void)setProcessType:(unint64_t)a3
{
  self->_processType = a3;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
}

- (void)initWithProcessType:bundleID:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D7116000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"bundleID", v6, 2u);

  OUTLINED_FUNCTION_2();
}

@end

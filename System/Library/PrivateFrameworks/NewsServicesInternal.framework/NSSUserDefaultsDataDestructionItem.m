@implementation NSSUserDefaultsDataDestructionItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stickyKeys, 0);
  objc_storeStrong((id *)&self->_domainName, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
}

- (NSSUserDefaultsDataDestructionItem)initWithUserDefaults:(id)a3 domainName:(id)a4 stickyKeys:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSSUserDefaultsDataDestructionItem *v12;
  NSSUserDefaultsDataDestructionItem *v13;
  uint64_t v14;
  NSString *domainName;
  uint64_t v16;
  NSSet *stickyKeys;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    -[NSSUserDefaultsDataDestructionItem initWithUserDefaults:domainName:stickyKeys:].cold.3();
    if (v10)
      goto LABEL_6;
  }
  else if (v10)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[NSSUserDefaultsDataDestructionItem initWithUserDefaults:domainName:stickyKeys:].cold.2();
LABEL_6:
  if (!v11 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[NSSUserDefaultsDataDestructionItem initWithUserDefaults:domainName:stickyKeys:].cold.1();
  v19.receiver = self;
  v19.super_class = (Class)NSSUserDefaultsDataDestructionItem;
  v12 = -[NSSUserDefaultsDataDestructionItem init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_userDefaults, a3);
    v14 = objc_msgSend(v10, "copy");
    domainName = v13->_domainName;
    v13->_domainName = (NSString *)v14;

    v16 = objc_msgSend(v11, "copy");
    stickyKeys = v13->_stickyKeys;
    v13->_stickyKeys = (NSSet *)v16;

  }
  return v13;
}

- (NSSUserDefaultsDataDestructionItem)init
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
    v8 = "-[NSSUserDefaultsDataDestructionItem init]";
    v9 = 2080;
    v10 = "NSSNewsDataDestruction.m";
    v11 = 1024;
    v12 = 30;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1D7116000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[NSSUserDefaultsDataDestructionItem init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setUserDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_userDefaults, a3);
}

- (NSString)domainName
{
  return self->_domainName;
}

- (void)setDomainName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSSet)stickyKeys
{
  return self->_stickyKeys;
}

- (void)setStickyKeys:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)initWithUserDefaults:domainName:stickyKeys:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D7116000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"stickyKeys", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)initWithUserDefaults:domainName:stickyKeys:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D7116000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"domainName", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)initWithUserDefaults:domainName:stickyKeys:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D7116000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"userDefaults", v6, 2u);

  OUTLINED_FUNCTION_2();
}

@end

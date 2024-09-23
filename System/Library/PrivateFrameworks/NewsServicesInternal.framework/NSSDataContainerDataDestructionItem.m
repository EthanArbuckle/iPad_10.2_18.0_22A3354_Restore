@implementation NSSDataContainerDataDestructionItem

- (NSSDataContainerDataDestructionItem)init
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
    v8 = "-[NSSDataContainerDataDestructionItem init]";
    v9 = 2080;
    v10 = "NSSNewsDataDestruction.m";
    v11 = 1024;
    v12 = 101;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1D7116000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[NSSDataContainerDataDestructionItem init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (NSSDataContainerDataDestructionItem)initWithContainerClass:(unint64_t)a3 identifier:(const char *)a4
{
  NSSDataContainerDataDestructionItem *result;
  objc_super v8;

  if (!a4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[NSSDataContainerDataDestructionItem initWithContainerClass:identifier:].cold.1();
  v8.receiver = self;
  v8.super_class = (Class)NSSDataContainerDataDestructionItem;
  result = -[NSSDataContainerDataDestructionItem init](&v8, sel_init);
  if (result)
  {
    result->_containerClass = a3;
    result->_identifier = a4;
  }
  return result;
}

- (unint64_t)containerClass
{
  return self->_containerClass;
}

- (void)setContainerClass:(unint64_t)a3
{
  self->_containerClass = a3;
}

- (const)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(const char *)a3
{
  self->_identifier = a3;
}

- (void)initWithContainerClass:identifier:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D7116000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"identifier", v6, 2u);

  OUTLINED_FUNCTION_2();
}

@end

@implementation _EXNSExtensionShimScene

- (_EXNSExtensionShimScene)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_EXNSExtensionShimScene;
  return -[_EXNSExtensionShimScene init](&v3, sel_init);
}

- (void)dealloc
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = (objc_class *)OUTLINED_FUNCTION_5_1(*MEMORY[0x1E0C80C00]);
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1();

  OUTLINED_FUNCTION_8_1();
}

- (id)makePrincipalObjectForExtension:(id)a3
{
  void *v3;
  objc_class *v4;

  objc_msgSend(a3, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_msgSend(v3, "principalClass");

  return objc_alloc_init(v4);
}

- (void)connectToSession:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  id v13;

  v13 = a3;
  +[_EXRunningExtension sharedInstance](_EXRunningExtension, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _EXDefaultLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[_EXNSExtensionShimScene connectToSession:].cold.4();

    __break(1u);
    goto LABEL_11;
  }
  -[_EXNSExtensionShimScene makePrincipalObjectForExtension:](self, "makePrincipalObjectForExtension:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[_EXNSExtensionContextShimImplementation makeContextWithSceneSession:](_EXNSExtensionContextShimImplementation, "makeContextWithSceneSession:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_11:
    _EXDefaultLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      -[_EXNSExtensionShimScene connectToSession:].cold.3();
    goto LABEL_17;
  }
  v8 = objc_opt_class();
  if (v8 == objc_opt_class())
  {
    _EXDefaultLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      -[_EXNSExtensionShimScene connectToSession:].cold.1();
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x1E0CB3B70], "_sharedExtensionContextVendor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _EXDefaultLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      -[_EXNSExtensionShimScene connectToSession:].cold.2();
LABEL_17:

    __break(1u);
    return;
  }
  objc_msgSend(v9, "_addExtensionContext:", v7);
  -[_EXNSExtensionShimScene setContext:](self, "setContext:", v7);
  objc_msgSend(v7, "internalImplementation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "set__principalObject:", v6);
  if (objc_msgSend(v6, "conformsToProtocol:", &unk_1EE21CA78))
    objc_msgSend(v6, "beginRequestWithExtensionContext:", v7);

}

- (BOOL)shouldAcceptConnection:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  char v8;

  v4 = a3;
  -[_EXNSExtensionShimScene context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "conformsToProtocol:", &unk_1EE2126C0);

  if (v6)
  {
    -[_EXNSExtensionShimScene context](self, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "shouldAcceptXPCConnection:", v4);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSExtensionContext)context
{
  return (NSExtensionContext *)objc_getProperty(self, a2, 8, 1);
}

- (void)setContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

- (void)connectToSession:.cold.1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = (objc_class *)OUTLINED_FUNCTION_5_1(*MEMORY[0x1E0C80C00]);
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1();

  OUTLINED_FUNCTION_8_1();
}

- (void)connectToSession:.cold.2()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = (objc_class *)OUTLINED_FUNCTION_5_1(*MEMORY[0x1E0C80C00]);
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1();

  OUTLINED_FUNCTION_8_1();
}

- (void)connectToSession:.cold.3()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = (objc_class *)OUTLINED_FUNCTION_5_1(*MEMORY[0x1E0C80C00]);
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1();

  OUTLINED_FUNCTION_8_1();
}

- (void)connectToSession:.cold.4()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = (objc_class *)OUTLINED_FUNCTION_5_1(*MEMORY[0x1E0C80C00]);
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_7_1(&dword_190C25000, v2, v3, "%s - %s:%d: Unexpected extension class '%@'", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_8_1();
}

@end

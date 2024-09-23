@implementation _EXNSExtensionUIShimScene

- (id)makePrincipalObjectForExtension:(id)a3
{
  id v3;
  void *v4;
  objc_class *v5;
  id v6;
  void *v7;
  id result;
  NSObject *v9;

  v3 = a3;
  objc_msgSend(v3, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_msgSend(v4, "principalClass");

  if ((-[objc_class isSubclassOfClass:](v5, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
  {
    v6 = objc_alloc_init(v5);
    if (v6)
    {
      v7 = v6;

      return v7;
    }
    _EXDefaultLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[_EXNSExtensionUIShimScene makePrincipalObjectForExtension:].cold.1();
  }
  else
  {
    _EXDefaultLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[_EXNSExtensionUIShimScene makePrincipalObjectForExtension:].cold.2(v5);
  }

  __break(1u);
  return result;
}

- (void)connectToSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  objc_super v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[_EXRunningUIExtension sharedInstance](_EXRunningUIExtension, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "extension");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11.receiver = self;
      v11.super_class = (Class)_EXNSExtensionUIShimScene;
      -[_EXNSExtensionShimScene connectToSession:](&v11, sel_connectToSession_, v4);
      -[_EXNSExtensionShimScene context](self, "context");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_principalObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[_EXNSExtensionUIShimScene setViewController:](self, "setViewController:", v8);

      return;
    }
  }
  else
  {
    _EXDefaultLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[_EXNSExtensionUIShimScene connectToSession:].cold.2();

    __break(1u);
  }
  _EXDefaultLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    -[_EXNSExtensionUIShimScene connectToSession:].cold.1();

  __break(1u);
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
  v6 = objc_msgSend(v5, "conformsToProtocol:", &unk_254642BC0);

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

- (UIViewController)viewController
{
  return (UIViewController *)objc_getProperty(self, a2, 16, 1);
}

- (void)setViewController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->viewController, 0);
}

- (void)makePrincipalObjectForExtension:.cold.1()
{
  os_log_t v0;
  int v1;
  const char *v2;
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = "principalObject!=nil";
  v3 = 2080;
  v1 = 136315650;
  OUTLINED_FUNCTION_1();
  v4 = 59;
  _os_log_fault_impl(&dword_20AE73000, v0, OS_LOG_TYPE_FAULT, "%s - %s:%d: The principal object must not be NULL.", (uint8_t *)&v1, 0x1Cu);
}

- (void)makePrincipalObjectForExtension:(objc_class *)a1 .cold.2(objc_class *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  NSStringFromClass(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20AE73000, v2, v3, "%s - %s:%d: Pricipal object is unexpected class '%@'", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_3();
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

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20AE73000, v2, v3, "%s - %s:%d: Unexpected extension class '%@'", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_3();
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

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20AE73000, v2, v3, "%s - %s:%d: Unexpected extension class '%@'", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_3();
}

@end

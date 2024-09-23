@implementation _EXConnectionHandlerScene

- (BOOL)shouldAcceptConnection:(id)a3
{
  id v4;
  id v5;
  char v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52___EXConnectionHandlerScene_shouldAcceptConnection___block_invoke;
  block[3] = &unk_24C3E3AA0;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v5 = v4;
  dispatch_sync(MEMORY[0x24BDAC9B8], block);
  v6 = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (void)connectToSession:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  UIViewController *v9;
  UIViewController *viewController;
  NSObject *v11;
  NSObject *v12;
  id v13;

  v13 = a3;
  objc_msgSend(v13, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v13, "extension");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "internalRep");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "role");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_msgSend(v6, "extensionViewControllerClassForSceneRole:", v7);

    v9 = (UIViewController *)objc_alloc_init(v8);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[UIViewController setSceneConfiguration:](v9, "setSceneConfiguration:", v4);
      viewController = self->_viewController;
      self->_viewController = v9;

      return;
    }
  }
  else
  {
    _EXDefaultLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[_EXConnectionHandlerScene connectToSession:].cold.2();

    __break(1u);
  }
  _EXDefaultLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    -[_EXConnectionHandlerScene connectToSession:].cold.1();

  __break(1u);
}

- (UIViewController)viewController
{
  return (UIViewController *)objc_getProperty(self, a2, 8, 1);
}

- (void)setViewController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewController, 0);
}

- (void)connectToSession:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
}

- (void)connectToSession:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
}

@end

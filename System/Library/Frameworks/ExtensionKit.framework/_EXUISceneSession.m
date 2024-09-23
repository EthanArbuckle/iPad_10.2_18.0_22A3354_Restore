@implementation _EXUISceneSession

- (_EXUISceneSession)initWithExtension:(id)a3
{
  id v4;
  _EXUISceneSession *v5;
  void *v6;
  char v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  os_signpost_id_t v11;
  _EXUISceneSession *result;
  NSObject *v13;
  uint8_t v14[16];
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_EXUISceneSession;
  v5 = -[_EXSceneSession initWithExtension:](&v15, sel_initWithExtension_, v4);
  if (!v5)
  {
LABEL_10:

    return v5;
  }
  objc_msgSend(v4, "internalRep");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "presentsUserInterface");

  if ((v7 & 1) != 0)
  {
    _EXSignpostLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (-[_EXSceneSession signpost](v5, "signpost") && os_signpost_enabled(v8))
    {
      v9 = v8;
      v10 = -[_EXSceneSession signpost](v5, "signpost");
      if ((unint64_t)(v10 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v11 = v10;
        if (os_signpost_enabled(v9))
        {
          *(_WORD *)v14 = 0;
        }
      }

    }
    goto LABEL_10;
  }
  _EXDefaultLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    -[_EXUISceneSession initWithExtension:].cold.1();

  __break(1u);
  return result;
}

- (void)setRootViewController:(id)a3
{
  _EXExtensionRootViewController *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _EXExtensionRootViewController *v9;

  v5 = (_EXExtensionRootViewController *)a3;
  if (self->_rootViewController == v5)
  {
LABEL_6:

    return;
  }
  v9 = v5;
  objc_storeStrong((id *)&self->_rootViewController, a3);
  -[_EXSceneSession scene](self, "scene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "viewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      -[_EXUISceneSession viewController](self, "viewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[_EXExtensionRootViewController setContentViewController:](v9, "setContentViewController:", v7);

    v5 = v9;
    goto LABEL_6;
  }
  _EXDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    -[_EXUISceneSession setRootViewController:].cold.1();

  __break(1u);
}

- (id)makeConfigurationWithParameters:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[_EXSceneSession extension](self, "extension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "internalRep");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configurationWithParameters:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)makeSceneWithError:(id *)a3
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id result;
  NSObject *v12;
  NSObject *v13;
  objc_super v14;

  -[_EXSceneSession extension](self, "extension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasSwiftEntryPoint");

  if (!v6)
  {
    -[_EXSceneSession configuration](self, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (class_conformsToProtocol((Class)objc_msgSend(v8, "sceneClass"), (Protocol *)&unk_254641D08))
      {
        v14.receiver = self;
        v14.super_class = (Class)_EXUISceneSession;
        -[_EXSceneSession makeSceneWithError:](&v14, sel_makeSceneWithError_, a3);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v10, "conformsToProtocol:", &unk_254641D08) & 1) != 0)
          goto LABEL_7;
        goto LABEL_15;
      }
      _EXDefaultLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        -[_EXUISceneSession makeSceneWithError:].cold.3(v8);
    }
    else
    {
      _EXDefaultLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        -[_EXUISceneSession makeSceneWithError:].cold.4((uint64_t)v8, v13);
    }

    __break(1u);
LABEL_15:
    _EXDefaultLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      -[_EXUISceneSession makeSceneWithError:].cold.2();
    goto LABEL_17;
  }
  +[_EXRunningUIExtension sharedInstance](_EXRunningUIExtension, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sceneFactory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[_EXSceneSession configuration](self, "configuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "makeSceneWithConfiguration:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
    return v10;
  }
  _EXDefaultLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    -[_EXUISceneSession makeSceneWithError:].cold.1();
LABEL_17:

  __break(1u);
  return result;
}

- (void)connectToScene:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_class *v7;
  id v8;
  NSObject *v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_EXUISceneSession;
  -[_EXSceneSession connectToScene:](&v10, sel_connectToScene_, v4);
  if (!objc_msgSend(v4, "conformsToProtocol:", &unk_254641D08))
    goto LABEL_5;
  objc_msgSend(v4, "viewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    goto LABEL_5;
  -[_EXSceneSession configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_msgSend(v6, "viewControllerClass");
  if (v7)
  {
    v8 = objc_alloc_init(v7);
    objc_msgSend(v4, "setViewController:", v8);

LABEL_5:
    return;
  }
  _EXDefaultLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    -[_EXUISceneSession connectToScene:].cold.1(v9);

  __break(1u);
}

- (id)makeConnectionResponse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_EXUISceneSession;
  -[_EXSceneSession makeConnectionResponse](&v3, sel_makeConnectionResponse);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (_EXExtensionRootViewController)rootViewController
{
  return self->_rootViewController;
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
  objc_storeStrong((id *)&self->_viewController, a3);
}

- (_EXPromise)initializationPromise
{
  return (_EXPromise *)objc_getProperty(self, a2, 104, 1);
}

- (void)setInitializationPromise:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initializationPromise, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_rootViewController, 0);
}

- (void)initWithExtension:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_20AE73000, v0, v1, "%s - %s:%d: Extension point does not support user interface", v2, v3, v4, v5, 2u);
}

- (void)setRootViewController:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  NSStringFromProtocol((Protocol *)&unk_254641D08);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromProtocol((Protocol *)&unk_254656540);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  OUTLINED_FUNCTION_0_2();
}

- (void)makeSceneWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_20AE73000, v0, v1, "%s - %s:%d: Unexpected nil scene factory", v2, v3, v4, v5, 2u);
}

- (void)makeSceneWithError:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  NSStringFromProtocol((Protocol *)&unk_254641D08);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1();

  OUTLINED_FUNCTION_0_2();
}

- (void)makeSceneWithError:(void *)a1 .cold.3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "sceneClass");
  NSStringFromProtocol((Protocol *)&unk_254641D08);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1();

  OUTLINED_FUNCTION_0_2();
}

- (void)makeSceneWithError:(uint64_t)a1 .cold.4(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  _DWORD v8[7];
  __int16 v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = 136316162;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1();
  v8[6] = 113;
  v9 = 2112;
  v10 = v4;
  v11 = 2112;
  v12 = v7;
  _os_log_fault_impl(&dword_20AE73000, a2, OS_LOG_TYPE_FAULT, "%s - %s:%d: Unexpected configuration class '%@' expected '%@'", (uint8_t *)v8, 0x30u);

  OUTLINED_FUNCTION_0_2();
}

- (void)connectToScene:(NSObject *)a1 .cold.1(NSObject *a1)
{
  void *v2;
  uint64_t v3;
  _DWORD v4[7];
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  NSStringFromClass(0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = 136315906;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1();
  v4[6] = 131;
  v5 = 2112;
  v6 = v3;
  _os_log_fault_impl(&dword_20AE73000, a1, OS_LOG_TYPE_FAULT, "%s - %s:%d: Failed to find view controller class '%@'", (uint8_t *)v4, 0x26u);

}

@end

@implementation SOExtensionViewService

- (void)loadView
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  SO_LOG_SOExtensionViewService();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_20DABC000, v3, OS_LOG_TYPE_DEFAULT, "Loading view for view service", v5, 2u);
  }

  v4 = (void *)objc_opt_new();
  -[SOExtensionViewService setView:](self, "setView:", v4);

}

+ (id)_remoteViewControllerInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549E6D98);
}

+ (id)_exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549E2398);
}

- (id)remoteViewControllerInterface
{
  return (id)objc_msgSend((id)objc_opt_class(), "_remoteViewControllerInterface");
}

- (id)exportedInterface
{
  return (id)objc_msgSend((id)objc_opt_class(), "_exportedInterface");
}

- (void)connectToContextWithSessionID:(id)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;

  v6 = (void (**)(_QWORD))a4;
  v7 = (void *)MEMORY[0x24BDD19B0];
  v8 = a3;
  objc_msgSend(v7, "_sharedExtensionContextVendor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_extensionContextForUUID:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[SOExtensionViewService setExtensionContext:](self, "setExtensionContext:", v10);
  -[SOExtensionViewService extensionContext](self, "extensionContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setViewService:", self);

  SO_LOG_SOExtensionViewService();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[SOExtensionViewService connectToContextWithSessionID:completion:].cold.1(self, v12);

  -[SOExtensionViewService _connectChildView](self, "_connectChildView");
  if (v6)
    v6[2](v6);

}

- (void)_connectChildView
{
  id v1;
  NSObject *v2;
  uint8_t v3[14];
  id v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v1 = objc_begin_catch(a1);
  SO_LOG_SOExtensionViewService();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    OUTLINED_FUNCTION_2_4();
    v4 = v1;
    _os_log_error_impl(&dword_20DABC000, v2, OS_LOG_TYPE_ERROR, "Couldn't load view for child view controller (%{public}@, %{public}@)", v3, 0x16u);
  }

  objc_end_catch();
  OUTLINED_FUNCTION_3_0();
}

- (SORemoteExtensionContext)extensionContext
{
  return (SORemoteExtensionContext *)objc_loadWeakRetained((id *)&self->_extensionContext);
}

- (void)setExtensionContext:(id)a3
{
  objc_storeWeak((id *)&self->_extensionContext, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_extensionContext);
}

- (void)connectToContextWithSessionID:(void *)a1 completion:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[14];
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "extensionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_4();
  v6 = v4;
  _os_log_debug_impl(&dword_20DABC000, a2, OS_LOG_TYPE_DEBUG, "Connecting view service (%{public}@) to context (%{public}@)", v5, 0x16u);

  OUTLINED_FUNCTION_3_0();
}

@end

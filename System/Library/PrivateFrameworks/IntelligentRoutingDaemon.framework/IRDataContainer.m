@implementation IRDataContainer

- (IRDataContainer)init
{
  IRDataContainer *v2;
  IRDataContainer *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IRDataContainer;
  v2 = -[IRDataContainer init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[IRDataContainer setExtensionHandle:](v2, "setExtensionHandle:", -1);
  return v3;
}

- (id)getContainerPathWithSandboxAccess
{
  void *v3;
  void *v4;
  uint64_t path;
  os_log_t *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  os_log_t v14;
  int v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[IRDataContainer setContainerRootURL:](self, "setContainerRootURL:", 0);
  -[IRDataContainer _releaseExtensionHandle](self, "_releaseExtensionHandle");
  v3 = (void *)container_query_create();
  if (v3)
  {
    v4 = v3;
    container_query_set_class();
    container_query_operation_set_flags();
    container_query_set_persona_unique_string();
    if (container_query_get_single_result())
    {
      path = container_get_path();
      v6 = (os_log_t *)MEMORY[0x24BE5B270];
      v7 = *MEMORY[0x24BE5B270];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_INFO))
      {
        v16 = 136315138;
        v17 = path;
        _os_log_impl(&dword_23FFBA000, v7, OS_LOG_TYPE_INFO, "#data-container, Got container path: '%s'", (uint8_t *)&v16, 0xCu);
      }
      v8 = container_copy_sandbox_token();
      if (v8)
      {
        v9 = (void *)v8;
        -[IRDataContainer setExtensionHandle:](self, "setExtensionHandle:", sandbox_extension_consume());
        free(v9);
        if ((-[IRDataContainer extensionHandle](self, "extensionHandle") & 0x8000000000000000) == 0)
        {
          objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", path, 1, 0);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[IRDataContainer setContainerRootURL:](self, "setContainerRootURL:", v10);

          -[IRDataContainer _releaseQuery:](self, "_releaseQuery:", v4);
          -[IRDataContainer containerRootURL](self, "containerRootURL");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          return v3;
        }
        v14 = *v6;
        if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
          -[IRDataContainer getContainerPathWithSandboxAccess].cold.3(v14);
        -[IRDataContainer _releaseExtensionHandle](self, "_releaseExtensionHandle");
      }
      else
      {
        v13 = *v6;
        if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
          -[IRDataContainer getContainerPathWithSandboxAccess].cold.2(v13);
      }
    }
    else
    {
      container_query_get_last_error();
      v11 = (void *)container_error_copy_unlocalized_description();
      v12 = *MEMORY[0x24BE5B270];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_ERROR))
        -[IRDataContainer getContainerPathWithSandboxAccess].cold.1((uint64_t)v11, v12);
      free(v11);
    }
    -[IRDataContainer _releaseQuery:](self, "_releaseQuery:", v4);
    v3 = 0;
  }
  return v3;
}

- (void)_releaseQuery:(container_query_s *)a3
{
  container_query_free();
}

- (void)_releaseExtensionHandle
{
  -[IRDataContainer extensionHandle](self, "extensionHandle");
  sandbox_extension_release();
  -[IRDataContainer setExtensionHandle:](self, "setExtensionHandle:", -1);
}

- (NSURL)containerRootURL
{
  return self->_containerRootURL;
}

- (void)setContainerRootURL:(id)a3
{
  objc_storeStrong((id *)&self->_containerRootURL, a3);
}

- (int64_t)extensionHandle
{
  return self->_extensionHandle;
}

- (void)setExtensionHandle:(int64_t)a3
{
  self->_extensionHandle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerRootURL, 0);
}

- (void)getContainerPathWithSandboxAccess
{
  NSObject *v1;
  int v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = *__error();
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_23FFBA000, v1, OS_LOG_TYPE_ERROR, "#data-container, [ErrorId - Sandbox extension consume] Error consuming sandbox extension for container: %{darwin.errno}d", (uint8_t *)v3, 8u);

}

@end

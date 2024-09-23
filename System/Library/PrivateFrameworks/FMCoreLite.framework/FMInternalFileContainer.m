@implementation FMInternalFileContainer

- (FMInternalFileContainer)init
{
  FMInternalFileContainer *v2;
  FMInternalFileContainer *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FMInternalFileContainer;
  v2 = -[FMInternalFileContainer init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[FMInternalFileContainer internalContainerURL](v2, "internalContainerURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMInternalFileContainer setUrl:](v3, "setUrl:", v4);

  }
  return v3;
}

- (id)internalContainerURL
{
  if (internalContainerURL_onceToken != -1)
    dispatch_once(&internalContainerURL_onceToken, &__block_literal_global_0);
  return (id)internalContainerURL_systemContainerPath;
}

void __47__FMInternalFileContainer_internalContainerURL__block_invoke()
{
  void *v0;
  NSObject *v1;
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint8_t buf[4];
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v5 = 1;
  v0 = (void *)container_system_path_for_identifier();
  LogCategory_SharedFileContainer();
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v0)
  {
    if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v7 = v0;
      _os_log_impl(&dword_1AEA5C000, v2, OS_LOG_TYPE_INFO, "System container path is %s", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v0, 1, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)internalContainerURL_systemContainerPath;
    internalContainerURL_systemContainerPath = v3;

    free(v0);
  }
  else
  {
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
      __47__FMInternalFileContainer_internalContainerURL__block_invoke_cold_1(&v5, v2);

  }
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
}

void __47__FMInternalFileContainer_internalContainerURL__block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 134217984;
  v4 = v2;
  _os_log_error_impl(&dword_1AEA5C000, a2, OS_LOG_TYPE_ERROR, "Error getting system container: %llu", (uint8_t *)&v3, 0xCu);
}

@end

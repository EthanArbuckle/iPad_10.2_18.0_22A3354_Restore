@implementation FMSharedFileContainer

- (FMSharedFileContainer)init
{
  return -[FMSharedFileContainer initWithIdentifier:](self, "initWithIdentifier:", 0);
}

- (FMSharedFileContainer)initWithIdentifier:(id)a3
{
  id v4;
  FMSharedFileContainer *v5;
  FMSharedFileContainer *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FMSharedFileContainer;
  v5 = -[FMSharedFileContainer init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[FMSharedFileContainer groupContainerURLWithIdentifier:](v5, "groupContainerURLWithIdentifier:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMSharedFileContainer setUrl:](v6, "setUrl:", v7);

  }
  return v6;
}

- (id)groupContainerURLWithIdentifier:(id)a3
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  uint64_t v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v8 = 1;
  objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  v3 = (void *)container_system_group_path_for_identifier();
  LogCategory_SharedFileContainer();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v10 = v3;
      _os_log_impl(&dword_1AEA5C000, v5, OS_LOG_TYPE_INFO, "System group container path is %s", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v3, 1, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    free(v3);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[FMSharedFileContainer groupContainerURLWithIdentifier:].cold.1(&v8, v5);

    v6 = 0;
  }
  return v6;
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

- (void)groupContainerURLWithIdentifier:(uint64_t *)a1 .cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 134217984;
  v4 = v2;
  _os_log_error_impl(&dword_1AEA5C000, a2, OS_LOG_TYPE_ERROR, "Error getting system group container: %llu", (uint8_t *)&v3, 0xCu);
}

@end

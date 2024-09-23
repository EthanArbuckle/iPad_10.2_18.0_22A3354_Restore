@implementation _BMAccessAssertion

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
}

- (BMAccessDescriptor)descriptor
{
  return self->_descriptor;
}

- (_BMAccessAssertion)initWithDescriptor:(id)a3 extensionToken:(id)a4 path:(id)a5
{
  id v9;
  id v10;
  id v11;
  _BMAccessAssertion *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  NSString *path;
  _BMAccessAssertion *v21;
  NSObject *v22;
  objc_super v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v24.receiver = self;
  v24.super_class = (Class)_BMAccessAssertion;
  v12 = -[_BMAccessAssertion init](&v24, sel_init);
  if (!v12)
    goto LABEL_8;
  __biome_log_for_category(6);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    BMAccessModePrintableDescription(objc_msgSend(v9, "mode"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "resource");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v26 = v14;
    v27 = 2114;
    v28 = v15;
    _os_log_impl(&dword_1AEB31000, v13, OS_LOG_TYPE_INFO, "Consuming sandbox extension token for %{public}@ access to %{public}@", buf, 0x16u);

  }
  v16 = v10;
  objc_msgSend(v16, "bytes");
  v17 = sandbox_extension_consume();
  __biome_log_for_category(6);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    -[_BMAccessAssertion initWithDescriptor:extensionToken:path:].cold.2(v16, v17, v18);

  if (v17 != -1)
  {
    objc_storeStrong((id *)&v12->_descriptor, a3);
    v12->_handle = v17;
    v19 = objc_msgSend(v11, "copy");
    path = v12->_path;
    v12->_path = (NSString *)v19;

LABEL_8:
    v21 = v12;
    goto LABEL_12;
  }
  __biome_log_for_category(6);
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    -[_BMAccessAssertion initWithDescriptor:extensionToken:path:].cold.1(v9);

  v21 = 0;
LABEL_12:

  return v21;
}

- (void)dealloc
{
  uint64_t v5;
  int *v6;
  char *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  int v11;
  __int16 v12;
  char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = *a1;
  if (a2 == -1)
  {
    v6 = __error();
    v7 = strerror(*v6);
  }
  else
  {
    v7 = "no error";
  }
  v8 = 134218498;
  v9 = v5;
  v10 = 1024;
  v11 = a2;
  v12 = 2082;
  v13 = v7;
  _os_log_debug_impl(&dword_1AEB31000, a3, OS_LOG_TYPE_DEBUG, "sandbox_extension_release(%lld) = %d, %{public}s", (uint8_t *)&v8, 0x1Cu);
  OUTLINED_FUNCTION_7();
}

- (NSString)path
{
  return self->_path;
}

- (void)initWithDescriptor:(void *)a1 extensionToken:path:.cold.1(void *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  BMAccessModePrintableDescription(objc_msgSend(a1, "mode"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "resource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1_1(&dword_1AEB31000, v4, v5, "Failed to consume sandbox extension token for %{public}@ access to %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_0_0();
}

- (void)initWithDescriptor:(void *)a1 extensionToken:(uint64_t)a2 path:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5;
  int *v6;
  char *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a1, "bytes");
  if (a2 == -1)
  {
    v6 = __error();
    v7 = strerror(*v6);
  }
  else
  {
    v7 = "no error";
  }
  v8 = 134218498;
  v9 = v5;
  v10 = 2048;
  v11 = a2;
  v12 = 2082;
  v13 = v7;
  _os_log_debug_impl(&dword_1AEB31000, a3, OS_LOG_TYPE_DEBUG, "sandbox_extension_consume(%p) = %lld, %{public}s", (uint8_t *)&v8, 0x20u);
  OUTLINED_FUNCTION_7();
}

@end

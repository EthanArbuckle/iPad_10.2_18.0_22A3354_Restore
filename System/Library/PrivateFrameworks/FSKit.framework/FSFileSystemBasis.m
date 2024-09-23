@implementation FSFileSystemBasis

+ (void)wipeResource:(id)a3 includingRanges:(id)a4 excludingRanges:(id)a5 extension:(id)a6 completionHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD v34[4];
  id v35;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  fskit_std_log();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    +[FSFileSystemBasis wipeResource:includingRanges:excludingRanges:extension:completionHandler:].cold.3(v16, v17, v18, v19, v20, v21, v22, v23);

  if (v14)
  {
    v34[0] = MEMORY[0x24BDAC760];
    v34[1] = 3221225472;
    v34[2] = __94__FSFileSystemBasis_wipeResource_includingRanges_excludingRanges_extension_completionHandler___block_invoke;
    v34[3] = &unk_250C31EC8;
    v35 = v15;
    objc_msgSend(v14, "sendWipeResource:includingBlockRanges:excludingBlockRanges:replyHandler:", v11, v12, v13, v34);
    v24 = v35;
  }
  else
  {
    fskit_std_log();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      +[FSFileSystemBasis wipeResource:includingRanges:excludingRanges:extension:completionHandler:].cold.2(v25);

    fs_errorForPOSIXError(45);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v15 + 2))(v15, v24);
  }

  fskit_std_log();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    +[FSFileSystemBasis wipeResource:includingRanges:excludingRanges:extension:completionHandler:].cold.1(v26, v27, v28, v29, v30, v31, v32, v33);

}

uint64_t __94__FSFileSystemBasis_wipeResource_includingRanges_excludingRanges_extension_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (FSModuleExtension)extension
{
  return (FSModuleExtension *)objc_getProperty(self, a2, 8, 1);
}

- (void)setExtension:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extension, 0);
}

+ (void)wipeResource:(uint64_t)a3 includingRanges:(uint64_t)a4 excludingRanges:(uint64_t)a5 extension:(uint64_t)a6 completionHandler:(uint64_t)a7 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_23B2A6000, a1, a3, "%s:end", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)wipeResource:(os_log_t)log includingRanges:excludingRanges:extension:completionHandler:.cold.2(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "+[FSFileSystemBasis wipeResource:includingRanges:excludingRanges:extension:completionHandler:]";
  _os_log_fault_impl(&dword_23B2A6000, log, OS_LOG_TYPE_FAULT, "%s: no extension is available", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

+ (void)wipeResource:(uint64_t)a3 includingRanges:(uint64_t)a4 excludingRanges:(uint64_t)a5 extension:(uint64_t)a6 completionHandler:(uint64_t)a7 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_23B2A6000, a1, a3, "%s:start", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end

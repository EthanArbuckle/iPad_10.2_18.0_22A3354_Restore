@implementation ASTFileManagement

+ (id)unprotectedFileHandleForFileURL:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  NSObject *v10;

  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByDeletingLastPathComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v7, 1, 0, a4);

  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD1578], "fileHandleForCreatingURL:protection:error:", v5, *MEMORY[0x24BDD0CF8], a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    ASTLogHandleForCategory(1);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[ASTFileManagement unprotectedFileHandleForFileURL:error:].cold.1(v5, (uint64_t *)a4, v10);

    v9 = 0;
  }

  return v9;
}

+ (void)unprotectedFileHandleForFileURL:(NSObject *)a3 error:.cold.1(void *a1, uint64_t *a2, NSObject *a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "URLByDeletingLastPathComponent");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (a2)
    v7 = *a2;
  else
    v7 = 0;
  v8 = 138412546;
  v9 = v5;
  v10 = 2112;
  v11 = v7;
  _os_log_error_impl(&dword_22D91B000, a3, OS_LOG_TYPE_ERROR, "Could not create directory at URL: [%@]: %@", (uint8_t *)&v8, 0x16u);

}

@end

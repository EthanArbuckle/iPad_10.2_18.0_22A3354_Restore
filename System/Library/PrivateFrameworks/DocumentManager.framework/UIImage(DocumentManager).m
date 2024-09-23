@implementation UIImage(DocumentManager)

+ (id)doc_AppIconForHostBundleIdentifier:()DocumentManager
{
  id v3;
  void *v4;
  void *v5;
  NSObject **v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  int v16;
  const char *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE51A90]), "initWithBundleIdentifier:", v3);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE51AB0]), "initWithSize:scale:", 128.0, 128.0, 2.0);
  v6 = (NSObject **)MEMORY[0x24BE2DF90];
  v7 = *MEMORY[0x24BE2DF90];
  if (!*MEMORY[0x24BE2DF90])
  {
    DOCInitLogging();
    v7 = *v6;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v16 = 136315906;
    v17 = "+[UIImage(DocumentManager) doc_AppIconForHostBundleIdentifier:]";
    v18 = 2112;
    v19 = v3;
    v20 = 2112;
    v21 = v4;
    v22 = 2112;
    v23 = v5;
    _os_log_debug_impl(&dword_209052000, v7, OS_LOG_TYPE_DEBUG, "%s bundleIdentifier: %@ isIcon: %@ descriptor: %@", (uint8_t *)&v16, 0x2Au);
  }
  objc_msgSend(v4, "imageForDescriptor:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *v6;
  if (!*v6)
  {
    DOCInitLogging();
    v9 = *v6;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    +[UIImage(DocumentManager) doc_AppIconForHostBundleIdentifier:].cold.4(v9);
  if (objc_msgSend(v8, "placeholder"))
  {
    objc_msgSend(v4, "prepareImageForDescriptor:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = *v6;
    if (!*v6)
    {
      DOCInitLogging();
      v11 = *v6;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      +[UIImage(DocumentManager) doc_AppIconForHostBundleIdentifier:].cold.3();
  }
  else
  {
    v10 = v8;
  }
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BEBD640], "imageWithCGImage:", objc_msgSend(v10, "CGImage"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *v6;
    if (!*v6)
    {
      DOCInitLogging();
      v13 = *v6;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      +[UIImage(DocumentManager) doc_AppIconForHostBundleIdentifier:].cold.2();
  }
  else
  {
    v12 = 0;
  }
  v14 = *v6;
  if (!*v6)
  {
    DOCInitLogging();
    v14 = *v6;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    +[UIImage(DocumentManager) doc_AppIconForHostBundleIdentifier:].cold.1();

  return v12;
}

+ (void)doc_AppIconForHostBundleIdentifier:()DocumentManager .cold.1()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  int v3[5];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3[0] = 136315650;
  OUTLINED_FUNCTION_0_0();
  v4 = v0;
  v5 = v1;
  _os_log_debug_impl(&dword_209052000, v2, OS_LOG_TYPE_DEBUG, "%s returning image: %@ for app with bundleIdentifier: %@", (uint8_t *)v3, 0x20u);
}

+ (void)doc_AppIconForHostBundleIdentifier:()DocumentManager .cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_209052000, v0, v1, "%s created result image: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

+ (void)doc_AppIconForHostBundleIdentifier:()DocumentManager .cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_209052000, v0, v1, "%s was a placeholder. prepared new image: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

+ (void)doc_AppIconForHostBundleIdentifier:()DocumentManager .cold.4(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "+[UIImage(DocumentManager) doc_AppIconForHostBundleIdentifier:]";
  _os_log_debug_impl(&dword_209052000, log, OS_LOG_TYPE_DEBUG, "%s imageForDescriptor returned image: (imageFromDescriptor) isPlaceholder: (imageFromDescriptor.placeholder)", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_3();
}

@end

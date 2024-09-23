@implementation CSExtension_PKSubsystem

- (id)principleClassFromDictionary:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_4;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("NSExtensionPrincipalClass"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_4:
    v4 = 0;
  }

  return v4;
}

- (void)beginUsing:(id)a3 withBundle:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "bundleInfoDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("NSExtension"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSExtension_PKSubsystem principleClassFromDictionary:](self, "principleClassFromDictionary:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(v7, "infoDictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSExtension_PKSubsystem principleClassFromDictionary:](self, "principleClassFromDictionary:", v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend(v10, "length"))
    objc_getClass((const char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String"));
  logForCSLogCategoryDefault();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[CSExtension_PKSubsystem beginUsing:withBundle:].cold.1(v6, v7, v12);

  objc_msgSend(MEMORY[0x1E0CB3B70], "_startListening:", 0);
}

- (void)endUsing:(id)a3
{
  id v3;
  NSObject *v4;

  v3 = a3;
  logForCSLogCategoryDefault();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[CSExtension_PKSubsystem endUsing:].cold.1(v3, v4);

}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__CSExtension_PKSubsystem_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_once != -1)
    dispatch_once(&sharedInstance_once, block);
  return (id)sharedInstance_sSharedInstance;
}

+ (id)initForPlugInKit
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  objc_msgSend(a1, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  logForCSLogCategoryDefault();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    +[CSExtension_PKSubsystem initForPlugInKit].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);

  return v2;
}

- (void)beginUsing:(NSObject *)a3 withBundle:.cold.1(void *a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v5;
  v9 = 2112;
  v10 = v6;
  _os_log_debug_impl(&dword_18C42F000, a3, OS_LOG_TYPE_DEBUG, "beginUsing using %@ %@", (uint8_t *)&v7, 0x16u);

}

- (void)endUsing:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3_0(&dword_18C42F000, a2, v4, "endUsing, %@", v5);

  OUTLINED_FUNCTION_2_0();
}

+ (void)initForPlugInKit
{
  OUTLINED_FUNCTION_13(&dword_18C42F000, a1, a3, "CSExtension_PKSubsystem initForPlugInKit", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_8();
}

@end

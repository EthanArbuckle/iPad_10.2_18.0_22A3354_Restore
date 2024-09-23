@implementation ATXFaceGalleryFileReader

- (ATXFaceGalleryFileReader)initWithSource:(int64_t)a3
{
  ATXFaceGalleryFileReader *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ATXFaceGalleryFileReader;
  result = -[ATXFaceGalleryFileReader init](&v5, sel_init);
  if (result)
    result->_source = a3;
  return result;
}

- (ATXFaceGalleryConfiguration)configuration
{
  void *v2;
  void *v3;
  NSObject *v4;

  +[ATXFaceGalleryFileReader _pathForSource:](ATXFaceGalleryFileReader, "_pathForSource:", self->_source);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXFaceGalleryFileReader _loadConfigurationFromPath:](ATXFaceGalleryFileReader, "_loadConfigurationFromPath:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    __atxlog_handle_lock_screen();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[ATXFaceGalleryFileReader configuration].cold.1();

  }
  return (ATXFaceGalleryConfiguration *)v3;
}

- (BOOL)writeConfiguration:(id)a3 error:(id *)a4
{
  int64_t source;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  source = self->_source;
  v6 = a3;
  +[ATXFaceGalleryFileReader _pathForSource:](ATXFaceGalleryFileReader, "_pathForSource:", source);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB36D8];
  objc_msgSend(v6, "jsonDictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "dataWithJSONObject:options:error:", v9, 1, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    __atxlog_handle_lock_screen();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[ATXFaceGalleryFileReader writeConfiguration:error:].cold.1((uint64_t)a4, v12, v13, v14, v15, v16, v17, v18);
    goto LABEL_8;
  }
  if ((objc_msgSend(v10, "writeToFile:options:error:", v7, 0, a4) & 1) == 0)
  {
    __atxlog_handle_lock_screen();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[ATXFaceGalleryFileReader writeConfiguration:error:].cold.2(v12);
LABEL_8:

    v11 = 0;
    goto LABEL_9;
  }
  v11 = 1;
LABEL_9:

  return v11;
}

+ (id)_loadConfigurationFromPath:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v11;
  id v12;

  v3 = a3;
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v3, 0, &v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v12;
  if (v4)
  {
    v11 = v5;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v4, 0, &v11);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v11;

    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CF8E08], "configurationFromJSONDictionary:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
      __atxlog_handle_lock_screen();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        +[ATXFaceGalleryFileReader _loadConfigurationFromPath:].cold.3();
    }
    else
    {
      __atxlog_handle_lock_screen();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        +[ATXFaceGalleryFileReader _loadConfigurationFromPath:].cold.2();
    }

    v8 = 0;
    goto LABEL_13;
  }
  __atxlog_handle_lock_screen();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    +[ATXFaceGalleryFileReader _loadConfigurationFromPath:].cold.1();
  v8 = 0;
  v7 = v5;
LABEL_13:

  return v8;
}

+ (id)_pathForSource:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CF94D8], "faceGalleryDemoConfigurationFilePath", v3, v4);
    a1 = (id)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (void)configuration
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_5(&dword_1C9A3B000, v0, v1, "%s: failed to parse configuration from path: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)writeConfiguration:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_5(&dword_1C9A3B000, a2, a3, "%s: could not serialize json, error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)writeConfiguration:(os_log_t)log error:.cold.2(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "-[ATXFaceGalleryFileReader writeConfiguration:error:]";
  _os_log_error_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_ERROR, "%s: could not write data to file", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_loadConfigurationFromPath:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_5_6();
  OUTLINED_FUNCTION_1_11(&dword_1C9A3B000, v0, v1, "%s: could not load data from path: %@; error: %@", v2);
}

+ (void)_loadConfigurationFromPath:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_5_6();
  OUTLINED_FUNCTION_1_11(&dword_1C9A3B000, v0, v1, "%s: could not parse JSON from contents of path: %@; error: %@", v2);
}

+ (void)_loadConfigurationFromPath:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_5(&dword_1C9A3B000, v0, v1, "%s: parsed JSON is not a dictionary at path: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end

@implementation CAMNebulaUtilities

+ (id)locationFromJPEGAtPath:(id)a3
{
  void *v3;
  const __CFData *v4;
  uint64_t v5;
  NSObject *v6;
  const __CFDictionary *v7;
  void *v8;
  CGImageSource *v9;
  CGImageSource *v10;
  NSObject *v11;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v3, 1, 0);
  v4 = (const __CFData *)objc_claimAutoreleasedReturnValue();
  if (-[__CFData length](v4, "length"))
  {
    objc_msgSend((id)*MEMORY[0x1E0CEC530], "identifier");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v13 = *MEMORY[0x1E0CBD2A8];
      v14[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
      v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
    v9 = CGImageSourceCreateWithData(v4, v7);
    if (v9)
    {
      v10 = v9;
      v11 = CGImageSourceCopyPropertiesAtIndex(v9, 0, 0);
      objc_msgSend(MEMORY[0x1E0D73150], "locationFromImageProperties:", v11);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      CFRelease(v10);
    }
    else
    {
      v11 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        +[CAMNebulaUtilities locationFromJPEGAtPath:].cold.2(v3);
      v8 = 0;
    }

  }
  else
  {
    v6 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[CAMNebulaUtilities locationFromJPEGAtPath:].cold.1(v3);
    v8 = 0;
  }

  return v8;
}

+ (void)locationFromJPEGAtPath:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "path");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_1DB760000, v2, v3, "locationFromJPEGAtPath: Unable to read data from file '%{public}@'.", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1();
}

+ (void)locationFromJPEGAtPath:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "path");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_1DB760000, v2, v3, "Unable to create image source for '%{public}@'.", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1();
}

@end

@implementation BMStoreDataClassLogging

+ (void)logClassNamed:(id)a3
{
  NSString *v3;
  objc_class *v4;
  const char *ImageName;
  void *v6;
  NSObject *v7;
  char v8;

  v3 = (NSString *)a3;
  if (_os_feature_enabled_impl())
  {
    v4 = NSClassFromString(v3);
    if (!-[NSString hasPrefix:](v3, "hasPrefix:", CFSTR("BM")))
      goto LABEL_6;
    ImageName = class_getImageName(v4);
    if (!ImageName)
      goto LABEL_6;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", ImageName);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastPathComponent");
    v7 = objc_claimAutoreleasedReturnValue();

    if ((-[NSObject isEqual:](v7, "isEqual:", CFSTR("BiomeStreams")) & 1) != 0)
    {
LABEL_8:

      goto LABEL_9;
    }
    v8 = -[NSObject hasPrefix:](v7, "hasPrefix:", CFSTR("BiomeLibrary"));

    if ((v8 & 1) == 0)
    {
LABEL_6:
      __biome_log_for_category();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        +[BMStoreDataClassLogging logClassNamed:].cold.1((uint64_t)v3, v7);
      goto LABEL_8;
    }
  }
LABEL_9:

}

+ (void)logClassNamed:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_1A95BD000, a2, OS_LOG_TYPE_FAULT, "Decoding event of class \"%@\", (uint8_t *)&v2, 0xCu);
}

@end

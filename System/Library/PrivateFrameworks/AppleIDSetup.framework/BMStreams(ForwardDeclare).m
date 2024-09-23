@implementation BMStreams(ForwardDeclare)

+ (id)ais_appleIDChildSetupSource
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  +[AISChildSetupBiomeEventFactory log](AISChildSetupBiomeEventFactory, "log");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    +[BMStreams(ForwardDeclare) ais_appleIDChildSetupSource].cold.1(v0, v1, v2, v3, v4, v5, v6, v7);

  BiomeLibrary();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "AppleID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ChildSetup");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "source");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (void)ais_appleIDChildSetupSource
{
  OUTLINED_FUNCTION_0(&dword_23644B000, a1, a3, "AISChildSetupBiomeEventFactory - Loaded appleIDChildSetup stream", a5, a6, a7, a8, 0);
}

@end

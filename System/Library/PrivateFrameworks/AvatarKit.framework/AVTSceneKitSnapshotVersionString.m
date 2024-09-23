@implementation AVTSceneKitSnapshotVersionString

void __AVTSceneKitSnapshotVersionString_block_invoke()
{
  void *v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v0)
  {
    avt_default_log();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
      __AVTSceneKitSnapshotVersionString_block_invoke_cold_1(v1, v2, v3);

  }
  objc_msgSend(v0, "infoDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CFBundleVersion"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)AVTSceneKitSnapshotVersionString_kAVTSceneKitSnapshotVersionString;
  AVTSceneKitSnapshotVersionString_kAVTSceneKitSnapshotVersionString = v5;

}

void __AVTSceneKitSnapshotVersionString_block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "bundle";
  OUTLINED_FUNCTION_1_0();
}

@end

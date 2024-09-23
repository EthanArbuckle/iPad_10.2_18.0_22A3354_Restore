@implementation NSUUID

void __41__NSUUID_BMUtilities__bm_bootSessionUUID__block_invoke()
{
  NSObject *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  size_t v5;
  _BYTE v6[37];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  memset(v6, 0, sizeof(v6));
  v5 = 37;
  if (sysctlbyname("kern.bootsessionuuid", v6, &v5, 0, 0))
  {
    __biome_log_for_category(0);
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
      __41__NSUUID_BMUtilities__bm_bootSessionUUID__block_invoke_cold_1(v0);

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)bm_bootSessionUUID__bootSessionUUID;
    bm_bootSessionUUID__bootSessionUUID = v1;
  }
  else
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v6);
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v2);
    v4 = (void *)bm_bootSessionUUID__bootSessionUUID;
    bm_bootSessionUUID__bootSessionUUID = v3;

  }
}

void __41__NSUUID_BMUtilities__bm_bootSessionUUID__block_invoke_cold_1(NSObject *a1)
{
  int v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = *__error();
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_fault_impl(&dword_1AEB31000, a1, OS_LOG_TYPE_FAULT, "Failed to retrieve boot session UUID with error %{darwin.errno}d", (uint8_t *)v3, 8u);
}

@end

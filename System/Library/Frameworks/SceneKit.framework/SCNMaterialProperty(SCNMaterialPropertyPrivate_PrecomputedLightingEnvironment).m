@implementation SCNMaterialProperty(SCNMaterialPropertyPrivate_PrecomputedLightingEnvironment)

+ (void)precomputedLightingEnvironmentDataForContents:()SCNMaterialPropertyPrivate_PrecomputedLightingEnvironment device:error:.cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "slot";
  _os_log_fault_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Null argument", (uint8_t *)&v1, 0xCu);
}

@end

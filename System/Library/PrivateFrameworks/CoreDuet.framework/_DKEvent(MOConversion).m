@implementation _DKEvent(MOConversion)

- (void)metadataFromCustomMetadata:()MOConversion .cold.1(uint8_t *a1, uint64_t a2, _QWORD *a3)
{
  *(_DWORD *)a1 = 138412290;
  *a3 = a2;
  OUTLINED_FUNCTION_1_1(&dword_18DDBE000, MEMORY[0x1E0C81028], (uint64_t)a3, "Error unarchiving object %@", a1);
}

+ (void)objectFromManagedObject:()MOConversion readMetadata:excludedMetadataKeys:cache:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_18DDBE000, a2, v4, "Error loading custom metadata for object in stream %@", v5);

}

+ (void)copyMetadata:()MOConversion toManagedObject:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_5(&dword_18DDBE000, v0, v1, "Event structured metadata failed on NSKeyedArchiver: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

+ (void)copyMetadata:()MOConversion toManagedObject:.cold.2(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_18DDBE000, log, OS_LOG_TYPE_ERROR, "Unable to convert value because it does not conform to NSSecureCoding.", buf, 2u);
}

@end

@implementation NTKFace(NTKFaceDescriptorAdditions)

+ (void)defaultFaceFromFaceDescriptor:()NTKFaceDescriptorAdditions forDevice:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B72A3000, log, OS_LOG_TYPE_ERROR, "Face Descriptor is nil", v1, 2u);
}

+ (void)defaultFaceFromFaceDescriptor:()NTKFaceDescriptorAdditions forDevice:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1B72A3000, v0, v1, "Face Bundle is nil for descriptor %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)defaultFaceFromFaceDescriptor:()NTKFaceDescriptorAdditions forDevice:.cold.4()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v3 = v0;
  OUTLINED_FUNCTION_2(&dword_1B72A3000, v1, (uint64_t)v1, "Default Face for bundle %@ is nil for descriptor %@", v2);
  OUTLINED_FUNCTION_1();
}

+ (void)defaultFaceFromFaceDescriptor:()NTKFaceDescriptorAdditions forDevice:.cold.5(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  uint8_t v7[14];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  v8 = a2;
  OUTLINED_FUNCTION_2(&dword_1B72A3000, a3, v6, "Default Face of style %@ is nil for descriptor %@", v7);

}

+ (void)defaultFaceFromFaceDescriptor:()NTKFaceDescriptorAdditions forDevice:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1B72A3000, v0, v1, "Device is nil for descriptor %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end

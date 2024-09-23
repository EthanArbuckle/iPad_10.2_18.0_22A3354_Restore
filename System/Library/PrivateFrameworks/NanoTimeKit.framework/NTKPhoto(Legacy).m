@implementation NTKPhoto(Legacy)

- (void)initWithLegacySidecar:()Legacy .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  id v5;
  id v6;
  uint8_t v7[12];
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  OUTLINED_FUNCTION_3_0();
  v8 = 2112;
  v9 = a2;
  v6 = v5;
  _os_log_error_impl(&dword_1B72A3000, a3, OS_LOG_TYPE_ERROR, "%@: cannot read photo info from %@", v7, 0x16u);

}

- (void)initWithLegacySidecar:()Legacy .cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1B72A3000, v0, v1, "_imagePixelSizeFromFile: cannot create ImageSourceRef for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)initWithLegacySidecar:()Legacy .cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1B72A3000, v0, v1, "_imagePixelSizeFromFile: cannot get ImageSource properties for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end

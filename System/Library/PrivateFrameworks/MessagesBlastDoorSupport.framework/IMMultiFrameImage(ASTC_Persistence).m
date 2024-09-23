@implementation IMMultiFrameImage(ASTC_Persistence)

- (void)writeASTCImage:()ASTC_Persistence duration:error:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BEDB7000, a2, a3, "Failed to write image data length to stream with error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)writeASTCImage:()ASTC_Persistence duration:error:.cold.2(os_log_t log)
{
  uint8_t v1[8];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BEDB7000, log, OS_LOG_TYPE_ERROR, "Image destination failed to finalize.", v1, 2u);
}

- (void)writeASTCImage:()ASTC_Persistence duration:error:.cold.3(uint64_t a1, NSObject *a2, double a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  double v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2048;
  v6 = a3;
  _os_log_error_impl(&dword_1BEDB7000, a2, OS_LOG_TYPE_ERROR, "No image (%@) or duration (%f)", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)finalizeASTCWithError:()ASTC_Persistence .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1BEDB7000, v0, v1, "Failed to write IMMultiFrameImage format magic bytes to stream with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)finalizeASTCWithError:()ASTC_Persistence .cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1BEDB7000, v0, v1, "Failed to write frame count to stream with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)finalizeASTCWithError:()ASTC_Persistence .cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1BEDB7000, v0, v1, "Failed to write plist data length to stream with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)finalizeASTCWithError:()ASTC_Persistence .cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1BEDB7000, v0, v1, "Metadata dictionary writing to atsc output stream failed. Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end

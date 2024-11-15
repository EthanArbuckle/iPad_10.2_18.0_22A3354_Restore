@implementation CIContext(Internal)

+ (void)internalContextWithEAGLContext:()Internal options:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1921E4000, log, OS_LOG_TYPE_DEBUG, "CIContext for CL: do something about disabling software fallback here.", v1, 2u);
  OUTLINED_FUNCTION_10();
}

+ (void)internalContextWithEAGLContext:()Internal options:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0(&dword_1921E4000, v0, v1, "%{public}s unsupported object %{public}@ for key kCIContextHLGOpticalScale.", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4_0();
}

+ (void)internalContextWithEAGLContext:()Internal options:.cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "CIContext workingformat must be %{public}s. Ignoring request.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

+ (void)internalContextWithEAGLContext:()Internal options:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0(&dword_1921E4000, v0, v1, "CIContext workingformat must be %{public}s. Ignoring request for %{public}s.", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4_0();
}

+ (void)internalContextWithMTLCommandQueue:()Internal options:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0(&dword_1921E4000, v0, v1, "%{public}s unsupported object %{public}@ for key kCIContextHLGOpticalScale.", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4_0();
}

+ (void)internalContextWithMTLCommandQueue:()Internal options:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "CIContext workingformat must be %{public}s. Ignoring request.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

+ (void)internalContextWithMTLCommandQueue:()Internal options:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0(&dword_1921E4000, v0, v1, "CIContext workingformat must be %{public}s. Ignoring request for %{public}s.", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4_0();
}

+ (void)internalSWContextWithOptions:()Internal .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0(&dword_1921E4000, v0, v1, "%{public}s unsupported object %{public}@ for key kCIContextHLGOpticalScale.", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4_0();
}

@end

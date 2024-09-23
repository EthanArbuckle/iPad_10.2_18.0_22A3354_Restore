@implementation CIContext(CIRenderDestination)

- (void)_startTaskToRender:()CIRenderDestination toDestination:forPrepareRender:forClear:error:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s The CIContext is invalid.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)_startTaskToRender:()CIRenderDestination toDestination:forPrepareRender:forClear:error:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s The destination is nil.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)_startTaskToRender:()CIRenderDestination toDestination:forPrepareRender:forClear:error:.cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s The destination is invalid.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)_startTaskToRender:()CIRenderDestination toDestination:forPrepareRender:forClear:error:.cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s The image extent and destination extent do not intersect.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)_startTaskToRender:()CIRenderDestination toDestination:forPrepareRender:forClear:error:.cold.5(int a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  CI::name_for_format(a1);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1921E4000, v1, v2, "%{public}s format %{public}s is not supported on GLES.", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_startTaskToRender:()CIRenderDestination toDestination:forPrepareRender:forClear:error:.cold.6(const __CFString *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  CFStringGetCStringPtr(a1, 0x600u);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1921E4000, v1, v2, "%{public}s %{public}s", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_2();
}

@end

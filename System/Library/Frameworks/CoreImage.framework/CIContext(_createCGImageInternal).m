@implementation CIContext(_createCGImageInternal)

- (void)_createCGImage:()_createCGImageInternal fromRect:format:premultiplied:colorSpace:deferred:renderCallback:.cold.1(int a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  CI::name_for_format(a1);
  OUTLINED_FUNCTION_1_2(&dword_1921E4000, v1, v2, "[CIContext createCGImage:fromRect:format:colorSpace:] unsupported format %{public}s.", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_createCGImage:()_createCGImageInternal fromRect:format:premultiplied:colorSpace:deferred:renderCallback:.cold.2(int a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  CI::name_for_format(a1);
  OUTLINED_FUNCTION_1_2(&dword_1921E4000, v1, v2, "[CIContext createCGImage:fromRect:format:colorSpace:] format %{public}s is not supported on GLES.", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_createCGImage:()_createCGImageInternal fromRect:format:premultiplied:colorSpace:deferred:renderCallback:.cold.3(uint64_t a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 136446210;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1921E4000, log, OS_LOG_TYPE_ERROR, "Cannot create a CGImageProvider for %{public}s\n", buf, 0xCu);
}

- (void)_createCGImage:()_createCGImageInternal fromRect:format:premultiplied:colorSpace:deferred:renderCallback:.cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_9(&dword_1921E4000, a1, a3, "Could not access surface.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_10();
}

- (void)_createCGImage:()_createCGImageInternal fromRect:format:premultiplied:colorSpace:deferred:renderCallback:.cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_9(&dword_1921E4000, a1, a3, "[CIContext createCGImage:fromRect:format:colorSpace:] unsupported colorspace.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_10();
}

@end

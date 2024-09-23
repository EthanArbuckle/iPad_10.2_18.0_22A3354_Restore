@implementation DDDetectionController(WebKitBackEnd)

- (void)_resultForAnchor:()WebKitBackEnd forFrame:context:.cold.1(void *a1, uint64_t a2)
{
  void *v4;
  __int16 v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "scheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 134218498;
  v7 = a1;
  OUTLINED_FUNCTION_1_1();
  v8 = v5;
  v9 = a2;
  _os_log_error_impl(&dword_19EFBB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unknown result for URL %p (%@), for frame %@", (uint8_t *)&v6, 0x20u);

}

- (void)_resultForIdentifier:()WebKitBackEnd withResults:context:.cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_19EFBB000, MEMORY[0x1E0C81028], a3, "No known results for this identifier: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_resultForIdentifier:()WebKitBackEnd withResults:context:.cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_19EFBB000, MEMORY[0x1E0C81028], a3, "Unparseable result identifier %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_resultForIdentifier:()WebKitBackEnd withResults:context:.cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_19EFBB000, MEMORY[0x1E0C81028], a3, "result number out of bounds %li", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)_resultForURL:()WebKitBackEnd withResults:context:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "scheme");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_19EFBB000, MEMORY[0x1E0C81028], v2, "Wrong URL %p (%@), missing //", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_6();
}

- (void)_resultForURL:()WebKitBackEnd withResults:context:.cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "scheme");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_19EFBB000, MEMORY[0x1E0C81028], v2, "Wrong scheme for URL %p (%@)", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_6();
}

@end

@implementation CSUserQuery(CSInstantAnswer)

- (void)handleFoundInstantAnswer:()CSInstantAnswer .cold.1()
{
  NSObject *v0;
  void *v1;
  void *v2;
  __int16 v3;
  uint8_t v4[22];
  __int16 v5;
  void *v6;
  uint64_t v7;

  OUTLINED_FUNCTION_11();
  v2 = v1;
  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v1, "count");
  OUTLINED_FUNCTION_4();
  v5 = v3;
  v6 = v2;
  _os_log_debug_impl(&dword_18C42F000, v0, OS_LOG_TYPE_DEBUG, "Received %lu instant answers for query: %@, instant answers:\n%@", v4, 0x20u);
}

@end

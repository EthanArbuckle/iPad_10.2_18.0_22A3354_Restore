@implementation ICSearchProfiler

+ (void)resetProfileTimer
{
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)profilingTimer;
  profilingTimer = v2;

}

+ (void)logProfilingWithMessage:(id)a3
{
  objc_msgSend(a1, "logProfilingWithMessage:searchQueryOperation:", a3, 0);
}

+ (void)logProfilingWithMessage:(id)a3 searchQueryOperation:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a3;
  v6 = a4;
  v7 = os_log_create("com.apple.notes", "SearchProfiling");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    +[ICSearchProfiler logProfilingWithMessage:searchQueryOperation:].cold.1((uint64_t)v6, (uint64_t)v5, v7);

}

+ (void)logProfilingWithMessage:(NSObject *)a3 searchQueryOperation:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  double v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  double v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)profilingTimer, "timeIntervalSinceNow");
  v7 = 138412802;
  v8 = a1;
  v9 = 2112;
  v10 = a2;
  v11 = 2048;
  v12 = -v6;
  _os_log_debug_impl(&dword_1BD918000, a3, OS_LOG_TYPE_DEBUG, "%@: %@: %f", (uint8_t *)&v7, 0x20u);
}

@end

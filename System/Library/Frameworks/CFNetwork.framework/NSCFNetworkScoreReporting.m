@implementation NSCFNetworkScoreReporting

void __48____NSCFNetworkScoreReporting_createConnection___block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint8_t v5[16];

  if (CFNLog::onceToken != -1)
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
  v2 = (id)CFNLog::logger;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_183ECA000, v2, OS_LOG_TYPE_DEFAULT, "[NETWORKSCORE] connection was invalidated", v5, 2u);
  }

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    v4 = *(void **)(v3 + 8);
  else
    v4 = 0;
  objc_msgSend(v4, "invalidate");
  -[__NSCFNetworkScoreReporting setConnection:](*(_QWORD *)(a1 + 32));
}

void __48____NSCFNetworkScoreReporting_createConnection___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  if (CFNLog::onceToken != -1)
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
  v0 = (id)CFNLog::logger;
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_183ECA000, v0, OS_LOG_TYPE_DEFAULT, "[NETWORKSCORE] daemon connection was interrupted", v1, 2u);
  }

}

void __49____NSCFNetworkScoreReporting_sendMetrics_queue___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (CFNLog::onceToken != -1)
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
  v4 = (id)CFNLog::logger;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "localizedDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_183ECA000, v4, OS_LOG_TYPE_DEFAULT, "[NETWORKSCORE] connection failed with error : %@", (uint8_t *)&v8, 0xCu);

  }
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    v7 = *(void **)(v6 + 8);
  else
    v7 = 0;
  objc_msgSend(v7, "invalidate");
  -[__NSCFNetworkScoreReporting setConnection:](*(_QWORD *)(a1 + 32));

}

@end

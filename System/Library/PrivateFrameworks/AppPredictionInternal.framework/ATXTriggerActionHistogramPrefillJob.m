@implementation ATXTriggerActionHistogramPrefillJob

void __ATXTriggerActionHistogramPrefillJob_block_invoke(uint64_t a1, void *a2)
{
  _xpc_activity_s *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  double v7;
  int v8;
  double v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (xpc_activity_get_state(v2) == 2 && (objc_msgSend(MEMORY[0x1E0D81590], "isClassCLocked") & 1) == 0)
  {
    v3 = (void *)objc_opt_new();
    __atxlog_handle_default();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_1C9A3B000, v4, OS_LOG_TYPE_DEFAULT, "Prefilling action histograms...", (uint8_t *)&v8, 2u);
    }

    v5 = (void *)MEMORY[0x1CAA48B6C]();
    +[_ATXActionUtils prefillActionHistograms](_ATXActionUtils, "prefillActionHistograms");
    objc_autoreleasePoolPop(v5);
    __atxlog_handle_default();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "timeIntervalSinceNow");
      v8 = 134217984;
      v9 = v7 * -1000.0;
      _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_DEFAULT, "Done prefilling action histograms in %0.2f ms.", (uint8_t *)&v8, 0xCu);
    }

  }
}

@end

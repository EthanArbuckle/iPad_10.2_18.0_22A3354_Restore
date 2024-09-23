@implementation FCPersonalizationBaselineClicksMultiplerForTagID

double __FCPersonalizationBaselineClicksMultiplerForTagID_block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = FCPersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEBUG))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v4;
    _os_log_debug_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_DEBUG, "No whitelist present for %@", (uint8_t *)&v5, 0xCu);
  }
  return 1.0;
}

double __FCPersonalizationBaselineClicksMultiplerForTagID_block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = FCPersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEBUG))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v4;
    _os_log_debug_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_DEBUG, "No whitelisted tag prior specified for %@", (uint8_t *)&v5, 0xCu);
  }
  return 1.0;
}

double __FCPersonalizationBaselineClicksMultiplerForTagID_block_invoke_3(double *a1)
{
  void *v2;
  uint64_t v4;
  void *v5;
  double v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCPersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEBUG))
  {
    v4 = *((_QWORD *)a1 + 4);
    v5 = (void *)MEMORY[0x1E0CB37E8];
    v6 = a1[6];
    v7 = v2;
    objc_msgSend(v5, "numberWithDouble:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *((_QWORD *)a1 + 5);
    v10 = 138412802;
    v11 = v4;
    v12 = 2112;
    v13 = v8;
    v14 = 2112;
    v15 = v9;
    _os_log_debug_impl(&dword_1A1B90000, v7, OS_LOG_TYPE_DEBUG, "tagPriorPercent = %@, baselineRatePrior = %@ for %@", (uint8_t *)&v10, 0x20u);

  }
  return 1.0;
}

@end

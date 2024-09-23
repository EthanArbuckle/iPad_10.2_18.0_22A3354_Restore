@implementation EMForceBlankCellsController

+ (BOOL)shouldBlockSQLQueries
{
  return +[EMInternalPreferences preferenceEnabled:](EMInternalPreferences, "preferenceEnabled:", 26);
}

+ (BOOL)shouldBlockXPCQueue
{
  return +[EMInternalPreferences preferenceEnabled:](EMInternalPreferences, "preferenceEnabled:", 25);
}

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__EMForceBlankCellsController_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_14 != -1)
    dispatch_once(&log_onceToken_14, block);
  return (id)log_log_14;
}

void __34__EMForceBlankCellsController_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_14;
  log_log_14 = (uint64_t)v1;

}

+ (void)blockForRandomDurationWithMessage:(id)a3
{
  id v4;
  uint32_t v5;
  double v6;
  double v7;
  NSObject *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  NSObject *v13;
  uint32_t v14;
  NSObject *v15;
  double v16;
  int v17;
  double v18;
  __int16 v19;
  double v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = arc4random();
  objc_msgSend(a1, "_blockRate");
  v7 = v6;
  if ((double)v5 / 4294967300.0 <= v6)
  {
    objc_msgSend(a1, "_minimumDelay");
    v10 = v9;
    objc_msgSend(a1, "_maximumDelay");
    v12 = v11;
    if (v10 > v11)
    {
      +[EMForceBlankCellsController log](EMForceBlankCellsController, "log");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        +[EMForceBlankCellsController blockForRandomDurationWithMessage:].cold.1(v13, v10, v12);

      v10 = 0.25;
      v12 = 2.0;
    }
    v14 = arc4random();
    +[EMForceBlankCellsController log](EMForceBlankCellsController, "log");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v10 + (v12 - v10) * ((double)v14 / 4294967300.0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 134218242;
      v18 = v16;
      v19 = 2112;
      v20 = *(double *)&v4;
      _os_log_impl(&dword_1B99BB000, v15, OS_LOG_TYPE_DEFAULT, "Sleep for %.2fs (%@)", (uint8_t *)&v17, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0CB3978], "sleepForTimeInterval:", v16);
  }
  else
  {
    +[EMForceBlankCellsController log](EMForceBlankCellsController, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 134218240;
      v18 = (double)v5 / 4294967300.0;
      v19 = 2048;
      v20 = v7;
      _os_log_impl(&dword_1B99BB000, v8, OS_LOG_TYPE_DEFAULT, "Skip sleep (%.2f > %.2f)", (uint8_t *)&v17, 0x16u);
    }

  }
}

+ (double)_blockRate
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  NSObject *v7;

  objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("BlankCellBlockRate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
LABEL_9:
    v5 = 0.2;
    goto LABEL_10;
  }
  objc_msgSend(v3, "doubleValue");
  v5 = v4;
  if (v4 < 0.0 || v4 > 1.0)
  {
    +[EMForceBlankCellsController log](EMForceBlankCellsController, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[EMForceBlankCellsController _blockRate].cold.1(v7);

    goto LABEL_9;
  }
LABEL_10:

  return v5;
}

+ (double)_minimumDelay
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("BlankCellMinimumBlockDuration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.25;
  }

  return v5;
}

+ (double)_maximumDelay
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("BlankCellMaximumBlockDuration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 2.0;
  }

  return v5;
}

+ (void)blockForRandomDurationWithMessage:(double)a3 .cold.1(os_log_t log, double a2, double a3)
{
  int v3;
  double v4;
  __int16 v5;
  double v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134218240;
  v4 = a2;
  v5 = 2048;
  v6 = a3;
  _os_log_error_impl(&dword_1B99BB000, log, OS_LOG_TYPE_ERROR, "Minimum delay (%.2f) cannot be greater than maximum delay (%.2f) - fall back to default values", (uint8_t *)&v3, 0x16u);
}

+ (void)_blockRate
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B99BB000, log, OS_LOG_TYPE_ERROR, "Block rate has to be between 0 and 1 - fall back to default value", v1, 2u);
}

@end

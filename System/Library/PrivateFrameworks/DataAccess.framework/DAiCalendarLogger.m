@implementation DAiCalendarLogger

+ (id)sharedLogger
{
  if (sharedLogger_onceToken != -1)
    dispatch_once(&sharedLogger_onceToken, &__block_literal_global_11);
  return (id)sharedLogger_sSharedLogger;
}

void __33__DAiCalendarLogger_sharedLogger__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedLogger_sSharedLogger;
  sharedLogger_sSharedLogger = v0;

}

- (void)registerWithiCalendar
{
  objc_msgSend(MEMORY[0x1E0DDB838], "setDelegate:", self);
}

- (void)logICSMessage:(id)a3 atLevel:(int64_t)a4
{
  int v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  int v8;
  id v9;
  uint64_t v10;

  v4 = a4;
  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  DALoggingwithCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_BYTE *)(MEMORY[0x1E0D1C448] + v4);
  if (os_log_type_enabled(v6, v7))
  {
    v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_1B51E4000, v6, v7, "%@", (uint8_t *)&v8, 0xCu);
  }

}

@end

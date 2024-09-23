@implementation _DKSyncPowerlog

+ (void)recordWithSyncType:(id)a3 transportType:(int64_t)a4 startDate:(id)a5 endDate:(id)a6 isEmpty:(BOOL)a7
{
  _BOOL8 v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  id v18;
  uint8_t v19[8];
  _QWORD v20[4];
  _QWORD v21[5];

  v21[4] = *MEMORY[0x1E0C80C00];
  if (a5 && a6)
  {
    v8 = a7;
    if (a4 == 8)
      v9 = 3;
    else
      v9 = 2 * (a4 == 4);
    v20[0] = CFSTR("timestamp");
    v20[1] = CFSTR("timestampEnd");
    v21[0] = a5;
    v21[1] = a6;
    v20[2] = CFSTR("isEmpty");
    v10 = (void *)MEMORY[0x1E0CB37E8];
    v11 = a6;
    v12 = a5;
    objc_msgSend(v10, "numberWithBool:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21[2] = v13;
    v20[3] = CFSTR("transportType");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21[3] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 4);
    v15 = objc_claimAutoreleasedReturnValue();

    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v16 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      +[_DKSyncPowerlog recordWithSyncType:transportType:startDate:endDate:isEmpty:].cold.1((uint64_t)v15, v16);

    PLLogRegisteredEvent();
  }
  else
  {
    v17 = a6;
    v18 = a5;
    +[_CDLogging instrumentationChannel](_CDLogging, "instrumentationChannel");
    v15 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_18DDBE000, v15, OS_LOG_TYPE_DEFAULT, "Skipping sync powerlog recording - startDate or endDate is nil.", v19, 2u);
    }
  }

}

+ (void)recordWithSyncType:(uint64_t)a1 transportType:(NSObject *)a2 startDate:endDate:isEmpty:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_18DDBE000, a2, OS_LOG_TYPE_DEBUG, "Logging sync session to powerlog: %@", (uint8_t *)&v2, 0xCu);
}

@end

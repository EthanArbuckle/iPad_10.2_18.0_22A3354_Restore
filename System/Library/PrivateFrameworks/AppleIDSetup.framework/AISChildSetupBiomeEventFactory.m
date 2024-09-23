@implementation AISChildSetupBiomeEventFactory

+ (id)log
{
  if (log_onceToken[0] != -1)
    dispatch_once(log_onceToken, &__block_literal_global_0);
  return (id)log_log;
}

void __37__AISChildSetupBiomeEventFactory_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.appleidsetup", "biome");
  v1 = (void *)log_log;
  log_log = (uint64_t)v0;

}

+ (id)biomeEventWithIsNewChildAccount:(id)a3 startDate:(id)a4 endDate:(id)a5 completedSetup:(id)a6 lastViewedScreen:(int64_t)a7 appUsage:(id)a8 askToBuy:(id)a9 commSafety:(id)a10 screenDistance:(id)a11 age:(id)a12 flowType:(int64_t)a13
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v36;
  id v37;

  v37 = a12;
  v18 = a11;
  v19 = a10;
  v20 = a9;
  v21 = a8;
  v22 = a6;
  v23 = a5;
  v24 = a4;
  v25 = a3;
  +[AISChildSetupBiomeEventFactory log](AISChildSetupBiomeEventFactory, "log");
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    +[AISChildSetupBiomeEventFactory biomeEventWithIsNewChildAccount:startDate:endDate:completedSetup:lastViewedScreen:appUsage:askToBuy:commSafety:screenDistance:age:flowType:].cold.1(v26, v27, v28, v29, v30, v31, v32, v33);

  LODWORD(v36) = a13;
  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0C2B0]), "initWithIsNewChildAccount:startDate:endDate:completedSetup:lastViewedScreen:appUsage:askToBuy:commSafety:screenDistance:age:flowType:", v25, v24, v23, v22, a7, v21, v20, v19, v18, v37, v36);

  return v34;
}

+ (void)biomeEventWithIsNewChildAccount:(uint64_t)a3 startDate:(uint64_t)a4 endDate:(uint64_t)a5 completedSetup:(uint64_t)a6 lastViewedScreen:(uint64_t)a7 appUsage:(uint64_t)a8 askToBuy:commSafety:screenDistance:age:flowType:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_23644B000, a1, a3, "AISChildSetupBiomeEventFactory - Creating BMAppleIDChildSetup biome event", a5, a6, a7, a8, 0);
}

@end

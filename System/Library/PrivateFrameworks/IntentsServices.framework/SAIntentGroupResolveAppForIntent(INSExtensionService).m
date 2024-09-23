@implementation SAIntentGroupResolveAppForIntent(INSExtensionService)

- (void)ins_resolveAppForIntent:()INSExtensionService completionHandler:
{
  id v6;
  void (**v7)(id, id, _QWORD);
  os_log_t *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  int v15;
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (os_log_t *)MEMORY[0x24BDD9A30];
  v9 = *MEMORY[0x24BDD9A30];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD9A30], OS_LOG_TYPE_INFO))
  {
    v15 = 136315394;
    v16 = "-[SAIntentGroupResolveAppForIntent(INSExtensionService) ins_resolveAppForIntent:completionHandler:]";
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_20BAA8000, v9, OS_LOG_TYPE_INFO, "%s ins_resolveAppForIntent: %@", (uint8_t *)&v15, 0x16u);
  }
  objc_msgSend(a1, "appsList");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "valueForKey:", CFSTR("appIdentifyingInfo"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "valueForKey:", CFSTR("bundleId"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_INFO))
  {
    v15 = 136315394;
    v16 = "-[SAIntentGroupResolveAppForIntent(INSExtensionService) ins_resolveAppForIntent:completionHandler:]";
    v17 = 2112;
    v18 = v12;
    _os_log_impl(&dword_20BAA8000, v13, OS_LOG_TYPE_INFO, "%s appList = %@", (uint8_t *)&v15, 0x16u);
  }
  v14 = objc_alloc_init(MEMORY[0x24BE81390]);
  objc_msgSend(v14, "setAppsList:", v10);
  v7[2](v7, v14, 0);

}

- (uint64_t)ins_analyticsBeginEventType
{
  return 624;
}

- (uint64_t)ins_analyticsEndEventType
{
  return 625;
}

- (uint64_t)ins_shouldUseExtendedFlowTimeout
{
  return 1;
}

@end

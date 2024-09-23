@implementation IPFeatureManager

+ (void)scanEventsInMessageUnits:(id)a3 synchronously:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  IPFeatureMailScanner *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v5 = a4;
  v7 = a5;
  v8 = a3;
  v9 = objc_alloc_init(IPFeatureMailScanner);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __77__IPFeatureManager_scanEventsInMessageUnits_synchronously_completionHandler___block_invoke;
  v11[3] = &unk_24DAA5198;
  v12 = v7;
  v10 = v7;
  -[IPFeatureMailScanner scanEventsInMessageUnits:synchronously:completionHandler:](v9, "scanEventsInMessageUnits:synchronously:completionHandler:", v8, v5, v11);

}

void __77__IPFeatureManager_scanEventsInMessageUnits_synchronously_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v4;
  NSObject *v5;
  void *v6;
  _DWORD v7[2];
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v4 = _IPLogHandle;
  if (!_IPLogHandle)
  {
    IPInitLogging();
    v4 = _IPLogHandle;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = v4;
    +[IPFeatureScanner descriptionForScanResultType:](IPFeatureScanner, "descriptionForScanResultType:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = 67109378;
    v7[1] = a3;
    v8 = 2114;
    v9 = v6;
    _os_log_impl(&dword_219581000, v5, OS_LOG_TYPE_INFO, "Result Type: %d   [%{public}@] #FeatureManager", (uint8_t *)v7, 0x12u);

  }
}

+ (void)scanEventsInMessageUnits:(id)a3 completionHandler:(id)a4
{
  objc_msgSend(a1, "scanEventsInMessageUnits:synchronously:completionHandler:", a3, 0, a4);
}

+ (id)featuresForTextString:(id)a3 inMessageUnit:(id)a4
{
  id v5;
  id v6;
  IPFeatureMailScanner *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(IPFeatureMailScanner);
  -[IPFeatureMailScanner featuresForTextString:inMessageUnit:](v7, "featuresForTextString:inMessageUnit:", v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (void)setEventStoreForTesting:(id)a3
{
  +[IPFeatureScanner setEventStoreForTesting:](IPFeatureScanner, "setEventStoreForTesting:", a3);
}

@end

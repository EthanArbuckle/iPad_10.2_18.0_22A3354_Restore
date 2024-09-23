@implementation CDSleepForAutoSu

void __37___CDSleepForAutoSu_tuningDictionary__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "readConfigurationFromDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "sanitizeTuningConfiguration:", v4);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)tuningDictionary_tuningDict;
  tuningDictionary_tuningDict = v2;

}

@end

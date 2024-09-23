@implementation NSDateFormatter

void __83__NSDateFormatter_FULocaleAndTimeZoneObserving__fu_observeTimeZoneAndLocaleChanges__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setLocale:", v1);

}

void __83__NSDateFormatter_FULocaleAndTimeZoneObserving__fu_observeTimeZoneAndLocaleChanges__block_invoke_2(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(MEMORY[0x24BDBCF38], "localTimeZone");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setTimeZone:", v1);

}

@end

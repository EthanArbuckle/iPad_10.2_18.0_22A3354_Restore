@implementation HKHealthStore(FitnessUI)

+ (id)fiui_sharedHealthStoreForCarousel
{
  if (fiui_sharedHealthStoreForCarousel_onceToken != -1)
    dispatch_once(&fiui_sharedHealthStoreForCarousel_onceToken, &__block_literal_global_21);
  return (id)fiui_sharedHealthStoreForCarousel___healthStore;
}

+ (__CFString)fiui_localizationStringSuffixForWheelchairUser:()FitnessUI
{
  __CFString *v3;

  v3 = &stru_24CF339D8;
  if (a3)
    v3 = CFSTR("_WHEELCHAIR");
  return v3;
}

@end

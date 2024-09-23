@implementation NSTimer(MapsSharedExtras)

+ (id)_maps_scheduledTimerWithFireDate:()MapsSharedExtras block:
{
  id v6;
  void *v7;

  v6 = a3;
  objc_msgSend(a1, "scheduledTimerWithTimeInterval:repeats:block:", 0, a4, 1.79769313e308);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFireDate:", v6);

  return v7;
}

@end

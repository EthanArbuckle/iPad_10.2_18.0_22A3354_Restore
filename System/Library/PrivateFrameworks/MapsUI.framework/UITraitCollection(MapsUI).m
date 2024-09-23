@implementation UITraitCollection(MapsUI)

- (BOOL)_mapsUI_isWithinMUPlatterView
{
  void *v2;
  uint64_t v3;

  objc_opt_self();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "valueForNSIntegerTrait:", v2);

  return v3 != 0;
}

@end

@implementation UITraitCollection(AmbientPresentation)

- (BOOL)isAmbientPresented
{
  void *v2;
  _BOOL8 IsPresented;

  objc_opt_self();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  IsPresented = AMUIAmbientPresentationStateIsPresented(objc_msgSend(a1, "valueForNSIntegerTrait:", v2));

  return IsPresented;
}

- (uint64_t)ambientDisplayStyle
{
  void *v2;
  uint64_t v3;

  objc_opt_self();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "valueForNSIntegerTrait:", v2);

  return v3;
}

@end

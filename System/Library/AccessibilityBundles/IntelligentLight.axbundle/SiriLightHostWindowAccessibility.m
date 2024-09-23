@implementation SiriLightHostWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("IntelligentLight.SiriLightHostWindow");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_axShouldPostScreenChangeOnOrderFront:(BOOL)a3
{
  return 0;
}

@end

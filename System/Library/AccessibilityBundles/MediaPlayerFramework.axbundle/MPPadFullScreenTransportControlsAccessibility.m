@implementation MPPadFullScreenTransportControlsAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MPPadFullScreenTransportControls");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

@end

@implementation UICubicTimingParameters(AppleServices)

+ (id)jet_appleServicesLoadingParameters
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC36D8]), "initWithControlPoint1:controlPoint2:", 0.33, 0.0, 0.83, 0.83);
}

@end

@implementation MediaControlsBluetoothListeningModeButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MediaControlsBluetoothListeningModeButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (int64_t)_accessibilityExpandedStatus
{
  return 2;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  return 1;
}

@end

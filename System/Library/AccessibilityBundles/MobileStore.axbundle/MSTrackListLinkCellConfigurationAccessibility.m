@implementation MSTrackListLinkCellConfigurationAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MSTrackListLinkCellConfiguration");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF7408];
}

- (id)accessibilityLabel
{
  -[NSObject _accessibilityReloadMediaStrings](self, "_accessibilityReloadMediaStrings");
  return *(id *)objc_msgSend((id)-[MSTrackListLinkCellConfigurationAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_accessibilityStringsArrayPointer")), "bytes");
}

@end

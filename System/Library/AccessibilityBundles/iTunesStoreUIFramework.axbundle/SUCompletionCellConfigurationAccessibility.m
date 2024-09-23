@implementation SUCompletionCellConfigurationAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUCompletionCellConfiguration");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  id v3;
  id v4;

  -[NSObject _accessibilityReloadMediaStrings](self, "_accessibilityReloadMediaStrings");
  -[SUCompletionCellConfigurationAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_accessibilityStringsArrayPointer"));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = *(id *)objc_msgSend(v3, "bytes");

  return v4;
}

@end

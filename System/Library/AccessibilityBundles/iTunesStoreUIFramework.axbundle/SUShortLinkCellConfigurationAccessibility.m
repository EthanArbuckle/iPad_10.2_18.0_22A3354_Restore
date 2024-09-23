@implementation SUShortLinkCellConfigurationAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUShortLinkCellConfiguration");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  void *v8;

  -[NSObject _accessibilityReloadMediaStrings](self, "_accessibilityReloadMediaStrings");
  -[SUShortLinkCellConfigurationAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_accessibilityStringsArrayPointer"));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = objc_msgSend(v3, "bytes");
  v5 = *(void **)(v4 + 16);
  v6 = *(id *)(v4 + 24);
  v7 = v5;
  __UIAXStringForVariables();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end

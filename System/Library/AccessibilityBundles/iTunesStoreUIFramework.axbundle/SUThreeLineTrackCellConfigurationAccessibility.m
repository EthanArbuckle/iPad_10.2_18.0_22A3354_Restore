@implementation SUThreeLineTrackCellConfigurationAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUThreeLineTrackCellConfiguration");
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
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v12;

  -[NSObject _accessibilityReloadMediaStrings](self, "_accessibilityReloadMediaStrings");
  -[SUThreeLineTrackCellConfigurationAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_accessibilityStringsArrayPointer"));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = objc_msgSend(v3, "bytes");
  v5 = *(void **)(v4 + 16);
  v6 = *(void **)(v4 + 24);
  v7 = *(id *)(v4 + 8);
  v8 = v5;
  v9 = v6;
  -[SUThreeLineTrackCellConfigurationAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_accessibilityVideoIconString"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end

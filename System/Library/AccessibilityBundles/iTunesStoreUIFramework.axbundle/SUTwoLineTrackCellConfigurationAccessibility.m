@implementation SUTwoLineTrackCellConfigurationAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUTwoLineTrackCellConfiguration");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  id v3;
  id *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v11;

  -[NSObject _accessibilityReloadMediaStrings](self, "_accessibilityReloadMediaStrings");
  -[SUTwoLineTrackCellConfigurationAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_accessibilityStringsArrayPointer"));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = (id *)objc_msgSend(v3, "bytes");
  v5 = v4[2];
  v6 = v4[1];
  v7 = *v4;
  -[SUTwoLineTrackCellConfigurationAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_accessibilityVideoIconString"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
  {
    accessibilityLocalizedString(CFSTR("explicit.content"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    __UIAXStringForVariables();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

@end

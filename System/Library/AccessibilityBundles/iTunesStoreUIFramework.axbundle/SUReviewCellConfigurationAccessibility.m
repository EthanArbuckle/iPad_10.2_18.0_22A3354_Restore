@implementation SUReviewCellConfigurationAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUReviewCellConfiguration");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  float v8;
  float v9;
  void *v10;
  void *v11;

  -[NSObject _accessibilityReloadMediaStrings](self, "_accessibilityReloadMediaStrings");
  -[SUReviewCellConfigurationAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_accessibilityStringsArrayPointer"));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "bytes");
  -[SUReviewCellConfigurationAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_representedObject"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "safeValueForKey:", CFSTR("reviewStatistics"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeValueForKey:", CFSTR("averageUserRating"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "floatValue");
    v9 = v8;

    starStringForStarCount(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  __UIAXStringForVariables();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73E0];
}

@end

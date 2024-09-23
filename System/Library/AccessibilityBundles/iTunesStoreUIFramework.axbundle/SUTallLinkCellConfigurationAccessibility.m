@implementation SUTallLinkCellConfigurationAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUTallLinkCellConfiguration");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  float v8;
  float v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;

  -[NSObject _accessibilityReloadMediaStrings](self, "_accessibilityReloadMediaStrings");
  -[SUTallLinkCellConfigurationAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_representedObject"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("reviewStatistics"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("numberOfUserRatings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  if (v6 < 1)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(v4, "safeValueForKey:", CFSTR("averageUserRating"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "floatValue");
    v9 = v8;

    starStringForStarCount(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[SUTallLinkCellConfigurationAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_accessibilityStringsArrayPointer"));
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v12 = objc_msgSend(v11, "bytes");
  v13 = *(void **)(v12 + 32);
  v14 = *(void **)(v12 + 8);
  v15 = *(id *)(v12 + 24);
  v16 = v14;
  v17 = v13;
  __UIAXStringForVariables();
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

@end

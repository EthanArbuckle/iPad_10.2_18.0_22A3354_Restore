@implementation STSImageCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("STSImageCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STSImageCell"), CFSTR("imageInfo"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("STSAnimatedImageInfo"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STSAnimatedImageInfo"), CFSTR("duration"), "d", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73C8];
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  float v6;
  void *v7;
  void *v8;

  accessibilityLocalizedString(CFSTR("meme.label"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STSImageCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("imageInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4 || (objc_msgSend(v4, "safeFloatForKey:", CFSTR("duration")), v6 == 0.0))
  {
    v7 = 0;
  }
  else
  {
    AXDurationStringForDuration();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  __UIAXStringForVariables();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end

@implementation PUCropHandleViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PUCropHandleView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUCropHandleView"), CFSTR("handle"), "Q", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  unint64_t v2;
  __CFString *v3;

  v2 = -[PUCropHandleViewAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("handle"));
  if (v2 > 7)
  {
    v3 = &stru_24FF166E0;
  }
  else
  {
    accessibilityPULocalizedString(off_24FF152C8[v2]);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)accessibilityHint
{
  return accessibilityPULocalizedString(CFSTR("image.crop.hint"));
}

@end

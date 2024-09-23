@implementation CAMPanoramaArrowViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMPanoramaArrowView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("CAMPanoramaView"), CFSTR("_direction"), "q");
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;

  -[CAMPanoramaArrowViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", MEMORY[0x2348BFB60](CFSTR("CAMPanoramaView"), a2));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("_direction"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  if (v4 == 1)
  {
    v5 = CFSTR("left.to.right");
  }
  else
  {
    if (v4 != 2)
    {
      v6 = 0;
      goto LABEL_7;
    }
    v5 = CFSTR("right.to.left");
  }
  accessibilityCameraKitLocalizedString(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v6;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end

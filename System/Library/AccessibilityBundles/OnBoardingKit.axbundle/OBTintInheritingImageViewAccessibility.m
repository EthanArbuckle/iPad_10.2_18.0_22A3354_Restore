@implementation OBTintInheritingImageViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("OBTintInheritingImageView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  void *v2;
  void *v3;
  char v4;

  -[OBTintInheritingImageViewAccessibility isAccessibilityUserDefinedElement](self, "isAccessibilityUserDefinedElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

@end

@implementation QLMediaUIScrollViewAccessibility

- (BOOL)isDragging
{
  void *v3;
  _BOOL4 v4;
  objc_super v6;

  -[QLMediaUIScrollViewAccessibility accessibilityIdentification](self, "accessibilityIdentification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("MediaScrubber")))
  {
    v4 = -[QLMediaUIScrollViewAccessibility _axIsDragging](self, "_axIsDragging");

    if (v4)
      return -[QLMediaUIScrollViewAccessibility _axIsDragging](self, "_axIsDragging");
  }
  else
  {

  }
  v6.receiver = self;
  v6.super_class = (Class)QLMediaUIScrollViewAccessibility;
  return -[QLMediaUIScrollViewAccessibility isDragging](&v6, sel_isDragging);
}

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIScrollView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_axIsDragging
{
  return __UIAccessibilityGetAssociatedBool();
}

- (void)_axSetIsDragging:(BOOL)a3
{
  __UIAccessibilitySetAssociatedBool();
}

@end

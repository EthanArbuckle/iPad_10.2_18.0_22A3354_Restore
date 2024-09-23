@implementation QLVideoScrubberViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("QLVideoScrubberView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_axIsScrubbering
{
  return __UIAccessibilityGetAssociatedBool();
}

- (void)_axSetIsScrubbering:(BOOL)a3
{
  __UIAccessibilitySetAssociatedBool();
}

- (BOOL)isUserInteractingWithScrubber
{
  void *v3;
  _BOOL4 v4;
  objc_super v6;

  -[QLVideoScrubberViewAccessibility accessibilityIdentification](self, "accessibilityIdentification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("MediaScrubber")))
  {
    v4 = -[QLVideoScrubberViewAccessibility _axIsScrubbering](self, "_axIsScrubbering");

    if (v4)
      return -[QLVideoScrubberViewAccessibility _axIsScrubbering](self, "_axIsScrubbering");
  }
  else
  {

  }
  v6.receiver = self;
  v6.super_class = (Class)QLVideoScrubberViewAccessibility;
  return -[QLVideoScrubberViewAccessibility isUserInteractingWithScrubber](&v6, sel_isUserInteractingWithScrubber);
}

@end

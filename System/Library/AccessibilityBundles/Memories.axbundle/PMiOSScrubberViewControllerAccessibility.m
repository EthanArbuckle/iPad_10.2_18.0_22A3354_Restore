@implementation PMiOSScrubberViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PMiOSScrubberViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PMiOSScrubberViewController"), CFSTR("provider"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("PMScrubberProvider"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PMScrubberProvider"), CFSTR("currentDuration"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PMScrubberProvider"), CFSTR("currentProgress"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PMiOSScrubberViewController"), CFSTR("scrollViewDidScroll:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PMiOSScrubberViewController"), CFSTR("scrollViewDidEndDragging: willDecelerate:"), "v", "@", "B", 0);

}

- (double)_axLastScrolledTimeInterval
{
  double result;

  __UIAccessibilityGetAssociatedTimeInterval();
  return result;
}

- (void)_setAXLastScrolledTimeInterval:(double)a3
{
  __UIAccessibilitySetAssociatedTimeInterval();
}

- (void)scrollViewDidScroll:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PMiOSScrubberViewControllerAccessibility;
  -[PMiOSScrubberViewControllerAccessibility scrollViewDidScroll:](&v11, sel_scrollViewDidScroll_, a3);
  -[PMiOSScrubberViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("provider"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2348C07D8](CFSTR("PMScrubberProvider"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "safeTimeIntervalForKey:", CFSTR("currentDuration"));
    v6 = v5;
    objc_msgSend(v4, "safeCGFloatForKey:", CFSTR("currentProgress"));
    v8 = v6 * v7;
    -[PMiOSScrubberViewControllerAccessibility _axLastScrolledTimeInterval](self, "_axLastScrolledTimeInterval");
    if ((int)v8 - (int)v9 >= 15)
    {
      -[PMiOSScrubberViewControllerAccessibility _setAXLastScrolledTimeInterval:](self, "_setAXLastScrolledTimeInterval:", v8);
      if (v8 >= 0.0)
      {
        AXDurationStringForDuration();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        UIAccessibilitySpeak();

      }
    }
  }

}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PMiOSScrubberViewControllerAccessibility;
  -[PMiOSScrubberViewControllerAccessibility scrollViewDidEndDragging:willDecelerate:](&v5, sel_scrollViewDidEndDragging_willDecelerate_, a3, a4);
  -[PMiOSScrubberViewControllerAccessibility _setAXLastScrolledTimeInterval:](self, "_setAXLastScrolledTimeInterval:", -1.0);
}

@end

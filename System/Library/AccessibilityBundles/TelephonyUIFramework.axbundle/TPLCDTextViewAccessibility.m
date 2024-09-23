@implementation TPLCDTextViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TPLCDTextView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  void *v2;
  BOOL v3;

  -[TPLCDTextViewAccessibility accessibilityLabel](self, "accessibilityLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (CGRect)accessibilityFrame
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  -[TPLCDTextViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("textRect"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rectValue");

  -[TPLCDTextViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("sizeToFit"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sizeValue");

  UIAccessibilityFrameForBounds();
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (id)accessibilityLabel
{
  void *v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TPLCDTextViewAccessibility;
  -[TPLCDTextViewAccessibility accessibilityLabel](&v6, sel_accessibilityLabel);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "length"))
  {
    -[TPLCDTextViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("text"));
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  return v3;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF7410];
}

@end

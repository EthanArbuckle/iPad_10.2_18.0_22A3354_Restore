@implementation CEKWheelScrubberViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CEKWheelScrubberView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CEKWheelScrubberView"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CEKWheelScrubberView"), CFSTR("selectedIndex"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CEKWheelScrubberView"), CFSTR("markedIndex"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CEKWheelScrubberView"), CFSTR("switchToNextItem"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CEKWheelScrubberView"), CFSTR("switchToPreviousItem"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CEKSlider"), CFSTR("value"), "d", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CEKWheelScrubberView"), CFSTR("UIView"));

}

- (BOOL)_axIsFilterChooser
{
  void *v2;
  char isKindOfClass;

  -[CEKWheelScrubberViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2348BF7E0](CFSTR("PUFilterToolController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else
  {
    MEMORY[0x2348BF7E0](CFSTR("CAMViewfinderViewController"));
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (id)_axPhotoEffect
{
  void *v3;
  uint64_t v4;
  void *v5;

  -[CEKWheelScrubberViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CEKWheelScrubberViewAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("selectedIndex"));
  MEMORY[0x2348BF7E0](CFSTR("PUFilterToolController"));
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "_effectForIndex:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_axFilterAnnouncement
{
  void *v2;
  void *v3;
  void *v4;
  id argument;

  -[CEKWheelScrubberViewAccessibility _axPhotoEffect](self, "_axPhotoEffect");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = (void *)MEMORY[0x24BDFEA60];
    accessibilityCameraEditKitD2xLocalizedString(CFSTR("filter.intensity.hint"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "axAttributedStringWithString:", v4);
    argument = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(argument, "setAttribute:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDFEC18]);
    UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], argument);

  }
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)isPhotoStyleScrubber
{
  void *v2;
  char isKindOfClass;

  -[CEKWheelScrubberViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2348BF7E0](CFSTR("PhotosUIPrivate.PUPhotoStyleToolController"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)accessibilityLabel
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_super v7;

  -[CEKWheelScrubberViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2348BF7E0](CFSTR("PUFilterToolController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    accessibilityCameraEditKitD2xLocalizedString(CFSTR("filter.chooser"));
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else if (-[CEKWheelScrubberViewAccessibility isPhotoStyleScrubber](self, "isPhotoStyleScrubber"))
  {
    accessibilityCameraEditKitV2LocalizedString(CFSTR("styles.chooser"));
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CEKWheelScrubberViewAccessibility;
    -[CEKWheelScrubberViewAccessibility accessibilityLabel](&v7, sel_accessibilityLabel);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;

  return v5;
}

- (BOOL)accessibilityActivate
{
  objc_super v4;

  if (-[CEKWheelScrubberViewAccessibility isPhotoStyleScrubber](self, "isPhotoStyleScrubber"))
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)CEKWheelScrubberViewAccessibility;
  return -[CEKWheelScrubberViewAccessibility accessibilityActivate](&v4, sel_accessibilityActivate);
}

- (CGPoint)accessibilityActivationPoint
{
  BOOL v3;
  double v4;
  double v5;
  objc_super v6;
  CGPoint result;

  v3 = -[CEKWheelScrubberViewAccessibility isPhotoStyleScrubber](self, "isPhotoStyleScrubber");
  v4 = -1.0;
  v5 = -1.0;
  if (!v3)
  {
    v6.receiver = self;
    v6.super_class = (Class)CEKWheelScrubberViewAccessibility;
    -[CEKWheelScrubberViewAccessibility accessibilityActivationPoint](&v6, sel_accessibilityActivationPoint, -1.0, -1.0);
  }
  result.y = v5;
  result.x = v4;
  return result;
}

- (id)accessibilityValue
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v13;
  objc_super v14;

  -[CEKWheelScrubberViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CEKWheelScrubberViewAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("selectedIndex"));
  MEMORY[0x2348BF7E0](CFSTR("CAMViewfinderViewController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v5 = objc_msgSend(v3, "_filterTypeForItemIndex:", v4);
      if (v5 > 0x10)
        v6 = 0;
      else
        v6 = *(&off_24FEDD340 + v5);
    }
    else
    {
      v6 = CFSTR("none");
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("filter.%@"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    accessibilityCameraEditKitD2xLocalizedString(v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  MEMORY[0x2348BF7E0](CFSTR("PUFilterToolController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CEKWheelScrubberViewAccessibility _axPhotoFilterName](self, "_axPhotoFilterName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CEKWheelScrubberViewAccessibility _axPhotoEffect](self, "_axPhotoEffect");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "safeValueForKey:", CFSTR("_slider"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "safeCGFloatForKey:", CFSTR("value"));
      AXFormatFloatWithPercentage();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAXStringForVariables();
      v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_16:
LABEL_17:

      goto LABEL_18;
    }
    v11 = v7;
LABEL_15:
    v10 = v11;
    goto LABEL_16;
  }
  if (-[CEKWheelScrubberViewAccessibility isPhotoStyleScrubber](self, "isPhotoStyleScrubber"))
  {
    objc_msgSend(v3, "safeSwiftValueForKey:", CFSTR("styleLabel"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accessibilityLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v11 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  v14.receiver = self;
  v14.super_class = (Class)CEKWheelScrubberViewAccessibility;
  -[CEKWheelScrubberViewAccessibility accessibilityValue](&v14, sel_accessibilityValue);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:

  return v10;
}

- (id)_axPhotoFilterName
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;

  -[CEKWheelScrubberViewAccessibility _axPhotoEffect](self, "_axPhotoEffect");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "CIFilterName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("CIPhotoEffect3DVivid")) & 1) != 0)
    {
      v5 = CFSTR("vivid");
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("CIPhotoEffect3DVividWarm")) & 1) != 0)
    {
      v5 = CFSTR("vivid.warm");
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("CIPhotoEffect3DVividCool")) & 1) != 0)
    {
      v5 = CFSTR("vivid.cool");
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("CIPhotoEffect3DDramatic")) & 1) != 0)
    {
      v5 = CFSTR("dramatic");
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("CIPhotoEffect3DDramaticWarm")) & 1) != 0)
    {
      v5 = CFSTR("dramatic.warm");
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("CIPhotoEffect3DDramaticCool")) & 1) != 0)
    {
      v5 = CFSTR("dramatic.cool");
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("CIPhotoEffectMono")) & 1) != 0)
    {
      v5 = CFSTR("mono");
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("CIPhotoEffect3DSilverplate")) & 1) != 0)
    {
      v5 = CFSTR("silverplate");
    }
    else if (objc_msgSend(v4, "isEqualToString:", CFSTR("CIPhotoEffect3DNoir")))
    {
      v5 = CFSTR("noir");
    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = CFSTR("none");
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("filter.%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityCameraEditKitD2xLocalizedString(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)accessibilityHint
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CEKWheelScrubberViewAccessibility;
  -[CEKWheelScrubberViewAccessibility accessibilityHint](&v9, sel_accessibilityHint);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CEKWheelScrubberViewAccessibility _axIsFilterChooser](self, "_axIsFilterChooser"))
  {
    accessibilityCameraEditKitD2xLocalizedString(CFSTR("filter.adjustable.instructions"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[CEKWheelScrubberViewAccessibility _axPhotoEffect](self, "_axPhotoEffect");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      accessibilityCameraEditKitD2xLocalizedString(CFSTR("filter.intensity.hint"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAXStringForVariables();
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      return v6;
    }
    v3 = v4;
  }
  return v3;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CEKWheelScrubberViewAccessibility;
  v3 = -[CEKWheelScrubberViewAccessibility accessibilityTraits](&v8, sel_accessibilityTraits);
  v4 = -[CEKWheelScrubberViewAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("selectedIndex"));
  v5 = -[CEKWheelScrubberViewAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("markedIndex"));
  v6 = v3 & ~*MEMORY[0x24BDF7400];
  if (v4 == v5)
    v6 = *MEMORY[0x24BDF7400] | v3;
  return *MEMORY[0x24BDF73A0] | v6;
}

- (void)accessibilityIncrement
{
  AXPerformSafeBlock();
}

uint64_t __59__CEKWheelScrubberViewAccessibility_accessibilityIncrement__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "switchToNextItem");
  return objc_msgSend(*(id *)(a1 + 32), "_axFilterAnnouncement");
}

- (void)accessibilityDecrement
{
  AXPerformSafeBlock();
}

uint64_t __59__CEKWheelScrubberViewAccessibility_accessibilityDecrement__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "switchToPreviousItem");
  return objc_msgSend(*(id *)(a1 + 32), "_axFilterAnnouncement");
}

- (CGRect)accessibilityFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  objc_super v25;
  CGRect result;

  v25.receiver = self;
  v25.super_class = (Class)CEKWheelScrubberViewAccessibility;
  -[CEKWheelScrubberViewAccessibility accessibilityFrame](&v25, sel_accessibilityFrame);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKWheelScrubberViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("superview"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "convertRect:toView:", v12, v4, v6, v8, v10);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v21 = v14;
  v22 = v16;
  v23 = v18;
  v24 = v20;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (id)accessibilityPath
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;

  -[CEKWheelScrubberViewAccessibility accessibilityFrame](self, "accessibilityFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKWheelScrubberViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("superview"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "convertRect:fromView:", v12, v4, v6, v8, v10);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithRect:", v14, v16, v18, v20);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end

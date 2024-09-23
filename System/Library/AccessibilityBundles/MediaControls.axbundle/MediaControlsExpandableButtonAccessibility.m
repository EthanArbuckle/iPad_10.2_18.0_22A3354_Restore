@implementation MediaControlsExpandableButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MediaControlsExpandableButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MediaControlsExpandableButton"), CFSTR("setSelectedOptionIndex:"), "v", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MediaControlsExpandableButton"), CFSTR("setExpanded:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MediaControlsExpandableButton"), CFSTR("_buttons"), "NSMutableArray");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MediaControlsExpandableButton"), CFSTR("isExpanded"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MediaControlsExpandableButton"), CFSTR("titleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MediaControlsExpandableButton"), CFSTR("subtitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MediaControlsExpandableButton"), CFSTR("messageLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MediaControlsExpandableButton"), CFSTR("toggleEnabled"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MediaControlsExpandableButton"), CFSTR("_buttons"), "NSMutableArray");

}

- (BOOL)isAccessibilityElement
{
  return -[MediaControlsExpandableButtonAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isExpanded")) ^ 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[MediaControlsExpandableButtonAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("titleLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[MediaControlsExpandableButtonAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("subtitleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[MediaControlsExpandableButtonAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("messageLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  __UIAXStringForVariables();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2;
  int v3;
  uint64_t v4;

  v2 = *MEMORY[0x24BDF73B0];
  v3 = -[MediaControlsExpandableButtonAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("toggleEnabled"));
  v4 = *MEMORY[0x24BDF73E8];
  if (v3)
    v4 = 0;
  return v4 | v2;
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  return 1;
}

- (CGPoint)accessibilityActivationPoint
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;
  char v13;
  CGPoint result;

  v13 = 0;
  objc_opt_class();
  -[MediaControlsExpandableButtonAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("_buttons"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "accessibilityActivationPoint");
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)MediaControlsExpandableButtonAccessibility;
    -[MediaControlsExpandableButtonAccessibility accessibilityActivationPoint](&v12, sel_accessibilityActivationPoint);
  }
  v8 = v6;
  v9 = v7;

  v10 = v8;
  v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (void)setExpanded:(BOOL)a3
{
  UIAccessibilityNotifications v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MediaControlsExpandableButtonAccessibility;
  -[MediaControlsExpandableButtonAccessibility setExpanded:](&v7, sel_setExpanded_, a3);
  v4 = *MEMORY[0x24BDF72C8];
  -[MediaControlsExpandableButtonAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("_buttons"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v4, v6);

}

- (void)setSelectedOptionIndex:(int64_t)a3
{
  void *v5;
  _QWORD v6[5];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MediaControlsExpandableButtonAccessibility;
  -[MediaControlsExpandableButtonAccessibility setSelectedOptionIndex:](&v7, sel_setSelectedOptionIndex_);
  -[MediaControlsExpandableButtonAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("_buttons"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __69__MediaControlsExpandableButtonAccessibility_setSelectedOptionIndex___block_invoke;
  v6[3] = &__block_descriptor_40_e25_v32__0__NSObject_8Q16_B24l;
  v6[4] = a3;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v6);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);

}

void __69__MediaControlsExpandableButtonAccessibility_setSelectedOptionIndex___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v4 = *(_QWORD *)(a1 + 32);
  v7 = a2;
  v5 = objc_msgSend(v7, "accessibilityTraits");
  if (v4 == a3)
    v6 = *MEMORY[0x24BDF7400] | v5;
  else
    v6 = v5 & ~*MEMORY[0x24BDF7400];
  objc_msgSend(v7, "setAccessibilityTraits:", v6);

}

@end

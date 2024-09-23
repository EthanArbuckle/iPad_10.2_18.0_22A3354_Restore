@implementation UIShareGroupActivityCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIShareGroupActivityCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIShareGroupActivityCell"), CFSTR("titleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("UIShareGroupActivityCell"), CFSTR("titleSlotID"), "I");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIShareGroupActivityCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[UIShareGroupActivityCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (unsigned)_accessibilitySlotID
{
  return -[UIShareGroupActivityCellAccessibility safeUnsignedIntForKey:](self, "safeUnsignedIntForKey:", CFSTR("titleSlotID"));
}

- (id)_accessibilityAXAttributedLabel
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  if (-[UIShareGroupActivityCellAccessibility _accessibilitySlotID](self, "_accessibilitySlotID"))
  {
    v3 = objc_alloc(MEMORY[0x24BDFEA60]);
    accessibilityLocalizedString(CFSTR("sharing.activity"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithString:", v4);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[UIShareGroupActivityCellAccessibility _accessibilitySlotID](self, "_accessibilitySlotID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAttribute:forKey:", v6, *MEMORY[0x24BDFEC60]);
  }
  else
  {
    -[UIShareGroupActivityCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("titleLabel"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessibilityLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (CGRect)accessibilityFrame
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  UIShareGroupActivityCellAccessibility *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  objc_super v34;
  CGRect v35;
  CGRect result;

  if ((accessibilityIsPagesApp() & 1) == 0)
  {
    v34.receiver = self;
    v34.super_class = (Class)UIShareGroupActivityCellAccessibility;
    -[UIShareGroupActivityCellAccessibility accessibilityFrame](&v34, sel_accessibilityFrame);
  }
  -[UIShareGroupActivityCellAccessibility accessibilityUserDefinedFrame](self, "accessibilityUserDefinedFrame");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "rectValue");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
  }
  else
  {
    v13 = self;
    -[UIShareGroupActivityCellAccessibility bounds](v13, "bounds");
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;
    -[UIShareGroupActivityCellAccessibility _accessibilityFrameExpansion](v13, "_accessibilityFrameExpansion");
    v23 = -v22;
    v25 = -v24;
    v35.origin.x = v15;
    v35.origin.y = v17;
    v35.size.width = v19;
    v35.size.height = v21;
    CGRectInset(v35, v23, v25);
    UIAccessibilityFrameForBounds();
    v6 = v26;
    v8 = v27;
    v10 = v28;
    v12 = v29;

  }
  v30 = v6;
  v31 = v8;
  v32 = v10;
  v33 = v12;
  result.size.height = v33;
  result.size.width = v32;
  result.origin.y = v31;
  result.origin.x = v30;
  return result;
}

@end

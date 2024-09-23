@implementation SummaryBurnBarViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SeymourUI.SummaryBurnBarView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SeymourUI.SummaryBurnBarView"), CFSTR("updateBurnBarAccessibility:personalScore:low:lowMiddle:highMiddle:high:"), "v", "@", "f", "f", "f", "f", "f", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v7.receiver = self;
  v7.super_class = (Class)SummaryBurnBarViewAccessibility;
  -[SummaryBurnBarViewAccessibility _accessibilityLoadAccessibilityInformation](&v7, sel__accessibilityLoadAccessibilityInformation);
  accessibilityLocalizedString(CFSTR("burn.bar.title"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("no.data"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  v8[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  AXLabelForElements();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SummaryBurnBarViewAccessibility setAccessibilityLabel:](self, "setAccessibilityLabel:", v6);

}

- (void)updateBurnBarAccessibility:(id)a3 personalScore:(float)a4 low:(float)a5 lowMiddle:(float)a6 highMiddle:(float)a7 high:(float)a8
{
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)SummaryBurnBarViewAccessibility;
  v14 = a3;
  *(float *)&v15 = a4;
  *(float *)&v16 = a5;
  *(float *)&v17 = a6;
  *(float *)&v18 = a7;
  *(float *)&v19 = a8;
  -[SummaryBurnBarViewAccessibility updateBurnBarAccessibility:personalScore:low:lowMiddle:highMiddle:high:](&v32, sel_updateBurnBarAccessibility_personalScore_low_lowMiddle_highMiddle_high_, v14, v15, v16, v17, v18, v19);
  accessibilityLocalizedString(CFSTR("burn.bar.title"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v21 = a4;
  *(float *)&v22 = a5;
  *(float *)&v23 = a6;
  *(float *)&v24 = a7;
  *(float *)&v25 = a8;
  _accessibilityStringForBurnBarPosition(-[SummaryBurnBarViewAccessibility _positionForPersonalScore:low:lowMiddle:highMiddle:high:](self, "_positionForPersonalScore:low:lowMiddle:highMiddle:high:", v21, v22, v23, v24, v25), 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("burn.bar.community.scores"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "stringWithFormat:", v28, (int)a5, (int)a8, (int)a6, (int)a7, v32.receiver, v32.super_class);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE30], "axArrayByIgnoringNilElementsWithCount:", 4, v20, v14, v26, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  AXLabelForElements();
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[SummaryBurnBarViewAccessibility setAccessibilityLabel:](self, "setAccessibilityLabel:", v31);

}

- (int64_t)_positionForPersonalScore:(float)a3 low:(float)a4 lowMiddle:(float)a5 highMiddle:(float)a6 high:(float)a7
{
  if (a3 < a4)
    return 0;
  if (a3 < a5)
    return 1;
  if (a3 < a6)
    return 2;
  if (a3 >= a7)
    return 4 * (a3 >= a7);
  return 3;
}

@end

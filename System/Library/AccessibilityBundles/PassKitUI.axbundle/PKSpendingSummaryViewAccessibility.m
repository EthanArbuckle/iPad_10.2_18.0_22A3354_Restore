@implementation PKSpendingSummaryViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKSpendingSummaryView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKSpendingSummaryView"), CFSTR("_chartView"), "PKSpendingSummaryChartView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKSpendingSummaryView"), CFSTR("_arrowImageView"), "UIImageView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKSpendingSummaryView"), CFSTR("_spendingLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKSpendingSummaryView"), CFSTR("_totalAmount"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKSpendingSummaryView"), CFSTR("_upArrow"), "UIImage");

}

- (id)accessibilityElements
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  _QWORD v11[5];
  id v12;
  id location;

  -[PKSpendingSummaryViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("axElement"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF67A0]), "initWithAccessibilityContainer:", self);
    -[PKSpendingSummaryViewAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v3, CFSTR("axElement"));
    objc_initWeak(&location, self);
    v4 = MEMORY[0x24BDAC760];
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __59__PKSpendingSummaryViewAccessibility_accessibilityElements__block_invoke;
    v11[3] = &unk_2502E3EE0;
    v11[4] = self;
    objc_copyWeak(&v12, &location);
    objc_msgSend(v3, "_setAccessibilityLabelBlock:", v11);
    v9[0] = v4;
    v9[1] = 3221225472;
    v9[2] = __59__PKSpendingSummaryViewAccessibility_accessibilityElements__block_invoke_2;
    v9[3] = &unk_2502E3DE8;
    objc_copyWeak(&v10, &location);
    objc_msgSend(v3, "_setAccessibilityFrameBlock:", v9);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  v5 = (void *)MEMORY[0x24BDBCE30];
  -[PKSpendingSummaryViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_chartView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "axArrayByIgnoringNilElementsWithCount:", 2, v3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __59__PKSpendingSummaryViewAccessibility_accessibilityElements__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  id *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v15;

  objc_msgSend(*(id *)(a1 + 32), "safeUIViewForKey:", CFSTR("_upOrDownImage"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_accessibilityViewIsVisible");

  if (v3)
  {
    objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "safeUIViewForKey:", CFSTR("_arrowImageView"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "image");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "valueForKey:", CFSTR("_upArrow"));

  }
  v7 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "safeUIViewForKey:", CFSTR("_spendingLabel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accessibilityLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_loadWeakRetained(v7);
  objc_msgSend(v11, "safeUIViewForKey:", CFSTR("_totalAmount"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "accessibilityLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

double __59__PKSpendingSummaryViewAccessibility_accessibilityElements__block_invoke_2(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  id v12;
  void *v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  double v18;
  CGRect v20;
  CGRect v21;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeUIViewForKey:", CFSTR("_spendingLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityFrame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = objc_loadWeakRetained(v1);
  objc_msgSend(v12, "safeUIViewForKey:", CFSTR("_totalAmount"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "accessibilityFrame");
  v21.origin.x = v14;
  v21.origin.y = v15;
  v21.size.width = v16;
  v21.size.height = v17;
  v20.origin.x = v5;
  v20.origin.y = v7;
  v20.size.width = v9;
  v20.size.height = v11;
  *(_QWORD *)&v18 = (unint64_t)CGRectUnion(v20, v21);

  return v18;
}

@end

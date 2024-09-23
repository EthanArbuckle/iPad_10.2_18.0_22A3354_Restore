@implementation PKApplyOfferCreditCardViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKApplyOfferCreditCardView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKApplyOfferCreditCardView"), CFSTR("_creditLimitTitleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKApplyOfferCreditCardView"), CFSTR("_creditLimitLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKApplyOfferCreditCardView"), CFSTR("_aprForPurchaseTitleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKApplyOfferCreditCardView"), CFSTR("_aprForPurchaseLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKApplyOfferCreditCardView"), CFSTR("_feeTitleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKApplyOfferCreditCardView"), CFSTR("_feeLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKApplyOfferCreditCardView"), CFSTR("_bodyLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKApplyOfferCreditCardView"), CFSTR("_termsLinkButton"), "UIButton");

}

- (PKApplyOfferCreditCardViewAccessibility)init
{
  PKApplyOfferCreditCardViewAccessibility *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKApplyOfferCreditCardViewAccessibility;
  v2 = -[PKApplyOfferCreditCardViewAccessibility init](&v4, sel_init);
  -[PKApplyOfferCreditCardViewAccessibility _accessibilityLoadAccessibilityInformation](v2, "_accessibilityLoadAccessibilityInformation");

  return v2;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  objc_super v34;

  v34.receiver = self;
  v34.super_class = (Class)PKApplyOfferCreditCardViewAccessibility;
  -[PKApplyOfferCreditCardViewAccessibility _accessibilityLoadAccessibilityInformation](&v34, sel__accessibilityLoadAccessibilityInformation);
  v3 = objc_alloc(MEMORY[0x24BEBADA8]);
  v4 = (void *)MEMORY[0x24BDBCE30];
  -[PKApplyOfferCreditCardViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_creditLimitTitleLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKApplyOfferCreditCardViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_creditLimitLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "axArrayByIgnoringNilElementsWithCount:", 2, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithAccessibilityContainer:representedElements:", self, v7);

  v9 = objc_alloc(MEMORY[0x24BEBADA8]);
  v10 = (void *)MEMORY[0x24BDBCE30];
  -[PKApplyOfferCreditCardViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_aprForPurchaseTitleLabel"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKApplyOfferCreditCardViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_aprForPurchaseLabel"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "axArrayByIgnoringNilElementsWithCount:", 2, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v9, "initWithAccessibilityContainer:representedElements:", self, v13);

  v15 = objc_alloc(MEMORY[0x24BEBADA8]);
  v16 = (void *)MEMORY[0x24BDBCE30];
  -[PKApplyOfferCreditCardViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_feeTitleLabel"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKApplyOfferCreditCardViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_feeLabel"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "axArrayByIgnoringNilElementsWithCount:", 2, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v15, "initWithAccessibilityContainer:representedElements:", self, v19);

  -[PKApplyOfferCreditCardViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_bodyLabel"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKApplyOfferCreditCardViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_termsLinkButton"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __85__PKApplyOfferCreditCardViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v28[3] = &unk_2502E3A20;
  v29 = v8;
  v30 = v14;
  v31 = v20;
  v32 = v21;
  v33 = v22;
  v23 = v22;
  v24 = v21;
  v25 = v20;
  v26 = v14;
  v27 = v8;
  -[PKApplyOfferCreditCardViewAccessibility _setAccessibilityElementsBlock:](self, "_setAccessibilityElementsBlock:", v28);

}

uint64_t __85__PKApplyOfferCreditCardViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(_QWORD *a1)
{
  return objc_msgSend(MEMORY[0x24BDBCE30], "axArrayByIgnoringNilElementsWithCount:", 5, a1[4], a1[5], a1[6], a1[7], a1[8]);
}

@end

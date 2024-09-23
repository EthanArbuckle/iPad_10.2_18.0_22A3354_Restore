@implementation PKPassGroupStackViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKPassGroupStackView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKPassGroupStackView"), CFSTR("_headerContainerView"), "PKPassthroughView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKPassGroupStackView"), CFSTR("_subheaderContainerView"), "PKPassthroughView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKPassGroupStackView"), CFSTR("_passContainerView"), "PKPassthroughView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPassGroupStackView"), CFSTR("initWithFrame:"), "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);

}

- (PKPassGroupStackViewAccessibility)initWithFrame:(CGRect)a3
{
  PKPassGroupStackViewAccessibility *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPassGroupStackViewAccessibility;
  v3 = -[PKPassGroupStackViewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[PKPassGroupStackViewAccessibility _accessibilityLoadAccessibilityInformation](v3, "_accessibilityLoadAccessibilityInformation");

  return v3;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKPassGroupStackViewAccessibility;
  -[PKPassGroupStackViewAccessibility _accessibilityLoadAccessibilityInformation](&v9, sel__accessibilityLoadAccessibilityInformation);
  -[PKPassGroupStackViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_headerContainerView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityViewIsModal:", 0);

  -[PKPassGroupStackViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_subheaderContainerView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityViewIsModal:", 0);

  -[PKPassGroupStackViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_passContainerView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityViewIsModal:", 0);

  -[PKPassGroupStackViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_headerContainerView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityIdentifier:", CFSTR("HeaderContainerView"));

  -[PKPassGroupStackViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_subheaderContainerView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessibilityIdentifier:", CFSTR("SubheaderContainerView"));

  -[PKPassGroupStackViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_passContainerView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAccessibilityIdentifier:", CFSTR("PassContainerView"));

}

- (void)setPresentationState:(int)a3 animated:(BOOL)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPassGroupStackViewAccessibility;
  -[PKPassGroupStackViewAccessibility setPresentationState:animated:](&v4, sel_setPresentationState_animated_, *(_QWORD *)&a3, a4);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

- (void)setModalGroupIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[PKPassGroupStackViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_modallyPresentedGroupView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityViewIsModal:", 0);

  v16.receiver = self;
  v16.super_class = (Class)PKPassGroupStackViewAccessibility;
  -[PKPassGroupStackViewAccessibility setModalGroupIndex:](&v16, sel_setModalGroupIndex_, a3);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[PKPassGroupStackViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_groupViewsByGroupID"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "setAccessibilityViewIsModal:", 0);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    }
    while (v9);
  }

}

@end

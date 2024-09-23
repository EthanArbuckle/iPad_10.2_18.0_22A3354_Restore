@implementation RUIWebContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("RUIWebContainerView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("RUIWebContainerView"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("RUIWebContainerView"), CFSTR("webView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("RUITableViewRow"), CFSTR("linkedPage"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("RUITableViewRow"), CFSTR("tableCell"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("RemoteUITableViewCell"), CFSTR("remoteUIAccessoryType"), "q", 0);

}

- (BOOL)isAccessibilityElement
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  objc_super v8;

  -[RUIWebContainerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "attributes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("class"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("htmlLink"));

  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)RUIWebContainerViewAccessibility;
    v6 = -[RUIWebContainerViewAccessibility isAccessibilityElement](&v8, sel_isAccessibilityElement);
  }

  return v6;
}

- (id)_axSubviewText
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[RUIWebContainerViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("webView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBADC8], "defaultVoiceOverOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityLeafDescendantsWithOptions:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2348C2730]();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (CGPoint)accessibilityActivationPoint
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  objc_super v17;
  CGPoint result;

  -[RUIWebContainerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RUIWebContainerViewAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("delegate.tableCell.remoteUIAccessoryType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "intValue");

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_6;
  objc_msgSend(v3, "safeValueForKey:", CFSTR("linkedPage"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    goto LABEL_6;
  if (v5 == 1
    && (-[RUIWebContainerViewAccessibility accessibilityContainer](self, "accessibilityContainer"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "_accessibilityFindSubviewDescendant:", &__block_literal_global_0),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v8))
  {
    objc_msgSend(v8, "accessibilityActivationPoint");
    v10 = v9;
    v12 = v11;

  }
  else
  {
LABEL_6:
    v17.receiver = self;
    v17.super_class = (Class)RUIWebContainerViewAccessibility;
    -[RUIWebContainerViewAccessibility accessibilityActivationPoint](&v17, sel_accessibilityActivationPoint);
    v10 = v13;
    v12 = v14;
  }

  v15 = v10;
  v16 = v12;
  result.y = v16;
  result.x = v15;
  return result;
}

uint64_t __64__RUIWebContainerViewAccessibility_accessibilityActivationPoint__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  MEMORY[0x2348C2724](CFSTR("_UITableCellAccessoryButton"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)accessibilityLabel
{
  void *v3;
  objc_super v5;

  if (-[RUIWebContainerViewAccessibility isAccessibilityElement](self, "isAccessibilityElement"))
  {
    -[RUIWebContainerViewAccessibility _axSubviewText](self, "_axSubviewText");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)RUIWebContainerViewAccessibility;
    -[RUIWebContainerViewAccessibility accessibilityLabel](&v5, sel_accessibilityLabel);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (float)_accessibilityActivationDelay
{
  float result;
  objc_super v4;

  if (-[RUIWebContainerViewAccessibility isAccessibilityElement](self, "isAccessibilityElement"))
    return 0.15;
  v4.receiver = self;
  v4.super_class = (Class)RUIWebContainerViewAccessibility;
  -[RUIWebContainerViewAccessibility _accessibilityActivationDelay](&v4, sel__accessibilityActivationDelay);
  return result;
}

- (unint64_t)accessibilityTraits
{
  objc_super v4;

  if (-[RUIWebContainerViewAccessibility isAccessibilityElement](self, "isAccessibilityElement"))
    return *MEMORY[0x24BDF73B0];
  v4.receiver = self;
  v4.super_class = (Class)RUIWebContainerViewAccessibility;
  return -[RUIWebContainerViewAccessibility accessibilityTraits](&v4, sel_accessibilityTraits);
}

@end

@implementation SiriRestaurantsDetailViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SiriRestaurantsDetailViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_configurePhoneCell:(id)a3 forItem:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  objc_super v9;

  v6 = a3;
  objc_msgSend(v6, "setIsAccessibilityElement:", 1);
  objc_msgSend(v6, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);
  v9.receiver = self;
  v9.super_class = (Class)SiriRestaurantsDetailViewControllerAccessibility;
  -[SiriRestaurantsDetailViewControllerAccessibility _configurePhoneCell:forItem:](&v9, sel__configurePhoneCell_forItem_, v6, a4);
  objc_msgSend(v6, "safeValueForKey:", CFSTR("textLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accessibilityLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityLabel:", v8);

}

- (void)_configureURLCell:(id)a3 forItem:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  objc_super v9;

  v6 = a3;
  objc_msgSend(v6, "setIsAccessibilityElement:", 1);
  objc_msgSend(v6, "setAccessibilityTraits:", *MEMORY[0x24BDF73D8]);
  v9.receiver = self;
  v9.super_class = (Class)SiriRestaurantsDetailViewControllerAccessibility;
  -[SiriRestaurantsDetailViewControllerAccessibility _configureURLCell:forItem:](&v9, sel__configureURLCell_forItem_, v6, a4);
  objc_msgSend(v6, "safeValueForKey:", CFSTR("textLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accessibilityLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityLabel:", v8);

}

- (void)_configureReviewsCell:(id)a3 forItem:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v6 = a3;
  objc_msgSend(v6, "setIsAccessibilityElement:", 1);
  objc_msgSend(v6, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);
  v12.receiver = self;
  v12.super_class = (Class)SiriRestaurantsDetailViewControllerAccessibility;
  -[SiriRestaurantsDetailViewControllerAccessibility _configureReviewsCell:forItem:](&v12, sel__configureReviewsCell_forItem_, v6, a4);
  objc_msgSend(v6, "_accessibilityFindSubviewDescendant:", &__block_literal_global_0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accessibilityLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeValueForKey:", CFSTR("textLabel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accessibilityLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityLabel:", v11, v10, CFSTR("__AXStringForVariablesSentinel"));

}

uint64_t __82__SiriRestaurantsDetailViewControllerAccessibility__configureReviewsCell_forItem___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  NSClassFromString(CFSTR("SiriUIStarsView"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end

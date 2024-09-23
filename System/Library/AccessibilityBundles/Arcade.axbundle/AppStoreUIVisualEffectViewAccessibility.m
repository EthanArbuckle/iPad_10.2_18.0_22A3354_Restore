@implementation AppStoreUIVisualEffectViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIVisualEffectView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("AppStore.ArticlePagePresentationController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITransitionView"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("AppStore.ArticlePagePresentationController"), CFSTR("UIPresentationController"));

}

- (BOOL)isArticleBackgroundView
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;

  -[AppStoreUIVisualEffectViewAccessibility _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[AppStoreUIVisualEffectViewAccessibility safeCGRectForKey:](self, "safeCGRectForKey:", CFSTR("frame"));
  v5 = v4;
  v7 = v6;
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;
  v12 = v11;

  return v7 == v12 && v5 == v10;
}

uint64_t __66__AppStoreUIVisualEffectViewAccessibility_isArticleBackgroundView__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "safeValueForKey:", CFSTR("delegate"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x23490667C](CFSTR("AppStore.ArticlePagePresentationController"));
    isKindOfClass = objc_opt_isKindOfClass();

  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (BOOL)isAccessibilityElement
{
  objc_super v4;

  if (-[AppStoreUIVisualEffectViewAccessibility isArticleBackgroundView](self, "isArticleBackgroundView"))
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)AppStoreUIVisualEffectViewAccessibility;
  return -[AppStoreUIVisualEffectViewAccessibility isAccessibilityElement](&v4, sel_isAccessibilityElement);
}

- (int64_t)accessibilityContainerType
{
  objc_super v4;

  if (-[AppStoreUIVisualEffectViewAccessibility isArticleBackgroundView](self, "isArticleBackgroundView"))
    return 4;
  v4.receiver = self;
  v4.super_class = (Class)AppStoreUIVisualEffectViewAccessibility;
  return -[AppStoreUIVisualEffectViewAccessibility accessibilityContainerType](&v4, sel_accessibilityContainerType);
}

- (id)accessibilityLabel
{
  void *v3;
  objc_super v5;

  if (-[AppStoreUIVisualEffectViewAccessibility isArticleBackgroundView](self, "isArticleBackgroundView"))
  {
    accessibilityAppStoreLocalizedString(CFSTR("popover.view.dismiss.article"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)AppStoreUIVisualEffectViewAccessibility;
    -[AppStoreUIVisualEffectViewAccessibility accessibilityLabel](&v5, sel_accessibilityLabel);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)accessibilityIdentifier
{
  objc_super v4;

  if (-[AppStoreUIVisualEffectViewAccessibility isArticleBackgroundView](self, "isArticleBackgroundView"))
    return CFSTR("PopoverDismissArticle");
  v4.receiver = self;
  v4.super_class = (Class)AppStoreUIVisualEffectViewAccessibility;
  -[AppStoreUIVisualEffectViewAccessibility accessibilityIdentifier](&v4, sel_accessibilityIdentifier);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)accessibilityHint
{
  void *v3;
  objc_super v5;

  if (-[AppStoreUIVisualEffectViewAccessibility isArticleBackgroundView](self, "isArticleBackgroundView"))
  {
    accessibilityAppStoreLocalizedString(CFSTR("popover.view.dismiss.article.hint"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)AppStoreUIVisualEffectViewAccessibility;
    -[AppStoreUIVisualEffectViewAccessibility accessibilityHint](&v5, sel_accessibilityHint);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)accessibilityUserInputLabels
{
  void *v2;
  void *v3;

  accessibilityAppStoreLocalizedString(CFSTR("popover.view.dismiss.article.user.input"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x234906688]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)accessibilityActivate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[AppStoreUIVisualEffectViewAccessibility _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_211, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "safeValueForKey:", CFSTR("presentedViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);

  return 1;
}

uint64_t __64__AppStoreUIVisualEffectViewAccessibility_accessibilityActivate__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "safeValueForKey:", CFSTR("delegate"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x23490667C](CFSTR("AppStore.ArticlePagePresentationController"));
    isKindOfClass = objc_opt_isKindOfClass();

  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

@end

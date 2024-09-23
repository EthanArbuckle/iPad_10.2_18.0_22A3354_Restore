@implementation SBUITextEffectsRemoteViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UITextEffectsRemoteView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("SBTodayViewController"));
  objc_msgSend(v3, "validateClass:", CFSTR("_WGWidgetRemoteViewController"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("_UITextEffectsRemoteView"), CFSTR("_UIRemoteView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIRemoteView"), CFSTR("remoteViewController"), "@", 0);

}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;
  char v9;

  v9 = 0;
  objc_opt_class();
  -[SBUITextEffectsRemoteViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("remoteViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_15, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    return 0;
  v8.receiver = self;
  v8.super_class = (Class)SBUITextEffectsRemoteViewAccessibility;
  -[SBUITextEffectsRemoteViewAccessibility accessibilityElements](&v8, sel_accessibilityElements);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __63__SBUITextEffectsRemoteViewAccessibility_accessibilityElements__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;

  objc_msgSend(a2, "_accessibilityViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("SBTodayViewController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else
  {
    NSClassFromString(CFSTR("_WGWidgetRemoteViewController"));
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

@end

@implementation CSFocusActivityIndicatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CSFocusActivityIndicator");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSFocusActivityIndicator"), CFSTR("activity"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CSFocusActivityIndicator"), CFSTR("_previousActivity"), "<FCActivityDescribing>");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSFocusActivityView"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateProtocol:hasMethod:isInstanceMethod:isRequired:", CFSTR("FCActivityDescribing"), CFSTR("activityDisplayName"), 1, 1);
  objc_msgSend(v3, "validateProtocol:hasMethod:isInstanceMethod:isRequired:", CFSTR("CSFocusActivityViewDelegate"), CFSTR("focusActivityViewIndicatorPressed:"), 1, 1);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[CSFocusActivityIndicatorAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("activity"));
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    accessibilityLocalizedString(CFSTR("focus.on"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    accessibilityLocalizedString(CFSTR("focus.off"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSFocusActivityIndicatorAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_previousActivity"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v4, "safeStringForKey:", CFSTR("activityDisplayName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73E0];
}

- (id)accessibilityCustomActions
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  id location;

  objc_initWeak(&location, self);
  v2 = objc_alloc(MEMORY[0x24BDF6788]);
  accessibilityLocalizedString(CFSTR("open.focus.settings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __67__CSFocusActivityIndicatorAccessibility_accessibilityCustomActions__block_invoke;
  v7[3] = &unk_2501EDCD8;
  objc_copyWeak(&v8, &location);
  v4 = (void *)objc_msgSend(v2, "initWithName:actionHandler:", v3, v7);

  objc_msgSend(MEMORY[0x24BDBCE30], "axArrayByIgnoringNilElementsWithCount:", 1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
  return v5;
}

uint64_t __67__CSFocusActivityIndicatorAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v5;

  v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  AXPerformSafeBlock();
  objc_destroyWeak(&v5);

  return 1;
}

void __67__CSFocusActivityIndicatorAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  id *v1;
  void *v2;
  void *v3;
  id v4;
  id WeakRetained;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "accessibilityContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("_delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "focusActivityViewIndicatorPressed:", v4);

}

@end

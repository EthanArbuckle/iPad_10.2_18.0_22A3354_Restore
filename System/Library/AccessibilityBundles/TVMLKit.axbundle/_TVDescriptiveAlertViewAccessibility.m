@implementation _TVDescriptiveAlertViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_TVDescriptiveAlertView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("_TVDescriptiveAlertView"), CFSTR("_viewsAboveScrollView"), "NSArray");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_TVDescriptiveAlertView"), CFSTR("setChildViews:"), "v", "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  char v16;
  objc_super v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v17.receiver = self;
  v17.super_class = (Class)_TVDescriptiveAlertViewAccessibility;
  -[_TVDescriptiveAlertViewAccessibility _accessibilityLoadAccessibilityInformation](&v17, sel__accessibilityLoadAccessibilityInformation);
  v16 = 0;
  objc_opt_class();
  -[_TVDescriptiveAlertViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_viewsAboveScrollView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    v9 = *MEMORY[0x24BDF73C0];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        NSClassFromString(CFSTR("TVLabel"));
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v11, "setAccessibilityTraits:", v9, (_QWORD)v12);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
    }
    while (v7);
  }

}

- (void)setChildViews:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_TVDescriptiveAlertViewAccessibility;
  -[_TVDescriptiveAlertViewAccessibility setChildViews:](&v4, sel_setChildViews_, a3);
  -[_TVDescriptiveAlertViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end

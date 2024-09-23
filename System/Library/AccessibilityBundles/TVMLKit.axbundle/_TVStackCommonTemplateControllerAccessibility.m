@implementation _TVStackCommonTemplateControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_TVStackCommonTemplateController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("_TVLabel"));
  objc_msgSend(v3, "validateClass:", CFSTR("_TVStackWrappingView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_TVStackWrappingView"), CFSTR("headerSupplementaryViews"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_TVStackCommonTemplateController"), CFSTR("stackWrappingView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_TVStackCommonTemplateController"), CFSTR("_updateViewSupplementaryViews"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_TVStackCommonTemplateController"), CFSTR("viewControllerWithElement:layout:existingController:"), "@", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("IKViewElement"), CFSTR("elementName"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  char v18;
  objc_super v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v19.receiver = self;
  v19.super_class = (Class)_TVStackCommonTemplateControllerAccessibility;
  -[_TVStackCommonTemplateControllerAccessibility _accessibilityLoadAccessibilityInformation](&v19, sel__accessibilityLoadAccessibilityInformation);
  -[_TVStackCommonTemplateControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("stackWrappingView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_opt_class();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("headerSupplementaryViews"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    v10 = *MEMORY[0x24BDF73C0];
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        NSClassFromString(CFSTR("_TVSeparatorView"));
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(v12, "_accessibilityTextForSubhierarchyIncludingHeaders:focusableItems:exclusions:", 0, 1, 0, (_QWORD)v14);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "length"))
          {
            objc_msgSend(v12, "setIsAccessibilityElement:", 1);
            objc_msgSend(v12, "setAccessibilityTraits:", v10);
            objc_msgSend(v12, "setAccessibilityLabel:", v13);
          }
          else
          {
            objc_msgSend(v12, "setIsAccessibilityElement:", 0);
          }

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    }
    while (v8);
  }

}

- (void)_updateViewSupplementaryViews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_TVStackCommonTemplateControllerAccessibility;
  -[_TVStackCommonTemplateControllerAccessibility _updateViewSupplementaryViews](&v3, sel__updateViewSupplementaryViews);
  -[_TVStackCommonTemplateControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end

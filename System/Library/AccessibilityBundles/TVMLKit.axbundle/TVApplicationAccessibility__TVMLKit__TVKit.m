@implementation TVApplicationAccessibility__TVMLKit__TVKit

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TVApplication");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  _QWORD *v3;
  uint64_t v4;
  id v5;

  v3 = (_QWORD *)MEMORY[0x24BE00448];
  v4 = *MEMORY[0x24BE00448];
  v5 = a3;
  objc_msgSend(v5, "client:validateClass:", v4, CFSTR("TVAppDelegate"));
  objc_msgSend(v5, "client:validateClass:", *v3, CFSTR("TVApplication"));
  objc_msgSend(v5, "client:validateClass:", *v3, CFSTR("_TVAppDocumentController"));
  objc_msgSend(v5, "client:validateClass:hasInstanceMethod:withFullSignature:", *v3, CFSTR("TVAppDelegate"), CFSTR("window"), "@", 0);
  objc_msgSend(v5, "client:validateClass:isKindOfClass:", *v3, CFSTR("TVApplication"), CFSTR("UIApplication"));
  objc_msgSend(v5, "client:validateClass:hasInstanceMethod:withFullSignature:", *v3, CFSTR("_TVAppDocumentController"), CFSTR("templateViewController"), "@", 0);

}

- (id)_atvaccessibilitySemanticContextCustomActions
{
  void *v2;
  void *v3;

  -[TVApplicationAccessibility__TVMLKit__TVKit _atvaccessibilityTabBarViewController](self, "_atvaccessibilityTabBarViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "_atvaccessibilityTabBarCustomActions");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)_atvaccessibilityTabBarViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_opt_class();
  -[TVApplicationAccessibility__TVMLKit__TVKit safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("window"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "rootViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "childViewControllers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  NSClassFromString(CFSTR("_TVAppDocumentController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "safeValueForKey:", CFSTR("templateViewController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSClassFromString(CFSTR("_TVLoadingViewController"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = 0;
    }
    else
    {
      objc_opt_class();
      __UIAccessibilityCastAsClass();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end

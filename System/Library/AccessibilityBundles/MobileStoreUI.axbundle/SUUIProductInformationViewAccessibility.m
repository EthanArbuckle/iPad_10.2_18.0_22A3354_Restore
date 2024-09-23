@implementation SUUIProductInformationViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUUIProductInformationView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SUUIProductInformationView"), CFSTR("_titleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SUUIProductInformationView"), CFSTR("_keyLabels"), "NSMutableArray");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SUUIProductInformationView"), CFSTR("_valueLabels"), "NSMutableArray");

}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;

  -[SUUIProductInformationViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", *MEMORY[0x24BEBB308]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIProductInformationViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_titleLabel"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0]);
    v17 = v4;
    objc_msgSend(v3, "axSafelyAddObject:", v4);
    -[SUUIProductInformationViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_keyLabels"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIProductInformationViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_valueLabels"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "count");
    if (v7 != objc_msgSend(v6, "count"))
      _AXAssert();
    v8 = objc_msgSend(v5, "count");
    v9 = objc_msgSend(v6, "count");
    if (v8 >= v9)
      v10 = v9;
    else
      v10 = v8;
    if (v10)
    {
      for (i = 0; i != v10; ++i)
      {
        objc_msgSend(v5, "objectAtIndex:", i);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectAtIndex:", i);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCE30], "axArrayByIgnoringNilElementsWithCount:", 2, v12, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBADA8]), "initWithAccessibilityContainer:representedElements:", self, v14);
        objc_msgSend(v3, "addObject:", v15);

      }
    }
    -[SUUIProductInformationViewAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v3, *MEMORY[0x24BEBB308]);

  }
  return v3;
}

@end

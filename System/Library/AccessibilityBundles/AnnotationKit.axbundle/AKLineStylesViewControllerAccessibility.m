@implementation AKLineStylesViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AKLineStylesViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AKLineStylesViewController"), CFSTR("tableView: cellForRowAtIndexPath:"), "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AKLineStylesViewController"), CFSTR("currentLineWidthTag"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AKLineStylesViewController"), CFSTR("lineWidthTags"), "@", 0);

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)AKLineStylesViewControllerAccessibility;
  -[AKLineStylesViewControllerAccessibility tableView:cellForRowAtIndexPath:](&v21, sel_tableView_cellForRowAtIndexPath_, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIsAccessibilityElement:", 1);
  objc_opt_class();
  -[AKLineStylesViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("lineWidthTags"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v7, "row");
  if (v11 < objc_msgSend(v10, "count"))
  {
    objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v7, "row"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "integerValue");

    v14 = -[AKLineStylesViewControllerAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("currentLineWidthTag"));
    v15 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("stroke.thickness.value"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v13 - 765000);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAccessibilityLabel:", v18);

    v19 = *MEMORY[0x24BDF7400];
    if (v13 != v14)
      v19 = 0;
    objc_msgSend(v8, "setAccessibilityTraits:", v19 | *MEMORY[0x24BDF73B0]);
  }

  return v8;
}

@end

@implementation _SFAccountPickerTableViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_SFAccountPickerTableViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_SFAccountPickerTableViewController"), CFSTR("tableView:cellForRowAtIndexPath:"), "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_SFAccountPickerTableViewController"), CFSTR("_rowTypeForIndexPath:"), "q", "@", 0);

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_SFAccountPickerTableViewControllerAccessibility;
  -[_SFAccountPickerTableViewControllerAccessibility tableView:cellForRowAtIndexPath:](&v16, sel_tableView_cellForRowAtIndexPath_, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v9 = v7;
  AXPerformSafeBlock();
  v10 = v13[3];

  _Block_object_dispose(&v12, 8);
  if (v10 == 1)
    objc_msgSend(v8, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);

  return v8;
}

@end

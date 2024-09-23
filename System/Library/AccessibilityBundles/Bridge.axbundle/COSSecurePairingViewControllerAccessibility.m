@implementation COSSecurePairingViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("COSSecurePairingViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("COSSecurePairingViewController"), CFSTR("UITableViewController"));
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)COSSecurePairingViewControllerAccessibility;
  -[COSSecurePairingViewControllerAccessibility tableView:cellForRowAtIndexPath:](&v10, sel_tableView_cellForRowAtIndexPath_, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDFEA60];
  objc_msgSend(v4, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setAttribute:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDFEC78]);
  objc_msgSend(v4, "setAccessibilityLabel:", v8);

  return v4;
}

@end

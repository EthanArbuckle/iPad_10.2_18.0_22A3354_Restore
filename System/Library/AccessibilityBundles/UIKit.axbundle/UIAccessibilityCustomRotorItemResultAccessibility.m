@implementation UIAccessibilityCustomRotorItemResultAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIAccessibilityCustomRotorItemResult");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (UIAccessibilityCustomRotorItemResultAccessibility)init
{
  id v3;
  id v4;
  UIAccessibilityCustomRotorItemResultAccessibility *v5;
  objc_super v6;
  id v7[2];
  UIAccessibilityCustomRotorItemResultAccessibility *v8;

  v7[1] = (id)a2;
  v8 = 0;
  v6.receiver = self;
  v6.super_class = (Class)UIAccessibilityCustomRotorItemResultAccessibility;
  v8 = -[UIAccessibilityCustomRotorItemResultAccessibility init](&v6, sel_init);
  v7[0] = v8;
  v3 = v7[0];
  v4 = (id)objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  objc_msgSend(v3, "setUuid:");

  v5 = (UIAccessibilityCustomRotorItemResultAccessibility *)v7[0];
  objc_storeStrong(v7, 0);
  objc_storeStrong((id *)&v8, 0);
  return v5;
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  objc_super v8;
  SEL v9;
  UIAccessibilityCustomRotorItemResultAccessibility *v10;

  v10 = self;
  v9 = a2;
  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)UIAccessibilityCustomRotorItemResultAccessibility;
  v6 = -[UIAccessibilityCustomRotorItemResultAccessibility description](&v8, sel_description);
  v5 = (id)-[UIAccessibilityCustomRotorItemResultAccessibility targetElement](v10, "targetElement");
  v4 = (id)-[UIAccessibilityCustomRotorItemResultAccessibility targetRange](v10, "targetRange");
  v7 = (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: targetElement: %@, targetRange: %@"), v6, v5, v4);

  return v7;
}

@end

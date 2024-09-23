@implementation UIWebFormSelectPeripheralAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIWebFormSelectPeripheral");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (id)createPeripheralWithDOMHTMLSelectElement:(id)a3
{
  id v4;
  objc_super v5;
  id v6;
  id location[2];
  id v8;

  v8 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5.receiver = v8;
  v5.super_class = (Class)&OBJC_METACLASS___UIWebFormSelectPeripheralAccessibility;
  v6 = objc_msgSendSuper2(&v5, sel_createPeripheralWithDOMHTMLSelectElement_, location[0]);
  MEMORY[0x2348C39BC](0);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
  v4 = v6;
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
  return v4;
}

@end

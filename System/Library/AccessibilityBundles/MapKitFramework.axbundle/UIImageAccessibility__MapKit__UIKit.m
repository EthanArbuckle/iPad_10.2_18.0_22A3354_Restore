@implementation UIImageAccessibility__MapKit__UIKit

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIImage");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("UIImage"), CFSTR("_mapkit_imageNamed:"), "@", 0);
}

+ (id)_mapkit_imageNamed:(id)a3
{
  id v4;
  void *v5;
  int v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___UIImageAccessibility__MapKit__UIKit;
  objc_msgSendSuper2(&v12, sel__mapkit_imageNamed_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", CFSTR("playpause"));
  v7 = (_QWORD *)MEMORY[0x24BDF7410];
  if (v6)
  {
    AXMapKitLocString(CFSTR("play.pause.button.image.label"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAccessibilityLabel:", v8);

    objc_msgSend(v5, "setAccessibilityTraits:", *v7);
  }
  else if (objc_msgSend(v4, "hasPrefix:", CFSTR("apple-pay")))
  {
    AXMapKitLocString(CFSTR("APPLE_PAY"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAccessibilityLabel:", v9);

  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("gamecontroller_xbutton")))
  {
    AXMapKitLocString(CFSTR("x.button.image.label"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAccessibilityLabel:", v10);

    objc_msgSend(v5, "setAccessibilityTraits:", *v7);
  }

  return v5;
}

@end

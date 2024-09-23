@implementation NSLineFragmentRenderingContextAccessibility__UIKit__UIFoundation

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NSLineFragmentRenderingContext");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  id obj;
  id *v5;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v5 = location;
  obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = CFSTR("NSLineFragmentRenderingContext");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", "{CGPoint=dd}", "^{CGContext=}", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("imageBounds"), "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_storeStrong(v5, obj);
}

- (void)drawAtPoint:(CGPoint)a3 inContext:(CGContext *)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  id v14;
  char v15;
  id v16;
  objc_super v17;
  CGContext *v18;
  SEL v19;
  NSLineFragmentRenderingContextAccessibility__UIKit__UIFoundation *v20;
  CGPoint v21;

  v21 = a3;
  v20 = self;
  v19 = a2;
  v18 = a4;
  v17.receiver = self;
  v17.super_class = (Class)NSLineFragmentRenderingContextAccessibility__UIKit__UIFoundation;
  -[NSLineFragmentRenderingContextAccessibility__UIKit__UIFoundation drawAtPoint:inContext:](&v17, sel_drawAtPoint_inContext_, a4, a3.x, a3.y);
  v15 = 0;
  objc_opt_class();
  v8 = (id)-[NSLineFragmentRenderingContextAccessibility__UIKit__UIFoundation _accessibilityValueForKey:](v20, "_accessibilityValueForKey:", CFSTR("AXStringToBeRenderedByContext"));
  v14 = (id)__UIAccessibilityCastAsClass();

  v13 = v14;
  objc_storeStrong(&v14, 0);
  v16 = v13;
  -[NSLineFragmentRenderingContextAccessibility__UIKit__UIFoundation safeCGRectForKey:](v20, "safeCGRectForKey:", CFSTR("imageBounds"));
  v9 = v4;
  v10 = v5;
  v11 = v6;
  v12 = v7;
  if (v18 && objc_msgSend(v16, "length"))
    objc_msgSend(MEMORY[0x24BDFFA90], "addLabel:boundingRect:withContext:", v16, v18, v9, v10, v11, v12);
  objc_storeStrong(&v16, 0);
}

@end

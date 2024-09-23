@implementation NSStringDrawingTextStorageAccessibility__UIKit__UIFoundation

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NSStringDrawingTextStorage");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  id v4;
  id *v5;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v5 = location;
  v4 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = CFSTR("NSStringDrawingTextStorage");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  objc_msgSend(location[0], "validateClass:isKindOfClass:", CFSTR("NSConcreteNotifyingMutableAttributedString"), CFSTR("NSAttributedString"));
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NSStringDrawingTextStorage"), CFSTR("drawTextContainer:range:withRect:graphicsContext:baselineMode:scrollable:padding:"), "v", "@", "{_NSRange=QQ}", "{CGRect={CGPoint=dd}{CGSize=dd}}", "^{CGContext=}", "B", "B", "d", 0);
  objc_storeStrong(v5, v4);
}

- (void)drawTextContainer:(id)a3 range:(_NSRange)a4 withRect:(CGRect)a5 graphicsContext:(CGContext *)a6 baselineMode:(BOOL)a7 scrollable:(BOOL)a8 padding:(double)a9
{
  id v13;
  id v14;
  id v15;
  char v16;
  id v17;
  objc_super v18;
  double v19;
  BOOL v20;
  BOOL v21;
  CGContext *v22;
  id location[2];
  NSStringDrawingTextStorageAccessibility__UIKit__UIFoundation *v24;
  CGRect v25;
  _NSRange v26;

  v26 = a4;
  v25 = a5;
  v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v22 = a6;
  v21 = a7;
  v20 = a8;
  v19 = a9;
  v18.receiver = v24;
  v18.super_class = (Class)NSStringDrawingTextStorageAccessibility__UIKit__UIFoundation;
  -[NSStringDrawingTextStorageAccessibility__UIKit__UIFoundation drawTextContainer:range:withRect:graphicsContext:baselineMode:scrollable:padding:](&v18, sel_drawTextContainer_range_withRect_graphicsContext_baselineMode_scrollable_padding_, location[0], v26.location, v26.length, a6, a7, a8, v25.origin.x, v25.origin.y, v25.size.width, v25.size.height, a9);
  v16 = 0;
  objc_opt_class();
  v13 = (id)-[NSStringDrawingTextStorageAccessibility__UIKit__UIFoundation safeValueForKey:](v24, "safeValueForKey:", CFSTR("_contents"));
  v15 = (id)__UIAccessibilityCastAsClass();

  v14 = v15;
  objc_storeStrong(&v15, 0);
  v17 = (id)objc_msgSend(v14, "string");

  if (objc_msgSend(v17, "length"))
    objc_msgSend(MEMORY[0x24BDFFA90], "addLabel:boundingRect:withContext:", v17, v22, v25.origin.x, v25.origin.y, v25.size.width, v25.size.height);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
}

@end

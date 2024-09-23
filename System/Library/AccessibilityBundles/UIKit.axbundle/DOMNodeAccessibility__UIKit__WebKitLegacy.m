@implementation DOMNodeAccessibility__UIKit__WebKitLegacy

+ (id)safeCategoryTargetClassName
{
  return CFSTR("DOMNode");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_updateSelectionWithTextRange:(id)a3 withAffinityDownstream:(BOOL)a4
{
  objc_super v5;
  BOOL v6;
  id location[2];
  DOMNodeAccessibility__UIKit__WebKitLegacy *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = a4;
  v5.receiver = v8;
  v5.super_class = (Class)DOMNodeAccessibility__UIKit__WebKitLegacy;
  -[DOMNodeAccessibility__UIKit__WebKitLegacy _updateSelectionWithTextRange:withAffinityDownstream:](&v5, sel__updateSelectionWithTextRange_withAffinityDownstream_, location[0], a4);
  UIAccessibilityPostNotification(*MEMORY[0x24BEBB0B0], 0);
  objc_storeStrong(location, 0);
}

- (void)_accessibilityCheckBorderHit:(char)a3 left:
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  BOOL v7;
  id location;
  id v9;
  int v10;
  id v11;
  char v12;
  char v13;
  id v14;

  v14 = a1;
  v13 = a2 & 1;
  v12 = a3 & 1;
  if (a1)
  {
    v11 = (id)objc_msgSend(v14, "safeValueForKey:", CFSTR("_selectableText"));
    v3 = (id)objc_msgSend(v11, "selectedTextRange");
    v7 = v3 != 0;

    if (v7)
    {
      v9 = (id)objc_msgSend(v11, "selectedTextRange");
      location = (id)objc_msgSend(v9, "start");
      if ((objc_msgSend(v9, "isEmpty") & 1) != 0 || (v13 & 1) != 0)
      {
        if ((v12 & 1) != 0)
          v4 = 3;
        else
          v4 = 2;
        v5 = (id)objc_msgSend(v11, "positionFromPosition:inDirection:offset:", location, v4, 1);
        v6 = location;
        location = v5;

      }
      if (!location)
        UIAccessibilityPostNotification(*MEMORY[0x24BEBB0B0], 0);
      objc_storeStrong(&location, 0);
      objc_storeStrong(&v9, 0);
      v10 = 0;
    }
    else
    {
      v10 = 1;
    }
    objc_storeStrong(&v11, 0);
  }
}

- (id)_moveLeft:(BOOL)a3 withHistory:(id)a4
{
  id v5;
  objc_super v6;
  id location;
  BOOL v8;
  SEL v9;
  DOMNodeAccessibility__UIKit__WebKitLegacy *v10;

  v10 = self;
  v9 = a2;
  v8 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  -[DOMNodeAccessibility__UIKit__WebKitLegacy _accessibilityCheckBorderHit:left:](v10, v8, 1);
  v6.receiver = v10;
  v6.super_class = (Class)DOMNodeAccessibility__UIKit__WebKitLegacy;
  v5 = -[DOMNodeAccessibility__UIKit__WebKitLegacy _moveLeft:withHistory:](&v6, sel__moveLeft_withHistory_, v8, location);
  objc_storeStrong(&location, 0);
  return v5;
}

- (id)_moveRight:(BOOL)a3 withHistory:(id)a4
{
  id v5;
  objc_super v6;
  id location;
  BOOL v8;
  SEL v9;
  DOMNodeAccessibility__UIKit__WebKitLegacy *v10;

  v10 = self;
  v9 = a2;
  v8 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  -[DOMNodeAccessibility__UIKit__WebKitLegacy _accessibilityCheckBorderHit:left:](v10, v8, 0);
  v6.receiver = v10;
  v6.super_class = (Class)DOMNodeAccessibility__UIKit__WebKitLegacy;
  v5 = -[DOMNodeAccessibility__UIKit__WebKitLegacy _moveRight:withHistory:](&v6, sel__moveRight_withHistory_, v8, location);
  objc_storeStrong(&location, 0);
  return v5;
}

@end

@implementation CALayerAccessibility__UIKit__QuartzCore

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  CALayerAccessibility__UIKit__QuartzCore *v4;

  v4 = self;
  v3 = a2;
  -[CALayerAccessibility__UIKit__QuartzCore _accessibilityUnregister](self, "_accessibilityUnregister");
  v2.receiver = v4;
  v2.super_class = (Class)CALayerAccessibility__UIKit__QuartzCore;
  -[CALayerAccessibility__UIKit__QuartzCore dealloc](&v2, sel_dealloc);
}

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CALayer");
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
  v3 = CFSTR("UIWindowLayer");
  objc_msgSend(location[0], "validateClass:");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("UIWindowLayer"), CFSTR("_window"), "UIWindow");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CALayer"), CFSTR("setBounds:"), "v", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_storeStrong(v5, obj);
}

+ (BOOL)_isSerializableAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v2;
  BOOL v4;
  id location[2];
  CALayerAccessibility__UIKit__QuartzCore *v6;
  id v7;

  v6 = self;
  location[1] = (id)a2;
  v2 = (id)-[CALayerAccessibility__UIKit__QuartzCore accessibilityUserDefinedLabel](self, "accessibilityUserDefinedLabel");
  v4 = v2 == 0;

  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      location[0] = (id)-[CALayerAccessibility__UIKit__QuartzCore string](v6, "string");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v7 = (id)objc_msgSend(location[0], "string");
      else
        v7 = location[0];
      objc_storeStrong(location, 0);
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = (id)-[CALayerAccessibility__UIKit__QuartzCore accessibilityUserDefinedLabel](v6, "accessibilityUserDefinedLabel");
  }
  return v7;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  BOOL v5;
  id v6;
  int v7;
  id v8;
  id *v9;
  char v10;
  uint64_t v11;
  int v12;
  int v13;
  BOOL (*v14)(uint64_t);
  void *v15;
  CALayerAccessibility__UIKit__QuartzCore *v16;
  char v17;
  id location[2];
  CALayerAccessibility__UIKit__QuartzCore *v19;
  CGPoint v20;
  CALayerAccessibility__UIKit__QuartzCore *v21;

  v20 = a3;
  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  v17 = -[CALayerAccessibility__UIKit__QuartzCore _accessibilityBoolValueForKey:](v19, "_accessibilityBoolValueForKey:", CFSTR("AXInHitTestOverride")) & 1;
  v10 = 0;
  v5 = 0;
  if (!v17)
  {
    v11 = MEMORY[0x24BDAC760];
    v12 = -1073741824;
    v13 = 0;
    v14 = __75__CALayerAccessibility__UIKit__QuartzCore__accessibilityHitTest_withEvent___block_invoke;
    v15 = &unk_24FF3E0C0;
    v16 = v19;
    v10 = 1;
    v9 = (id *)&v16;
    v5 = v14((uint64_t)&v11);
  }
  if (v5)
  {
    -[CALayerAccessibility__UIKit__QuartzCore _accessibilitySetBoolValue:forKey:](v19, "_accessibilitySetBoolValue:forKey:", 1);
    v8 = (id)-[CALayerAccessibility__UIKit__QuartzCore accessibilityHitTest:withEvent:](v19, "accessibilityHitTest:withEvent:", location[0], v20.x, v20.y);
    -[CALayerAccessibility__UIKit__QuartzCore _accessibilitySetBoolValue:forKey:](v19, "_accessibilitySetBoolValue:forKey:", 0, CFSTR("AXInHitTestOverride"));
    v21 = (CALayerAccessibility__UIKit__QuartzCore *)v8;
    v7 = 1;
    objc_storeStrong(&v8, 0);
  }
  else
  {
    v7 = 0;
  }
  if ((v10 & 1) != 0)
    objc_storeStrong(v9, 0);
  if (!v7)
  {
    if ((-[CALayerAccessibility__UIKit__QuartzCore isAccessibilityElement](v19, "isAccessibilityElement") & 1) != 0
      && (-[CALayerAccessibility__UIKit__QuartzCore containsPoint:](v19, "containsPoint:", v20.x, v20.y) & 1) != 0)
    {
      v21 = v19;
      v7 = 1;
    }
    else
    {
      v6 = (id)-[CALayerAccessibility__UIKit__QuartzCore hitTest:](v19, "hitTest:", v20.x, v20.y);
      if ((objc_msgSend(v6, "isAccessibilityElement") & 1) != 0)
        v21 = (CALayerAccessibility__UIKit__QuartzCore *)v6;
      else
        v21 = 0;
      v7 = 1;
      objc_storeStrong(&v6, 0);
    }
  }
  objc_storeStrong(location, 0);
  return v21;
}

- (CGRect)_accessibilityBounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[CALayerAccessibility__UIKit__QuartzCore bounds](self, "bounds", a2, self);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)accessibilityFrame
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;
  id v22;
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  id location;
  id v28;
  __int128 v29;
  __int128 v30;
  SEL v31;
  CALayerAccessibility__UIKit__QuartzCore *v32;
  __int128 v33;
  __int128 v34;
  CGRect result;

  v32 = self;
  v31 = a2;
  -[CALayerAccessibility__UIKit__QuartzCore _accessibilityBounds](self, "_accessibilityBounds");
  *(_QWORD *)&v29 = v2;
  *((_QWORD *)&v29 + 1) = v3;
  *(_QWORD *)&v30 = v4;
  *((_QWORD *)&v30 + 1) = v5;
  v24 = (id)-[CALayerAccessibility__UIKit__QuartzCore _accessibilityParentView](v32, "_accessibilityParentView");
  v28 = (id)objc_msgSend(v24, "window");

  if (!v28)
  {
    location = v32;
    while (1)
    {
      v23 = (id)objc_msgSend(location, "superlayer");
      v6 = location;
      location = v23;

      if (!v23)
        break;
      NSClassFromString(CFSTR("UIWindowLayer"));
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = (id)objc_msgSend(location, "safeValueForKey:", CFSTR("_window"));
        v8 = v28;
        v28 = v7;

        if (v28)
          break;
      }
    }
    objc_storeStrong(&location, 0);
  }
  v33 = 0u;
  v34 = 0u;
  v22 = (id)objc_msgSend(v28, "layer", v32);
  objc_msgSend(v21, "convertRect:toLayer:", v29, v30);
  *(_QWORD *)&v33 = v9;
  *((_QWORD *)&v33 + 1) = v10;
  *(_QWORD *)&v34 = v11;
  *((_QWORD *)&v34 + 1) = v12;

  objc_msgSend(v28, "convertRect:toWindow:", v33, v34);
  *(_QWORD *)&v25 = v13;
  *((_QWORD *)&v25 + 1) = v14;
  *(_QWORD *)&v26 = v15;
  *((_QWORD *)&v26 + 1) = v16;
  v33 = v25;
  v34 = v26;
  objc_storeStrong(&v28, 0);
  v18 = *((double *)&v33 + 1);
  v17 = *(double *)&v33;
  v20 = *((double *)&v34 + 1);
  v19 = *(double *)&v34;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

@end

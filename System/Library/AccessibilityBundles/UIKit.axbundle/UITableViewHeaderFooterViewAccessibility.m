@implementation UITableViewHeaderFooterViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UITableViewHeaderFooterView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const char *v3;
  const __CFString *v4;
  id obj;
  id *v6;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v6 = location;
  obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = CFSTR("UITableViewHeaderFooterView");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  v3 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("text"), 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("contentConfiguration"), v3, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("sectionHeader"), "B", 0);
  objc_storeStrong(v6, obj);
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  id v2;
  id v4;
  id v5;
  id v6;
  id v7;
  char v8;
  id v9;
  BOOL v10;
  id v11;
  BOOL v12;
  char v13;
  id v14;
  BOOL v16;

  v2 = (id)-[UITableViewHeaderFooterViewAccessibility storedAccessibilityRespondsToUserInteraction](self, "storedAccessibilityRespondsToUserInteraction");
  v12 = v2 == 0;

  if (v12)
  {
    v9 = (id)-[UITableViewHeaderFooterViewAccessibility accessibilityCustomActions](self, "accessibilityCustomActions");
    v10 = objc_msgSend(v9, "count") == 0;

    if (v10)
    {
      v13 = 0;
      v8 = 0;
      if (AXRequestingClient() == 4)
      {
        v14 = (id)objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
        v13 = 1;
        v8 = objc_msgSend(v14, "assistiveTouchScannerSpeechEnabled");
      }
      if ((v13 & 1) != 0)

      if ((v8 & 1) != 0)
      {
        v7 = -[UITableViewHeaderFooterViewAccessibility accessibilityLabel](self, "accessibilityLabel");
        v6 = (id)objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
        v5 = (id)objc_msgSend(v7, "stringByTrimmingCharactersInSet:");
        v16 = objc_msgSend(v5, "length") != 0;

      }
      else
      {
        v4 = (id)-[UITableViewHeaderFooterViewAccessibility _accessibilityInternalTextLinks](self, "_accessibilityInternalTextLinks");
        v16 = objc_msgSend(v4, "count") != 0;

      }
    }
    else
    {
      return 1;
    }
  }
  else
  {
    v11 = (id)-[UITableViewHeaderFooterViewAccessibility storedAccessibilityRespondsToUserInteraction](self, "storedAccessibilityRespondsToUserInteraction");
    v16 = objc_msgSend(v11, "BOOLValue") & 1;

  }
  return v16;
}

- (BOOL)isAccessibilityElement
{
  id v2;
  id v4;
  id v5;
  id v6;
  BOOL v7;
  id v8;
  BOOL v9;
  BOOL v11;

  v2 = (id)-[UITableViewHeaderFooterViewAccessibility isAccessibilityUserDefinedElement](self, "isAccessibilityUserDefinedElement");
  v9 = v2 == 0;

  if (v9)
  {
    v6 = -[UITableViewHeaderFooterViewAccessibility accessibilityLabel](self, "accessibilityLabel");
    v5 = (id)objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
    v4 = (id)objc_msgSend(v6, "stringByTrimmingCharactersInSet:");
    v7 = objc_msgSend(v4, "length") != 0;

    return v7;
  }
  else
  {
    v8 = (id)-[UITableViewHeaderFooterViewAccessibility isAccessibilityUserDefinedElement](self, "isAccessibilityUserDefinedElement");
    v11 = objc_msgSend(v8, "BOOLValue") & 1;

  }
  return v11;
}

- (id)accessibilityLabel
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v7;
  id v8;
  id v9[2];
  UITableViewHeaderFooterViewAccessibility *v10;

  v10 = self;
  v9[1] = (id)a2;
  v9[0] = (id)-[UITableViewHeaderFooterViewAccessibility accessibilityUserDefinedLabel](self, "accessibilityUserDefinedLabel");
  if (!v9[0])
  {
    v9[0] = (id)-[UITableViewHeaderFooterViewAccessibility safeValueForKey:](v10, "safeValueForKey:", CFSTR("text"));

  }
  if (!objc_msgSend(v9[0], "length"))
  {
    v8 = (id)-[UITableViewHeaderFooterViewAccessibility safeValueForKey:](v10, "safeValueForKey:", CFSTR("contentConfiguration"));
    v2 = (id)objc_msgSend(v8, "accessibilityLabel");
    v3 = v9[0];
    v9[0] = v2;

  }
  if ((objc_msgSend(v9[0], "isAXAttributedString") & 1) == 0)
  {
    v4 = (id)objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v9[0]);
    v5 = v9[0];
    v9[0] = v4;

  }
  if ((-[UITableViewHeaderFooterViewAccessibility _accessibilityBoolValueForKey:](v10, "_accessibilityBoolValueForKey:", CFSTR("SkipConvertToLowercase")) & 1) == 0)objc_msgSend(v9[0], "setAttribute:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDFEB08]);
  v7 = v9[0];
  objc_storeStrong(v9, 0);
  return v7;
}

- (unint64_t)accessibilityTraits
{
  id v3;
  char v4;
  objc_super v5;
  unint64_t v6;
  SEL v7;
  UITableViewHeaderFooterViewAccessibility *v8;

  v8 = self;
  v7 = a2;
  v6 = 0;
  v5.receiver = self;
  v5.super_class = (Class)UITableViewHeaderFooterViewAccessibility;
  v6 = -[UITableViewHeaderFooterViewAccessibility accessibilityTraits](&v5, sel_accessibilityTraits);
  v3 = (id)-[UITableViewHeaderFooterViewAccessibility safeValueForKey:](v8, "safeValueForKey:", CFSTR("sectionHeader"));
  v4 = objc_msgSend(v3, "BOOLValue");

  if ((v4 & 1) != 0)
    v6 |= *MEMORY[0x24BDF73C0];
  return v6;
}

- (BOOL)_accessibilityScrollToVisibleForNextElementRetrieval:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  double v18;
  id v20;
  BOOL v21;
  objc_super v22;
  int v23;
  CGRect v24;
  uint64_t v25;
  double v26;
  uint64_t v27;
  double v28;
  CGRect rect;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  double v38;
  id location;
  int64_t v40;
  SEL v41;
  UIView *v42;
  char v43;
  CGRect v44;

  v42 = (UIView *)self;
  v41 = a2;
  v40 = a3;
  location = (id)-[UITableViewHeaderFooterViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", objc_opt_class());
  if ((objc_msgSend(location, "isScrollEnabled") & 1) == 0)
    goto LABEL_12;
  objc_msgSend(location, "frame");
  v34 = v3;
  v35 = v4;
  v36 = v5;
  v37 = v6;
  v38 = v6;
  v20 = (id)objc_msgSend(location, "visibleCells");
  v21 = 1;
  if (objc_msgSend(v20, "count"))
  {
    -[UIView frame](v42, "frame");
    v30 = v7;
    v31 = v8;
    v32 = v9;
    v33 = v10;
    v21 = v10 >= v38;
  }

  if (v21)
  {
    -[UIView bounds](v42, "bounds");
    rect.origin.x = v11;
    rect.origin.y = v12;
    rect.size.width = v13;
    rect.size.height = v14;
    if (v40 == 1)
    {
      rect.origin.y = rect.origin.y + rect.size.height - v38 / 2.0;
      objc_msgSend(location, "contentSize");
      v27 = v15;
      v28 = v16;
      if (rect.origin.y > v16)
      {
        objc_msgSend(location, "contentSize", rect.origin.y);
        v25 = v17;
        v26 = v18;
        rect.origin.y = v18 - 1.0;
      }
    }
    else
    {
      rect.origin.y = rect.origin.y - (rect.size.height - v38 / 2.0);
      if (rect.origin.y < 0.0)
        rect.origin.y = 0.0;
    }
    v44 = UIAccessibilityConvertFrameToScreenCoordinates(rect, v42);
    v24 = v44;
    objc_msgSend(location, "_accessibilityScrollToFrame:forView:", v42, v44.origin.x, v44.origin.y, v44.size.width, v44.size.height);
    objc_msgSend(location, "_accessibilityOpaqueElementScrollCleanup");
    v43 = 1;
    v23 = 1;
  }
  else
  {
LABEL_12:
    v22.receiver = v42;
    v22.super_class = (Class)UITableViewHeaderFooterViewAccessibility;
    v43 = -[UITableViewHeaderFooterViewAccessibility _accessibilityScrollToVisible](&v22, sel__accessibilityScrollToVisible) & 1;
    v23 = 1;
  }
  objc_storeStrong(&location, 0);
  return v43 & 1;
}

@end

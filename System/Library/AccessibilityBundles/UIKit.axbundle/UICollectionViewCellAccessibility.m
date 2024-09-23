@implementation UICollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UICollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const char *v7;
  const char *v8;
  const __CFString *v9;
  const char *v10;
  id v11;
  id *v12;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v12 = location;
  v11 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = CFSTR("UICollectionViewCell");
  v10 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  v5 = CFSTR("UICollectionView");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  objc_msgSend(location[0], "validateClass:", CFSTR("_UICollectionViewDragAndDropController"));
  v3 = CFSTR("UIView");
  objc_msgSend(location[0], "validateClass:isKindOfClass:", v9);
  v8 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v9, CFSTR("contentConfiguration"), 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v9, CFSTR("_contentViewConfiguration"), v8, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", v9, CFSTR("_contentView"), "UIView");
  v7 = "B";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("_isEligibleForFocusInteraction"), 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v9, CFSTR("canBecomeFocused"), v7, 0);
  v4 = CFSTR("UICollectionViewCompositionalLayout");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("dataSourceSnapshotter"), v8, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIDataSourceSnapshotter"), CFSTR("snapshot"), v8, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("layoutSectionProvider"), "@?", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("collectionViewLayout"), v8, 0);
  v6 = CFSTR("UIListContentView");
  objc_msgSend(location[0], "validateClass:");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, CFSTR("configuration"), v8, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NSObject"), CFSTR("_accessibilityRespondsToUserInteraction"), v7, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v9, CFSTR("_setPopupMenuButton:"), v10, v8, 0);
  objc_storeStrong(v12, v11);
}

- (unint64_t)_accessibilityAutomationType
{
  return 75;
}

- (id)_accessibilityParentCollectionView
{
  return (id)-[UICollectionViewCellAccessibility _accessibilityViewAncestorIsKindOf:](self, "_accessibilityViewAncestorIsKindOf:", objc_opt_class());
}

- (id)_accessibilityParentScrollView
{
  if (a1)
    return (id)objc_msgSend(a1, "_accessibilityViewAncestorIsKindOf:", objc_opt_class());
  else
    return 0;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;
  unint64_t v4;
  SEL v5;
  UICollectionViewCellAccessibility *v6;

  v6 = self;
  v5 = a2;
  v4 = 0;
  v3.receiver = self;
  v3.super_class = (Class)UICollectionViewCellAccessibility;
  v4 = -[UICollectionViewCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
  if ((-[UICollectionViewCellAccessibility isSelected](v6, "isSelected") & 1) != 0)
    v4 |= *MEMORY[0x24BDF7400];
  return v4;
}

- (id)accessibilityLabel
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v12;
  id v13;
  id v14;
  BOOL v15;
  objc_super v16;
  id location;
  int v18;
  id v19[2];
  UICollectionViewCellAccessibility *v20;
  id v21;

  v20 = self;
  v19[1] = (id)a2;
  v19[0] = (id)-[UICollectionViewCellAccessibility accessibilityUserDefinedLabel](self, "accessibilityUserDefinedLabel");
  if (v19[0])
  {
    v21 = v19[0];
    v18 = 1;
  }
  else
  {
    location = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%p-_accessibilityLabel"), v20);
    v2 = (id)objc_msgSend((id)*MEMORY[0x24BEBAD70], "objectForKeyedSubscript:", location);
    v15 = v2 == 0;

    if (v15)
    {
      v14 = (id)-[UICollectionViewCellAccessibility safeValueForKey:](v20, "safeValueForKey:", CFSTR("_contentViewConfiguration"));
      v3 = (id)objc_msgSend(v14, "accessibilityLabel");
      v4 = v19[0];
      v19[0] = v3;

      if (!objc_msgSend(v19[0], "length"))
      {
        v13 = -[UICollectionViewCellAccessibility _accessibilityListConfiguration](v20);
        v5 = (id)objc_msgSend(v13, "accessibilityLabel");
        v6 = v19[0];
        v19[0] = v5;

      }
      if (!objc_msgSend(v19[0], "length"))
      {
        v12 = (id)-[UICollectionViewCellAccessibility safeValueForKey:](v20, "safeValueForKey:", CFSTR("contentConfiguration"));
        v7 = (id)objc_msgSend(v12, "accessibilityLabel");
        v8 = v19[0];
        v19[0] = v7;

      }
      if (!objc_msgSend(v19[0], "length"))
      {
        v16.receiver = v20;
        v16.super_class = (Class)UICollectionViewCellAccessibility;
        v9 = -[UICollectionViewCellAccessibility accessibilityLabel](&v16, sel_accessibilityLabel);
        v10 = v19[0];
        v19[0] = v9;

      }
      objc_msgSend((id)*MEMORY[0x24BEBAD70], "setObject:forKeyedSubscript:", v19[0], location);
      v21 = v19[0];
      v18 = 1;
    }
    else
    {
      v21 = (id)objc_msgSend((id)*MEMORY[0x24BEBAD70], "objectForKeyedSubscript:", location);
      v18 = 1;
    }
    objc_storeStrong(&location, 0);
  }
  objc_storeStrong(v19, 0);
  return v21;
}

- (id)_accessibilityListConfiguration
{
  id v2;
  id v3;
  id v4;
  id v5;

  if (!a1)
    return 0;
  v4 = (id)objc_msgSend(a1, "safeUIViewForKey:", CFSTR("_contentView"));
  v3 = (id)objc_msgSend(v4, "_accessibilityFindUnsortedSubviewDescendantsPassingTest:", &__block_literal_global_14);
  v2 = (id)objc_msgSend(v3, "firstObject");
  v5 = (id)objc_msgSend(v2, "safeValueForKey:", CFSTR("configuration"));

  return v5;
}

- (id)accessibilityValue
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v9;
  id v10;
  id v11;
  objc_super v12;
  int v13;
  id location[2];
  UICollectionViewCellAccessibility *v15;
  id v16;

  v15 = self;
  location[1] = (id)a2;
  location[0] = (id)-[UICollectionViewCellAccessibility accessibilityUserDefinedValue](self, "accessibilityUserDefinedValue");
  if (location[0])
  {
    v16 = location[0];
    v13 = 1;
  }
  else
  {
    v11 = (id)-[UICollectionViewCellAccessibility safeValueForKey:](v15, "safeValueForKey:", CFSTR("_contentViewConfiguration"));
    location[0] = (id)objc_msgSend(v11, "accessibilityValue");

    if (!objc_msgSend(location[0], "length"))
    {
      v10 = -[UICollectionViewCellAccessibility _accessibilityListConfiguration](v15);
      v2 = (id)objc_msgSend(v10, "accessibilityValue");
      v3 = location[0];
      location[0] = v2;

    }
    if (!objc_msgSend(location[0], "length"))
    {
      v9 = (id)-[UICollectionViewCellAccessibility safeValueForKey:](v15, "safeValueForKey:", CFSTR("contentConfiguration"));
      v4 = (id)objc_msgSend(v9, "accessibilityValue");
      v5 = location[0];
      location[0] = v4;

    }
    if (!objc_msgSend(location[0], "length"))
    {
      v12.receiver = v15;
      v12.super_class = (Class)UICollectionViewCellAccessibility;
      v6 = -[UICollectionViewCellAccessibility accessibilityValue](&v12, sel_accessibilityValue);
      v7 = location[0];
      location[0] = v6;

    }
    v16 = location[0];
    v13 = 1;
  }
  objc_storeStrong(location, 0);
  return v16;
}

uint64_t __68__UICollectionViewCellAccessibility__accessibilityListConfiguration__block_invoke(void *a1, void *a2)
{
  char isKindOfClass;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  NSClassFromString(CFSTR("UIListContentView"));
  isKindOfClass = objc_opt_isKindOfClass();
  objc_storeStrong(location, 0);
  return isKindOfClass & 1;
}

- (void)prepareForReuse
{
  objc_super v2;
  SEL v3;
  UICollectionViewCellAccessibility *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UICollectionViewCellAccessibility;
  -[UICollectionViewCellAccessibility prepareForReuse](&v2, sel_prepareForReuse);
  -[UICollectionViewCellAccessibility _accessibilityClearInternalCaches](v4);
  -[UICollectionViewCellAccessibility setAccessibilityElements:](v4, "setAccessibilityElements:", 0);
}

- (void)_accessibilityClearInternalCaches
{
  id v1;
  id v2;

  v2 = a1;
  if (a1)
  {
    objc_msgSend(v2, "_accessibilityRemoveValueForKey:", *MEMORY[0x24BEBB308]);
    v1 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%p-_accessibilityChildren"), v2);
    objc_msgSend((id)*MEMORY[0x24BEBAD70], "setObject:forKeyedSubscript:");
    objc_storeStrong(&v1, 0);
  }
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  BOOL v5;
  objc_super v6;
  int v7;
  id v8;
  id *v9;
  char v10;
  uint64_t v11;
  int v12;
  int v13;
  BOOL (*v14)(uint64_t);
  void *v15;
  UICollectionViewCellAccessibility *v16;
  char v17;
  id location[2];
  UICollectionViewCellAccessibility *v19;
  CGPoint v20;
  id v21;

  v20 = a3;
  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  v17 = -[UICollectionViewCellAccessibility _accessibilityBoolValueForKey:](v19, "_accessibilityBoolValueForKey:", CFSTR("AXInHitTestOverride")) & 1;
  v10 = 0;
  v5 = 0;
  if (!v17)
  {
    v11 = MEMORY[0x24BDAC760];
    v12 = -1073741824;
    v13 = 0;
    v14 = __69__UICollectionViewCellAccessibility__accessibilityHitTest_withEvent___block_invoke;
    v15 = &unk_24FF3E0C0;
    v16 = v19;
    v10 = 1;
    v9 = (id *)&v16;
    v5 = v14((uint64_t)&v11);
  }
  if (v5)
  {
    -[UICollectionViewCellAccessibility _accessibilitySetBoolValue:forKey:](v19, "_accessibilitySetBoolValue:forKey:", 1);
    v8 = (id)-[UICollectionViewCellAccessibility accessibilityHitTest:withEvent:](v19, "accessibilityHitTest:withEvent:", location[0], v20.x, v20.y);
    -[UICollectionViewCellAccessibility _accessibilitySetBoolValue:forKey:](v19, "_accessibilitySetBoolValue:forKey:", 0, CFSTR("AXInHitTestOverride"));
    v21 = v8;
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
    if ((-[UICollectionViewCellAccessibility pointInside:withEvent:](v19, "pointInside:withEvent:", location[0], v20.x, v20.y) & 1) != 0)
    {
      v6.receiver = v19;
      v6.super_class = (Class)UICollectionViewCellAccessibility;
      v21 = -[UICollectionViewCellAccessibility _accessibilityHitTest:withEvent:](&v6, sel__accessibilityHitTest_withEvent_, location[0], v20.x, v20.y);
    }
    else
    {
      v21 = 0;
    }
    v7 = 1;
  }
  objc_storeStrong(location, 0);
  return v21;
}

BOOL __69__UICollectionViewCellAccessibility__accessibilityHitTest_withEvent___block_invoke(uint64_t a1)
{
  objc_class *v1;
  objc_class *v2;
  NSString *v4;
  NSObject *log;
  os_log_type_t type;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  char v11;
  id v12;
  IMP Implementation;
  Method InstanceMethod;
  uint64_t v15;
  uint64_t v16;
  id location;
  dispatch_once_t *v18;
  uint8_t v19[24];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v16 = a1;
  v15 = a1;
  v18 = (dispatch_once_t *)&UIKBEmojiZeroWidthJoiner_block_invoke_onceToken;
  location = 0;
  objc_storeStrong(&location, &__block_literal_global_270);
  if (*v18 != -1)
    dispatch_once(v18, location);
  objc_storeStrong(&location, 0);
  v1 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v1, sel_accessibilityHitTest_withEvent_);
  Implementation = 0;
  if (InstanceMethod)
  {
    Implementation = method_getImplementation(InstanceMethod);
  }
  else
  {
    v12 = (id)AXLogCommon();
    v11 = 17;
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_FAULT))
    {
      log = v12;
      type = v11;
      v8 = NSStringFromSelector(sel_accessibilityHitTest_withEvent_);
      v4 = v8;
      v10 = v4;
      v2 = (objc_class *)objc_opt_class();
      v7 = NSStringFromClass(v2);
      v9 = v7;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v19, (uint64_t)v4, (uint64_t)v9);
      _os_log_fault_impl(&dword_230C4A000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v19, 0x16u);

      objc_storeStrong((id *)&v9, 0);
      objc_storeStrong((id *)&v10, 0);
    }
    objc_storeStrong(&v12, 0);
  }
  return Implementation != (IMP)UIKBEmojiZeroWidthJoiner_block_invoke_BaseImplementation;
}

void __69__UICollectionViewCellAccessibility__accessibilityHitTest_withEvent___block_invoke_2(uint64_t a1)
{
  objc_class *v1;
  objc_class *v2;
  NSString *v3;
  NSObject *log;
  os_log_type_t type;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  char v10;
  id v11;
  Method InstanceMethod;
  uint64_t v13;
  uint64_t v14;
  uint8_t v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v14 = a1;
  v13 = a1;
  v1 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v1, sel_accessibilityHitTest_withEvent_);
  if (InstanceMethod)
  {
    UIKBEmojiZeroWidthJoiner_block_invoke_BaseImplementation = (uint64_t)method_getImplementation(InstanceMethod);
  }
  else
  {
    v11 = (id)AXLogCommon();
    v10 = 17;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_FAULT))
    {
      log = v11;
      type = v10;
      v7 = NSStringFromSelector(sel_accessibilityHitTest_withEvent_);
      v3 = v7;
      v9 = v3;
      v2 = (objc_class *)objc_opt_class();
      v6 = NSStringFromClass(v2);
      v8 = v6;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v15, (uint64_t)v3, (uint64_t)v8);
      _os_log_fault_impl(&dword_230C4A000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v15, 0x16u);

      objc_storeStrong((id *)&v8, 0);
      objc_storeStrong((id *)&v9, 0);
    }
    objc_storeStrong(&v11, 0);
  }
}

- (void)accessibilityReuseChildren:(id)a3 forMockParent:(id)a4
{
  id v5;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = 0;
  objc_storeStrong(&v5, a4);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (id)automationElements
{
  return -[UICollectionViewCellAccessibility _accessibilityCachedChildren](self);
}

- (id)_accessibilityCachedChildren
{
  id v1;
  id v2;
  id v3;
  id v4;
  id v5;
  id v7;
  _QWORD *v8;
  BOOL v9;
  id v10;
  id v11;
  char v12;
  int v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v16 = a1;
  if (a1)
  {
    v15 = 0;
    if (_AXSAutomationEnabled())
    {
      v14 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%p-_accessibilityChildren"), v16);
      v1 = (id)objc_msgSend((id)*MEMORY[0x24BEBAD70], "objectForKeyedSubscript:", v14);
      v9 = v1 == 0;

      if (v9)
      {
        v12 = 0;
        objc_opt_class();
        v11 = (id)__UIAccessibilityCastAsSafeCategory();
        v10 = v11;
        objc_storeStrong(&v11, 0);
        v2 = -[UIViewAccessibility _accessibilityUserTestingSubviewsSorted:](v10, 1);
        v3 = v15;
        v15 = v2;

        objc_msgSend((id)*MEMORY[0x24BEBAD70], "setObject:forKeyedSubscript:", v15, v14);
        v13 = 0;
      }
      else
      {
        v17 = (id)objc_msgSend((id)*MEMORY[0x24BEBAD70], "objectForKeyedSubscript:", v14);
        v13 = 1;
      }
      objc_storeStrong(&v14, 0);
      if (v13)
        goto LABEL_12;
    }
    else
    {
      v4 = (id)objc_msgSend(v16, "_accessibilityValueForKey:", *MEMORY[0x24BEBB308]);
      v5 = v15;
      v15 = v4;

      if (!v15)
      {
        v7 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v8 = (_QWORD *)MEMORY[0x24BEBB308];
        objc_msgSend(v16, "_accessibilitySetRetainedValue:forKey:");

        v15 = (id)objc_msgSend(v16, "_accessibilitySortedElementsWithin");
        objc_msgSend(v16, "_accessibilitySetRetainedValue:forKey:", v15, *v8);
      }
    }
    v17 = v15;
    v13 = 1;
LABEL_12:
    objc_storeStrong(&v15, 0);
    return v17;
  }
  v17 = 0;
  return v17;
}

- (id)_accessibilityChildren
{
  int v3;
  char v4;
  id v5;

  v4 = 0;
  LOBYTE(v3) = 1;
  if (!-[UICollectionViewCellAccessibility isAccessibilityElement](self, "isAccessibilityElement"))
  {
    v5 = (id)-[UICollectionViewCellAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", objc_opt_class());
    v4 = 1;
    v3 = objc_msgSend(v5, "_accessibilityShouldUseCollectionViewCellAccessibilityElements") ^ 1;
  }
  if ((v4 & 1) != 0)

  if ((v3 & 1) != 0)
    return 0;
  else
    return -[UICollectionViewCellAccessibility _accessibilityCachedChildren](self);
}

- (BOOL)_accessibilityHitTestReverseOrder
{
  objc_super v3;
  SEL v4;
  UICollectionViewCellAccessibility *v5;

  v5 = self;
  v4 = a2;
  if (_AXSAutomationEnabled())
    return 1;
  v3.receiver = v5;
  v3.super_class = (Class)UICollectionViewCellAccessibility;
  return -[UICollectionViewCellAccessibility _accessibilityHitTestReverseOrder](&v3, sel__accessibilityHitTestReverseOrder);
}

- (BOOL)_accessibilityRespondsToUserInteractionForElement:(id)a3
{
  objc_super v4;
  int v5;
  id location[2];
  UICollectionViewCellAccessibility *v7;
  char v8;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (-[UICollectionViewCellAccessibility isAccessibilityElement](v7, "isAccessibilityElement"))
  {
    v8 = 1;
  }
  else
  {
    v4.receiver = v7;
    v4.super_class = (Class)UICollectionViewCellAccessibility;
    v8 = -[UICollectionViewCellAccessibility _accessibilityRespondsToUserInteractionForElement:](&v4, sel__accessibilityRespondsToUserInteractionForElement_, location[0]);
  }
  v5 = 1;
  objc_storeStrong(location, 0);
  return v8 & 1;
}

- (id)_privateAccessibilityCustomActions
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  UICollectionViewCellAccessibility *v9;
  id v10;
  id v11;
  id v12;
  UICollectionViewCellAccessibility *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  char v21;
  id v22;
  id v23;
  id v24;
  char v25;
  id v26;
  id v27;
  id v28;
  id v29;
  char v30;
  id v31;
  id v32;
  id v33;
  int v34;
  id v35;
  objc_super v36;
  id v37[2];
  UICollectionViewCellAccessibility *v38;
  id v39;

  v38 = self;
  v37[1] = (id)a2;
  v37[0] = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v17 = v37[0];
  v36.receiver = v38;
  v36.super_class = (Class)UICollectionViewCellAccessibility;
  v18 = -[UICollectionViewCellAccessibility _privateAccessibilityCustomActions](&v36, sel__privateAccessibilityCustomActions);
  objc_msgSend(v17, "axSafelyAddObjectsFromArray:");

  v35 = -[UICollectionViewCellAccessibility _accessibilityIndexPath](v38, "_accessibilityIndexPath");
  if (v35)
  {
    v33 = (id)-[UICollectionViewCellAccessibility _accessibilityViewAncestorIsKindOf:](v38, "_accessibilityViewAncestorIsKindOf:", objc_opt_class());
    v32 = (id)objc_msgSend(v33, "safeValueForKey:", CFSTR("collectionViewLayout"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v30 = 0;
      objc_opt_class();
      v29 = (id)__UIAccessibilityCastAsClass();
      v28 = v29;
      objc_storeStrong(&v29, 0);
      v31 = v28;
      v10 = v37[0];
      v9 = v38;
      v12 = (id)objc_msgSend(v28, "_leadingSwipeActionsConfigurationForIndexPath:", v35);
      v11 = -[UICollectionViewCellAccessibility _axCustomActionsForActions:](v9, v12);
      objc_msgSend(v10, "axSafelyAddObjectsFromArray:");

      v14 = v37[0];
      v13 = v38;
      v16 = (id)objc_msgSend(v31, "_trailingSwipeActionsConfigurationForIndexPath:", v35);
      v15 = -[UICollectionViewCellAccessibility _axCustomActionsForActions:](v13, v16);
      objc_msgSend(v14, "axSafelyAddObjectsFromArray:");

      v27 = (id)-[UICollectionViewCellAccessibility safeUIViewForKey:](v38, "safeUIViewForKey:", CFSTR("_contentView"));
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v25 = 0;
        objc_opt_class();
        v8 = (id)objc_msgSend(v27, "safeValueForKey:", CFSTR("_leadingSwipeActionsConfiguration"));
        v24 = (id)__UIAccessibilityCastAsClass();

        v23 = v24;
        objc_storeStrong(&v24, 0);
        v26 = v23;
        v6 = v37[0];
        v7 = -[UICollectionViewCellAccessibility _axCustomActionsForActions:](v38, v23);
        objc_msgSend(v6, "axSafelyAddObjectsFromArray:");

        objc_storeStrong(&v26, 0);
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v21 = 0;
        objc_opt_class();
        v5 = (id)objc_msgSend(v27, "safeValueForKey:", CFSTR("_trailingSwipeActionsConfiguration"));
        v20 = (id)__UIAccessibilityCastAsClass();

        v19 = v20;
        objc_storeStrong(&v20, 0);
        v22 = v19;
        v3 = v37[0];
        v4 = -[UICollectionViewCellAccessibility _axCustomActionsForActions:](v38, v19);
        objc_msgSend(v3, "axSafelyAddObjectsFromArray:");

        objc_storeStrong(&v22, 0);
      }
      v39 = v37[0];
      v34 = 1;
      objc_storeStrong(&v27, 0);
      objc_storeStrong(&v31, 0);
    }
    else
    {
      v39 = v37[0];
      v34 = 1;
    }
    objc_storeStrong(&v32, 0);
    objc_storeStrong(&v33, 0);
  }
  else
  {
    v39 = v37[0];
    v34 = 1;
  }
  objc_storeStrong(&v35, 0);
  objc_storeStrong(v37, 0);
  return v39;
}

- (id)_axCustomActionsForActions:(void *)a1
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  id obj;
  uint64_t v18;
  uint64_t v19;
  int v20;
  int v21;
  uint64_t (*v22)(id *, void *);
  void *v23;
  id v24;
  id v25;
  id v26;
  id from;
  id v28;
  _QWORD __b[8];
  id v30;
  id v31;
  int v32;
  id location;
  id v34;
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v34 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v34)
  {
    v31 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    memset(__b, 0, sizeof(__b));
    obj = (id)objc_msgSend(location, "actions");
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v36, 16);
    if (v18)
    {
      v14 = *(_QWORD *)__b[2];
      v15 = 0;
      v16 = v18;
      while (1)
      {
        v13 = v15;
        if (*(_QWORD *)__b[2] != v14)
          objc_enumerationMutation(obj);
        v30 = *(id *)(__b[1] + 8 * v15);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v28 = (id)objc_msgSend(v30, "accessibilityLabel");
          if (!v28)
          {
            v2 = (id)objc_msgSend(v30, "title");
            v3 = v28;
            v28 = v2;

            if (!v28)
            {
              v12 = (id)objc_msgSend(v30, "image");
              v4 = (id)objc_msgSend(v12, "accessibilityLabel");
              v5 = v28;
              v28 = v4;

            }
          }
          v6 = (id)objc_msgSend(v28, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(" "), v9);
          v7 = v28;
          v28 = v6;

          if (objc_msgSend(v28, "length"))
          {
            objc_initWeak(&from, v34);
            v11 = objc_alloc(MEMORY[0x24BDF6788]);
            v10 = v28;
            v19 = MEMORY[0x24BDAC760];
            v20 = -1073741824;
            v21 = 0;
            v22 = __64__UICollectionViewCellAccessibility__axCustomActionsForActions___block_invoke;
            v23 = &unk_24FF3EA10;
            v24 = v30;
            objc_copyWeak(&v25, &from);
            v26 = (id)objc_msgSend(v11, "initWithName:actionHandler:", v10, &v19);
            objc_msgSend(v31, "addObject:", v26);
            objc_storeStrong(&v26, 0);
            objc_destroyWeak(&v25);
            objc_storeStrong(&v24, 0);
            objc_destroyWeak(&from);
          }
          objc_storeStrong(&v28, 0);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v9 = v30;
            _AXAssert();
          }
        }
        ++v15;
        if (v13 + 1 >= v16)
        {
          v15 = 0;
          v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v36, 16);
          if (!v16)
            break;
        }
      }
    }

    v35 = v31;
    v32 = 1;
    objc_storeStrong(&v31, 0);
  }
  else
  {
    v35 = 0;
    v32 = 1;
  }
  objc_storeStrong(&location, 0);
  return v35;
}

uint64_t __64__UICollectionViewCellAccessibility__axCustomActionsForActions___block_invoke(id *a1, void *a2)
{
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12[2];
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v12[1] = a1;
  v12[0] = (id)objc_msgSend(a1[4], "handler");
  if (v12[0])
  {
    v4 = MEMORY[0x24BDAC760];
    v5 = -1073741824;
    v6 = 0;
    v7 = __64__UICollectionViewCellAccessibility__axCustomActionsForActions___block_invoke_2;
    v8 = &unk_24FF3E9E8;
    objc_copyWeak(&v11, a1 + 5);
    v10 = v12[0];
    v9 = a1[4];
    AXPerformSafeBlock();
    objc_storeStrong(&v9, 0);
    objc_storeStrong(&v10, 0);
    objc_destroyWeak(&v11);
  }
  objc_storeStrong(v12, 0);
  objc_storeStrong(location, 0);
  return 1;
}

void __64__UICollectionViewCellAccessibility__axCustomActionsForActions___block_invoke_2(uint64_t a1)
{
  id location[3];

  location[2] = (id)a1;
  location[1] = (id)a1;
  location[0] = objc_loadWeakRetained((id *)(a1 + 48));
  if (location[0])
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_storeStrong(location, 0);
}

- (void)addSubview:(id)a3
{
  objc_super v3;
  id location[2];
  UICollectionViewCellAccessibility *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)UICollectionViewCellAccessibility;
  -[UICollectionViewCellAccessibility addSubview:](&v3, sel_addSubview_, location[0]);
  -[UICollectionViewCellAccessibility _accessibilityClearInternalCaches](v5);
  objc_storeStrong(location, 0);
}

- (void)willRemoveSubview:(id)a3
{
  objc_super v3;
  id location[2];
  UICollectionViewCellAccessibility *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)UICollectionViewCellAccessibility;
  -[UICollectionViewCellAccessibility willRemoveSubview:](&v3, sel_willRemoveSubview_, location[0]);
  -[UICollectionViewCellAccessibility _accessibilityClearInternalCaches](v5);
  objc_storeStrong(location, 0);
}

- (void)insertSubview:(id)a3 belowSubview:(id)a4
{
  objc_super v5;
  id v6;
  id location[2];
  UICollectionViewCellAccessibility *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = 0;
  objc_storeStrong(&v6, a4);
  v5.receiver = v8;
  v5.super_class = (Class)UICollectionViewCellAccessibility;
  -[UICollectionViewCellAccessibility insertSubview:belowSubview:](&v5, sel_insertSubview_belowSubview_, location[0], v6);
  -[UICollectionViewCellAccessibility _accessibilityClearInternalCaches](v8);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)insertSubview:(id)a3 aboveSubview:(id)a4
{
  objc_super v5;
  id v6;
  id location[2];
  UICollectionViewCellAccessibility *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = 0;
  objc_storeStrong(&v6, a4);
  v5.receiver = v8;
  v5.super_class = (Class)UICollectionViewCellAccessibility;
  -[UICollectionViewCellAccessibility insertSubview:aboveSubview:](&v5, sel_insertSubview_aboveSubview_, location[0], v6);
  -[UICollectionViewCellAccessibility _accessibilityClearInternalCaches](v8);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)insertSubview:(id)a3 atIndex:(int64_t)a4
{
  objc_super v5;
  int64_t v6;
  id location[2];
  UICollectionViewCellAccessibility *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = a4;
  v5.receiver = v8;
  v5.super_class = (Class)UICollectionViewCellAccessibility;
  -[UICollectionViewCellAccessibility insertSubview:atIndex:](&v5, sel_insertSubview_atIndex_, location[0], a4);
  -[UICollectionViewCellAccessibility _accessibilityClearInternalCaches](v8);
  objc_storeStrong(location, 0);
}

- (int64_t)accessibilityElementCount
{
  uint64_t v3;
  uint64_t v4;
  id location;
  int v6;
  id v7[2];
  UICollectionViewCellAccessibility *v8;
  int64_t v9;

  v8 = self;
  v7[1] = (id)a2;
  v7[0] = (id)-[UICollectionViewCellAccessibility accessibilityElements](self, "accessibilityElements");
  if (v7[0])
  {
    v9 = objc_msgSend(v7[0], "count");
    v6 = 1;
  }
  else
  {
    location = -[UICollectionViewCellAccessibility _accessibilityChildren](v8, "_accessibilityChildren");
    if (location)
    {
      v4 = objc_msgSend(location, "count");
      if (v4)
        v3 = v4;
      else
        v3 = 0x7FFFFFFFFFFFFFFFLL;
      v9 = v3;
      v6 = 1;
    }
    else
    {
      v9 = 0x7FFFFFFFFFFFFFFFLL;
      v6 = 1;
    }
    objc_storeStrong(&location, 0);
  }
  objc_storeStrong(v7, 0);
  return v9;
}

- (id)accessibilityElementAtIndex:(int64_t)a3
{
  id v4;
  id location;
  int64_t v6;
  SEL v7;
  UICollectionViewCellAccessibility *v8;
  id v9;

  v8 = self;
  v7 = a2;
  v6 = a3;
  location = (id)-[UICollectionViewCellAccessibility accessibilityElements](self, "accessibilityElements");
  if (location)
  {
    v9 = (id)objc_msgSend(location, "objectAtIndexedSubscript:", v6);
  }
  else
  {
    v4 = -[UICollectionViewCellAccessibility _accessibilityChildren](v8, "_accessibilityChildren");
    v9 = (id)objc_msgSend(v4, "objectAtIndex:", v6);

  }
  objc_storeStrong(&location, 0);
  return v9;
}

- (int64_t)indexOfAccessibilityElement:(id)a3
{
  id v4;
  id v5;
  id location[2];
  UICollectionViewCellAccessibility *v7;
  int64_t v8;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = (id)-[UICollectionViewCellAccessibility accessibilityElements](v7, "accessibilityElements");
  if (v5)
  {
    v8 = objc_msgSend(v5, "indexOfObject:", location[0]);
  }
  else
  {
    v4 = -[UICollectionViewCellAccessibility _accessibilityChildren](v7, "_accessibilityChildren");
    v8 = objc_msgSend(v4, "indexOfObject:", location[0]);

  }
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
  return v8;
}

- (void)accessibilityClearInternalData
{
  ;
}

- (id)axData
{
  id v3;
  id v4[2];
  UICollectionViewCellAccessibility *v5;

  v5 = self;
  v4[1] = (id)a2;
  v4[0] = (id)-[UICollectionViewCellAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXCollectionViewCellData"));
  if (!v4[0])
  {
    v4[0] = objc_alloc_init(AXCollectionViewCellData);

    -[UICollectionViewCellAccessibility _accessibilitySetRetainedValue:forKey:](v5, "_accessibilitySetRetainedValue:forKey:", v4[0], CFSTR("AXCollectionViewCellData"));
  }
  v3 = v4[0];
  objc_storeStrong(v4, 0);
  return v3;
}

- (id)_accessibilityIndexPath
{
  id v3;
  id v4;
  char isKindOfClass;
  id v6[2];
  UICollectionViewCellAccessibility *v7;
  id v8;

  v7 = self;
  v6[1] = (id)a2;
  v4 = (id)-[UICollectionViewCellAccessibility accessibilityContainer](self, "accessibilityContainer");
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v3 = (id)-[UICollectionViewCellAccessibility accessibilityContainer](v7, "accessibilityContainer");
    v8 = (id)objc_msgSend(v3, "indexPath");

  }
  else
  {
    v6[0] = -[UICollectionViewCellAccessibility _accessibilityParentCollectionView](v7, "_accessibilityParentCollectionView");
    v8 = (id)objc_msgSend(v6[0], "indexPathForCell:", v7);
    objc_storeStrong(v6, 0);
  }
  return v8;
}

- (_NSRange)accessibilityRowRange
{
  NSUInteger v2;
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  id v6;
  objc_super v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  char v13;
  id v14;
  int v15;
  id v16[2];
  UICollectionViewCellAccessibility *v17;
  NSUInteger v18;
  NSUInteger v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _NSRange result;

  v17 = self;
  v16[1] = (id)a2;
  v16[0] = (id)-[UICollectionViewCellAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("_accessibilityRowRangeKey"));
  if (v16[0])
  {
    v18 = objc_msgSend(v16[0], "rangeValue");
    v19 = v2;
    v15 = 1;
  }
  else
  {
    v13 = 0;
    objc_opt_class();
    v6 = (id)-[UICollectionViewCellAccessibility _accessibilityAncestorIsKindOf:](v17, "_accessibilityAncestorIsKindOf:", objc_opt_class());
    v12 = (id)__UIAccessibilityCastAsClass();

    v11 = v12;
    objc_storeStrong(&v12, 0);
    v14 = v11;
    v10 = -[UICollectionViewCellAccessibility _accessibilityIndexPath](v17, "_accessibilityIndexPath");
    if (v10)
    {
      v9 = objc_msgSend(v10, "item");
      v8 = objc_msgSend(v14, "numberOfItemsInSection:", objc_msgSend(v10, "section"));
      v21 = v9;
      v20 = v8;
      v22 = v9;
      v23 = v8;
      v18 = v9;
      v19 = v8;
    }
    else
    {
      v7.receiver = v17;
      v7.super_class = (Class)UICollectionViewCellAccessibility;
      v18 = (NSUInteger)-[UICollectionViewCellAccessibility accessibilityRowRange](&v7, sel_accessibilityRowRange);
      v19 = v3;
    }
    v15 = 1;
    objc_storeStrong(&v10, 0);
    objc_storeStrong(&v14, 0);
  }
  objc_storeStrong(v16, 0);
  v4 = v18;
  v5 = v19;
  result.length = v5;
  result.location = v4;
  return result;
}

- (BOOL)_accessibilityImplementsDefaultRowRange
{
  _BOOL4 v3;
  uint64_t v4;
  int v5;
  int v6;
  BOOL (*v7)(uint64_t);
  void *v8;
  id v9[3];

  v9[2] = self;
  v9[1] = (id)a2;
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __76__UICollectionViewCellAccessibility__accessibilityImplementsDefaultRowRange__block_invoke;
  v8 = &unk_24FF3E0C0;
  v9[0] = self;
  v3 = !v7((uint64_t)&v4);
  objc_storeStrong(v9, 0);
  return v3;
}

BOOL __76__UICollectionViewCellAccessibility__accessibilityImplementsDefaultRowRange__block_invoke(uint64_t a1)
{
  objc_class *v1;
  objc_class *v2;
  NSString *v4;
  NSObject *log;
  os_log_type_t type;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  char v11;
  id v12;
  IMP Implementation;
  Method InstanceMethod;
  uint64_t v15;
  uint64_t v16;
  id location;
  dispatch_once_t *v18;
  uint8_t v19[24];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v16 = a1;
  v15 = a1;
  v18 = (dispatch_once_t *)&UIKBEmojiZeroWidthJoiner_block_invoke_2_onceToken;
  location = 0;
  objc_storeStrong(&location, &__block_literal_global_327);
  if (*v18 != -1)
    dispatch_once(v18, location);
  objc_storeStrong(&location, 0);
  v1 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v1, sel_accessibilityRowRange);
  Implementation = 0;
  if (InstanceMethod)
  {
    Implementation = method_getImplementation(InstanceMethod);
  }
  else
  {
    v12 = (id)AXLogCommon();
    v11 = 17;
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_FAULT))
    {
      log = v12;
      type = v11;
      v8 = NSStringFromSelector(sel_accessibilityRowRange);
      v4 = v8;
      v10 = v4;
      v2 = (objc_class *)objc_opt_class();
      v7 = NSStringFromClass(v2);
      v9 = v7;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v19, (uint64_t)v4, (uint64_t)v9);
      _os_log_fault_impl(&dword_230C4A000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v19, 0x16u);

      objc_storeStrong((id *)&v9, 0);
      objc_storeStrong((id *)&v10, 0);
    }
    objc_storeStrong(&v12, 0);
  }
  return Implementation != (IMP)UIKBEmojiZeroWidthJoiner_block_invoke_2_BaseImplementation;
}

void __76__UICollectionViewCellAccessibility__accessibilityImplementsDefaultRowRange__block_invoke_2(uint64_t a1)
{
  objc_class *v1;
  objc_class *v2;
  NSString *v3;
  NSObject *log;
  os_log_type_t type;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  char v10;
  id v11;
  Method InstanceMethod;
  uint64_t v13;
  uint64_t v14;
  uint8_t v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v14 = a1;
  v13 = a1;
  v1 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v1, sel_accessibilityRowRange);
  if (InstanceMethod)
  {
    UIKBEmojiZeroWidthJoiner_block_invoke_2_BaseImplementation = (uint64_t)method_getImplementation(InstanceMethod);
  }
  else
  {
    v11 = (id)AXLogCommon();
    v10 = 17;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_FAULT))
    {
      log = v11;
      type = v10;
      v7 = NSStringFromSelector(sel_accessibilityRowRange);
      v3 = v7;
      v9 = v3;
      v2 = (objc_class *)objc_opt_class();
      v6 = NSStringFromClass(v2);
      v8 = v6;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v15, (uint64_t)v3, (uint64_t)v8);
      _os_log_fault_impl(&dword_230C4A000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v15, 0x16u);

      objc_storeStrong((id *)&v8, 0);
      objc_storeStrong((id *)&v9, 0);
    }
    objc_storeStrong(&v11, 0);
  }
}

- (BOOL)accessibilityScrollToVisible
{
  id v2;
  id v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  uint64_t v27;
  double v28;
  double v29;
  uint64_t v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  double v35;
  double v36;
  uint64_t v37;
  uint64_t v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  id v47;
  uint64_t v48;
  double MinX;
  double MaxX;
  double MinY;
  double MaxY;
  id v53;
  id v54;
  BOOL v55;
  BOOL v56;
  id v57;
  id v58;
  UICollectionViewCellAccessibility *v59;
  char v60;
  char v61;
  CGRect v62;
  CGRect v63;
  double v64;
  double v65;
  uint64_t v66;
  uint64_t v67;
  CGRect rect1;
  id v69;
  char v70;
  uint64_t v71;
  uint64_t v72;
  double v73;
  uint64_t v74;
  uint64_t v75;
  double v76;
  CGRect rect2;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  double v81;
  double v82;
  uint64_t v83;
  uint64_t v84;
  double v85;
  uint64_t v86;
  double v87;
  CGRect v88;
  double v89;
  double v90;
  uint64_t v91;
  uint64_t v92;
  CGRect v93;
  char v94;
  _BYTE v95[9];
  uint64_t v96;
  id v97;
  id v98;
  int v99;
  char v100;
  id v101;
  id v102;
  id v103[2];
  UICollectionViewCellAccessibility *v104;
  char v105;
  double v106;
  double v107;
  double v108;
  double v109;

  v104 = self;
  v103[1] = (id)a2;
  v2 = (id)AXRetainAutorelease();
  v103[0] = (id)-[UICollectionViewCellAccessibility _accessibilityParentView](v104, "_accessibilityParentView");
  v102 = -[UICollectionViewCellAccessibility _accessibilityParentCollectionView](v104, "_accessibilityParentCollectionView");
  objc_opt_class();
  v100 = 0;
  v56 = 1;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v101 = -[UICollectionViewCellAccessibility _accessibilityParentScrollView](v104);
    v100 = 1;
    v56 = v101 != v102;
  }
  if ((v100 & 1) != 0)

  if (v56)
  {
    v105 = 0;
    v99 = 1;
  }
  else if ((objc_msgSend(v102, "_accessibilityShouldAvoidScrollingCollectionViewCells") & 1) != 0)
  {
    v105 = 0;
    v99 = 1;
  }
  else
  {
    v98 = (id)objc_msgSend(v102, "indexPathsForVisibleItems");
    v97 = (id)objc_msgSend(v102, "indexPathForCell:", v104);
    if (v97)
    {
      v96 = 0;
      v95[8] = 0;
      v54 = (id)-[UICollectionViewCellAccessibility safeValueForKey:](v104, "safeValueForKey:", CFSTR("window"));
      v3 = (id)AXUIKeyboardWindow();
      v55 = v54 == v3;

      *(_QWORD *)v95 = v55;
      v94 = 0;
      if (!v55 && (_UIAXObjectIsBehindKeyboard() & 1) != 0)
      {
        v96 = 1;
        v94 = 1;
      }
      if ((v94 & 1) == 0)
      {
        v53 = (id)objc_msgSend(v102, "safeValueForKey:", CFSTR("visibleBounds"));
        objc_msgSend(v53, "rectValue");
        v93.origin.x = v4;
        v93.origin.y = v5;
        v93.size.width = v6;
        v93.size.height = v7;

        objc_msgSend(v102, "_accessibilityVisibleContentInset");
        v89 = v8;
        v90 = v9;
        v91 = v10;
        v92 = v11;
        v88.origin.x = UIEdgeInsetsInsetRect(v93.origin.x, v93.origin.y, v93.size.width, v93.size.height, v8, v9);
        v88.origin.y = v12;
        v88.size.width = v13;
        v88.size.height = v14;
        v93 = v88;
        -[UICollectionViewCellAccessibility bounds](v104, "bounds");
        v83 = v15;
        v84 = v16;
        v85 = v17;
        v86 = v18;
        v87 = v17 * 1.5;
        -[UICollectionViewCellAccessibility bounds](v104, "bounds");
        v78 = v19;
        v79 = v20;
        v80 = v21;
        v81 = v22;
        v82 = v22 * 1.5;
        objc_msgSend(v103[0], "frame");
        rect2.origin.x = v23;
        rect2.origin.y = v24;
        rect2.size.width = v25;
        rect2.size.height = v26;
        if (!CGRectContainsRect(v88, rect2))
        {
          MaxY = CGRectGetMaxY(rect2);
          v109 = MaxY - CGRectGetMinY(v93);
          if (fabs(v109) > v82 || (MinY = CGRectGetMinY(rect2), v108 = MinY - CGRectGetMaxY(v93), fabs(v108) > v82))
          {
            objc_msgSend(v102, "contentSize");
            v75 = v27;
            v76 = v28;
            if (v93.size.height < v28)
            {
              v96 = 2;
              v94 = 1;
            }
          }
          MaxX = CGRectGetMaxX(rect2);
          v107 = MaxX - CGRectGetMinX(v93);
          if (fabs(v107) > v87 || (MinX = CGRectGetMinX(rect2), v106 = MinX - CGRectGetMaxX(v93), fabs(v106) > v87))
          {
            objc_msgSend(v102, "contentSize");
            v73 = v29;
            v74 = v30;
            if (v93.size.width < v29)
            {
              *(_QWORD *)&v95[1] = 16;
              v94 = 1;
            }
          }
        }
      }
      v72 = objc_msgSend(v98, "count");
      if ((v94 & 1) != 0 || v72 != 1)
      {
        v71 = objc_msgSend(v102, "numberOfSections");
        if (objc_msgSend(v97, "section") < v71
          && v71
          && (v48 = objc_msgSend(v97, "item"),
              v48 < objc_msgSend(v102, "numberOfItemsInSection:", objc_msgSend(v97, "section"))))
        {
          if (*(_QWORD *)&v95[1] || v96)
          {
            v70 = -[UICollectionViewCellAccessibility _accessibilityCollectionViewCellScrollShouldInformScrollDelegate](v104, "_accessibilityCollectionViewCellScrollShouldInformScrollDelegate") & 1;
            v69 = (id)objc_msgSend(v102, "delegate");
            if ((v70 & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v69, "scrollViewWillBeginDragging:", v102);
            objc_msgSend(v102, "scrollToItemAtIndexPath:atScrollPosition:animated:", v97, *(_QWORD *)&v95[1] | v96, 0);
            v47 = (id)objc_msgSend(v102, "safeValueForKey:", CFSTR("visibleBounds"));
            objc_msgSend(v47, "rectValue");
            rect1.origin.x = v31;
            rect1.origin.y = v32;
            rect1.size.width = v33;
            rect1.size.height = v34;

            objc_msgSend(v102, "_accessibilityVisibleContentInset");
            v64 = v35;
            v65 = v36;
            v66 = v37;
            v67 = v38;
            v63.origin.x = UIEdgeInsetsInsetRect(rect1.origin.x, rect1.origin.y, rect1.size.width, rect1.size.height, v35, v36);
            v63.origin.y = v39;
            v63.size.width = v40;
            v63.size.height = v41;
            rect1 = v63;
            objc_msgSend(v103[0], "frame");
            v62.origin.x = v42;
            v62.origin.y = v43;
            v62.size.width = v44;
            v62.size.height = v45;
            if (!CGRectContainsRect(v63, v62) && !CGRectContainsRect(v62, rect1))
              objc_msgSend(v102, "scrollRectToVisible:animated:", 0, v62.origin.x, v62.origin.y, v62.size.width, v62.size.height);
            v60 = v70 & 1;
            v57 = v69;
            v58 = v102;
            v61 = v95[0] & 1;
            v59 = v104;
            AXPerformBlockOnMainThreadAfterDelay();
            v105 = 1;
            v99 = 1;
            objc_storeStrong((id *)&v59, 0);
            objc_storeStrong(&v58, 0);
            objc_storeStrong(&v57, 0);
            objc_storeStrong(&v69, 0);
          }
          else
          {
            v105 = 0;
            v99 = 1;
          }
        }
        else
        {
          v105 = 0;
          v99 = 1;
        }
      }
      else
      {
        v105 = 0;
        v99 = 1;
      }
    }
    else
    {
      v105 = 0;
      v99 = 1;
    }
    objc_storeStrong(&v97, 0);
    objc_storeStrong(&v98, 0);
  }
  objc_storeStrong(&v102, 0);
  objc_storeStrong(v103, 0);
  return v105 & 1;
}

void __65__UICollectionViewCellAccessibility_accessibilityScrollToVisible__block_invoke(uint64_t a1)
{
  int v1;
  char v3;
  id v4;
  char v5;
  id v6;

  if ((*(_BYTE *)(a1 + 56) & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "scrollViewDidEndDragging:willDecelerate:", *(_QWORD *)(a1 + 40), 0);
  if ((*(_BYTE *)(a1 + 56) & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "scrollViewWillBeginDecelerating:", *(_QWORD *)(a1 + 40));
  if ((*(_BYTE *)(a1 + 56) & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "scrollViewDidEndDecelerating:", *(_QWORD *)(a1 + 40));
  v5 = 0;
  v3 = 0;
  LOBYTE(v1) = 0;
  if ((*(_BYTE *)(a1 + 57) & 1) == 0)
  {
    v6 = (id)objc_msgSend(*(id *)(a1 + 48), "_accessibilityWindow");
    v5 = 1;
    v4 = (id)objc_msgSend(v6, "firstResponder");
    v3 = 1;
    v1 = objc_msgSend(v4, "_accessibilityIsDescendantOfElement:", *(_QWORD *)(a1 + 48)) ^ 1;
  }
  if ((v3 & 1) != 0)

  if ((v5 & 1) != 0)
  if ((v1 & 1) != 0)
    _UIAXDismissKeyboardIfNecessary();
}

- (BOOL)_accessibilityIsOutsideParentBounds
{
  CGFloat v2;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  id v7;
  _BOOL4 v8;
  CGRect rect2;
  CGRect v10;
  id v11[2];
  UICollectionViewCellAccessibility *v12;
  CGRect v13;

  v12 = self;
  v11[1] = (id)a2;
  v11[0] = (id)-[UICollectionViewCellAccessibility accessibilityContainer](self, "accessibilityContainer");
  v7 = (id)objc_msgSend(v11[0], "window");
  objc_msgSend(v7, "accessibilityFrame");
  v10 = CGRectInset(v13, 0.0, 40.0);
  -[UICollectionViewCellAccessibility accessibilityFrame](v12, "accessibilityFrame");
  rect2.origin.x = v2;
  rect2.origin.y = v3;
  rect2.size.width = v4;
  rect2.size.height = v5;
  v8 = !CGRectContainsRect(v10, rect2);

  objc_storeStrong(v11, 0);
  return v8;
}

- (id)accessibilityDragSourceDescriptors
{
  double v2;
  double v3;
  double v4;
  double v5;
  id v7;
  id v8;
  id v9;
  id v10;
  double v11;
  double v12;
  id v13;
  id v14;
  char v15;
  id v16;
  id v17;
  id v18;
  char v19;
  id v20;
  id v21;
  int v22;
  id v23[2];
  UICollectionViewCellAccessibility *v24;
  id v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v24 = self;
  v23[1] = (id)a2;
  v23[0] = (id)-[UICollectionViewCellAccessibility accessibilityUserDefinedDragSourceDescriptors](self, "accessibilityUserDefinedDragSourceDescriptors");
  if (v23[0])
  {
    v25 = v23[0];
    v22 = 1;
  }
  else
  {
    v21 = -[UICollectionViewCellAccessibility _accessibilityParentCollectionView](v24, "_accessibilityParentCollectionView");
    v19 = 0;
    v10 = (id)objc_msgSend(v21, "safeValueForKeyPath:", CFSTR("_dragAndDropController.sourceController"));
    v18 = (id)__UIAccessibilitySafeClass();

    v17 = v18;
    objc_storeStrong(&v18, 0);
    v20 = v17;
    if (v17)
    {
      v15 = 0;
      objc_opt_class();
      v14 = (id)__UIAccessibilityCastAsClass();
      v13 = v14;
      objc_storeStrong(&v14, 0);
      v16 = v13;
      objc_msgSend(v13, "bounds");
      UIRectGetCenter();
      objc_msgSend(v13, "convertPoint:toView:", v21, v2, v3);
      v11 = v4;
      v12 = v5;
      v7 = objc_alloc(MEMORY[0x24BDF67B0]);
      v9 = accessibilityLocalizedString(CFSTR("drag.collection.view.cell"));
      v8 = (id)objc_msgSend(v7, "initWithName:point:inView:", v11, v12);
      v26[0] = v8;
      v25 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 1);

      v22 = 1;
      objc_storeStrong(&v16, 0);
    }
    else
    {
      v25 = 0;
      v22 = 1;
    }
    objc_storeStrong(&v20, 0);
    objc_storeStrong(&v21, 0);
  }
  objc_storeStrong(v23, 0);
  return v25;
}

- (id)accessibilityDropPointDescriptors
{
  double v2;
  double v3;
  double v4;
  double v5;
  id v7;
  id v8;
  id v9;
  id v10;
  double v11;
  double v12;
  id v13;
  id v14;
  char v15;
  id v16;
  id v17;
  id v18;
  char v19;
  id v20;
  id v21;
  int v22;
  id v23[2];
  UICollectionViewCellAccessibility *v24;
  id v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v24 = self;
  v23[1] = (id)a2;
  v23[0] = (id)-[UICollectionViewCellAccessibility accessibilityUserDefinedDropPointDescriptors](self, "accessibilityUserDefinedDropPointDescriptors");
  if (v23[0])
  {
    v25 = v23[0];
    v22 = 1;
  }
  else
  {
    v21 = -[UICollectionViewCellAccessibility _accessibilityParentCollectionView](v24, "_accessibilityParentCollectionView");
    v19 = 0;
    v10 = (id)objc_msgSend(v21, "safeValueForKey:", CFSTR("dragAndDropController"));
    v18 = (id)__UIAccessibilitySafeClass();

    v17 = v18;
    objc_storeStrong(&v18, 0);
    v20 = v17;
    if (v17)
    {
      v15 = 0;
      objc_opt_class();
      v14 = (id)__UIAccessibilityCastAsClass();
      v13 = v14;
      objc_storeStrong(&v14, 0);
      v16 = v13;
      objc_msgSend(v13, "bounds");
      UIRectGetCenter();
      objc_msgSend(v13, "convertPoint:toView:", v21, v2, v3);
      v11 = v4;
      v12 = v5;
      v7 = objc_alloc(MEMORY[0x24BDF67B0]);
      v9 = accessibilityLocalizedString(CFSTR("drop.collection.view.cell.onto"));
      v8 = (id)objc_msgSend(v7, "initWithName:point:inView:", v11, v12);
      v26[0] = v8;
      v25 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 1);

      v22 = 1;
      objc_storeStrong(&v16, 0);
    }
    else
    {
      v25 = 0;
      v22 = 1;
    }
    objc_storeStrong(&v20, 0);
    objc_storeStrong(&v21, 0);
  }
  objc_storeStrong(v23, 0);
  return v25;
}

- (BOOL)isAccessibilityElement
{
  id v2;
  id v4;
  id v5;
  BOOL v6;
  id v7;
  BOOL v8;
  objc_super v9;
  SEL v10;
  UICollectionViewCellAccessibility *v11;
  BOOL v12;

  v11 = self;
  v10 = a2;
  v2 = (id)-[UICollectionViewCellAccessibility isAccessibilityUserDefinedElement](self, "isAccessibilityUserDefinedElement");
  v8 = v2 == 0;

  if (v8)
  {
    v5 = (id)-[UICollectionViewCellAccessibility safeValueForKey:](v11, "safeValueForKey:", CFSTR("contentConfiguration"));
    v4 = (id)objc_msgSend(v5, "accessibilityLabel");
    v6 = objc_msgSend(v4, "length") == 0;

    if (v6)
    {
      v9.receiver = v11;
      v9.super_class = (Class)UICollectionViewCellAccessibility;
      return -[UICollectionViewCellAccessibility isAccessibilityElement](&v9, sel_isAccessibilityElement);
    }
    else
    {
      return 1;
    }
  }
  else
  {
    v7 = (id)-[UICollectionViewCellAccessibility isAccessibilityUserDefinedElement](v11, "isAccessibilityUserDefinedElement");
    v12 = objc_msgSend(v7, "BOOLValue") & 1;

  }
  return v12;
}

- (BOOL)_isEligibleForFocusInteraction
{
  int v3;
  char v4;
  id v5;
  id v6;
  id v7;
  char v8;
  objc_super v9;
  char v10;
  SEL v11;
  UICollectionViewCellAccessibility *v12;

  v12 = self;
  v11 = a2;
  v10 = 0;
  v9.receiver = self;
  v9.super_class = (Class)UICollectionViewCellAccessibility;
  v10 = -[UICollectionViewCellAccessibility _isEligibleForFocusInteraction](&v9, sel__isEligibleForFocusInteraction);
  v4 = 0;
  LOBYTE(v3) = 0;
  if ((-[UICollectionViewCellAccessibility _accessibilityIsFKARunningForFocusItem](v12, "_accessibilityIsFKARunningForFocusItem") & 1) != 0)
  {
    LOBYTE(v3) = 0;
    if ((v10 & 1) != 0)
    {
      v8 = 0;
      objc_opt_class();
      v7 = (id)__UIAccessibilityCastAsClass();
      v6 = v7;
      objc_storeStrong(&v7, 0);
      v5 = v6;
      v4 = 1;
      v3 = objc_msgSend(v6, "isUserInteractionEnabled") ^ 1;
    }
  }
  if ((v4 & 1) != 0)

  if ((v3 & 1) != 0)
    v10 = 0;
  return v10 & 1;
}

- (void)_setPopupMenuButton:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  id v11;
  id v12[2];
  id v13[3];
  void *v14;
  id v15;
  objc_super v16;
  id location[2];
  UICollectionViewCellAccessibility *v18;

  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16.receiver = v18;
  v16.super_class = (Class)UICollectionViewCellAccessibility;
  -[UICollectionViewCellAccessibility _setPopupMenuButton:](&v16, sel__setPopupMenuButton_, location[0]);
  objc_initWeak(&v15, location[0]);
  v4 = objc_loadWeakRetained(&v15);
  v5 = objc_msgSend(v4, "accessibilityTraits");

  v14 = (void *)v5;
  objc_initWeak(v13, v18);
  v3 = location[0];
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __57__UICollectionViewCellAccessibility__setPopupMenuButton___block_invoke;
  v10 = &unk_24FF3EA80;
  objc_copyWeak(&v11, v13);
  objc_copyWeak(v12, &v15);
  v12[1] = v14;
  objc_msgSend(v3, "_setAccessibilityTraitsBlock:", &v6);
  objc_destroyWeak(v12);
  objc_destroyWeak(&v11);
  objc_destroyWeak(v13);
  objc_destroyWeak(&v15);
  objc_storeStrong(location, 0);
}

uint64_t __57__UICollectionViewCellAccessibility__setPopupMenuButton___block_invoke(uint64_t a1)
{
  id WeakRetained;
  int v4;
  char v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = 0;
  LOBYTE(v4) = 0;
  if ((objc_msgSend(WeakRetained, "_accessibilityIsUserInteractionEnabled") & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)(a1 + 40));
    v5 = 1;
    v4 = objc_msgSend(v6, "_accessibilityIsUserInteractionEnabled") ^ 1;
  }
  if ((v5 & 1) != 0)

  if ((v4 & 1) != 0)
    return *(_QWORD *)(a1 + 48) & ~*MEMORY[0x24BDF73E8];
  else
    return *(_QWORD *)(a1 + 48);
}

- (BOOL)canBecomeFocused
{
  id v2;
  objc_class *v3;
  id v4;
  id v5;
  BOOL v7;
  BOOL v8;
  id v9;
  BOOL v10;
  BOOL v11;
  objc_super v12;
  char v13;
  SEL v14;
  UICollectionViewCellAccessibility *v15;
  char v16;
  id location;
  dispatch_once_t *v18;

  v15 = self;
  v14 = a2;
  v13 = 0;
  v12.receiver = self;
  v12.super_class = (Class)UICollectionViewCellAccessibility;
  v13 = -[UICollectionViewCellAccessibility canBecomeFocused](&v12, sel_canBecomeFocused);
  if ((-[UICollectionViewCellAccessibility _accessibilityIsFKARunningForFocusItem](v15, "_accessibilityIsFKARunningForFocusItem") & 1) == 0)
  {
LABEL_16:
    v16 = v13 & 1;
    return v16 & 1;
  }
  v2 = (id)-[UICollectionViewCellAccessibility storedAccessibilityRespondsToUserInteraction](v15, "storedAccessibilityRespondsToUserInteraction");
  v10 = v2 == 0;

  if (v10)
  {
    if ((v13 & 1) == 0
      && (-[UICollectionViewCellAccessibility accessibilityRespondsToUserInteraction](v15, "accessibilityRespondsToUserInteraction") & 1) != 0)
    {
      v18 = (dispatch_once_t *)&canBecomeFocused_onceToken;
      location = 0;
      objc_storeStrong(&location, &__block_literal_global_363);
      if (*v18 != -1)
        dispatch_once(v18, location);
      objc_storeStrong(&location, 0);
      v3 = (objc_class *)objc_opt_class();
      v11 = class_getInstanceMethod(v3, sel_accessibilityRespondsToUserInteraction) != (Method)canBecomeFocused_accessibilityRespondsToUserInteractionBaseMethod;
      v4 = (id)-[UICollectionViewCellAccessibility storedAccessibilityRespondsToUserInteraction](v15, "storedAccessibilityRespondsToUserInteraction");
      v7 = v4 != 0;

      v8 = 1;
      if (!v11)
      {
        v8 = 1;
        if (!v7)
        {
          v8 = 1;
          if ((-[UICollectionViewCellAccessibility safeBoolForKey:](v15, "safeBoolForKey:", CFSTR("_accessibilityRespondsToUserInteraction")) & 1) == 0)v8 = -[UICollectionViewCellAccessibility accessibilityTraits](v15, "accessibilityTraits") != 0;
        }
      }
      v13 = v8;
    }
    if ((v13 & 1) != 0)
    {
      v13 = !-[UICollectionViewCellAccessibility _axContentViewHasSingleFocusableSubview](v15);
      if (v13)
      {
        v5 = (id)-[UICollectionViewCellAccessibility _accessibilityFindSubviewDescendant:](v15, "_accessibilityFindSubviewDescendant:", &__block_literal_global_367);
        v13 = v5 == 0;

      }
    }
    goto LABEL_16;
  }
  v9 = (id)-[UICollectionViewCellAccessibility storedAccessibilityRespondsToUserInteraction](v15, "storedAccessibilityRespondsToUserInteraction");
  v16 = objc_msgSend(v9, "BOOLValue") & 1;

  return v16 & 1;
}

Method __53__UICollectionViewCellAccessibility_canBecomeFocused__block_invoke()
{
  objc_class *v0;
  Method result;

  v0 = (objc_class *)objc_opt_class();
  result = class_getInstanceMethod(v0, sel_accessibilityRespondsToUserInteraction);
  canBecomeFocused_accessibilityRespondsToUserInteractionBaseMethod = (uint64_t)result;
  return result;
}

- (BOOL)_axContentViewHasSingleFocusableSubview
{
  double v1;
  double v2;
  double v3;
  double v4;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id obj;
  uint64_t v11;
  int v12;
  double v13;
  double v14;
  _QWORD __b[8];
  id v16;
  char v17;
  id v18;
  id v19;
  id v20;
  id location;
  id v22;
  BOOL v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v22 = a1;
  if (a1)
  {
    location = 0;
    v20 = (id)objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCEB8]), "init");
    v19 = (id)objc_msgSend(v22, "safeUIViewForKey:", CFSTR("_contentView"));
    objc_msgSend(v20, "axSafelyAddObject:", v19);
    do
    {
      if (!objc_msgSend(v20, "count"))
        break;
      v18 = (id)objc_msgSend(v20, "firstObject");
      objc_msgSend(v20, "removeObjectAtIndex:", 0);
      v17 = 0;
      if ((objc_msgSend(v18, "safeBoolForKey:", CFSTR("_isEligibleForFocusInteraction")) & 1) != 0
        && ((objc_msgSend(v18, "canBecomeFocused") & 1) != 0 || (objc_msgSend(v18, "isFocused") & 1) != 0))
      {
        objc_storeStrong(&location, v18);
        v17 = 1;
      }
      else
      {
        memset(__b, 0, sizeof(__b));
        obj = (id)objc_msgSend(v18, "subviews");
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v24, 16);
        if (v11)
        {
          v7 = *(_QWORD *)__b[2];
          v8 = 0;
          v9 = v11;
          while (1)
          {
            if (*(_QWORD *)__b[2] != v7)
              objc_enumerationMutation(obj);
            v16 = *(id *)(__b[1] + 8 * v8);
            objc_msgSend(v16, "frame");
            v13 = v1;
            v14 = v2;
            objc_msgSend(v18, "frame");
            if (!__CGSizeEqualToSize_0(v13, v14, v3, v4))
              break;
            objc_msgSend(v20, "addObject:", v16);
            if (++v8 >= v9)
            {
              v8 = 0;
              v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v24, 16);
              if (!v9)
                break;
            }
          }
        }

      }
      v12 = (v17 & 1) != 0 ? 3 : 0;
      objc_storeStrong(&v18, 0);
    }
    while (!v12);
    v23 = location != 0;
    objc_storeStrong(&v19, 0);
    objc_storeStrong(&v20, 0);
    objc_storeStrong(&location, 0);
  }
  else
  {
    return 0;
  }
  return v23;
}

uint64_t __53__UICollectionViewCellAccessibility_canBecomeFocused__block_invoke_2(void *a1, void *a2)
{
  char isKindOfClass;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  objc_storeStrong(location, 0);
  return isKindOfClass & 1;
}

- (_NSRange)_accessibilityIndexPathAsRange
{
  NSUInteger v2;
  NSUInteger v3;
  id location[3];
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _NSRange result;

  location[2] = self;
  location[1] = (id)a2;
  v8 = 0x7FFFFFFFLL;
  v7 = 0;
  v9 = 0x7FFFFFFFLL;
  v10 = 0;
  v5 = 0x7FFFFFFFLL;
  v6 = 0;
  location[0] = -[UICollectionViewCellAccessibility _accessibilityIndexPath](self, "_accessibilityIndexPath");
  if (location[0])
  {
    v5 = objc_msgSend(location[0], "item");
    v6 = objc_msgSend(location[0], "section");
  }
  objc_storeStrong(location, 0);
  v2 = v5;
  v3 = v6;
  result.length = v3;
  result.location = v2;
  return result;
}

- (BOOL)_accessibilityIsInCollectionCell
{
  return 1;
}

@end

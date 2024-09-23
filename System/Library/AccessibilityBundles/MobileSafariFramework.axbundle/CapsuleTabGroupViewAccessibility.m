@implementation CapsuleTabGroupViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MobileSafari.CapsuleTabGroupView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("MobileSafari.CapsuleTabGroupView"), CFSTR("titleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("MobileSafari.CapsuleTabGroupView"), CFSTR("isSelected"), "Bool");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MobileSafari.ScrollingCapsuleCollectionView"), CFSTR("accessibilityTapItemAtIndex:"), "v", "q", 0);
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("MobileSafari.ScrollingCapsuleCollectionView[class].Layout"), CFSTR("content"), "Content");
  objc_msgSend(v3, "validateSwiftStruct:hasSwiftField:withSwiftType:", CFSTR("MobileSafari.ScrollingCapsuleCollectionView[class].Content"), CFSTR("items"), "Array<Item>");
  objc_msgSend(v3, "validateSwiftStruct:hasSwiftField:withSwiftType:", CFSTR("MobileSafari.ScrollingCapsuleCollectionView[class].Item"), CFSTR("isInteractivelyInserted"), "Bool");
  objc_msgSend(v3, "validateSwiftStruct:hasSwiftField:withSwiftType:", CFSTR("MobileSafari.ScrollingCapsuleCollectionView[class].Item"), CFSTR("id"), "UUID");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UILabel"), CFSTR("text"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CapsuleTabGroupViewAccessibility;
  -[CapsuleTabGroupViewAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[CapsuleTabGroupViewAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)accessibilityActivate
{
  _BOOL4 v3;
  void *v4;
  id v5;
  void *v7;

  v3 = -[CapsuleTabGroupViewAccessibility _axIsInteractionEnabled](self, "_axIsInteractionEnabled");
  if (v3)
  {
    -[CapsuleTabGroupViewAccessibility _accessibilityAllTabGroups](self, "_accessibilityAllTabGroups");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CapsuleTabGroupViewAccessibility _accessibilityIndexOfSelfIn:](self, "_accessibilityIndexOfSelfIn:", v4);
    -[CapsuleTabGroupViewAccessibility _accessibilityCapsuleCollectionView](self, "_accessibilityCapsuleCollectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v7;
    AXPerformSafeBlock();
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], self);

  }
  return v3;
}

uint64_t __57__CapsuleTabGroupViewAccessibility_accessibilityActivate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessibilityTapItemAtIndex:", *(_QWORD *)(a1 + 40));
}

- (BOOL)_accessibilityScrollToVisible
{
  return 0;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  int v4;
  uint64_t v5;
  unint64_t v6;
  _BOOL4 v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CapsuleTabGroupViewAccessibility;
  v3 = *MEMORY[0x24BDF73B0] | -[CapsuleTabGroupViewAccessibility accessibilityTraits](&v10, sel_accessibilityTraits);
  v4 = -[CapsuleTabGroupViewAccessibility safeSwiftBoolForKey:](self, "safeSwiftBoolForKey:", CFSTR("isSelected"));
  v5 = *MEMORY[0x24BDF7400];
  if (!v4)
    v5 = 0;
  v6 = v3 | v5;
  v7 = -[CapsuleTabGroupViewAccessibility _axIsInteractionEnabled](self, "_axIsInteractionEnabled");
  v8 = *MEMORY[0x24BDF73E8];
  if (v7)
    v8 = 0;
  return v6 | v8;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  void *v4;
  void *v6;

  -[CapsuleTabGroupViewAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("titleLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("text"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityMobileSafariLocalizedString(CFSTR("tab.group"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v15;
  id v16;
  _QWORD v17[5];
  _QWORD v18[5];
  id v19;

  if (!-[CapsuleTabGroupViewAccessibility _axIsInteractionEnabled](self, "_axIsInteractionEnabled"))
    return 0;
  -[CapsuleTabGroupViewAccessibility _accessibilityCapsuleCollectionView](self, "_accessibilityCapsuleCollectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CapsuleTabGroupViewAccessibility _accessibilityAllTabGroups](self, "_accessibilityAllTabGroups");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CapsuleTabGroupViewAccessibility _accessibilityIndexOfSelfIn:](self, "_accessibilityIndexOfSelfIn:", v6);
  objc_msgSend(v5, "safeSwiftValueForKey:", CFSTR("$__lazy_storage_$_scrollView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = 0;
    if (-[CapsuleTabGroupViewAccessibility safeSwiftBoolForKey:](self, "safeSwiftBoolForKey:", CFSTR("isSelected"))&& v7 != -1)
    {
      v18[0] = 0;
      v18[1] = v18;
      v18[2] = 0x3032000000;
      v18[3] = __Block_byref_object_copy__0;
      v18[4] = __Block_byref_object_dispose__0;
      objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "safeSwiftValueForKey:", CFSTR("id"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "safeStringForKey:", CFSTR("UUIDString"));
      v19 = (id)objc_claimAutoreleasedReturnValue();

      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __56__CapsuleTabGroupViewAccessibility_accessibilityScroll___block_invoke;
      v17[3] = &unk_250296908;
      v17[4] = v18;
      v12 = objc_msgSend(v6, "indexOfObjectPassingTest:", v17);
      if (v12 == 0x7FFFFFFFFFFFFFFFLL
        || (unint64_t)(a3 - 1) > 5
        || (v13 = v12 + qword_2327B5700[a3 - 1], v13 < 0)
        || v13 >= (unint64_t)objc_msgSend(v6, "count"))
      {
        v9 = 0;
      }
      else
      {
        v16 = v5;
        AXPerformSafeBlock();
        v15 = v16;
        AXPerformBlockOnMainThreadAfterDelay();

        v9 = 1;
      }
      _Block_object_dispose(v18, 8);

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t __56__CapsuleTabGroupViewAccessibility_accessibilityScroll___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "safeSwiftValueForKey:", CFSTR("id"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("UUIDString"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  return v5;
}

uint64_t __56__CapsuleTabGroupViewAccessibility_accessibilityScroll___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessibilityTapItemAtIndex:", *(_QWORD *)(a1 + 40));
}

void __56__CapsuleTabGroupViewAccessibility_accessibilityScroll___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  uint64_t v6;
  uint64_t v7;
  UIAccessibilityNotifications v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "_accessibilityAccessibleDescendants");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v12, "indexOfObject:", *(_QWORD *)(a1 + 40));
  if ((unint64_t)objc_msgSend(v12, "count") < 2)
  {
    if (objc_msgSend(v12, "count") == 1)
    {
      v8 = *MEMORY[0x24BDF7328];
      v9 = v12;
      v10 = 0;
      goto LABEL_11;
    }
  }
  else
  {
    v3 = *(_QWORD *)(a1 + 48);
    v4 = *(_QWORD *)(a1 + 56);
    v5 = v3 <= v4;
    if (v3 >= v4)
      v6 = 0;
    else
      v6 = -1;
    if (!v5)
      v6 = 1;
    v7 = v6 + v2;
    if (v6 + v2 < (unint64_t)objc_msgSend(v12, "count"))
    {
      v8 = *MEMORY[0x24BDF7328];
      v9 = v12;
      v10 = v7;
LABEL_11:
      objc_msgSend(v9, "objectAtIndexedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      UIAccessibilityPostNotification(v8, v11);

    }
  }

}

- (BOOL)_accessibilityShouldIncludeRowRangeInElementDescription
{
  return 1;
}

- (_NSRange)accessibilityRowRange
{
  void *v3;
  unint64_t v4;
  NSUInteger v5;
  uint64_t v6;
  NSUInteger v7;
  NSUInteger v8;
  _NSRange result;

  -[CapsuleTabGroupViewAccessibility _accessibilityAllTabGroups](self, "_accessibilityAllTabGroups");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CapsuleTabGroupViewAccessibility _accessibilityIndexOfSelfIn:](self, "_accessibilityIndexOfSelfIn:", v3);
  if (v4 == -1 || (v5 = v4, v4 >= objc_msgSend(v3, "count")))
  {
    v5 = 0;
    v6 = 0;
  }
  else
  {
    v6 = objc_msgSend(v3, "count");
  }

  v7 = v5;
  v8 = v6;
  result.length = v8;
  result.location = v7;
  return result;
}

- (id)_accessibilityAllTabGroups
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[CapsuleTabGroupViewAccessibility _accessibilityCapsuleCollectionView](self, "_accessibilityCapsuleCollectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeSwiftValueForKey:", CFSTR("$__lazy_storage_$_layout"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeSwiftValueForKey:", CFSTR("content"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeSwiftValueForKey:", CFSTR("items"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "ax_filteredArrayUsingBlock:", &__block_literal_global_1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __62__CapsuleTabGroupViewAccessibility__accessibilityAllTabGroups__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "safeSwiftBoolForKey:", CFSTR("isInteractivelyInserted")) ^ 1;
}

- (id)_accessibilityCapsuleCollectionView
{
  CapsuleTabGroupViewAccessibility *v2;
  CapsuleTabGroupViewAccessibility *v3;
  CapsuleTabGroupViewAccessibility *v4;
  CapsuleTabGroupViewAccessibility *v5;

  v2 = self;
  if (v2)
  {
    v3 = v2;
    do
    {
      MEMORY[0x23491571C](CFSTR("MobileSafari.ScrollingCapsuleCollectionView"));
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v4 = v3;
      else
        v4 = 0;
      -[CapsuleTabGroupViewAccessibility superview](v3, "superview");
      v5 = (CapsuleTabGroupViewAccessibility *)objc_claimAutoreleasedReturnValue();

      if (v4)
        break;
      v3 = v5;
    }
    while (v5);
  }
  else
  {
    v5 = 0;
    v4 = 0;
  }

  return v4;
}

- (int64_t)_accessibilityIndexOfSelfIn:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  -[CapsuleTabGroupViewAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("titleLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("text"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && objc_msgSend(v4, "count"))
  {
    v7 = 0;
    while (1)
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "safeSwiftStringForKey:", CFSTR("title"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", v6);

      if ((v10 & 1) != 0)
        break;
      if (++v7 >= (unint64_t)objc_msgSend(v4, "count"))
        goto LABEL_6;
    }
  }
  else
  {
LABEL_6:
    v7 = -1;
  }

  return v7;
}

- (BOOL)_accessibilityIsScrollable
{
  return 1;
}

- (BOOL)_axIsInteractionEnabled
{
  void *v2;
  void *v3;
  void *v4;

  -[CapsuleTabGroupViewAccessibility _accessibilityCapsuleCollectionView](self, "_accessibilityCapsuleCollectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v2, "safeSwiftValueForKey:", CFSTR("scrollView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v4, "isUserInteractionEnabled");
  return (char)v3;
}

@end

@implementation RecentsCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ConversationKit.RecentsCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("ConversationKit.RecentsCollectionViewCell"), CFSTR("UICollectionViewListCell"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationKit.RecentsCollectionViewCell"), CFSTR("trailingAccessoryView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("ConversationKit.RecentsCollectionViewCell"), CFSTR("listItemViewHelper"), "Optional<RecentsListItemViewHelper>");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("TelephonyUI.RecentsListItemViewHelper"), CFSTR("messageIndicatorView"), "Optional<MessageIndicatorView>");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("TelephonyUI.MessageIndicatorView"), CFSTR("titleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TelephonyUI.MessageIndicatorView"), CFSTR("handleTapGesture"), "v", 0);

}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[RecentsCollectionViewCellAccessibility _accessibilityFindSubviewDescendantsPassingTest:](self, "_accessibilityFindSubviewDescendantsPassingTest:", &__block_literal_global_0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x23490C134]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

BOOL __60__RecentsCollectionViewCellAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  char isKindOfClass;
  int v6;
  void *v7;
  _BOOL8 v8;

  v4 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v4, "accessibilityIdentifier");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v2, "isEqualToString:", CFSTR("TelephonyUI.MessageIndicatorView.sensitive")) & 1) != 0)
    {
      v6 = 0;
    }
    else
    {
      objc_msgSend(v4, "accessibilityIdentifier");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TelephonyUI.MessageIndicatorView.unread")) & 1) == 0)
      {

        v8 = 0;
LABEL_12:

        goto LABEL_13;
      }
      v6 = 1;
    }
  }
  objc_msgSend(v4, "accessibilityLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length") != 0;

  if (v6)
  if ((isKindOfClass & 1) == 0)
    goto LABEL_12;
LABEL_13:

  return v8;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RecentsCollectionViewCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[RecentsCollectionViewCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (id)accessibilityCustomActions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  char v32;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  objc_msgSend(v4, "accessories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __68__RecentsCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke;
  v30[3] = &unk_2501E5A68;
  v8 = v3;
  v31 = v8;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v30);

  v32 = 0;
  objc_opt_class();
  -[RecentsCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("trailingAccessoryView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
    abort();
  if (v10)
  {
    v11 = objc_alloc(MEMORY[0x24BDF6788]);
    objc_msgSend(v10, "accessibilityLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v7;
    v28[1] = 3221225472;
    v28[2] = __68__RecentsCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke_3;
    v28[3] = &unk_2501E5A40;
    v29 = v10;
    v13 = (void *)objc_msgSend(v11, "initWithName:actionHandler:", v12, v28);

    objc_msgSend(v8, "addObject:", v13);
  }
  -[RecentsCollectionViewCellAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("listItemViewHelper"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "safeSwiftValueForKey:", CFSTR("messageIndicatorView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    objc_msgSend(v15, "safeSwiftValueForKey:", CFSTR("titleLabel"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "accessibilityLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_alloc(MEMORY[0x24BDF6788]);
    v20 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("play.message"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", v21, v18);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v7;
    v26[1] = 3221225472;
    v26[2] = __68__RecentsCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke_4;
    v26[3] = &unk_2501E5A40;
    v27 = v16;
    v23 = (void *)objc_msgSend(v19, "initWithName:actionHandler:", v22, v26);

    objc_msgSend(v8, "addObject:", v23);
  }
  v24 = v8;

  return v24;
}

void __68__RecentsCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  id v14;
  char v15;

  v3 = a2;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_opt_class();
  objc_msgSend(v4, "customView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "setIsAccessibilityElement:", 0);
    v7 = objc_alloc(MEMORY[0x24BDF6788]);
    objc_msgSend(v6, "accessibilityLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x24BDAC760];
    v11 = 3221225472;
    v12 = __68__RecentsCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke_2;
    v13 = &unk_2501E5A40;
    v14 = v6;
    v9 = (void *)objc_msgSend(v7, "initWithName:actionHandler:", v8, &v10);

    objc_msgSend(*(id *)(a1 + 32), "addObject:", v9, v10, v11, v12, v13);
  }

}

uint64_t __68__RecentsCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "sendActionsForControlEvents:", 64);
  return 1;
}

uint64_t __68__RecentsCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "sendActionsForControlEvents:", 64);
  return 1;
}

uint64_t __68__RecentsCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke_4(uint64_t a1)
{
  id v2;

  v2 = *(id *)(a1 + 32);
  AXPerformSafeBlock();

  return 1;
}

uint64_t __68__RecentsCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleTapGesture");
}

@end

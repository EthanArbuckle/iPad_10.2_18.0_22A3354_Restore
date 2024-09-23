@implementation MFConversationViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MFConversationViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MFConversationViewCell"), CFSTR("UICollectionViewCell"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIContextualAction"), CFSTR("executePreHandlerWithView:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIContextualAction"), CFSTR("executeHandlerWithView:completionHandler:"), "v", "@", "@?", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MFSwipableCollectionViewLayout"), CFSTR("UICollectionViewFlowLayout"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFSwipableCollectionViewLayout"), CFSTR("swipeController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFSwipableCollectionViewLayout"), CFSTR("swipeActionController:leadingSwipeConfigurationForItemAtIndexPath:"), "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFSwipableCollectionViewLayout"), CFSTR("swipeActionController:trailingSwipeConfigurationForItemAtIndexPath:"), "@", "@", "@", 0);

}

- (BOOL)accessibilityRespondsToUserInteraction
{
  return 1;
}

- (id)accessibilityCustomActions
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  MFConversationViewCellAccessibility *v10;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFConversationViewCellAccessibility _accessibilityMailSwipeActions](self, "_accessibilityMailSwipeActions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __65__MFConversationViewCellAccessibility_accessibilityCustomActions__block_invoke;
  v8[3] = &unk_250285AF8;
  v5 = v3;
  v9 = v5;
  v10 = self;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);

  v6 = v5;
  return v6;
}

void __65__MFConversationViewCellAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a2, "title");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    v3 = *(void **)(a1 + 32);
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6788]), "initWithName:target:selector:", v5, *(_QWORD *)(a1 + 40), sel__accessibilityPerformMailSwipeAction_);
    objc_msgSend(v3, "addObject:", v4);

  }
}

- (id)_accessibilityMessageIndexDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("UICollectionView")));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (_AXSAutomationEnabled())
  {
    objc_opt_class();
    -[MFConversationViewCellAccessibility accessibilityContainer](self, "accessibilityContainer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilitySafeClass();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "safeValueForKey:", CFSTR("indexPath"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v4, "indexPathForCell:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = objc_msgSend(v8, "row");
  if (objc_msgSend(v4, "numberOfSections") < 1)
  {
    v11 = 0;
  }
  else
  {
    v10 = objc_msgSend(v4, "numberOfItemsInSection:", 0);
    v11 = 0;
    if (v10 >= 2)
    {
      v12 = v10;
      v13 = v9 + 1;
      v14 = (void *)MEMORY[0x24BDD17C8];
      accessibilityLocalizedString(CFSTR("thread.message.container.label"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithFormat:", v15, v13, v12);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v11;
}

- (id)_accessibilityMailSwipeActions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;

  -[MFConversationViewCellAccessibility _accessibilityViewAncestorIsKindOf:](self, "_accessibilityViewAncestorIsKindOf:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectionViewLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  NSClassFromString(CFSTR("MFSwipableCollectionViewLayout"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFConversationViewCellAccessibility _accessibilityIndexPath](self, "_accessibilityIndexPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safeValueForKey:", CFSTR("swipeController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x24BDAC760];
    v14 = v4;
    v15 = v7;
    v16 = v6;
    v17 = v5;
    v8 = v5;
    v9 = v6;
    v10 = v7;
    AXPerformSafeBlock();
    objc_msgSend(v8, "axFilterObjectsUsingBlock:", &__block_literal_global_3, v13, 3221225472, __69__MFConversationViewCellAccessibility__accessibilityMailSwipeActions__block_invoke, &unk_250285B20);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __69__MFConversationViewCellAccessibility__accessibilityMailSwipeActions__block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  char v23;

  v23 = 0;
  objc_opt_class();
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__0;
  v21 = __Block_byref_object_dispose__0;
  v22 = 0;
  v2 = MEMORY[0x24BDAC760];
  v14 = *(id *)(a1 + 32);
  v15 = *(id *)(a1 + 40);
  v16 = *(id *)(a1 + 48);
  AXPerformSafeBlock();
  v3 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
    goto LABEL_4;
  v5 = *(void **)(a1 + 56);
  objc_msgSend(v4, "actions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "axSafelyAddObjectsFromArray:", v6);

  v23 = 0;
  objc_opt_class();
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__0;
  v21 = __Block_byref_object_dispose__0;
  v22 = 0;
  v11 = *(id *)(a1 + 32);
  v12 = *(id *)(a1 + 40);
  v13 = *(id *)(a1 + 48);
  AXPerformSafeBlock();
  v7 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  __UIAccessibilityCastAsClass();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
LABEL_4:
    abort();
  v9 = *(void **)(a1 + 56);
  objc_msgSend(v8, "actions", v2, 3221225472, __69__MFConversationViewCellAccessibility__accessibilityMailSwipeActions__block_invoke_2, &unk_250285910);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "axSafelyAddObjectsFromArray:", v10);

}

void __69__MFConversationViewCellAccessibility__accessibilityMailSwipeActions__block_invoke_218(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "swipeActionController:trailingSwipeConfigurationForItemAtIndexPath:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __69__MFConversationViewCellAccessibility__accessibilityMailSwipeActions__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "swipeActionController:leadingSwipeConfigurationForItemAtIndexPath:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

BOOL __69__MFConversationViewCellAccessibility__accessibilityMailSwipeActions__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "title");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)_accessibilityPerformMailSwipeAction:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  MFConversationViewCellAccessibility *v9;

  v4 = a3;
  -[MFConversationViewCellAccessibility _accessibilityMailSwipeActions](self, "_accessibilityMailSwipeActions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __76__MFConversationViewCellAccessibility__accessibilityPerformMailSwipeAction___block_invoke;
  v7[3] = &unk_250285AF8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

}

void __76__MFConversationViewCellAccessibility__accessibilityPerformMailSwipeAction___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  id v10;

  v6 = a2;
  objc_msgSend(v6, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9)
  {
    v10 = v6;
    AXPerformSafeBlock();
    *a4 = 1;

  }
}

uint64_t __76__MFConversationViewCellAccessibility__accessibilityPerformMailSwipeAction___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "executePreHandlerWithView:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "executeHandlerWithView:completionHandler:", *(_QWORD *)(a1 + 40), 0);
}

@end

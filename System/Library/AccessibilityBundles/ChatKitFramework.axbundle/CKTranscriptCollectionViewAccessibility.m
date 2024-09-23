@implementation CKTranscriptCollectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKTranscriptCollectionView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CKTranscriptCollectionView"), CFSTR("UICollectionView"));
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("UICollectionView"), CFSTR("delegate"), "@");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKTranscriptCollectionViewController"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CKChatController"), CFSTR("CKCoreChatController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKCoreChatController"), CFSTR("fullScreenBalloonViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CKFullScreenBalloonViewControllerPhone"), CFSTR("CKFullScreenBalloonViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKFullScreenBalloonViewController"), CFSTR("displayConfiguration"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKFullScreenBalloonViewDisplayConfiguration"), CFSTR("type"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKChatController"), CFSTR("entryView"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("CKSocialLayerChatController"));
  objc_msgSend(v3, "validateClass:", CFSTR("CKTranscriptMessageCell"));

}

- (id)accessibilityLabel
{
  void *v2;
  id v3;
  void *v4;

  -[CKTranscriptCollectionViewAccessibility accessibilityUserDefinedLabel](self, "accessibilityUserDefinedLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    v3 = v2;
  }
  else
  {
    accessibilityLocalizedString(CFSTR("group.transcripts.collection"));
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;

  return v4;
}

- (BOOL)accessibilityViewIsModal
{
  void *v2;
  BOOL v3;

  -[CKTranscriptCollectionViewAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("delegate.delegate.fullScreenBalloonViewController.displayConfiguration"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeIntegerForKey:", CFSTR("type")) == 1;

  return v3;
}

- (BOOL)accessibilityElementsHidden
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;

  -[CKTranscriptCollectionViewAccessibility storedAccessibilityElementsHidden](self, "storedAccessibilityElementsHidden");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CKTranscriptCollectionViewAccessibility storedAccessibilityElementsHidden](self, "storedAccessibilityElementsHidden");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");
LABEL_6:

    return v5;
  }
  -[CKTranscriptCollectionViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeValueForKey:", CFSTR("delegate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("CKSocialLayerChatController"));
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    -[CKTranscriptCollectionViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safeValueForKey:", CFSTR("delegate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "safeValueForKey:", CFSTR("entryView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v10, "accessibilityViewIsModal");

    goto LABEL_6;
  }
  return 1;
}

- (BOOL)isAccessibilityOpaqueElementProvider
{
  objc_super v4;

  if (-[CKTranscriptCollectionViewAccessibility accessibilityElementsHidden](self, "accessibilityElementsHidden"))
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)CKTranscriptCollectionViewAccessibility;
  return -[CKTranscriptCollectionViewAccessibility isAccessibilityOpaqueElementProvider](&v4, sel_isAccessibilityOpaqueElementProvider);
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  BOOL v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKTranscriptCollectionViewAccessibility;
  v5 = -[CKTranscriptCollectionViewAccessibility accessibilityScroll:](&v8, sel_accessibilityScroll_);
  v6 = -[CKTranscriptCollectionViewAccessibility _accessibilityPageIndex](self, "_accessibilityPageIndex");
  if (a3 == 3 && v6 <= 1)
    -[CKTranscriptCollectionViewAccessibility _accessibilityEnsureViewsAroundAreLoaded](self, "_accessibilityEnsureViewsAroundAreLoaded");
  return v5;
}

- (void)_accessibilityEnsureViewsAroundAreLoaded
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;
  char v7;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  objc_opt_class();
  __UIAccessibilityCastAsSafeCategory();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_accessibilityLoadMessagesIfNeeded");

  v6.receiver = self;
  v6.super_class = (Class)CKTranscriptCollectionViewAccessibility;
  -[CKTranscriptCollectionViewAccessibility _accessibilityEnsureViewsAroundAreLoaded](&v6, sel__accessibilityEnsureViewsAroundAreLoaded);

}

- (void)_accessibilityScrollOpaqueElementIntoView:(int64_t)a3 previousScroller:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  objc_super v6;
  uint64_t v7;
  uint64_t v8;

  if (a3 != 1)
  {
    v7 = v4;
    v8 = v5;
    v6.receiver = self;
    v6.super_class = (Class)CKTranscriptCollectionViewAccessibility;
    -[CKTranscriptCollectionViewAccessibility _accessibilityScrollOpaqueElementIntoView:previousScroller:](&v6, sel__accessibilityScrollOpaqueElementIntoView_previousScroller_, a3, a4);
  }
}

- (BOOL)_accessibilityOpaqueElementScrollsContentIntoView
{
  return 1;
}

- (id)_accessibilityElementToFocusForAppearanceScreenChange
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  void *v17;
  void *v18;
  _QWORD *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[4];

  NSClassFromString(CFSTR("CKTranscriptMessageCell"));
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTranscriptCollectionViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("dataSource"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v25[3] = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v13 = MEMORY[0x24BDAC760];
  v14 = 3221225472;
  v15 = __96__CKTranscriptCollectionViewAccessibility__accessibilityElementToFocusForAppearanceScreenChange__block_invoke;
  v16 = &unk_2501B2450;
  v19 = v25;
  v5 = v4;
  v17 = v5;
  v6 = v3;
  v18 = v6;
  v20 = &v21;
  AXPerformSafeBlock();
  v7 = v22[3];
  if (v7 < 2)
  {
LABEL_5:
    v11 = 0;
  }
  else
  {
    v8 = v7 + 1;
    while (1)
    {
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", v8 - 2, 0, v13, v14, v15, v16, v17, v18, v19, v20);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "cellForItemAtIndexPath:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;

      if ((unint64_t)--v8 <= 2)
        goto LABEL_5;
    }
    objc_msgSend(v10, "_accessibilityElementToFocusForAppearanceScreenChange");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(v25, 8);

  return v11;
}

uint64_t __96__CKTranscriptCollectionViewAccessibility__accessibilityElementToFocusForAppearanceScreenChange__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "numberOfSectionsInCollectionView:", *(_QWORD *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  if (*(uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) >= 1)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "collectionView:numberOfItemsInSection:", *(_QWORD *)(a1 + 40), 0);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  }
  return result;
}

@end

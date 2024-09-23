@implementation CKAvatarPickerViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKAvatarPickerViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("CKAvatarCollectionViewCell"));
  objc_msgSend(v3, "validateClass:", CFSTR("CKGroupCollectionViewCell"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKConversation"), CFSTR("recipients"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKAvatarPickerViewController"), CFSTR("collectionView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKAvatarPickerViewController"), CFSTR("conversation"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKAvatarPickerViewController"), CFSTR("layout"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKAvatarPickerViewController"), CFSTR("titleView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKAvatarPickerViewController"), CFSTR("setTitleView:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKAvatarPickerViewController"), CFSTR("_handleConversationRecipientsDidChange:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKAvatarPickerViewController"), CFSTR("collectionView:cellForItemAtIndexPath:"), "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKAvatarPickerViewController"), CFSTR("groupAvatarViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNGroupAvatarViewController"), CFSTR("avatarViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKConversation"), CFSTR("isBusinessConversation"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKAvatarPickerLayout"), CFSTR("layoutMode"), "Q", 0);

}

- (BOOL)_axIsPancakeMode
{
  void *v2;
  BOOL v3;

  -[CKAvatarPickerViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("layout"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeUnsignedIntegerForKey:", CFSTR("layoutMode")) == 0;

  return v3;
}

- (void)_axExecuteBlockOnAvatarCells:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  char v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *, _QWORD))a3;
  v17 = 0;
  objc_opt_class();
  -[CKAvatarPickerViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("collectionView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v6, "visibleCells", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        NSClassFromString(CFSTR("CKAvatarCollectionViewCell"));
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v4[2](v4, v6, v12);
        }
        else
        {
          NSClassFromString(CFSTR("CKGroupCollectionViewCell"));
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v4[2](v4, v6, v12);
            goto LABEL_13;
          }
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_13:

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id location;
  _QWORD v10[4];
  id v11;
  CKAvatarPickerViewControllerAccessibility *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CKAvatarPickerViewControllerAccessibility;
  -[CKAvatarPickerViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v13, sel__accessibilityLoadAccessibilityInformation);
  -[CKAvatarPickerViewControllerAccessibility _axExposeTitleViewIfNeeded](self, "_axExposeTitleViewIfNeeded");
  LOBYTE(location) = 0;
  objc_opt_class();
  -[CKAvatarPickerViewControllerAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("conversation.recipients"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __87__CKAvatarPickerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v10[3] = &unk_2501B1E28;
  v6 = v4;
  v11 = v6;
  v12 = self;
  -[CKAvatarPickerViewControllerAccessibility _axExecuteBlockOnAvatarCells:](self, "_axExecuteBlockOnAvatarCells:", v10);
  objc_initWeak(&location, self);
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __87__CKAvatarPickerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v7[3] = &unk_2501B1E50;
  v7[4] = self;
  objc_copyWeak(&v8, &location);
  -[CKAvatarPickerViewControllerAccessibility _axExecuteBlockOnAvatarCells:](self, "_axExecuteBlockOnAvatarCells:", v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __87__CKAvatarPickerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;

  v5 = a2;
  v6 = a3;
  objc_opt_class();
  __UIAccessibilityCastAsSafeCategory();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathForCell:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "item");
  if (v9 < objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", objc_msgSend(v8, "item"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_axSetCKEntity:", v10);
    objc_msgSend(v7, "setIsAccessibilityElement:", objc_msgSend(*(id *)(a1 + 40), "_axIsPancakeMode"));

  }
}

void __87__CKAvatarPickerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "safeValueForKeyPath:", CFSTR("groupAvatarViewController.avatarViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __87__CKAvatarPickerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3;
  v10[3] = &unk_2501B1C70;
  objc_copyWeak(&v11, (id *)(a1 + 40));
  objc_msgSend(v6, "_setIsAccessibilityElementBlock:", v10);
  objc_msgSend(v7, "accessibilityCustomContent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityCustomContent:", v8);

  objc_msgSend(v7, "accessibilityLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityLabel:", v9);

  objc_msgSend(v6, "setAccessibilityTraits:", objc_msgSend(v7, "accessibilityTraits"));
  objc_destroyWeak(&v11);

}

uint64_t __87__CKAvatarPickerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_msgSend(WeakRetained, "_accessibilityIsBusinessConversation") ^ 1;

  return v2;
}

- (void)setTitleView:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKAvatarPickerViewControllerAccessibility;
  -[CKAvatarPickerViewControllerAccessibility setTitleView:](&v4, sel_setTitleView_, a3);
  -[CKAvatarPickerViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_handleConversationRecipientsDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKAvatarPickerViewControllerAccessibility;
  -[CKAvatarPickerViewControllerAccessibility _handleConversationRecipientsDidChange:](&v4, sel__handleConversationRecipientsDidChange_, a3);
  -[CKAvatarPickerViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKAvatarPickerViewControllerAccessibility;
  -[CKAvatarPickerViewControllerAccessibility collectionView:cellForItemAtIndexPath:](&v7, sel_collectionView_cellForItemAtIndexPath_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("CKAvatarCollectionViewCell"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setIsAccessibilityElement:", -[CKAvatarPickerViewControllerAccessibility _axIsPancakeMode](self, "_axIsPancakeMode"));
  return v5;
}

- (void)_axExposeTitleViewIfNeeded
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;

  LOBYTE(location) = 0;
  objc_opt_class();
  -[CKAvatarPickerViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __71__CKAvatarPickerViewControllerAccessibility__axExposeTitleViewIfNeeded__block_invoke;
  v5[3] = &unk_2501B1C70;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v4, "_setIsAccessibilityElementBlock:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

uint64_t __71__CKAvatarPickerViewControllerAccessibility__axExposeTitleViewIfNeeded__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;
  uint64_t v4;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "_axConversationRecipientsCount") > 1)
  {
    v4 = 1;
  }
  else
  {
    v3 = objc_loadWeakRetained(v1);
    v4 = objc_msgSend(v3, "_accessibilityIsBusinessConversation");

  }
  return v4;
}

- (int64_t)_axConversationRecipientsCount
{
  void *v2;
  int64_t v3;

  -[CKAvatarPickerViewControllerAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("self.conversation.recipients.@count"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (BOOL)_accessibilityIsBusinessConversation
{
  void *v2;
  char v3;

  -[CKAvatarPickerViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("conversation"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeBoolForKey:", CFSTR("isBusinessConversation"));

  return v3;
}

@end

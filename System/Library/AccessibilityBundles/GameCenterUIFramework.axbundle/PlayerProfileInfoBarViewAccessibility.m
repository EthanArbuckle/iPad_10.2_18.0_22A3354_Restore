@implementation PlayerProfileInfoBarViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("GameCenterUI.PlayerProfileInfoBarView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityInfoViewElements
{
  JUMPOUT(0x23490F934);
}

- (void)_setAccessibilityInfoViewElements:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GameCenterUI.PlayerProfileInfoBarView"), CFSTR("accessibilityInfoItemPairs"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GameCenterUI.PlayerProfileInfoBarView"), CFSTR("layoutSubviews"), "v", 0);

}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  -[PlayerProfileInfoBarViewAccessibility _accessibilityInfoViewElements](self, "_accessibilityInfoViewElements");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[PlayerProfileInfoBarViewAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("accessibilityInfoItemPairs"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)v11[5];
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v11[5];
    v11[5] = v5;

    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __62__PlayerProfileInfoBarViewAccessibility_accessibilityElements__block_invoke;
    v9[3] = &unk_2502163F8;
    v9[4] = self;
    v9[5] = &v10;
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", v9);
    -[PlayerProfileInfoBarViewAccessibility _setAccessibilityInfoViewElements:](self, "_setAccessibilityInfoViewElements:", v11[5]);
    v4 = (void *)v11[5];
  }
  v7 = v4;

  _Block_object_dispose(&v10, 8);
  return v7;
}

void __62__PlayerProfileInfoBarViewAccessibility_accessibilityElements__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = a2;
  if ((unint64_t)objc_msgSend(v3, "count") >= 2)
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE30], "axArrayByIgnoringNilElementsWithCount:", 2, v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBADA8]), "initWithAccessibilityContainer:representedElements:", *(_QWORD *)(a1 + 32), v6);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __62__PlayerProfileInfoBarViewAccessibility_accessibilityElements__block_invoke_2;
    v10[3] = &unk_250216390;
    v11 = v4;
    v12 = v5;
    v8 = v5;
    v9 = v4;
    objc_msgSend(v7, "_setAccessibilityLabelBlock:", v10);
    objc_msgSend(v7, "_setIsAccessibilityElementBlock:", &__block_literal_global);
    objc_msgSend(v7, "setAccessibilityRespondsToUserInteraction:", 0);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "axSafelyAddObject:", v7);

  }
}

id __62__PlayerProfileInfoBarViewAccessibility_accessibilityElements__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "accessibilityLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __62__PlayerProfileInfoBarViewAccessibility_accessibilityElements__block_invoke_3()
{
  return 1;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PlayerProfileInfoBarViewAccessibility;
  -[PlayerProfileInfoBarViewAccessibility layoutSubviews](&v3, sel_layoutSubviews);
  -[PlayerProfileInfoBarViewAccessibility _setAccessibilityInfoViewElements:](self, "_setAccessibilityInfoViewElements:", 0);
}

@end

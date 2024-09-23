@implementation ListCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_SFBrowsingAssistantListCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("_SFBrowsingAssistantListCell"), CFSTR("UICollectionViewListCell"));
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("_SFBrowsingAssistantListCell"), CFSTR("isDeletable"), "Bool");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("_SFBrowsingAssistantListCell"), CFSTR("delegate"), "Optional<BrowsingAssistantListCellDelegate>");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MobileSafari.BrowsingAssistant"), CFSTR("listCellDidDeleteCell:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MobileSafari.BrowsingAssistant"), CFSTR("listCellDidInsertCell:"), "v", "@", 0);

}

- (id)_accessibilitySupplementaryFooterViews
{
  return (id)MEMORY[0x24BDBD1A8];
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

- (BOOL)accessibilityActivate
{
  void *v3;
  void *v4;
  int v5;
  BOOL v6;
  objc_super v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  ListCellAccessibility *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  ListCellAccessibility *v18;
  char v19;

  v19 = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configurationState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEditing");

  if (v5)
  {
    if (-[ListCellAccessibility safeSwiftBoolForKey:](self, "safeSwiftBoolForKey:", CFSTR("isDeletable")))
    {
      v14 = MEMORY[0x24BDAC760];
      v15 = 3221225472;
      v16 = __46__ListCellAccessibility_accessibilityActivate__block_invoke;
      v17 = &unk_2502969E8;
      v18 = self;
    }
    else
    {
      v9 = MEMORY[0x24BDAC760];
      v10 = 3221225472;
      v11 = __46__ListCellAccessibility_accessibilityActivate__block_invoke_2;
      v12 = &unk_2502969E8;
      v13 = self;
    }
    AXPerformSafeBlock();
    v6 = 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)ListCellAccessibility;
    v6 = -[ListCellAccessibility accessibilityActivate](&v8, sel_accessibilityActivate);
  }

  return v6;
}

void __46__ListCellAccessibility_accessibilityActivate__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "safeSwiftValueForKey:", CFSTR("delegate"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "listCellDidDeleteCell:", *(_QWORD *)(a1 + 32));

}

void __46__ListCellAccessibility_accessibilityActivate__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "safeSwiftValueForKey:", CFSTR("delegate"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "listCellDidInsertCell:", *(_QWORD *)(a1 + 32));

}

@end

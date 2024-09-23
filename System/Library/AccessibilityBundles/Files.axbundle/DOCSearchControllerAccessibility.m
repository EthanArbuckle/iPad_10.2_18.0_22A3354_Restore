@implementation DOCSearchControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("Files.DOCSearchController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Files.DOCSearchController"), CFSTR("resultCollectionViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Files.DOCItemCollectionViewController"), CFSTR("view"), "@", 0);

}

- (void)searchBarTextDidEndEditing:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  AXPerformSafeBlock();
  objc_opt_class();
  -[DOCSearchControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("resultCollectionViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], v7);

}

id __63__DOCSearchControllerAccessibility_searchBarTextDidEndEditing___block_invoke(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  v1 = *(_QWORD *)(a1 + 32);
  v3.receiver = *(id *)(a1 + 40);
  v3.super_class = (Class)DOCSearchControllerAccessibility;
  return objc_msgSendSuper2(&v3, sel_searchBarTextDidEndEditing_, v1);
}

@end

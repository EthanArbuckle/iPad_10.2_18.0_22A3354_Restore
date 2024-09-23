@implementation ReadingListTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ReadingListTableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ReadingListTableViewCell"), CFSTR("siteName"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ReadingListTableViewCell"), CFSTR("previewText"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ReadingListViewController"), CFSTR("_readingListItemAtIndexPathDelete:"), "v", "@", 0);

}

- (id)_privateAccessibilityCustomActions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BDF6788]);
  accessibilityLocalizedString(CFSTR("delete"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:target:selector:", v4, self, sel__accessibilityDeleteReadingListItem);

  objc_msgSend(v5, "setSortPriority:", *MEMORY[0x24BEBAD58]);
  _UIAccessibilityCustomActionDeleteImage();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v6);

  v9[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)_accessibilityDeleteReadingListItem
{
  void *v2;
  void *v3;
  char v4;
  id v6;

  -[ReadingListTableViewCellAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();
  if ((v4 & 1) != 0)
  {
    v6 = v3;
    AXPerformSafeBlock();

  }
  return v4 & 1;
}

void __76__ReadingListTableViewCellAccessibility__accessibilityDeleteReadingListItem__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_accessibilityIndexPath");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_readingListItemAtIndexPathDelete:", v2);

}

@end

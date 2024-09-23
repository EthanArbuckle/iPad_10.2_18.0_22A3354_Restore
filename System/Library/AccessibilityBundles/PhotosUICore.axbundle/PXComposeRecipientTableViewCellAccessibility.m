@implementation PXComposeRecipientTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PXComposeRecipientTableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PXComposeRecipientTableViewCell"), CFSTR("_cellModel"), "PXComposeRecipientTableCellModel");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXComposeRecipientTableCellModel"), CFSTR("showsCheckbox"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXComposeRecipientTableCellModel"), CFSTR("checked"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXComposeRecipientTableViewCell"), CFSTR("_updateAccessoryImageView"), "v", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PXComposeRecipientTableViewCell"), CFSTR("UITableViewCell"));

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXComposeRecipientTableViewCellAccessibility;
  v3 = -[PXComposeRecipientTableViewCellAccessibility accessibilityTraits](&v6, sel_accessibilityTraits);
  -[PXComposeRecipientTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_cellModel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "safeBoolForKey:", CFSTR("showsCheckbox"))
    && objc_msgSend(v4, "safeBoolForKey:", CFSTR("checked")))
  {
    v3 |= *MEMORY[0x24BDF7400];
  }

  return v3;
}

- (id)accessibilityCustomActions
{
  void *v3;
  void *v4;
  int v5;
  id v6;
  __CFString *v7;
  char **v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXComposeRecipientTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_cellModel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "safeBoolForKey:", CFSTR("showsCheckbox")))
  {
    v5 = objc_msgSend(v4, "safeBoolForKey:", CFSTR("checked"));
    v6 = objc_alloc(MEMORY[0x24BDF6788]);
    if (v5)
      v7 = CFSTR("unselect");
    else
      v7 = CFSTR("select");
    if (v5)
      v8 = &selRef_unselectCheckbox;
    else
      v8 = &selRef_selectCheckbox;
    accessibilityPhotosUICoreLocalizedString(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v6, "initWithName:target:selector:", v9, self, *v8);

    objc_msgSend(v3, "addObject:", v10);
    -[PXComposeRecipientTableViewCellAccessibility _updateAccessoryImageView](self, "_updateAccessoryImageView");
  }

  return v3;
}

- (void)selectCheckbox
{
  void *v3;
  void *v4;
  double v5;
  id v6;

  -[PXComposeRecipientTableViewCellAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v6 = v3;
    objc_msgSend(v3, "indexPathForCell:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contentOffset");
    objc_msgSend(v6, "selectRowAtIndexPath:animated:scrollPosition:", v4, 1, (uint64_t)v5);

    v3 = v6;
  }

}

- (void)unselectCheckbox
{
  void *v3;
  void *v4;
  id v5;

  -[PXComposeRecipientTableViewCellAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v5 = v3;
    objc_msgSend(v3, "indexPathForCell:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deselectRowAtIndexPath:animated:", v4, 1);

    v3 = v5;
  }

}

@end

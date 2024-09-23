@implementation CNComposeTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CNComposeTableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("CNComposeTableViewCell"), CFSTR("titleLabel"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("CNComposeTableViewCell"), CFSTR("detailLabel"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("CNComposeTableViewCell"), CFSTR("labelColor"), "@");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNComposeTableViewCell"), CFSTR("recipient"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNComposeRecipient"), CFSTR("label"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNComposeRecipient"), CFSTR("isGroup"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNComposeRecipientTableViewCell"), CFSTR("initWithStyle:reuseIdentifier:"), "@", "q", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIDynamicCatalogColor"), CFSTR("_debugName"), "@", 0);

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  objc_opt_class();
  -[CNComposeTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("labelColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  NSClassFromString(CFSTR("UIDynamicCatalogColor"));
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v4, "safeStringForKey:", CFSTR("_debugName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("CKBlueBalloonColor1")) & 1) != 0)
  {
    v6 = CFSTR("address.kind.imessage");
  }
  else
  {
    if (!objc_msgSend(v5, "isEqualToString:", CFSTR("CKGreenBalloonColor1")))
    {
      v7 = 0;
      goto LABEL_9;
    }
    v6 = CFSTR("address.kind.sms");
  }
  accessibilityLocalizedString(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

LABEL_10:
  objc_msgSend(MEMORY[0x24BDF6950], "tintColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqual:", v8))
  {
    AXApplicationGetMainBundleIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BE00538]);

    if (!v10)
      goto LABEL_14;
    accessibilityLocalizedString(CFSTR("contact.kind.eligible"));
    v8 = v7;
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_14:
  -[CNComposeTableViewCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("titleLabel"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "accessibilityLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNComposeTableViewCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("detailLabel"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "accessibilityLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNComposeTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("recipient"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v15, "safeBoolForKey:", CFSTR("isGroup")) & 1) != 0)
  {
    v16 = 0;
  }
  else
  {
    objc_msgSend(v15, "safeStringForKey:", CFSTR("label"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  __UIAXStringForVariables();
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

@end

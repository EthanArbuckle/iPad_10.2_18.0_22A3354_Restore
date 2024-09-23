@implementation SBFolderIconAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBFolderIcon");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)dealloc
{
  objc_super v3;

  -[SBFolderIconAccessibility _accessibilityUnregister](self, "_accessibilityUnregister");
  v3.receiver = self;
  v3.super_class = (Class)SBFolderIconAccessibility;
  -[SBFolderIconAccessibility dealloc](&v3, sel_dealloc);
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("folder.label"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)SBFolderIconAccessibility;
  -[SBFolderIconAccessibility accessibilityLabel](&v8, sel_accessibilityLabel);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BEBB118] | *MEMORY[0x24BEBB130];
}

- (id)automationElements
{
  void *v2;
  void *v3;
  void *v4;

  -[SBFolderIconAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_folder"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("allIcons"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end

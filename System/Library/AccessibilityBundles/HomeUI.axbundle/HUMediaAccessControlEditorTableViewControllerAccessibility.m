@implementation HUMediaAccessControlEditorTableViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUMediaAccessControlEditorTableViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("HUMediaAccessControlEditorTableViewController"), CFSTR("UITableViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUItemTableViewController"), CFSTR("itemManager"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("HUItemTableViewController"), CFSTR("UITableViewController"));

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUMediaAccessControlEditorTableViewControllerAccessibility;
  -[HUMediaAccessControlEditorTableViewControllerAccessibility viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[HUMediaAccessControlEditorTableViewControllerAccessibility _accessibilityHomeUIHandleTVandSpeakersTableViewCells](self, "_accessibilityHomeUIHandleTVandSpeakersTableViewCells");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUMediaAccessControlEditorTableViewControllerAccessibility;
  -[HUMediaAccessControlEditorTableViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[HUMediaAccessControlEditorTableViewControllerAccessibility _accessibilityHomeUIHandleTVandSpeakersTableViewCells](self, "_accessibilityHomeUIHandleTVandSpeakersTableViewCells");
}

- (void)_accessibilityHomeUIHandleTVandSpeakersTableViewCells
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  char v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 0, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v25, "section");
  v33 = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v4;
  objc_msgSend(v4, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "visibleCells");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUMediaAccessControlEditorTableViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("itemManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v30;
    v11 = 0x24BDD1000uLL;
    v26 = v3;
    v27 = v7;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v30 != v10)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        v33 = 0;
        objc_opt_class();
        objc_msgSend(v7, "displayedSectionIdentifierForSectionIndex:", v3);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        __UIAccessibilityCastAsClass();
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v33)
          abort();
        if (objc_msgSend(v15, "isEqualToString:", CFSTR("ACCESS_CONTROL_SECTION")))
        {
          v16 = *(void **)(v11 + 1992);
          accessibilityHomeUILocalizedString(CFSTR("allow.speaker.and.tv.access.option"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "textLabel");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "text");
          v19 = v9;
          v20 = v11;
          v21 = v10;
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "localizedStringWithFormat:", v17, v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setAccessibilityHint:", v23);

          v10 = v21;
          v11 = v20;
          v9 = v19;

          v3 = v26;
          v7 = v27;
        }

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v9);
  }

}

@end

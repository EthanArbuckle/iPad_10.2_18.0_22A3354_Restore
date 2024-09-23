@implementation SPUITableViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SPUITableViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SPUITableViewController"), CFSTR("UITableViewController"));
  objc_msgSend(v3, "validateClass:conformsToProtocol:", CFSTR("SPUITableViewController"), CFSTR("UITableViewDataSource"));
  objc_msgSend(v3, "validateClass:", CFSTR("SPUISearchModel"));
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SPUISearchModel"), CFSTR("sharedGeneralInstance"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SPUISearchModel"), CFSTR("sections"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SPSearchResultSection"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SPSearchResultSection"), CFSTR("domain"), "I", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SPSearchResultSection"), CFSTR("hasDisplayIdentifier"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SPSearchResultSection"), CFSTR("displayIdentifier"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("FBApplicationInfo"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FBApplicationInfo"), CFSTR("displayName"), "@", 0);

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  int v12;
  __CFString *v13;
  void *v14;
  __CFString *v15;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  objc_super v23;

  v6 = a3;
  v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)SPUITableViewControllerAccessibility;
  -[SPUITableViewControllerAccessibility tableView:cellForRowAtIndexPath:](&v23, sel_tableView_cellForRowAtIndexPath_, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "section");
  objc_msgSend((id)MEMORY[0x23491EFE8](CFSTR("SPUISearchModel")), "safeValueForKey:", CFSTR("sharedGeneralInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__0;
  v21 = __Block_byref_object_dispose__0;
  v22 = 0;
  v10 = v9;
  AXPerformSafeBlock();
  v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  v12 = objc_msgSend(v11, "safeIntForKey:", CFSTR("domain"));
  if (objc_msgSend(v11, "safeBoolForKey:", CFSTR("hasDisplayIdentifier")))
  {
    objc_msgSend(v11, "safeValueForKey:", CFSTR("displayIdentifier"));
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
  v14 = 0;
  switch(v12)
  {
    case 2:

      v14 = 0;
      v13 = CFSTR("com.apple.MobileAddressBook");
      break;
    case 4:

      v13 = 0;
      v14 = 0;
      goto LABEL_18;
    case 6:
      v15 = CFSTR("search.result.music");
      goto LABEL_14;
    case 7:
      v15 = CFSTR("search.result.podcast");
      goto LABEL_14;
    case 8:
      v15 = CFSTR("search.result.video");
      goto LABEL_14;
    case 9:
      v15 = CFSTR("search.result.audiobook");
      goto LABEL_14;
    case 11:

      v14 = 0;
      v13 = CFSTR("com.apple.MobileSafari");
      break;
    case 13:

      v14 = 0;
      v13 = CFSTR("com.apple.reminders");
      break;
    case 14:
      v15 = CFSTR("search.result.documents");
LABEL_14:
      accessibilityLocalizedString(v15);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      break;
  }
  if (!v14 && v13)
  {
    AXApplicationNameLabelForBundleIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_18:
  if (objc_msgSend(v14, "length"))
    objc_msgSend(v8, "accessibilitySetIdentification:", v14);

  return v8;
}

void __72__SPUITableViewControllerAccessibility_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "safeArrayForKey:", CFSTR("sections"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", *(unsigned int *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

@end

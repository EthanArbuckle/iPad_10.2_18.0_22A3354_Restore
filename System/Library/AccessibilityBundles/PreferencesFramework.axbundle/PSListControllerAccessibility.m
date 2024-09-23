@implementation PSListControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PSListController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PSListController"), CFSTR("highlightSpecifierWithID:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("PSRootController"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PSRootController"), CFSTR("UINavigationController"));

}

- (id)loadSpecifiersFromPlistName:(id)a3 target:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  PSListControllerAccessibility *v12;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PSListControllerAccessibility;
  -[PSListControllerAccessibility loadSpecifiersFromPlistName:target:](&v13, sel_loadSpecifiersFromPlistName_target_, v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __68__PSListControllerAccessibility_loadSpecifiersFromPlistName_target___block_invoke;
  v10[3] = &unk_250313838;
  v11 = v6;
  v12 = self;
  v8 = v6;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v10);

  return v7;
}

void __68__PSListControllerAccessibility_loadSpecifiersFromPlistName_target___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setProperty:forKey:", v3, CFSTR("axStringsFileName"));
  objc_msgSend(*(id *)(a1 + 40), "safeValueForKey:", CFSTR("bundle"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProperty:forKey:", v5, CFSTR("axBundle"));

}

- (void)highlightSpecifierWithID:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PSListControllerAccessibility;
  -[PSListControllerAccessibility highlightSpecifierWithID:](&v15, sel_highlightSpecifierWithID_, v4);
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__0;
  v13 = __Block_byref_object_dispose__0;
  v14 = 0;
  v8 = v4;
  AXPerformSafeBlock();
  v5 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  objc_msgSend(v5, "propertyForKey:", *MEMORY[0x24BE75D18]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v5) = *MEMORY[0x24BDF71E8];
  objc_msgSend(v6, "accessibilityValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification((UIAccessibilityNotifications)v5, v7);

}

void __58__PSListControllerAccessibility_highlightSpecifierWithID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "specifierForID:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)_accessibilityHandleNavigationControllerDidEndTransition
{
  _BOOL4 IsVoiceOverRunning;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  UIAccessibilityNotifications v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  _QWORD v32[3];

  v32[2] = *MEMORY[0x24BDAC8D0];
  IsVoiceOverRunning = UIAccessibilityIsVoiceOverRunning();
  if (IsVoiceOverRunning)
  {
    objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilityValueForKey:", CFSTR("applicationDidBecomeActiveDate"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v4 && (objc_msgSend(v5, "timeIntervalSinceDate:", v4), v7 <= 1.0))
    {

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bundleIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.Bridge"));

      if ((v10 & 1) == 0)
      {
        NSClassFromString(CFSTR("UISplitViewController"));
        -[PSListControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("view"));
        v11 = objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
LABEL_9:
          v15 = 0;
LABEL_35:
          LOBYTE(IsVoiceOverRunning) = v15 != 0;
          return IsVoiceOverRunning;
        }
        v12 = (void *)v11;
        while (1)
        {
          objc_msgSend(v12, "safeValueForKey:", CFSTR("_viewDelegate"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            break;
          objc_msgSend(v12, "superview");
          v14 = objc_claimAutoreleasedReturnValue();

          v12 = (void *)v14;
          if (!v14)
            goto LABEL_9;
        }
        v16 = v13;
        if ((objc_msgSend(v16, "isCollapsed") & 1) != 0)
        {
          v15 = 0;
LABEL_34:

          goto LABEL_35;
        }
        objc_opt_class();
        -[PSListControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("parentViewController"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        __UIAccessibilityCastAsClass();
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v18, "navigationBar");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BEBADC8], "defaultVoiceOverOptions");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "_accessibilityLeafDescendantsWithOptions:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "firstObject");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
        {
LABEL_15:
          v23 = *MEMORY[0x24BDF7328];
          v32[0] = *MEMORY[0x24BDFEF20];
          v32[1] = v22;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 2);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          UIAccessibilityPostNotification(v23, v24);

          v15 = 1;
          v25 = v22;
LABEL_32:

          goto LABEL_33;
        }
        -[PSListControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_table"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v25, "_accessibilityHasOrderedChildren"))
        {
          v26 = objc_msgSend(v25, "accessibilityElementCount");
          if (v26 >= 1)
          {
            v27 = v26;
            v28 = 0;
            while (1)
            {
              objc_msgSend(v25, "accessibilityElementAtIndex:", v28);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              if (v22)
              {
                do
                {
                  if (!objc_msgSend(v22, "_accessibilityHasOrderedChildren"))
                    break;
                  if (objc_msgSend(v22, "accessibilityElementCount") < 1)
                    break;
                  objc_msgSend(v22, "accessibilityElementAtIndex:", 0);
                  v29 = objc_claimAutoreleasedReturnValue();

                  v22 = (void *)v29;
                }
                while (v29);
              }
              objc_msgSend(v22, "accessibilityFrame");
              if (v30 > 1.0)
                break;

              if (++v28 == v27)
                goto LABEL_31;
            }
LABEL_28:

            if (!v22)
            {
              v15 = 0;
LABEL_33:

              goto LABEL_34;
            }
            goto LABEL_15;
          }
        }
        else
        {
          if (objc_msgSend(v25, "isAccessibilityOpaqueElementProvider"))
          {
            objc_msgSend(v25, "_accessibilityFirstOpaqueElement");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_28;
          }
          _AXAssert();
        }
LABEL_31:
        v15 = 0;
        goto LABEL_32;
      }
    }
    LOBYTE(IsVoiceOverRunning) = 0;
  }
  return IsVoiceOverRunning;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  if (UIAccessibilityIsVoiceOverRunning())
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSListControllerAccessibility setValue:forKey:](self, "setValue:forKey:", v8, CFSTR("_cachesCells"));

  }
  v11.receiver = self;
  v11.super_class = (Class)PSListControllerAccessibility;
  -[PSListControllerAccessibility tableView:cellForRowAtIndexPath:](&v11, sel_tableView_cellForRowAtIndexPath_, v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)reloadSpecifierAtIndex:(int)a3 animated:(BOOL)a4
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PSListControllerAccessibility;
  -[PSListControllerAccessibility reloadSpecifierAtIndex:animated:](&v6, sel_reloadSpecifierAtIndex_animated_, *(_QWORD *)&a3, a4);
  -[PSListControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_specifiers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

@end

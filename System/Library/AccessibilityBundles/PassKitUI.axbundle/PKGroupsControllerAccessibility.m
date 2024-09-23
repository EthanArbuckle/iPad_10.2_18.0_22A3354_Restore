@implementation PKGroupsControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKGroupsController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKGroupsController"), CFSTR("indexOfSeparationGroup"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKGroupsController"), CFSTR("_moveGroup:fromIndex:toIndex:notify:"), "v", "@", "Q", "Q", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKGroupsController"), CFSTR("_groups"), "NSMutableArray");

}

- (void)_moveGroup:(id)a3 fromIndex:(unint64_t)a4 toIndex:(unint64_t)a5 notify:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  UIAccessibilityNotifications v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  __CFString *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  char v37;
  objc_super v38;

  v6 = a6;
  v10 = a3;
  v38.receiver = self;
  v38.super_class = (Class)PKGroupsControllerAccessibility;
  -[PKGroupsControllerAccessibility _moveGroup:fromIndex:toIndex:notify:](&v38, sel__moveGroup_fromIndex_toIndex_notify_, v10, a4, a5, v6);
  -[PKGroupsControllerAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("_groups"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count") > a5)
  {
    -[PKGroupsControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("indexOfSeparationGroup"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "integerValue");

    if (v13 == a5)
    {
      v14 = *MEMORY[0x24BDF71E8];
      accessibilityLocalizedString(CFSTR("top.card.default.announcement"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      UIAccessibilityPostNotification(v14, v15);
LABEL_10:

      goto LABEL_11;
    }
    if (a5 >= a4)
    {
      v37 = 0;
      v31 = 0;
      v32 = &v31;
      v33 = 0x3032000000;
      v34 = __Block_byref_object_copy_;
      v35 = __Block_byref_object_dispose_;
      v36 = 0;
      v29 = v11;
      AXPerformSafeBlock();
      v20 = (id)v32[5];

      _Block_object_dispose(&v31, 8);
      objc_msgSend(v20, "passes");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v21, "firstObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAccessibilitySafeClass();
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v37)
      {
        v19 = CFSTR("card.moved.front.card");
        goto LABEL_9;
      }
    }
    else
    {
      v37 = 0;
      v31 = 0;
      v32 = &v31;
      v33 = 0x3032000000;
      v34 = __Block_byref_object_copy_;
      v35 = __Block_byref_object_dispose_;
      v36 = 0;
      v30 = v11;
      AXPerformSafeBlock();
      v16 = (id)v32[5];

      _Block_object_dispose(&v31, 8);
      objc_msgSend(v16, "passes");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "firstObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAccessibilitySafeClass();
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v37)
      {
        v19 = CFSTR("card.moved.behind.card");
LABEL_9:
        objc_msgSend(v15, "localizedDescription");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "organizationName");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        __UIAXStringForVariables();
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        LODWORD(v23) = *MEMORY[0x24BDF71E8];
        v26 = (void *)MEMORY[0x24BDD17C8];
        accessibilityLocalizedString(v19);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "stringWithFormat:", v27, v25, CFSTR("__AXStringForVariablesSentinel"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        UIAccessibilityPostNotification((UIAccessibilityNotifications)v23, v28);

        goto LABEL_10;
      }
    }
    abort();
  }
LABEL_11:

}

void __71__PKGroupsControllerAccessibility__moveGroup_fromIndex_toIndex_notify___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", *(_QWORD *)(a1 + 48) + 1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __71__PKGroupsControllerAccessibility__moveGroup_fromIndex_toIndex_notify___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", *(_QWORD *)(a1 + 48) - 1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

@end

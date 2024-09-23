@implementation UICollectionViewTableCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UICollectionViewTableCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const char *v6;
  id v7;
  id *v8;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v8 = location;
  v7 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:", CFSTR("UITableViewCellReorderControl"));
  v3 = CFSTR("UICollectionViewTableCell");
  v6 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("_tableLayout"), v6, 0);
  v4 = CFSTR("UICollectionViewTableLayout");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("_delegateProxy"), v6, 0);
  v5 = CFSTR("UICollectionViewCompositionalLayout");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("_trailingSwipeActionsConfigurationForIndexPath:"), v6, 0);
  objc_storeStrong(v8, v7);
}

- (id)_accessibilitySupplementaryFooterViews
{
  id v3;
  id v4[2];
  UICollectionViewTableCellAccessibility *v5;

  v5 = self;
  v4[1] = (id)a2;
  v4[0] = (id)-[UICollectionViewTableCellAccessibility _accessibilityFindDescendant:](self, "_accessibilityFindDescendant:", &__block_literal_global_16);
  objc_msgSend(v4[0], "setAccessibilityContainer:", v5);
  v3 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "axArrayByIgnoringNilElementsWithCount:", 1, v4[0]);
  objc_storeStrong(v4, 0);
  return v3;
}

BOOL __80__UICollectionViewTableCellAccessibility__accessibilitySupplementaryFooterViews__block_invoke(void *a1, void *a2)
{
  id location[2];
  BOOL v4;

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  NSClassFromString(CFSTR("UITableViewCellReorderControl"));
  v4 = (objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(location[0], "_accessibilityViewIsVisible") & 1) != 0;
  objc_storeStrong(location, 0);
  return v4;
}

- (BOOL)_axPerformAction:(id)a3
{
  id v4;
  id v5;
  UICollectionViewTableCellAccessibility *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  char v11;
  id v12;
  id location[2];
  UICollectionViewTableCellAccessibility *v14;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v11 = 0;
  objc_opt_class();
  v4 = (id)objc_msgSend(location[0], "_accessibilityValueForKey:", CFSTR("AXCollectionViewTableCellActionKey"));
  v10 = (id)__UIAccessibilityCastAsClass();

  v9 = v10;
  objc_storeStrong(&v10, 0);
  v12 = v9;
  v8 = (id)objc_msgSend(v9, "handler");
  if (v8)
  {
    v7 = v8;
    v5 = v12;
    v6 = v14;
    AXPerformSafeBlock();
    objc_storeStrong((id *)&v6, 0);
    objc_storeStrong(&v5, 0);
    objc_storeStrong(&v7, 0);
  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
  return 1;
}

uint64_t __59__UICollectionViewTableCellAccessibility__axPerformAction___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (id)_axCustomActionsForActions:(uint64_t)a1
{
  id v2;
  id v4;
  id v5;
  BOOL v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  id obj;
  uint64_t v12;
  id v13;
  _QWORD __b[8];
  id v15;
  id v16;
  int v17;
  id location;
  uint64_t v19;
  id v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v19 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v19)
  {
    v16 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    memset(__b, 0, sizeof(__b));
    obj = location;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v21, 16);
    if (v12)
    {
      v8 = *(_QWORD *)__b[2];
      v9 = 0;
      v10 = v12;
      while (1)
      {
        v7 = v9;
        if (*(_QWORD *)__b[2] != v8)
          objc_enumerationMutation(obj);
        v15 = *(id *)(__b[1] + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v2 = (id)objc_msgSend(v15, "title");
          v6 = v2 == 0;

          if (!v6)
          {
            v4 = objc_alloc(MEMORY[0x24BDF6788]);
            v5 = (id)objc_msgSend(v15, "title");
            v13 = (id)objc_msgSend(v4, "initWithName:target:selector:");

            objc_msgSend(v13, "_accessibilitySetRetainedValue:forKey:", v15, CFSTR("AXCollectionViewTableCellActionKey"));
            objc_msgSend(v16, "addObject:", v13);
            objc_storeStrong(&v13, 0);
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            _AXAssert();
        }
        ++v9;
        if (v7 + 1 >= v10)
        {
          v9 = 0;
          v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v21, 16);
          if (!v10)
            break;
        }
      }
    }

    v20 = v16;
    v17 = 1;
    objc_storeStrong(&v16, 0);
  }
  else
  {
    v20 = 0;
    v17 = 1;
  }
  objc_storeStrong(&location, 0);
  return v20;
}

- (id)_privateAccessibilityCustomActions
{
  id v2;
  id v4;
  id v5;
  UICollectionViewTableCellAccessibility *v6;
  id v7;
  id v8;
  id v9;
  UICollectionViewTableCellAccessibility *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  UICollectionViewTableCellAccessibility *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  UICollectionViewTableCellAccessibility *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  int v31;
  int v32;
  void (*v33)(uint64_t);
  void *v34;
  id v35;
  id v36[2];
  uint64_t v37;
  uint64_t *v38;
  int v39;
  int v40;
  void (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  id v44;
  uint64_t v45;
  int v46;
  int v47;
  void (*v48)(uint64_t);
  void *v49;
  id v50;
  id v51[2];
  uint64_t v52;
  uint64_t *v53;
  int v54;
  int v55;
  void (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  id v59;
  id v60;
  id v61;
  char v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  int v71;
  id v72;
  id v73;
  id v74;
  char v75;
  id v76;
  id v77[2];
  UICollectionViewTableCellAccessibility *v78;
  id v79;

  v78 = self;
  v77[1] = (id)a2;
  v77[0] = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v75 = 0;
  v27 = (id)-[UICollectionViewTableCellAccessibility safeValueForKey:](v78, "safeValueForKey:", CFSTR("_tableLayout"));
  v74 = (id)__UIAccessibilitySafeClass();

  v73 = v74;
  objc_storeStrong(&v74, 0);
  v76 = v73;
  v72 = (id)-[UICollectionViewTableCellAccessibility _accessibilityIndexPath](v78, "_accessibilityIndexPath");
  if (v72)
  {
    v70 = (id)-[UICollectionViewTableCellAccessibility _accessibilityViewAncestorIsKindOf:](v78, "_accessibilityViewAncestorIsKindOf:", objc_opt_class());
    v69 = (id)objc_msgSend(v76, "safeValueForKey:", CFSTR("_delegateActual"));
    v68 = (id)objc_msgSend(v76, "safeValueForKey:", CFSTR("_delegateProxy"));
    if (v69)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v67 = (id)objc_msgSend(v68, "collectionView:tableLayout:leadingSwipeActionsConfigurationForRowAtIndexPath:", v70, v76, v72);
        v24 = v77[0];
        v23 = v78;
        v26 = (id)objc_msgSend(v67, "actions");
        v25 = -[UICollectionViewTableCellAccessibility _axCustomActionsForActions:]((uint64_t)v23, v26);
        objc_msgSend(v24, "axSafelyAddObjectsFromArray:");

        objc_storeStrong(&v67, 0);
      }
      else if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v66 = (id)objc_msgSend(v68, "collectionView:tableLayout:leadingSwipeActionsForRowAtIndexPath:", v70, v76, v72);
        v21 = v77[0];
        v22 = -[UICollectionViewTableCellAccessibility _axCustomActionsForActions:]((uint64_t)v78, v66);
        objc_msgSend(v21, "axSafelyAddObjectsFromArray:");

        objc_storeStrong(&v66, 0);
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v65 = (id)objc_msgSend(v68, "collectionView:tableLayout:trailingSwipeActionsConfigurationForRowAtIndexPath:", v70, v76, v72);
        v18 = v77[0];
        v17 = v78;
        v20 = (id)objc_msgSend(v65, "actions");
        v19 = -[UICollectionViewTableCellAccessibility _axCustomActionsForActions:]((uint64_t)v17, v20);
        objc_msgSend(v18, "axSafelyAddObjectsFromArray:");

        objc_storeStrong(&v65, 0);
      }
      else if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v64 = (id)objc_msgSend(v68, "collectionView:tableLayout:trailingSwipeActionsForRowAtIndexPath:", v70, v76, v72);
        v15 = v77[0];
        v16 = -[UICollectionViewTableCellAccessibility _axCustomActionsForActions:]((uint64_t)v78, v64);
        objc_msgSend(v15, "axSafelyAddObjectsFromArray:");

        objc_storeStrong(&v64, 0);
      }
    }
    else
    {
      v62 = 0;
      v14 = (id)-[UICollectionViewTableCellAccessibility safeValueForKey:](v78, "safeValueForKey:", CFSTR("currentLayout"));
      v61 = (id)__UIAccessibilitySafeClass();

      v60 = v61;
      objc_storeStrong(&v61, 0);
      v63 = v60;
      v52 = 0;
      v53 = &v52;
      v54 = 838860800;
      v55 = 48;
      v56 = __Block_byref_object_copy__7;
      v57 = __Block_byref_object_dispose__7;
      v58 = 0;
      v45 = MEMORY[0x24BDAC760];
      v46 = -1073741824;
      v47 = 0;
      v48 = __76__UICollectionViewTableCellAccessibility__privateAccessibilityCustomActions__block_invoke;
      v49 = &unk_24FF3DAB0;
      v51[1] = &v52;
      v50 = v60;
      v51[0] = v72;
      AXPerformSafeBlock();
      v44 = (id)v53[5];
      objc_storeStrong(v51, 0);
      objc_storeStrong(&v50, 0);
      _Block_object_dispose(&v52, 8);
      objc_storeStrong(&v58, 0);
      v59 = v44;
      v11 = v77[0];
      v10 = v78;
      v13 = (id)objc_msgSend(v44, "actions");
      v12 = -[UICollectionViewTableCellAccessibility _axCustomActionsForActions:]((uint64_t)v10, v13);
      objc_msgSend(v11, "axSafelyAddObjectsFromArray:");

      v37 = 0;
      v38 = &v37;
      v39 = 838860800;
      v40 = 48;
      v41 = __Block_byref_object_copy__7;
      v42 = __Block_byref_object_dispose__7;
      v43 = 0;
      v30 = MEMORY[0x24BDAC760];
      v31 = -1073741824;
      v32 = 0;
      v33 = __76__UICollectionViewTableCellAccessibility__privateAccessibilityCustomActions__block_invoke_2;
      v34 = &unk_24FF3DAB0;
      v36[1] = &v37;
      v35 = v63;
      v36[0] = v72;
      AXPerformSafeBlock();
      v29 = (id)v38[5];
      objc_storeStrong(v36, 0);
      objc_storeStrong(&v35, 0);
      _Block_object_dispose(&v37, 8);
      objc_storeStrong(&v43, 0);
      v2 = v59;
      v59 = v29;

      v7 = v77[0];
      v6 = v78;
      v9 = (id)objc_msgSend(v59, "actions");
      v8 = -[UICollectionViewTableCellAccessibility _axCustomActionsForActions:]((uint64_t)v6, v9);
      objc_msgSend(v7, "axSafelyAddObjectsFromArray:");

      objc_storeStrong(&v59, 0);
      objc_storeStrong(&v63, 0);
    }
    if (!objc_msgSend(v77[0], "count"))
    {
      v28 = (id)-[UICollectionViewTableCellAccessibility safeValueForKey:](v78, "safeValueForKey:", CFSTR("tableViewCell"));
      if (v28)
      {
        v4 = v77[0];
        v5 = (id)objc_msgSend(v28, "_privateAccessibilityCustomActions");
        objc_msgSend(v4, "axSafelyAddObjectsFromArray:");

      }
      objc_storeStrong(&v28, 0);
    }
    v79 = v77[0];
    v71 = 1;
    objc_storeStrong(&v68, 0);
    objc_storeStrong(&v69, 0);
    objc_storeStrong(&v70, 0);
  }
  else
  {
    v79 = v77[0];
    v71 = 1;
  }
  objc_storeStrong(&v72, 0);
  objc_storeStrong(&v76, 0);
  objc_storeStrong(v77, 0);
  return v79;
}

void __76__UICollectionViewTableCellAccessibility__privateAccessibilityCustomActions__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;

  v1 = (id)objc_msgSend(*(id *)(a1 + 32), "_leadingSwipeActionsConfigurationForIndexPath:", *(_QWORD *)(a1 + 40));
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = v1;

}

void __76__UICollectionViewTableCellAccessibility__privateAccessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;

  v1 = (id)objc_msgSend(*(id *)(a1 + 32), "_trailingSwipeActionsConfigurationForIndexPath:", *(_QWORD *)(a1 + 40));
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = v1;

}

@end

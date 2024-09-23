@implementation CKEditableSearchResultCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKEditableSearchResultCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKSearchViewController"), CFSTR("searchControllers"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKSearchController"), CFSTR("results"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKSearchController"), CFSTR("menuElementsForResult:atIndexPath:sourceRect:"), "@", "@", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);

}

- (id)accessibilityCustomActions
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  _QWORD v29[5];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(uint64_t);
  void *v37;
  id v38;
  id v39;
  id v40;
  CKEditableSearchResultCellAccessibility *v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  objc_super v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v28 = (id)objc_claimAutoreleasedReturnValue();
  v49.receiver = self;
  v49.super_class = (Class)CKEditableSearchResultCellAccessibility;
  -[CKEditableSearchResultCellAccessibility accessibilityCustomActions](&v49, sel_accessibilityCustomActions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "axSafelyAddObjectsFromArray:", v3);

  objc_opt_class();
  -[CKEditableSearchResultCellAccessibility _accessibilityViewAncestorIsKindOf:](self, "_accessibilityViewAncestorIsKindOf:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "delegate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "safeArrayForKey:", CFSTR("searchControllers"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKEditableSearchResultCellAccessibility _accessibilityIndexPath](self, "_accessibilityIndexPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "section");
  if (v6 >= objc_msgSend(v27, "count"))
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v27, "objectAtIndex:", objc_msgSend(v5, "section"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "safeArrayForKey:", CFSTR("results"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "row");
  if (v8 >= objc_msgSend(v26, "count"))
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v26, "objectAtIndex:", objc_msgSend(v5, "row"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__0;
  v47 = __Block_byref_object_dispose__0;
  v48 = 0;
  v34 = MEMORY[0x24BDAC760];
  v35 = 3221225472;
  v36 = __69__CKEditableSearchResultCellAccessibility_accessibilityCustomActions__block_invoke;
  v37 = &unk_2501B1D08;
  v42 = &v43;
  v21 = v7;
  v38 = v21;
  v23 = v9;
  v39 = v23;
  v22 = v5;
  v40 = v22;
  v41 = self;
  AXPerformSafeBlock();
  v10 = (id)v44[5];

  _Block_object_dispose(&v43, 8);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v50, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v31 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v15, "title");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v16)
        {
          objc_msgSend(v15, "image");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "accessibilityLabel");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

        }
        v18 = objc_alloc(MEMORY[0x24BDF6788]);
        v29[0] = MEMORY[0x24BDAC760];
        v29[1] = 3221225472;
        v29[2] = __69__CKEditableSearchResultCellAccessibility_accessibilityCustomActions__block_invoke_2;
        v29[3] = &unk_2501B1BC0;
        v29[4] = v15;
        v19 = (void *)objc_msgSend(v18, "initWithName:actionHandler:", v16, v29);
        objc_msgSend(v28, "axSafelyAddObject:", v19);

      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v50, 16);
    }
    while (v12);
  }

  return v28;
}

void __69__CKEditableSearchResultCellAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 56), "accessibilityFrame");
  objc_msgSend(v2, "menuElementsForResult:atIndexPath:sourceRect:", v3, v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

uint64_t __69__CKEditableSearchResultCellAccessibility_accessibilityCustomActions__block_invoke_2()
{
  AXPerformSafeBlock();
  return 1;
}

uint64_t __69__CKEditableSearchResultCellAccessibility_accessibilityCustomActions__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performWithSender:target:", 0, 0);
}

@end

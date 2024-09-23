@implementation TUICandidateGridAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TUICandidateGrid");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TUICandidateGrid"), CFSTR("setSelectedIndexPath:animated:scrollPosition:"), "v", "@", "B", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TUICandidateGrid"), CFSTR("collectionView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UICollectionView"), CFSTR("indexPathForSupplementaryView:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("TUICandidateGrid"), CFSTR("_selectedIndexPath"), "NSIndexPath");

}

- (int64_t)accessibilityNavigationStyle
{
  return 2;
}

- (id)_accessibilityScannerGroupElements
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  double v8;
  double v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v39;
  id v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  id obj;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  _QWORD v50[4];
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint64_t v60;
  uint64_t v61;
  void (*v62)(uint64_t);
  void *v63;
  id v64;
  void *v65;
  __int128 *p_buf;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _QWORD v71[2];
  _QWORD v72[2];
  _QWORD v73[3];
  _QWORD v74[3];
  _BYTE v75[128];
  uint8_t v76[128];
  __int128 buf;
  uint64_t v78;
  uint64_t (*v79)(uint64_t, uint64_t);
  void (*v80)(uint64_t);
  id v81;
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEBADC8], "defaultSwitchControlOptions");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setSorted:", 0);
  objc_msgSend(v39, "setShouldReturnScannerGroups:", 0);
  -[TUICandidateGridAccessibility _accessibilityLeafDescendantsWithOptions:](self, "_accessibilityLeafDescendantsWithOptions:", v39);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(buf) = 0;
  objc_opt_class();
  -[TUICandidateGridAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("collectionView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v82, 16);
  if (v5)
  {
    v46 = *(_QWORD *)v68;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v68 != v46)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
        objc_msgSend(v7, "accessibilityFrame");
        UIAccessibilityFrameToBounds();
        v9 = v8;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v45, "indexPathForCell:", v7);
          v10 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            AXLogAppAccessibility();
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              LODWORD(buf) = 138412290;
              *(_QWORD *)((char *)&buf + 4) = v7;
              _os_log_error_impl(&dword_232AFD000, v12, OS_LOG_TYPE_ERROR, "Unexpected element in candidate grid: %@", (uint8_t *)&buf, 0xCu);
            }

            goto LABEL_15;
          }
          *(_QWORD *)&buf = 0;
          *((_QWORD *)&buf + 1) = &buf;
          v78 = 0x3032000000;
          v79 = __Block_byref_object_copy_;
          v80 = __Block_byref_object_dispose_;
          v81 = 0;
          v60 = MEMORY[0x24BDAC760];
          v61 = 3221225472;
          v62 = __67__TUICandidateGridAccessibility__accessibilityScannerGroupElements__block_invoke;
          v63 = &unk_2503B4CE0;
          p_buf = &buf;
          v64 = v45;
          v65 = v7;
          AXPerformSafeBlock();
          v10 = *(id *)(*((_QWORD *)&buf + 1) + 40);

          _Block_object_dispose(&buf, 8);
        }
        if (v10)
        {
          v11 = objc_msgSend(v10, "section");
          goto LABEL_18;
        }
LABEL_15:
        AXLogAppAccessibility();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v7;
          _os_log_error_impl(&dword_232AFD000, v13, OS_LOG_TYPE_ERROR, "Unable to get index path from element in candidate grid: %@", (uint8_t *)&buf, 0xCu);
        }

        v10 = 0;
        v11 = -1;
LABEL_18:
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15)
        {
          objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v11);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "setObject:forKeyedSubscript:", v15, v16);

        }
        v17 = round(v9);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v19)
        {
          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v17);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v19, v20);

        }
        objc_msgSend(v19, "addObject:", v7);

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v82, 16);
    }
    while (v5);
  }

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  objc_msgSend(v48, "allKeys");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "sortedArrayUsingSelector:");
  v40 = (id)objc_claimAutoreleasedReturnValue();

  v43 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v56, v76, 16);
  if (v43)
  {
    v41 = *(_QWORD *)v57;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v57 != v41)
        {
          v23 = v22;
          objc_enumerationMutation(v40);
          v22 = v23;
        }
        v47 = v22;
        objc_msgSend(v48, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * v22));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = 0u;
        v55 = 0u;
        v52 = 0u;
        v53 = 0u;
        objc_msgSend(v24, "allKeys");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "sortedArrayUsingSelector:", sel_compare_);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v52, v75, 16);
        if (v28)
        {
          v29 = *(_QWORD *)v53;
          do
          {
            for (j = 0; j != v28; ++j)
            {
              if (*(_QWORD *)v53 != v29)
                objc_enumerationMutation(v27);
              objc_msgSend(v24, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * j));
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v50[0] = MEMORY[0x24BDAC760];
              v50[1] = 3221225472;
              v50[2] = __67__TUICandidateGridAccessibility__accessibilityScannerGroupElements__block_invoke_205;
              v50[3] = &unk_2503B4D08;
              v51 = v49;
              objc_msgSend(v31, "sortedArrayUsingComparator:", v50);
              v32 = (void *)objc_claimAutoreleasedReturnValue();

              v73[0] = CFSTR("GroupElements");
              v73[1] = CFSTR("GroupTraits");
              v74[0] = v32;
              v74[1] = &unk_2503B7618;
              v73[2] = CFSTR("GroupScanBehaviorTraits");
              v74[2] = &unk_2503B7630;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v74, v73, 3);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "addObject:", v33);

            }
            v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v52, v75, 16);
          }
          while (v28);
        }

        v71[0] = CFSTR("GroupElements");
        v71[1] = CFSTR("GroupScanBehaviorTraits");
        v72[0] = v25;
        v72[1] = &unk_2503B7630;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v72, v71, 2);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "addObject:", v34);

        v22 = v47 + 1;
      }
      while (v47 + 1 != v43);
      v43 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v56, v76, 16);
    }
    while (v43);
  }

  if (objc_msgSend(v42, "count") == 1)
  {
    objc_msgSend(v42, "firstObject");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("GroupElements"));
    v36 = (id)objc_claimAutoreleasedReturnValue();

    v37 = v42;
  }
  else
  {
    v37 = v42;
    v36 = v42;
  }

  return v36;
}

void __67__TUICandidateGridAccessibility__accessibilityScannerGroupElements__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "indexPathForSupplementaryView:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __67__TUICandidateGridAccessibility__accessibilityScannerGroupElements__block_invoke_205(uint64_t a1, void *a2, void *a3)
{
  id v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;

  v4 = a3;
  objc_msgSend(a2, "accessibilityFrame");
  UIAccessibilityFrameToBounds();
  v6 = v5;
  objc_msgSend(v4, "accessibilityFrame");

  UIAccessibilityFrameToBounds();
  v8 = -1;
  if (v6 >= v7)
    v8 = 1;
  if (v6 == v7)
    return 0;
  else
    return v8;
}

- (void)setSelectedIndexPath:(id)a3 animated:(BOOL)a4 scrollPosition:(unint64_t)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v6 = a4;
  v8 = a3;
  -[TUICandidateGridAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_selectedIndexPath"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15.receiver = self;
  v15.super_class = (Class)TUICandidateGridAccessibility;
  -[TUICandidateGridAccessibility setSelectedIndexPath:animated:scrollPosition:](&v15, sel_setSelectedIndexPath_animated_scrollPosition_, v8, v6, a5);
  -[TUICandidateGridAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_selectedIndexPath"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 != v10 && (objc_msgSend(v9, "isEqual:", v10) & 1) == 0)
  {
    objc_opt_class();
    -[TUICandidateGridAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("collectionView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "cellForItemAtIndexPath:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "accessibilityLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "length"))
      UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v14);

  }
}

@end

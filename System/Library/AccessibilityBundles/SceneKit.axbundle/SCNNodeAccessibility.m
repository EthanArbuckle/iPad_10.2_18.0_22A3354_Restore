@implementation SCNNodeAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SCNNode");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SCNNode"), CFSTR("childNodes"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SCNNode"), CFSTR("parentNode"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SCNNode"), CFSTR("name"), "@", 0);

}

+ (BOOL)_isSerializableAccessibilityElement
{
  return 1;
}

- (void)dealloc
{
  objc_super v3;

  -[SCNNodeAccessibility _accessibilityUnregister](self, "_accessibilityUnregister");
  v3.receiver = self;
  v3.super_class = (Class)SCNNodeAccessibility;
  -[SCNNodeAccessibility dealloc](&v3, sel_dealloc);
}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SCNNodeAccessibility;
  -[SCNNodeAccessibility accessibilityElements](&v8, sel_accessibilityElements);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[SCNNodeAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("childNodes"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (id)accessibilityContainer
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SCNNodeAccessibility;
  -[SCNNodeAccessibility accessibilityContainer](&v8, sel_accessibilityContainer);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[SCNNodeAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("parentNode"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (CGRect)_accessibilityConvertRect:(CGRect)a3 toNode:(id)a4
{
  CGFloat height;
  CGFloat width;
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  -[SCNNodeAccessibility convertPoint:toNode:](self, "convertPoint:toNode:", a4, a3.origin.x, a3.origin.y);
  v8 = width;
  v9 = height;
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (id)accessibilityPath
{
  void *v2;
  void *v3;
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SCNNodeAccessibility;
  -[SCNNodeAccessibility accessibilityPath](&v6, sel_accessibilityPath);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (BOOL)isAccessibilityElement
{
  objc_super v4;

  if ((-[SCNNodeAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isHidden")) & 1) != 0)
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)SCNNodeAccessibility;
  return -[SCNNodeAccessibility isAccessibilityElement](&v4, sel_isAccessibilityElement);
}

- (CGRect)accessibilityFrame
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  UIView *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  UIBezierPath *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGRect result;

  -[SCNNodeAccessibility accessibilityUserDefinedFrame](self, "accessibilityUserDefinedFrame");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "CGRectValue");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
  }
  else
  {
    -[SCNNodeAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", objc_opt_class());
    v13 = (UIView *)objc_claimAutoreleasedReturnValue();
    -[SCNNodeAccessibility _accessibilitySCNVector3BoundingBoxPoints](self, "_accessibilitySCNVector3BoundingBoxPoints");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCNNodeAccessibility _accessibilityConvertSCNVector3Points:toNode:](self, "_accessibilityConvertSCNVector3Points:toNode:", v14, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    __UIAccessibilityCastAsSafeCategory();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "accessibilityProjectSCNVector3Points:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v17, "count"))
    {
      objc_msgSend(MEMORY[0x24BDF6870], "accessibilityBezierPathWithSCNVector3Points:", v17);
      v18 = (UIBezierPath *)objc_claimAutoreleasedReturnValue();
      UIAccessibilityConvertPathToScreenCoordinates(v18, v13);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "bounds");
      v6 = v20;
      v8 = v21;
      v10 = v22;
      v12 = v23;

    }
    else
    {
      -[SCNNodeAccessibility accessibilityContainer](self, "accessibilityContainer");
      v18 = (UIBezierPath *)objc_claimAutoreleasedReturnValue();
      -[UIBezierPath accessibilityFrame](v18, "accessibilityFrame");
      v6 = v24;
      v8 = v25;
      v10 = v26;
      v12 = v27;
    }

  }
  v28 = v6;
  v29 = v8;
  v30 = v10;
  v31 = v12;
  result.size.height = v31;
  result.size.width = v30;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

- (id)accessibilityIdentifier
{
  return (id)-[SCNNodeAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("name"));
}

- (id)_accessibilitySCNVector3BoundingBoxPoints
{
  void *v2;
  void *v3;
  id v4;
  int v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  int v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  int v55;

  v2 = (void *)objc_opt_new();
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0;
  v51 = &v50;
  v52 = 0x3010000000;
  v53 = &unk_232971375;
  v54 = 0;
  v55 = 0;
  v44 = 0;
  v45 = &v44;
  v46 = 0x3010000000;
  v47 = &unk_232971375;
  v48 = 0;
  v49 = 0;
  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v43 = 0;
  v39 = MEMORY[0x24BDAC760];
  v4 = v3;
  AXPerformSafeBlock();
  v5 = *((unsigned __int8 *)v41 + 24);

  _Block_object_dispose(&v40, 8);
  if (v5)
  {
    LODWORD(v6) = *((_DWORD *)v45 + 8);
    LODWORD(v7) = *((_DWORD *)v45 + 9);
    LODWORD(v8) = *((_DWORD *)v45 + 10);
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithSCNVector3:", v6, v7, v8, v39, 3221225472, __65__SCNNodeAccessibility__accessibilitySCNVector3BoundingBoxPoints__block_invoke, &unk_250335478);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v9);

    LODWORD(v10) = *((_DWORD *)v51 + 8);
    LODWORD(v11) = *((_DWORD *)v45 + 9);
    LODWORD(v12) = *((_DWORD *)v45 + 10);
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithSCNVector3:", v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v13);

    LODWORD(v14) = *((_DWORD *)v51 + 8);
    LODWORD(v15) = *((_DWORD *)v45 + 9);
    LODWORD(v16) = *((_DWORD *)v51 + 10);
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithSCNVector3:", v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v17);

    LODWORD(v18) = *((_DWORD *)v45 + 8);
    LODWORD(v19) = *((_DWORD *)v45 + 9);
    LODWORD(v20) = *((_DWORD *)v51 + 10);
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithSCNVector3:", v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v21);

    LODWORD(v22) = *((_DWORD *)v51 + 8);
    LODWORD(v23) = *((_DWORD *)v51 + 9);
    LODWORD(v24) = *((_DWORD *)v51 + 10);
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithSCNVector3:", v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v25);

    LODWORD(v26) = *((_DWORD *)v51 + 8);
    LODWORD(v27) = *((_DWORD *)v51 + 9);
    LODWORD(v28) = *((_DWORD *)v45 + 10);
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithSCNVector3:", v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v29);

    LODWORD(v30) = *((_DWORD *)v45 + 8);
    LODWORD(v31) = *((_DWORD *)v51 + 9);
    LODWORD(v32) = *((_DWORD *)v45 + 10);
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithSCNVector3:", v30, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v33);

    LODWORD(v34) = *((_DWORD *)v45 + 8);
    LODWORD(v35) = *((_DWORD *)v51 + 9);
    LODWORD(v36) = *((_DWORD *)v51 + 10);
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithSCNVector3:", v34, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v37);

  }
  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v50, 8);

  return v2;
}

uint64_t __65__SCNNodeAccessibility__accessibilitySCNVector3BoundingBoxPoints__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "getBoundingBoxMin:max:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32, *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)_accessibilityConvertSCNVector3Points:(id)a3 toNode:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  int v12;
  int v13;
  int v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  id obj;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  int v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  LOBYTE(v23) = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v5;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v30 != v10)
          objc_enumerationMutation(obj);
        v23 = 0;
        v24 = &v23;
        v25 = 0x3010000000;
        v26 = &unk_232971375;
        v27 = 0;
        v28 = 0;
        v21 = v8;
        v22 = v6;
        AXPerformSafeBlock();
        v12 = *((_DWORD *)v24 + 8);
        v13 = *((_DWORD *)v24 + 9);
        v14 = *((_DWORD *)v24 + 10);

        _Block_object_dispose(&v23, 8);
        LODWORD(v15) = v12;
        LODWORD(v16) = v13;
        LODWORD(v17) = v14;
        objc_msgSend(MEMORY[0x24BDD1968], "valueWithSCNVector3:", v15, v16, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v18);

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v9);
  }

  return v7;
}

uint64_t __69__SCNNodeAccessibility__accessibilityConvertSCNVector3Points_toNode___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;
  _DWORD *v4;
  int v5;
  int v6;
  int v7;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "SCNVector3Value");
  result = objc_msgSend(v2, "convertPosition:toNode:", *(_QWORD *)(a1 + 48));
  v4 = *(_DWORD **)(*(_QWORD *)(a1 + 56) + 8);
  v4[8] = v5;
  v4[9] = v6;
  v4[10] = v7;
  return result;
}

@end

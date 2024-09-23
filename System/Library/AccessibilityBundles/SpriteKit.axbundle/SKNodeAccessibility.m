@implementation SKNodeAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SKNode");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SKNode"), CFSTR("children"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SKNode"), CFSTR("frame"), "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SKNode"), CFSTR("scene"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SKNode"), CFSTR("parent"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SKNode"), CFSTR("name"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SKNode"), CFSTR("alpha"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SKNode"), CFSTR("isHidden"), "B", 0);

}

- (id)accessibilityLabel
{
  void *v3;
  uint64_t v4;

  -[SKNodeAccessibility accessibilityUserDefinedLabel](self, "accessibilityUserDefinedLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "length"))
  {
    -[SKNodeAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("name"));
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  return v3;
}

- (id)_accessibilitySpriteKitChildrenNodes
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy_;
  v8 = __Block_byref_object_dispose_;
  v9 = 0;
  AXPerformSafeBlock();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __59__SKNodeAccessibility__accessibilitySpriteKitChildrenNodes__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("children"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reverseObjectEnumerator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (CGRect)accessibilityFrame
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  uint64_t v17;
  UIView *v18;
  BOOL v19;
  BOOL v20;
  BOOL v21;
  BOOL v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  double v32;
  double v33;
  double v34;
  uint64_t i;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  char v46;
  objc_super v47;
  _QWORD v48[4];
  _BYTE v49[128];
  uint64_t v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect result;

  v50 = *MEMORY[0x24BDAC8D0];
  v47.receiver = self;
  v47.super_class = (Class)SKNodeAccessibility;
  -[SKNodeAccessibility accessibilityFrame](&v47, sel_accessibilityFrame);
  x = v51.origin.x;
  y = v51.origin.y;
  width = v51.size.width;
  height = v51.size.height;
  if (!CGRectIsEmpty(v51))
    goto LABEL_36;
  v46 = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend(v6, "scene");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "parent");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "view");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (UIView *)v17;
  v19 = !v15 || v6 == 0;
  v20 = v19 || v16 == 0;
  v21 = v20 || v17 == 0;
  v22 = v21;
  if (v21)
  {
    v10 = *MEMORY[0x24BDBF090];
    v8 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v12 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v14 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }
  else
  {
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", v8, v10 + v14, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = v23;
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", v8 + v12, v10 + v14);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v48[1] = v24;
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", v8, v10);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v48[2] = v25;
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", v8 + v12, v10);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v48[3] = v26;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v48, 4);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v43;
      v31 = -INFINITY;
      v32 = INFINITY;
      v33 = INFINITY;
      v34 = -INFINITY;
      do
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v43 != v30)
            objc_enumerationMutation(v27);
          objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * i), "CGPointValue");
          objc_msgSend(v15, "convertPoint:fromNode:", v16);
          objc_msgSend(v15, "convertPointToView:");
          if (v36 >= v34)
            v34 = v36;
          if (v37 >= v31)
            v31 = v37;
          if (v36 < v33)
            v33 = v36;
          if (v37 < v32)
            v32 = v37;
        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
      }
      while (v29);
    }
    else
    {
      v31 = -INFINITY;
      v32 = INFINITY;
      v33 = INFINITY;
      v34 = -INFINITY;
    }

    v52.size.width = v34 - v33;
    v52.size.height = v31 - v32;
    v52.origin.x = v33;
    v52.origin.y = v32;
    v53 = UIAccessibilityConvertFrameToScreenCoordinates(v52, v18);
    x = v53.origin.x;
    y = v53.origin.y;
    width = v53.size.width;
    height = v53.size.height;
  }

  if (!v22)
  {
LABEL_36:
    v10 = x;
    v8 = y;
    v12 = width;
    v14 = height;
  }
  v38 = v10;
  v39 = v8;
  v40 = v12;
  v41 = v14;
  result.size.height = v41;
  result.size.width = v40;
  result.origin.y = v39;
  result.origin.x = v38;
  return result;
}

- (BOOL)accessibilityElementsHidden
{
  double v3;

  -[SKNodeAccessibility safeCGFloatForKey:](self, "safeCGFloatForKey:", CFSTR("alpha"));
  if (v3 == 0.0)
    return 1;
  else
    return -[SKNodeAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isHidden"));
}

- (id)accessibilityContainer
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SKNodeAccessibility;
  -[SKNodeAccessibility accessibilityContainer](&v5, sel_accessibilityContainer);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[SKNodeAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("parent"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      -[SKNodeAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("scene"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v3;
}

- (int64_t)accessibilityElementCount
{
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SKNodeAccessibility;
  v3 = -[SKNodeAccessibility accessibilityElementCount](&v6, sel_accessibilityElementCount);
  if (v3 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    -[SKNodeAccessibility _accessibilitySpriteKitChildrenNodes](self, "_accessibilitySpriteKitChildrenNodes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (id)objc_msgSend(v4, "accessibilityElementCount");

  }
  return (int64_t)v3;
}

- (id)accessibilityElementAtIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SKNodeAccessibility;
  -[SKNodeAccessibility accessibilityElementAtIndex:](&v8, sel_accessibilityElementAtIndex_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[SKNodeAccessibility _accessibilitySpriteKitChildrenNodes](self, "_accessibilitySpriteKitChildrenNodes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessibilityElementAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (int64_t)indexOfAccessibilityElement:(id)a3
{
  id v4;
  id v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SKNodeAccessibility;
  v5 = -[SKNodeAccessibility indexOfAccessibilityElement:](&v8, sel_indexOfAccessibilityElement_, v4);
  if (v5 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    -[SKNodeAccessibility _accessibilitySpriteKitChildrenNodes](self, "_accessibilitySpriteKitChildrenNodes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v6, "indexOfAccessibilityElement:", v4);

  }
  return (int64_t)v5;
}

@end

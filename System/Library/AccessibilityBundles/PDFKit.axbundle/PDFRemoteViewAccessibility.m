@implementation PDFRemoteViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIRemoteView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:", CFSTR("PDFExtensionTopView"));
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  uint64_t v28;
  void *v29;
  void *v31;
  objc_super v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  char v37;
  _BYTE v38[128];
  uint64_t v39;
  CGPoint v40;
  CGRect v41;

  y = a3.y;
  x = a3.x;
  v39 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v37 = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "superview");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  objc_msgSend(v9, "subviews");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v34;
LABEL_3:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v34 != v13)
        objc_enumerationMutation(v10);
      v15 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v14);
      MEMORY[0x234918584](CFSTR("PDFExtensionTopView"));
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      if (v12 == ++v14)
      {
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
        if (v12)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    objc_msgSend(v15, "frame");
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;

    if (!v9)
      goto LABEL_14;
    while (1)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v9, "convertPoint:fromView:", v8, x, y);
        v25 = v24;
        v27 = v26;
        objc_msgSend(v9, "convertRect:fromView:", v8, v17, v19, v21, v23);
        v40.x = v25;
        v40.y = v27;
        if (CGRectContainsPoint(v41, v40))
          break;
      }
      objc_msgSend(v9, "superview");
      v28 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v28;
      if (!v28)
        goto LABEL_14;
    }
    -[PDFRemoteViewAccessibility accessibilityElements](self, "accessibilityElements");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "lastObject");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_9:

LABEL_14:
    v32.receiver = self;
    v32.super_class = (Class)PDFRemoteViewAccessibility;
    -[PDFRemoteViewAccessibility _accessibilityHitTest:withEvent:](&v32, sel__accessibilityHitTest_withEvent_, v7, x, y);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v29;
}

@end

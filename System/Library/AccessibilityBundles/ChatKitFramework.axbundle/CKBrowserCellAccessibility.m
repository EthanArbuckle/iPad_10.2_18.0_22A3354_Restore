@implementation CKBrowserCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKBrowserCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CKBrowserCell"), CFSTR("UICollectionViewCell"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKBrowserCell"), CFSTR("iconView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKBrowserCell"), CFSTR("browserLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKBrowserCell"), CFSTR("shinyStatus"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKBrowserCell"), CFSTR("shinyStatusView"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (CGRect)accessibilityFrame
{
  UIView *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  void *v12;
  void *v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect result;
  CGRect v40;
  CGRect v41;

  -[CKBrowserCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("contentView"));
  v3 = (UIView *)objc_claimAutoreleasedReturnValue();
  -[CKBrowserCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("iconView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("frame"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rectValue");
  v31 = UIAccessibilityConvertFrameToScreenCoordinates(v30, v3);
  y = v31.origin.y;
  x = v31.origin.x;
  height = v31.size.height;
  width = v31.size.width;

  -[CKBrowserCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("browserLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeValueForKey:", CFSTR("frame"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rectValue");
  v33 = UIAccessibilityConvertFrameToScreenCoordinates(v32, v3);
  v8 = v33.origin.x;
  v9 = v33.origin.y;
  v10 = v33.size.width;
  v11 = v33.size.height;

  -[CKBrowserCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("shinyStatusView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "safeValueForKey:", CFSTR("frame"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "rectValue");
  v35 = UIAccessibilityConvertFrameToScreenCoordinates(v34, v3);
  v14 = v35.origin.x;
  v15 = v35.origin.y;
  v16 = v35.size.width;
  v17 = v35.size.height;

  v36.origin.y = y;
  v36.origin.x = x;
  v36.size.height = height;
  v36.size.width = width;
  v40.origin.x = v8;
  v40.origin.y = v9;
  v40.size.width = v10;
  v40.size.height = v11;
  v37 = CGRectUnion(v36, v40);
  v41.origin.x = v14;
  v41.origin.y = v15;
  v41.size.width = v16;
  v41.size.height = v17;
  v38 = CGRectUnion(v37, v41);
  v18 = v38.origin.x;
  v19 = v38.origin.y;
  v20 = v38.size.width;
  v21 = v38.size.height;

  v22 = v18;
  v23 = v19;
  v24 = v20;
  v25 = v21;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v7;

  -[CKBrowserCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("browserLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBrowserCellAccessibility _axShinyStatusLabel](self, "_axShinyStatusLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)accessibilityActivate
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  BOOL v11;
  objc_super v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  void *v18;
  id v19;
  id v20;
  char v21;

  v21 = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBrowserCellAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = v3 == 0;
  else
    v6 = 1;
  if (v6)
    goto LABEL_10;
  objc_msgSend(v4, "indexPathForCell:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
LABEL_9:

LABEL_10:
    v13.receiver = self;
    v13.super_class = (Class)CKBrowserCellAccessibility;
    v11 = -[CKBrowserCellAccessibility accessibilityActivate](&v13, sel_accessibilityActivate);
    goto LABEL_11;
  }
  objc_msgSend(v5, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    goto LABEL_9;
  }
  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = __51__CKBrowserCellAccessibility_accessibilityActivate__block_invoke;
  v17 = &unk_2501B2098;
  v18 = v8;
  v19 = v5;
  v20 = v7;
  v9 = v7;
  v10 = v8;
  AXPerformSafeBlock();

  v11 = 1;
LABEL_11:

  return v11;
}

uint64_t __51__CKBrowserCellAccessibility_accessibilityActivate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "collectionView:didSelectItemAtIndexPath:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (CGPoint)accessibilityActivationPoint
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  -[CKBrowserCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("iconView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityActivationPoint");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (id)accessibilityUserInputLabels
{
  void *v2;
  void *v3;
  void *v4;

  -[CKBrowserCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("browserLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x23490A6E4]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKBrowserCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[CKBrowserCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (id)_axShinyStatusLabel
{
  void *v2;
  uint64_t v3;
  __CFString *v4;
  void *v5;

  -[CKBrowserCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("shinyStatus"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  if (v3 == 1)
  {
    v4 = CFSTR("app.status.new");
  }
  else
  {
    if (v3 != 2)
    {
      v5 = 0;
      return v5;
    }
    v4 = CFSTR("app.status.new.from.test.flight");
  }
  accessibilityLocalizedString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  return v5;
}

@end

@implementation PUGridRenderedStripAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PUGridRenderedStrip");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUGridRenderedStrip"), CFSTR("_render"), "v", 0);
}

- (void)_axClearData
{
  -[PUGridRenderedStripAccessibility setAccessibilityLabel:](self, "setAccessibilityLabel:", 0);
  -[PUGridRenderedStripAccessibility _accessibilityRemoveValueForKey:](self, "_accessibilityRemoveValueForKey:", CFSTR("IsAXElementSet"));
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUGridRenderedStripAccessibility;
  -[PUGridRenderedStripAccessibility layoutSubviews](&v3, sel_layoutSubviews);
  -[PUGridRenderedStripAccessibility _axClearData](self, "_axClearData");
}

- (void)_render
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUGridRenderedStripAccessibility;
  -[PUGridRenderedStripAccessibility _render](&v3, sel__render);
  -[PUGridRenderedStripAccessibility _axClearData](self, "_axClearData");
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  PUGridRenderedStripAccessibility *v9;
  CGPoint v11;
  CGRect v12;

  if (-[PUGridRenderedStripAccessibility isAccessibilityElement](self, "isAccessibilityElement", a4)
    && (UIAccessibilityPointForPoint(),
        v6 = v5,
        v8 = v7,
        -[PUGridRenderedStripAccessibility accessibilityFrame](self, "accessibilityFrame"),
        v11.x = v6,
        v11.y = v8,
        CGRectContainsPoint(v12, v11)))
  {
    v9 = self;
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (void)_axGenerateLabel:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  char isKindOfClass;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a3;
  v4 = objc_msgSend(v14, "indexOfObject:", self);
  if (v4 < 0)
  {
LABEL_6:
    v9 = 0;
  }
  else
  {
    v5 = v4;
    while (1)
    {
      objc_msgSend(v14, "objectAtIndex:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      NSClassFromString(CFSTR("PXPhotosSectionHeaderView"));
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
        break;
      if (v5-- <= 0)
        goto LABEL_6;
    }
    objc_msgSend(v14, "objectAtIndex:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "accessibilityLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend(v9, "length"))
  {
    v11 = (void *)MEMORY[0x24BDD17C8];
    accessibilityPULocalizedString(CFSTR("small.photos.group.with.title"));
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", v12, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)v12;
  }
  else
  {
    accessibilityPULocalizedString(CFSTR("small.photos.group"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  -[PUGridRenderedStripAccessibility setAccessibilityLabel:](self, "setAccessibilityLabel:", v13);
}

- (void)_axGenerateIsElement:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  v4 = objc_msgSend(v11, "indexOfObject:", self);
  v5 = v4;
  if (v4 >= 1)
  {
    v6 = v4 + 1;
    v7 = v4;
    while (1)
    {
      objc_msgSend(v11, "objectAtIndex:", v6 - 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if ((objc_msgSend(v8, "isHidden") & 1) == 0 && objc_msgSend(v8, "isAccessibilityElement"))
          v7 = v6 - 2;
      }
      else
      {
        NSClassFromString(CFSTR("PXPhotosSectionHeaderView"));
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v8, "accessibilityLabel");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "length");

          if (v10)
          {

            goto LABEL_14;
          }
        }
      }

      if ((unint64_t)--v6 <= 1)
        goto LABEL_14;
    }
  }
  v7 = v4;
LABEL_14:
  -[PUGridRenderedStripAccessibility setIsAccessibilityElement:](self, "setIsAccessibilityElement:", v7 == v5);
  -[PUGridRenderedStripAccessibility _accessibilitySetBoolValue:forKey:](self, "_accessibilitySetBoolValue:forKey:", 1, CFSTR("IsAXElementSet"));

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("AXPhotoCollectionViewScrolled"), 0);

  v4.receiver = self;
  v4.super_class = (Class)PUGridRenderedStripAccessibility;
  -[PUGridRenderedStripAccessibility dealloc](&v4, sel_dealloc);
}

- (void)_axInitializeDataForElement
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  if (-[PUGridRenderedStripAccessibility _accessibilityBoolValueForKey:](self, "_accessibilityBoolValueForKey:", CFSTR("AXDidRegister")))
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__axClearData, CFSTR("AXPhotoCollectionViewScrolled"), 0);

    -[PUGridRenderedStripAccessibility _accessibilitySetBoolValue:forKey:](self, "_accessibilitySetBoolValue:forKey:", 1, CFSTR("AXDidRegister"));
  }
  -[PUGridRenderedStripAccessibility superview](self, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "sortedArrayUsingSelector:", sel__accessibilitySimpleSort_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUGridRenderedStripAccessibility _axGenerateIsElement:](self, "_axGenerateIsElement:", v6);
  v7.receiver = self;
  v7.super_class = (Class)PUGridRenderedStripAccessibility;
  if (-[PUGridRenderedStripAccessibility isAccessibilityElement](&v7, sel_isAccessibilityElement))
    -[PUGridRenderedStripAccessibility _axGenerateLabel:](self, "_axGenerateLabel:", v6);

}

- (BOOL)isAccessibilityElement
{
  BOOL v3;
  void *v4;
  void *v5;
  objc_super v7;
  objc_super v8;

  if (-[PUGridRenderedStripAccessibility _accessibilityBoolValueForKey:](self, "_accessibilityBoolValueForKey:", CFSTR("IsAXElementSet")))
  {
    v8.receiver = self;
    v8.super_class = (Class)PUGridRenderedStripAccessibility;
    return -[PUGridRenderedStripAccessibility isAccessibilityElement](&v8, sel_isAccessibilityElement);
  }
  else if ((-[PUGridRenderedStripAccessibility isHidden](self, "isHidden") & 1) != 0)
  {
    return 0;
  }
  else
  {
    -[PUGridRenderedStripAccessibility superview](self, "superview");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "subviews");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "indexOfObject:", self) == 0x7FFFFFFFFFFFFFFFLL)
    {
      v3 = 0;
    }
    else
    {
      -[PUGridRenderedStripAccessibility _axInitializeDataForElement](self, "_axInitializeDataForElement");
      v7.receiver = self;
      v7.super_class = (Class)PUGridRenderedStripAccessibility;
      v3 = -[PUGridRenderedStripAccessibility isAccessibilityElement](&v7, sel_isAccessibilityElement);
    }

  }
  return v3;
}

- (CGRect)accessibilityFrame
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  double v7;
  CGFloat x;
  double v9;
  CGFloat y;
  double v11;
  CGFloat width;
  double v13;
  CGFloat height;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  void *v22;
  uint64_t v23;
  UIView *v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect result;
  CGRect v38;

  -[PUGridRenderedStripAccessibility superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "sortedArrayUsingSelector:", sel__accessibilitySimpleSort_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "indexOfObject:", self);
  -[PUGridRenderedStripAccessibility frame](self, "frame");
  x = v7;
  y = v9;
  width = v11;
  height = v13;
  v15 = objc_msgSend(v5, "count");
  if (v6 < v15)
  {
    v16 = v15;
    do
    {
      objc_msgSend(v5, "objectAtIndex:", v6);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if ((objc_msgSend(v17, "isHidden") & 1) == 0)
        {
          objc_msgSend(v17, "frame");
          v38.origin.x = v18;
          v38.origin.y = v19;
          v38.size.width = v20;
          v38.size.height = v21;
          v33.origin.x = x;
          v33.origin.y = y;
          v33.size.width = width;
          v33.size.height = height;
          v34 = CGRectUnion(v33, v38);
          x = v34.origin.x;
          y = v34.origin.y;
          width = v34.size.width;
          height = v34.size.height;
        }
      }
      else
      {
        NSClassFromString(CFSTR("PXPhotosSectionHeaderView"));
        if ((objc_opt_isKindOfClass() & 1) == 0
          || (objc_msgSend(v17, "accessibilityLabel"),
              v22 = (void *)objc_claimAutoreleasedReturnValue(),
              v23 = objc_msgSend(v22, "length"),
              v22,
              v23))
        {

          break;
        }
      }
      ++v6;

    }
    while (v16 != v6);
  }
  -[PUGridRenderedStripAccessibility superview](self, "superview");
  v24 = (UIView *)objc_claimAutoreleasedReturnValue();
  v35.origin.x = x;
  v35.origin.y = y;
  v35.size.width = width;
  v35.size.height = height;
  v36 = UIAccessibilityConvertFrameToScreenCoordinates(v35, v24);
  v25 = v36.origin.x;
  v26 = v36.origin.y;
  v27 = v36.size.width;
  v28 = v36.size.height;

  v29 = v25;
  v30 = v26;
  v31 = v27;
  v32 = v28;
  result.size.height = v32;
  result.size.width = v31;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

- (id)accessibilityLabel
{
  void *v3;
  PUGridRenderedStripAccessibility **v4;
  PUGridRenderedStripAccessibility *v6;
  PUGridRenderedStripAccessibility *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PUGridRenderedStripAccessibility;
  -[PUGridRenderedStripAccessibility accessibilityLabel](&v8, sel_accessibilityLabel);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v7 = self;
    v4 = &v7;
  }
  else
  {
    -[PUGridRenderedStripAccessibility _axInitializeDataForElement](self, "_axInitializeDataForElement");
    v6 = self;
    v4 = &v6;
  }
  v4[1] = (PUGridRenderedStripAccessibility *)PUGridRenderedStripAccessibility;
  objc_msgSendSuper2((objc_super *)v4, sel_accessibilityLabel, v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)accessibilityHint
{
  return accessibilityPULocalizedString(CFSTR("small.photos.group.hint"));
}

@end

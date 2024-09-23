@implementation AKAnnotationLayerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AKAnnotationLayer");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AKAnnotationLayer"), CFSTR("annotation"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AKAnnotationLayer"), CFSTR("updateContents"), "v", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  char isKindOfClass;
  uint64_t v6;
  unint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AKAnnotationLayerAccessibility;
  v3 = -[AKAnnotationLayerAccessibility accessibilityTraits](&v9, sel_accessibilityTraits);
  -[AKAnnotationLayerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("annotation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 |= *MEMORY[0x24BEBB198];
    if (objc_msgSend(v4, "isEditingText"))
      v3 |= *MEMORY[0x24BEBB128];
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v6 = *MEMORY[0x24BDFEFE8];
  if ((isKindOfClass & 1) == 0)
    v6 = 0;
  v7 = v6 | v3;

  return v7;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  uint64_t v4;
  __CFString *v5;
  uint64_t v6;
  void *v7;

  -[AKAnnotationLayerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("annotation"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_10;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "style");
  if (v4 == 3)
  {
    v5 = CFSTR("annotation.style.strikethrough");
    goto LABEL_8;
  }
  if (v4 == 2)
  {
    v5 = CFSTR("annotation.style.underline");
    goto LABEL_8;
  }
  if (v4 != 1)
  {

LABEL_10:
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "displayName");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  v5 = CFSTR("annotation.style.highlight");
LABEL_8:
  accessibilityLocalizedString(v5);
  v6 = objc_claimAutoreleasedReturnValue();
LABEL_11:
  v7 = (void *)v6;

  return v7;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  __CFString *v17;
  double v18;
  __CFString *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v39;
  const __CFString *v40;
  void *v41;
  void *v42;
  const __CFString *v43;
  void *v44;
  void *v45;
  objc_super v46;

  v46.receiver = self;
  v46.super_class = (Class)AKAnnotationLayerAccessibility;
  -[AKAnnotationLayerAccessibility accessibilityValue](&v46, sel_accessibilityValue);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAnnotationLayerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("annotation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    -[AKAnnotationLayerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("annotation"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "magnification");
    v7 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("percent.zoom"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    AXFormatFloatWithPercentage();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v39 = v10;
    v40 = CFSTR("__AXStringForVariablesSentinel");
    __UIAXStringForVariables();
    v11 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "strokeColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "accessibilityLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "isDashed"))
    {
      accessibilityLocalizedString(CFSTR("stroke.description.dashed"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }
    objc_msgSend(v12, "strokeWidth", v39, v40);
    if (v16 >= 10.0)
    {
      objc_msgSend(v12, "strokeWidth");
      if (v18 <= 20.0)
      {
        v19 = 0;
        goto LABEL_13;
      }
      v17 = CFSTR("stroke.description.thickness.thick");
    }
    else
    {
      v17 = CFSTR("stroke.description.thickness.thin");
    }
    accessibilityLocalizedString(v17);
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_13:
    v42 = v15;
    v43 = CFSTR("__AXStringForVariablesSentinel");
    v39 = v14;
    v40 = v19;
    __UIAXStringForVariables();
    v20 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v20;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "annotationText");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "typingAttributes");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    objc_msgSend(v23, "objectForKeyedSubscript:", *MEMORY[0x24BDF65F8]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    objc_msgSend(v23, "objectForKeyedSubscript:", *MEMORY[0x24BDF6600]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      objc_msgSend(v25, "fontName");
      v45 = v21;
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)MEMORY[0x24BDD17C8];
      accessibilityLocalizedString(CFSTR("stroke.fontsize.value"));
      v44 = v22;
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v25, "pointSize");
      objc_msgSend(v31, "numberWithDouble:");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "stringWithFormat:", v30, v32);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = CFSTR("__AXStringForVariablesSentinel");
      __UIAXStringForVariables();
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = v44;
      v21 = v45;
    }
    else
    {
      v33 = 0;
    }
    objc_msgSend(v27, "accessibilityLabel", v39, v40, v42, v43);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v34 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v34;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "color");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    AXColorStringForColor();
    v37 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v37;
  }

  return v3;
}

- (id)accessibilityHint
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_super v7;

  -[AKAnnotationLayerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("annotation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)AKAnnotationLayerAccessibility;
    -[AKAnnotationLayerAccessibility accessibilityHint](&v7, sel_accessibilityHint);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    accessibilityLocalizedString(CFSTR("reposition.hint"));
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;

  return v5;
}

- (BOOL)accessibilityZoomInAtPoint:(CGPoint)a3
{
  -[AKAnnotationLayerAccessibility _accessibilityZoomIn:](self, "_accessibilityZoomIn:", 1, a3.x, a3.y);
  return 1;
}

- (BOOL)accessibilityZoomOutAtPoint:(CGPoint)a3
{
  -[AKAnnotationLayerAccessibility _accessibilityZoomIn:](self, "_accessibilityZoomIn:", 0, a3.x, a3.y);
  return 1;
}

- (void)_accessibilityZoomIn:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  double v7;
  double v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a3;
  objc_opt_class();
  -[AKAnnotationLayerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("annotation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "magnification");
  v8 = -1.0;
  if (v3)
    v8 = 1.0;
  objc_msgSend(v6, "setMagnification:", fmax(fmin(v8 + v7, 10.0), 0.0));
  v9 = (id)-[AKAnnotationLayerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("updateContents"));
  v10 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("percent.zoom"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  AXFormatFloatWithPercentage();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v13);
}

- (id)accessibilityCustomActions
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAnnotationLayerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("annotation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_alloc(MEMORY[0x24BDF6788]);
    accessibilityLocalizedString(CFSTR("annotation.action.expand"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithName:target:selector:", v6, self, sel__accessibilityExpandAnnotation);

    objc_msgSend(v3, "addObject:", v7);
    v8 = objc_alloc(MEMORY[0x24BDF6788]);
    accessibilityLocalizedString(CFSTR("annotation.action.shrink"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithName:target:selector:", v9, self, sel__accessibilityShrinkAnnotation);

    objc_msgSend(v3, "addObject:", v10);
  }

  return v3;
}

- (BOOL)_accessibilityExpandAnnotation
{
  void *v3;
  char isKindOfClass;

  -[AKAnnotationLayerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("annotation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
    -[AKAnnotationLayerAccessibility _accessibilityMakeAnnotation:larger:](self, "_accessibilityMakeAnnotation:larger:", v3, 1);

  return isKindOfClass & 1;
}

- (BOOL)_accessibilityShrinkAnnotation
{
  void *v3;
  char isKindOfClass;

  -[AKAnnotationLayerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("annotation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
    -[AKAnnotationLayerAccessibility _accessibilityMakeAnnotation:larger:](self, "_accessibilityMakeAnnotation:larger:", v3, 0);

  return isKindOfClass & 1;
}

- (void)_accessibilityMakeAnnotation:(id)a3 larger:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "rectangle");
  x = v16.origin.x;
  y = v16.origin.y;
  width = v16.size.width;
  height = v16.size.height;
  v11 = CGRectGetWidth(v16) / 10.0;
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  v12 = CGRectGetHeight(v17) / 10.0;
  if (v4)
    v13 = -v11;
  else
    v13 = v11;
  if (v4)
    v14 = -v12;
  else
    v14 = v12;
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  v19 = CGRectInset(v18, v13, v14);
  objc_msgSend(v6, "setRectangle:", v19.origin.x, v19.origin.y, v19.size.width, v19.size.height);

  v15 = (id)-[AKAnnotationLayerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("updateContents"));
}

@end

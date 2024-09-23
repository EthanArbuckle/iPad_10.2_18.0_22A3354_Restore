@implementation AKToggleButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AKToggleButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("AKToggleButton"), CFSTR("UIButton"));
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  __CFString *v13;
  uint64_t v14;
  void *v15;
  objc_super v16;
  char v17;

  v17 = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageForState:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "accessibilityIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "hasPrefix:", CFSTR("AK_Attribute_Line_Stroke_Thin")))
  {
    if (objc_msgSend(v5, "hasPrefix:", CFSTR("AK_Attribute_Line_Stroke_Medium")))
    {
      v9 = CFSTR("line.shape.none");
LABEL_6:
      accessibilityLocalizedString(v9);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("stroke.description.thickness.medium");
      goto LABEL_10;
    }
    if (objc_msgSend(v5, "hasPrefix:", CFSTR("AK_Attribute_Line_Stroke_Thick")))
    {
      v10 = CFSTR("line.shape.none");
LABEL_9:
      accessibilityLocalizedString(v10);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("stroke.description.thickness.thick");
      goto LABEL_10;
    }
    if (objc_msgSend(v5, "hasPrefix:", CFSTR("AK_Attribute_Arrow_Stroke_Thin")))
    {
      v6 = CFSTR("line.shape.single");
      goto LABEL_3;
    }
    if (objc_msgSend(v5, "hasPrefix:", CFSTR("AK_Attribute_Arrow_Stroke_Medium")))
    {
      v9 = CFSTR("line.shape.single");
      goto LABEL_6;
    }
    if (objc_msgSend(v5, "hasPrefix:", CFSTR("AK_Attribute_Arrow_Stroke_Thick")))
    {
      v10 = CFSTR("line.shape.single");
      goto LABEL_9;
    }
    if (objc_msgSend(v5, "hasPrefix:", CFSTR("AK_Attribute_ArrowDouble_Stroke_Thin")))
    {
      v6 = CFSTR("line.shape.double");
      goto LABEL_3;
    }
    if (objc_msgSend(v5, "hasPrefix:", CFSTR("AK_Attribute_ArrowDouble_Stroke_Medium")))
    {
      v9 = CFSTR("line.shape.double");
      goto LABEL_6;
    }
    if (objc_msgSend(v5, "hasPrefix:", CFSTR("AK_Attribute_ArrowDouble_Stroke_Thick")))
    {
      v10 = CFSTR("line.shape.double");
      goto LABEL_9;
    }
    if (objc_msgSend(v5, "hasPrefix:", CFSTR("AK_Attribute_Circle_Filled")))
      goto LABEL_25;
    if (objc_msgSend(v5, "hasPrefix:", CFSTR("AK_Attribute_Circle_Stroke_Thin")))
    {
LABEL_27:
      v13 = CFSTR("stroke.description.thickness.thin");
      goto LABEL_32;
    }
    if (objc_msgSend(v5, "hasPrefix:", CFSTR("AK_Attribute_Circle_Stroke_Medium")))
    {
LABEL_29:
      v13 = CFSTR("stroke.description.thickness.medium");
      goto LABEL_32;
    }
    if (objc_msgSend(v5, "hasPrefix:", CFSTR("AK_Attribute_Circle_Stroke_Thick")))
    {
LABEL_31:
      v13 = CFSTR("stroke.description.thickness.thick");
      goto LABEL_32;
    }
    if (!objc_msgSend(v5, "hasPrefix:", CFSTR("AK_Attribute_Bubble_Filled")))
    {
      if (objc_msgSend(v5, "hasPrefix:", CFSTR("AK_Attribute_Bubble_Stroke_Thin")))
        goto LABEL_27;
      if (objc_msgSend(v5, "hasPrefix:", CFSTR("AK_Attribute_Bubble_Stroke_Medium")))
        goto LABEL_29;
      if (objc_msgSend(v5, "hasPrefix:", CFSTR("AK_Attribute_Bubble_Stroke_Thick")))
        goto LABEL_31;
      if (!objc_msgSend(v5, "hasPrefix:", CFSTR("AK_Attribute_Triangle_Filled")))
      {
        if (objc_msgSend(v5, "hasPrefix:", CFSTR("AK_Attribute_Triangle_Stroke_Thin")))
          goto LABEL_27;
        if (objc_msgSend(v5, "hasPrefix:", CFSTR("AK_Attribute_Triangle_Stroke_Medium")))
          goto LABEL_29;
        if (objc_msgSend(v5, "hasPrefix:", CFSTR("AK_Attribute_Triangle_Stroke_Thick")))
          goto LABEL_31;
        if (!objc_msgSend(v5, "hasPrefix:", CFSTR("AK_Attribute_Square_Filled")))
        {
          if (objc_msgSend(v5, "hasPrefix:", CFSTR("AK_Attribute_Square_Stroke_Thin")))
            goto LABEL_27;
          if (objc_msgSend(v5, "hasPrefix:", CFSTR("AK_Attribute_Square_Stroke_Medium")))
            goto LABEL_29;
          if (!objc_msgSend(v5, "hasPrefix:", CFSTR("AK_Attribute_Square_Stroke_Thick")))
          {
            v16.receiver = self;
            v16.super_class = (Class)AKToggleButtonAccessibility;
            -[AKToggleButtonAccessibility accessibilityLabel](&v16, sel_accessibilityLabel);
            v14 = objc_claimAutoreleasedReturnValue();
            goto LABEL_33;
          }
          goto LABEL_31;
        }
      }
    }
LABEL_25:
    v13 = CFSTR("stroke.description.filled");
LABEL_32:
    accessibilityLocalizedString(v13);
    v14 = objc_claimAutoreleasedReturnValue();
LABEL_33:
    v11 = (void *)v14;
    goto LABEL_11;
  }
  v6 = CFSTR("line.shape.none");
LABEL_3:
  accessibilityLocalizedString(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = CFSTR("stroke.description.thickness.thin");
LABEL_10:
  accessibilityLocalizedString(v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
  return v11;
}

- (id)accessibilityValue
{
  if (-[AKToggleButtonAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isSelected")))
    return CFSTR("1");
  else
    return CFSTR("0");
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BEBB1A8];
}

@end

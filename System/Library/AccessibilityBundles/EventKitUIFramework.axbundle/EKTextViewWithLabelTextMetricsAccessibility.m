@implementation EKTextViewWithLabelTextMetricsAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("EKTextViewWithLabelTextMetrics");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("EKEventDetailLocationItem"));
  objc_msgSend(v3, "validateClass:", CFSTR("EKEventDetailURLCell"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("EKEventDetailTitleCell"), CFSTR("_locationItems"), "NSMutableArray");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("EKEventDetailLocationItem"), CFSTR("_locationTapRecognizer"), "UITapGestureRecognizer");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("EKEventDetailURLCell"), CFSTR("_URLTitleView"), "UILabel");

}

- (id)_axLocationItem
{
  void *v2;
  void *v3;
  id v4;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  NSClassFromString(CFSTR("EKEventDetailLocationItem"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (BOOL)accessibilityIsLocationLink
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[EKTextViewWithLabelTextMetricsAccessibility _axLocationItem](self, "_axLocationItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "safeValueForKey:", CFSTR("_locationTapRecognizer"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "gestureRecognizers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v12;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v6);
          if (v4 == *(void **)(*((_QWORD *)&v11 + 1) + 8 * i))
          {
            LOBYTE(v7) = 1;
            goto LABEL_12;
          }
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  _BOOL4 v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EKTextViewWithLabelTextMetricsAccessibility;
  v3 = -[EKTextViewWithLabelTextMetricsAccessibility accessibilityTraits](&v7, sel_accessibilityTraits);
  v4 = -[EKTextViewWithLabelTextMetricsAccessibility accessibilityIsLocationLink](self, "accessibilityIsLocationLink");
  v5 = *MEMORY[0x24BDF73D8];
  if (!v4)
    v5 = 0;
  return v5 | v3;
}

- (BOOL)isAccessibilityElement
{
  void *v3;
  BOOL v4;
  objc_super v6;

  -[EKTextViewWithLabelTextMetricsAccessibility _axURLCell](self, "_axURLCell");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)EKTextViewWithLabelTextMetricsAccessibility;
    v4 = -[EKTextViewWithLabelTextMetricsAccessibility isAccessibilityElement](&v6, sel_isAccessibilityElement);
  }

  return v4;
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
  double v13;
  double v14;
  double v15;
  double v16;
  objc_super v17;
  CGRect result;

  -[EKTextViewWithLabelTextMetricsAccessibility _axURLCell](self, "_axURLCell");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "accessibilityFrame");
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)EKTextViewWithLabelTextMetricsAccessibility;
    -[EKTextViewWithLabelTextMetricsAccessibility accessibilityFrame](&v17, sel_accessibilityFrame);
  }
  v9 = v5;
  v10 = v6;
  v11 = v7;
  v12 = v8;

  v13 = v9;
  v14 = v10;
  v15 = v11;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  -[EKTextViewWithLabelTextMetricsAccessibility _axURLCell](self, "_axURLCell");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "safeValueForKey:", CFSTR("_URLTitleView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accessibilityLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)EKTextViewWithLabelTextMetricsAccessibility;
    -[EKTextViewWithLabelTextMetricsAccessibility accessibilityLabel](&v8, sel_accessibilityLabel);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)_axURLCell
{
  void *v2;
  void *v3;
  id v4;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  NSClassFromString(CFSTR("EKEventDetailURLCell"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

@end

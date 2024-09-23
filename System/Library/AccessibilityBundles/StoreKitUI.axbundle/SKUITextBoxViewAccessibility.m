@implementation SKUITextBoxViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SKUITextBoxView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SKUITextBoxView"), CFSTR("_titleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SKUITextBoxView"), CFSTR("_subtitleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SKUITextBoxView"), CFSTR("_ratingLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SKUITextBoxView"), CFSTR("_ratingImageView"), "UIImageView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SKUITextBoxView"), CFSTR("_underlyingText"), "NSString");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SKUITextBoxView"), CFSTR("_textFrame"), "^{__CTFrame=}");

}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityElements
{
  _QWORD *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (_QWORD *)MEMORY[0x24BEBB308];
  -[SKUITextBoxViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", *MEMORY[0x24BEBB308]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF67A0]), "initWithAccessibilityContainer:", self);
    objc_msgSend(v5, "setAccessibilityDelegate:", self);
    objc_msgSend(v5, "setAccessibilityIdentifier:", CFSTR("ElementIDHeader"));
    objc_msgSend(v4, "addObject:", v5);
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF67A0]), "initWithAccessibilityContainer:", self);
    objc_msgSend(v6, "setAccessibilityDelegate:", self);
    objc_msgSend(v6, "setAccessibilityIdentifier:", CFSTR("ElementIDContent"));
    objc_msgSend(v4, "addObject:", v6);
    -[SKUITextBoxViewAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v4, *v3);

  }
  return v4;
}

- (BOOL)isAccessibilityElement:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a3, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length") != 0;

  return v4;
}

- (id)accessibilityLabel:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  objc_super v19;

  v4 = a3;
  objc_msgSend(v4, "accessibilityIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("ElementIDHeader"));

  if (v6)
  {
    -[SKUITextBoxViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_titleLabel"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accessibilityLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

    goto LABEL_10;
  }
  objc_msgSend(v4, "accessibilityIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("ElementIDContent"));

  if (v10)
  {
    -[SKUITextBoxViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_subtitleLabel"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUITextBoxViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_ratingLabel"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUITextBoxViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_ratingImageView"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUITextBoxViewAccessibility safeIvarForKey:](self, "safeIvarForKey:", CFSTR("_textFrame"));
    UIAccessibilitySafeTextForCoreTextObject();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringByTrimmingCharactersInSet:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v15, "length"))
      objc_msgSend(MEMORY[0x24BDBCE30], "axArrayByIgnoringNilElementsWithCount:", 4, v7, v11, v12, v13);
    else
      objc_msgSend(MEMORY[0x24BDBCE30], "axArrayByIgnoringNilElementsWithCount:", 3, v7, v11, v12, v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x2348C2B68]();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }
  v19.receiver = self;
  v19.super_class = (Class)SKUITextBoxViewAccessibility;
  -[SKUITextBoxViewAccessibility accessibilityLabel](&v19, sel_accessibilityLabel);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v8;
}

- (CGRect)accessibilityFrame:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  int v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  objc_super v26;
  CGRect result;

  v4 = a3;
  objc_msgSend(v4, "accessibilityIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("ElementIDHeader"));

  if (v6)
  {
    -[SKUITextBoxViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_titleLabel"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accessibilityFrame");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;

  }
  else
  {
    objc_msgSend(v4, "accessibilityIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("ElementIDContent"));

    if (v17)
    {
      -[SKUITextBoxViewAccessibility accessibilityFrame](self, "accessibilityFrame");
    }
    else
    {
      v26.receiver = self;
      v26.super_class = (Class)SKUITextBoxViewAccessibility;
      -[SKUITextBoxViewAccessibility accessibilityFrame](&v26, sel_accessibilityFrame);
    }
    v9 = v18;
    v11 = v19;
    v13 = v20;
    v15 = v21;
  }

  v22 = v9;
  v23 = v11;
  v24 = v13;
  v25 = v15;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (unint64_t)accessibilityTraits:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  unint64_t *v9;
  void *v10;
  int v11;
  objc_super v13;

  v4 = a3;
  objc_msgSend(v4, "accessibilityIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("ElementIDHeader"));

  if (v6)
  {
    objc_msgSend(v4, "accessibilityLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "length");
    if (v8)
      v9 = (unint64_t *)MEMORY[0x24BDF73C0];
    else
      v9 = (unint64_t *)MEMORY[0x24BEBB178];
  }
  else
  {
    objc_msgSend(v4, "accessibilityIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("ElementIDContent"));
    if (!v11)
    {
      v13.receiver = self;
      v13.super_class = (Class)SKUITextBoxViewAccessibility;
      return (unint64_t)-[SKUITextBoxViewAccessibility accessibilityTraits](&v13, sel_accessibilityTraits);
    }
    v9 = (unint64_t *)MEMORY[0x24BDF73E0];
  }
  return *v9;
}

- (void)_accessibilitySwitchOrderedChildrenFrom:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (_QWORD *)MEMORY[0x24BEBB308];
  objc_msgSend(v4, "_accessibilityValueForKey:", *MEMORY[0x24BEBB308]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v11, "setAccessibilityDelegate:", self);
        objc_msgSend(v11, "setAccessibilityContainer:", self);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }
  -[SKUITextBoxViewAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v6, *v5);
  objc_msgSend(v4, "_accessibilityRemoveValueForKey:", *v5);

}

@end

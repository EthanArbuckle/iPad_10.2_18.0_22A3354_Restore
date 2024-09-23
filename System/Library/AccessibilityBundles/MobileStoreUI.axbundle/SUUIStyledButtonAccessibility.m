@implementation SUUIStyledButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUUIStyledButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("SUUISectionHeaderView"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SUUIStyledButton"), CFSTR("_attributedStringView"), "SUUIAttributedStringView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SUUIStyledButton"), CFSTR("_itemOfferButton"), "SUUIItemOfferButton");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUUIStyledButton"), CFSTR("imageView"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)_accessibilityIsACategoryButton
{
  void *v2;
  void *v3;
  char v4;

  -[SUUIStyledButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("imageView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("AppStoreBrowseCategoryDownChevron"));

  return v4;
}

- (BOOL)_axIsShareButtonInConnect
{
  return -[SUUIStyledButtonAccessibility _axButtonType:](self, "_axButtonType:", 1);
}

- (BOOL)_axIsPostButtonInConnect
{
  return -[SUUIStyledButtonAccessibility _axButtonType:](self, "_axButtonType:", 0);
}

- (BOOL)_axButtonType:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  void *v13;
  SUUIStyledButtonAccessibility *v14;
  SUUIStyledButtonAccessibility *v15;
  BOOL v16;
  void *v18;
  int v19;

  v3 = a3;
  -[SUUIStyledButtonAccessibility superview](self, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("SUUIHorizontalListView"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SUUIStyledButtonAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("SUUICardViewElementCollectionViewCell")));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v5, "subviews");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "count") != 3)
        goto LABEL_19;
      objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      NSClassFromString(CFSTR("SUUIToggleButton"));
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        NSClassFromString(CFSTR("SUUIStyledButton"));
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v7, "objectAtIndexedSubscript:", 2);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          NSClassFromString(CFSTR("SUUIStyledButton"));
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
          {
            objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v12, "_accessibilityViewIsVisible") & 1) != 0)
            {
LABEL_10:

              goto LABEL_11;
            }
            objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v13, "_accessibilityViewIsVisible"))
            {

              goto LABEL_10;
            }
            objc_msgSend(v7, "objectAtIndexedSubscript:", 2);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "_accessibilityViewIsVisible");

            if (!v19)
            {
LABEL_11:
              objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
              v14 = (SUUIStyledButtonAccessibility *)objc_claimAutoreleasedReturnValue();

              if (v14 == self && !v3
                || (objc_msgSend(v7, "objectAtIndexedSubscript:", 2),
                    v15 = (SUUIStyledButtonAccessibility *)objc_claimAutoreleasedReturnValue(),
                    v15,
                    v16 = 0,
                    v15 == self)
                && v3)
              {
                v16 = 1;
              }
              goto LABEL_20;
            }
            objc_msgSend(v7, "objectAtIndexedSubscript:", 2);
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "setAccessibilityIdentifier:", CFSTR("AXCloseButton"));
            goto LABEL_18;
          }
LABEL_19:
          v16 = 0;
LABEL_20:

          goto LABEL_21;
        }

      }
LABEL_18:

      goto LABEL_19;
    }
  }
  v16 = 0;
LABEL_21:

  return v16;
}

- (BOOL)_axIsCloseButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  BOOL v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  -[SUUIStyledButtonAccessibility superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("SUUIHorizontalListView"));
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (-[SUUIStyledButtonAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("SUUICardViewElementCollectionViewCell"))), v4 = (void *)objc_claimAutoreleasedReturnValue(), v4, v4))
  {
    objc_msgSend(v3, "subviews");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count") == 1
      && (objc_msgSend(v5, "objectAtIndexedSubscript:", 0),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          NSClassFromString(CFSTR("SUUIStyledButton")),
          isKindOfClass = objc_opt_isKindOfClass(),
          v6,
          (isKindOfClass & 1) != 0))
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "subviews");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v10 = v9;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v21;
        while (2)
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v21 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
            NSClassFromString(CFSTR("SUUIAttributedStringView"));
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v15, "accessibilityLabel", (_QWORD)v20);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v16, "length");

              if (!v17)
              {
                v18 = 1;
                goto LABEL_18;
              }
            }
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
          if (v12)
            continue;
          break;
        }
      }
      v18 = 0;
LABEL_18:

    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)accessibilityLabel
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v10;
  void *v11;
  id v12;
  objc_super v13;

  -[SUUIStyledButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_itemOfferButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "_accessibilityViewIsVisible"))
  {
    objc_msgSend(v3, "accessibilityLabel");
    v4 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v8 = (void *)v4;
    goto LABEL_11;
  }
  if (-[SUUIStyledButtonAccessibility _accessibilityIsACategoryButton](self, "_accessibilityIsACategoryButton"))
  {
    v5 = CFSTR("category.button");
LABEL_9:
    accessibilityLocalizedString(v5);
    v4 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  -[SUUIStyledButtonAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("AXCloseButton")) & 1) != 0)
  {

LABEL_8:
    v5 = CFSTR("close.button");
    goto LABEL_9;
  }
  v7 = -[SUUIStyledButtonAccessibility _axIsCloseButton](self, "_axIsCloseButton");

  if (v7)
    goto LABEL_8;
  if (-[SUUIStyledButtonAccessibility _axIsShareButtonInConnect](self, "_axIsShareButtonInConnect"))
  {
    v5 = CFSTR("share.button");
    goto LABEL_9;
  }
  if (-[SUUIStyledButtonAccessibility _axIsPostButtonInConnect](self, "_axIsPostButtonInConnect"))
  {
    v5 = CFSTR("post.label");
    goto LABEL_9;
  }
  -[SUUIStyledButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_attributedStringView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "accessibilityLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "length"))
  {
    v12 = v11;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SUUIStyledButtonAccessibility;
    -[SUUIStyledButtonAccessibility accessibilityLabel](&v13, sel_accessibilityLabel);
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v12;

LABEL_11:
  return v8;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;

  if (-[SUUIStyledButtonAccessibility _accessibilityIsACategoryButton](self, "_accessibilityIsACategoryButton")
    || -[SUUIStyledButtonAccessibility _axIsShareButtonInConnect](self, "_axIsShareButtonInConnect")
    || -[SUUIStyledButtonAccessibility _axIsPostButtonInConnect](self, "_axIsPostButtonInConnect"))
  {
    -[SUUIStyledButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_attributedStringView"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accessibilityLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)accessibilityHint
{
  void *v2;

  if (-[SUUIStyledButtonAccessibility _accessibilityIsACategoryButton](self, "_accessibilityIsACategoryButton"))
  {
    accessibilityLocalizedString(CFSTR("category.hint"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  char isKindOfClass;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SUUIStyledButtonAccessibility;
  v3 = *MEMORY[0x24BDF73B0] | -[SUUIStyledButtonAccessibility accessibilityTraits](&v8, sel_accessibilityTraits);
  -[SUUIStyledButtonAccessibility superview](self, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("SUUISectionHeaderView"));
  isKindOfClass = objc_opt_isKindOfClass();

  v6 = *MEMORY[0x24BDF73C0];
  if ((isKindOfClass & 1) == 0)
    v6 = 0;
  return v3 | v6;
}

@end

@implementation PSEditableTableCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PSEditableTableCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityAlwaysReturnsChild
{
  return 1;
}

- (id)_accessibilityChildren
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PSEditableTableCellAccessibility;
  -[PSEditableTableCellAccessibility _accessibilityChildren](&v9, sel__accessibilityChildren);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "indexOfObjectPassingTest:", &__block_literal_global_0);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v3, "objectAtIndex:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "setIsAccessibilityElement:", 0);
  -[PSEditableTableCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("textField"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityLabel:", v7);

  return v3;
}

uint64_t __58__PSEditableTableCellAccessibility__accessibilityChildren__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v5;
  char isKindOfClass;

  v5 = a2;
  NSClassFromString(CFSTR("UITableTextAccessibilityElement"));
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    *a4 = 1;
  return isKindOfClass & 1;
}

- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  id v5;

  length = a3.length;
  location = a3.location;
  -[PSEditableTableCellAccessibility _accessibilityTextViewTextOperationResponder](self, "_accessibilityTextViewTextOperationResponder");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_accessibilitySetSelectedTextRange:", location, length);

}

- (_NSRange)_accessibilitySelectedTextRange
{
  void *v2;
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  _NSRange result;

  -[PSEditableTableCellAccessibility _accessibilityTextViewTextOperationResponder](self, "_accessibilityTextViewTextOperationResponder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_accessibilitySelectedTextRange");
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (id)_accessibilityTextViewTextOperationResponder
{
  return (id)-[PSEditableTableCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("textField"));
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  uint64_t v7;

  -[PSEditableTableCellAccessibility accessibilityUserDefinedLabel](self, "accessibilityUserDefinedLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[PSEditableTableCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("title"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "length"))
      return v4;
    -[PSEditableTableCellAccessibility accessibilityIdentification](self, "accessibilityIdentification");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("AASpecifierUsername")) & 1) != 0)
    {
      v6 = CFSTR("account.username.label");
    }
    else
    {
      if (!objc_msgSend(v5, "isEqualToString:", CFSTR("AASpecifierPassword")))
      {
LABEL_9:

        return v4;
      }
      v6 = CFSTR("account.password.label");
    }
    accessibilityLocalizedString(v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v7;
    goto LABEL_9;
  }
  -[PSEditableTableCellAccessibility accessibilityUserDefinedLabel](self, "accessibilityUserDefinedLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  return v4;
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[PSEditableTableCellAccessibility _accessibilityTextViewTextOperationResponder](self, "_accessibilityTextViewTextOperationResponder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)accessibilityTraits
{
  void *v2;
  unint64_t v3;

  -[PSEditableTableCellAccessibility _accessibilityTextViewTextOperationResponder](self, "_accessibilityTextViewTextOperationResponder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "accessibilityTraits");

  return v3;
}

@end

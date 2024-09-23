@implementation NikeUITableViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UITableView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilitySupplementaryHeaderViews
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  objc_super v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  -[NikeUITableViewAccessibility accessibilityIdentification](self, "accessibilityIdentification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("TableWithFakeHeaderFooter"));

  if (v4)
  {
    -[NikeUITableViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("_axHeader"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NikeUITableViewAccessibility;
    -[NikeUITableViewAccessibility _accessibilitySupplementaryHeaderViews](&v8, sel__accessibilitySupplementaryHeaderViews);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  objc_super v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  -[NikeUITableViewAccessibility accessibilityIdentification](self, "accessibilityIdentification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("TableWithFakeHeaderFooter"));

  if (v4)
  {
    -[NikeUITableViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("_axFooter"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NikeUITableViewAccessibility;
    -[NikeUITableViewAccessibility _accessibilitySupplementaryFooterViews](&v8, sel__accessibilitySupplementaryFooterViews);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

@end

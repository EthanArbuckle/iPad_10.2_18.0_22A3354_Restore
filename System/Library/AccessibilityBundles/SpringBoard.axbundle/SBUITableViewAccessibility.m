@implementation SBUITableViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UITableView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  void *v3;
  BOOL v4;
  objc_super v6;

  -[SBUITableViewAccessibility accessibilityIdentification](self, "accessibilityIdentification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (((objc_msgSend(v3, "isEqualToString:", CFSTR("GuideSectionList")) & 1) != 0
     || objc_msgSend(v3, "isEqualToString:", CFSTR("GuideDomainList")))
    && (-[SBUITableViewAccessibility accessibilityElementsHidden](self, "accessibilityElementsHidden") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)SBUITableViewAccessibility;
    v4 = -[SBUITableViewAccessibility isAccessibilityElement](&v6, sel_isAccessibilityElement);
  }

  return v4;
}

- (BOOL)isAccessibilityOpaqueElementProvider
{
  void *v3;
  char v4;
  objc_super v6;

  -[SBUITableViewAccessibility accessibilityIdentification](self, "accessibilityIdentification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("NCTodayTableView"));

  if ((v4 & 1) != 0)
    return 0;
  v6.receiver = self;
  v6.super_class = (Class)SBUITableViewAccessibility;
  return -[SBUITableViewAccessibility isAccessibilityOpaqueElementProvider](&v6, sel_isAccessibilityOpaqueElementProvider);
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  -[SBUITableViewAccessibility accessibilityIdentification](self, "accessibilityIdentification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("NCTodayTableView"));

  if (v4)
  {
    -[SBUITableViewAccessibility tableFooterView](self, "tableFooterView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBADC8], "options");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setShouldUseAllSubviews:", 1);
    objc_msgSend(v6, "setSorted:", 0);
    objc_msgSend(v5, "_accessibilityLeafDescendantsWithOptions:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    return v7;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBUITableViewAccessibility;
    -[SBUITableViewAccessibility _accessibilitySupplementaryFooterViews](&v9, sel__accessibilitySupplementaryFooterViews);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

@end

@implementation VOTQuickAccessSwitchTableCell

- (VOTQuickAccessTableCellAccessibility)cellAccessibility
{
  VOTQuickAccessTableCellAccessibility *cellAccessibility;
  VOTQuickAccessTableCellAccessibility *v4;
  VOTQuickAccessTableCellAccessibility *v5;

  cellAccessibility = self->_cellAccessibility;
  if (!cellAccessibility)
  {
    v4 = -[VOTQuickAccessTableCellAccessibility initWithWeakCell:]([VOTQuickAccessTableCellAccessibility alloc], "initWithWeakCell:", self);
    v5 = self->_cellAccessibility;
    self->_cellAccessibility = v4;

    cellAccessibility = self->_cellAccessibility;
  }
  return cellAccessibility;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  UIAccessibilityTraits v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VOTQuickAccessSwitchTableCell;
  v3 = -[VOTQuickAccessSwitchTableCell accessibilityTraits](&v8, "accessibilityTraits");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTQuickAccessSwitchTableCell cellAccessibility](self, "cellAccessibility"));
  v5 = (unint64_t)objc_msgSend(v4, "accessibilityTraits");
  v6 = (v5 | v3) & ~UIAccessibilityTraitAdjustable;

  return v6;
}

- (void)accessibilityDecrement
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[VOTQuickAccessSwitchTableCell cellAccessibility](self, "cellAccessibility"));
  objc_msgSend(v2, "accessibilityDecrement");

}

- (void)accessibilityIncrement
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[VOTQuickAccessSwitchTableCell cellAccessibility](self, "cellAccessibility"));
  objc_msgSend(v2, "accessibilityIncrement");

}

- (BOOL)_accessibilityShouldClearChildren
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTQuickAccessSwitchTableCell cellAccessibility](self, "cellAccessibility"));
  v3 = objc_msgSend(v2, "_accessibilityShouldClearChildren");

  return v3;
}

- (id)accessibilityCustomActions
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTQuickAccessSwitchTableCell cellAccessibility](self, "cellAccessibility"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "accessibilityCustomActions"));

  return v3;
}

- (void)setCellAccessibility:(id)a3
{
  objc_storeStrong((id *)&self->_cellAccessibility, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellAccessibility, 0);
}

@end

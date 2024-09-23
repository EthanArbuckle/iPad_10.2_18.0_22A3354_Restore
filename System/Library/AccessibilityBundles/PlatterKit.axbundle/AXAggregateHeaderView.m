@implementation AXAggregateHeaderView

- (AXAggregateHeaderView)initWithAccessibilityContainer:(id)a3 iconButtons:(id)a4 dateLabel:(id)a5 titleLabel:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  AXAggregateHeaderView *v15;
  AXAggregateHeaderView *v16;
  NSArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "axSafelyAddObjectsFromArray:", v11);
  objc_msgSend(v14, "axSafelyAddObject:", v13);
  objc_msgSend(v14, "axSafelyAddObject:", v12);
  v28.receiver = self;
  v28.super_class = (Class)AXAggregateHeaderView;
  v15 = -[UIAccessibilityAggregateElement initWithAccessibilityContainer:representedElements:](&v28, sel_initWithAccessibilityContainer_representedElements_, v10, v14);
  v16 = v15;
  if (v15)
  {
    v23 = v10;
    objc_storeStrong((id *)&v15->_iconButtons, a4);
    objc_storeStrong(&v16->_titleLabel, a6);
    objc_storeStrong(&v16->_dateLabel, a5);
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v17 = v16->_iconButtons;
    v18 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v25;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v25 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v21++), "accessibilitySetIdentification:", CFSTR("HeaderAppIcon"));
        }
        while (v19 != v21);
        v19 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v19);
    }

    v10 = v23;
  }

  return v16;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (CGPoint)accessibilityActivationPoint
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGPoint result;

  -[AXAggregateHeaderView iconButtons](self, "iconButtons");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityActivationPoint");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.y = v9;
  result.x = v8;
  return result;
}

- (BOOL)accessibilityActivate
{
  void *v3;
  unint64_t v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  AXAggregateHeaderView *v10;

  -[AXAggregateHeaderView iconButtons](self, "iconButtons");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 >= 2)
  {
    v10 = self;
    _AXAssert();
  }
  v5 = -[AXAggregateHeaderView _axIsHeaderViewActionable](self, "_axIsHeaderViewActionable", v10);
  if (v5)
  {
    objc_opt_class();
    -[AXAggregateHeaderView iconButtons](self, "iconButtons");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "sendActionsForControlEvents:", 64);
  }
  return v5;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;

  -[AXAggregateHeaderView titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXAggregateHeaderView dateLabel](self, "dateLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)accessibilityHint
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (-[AXAggregateHeaderView _axIsHeaderViewActionable](self, "_axIsHeaderViewActionable"))
  {
    v3 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("notification.icon.button.hint"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXAggregateHeaderView titleLabel](self, "titleLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accessibilityLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", v4, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (unint64_t)accessibilityTraits
{
  _BOOL4 v2;
  uint64_t v3;

  v2 = -[AXAggregateHeaderView _axIsHeaderViewActionable](self, "_axIsHeaderViewActionable");
  v3 = *MEMORY[0x24BDF73B0];
  if (!v2)
    v3 = 0;
  return v3 | *MEMORY[0x24BDF73C0];
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  -[AXAggregateHeaderView iconButtons](self, "iconButtons");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 < 2)
  {
    v9.receiver = self;
    v9.super_class = (Class)AXAggregateHeaderView;
    -[AXAggregateHeaderView _accessibilitySupplementaryFooterViews](&v9, sel__accessibilitySupplementaryFooterViews);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[AXAggregateHeaderView iconButtons](self, "iconButtons");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXAggregateHeaderView iconButtons](self, "iconButtons");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "subarrayWithRange:", 1, objc_msgSend(v6, "count") - 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    return v7;
  }
}

- (BOOL)_axIsHeaderViewActionable
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  -[AXAggregateHeaderView titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    -[AXAggregateHeaderView iconButtons](self, "iconButtons");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "_accessibilityViewIsVisible"))
    {
      -[AXAggregateHeaderView iconButtons](self, "iconButtons");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "allTargets");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count") != 0;

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSArray)iconButtons
{
  return self->_iconButtons;
}

- (id)dateLabel
{
  return self->_dateLabel;
}

- (id)titleLabel
{
  return self->_titleLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_titleLabel, 0);
  objc_storeStrong(&self->_dateLabel, 0);
  objc_storeStrong((id *)&self->_iconButtons, 0);
}

@end

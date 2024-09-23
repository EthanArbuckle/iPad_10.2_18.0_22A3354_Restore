@implementation CSSystemButtonQuickAction

- (id)actionIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[CSSystemQuickAction viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("CSSystemButtonQuickAction%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)accessibilityIdentifier
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  -[CSSystemQuickAction viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = v4;
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    -[CSSystemQuickAction controlIdentity](self, "controlIdentity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "kind");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("system-orb-button-%@"), v8);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (BOOL)isSelected
{
  void *v2;
  char v3;

  -[CSSystemButtonQuickAction _buttonViewModel](self, "_buttonViewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAnimating");

  return v3;
}

- (id)_buttonViewModel
{
  void *v2;
  void *v3;

  -[CSSystemQuickAction controlInstance](self, "controlInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end

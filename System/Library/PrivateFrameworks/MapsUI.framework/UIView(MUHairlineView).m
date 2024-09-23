@implementation UIView(MUHairlineView)

- (uint64_t)_mapsui_addHairlineAtTopWithMargin:()MUHairlineView
{
  return objc_msgSend(a1, "_mapsui_addHairlineAtTopWithLeadingMargin:trailingMargin:", a3, a3);
}

- (uint64_t)_mapsui_addHairlineAtTopWithLeadingMargin:()MUHairlineView trailingMargin:
{
  return objc_msgSend(a1, "_addHairlineAtBottom:leadingMargin:trailingMargin:", 0);
}

- (uint64_t)_mapsui_addHairlineAtBottomWithMargin:()MUHairlineView
{
  return objc_msgSend(a1, "_mapsui_addHairlineAtBottomWithLeadingMargin:trailingMargin:", a3, a3);
}

- (uint64_t)_mapsui_addHairlineAtBottomWithLeadingMargin:()MUHairlineView trailingMargin:
{
  return objc_msgSend(a1, "_addHairlineAtBottom:leadingMargin:trailingMargin:", 1);
}

- (MUHairlineView)_addHairlineAtBottom:()MUHairlineView leadingMargin:trailingMargin:
{
  MUHairlineView *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v9 = objc_alloc_init(MUHairlineView);
  -[MUHairlineView setTranslatesAutoresizingMaskIntoConstraints:](v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(a1, "addSubview:", v9);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3);
  -[MUHairlineView leadingAnchor](v9, "leadingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "leadingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:constant:", v12, a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUHairlineView setLeadingMarginConstraint:](v9, "setLeadingMarginConstraint:", v13);

  -[MUHairlineView leadingMarginConstraint](v9, "leadingMarginConstraint");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v14);

  objc_msgSend(a1, "trailingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUHairlineView trailingAnchor](v9, "trailingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:constant:", v16, a3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUHairlineView setTrailingMarginConstraint:](v9, "setTrailingMarginConstraint:", v17);

  -[MUHairlineView trailingMarginConstraint](v9, "trailingMarginConstraint");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v18);

  if (a5)
  {
    -[MUHairlineView bottomAnchor](v9, "bottomAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "bottomAnchor");
  }
  else
  {
    -[MUHairlineView topAnchor](v9, "topAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "topAnchor");
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v21);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v10);
  return v9;
}

@end

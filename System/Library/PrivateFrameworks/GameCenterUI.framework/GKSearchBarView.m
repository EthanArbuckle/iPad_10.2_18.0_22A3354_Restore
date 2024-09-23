@implementation GKSearchBarView

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

+ (void)initialize
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceIdiom:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithHorizontalSizeClass:", 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithHorizontalSizeClass:", 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0DC3E88];
  v23[0] = v2;
  v23[1] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "traitCollectionWithTraitsFromCollections:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0DC3E88];
  v22[0] = v2;
  v22[1] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "traitCollectionWithTraitsFromCollections:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "appearanceForTraitCollection:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C9AAA0];
  objc_msgSend(v9, "setUsePadConstraints:", MEMORY[0x1E0C9AAA0]);
  objc_msgSend((id)objc_opt_class(), "appearanceForTraitCollection:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setUsePadConstraints:", MEMORY[0x1E0C9AAB0]);
  v12 = (void *)objc_opt_class();
  v21 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "appearanceWhenContainedInInstancesOfClasses:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setUsePadConstraints:", v10);
  v15 = (void *)objc_opt_class();
  v20 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "appearanceWhenContainedInInstancesOfClasses:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setUsePadConstraints:", v10);
}

+ (double)defaultHeight
{
  return 45.0;
}

- (GKSearchBarView)initWithFrame:(CGRect)a3
{
  GKSearchBarView *v3;
  GKSearchBar *v4;
  GKSearchBar *searchBar;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  NSNumber *usePadConstraints;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)GKSearchBarView;
  v3 = -[GKSearchBarView initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(GKSearchBar);
    searchBar = v3->_searchBar;
    v3->_searchBar = v4;

    -[GKSearchBar setBackgroundColor:](v3->_searchBar, "setBackgroundColor:", 0);
    -[GKSearchBar setTranslatesAutoresizingMaskIntoConstraints:](v3->_searchBar, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[GKSearchBar setOpaque:](v3->_searchBar, "setOpaque:", 0);
    -[GKSearchBar setSearchBarStyle:](v3->_searchBar, "setSearchBarStyle:", 2);
    GKGameCenterUIFrameworkBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKSearchBar setPlaceholder:](v3->_searchBar, "setPlaceholder:", v7);

    -[GKSearchBarView addSubview:](v3, "addSubview:", v3->_searchBar);
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3->_searchBar, 3, 0, v3, 3, 1.0, 0.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKSearchBarView addConstraint:](v3, "addConstraint:", v8);

    v9 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "userInterfaceIdiom");

    v12 = 0;
    if (v11 == 1)
    {
      if (*MEMORY[0x1E0D253F8])
        v13 = *MEMORY[0x1E0D25B68] == 0;
      else
        v13 = 0;
      v12 = !v13;
    }
    objc_msgSend(v9, "numberWithBool:", v12);
    v14 = objc_claimAutoreleasedReturnValue();
    usePadConstraints = v3->_usePadConstraints;
    v3->_usePadConstraints = (NSNumber *)v14;

  }
  return v3;
}

- (void)updateConstraints
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKSearchBarView;
  -[GKSearchBarView updateConstraints](&v3, sel_updateConstraints);
  if (!self->_searchBarConstraints)
    -[GKSearchBarView establishSearchBarConstraints](self, "establishSearchBarConstraints");
}

- (void)establishSearchBarConstraints
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  id v14;

  if (self->_searchBarConstraints)
    -[GKSearchBarView removeConstraints:](self, "removeConstraints:");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[NSNumber BOOLValue](self->_usePadConstraints, "BOOLValue");
  v4 = (void *)MEMORY[0x1E0CB3718];
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_searchBar, 7, 0, 0, 0, 1.0, 540.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v5);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_searchBar, 9, 0, self, 9, 1.0, 0.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v6);

  }
  else
  {
    _NSDictionaryOfVariableBindings(CFSTR("_searchBar"), self->_searchBar, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|[_searchBar]|"), 0, 0, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObjectsFromArray:", v8);

    objc_msgSend(v14, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "lastObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionReusableView _gkSetLeadingGuideConstraint:trailingGuideConstraint:](self, "_gkSetLeadingGuideConstraint:trailingGuideConstraint:", v9, v10);

    -[GKSearchBarView leadingMargin](self, "leadingMargin");
    v12 = v11;
    -[GKSearchBarView trailingMargin](self, "trailingMargin");
    if (v12 >= v13)
      v13 = v12;
    objc_msgSend(MEMORY[0x1E0DC35B0], "_gkAdjustConstraintMargins:leading:trailing:", v14, v13, v13);
  }
  -[GKSearchBarView setSearchBarConstraints:](self, "setSearchBarConstraints:", v14);
  -[GKSearchBarView addConstraints:](self, "addConstraints:", self->_searchBarConstraints);

}

- (void)setUsePadConstraints:(id)a3
{
  NSNumber *v5;
  NSNumber *v6;

  v5 = (NSNumber *)a3;
  if (self->_usePadConstraints != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_usePadConstraints, a3);
    if (self->_searchBarConstraints)
    {
      -[GKSearchBarView removeConstraints:](self, "removeConstraints:");
      -[GKSearchBarView setSearchBarConstraints:](self, "setSearchBarConstraints:", 0);
    }
    -[GKSearchBarView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    v5 = v6;
  }

}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  BOOL v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)GKSearchBarView;
  -[GKSearchBarView applyLayoutAttributes:](&v26, sel_applyLayoutAttributes_, v4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKSearchBarView searchBar](self, "searchBar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDataSource:", v6);

    objc_msgSend(v5, "leadingMargin");
    v9 = v8;
    objc_msgSend(v5, "trailingMargin");
    v11 = v10;
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "userInterfaceIdiom");

    if (!v13)
    {
      if ((objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen"),
            v14 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v14, "bounds"),
            v16 = v15,
            v18 = v17,
            v14,
            v16 >= 414.0)
        && v18 >= 736.0
        || (v18 >= 414.0 ? (v19 = v16 < 736.0) : (v19 = 1), !v19))
      {
        v11 = v11 + -8.0;
        v9 = v9 + -8.0;
      }
    }
    -[GKSearchBarView setLeadingMargin:](self, "setLeadingMargin:", v9);
    -[GKSearchBarView setTrailingMargin:](self, "setTrailingMargin:", v11);
    -[GKSearchBarView searchBarConstraints](self, "searchBarConstraints");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      if (v9 < v11)
        v9 = v11;
      v21 = (void *)MEMORY[0x1E0DC35B0];
      -[GKSearchBarView searchBarConstraints](self, "searchBarConstraints");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "_gkAdjustConstraintMargins:leading:trailing:", v22, v9, v9);

    }
  }
  objc_msgSend(v4, "indexPath");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "section");
  -[GKSearchBarView searchBar](self, "searchBar");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setSectionIndex:", v24);

}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKSearchBarView;
  -[GKSearchBarView prepareForReuse](&v3, sel_prepareForReuse);
  -[GKSearchBarView setDelegate:](self, "setDelegate:", 0);
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    -[GKSearchBar setDelegate:](self->_searchBar, "setDelegate:", obj);
  }

}

- (GKSearchBar)searchBar
{
  return self->_searchBar;
}

- (void)setSearchBar:(id)a3
{
  objc_storeStrong((id *)&self->_searchBar, a3);
}

- (NSNumber)usePadConstraints
{
  return self->_usePadConstraints;
}

- (UISearchBarDelegate)delegate
{
  return (UISearchBarDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSArray)searchBarConstraints
{
  return self->_searchBarConstraints;
}

- (void)setSearchBarConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_searchBarConstraints, a3);
}

- (double)leadingMargin
{
  return self->_leadingMargin;
}

- (void)setLeadingMargin:(double)a3
{
  self->_leadingMargin = a3;
}

- (double)trailingMargin
{
  return self->_trailingMargin;
}

- (void)setTrailingMargin:(double)a3
{
  self->_trailingMargin = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchBarConstraints, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_usePadConstraints, 0);
  objc_storeStrong((id *)&self->_searchBar, 0);
}

@end

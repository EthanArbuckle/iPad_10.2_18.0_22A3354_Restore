@implementation HUSoftwareUpdateLockupView

- (HUSoftwareUpdateLockupView)initWithFrame:(CGRect)a3
{
  HUSoftwareUpdateLockupView *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)HUSoftwareUpdateLockupView;
  v3 = -[HULockupView initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEA700]);
    v5 = (void *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[HUSoftwareUpdateLockupView setTertiaryDetailLabel:](v3, "setTertiaryDetailLabel:", v5);

    -[HUSoftwareUpdateLockupView tertiaryDetailLabel](v3, "tertiaryDetailLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HUSoftwareUpdateLockupView tertiaryDetailLabel](v3, "tertiaryDetailLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNumberOfLines:", 2);

    -[HUSoftwareUpdateLockupView tertiaryDetailLabel](v3, "tertiaryDetailLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLineBreakMode:", 0);

    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB548]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSoftwareUpdateLockupView tertiaryDetailLabel](v3, "tertiaryDetailLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFont:", v9);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSoftwareUpdateLockupView tertiaryDetailLabel](v3, "tertiaryDetailLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTextColor:", v11);

    -[HULockupView stackView](v3, "stackView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSoftwareUpdateLockupView tertiaryDetailLabel](v3, "tertiaryDetailLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addArrangedSubview:", v14);

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (-[HUSoftwareUpdateLockupView isObservingPreferredContentSize](self, "isObservingPreferredContentSize"))
  {
    -[HUSoftwareUpdateLockupView gridViewController](self, "gridViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("preferredContentSize"), HUSoftwareUpdateLockupCellContext);

    -[HUSoftwareUpdateLockupView setIsObservingPreferredContentSize:](self, "setIsObservingPreferredContentSize:", 0);
  }
  -[HUSoftwareUpdateLockupView setGridViewController:](self, "setGridViewController:", 0);
  v4.receiver = self;
  v4.super_class = (Class)HUSoftwareUpdateLockupView;
  -[HUSoftwareUpdateLockupView dealloc](&v4, sel_dealloc);
}

- (id)getAssociatedViewForGridViewController:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  objc_opt_class();
  objc_getAssociatedObject(v3, (const void *)HUSoftwareUpdateLockupCellAssociatedViewKey);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

- (void)setAssociatedViewForGridViewController:(id)a3
{
  objc_setAssociatedObject(a3, (const void *)HUSoftwareUpdateLockupCellAssociatedViewKey, self, 0);
}

- (void)clearAssociatedViewForGridViewController:(id)a3
{
  objc_setAssociatedObject(a3, (const void *)HUSoftwareUpdateLockupCellAssociatedViewKey, 0, 0);
}

- (void)setGridViewController:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;

  v38 = a3;
  -[HUSoftwareUpdateLockupView gridViewController](self, "gridViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v38)
  {
    -[HUSoftwareUpdateLockupView gridViewController](self, "gridViewController");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      -[HUSoftwareUpdateLockupView gridViewController](self, "gridViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "superview");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HULockupView stackView](self, "stackView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10 == v11)
      {
        -[HUSoftwareUpdateLockupView gridViewController](self, "gridViewController");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "view");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "removeFromSuperview");

        -[HUSoftwareUpdateLockupView gridViewController](self, "gridViewController");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUSoftwareUpdateLockupView clearAssociatedViewForGridViewController:](self, "clearAssociatedViewForGridViewController:", v14);

      }
    }
    if (-[HUSoftwareUpdateLockupView isObservingPreferredContentSize](self, "isObservingPreferredContentSize"))
    {
      -[HUSoftwareUpdateLockupView gridViewController](self, "gridViewController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "removeObserver:forKeyPath:context:", self, CFSTR("preferredContentSize"), HUSoftwareUpdateLockupCellContext);

      -[HUSoftwareUpdateLockupView setIsObservingPreferredContentSize:](self, "setIsObservingPreferredContentSize:", 0);
    }
    objc_storeStrong((id *)&self->_gridViewController, a3);
    -[HUSoftwareUpdateLockupView gridViewController](self, "gridViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      -[HUSoftwareUpdateLockupView gridViewController](self, "gridViewController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUSoftwareUpdateLockupView getAssociatedViewForGridViewController:](self, "getAssociatedViewForGridViewController:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
      {
        objc_msgSend(0, "gridViewController");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUSoftwareUpdateLockupView gridViewController](self, "gridViewController");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19 == v20)
          objc_msgSend(0, "setGridViewController:", 0);
      }
      -[HUSoftwareUpdateLockupView gridViewController](self, "gridViewController");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUSoftwareUpdateLockupView setAssociatedViewForGridViewController:](self, "setAssociatedViewForGridViewController:", v21);

      -[HULockupView stackView](self, "stackView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUSoftwareUpdateLockupView gridViewController](self, "gridViewController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "view");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addArrangedSubview:", v24);

      -[HUSoftwareUpdateLockupView setIsObservingPreferredContentSize:](self, "setIsObservingPreferredContentSize:", 1);
      -[HUSoftwareUpdateLockupView gridViewController](self, "gridViewController");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addObserver:forKeyPath:options:context:", self, CFSTR("preferredContentSize"), 1, HUSoftwareUpdateLockupCellContext);

      -[HUSoftwareUpdateLockupView gridHeightConstraint](self, "gridHeightConstraint");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        -[HUSoftwareUpdateLockupView gridHeightConstraint](self, "gridHeightConstraint");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setActive:", 0);

      }
      -[HUSoftwareUpdateLockupView gridViewController](self, "gridViewController");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "view");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "heightAnchor");
      v30 = objc_claimAutoreleasedReturnValue();
      -[HUSoftwareUpdateLockupView gridViewController](self, "gridViewController");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "preferredContentSize");
      objc_msgSend((id)v30, "constraintEqualToConstant:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUSoftwareUpdateLockupView setGridHeightConstraint:](self, "setGridHeightConstraint:", v33);

      -[HUSoftwareUpdateLockupView gridHeightConstraint](self, "gridHeightConstraint");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setActive:", 1);

      -[HUSoftwareUpdateLockupView gridViewController](self, "gridViewController");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "view");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v30) = objc_msgSend(v36, "isHidden");

      if ((v30 & 1) == 0)
      {
        -[HULockupView internalViewResizingDelegate](self, "internalViewResizingDelegate");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "didUpdateRequiredHeightForLockupView:", self);

      }
    }
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  BOOL v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a5;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("preferredContentSize")))
    v9 = HUSoftwareUpdateLockupCellContext == (_QWORD)a6;
  else
    v9 = 0;
  if (v9)
  {
    -[HUSoftwareUpdateLockupView affectedAccessories](self, "affectedAccessories");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11)
    {
      objc_opt_class();
      objc_msgSend(v24, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (objc_opt_isKindOfClass() & 1) != 0 ? v12 : 0;
      v14 = v13;

      objc_msgSend(v14, "CGSizeValue");
      v16 = v15;

      -[HUSoftwareUpdateLockupView gridHeightConstraint](self, "gridHeightConstraint");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "constant");
      v19 = v18;

      if (v19 != v16)
      {
        -[HUSoftwareUpdateLockupView gridHeightConstraint](self, "gridHeightConstraint");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setConstant:", v16);

        -[HUSoftwareUpdateLockupView gridViewController](self, "gridViewController");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "view");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v22, "isHidden") & 1) == 0)
        {
          -[HULockupView internalViewResizingDelegate](self, "internalViewResizingDelegate");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "didUpdateRequiredHeightForLockupView:", self);

        }
      }
    }
  }

}

- (id)initializeIconViewWithSize:(unint64_t)a3
{
  id v4;

  v4 = objc_alloc_init(MEMORY[0x1E0D33720]);
  objc_msgSend(v4, "setContentMode:", 0);
  objc_msgSend(v4, "setIconSize:", a3);
  return v4;
}

- (void)updateIconView:(id)a3 animate:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a4;
  v9 = a3;
  -[HUSoftwareUpdateLockupView item](self, "item");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "latestResults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C60]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updateWithIconDescriptor:displayStyle:animated:", v8, 1, v4);

  objc_msgSend(v9, "sizeToFit");
}

- (void)updateDescriptionExpandableTextView:(id)a3 animate:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[HUSoftwareUpdateLockupView item](self, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "latestResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("releaseNotesAttributedString"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v9, "setAttributedText:", v7);
  }
  else
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("releaseNotesString"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", v8);

  }
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  void *v3;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  _BOOL8 v26;
  void *v27;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)HUSoftwareUpdateLockupView;
  -[HULockupView updateUIWithAnimation:](&v28, sel_updateUIWithAnimation_, a3);
  -[HUSoftwareUpdateLockupView item](self, "item");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "latestResults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D08]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSoftwareUpdateLockupView tertiaryDetailLabel](self, "tertiaryDetailLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v8);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("affectedAccessories"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSoftwareUpdateLockupView setAffectedAccessories:](self, "setAffectedAccessories:", v10);

  objc_opt_class();
  -[HUSoftwareUpdateLockupView gridViewController](self, "gridViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  if (v13)
  {
    -[HUSoftwareUpdateLockupView affectedAccessories](self, "affectedAccessories");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "na_flatMap:", &__block_literal_global_48);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "visibleAccessories");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v3, "isEqualToSet:", v15);

    if ((v16 & 1) == 0)
    {
      objc_msgSend(v13, "setVisibleAccessories:", v15);
      objc_msgSend(v13, "itemManager");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (id)objc_msgSend(v3, "reloadAndUpdateAllItemsFromSenderSelector:", a2);

    }
    objc_msgSend(v13, "collectionView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "layoutIfNeeded");

  }
  -[HULockupView descriptionExpandableTextView](self, "descriptionExpandableTextView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isExpanded");
  if (v20)
  {
    -[HUSoftwareUpdateLockupView affectedAccessories](self, "affectedAccessories");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v3, "count") == 0;
  }
  else
  {
    v21 = 1;
  }
  -[HUSoftwareUpdateLockupView gridViewController](self, "gridViewController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setHidden:", v21);

  if (v20)
  -[HULockupView descriptionExpandableTextView](self, "descriptionExpandableTextView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "isExpanded");
  if (v25)
  {
    -[HUSoftwareUpdateLockupView tertiaryDetailLabel](self, "tertiaryDetailLabel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "text");
    v21 = objc_claimAutoreleasedReturnValue();
    v26 = v21 == 0;
  }
  else
  {
    v26 = 1;
  }
  -[HUSoftwareUpdateLockupView tertiaryDetailLabel](self, "tertiaryDetailLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setHidden:", v26);

  if (v25)
  {

  }
}

uint64_t __52__HUSoftwareUpdateLockupView_updateUIWithAnimation___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_accessoryLikeObjects");
}

- (id)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->_item, a3);
}

- (HUItemCollectionViewController)gridViewController
{
  return self->_gridViewController;
}

- (UILabel)tertiaryDetailLabel
{
  return self->_tertiaryDetailLabel;
}

- (void)setTertiaryDetailLabel:(id)a3
{
  objc_storeStrong((id *)&self->_tertiaryDetailLabel, a3);
}

- (NSLayoutConstraint)gridHeightConstraint
{
  return self->_gridHeightConstraint;
}

- (void)setGridHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_gridHeightConstraint, a3);
}

- (NSSet)affectedAccessories
{
  return self->_affectedAccessories;
}

- (void)setAffectedAccessories:(id)a3
{
  objc_storeStrong((id *)&self->_affectedAccessories, a3);
}

- (BOOL)isObservingPreferredContentSize
{
  return self->_isObservingPreferredContentSize;
}

- (void)setIsObservingPreferredContentSize:(BOOL)a3
{
  self->_isObservingPreferredContentSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_affectedAccessories, 0);
  objc_storeStrong((id *)&self->_gridHeightConstraint, 0);
  objc_storeStrong((id *)&self->_tertiaryDetailLabel, 0);
  objc_storeStrong((id *)&self->_gridViewController, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

@end

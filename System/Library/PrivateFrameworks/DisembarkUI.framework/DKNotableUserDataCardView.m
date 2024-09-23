@implementation DKNotableUserDataCardView

- (DKNotableUserDataCardView)initWithTitle:(id)a3 subtitle:(id)a4 icon:(id)a5
{
  id v8;
  id v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  DKNotableUserDataCardView *v15;
  void *v16;
  NSMutableArray *v17;
  NSMutableArray *cells;
  uint64_t v19;
  UIStackView *stackView;
  void *v21;
  void *v22;
  uint64_t v23;
  NSLayoutConstraint *bottomStackViewConstraint;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  DKNotableUserDataCardPrimaryCell *v33;
  DKNotableUserDataCardPrimaryCell *primaryCell;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  UIStackView *secondaryStackView;
  void *v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  objc_super v46;
  void *v47;
  _QWORD v48[5];

  v48[4] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v46.receiver = self;
  v46.super_class = (Class)DKNotableUserDataCardView;
  v11 = *MEMORY[0x24BDBF090];
  v12 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v13 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v14 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v15 = -[DKNotableUserDataCardView initWithFrame:](&v46, sel_initWithFrame_, *MEMORY[0x24BDBF090], v12, v13, v14);
  if (v15)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "secondarySystemBackgroundColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[DKNotableUserDataCardView setBackgroundColor:](v15, "setBackgroundColor:", v16);

    -[DKNotableUserDataCardView _setContinuousCornerRadius:](v15, "_setContinuousCornerRadius:", 10.0);
    v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    cells = v15->_cells;
    v15->_cells = v17;

    v19 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6DD0]), "initWithFrame:", v11, v12, v13, v14);
    stackView = v15->_stackView;
    v15->_stackView = (UIStackView *)v19;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v15->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setAxis:](v15->_stackView, "setAxis:", 1);
    -[UIStackView setSpacing:](v15->_stackView, "setSpacing:", 16.0);
    -[DKNotableUserDataCardView addSubview:](v15, "addSubview:", v15->_stackView);
    -[DKNotableUserDataCardView bottomAnchor](v15, "bottomAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView bottomAnchor](v15->_stackView, "bottomAnchor");
    v45 = v8;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:constant:", v22, 0.0);
    v23 = objc_claimAutoreleasedReturnValue();
    bottomStackViewConstraint = v15->_bottomStackViewConstraint;
    v15->_bottomStackViewConstraint = (NSLayoutConstraint *)v23;

    -[UIStackView topAnchor](v15->_stackView, "topAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[DKNotableUserDataCardView topAnchor](v15, "topAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:", v41);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = v25;
    v48[1] = v15->_bottomStackViewConstraint;
    -[UIStackView leadingAnchor](v15->_stackView, "leadingAnchor");
    v44 = v9;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[DKNotableUserDataCardView leadingAnchor](v15, "leadingAnchor");
    v43 = v10;
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v48[2] = v28;
    -[DKNotableUserDataCardView trailingAnchor](v15, "trailingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView trailingAnchor](v15->_stackView, "trailingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v48[3] = v31;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v48, 4);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[DKNotableUserDataCardView addConstraints:](v15, "addConstraints:", v32);

    v10 = v43;
    v9 = v44;

    v8 = v45;
    v33 = -[DKNotableUserDataCardPrimaryCell initWithTitle:subtitle:icon:]([DKNotableUserDataCardPrimaryCell alloc], "initWithTitle:subtitle:icon:", v45, v44, v43);
    primaryCell = v15->_primaryCell;
    v15->_primaryCell = v33;

    -[DKNotableUserDataCardPrimaryCell setTranslatesAutoresizingMaskIntoConstraints:](v15->_primaryCell, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[DKNotableUserDataCardPrimaryCell setDirectionalLayoutMargins:](v15->_primaryCell, "setDirectionalLayoutMargins:", 0.0, 16.0, 0.0, 16.0);
    -[DKNotableUserDataCardPrimaryCell setHideChevron:](v15->_primaryCell, "setHideChevron:", 1);
    -[UIStackView addArrangedSubview:](v15->_stackView, "addArrangedSubview:", v15->_primaryCell);
    -[DKNotableUserDataCardPrimaryCell heightAnchor](v15->_primaryCell, "heightAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintGreaterThanOrEqualToConstant:", 60.0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v36;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v47, 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[DKNotableUserDataCardView addConstraints:](v15, "addConstraints:", v37);

    v38 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6DD0]), "initWithFrame:", v11, v12, v13, v14);
    secondaryStackView = v15->_secondaryStackView;
    v15->_secondaryStackView = (UIStackView *)v38;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v15->_secondaryStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setAxis:](v15->_secondaryStackView, "setAxis:", 1);
    -[UIStackView setSpacing:](v15->_secondaryStackView, "setSpacing:", 16.0);
    -[UIStackView setLayoutMarginsRelativeArrangement:](v15->_secondaryStackView, "setLayoutMarginsRelativeArrangement:", 1);
    -[DKNotableUserDataCardPrimaryCell directionalLayoutMargins](v15->_primaryCell, "directionalLayoutMargins");
    -[UIStackView setDirectionalLayoutMargins:](v15->_secondaryStackView, "setDirectionalLayoutMargins:");
  }

  return v15;
}

- (void)setExpanded:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v3 = a3;
  v36 = *MEMORY[0x24BDAC8D0];
  self->_expanded = a3;
  -[DKNotableUserDataCardView primaryCell](self, "primaryCell");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExpanded:", v3);

  -[DKNotableUserDataCardView bottomStackViewConstraint](self, "bottomStackViewConstraint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    objc_msgSend(v6, "setConstant:", 20.0);

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    -[DKNotableUserDataCardView cells](self, "cells");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v31;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v31 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v12);
          -[DKNotableUserDataCardView secondaryStackView](self, "secondaryStackView");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addArrangedSubview:", v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v10);
    }

    -[DKNotableUserDataCardView stackView](self, "stackView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[DKNotableUserDataCardView secondaryStackView](self, "secondaryStackView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addArrangedSubview:", v16);

  }
  else
  {
    objc_msgSend(v6, "setConstant:", 0.0);

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    -[DKNotableUserDataCardView cells](self, "cells", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v27;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v27 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v21);
          -[DKNotableUserDataCardView secondaryStackView](self, "secondaryStackView");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "removeArrangedSubview:", v22);

          objc_msgSend(v22, "removeFromSuperview");
          ++v21;
        }
        while (v19 != v21);
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      }
      while (v19);
    }

    -[DKNotableUserDataCardView stackView](self, "stackView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[DKNotableUserDataCardView secondaryStackView](self, "secondaryStackView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "removeArrangedSubview:", v25);

    -[DKNotableUserDataCardView secondaryStackView](self, "secondaryStackView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeFromSuperview");
  }

}

- (void)addCardCell:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v4 = a3;
  -[DKNotableUserDataCardView cells](self, "cells");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (!v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", self, sel__toggleExpanded);
    -[DKNotableUserDataCardPrimaryCell addGestureRecognizer:](self->_primaryCell, "addGestureRecognizer:", v7);

  }
  -[DKNotableUserDataCardPrimaryCell setHideChevron:](self->_primaryCell, "setHideChevron:", 0);
  -[DKNotableUserDataCardView cells](self, "cells");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v4);

}

- (void)_toggleExpanded
{
  -[DKNotableUserDataCardView setExpanded:](self, "setExpanded:", -[DKNotableUserDataCardView isExpanded](self, "isExpanded") ^ 1);
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (UIStackView)secondaryStackView
{
  return self->_secondaryStackView;
}

- (void)setSecondaryStackView:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryStackView, a3);
}

- (NSMutableArray)cells
{
  return self->_cells;
}

- (void)setCells:(id)a3
{
  objc_storeStrong((id *)&self->_cells, a3);
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (NSLayoutConstraint)bottomStackViewConstraint
{
  return self->_bottomStackViewConstraint;
}

- (void)setBottomStackViewConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_bottomStackViewConstraint, a3);
}

- (DKNotableUserDataCardPrimaryCell)primaryCell
{
  return self->_primaryCell;
}

- (void)setPrimaryCell:(id)a3
{
  objc_storeStrong((id *)&self->_primaryCell, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryCell, 0);
  objc_storeStrong((id *)&self->_bottomStackViewConstraint, 0);
  objc_storeStrong((id *)&self->_cells, 0);
  objc_storeStrong((id *)&self->_secondaryStackView, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
}

@end

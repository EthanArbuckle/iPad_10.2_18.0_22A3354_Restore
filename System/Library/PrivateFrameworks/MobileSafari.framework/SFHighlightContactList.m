@implementation SFHighlightContactList

- (SFHighlightContactList)initWithContacts:(id)a3
{
  id v4;
  SFHighlightContactList *v5;
  uint64_t v6;
  NSArray *contacts;
  UIStackView *v8;
  UIStackView *stackView;
  void *v10;
  UILabel *v11;
  UILabel *headerLabel;
  void *v13;
  void *v14;
  void *v15;
  SFHighlightContactListButton *v16;
  SFHighlightContactListButton *manageButton;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSLayoutConstraint *manageButtonTopConstraintForEmptyList;
  void *v23;
  void *v24;
  uint64_t v25;
  NSLayoutConstraint *manageButtonTopConstraintForNonEmptyList;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  SFHighlightContactList *v40;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  objc_super v67;
  uint64_t v68;
  _QWORD v69[12];

  v69[10] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v67.receiver = self;
  v67.super_class = (Class)SFHighlightContactList;
  v5 = -[SFHighlightContactList initWithFrame:](&v67, sel_initWithFrame_, 0.0, 0.0, 240.0, 1000.0);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    contacts = v5->_contacts;
    v5->_contacts = (NSArray *)v6;

    v8 = (UIStackView *)objc_alloc_init(MEMORY[0x1E0DC3CA8]);
    stackView = v5->_stackView;
    v5->_stackView = v8;

    -[UIStackView setAxis:](v5->_stackView, "setAxis:", 1);
    -[UIStackView setLayoutMarginsRelativeArrangement:](v5->_stackView, "setLayoutMarginsRelativeArrangement:", 1);
    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v5->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemGroupedBackgroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView setBackgroundColor:](v5->_stackView, "setBackgroundColor:", v10);

    -[UIStackView _setContinuousCornerRadius:](v5->_stackView, "_setContinuousCornerRadius:", 12.0);
    -[UIStackView sizeToFit](v5->_stackView, "sizeToFit");
    -[SFHighlightContactList addSubview:](v5, "addSubview:", v5->_stackView);
    v11 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    headerLabel = v5->_headerLabel;
    v5->_headerLabel = v11;

    v66 = v4;
    _WBSLocalizedString();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v5->_headerLabel, "setText:", v13);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_headerLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v5->_headerLabel, "setFont:", v14);

    -[UILabel setAdjustsFontForContentSizeCategory:](v5->_headerLabel, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v5->_headerLabel, "setTextColor:", v15);

    -[SFHighlightContactList addSubview:](v5, "addSubview:", v5->_headerLabel);
    v16 = objc_alloc_init(SFHighlightContactListButton);
    manageButton = v5->_manageButton;
    v5->_manageButton = v16;

    -[SFHighlightContactListButton _setContinuousCornerRadius:](v5->_manageButton, "_setContinuousCornerRadius:", 12.0);
    -[SFHighlightContactListButton setDirectionalLayoutMargins:](v5->_manageButton, "setDirectionalLayoutMargins:", 8.0, 16.0, 8.0, 16.0);
    _WBSLocalizedString();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFHighlightContactListButton setTitle:](v5->_manageButton, "setTitle:", v18);

    -[SFHighlightContactListButton setTranslatesAutoresizingMaskIntoConstraints:](v5->_manageButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SFHighlightContactListButton addTarget:action:forControlEvents:](v5->_manageButton, "addTarget:action:forControlEvents:", v5, sel__didTapManage_, 64);
    -[SFHighlightContactList addSubview:](v5, "addSubview:", v5->_manageButton);
    -[SFHighlightContactListButton topAnchor](v5->_manageButton, "topAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFHighlightContactList topAnchor](v5, "topAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v20);
    v21 = objc_claimAutoreleasedReturnValue();
    manageButtonTopConstraintForEmptyList = v5->_manageButtonTopConstraintForEmptyList;
    v5->_manageButtonTopConstraintForEmptyList = (NSLayoutConstraint *)v21;

    -[SFHighlightContactListButton topAnchor](v5->_manageButton, "topAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView bottomAnchor](v5->_stackView, "bottomAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v24, 2.0);
    v25 = objc_claimAutoreleasedReturnValue();
    manageButtonTopConstraintForNonEmptyList = v5->_manageButtonTopConstraintForNonEmptyList;
    v5->_manageButtonTopConstraintForNonEmptyList = (NSLayoutConstraint *)v25;

    -[SFHighlightContactList layoutMarginsGuide](v5, "layoutMarginsGuide");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFHighlightContactListButton layoutMarginsGuide](v5->_manageButton, "layoutMarginsGuide");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = (void *)MEMORY[0x1E0CB3718];
    -[UILabel topAnchor](v5->_headerLabel, "topAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFHighlightContactList topAnchor](v5, "topAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "constraintEqualToAnchor:", v63);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v69[0] = v62;
    v65 = v28;
    objc_msgSend(v28, "leadingAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel leadingAnchor](v5->_headerLabel, "leadingAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "constraintEqualToAnchor:constant:", v60, 8.0);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v69[1] = v59;
    -[UILabel trailingAnchor](v5->_headerLabel, "trailingAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "trailingAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "constraintEqualToAnchor:", v57);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v69[2] = v56;
    objc_msgSend(v27, "leadingAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView leadingAnchor](v5->_stackView, "leadingAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "constraintEqualToAnchor:constant:", v54, 8.0);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v69[3] = v53;
    -[UIStackView trailingAnchor](v5->_stackView, "trailingAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "trailingAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "constraintEqualToAnchor:constant:", v49, 8.0);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v69[4] = v48;
    -[UIStackView topAnchor](v5->_stackView, "topAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](v5->_headerLabel, "bottomAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:constant:", v46, 4.0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v69[5] = v45;
    objc_msgSend(v27, "leadingAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFHighlightContactListButton leadingAnchor](v5->_manageButton, "leadingAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToAnchor:constant:", v43, 8.0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v69[6] = v42;
    -[SFHighlightContactListButton trailingAnchor](v5->_manageButton, "trailingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v27;
    objc_msgSend(v27, "trailingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:constant:", v30, 8.0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v69[7] = v31;
    -[SFHighlightContactListButton heightAnchor](v5->_manageButton, "heightAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintGreaterThanOrEqualToConstant:", 44.0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v69[8] = v33;
    -[SFHighlightContactListButton bottomAnchor](v5->_manageButton, "bottomAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "bottomAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v69[9] = v36;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 10);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "activateConstraints:", v37);

    v4 = v66;
    -[SFHighlightContactList setDirectionalLayoutMargins:](v5, "setDirectionalLayoutMargins:", *MEMORY[0x1E0DC5AB8], 8.0, *MEMORY[0x1E0DC5AB8], 8.0);
    -[SFHighlightContactList _updateList](v5, "_updateList");
    v68 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v68, 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (id)-[SFHighlightContactList registerForTraitChanges:withTarget:action:](v5, "registerForTraitChanges:withTarget:action:", v38, v5, sel__setNeedsResizeAfterLayout);

    v40 = v5;
  }

  return v5;
}

- (void)setInfoViewControllerHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id infoViewControllerHandler;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = _Block_copy(v4);
  v6 = _Block_copy(self->_infoViewControllerHandler);
  v7 = WBSIsEqual();

  if ((v7 & 1) == 0)
  {
    v8 = (void *)objc_msgSend(v4, "copy");
    infoViewControllerHandler = self->_infoViewControllerHandler;
    self->_infoViewControllerHandler = v8;

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[UIStackView arrangedSubviews](self->_stackView, "arrangedSubviews", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v16;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v16 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14++), "setInfoViewControllerHandler:", v4);
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v12);
    }

  }
}

- (void)setContacts:(id)a3
{
  NSArray *v4;
  NSArray *contacts;
  id v6;

  v6 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    v4 = (NSArray *)objc_msgSend(v6, "copy");
    contacts = self->_contacts;
    self->_contacts = v4;

    -[SFHighlightContactList _updateList](self, "_updateList");
  }

}

- (void)_updateList
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  NSArray *contacts;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  _BOOL8 v21;
  _BOOL8 v22;
  const __CFString *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[5];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  -[UIStackView arrangedSubviews](self->_stackView, "arrangedSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v40 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * i), "removeFromSuperview");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v5);
  }

  contacts = self->_contacts;
  v9 = MEMORY[0x1E0C809B0];
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __37__SFHighlightContactList__updateList__block_invoke;
  v38[3] = &unk_1E21E6398;
  v38[4] = self;
  -[NSArray safari_mapObjectsUsingBlock:](contacts, "safari_mapObjectsUsingBlock:", v38);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97200], "comparatorForNameSortOrder:", 1);
  v36[0] = v9;
  v36[1] = 3221225472;
  v36[2] = __37__SFHighlightContactList__updateList__block_invoke_2;
  v36[3] = &unk_1E21E63C0;
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v37 = v11;
  objc_msgSend(v10, "sortedArrayUsingComparator:", v36);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFirstInList:", 1);

  objc_msgSend(v12, "lastObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setLastInList:", 1);

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v15 = v12;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v43, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v33;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v33 != v18)
          objc_enumerationMutation(v15);
        -[UIStackView addArrangedSubview:](self->_stackView, "addArrangedSubview:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * j), (_QWORD)v32);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v43, 16);
    }
    while (v17);
  }

  -[SFHighlightContactList layoutIfNeeded](self, "layoutIfNeeded");
  v20 = objc_msgSend(v15, "count");
  v21 = v20 != 0;
  v22 = v20 == 0;
  if (v20)
    v23 = CFSTR("person.crop.circle.badge.checkmark");
  else
    v23 = CFSTR("person.crop.circle.badge.plus");
  -[UILabel setHidden:](self->_headerLabel, "setHidden:", v22, (_QWORD)v32);
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFHighlightContactListButton setImage:](self->_manageButton, "setImage:", v24);

  -[NSLayoutConstraint setActive:](self->_manageButtonTopConstraintForEmptyList, "setActive:", v22);
  -[NSLayoutConstraint setActive:](self->_manageButtonTopConstraintForNonEmptyList, "setActive:", v21);
  -[SFHighlightContactList frame](self, "frame");
  v26 = v25;
  v28 = v27;
  v30 = v29;
  -[SFHighlightContactList systemLayoutSizeFittingSize:](self, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0DC4FF8], *(double *)(MEMORY[0x1E0DC4FF8] + 8));
  -[SFHighlightContactList setFrame:](self, "setFrame:", v26, v28, v30, v31);

}

SFHighlightContactListCell *__37__SFHighlightContactList__updateList__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  SFHighlightContactListCell *v4;

  v3 = a2;
  v4 = -[SFHighlightContactListCell initWithContact:]([SFHighlightContactListCell alloc], "initWithContact:", v3);

  -[SFHighlightContactListCell _setContinuousCornerRadius:](v4, "_setContinuousCornerRadius:", 12.0);
  -[SFHighlightContactListCell setDirectionalLayoutMargins:](v4, "setDirectionalLayoutMargins:", 8.0, 16.0, 8.0, 16.0);
  -[SFHighlightContactListCell setDelegate:](v4, "setDelegate:", *(_QWORD *)(a1 + 32));
  -[SFHighlightContactListCell setInfoViewControllerHandler:](v4, "setInfoViewControllerHandler:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 464));
  return v4;
}

uint64_t __37__SFHighlightContactList__updateList__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "contact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contact");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (*(uint64_t (**)(uint64_t, void *, void *))(v4 + 16))(v4, v6, v7);
  return v8;
}

- (void)_setNeedsResizeAfterLayout
{
  self->_needsResizeAfterLayout = 1;
  -[SFHighlightContactList setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  double x;
  double y;
  double width;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  void (**resizeHandler)(id, SFHighlightContactList *);
  objc_super v11;
  CGRect v12;

  v11.receiver = self;
  v11.super_class = (Class)SFHighlightContactList;
  -[SFHighlightContactList layoutSubviews](&v11, sel_layoutSubviews);
  if (self->_needsResizeAfterLayout)
  {
    self->_needsResizeAfterLayout = 0;
    -[SFHighlightContactList frame](self, "frame");
    x = v12.origin.x;
    y = v12.origin.y;
    width = v12.size.width;
    v6 = CGRectGetWidth(v12);
    LODWORD(v7) = 1148846080;
    LODWORD(v8) = 1112014848;
    -[SFHighlightContactList systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v6, 0.0, v7, v8);
    -[SFHighlightContactList setFrame:](self, "setFrame:", x, y, width, v9);
    resizeHandler = (void (**)(id, SFHighlightContactList *))self->_resizeHandler;
    if (resizeHandler)
      resizeHandler[2](resizeHandler, self);
  }
}

- (void)_didTapManage:(id)a3
{
  void (**manageHandler)(void);

  manageHandler = (void (**)(void))self->_manageHandler;
  if (manageHandler)
    manageHandler[2]();
}

- (void)cellDidReceiveTap:(id)a3
{
  void (**rowTapHandler)(id, id, uint64_t);
  id v5;
  NSArray *contacts;
  void *v7;
  id v8;

  rowTapHandler = (void (**)(id, id, uint64_t))self->_rowTapHandler;
  if (rowTapHandler)
  {
    v5 = a3;
    objc_msgSend(v5, "contact");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    contacts = self->_contacts;
    objc_msgSend(v5, "contact");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    rowTapHandler[2](rowTapHandler, v8, -[NSArray indexOfObject:](contacts, "indexOfObject:", v7));
  }
}

- (id)infoViewControllerHandler
{
  return self->_infoViewControllerHandler;
}

- (id)rowTapHandler
{
  return self->_rowTapHandler;
}

- (void)setRowTapHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 472);
}

- (id)manageHandler
{
  return self->_manageHandler;
}

- (void)setManageHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 480);
}

- (id)resizeHandler
{
  return self->_resizeHandler;
}

- (void)setResizeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 488);
}

- (NSArray)contacts
{
  return self->_contacts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contacts, 0);
  objc_storeStrong(&self->_resizeHandler, 0);
  objc_storeStrong(&self->_manageHandler, 0);
  objc_storeStrong(&self->_rowTapHandler, 0);
  objc_storeStrong(&self->_infoViewControllerHandler, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_manageButtonTopConstraintForNonEmptyList, 0);
  objc_storeStrong((id *)&self->_manageButtonTopConstraintForEmptyList, 0);
  objc_storeStrong((id *)&self->_manageButton, 0);
  objc_storeStrong((id *)&self->_headerLabel, 0);
}

@end

@implementation SFHighlightContactListCell

- (SFHighlightContactListCell)initWithContact:(id)a3
{
  SFHighlightContactListCell *v4;
  uint64_t v5;
  CNContact *contact;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
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
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  id v38;
  double Height;
  double v40;
  double Width;
  uint64_t v42;
  UIView *separator;
  void *v44;
  void *v45;
  SFHighlightContactListCell *v46;
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
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  void *v85;
  void *v86;
  _QWORD v87[4];
  id v88;
  id v89;
  id location;
  objc_super v91;
  _QWORD v92[13];
  _QWORD v93[3];
  CGRect v94;
  CGRect v95;

  v93[1] = *MEMORY[0x1E0C80C00];
  v84 = a3;
  v91.receiver = self;
  v91.super_class = (Class)SFHighlightContactListCell;
  v4 = -[SFHighlightContactListCell initWithFrame:](&v91, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v4)
  {
    objc_initWeak(&location, v4);
    v5 = objc_msgSend(v84, "copy");
    contact = v4->_contact;
    v4->_contact = (CNContact *)v5;

    objc_msgSend(MEMORY[0x1E0D8A0E8], "sharedContactStoreManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contactStore");
    v79 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C97480], "settingsWithContactStore:", v79);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97470]), "initWithSettings:", v78);
    if (v84)
    {
      v93[0] = v84;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v93, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "setContacts:", v8);

    }
    objc_msgSend(v80, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SFHighlightContactListCell addSubview:](v4, "addSubview:", v9);
    v85 = v9;
    v77 = objc_alloc_init(MEMORY[0x1E0C97218]);
    v10 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    v11 = *MEMORY[0x1E0DC4A88];
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFont:", v12);
    v86 = v10;

    objc_msgSend(v10, "setNumberOfLines:", 0);
    objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v10, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(v77, "stringFromContact:", v84);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setText:", v13);

    LODWORD(v14) = 1144586240;
    objc_msgSend(v10, "setContentCompressionResistancePriority:forAxis:", 0, v14);
    LODWORD(v15) = 1131413504;
    objc_msgSend(v10, "setContentHuggingPriority:forAxis:", 0, v15);
    -[SFHighlightContactListCell addSubview:](v4, "addSubview:", v10);
    objc_msgSend(MEMORY[0x1E0DC3520], "borderlessButtonConfiguration");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "setContentInsets:", *MEMORY[0x1E0DC3298], *(double *)(MEMORY[0x1E0DC3298] + 8), *(double *)(MEMORY[0x1E0DC3298] + 16), *(double *)(MEMORY[0x1E0DC3298] + 24));
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:scale:", v11, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "setPreferredSymbolConfigurationForImage:", v16);

    v17 = (void *)MEMORY[0x1E0DC3518];
    v18 = (void *)MEMORY[0x1E0DC3428];
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("info.circle"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v87[0] = MEMORY[0x1E0C809B0];
    v87[1] = 3221225472;
    v87[2] = __46__SFHighlightContactListCell_initWithContact___block_invoke;
    v87[3] = &unk_1E21E35E0;
    objc_copyWeak(&v89, &location);
    v88 = v84;
    objc_msgSend(v18, "actionWithTitle:image:identifier:handler:", &stru_1E21FE780, v19, 0, v87);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "buttonWithConfiguration:primaryAction:", v81, v20);
    v82 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v82, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SFHighlightContactListCell addSubview:](v4, "addSubview:", v82);
    -[SFHighlightContactListCell layoutMarginsGuide](v4, "layoutMarginsGuide");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v85, "leadingAnchor");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "leadingAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "constraintEqualToAnchor:", v75);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v92[0] = v74;
    objc_msgSend(v85, "widthAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "constraintEqualToConstant:", 22.0);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v92[1] = v72;
    objc_msgSend(v85, "centerYAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFHighlightContactListCell centerYAnchor](v4, "centerYAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "constraintEqualToAnchor:", v70);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v92[2] = v69;
    objc_msgSend(v85, "heightAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "constraintEqualToConstant:", 22.0);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v92[3] = v67;
    objc_msgSend(v85, "topAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "topAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "constraintGreaterThanOrEqualToAnchor:", v65);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v92[4] = v64;
    objc_msgSend(v86, "leadingAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "trailingAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v62, 1.0);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v92[5] = v61;
    objc_msgSend(v86, "centerYAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFHighlightContactListCell centerYAnchor](v4, "centerYAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "constraintEqualToAnchor:", v59);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v92[6] = v58;
    objc_msgSend(v86, "topAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "topAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "constraintGreaterThanOrEqualToAnchor:", v56);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v92[7] = v55;
    objc_msgSend(v82, "leadingAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "trailingAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v53, 2.0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v92[8] = v52;
    objc_msgSend(v82, "centerYAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFHighlightContactListCell centerYAnchor](v4, "centerYAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintEqualToAnchor:", v50);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v92[9] = v49;
    objc_msgSend(v82, "topAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "topAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintGreaterThanOrEqualToAnchor:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v92[10] = v23;
    objc_msgSend(v82, "trailingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "trailingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v92[11] = v26;
    -[SFHighlightContactListCell heightAnchor](v4, "heightAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintGreaterThanOrEqualToConstant:", 44.0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v92[12] = v28;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v92, 13);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "activateConstraints:", v29);

    -[SFHighlightContactListCell bounds](v4, "bounds");
    v31 = v30;
    v33 = v32;
    v35 = v34;
    v37 = v36;
    v38 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v94.origin.x = v31;
    v94.origin.y = v33;
    v94.size.width = v35;
    v94.size.height = v37;
    Height = CGRectGetHeight(v94);
    v40 = _SFOnePixel();
    v95.origin.x = v31;
    v95.origin.y = v33;
    v95.size.width = v35;
    v95.size.height = v37;
    Width = CGRectGetWidth(v95);
    v42 = objc_msgSend(v38, "initWithFrame:", 0.0, Height - v40, Width, _SFOnePixel());
    separator = v4->_separator;
    v4->_separator = (UIView *)v42;

    -[UIView setAutoresizingMask:](v4->_separator, "setAutoresizingMask:", 10);
    objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v4->_separator, "setBackgroundColor:", v44);

    -[SFHighlightContactListCell addSubview:](v4, "addSubview:", v4->_separator);
    -[SFHighlightContactListCell _updateMaskedCorners](v4, "_updateMaskedCorners");
    v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v4, sel__didReceiveTap_);
    -[SFHighlightContactListCell addGestureRecognizer:](v4, "addGestureRecognizer:", v45);

    v46 = v4;
    objc_destroyWeak(&v89);

    objc_destroyWeak(&location);
  }

  return v4;
}

void __46__SFHighlightContactListCell_initWithContact___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  _QWORD *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id location;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained && WeakRetained[62])
  {
    objc_msgSend(MEMORY[0x1E0C974D8], "viewControllerForContact:", *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v6);
    v7 = objc_alloc(MEMORY[0x1E0DC34F0]);
    v8 = (void *)MEMORY[0x1E0DC3428];
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __46__SFHighlightContactListCell_initWithContact___block_invoke_2;
    v17 = &unk_1E21E3138;
    objc_copyWeak(&v18, &location);
    objc_msgSend(v8, "actionWithHandler:", &v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v7, "initWithBarButtonSystemItem:primaryAction:", 0, v9, v14, v15, v16, v17);
    objc_msgSend(v6, "navigationItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setLeftBarButtonItem:", v10);

    v12 = v5[62];
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v6);
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v13);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);

  }
}

void __46__SFHighlightContactListCell_initWithContact___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)setHighlighted:(BOOL)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFHighlightContactListCell;
  -[SFHighlightContactListCell setHighlighted:](&v6, sel_setHighlighted_);
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGray4Color");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFHighlightContactListCell setBackgroundColor:](self, "setBackgroundColor:", v5);

  }
  else
  {
    -[SFHighlightContactListCell setBackgroundColor:](self, "setBackgroundColor:", 0);
  }
}

- (void)setFirstInList:(BOOL)a3
{
  if (self->_firstInList != a3)
  {
    self->_firstInList = a3;
    -[SFHighlightContactListCell _updateMaskedCorners](self, "_updateMaskedCorners");
  }
}

- (void)setLastInList:(BOOL)a3
{
  if (self->_lastInList != a3)
  {
    self->_lastInList = a3;
    -[UIView setHidden:](self->_separator, "setHidden:");
    -[SFHighlightContactListCell _updateMaskedCorners](self, "_updateMaskedCorners");
  }
}

- (void)_updateMaskedCorners
{
  uint64_t v2;
  uint64_t v3;
  id v4;

  v2 = 3;
  if (!self->_firstInList)
    v2 = 0;
  if (self->_lastInList)
    v3 = v2 | 0xC;
  else
    v3 = v2;
  -[SFHighlightContactListCell layer](self, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMaskedCorners:", v3);

}

- (void)_didReceiveTap:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "cellDidReceiveTap:", self);

}

- (CNContact)contact
{
  return self->_contact;
}

- (SFHighlightContactListCellDelegate)delegate
{
  return (SFHighlightContactListCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isFirstInList
{
  return self->_firstInList;
}

- (BOOL)isLastInList
{
  return self->_lastInList;
}

- (id)infoViewControllerHandler
{
  return self->_infoViewControllerHandler;
}

- (void)setInfoViewControllerHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 496);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_infoViewControllerHandler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_separator, 0);
}

@end

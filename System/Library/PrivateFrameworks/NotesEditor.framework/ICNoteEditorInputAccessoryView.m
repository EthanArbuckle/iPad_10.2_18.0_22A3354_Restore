@implementation ICNoteEditorInputAccessoryView

- (void)updateToolbarColorsWithForceUpdate:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v3 = a3;
  v21 = *MEMORY[0x1E0C80C00];
  -[ICNoteEditorInputAccessoryView disclosureView](self, "disclosureView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICNoteEditorInputAccessoryView toolbar](self, "toolbar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tintColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", v6);

  if (!v9 || v3)
  {
    objc_msgSend(v7, "setTintColor:", v6);
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(v7, "items", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v17;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v14++), "setTintColor:", v6);
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v12);
    }

    objc_msgSend(MEMORY[0x1E0DC3658], "ICNoteEditorToolbarColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBarTintColor:", v15);

  }
}

- (void)updateLayoutWithSize:(CGSize)a3
{
  BOOL v4;
  double v5;

  v4 = a3.width <= a3.height;
  v5 = 16.0;
  if (!v4)
    v5 = 15.0;
  *(float *)&v5 = v5;
  -[ICNoteEditorInputAccessoryView setDisclosureViewCloseTrailingOffset:](self, "setDisclosureViewCloseTrailingOffset:", v5);
  -[ICNoteEditorInputAccessoryView updateDisclosureViewTrailingConstraint](self, "updateDisclosureViewTrailingConstraint");
}

- (void)updateDisclosureViewTrailingConstraint
{
  double v3;
  float v4;
  double v5;
  double v6;
  void *v7;
  id v8;

  -[ICNoteEditorInputAccessoryView disclosureView](self, "disclosureView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v3 = 16.0;
  if (objc_msgSend(v8, "closeState"))
  {
    -[ICNoteEditorInputAccessoryView disclosureViewCloseTrailingOffset](self, "disclosureViewCloseTrailingOffset");
    v3 = v4;
  }
  -[ICNoteEditorInputAccessoryView ic_directionalSafeAreaInsets](self, "ic_directionalSafeAreaInsets");
  v6 = v3 + v5;
  -[ICNoteEditorInputAccessoryView disclosureViewTrailingConstraint](self, "disclosureViewTrailingConstraint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setConstant:", v6);

}

- (UIToolbar)toolbar
{
  return self->_toolbar;
}

- (NSLayoutConstraint)toolbarTopConstraint
{
  return self->_toolbarTopConstraint;
}

- (void)setToolbarTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_toolbarTopConstraint, a3);
}

- (void)setToolbar:(id)a3
{
  UIToolbar *v5;
  UIToolbar *toolbar;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  UIToolbar *v32;

  v5 = (UIToolbar *)a3;
  toolbar = self->_toolbar;
  if (toolbar != v5)
  {
    v32 = v5;
    -[UIToolbar removeFromSuperview](toolbar, "removeFromSuperview");
    objc_storeStrong((id *)&self->_toolbar, a3);
    v5 = v32;
    if (v32)
    {
      -[UIToolbar setTranslatesAutoresizingMaskIntoConstraints:](v32, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UIToolbar setClipsToBounds:](v32, "setClipsToBounds:", 1);
      -[ICNoteEditorInputAccessoryView updateToolbarColorsWithForceUpdate:](self, "updateToolbarColorsWithForceUpdate:", 1);
      -[ICNoteEditorInputAccessoryView containerView](self, "containerView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNoteEditorInputAccessoryView disclosureView](self, "disclosureView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "insertSubview:belowSubview:", v32, v8);

      -[ICNoteEditorInputAccessoryView containerView](self, "containerView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNoteEditorInputAccessoryView bottomMarginView](self, "bottomMarginView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "sendSubviewToBack:", v10);

      v11 = (void *)MEMORY[0x1E0CB3718];
      -[ICNoteEditorInputAccessoryView containerView](self, "containerView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 0.0;
      objc_msgSend(v11, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v12, 5, 0, v32, 5, 1.0, 0.0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNoteEditorInputAccessoryView addConstraint:](self, "addConstraint:", v14);

      v15 = (void *)MEMORY[0x1E0CB3718];
      -[ICNoteEditorInputAccessoryView containerView](self, "containerView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v32, 6, 0, v16, 6, 1.0, 0.0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNoteEditorInputAccessoryView addConstraint:](self, "addConstraint:", v17);

      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v32, 8, 0, 0, 0, 1.0, 44.0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNoteEditorInputAccessoryView addConstraint:](self, "addConstraint:", v18);

      v19 = (void *)MEMORY[0x1E0CB3718];
      -[ICNoteEditorInputAccessoryView containerView](self, "containerView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNoteEditorInputAccessoryView disclosureView](self, "disclosureView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v21, "closeState") & 1) == 0)
      {
        -[ICNoteEditorInputAccessoryView safeAreaInsets](self, "safeAreaInsets");
        v13 = v22 + 44.0;
      }
      objc_msgSend(v19, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v32, 3, 0, v20, 3, 1.0, v13);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNoteEditorInputAccessoryView setToolbarTopConstraint:](self, "setToolbarTopConstraint:", v23);

      -[ICNoteEditorInputAccessoryView toolbarTopConstraint](self, "toolbarTopConstraint");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNoteEditorInputAccessoryView addConstraint:](self, "addConstraint:", v24);

      -[ICNoteEditorInputAccessoryView disclosureView](self, "disclosureView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "closeState") ^ 1;
      -[ICNoteEditorInputAccessoryView toolbar](self, "toolbar");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setHidden:", v26);

      -[ICNoteEditorInputAccessoryView disclosureView](self, "disclosureView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "closeState") ^ 1;
      -[ICNoteEditorInputAccessoryView bottomMarginView](self, "bottomMarginView");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setHidden:", v29);

      -[ICNoteEditorInputAccessoryView disclosureView](self, "disclosureView");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setHidden:", 1);

      v5 = v32;
    }
  }

}

- (void)setHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_heightConstraint, a3);
}

- (void)setDisclosureViewTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_disclosureViewTrailingConstraint, a3);
}

- (void)setDisclosureViewCloseTrailingOffset:(float)a3
{
  self->_disclosureViewCloseTrailingOffset = a3;
}

- (void)setDisclosureViewBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_disclosureViewBottomConstraint, a3);
}

- (void)setDisclosureView:(id)a3
{
  objc_storeStrong((id *)&self->_disclosureView, a3);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (void)setBottomMarginViewTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_bottomMarginViewTopConstraint, a3);
}

- (void)setBottomMarginView:(id)a3
{
  objc_storeStrong((id *)&self->_bottomMarginView, a3);
}

- (void)setBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_bottomConstraint, a3);
}

- (ICNoteEditorInputAccessoryView)initWithFrame:(CGRect)a3
{
  ICNoteEditorInputAccessoryView *v3;
  ICNoteEditorInputAccessoryView *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  ICNoteEditorInputAccessoryContainerView *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  ICNoteEditorInputAccessoryContainerView *v14;
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
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
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
  ICNoteEditorToolbarDisclosureView *v56;
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
  uint64_t v73;
  void *v74;
  objc_super v76;

  v76.receiver = self;
  v76.super_class = (Class)ICNoteEditorInputAccessoryView;
  v3 = -[ICNoteEditorInputAccessoryView initWithFrame:](&v76, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[ICNoteEditorInputAccessoryView setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorInputAccessoryView heightAnchor](v4, "heightAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "constraintEqualToConstant:", 44.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorInputAccessoryView setHeightConstraint:](v4, "setHeightConstraint:", v7);

    -[ICNoteEditorInputAccessoryView heightConstraint](v4, "heightConstraint");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v8);

    v9 = [ICNoteEditorInputAccessoryContainerView alloc];
    v10 = *MEMORY[0x1E0C9D648];
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v13 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v14 = -[ICNoteEditorInputAccessoryContainerView initWithFrame:](v9, "initWithFrame:", *MEMORY[0x1E0C9D648], v11, v12, v13);
    -[ICNoteEditorInputAccessoryView setContainerView:](v4, "setContainerView:", v14);

    -[ICNoteEditorInputAccessoryView containerView](v4, "containerView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorInputAccessoryView addSubview:](v4, "addSubview:", v15);

    -[ICNoteEditorInputAccessoryView containerView](v4, "containerView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[ICNoteEditorInputAccessoryView containerView](v4, "containerView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "topAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorInputAccessoryView topAnchor](v4, "topAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v20);

    -[ICNoteEditorInputAccessoryView containerView](v4, "containerView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "leftAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorInputAccessoryView leftAnchor](v4, "leftAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v24);

    -[ICNoteEditorInputAccessoryView containerView](v4, "containerView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "rightAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorInputAccessoryView rightAnchor](v4, "rightAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v28);

    -[ICNoteEditorInputAccessoryView containerView](v4, "containerView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "bottomAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorInputAccessoryView bottomAnchor](v4, "bottomAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorInputAccessoryView setBottomConstraint:](v4, "setBottomConstraint:", v32);

    -[ICNoteEditorInputAccessoryView bottomConstraint](v4, "bottomConstraint");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v33);

    v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v10, v11, v12, v13);
    -[ICNoteEditorInputAccessoryView setBottomMarginView:](v4, "setBottomMarginView:", v34);

    objc_msgSend(MEMORY[0x1E0DC3658], "ICNoteEditorToolbarColor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorInputAccessoryView bottomMarginView](v4, "bottomMarginView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setBackgroundColor:", v35);

    -[ICNoteEditorInputAccessoryView bottomMarginView](v4, "bottomMarginView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorInputAccessoryView addSubview:](v4, "addSubview:", v37);

    -[ICNoteEditorInputAccessoryView bottomMarginView](v4, "bottomMarginView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[ICNoteEditorInputAccessoryView bottomMarginView](v4, "bottomMarginView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "topAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorInputAccessoryView topAnchor](v4, "topAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:constant:", v41, 44.0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorInputAccessoryView setBottomMarginViewTopConstraint:](v4, "setBottomMarginViewTopConstraint:", v42);

    -[ICNoteEditorInputAccessoryView bottomMarginViewTopConstraint](v4, "bottomMarginViewTopConstraint");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v43);

    -[ICNoteEditorInputAccessoryView bottomMarginView](v4, "bottomMarginView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "leftAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorInputAccessoryView leftAnchor](v4, "leftAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToAnchor:", v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v47);

    -[ICNoteEditorInputAccessoryView bottomMarginView](v4, "bottomMarginView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "rightAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorInputAccessoryView rightAnchor](v4, "rightAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToAnchor:", v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v51);

    -[ICNoteEditorInputAccessoryView bottomMarginView](v4, "bottomMarginView");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "bottomAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorInputAccessoryView bottomAnchor](v4, "bottomAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintEqualToAnchor:", v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v55);

    v56 = -[ICNoteEditorToolbarDisclosureView initWithFrame:]([ICNoteEditorToolbarDisclosureView alloc], "initWithFrame:", 0.0, 0.0, 44.0, 44.0);
    -[ICNoteEditorInputAccessoryView setDisclosureView:](v4, "setDisclosureView:", v56);

    -[ICNoteEditorInputAccessoryView disclosureView](v4, "disclosureView");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[ICNoteEditorInputAccessoryView containerView](v4, "containerView");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorInputAccessoryView disclosureView](v4, "disclosureView");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "addSubview:", v59);

    v60 = (void *)MEMORY[0x1E0CB3718];
    -[ICNoteEditorInputAccessoryView containerView](v4, "containerView");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorInputAccessoryView disclosureView](v4, "disclosureView");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v61, 4, 0, v62, 4, 1.0, 16.0);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorInputAccessoryView setDisclosureViewBottomConstraint:](v4, "setDisclosureViewBottomConstraint:", v63);

    -[ICNoteEditorInputAccessoryView disclosureViewBottomConstraint](v4, "disclosureViewBottomConstraint");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v64);

    v65 = (void *)MEMORY[0x1E0CB3718];
    -[ICNoteEditorInputAccessoryView containerView](v4, "containerView");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorInputAccessoryView disclosureView](v4, "disclosureView");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v66, 6, 0, v67, 6, 1.0, 16.0);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorInputAccessoryView setDisclosureViewTrailingConstraint:](v4, "setDisclosureViewTrailingConstraint:", v68);

    -[ICNoteEditorInputAccessoryView disclosureViewTrailingConstraint](v4, "disclosureViewTrailingConstraint");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v69);

    -[ICNoteEditorInputAccessoryView disclosureView](v4, "disclosureView");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v4, sel_disclosureTapRecognizer_);
    objc_msgSend(v70, "addGestureRecognizer:", v71);

    -[ICNoteEditorInputAccessoryView disclosureView](v4, "disclosureView");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = objc_msgSend(v72, "closeState");

    -[ICNoteEditorInputAccessoryView setClipsToBounds:](v4, "setClipsToBounds:", v73);
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v5);
    -[ICNoteEditorInputAccessoryView disclosureView](v4, "disclosureView");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "setHidden:", 1);

  }
  return v4;
}

- (NSLayoutConstraint)heightConstraint
{
  return self->_heightConstraint;
}

- (ICNoteEditorToolbarDisclosureView)disclosureView
{
  return self->_disclosureView;
}

- (NSLayoutConstraint)disclosureViewTrailingConstraint
{
  return self->_disclosureViewTrailingConstraint;
}

- (NSLayoutConstraint)disclosureViewBottomConstraint
{
  return self->_disclosureViewBottomConstraint;
}

- (UIView)containerView
{
  return self->_containerView;
}

- (UIView)bottomMarginView
{
  return self->_bottomMarginView;
}

- (NSLayoutConstraint)bottomMarginViewTopConstraint
{
  return self->_bottomMarginViewTopConstraint;
}

- (NSLayoutConstraint)bottomConstraint
{
  return self->_bottomConstraint;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  ICNoteEditorInputAccessoryView *v5;
  ICNoteEditorInputAccessoryView *v6;
  ICNoteEditorInputAccessoryView *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ICNoteEditorInputAccessoryView;
  -[ICNoteEditorInputAccessoryView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (ICNoteEditorInputAccessoryView *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self)
    v5 = 0;
  v7 = v5;

  return v7;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  double v4;
  CGSize result;

  -[ICNoteEditorInputAccessoryView safeAreaInsets](self, "safeAreaInsets");
  v3 = v2 + 44.0;
  v4 = -1.0;
  result.height = v3;
  result.width = v4;
  return result;
}

- (void)safeAreaInsetsDidChange
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  id v13;

  -[ICNoteEditorInputAccessoryView safeAreaInsets](self, "safeAreaInsets");
  v4 = v3;
  if (objc_msgSend(MEMORY[0x1E0DC3938], "shouldMinimizeForHardwareKeyboard"))
    v5 = v4;
  else
    v5 = 0.0;
  v6 = v5 + 44.0;
  -[ICNoteEditorInputAccessoryView heightConstraint](self, "heightConstraint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setConstant:", v5 + 44.0);

  -[ICNoteEditorInputAccessoryView bottomConstraint](self, "bottomConstraint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setConstant:", -v5);

  -[ICNoteEditorInputAccessoryView updateDisclosureViewTrailingConstraint](self, "updateDisclosureViewTrailingConstraint");
  -[ICNoteEditorInputAccessoryView disclosureView](self, "disclosureView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "closeState"))
    v10 = 0.0;
  else
    v10 = v5 + 44.0;
  -[ICNoteEditorInputAccessoryView toolbarTopConstraint](self, "toolbarTopConstraint");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setConstant:", v10);

  -[ICNoteEditorInputAccessoryView disclosureView](self, "disclosureView");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "closeState"))
    v6 = 44.0;
  -[ICNoteEditorInputAccessoryView bottomMarginViewTopConstraint](self, "bottomMarginViewTopConstraint");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setConstant:", v6);

}

- (void)showWithDelay:(double)a3
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  CGAffineTransform v13;
  CGAffineTransform v14;

  -[ICNoteEditorInputAccessoryView disclosureView](self, "disclosureView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "closeState");

  if ((v6 & 1) != 0)
  {
    -[ICNoteEditorInputAccessoryView disclosureView](self, "disclosureView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidden:", 0);

    -[ICNoteEditorInputAccessoryView toolbar](self, "toolbar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHidden:", 0);

    -[ICNoteEditorInputAccessoryView bottomMarginView](self, "bottomMarginView");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setHidden:", 0);

  }
  else
  {
    CGAffineTransformMakeScale(&v14, 0.0, 0.0);
    -[ICNoteEditorInputAccessoryView disclosureView](self, "disclosureView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v14;
    objc_msgSend(v9, "setTransform:", &v13);

    -[ICNoteEditorInputAccessoryView disclosureView](self, "disclosureView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setHidden:", 0);

    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __48__ICNoteEditorInputAccessoryView_showWithDelay___block_invoke;
    v12[3] = &unk_1EA7DD2D8;
    v12[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 0, v12, 0, 0.13, a3);
  }
}

void __48__ICNoteEditorInputAccessoryView_showWithDelay___block_invoke(uint64_t a1)
{
  void *v2;
  CGAffineTransform v3;
  CGAffineTransform v4;

  CGAffineTransformMakeScale(&v4, 1.0, 1.0);
  objc_msgSend(*(id *)(a1 + 32), "disclosureView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v4;
  objc_msgSend(v2, "setTransform:", &v3);

}

- (void)hide
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  id v15;

  -[ICNoteEditorInputAccessoryView disclosureView](self, "disclosureView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "closeState");

  -[ICNoteEditorInputAccessoryView disclosureView](self, "disclosureView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", 1);

  if ((v4 & 1) != 0)
  {
    -[ICNoteEditorInputAccessoryView toolbar](self, "toolbar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHidden:", 1);
  }
  else
  {
    -[ICNoteEditorInputAccessoryView disclosureView](self, "disclosureView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCloseState:", 0);

    -[ICNoteEditorInputAccessoryView safeAreaInsets](self, "safeAreaInsets");
    v9 = v8 + 44.0;
    -[ICNoteEditorInputAccessoryView toolbarTopConstraint](self, "toolbarTopConstraint");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setConstant:", v9);

    -[ICNoteEditorInputAccessoryView toolbar](self, "toolbar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setHidden:", 1);

    -[ICNoteEditorInputAccessoryView toolbar](self, "toolbar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "layoutIfNeeded");

    -[ICNoteEditorInputAccessoryView safeAreaInsets](self, "safeAreaInsets");
    v14 = v13 + 44.0;
    -[ICNoteEditorInputAccessoryView bottomMarginViewTopConstraint](self, "bottomMarginViewTopConstraint");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setConstant:", v14);
  }

  -[ICNoteEditorInputAccessoryView bottomMarginView](self, "bottomMarginView");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setHidden:", 1);

}

- (void)setButtonsVisible:(BOOL)a3
{
  int v3;
  void *v5;
  int v6;

  v3 = a3;
  -[ICNoteEditorInputAccessoryView disclosureView](self, "disclosureView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "closeState");

  if (v6 != v3)
    -[ICNoteEditorInputAccessoryView toggleDisclosureViewCloseStateWithTap:](self, "toggleDisclosureViewCloseStateWithTap:", 0);
}

- (BOOL)buttonsVisible
{
  void *v2;
  char v3;

  -[ICNoteEditorInputAccessoryView disclosureView](self, "disclosureView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "closeState");

  return v3;
}

- (void)hideDisclosureViewForTransition:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  _QWORD v6[6];

  v3 = a3;
  if (!-[ICNoteEditorInputAccessoryView buttonsVisible](self, "buttonsVisible"))
  {
    v5 = 1.0;
    if (v3)
      v5 = 0.0;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __66__ICNoteEditorInputAccessoryView_hideDisclosureViewForTransition___block_invoke;
    v6[3] = &unk_1EA7DE8A8;
    v6[4] = self;
    *(double *)&v6[5] = v5;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v6, 0.2);
  }
}

void __66__ICNoteEditorInputAccessoryView_hideDisclosureViewForTransition___block_invoke(uint64_t a1)
{
  double v1;
  id v2;

  v1 = *(double *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "disclosureView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", v1);

}

- (void)toggleDisclosureViewCloseStateWithTap:(BOOL)a3
{
  _BOOL8 v3;
  ICNoteEditorInputAccessoryViewDelegate **p_delegate;
  id WeakRetained;
  char v7;
  id v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  uint64_t v23;
  void *v24;
  id v25;
  char v26;
  id v27;
  _QWORD v28[5];
  _QWORD v29[5];
  _QWORD v30[6];

  v3 = a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v8, "inputAccessoryDisclosureStateWillChange:", self);

  }
  -[ICNoteEditorInputAccessoryView safeAreaInsets](self, "safeAreaInsets");
  v10 = v9 + 44.0;
  -[ICNoteEditorInputAccessoryView disclosureView](self, "disclosureView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "closeState") ^ 1;
  -[ICNoteEditorInputAccessoryView disclosureView](self, "disclosureView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCloseState:", v12);

  -[ICNoteEditorInputAccessoryView disclosureView](self, "disclosureView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v12) = objc_msgSend(v14, "closeState");

  v15 = MEMORY[0x1E0C809B0];
  if ((_DWORD)v12)
  {
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __72__ICNoteEditorInputAccessoryView_toggleDisclosureViewCloseStateWithTap___block_invoke;
    v30[3] = &unk_1EA7DE8A8;
    v30[4] = self;
    *(double *)&v30[5] = v10;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v30);
    -[ICNoteEditorInputAccessoryView toolbarTopConstraint](self, "toolbarTopConstraint");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setConstant:", 0.0);

    -[ICNoteEditorInputAccessoryView bottomMarginViewTopConstraint](self, "bottomMarginViewTopConstraint");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    v19 = 44.0;
  }
  else
  {
    -[ICNoteEditorInputAccessoryView toolbarTopConstraint](self, "toolbarTopConstraint");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setConstant:", v10);

    -[ICNoteEditorInputAccessoryView bottomMarginViewTopConstraint](self, "bottomMarginViewTopConstraint");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    v19 = v10;
  }
  objc_msgSend(v17, "setConstant:", v19);

  -[ICNoteEditorInputAccessoryView disclosureView](self, "disclosureView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v21, "closeState"))
    v22 = 0.5;
  else
    v22 = 16.0;
  -[ICNoteEditorInputAccessoryView disclosureViewBottomConstraint](self, "disclosureViewBottomConstraint");
  v23 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v23, "setConstant:", v22);

  -[ICNoteEditorInputAccessoryView updateDisclosureViewTrailingConstraint](self, "updateDisclosureViewTrailingConstraint");
  -[ICNoteEditorInputAccessoryView disclosureView](self, "disclosureView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v23) = objc_msgSend(v24, "closeState");

  if ((v23 & 1) == 0)
    -[ICNoteEditorInputAccessoryView setClipsToBounds:](self, "setClipsToBounds:", 0);
  v28[4] = self;
  v29[0] = v15;
  v29[1] = 3221225472;
  v29[2] = __72__ICNoteEditorInputAccessoryView_toggleDisclosureViewCloseStateWithTap___block_invoke_2;
  v29[3] = &unk_1EA7DD2D8;
  v29[4] = self;
  v28[0] = v15;
  v28[1] = 3221225472;
  v28[2] = __72__ICNoteEditorInputAccessoryView_toggleDisclosureViewCloseStateWithTap___block_invoke_3;
  v28[3] = &unk_1EA7DE700;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v29, v28, 0.25);
  v25 = objc_loadWeakRetained((id *)p_delegate);
  v26 = objc_opt_respondsToSelector();

  if ((v26 & 1) != 0)
  {
    v27 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v27, "inputAccessoryDisclosureStateDidChange:tapped:", self, v3);

  }
}

uint64_t __72__ICNoteEditorInputAccessoryView_toggleDisclosureViewCloseStateWithTap___block_invoke(uint64_t a1)
{
  double v2;
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;

  v2 = *(double *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "toolbarTopConstraint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setConstant:", v2);

  objc_msgSend(*(id *)(a1 + 32), "toolbar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 0);

  v5 = *(double *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "bottomMarginViewTopConstraint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setConstant:", v5);

  objc_msgSend(*(id *)(a1 + 32), "bottomMarginView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", 0);

  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __72__ICNoteEditorInputAccessoryView_toggleDisclosureViewCloseStateWithTap___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

void __72__ICNoteEditorInputAccessoryView_toggleDisclosureViewCloseStateWithTap___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  objc_msgSend(*(id *)(a1 + 32), "disclosureView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "closeState") ^ 1;
  objc_msgSend(*(id *)(a1 + 32), "toolbar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

  objc_msgSend(*(id *)(a1 + 32), "disclosureView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "closeState") ^ 1;
  objc_msgSend(*(id *)(a1 + 32), "bottomMarginView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", v6);

  objc_msgSend(*(id *)(a1 + 32), "disclosureView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v8, "closeState");

  if ((_DWORD)v6)
    objc_msgSend(*(id *)(a1 + 32), "setClipsToBounds:", 1);
}

- (void)disclosureTapRecognizer:(id)a3
{
  UIAccessibilityNotifications v4;
  id v5;

  -[ICNoteEditorInputAccessoryView toggleDisclosureViewCloseStateWithTap:](self, "toggleDisclosureViewCloseStateWithTap:", 1);
  v4 = *MEMORY[0x1E0DC4578];
  -[ICNoteEditorInputAccessoryView disclosureView](self, "disclosureView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v4, v5);

}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorInputAccessoryView disclosureView](self, "disclosureView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "closeState");

  if (v5)
  {
    -[ICNoteEditorInputAccessoryView toolbar](self, "toolbar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_accessibleSubviews");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v7);

  }
  -[ICNoteEditorInputAccessoryView disclosureView](self, "disclosureView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v8);

  v9 = (void *)objc_msgSend(v3, "copy");
  return v9;
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICNoteEditorInputAccessoryView;
  -[ICNoteEditorInputAccessoryView _dynamicUserInterfaceTraitDidChange](&v3, sel__dynamicUserInterfaceTraitDidChange);
  -[ICNoteEditorInputAccessoryView updateToolbarColorsWithForceUpdate:](self, "updateToolbarColorsWithForceUpdate:", 1);
}

- (ICNoteEditorInputAccessoryViewDelegate)delegate
{
  return (ICNoteEditorInputAccessoryViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (float)disclosureViewCloseTrailingOffset
{
  return self->_disclosureViewCloseTrailingOffset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomMarginViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_bottomMarginView, 0);
  objc_storeStrong((id *)&self->_toolbarTopConstraint, 0);
  objc_storeStrong((id *)&self->_disclosureViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_disclosureViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_disclosureView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_bottomConstraint, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_toolbar, 0);
}

@end

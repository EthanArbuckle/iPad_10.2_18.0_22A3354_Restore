@implementation HUTriggerListSubheadlineCell

- (HUTriggerListSubheadlineCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HUTriggerListSubheadlineCell *v4;
  HUTriggerListSubheadlineCell *v5;
  void *v6;
  id v7;
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
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)HUTriggerListSubheadlineCell;
  v4 = -[HUTriggerListSubheadlineCell initWithStyle:reuseIdentifier:](&v22, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[HUTriggerListSubheadlineCell setSelectionStyle:](v4, "setSelectionStyle:", 0);
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTriggerListSubheadlineCell setBackgroundColor:](v5, "setBackgroundColor:", v6);

    v7 = objc_alloc(MEMORY[0x1E0CEAB18]);
    v8 = (void *)objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[HUTriggerListSubheadlineCell setDescriptionView:](v5, "setDescriptionView:", v8);

    -[HUTriggerListSubheadlineCell descriptionView](v5, "descriptionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HUTriggerListSubheadlineCell descriptionView](v5, "descriptionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDelegate:", v5);

    -[HUTriggerListSubheadlineCell descriptionView](v5, "descriptionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setEditable:", 0);

    -[HUTriggerListSubheadlineCell descriptionView](v5, "descriptionView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_setInteractiveTextSelectionDisabled:", 1);

    -[HUTriggerListSubheadlineCell descriptionView](v5, "descriptionView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setScrollEnabled:", 0);

    -[HUTriggerListSubheadlineCell descriptionView](v5, "descriptionView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "textContainer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setLineFragmentPadding:", 0.0);

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTriggerListSubheadlineCell descriptionView](v5, "descriptionView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setBackgroundColor:", v16);

    -[HUTriggerListSubheadlineCell descriptionView](v5, "descriptionView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setClipsToBounds:", 0);

    -[HUTriggerListSubheadlineCell contentView](v5, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTriggerListSubheadlineCell descriptionView](v5, "descriptionView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addSubview:", v20);

    v5->_respectLayoutMargins = 1;
    -[HUTriggerListSubheadlineCell setNeedsUpdateConstraints](v5, "setNeedsUpdateConstraints");
  }
  return v5;
}

- (void)setLayoutOptions:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqual:", self->_layoutOptions) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_layoutOptions, a3);
    -[HUTriggerListSubheadlineCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }

}

- (void)prepareForReuse
{
  objc_super v3;

  -[HUTriggerListSubheadlineCell setRespectLayoutMargins:](self, "setRespectLayoutMargins:", 1);
  v3.receiver = self;
  v3.super_class = (Class)HUTriggerListSubheadlineCell;
  -[HUTriggerListSubheadlineCell prepareForReuse](&v3, sel_prepareForReuse);
}

- (void)setRespectLayoutMargins:(BOOL)a3
{
  if (self->_respectLayoutMargins != a3)
  {
    self->_respectLayoutMargins = a3;
    -[HUTriggerListSubheadlineCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[HUTriggerListSubheadlineCell item](self, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "latestResults");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[HUTriggerListSubheadlineCell updateUIWithResults:animation:](self, "updateUIWithResults:animation:", v6, v3);
}

- (void)updateUIWithResults:(id)a3 animation:(BOOL)a4
{
  id v5;

  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BF8], a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HUTriggerListSubheadlineCell updateUIWithDescription:](self, "updateUIWithDescription:", v5);

}

- (void)updateUIWithDescription:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[HUTriggerListSubheadlineCell descriptionView](self, "descriptionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v11 == 0);

  if (v11)
  {
    -[HUTriggerListSubheadlineCell _descriptionTextAttributes](self, "_descriptionTextAttributes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "prefersDynamicString"))
    {
      -[HUTriggerListSubheadlineCell descriptionView](self, "descriptionView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "bounds");
      objc_msgSend(v11, "dynamicStringForSize:attributes:", v5, v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v11, "stringWithAttributes:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[HUTriggerListSubheadlineCell descriptionView](self, "descriptionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAttributedText:", v9);

  }
  -[HUTriggerListSubheadlineCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");

}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
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
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  objc_super v38;
  _QWORD v39[2];
  _QWORD v40[3];

  v40[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerListSubheadlineCell layoutOptions](self, "layoutOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "viewSizeSubclass");

  v39[0] = &unk_1E70412C0;
  v39[1] = &unk_1E70412D8;
  v40[0] = &unk_1E70435D8;
  v40[1] = &unk_1E70435E8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 2);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = HUConstantFloatForViewSizeSubclass(v5, (void *)v6);

  LOBYTE(v6) = -[HUTriggerListSubheadlineCell respectLayoutMargins](self, "respectLayoutMargins");
  -[HUTriggerListSubheadlineCell contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if ((v6 & 1) != 0)
  {
    objc_msgSend(v8, "layoutMarginsGuide");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "leadingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v8, "leadingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v12 = -[HUTriggerListSubheadlineCell respectLayoutMargins](self, "respectLayoutMargins");
  -[HUTriggerListSubheadlineCell contentView](self, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12)
  {
    objc_msgSend(v13, "layoutMarginsGuide");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "trailingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v13, "trailingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  -[HUTriggerListSubheadlineCell descriptionView](self, "descriptionView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "topAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerListSubheadlineCell contentView](self, "contentView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "topAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v21);

  -[HUTriggerListSubheadlineCell descriptionView](self, "descriptionView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "leadingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v11);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v24);

  -[HUTriggerListSubheadlineCell descriptionView](self, "descriptionView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "trailingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v16);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v27);

  -[HUTriggerListSubheadlineCell descriptionView](self, "descriptionView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "lastBaselineAnchor");
  v29 = objc_claimAutoreleasedReturnValue();
  -[HUTriggerListSubheadlineCell contentView](self, "contentView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "bottomAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v29, "constraintEqualToAnchor:constant:", v31, -v7);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v32);

  -[HUTriggerListSubheadlineCell constraints](self, "constraints");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v29) = objc_msgSend(v3, "isEqualToArray:", v33);

  if ((v29 & 1) == 0)
  {
    v34 = (void *)MEMORY[0x1E0CB3718];
    -[HUTriggerListSubheadlineCell constraints](self, "constraints");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "deactivateConstraints:", v35);

    -[HUTriggerListSubheadlineCell setConstraints:](self, "setConstraints:", v3);
    v36 = (void *)MEMORY[0x1E0CB3718];
    -[HUTriggerListSubheadlineCell constraints](self, "constraints");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "activateConstraints:", v37);

  }
  v38.receiver = self;
  v38.super_class = (Class)HUTriggerListSubheadlineCell;
  -[HUTriggerListSubheadlineCell updateConstraints](&v38, sel_updateConstraints);

}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id v8;
  NSObject *v9;
  void *v10;
  int v12;
  HUTriggerListSubheadlineCell *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  HFLogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412546;
    v13 = self;
    v14 = 2112;
    v15 = v8;
    _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "%@: User tapped URL: %@", (uint8_t *)&v12, 0x16u);
  }

  if (!a6)
  {
    -[HUTriggerListSubheadlineCell delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "learnMoreLinkTapped:", self);

  }
  return 0;
}

- (id)_descriptionTextAttributes
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id *v6;
  void *v7;
  double v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD v16[3];
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  -[HUTriggerListSubheadlineCell layoutOptions](self, "layoutOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "viewSizeSubclass");

  objc_msgSend(MEMORY[0x1E0CEA238], "defaultParagraphStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "setAlignment:", 4);
  v6 = (id *)MEMORY[0x1E0CEB540];
  if (v3)
    v6 = (id *)MEMORY[0x1E0CEB538];
  v7 = (void *)MEMORY[0x1E0CEA5E8];
  v8 = *MEMORY[0x1E0CEB5F8];
  v9 = *v6;
  objc_msgSend(v7, "_preferredFontForTextStyle:weight:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = *MEMORY[0x1E0CEA0A0];
  objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x1E0CEA0D0];
  v17[0] = v11;
  v17[1] = v5;
  v13 = *MEMORY[0x1E0CEA098];
  v16[1] = v12;
  v16[2] = v13;
  v17[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (HFItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->_item, a3);
}

- (UITextView)descriptionView
{
  return self->_descriptionView;
}

- (void)setDescriptionView:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionView, a3);
}

- (HUTriggerListSubheadlineCellDelegate)delegate
{
  return (HUTriggerListSubheadlineCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HUGridLayoutOptions)layoutOptions
{
  return self->_layoutOptions;
}

- (BOOL)respectLayoutMargins
{
  return self->_respectLayoutMargins;
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_constraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_layoutOptions, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_descriptionView, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

@end

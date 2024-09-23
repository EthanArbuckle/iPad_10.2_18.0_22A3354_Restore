@implementation SLSheetContentView

- (SLSheetContentView)initWithFrame:(CGRect)a3
{
  SLSheetContentView *v3;
  uint64_t v4;
  NSMutableDictionary *intrinsicSizes;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SLSheetContentView;
  v3 = -[SLSheetContentView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_opt_new();
    intrinsicSizes = v3->_intrinsicSizes;
    v3->_intrinsicSizes = (NSMutableDictionary *)v4;

    v3->_previewTopMargin = 15.0;
    v3->_textViewTopMargin = 4.0;
    -[SLSheetContentView _setupView](v3, "_setupView");
    -[SLSheetContentView _setupConstraints](v3, "_setupConstraints");
  }
  return v3;
}

- (void)_setupView
{
  void *v3;
  SLSheetTextComposeView *v4;
  SLSheetTextComposeView *textComposeView;
  double v6;
  double v7;
  double v8;
  double v9;
  UIView *v10;
  UIView *bottomSeparator;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  UIView *v16;
  void *v17;
  void *v18;
  void *v19;
  UIView *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  UIView *v24;
  const __CFString *v25;
  UIView *v26;
  const __CFString *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  -[SLSheetContentView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMasksToBounds:", 1);

  v4 = objc_alloc_init(SLSheetTextComposeView);
  textComposeView = self->_textComposeView;
  self->_textComposeView = v4;

  -[SLSheetTextComposeView setTranslatesAutoresizingMaskIntoConstraints:](self->_textComposeView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[SLSheetTextComposeView setTextRightInset:](self->_textComposeView, "setTextRightInset:", 15.0);
  LODWORD(v6) = 1132068864;
  -[SLSheetTextComposeView setContentCompressionResistancePriority:forAxis:](self->_textComposeView, "setContentCompressionResistancePriority:forAxis:", 0, v6);
  LODWORD(v7) = 1132068864;
  -[SLSheetTextComposeView setContentCompressionResistancePriority:forAxis:](self->_textComposeView, "setContentCompressionResistancePriority:forAxis:", 1, v7);
  LODWORD(v8) = 1132068864;
  -[SLSheetTextComposeView setContentHuggingPriority:forAxis:](self->_textComposeView, "setContentHuggingPriority:forAxis:", 0, v8);
  LODWORD(v9) = 1132068864;
  -[SLSheetTextComposeView setContentHuggingPriority:forAxis:](self->_textComposeView, "setContentHuggingPriority:forAxis:", 1, v9);
  -[SLSheetContentView addSubview:](self, "addSubview:", self->_textComposeView);
  -[SLSheetContentView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  v10 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
  bottomSeparator = self->_bottomSeparator;
  self->_bottomSeparator = v10;

  objc_msgSend(MEMORY[0x1E0CEA478], "opaqueSeparatorColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_bottomSeparator, "setBackgroundColor:", v12);

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_bottomSeparator, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[SLSheetContentView addSubview:](self, "addSubview:", self->_bottomSeparator);
  v13 = (void *)MEMORY[0x1E0CB3718];
  v27 = CFSTR("separatorHeight");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = self->_bottomSeparator;
  v25 = CFSTR("bottomSeparator");
  v26 = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[bottomSeparator(==separatorHeight@999)]|"), 0, v15, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLSheetContentView addConstraints:](self, "addConstraints:", v18);

  v19 = (void *)MEMORY[0x1E0CB3718];
  v20 = self->_bottomSeparator;
  v23 = CFSTR("bottomSeparator");
  v24 = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|[bottomSeparator]|"), 0, 0, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLSheetContentView addConstraints:](self, "addConstraints:", v22);

}

- (void)_setupConstraints
{
  double v2;
  double v4;
  double v5;
  double v6;

  LODWORD(v2) = 1132068864;
  -[SLSheetContentView setContentHuggingPriority:forAxis:](self, "setContentHuggingPriority:forAxis:", 0, v2);
  LODWORD(v4) = 1132068864;
  -[SLSheetContentView setContentHuggingPriority:forAxis:](self, "setContentHuggingPriority:forAxis:", 1, v4);
  LODWORD(v5) = 1132068864;
  -[SLSheetContentView setContentCompressionResistancePriority:forAxis:](self, "setContentCompressionResistancePriority:forAxis:", 0, v5);
  LODWORD(v6) = 1132068864;
  -[SLSheetContentView setContentCompressionResistancePriority:forAxis:](self, "setContentCompressionResistancePriority:forAxis:", 1, v6);
}

- (CGSize)intrinsicContentSize
{
  uint64_t v2;
  NSMutableDictionary *intrinsicSizes;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  CGSize result;

  intrinsicSizes = self->_intrinsicSizes;
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[SLSheetContentView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithInteger:", objc_msgSend(v6, "verticalSizeClass"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](intrinsicSizes, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_intrinsicSizes, "objectForKeyedSubscript:", &unk_1E75ADDF0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[SLSheetContentView traitCollection](self, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "numberWithInteger:", objc_msgSend(v10, "verticalSizeClass"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  _SLLog(v2, 7, CFSTR("SLSheetContentView intrinsicContentSize for self.traitCollection.verticalSizeClass %@ using sizeValue %@"));

  if (v8)
  {
    objc_msgSend(v8, "CGSizeValue", v17, v8);
    v12 = v11;
    v14 = v13;
  }
  else
  {
    v12 = *MEMORY[0x1E0CEBDE0];
    v14 = *MEMORY[0x1E0CEBDE0];
  }

  v15 = v12;
  v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

- (void)updateConstraints
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SLSheetContentView;
  -[SLSheetContentView updateConstraints](&v3, sel_updateConstraints);
  -[SLSheetContentView _setConstraints](self, "_setConstraints");
}

- (void)_setConstraints
{
  NSMutableArray *v3;
  NSMutableArray *constraints;
  NSMutableArray *v5;
  void *v6;
  SLSheetTextComposeView *textComposeView;
  void *v8;
  void *v9;
  _BOOL4 autoCompletionMode;
  void *v11;
  NSMutableArray *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  SLSheetTextComposeView *v17;
  void *v18;
  void *v19;
  NSMutableArray *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSMutableArray *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  SLSheetTextComposeView *v32;
  void *v33;
  void *v34;
  void *v35;
  NSMutableArray *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  SLSheetTextComposeView *v41;
  void *v42;
  void *v43;
  NSMutableArray *v44;
  void *v45;
  SLSheetTextComposeView *v46;
  UIView *autoCompletionModeSeparator;
  void *v48;
  SLSheetTextComposeView *v49;
  void *v50;
  void *v51;
  NSMutableArray *v52;
  void *v53;
  void *v54;
  void *v55;
  NSMutableArray *v56;
  void *v57;
  void *v58;
  void *v59;
  UIView *v60;
  NSMutableArray *v61;
  void *v62;
  void *v63;
  void *v64;
  const __CFString *v65;
  UIView *v66;
  _QWORD v67[2];
  _QWORD v68[2];
  const __CFString *v69;
  void *v70;
  const __CFString *v71;
  SLSheetTextComposeView *v72;
  _QWORD v73[2];
  _QWORD v74[2];
  const __CFString *v75;
  void *v76;
  const __CFString *v77;
  void *v78;
  const __CFString *v79;
  SLSheetTextComposeView *v80;
  _QWORD v81[2];
  _QWORD v82[2];
  const __CFString *v83;
  SLSheetTextComposeView *v84;
  const __CFString *v85;
  void *v86;
  const __CFString *v87;
  void *v88;
  _QWORD v89[2];
  _QWORD v90[2];
  _QWORD v91[2];
  _QWORD v92[2];
  const __CFString *v93;
  _QWORD v94[3];

  v94[1] = *MEMORY[0x1E0C80C00];
  if (self->_constraints)
  {
    -[SLSheetContentView removeConstraints:](self, "removeConstraints:");
    -[NSMutableArray removeAllObjects](self->_constraints, "removeAllObjects");
  }
  else
  {
    v3 = (NSMutableArray *)objc_opt_new();
    constraints = self->_constraints;
    self->_constraints = v3;

  }
  v5 = self->_constraints;
  v6 = (void *)MEMORY[0x1E0CB3718];
  textComposeView = self->_textComposeView;
  v93 = CFSTR("textComposeView");
  v94[0] = textComposeView;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v94, &v93, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|-(sheetMargin)-[textComposeView]|"), 0, &unk_1E75AE088, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObjectsFromArray:](v5, "addObjectsFromArray:", v9);

  autoCompletionMode = self->_autoCompletionMode;
  -[SLSheetContentView accessoryView](self, "accessoryView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = self->_constraints;
  v13 = (void *)MEMORY[0x1E0CB3718];
  if (autoCompletionMode)
  {
    if (v11)
    {
      v81[0] = CFSTR("sheetMargin");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_textViewTopMargin);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v81[1] = CFSTR("autoCompletionTextViewHeight");
      v82[0] = v14;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_autoCompletionTextViewHeight);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v82[1] = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v82, v81, 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = self->_textComposeView;
      v79 = CFSTR("textComposeView");
      v80 = v17;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v80, &v79, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-(sheetMargin)-[textComposeView(==autoCompletionTextViewHeight@999)]"), 0, v16, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObjectsFromArray:](v12, "addObjectsFromArray:", v19);

      v20 = self->_constraints;
      v21 = (void *)MEMORY[0x1E0CB3718];
      v77 = CFSTR("accessoryView");
      -[SLSheetContentView accessoryView](self, "accessoryView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = v22;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v78, &v77, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[accessoryView]-(accessoryBottomMargin)-|"), 0, &unk_1E75AE0D8, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObjectsFromArray:](v20, "addObjectsFromArray:", v24);

      v25 = self->_constraints;
      v26 = (void *)MEMORY[0x1E0CB3718];
      v75 = CFSTR("accessoryView");
      -[SLSheetContentView accessoryView](self, "accessoryView");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = v27;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|-(sheetMargin)-[accessoryView]|"), 0, &unk_1E75AE100, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObjectsFromArray:](v25, "addObjectsFromArray:", v29);
    }
    else
    {
      v73[0] = CFSTR("sheetMargin");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_textViewTopMargin);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v73[1] = CFSTR("autoCompletionTextViewHeight");
      v74[0] = v27;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_autoCompletionTextViewHeight);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v74[1] = v28;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v74, v73, 2);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = self->_textComposeView;
      v71 = CFSTR("textComposeView");
      v72 = v41;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v72, &v71, 1);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-(sheetMargin)-[textComposeView(==autoCompletionTextViewHeight@999)]"), 0, v29, v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObjectsFromArray:](v12, "addObjectsFromArray:", v43);

    }
    v44 = self->_constraints;
    v45 = (void *)MEMORY[0x1E0CB3718];
    v69 = CFSTR("separatorHeight");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.5);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = v38;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v70, &v69, 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = self->_textComposeView;
    v67[0] = CFSTR("textComposeView");
    v67[1] = CFSTR("autoCompletionModeSeparator");
    autoCompletionModeSeparator = self->_autoCompletionModeSeparator;
    v68[0] = v46;
    v68[1] = autoCompletionModeSeparator;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v68, v67, 2);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[textComposeView][autoCompletionModeSeparator(==separatorHeight@999)]"), 0, v39, v40);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObjectsFromArray:](v44, "addObjectsFromArray:", v48);

  }
  else if (v11)
  {
    v91[0] = CFSTR("sheetMargin");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_textViewTopMargin);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v91[1] = CFSTR("accessoryBottomMargin");
    v92[0] = v30;
    v92[1] = &unk_1E75AE058;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v92, v91, 2);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = self->_textComposeView;
    v89[0] = CFSTR("textComposeView");
    v89[1] = CFSTR("accessoryView");
    v90[0] = v32;
    -[SLSheetContentView accessoryView](self, "accessoryView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v90[1] = v33;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v90, v89, 2);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-(sheetMargin)-[textComposeView][accessoryView]-(accessoryBottomMargin)-|"), 0, v31, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObjectsFromArray:](v12, "addObjectsFromArray:", v35);

    v36 = self->_constraints;
    v37 = (void *)MEMORY[0x1E0CB3718];
    v87 = CFSTR("accessoryView");
    -[SLSheetContentView accessoryView](self, "accessoryView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = v38;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v88, &v87, 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|-(sheetMargin)-[accessoryView]|"), 0, &unk_1E75AE0B0, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObjectsFromArray:](v36, "addObjectsFromArray:", v40);
  }
  else
  {
    v85 = CFSTR("sheetMargin");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_textViewTopMargin);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = v38;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v86, &v85, 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = self->_textComposeView;
    v83 = CFSTR("textComposeView");
    v84 = v49;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v84, &v83, 1);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-(sheetMargin)-[textComposeView]|"), 0, v39, v40);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObjectsFromArray:](v12, "addObjectsFromArray:", v50);

  }
  -[SLSheetContentView previewView](self, "previewView");
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  if (v51)
  {
    v52 = self->_constraints;
    v53 = (void *)MEMORY[0x1E0CB3718];
    -[SLSheetContentView previewView](self, "previewView");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v54, 6, 0, self, 6, 1.0, -15.0);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v52, "addObject:", v55);

    v56 = self->_constraints;
    v57 = (void *)MEMORY[0x1E0CB3718];
    -[SLSheetContentView previewView](self, "previewView");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v58, 3, 0, self, 3, 1.0, self->_previewTopMargin);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v56, "addObject:", v59);

  }
  v60 = self->_autoCompletionModeSeparator;
  if (v60)
  {
    v61 = self->_constraints;
    v62 = (void *)MEMORY[0x1E0CB3718];
    v65 = CFSTR("autoCompletionModeSeparator");
    v66 = v60;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|[autoCompletionModeSeparator]|"), 0, 0, v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObjectsFromArray:](v61, "addObjectsFromArray:", v64);

  }
  -[SLSheetContentView addConstraints:](self, "addConstraints:", self->_constraints);
}

- (void)setIntrinsicSize:(CGSize)a3 forVerticalSizeClass:(int64_t)a4
{
  uint64_t v4;
  double height;
  double width;
  void *v9;
  void *v10;
  NSMutableDictionary *intrinsicSizes;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;

  height = a3.height;
  width = a3.width;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  _SLLog(v4, 7, CFSTR("SLSheetContentView setIntrinsicSize: %@ forVerticalSizeClass: %@"));

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", width, height, v9, v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  intrinsicSizes = self->_intrinsicSizes;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](intrinsicSizes, "setObject:forKeyedSubscript:", v10, v12);

  -[SLSheetContentView traitCollection](self, "traitCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "verticalSizeClass");

  if (v14 == a4)
    -[SLSheetContentView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void)traitCollectionDidChange:(id)a3
{
  uint64_t v3;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SLSheetContentView;
  -[SLSheetContentView traitCollectionDidChange:](&v11, sel_traitCollectionDidChange_, v5);
  -[SLSheetContentView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "verticalSizeClass");
  if (v7 == objc_msgSend(v5, "verticalSizeClass"))
  {
    -[SLSheetContentView traitCollection](self, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "horizontalSizeClass");
    v10 = objc_msgSend(v5, "horizontalSizeClass");

    if (v9 == v10)
      goto LABEL_6;
  }
  else
  {

  }
  _SLLog(v3, 7, CFSTR("SLSheetContentView traitCollectionDidChange: invalidating intrinsicContentSize"));
  -[SLSheetContentView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
LABEL_6:

}

- (UITextView)textView
{
  return -[SLSheetTextComposeView textView](self->_textComposeView, "textView");
}

- (UILabel)placeholderLabel
{
  return -[SLSheetTextComposeView placeholderLabel](self->_textComposeView, "placeholderLabel");
}

- (void)setAccessoryView:(id)a3
{
  UIView **p_accessoryView;
  UIView *v6;

  p_accessoryView = &self->_accessoryView;
  v6 = (UIView *)a3;
  if (*p_accessoryView != v6)
  {
    -[SLSheetContentView _resetAccessoryView](self, "_resetAccessoryView");
    objc_storeStrong((id *)&self->_accessoryView, a3);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](*p_accessoryView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    if (*p_accessoryView)
    {
      -[SLSheetContentView addSubview:](self, "addSubview:");
      -[SLSheetContentView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
      -[SLSheetContentView setNeedsDisplay](self, "setNeedsDisplay");
    }
  }

}

- (void)_resetAccessoryView
{
  -[UIView removeFromSuperview](self->_accessoryView, "removeFromSuperview");
  -[SLSheetContentView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)setPreviewView:(id)a3
{
  UIView **p_previewView;
  UIView *v6;

  p_previewView = &self->_previewView;
  v6 = (UIView *)a3;
  if (*p_previewView != v6)
  {
    -[SLSheetContentView resetPreview](self, "resetPreview");
    objc_storeStrong((id *)&self->_previewView, a3);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](*p_previewView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    if (*p_previewView)
    {
      -[SLSheetContentView addSubview:](self, "addSubview:");
      -[SLSheetContentView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
      -[SLSheetContentView setNeedsLayout](self, "setNeedsLayout");
    }
  }

}

- (void)resetPreview
{
  -[UIView removeFromSuperview](self->_previewView, "removeFromSuperview");
  -[SLSheetContentView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (double)_previewMarginForContentSize:(CGSize)a3
{
  double height;
  void *v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  double result;

  height = a3.height;
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice", a3.width);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "userInterfaceIdiom");

    v7 = v6 == 0;
  }
  else
  {
    v7 = 1;
  }

  result = 15.0;
  if (v7 && height < 100.0)
    return 10.0;
  return result;
}

- (double)_textTopMarginForContentSize:(CGSize)a3
{
  double height;
  void *v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  double result;

  height = a3.height;
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice", a3.width);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "userInterfaceIdiom");

    v7 = v6 == 0;
  }
  else
  {
    v7 = 1;
  }

  result = 4.0;
  if (v7 && height < 100.0)
    return 0.0;
  return result;
}

- (void)updatePreviewMargin
{
  double v3;
  double v4;
  double v5;

  -[SLSheetContentView bounds](self, "bounds");
  -[SLSheetContentView _previewMarginForContentSize:](self, "_previewMarginForContentSize:", v3, v4);
  if (v5 != self->_previewTopMargin)
  {
    self->_previewTopMargin = v5;
    -[SLSheetContentView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (void)updateTextViewMargin
{
  double v3;
  double v4;
  double v5;

  -[SLSheetContentView bounds](self, "bounds");
  -[SLSheetContentView _textTopMarginForContentSize:](self, "_textTopMarginForContentSize:", v3, v4);
  if (v5 != self->_textViewTopMargin)
  {
    self->_textViewTopMargin = v5;
    -[SLSheetContentView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SLSheetContentView;
  -[SLSheetContentView layoutSubviews](&v4, sel_layoutSubviews);
  -[SLSheetContentView previewView](self, "previewView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SLSheetContentView updatePreviewMargin](self, "updatePreviewMargin");
    -[SLSheetContentView updateTextViewMargin](self, "updateTextViewMargin");
    -[SLSheetContentView adjustComposeViewForPreview](self, "adjustComposeViewForPreview");
  }
  else
  {
    -[SLSheetTextComposeView setTextRightInset:](self->_textComposeView, "setTextRightInset:", 15.0);
  }
}

- (void)adjustComposeViewForPreview
{
  char v3;
  void *v4;
  double v5;
  double v9;
  double MaxX;
  double v11;
  double v12;
  double v13;

  v3 = -[SLSheetTextComposeView _shouldReverseLayoutDirection](self->_textComposeView, "_shouldReverseLayoutDirection");
  -[SLSheetContentView previewView](self, "previewView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v9 = v5;
  if ((v3 & 1) != 0)
  {
    MaxX = CGRectGetMaxX(*(CGRect *)&v5);

  }
  else
  {

    -[SLSheetTextComposeView frame](self->_textComposeView, "frame");
    v12 = v11;
    -[SLSheetTextComposeView frame](self->_textComposeView, "frame");
    MaxX = v12 + v13 - v9;
  }
  -[SLSheetTextComposeView setTextRightInset:](self->_textComposeView, "setTextRightInset:", MaxX);
}

- (void)preflightAutoCompletionModeWithApparentHeight:(double)a3
{
  UIView *v4;
  UIView *autoCompletionModeSeparator;
  void *v6;

  self->_autoCompletionTextViewHeight = a3 - self->_textViewTopMargin + -1.0;
  if (!self->_autoCompletionModeSeparator)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    autoCompletionModeSeparator = self->_autoCompletionModeSeparator;
    self->_autoCompletionModeSeparator = v4;

    objc_msgSend(MEMORY[0x1E0CEA478], "opaqueSeparatorColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_autoCompletionModeSeparator, "setBackgroundColor:", v6);

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_autoCompletionModeSeparator, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setAlpha:](self->_autoCompletionModeSeparator, "setAlpha:", 0.0);
    -[SLSheetContentView addSubview:](self, "addSubview:", self->_autoCompletionModeSeparator);
  }
  -[SLSheetContentView bounds](self, "bounds");
  -[UIView setFrame:](self->_autoCompletionModeSeparator, "setFrame:");
}

- (void)beginAutoCompletionMode
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  -[UIView setAlpha:](self->_previewView, "setAlpha:", 0.0);
  -[UIView setAlpha:](self->_accessoryView, "setAlpha:", 0.0);
  -[UIView setAlpha:](self->_bottomSeparator, "setAlpha:", 0.0);
  -[UIView setAlpha:](self->_autoCompletionModeSeparator, "setAlpha:", 1.0);
  self->_autoCompletionMode = 1;
  -[SLSheetContentView _setConstraints](self, "_setConstraints");
  -[SLSheetContentView layoutIfNeeded](self, "layoutIfNeeded");
  -[SLSheetContentView textView](self, "textView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SLSheetContentView textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "selectedRange");
  objc_msgSend(v6, "scrollRangeToVisible:", v4, v5);

}

- (void)endAutoCompletionMode
{
  -[UIView setAlpha:](self->_previewView, "setAlpha:", 1.0);
  -[UIView setAlpha:](self->_accessoryView, "setAlpha:", 1.0);
  -[UIView setAlpha:](self->_bottomSeparator, "setAlpha:", 1.0);
  -[UIView setAlpha:](self->_autoCompletionModeSeparator, "setAlpha:", 0.0);
  self->_autoCompletionMode = 0;
  -[SLSheetContentView _setConstraints](self, "_setConstraints");
  -[SLSheetContentView layoutIfNeeded](self, "layoutIfNeeded");
}

- (UIView)previewView
{
  return self->_previewView;
}

- (UIView)accessoryView
{
  return self->_accessoryView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_storeStrong((id *)&self->_previewView, 0);
  objc_storeStrong((id *)&self->_autoCompletionModeSeparator, 0);
  objc_storeStrong((id *)&self->_bottomSeparator, 0);
  objc_storeStrong((id *)&self->_intrinsicSizes, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_textComposeView, 0);
}

@end

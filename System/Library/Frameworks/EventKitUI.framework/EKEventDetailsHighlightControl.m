@implementation EKEventDetailsHighlightControl

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

+ (id)titleFont
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4AB8], 2, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v2, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)subtitleFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A98]);
}

+ (id)subtitleColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
}

+ (double)topMarginConstant
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(a1, "titleFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_bodyLeading");
  v4 = v3 * 1.11111111;

  return v4;
}

+ (double)interLabelBaselineDeltaConstant
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend((id)objc_opt_class(), "subtitleFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_bodyLeading");
  v4 = v3;

  return v4;
}

+ (double)bottomMarginConstant
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(a1, "titleFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_bodyLeading");
  v4 = v3 * 0.666666667;

  return v4;
}

- (EKEventDetailsHighlightControl)initWithFrame:(CGRect)a3
{
  EKEventDetailsHighlightControl *v3;
  void *v4;
  void *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  UILabel *titleLabel;
  uint64_t v13;
  UILabel *subtitleLabel;
  uint64_t v15;
  UILabel *actionLabel;
  uint64_t v17;
  UIImageView *iconStack;
  UILabel *v19;
  void *v20;
  UILabel *v21;
  void *v22;
  UILabel *v23;
  void *v24;
  UILabel *v25;
  void *v26;
  UILabel *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  UILabel *v39;
  double v40;
  NSLayoutConstraint *v41;
  void *v42;
  UILabel *v43;
  UILabel *v44;
  double v45;
  NSLayoutConstraint *v46;
  void *v47;
  UILabel *v48;
  double v49;
  NSLayoutConstraint *v50;
  NSLayoutConstraint *topMarginConstraint;
  NSLayoutConstraint *interLabelPaddingConstraint;
  NSLayoutConstraint *bottomMarginConstraint;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  NSArray *titleAndSubtitleVisibleContraints;
  void *v59;
  UILabel *v60;
  double v61;
  void *v62;
  uint64_t v63;
  NSArray *justTitleVisibleContraints;
  void *v65;
  void *v66;
  UILabel *v67;
  double v68;
  void *v69;
  void *v70;
  UILabel *v71;
  UILabel *v72;
  double v73;
  void *v74;
  uint64_t v75;
  NSArray *justTitleAndActionVisibleContraints;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  NSArray *justSubtitleVisibleContraints;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v89;
  NSLayoutConstraint *v90;
  NSLayoutConstraint *v91;
  NSLayoutConstraint *v92;
  void *v93;
  objc_super v94;
  _QWORD v95[3];
  _QWORD v96[3];

  v96[1] = *MEMORY[0x1E0C80C00];
  v94.receiver = self;
  v94.super_class = (Class)EKEventDetailsHighlightControl;
  v3 = -[EKEventDetailsHighlightControl initWithFrame:](&v94, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel_contentSizeCategoryDidChangeNotification_, *MEMORY[0x1E0DC48E8], 0);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventDetailsHighlightControl setBackgroundColor:](v3, "setBackgroundColor:", v5);

    v6 = objc_alloc(MEMORY[0x1E0DC3990]);
    v7 = *MEMORY[0x1E0C9D648];
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v11 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], v8, v9, v10);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (UILabel *)v11;

    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v7, v8, v9, v10);
    subtitleLabel = v3->_subtitleLabel;
    v3->_subtitleLabel = (UILabel *)v13;

    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v7, v8, v9, v10);
    actionLabel = v3->_actionLabel;
    v3->_actionLabel = (UILabel *)v15;

    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", v7, v8, v9, v10);
    iconStack = v3->_iconStack;
    v3->_iconStack = (UIImageView *)v17;

    v19 = v3->_titleLabel;
    objc_msgSend((id)objc_opt_class(), "titleFont");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v19, "setFont:", v20);

    -[UILabel setTextAlignment:](v3->_titleLabel, "setTextAlignment:", 4);
    v21 = v3->_titleLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v21, "setTextColor:", v22);

    -[UILabel setLineBreakMode:](v3->_titleLabel, "setLineBreakMode:", 0);
    -[UILabel setNumberOfLines:](v3->_titleLabel, "setNumberOfLines:", 0);
    v23 = v3->_subtitleLabel;
    objc_msgSend((id)objc_opt_class(), "subtitleFont");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v23, "setFont:", v24);

    -[UILabel setTextAlignment:](v3->_subtitleLabel, "setTextAlignment:", 4);
    -[UILabel setNumberOfLines:](v3->_subtitleLabel, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](v3->_subtitleLabel, "setLineBreakMode:", 0);
    v25 = v3->_subtitleLabel;
    objc_msgSend((id)objc_opt_class(), "subtitleColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v25, "setTextColor:", v26);

    v27 = v3->_actionLabel;
    objc_msgSend((id)objc_opt_class(), "subtitleFont");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v27, "setFont:", v28);

    -[UILabel setTextAlignment:](v3->_actionLabel, "setTextAlignment:", 4);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_subtitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_actionLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_iconStack, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[EKEventDetailsHighlightControl addSubview:](v3, "addSubview:", v3->_titleLabel);
    -[EKEventDetailsHighlightControl addSubview:](v3, "addSubview:", v3->_subtitleLabel);
    -[EKEventDetailsHighlightControl addSubview:](v3, "addSubview:", v3->_actionLabel);
    -[EKEventDetailsHighlightControl addSubview:](v3, "addSubview:", v3->_iconStack);
    LODWORD(v29) = 1148846080;
    -[UILabel setContentHuggingPriority:forAxis:](v3->_titleLabel, "setContentHuggingPriority:forAxis:", 1, v29);
    LODWORD(v30) = 1148846080;
    -[UILabel setContentHuggingPriority:forAxis:](v3->_subtitleLabel, "setContentHuggingPriority:forAxis:", 1, v30);
    LODWORD(v31) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v3->_actionLabel, "setContentCompressionResistancePriority:forAxis:", 0, v31);
    LODWORD(v32) = 1148846080;
    -[UIImageView setContentHuggingPriority:forAxis:](v3->_iconStack, "setContentHuggingPriority:forAxis:", 0, v32);
    LODWORD(v33) = 1148846080;
    -[UIImageView setContentHuggingPriority:forAxis:](v3->_iconStack, "setContentHuggingPriority:forAxis:", 1, v33);
    LODWORD(v34) = 1148846080;
    -[UIImageView setContentCompressionResistancePriority:forAxis:](v3->_iconStack, "setContentCompressionResistancePriority:forAxis:", 0, v34);
    LODWORD(v35) = 1148846080;
    -[UIImageView setContentCompressionResistancePriority:forAxis:](v3->_iconStack, "setContentCompressionResistancePriority:forAxis:", 1, v35);
    LODWORD(v36) = 1148846080;
    -[EKEventDetailsHighlightControl setContentCompressionResistancePriority:forAxis:](v3, "setContentCompressionResistancePriority:forAxis:", 1, v36);
    LODWORD(v37) = 1148846080;
    -[EKEventDetailsHighlightControl setContentHuggingPriority:forAxis:](v3, "setContentHuggingPriority:forAxis:", 1, v37);
    v38 = (void *)MEMORY[0x1E0CB3718];
    v39 = v3->_titleLabel;
    objc_msgSend((id)objc_opt_class(), "topMarginConstant");
    objc_msgSend(v38, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v39, 12, 0, v3, 3, 1.0, v40);
    v41 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    -[NSLayoutConstraint setIdentifier:](v41, "setIdentifier:", CFSTR("MessageSuggestionBannerTitle.topMargin"));
    v42 = (void *)MEMORY[0x1E0CB3718];
    v43 = v3->_subtitleLabel;
    v44 = v3->_titleLabel;
    objc_msgSend((id)objc_opt_class(), "interLabelBaselineDeltaConstant");
    objc_msgSend(v42, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v43, 12, 0, v44, 11, 1.0, v45);
    v46 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    -[NSLayoutConstraint setIdentifier:](v46, "setIdentifier:", CFSTR("MessageSuggestionBannerTitle.titleSubtitleBaselineDistance"));
    v47 = (void *)MEMORY[0x1E0CB3718];
    v48 = v3->_subtitleLabel;
    objc_msgSend((id)objc_opt_class(), "bottomMarginConstant");
    objc_msgSend(v47, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3, 4, 0, v48, 11, 1.0, v49);
    v50 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    -[NSLayoutConstraint setIdentifier:](v50, "setIdentifier:", CFSTR("MessageSuggestionBannerTitle.bottomMargin"));
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3->_subtitleLabel, 5, 0, v3->_titleLabel, 5, 1.0, 0.0);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    topMarginConstraint = v3->_topMarginConstraint;
    v3->_topMarginConstraint = v41;
    v92 = v41;

    interLabelPaddingConstraint = v3->_interLabelPaddingConstraint;
    v3->_interLabelPaddingConstraint = v46;
    v90 = v46;

    bottomMarginConstraint = v3->_bottomMarginConstraint;
    v3->_bottomMarginConstraint = v50;
    v91 = v50;

    _NSDictionaryOfVariableBindings(CFSTR("_titleLabel, _subtitleLabel, _iconStack, _actionLabel"), v3->_titleLabel, v3->_subtitleLabel, v3->_iconStack, v3->_actionLabel, 0);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v92, v93, 0);
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:[_subtitleLabel]-(==subtitleTrailingPadding)-[_actionLabel]"), 2048, &unk_1E606FB38, v89);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "arrayByAddingObject:", v91);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "arrayByAddingObject:", v90);
    v57 = objc_claimAutoreleasedReturnValue();
    titleAndSubtitleVisibleContraints = v3->_titleAndSubtitleVisibleContraints;
    v3->_titleAndSubtitleVisibleContraints = (NSArray *)v57;

    v59 = (void *)MEMORY[0x1E0CB3718];
    v60 = v3->_titleLabel;
    objc_msgSend((id)objc_opt_class(), "bottomMarginConstant");
    objc_msgSend(v59, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3, 4, 0, v60, 11, 1.0, v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v96[0] = v62;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v96, 1);
    v63 = objc_claimAutoreleasedReturnValue();
    justTitleVisibleContraints = v3->_justTitleVisibleContraints;
    v3->_justTitleVisibleContraints = (NSArray *)v63;

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3->_actionLabel, 5, 0, v3->_titleLabel, 5, 1.0, 0.0);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v95[0] = v65;
    v66 = (void *)MEMORY[0x1E0CB3718];
    v67 = v3->_actionLabel;
    objc_msgSend((id)objc_opt_class(), "bottomMarginConstant");
    objc_msgSend(v66, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3, 4, 0, v67, 11, 1.0, v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v95[1] = v69;
    v70 = (void *)MEMORY[0x1E0CB3718];
    v71 = v3->_actionLabel;
    v72 = v3->_titleLabel;
    objc_msgSend((id)objc_opt_class(), "interLabelBaselineDeltaConstant");
    objc_msgSend(v70, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v71, 12, 0, v72, 11, 1.0, v73);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v95[2] = v74;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v95, 3);
    v75 = objc_claimAutoreleasedReturnValue();
    justTitleAndActionVisibleContraints = v3->_justTitleAndActionVisibleContraints;
    v3->_justTitleAndActionVisibleContraints = (NSArray *)v75;

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:[_subtitleLabel]-(>=subtitleTrailingPadding)-[_actionLabel]-(==0)-|"), 2048, &unk_1E606FB38, v89);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-[_subtitleLabel]-|"), 0, &unk_1E606FB38, v89);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "arrayByAddingObjectsFromArray:", v78);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-[_actionLabel]-|"), 0, &unk_1E606FB38, v89);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "arrayByAddingObjectsFromArray:", v80);
    v81 = objc_claimAutoreleasedReturnValue();
    justSubtitleVisibleContraints = v3->_justSubtitleVisibleContraints;
    v3->_justSubtitleVisibleContraints = (NSArray *)v81;

    objc_msgSend(v54, "addObjectsFromArray:", v3->_titleAndSubtitleVisibleContraints);
    objc_msgSend(v54, "addObjectsFromArray:", v3->_justTitleVisibleContraints);
    objc_msgSend(v54, "addObjectsFromArray:", v3->_justSubtitleVisibleContraints);
    objc_msgSend(v54, "addObjectsFromArray:", v3->_justTitleAndActionVisibleContraints);
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-(iconStackLeading)-[_iconStack]-iconStackTrailing-[_titleLabel]-(>=0)-|"), 0, &unk_1E606FB38, v89);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "addObjectsFromArray:", v83);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:[_actionLabel]-(>=0)-|"), 0, &unk_1E606FB38, v89);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "addObjectsFromArray:", v84);

    -[UIImageView centerYAnchor](v3->_iconStack, "centerYAnchor");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel centerYAnchor](v3->_titleLabel, "centerYAnchor");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "constraintEqualToAnchor:", v86);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "addObject:", v87);

    -[EKEventDetailsHighlightControl addConstraints:](v3, "addConstraints:", v54);
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", v3->_justTitleVisibleContraints);
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", v3->_justSubtitleVisibleContraints);
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", v3->_justTitleAndActionVisibleContraints);

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)EKEventDetailsHighlightControl;
  -[EKEventDetailsHighlightControl dealloc](&v4, sel_dealloc);
}

- (void)setIconImage:(id)a3
{
  -[UIImageView setImage:](self->_iconStack, "setImage:", a3);
}

- (void)_updateTitleAndSubtitleConstraints
{
  NSArray **p_titleAndSubtitleVisibleContraints;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_justTitleVisibleContraints);
  objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_justSubtitleVisibleContraints);
  p_titleAndSubtitleVisibleContraints = &self->_titleAndSubtitleVisibleContraints;
  objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_titleAndSubtitleVisibleContraints);
  objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_justTitleAndActionVisibleContraints);
  -[UILabel text](self->_titleLabel, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[UILabel text](self->_subtitleLabel, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (!v5)
    {
      -[UILabel text](self->_actionLabel, "text");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
        p_titleAndSubtitleVisibleContraints = &self->_justTitleAndActionVisibleContraints;
      else
        p_titleAndSubtitleVisibleContraints = &self->_justTitleVisibleContraints;
    }
    goto LABEL_7;
  }
  p_titleAndSubtitleVisibleContraints = &self->_justSubtitleVisibleContraints;
  if (v5)
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", *p_titleAndSubtitleVisibleContraints);
  -[EKEventDetailsHighlightControl setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)setTitleText:(id)a3
{
  -[UILabel setText:](self->_titleLabel, "setText:", a3);
  -[EKEventDetailsHighlightControl _updateTitleAndSubtitleConstraints](self, "_updateTitleAndSubtitleConstraints");
}

- (void)_updateSubtitleAndActionText
{
  unint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSString *actionText;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSString *v20;
  void *v21;
  void *v22;
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[2];
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v3 = 0x1E0DC3000uLL;
  objc_msgSend(MEMORY[0x1E0DC3E88], "_currentTraitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventDetailsHighlightControl traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3E88], "_setCurrentTraitCollection:", v5);

  if (-[NSString length](self->_subtitleText, "length") && self->_actionText)
  {
    v6 = objc_alloc(MEMORY[0x1E0CB3778]);
    -[NSString stringByAppendingString:](self->_subtitleText, "stringByAppendingString:", CFSTR(" "));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = *MEMORY[0x1E0DC1138];
    v8 = v27;
    objc_msgSend((id)objc_opt_class(), "subtitleFont");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v9;
    v28 = *MEMORY[0x1E0DC1140];
    v10 = v28;
    objc_msgSend((id)objc_opt_class(), "subtitleColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v27, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v6, "initWithString:attributes:", v7, v12);

    v14 = objc_alloc(MEMORY[0x1E0CB3498]);
    actionText = self->_actionText;
    v25[0] = v8;
    objc_msgSend((id)objc_opt_class(), "subtitleFont");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v10;
    v26[0] = v16;
    v26[1] = self->_actionColor;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v14, "initWithString:attributes:", actionText, v17);

    v3 = 0x1E0DC3000;
    objc_msgSend(v13, "appendAttributedString:", v18);
    -[UILabel setText:](self->_subtitleLabel, "setText:", 0);
    -[UILabel setAttributedText:](self->_subtitleLabel, "setAttributedText:", v13);
    -[UILabel setText:](self->_actionLabel, "setText:", 0);

LABEL_8:
    goto LABEL_9;
  }
  if (self->_subtitleText)
  {
    -[UILabel setAttributedText:](self->_subtitleLabel, "setAttributedText:", 0);
    -[UILabel setText:](self->_subtitleLabel, "setText:", self->_subtitleText);
    -[UILabel setText:](self->_actionLabel, "setText:", 0);
  }
  else if (self->_actionText)
  {
    v19 = objc_alloc(MEMORY[0x1E0CB3498]);
    v20 = self->_actionText;
    v23[0] = *MEMORY[0x1E0DC1138];
    objc_msgSend((id)objc_opt_class(), "subtitleFont");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = *MEMORY[0x1E0DC1140];
    v24[0] = v21;
    v24[1] = self->_actionColor;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v19, "initWithString:attributes:", v20, v22);

    -[UILabel setText:](self->_subtitleLabel, "setText:", 0);
    -[UILabel setAttributedText:](self->_subtitleLabel, "setAttributedText:", 0);
    -[UILabel setAttributedText:](self->_actionLabel, "setAttributedText:", v13);
    goto LABEL_8;
  }
LABEL_9:
  -[EKEventDetailsHighlightControl _updateTitleAndSubtitleConstraints](self, "_updateTitleAndSubtitleConstraints");
  objc_msgSend(*(id *)(v3 + 3720), "_setCurrentTraitCollection:", v4);

}

- (void)setActionText:(id)a3 color:(id)a4
{
  NSString *v6;
  UIColor *v7;
  NSString *actionText;
  NSString *v9;
  UIColor *actionColor;

  v6 = (NSString *)a3;
  v7 = (UIColor *)a4;
  actionText = self->_actionText;
  self->_actionText = v6;
  v9 = v6;

  actionColor = self->_actionColor;
  self->_actionColor = v7;

  -[EKEventDetailsHighlightControl _updateSubtitleAndActionText](self, "_updateSubtitleAndActionText");
}

- (void)setSubtitleText:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleText, a3);
  -[EKEventDetailsHighlightControl _updateSubtitleAndActionText](self, "_updateSubtitleAndActionText");
}

- (void)setSubtitleAttributedText:(id)a3
{
  -[UILabel setAttributedText:](self->_subtitleLabel, "setAttributedText:", a3);
  -[EKEventDetailsHighlightControl _updateTitleAndSubtitleConstraints](self, "_updateTitleAndSubtitleConstraints");
}

- (void)contentSizeCategoryDidChangeNotification:(id)a3
{
  UILabel *titleLabel;
  void *v5;
  UILabel *subtitleLabel;
  void *v7;
  UILabel *actionLabel;
  void *v9;
  NSLayoutConstraint *topMarginConstraint;
  NSLayoutConstraint *interLabelPaddingConstraint;
  NSLayoutConstraint *bottomMarginConstraint;

  titleLabel = self->_titleLabel;
  objc_msgSend((id)objc_opt_class(), "titleFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](titleLabel, "setFont:", v5);

  subtitleLabel = self->_subtitleLabel;
  objc_msgSend((id)objc_opt_class(), "subtitleFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](subtitleLabel, "setFont:", v7);

  actionLabel = self->_actionLabel;
  objc_msgSend((id)objc_opt_class(), "subtitleFont");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](actionLabel, "setFont:", v9);

  topMarginConstraint = self->_topMarginConstraint;
  objc_msgSend((id)objc_opt_class(), "topMarginConstant");
  -[NSLayoutConstraint setConstant:](topMarginConstraint, "setConstant:");
  interLabelPaddingConstraint = self->_interLabelPaddingConstraint;
  objc_msgSend((id)objc_opt_class(), "interLabelBaselineDeltaConstant");
  -[NSLayoutConstraint setConstant:](interLabelPaddingConstraint, "setConstant:");
  bottomMarginConstraint = self->_bottomMarginConstraint;
  objc_msgSend((id)objc_opt_class(), "bottomMarginConstant");
  -[NSLayoutConstraint setConstant:](bottomMarginConstraint, "setConstant:");
}

- (UIImageView)iconStack
{
  return self->_iconStack;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (UILabel)actionLabel
{
  return self->_actionLabel;
}

- (NSLayoutConstraint)topMarginConstraint
{
  return self->_topMarginConstraint;
}

- (NSLayoutConstraint)interLabelPaddingConstraint
{
  return self->_interLabelPaddingConstraint;
}

- (NSLayoutConstraint)bottomMarginConstraint
{
  return self->_bottomMarginConstraint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomMarginConstraint, 0);
  objc_storeStrong((id *)&self->_interLabelPaddingConstraint, 0);
  objc_storeStrong((id *)&self->_topMarginConstraint, 0);
  objc_storeStrong((id *)&self->_actionLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_iconStack, 0);
  objc_storeStrong((id *)&self->_actionColor, 0);
  objc_storeStrong((id *)&self->_subtitleText, 0);
  objc_storeStrong((id *)&self->_actionText, 0);
  objc_storeStrong((id *)&self->_justTitleAndActionVisibleContraints, 0);
  objc_storeStrong((id *)&self->_justSubtitleVisibleContraints, 0);
  objc_storeStrong((id *)&self->_justTitleVisibleContraints, 0);
  objc_storeStrong((id *)&self->_titleAndSubtitleVisibleContraints, 0);
}

@end

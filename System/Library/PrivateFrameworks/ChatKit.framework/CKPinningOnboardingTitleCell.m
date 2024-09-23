@implementation CKPinningOnboardingTitleCell

+ (NSString)reuseIdentifier
{
  return (NSString *)CFSTR("CKPinningOnboardingTitleCellReuseIdentifier");
}

- (CKPinningOnboardingTitleCell)initWithFrame:(CGRect)a3
{
  CKPinningOnboardingTitleCell *v3;
  CKPinningOnboardingTitleCell *v4;
  id v5;
  void *v6;
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
  id v18;
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
  id v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
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
  double v51;
  double v52;
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
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  objc_super v94;
  _QWORD v95[11];

  v95[9] = *MEMORY[0x1E0C80C00];
  v94.receiver = self;
  v94.super_class = (Class)CKPinningOnboardingTitleCell;
  v3 = -[CKPinningOnboardingTitleCell initWithFrame:](&v94, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CKPinningOnboardingTitleCell setIsInCollapsedState:](v3, "setIsInCollapsedState:", 1);
    v5 = objc_alloc_init(MEMORY[0x1E0CEA700]);
    -[CKPinningOnboardingTitleCell setTitleLabel:](v4, "setTitleLabel:", v5);

    -[CKPinningOnboardingTitleCell titleLabel](v4, "titleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[CKPinningOnboardingTitleCell titleLabel](v4, "titleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTextAlignment:", 1);

    -[CKPinningOnboardingTitleCell titleLabel](v4, "titleLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNumberOfLines:", 0);

    -[CKPinningOnboardingTitleCell pinningOnboardingTitleLabelFontForPinnedConversationViewLayoutStyle:inCollapsedState:](v4, "pinningOnboardingTitleLabelFontForPinnedConversationViewLayoutStyle:inCollapsedState:", -[CKPinningOnboardingTitleCell pinnedConversationViewLayoutStyle](v4, "pinnedConversationViewLayoutStyle"), -[CKPinningOnboardingTitleCell isInCollapsedState](v4, "isInCollapsedState"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKPinningOnboardingTitleCell titleLabel](v4, "titleLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFont:", v9);

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "theme");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "conversationListPinningOnboardingTitleColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKPinningOnboardingTitleCell titleLabel](v4, "titleLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTextColor:", v13);

    CKFrameworkBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("PINNING_ONBOARDING_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKPinningOnboardingTitleCell titleLabel](v4, "titleLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setText:", v16);

    v18 = objc_alloc_init(MEMORY[0x1E0CEA700]);
    -[CKPinningOnboardingTitleCell setSubtitleLabel:](v4, "setSubtitleLabel:", v18);

    -[CKPinningOnboardingTitleCell subtitleLabel](v4, "subtitleLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[CKPinningOnboardingTitleCell subtitleLabel](v4, "subtitleLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setTextAlignment:", 1);

    -[CKPinningOnboardingTitleCell subtitleLabel](v4, "subtitleLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setNumberOfLines:", 0);

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "pinningOnboardingSubtitleLabelFont");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKPinningOnboardingTitleCell subtitleLabel](v4, "subtitleLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setFont:", v23);

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "theme");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "conversationListPinningOnboardingSubtitleColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKPinningOnboardingTitleCell subtitleLabel](v4, "subtitleLabel");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setTextColor:", v27);

    CKFrameworkBundle();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("PINNING_ONBOARDING_SUBTITLE"), &stru_1E276D870, CFSTR("ChatKit"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKPinningOnboardingTitleCell subtitleLabel](v4, "subtitleLabel");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setText:", v30);

    -[CKPinningOnboardingTitleCell contentView](v4, "contentView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKPinningOnboardingTitleCell titleLabel](v4, "titleLabel");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addSubview:", v33);

    -[CKPinningOnboardingTitleCell contentView](v4, "contentView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKPinningOnboardingTitleCell subtitleLabel](v4, "subtitleLabel");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addSubview:", v35);

    v36 = objc_alloc_init(MEMORY[0x1E0CEA710]);
    -[CKPinningOnboardingTitleCell setLabelMarginGuide:](v4, "setLabelMarginGuide:", v36);

    -[CKPinningOnboardingTitleCell contentView](v4, "contentView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKPinningOnboardingTitleCell labelMarginGuide](v4, "labelMarginGuide");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addLayoutGuide:", v38);

    -[CKPinningOnboardingTitleCell pinningOnboardingMarginForPinnedConversationViewLayoutStyle:](v4, "pinningOnboardingMarginForPinnedConversationViewLayoutStyle:", -[CKPinningOnboardingTitleCell pinnedConversationViewLayoutStyle](v4, "pinnedConversationViewLayoutStyle"));
    v40 = v39;
    -[CKPinningOnboardingTitleCell labelMarginGuide](v4, "labelMarginGuide");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "leadingAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKPinningOnboardingTitleCell contentView](v4, "contentView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "leadingAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:constant:", v44, v40);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKPinningOnboardingTitleCell setLeadingMarginLayoutConstraint:](v4, "setLeadingMarginLayoutConstraint:", v45);

    -[CKPinningOnboardingTitleCell labelMarginGuide](v4, "labelMarginGuide");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "trailingAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKPinningOnboardingTitleCell contentView](v4, "contentView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "trailingAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:constant:", v49, -v40);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKPinningOnboardingTitleCell setTrailingMarginLayoutConstraint:](v4, "setTrailingMarginLayoutConstraint:", v50);

    -[CKPinningOnboardingTitleCell pinningOnboardingSubtitleSpacingForPinnedConversationViewLayoutStyle:](v4, "pinningOnboardingSubtitleSpacingForPinnedConversationViewLayoutStyle:", -[CKPinningOnboardingTitleCell pinnedConversationViewLayoutStyle](v4, "pinnedConversationViewLayoutStyle"));
    v52 = v51;
    -[CKPinningOnboardingTitleCell titleLabel](v4, "titleLabel");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "bottomAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKPinningOnboardingTitleCell subtitleLabel](v4, "subtitleLabel");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "topAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "constraintEqualToAnchor:constant:", v56, -v52);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKPinningOnboardingTitleCell setSubtitleSpacingConstraint:](v4, "setSubtitleSpacingConstraint:", v57);

    v79 = (void *)MEMORY[0x1E0CB3718];
    -[CKPinningOnboardingTitleCell leadingMarginLayoutConstraint](v4, "leadingMarginLayoutConstraint");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v95[0] = v93;
    -[CKPinningOnboardingTitleCell trailingMarginLayoutConstraint](v4, "trailingMarginLayoutConstraint");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v95[1] = v92;
    -[CKPinningOnboardingTitleCell subtitleSpacingConstraint](v4, "subtitleSpacingConstraint");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v95[2] = v91;
    -[CKPinningOnboardingTitleCell titleLabel](v4, "titleLabel");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "topAnchor");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKPinningOnboardingTitleCell contentView](v4, "contentView");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "topAnchor");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "constraintEqualToAnchor:constant:", v87, 16.0);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v95[3] = v86;
    -[CKPinningOnboardingTitleCell subtitleLabel](v4, "subtitleLabel");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "bottomAnchor");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKPinningOnboardingTitleCell contentView](v4, "contentView");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "bottomAnchor");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "constraintEqualToAnchor:constant:", v82, -16.0);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v95[4] = v81;
    -[CKPinningOnboardingTitleCell titleLabel](v4, "titleLabel");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "leadingAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKPinningOnboardingTitleCell labelMarginGuide](v4, "labelMarginGuide");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "leadingAnchor");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "constraintEqualToAnchor:", v76);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v95[5] = v75;
    -[CKPinningOnboardingTitleCell titleLabel](v4, "titleLabel");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "trailingAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKPinningOnboardingTitleCell labelMarginGuide](v4, "labelMarginGuide");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "trailingAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "constraintEqualToAnchor:", v71);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v95[6] = v70;
    -[CKPinningOnboardingTitleCell subtitleLabel](v4, "subtitleLabel");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "leadingAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKPinningOnboardingTitleCell labelMarginGuide](v4, "labelMarginGuide");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "leadingAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "constraintEqualToAnchor:", v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v95[7] = v60;
    -[CKPinningOnboardingTitleCell subtitleLabel](v4, "subtitleLabel");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "trailingAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKPinningOnboardingTitleCell labelMarginGuide](v4, "labelMarginGuide");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "trailingAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "constraintEqualToAnchor:", v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v95[8] = v65;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v95, 9);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "activateConstraints:", v66);

  }
  return v4;
}

- (void)updateConstraints
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  objc_super v12;

  -[CKPinningOnboardingTitleCell pinningOnboardingMarginForPinnedConversationViewLayoutStyle:](self, "pinningOnboardingMarginForPinnedConversationViewLayoutStyle:", -[CKPinningOnboardingTitleCell pinnedConversationViewLayoutStyle](self, "pinnedConversationViewLayoutStyle"));
  v4 = v3;
  -[CKPinningOnboardingTitleCell pinningOnboardingTitleLabelFontForPinnedConversationViewLayoutStyle:inCollapsedState:](self, "pinningOnboardingTitleLabelFontForPinnedConversationViewLayoutStyle:inCollapsedState:", -[CKPinningOnboardingTitleCell pinnedConversationViewLayoutStyle](self, "pinnedConversationViewLayoutStyle"), -[CKPinningOnboardingTitleCell isInCollapsedState](self, "isInCollapsedState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKPinningOnboardingTitleCell titleLabel](self, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v5);

  -[CKPinningOnboardingTitleCell leadingMarginLayoutConstraint](self, "leadingMarginLayoutConstraint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setConstant:", v4);

  -[CKPinningOnboardingTitleCell trailingMarginLayoutConstraint](self, "trailingMarginLayoutConstraint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setConstant:", -v4);

  -[CKPinningOnboardingTitleCell pinningOnboardingSubtitleSpacingForPinnedConversationViewLayoutStyle:](self, "pinningOnboardingSubtitleSpacingForPinnedConversationViewLayoutStyle:", -[CKPinningOnboardingTitleCell pinnedConversationViewLayoutStyle](self, "pinnedConversationViewLayoutStyle"));
  v10 = -v9;
  -[CKPinningOnboardingTitleCell subtitleSpacingConstraint](self, "subtitleSpacingConstraint");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setConstant:", v10);

  v12.receiver = self;
  v12.super_class = (Class)CKPinningOnboardingTitleCell;
  -[CKPinningOnboardingTitleCell updateConstraints](&v12, sel_updateConstraints);
}

- (void)setPinnedConversationViewLayoutStyle:(int64_t)a3 collapsedState:(BOOL)a4
{
  -[CKPinningOnboardingTitleCell setIsInCollapsedState:](self, "setIsInCollapsedState:", a4);
  -[CKPinningOnboardingTitleCell setPinnedConversationViewLayoutStyle:](self, "setPinnedConversationViewLayoutStyle:", a3);
  -[CKPinningOnboardingTitleCell updateConstraintsIfNeeded](self, "updateConstraintsIfNeeded");
}

- (id)pinningOnboardingTitleLabelFontForPinnedConversationViewLayoutStyle:(int64_t)a3 inCollapsedState:(BOOL)a4
{
  uint64_t v4;
  void **v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    if (a4)
      v4 = 2;
    else
      v4 = 32770;
    v5 = (void **)MEMORY[0x1E0CEB5C0];
    if (!a4)
      v5 = (void **)MEMORY[0x1E0CEB5B0];
    v6 = *v5;
  }
  else
  {
    v6 = (void *)*MEMORY[0x1E0CEB580];
    v4 = 2;
  }
  v7 = v6;
  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", v7, v4, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v8, 0.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (double)pinningOnboardingSubtitleSpacingForPinnedConversationViewLayoutStyle:(int64_t)a3
{
  double result;

  result = 15.0;
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2)
    return 11.0;
  return result;
}

- (double)pinningOnboardingMarginForPinnedConversationViewLayoutStyle:(int64_t)a3
{
  double result;

  result = 16.0;
  if ((unint64_t)a3 <= 4)
    return dbl_18E7CB4D0[a3];
  return result;
}

- (int64_t)pinnedConversationViewLayoutStyle
{
  return self->_pinnedConversationViewLayoutStyle;
}

- (void)setPinnedConversationViewLayoutStyle:(int64_t)a3
{
  self->_pinnedConversationViewLayoutStyle = a3;
}

- (BOOL)isInCollapsedState
{
  return self->_isInCollapsedState;
}

- (void)setIsInCollapsedState:(BOOL)a3
{
  self->_isInCollapsedState = a3;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLabel, a3);
}

- (UILayoutGuide)labelMarginGuide
{
  return self->_labelMarginGuide;
}

- (void)setLabelMarginGuide:(id)a3
{
  objc_storeStrong((id *)&self->_labelMarginGuide, a3);
}

- (NSLayoutConstraint)leadingMarginLayoutConstraint
{
  return self->_leadingMarginLayoutConstraint;
}

- (void)setLeadingMarginLayoutConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_leadingMarginLayoutConstraint, a3);
}

- (NSLayoutConstraint)trailingMarginLayoutConstraint
{
  return self->_trailingMarginLayoutConstraint;
}

- (void)setTrailingMarginLayoutConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_trailingMarginLayoutConstraint, a3);
}

- (NSLayoutConstraint)subtitleSpacingConstraint
{
  return self->_subtitleSpacingConstraint;
}

- (void)setSubtitleSpacingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleSpacingConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleSpacingConstraint, 0);
  objc_storeStrong((id *)&self->_trailingMarginLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_leadingMarginLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_labelMarginGuide, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end

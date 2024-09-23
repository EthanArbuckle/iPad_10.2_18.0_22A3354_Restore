@implementation CKConversationListLargeTextCell

+ (id)identifierForConversation:(id)a3
{
  return CFSTR("CKConversationListLargeTextCellIdentifier");
}

+ (id)hyphenationParagraphStyle
{
  if (hyphenationParagraphStyle_onceToken != -1)
    dispatch_once(&hyphenationParagraphStyle_onceToken, &__block_literal_global_89);
  return (id)hyphenationParagraphStyle_hyphenationParagraphStyle;
}

void __60__CKConversationListLargeTextCell_hyphenationParagraphStyle__block_invoke()
{
  void *v0;
  void *v1;
  double v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC1290], "defaultParagraphStyle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)objc_msgSend(v0, "mutableCopy");

  LODWORD(v2) = 1.0;
  objc_msgSend(v1, "setHyphenationFactor:", v2);
  objc_msgSend(v1, "setLineBreakMode:", 4);
  v3 = (void *)hyphenationParagraphStyle_hyphenationParagraphStyle;
  hyphenationParagraphStyle_hyphenationParagraphStyle = (uint64_t)v1;

}

+ (double)cellHeightForDisplayScale:(double)a3
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v13;

  v13.receiver = a1;
  v13.super_class = (Class)&OBJC_METACLASS___CKConversationListLargeTextCell;
  objc_msgSendSuper2(&v13, sel_cellHeightForDisplayScale_);
  v4 = v3;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "conversationListDateFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "senderSummaryConversationListSpace");
  v9 = v8;

  objc_msgSend(v6, "capHeight");
  UIRoundToScale();
  v11 = v4 + v9 + v10;

  return v11;
}

- (CKConversationListLargeTextCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CKConversationListLargeTextCell *v4;
  CKConversationListLargeTextCell *v5;
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
  void *v18;
  void *v19;
  void *v20;
  double v21;
  id v22;
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
  double v41;
  void *v42;
  void *v43;
  CKConversationListTypingIndicatorView *v44;
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
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  objc_super v103;
  _QWORD v104[2];
  _QWORD v105[2];
  _QWORD v106[10];

  v106[8] = *MEMORY[0x1E0C80C00];
  v103.receiver = self;
  v103.super_class = (Class)CKConversationListLargeTextCell;
  v4 = -[CKConversationListCell initWithStyle:reuseIdentifier:](&v103, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[CKConversationListCell dateLabel](v4, "dateLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[CKConversationListCell dateLabel](v5, "dateLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTextAlignment:", 4);

    -[CKConversationListCell dateLabel](v5, "dateLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "theme");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "conversationListLargeTextDateColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTextColor:", v11);

    -[CKConversationListLargeTextCell contentView](v5, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversationListCell dateLabel](v5, "dateLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", v13);

    -[CKConversationListCell fromLabel](v5, "fromLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[CKConversationListCell fromLabel](v5, "fromLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setNumberOfLines:", 2);

    -[CKConversationListCell summaryLabel](v5, "summaryLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[CKConversationListLargeTextCell contentView](v5, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversationListCell summaryLabel](v5, "summaryLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addSubview:", v18);

    -[CKConversationListCell chevronImageView](v5, "chevronImageView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[CKConversationListCell chevronImageView](v5, "chevronImageView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v21) = 1148846080;
    objc_msgSend(v20, "setContentHuggingPriority:forAxis:", 0, v21);

    v22 = objc_alloc_init(MEMORY[0x1E0CEA710]);
    -[CKConversationListLargeTextCell contentView](v5, "contentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addLayoutGuide:", v22);

    v101 = v22;
    -[CKConversationListLargeTextCell setFirstLineLayoutGuide:](v5, "setFirstLineLayoutGuide:", v22);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversationListCell fromLabel](v5, "fromLabel");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "leadingAnchor");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversationListLargeTextCell contentView](v5, "contentView");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "leadingAnchor");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "conversationListCellLargeTextLeftMargin");
    objc_msgSend(v94, "constraintEqualToAnchor:constant:", v92);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v106[0] = v91;
    -[CKConversationListCell summaryLabel](v5, "summaryLabel");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "leadingAnchor");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversationListCell fromLabel](v5, "fromLabel");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "leadingAnchor");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "constraintEqualToAnchor:", v87);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v106[1] = v86;
    -[CKConversationListCell summaryLabel](v5, "summaryLabel");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "trailingAnchor");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversationListCell fromLabel](v5, "fromLabel");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "trailingAnchor");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "constraintEqualToAnchor:", v82);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v106[2] = v81;
    -[CKConversationListCell dateLabel](v5, "dateLabel");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "leadingAnchor");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversationListCell fromLabel](v5, "fromLabel");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "leadingAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "constraintEqualToAnchor:", v77);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v106[3] = v76;
    -[CKConversationListCell dateLabel](v5, "dateLabel");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "trailingAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversationListCell fromLabel](v5, "fromLabel");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "trailingAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "constraintEqualToAnchor:", v72);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v106[4] = v71;
    -[CKConversationListLargeTextCell firstLineLayoutGuide](v5, "firstLineLayoutGuide");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "bottomAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversationListCell fromLabel](v5, "fromLabel");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "firstBaselineAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "constraintEqualToAnchor:", v67);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v106[5] = v66;
    -[CKConversationListCell summaryLabel](v5, "summaryLabel");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "topAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversationListCell fromLabel](v5, "fromLabel");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "bottomAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "conversationListCellLargeTextSenderSummaryInterspacing");
    objc_msgSend(v63, "constraintEqualToAnchor:constant:", v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v106[6] = v26;
    -[CKConversationListCell dateLabel](v5, "dateLabel");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "topAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversationListCell summaryLabel](v5, "summaryLabel");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "bottomAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v106[7] = v31;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v106, 8);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "addObjectsFromArray:", v32);

    -[CKConversationListCell chevronImageView](v5, "chevronImageView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      -[CKConversationListCell chevronImageView](v5, "chevronImageView");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v99, "centerYAnchor");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKConversationListLargeTextCell firstLineLayoutGuide](v5, "firstLineLayoutGuide");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "centerYAnchor");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "constraintEqualToAnchor:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v105[0] = v36;
      -[CKConversationListCell chevronImageView](v5, "chevronImageView");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "trailingAnchor");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKConversationListLargeTextCell contentView](v5, "contentView");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "trailingAnchor");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKConversationListLargeTextCell layoutMargins](v5, "layoutMargins");
      objc_msgSend(v38, "constraintEqualToAnchor:constant:", v40, -v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v105[1] = v42;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v105, 2);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "addObjectsFromArray:", v43);

    }
    if ((IMSharedHelperDeviceIsiPad() & 1) != 0 || CKIsRunningInMacCatalyst())
    {
      v44 = objc_alloc_init(CKConversationListTypingIndicatorView);
      -[CKConversationListCell setTypingIndicatorView:](v5, "setTypingIndicatorView:", v44);

      -[CKConversationListCell typingIndicatorView](v5, "typingIndicatorView");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      -[CKConversationListLargeTextCell contentView](v5, "contentView");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKConversationListCell typingIndicatorView](v5, "typingIndicatorView");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "addSubview:", v47);

      -[CKConversationListCell typingIndicatorView](v5, "typingIndicatorView");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "leadingAnchor");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKConversationListCell fromLabel](v5, "fromLabel");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "leadingAnchor");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "constraintEqualToAnchor:", v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v104[0] = v50;
      -[CKConversationListCell typingIndicatorView](v5, "typingIndicatorView");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "topAnchor");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKConversationListCell fromLabel](v5, "fromLabel");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "bottomAnchor");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "constraintEqualToAnchor:", v54);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v104[1] = v55;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v104, 2);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "addObjectsFromArray:", v56);

      -[CKConversationListCell typingIndicatorView](v5, "typingIndicatorView");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "setHidden:", 1);

    }
    -[CKConversationListLargeTextCell _constraintForEditing:](v5, "_constraintForEditing:", 0);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversationListLargeTextCell setEditingDependentConstraint:](v5, "setEditingDependentConstraint:", v58);

    -[CKConversationListLargeTextCell editingDependentConstraint](v5, "editingDependentConstraint");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "addObject:", v59);

    -[CKConversationListLargeTextCell _contentSizeCategoryDependentConstraints](v5, "_contentSizeCategoryDependentConstraints");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversationListLargeTextCell setContentSizeCategoryDependentConstraints:](v5, "setContentSizeCategoryDependentConstraints:", v60);

    -[CKConversationListLargeTextCell contentSizeCategoryDependentConstraints](v5, "contentSizeCategoryDependentConstraints");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "addObjectsFromArray:", v61);

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v102);
  }
  return v5;
}

- (id)summaryLabelTextBaseColor
{
  void *v2;
  void *v3;
  void *v4;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "theme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "conversationListLargeTextSummaryColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)unreadIndicatorImageForVisibility:(BOOL)a3 withMuteState:(BOOL)a4
{
  void *v4;
  void *v5;

  if (a3)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors", a3, a4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unreadIndicatorTintedImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)contentSizeCategoryDidChange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKConversationListLargeTextCell;
  -[CKConversationListCell contentSizeCategoryDidChange](&v8, sel_contentSizeCategoryDidChange);
  v3 = (void *)MEMORY[0x1E0CB3718];
  -[CKConversationListLargeTextCell contentSizeCategoryDependentConstraints](self, "contentSizeCategoryDependentConstraints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deactivateConstraints:", v4);

  -[CKConversationListLargeTextCell _contentSizeCategoryDependentConstraints](self, "_contentSizeCategoryDependentConstraints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversationListLargeTextCell setContentSizeCategoryDependentConstraints:](self, "setContentSizeCategoryDependentConstraints:", v5);

  v6 = (void *)MEMORY[0x1E0CB3718];
  -[CKConversationListLargeTextCell contentSizeCategoryDependentConstraints](self, "contentSizeCategoryDependentConstraints");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activateConstraints:", v7);

}

- (void)updateFromLabelWithText:(id)a3
{
  __CFString *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  const __CFString *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  const __CFString *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = (__CFString *)a3;
  -[CKConversationListLargeTextCell indicatorTextAttachments](self, "indicatorTextAttachments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {

  }
  else
  {
    -[CKConversationListLargeTextCell unreadIndicatorAttachment](self, "unreadIndicatorAttachment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v25 = objc_alloc(MEMORY[0x1E0CB3778]);
      if (v4)
        v26 = v4;
      else
        v26 = &stru_1E276D870;
      v7 = (id)objc_msgSend(v25, "initWithString:", v26);
      goto LABEL_17;
    }
  }
  v7 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  -[CKConversationListLargeTextCell unreadIndicatorAttachment](self, "unreadIndicatorAttachment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0CB3498];
    -[CKConversationListLargeTextCell unreadIndicatorAttachment](self, "unreadIndicatorAttachment");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "attributedStringWithAttachment:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "appendAttributedString:", v11);
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[CKConversationListLargeTextCell indicatorTextAttachments](self, "indicatorTextAttachments", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v28;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v28 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v16));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "appendAttributedString:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v14);
  }

  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR(" "));
  objc_msgSend(v7, "appendAttributedString:", v18);

  v19 = objc_alloc(MEMORY[0x1E0CB3498]);
  if (v4)
    v20 = v4;
  else
    v20 = &stru_1E276D870;
  v21 = (void *)objc_msgSend(v19, "initWithString:", v20);
  objc_msgSend(v7, "appendAttributedString:", v21);

LABEL_17:
  v22 = *MEMORY[0x1E0DC1178];
  objc_msgSend((id)objc_opt_class(), "hyphenationParagraphStyle");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAttribute:value:range:", v22, v23, 0, objc_msgSend(v7, "length"));

  -[CKConversationListCell fromLabel](self, "fromLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setAttributedText:", v7);

}

- (void)updateUnreadIndicatorWithImage:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  uint64_t i;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[CKConversationListLargeTextCell unreadIndicatorAttachment](self, "unreadIndicatorAttachment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v6 = objc_alloc_init(MEMORY[0x1E0DC12B0]);
      -[CKConversationListLargeTextCell setUnreadIndicatorAttachment:](self, "setUnreadIndicatorAttachment:", v6);

    }
    -[CKConversationListLargeTextCell unreadIndicatorAttachment](self, "unreadIndicatorAttachment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setImage:", v4);

    -[CKConversationListCell fromLabel](self, "fromLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "font");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "capHeight");
    v11 = v10;

    objc_msgSend(v4, "size");
    v13 = v12;
    v15 = v14;
    -[CKConversationListLargeTextCell unreadIndicatorAttachment](self, "unreadIndicatorAttachment");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setBounds:", 0.0, v11 * 0.5 - v15 * 0.5, v13, v15);

  }
  else
  {
    -[CKConversationListLargeTextCell setUnreadIndicatorAttachment:](self, "setUnreadIndicatorAttachment:", 0);
  }
  -[CKConversationListCell fromLabel](self, "fromLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "font");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "capHeight");
  v20 = v19;

  -[CKConversationListCell makeTextAttachmentsForCurrentIndicatorState](self, "makeTextAttachmentsForCurrentIndicatorState");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v34;
    v25 = v20 * 0.5;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v34 != v24)
          objc_enumerationMutation(v21);
        v27 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v27, "image");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "size");
        v30 = v29;
        v32 = v31;

        objc_msgSend(v27, "setBounds:", 0.0, v25 + v32 * 0.4 * -0.5, v30 * 0.4);
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v23);
  }
  -[CKConversationListLargeTextCell setIndicatorTextAttachments:](self, "setIndicatorTextAttachments:", v21);

}

- (void)updateForEditing:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CKConversationListLargeTextCell;
  -[CKConversationListCell updateForEditing:](&v8, sel_updateForEditing_);
  -[CKConversationListLargeTextCell editingDependentConstraint](self, "editingDependentConstraint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActive:", 0);

  -[CKConversationListLargeTextCell _constraintForEditing:](self, "_constraintForEditing:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversationListLargeTextCell setEditingDependentConstraint:](self, "setEditingDependentConstraint:", v6);

  -[CKConversationListLargeTextCell editingDependentConstraint](self, "editingDependentConstraint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActive:", 1);

  -[CKConversationListLargeTextCell layoutIfNeeded](self, "layoutIfNeeded");
}

- (id)_constraintForEditing:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;

  if (a3)
  {
    -[CKConversationListCell fromLabel](self, "fromLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "trailingAnchor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversationListLargeTextCell contentView](self, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "trailingAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "conversationListCellLargeTextLeftMargin");
    objc_msgSend(v5, "constraintEqualToAnchor:constant:", v7, -v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[CKConversationListCell chevronImageView](self, "chevronImageView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKConversationListCell fromLabel](self, "fromLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "trailingAnchor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[CKConversationListCell chevronImageView](self, "chevronImageView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "leadingAnchor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -10.0;
    }
    else
    {
      -[CKConversationListLargeTextCell contentView](self, "contentView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "trailingAnchor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKConversationListLargeTextCell layoutMargins](self, "layoutMargins");
      v12 = -v13;
    }
    objc_msgSend(v5, "constraintEqualToAnchor:constant:", v7, v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (id)_contentSizeCategoryDependentConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];

  v23[3] = *MEMORY[0x1E0C80C00];
  -[CKConversationListCell fromLabel](self, "fromLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "topAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversationListLargeTextCell contentView](self, "contentView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "topAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "largeTextTopConversationListSpace");
  objc_msgSend(v20, "constraintEqualToAnchor:constant:", v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v17;
  -[CKConversationListLargeTextCell firstLineLayoutGuide](self, "firstLineLayoutGuide");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "heightAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversationListCell fromLabel](self, "fromLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "font");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "capHeight");
  objc_msgSend(v3, "constraintEqualToConstant:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v6;
  -[CKConversationListCell dateLabel](self, "dateLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bottomAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversationListLargeTextCell contentView](self, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bottomAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "accessibilityBottomConversationListSpace");
  objc_msgSend(v8, "constraintEqualToAnchor:constant:", v10, -v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 3);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)updateContentsForConversation:(id)a3 fastPreview:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CKConversationListLargeTextCell;
  -[CKConversationListCell updateContentsForConversation:fastPreview:](&v11, sel_updateContentsForConversation_fastPreview_, a3, a4);
  if ((IMSharedHelperDeviceIsiPad() & 1) != 0 || CKIsRunningInMacCatalyst())
  {
    if (-[CKConversationListCell lastMessageIsTypingIndicator](self, "lastMessageIsTypingIndicator"))
    {
      -[CKConversationListCell summaryLabel](self, "summaryLabel");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setHidden:", 1);

      -[CKConversationListCell typingIndicatorView](self, "typingIndicatorView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stopAnimation");

      -[CKConversationListCell typingIndicatorView](self, "typingIndicatorView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setHidden:", 0);

      -[CKConversationListCell typingIndicatorView](self, "typingIndicatorView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "startPulseAnimation");
    }
    else
    {
      -[CKConversationListCell typingIndicatorView](self, "typingIndicatorView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setHidden:", 1);

      -[CKConversationListCell typingIndicatorView](self, "typingIndicatorView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stopAnimation");

      -[CKConversationListCell summaryLabel](self, "summaryLabel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setHidden:", 0);
    }

  }
}

- (UILayoutGuide)firstLineLayoutGuide
{
  return self->_firstLineLayoutGuide;
}

- (void)setFirstLineLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_firstLineLayoutGuide, a3);
}

- (NSLayoutConstraint)editingDependentConstraint
{
  return self->_editingDependentConstraint;
}

- (void)setEditingDependentConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_editingDependentConstraint, a3);
}

- (NSArray)contentSizeCategoryDependentConstraints
{
  return self->_contentSizeCategoryDependentConstraints;
}

- (void)setContentSizeCategoryDependentConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_contentSizeCategoryDependentConstraints, a3);
}

- (NSTextAttachment)unreadIndicatorAttachment
{
  return self->_unreadIndicatorAttachment;
}

- (void)setUnreadIndicatorAttachment:(id)a3
{
  objc_storeStrong((id *)&self->_unreadIndicatorAttachment, a3);
}

- (NSArray)indicatorTextAttachments
{
  return self->_indicatorTextAttachments;
}

- (void)setIndicatorTextAttachments:(id)a3
{
  objc_storeStrong((id *)&self->_indicatorTextAttachments, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indicatorTextAttachments, 0);
  objc_storeStrong((id *)&self->_unreadIndicatorAttachment, 0);
  objc_storeStrong((id *)&self->_contentSizeCategoryDependentConstraints, 0);
  objc_storeStrong((id *)&self->_editingDependentConstraint, 0);
  objc_storeStrong((id *)&self->_firstLineLayoutGuide, 0);
}

@end

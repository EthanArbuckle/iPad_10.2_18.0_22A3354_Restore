@implementation CKDetailsTUConversationCell

- (CKDetailsTUConversationCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKDetailsTUConversationCell;
  return -[CKDetailsCell initWithStyle:reuseIdentifier:](&v5, sel_initWithStyle_reuseIdentifier_, a3, a4);
}

- (CKDetailsTUConversationCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 conversation:(id)a5
{
  id v8;
  CKDetailsTUConversationCell *v9;
  CKDetailsTUConversationCell *v10;
  void *v11;
  objc_super v13;

  v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)CKDetailsTUConversationCell;
  v9 = -[CKDetailsCell initWithStyle:reuseIdentifier:](&v13, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v10 = v9;
  if (v9)
  {
    -[CKDetailsTUConversationCell setConversation:](v9, "setConversation:", v8);
    -[CKDetailsTUConversationCell setupView](v10, "setupView");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v10, sel__handleMultiWayStateChange_, *MEMORY[0x1E0D35410], 0);

  }
  return v10;
}

- (void)setupView
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  double v7;
  id v8;
  void *v9;
  double v10;
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
  double v29;
  double v30;
  void *v31;
  double v32;
  void *v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;

  v3 = objc_alloc_init(MEMORY[0x1E0CEA658]);
  -[CKDetailsTUConversationCell setIconView:](self, "setIconView:", v3);

  -[CKDetailsTUConversationCell iconView](self, "iconView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentMode:", 1);

  v5 = objc_alloc_init(MEMORY[0x1E0CEA700]);
  -[CKDetailsTUConversationCell setTitleLabel:](self, "setTitleLabel:", v5);

  -[CKDetailsTUConversationCell titleLabel](self, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = 1132068864;
  objc_msgSend(v6, "setContentCompressionResistancePriority:forAxis:", 0, v7);

  -[CKDetailsTUConversationCell formatTitle](self, "formatTitle");
  v8 = objc_alloc_init(MEMORY[0x1E0CEA700]);
  -[CKDetailsTUConversationCell setSubtitleLabel:](self, "setSubtitleLabel:", v8);

  -[CKDetailsTUConversationCell subtitleLabel](self, "subtitleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = 1132068864;
  objc_msgSend(v9, "setContentCompressionResistancePriority:forAxis:", 0, v10);

  -[CKDetailsTUConversationCell formatSubtitleForText](self, "formatSubtitleForText");
  objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsTUConversationCell setActionButton:](self, "setActionButton:", v11);

  -[CKDetailsTUConversationCell actionButton](self, "actionButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "titleLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setNumberOfLines:", 1);

  -[CKDetailsTUConversationCell actionButton](self, "actionButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "titleLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "tuConversationViewActionButtonFont");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFont:", v17);

  -[CKDetailsTUConversationCell actionButton](self, "actionButton");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  CKFrameworkBundle();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("JOIN"), &stru_1E276D870, CFSTR("ChatKit"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTitle:forState:", v20, 0);

  -[CKDetailsTUConversationCell actionButton](self, "actionButton");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addTarget:action:forControlEvents:", self, sel_actionButtonTapped_, 1);

  -[CKDetailsTUConversationCell actionButton](self, "actionButton");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[CKDetailsTUConversationCell actionButton](self, "actionButton");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setContentEdgeInsets:", 6.0, 17.0, 6.0, 17.0);

  -[CKDetailsTUConversationCell actionButton](self, "actionButton");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "sizeToFit");

  -[CKDetailsTUConversationCell actionButton](self, "actionButton");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "layer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v27, "isAccessibilityPreferredContentSizeCategory") & 1) != 0)
  {
    -[CKDetailsTUConversationCell actionButton](self, "actionButton");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "frame");
    v30 = v29 * 0.5;
  }
  else
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "tuConversationJoinButtonCornerRadius");
  }
  objc_msgSend(v26, "setCornerRadius:", v30);

  -[CKDetailsTUConversationCell actionButton](self, "actionButton");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v32) = 1148846080;
  objc_msgSend(v31, "setContentCompressionResistancePriority:forAxis:", 0, v32);

  -[CKDetailsTUConversationCell actionButton](self, "actionButton");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v34) = 1148846080;
  objc_msgSend(v33, "setContentHuggingPriority:forAxis:", 0, v34);

  -[CKDetailsTUConversationCell contentView](self, "contentView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsTUConversationCell titleLabel](self, "titleLabel");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "addSubview:", v36);

  -[CKDetailsTUConversationCell contentView](self, "contentView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsTUConversationCell subtitleLabel](self, "subtitleLabel");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addSubview:", v38);

  -[CKDetailsTUConversationCell contentView](self, "contentView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsTUConversationCell iconView](self, "iconView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "addSubview:", v40);

  -[CKDetailsTUConversationCell contentView](self, "contentView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsTUConversationCell actionButton](self, "actionButton");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "addSubview:", v42);

  -[CKDetailsTUConversationCell setClipsToBounds:](self, "setClipsToBounds:", 0);
  -[CKDetailsTUConversationCell updateView](self, "updateView");
  -[CKDetailsTUConversationCell addConstraints](self, "addConstraints");
}

- (void)addConstraints
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  int v12;
  uint64_t v13;
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
  void *v30;
  void *v31;
  void *v32;
  _QWORD *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
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
  _QWORD v102[14];
  _QWORD v103[16];

  v103[14] = *MEMORY[0x1E0C80C00];
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "detailsTUConversationDetailsSummaryImageDiameter");
  v5 = v4;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contactImageSize");
  v8 = (v7 - v5) * 0.5;
  if (CKMainScreenScale_once_88 != -1)
    dispatch_once(&CKMainScreenScale_once_88, &__block_literal_global_213);
  v9 = *(double *)&CKMainScreenScale_sMainScreenScale_88;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_88 == 0.0)
    v9 = 1.0;
  v10 = round(v8 * v9) / v9;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isAccessibilityPreferredContentSizeCategory");

  -[CKDetailsTUConversationCell iconView](self, "iconView");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "widthAnchor");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "constraintEqualToConstant:", v5);
  v13 = objc_claimAutoreleasedReturnValue();
  v99 = (void *)v13;
  if (v12)
  {
    v103[0] = v13;
    -[CKDetailsTUConversationCell iconView](self, "iconView");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "heightAnchor");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "constraintEqualToConstant:", v5);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v103[1] = v96;
    -[CKDetailsTUConversationCell iconView](self, "iconView");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "leadingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsTUConversationCell layoutMarginsGuide](self, "layoutMarginsGuide");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "leadingAnchor");
    v94 = v14;
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:constant:", v10);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v103[2] = v91;
    -[CKDetailsTUConversationCell iconView](self, "iconView");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "topAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsTUConversationCell layoutMarginsGuide](self, "layoutMarginsGuide");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "topAnchor");
    v89 = v15;
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v103[3] = v86;
    -[CKDetailsTUConversationCell titleLabel](self, "titleLabel");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "leadingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsTUConversationCell layoutMarginsGuide](self, "layoutMarginsGuide");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "leadingAnchor");
    v84 = v16;
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:constant:", v10);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v103[4] = v81;
    -[CKDetailsTUConversationCell titleLabel](self, "titleLabel");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "topAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsTUConversationCell iconView](self, "iconView");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "bottomAnchor");
    v79 = v17;
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v103[5] = v76;
    -[CKDetailsTUConversationCell titleLabel](self, "titleLabel");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "widthAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsTUConversationCell layoutMarginsGuide](self, "layoutMarginsGuide");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "widthAnchor");
    v74 = v18;
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v103[6] = v71;
    -[CKDetailsTUConversationCell subtitleLabel](self, "subtitleLabel");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "leadingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsTUConversationCell layoutMarginsGuide](self, "layoutMarginsGuide");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "leadingAnchor");
    v69 = v19;
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:constant:", v10);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v103[7] = v66;
    -[CKDetailsTUConversationCell subtitleLabel](self, "subtitleLabel");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "topAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsTUConversationCell titleLabel](self, "titleLabel");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "bottomAnchor");
    v64 = v20;
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v103[8] = v61;
    -[CKDetailsTUConversationCell subtitleLabel](self, "subtitleLabel");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "widthAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsTUConversationCell layoutMarginsGuide](self, "layoutMarginsGuide");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "widthAnchor");
    v59 = v21;
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v103[9] = v56;
    -[CKDetailsTUConversationCell actionButton](self, "actionButton");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "leadingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsTUConversationCell layoutMarginsGuide](self, "layoutMarginsGuide");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "leadingAnchor");
    v54 = v22;
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:constant:", v10);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v103[10] = v51;
    -[CKDetailsTUConversationCell actionButton](self, "actionButton");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "topAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsTUConversationCell subtitleLabel](self, "subtitleLabel");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "bottomAnchor");
    v49 = v23;
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v103[11] = v24;
    -[CKDetailsTUConversationCell actionButton](self, "actionButton");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "heightAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "tuConversationJoinButtonHeight");
    objc_msgSend(v26, "constraintGreaterThanOrEqualToConstant:");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v103[12] = v28;
    -[CKDetailsTUConversationCell actionButton](self, "actionButton");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "widthAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "tuConversationJoinButtonMinWidth");
    objc_msgSend(v30, "constraintGreaterThanOrEqualToConstant:");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v103[13] = v32;
    v33 = v103;
  }
  else
  {
    v102[0] = v13;
    -[CKDetailsTUConversationCell iconView](self, "iconView");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "heightAnchor");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "constraintEqualToConstant:", v5);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v102[1] = v96;
    -[CKDetailsTUConversationCell iconView](self, "iconView");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "leadingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsTUConversationCell layoutMarginsGuide](self, "layoutMarginsGuide");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "leadingAnchor");
    v94 = v34;
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:constant:", v10);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v102[2] = v91;
    -[CKDetailsTUConversationCell iconView](self, "iconView");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "centerYAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsTUConversationCell layoutMarginsGuide](self, "layoutMarginsGuide");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "centerYAnchor");
    v89 = v35;
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v102[3] = v86;
    -[CKDetailsTUConversationCell titleLabel](self, "titleLabel");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "leadingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsTUConversationCell iconView](self, "iconView");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "trailingAnchor");
    v37 = objc_claimAutoreleasedReturnValue();
    -[CKDetailsTUConversationCell interitemSpacing](self, "interitemSpacing");
    v84 = v36;
    v82 = (void *)v37;
    objc_msgSend(v36, "constraintEqualToAnchor:constant:", v37);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v102[4] = v81;
    -[CKDetailsTUConversationCell titleLabel](self, "titleLabel");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "bottomAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsTUConversationCell layoutMarginsGuide](self, "layoutMarginsGuide");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "centerYAnchor");
    v79 = v38;
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v102[5] = v76;
    -[CKDetailsTUConversationCell subtitleLabel](self, "subtitleLabel");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "leadingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsTUConversationCell titleLabel](self, "titleLabel");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "leadingAnchor");
    v74 = v39;
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v102[6] = v71;
    -[CKDetailsTUConversationCell subtitleLabel](self, "subtitleLabel");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "trailingAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsTUConversationCell titleLabel](self, "titleLabel");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "trailingAnchor");
    v69 = v40;
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v102[7] = v66;
    -[CKDetailsTUConversationCell subtitleLabel](self, "subtitleLabel");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "topAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsTUConversationCell titleLabel](self, "titleLabel");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "bottomAnchor");
    v64 = v41;
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v102[8] = v61;
    -[CKDetailsTUConversationCell actionButton](self, "actionButton");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "centerYAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsTUConversationCell layoutMarginsGuide](self, "layoutMarginsGuide");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "centerYAnchor");
    v59 = v42;
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v102[9] = v56;
    -[CKDetailsTUConversationCell actionButton](self, "actionButton");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "leadingAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsTUConversationCell titleLabel](self, "titleLabel");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "trailingAnchor");
    v44 = objc_claimAutoreleasedReturnValue();
    -[CKDetailsTUConversationCell interitemSpacing](self, "interitemSpacing");
    v54 = v43;
    v52 = (void *)v44;
    objc_msgSend(v43, "constraintEqualToAnchor:constant:", v44);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v102[10] = v51;
    -[CKDetailsTUConversationCell actionButton](self, "actionButton");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "trailingAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsTUConversationCell layoutMarginsGuide](self, "layoutMarginsGuide");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "trailingAnchor");
    v49 = v45;
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToAnchor:");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v102[11] = v24;
    -[CKDetailsTUConversationCell actionButton](self, "actionButton");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "heightAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "tuConversationJoinButtonHeight");
    objc_msgSend(v26, "constraintEqualToConstant:");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v102[12] = v28;
    -[CKDetailsTUConversationCell actionButton](self, "actionButton");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "widthAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "tuConversationJoinButtonMinWidth");
    objc_msgSend(v30, "constraintGreaterThanOrEqualToConstant:");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v102[13] = v32;
    v33 = v102;
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 14);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v46);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  int v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[CKDetailsTUConversationCell contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutMarginsGuide");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutFrame");
  v9 = v8;

  -[CKDetailsTUConversationCell titleLabel](self, "titleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sizeThatFits:", width, height);
  v12 = v11;

  -[CKDetailsTUConversationCell layoutMargins](self, "layoutMargins");
  v14 = v12 + v13;
  -[CKDetailsTUConversationCell layoutMargins](self, "layoutMargins");
  v16 = v14 + v15;
  -[CKDetailsTUConversationCell subtitleLabel](self, "subtitleLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[CKDetailsTUConversationCell subtitleLabel](self, "subtitleLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "sizeThatFits:", width, height);
    v16 = v16 + v19;

  }
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "isAccessibilityPreferredContentSizeCategory");

  if (v21)
  {
    -[CKDetailsTUConversationCell iconView](self, "iconView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "bounds");
    v24 = v23;
    -[CKDetailsTUConversationCell actionButton](self, "actionButton");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "bounds");
    v27 = v24 + v26;
    -[CKDetailsTUConversationCell layoutMargins](self, "layoutMargins");
    v29 = v28 + v27;
    -[CKDetailsTUConversationCell layoutMargins](self, "layoutMargins");
    v16 = v16 + v30 + v29;

  }
  v31 = v9;
  v32 = v16;
  result.height = v32;
  result.width = v31;
  return result;
}

- (void)setConversation:(id)a3
{
  objc_storeStrong((id *)&self->_conversation, a3);
  -[CKDetailsTUConversationCell updateView](self, "updateView");
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
  -[CKDetailsTUConversationCell configureIconView](self, "configureIconView");
  -[CKDetailsTUConversationCell formatTitle](self, "formatTitle");
  -[CKDetailsTUConversationCell configureSubtitle](self, "configureSubtitle");
  -[CKDetailsTUConversationCell configureActionButton](self, "configureActionButton");
  -[CKDetailsTUConversationCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)configureIconView
{
  unint64_t state;

  state = self->_state;
  if (state - 3 >= 2
    && (state
     || !objc_msgSend(MEMORY[0x1E0D35818], "activeTUConversationHasActivitySession:", self->_conversation)))
  {
    -[CKDetailsTUConversationCell formatIconViewForFaceTime](self, "formatIconViewForFaceTime");
  }
  else
  {
    -[CKDetailsTUConversationCell formatIconViewForExpanse](self, "formatIconViewForExpanse");
  }
}

- (void)configureSubtitle
{
  unint64_t state;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  -[CKDetailsTUConversationCell formatSubtitleForText](self, "formatSubtitleForText");
  state = self->_state;
  if (state - 1 >= 4)
  {
    if (state)
      return;
    -[CKDetailsTUConversationCell subtitleLabel](self, "subtitleLabel");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    CKFrameworkBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("CALL_ENDED"), &stru_1E276D870, CFSTR("ChatKit"));
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CKDetailsTUConversationCell subtitleLabel](self, "subtitleLabel");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[CKDetailsTUConversationCell conversation](self, "conversation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKTUConversationViewUtilities joinStateStatusStringForTUConversation:](CKTUConversationViewUtilities, "joinStateStatusStringForTUConversation:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;
  objc_msgSend(v7, "setText:", v5);

}

- (void)configureActionButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  switch(self->_state)
  {
    case 0uLL:
      -[CKDetailsTUConversationCell actionButton](self, "actionButton");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setHidden:", 1);
      goto LABEL_6;
    case 1uLL:
    case 3uLL:
      -[CKDetailsTUConversationCell actionButton](self, "actionButton");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setHidden:", 0);

      -[CKDetailsTUConversationCell actionButton](self, "actionButton");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "theme");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "multiwayButtonColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setBackgroundColor:", v7);

      -[CKDetailsTUConversationCell actionButton](self, "actionButton");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      CKFrameworkBundle();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = CFSTR("JOIN");
      goto LABEL_4;
    case 2uLL:
    case 4uLL:
      -[CKDetailsTUConversationCell actionButton](self, "actionButton");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setHidden:", 0);

      -[CKDetailsTUConversationCell actionButton](self, "actionButton");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA478], "systemRedColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setBackgroundColor:", v13);

      -[CKDetailsTUConversationCell actionButton](self, "actionButton");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      CKFrameworkBundle();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = CFSTR("LEAVE");
LABEL_4:
      objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_1E276D870, CFSTR("ChatKit"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setTitle:forState:", v14, 0);

LABEL_6:
      break;
    default:
      return;
  }
}

+ (id)reuseIdentifier
{
  return CFSTR("ExpanseGroupMembershipCell_reuseIdentifier");
}

- (void)actionButtonTapped:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  if (-[CKDetailsTUConversationCell state](self, "state", a3) == 1
    || -[CKDetailsTUConversationCell state](self, "state") == 3)
  {
    if (_IMWillLog())
      _IMAlwaysLog();
    v4 = (void *)MEMORY[0x1E0D35818];
    -[CKDetailsTUConversationCell conversation](self, "conversation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "conversationIsVideoCall:", v5);

    if ((_DWORD)v6)
      v7 = objc_msgSend(MEMORY[0x1E0D35818], "platformSupportsStagingArea");
    else
      v7 = 0;
    v8 = (void *)MEMORY[0x1E0D35818];
    -[CKDetailsTUConversationCell conversation](self, "conversation");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "joinExistingConversationForTUCoversation:videoEnabled:wantsStagingArea:", v9, v6, v7);

  }
  else if (-[CKDetailsTUConversationCell state](self, "state") == 2
         || -[CKDetailsTUConversationCell state](self, "state") == 4)
  {
    if (_IMWillLog())
      _IMAlwaysLog();
    objc_msgSend(MEMORY[0x1E0D35818], "leaveTUConversation");
    -[CKDetailsTUConversationCell updateView](self, "updateView");
  }
}

- (void)_handleMultiWayStateChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D35408]);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D35798], "sharedRegistry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "existingConversationForTelephonyConversationUUID:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKDetailsTUConversationCell setConversation:](self, "setConversation:", v6);
}

- (void)updateView
{
  void *v3;

  -[CKDetailsTUConversationCell conversation](self, "conversation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsTUConversationCell setState:](self, "setState:", +[CKTUConversationViewUtilities ckTUConversationStateForTUConversation:](CKTUConversationViewUtilities, "ckTUConversationStateForTUConversation:", v3));

  -[CKDetailsTUConversationCell setNeedsLayout](self, "setNeedsLayout");
  -[CKDetailsTUConversationCell layoutIfNeeded](self, "layoutIfNeeded");
}

- (void)formatIconViewForFaceTime
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
  id v12;

  -[CKDetailsTUConversationCell iconView](self, "iconView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsTUConversationCell conversation](self, "conversation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKTUConversationViewUtilities faceTimeIconForTUConversation:](CKTUConversationViewUtilities, "faceTimeIconForTUConversation:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", v5);

  -[CKDetailsTUConversationCell iconView](self, "iconView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", 0);

  -[CKDetailsTUConversationCell iconView](self, "iconView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "theme");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "expanseActivityViewIconTintColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTintColor:", v10);

  -[CKDetailsTUConversationCell iconView](self, "iconView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_setCornerRadius:", 0.0);

  -[CKDetailsTUConversationCell iconView](self, "iconView");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

}

- (void)formatIconViewForExpanse
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
  id v12;

  -[CKDetailsTUConversationCell iconView](self, "iconView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKTUConversationViewUtilities sharePlayIcon](CKTUConversationViewUtilities, "sharePlayIcon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", v4);

  -[CKDetailsTUConversationCell iconView](self, "iconView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", 0);

  -[CKDetailsTUConversationCell iconView](self, "iconView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "theme");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "expanseActivityViewIconTintColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTintColor:", v9);

  -[CKDetailsTUConversationCell iconView](self, "iconView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_setCornerRadius:", 0.0);

  -[CKDetailsTUConversationCell iconView](self, "iconView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[CKDetailsTUConversationCell iconView](self, "iconView");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBackgroundColor:", 0);

}

- (void)formatTitle
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;

  -[CKDetailsTUConversationCell titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recipientNameFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v5);

  -[CKDetailsTUConversationCell titleLabel](self, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "theme");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "primaryLabelColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextColor:", v9);

  -[CKDetailsTUConversationCell titleLabel](self, "titleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setNumberOfLines:", 1);

  -[CKDetailsTUConversationCell titleLabel](self, "titleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setLineBreakMode:", 4);

  -[CKDetailsTUConversationCell conversation](self, "conversation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKTUConversationViewUtilities titleForAVMode:](CKTUConversationViewUtilities, "titleForAVMode:", objc_msgSend(v12, "avMode"));
  v19 = (id)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0D35818];
  -[CKDetailsTUConversationCell conversation](self, "conversation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v13) = objc_msgSend(v13, "activeTUConversationHasActivitySession:", v14);

  if ((_DWORD)v13)
  {
    CKFrameworkBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("EXPANSE_DEFAULT"), &stru_1E276D870, CFSTR("ChatKit"));
    v16 = objc_claimAutoreleasedReturnValue();

    v19 = (id)v16;
  }
  -[CKDetailsTUConversationCell titleLabel](self, "titleLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setText:", v19);

  -[CKDetailsTUConversationCell titleLabel](self, "titleLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

}

- (void)formatSubtitleForText
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
  id v12;

  -[CKDetailsTUConversationCell subtitleLabel](self, "subtitleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNumberOfLines:", 1);

  -[CKDetailsTUConversationCell subtitleLabel](self, "subtitleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLineBreakMode:", 4);

  -[CKDetailsTUConversationCell subtitleLabel](self, "subtitleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "locationSubtitleFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v7);

  -[CKDetailsTUConversationCell subtitleLabel](self, "subtitleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "theme");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "secondaryLabelColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextColor:", v11);

  -[CKDetailsTUConversationCell subtitleLabel](self, "subtitleLabel");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

}

+ (BOOL)shouldHighlight
{
  return 0;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKDetailsTUConversationCell;
  -[CKDetailsCell layoutSubviews](&v6, sel_layoutSubviews);
  -[CKDetailsCell topSeperator](self, "topSeperator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

  -[CKDetailsCell bottomSeperator](self, "bottomSeperator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserInteractionEnabled:", 1);

  -[CKDetailsCell bottomSeperator](self, "bottomSeperator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", 0);

}

- (double)insetPadding
{
  void *v2;
  double v3;
  double v4;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tuConversationInsetPadding");
  v4 = v3;

  return v4;
}

- (double)buttonInteritemSpacing
{
  void *v2;
  double v3;
  double v4;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tuConversationButtonInteritemSpacing");
  v4 = v3;

  return v4;
}

- (double)interitemSpacing
{
  void *v2;
  double v3;
  double v4;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tuConversationInteritemSpacing");
  v4 = v3;

  return v4;
}

- (double)buttonTitleHorizontalSpacing
{
  void *v2;
  double v3;
  double v4;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tuConversationButtonTitleHorizontalSpacing");
  v4 = v3;

  return v4;
}

- (double)buttonTitleVerticalSpacing
{
  void *v2;
  double v3;
  double v4;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tuConversationButtonTitleVerticalSpacing");
  v4 = v3;

  return v4;
}

- (TUConversation)conversation
{
  return self->_conversation;
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

- (UIImageView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
  objc_storeStrong((id *)&self->_iconView, a3);
}

- (UIButton)actionButton
{
  return self->_actionButton;
}

- (void)setActionButton:(id)a3
{
  objc_storeStrong((id *)&self->_actionButton, a3);
}

- (unint64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_conversation, 0);
}

@end

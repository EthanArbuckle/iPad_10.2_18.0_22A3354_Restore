@implementation CKDetailsTUConversationCell

- (CKDetailsTUConversationCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKDetailsTUConversationCell;
  return -[CKDetailsTUConversationCell initWithStyle:reuseIdentifier:](&v5, "initWithStyle:reuseIdentifier:", a3, a4);
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
  v9 = -[CKDetailsTUConversationCell initWithStyle:reuseIdentifier:](&v13, "initWithStyle:reuseIdentifier:", a3, a4);
  v10 = v9;
  if (v9)
  {
    -[CKDetailsTUConversationCell setConversation:](v9, "setConversation:", v8);
    -[CKDetailsTUConversationCell setupView](v10, "setupView");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v11, "addObserver:selector:name:object:", v10, "_handleMultiWayStateChange:", IMChatMultiWayStateChangedNotification, 0);

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
  uint64_t v19;
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
  double v31;
  void *v32;
  double v33;
  void *v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;

  v3 = objc_alloc_init((Class)UIImageView);
  -[CKDetailsTUConversationCell setIconView:](self, "setIconView:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell iconView](self, "iconView"));
  objc_msgSend(v4, "setContentMode:", 1);

  v5 = objc_alloc_init((Class)UILabel);
  -[CKDetailsTUConversationCell setTitleLabel:](self, "setTitleLabel:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell titleLabel](self, "titleLabel"));
  LODWORD(v7) = 1132068864;
  objc_msgSend(v6, "setContentCompressionResistancePriority:forAxis:", 0, v7);

  -[CKDetailsTUConversationCell formatTitle](self, "formatTitle");
  v8 = objc_alloc_init((Class)UILabel);
  -[CKDetailsTUConversationCell setSubtitleLabel:](self, "setSubtitleLabel:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell subtitleLabel](self, "subtitleLabel"));
  LODWORD(v10) = 1132068864;
  objc_msgSend(v9, "setContentCompressionResistancePriority:forAxis:", 0, v10);

  -[CKDetailsTUConversationCell formatSubtitleForText](self, "formatSubtitleForText");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
  -[CKDetailsTUConversationCell setActionButton:](self, "setActionButton:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell actionButton](self, "actionButton"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "titleLabel"));
  objc_msgSend(v13, "setNumberOfLines:", 1);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell actionButton](self, "actionButton"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "titleLabel"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "tuConversationViewActionButtonFont"));
  objc_msgSend(v15, "setFont:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell actionButton](self, "actionButton"));
  v19 = CKFrameworkBundle();
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("JOIN"), &stru_100031270, CFSTR("ChatKit")));
  objc_msgSend(v18, "setTitle:forState:", v21, 0);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell actionButton](self, "actionButton"));
  objc_msgSend(v22, "addTarget:action:forControlEvents:", self, "actionButtonTapped:", 1);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell actionButton](self, "actionButton"));
  objc_msgSend(v23, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell actionButton](self, "actionButton"));
  objc_msgSend(v24, "setContentEdgeInsets:", 6.0, 17.0, 6.0, 17.0);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell actionButton](self, "actionButton"));
  objc_msgSend(v25, "sizeToFit");

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell actionButton](self, "actionButton"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "layer"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors"));
  if ((objc_msgSend(v28, "isAccessibilityPreferredContentSizeCategory") & 1) != 0)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell actionButton](self, "actionButton"));
    objc_msgSend(v29, "frame");
    v31 = v30 * 0.5;
  }
  else
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors"));
    objc_msgSend(v29, "tuConversationJoinButtonCornerRadius");
  }
  objc_msgSend(v27, "setCornerRadius:", v31);

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell actionButton](self, "actionButton"));
  LODWORD(v33) = 1148846080;
  objc_msgSend(v32, "setContentCompressionResistancePriority:forAxis:", 0, v33);

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell actionButton](self, "actionButton"));
  LODWORD(v35) = 1148846080;
  objc_msgSend(v34, "setContentHuggingPriority:forAxis:", 0, v35);

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell contentView](self, "contentView"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell titleLabel](self, "titleLabel"));
  objc_msgSend(v36, "addSubview:", v37);

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell contentView](self, "contentView"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v38, "addSubview:", v39);

  v40 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell contentView](self, "contentView"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell iconView](self, "iconView"));
  objc_msgSend(v40, "addSubview:", v41);

  v42 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell contentView](self, "contentView"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell actionButton](self, "actionButton"));
  objc_msgSend(v42, "addSubview:", v43);

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
  unsigned int v12;
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
  _QWORD v103[14];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors"));
  objc_msgSend(v3, "detailsTUConversationDetailsSummaryImageDiameter");
  v5 = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors"));
  objc_msgSend(v6, "contactImageSize");
  v8 = (v7 - v5) * 0.5;
  if (qword_10003AE48 != -1)
    dispatch_once(&qword_10003AE48, &stru_100030A08);
  v9 = *(double *)&qword_10003AE40;
  if (*(double *)&qword_10003AE40 == 0.0)
    v9 = 1.0;
  v10 = round(v8 * v9) / v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors"));
  v12 = objc_msgSend(v11, "isAccessibilityPreferredContentSizeCategory");

  v101 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell iconView](self, "iconView"));
  v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "widthAnchor"));
  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "constraintEqualToConstant:", v5));
  v99 = (void *)v13;
  if (v12)
  {
    v103[0] = v13;
    v98 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell iconView](self, "iconView"));
    v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "heightAnchor"));
    v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "constraintEqualToConstant:", v5));
    v103[1] = v96;
    v95 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell iconView](self, "iconView"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "leadingAnchor"));
    v93 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell layoutMarginsGuide](self, "layoutMarginsGuide"));
    v94 = v14;
    v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "leadingAnchor"));
    v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:constant:", v10));
    v103[2] = v91;
    v90 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell iconView](self, "iconView"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "topAnchor"));
    v88 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell layoutMarginsGuide](self, "layoutMarginsGuide"));
    v89 = v15;
    v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "topAnchor"));
    v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:"));
    v103[3] = v86;
    v85 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell titleLabel](self, "titleLabel"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "leadingAnchor"));
    v83 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell layoutMarginsGuide](self, "layoutMarginsGuide"));
    v84 = v16;
    v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "leadingAnchor"));
    v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:constant:", v10));
    v103[4] = v81;
    v80 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell titleLabel](self, "titleLabel"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "topAnchor"));
    v78 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell iconView](self, "iconView"));
    v79 = v17;
    v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "bottomAnchor"));
    v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:"));
    v103[5] = v76;
    v75 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell titleLabel](self, "titleLabel"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "widthAnchor"));
    v73 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell layoutMarginsGuide](self, "layoutMarginsGuide"));
    v74 = v18;
    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "widthAnchor"));
    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:"));
    v103[6] = v71;
    v70 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell subtitleLabel](self, "subtitleLabel"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "leadingAnchor"));
    v68 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell layoutMarginsGuide](self, "layoutMarginsGuide"));
    v69 = v19;
    v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "leadingAnchor"));
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:constant:", v10));
    v103[7] = v66;
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell subtitleLabel](self, "subtitleLabel"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "topAnchor"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell titleLabel](self, "titleLabel"));
    v64 = v20;
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "bottomAnchor"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:"));
    v103[8] = v61;
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell subtitleLabel](self, "subtitleLabel"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "widthAnchor"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell layoutMarginsGuide](self, "layoutMarginsGuide"));
    v59 = v21;
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "widthAnchor"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:"));
    v103[9] = v56;
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell actionButton](self, "actionButton"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "leadingAnchor"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell layoutMarginsGuide](self, "layoutMarginsGuide"));
    v54 = v22;
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "leadingAnchor"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:constant:", v10));
    v103[10] = v51;
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell actionButton](self, "actionButton"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "topAnchor"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell subtitleLabel](self, "subtitleLabel"));
    v49 = v23;
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "bottomAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:"));
    v103[11] = v24;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell actionButton](self, "actionButton"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "heightAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors"));
    objc_msgSend(v27, "tuConversationJoinButtonHeight");
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintGreaterThanOrEqualToConstant:"));
    v103[12] = v28;
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell actionButton](self, "actionButton"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "widthAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors"));
    objc_msgSend(v31, "tuConversationJoinButtonMinWidth");
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintGreaterThanOrEqualToConstant:"));
    v103[13] = v32;
    v33 = v103;
  }
  else
  {
    v102[0] = v13;
    v98 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell iconView](self, "iconView"));
    v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "heightAnchor"));
    v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "constraintEqualToConstant:", v5));
    v102[1] = v96;
    v95 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell iconView](self, "iconView"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "leadingAnchor"));
    v93 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell layoutMarginsGuide](self, "layoutMarginsGuide"));
    v94 = v34;
    v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "leadingAnchor"));
    v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:constant:", v10));
    v102[2] = v91;
    v90 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell iconView](self, "iconView"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "centerYAnchor"));
    v88 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell layoutMarginsGuide](self, "layoutMarginsGuide"));
    v89 = v35;
    v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "centerYAnchor"));
    v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:"));
    v102[3] = v86;
    v85 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell titleLabel](self, "titleLabel"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "leadingAnchor"));
    v83 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell iconView](self, "iconView"));
    v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "trailingAnchor"));
    -[CKDetailsTUConversationCell interitemSpacing](self, "interitemSpacing");
    v84 = v36;
    v82 = (void *)v37;
    v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:constant:", v37));
    v102[4] = v81;
    v80 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell titleLabel](self, "titleLabel"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "bottomAnchor"));
    v78 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell layoutMarginsGuide](self, "layoutMarginsGuide"));
    v79 = v38;
    v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "centerYAnchor"));
    v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:"));
    v102[5] = v76;
    v75 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell subtitleLabel](self, "subtitleLabel"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "leadingAnchor"));
    v73 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell titleLabel](self, "titleLabel"));
    v74 = v39;
    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "leadingAnchor"));
    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:"));
    v102[6] = v71;
    v70 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell subtitleLabel](self, "subtitleLabel"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "trailingAnchor"));
    v68 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell titleLabel](self, "titleLabel"));
    v69 = v40;
    v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "trailingAnchor"));
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:"));
    v102[7] = v66;
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell subtitleLabel](self, "subtitleLabel"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "topAnchor"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell titleLabel](self, "titleLabel"));
    v64 = v41;
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "bottomAnchor"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:"));
    v102[8] = v61;
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell actionButton](self, "actionButton"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "centerYAnchor"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell layoutMarginsGuide](self, "layoutMarginsGuide"));
    v59 = v42;
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "centerYAnchor"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:"));
    v102[9] = v56;
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell actionButton](self, "actionButton"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "leadingAnchor"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell titleLabel](self, "titleLabel"));
    v44 = objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "trailingAnchor"));
    -[CKDetailsTUConversationCell interitemSpacing](self, "interitemSpacing");
    v54 = v43;
    v52 = (void *)v44;
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:constant:", v44));
    v102[10] = v51;
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell actionButton](self, "actionButton"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "trailingAnchor"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell layoutMarginsGuide](self, "layoutMarginsGuide"));
    v49 = v45;
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "trailingAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintEqualToAnchor:"));
    v102[11] = v24;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell actionButton](self, "actionButton"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "heightAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors"));
    objc_msgSend(v27, "tuConversationJoinButtonHeight");
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToConstant:"));
    v102[12] = v28;
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell actionButton](self, "actionButton"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "widthAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors"));
    objc_msgSend(v31, "tuConversationJoinButtonMinWidth");
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintGreaterThanOrEqualToConstant:"));
    v102[13] = v32;
    v33 = v102;
  }
  v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v33, 14));

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v46);
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
  unsigned int v21;
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
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell contentView](self, "contentView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layoutMarginsGuide"));
  objc_msgSend(v7, "layoutFrame");
  v9 = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell titleLabel](self, "titleLabel"));
  objc_msgSend(v10, "sizeThatFits:", width, height);
  v12 = v11;

  -[CKDetailsTUConversationCell layoutMargins](self, "layoutMargins");
  v14 = v12 + v13;
  -[CKDetailsTUConversationCell layoutMargins](self, "layoutMargins");
  v16 = v14 + v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell subtitleLabel](self, "subtitleLabel"));

  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell subtitleLabel](self, "subtitleLabel"));
    objc_msgSend(v18, "sizeThatFits:", width, height);
    v16 = v16 + v19;

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors"));
  v21 = objc_msgSend(v20, "isAccessibilityPreferredContentSizeCategory");

  if (v21)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell iconView](self, "iconView"));
    objc_msgSend(v22, "bounds");
    v24 = v23;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell actionButton](self, "actionButton"));
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
     || !+[IMFaceTimeUtilities activeTUConversationHasActivitySession:](IMFaceTimeUtilities, "activeTUConversationHasActivitySession:", self->_conversation)))
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
  uint64_t v6;
  void *v7;
  id v8;

  -[CKDetailsTUConversationCell formatSubtitleForText](self, "formatSubtitleForText");
  state = self->_state;
  if (state - 1 >= 4)
  {
    if (state)
      return;
    v8 = (id)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell subtitleLabel](self, "subtitleLabel"));
    v6 = CKFrameworkBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("CALL_ENDED"), &stru_100031270, CFSTR("ChatKit")));
  }
  else
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell subtitleLabel](self, "subtitleLabel"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell conversation](self, "conversation"));
    v5 = objc_claimAutoreleasedReturnValue(+[CKTUConversationViewUtilities joinStateStatusStringForTUConversation:](CKTUConversationViewUtilities, "joinStateStatusStringForTUConversation:", v4));
  }
  v7 = (void *)v5;
  objc_msgSend(v8, "setText:", v5);

}

- (void)configureActionButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;

  switch(self->_state)
  {
    case 0uLL:
      v17 = (id)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell actionButton](self, "actionButton"));
      objc_msgSend(v17, "setHidden:", 1);
      goto LABEL_6;
    case 1uLL:
    case 3uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell actionButton](self, "actionButton"));
      objc_msgSend(v3, "setHidden:", 0);

      v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell actionButton](self, "actionButton"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "theme"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "multiwayButtonColor"));
      objc_msgSend(v4, "setBackgroundColor:", v7);

      v17 = (id)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell actionButton](self, "actionButton"));
      v8 = CKFrameworkBundle();
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v10 = v9;
      v11 = CFSTR("JOIN");
      goto LABEL_4;
    case 2uLL:
    case 4uLL:
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell actionButton](self, "actionButton"));
      objc_msgSend(v12, "setHidden:", 0);

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell actionButton](self, "actionButton"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
      objc_msgSend(v13, "setBackgroundColor:", v14);

      v17 = (id)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell actionButton](self, "actionButton"));
      v15 = CKFrameworkBundle();
      v9 = (void *)objc_claimAutoreleasedReturnValue(v15);
      v10 = v9;
      v11 = CFSTR("LEAVE");
LABEL_4:
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", v11, &stru_100031270, CFSTR("ChatKit")));
      objc_msgSend(v17, "setTitle:forState:", v16, 0);

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
  id v5;
  id v6;
  id v7;

  if ((id)-[CKDetailsTUConversationCell state](self, "state", a3) == (id)1
    || (id)-[CKDetailsTUConversationCell state](self, "state") == (id)3)
  {
    if (_IMWillLog(CFSTR("CKDetailsTUConversationCell")))
      _IMAlwaysLog(0, CFSTR("CKDetailsTUConversationCell"), CFSTR("actionButtonTapped joining existing conversation"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell conversation](self, "conversation"));
    v5 = +[IMFaceTimeUtilities conversationIsVideoCall:](IMFaceTimeUtilities, "conversationIsVideoCall:", v4);

    if ((_DWORD)v5)
      v6 = +[IMFaceTimeUtilities platformSupportsStagingArea](IMFaceTimeUtilities, "platformSupportsStagingArea");
    else
      v6 = 0;
    v7 = (id)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell conversation](self, "conversation"));
    +[IMFaceTimeUtilities joinExistingConversationForTUCoversation:videoEnabled:wantsStagingArea:](IMFaceTimeUtilities, "joinExistingConversationForTUCoversation:videoEnabled:wantsStagingArea:", v7, v5, v6);

  }
  else if ((id)-[CKDetailsTUConversationCell state](self, "state") == (id)2
         || (id)-[CKDetailsTUConversationCell state](self, "state") == (id)4)
  {
    if (_IMWillLog(CFSTR("CKDetailsTUConversationCell")))
      _IMAlwaysLog(0, CFSTR("CKDetailsTUConversationCell"), CFSTR("actionButtonTapped leaving active TUConversation"));
    +[IMFaceTimeUtilities leaveTUConversation](IMFaceTimeUtilities, "leaveTUConversation");
    -[CKDetailsTUConversationCell updateView](self, "updateView");
  }
}

- (void)_handleMultiWayStateChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", IMChatMultiWayMessagesConversationUUID));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[IMChatRegistry sharedRegistry](IMChatRegistry, "sharedRegistry"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "existingConversationForTelephonyConversationUUID:", v7));

  -[CKDetailsTUConversationCell setConversation:](self, "setConversation:", v6);
}

- (void)updateView
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell conversation](self, "conversation"));
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell iconView](self, "iconView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell conversation](self, "conversation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CKTUConversationViewUtilities faceTimeIconForTUConversation:](CKTUConversationViewUtilities, "faceTimeIconForTUConversation:", v4));
  objc_msgSend(v3, "setImage:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell iconView](self, "iconView"));
  objc_msgSend(v6, "setBackgroundColor:", 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell iconView](self, "iconView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "theme"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "expanseActivityViewIconTintColor"));
  objc_msgSend(v7, "setTintColor:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell iconView](self, "iconView"));
  objc_msgSend(v11, "_setCornerRadius:", 0.0);

  v12 = (id)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell iconView](self, "iconView"));
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell iconView](self, "iconView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CKTUConversationViewUtilities sharePlayIcon](CKTUConversationViewUtilities, "sharePlayIcon"));
  objc_msgSend(v3, "setImage:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell iconView](self, "iconView"));
  objc_msgSend(v5, "setBackgroundColor:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell iconView](self, "iconView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "theme"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "expanseActivityViewIconTintColor"));
  objc_msgSend(v6, "setTintColor:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell iconView](self, "iconView"));
  objc_msgSend(v10, "_setCornerRadius:", 0.0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell iconView](self, "iconView"));
  objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v12 = (id)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell iconView](self, "iconView"));
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
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell titleLabel](self, "titleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recipientNameFont"));
  objc_msgSend(v3, "setFont:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell titleLabel](self, "titleLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "theme"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "primaryLabelColor"));
  objc_msgSend(v6, "setTextColor:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell titleLabel](self, "titleLabel"));
  objc_msgSend(v10, "setNumberOfLines:", 1);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell titleLabel](self, "titleLabel"));
  objc_msgSend(v11, "setLineBreakMode:", 4);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell conversation](self, "conversation"));
  v19 = (id)objc_claimAutoreleasedReturnValue(+[CKTUConversationViewUtilities titleForAVMode:](CKTUConversationViewUtilities, "titleForAVMode:", objc_msgSend(v12, "avMode")));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell conversation](self, "conversation"));
  LODWORD(v11) = +[IMFaceTimeUtilities activeTUConversationHasActivitySession:](IMFaceTimeUtilities, "activeTUConversationHasActivitySession:", v13);

  if ((_DWORD)v11)
  {
    v14 = CKFrameworkBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("EXPANSE_DEFAULT"), &stru_100031270, CFSTR("ChatKit")));

    v19 = (id)v16;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell titleLabel](self, "titleLabel"));
  objc_msgSend(v17, "setText:", v19);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell titleLabel](self, "titleLabel"));
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v3, "setNumberOfLines:", 1);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v4, "setLineBreakMode:", 4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell subtitleLabel](self, "subtitleLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "locationSubtitleFont"));
  objc_msgSend(v5, "setFont:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell subtitleLabel](self, "subtitleLabel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "theme"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "secondaryLabelColor"));
  objc_msgSend(v8, "setTextColor:", v11);

  v12 = (id)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell subtitleLabel](self, "subtitleLabel"));
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
  -[CKDetailsTUConversationCell layoutSubviews](&v6, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell topSeperator](self, "topSeperator"));
  objc_msgSend(v3, "setHidden:", 1);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell bottomSeperator](self, "bottomSeperator"));
  objc_msgSend(v4, "setUserInteractionEnabled:", 1);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKDetailsTUConversationCell bottomSeperator](self, "bottomSeperator"));
  objc_msgSend(v5, "setHidden:", 0);

}

- (double)insetPadding
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors"));
  objc_msgSend(v2, "tuConversationInsetPadding");
  v4 = v3;

  return v4;
}

- (double)buttonInteritemSpacing
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors"));
  objc_msgSend(v2, "tuConversationButtonInteritemSpacing");
  v4 = v3;

  return v4;
}

- (double)interitemSpacing
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors"));
  objc_msgSend(v2, "tuConversationInteritemSpacing");
  v4 = v3;

  return v4;
}

- (double)buttonTitleHorizontalSpacing
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors"));
  objc_msgSend(v2, "tuConversationButtonTitleHorizontalSpacing");
  v4 = v3;

  return v4;
}

- (double)buttonTitleVerticalSpacing
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors"));
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

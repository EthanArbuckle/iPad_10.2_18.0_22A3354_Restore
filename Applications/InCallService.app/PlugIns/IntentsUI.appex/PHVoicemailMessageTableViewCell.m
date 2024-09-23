@implementation PHVoicemailMessageTableViewCell

+ (UIEdgeInsets)separatorInsetForContentSizeCategory:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIEdgeInsets result;

  v4 = a3;
  objc_msgSend(a1, "unreadIndicatorImageViewLeadingLayoutConstraintConstantForContentSizeCategory:", v4);
  v6 = v5;
  objc_msgSend(a1, "unreadIndicatorImageViewWidthLayoutConstraintConstantForContentSizeCategory:", v4);
  v8 = v6 + v7;
  objc_msgSend(a1, "metadataViewLeadingLayoutConstraintConstantForContentSizeCategory:", v4);
  v10 = v9;

  v11 = v8 + v10;
  v12 = 0.0;
  v13 = 0.0;
  v14 = 0.0;
  result.right = v14;
  result.bottom = v13;
  result.left = v11;
  result.top = v12;
  return result;
}

+ (double)metadataViewLeadingLayoutConstraintConstantForContentSizeCategory:(id)a3
{
  return 11.0;
}

+ (double)metadataViewWithoutUnreadIndicatorImageViewLeadingLayoutConstraintConstant:(id)a3
{
  return 18.0;
}

+ (double)unreadIndicatorImageViewLeadingLayoutConstraintConstantForContentSizeCategory:(id)a3
{
  return 11.0;
}

+ (double)unreadIndicatorImageViewWidthLayoutConstraintConstantForContentSizeCategory:(id)a3
{
  return 12.0;
}

+ (id)reuseIdentifier
{
  return CFSTR("PHVoicemailMessageTableViewCell");
}

+ (double)marginWidth
{
  return 34.0;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  objc_super v8;

  v4 = a4;
  v5 = a3;
  if (-[PHVoicemailMessageTableViewCell isEditing](self, "isEditing") != a3)
  {
    v8.receiver = self;
    v8.super_class = (Class)PHVoicemailMessageTableViewCell;
    -[PHVoicemailMessageTableViewCell setEditing:animated:](&v8, "setEditing:animated:", v5, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell metadataView](self, "metadataView"));
    objc_msgSend(v7, "setEditing:", v5);

    if (v5)
    {
      -[PHVoicemailMessageTableViewCell setSelectionStyle:](self, "setSelectionStyle:", 3);
      -[PHVoicemailMessageTableViewCell setExpanded:animated:](self, "setExpanded:animated:", 0, v4);
    }
  }
}

- (void)willTransitionToState:(unint64_t)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PHVoicemailMessageTableViewCell;
  -[PHVoicemailMessageTableViewCell willTransitionToState:](&v3, "willTransitionToState:", a3);
}

- (void)commonInit
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PHVoicemailMessageTableViewCell;
  -[PHVoicemailMessageTableViewCell commonInit](&v3, "commonInit");
  -[PHVoicemailMessageTableViewCell setMaximumAllowedHeight:](self, "setMaximumAllowedHeight:", 320.0);
}

- (void)loadContentView
{
  void *v3;
  void *v4;
  PHVoicemailMessageTableViewCellScrollView *v5;
  double y;
  double width;
  double height;
  PHVoicemailMessageTableViewCellScrollView *v9;
  PHVoicemailMessageTableViewCellScrollView *contentScrollView;
  UIImageView *v11;
  UIImageView *unreadIndicatorImageView;
  void *v13;
  void *v14;
  VMMessageMetadataView *v15;
  VMMessageMetadataView *metadataView;
  UITapGestureRecognizer *v17;
  UITapGestureRecognizer *foregroundViewTapGestureRecognizer;
  UITapGestureRecognizer *v19;
  UITapGestureRecognizer *metadataViewTapGestureRecognizer;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)PHVoicemailMessageTableViewCell;
  -[PHVoicemailMessageTableViewCell loadContentView](&v21, "loadContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell contentView](self, "contentView"));
  objc_msgSend(v3, "setClipsToBounds:", 1);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell contentView](self, "contentView"));
  v5 = [PHVoicemailMessageTableViewCellScrollView alloc];
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v9 = -[PHVoicemailMessageTableViewCellScrollView initWithFrame:](v5, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  contentScrollView = self->_contentScrollView;
  self->_contentScrollView = v9;

  -[PHVoicemailMessageTableViewCellScrollView setTranslatesAutoresizingMaskIntoConstraints:](self->_contentScrollView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v4, "addSubview:", self->_contentScrollView);
  v11 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  unreadIndicatorImageView = self->_unreadIndicatorImageView;
  self->_unreadIndicatorImageView = v11;

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage telephonyUIUnreadIndicatorGlyphImage](UIImage, "telephonyUIUnreadIndicatorGlyphImage"));
  -[UIImageView setImage:](self->_unreadIndicatorImageView, "setImage:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
  -[UIImageView setTintColor:](self->_unreadIndicatorImageView, "setTintColor:", v14);

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_unreadIndicatorImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PHVoicemailMessageTableViewCellScrollView addSubview:](self->_contentScrollView, "addSubview:", self->_unreadIndicatorImageView);
  v15 = -[VMMessageMetadataView initWithAccessibleLayout:]([VMMessageMetadataView alloc], "initWithAccessibleLayout:", -[PHVoicemailMessageTableViewCell isAccessiblityConstraintsEnabled](self, "isAccessiblityConstraintsEnabled"));
  metadataView = self->_metadataView;
  self->_metadataView = v15;

  -[VMMessageMetadataView setDelegate:](self->_metadataView, "setDelegate:", self);
  -[VMMessageMetadataView setTranslatesAutoresizingMaskIntoConstraints:](self->_metadataView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v17 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "handleCollapseCellTapGesture:");
  foregroundViewTapGestureRecognizer = self->_foregroundViewTapGestureRecognizer;
  self->_foregroundViewTapGestureRecognizer = v17;

  v19 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "handleCollapseCellTapGesture:");
  metadataViewTapGestureRecognizer = self->_metadataViewTapGestureRecognizer;
  self->_metadataViewTapGestureRecognizer = v19;

  -[UITapGestureRecognizer setEnabled:](self->_metadataViewTapGestureRecognizer, "setEnabled:", 0);
  -[VMMessageMetadataView addGestureRecognizer:](self->_metadataView, "addGestureRecognizer:", self->_metadataViewTapGestureRecognizer);
  -[PHVoicemailMessageTableViewCellScrollView addSubview:](self->_contentScrollView, "addSubview:", self->_metadataView);

}

- (void)loadExpandedViewsIfNecessary
{
  int *v3;
  void *v4;
  void *v5;
  void *v6;
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  VMPlayerControlsView *v29;
  VMPlayerControlsView *playerControlsView;
  void *v31;
  void *v32;
  void *v33;
  VMMessageToolbar *v34;
  VMMessageToolbar *toolbar;
  VMMessageTranscriptView *v36;
  VMMessageTranscriptView *transcriptView;
  void *v38;
  void *v39;
  double v40;
  VMMessageRestrictedView *v41;
  VMMessageRestrictedView *restrictedView;
  void *v43;
  _QWORD v44[4];
  void *v45;

  if (!-[PHVoicemailMessageTableViewCell isExpanded](self, "isExpanded"))
    return;
  v3 = &OBJC_IVAR___VMRoundButton__type;
  if (self->_voicemailTipView)
  {
    -[PHVoicemailMessageTableViewCellScrollView addSubview:](self->_contentScrollView, "addSubview:");
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_voicemailTipView, "leadingAnchor"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell contentScrollView](self, "contentScrollView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contentLayoutGuide"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingAnchor"));
    -[PHVoicemailMessageTableViewCell metadataViewTrailingLayoutConstraintConstant](self, "metadataViewTrailingLayoutConstraintConstant");
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:constant:", v7));

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_voicemailTipView, "trailingAnchor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell contentScrollView](self, "contentScrollView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "contentLayoutGuide"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "trailingAnchor"));
    -[PHVoicemailMessageTableViewCell metadataViewTrailingLayoutConstraintConstant](self, "metadataViewTrailingLayoutConstraintConstant");
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:constant:", v12, -v13));

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_voicemailTipView, "topAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell contentScrollView](self, "contentScrollView"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "contentLayoutGuide"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "topAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v18));

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell metadataView](self, "metadataView"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "topAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_voicemailTipView, "bottomAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v22));

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell metadataViewTopConstraint](self, "metadataViewTopConstraint"));
    if (v24)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell metadataViewTopConstraint](self, "metadataViewTopConstraint"));
      v45 = v25;
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v45, 1));
      +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v26);

    }
    v44[0] = v19;
    v44[1] = v8;
    v44[2] = v14;
    v44[3] = v23;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v44, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v27);

    v3 = &OBJC_IVAR___VMRoundButton__type;
    goto LABEL_8;
  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell metadataViewTopConstraint](self, "metadataViewTopConstraint"));

  if (v28)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell metadataViewTopConstraint](self, "metadataViewTopConstraint"));
    v43 = v8;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v43, 1));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v14);
LABEL_8:

  }
  if (!self->_playerControlsView)
  {
    v29 = objc_alloc_init(VMPlayerControlsView);
    playerControlsView = self->_playerControlsView;
    self->_playerControlsView = v29;

    -[VMPlayerControlsView setTranslatesAutoresizingMaskIntoConstraints:](self->_playerControlsView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell item](self, "item"));
    -[VMPlayerControlsView setEnabled:](self->_playerControlsView, "setEnabled:", objc_msgSend(v31, "showsPlayerControls"));

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell item](self, "item"));
    objc_msgSend(v32, "duration");
    -[VMPlayerControlsView setDuration:](self->_playerControlsView, "setDuration:");

    -[VMPlayerControlsView setDelegate:](self->_playerControlsView, "setDelegate:", self);
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayerControlsView timelineSlider](self->_playerControlsView, "timelineSlider"));
    objc_msgSend(v33, "setDelegate:", self);

    objc_msgSend(*(id *)&self->TPTableViewCell_opaque[v3[3]], "addSubview:", self->_playerControlsView);
  }
  if (!self->_toolbar)
  {
    v34 = objc_alloc_init(VMMessageToolbar);
    toolbar = self->_toolbar;
    self->_toolbar = v34;

    -[VMMessageToolbar setDelegate:](self->_toolbar, "setDelegate:", self);
    -[VMMessageToolbar setPlayerControlsView:](self->_toolbar, "setPlayerControlsView:", self->_playerControlsView);
    -[VMMessageToolbar setTranslatesAutoresizingMaskIntoConstraints:](self->_toolbar, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(*(id *)&self->TPTableViewCell_opaque[v3[3]], "addSubview:", self->_toolbar);
  }
  if (!self->_transcriptView)
  {
    v36 = objc_alloc_init(VMMessageTranscriptView);
    transcriptView = self->_transcriptView;
    self->_transcriptView = v36;

    -[VMMessageTranscriptView setTranslatesAutoresizingMaskIntoConstraints:](self->_transcriptView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell item](self, "item"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "transcriptViewModel"));
    -[VMMessageTranscriptView setViewModel:](self->_transcriptView, "setViewModel:", v39);

    -[VMMessageTranscriptView setDelegate:](self->_transcriptView, "setDelegate:", self);
    LODWORD(v40) = 1148846080;
    -[VMMessageTranscriptView setContentCompressionResistancePriority:forAxis:](self->_transcriptView, "setContentCompressionResistancePriority:forAxis:", 1, v40);
    objc_msgSend(*(id *)&self->TPTableViewCell_opaque[v3[3]], "addSubview:", self->_transcriptView);
  }
  if (!self->_restrictedView)
  {
    v41 = objc_alloc_init(VMMessageRestrictedView);
    restrictedView = self->_restrictedView;
    self->_restrictedView = v41;

    -[VMMessageRestrictedView setTranslatesAutoresizingMaskIntoConstraints:](self->_restrictedView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(*(id *)&self->TPTableViewCell_opaque[v3[3]], "addSubview:", self->_restrictedView);
  }
}

- (void)loadConstraints
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
  double v13;
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
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
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
  double v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  double v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  double v64;
  void *v65;
  double v66;
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
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  objc_super v188;
  _QWORD v189[15];
  _QWORD v190[15];

  v188.receiver = self;
  v188.super_class = (Class)PHVoicemailMessageTableViewCell;
  -[PHVoicemailMessageTableViewCell loadConstraints](&v188, "loadConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell initialConstraints](self, "initialConstraints"));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell metadataView](self, "metadataView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bottomAnchor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell contentScrollView](self, "contentScrollView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contentLayoutGuide"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bottomAnchor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:", v8));
    -[PHVoicemailMessageTableViewCell setCollapsedBottomConstraint:](self, "setCollapsedBottomConstraint:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell contentView](self, "contentView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "heightAnchor"));
    -[PHVoicemailMessageTableViewCell maximumAllowedHeight](self, "maximumAllowedHeight");
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintLessThanOrEqualToConstant:"));
    LODWORD(v13) = 1148829696;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "withPriority:", v13));
    -[PHVoicemailMessageTableViewCell setMaximumHeightConstraint:](self, "setMaximumHeightConstraint:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell metadataView](self, "metadataView"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "leadingAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell unreadIndicatorImageView](self, "unreadIndicatorImageView"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "trailingAnchor"));
    -[PHVoicemailMessageTableViewCell metadataViewLeadingLayoutConstraintConstant](self, "metadataViewLeadingLayoutConstraintConstant");
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:constant:", v18));
    -[PHVoicemailMessageTableViewCell setMetadataViewLeadingConstraint:](self, "setMetadataViewLeadingConstraint:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell voicemailTipView](self, "voicemailTipView"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell metadataView](self, "metadataView"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "topAnchor"));
    if (v20)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell voicemailTipView](self, "voicemailTipView"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "bottomAnchor"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v24));
      -[PHVoicemailMessageTableViewCell setMetadataViewTopConstraint:](self, "setMetadataViewTopConstraint:", v25);
    }
    else
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell contentScrollView](self, "contentScrollView"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "contentLayoutGuide"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "topAnchor"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v25));
      -[PHVoicemailMessageTableViewCell setMetadataViewTopConstraint:](self, "setMetadataViewTopConstraint:", v26);

    }
    v186 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell contentView](self, "contentView"));
    v182 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v186, "heightAnchor"));
    v184 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell contentScrollView](self, "contentScrollView"));
    v180 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v184, "contentLayoutGuide"));
    v178 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v180, "heightAnchor"));
    v176 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v182, "constraintEqualToAnchor:", v178));
    LODWORD(v27) = 1132068864;
    v174 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v176, "withPriority:", v27));
    v190[0] = v174;
    v172 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell contentScrollView](self, "contentScrollView"));
    v168 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v172, "leadingAnchor"));
    v170 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell contentView](self, "contentView"));
    v166 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v170, "leadingAnchor"));
    v164 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v168, "constraintEqualToAnchor:", v166));
    v190[1] = v164;
    v162 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell contentScrollView](self, "contentScrollView"));
    v158 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v162, "trailingAnchor"));
    v160 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell contentView](self, "contentView"));
    v156 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v160, "trailingAnchor"));
    v154 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v158, "constraintEqualToAnchor:", v156));
    v190[2] = v154;
    v152 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell contentScrollView](self, "contentScrollView"));
    v148 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v152, "topAnchor"));
    v150 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell contentView](self, "contentView"));
    v146 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v150, "topAnchor"));
    v144 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v148, "constraintEqualToAnchor:", v146));
    v190[3] = v144;
    v142 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell contentScrollView](self, "contentScrollView"));
    v138 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v142, "bottomAnchor"));
    v140 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell contentView](self, "contentView"));
    v136 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v140, "bottomAnchor"));
    v134 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v138, "constraintEqualToAnchor:", v136));
    v190[4] = v134;
    v132 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell contentScrollView](self, "contentScrollView"));
    v130 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v132, "contentLayoutGuide"));
    v126 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v130, "widthAnchor"));
    v128 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell contentScrollView](self, "contentScrollView"));
    v124 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128, "frameLayoutGuide"));
    v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "widthAnchor"));
    v120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v126, "constraintEqualToAnchor:", v122));
    v190[5] = v120;
    v118 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell unreadIndicatorImageView](self, "unreadIndicatorImageView"));
    v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "leadingAnchor"));
    v116 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell contentScrollView](self, "contentScrollView"));
    v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v116, "contentLayoutGuide"));
    v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v114, "leadingAnchor"));
    -[PHVoicemailMessageTableViewCell unreadIndicatorImageViewLeadingLayoutConstraintConstant](self, "unreadIndicatorImageViewLeadingLayoutConstraintConstant");
    v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "constraintEqualToAnchor:constant:", v110));
    v190[6] = v108;
    v106 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell unreadIndicatorImageView](self, "unreadIndicatorImageView"));
    v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "widthAnchor"));
    -[PHVoicemailMessageTableViewCell unreadIndicatorImageViewWidthLayoutConstraintConstant](self, "unreadIndicatorImageViewWidthLayoutConstraintConstant");
    v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "constraintEqualToConstant:"));
    v190[7] = v102;
    v100 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell unreadIndicatorImageView](self, "unreadIndicatorImageView"));
    v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "topAnchor"));
    v98 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell metadataView](self, "metadataView"));
    v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "titleLabel"));
    v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "firstBaselineAnchor"));
    -[PHVoicemailMessageTableViewCell unreadIndicatorImageViewTopLayoutConstraintConstant](self, "unreadIndicatorImageViewTopLayoutConstraintConstant");
    v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "constraintEqualToAnchor:constant:", v92, -v28));
    v190[8] = v90;
    v88 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell unreadIndicatorImageView](self, "unreadIndicatorImageView"));
    v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "heightAnchor"));
    v86 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell unreadIndicatorImageView](self, "unreadIndicatorImageView"));
    v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "widthAnchor"));
    v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "constraintEqualToAnchor:", v82));
    v190[9] = v80;
    v78 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell metadataViewLeadingConstraint](self, "metadataViewLeadingConstraint"));
    v190[10] = v78;
    v76 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell metadataView](self, "metadataView"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "trailingAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell contentScrollView](self, "contentScrollView"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "contentLayoutGuide"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "trailingAnchor"));
    -[PHVoicemailMessageTableViewCell metadataViewTrailingLayoutConstraintConstant](self, "metadataViewTrailingLayoutConstraintConstant");
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:constant:", v32, -v33));
    v190[11] = v34;
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell metadataViewTopConstraint](self, "metadataViewTopConstraint"));
    v190[12] = v35;
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell collapsedBottomConstraint](self, "collapsedBottomConstraint"));
    v190[13] = v36;
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell maximumHeightConstraint](self, "maximumHeightConstraint"));
    v190[14] = v37;
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v190, 15));
    -[PHVoicemailMessageTableViewCell setInitialConstraints:](self, "setInitialConstraints:", v38);

    v39 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell initialConstraints](self, "initialConstraints"));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v39);

  }
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell expandedConstraints](self, "expandedConstraints"));
  if (v40)
    goto LABEL_9;
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell playerControlsView](self, "playerControlsView"));

  if (v41)
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell toolbar](self, "toolbar"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "bottomAnchor"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell contentScrollView](self, "contentScrollView"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "contentLayoutGuide"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "bottomAnchor"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:", v46));
    LODWORD(v48) = 1132068864;
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "withPriority:", v48));
    -[PHVoicemailMessageTableViewCell setToolbarBottomConstraint:](self, "setToolbarBottomConstraint:", v49);

    v50 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell transcriptView](self, "transcriptView"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "bottomAnchor"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell contentScrollView](self, "contentScrollView"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "contentLayoutGuide"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "bottomAnchor"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintEqualToAnchor:", v54));
    LODWORD(v56) = 1132068864;
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "withPriority:", v56));
    -[PHVoicemailMessageTableViewCell setTranscriptBottomConstraint:](self, "setTranscriptBottomConstraint:", v57);

    v58 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell restrictedView](self, "restrictedView"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "bottomAnchor"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell contentScrollView](self, "contentScrollView"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "contentLayoutGuide"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "bottomAnchor"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "constraintEqualToAnchor:", v62));
    LODWORD(v64) = 1132068864;
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "withPriority:", v64));
    -[PHVoicemailMessageTableViewCell setRestrictedViewBottomConstraint:](self, "setRestrictedViewBottomConstraint:", v65);

    v187 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell playerControlsView](self, "playerControlsView"));
    v183 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v187, "leftAnchor"));
    v185 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell metadataView](self, "metadataView"));
    v181 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v185, "leftAnchor"));
    v179 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v183, "constraintEqualToAnchor:", v181));
    v189[0] = v179;
    v177 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell playerControlsView](self, "playerControlsView"));
    v171 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v177, "rightAnchor"));
    v175 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell contentScrollView](self, "contentScrollView"));
    v173 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v175, "contentLayoutGuide"));
    v169 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v173, "rightAnchor"));
    -[PHVoicemailMessageTableViewCell playerControlsViewRightLayoutConstraintConstant](self, "playerControlsViewRightLayoutConstraintConstant");
    v167 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v171, "constraintEqualToAnchor:constant:", v169, -v66));
    v189[1] = v167;
    v165 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell playerControlsView](self, "playerControlsView"));
    v161 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v165, "topAnchor"));
    v163 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell metadataView](self, "metadataView"));
    v159 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v163, "bottomAnchor"));
    v157 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v161, "constraintEqualToAnchor:", v159));
    v189[2] = v157;
    v155 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell toolbar](self, "toolbar"));
    v151 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v155, "leadingAnchor"));
    v153 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell metadataView](self, "metadataView"));
    v149 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v153, "leadingAnchor"));
    v147 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v151, "constraintEqualToAnchor:", v149));
    v189[3] = v147;
    v145 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell toolbar](self, "toolbar"));
    v141 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v145, "trailingAnchor"));
    v143 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell metadataView](self, "metadataView"));
    v139 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v143, "trailingAnchor"));
    v137 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v141, "constraintEqualToAnchor:", v139));
    v189[4] = v137;
    v135 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell toolbar](self, "toolbar"));
    v131 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v135, "topAnchor"));
    v133 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell playerControlsView](self, "playerControlsView"));
    v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v133, "bottomAnchor"));
    v127 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "constraintEqualToAnchor:", v129));
    v189[5] = v127;
    v125 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell toolbarBottomConstraint](self, "toolbarBottomConstraint"));
    v189[6] = v125;
    v123 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell transcriptView](self, "transcriptView"));
    v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v123, "leadingAnchor"));
    v121 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell metadataView](self, "metadataView"));
    v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "leadingAnchor"));
    v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v119, "constraintEqualToAnchor:", v117));
    v189[7] = v115;
    v113 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell transcriptView](self, "transcriptView"));
    v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v113, "trailingAnchor"));
    v111 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell metadataView](self, "metadataView"));
    v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "trailingAnchor"));
    v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "constraintEqualToAnchor:", v107));
    v189[8] = v105;
    v103 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell transcriptView](self, "transcriptView"));
    v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "topAnchor"));
    v101 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell toolbar](self, "toolbar"));
    v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "bottomAnchor"));
    v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "constraintEqualToAnchor:", v97));
    v189[9] = v95;
    v93 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell transcriptBottomConstraint](self, "transcriptBottomConstraint"));
    v189[10] = v93;
    v91 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell restrictedView](self, "restrictedView"));
    v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "leadingAnchor"));
    v89 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell metadataView](self, "metadataView"));
    v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "leadingAnchor"));
    v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "constraintEqualToAnchor:", v85));
    v189[11] = v83;
    v81 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell restrictedView](self, "restrictedView"));
    v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "trailingAnchor"));
    v79 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell metadataView](self, "metadataView"));
    v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "trailingAnchor"));
    v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "constraintEqualToAnchor:", v67));
    v189[12] = v68;
    v69 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell restrictedView](self, "restrictedView"));
    v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "topAnchor"));
    v71 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell toolbar](self, "toolbar"));
    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "bottomAnchor"));
    v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "constraintEqualToAnchor:", v72));
    v189[13] = v73;
    v74 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell restrictedViewBottomConstraint](self, "restrictedViewBottomConstraint"));
    v189[14] = v74;
    v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v189, 15));
    -[PHVoicemailMessageTableViewCell setExpandedConstraints:](self, "setExpandedConstraints:", v75);

    v40 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell expandedConstraints](self, "expandedConstraints"));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v40);
LABEL_9:

  }
  -[PHVoicemailMessageTableViewCell updateConstraintsForExpandedState:](self, "updateConstraintsForExpandedState:", -[PHVoicemailMessageTableViewCell isExpanded](self, "isExpanded"));
}

- (void)hideUnreadIndicator
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
  void *v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell unreadIndicatorImageView](self, "unreadIndicatorImageView"));
  objc_msgSend(v3, "setHidden:", 1);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell metadataViewLeadingConstraint](self, "metadataViewLeadingConstraint"));
  v16 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v16, 1));
  +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell hideUnreadIndicatorMetadataViewLeadingConstraint](self, "hideUnreadIndicatorMetadataViewLeadingConstraint"));
  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell metadataView](self, "metadataView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "leadingAnchor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell contentScrollView](self, "contentScrollView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contentLayoutGuide"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "leadingAnchor"));
    -[PHVoicemailMessageTableViewCell metadataViewWithoutUnreadIndicatorImageViewLeadingLayoutConstraintConstant](self, "metadataViewWithoutUnreadIndicatorImageViewLeadingLayoutConstraintConstant");
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:constant:", v11));
    v15 = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
    -[PHVoicemailMessageTableViewCell setHideUnreadIndicatorMetadataViewLeadingConstraint:](self, "setHideUnreadIndicatorMetadataViewLeadingConstraint:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell hideUnreadIndicatorMetadataViewLeadingConstraint](self, "hideUnreadIndicatorMetadataViewLeadingConstraint"));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v14);

  }
}

- (void)updateConstraintsForExpandedState:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  id v15;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell toolbarBottomConstraint](self, "toolbarBottomConstraint"));
  LODWORD(v6) = 1132068864;
  objc_msgSend(v5, "setPriority:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell transcriptBottomConstraint](self, "transcriptBottomConstraint"));
  LODWORD(v8) = 1132068864;
  objc_msgSend(v7, "setPriority:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell restrictedViewBottomConstraint](self, "restrictedViewBottomConstraint"));
  LODWORD(v10) = 1132068864;
  objc_msgSend(v9, "setPriority:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell collapsedBottomConstraint](self, "collapsedBottomConstraint"));
  LODWORD(v12) = 1132068864;
  objc_msgSend(v11, "setPriority:", v12);

  if (v3)
  {
    if (-[PHVoicemailMessageTableViewCell shouldShowRestrictedAlertView](self, "shouldShowRestrictedAlertView"))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell restrictedViewBottomConstraint](self, "restrictedViewBottomConstraint"));
    }
    else if (-[PHVoicemailMessageTableViewCell shouldShowTranscriptView](self, "shouldShowTranscriptView"))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell transcriptBottomConstraint](self, "transcriptBottomConstraint"));
    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell toolbarBottomConstraint](self, "toolbarBottomConstraint"));
    }
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell collapsedBottomConstraint](self, "collapsedBottomConstraint"));
  }
  LODWORD(v14) = 1148846080;
  v15 = v13;
  objc_msgSend(v13, "setPriority:", v14);

}

- (void)unloadConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PHVoicemailMessageTableViewCell;
  -[PHVoicemailMessageTableViewCell unloadConstraints](&v9, "unloadConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell initialConstraints](self, "initialConstraints"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell initialConstraints](self, "initialConstraints"));
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v4);

    -[PHVoicemailMessageTableViewCell setInitialConstraints:](self, "setInitialConstraints:", 0);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell expandedConstraints](self, "expandedConstraints"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell expandedConstraints](self, "expandedConstraints"));
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v6);

    -[PHVoicemailMessageTableViewCell setExpandedConstraints:](self, "setExpandedConstraints:", 0);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell hideUnreadIndicatorMetadataViewLeadingConstraint](self, "hideUnreadIndicatorMetadataViewLeadingConstraint"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell hideUnreadIndicatorMetadataViewLeadingConstraint](self, "hideUnreadIndicatorMetadataViewLeadingConstraint"));
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v8);

    -[PHVoicemailMessageTableViewCell setHideUnreadIndicatorMetadataViewLeadingConstraint:](self, "setHideUnreadIndicatorMetadataViewLeadingConstraint:", 0);
  }
}

- (void)updateConstraintsConstants
{
  _BOOL8 v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PHVoicemailMessageTableViewCell;
  -[PHVoicemailMessageTableViewCell updateConstraintsConstants](&v5, "updateConstraintsConstants");
  v3 = -[PHVoicemailMessageTableViewCell isAccessiblityConstraintsEnabled](self, "isAccessiblityConstraintsEnabled");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell metadataView](self, "metadataView"));
  objc_msgSend(v4, "setLayoutIsAccessible:", v3);

}

- (void)setupCollapsedView
{
  id v3;

  -[PHVoicemailMessageTableViewCell updateConstraintsForExpandedState:](self, "updateConstraintsForExpandedState:", 0);
  v3 = (id)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell playerControlsView](self, "playerControlsView"));
  objc_msgSend(v3, "setHidden:", 1);

}

- (void)setupExpandedView
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = -[PHVoicemailMessageTableViewCell shouldShowTranscriptView](self, "shouldShowTranscriptView") ^ 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell transcriptView](self, "transcriptView"));
  objc_msgSend(v4, "setHidden:", v3);

  v5 = -[PHVoicemailMessageTableViewCell shouldShowRestrictedAlertView](self, "shouldShowRestrictedAlertView") ^ 1;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell restrictedView](self, "restrictedView"));
  objc_msgSend(v6, "setHidden:", v5);

  v7 = -[PHVoicemailMessageTableViewCell shouldShowRestrictedAlertView](self, "shouldShowRestrictedAlertView") ^ 1;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell playerControlsView](self, "playerControlsView"));
  objc_msgSend(v8, "setEnabled:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell playerControlsView](self, "playerControlsView"));
  objc_msgSend(v9, "setHidden:", 0);

  -[PHVoicemailMessageTableViewCell updateConstraintsForExpandedState:](self, "updateConstraintsForExpandedState:", 1);
}

- (BOOL)shouldShowRestrictedAlertView
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell item](self, "item"));
  v3 = objc_msgSend(v2, "showsRestrictedAlertView");

  return v3;
}

- (BOOL)shouldShowTranscriptView
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  id v7;
  NSObject *v8;
  const char *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  unsigned int v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  _DWORD v25[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell item](self, "item"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell item](self, "item"));
    if (objc_msgSend(v4, "showsTranscriptionView"))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell item](self, "item"));
      if ((objc_msgSend(v5, "showsRestrictedAlertView") & 1) != 0)
      {
        v6 = 0;
      }
      else
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell item](self, "item"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "transcriptViewModel"));
        v6 = objc_msgSend(v11, "confidence") != 0;

      }
    }
    else
    {
      v6 = 0;
    }

    v12 = PHDefaultLog();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v25[0] = 67109120;
      v25[1] = v6;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Should show transcript = %d.", (uint8_t *)v25, 8u);
    }

    if (v6)
      return 1;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell item](self, "item"));
    v16 = objc_msgSend(v15, "showsTranscriptionView");

    if ((v16 & 1) != 0)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell item](self, "item"));
      v18 = objc_msgSend(v17, "showsRestrictedAlertView");

      if (v18)
      {
        v19 = PHDefaultLog();
        v8 = objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v25[0]) = 0;
          v9 = "Cannot show transcript view due to alert view.";
          goto LABEL_20;
        }
      }
      else
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell item](self, "item"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "transcriptViewModel"));
        v23 = objc_msgSend(v22, "confidence");

        if (v23)
          return 0;
        v24 = PHDefaultLog();
        v8 = objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          sub_1000529A4(v8);
      }
    }
    else
    {
      v20 = PHDefaultLog();
      v8 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v25[0]) = 0;
        v9 = "Voice mail did not request to display a transcript.";
        goto LABEL_20;
      }
    }
  }
  else
  {
    v7 = PHDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v25[0]) = 0;
      v9 = "No voicemail item.  Cannot show transcript view.";
LABEL_20:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)v25, 2u);
    }
  }

  return 0;
}

- (void)configureWithVoicemailMessageViewModel:(id)a3 expanded:(BOOL)a4 shouldGrayForeground:(BOOL)a5
{
  _BOOL8 v6;
  void *v8;
  id v9;

  v6 = a4;
  -[PHVoicemailMessageTableViewCell setItem:](self, "setItem:", a3);
  -[PHVoicemailMessageTableViewCell setExpanded:](self, "setExpanded:", v6);
  if (a5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell dimmedColor](self, "dimmedColor"));
    -[PHVoicemailMessageTableViewCell setForegroundColor:](self, "setForegroundColor:", v8);

  }
  else
  {
    -[PHVoicemailMessageTableViewCell setForegroundColor:](self, "setForegroundColor:", 0);
  }
  v9 = (id)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell item](self, "item"));
  -[PHVoicemailMessageTableViewCell setRead:](self, "setRead:", objc_msgSend(v9, "isRead"));

}

- (void)setForegroundColor:(id)a3
{
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PHVoicemailMessageTableViewCell;
  -[PHVoicemailMessageTableViewCell setForegroundColor:](&v7, "setForegroundColor:");
  if (a3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell foregroundView](self, "foregroundView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell foregroundViewTapGestureRecognizer](self, "foregroundViewTapGestureRecognizer"));
    objc_msgSend(v5, "addGestureRecognizer:", v6);

  }
}

- (id)dimmedColor
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell traitCollection](self, "traitCollection"));
  if (objc_msgSend(v2, "userInterfaceStyle") == (id)2)
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemMidGrayColor](UIColor, "systemMidGrayColor"));
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "colorWithAlphaComponent:", 0.600000024));

  return v5;
}

- (void)setExpanded:(BOOL)a3
{
  -[PHVoicemailMessageTableViewCell setExpanded:animated:](self, "setExpanded:animated:", a3, 0);
}

- (void)setExpanded:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD *v16;
  void *v17;
  void *v18;
  _QWORD *v19;
  void *v20;
  _QWORD v21[5];
  _QWORD v22[5];
  BOOL v23;

  v4 = a4;
  v5 = a3;
  self->_expanded = a3;
  if (a3)
    -[PHVoicemailMessageTableViewCell tipKitStartObservation](self, "tipKitStartObservation");
  else
    -[PHVoicemailMessageTableViewCell tipKitStopObservation](self, "tipKitStopObservation");
  -[PHVoicemailMessageTableViewCell loadExpandedViewsIfNecessary](self, "loadExpandedViewsIfNecessary");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell item](self, "item"));
  -[PHVoicemailMessageTableViewCell updateExpandedViewsWithViewModel:](self, "updateExpandedViewsWithViewModel:", v7);

  -[PHVoicemailMessageTableViewCell loadConstraints](self, "loadConstraints");
  if (-[PHVoicemailMessageTableViewCell shouldShowRestrictedAlertView](self, "shouldShowRestrictedAlertView")
    && (v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell restrictedView](self, "restrictedView")),
        v8,
        v8))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell item](self, "item"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedAttributedRestrictedAlertTitle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell restrictedView](self, "restrictedView"));
    objc_msgSend(v11, "setLocalizedAttributedRestrictedAlertTitle:", v10);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell toolbar](self, "toolbar"));
    v13 = v12;
    v14 = 1;
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell restrictedView](self, "restrictedView"));
    objc_msgSend(v15, "setLocalizedAttributedRestrictedAlertTitle:", 0);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell toolbar](self, "toolbar"));
    v13 = v12;
    v14 = 0;
  }
  objc_msgSend(v12, "setRestricted:", v14);

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10002831C;
  v22[3] = &unk_10007D760;
  v22[4] = self;
  v23 = v5;
  v16 = objc_retainBlock(v22);
  v17 = v16;
  if (v4)
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v16, 0.300000012);
  else
    ((void (*)(_QWORD *))v16[2])(v16);
  if (v5)
  {
    -[PHVoicemailMessageTableViewCell setupExpandedView](self, "setupExpandedView");
    -[PHVoicemailMessageTableViewCell setSelectionStyle:](self, "setSelectionStyle:", 0);
  }
  else
  {
    -[PHVoicemailMessageTableViewCell setupCollapsedView](self, "setupCollapsedView");
    -[PHVoicemailMessageTableViewCell setSelectionStyle:](self, "setSelectionStyle:", 3);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell transcriptView](self, "transcriptView"));

    if (v18)
    {
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_100028388;
      v21[3] = &unk_10007D440;
      v21[4] = self;
      v19 = objc_retainBlock(v21);
      v20 = v19;
      if (v4)
        +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v19, 0.300000012);
      else
        ((void (*)(_QWORD *))v19[2])(v19);

    }
  }

}

- (void)setRead:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  double v5;
  id v6;

  v3 = a3;
  self->_read = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell unreadIndicatorImageView](self, "unreadIndicatorImageView"));
  v6 = v4;
  v5 = 1.0;
  if (v3)
    v5 = 0.0;
  objc_msgSend(v4, "setAlpha:", v5);

}

- (void)setItem:(id)a3
{
  void *v5;
  MPVoicemailMessageViewModel *v6;

  v6 = (MPVoicemailMessageViewModel *)a3;
  if (self->_item != v6)
  {
    objc_storeStrong((id *)&self->_item, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell metadataView](self, "metadataView"));
    objc_msgSend(v5, "configureWithViewModel:", v6);

    -[PHVoicemailMessageTableViewCell updateExpandedViewsWithViewModel:](self, "updateExpandedViewsWithViewModel:", v6);
  }

}

- (void)updateExpandedViewsWithViewModel:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;

  v16 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell transcriptView](self, "transcriptView"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "transcriptViewModel"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell transcriptView](self, "transcriptView"));
    objc_msgSend(v6, "setViewModel:", v5);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell playerControlsView](self, "playerControlsView"));

  if (v7)
  {
    objc_msgSend(v16, "duration");
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell playerControlsView](self, "playerControlsView"));
    objc_msgSend(v10, "setDuration:", v9);

  }
  v11 = objc_msgSend(v16, "isDeleted");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell toolbar](self, "toolbar"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "trashButton"));
  v14 = v13;
  if (v11)
    v15 = 4;
  else
    v15 = 3;
  objc_msgSend(v13, "setButtonType:enabled:", v15, 1);

}

- (void)setMaximumAllowedHeight:(double)a3
{
  id v4;

  self->_maximumAllowedHeight = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell maximumHeightConstraint](self, "maximumHeightConstraint"));
  objc_msgSend(v4, "setConstant:", a3);

}

- (BOOL)isAccessiblityConstraintsEnabled
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell traitCollection](self, "traitCollection"));
  v3 = objc_msgSend(v2, "isPreferredContentSizeCategoryAccessible");

  return v3;
}

- (double)metadataViewLeadingLayoutConstraintConstant
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  v3 = (void *)objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell traitCollection](self, "traitCollection"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory"));
  objc_msgSend(v3, "metadataViewLeadingLayoutConstraintConstantForContentSizeCategory:", v5);
  v7 = v6;

  return v7;
}

- (double)metadataViewTrailingLayoutConstraintConstant
{
  return 16.0;
}

- (double)playerControlsViewRightLayoutConstraintConstant
{
  return 16.0;
}

- (double)playerControlsViewTimelineSliderTopLayoutConstraintConstant
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont telephonyUIBodyShortFont](UIFont, "telephonyUIBodyShortFont"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "fontDescriptor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", UIFontDescriptorTextStyleAttribute));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontMetrics metricsForTextStyle:](UIFontMetrics, "metricsForTextStyle:", v4));
    objc_msgSend(v5, "scaledValueForValue:", 24.0);
    v7 = v6;

  }
  else
  {
    v7 = 24.0;
  }

  return v7;
}

- (double)toolbarLeadingLayoutConstraintConstant
{
  return 16.0;
}

- (double)metadataViewWithoutUnreadIndicatorImageViewLeadingLayoutConstraintConstant
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  v3 = (void *)objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell traitCollection](self, "traitCollection"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory"));
  objc_msgSend(v3, "metadataViewWithoutUnreadIndicatorImageViewLeadingLayoutConstraintConstant:", v5);
  v7 = v6;

  return v7;
}

- (double)unreadIndicatorImageViewLeadingLayoutConstraintConstant
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  v3 = (void *)objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell traitCollection](self, "traitCollection"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory"));
  objc_msgSend(v3, "unreadIndicatorImageViewLeadingLayoutConstraintConstantForContentSizeCategory:", v5);
  v7 = v6;

  return v7;
}

- (double)unreadIndicatorImageViewTopLayoutConstraintConstant
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell metadataView](self, "metadataView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "titleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "font"));
  objc_msgSend(v4, "capHeight");
  v6 = v5;

  return v6;
}

- (double)unreadIndicatorImageViewWidthLayoutConstraintConstant
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  v3 = (void *)objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell traitCollection](self, "traitCollection"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory"));
  objc_msgSend(v3, "unreadIndicatorImageViewWidthLayoutConstraintConstantForContentSizeCategory:", v5);
  v7 = v6;

  return v7;
}

- (void)handleCollapseCellTapGesture:(id)a3
{
  id v4;
  id v5;
  void *v6;
  char v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell metadataViewTapGestureRecognizer](self, "metadataViewTapGestureRecognizer"));
  if (v4 == v9)
  {

  }
  else
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell foregroundViewTapGestureRecognizer](self, "foregroundViewTapGestureRecognizer"));

    if (v5 != v9)
      goto LABEL_7;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell delegate](self, "delegate"));
  v7 = objc_opt_respondsToSelector(v6, "voicemailMessageCellDidTapToCollapse:");

  if ((v7 & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell delegate](self, "delegate"));
    objc_msgSend(v8, "voicemailMessageCellDidTapToCollapse:", self);

  }
LABEL_7:

}

- (void)messageMetadataView:(id)a3 didTapButtonType:(unint64_t)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  char v12;
  id v13;

  v13 = (id)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell _tableView](self, "_tableView", a3));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "indexPathForCell:", self));
  v7 = (void *)v6;
  if (a4 == 1)
  {
    if (v6)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell delegate](self, "delegate"));
      v12 = objc_opt_respondsToSelector(v11, "voicemailMessageTableViewCell:actionButtonTappedForRowWithIndexPath:");

      if ((v12 & 1) != 0)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell delegate](self, "delegate"));
        objc_msgSend(v10, "voicemailMessageTableViewCell:actionButtonTappedForRowWithIndexPath:", self, v7);
        goto LABEL_9;
      }
    }
  }
  else if (a4 == 2)
  {
    if (v6)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "delegate"));
      v9 = objc_opt_respondsToSelector(v8, "tableView:accessoryButtonTappedForRowWithIndexPath:");

      if ((v9 & 1) != 0)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "delegate"));
        objc_msgSend(v10, "tableView:accessoryButtonTappedForRowWithIndexPath:", v13, v7);
LABEL_9:

      }
    }
  }

}

- (void)playbackControls:(id)a3 didRequestState:(int64_t)a4
{
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell delegate](self, "delegate", a3));
  objc_msgSend(v6, "voicemailMessageTableViewCell:didRequestPlayState:", self, a4);

}

- (void)playerTimelineSliderScrubbingDidBegin:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell delegate](self, "delegate", a3));
  objc_msgSend(v4, "voicemailMessageTableViewCellDidBeginScrubbing:", self);

}

- (void)playerTimelineSliderScrubbingDidEnd:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell delegate](self, "delegate", a3));
  objc_msgSend(v4, "voicemailMessageTableViewCellDidEndScrubbing:", self);

}

- (void)playerTimelineSliderScrubbingDidCancel:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell delegate](self, "delegate", a3));
  objc_msgSend(v4, "voicemailMessageTableViewCellDidCancelScrubbing:", self);

}

- (void)playerTimelineSlider:(id)a3 didChangeElapsedTime:(double)a4
{
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell delegate](self, "delegate", a3));
  objc_msgSend(v6, "voicemailMessageTableViewCell:didChangeElapsedTime:", self, a4);

}

- (void)messageTranscriptView:(id)a3 didReceiveTapGesture:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell delegate](self, "delegate"));
  objc_msgSend(v6, "voicemailMessageTableViewCell:didReceiveTranscriptTapGesture:", self, v5);

}

- (void)messageTranscriptView:(id)a3 didReportFeedback:(unint64_t)a4
{
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell delegate](self, "delegate", a3));
  objc_msgSend(v6, "voicemailMessageTableViewCell:didReceiveTranscriptFeedback:", self, a4);

}

- (void)messageToolbar:(id)a3 handleActionForButtonType:(unint64_t)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  char v14;
  id v15;

  v15 = (id)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell _tableView](self, "_tableView", a3));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "indexPathForCell:", self));
  v7 = (void *)v6;
  switch(a4)
  {
    case 3uLL:
      if (v6)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell delegate](self, "delegate"));
        v12 = objc_opt_respondsToSelector(v11, "voicemailMessageTableViewCell:moveButtonTappedForRowWithIndexPath:");

        if ((v12 & 1) != 0)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell delegate](self, "delegate"));
          objc_msgSend(v10, "voicemailMessageTableViewCell:moveButtonTappedForRowWithIndexPath:", self, v7);
          goto LABEL_13;
        }
      }
      break;
    case 2uLL:
      if (v6)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell delegate](self, "delegate"));
        v14 = objc_opt_respondsToSelector(v13, "voicemailMessageTableViewCell:dialRequestButtonTappedForRowWithIndexPath:");

        if ((v14 & 1) != 0)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell delegate](self, "delegate"));
          objc_msgSend(v10, "voicemailMessageTableViewCell:dialRequestButtonTappedForRowWithIndexPath:", self, v7);
          goto LABEL_13;
        }
      }
      break;
    case 1uLL:
      if (v6)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell delegate](self, "delegate"));
        v9 = objc_opt_respondsToSelector(v8, "voicemailMessageTableViewCell:audioRouteButtonTappedForRowWithIndexPath:");

        if ((v9 & 1) != 0)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell delegate](self, "delegate"));
          objc_msgSend(v10, "voicemailMessageTableViewCell:audioRouteButtonTappedForRowWithIndexPath:", self, v7);
LABEL_13:

        }
      }
      break;
  }

}

- (BOOL)messageToolbarShouldShowRTTButton:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  unsigned __int8 v9;

  if (!TUCallScreeningRTTEnabled(0, a2, a3))
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell _tableView](self, "_tableView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "indexPathForCell:", self));
  if (v5
    && (v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell delegate](self, "delegate")),
        v7 = objc_opt_respondsToSelector(v6, "voicemailMessageTableViewCell:shouldShowRTTButtonForRowWithIndexPath:"),
        v6,
        (v7 & 1) != 0))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell delegate](self, "delegate"));
    v9 = objc_msgSend(v8, "voicemailMessageTableViewCell:shouldShowRTTButtonForRowWithIndexPath:", self, v5);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)messageToolbarDidSelectRTTButton:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell _tableView](self, "_tableView", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "indexPathForCell:", self));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell delegate](self, "delegate"));
    v6 = objc_opt_respondsToSelector(v5, "voicemailMessageTableViewCell:rttButtonTappedForRowWithIndexPath:");

    if ((v6 & 1) != 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCell delegate](self, "delegate"));
      objc_msgSend(v7, "voicemailMessageTableViewCell:rttButtonTappedForRowWithIndexPath:", self, v4);

    }
  }

}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (BOOL)isRead
{
  return self->_read;
}

- (double)maximumAllowedHeight
{
  return self->_maximumAllowedHeight;
}

- (MPVoicemailMessageViewModel)item
{
  return self->_item;
}

- (VMPlayerControlsView)playerControlsView
{
  return self->_playerControlsView;
}

- (void)setPlayerControlsView:(id)a3
{
  objc_storeStrong((id *)&self->_playerControlsView, a3);
}

- (VMMessageToolbar)toolbar
{
  return self->_toolbar;
}

- (void)setToolbar:(id)a3
{
  objc_storeStrong((id *)&self->_toolbar, a3);
}

- (UIView)voicemailTipView
{
  return self->_voicemailTipView;
}

- (void)setVoicemailTipView:(id)a3
{
  objc_storeStrong((id *)&self->_voicemailTipView, a3);
}

- (PHVoicemailMessageTableViewCellDelegate)delegate
{
  return (PHVoicemailMessageTableViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PHVoicemailMessageTableViewCellScrollView)contentScrollView
{
  return self->_contentScrollView;
}

- (void)setContentScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_contentScrollView, a3);
}

- (VMMessageMetadataView)metadataView
{
  return self->_metadataView;
}

- (void)setMetadataView:(id)a3
{
  objc_storeStrong((id *)&self->_metadataView, a3);
}

- (VMMessageTranscriptView)transcriptView
{
  return self->_transcriptView;
}

- (void)setTranscriptView:(id)a3
{
  objc_storeStrong((id *)&self->_transcriptView, a3);
}

- (VMMessageRestrictedView)restrictedView
{
  return self->_restrictedView;
}

- (void)setRestrictedView:(id)a3
{
  objc_storeStrong((id *)&self->_restrictedView, a3);
}

- (UIImageView)unreadIndicatorImageView
{
  return self->_unreadIndicatorImageView;
}

- (void)setUnreadIndicatorImageView:(id)a3
{
  objc_storeStrong((id *)&self->_unreadIndicatorImageView, a3);
}

- (UITapGestureRecognizer)metadataViewTapGestureRecognizer
{
  return self->_metadataViewTapGestureRecognizer;
}

- (void)setMetadataViewTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_metadataViewTapGestureRecognizer, a3);
}

- (UITapGestureRecognizer)foregroundViewTapGestureRecognizer
{
  return self->_foregroundViewTapGestureRecognizer;
}

- (void)setForegroundViewTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_foregroundViewTapGestureRecognizer, a3);
}

- (NSArray)initialConstraints
{
  return self->_initialConstraints;
}

- (void)setInitialConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_initialConstraints, a3);
}

- (NSArray)expandedConstraints
{
  return self->_expandedConstraints;
}

- (void)setExpandedConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_expandedConstraints, a3);
}

- (NSArray)hideUnreadIndicatorMetadataViewLeadingConstraint
{
  return self->_hideUnreadIndicatorMetadataViewLeadingConstraint;
}

- (void)setHideUnreadIndicatorMetadataViewLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_hideUnreadIndicatorMetadataViewLeadingConstraint, a3);
}

- (NSLayoutConstraint)maximumHeightConstraint
{
  return self->_maximumHeightConstraint;
}

- (void)setMaximumHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_maximumHeightConstraint, a3);
}

- (NSLayoutConstraint)collapsedBottomConstraint
{
  return self->_collapsedBottomConstraint;
}

- (void)setCollapsedBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_collapsedBottomConstraint, a3);
}

- (NSLayoutConstraint)toolbarBottomConstraint
{
  return self->_toolbarBottomConstraint;
}

- (void)setToolbarBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_toolbarBottomConstraint, a3);
}

- (NSLayoutConstraint)transcriptBottomConstraint
{
  return self->_transcriptBottomConstraint;
}

- (void)setTranscriptBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_transcriptBottomConstraint, a3);
}

- (NSLayoutConstraint)restrictedViewBottomConstraint
{
  return self->_restrictedViewBottomConstraint;
}

- (void)setRestrictedViewBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_restrictedViewBottomConstraint, a3);
}

- (NSLayoutConstraint)metadataViewLeadingConstraint
{
  return self->_metadataViewLeadingConstraint;
}

- (void)setMetadataViewLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_metadataViewLeadingConstraint, a3);
}

- (NSLayoutConstraint)metadataViewTopConstraint
{
  return self->_metadataViewTopConstraint;
}

- (void)setMetadataViewTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_metadataViewTopConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_metadataViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_restrictedViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_transcriptBottomConstraint, 0);
  objc_storeStrong((id *)&self->_toolbarBottomConstraint, 0);
  objc_storeStrong((id *)&self->_collapsedBottomConstraint, 0);
  objc_storeStrong((id *)&self->_maximumHeightConstraint, 0);
  objc_storeStrong((id *)&self->_hideUnreadIndicatorMetadataViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_expandedConstraints, 0);
  objc_storeStrong((id *)&self->_initialConstraints, 0);
  objc_storeStrong((id *)&self->_foregroundViewTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_metadataViewTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_unreadIndicatorImageView, 0);
  objc_storeStrong((id *)&self->_restrictedView, 0);
  objc_storeStrong((id *)&self->_transcriptView, 0);
  objc_storeStrong((id *)&self->_metadataView, 0);
  objc_storeStrong((id *)&self->_contentScrollView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_voicemailTipView, 0);
  objc_storeStrong((id *)&self->_toolbar, 0);
  objc_storeStrong((id *)&self->_playerControlsView, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

- (void)tipKitStartObservation
{
  PHVoicemailMessageTableViewCell *v2;

  v2 = self;
  sub_10002FA40();

}

- (void)tipKitStopObservation
{
  PHVoicemailMessageTableViewCell *v2;

  v2 = self;
  sub_100030270();

}

@end

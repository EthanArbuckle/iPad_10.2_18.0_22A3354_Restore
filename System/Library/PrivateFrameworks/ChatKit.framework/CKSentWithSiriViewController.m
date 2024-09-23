@implementation CKSentWithSiriViewController

- (CKSentWithSiriViewController)initWithConversation:(id)a3
{
  id v5;
  CKSentWithSiriViewController *v6;
  CKSentWithSiriViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKSentWithSiriViewController;
  v6 = -[CKSentWithSiriViewController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_conversation, a3);

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  UIScrollView *v5;
  UIScrollView *scrollView;
  UIView *v7;
  UIView *contentView;
  UILabel *v9;
  UILabel *contextDescriptionLabel;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  UIImageView *v17;
  UIImageView *heroImageView;
  void *v19;
  UILabel *v20;
  UILabel *titleLabel;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  UILabel *v26;
  UILabel *subtitleLabel;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  UILabel *v33;
  UILabel *detailLabel;
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
  double v133;
  double v134;
  void *v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  void *v139;
  void *v140;
  objc_super v141;

  v141.receiver = self;
  v141.super_class = (Class)CKSentWithSiriViewController;
  -[CKSentWithSiriViewController viewDidLoad](&v141, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSentWithSiriViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = (UIScrollView *)objc_alloc_init(MEMORY[0x1E0CEA970]);
  scrollView = self->_scrollView;
  self->_scrollView = v5;

  -[UIScrollView setContentInsetAdjustmentBehavior:](self->_scrollView, "setContentInsetAdjustmentBehavior:", 3);
  -[UIScrollView setDelegate:](self->_scrollView, "setDelegate:", self);
  -[UIScrollView setBackgroundColor:](self->_scrollView, "setBackgroundColor:", v3);
  v7 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
  contentView = self->_contentView;
  self->_contentView = v7;

  -[UIView setBackgroundColor:](self->_contentView, "setBackgroundColor:", v3);
  v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
  contextDescriptionLabel = self->_contextDescriptionLabel;
  self->_contextDescriptionLabel = v9;

  CKFrameworkBundle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("SENT_WITH_SIRI_DETAIL_CONTROLLER_CONTEXT_DESCRIPTION"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_contextDescriptionLabel, "setText:", v12);

  v13 = *MEMORY[0x1E0CEB538];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_contextDescriptionLabel, "setFont:", v14);

  objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_contextDescriptionLabel, "setTextColor:", v15);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setBackgroundColor:](self->_contextDescriptionLabel, "setBackgroundColor:", v16);

  -[UILabel setNumberOfLines:](self->_contextDescriptionLabel, "setNumberOfLines:", 0);
  -[UILabel setTextAlignment:](self->_contextDescriptionLabel, "setTextAlignment:", 1);
  objc_msgSend(MEMORY[0x1E0CEA638], "ckImageNamed:", CFSTR("SentWithSiri_SiriLogo"));
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v140);
  heroImageView = self->_heroImageView;
  self->_heroImageView = v17;

  -[UIImageView setOpaque:](self->_heroImageView, "setOpaque:", 0);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setBackgroundColor:](self->_heroImageView, "setBackgroundColor:", v19);

  v20 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v20;

  -[CKSentWithSiriViewController _titleLabelText](self, "_titleLabelText");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_titleLabel, "setText:", v22);

  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0CEB580], 2, 0);
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v139, 0.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_titleLabel, "setFont:", v23);

  objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v24);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setBackgroundColor:](self->_titleLabel, "setBackgroundColor:", v25);

  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 0);
  -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 1);
  v26 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
  subtitleLabel = self->_subtitleLabel;
  self->_subtitleLabel = v26;

  CKFrameworkBundle();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("SENT_WITH_SIRI_DETAIL_CONTROLLER_SUBTITLE"), &stru_1E276D870, CFSTR("ChatKit"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_subtitleLabel, "setText:", v29);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v13);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_subtitleLabel, "setFont:", v30);

  objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_subtitleLabel, "setTextColor:", v31);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setBackgroundColor:](self->_subtitleLabel, "setBackgroundColor:", v32);

  -[UILabel setNumberOfLines:](self->_subtitleLabel, "setNumberOfLines:", 0);
  -[UILabel setTextAlignment:](self->_subtitleLabel, "setTextAlignment:", 1);
  v33 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
  detailLabel = self->_detailLabel;
  self->_detailLabel = v33;

  CKFrameworkBundle();
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("SENT_WITH_SIRI_DETAIL_CONTROLLER_DETAILED_DESCRIPTION"), &stru_1E276D870, CFSTR("ChatKit"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_detailLabel, "setText:", v36);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v13);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_detailLabel, "setFont:", v37);

  objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_detailLabel, "setTextColor:", v38);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setBackgroundColor:](self->_detailLabel, "setBackgroundColor:", v39);

  -[UILabel setNumberOfLines:](self->_detailLabel, "setNumberOfLines:", 0);
  -[UILabel setTextAlignment:](self->_detailLabel, "setTextAlignment:", 1);
  -[CKSentWithSiriViewController view](self, "view");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "addSubview:", self->_scrollView);

  -[UIScrollView addSubview:](self->_scrollView, "addSubview:", self->_contentView);
  -[UIView addSubview:](self->_contentView, "addSubview:", self->_contextDescriptionLabel);
  -[UIView addSubview:](self->_contentView, "addSubview:", self->_heroImageView);
  -[UIView addSubview:](self->_contentView, "addSubview:", self->_titleLabel);
  -[UIView addSubview:](self->_contentView, "addSubview:", self->_subtitleLabel);
  -[UIView addSubview:](self->_contentView, "addSubview:", self->_detailLabel);
  -[UIScrollView setTranslatesAutoresizingMaskIntoConstraints:](self->_scrollView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_contentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_contextDescriptionLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_heroImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_subtitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_detailLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIScrollView leadingAnchor](self->_scrollView, "leadingAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSentWithSiriViewController view](self, "view");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "leadingAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setActive:", 1);

  -[UIScrollView trailingAnchor](self->_scrollView, "trailingAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSentWithSiriViewController view](self, "view");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "trailingAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:", v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setActive:", 1);

  -[UIScrollView topAnchor](self->_scrollView, "topAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSentWithSiriViewController view](self, "view");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "topAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintEqualToAnchor:", v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setActive:", 1);

  -[UIScrollView bottomAnchor](self->_scrollView, "bottomAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSentWithSiriViewController view](self, "view");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "bottomAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "constraintEqualToAnchor:", v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setActive:", 1);

  -[UIView leadingAnchor](self->_contentView, "leadingAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView frameLayoutGuide](self->_scrollView, "frameLayoutGuide");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "leadingAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "constraintEqualToAnchor:", v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setActive:", 1);

  -[UIView trailingAnchor](self->_contentView, "trailingAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView frameLayoutGuide](self->_scrollView, "frameLayoutGuide");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "trailingAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "constraintEqualToAnchor:", v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setActive:", 1);

  -[UIView topAnchor](self->_contentView, "topAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView contentLayoutGuide](self->_scrollView, "contentLayoutGuide");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "topAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "constraintEqualToAnchor:", v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setActive:", 1);

  -[UIView bottomAnchor](self->_contentView, "bottomAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView contentLayoutGuide](self->_scrollView, "contentLayoutGuide");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "bottomAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "constraintEqualToAnchor:", v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setActive:", 1);

  -[UILabel topAnchor](self->_contextDescriptionLabel, "topAnchor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView safeAreaLayoutGuide](self->_contentView, "safeAreaLayoutGuide");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "topAnchor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "constraintEqualToAnchor:constant:", v75, 60.0);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "setActive:", 1);

  -[UIImageView topAnchor](self->_heroImageView, "topAnchor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel bottomAnchor](self->_contextDescriptionLabel, "bottomAnchor");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "constraintEqualToAnchor:constant:", v78, 60.0);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "setActive:", 1);

  -[UIImageView heightAnchor](self->_heroImageView, "heightAnchor");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "constraintEqualToConstant:", 100.0);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "setActive:", 1);

  -[UILabel topAnchor](self->_titleLabel, "topAnchor");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView bottomAnchor](self->_heroImageView, "bottomAnchor");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "constraintEqualToAnchor:constant:", v83, 16.0);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "setActive:", 1);

  -[UILabel topAnchor](self->_subtitleLabel, "topAnchor");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel bottomAnchor](self->_titleLabel, "bottomAnchor");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "constraintEqualToAnchor:constant:", v86, 4.0);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "setActive:", 1);

  -[UILabel topAnchor](self->_detailLabel, "topAnchor");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel bottomAnchor](self->_subtitleLabel, "bottomAnchor");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "constraintEqualToAnchor:constant:", v89, 48.0);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "setActive:", 1);

  -[UIView safeAreaLayoutGuide](self->_contentView, "safeAreaLayoutGuide");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "bottomAnchor");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel bottomAnchor](self->_detailLabel, "bottomAnchor");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "constraintEqualToAnchor:constant:", v93, 16.0);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "setActive:", 1);

  -[UILabel leadingAnchor](self->_contextDescriptionLabel, "leadingAnchor");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView readableContentGuide](self->_contentView, "readableContentGuide");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "leadingAnchor");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "constraintEqualToAnchor:", v97);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "setActive:", 1);

  -[UILabel trailingAnchor](self->_contextDescriptionLabel, "trailingAnchor");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView readableContentGuide](self->_contentView, "readableContentGuide");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "trailingAnchor");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "constraintEqualToAnchor:", v101);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "setActive:", 1);

  -[UIImageView widthAnchor](self->_heroImageView, "widthAnchor");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "constraintEqualToConstant:", 100.0);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "setActive:", 1);

  -[UIImageView centerXAnchor](self->_heroImageView, "centerXAnchor");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView readableContentGuide](self->_contentView, "readableContentGuide");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "centerXAnchor");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "constraintEqualToAnchor:", v107);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "setActive:", 1);

  -[UILabel leadingAnchor](self->_titleLabel, "leadingAnchor");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView readableContentGuide](self->_contentView, "readableContentGuide");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "leadingAnchor");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "constraintEqualToAnchor:", v111);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "setActive:", 1);

  -[UILabel trailingAnchor](self->_titleLabel, "trailingAnchor");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView readableContentGuide](self->_contentView, "readableContentGuide");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "trailingAnchor");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "constraintEqualToAnchor:", v115);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "setActive:", 1);

  -[UILabel leadingAnchor](self->_subtitleLabel, "leadingAnchor");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView readableContentGuide](self->_contentView, "readableContentGuide");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "leadingAnchor");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "constraintEqualToAnchor:", v119);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "setActive:", 1);

  -[UILabel trailingAnchor](self->_subtitleLabel, "trailingAnchor");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView readableContentGuide](self->_contentView, "readableContentGuide");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "trailingAnchor");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "constraintEqualToAnchor:", v123);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "setActive:", 1);

  -[UILabel leadingAnchor](self->_detailLabel, "leadingAnchor");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView readableContentGuide](self->_contentView, "readableContentGuide");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "leadingAnchor");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "constraintEqualToAnchor:", v127);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "setActive:", 1);

  -[UILabel trailingAnchor](self->_detailLabel, "trailingAnchor");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView readableContentGuide](self->_contentView, "readableContentGuide");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v130, "trailingAnchor");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "constraintEqualToAnchor:", v131);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "setActive:", 1);

  LODWORD(v133) = 1148846080;
  -[UIScrollView setContentCompressionResistancePriority:forAxis:](self->_scrollView, "setContentCompressionResistancePriority:forAxis:", 0, v133);
  LODWORD(v134) = 1144750080;
  -[UIScrollView setContentCompressionResistancePriority:forAxis:](self->_scrollView, "setContentCompressionResistancePriority:forAxis:", 1, v134);
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  v136 = objc_msgSend(v135, "integerForKey:", CFSTR("SentWithSiriLearningUIShownNumberOfTimes"));

  v137 = v136 + 1;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v138, "setInteger:forKey:", v137, CFSTR("SentWithSiriLearningUIShownNumberOfTimes"));

}

- (id)_titleLabelText
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CBDA90], "siriLanguageCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v24 = &v23;
  v25 = 0x2050000000;
  v4 = (void *)getVTPreferencesClass_softClass;
  v26 = getVTPreferencesClass_softClass;
  if (!getVTPreferencesClass_softClass)
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __getVTPreferencesClass_block_invoke;
    v22[3] = &unk_1E274A178;
    v22[4] = &v23;
    __getVTPreferencesClass_block_invoke((uint64_t)v22);
    v4 = (void *)v24[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v23, 8);
  objc_msgSend(v5, "sharedPreferences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "voiceTriggerEnabled");
  objc_msgSend(v6, "localizedTriggerPhraseForLanguageCode:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CKConversation hasDisplayName](self->_conversation, "hasDisplayName"))
  {
    -[CKConversation displayName](self->_conversation, "displayName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "ck_isSiriRecognizableWithLanguageCode:", v3))
    {
      if (v7)
        -[CKSentWithSiriViewController localizedStringWithLanguageCode:format:](self, "localizedStringWithLanguageCode:format:", v3, CFSTR("SENT_WITH_SIRI_DETAIL_CONTROLLER_FORMAT_FOR_VOICE_TRIGGER_WITH_GROUP_NAME"), v8, v9);
      else
        -[CKSentWithSiriViewController localizedStringWithLanguageCode:format:](self, "localizedStringWithLanguageCode:format:", v3, CFSTR("SENT_WITH_SIRI_DETAIL_CONTROLLER_FORMAT_FOR_MANUAL_ACTIVATION_WITH_GROUP_NAME"), v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }
  if (!objc_msgSend(v10, "length"))
  {
    -[CKConversation recipients](self->_conversation, "recipients");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count") == 1;

    if (v12)
    {
      -[CKConversation recipient](self->_conversation, "recipient");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = *MEMORY[0x1E0C966D0];
      objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v27[1] = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "cnContactWithKeys:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        objc_msgSend(v16, "givenName");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v17, "length")
          && objc_msgSend(v17, "ck_isSiriRecognizableWithLanguageCode:", v3))
        {
          if (v7)
            -[CKSentWithSiriViewController localizedStringWithLanguageCode:format:](self, "localizedStringWithLanguageCode:format:", v3, CFSTR("SENT_WITH_SIRI_DETAIL_CONTROLLER_FORMAT_FOR_VOICE_TRIGGER_WITH_RECIPIENT_GIVEN_NAME"), v8, v17);
          else
            -[CKSentWithSiriViewController localizedStringWithLanguageCode:format:](self, "localizedStringWithLanguageCode:format:", v3, CFSTR("SENT_WITH_SIRI_DETAIL_CONTROLLER_FORMAT_FOR_MANUAL_ACTIVATION_WITH_RECIPIENT_GIVEN_NAME"), v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v18 = v10;
        }
        if (objc_msgSend(v18, "length"))
        {
          v10 = v18;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v16, 0);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v19, "length")
            && objc_msgSend(v19, "ck_isSiriRecognizableWithLanguageCode:", v3))
          {
            if (v7)
              -[CKSentWithSiriViewController localizedStringWithLanguageCode:format:](self, "localizedStringWithLanguageCode:format:", v3, CFSTR("SENT_WITH_SIRI_DETAIL_CONTROLLER_FORMAT_FOR_VOICE_TRIGGER_WITH_RECIPIENT_FULL_NAME"), v8, v19);
            else
              -[CKSentWithSiriViewController localizedStringWithLanguageCode:format:](self, "localizedStringWithLanguageCode:format:", v3, CFSTR("SENT_WITH_SIRI_DETAIL_CONTROLLER_FORMAT_FOR_MANUAL_ACTIVATION_WITH_RECIPIENT_FULL_NAME"), v19);
            v10 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v10 = v18;
          }

        }
      }

    }
  }
  if (objc_msgSend(v10, "length"))
  {
    v20 = v10;
  }
  else
  {
    if (v7)
      -[CKSentWithSiriViewController localizedStringWithLanguageCode:format:](self, "localizedStringWithLanguageCode:format:", v3, CFSTR("SENT_WITH_SIRI_DETAIL_CONTROLLER_TITLE_FOR_VOICE_TRIGGER"), v8);
    else
      -[CKSentWithSiriViewController localizedStringWithLanguageCode:format:](self, "localizedStringWithLanguageCode:format:", v3, CFSTR("SENT_WITH_SIRI_DETAIL_CONTROLLER_TITLE_FOR_MANUAL_ACTIVATION"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v20;
}

- (id)localizedStringWithLanguageCode:(id)a3 format:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;

  v5 = (objc_class *)MEMORY[0x1E0CBD878];
  v6 = a4;
  v7 = a3;
  v8 = [v5 alloc];
  CKFrameworkBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithDeferredFormat:fromTable:bundle:arguments:", v6, CFSTR("ChatKit"), v9, &v13);

  objc_msgSend(v10, "localizeForLanguage:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKSentWithSiriViewController;
  -[CKSentWithSiriViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  -[CKSentWithSiriViewController becomeFirstResponder](self, "becomeFirstResponder");
  -[CKSentWithSiriViewController scrollView](self, "scrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "flashScrollIndicators");

}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (id)inputAccessoryViewController
{
  return 0;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  id v11;

  v4 = a3;
  objc_msgSend(v4, "safeAreaInsets");
  v6 = v5;
  v7 = -v5;
  objc_msgSend(v4, "contentOffset");
  v9 = v8;

  -[CKSentWithSiriViewController navigationController](self, "navigationController");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "navigationBar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_setShadowAlpha:", (v6 + fmax(fmin(v9, 40.0 - v6), v7)) / 40.0);

}

- (CKConversation)conversation
{
  return self->_conversation;
}

- (void)setConversation:(id)a3
{
  objc_storeStrong((id *)&self->_conversation, a3);
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollView, a3);
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (UILabel)contextDescriptionLabel
{
  return self->_contextDescriptionLabel;
}

- (void)setContextDescriptionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_contextDescriptionLabel, a3);
}

- (UIImageView)heroImageView
{
  return self->_heroImageView;
}

- (void)setHeroImageView:(id)a3
{
  objc_storeStrong((id *)&self->_heroImageView, a3);
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

- (UILabel)detailLabel
{
  return self->_detailLabel;
}

- (void)setDetailLabel:(id)a3
{
  objc_storeStrong((id *)&self->_detailLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_heroImageView, 0);
  objc_storeStrong((id *)&self->_contextDescriptionLabel, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_conversation, 0);
}

@end

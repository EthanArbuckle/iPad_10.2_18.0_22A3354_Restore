@implementation EKUIListViewTimedEventCell

+ (void)initialize
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v2 = objc_opt_new();
  v3 = (void *)s_iconCache_0;
  s_iconCache_0 = v2;

  objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", CFSTR("location.pin.point.of.interest"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)s_iconCache_0, "setObject:forKeyedSubscript:", v4, CFSTR("location.pin.point.of.interest"));

  WalkmanImage_Occurrences();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)s_iconCache_0, "setObject:forKeyedSubscript:", v5, &unk_1E606F588);

  TransitImage_Occurrences();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)s_iconCache_0, "setObject:forKeyedSubscript:", v6, &unk_1E606F5A0);

  BicycleImage_Occurrences();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)s_iconCache_0, "setObject:forKeyedSubscript:", v7, &unk_1E606F5B8);

  CarImage_Occurrences();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)s_iconCache_0, "setObject:forKeyedSubscript:", v8, &unk_1E606F5D0);

}

- (id)initForCarplayWithReuseIdentifier:(id)a3
{
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EKUIListViewTimedEventCell;
  v3 = -[EKUIListViewCell initForCarplayWithReuseIdentifier:](&v6, sel_initForCarplayWithReuseIdentifier_, a3);
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "_commonInit");
  return v4;
}

- (id)initForDragPreview
{
  id v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EKUIListViewTimedEventCell;
  v2 = -[EKUIListViewCell initForDragPreview](&v5, sel_initForDragPreview);
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "_commonInit");
  return v3;
}

- (EKUIListViewTimedEventCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  EKUIListViewTimedEventCell *v4;
  EKUIListViewTimedEventCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EKUIListViewTimedEventCell;
  v4 = -[EKUIListViewCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
    -[EKUIListViewTimedEventCell _commonInit](v4, "_commonInit");
  return v5;
}

- (void)_commonInit
{
  void *v3;
  EKUIListViewCellBackground *v4;
  EKUIListViewCellBackground *backgroundView;
  void *v6;
  UIView *v7;
  UIView *colorBarView;
  void *v9;
  void *v10;
  UIImageView *v11;
  UIImageView *travelImage;
  double v13;
  uint64_t v14;
  void *v15;
  UILabel *v16;
  UILabel *travelTextLabel;
  double v18;
  UILabel *v19;
  UILabel *travelDepartureTimeLabel;
  id v21;
  UILabel *v22;
  void *v23;
  UILabel *v24;
  void *v25;
  UIStackView *v26;
  UIStackView *travelLine;
  UILabel *v28;
  UILabel *titleField;
  double v30;
  UILabel *v31;
  UILabel *topTimeField;
  id v33;
  void *v34;
  UILabel *v35;
  void *v36;
  UIStackView *v37;
  UIStackView *titleLine;
  UIImageView *v39;
  UIImageView *locationImage;
  double v41;
  void *v42;
  UILabel *v43;
  UILabel *locationField;
  double v45;
  UILabel *v46;
  void *v47;
  UILabel *v48;
  UILabel *bottomTimeField;
  id v50;
  UILabel *v51;
  void *v52;
  UILabel *v53;
  void *v54;
  UIStackView *v55;
  UIStackView *locationLine;
  id v57;
  UIStackView *v58;
  void *v59;
  UIStackView *v60;
  UIStackView *textContentView;
  void *v62;
  void *v63;
  uint64_t v64;
  double v65;
  void *v66;
  uint64_t v67;
  double v68;
  void *v69;
  uint64_t v70;
  double v71;
  void *v72;
  uint64_t v73;
  double v74;
  void *v75;
  uint64_t v76;
  _BOOL4 v77;
  double v78;
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
  _QWORD v120[12];
  _QWORD v121[3];
  _QWORD v122[4];
  _QWORD v123[3];
  _QWORD v124[6];

  v124[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__adjustNumberOfLines, *MEMORY[0x1E0DC48E8], 0);

  v4 = -[EKUIListViewCellBackground initWithCornerRadius:]([EKUIListViewCellBackground alloc], "initWithCornerRadius:", 8.0);
  backgroundView = self->_backgroundView;
  self->_backgroundView = v4;

  -[EKUIListViewCellBackground setTranslatesAutoresizingMaskIntoConstraints:](self->_backgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[EKUIListViewTimedEventCell contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", self->_backgroundView);

  v7 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  colorBarView = self->_colorBarView;
  self->_colorBarView = v7;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_colorBarView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView layer](self->_colorBarView, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCornerRadius:", 1.75);

  -[EKUIListViewTimedEventCell contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", self->_colorBarView);

  v11 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
  travelImage = self->_travelImage;
  self->_travelImage = v11;

  LODWORD(v13) = 1148846080;
  -[UIImageView setContentCompressionResistancePriority:forAxis:](self->_travelImage, "setContentCompressionResistancePriority:forAxis:", 0, v13);
  v14 = *MEMORY[0x1E0DC4B10];
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:scale:", *MEMORY[0x1E0DC4B10], 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setPreferredSymbolConfiguration:](self->_travelImage, "setPreferredSymbolConfiguration:", v15);

  v16 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  travelTextLabel = self->_travelTextLabel;
  self->_travelTextLabel = v16;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_travelTextLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v18) = 1132134400;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_travelTextLabel, "setContentCompressionResistancePriority:forAxis:", 0, v18);
  v19 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  travelDepartureTimeLabel = self->_travelDepartureTimeLabel;
  self->_travelDepartureTimeLabel = v19;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_travelDepartureTimeLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v21 = objc_alloc(MEMORY[0x1E0DC3CA8]);
  v22 = self->_travelTextLabel;
  v124[0] = self->_travelImage;
  v124[1] = v22;
  -[EKUIListViewTimedEventCell _createSpacer](self, "_createSpacer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = self->_travelDepartureTimeLabel;
  v124[2] = v23;
  v124[3] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v124, 4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (UIStackView *)objc_msgSend(v21, "initWithArrangedSubviews:", v25);
  travelLine = self->_travelLine;
  self->_travelLine = v26;

  -[UIStackView setAlignment:](self->_travelLine, "setAlignment:", 2);
  -[EKUIListViewCell carplayMode](self, "carplayMode");
  -[UIStackView setSpacing:](self->_travelLine, "setSpacing:", 2.0);
  v28 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  titleField = self->_titleField;
  self->_titleField = v28;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleField, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v30) = 1132134400;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_titleField, "setContentCompressionResistancePriority:forAxis:", 0, v30);
  v31 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  topTimeField = self->_topTimeField;
  self->_topTimeField = v31;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_topTimeField, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v33 = objc_alloc(MEMORY[0x1E0DC3CA8]);
  v123[0] = self->_titleField;
  -[EKUIListViewTimedEventCell _createSpacer](self, "_createSpacer");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = self->_topTimeField;
  v123[1] = v34;
  v123[2] = v35;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v123, 3);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (UIStackView *)objc_msgSend(v33, "initWithArrangedSubviews:", v36);
  titleLine = self->_titleLine;
  self->_titleLine = v37;

  -[UIStackView setAlignment:](self->_titleLine, "setAlignment:", 2);
  -[EKUIListViewCell carplayMode](self, "carplayMode");
  -[UIStackView setSpacing:](self->_titleLine, "setSpacing:", 2.0);
  v39 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
  locationImage = self->_locationImage;
  self->_locationImage = v39;

  LODWORD(v41) = 1148846080;
  -[UIImageView setContentCompressionResistancePriority:forAxis:](self->_locationImage, "setContentCompressionResistancePriority:forAxis:", 0, v41);
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:scale:", v14, 1);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setPreferredSymbolConfiguration:](self->_locationImage, "setPreferredSymbolConfiguration:", v42);

  v43 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  locationField = self->_locationField;
  self->_locationField = v43;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_locationField, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v45) = 1132134400;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_locationField, "setContentCompressionResistancePriority:forAxis:", 0, v45);
  v46 = self->_locationField;
  -[EKUIListViewTimedEventCell _subtextFont](self, "_subtextFont");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v46, "setFont:", v47);

  v48 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  bottomTimeField = self->_bottomTimeField;
  self->_bottomTimeField = v48;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_bottomTimeField, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v50 = objc_alloc(MEMORY[0x1E0DC3CA8]);
  v51 = self->_locationField;
  v122[0] = self->_locationImage;
  v122[1] = v51;
  -[EKUIListViewTimedEventCell _createSpacer](self, "_createSpacer");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = self->_bottomTimeField;
  v122[2] = v52;
  v122[3] = v53;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v122, 4);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = (UIStackView *)objc_msgSend(v50, "initWithArrangedSubviews:", v54);
  locationLine = self->_locationLine;
  self->_locationLine = v55;

  -[UIStackView setAlignment:](self->_locationLine, "setAlignment:", 2);
  -[EKUIListViewCell carplayMode](self, "carplayMode");
  -[UIStackView setSpacing:](self->_locationLine, "setSpacing:", 2.0);
  v57 = objc_alloc(MEMORY[0x1E0DC3CA8]);
  v58 = self->_titleLine;
  v121[0] = self->_travelLine;
  v121[1] = v58;
  v121[2] = self->_locationLine;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v121, 3);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = (UIStackView *)objc_msgSend(v57, "initWithArrangedSubviews:", v59);
  textContentView = self->_textContentView;
  self->_textContentView = v60;

  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_textContentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView setAxis:](self->_textContentView, "setAxis:", 1);
  -[UIStackView setSpacing:](self->_textContentView, "setSpacing:", 1.0);
  -[UIStackView setAlignment:](self->_textContentView, "setAlignment:", 1);
  -[EKUIListViewTimedEventCell contentView](self, "contentView");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "addSubview:", self->_textContentView);

  v107 = (void *)MEMORY[0x1E0CB3718];
  -[EKUIListViewCellBackground leadingAnchor](self->_backgroundView, "leadingAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v118 = v63;
  -[EKUIListViewTimedEventCell contentView](self, "contentView");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "leadingAnchor");
  v64 = objc_claimAutoreleasedReturnValue();
  v117 = (void *)v64;
  if (-[EKUIListViewCell carplayMode](self, "carplayMode"))
    v65 = 0.0;
  else
    v65 = 12.0;
  objc_msgSend(v63, "constraintEqualToAnchor:constant:", v64, v65);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v120[0] = v116;
  -[EKUIListViewCellBackground trailingAnchor](self->_backgroundView, "trailingAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v114 = v66;
  -[EKUIListViewTimedEventCell contentView](self, "contentView");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "trailingAnchor");
  v67 = objc_claimAutoreleasedReturnValue();
  v113 = (void *)v67;
  if (-[EKUIListViewCell carplayMode](self, "carplayMode"))
    v68 = 0.0;
  else
    v68 = 12.0;
  objc_msgSend(v66, "constraintEqualToAnchor:constant:", v67, -v68);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v120[1] = v112;
  -[EKUIListViewCellBackground topAnchor](self->_backgroundView, "topAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v110 = v69;
  -[EKUIListViewTimedEventCell contentView](self, "contentView");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "topAnchor");
  v70 = objc_claimAutoreleasedReturnValue();
  v109 = (void *)v70;
  if (-[EKUIListViewCell carplayMode](self, "carplayMode"))
    v71 = 0.0;
  else
    v71 = 4.0;
  objc_msgSend(v69, "constraintEqualToAnchor:constant:", v70, v71);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v120[2] = v108;
  -[EKUIListViewCellBackground bottomAnchor](self->_backgroundView, "bottomAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = v72;
  -[EKUIListViewTimedEventCell contentView](self, "contentView");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "bottomAnchor");
  v73 = objc_claimAutoreleasedReturnValue();
  v104 = (void *)v73;
  if (-[EKUIListViewCell carplayMode](self, "carplayMode"))
    v74 = 0.0;
  else
    v74 = 4.0;
  objc_msgSend(v72, "constraintEqualToAnchor:constant:", v73, -v74);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v120[3] = v103;
  -[UIView leadingAnchor](self->_colorBarView, "leadingAnchor");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIListViewCellBackground leadingAnchor](self->_backgroundView, "leadingAnchor");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "constraintEqualToAnchor:constant:", v101, 8.0);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v120[4] = v100;
  -[UIView widthAnchor](self->_colorBarView, "widthAnchor");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "constraintEqualToConstant:", 3.5);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v120[5] = v98;
  -[UIView topAnchor](self->_colorBarView, "topAnchor");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIListViewCellBackground topAnchor](self->_backgroundView, "topAnchor");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "constraintEqualToAnchor:constant:", v96, 8.0);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v120[6] = v95;
  -[UIView bottomAnchor](self->_colorBarView, "bottomAnchor");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIListViewCellBackground bottomAnchor](self->_backgroundView, "bottomAnchor");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "constraintEqualToAnchor:constant:", v93, -8.0);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v120[7] = v92;
  -[UIStackView leadingAnchor](self->_textContentView, "leadingAnchor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = v75;
  -[UIView trailingAnchor](self->_colorBarView, "trailingAnchor");
  v76 = objc_claimAutoreleasedReturnValue();
  v90 = (void *)v76;
  v77 = -[EKUIListViewCell carplayMode](self, "carplayMode");
  v78 = 6.0;
  if (v77)
    v78 = 5.0;
  objc_msgSend(v75, "constraintEqualToAnchor:constant:", v76, v78);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v120[8] = v89;
  -[UIStackView trailingAnchor](self->_textContentView, "trailingAnchor");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIListViewCellBackground trailingAnchor](self->_backgroundView, "trailingAnchor");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "constraintEqualToAnchor:constant:", v80, -8.0);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v120[9] = v81;
  -[UIStackView topAnchor](self->_textContentView, "topAnchor");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIListViewCellBackground topAnchor](self->_backgroundView, "topAnchor");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "constraintEqualToAnchor:constant:", v83, 8.0);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v120[10] = v84;
  -[UIStackView bottomAnchor](self->_textContentView, "bottomAnchor");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIListViewCellBackground bottomAnchor](self->_backgroundView, "bottomAnchor");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "constraintEqualToAnchor:constant:", v86, -8.0);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v120[11] = v87;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v120, 12);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "activateConstraints:", v88);

}

- (void)_hideOrShowLocationIcon
{
  void *v3;
  void *v4;
  id v5;

  -[EKUIListViewTimedEventCell contentView](self, "contentView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (EKUIUsesLargeTextLayout(v3))
  {
    -[UIImageView setHidden:](self->_locationImage, "setHidden:", 1);
  }
  else
  {
    -[UILabel attributedText](self->_locationField, "attributedText");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setHidden:](self->_locationImage, "setHidden:", objc_msgSend(v4, "length") == 0);

  }
}

- (void)_adjustNumberOfLines
{
  void *v3;
  void *v4;
  _BOOL8 v5;

  -[EKUIListViewTimedEventCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = EKUIUsesLargeTextLayout(v4);

  -[UIImageView setHidden:](self->_travelImage, "setHidden:", v5);
  -[EKUIListViewTimedEventCell _hideOrShowLocationIcon](self, "_hideOrShowLocationIcon");
  -[UILabel setNumberOfLines:](self->_travelTextLabel, "setNumberOfLines:", v5 ^ 1);
  -[UILabel setNumberOfLines:](self->_travelDepartureTimeLabel, "setNumberOfLines:", v5 ^ 1);
  -[UILabel setNumberOfLines:](self->_titleField, "setNumberOfLines:", v5 ^ 1);
  -[UILabel setNumberOfLines:](self->_topTimeField, "setNumberOfLines:", v5 ^ 1);
  -[UILabel setNumberOfLines:](self->_locationField, "setNumberOfLines:", v5 ^ 1);
  -[UILabel setNumberOfLines:](self->_bottomTimeField, "setNumberOfLines:", v5 ^ 1);
}

- (id)_createSpacer
{
  id v2;
  void *v3;
  void *v4;
  double v5;

  v2 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  objc_msgSend(v2, "setAccessibilityIdentifier:", CFSTR("Spacer"));
  objc_msgSend(v2, "widthAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraintEqualToConstant:", 1.79769313e308);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v5) = 1132068864;
  objc_msgSend(v4, "setPriority:", v5);
  objc_msgSend(v4, "setActive:", 1);

  return v2;
}

- (void)_updateLocationViewsWithStrikethrough:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = a3;
  v5 = (void *)MEMORY[0x1E0D0CD88];
  -[EKUIListViewTimedEventCell event](self, "event");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v5, "locationStringForEvent:options:incomplete:leadingImageName:", v6, 288, 0, &v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (__CFString *)v13;

  if (v8)
    v9 = v8;
  else
    v9 = CFSTR("location.pin.point.of.interest");
  -[EKUIListViewTimedEventCell _attributedStringFromAttributedString:strikethrough:](self, "_attributedStringFromAttributedString:strikethrough:", v7, v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setAttributedText:](self->_locationField, "setAttributedText:", v10);

  -[EKUIListViewTimedEventCell _hideOrShowLocationIcon](self, "_hideOrShowLocationIcon");
  if ((-[UIImageView isHidden](self->_locationImage, "isHidden") & 1) == 0)
  {
    objc_msgSend((id)s_iconCache_0, "objectForKeyedSubscript:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)s_iconCache_0, "setObject:forKeyedSubscript:", v11, v9);
    }
    -[UIImageView image](self->_locationImage, "image");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12 != v11)
      -[UIImageView setImage:](self->_locationImage, "setImage:", v11);

  }
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EKUIListViewTimedEventCell;
  -[EKUIListViewTimedEventCell setHighlighted:animated:](&v5, sel_setHighlighted_animated_, a3, a4);
  -[EKUIListViewTimedEventCell _updateAppEntityAnnotationIfNeeded](self, "_updateAppEntityAnnotationIfNeeded");
  if (-[EKUIListViewCell carplayMode](self, "carplayMode"))
    -[EKUIListViewTimedEventCell _updateColors](self, "_updateColors");
}

- (void)updateWithEvent:(id)a3 isMultiday:(BOOL)a4 occurrenceStartDate:(id)a5 dimmed:(BOOL)a6
{
  _BOOL4 v8;
  id v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
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
  int v33;
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
  uint64_t v46;
  void *v47;
  void *v48;
  double v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
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
  id v70;
  id v71;

  v8 = a4;
  v71 = a3;
  v10 = a5;
  -[EKUIListViewTimedEventCell setEvent:](self, "setEvent:", v71);
  -[EKUIListViewTimedEventCell _updateAppEntityAnnotationIfNeeded](self, "_updateAppEntityAnnotationIfNeeded");
  if (!v71)
    goto LABEL_26;
  self->_dimmed = a6;
  if (-[EKUIListViewCell carplayMode](self, "carplayMode"))
    -[EKUIListViewTimedEventCell setSelectionStyle:](self, "setSelectionStyle:", 0);
  v11 = objc_msgSend(v71, "status");
  v12 = CUIKEventDisplaysAsDeclined();
  if (v11 == 3)
    v13 = 1;
  else
    v13 = v12;
  if (-[EKUIListViewCell dragPreview](self, "dragPreview"))
    v14 = 48;
  else
    v14 = 16;
  CUIKCalendar();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v71, "startDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isDate:inSameDayAsDate:", v16, v10);

    objc_msgSend(v71, "endDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v15, "isDate:inSameDayAsDate:", v18, v10);

    if (v17)
    {
      v20 = (void *)MEMORY[0x1E0D0CE30];
      objc_msgSend(v71, "startDate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKUIListViewTimedEventCell _subtextMonospacedFont](self, "_subtextMonospacedFont");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "timeAttributedTextWithDate:calendar:font:options:", v21, v15, v22, v14);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      -[EKUIListViewTimedEventCell _attributedStringFromAttributedString:strikethrough:](self, "_attributedStringFromAttributedString:strikethrough:", v23, v13);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setAttributedText:](self->_topTimeField, "setAttributedText:", v24);
    }
    else
    {
      EventKitUIBundle();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v34;
      if (v19)
      {
        objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("Ends label"), CFSTR("Ends"), 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        -[EKUIListViewTimedEventCell _subtextFont](self, "_subtextFont");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKUIListViewTimedEventCell _attributedStringFromString:strikethrough:font:](self, "_attributedStringFromString:strikethrough:font:", v23, v13, v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setAttributedText:](self->_topTimeField, "setAttributedText:", v37);

        v38 = (void *)MEMORY[0x1E0D0CE30];
        objc_msgSend(v71, "endDate");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKUIListViewTimedEventCell _subtextMonospacedFont](self, "_subtextMonospacedFont");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "timeAttributedTextWithDate:calendar:font:options:", v39, v15, v40, v14);
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        -[EKUIListViewTimedEventCell _attributedStringFromAttributedString:strikethrough:](self, "_attributedStringFromAttributedString:strikethrough:", v41, v13);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setAttributedText:](self->_bottomTimeField, "setAttributedText:", v42);

        goto LABEL_21;
      }
      objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("all-day label"), CFSTR("all-day"), 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      -[EKUIListViewTimedEventCell _subtextFont](self, "_subtextFont");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKUIListViewTimedEventCell _attributedStringFromString:strikethrough:font:](self, "_attributedStringFromString:strikethrough:font:", v23, v13, v24);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setAttributedText:](self->_topTimeField, "setAttributedText:", v48);

    }
    -[UILabel setText:](self->_bottomTimeField, "setText:", CFSTR(" "));
  }
  else
  {
    v70 = v10;
    v25 = (void *)MEMORY[0x1E0D0CE30];
    objc_msgSend(v71, "startDate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIListViewTimedEventCell _subtextMonospacedFont](self, "_subtextMonospacedFont");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "timeAttributedTextWithDate:calendar:font:options:", v26, v15, v27, v14);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    -[EKUIListViewTimedEventCell _attributedStringFromAttributedString:strikethrough:](self, "_attributedStringFromAttributedString:strikethrough:", v23, v13);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setAttributedText:](self->_topTimeField, "setAttributedText:", v28);

    -[EKUIListViewTimedEventCell event](self, "event");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "startDate");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIListViewTimedEventCell event](self, "event");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "endDate");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v30, "isEqualToDate:", v32);

    if (v33)
    {
      -[UILabel setText:](self->_bottomTimeField, "setText:", CFSTR(" "));
    }
    else
    {
      v43 = (void *)MEMORY[0x1E0D0CE30];
      objc_msgSend(v71, "endDate");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKUIListViewTimedEventCell _subtextMonospacedFont](self, "_subtextMonospacedFont");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "timeAttributedTextWithDate:calendar:font:options:", v44, v15, v45, v14);
      v46 = objc_claimAutoreleasedReturnValue();

      -[EKUIListViewTimedEventCell _attributedStringFromAttributedString:strikethrough:](self, "_attributedStringFromAttributedString:strikethrough:", v46, v13);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setAttributedText:](self->_bottomTimeField, "setAttributedText:", v47);

      v23 = (void *)v46;
    }
    v10 = v70;
  }
LABEL_21:

  objc_msgSend(v71, "travelTime");
  if (v49 == 0.0
    || -[EKUIListViewCell carplayMode](self, "carplayMode")
    || -[EKUIListViewCell dragPreview](self, "dragPreview"))
  {
    -[UIStackView setHidden:](self->_travelLine, "setHidden:", 1);
  }
  else
  {
    -[UIStackView setHidden:](self->_travelLine, "setHidden:", 0);
    v53 = objc_msgSend(v71, "travelRoutingMode");
    if ((unint64_t)(v53 + 1) < 2)
      v54 = 1;
    else
      v54 = v53;
    -[UIImageView image](self->_travelImage, "image");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = (void *)s_iconCache_0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v54);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "objectForKeyedSubscript:", v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    if (v55 != v58)
    {
      v59 = (void *)s_iconCache_0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v54);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "objectForKeyedSubscript:", v60);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setImage:](self->_travelImage, "setImage:", v61);

    }
    v62 = (void *)MEMORY[0x1E0D0CE30];
    objc_msgSend(v71, "startDateIncludingTravel");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIListViewTimedEventCell _subtextMonospacedFont](self, "_subtextMonospacedFont");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "timeAttributedTextWithDate:calendar:font:options:", v63, v15, v64, 16);
    v65 = (void *)objc_claimAutoreleasedReturnValue();

    -[EKUIListViewTimedEventCell _attributedStringFromAttributedString:strikethrough:](self, "_attributedStringFromAttributedString:strikethrough:", v65, v13);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setAttributedText:](self->_travelDepartureTimeLabel, "setAttributedText:", v66);

    objc_msgSend(v71, "travelTime");
    CUIKDisplayStringTravelTimeAndDuration();
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIListViewTimedEventCell _subtextFont](self, "_subtextFont");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIListViewTimedEventCell _attributedStringFromString:strikethrough:font:](self, "_attributedStringFromString:strikethrough:font:", v67, v13, v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setAttributedText:](self->_travelTextLabel, "setAttributedText:", v69);

  }
  CUIKDisplayedTitleForEvent();
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIListViewTimedEventCell _titleFont](self, "_titleFont");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIListViewTimedEventCell _attributedStringFromString:strikethrough:font:](self, "_attributedStringFromString:strikethrough:font:", v50, v13, v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setAttributedText:](self->_titleField, "setAttributedText:", v52);

  -[EKUIListViewTimedEventCell _updateLocationViewsWithStrikethrough:](self, "_updateLocationViewsWithStrikethrough:", v13);
  -[EKUIListViewTimedEventCell _updateColors](self, "_updateColors");

LABEL_26:
}

- (id)_attributedStringFromString:(id)a3 strikethrough:(BOOL)a4 font:(id)a5
{
  _BOOL4 v5;
  id v7;
  objc_class *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v5 = a4;
  v7 = a5;
  v8 = (objc_class *)MEMORY[0x1E0CB3778];
  v9 = a3;
  v10 = (void *)objc_msgSend([v8 alloc], "initWithString:", v9);

  v11 = objc_msgSend(v10, "length");
  if (v5)
    objc_msgSend(v10, "addAttribute:value:range:", *MEMORY[0x1E0DC11A8], &unk_1E606F5D0, 0, v11);
  if (v7)
    objc_msgSend(v10, "addAttribute:value:range:", *MEMORY[0x1E0DC1138], v7, 0, v11);
  v12 = (void *)objc_msgSend(v10, "copy");

  return v12;
}

- (id)_attributedStringFromAttributedString:(id)a3 strikethrough:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v11;
  _QWORD v12[2];

  v4 = a4;
  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v4)
  {
    v7 = (void *)objc_msgSend(v5, "mutableCopy");
    v11 = *MEMORY[0x1E0DC11A8];
    v12[0] = &unk_1E606F5D0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addAttributes:range:", v8, 0, objc_msgSend(v6, "length"));

    v9 = (id)objc_msgSend(v7, "copy");
  }
  else
  {
    v9 = v5;
  }

  return v9;
}

- (id)_titleFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:addingSymbolicTraits:", *MEMORY[0x1E0DC4A88], 2);
}

- (id)_subtextFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
}

- (id)_subtextMonospacedFont
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = *MEMORY[0x1E0DC4B10];
  v3 = *MEMORY[0x1E0DC48C0];
  -[EKUIListViewTimedEventCell traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKUIConstrainedFontUtilities constrainedFontForTextStyle:maximumContentSizeCategory:traitCollection:](EKUIConstrainedFontUtilities, "constrainedFontForTextStyle:maximumContentSizeCategory:traitCollection:", v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(v5, "pointSize");
  objc_msgSend(v6, "monospacedDigitSystemFontOfSize:weight:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_updateColors
{
  void *v3;
  _QWORD v4[5];

  -[EKUIListViewTimedEventCell traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __43__EKUIListViewTimedEventCell__updateColors__block_invoke;
  v4[3] = &unk_1E6018688;
  v4[4] = self;
  objc_msgSend(v3, "performAsCurrentTraitCollection:", v4);

}

void __43__EKUIListViewTimedEventCell__updateColors__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  if (objc_msgSend(*(id *)(a1 + 32), "carplayMode")
    && objc_msgSend(*(id *)(a1 + 32), "isHighlighted"))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "_carSystemFocusLabelColor");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "event");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "calendar");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "displayColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "userInterfaceStyle");
    CUIKAdjustedColorForColor();
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  v6 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v6 + 1208))
  {
    objc_msgSend(v12, "cuik_colorWithAlphaScaled:", *MEMORY[0x1E0D0CA68]);
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = *(_QWORD *)(a1 + 32);
    v8 = (id)v7;
  }
  else
  {
    v8 = v12;
  }
  v13 = v8;
  objc_msgSend(*(id *)(v6 + 1192), "setBackgroundColor:", v8);
  objc_msgSend(*(id *)(a1 + 32), "_updateTextAndIconColors");
  v9 = *(_QWORD **)(a1 + 32);
  v10 = (void *)v9[150];
  objc_msgSend(v9, "event");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updateBackgroundColorForEvent:highlighted:dimmed:carplayMode:dragPreview:", v11, objc_msgSend(*(id *)(a1 + 32), "isHighlighted"), *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 1208), objc_msgSend(*(id *)(a1 + 32), "carplayMode"), objc_msgSend(*(id *)(a1 + 32), "dragPreview"));

}

- (void)_updateTextAndIconColors
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;

  if (-[EKUIListViewCell carplayMode](self, "carplayMode")
    && -[EKUIListViewTimedEventCell isHighlighted](self, "isHighlighted"))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "_carSystemFocusLabelColor");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "_carSystemFocusPrimaryColor");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[EKUIListViewTimedEventCell event](self, "event");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "status");

    -[EKUIListViewTimedEventCell event](self, "event");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = CUIKEventDisplaysAsDeclined();

    if (v5 == 3 || v7)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
      v22 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
      v3 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (-[EKUIListViewCell dragPreview](self, "dragPreview"))
      {
        -[EKUIListViewTimedEventCell event](self, "event");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "calendar");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "displayColor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKUIListViewTimedEventCell traitCollection](self, "traitCollection");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "userInterfaceStyle");
        CUIKTextColorForCalendarColorForStyle();
        v22 = (id)objc_claimAutoreleasedReturnValue();

        -[EKUIListViewTimedEventCell event](self, "event");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "calendar");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "displayColor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKUIListViewTimedEventCell traitCollection](self, "traitCollection");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "userInterfaceStyle");
        CUIKSecondaryTextColorForCalendarColorForStyle();
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_11;
      }
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v22 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v3 = objc_claimAutoreleasedReturnValue();
    }
  }
  v16 = (void *)v3;
LABEL_11:
  if (self->_dimmed)
  {
    v17 = *MEMORY[0x1E0D0CA68];
    objc_msgSend(v22, "cuik_colorWithAlphaScaled:", *MEMORY[0x1E0D0CA68]);
    v18 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "cuik_colorWithAlphaScaled:", v17);
    v19 = objc_claimAutoreleasedReturnValue();

    v16 = (void *)v19;
    v22 = (id)v18;
  }
  -[EKUIListViewTimedEventCell traitCollection](self, "traitCollection");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "userInterfaceStyle");
  CUIKOccurrenceLeadingIconAlphaScale();
  objc_msgSend(v16, "cuik_colorWithAlphaScaled:");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIImageView setTintColor:](self->_travelImage, "setTintColor:", v21);
  -[UILabel setTextColor:](self->_travelTextLabel, "setTextColor:", v16);
  -[UILabel setTextColor:](self->_titleField, "setTextColor:", v22);
  -[UILabel setTextColor:](self->_locationField, "setTextColor:", v16);
  -[UIImageView setTintColor:](self->_locationImage, "setTintColor:", v21);
  -[UILabel setTextColor:](self->_travelDepartureTimeLabel, "setTextColor:", v16);
  -[UILabel setTextColor:](self->_topTimeField, "setTextColor:", v22);
  -[UILabel setTextColor:](self->_bottomTimeField, "setTextColor:", v16);

}

- (void)_updateAppEntityAnnotationIfNeeded
{
  void *v3;
  char v4;
  void *v5;

  if (CalendarLinkLibraryCore())
  {
    -[EKUIListViewTimedEventCell event](self, "event");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isNew");

    if ((v4 & 1) == 0)
    {
      -[EKUIListViewTimedEventCell event](self, "event");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKUIListViewTimedEventCell Cal_annotateWithEvent:](self, "Cal_annotateWithEvent:", v5);

      -[EKUIListViewTimedEventCell Cal_updateEntityAnnotationStateIsSelected:isHighlighted:isFocused:isDisabled:isEditing:isPrimary:](self, "Cal_updateEntityAnnotationStateIsSelected:isHighlighted:isFocused:isDisabled:isEditing:isPrimary:", -[EKUIListViewTimedEventCell isSelected](self, "isSelected"), -[EKUIListViewTimedEventCell isHighlighted](self, "isHighlighted"), 0, 0, 0, 0);
    }
  }
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EKUIListViewTimedEventCell;
  -[EKUIListViewTimedEventCell setSelected:animated:](&v5, sel_setSelected_animated_, a3, a4);
  -[EKUIListViewTimedEventCell _updateAppEntityAnnotationIfNeeded](self, "_updateAppEntityAnnotationIfNeeded");
}

+ (id)pathForBackgroundForRect:(CGRect)a3 allDay:(BOOL)a4
{
  CGRect v5;

  v5 = CGRectInset(a3, 12.0, 4.0);
  return (id)objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:cornerRadius:", v5.origin.x, v5.origin.y, v5.size.width, v5.size.height, 8.0);
}

+ (UIEdgeInsets)adjustedSeparatorInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = 12.0;
  v4 = 0.0;
  v5 = 12.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (EKEvent)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
  objc_storeStrong((id *)&self->_event, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_colorBarView, 0);
  objc_storeStrong((id *)&self->_textContentView, 0);
  objc_storeStrong((id *)&self->_bottomTimeField, 0);
  objc_storeStrong((id *)&self->_locationField, 0);
  objc_storeStrong((id *)&self->_locationImage, 0);
  objc_storeStrong((id *)&self->_locationLine, 0);
  objc_storeStrong((id *)&self->_topTimeField, 0);
  objc_storeStrong((id *)&self->_titleField, 0);
  objc_storeStrong((id *)&self->_titleLine, 0);
  objc_storeStrong((id *)&self->_travelDepartureTimeLabel, 0);
  objc_storeStrong((id *)&self->_travelTextLabel, 0);
  objc_storeStrong((id *)&self->_travelImage, 0);
  objc_storeStrong((id *)&self->_travelLine, 0);
}

@end
